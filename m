Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D86440BF6
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Oct 2021 23:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhJ3VuY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 17:50:24 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:23009 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232083AbhJ3VuQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 17:50:16 -0400
Received: (wp-smtpd smtp.tlen.pl 25445 invoked from network); 30 Oct 2021 23:47:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1635630460; bh=fWSvZPsYQGIvl5BRWlQe1qsp5xZpPSssvqFJkDb/Ulk=;
          h=From:To:Cc:Subject;
          b=yb70noYQ6B9YEcIOR+/7clNN4gOwHEKCcPmsZoOAV4x74Wr9Xf/DGPbhGSEwbG1ny
           9sbIwPxjGznI3dNmrkHMWoZp6oRz34D9Pb9k65kMS0dOnUXzmPB8DodZhRuGRxqtMc
           ltuBp0V1rY1LYDUtrZVnpccrF4pxyRJq4tKC29CI=
Received: from ablz112.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.7.219.112])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 30 Oct 2021 23:47:39 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 6/7] rtc-cmos: avoid UIP when reading alarm time
Date:   Sat, 30 Oct 2021 23:46:34 +0200
Message-Id: <20211030214636.49602-7-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030214636.49602-1-mat.jonczyk@o2.pl>
References: <20211030214636.49602-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: eb4b1e9d3c497fc325cb9edab26be518
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [MZPk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some Intel chipsets disconnect the time and date RTC registers when the
clock update is in progress: during this time reads may return bogus
values and writes fail silently. This includes the RTC alarm registers.
[1]

cmos_read_alarm() did not take account for that, which caused alarm time
reads to sometimes return bogus values. This can be shown with a test
patch that I am attaching to this patch series.

[1] 7th Generation Intel ® Processor Family I/O for U/Y Platforms [...]
Datasheet, Volume 1 of 2 (Intel's Document Number: 334658-006)
Page 208
https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-and-8th-gen-core-family-mobile-u-y-processor-lines-i-o-datasheet-vol-1.pdf
        "If a RAM read from the ten time and date bytes is attempted
        during an update cycle, the value read do not necessarily
        represent the true contents of those locations. Any RAM writes
        under the same conditions are ignored."

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

---
 drivers/rtc/rtc-cmos.c | 72 ++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 9404f58ee01d..2def331e88b6 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -242,10 +242,46 @@ static int cmos_set_time(struct device *dev, struct rtc_time *t)
 	return mc146818_set_time(t);
 }
 
+struct cmos_read_alarm_callback_param {
+	struct cmos_rtc *cmos;
+	struct rtc_time *time;
+	unsigned char	rtc_control;
+};
+
+static void cmos_read_alarm_callback(unsigned char __always_unused seconds,
+		void *param_in)
+{
+	struct cmos_read_alarm_callback_param *p =
+		(struct cmos_read_alarm_callback_param *) param_in;
+	struct rtc_time *time = p->time;
+
+	time->tm_sec = CMOS_READ(RTC_SECONDS_ALARM);
+	time->tm_min = CMOS_READ(RTC_MINUTES_ALARM);
+	time->tm_hour = CMOS_READ(RTC_HOURS_ALARM);
+
+	if (p->cmos->day_alrm) {
+		/* ignore upper bits on readback per ACPI spec */
+		time->tm_mday = CMOS_READ(p->cmos->day_alrm) & 0x3f;
+		if (!time->tm_mday)
+			time->tm_mday = -1;
+
+		if (p->cmos->mon_alrm) {
+			time->tm_mon = CMOS_READ(p->cmos->mon_alrm);
+			if (!time->tm_mon)
+				time->tm_mon = -1;
+		}
+	}
+
+	p->rtc_control = CMOS_READ(RTC_CONTROL);
+}
+
 static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct cmos_rtc	*cmos = dev_get_drvdata(dev);
-	unsigned char	rtc_control;
+	struct cmos_read_alarm_callback_param p = {
+		.cmos = cmos,
+		.time = &(t->time)
+	};
 
 	/* This not only a rtc_op, but also called directly */
 	if (!is_valid_irq(cmos->irq))
@@ -256,28 +292,18 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	 * the future.
 	 */
 
-	spin_lock_irq(&rtc_lock);
-	t->time.tm_sec = CMOS_READ(RTC_SECONDS_ALARM);
-	t->time.tm_min = CMOS_READ(RTC_MINUTES_ALARM);
-	t->time.tm_hour = CMOS_READ(RTC_HOURS_ALARM);
-
-	if (cmos->day_alrm) {
-		/* ignore upper bits on readback per ACPI spec */
-		t->time.tm_mday = CMOS_READ(cmos->day_alrm) & 0x3f;
-		if (!t->time.tm_mday)
-			t->time.tm_mday = -1;
-
-		if (cmos->mon_alrm) {
-			t->time.tm_mon = CMOS_READ(cmos->mon_alrm);
-			if (!t->time.tm_mon)
-				t->time.tm_mon = -1;
-		}
-	}
-
-	rtc_control = CMOS_READ(RTC_CONTROL);
-	spin_unlock_irq(&rtc_lock);
+	/* Some Intel chipsets disconnect the alarm registers when the clock
+	 * update is in progress - during this time reads return bogus values
+	 * and writes may fail silently. See for example "7th Generation Intel®
+	 * Processor Family I/O for U/Y Platforms [...] Datasheet", section
+	 * 27.7.1
+	 *
+	 * Use the mc146818_do_avoiding_UIP() function to avoid this.
+	 */
+	if (!mc146818_do_avoiding_UIP(cmos_read_alarm_callback, &p))
+		return -EIO;
 
-	if (!(rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
+	if (!(p.rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
 		if (((unsigned)t->time.tm_sec) < 0x60)
 			t->time.tm_sec = bcd2bin(t->time.tm_sec);
 		else
@@ -306,7 +332,7 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 		}
 	}
 
-	t->enabled = !!(rtc_control & RTC_AIE);
+	t->enabled = !!(p.rtc_control & RTC_AIE);
 	t->pending = 0;
 
 	return 0;
-- 
2.25.1

