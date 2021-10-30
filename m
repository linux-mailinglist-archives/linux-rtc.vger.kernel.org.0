Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73441440BF3
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Oct 2021 23:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhJ3VuR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 17:50:17 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:13171 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232048AbhJ3VuK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 17:50:10 -0400
Received: (wp-smtpd smtp.tlen.pl 23934 invoked from network); 30 Oct 2021 23:47:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1635630455; bh=jyzrZun6Bm9YFesenswa3bIWF/XjgnTi47Cpu50tTcM=;
          h=From:To:Cc:Subject;
          b=dbCsdGrMVirI1NSvaqirEf/NCEfEkcCp2nYLTGLUa86shw/pKZ/6FXOUOx7MhqU+F
           RII/nRsqR+igmAqZ7u8pnSeO8EHFb529k3b4Ri4qMUvuFAOMMnd4mm1OuK9MAnGlbR
           aey0v5RAQBZwM8llJ2SIIVGden6E7G01TUKvJEm4=
Received: from ablz112.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.7.219.112])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 30 Oct 2021 23:47:35 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 4/7] rtc-mc146818-lib: refactor mc146818_get_time
Date:   Sat, 30 Oct 2021 23:46:32 +0200
Message-Id: <20211030214636.49602-5-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030214636.49602-1-mat.jonczyk@o2.pl>
References: <20211030214636.49602-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: c17a6b9982c746e3e4b43cbf663b575f
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [geOk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Refactor mc146818_get_time() to make use of mc146818_do_avoiding_UIP().

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

---

 drivers/rtc/rtc-mc146818-lib.c | 111 +++++++++++++--------------------
 1 file changed, 43 insertions(+), 68 deletions(-)

I'm sorry that the diff is quite difficult to read, but I was unable to
fix this easily.

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 946ad43a512c..f3178244db37 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -102,50 +102,20 @@ bool mc146818_does_rtc_work(void)
 }
 EXPORT_SYMBOL_GPL(mc146818_does_rtc_work);
 
-unsigned int mc146818_get_time(struct rtc_time *time)
-{
+struct mc146818_get_time_callback_param {
+	struct rtc_time *time;
 	unsigned char ctrl;
-	unsigned long flags;
-	unsigned int iter_count = 0;
-	unsigned char century = 0;
-	bool retry;
-
+#ifdef CONFIG_ACPI
+	unsigned char century;
+#endif
 #ifdef CONFIG_MACH_DECSTATION
 	unsigned int real_year;
 #endif
+};
 
-again:
-	if (iter_count > 10) {
-		pr_err_ratelimited("Unable to read current time from RTC\n");
-		memset(time, 0xff, sizeof(*time));
-		return 0;
-	}
-	iter_count++;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-
-	/*
-	 * Check whether there is an update in progress during which the
-	 * readout is unspecified. The maximum update time is ~2ms. Poll
-	 * every msec for completion.
-	 *
-	 * Store the second value before checking UIP so a long lasting NMI
-	 * which happens to hit after the UIP check cannot make an update
-	 * cycle invisible.
-	 */
-	time->tm_sec = CMOS_READ(RTC_SECONDS);
-
-	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
-		spin_unlock_irqrestore(&rtc_lock, flags);
-		mdelay(1);
-		goto again;
-	}
-
-	/* Revalidate the above readout */
-	if (time->tm_sec != CMOS_READ(RTC_SECONDS)) {
-		spin_unlock_irqrestore(&rtc_lock, flags);
-		goto again;
-	}
+static void mc146818_get_time_callback(unsigned char seconds, void *param_in)
+{
+	struct mc146818_get_time_callback_param *p = param_in;
 
 	/*
 	 * Only the values that we read from the RTC are set. We leave
@@ -153,39 +123,40 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 	 * RTC has RTC_DAY_OF_WEEK, we ignore it, as it is only updated
 	 * by the RTC when initially set to a non-zero value.
 	 */
-	time->tm_min = CMOS_READ(RTC_MINUTES);
-	time->tm_hour = CMOS_READ(RTC_HOURS);
-	time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
-	time->tm_mon = CMOS_READ(RTC_MONTH);
-	time->tm_year = CMOS_READ(RTC_YEAR);
+	p->time->tm_sec = seconds;
+	p->time->tm_min = CMOS_READ(RTC_MINUTES);
+	p->time->tm_hour = CMOS_READ(RTC_HOURS);
+	p->time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
+	p->time->tm_mon = CMOS_READ(RTC_MONTH);
+	p->time->tm_year = CMOS_READ(RTC_YEAR);
 #ifdef CONFIG_MACH_DECSTATION
-	real_year = CMOS_READ(RTC_DEC_YEAR);
+	p->real_year = CMOS_READ(RTC_DEC_YEAR);
 #endif
 #ifdef CONFIG_ACPI
 	if (acpi_gbl_FADT.header.revision >= FADT2_REVISION_ID &&
-	    acpi_gbl_FADT.century)
-		century = CMOS_READ(acpi_gbl_FADT.century);
+	    acpi_gbl_FADT.century) {
+		p->century = CMOS_READ(acpi_gbl_FADT.century);
+	} else {
+		p->century = 0;
+	}
 #endif
-	ctrl = CMOS_READ(RTC_CONTROL);
-	/*
-	 * Check for the UIP bit again. If it is set now then
-	 * the above values may contain garbage.
-	 */
-	retry = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
-	/*
-	 * A NMI might have interrupted the above sequence so check whether
-	 * the seconds value has changed which indicates that the NMI took
-	 * longer than the UIP bit was set. Unlikely, but possible and
-	 * there is also virt...
-	 */
-	retry |= time->tm_sec != CMOS_READ(RTC_SECONDS);
 
-	spin_unlock_irqrestore(&rtc_lock, flags);
+	p->ctrl = CMOS_READ(RTC_CONTROL);
+}
 
-	if (retry)
-		goto again;
+unsigned int mc146818_get_time(struct rtc_time *time)
+{
+	struct mc146818_get_time_callback_param p = {
+		.time = time
+	};
 
-	if (!(ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
+	if (!mc146818_do_avoiding_UIP(mc146818_get_time_callback, &p)) {
+		pr_err_ratelimited("Unable to read current time from RTC\n");
+		memset(time, 0xff, sizeof(*time));
+		return 0;
+	}
+
+	if (!(p.ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
 	{
 		time->tm_sec = bcd2bin(time->tm_sec);
 		time->tm_min = bcd2bin(time->tm_min);
@@ -193,15 +164,19 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 		time->tm_mday = bcd2bin(time->tm_mday);
 		time->tm_mon = bcd2bin(time->tm_mon);
 		time->tm_year = bcd2bin(time->tm_year);
-		century = bcd2bin(century);
+#ifdef CONFIG_ACPI
+		p.century = bcd2bin(p.century);
+#endif
 	}
 
 #ifdef CONFIG_MACH_DECSTATION
-	time->tm_year += real_year - 72;
+	time->tm_year += p.real_year - 72;
 #endif
 
-	if (century > 20)
-		time->tm_year += (century - 19) * 100;
+#ifdef CONFIG_ACPI
+	if (p.century > 20)
+		time->tm_year += (p.century - 19) * 100;
+#endif
 
 	/*
 	 * Account for differences between how the RTC uses the values
-- 
2.25.1

