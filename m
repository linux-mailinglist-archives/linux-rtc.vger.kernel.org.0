Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46991300C2
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jan 2020 05:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgADEbU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Jan 2020 23:31:20 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59325 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgADEbU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Jan 2020 23:31:20 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0D7CD1C0004;
        Sat,  4 Jan 2020 04:31:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jinke Fan <fanjinke@hygon.cn>
Subject: [PATCH] rtc: cmos: Revert "rtc: Fix the AltCentury value on AMD/Hygon platform"
Date:   Sat,  4 Jan 2020 05:31:10 +0100
Message-Id: <20200104043110.707810-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There are multiple reports of this patch breaking RTC time setting for AMD
platforms.

This reverts commit 7ad295d5196a58c22abecef62dd4f99e2f86e831.

Cc: Jinke Fan <fanjinke@hygon.cn>
Link: https://lore.kernel.org/r/CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com
Fixes: 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon platform")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mc146818-lib.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index df2829dd55ad..2ecd8752b088 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -172,20 +172,7 @@ int mc146818_set_time(struct rtc_time *time)
 	save_control = CMOS_READ(RTC_CONTROL);
 	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
-
-#ifdef CONFIG_X86
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 == 0x17) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
-		CMOS_WRITE((save_freq_select & (~RTC_DIV_RESET2)),
-			RTC_FREQ_SELECT);
-		save_freq_select &= ~RTC_DIV_RESET2;
-	} else
-		CMOS_WRITE((save_freq_select | RTC_DIV_RESET2),
-			RTC_FREQ_SELECT);
-#else
-	CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
-#endif
+	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
 
 #ifdef CONFIG_MACH_DECSTATION
 	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
-- 
2.24.1

