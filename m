Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB85C14104F
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 18:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgAQR4v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 12:56:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:62787 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727573AbgAQR4b (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:56:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 09:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="243739401"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Jan 2020 09:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 08CC3109; Fri, 17 Jan 2020 19:56:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/8] x86/quirks: Convert DMI matching to use a table
Date:   Fri, 17 Jan 2020 19:56:22 +0200
Message-Id: <20200117175626.56358-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In order to extend the DMI based quirks, convert them to a table.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/quirks.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/quirks.c b/arch/x86/kernel/quirks.c
index 5b96654aacc0..447d4fba8516 100644
--- a/arch/x86/kernel/quirks.c
+++ b/arch/x86/kernel/quirks.c
@@ -667,8 +667,31 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x2083, quirk_intel_purley_xeon_ras
 bool x86_apple_machine;
 EXPORT_SYMBOL(x86_apple_machine);
 
+static int apple_machine_cb(const struct dmi_system_id *id)
+{
+	x86_apple_machine = true;
+	return 1;
+}
+
+static const struct dmi_system_id x86_machine_table[] = {
+	{
+		.ident = "x86 Apple Macintosh",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+		},
+		.callback = apple_machine_cb,
+	},
+	{
+		.ident = "x86 Apple Macintosh",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Computer, Inc."),
+		},
+		.callback = apple_machine_cb,
+	},
+	{}
+};
+
 void __init early_platform_quirks(void)
 {
-	x86_apple_machine = dmi_match(DMI_SYS_VENDOR, "Apple Inc.") ||
-			    dmi_match(DMI_SYS_VENDOR, "Apple Computer, Inc.");
+	dmi_check_system(x86_machine_table);
 }
-- 
2.24.1

