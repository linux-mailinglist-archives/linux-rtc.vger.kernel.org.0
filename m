Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AED4577E6
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 21:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbhKSUrB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 15:47:01 -0500
Received: from mx-out.tlen.pl ([193.222.135.142]:35872 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235691AbhKSUq4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:46:56 -0500
Received: (wp-smtpd smtp.tlen.pl 13482 invoked from network); 19 Nov 2021 21:43:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637354603; bh=IiNlBYkDnR36ib1JK88p2ItCAvyOlEF11DbUtE/R2wY=;
          h=From:To:Cc:Subject;
          b=SFhshkkXveWDHm1uNXovDQ82D/del2c5b551ZmeDDgvGMuLg8xZPUrmZzQqIJjPDl
           Z/Y5C3TwqrCs/f2H5t72nY+KrmKVSP5Vw5+HBrjzyxZr+xUknG3SQRFWM70RINwAjC
           gGsyH8uONZolCsE8btwbOIWi8siu2go1KOLVVo5Q=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 19 Nov 2021 21:43:23 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RESEND v3 7/7] rtc-cmos: avoid UIP when writing alarm time
Date:   Fri, 19 Nov 2021 21:42:21 +0100
Message-Id: <20211119204221.66918-8-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119204221.66918-1-mat.jonczyk@o2.pl>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 9ca56256bbbd52ba37b55d883a6d9f50
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [4UM0]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some Intel chipsets disconnect the time and date RTC registers when the
clock update is in progress: during this time reads may return bogus
values and writes fail silently. This includes the RTC alarm registers.
[1]

cmos_set_alarm() did not take account for that, fix it.

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
 drivers/rtc/rtc-cmos.c | 108 +++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 2def331e88b6..b6d7dd3cf066 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -463,10 +463,58 @@ static int cmos_validate_alarm(struct device *dev, struct rtc_wkalrm *t)
 	return 0;
 }
 
+struct cmos_set_alarm_callback_param {
+	struct cmos_rtc *cmos;
+	unsigned char mon, mday, hrs, min, sec;
+	struct rtc_wkalrm *t;
+};
+
+/* Note: this function may be executed by mc146818_do_avoiding_UIP() more then
+ *	 once
+ */
+static void cmos_set_alarm_callback(unsigned char __always_unused seconds,
+		void *param_in)
+{
+	struct cmos_set_alarm_callback_param *p =
+		(struct cmos_set_alarm_callback_param *) param_in;
+
+	/* next rtc irq must not be from previous alarm setting */
+	cmos_irq_disable(p->cmos, RTC_AIE);
+
+	/* update alarm */
+	CMOS_WRITE(p->hrs, RTC_HOURS_ALARM);
+	CMOS_WRITE(p->min, RTC_MINUTES_ALARM);
+	CMOS_WRITE(p->sec, RTC_SECONDS_ALARM);
+
+	/* the system may support an "enhanced" alarm */
+	if (p->cmos->day_alrm) {
+		CMOS_WRITE(p->mday, p->cmos->day_alrm);
+		if (p->cmos->mon_alrm)
+			CMOS_WRITE(p->mon, p->cmos->mon_alrm);
+	}
+
+	if (use_hpet_alarm()) {
+		/*
+		 * FIXME the HPET alarm glue currently ignores day_alrm
+		 * and mon_alrm ...
+		 */
+		hpet_set_alarm_time(p->t->time.tm_hour, p->t->time.tm_min,
+				    p->t->time.tm_sec);
+	}
+
+	if (p->t->enabled)
+		cmos_irq_enable(p->cmos, RTC_AIE);
+
+}
+
 static int cmos_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct cmos_rtc	*cmos = dev_get_drvdata(dev);
-	unsigned char mon, mday, hrs, min, sec, rtc_control;
+	struct cmos_set_alarm_callback_param p = {
+		.cmos = cmos,
+		.t = t
+	};
+	unsigned char rtc_control;
 	int ret;
 
 	/* This not only a rtc_op, but also called directly */
@@ -477,11 +525,11 @@ static int cmos_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	if (ret < 0)
 		return ret;
 
-	mon = t->time.tm_mon + 1;
-	mday = t->time.tm_mday;
-	hrs = t->time.tm_hour;
-	min = t->time.tm_min;
-	sec = t->time.tm_sec;
+	p.mon = t->time.tm_mon + 1;
+	p.mday = t->time.tm_mday;
+	p.hrs = t->time.tm_hour;
+	p.min = t->time.tm_min;
+	p.sec = t->time.tm_sec;
 
 	spin_lock_irq(&rtc_lock);
 	rtc_control = CMOS_READ(RTC_CONTROL);
@@ -489,43 +537,21 @@ static int cmos_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	if (!(rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
 		/* Writing 0xff means "don't care" or "match all".  */
-		mon = (mon <= 12) ? bin2bcd(mon) : 0xff;
-		mday = (mday >= 1 && mday <= 31) ? bin2bcd(mday) : 0xff;
-		hrs = (hrs < 24) ? bin2bcd(hrs) : 0xff;
-		min = (min < 60) ? bin2bcd(min) : 0xff;
-		sec = (sec < 60) ? bin2bcd(sec) : 0xff;
+		p.mon = (p.mon <= 12) ? bin2bcd(p.mon) : 0xff;
+		p.mday = (p.mday >= 1 && p.mday <= 31) ? bin2bcd(p.mday) : 0xff;
+		p.hrs = (p.hrs < 24) ? bin2bcd(p.hrs) : 0xff;
+		p.min = (p.min < 60) ? bin2bcd(p.min) : 0xff;
+		p.sec = (p.sec < 60) ? bin2bcd(p.sec) : 0xff;
 	}
 
-	spin_lock_irq(&rtc_lock);
-
-	/* next rtc irq must not be from previous alarm setting */
-	cmos_irq_disable(cmos, RTC_AIE);
-
-	/* update alarm */
-	CMOS_WRITE(hrs, RTC_HOURS_ALARM);
-	CMOS_WRITE(min, RTC_MINUTES_ALARM);
-	CMOS_WRITE(sec, RTC_SECONDS_ALARM);
-
-	/* the system may support an "enhanced" alarm */
-	if (cmos->day_alrm) {
-		CMOS_WRITE(mday, cmos->day_alrm);
-		if (cmos->mon_alrm)
-			CMOS_WRITE(mon, cmos->mon_alrm);
-	}
-
-	if (use_hpet_alarm()) {
-		/*
-		 * FIXME the HPET alarm glue currently ignores day_alrm
-		 * and mon_alrm ...
-		 */
-		hpet_set_alarm_time(t->time.tm_hour, t->time.tm_min,
-				    t->time.tm_sec);
-	}
-
-	if (t->enabled)
-		cmos_irq_enable(cmos, RTC_AIE);
-
-	spin_unlock_irq(&rtc_lock);
+	/*
+	 * Some Intel chipsets disconnect the alarm registers when the clock
+	 * update is in progress - during this time writes fail silently.
+	 *
+	 * Use mc146818_do_avoiding_UIP() to avoid this.
+	 */
+	if (!mc146818_do_avoiding_UIP(cmos_set_alarm_callback, &p))
+		return -EIO;
 
 	cmos->alarm_expires = rtc_tm_to_time64(&t->time);
 
-- 
2.25.1

