Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB6E1468D6
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2020 14:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgAWNOn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 08:14:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:44925 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgAWNOn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 08:14:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 05:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; 
   d="scan'208";a="227995077"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2020 05:14:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C6FF734C; Thu, 23 Jan 2020 15:14:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>
Subject: [PATCH v2 3/3] rtc: cmos: Refactor code by using the new dmi_get_bios_year() helper
Date:   Thu, 23 Jan 2020 15:14:37 +0200
Message-Id: <20200123131437.28157-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
References: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Refactor code by using the new dmi_get_bios_year() helper instead of
open coding its functionality. This also makes logic slightly clearer.

No changes intended.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: Added tags
 drivers/rtc/rtc-cmos.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index aee55b658f85..b795fe4cbd2e 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1197,8 +1197,6 @@ static void rtc_wake_off(struct device *dev)
 /* Enable use_acpi_alarm mode for Intel platforms no earlier than 2015 */
 static void use_acpi_alarm_quirks(void)
 {
-	int year;
-
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return;
 
@@ -1208,8 +1206,10 @@ static void use_acpi_alarm_quirks(void)
 	if (!is_hpet_enabled())
 		return;
 
-	if (dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL) && year >= 2015)
-		use_acpi_alarm = true;
+	if (dmi_get_bios_year() < 2015)
+		return;
+
+	use_acpi_alarm = true;
 }
 #else
 static inline void use_acpi_alarm_quirks(void) { }
-- 
2.24.1

