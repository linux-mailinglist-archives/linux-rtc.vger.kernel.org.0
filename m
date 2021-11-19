Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51744577EF
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 21:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhKSUtZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 15:49:25 -0500
Received: from mx-out.tlen.pl ([193.222.135.145]:58391 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231740AbhKSUtZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:49:25 -0500
Received: (wp-smtpd smtp.tlen.pl 7752 invoked from network); 19 Nov 2021 21:46:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637354781; bh=6EV3+Db16M1TTmcxm0Ltf+cHXWaK6K5VL+dcc/n0F48=;
          h=From:To:Cc:Subject;
          b=Laf/BzswxC6MHKw0zFSksRhd074FBk4i40+vK15ajW/GrFtwhlvJPYE5q/yi+2bei
           HLfqRlKnvfiOBJhmA5WbH5U8V9Uj7si7vWsCKZWMJ3QXfc1kt+DlB+upbUmKPNeRib
           j4xxJRKS21moFzzGo2TelLeSbQWcPHUIsh/ljXl0=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 19 Nov 2021 21:46:20 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [DEBUG PATCH v3] rtc-cmos: cmos_read_alarm bug demonstration
Date:   Fri, 19 Nov 2021 21:46:14 +0100
Message-Id: <20211119204614.78957-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119204221.66918-7-mat.jonczyk@o2.pl>
References: <20211119204221.66918-7-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: bf10f80be682a12b9e1aeec956af1763
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [QdOU]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Before my commit "rtc-cmos: avoid UIP when reading alarm time",
applying this patch and reading the CMOS time like so:

        while true; do cat /sys/class/rtc/rtc0/time ; sleep 0.5; done

produces errors in dmesg on my Intel Kaby Lake laptop.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-cmos.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index b6d7dd3cf066..3de049930745 100644
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
@@ -230,6 +235,8 @@ static int cmos_read_time(struct device *dev, struct rtc_time *t)
 		return -EIO;
 
 	mc146818_get_time(t);
+
+	cmos_read_alarm_uip_debugging(dev);
 	return 0;
 }
 
@@ -338,6 +345,60 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
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

