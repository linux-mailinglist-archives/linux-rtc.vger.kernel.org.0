Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CED6407D5C
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Sep 2021 14:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbhILMqX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Sep 2021 08:46:23 -0400
Received: from mx-out.tlen.pl ([193.222.135.145]:24849 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235050AbhILMqW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 12 Sep 2021 08:46:22 -0400
Received: (wp-smtpd smtp.tlen.pl 9608 invoked from network); 12 Sep 2021 14:45:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1631450706; bh=8r8xgy65ZR76BqRT88sVTuFNy8P/G7PRukyy/pHFjGc=;
          h=From:To:Cc:Subject;
          b=K6i/AfpI2JblyZsm9V+GvTJWV31TtCKQesBWKUwQ33aOM+7CEg51KQ6+5H2eyy3Vt
           WymFO1u8F97nKmS9OlZANRD7gr86txHItNwMoiOg7SKT2QxT20YQ8uFur7LhS1XxQ9
           FGNONQDPmh7Nm0s+h8kVSPBheBnfVZwFCFRhe5A8=
Received: from aafh223.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.137.223])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 12 Sep 2021 14:45:06 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [TEST PATCH] rtc-cmos: cmos_read_alarm bug demonstration
Date:   Sun, 12 Sep 2021 14:44:53 +0200
Message-Id: <20210912124453.81925-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124214.81853-3-mat.jonczyk@o2.pl>
References: <20210912124214.81853-3-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 98eab5c8cd5e189c9ff73a4c4b83faaf
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [0ZNE]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Before my commit "rtc-cmos: dont touch alarm registers during update",
applying this patch and reading the CMOS time like so:

        while true; do cat /sys/class/rtc/rtc0/time ; sleep 0.5; done

produces errors in dmesg.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>

---
 drivers/rtc/rtc-cmos.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index f353a41dfe8c..c24465f7bed4 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -43,6 +43,9 @@
 #include <linux/dmi.h>
 #endif
 
+#include <linux/ktime.h>
+#include <linux/timekeeping.h>
+
 /* this is for "generic access to PC-style RTC" using CMOS_READ/CMOS_WRITE */
 #include <linux/mc146818rtc.h>
 
@@ -220,6 +223,8 @@ static inline void cmos_write_bank2(unsigned char val, unsigned char addr)
 
 /*----------------------------------------------------------------*/
 
+static void cmos_read_alarm_uip_debugging(struct device *dev);
+
 static int cmos_read_time(struct device *dev, struct rtc_time *t)
 {
 	/*
@@ -234,6 +239,8 @@ static int cmos_read_time(struct device *dev, struct rtc_time *t)
 	 * That'll make Y3K compatility (year > 2070) easy!
 	 */
 	mc146818_get_time(t);
+
+	cmos_read_alarm_uip_debugging(dev);
 	return 0;
 }
 
@@ -348,6 +355,60 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	return 0;
 }
 
+static void cmos_read_alarm_uip_debugging(struct device *dev)
+{
+	unsigned long	flags;
+	unsigned char	rtc_uip_baseline, rtc_uip;
+	struct rtc_wkalrm t_baseline, t;
+	ktime_t time_start, time_end;
+	int i;
+
+	spin_lock_irqsave(&rtc_lock, flags);
+	rtc_uip_baseline = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
+	spin_unlock_irqrestore(&rtc_lock, flags);
+
+	cmos_read_alarm(dev, &t_baseline);
+
+	time_start = ktime_get();
+
+	for (i = 0; i < 2000; i++) {
+		spin_lock_irqsave(&rtc_lock, flags);
+		rtc_uip = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
+		spin_unlock_irqrestore(&rtc_lock, flags);
+
+		cmos_read_alarm(dev, &t);
+
+		if (t_baseline.time.tm_sec != t.time.tm_sec) {
+			dev_err(dev,
+				"Inconsistent alarm tm_sec value: %d != %d (RTC_UIP = %d; %d)\n",
+				t_baseline.time.tm_sec,
+				t.time.tm_sec,
+				rtc_uip_baseline, rtc_uip);
+		}
+		if (t_baseline.time.tm_min != t.time.tm_min) {
+			dev_err(dev,
+				"Inconsistent alarm tm_min value: %d != %d (RTC_UIP = %d; %d)\n",
+				t_baseline.time.tm_min,
+				t.time.tm_min,
+				rtc_uip_baseline, rtc_uip);
+		}
+		if (t_baseline.time.tm_hour != t.time.tm_hour) {
+			dev_err(dev,
+				"Inconsistent alarm tm_hour value: %d != %d (RTC_UIP = %d; %d)\n",
+				t_baseline.time.tm_hour,
+				t.time.tm_hour,
+				rtc_uip_baseline, rtc_uip);
+		}
+
+	}
+
+	time_end = ktime_get();
+
+	pr_info_ratelimited("%s: loop executed in %lld ns\n",
+			__func__, ktime_to_ns(ktime_sub(time_end, time_start)));
+}
+
+
 static void cmos_checkintr(struct cmos_rtc *cmos, unsigned char rtc_control)
 {
 	unsigned char	rtc_intr;
-- 
2.25.1

