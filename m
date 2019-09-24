Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD42BC045
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2019 04:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393731AbfIXCmv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Sep 2019 22:42:51 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:59442 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407965AbfIXCmv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 23 Sep 2019 22:42:51 -0400
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam2.hygon.cn with ESMTP id x8O2g4ZJ068535;
        Tue, 24 Sep 2019 10:42:04 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-DB.hygon.cn with ESMTP id x8O2fvYM086978;
        Tue, 24 Sep 2019 10:41:57 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from bogon.hygon.cn (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 24 Sep
 2019 10:41:59 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <puwen@hygon.cn>, <thomas.lendacky@amd.com>, <kim.phillips@amd.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jinke Fan <fanjinke@hygon.cn>
Subject: [RESEND PATCH RFC] rtc: Fix the AltCentury value on AMD/Hygon platform
Date:   Tue, 24 Sep 2019 10:41:08 +0800
Message-ID: <20190924024108.51286-1-fanjinke@hygon.cn>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x8O2g4ZJ068535
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When using following operations:
date -s "21190910 19:20:00"
hwclock -w
to change date from 2019 to 2119 for test, it will fail on Hygon
Dhyana and AMD Zen CPUs, while the same operations run ok on Intel i7
platform.

MC146818 driver use function mc146818_set_time() to set register
RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
reset value on Intel platform to 0x7.

While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
as reserved.

DV0 is set to 1, it will select Bank 1, which will disable AltCentury
register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
(AltCentury), the CMOS write will be failed on code:
CMOS_WRITE(century, acpi_gbl_FADT.century).

Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
enable AltCentury(0x32) register writing and finally setup century as
expected.

Test results on AMD/Hygon machine show that it works as expected.

Reference:
https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
section: 3.13 Real Time Clock (RTC)

Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
---
 drivers/rtc/rtc-mc146818-lib.c | 9 +++++++--
 include/linux/mc146818rtc.h    | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 2ecd8752b088..c09fe486ae67 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -170,9 +170,14 @@ int mc146818_set_time(struct rtc_time *time)
 	}
 
 	save_control = CMOS_READ(RTC_CONTROL);
-	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
+	CMOS_WRITE((save_control | RTC_SET), RTC_CONTROL);
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
-	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
+
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
+	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
+		CMOS_WRITE((save_freq_select & (~RTC_DV0)), RTC_FREQ_SELECT);
+	else
+		CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
 
 #ifdef CONFIG_MACH_DECSTATION
 	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
index 0661af17a758..b8ba6556c371 100644
--- a/include/linux/mc146818rtc.h
+++ b/include/linux/mc146818rtc.h
@@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
    /* 2 values for divider stage reset, others for "testing purposes only" */
 #  define RTC_DIV_RESET1	0x60
 #  define RTC_DIV_RESET2	0x70
+   /* DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1 on AMD/Hygon platform */
+#  define RTC_DV0		0x10
   /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
 # define RTC_RATE_SELECT 	0x0F
 
-- 
2.17.1

