Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D99F407D53
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Sep 2021 14:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbhILMob (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Sep 2021 08:44:31 -0400
Received: from mx-out.tlen.pl ([193.222.135.148]:46644 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235262AbhILMo3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 12 Sep 2021 08:44:29 -0400
Received: (wp-smtpd smtp.tlen.pl 9149 invoked from network); 12 Sep 2021 14:43:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1631450592; bh=7IdaZZIuiekG92mGZkWkTZhUEs0esuhAH7fpWv5Xq/0=;
          h=From:To:Cc:Subject;
          b=us/VXs6EY9xS8I4zkWtPNckJ5Hl3j5eSv3sMfgKlSt7XYl0SLnffMTc0VYoyAkEvS
           bMho4I9dawtbg1T5KS6rml20C36UeZAaeiFpT5dxuq3yzfVwxD+VLgNzyQGejvVuaz
           ry1xUJheSZvXmd2ld5AAyNsyHiV7k/VCn19TtDM8=
Received: from aafh223.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.137.223])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 12 Sep 2021 14:43:12 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/7] rtc-cmos: dont touch alarm registers during update
Date:   Sun, 12 Sep 2021 14:42:09 +0200
Message-Id: <20210912124214.81853-3-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124214.81853-1-mat.jonczyk@o2.pl>
References: <20210912124214.81853-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: b94cd8216409147ba8bac3b1c3fed031
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [wfOE]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some Intel chipsets disconnect the time and date RTC registers when the
clock update is in progress: during this time reads may return bogus
values and writes fail silently. This includes the RTC alarm registers.
[1]

cmos_read_alarm() and cmos_set_alarm() did not take account for that,
which caused alarm time reads to sometimes return bogus values. This can
be shown with a test patch that I am attaching to this patch series.
Setting the alarm clock also probably did fail sometimes.

To make this patch suitable for inclusion in stable kernels, I'm using a
simple method for avoiding the RTC update cycle. This method is used in
mach_set_rtc_mmss() in arch/x86/kernel/rtc.c. A more elaborate algorithm
- as in mc146818_get_time() in drivers/rtc/rtc-mc146818-lib.c - would be
too complcated for stable. [2]

cmos_wait_for_uip_clear() has the rtc_lock taken while waiting for the
UIP bit to become clear. This should be harmless as during the UIP the RTC
cannot be read from anyway. mach_get_cmos_time() in arch/x86/kernel/rtc.c
does things the same way.

[1] 7th Generation Intel ® Processor Family I/O for U/Y Platforms [...]
Datasheet, Volume 1 of 2 (Intel's Document Number: 334658-006)
Page 208
https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-and-8th-gen-core-family-mobile-u-y-processor-lines-i-o-datasheet-vol-1.pdf
        "If a RAM read from the ten time and date bytes is attempted
        during an update cycle, the value read do not necessarily
        represent the true contents of those locations. Any RAM writes
        under the same conditions are ignored.'

[2] I'm going to submit a unification patch for a later kernel release -
prefer to see this in stable.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: stable@vger.kernel.org
---
 drivers/rtc/rtc-cmos.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 2cd0fe728ab2..643433d984ab 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -248,6 +248,31 @@ static int cmos_set_time(struct device *dev, struct rtc_time *t)
 	return mc146818_set_time(t);
 }
 
+/* Some Intel chipsets disconnect the alarm registers when the clock update is
+ * in progress - during this time reads return bogus values and writes may fail
+ * silently. See for example "7th Generation Intel® Processor Family I/O for
+ * U/Y Platforms [...] Datasheet", section 27.7.1
+ *
+ * Check the UIP bit to prevent this, waiting for max 10ms for it to become
+ * clear.
+ *
+ * This function has to be called with rtc_lock taken.
+ */
+static int cmos_wait_for_uip_clear(struct device *dev)
+{
+	int i;
+
+	for (i = 0; i < 100; i++) {
+		if ((CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) == 0)
+			return 0;
+		udelay(100);
+	}
+
+	dev_warn_ratelimited(dev, "UIP bit is stuck, cannot access RTC registers\n");
+
+	return 1;
+}
+
 static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct cmos_rtc	*cmos = dev_get_drvdata(dev);
@@ -257,12 +282,17 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	if (!is_valid_irq(cmos->irq))
 		return -EIO;
 
+	spin_lock_irq(&rtc_lock);
+
+	if (cmos_wait_for_uip_clear(dev)) {
+		spin_unlock_irq(&rtc_lock);
+		return -EIO;
+	}
+
 	/* Basic alarms only support hour, minute, and seconds fields.
 	 * Some also support day and month, for alarms up to a year in
 	 * the future.
 	 */
-
-	spin_lock_irq(&rtc_lock);
 	t->time.tm_sec = CMOS_READ(RTC_SECONDS_ALARM);
 	t->time.tm_min = CMOS_READ(RTC_MINUTES_ALARM);
 	t->time.tm_hour = CMOS_READ(RTC_HOURS_ALARM);
@@ -477,6 +507,10 @@ static int cmos_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	}
 
 	spin_lock_irq(&rtc_lock);
+	if (cmos_wait_for_uip_clear(dev)) {
+		spin_unlock_irq(&rtc_lock);
+		return -EIO;
+	}
 
 	/* next rtc irq must not be from previous alarm setting */
 	cmos_irq_disable(cmos, RTC_AIE);
-- 
2.25.1

