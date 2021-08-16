Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A7E3ECE40
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Aug 2021 08:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbhHPGDB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Aug 2021 02:03:01 -0400
Received: from ZXSHCAS2.zhaoxin.com ([203.148.12.82]:39644 "EHLO
        ZXSHCAS2.zhaoxin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbhHPGC7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Aug 2021 02:02:59 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Aug 2021 02:02:59 EDT
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 Aug
 2021 13:47:21 +0800
Received: from tony-HX002EA.zhaoxin.com (10.32.56.37) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 Aug
 2021 13:47:19 +0800
From:   Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <TimGuo-oc@zhaoxin.com>, <CooperYan@zhaoxin.com>,
        <QiyuanWang@zhaoxin.com>, <HerryYang@zhaoxin.com>,
        <CobeChen@zhaoxin.com>, <YanchenSun@zhaoxin.com>
Subject: [PATCH] rtc: Fix set RTC time delay 500ms on some Zhaoxin SOCs
Date:   Mon, 16 Aug 2021 21:47:18 +0800
Message-ID: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.32.56.37]
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When the RTC divider is changed from reset to an operating time base,
the first update cycle should be 500ms later. But on some Zhaoxin SOCs,
this first update cycle is one second later.

So set RTC time on these Zhaoxin SOCs will causing 500ms delay.

Skip setup RTC divider on these SOCs in mc146818_set_time to fix it.

Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
---
 drivers/rtc/rtc-mc146818-lib.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index dcfaf09..322f94b 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -190,8 +190,18 @@ int mc146818_set_time(struct rtc_time *time)
 	spin_lock_irqsave(&rtc_lock, flags);
 	save_control = CMOS_READ(RTC_CONTROL);
 	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
+
+#ifdef CONFIG_X86
+	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
+		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
+		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59))) {
+		save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
+		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
+	}
+#else
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
 	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
+#endif
 
 #ifdef CONFIG_MACH_DECSTATION
 	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
@@ -209,7 +219,15 @@ int mc146818_set_time(struct rtc_time *time)
 #endif
 
 	CMOS_WRITE(save_control, RTC_CONTROL);
+
+#ifdef CONFIG_X86
+	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
+		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
+		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59)))
+		CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
+#else
 	CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
+#endif
 
 	spin_unlock_irqrestore(&rtc_lock, flags);
 
-- 
2.7.4

