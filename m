Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B23E6145817
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 15:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVOph (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 09:45:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:48556 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgAVOpg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 22 Jan 2020 09:45:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jan 2020 06:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; 
   d="scan'208";a="250636268"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2020 06:45:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2AFDD2CB; Wed, 22 Jan 2020 16:45:31 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 3/3] rtc: cmos: Refactor code by using the new dmi_get_bios_year() helper
Date:   Wed, 22 Jan 2020 16:45:29 +0200
Message-Id: <20200122144529.30307-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
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
---
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

