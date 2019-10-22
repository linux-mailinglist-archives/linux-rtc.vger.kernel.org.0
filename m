Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B1DFE9B
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2019 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387769AbfJVHuG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Oct 2019 03:50:06 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:57916 "EHLO spam1.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726978AbfJVHuG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 22 Oct 2019 03:50:06 -0400
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam1.hygon.cn with ESMTP id x9M7mw2a048343;
        Tue, 22 Oct 2019 15:48:58 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-DB.hygon.cn with ESMTP id x9M7mo6S017121;
        Tue, 22 Oct 2019 15:48:50 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from bogon.higon.com (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 22 Oct
 2019 15:48:55 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     <alexandre.belloni@bootlin.com>, <a.zummo@towertech.it>,
        <puwen@hygon.cn>, <thomas.lendacky@amd.com>, <kim.phillips@amd.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jinke Fan <fanjinke@hygon.cn>
Subject: [PATCH v4] rtc: Fix the AltCentury value on AMD/Hygon platform
Date:   Tue, 22 Oct 2019 15:48:07 +0800
Message-ID: <20191022074807.32430-1-fanjinke@hygon.cn>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam1.hygon.cn x9M7mw2a048343
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

Test results on Intel i7, AMD EPYC(17h) and Hygon machine show that it
works as expected.
Compiling for sparc64 and alpha architectures are passed.

Reference:
https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
section: 3.13 Real Time Clock (RTC)

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
---

v3->v4:
  - Limited modification to AMD EPYC(17h).
  - Change the macro RTC_DV0 to RTC_DIV_RESET2.
  - Make sure save_freq_select's bit4 is cleared.

v2->v3:
  - Make the changes only relevant to AMD/Hygon.

v1->v2:
  - Fix the compile errors on sparc64/alpha platform.

 drivers/rtc/rtc-mc146818-lib.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 2ecd875..df2829d 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -172,7 +172,20 @@ int mc146818_set_time(struct rtc_time *time)
 	save_control = CMOS_READ(RTC_CONTROL);
 	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
 	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
-	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
+
+#ifdef CONFIG_X86
+	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
+	     boot_cpu_data.x86 == 0x17) ||
+	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+		CMOS_WRITE((save_freq_select & (~RTC_DIV_RESET2)),
+			RTC_FREQ_SELECT);
+		save_freq_select &= ~RTC_DIV_RESET2;
+	} else
+		CMOS_WRITE((save_freq_select | RTC_DIV_RESET2),
+			RTC_FREQ_SELECT);
+#else
+	CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
+#endif
 
 #ifdef CONFIG_MACH_DECSTATION
 	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
-- 
2.7.4

