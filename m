Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A842014104D
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 18:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgAQR4c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 12:56:32 -0500
Received: from mga01.intel.com ([192.55.52.88]:52962 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729022AbgAQR4c (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:56:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 09:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="226419537"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2020 09:56:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E88C073; Fri, 17 Jan 2020 19:56:26 +0200 (EET)
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
Subject: [PATCH v1 2/8] x86/platform: Rename x86/apple.h -> x86/machine.h
Date:   Fri, 17 Jan 2020 19:56:20 +0200
Message-Id: <20200117175626.56358-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Rename linux/platform_data/x86/apple.h to linux/platform_data/x86/machine.h
in order to add new quirks later on. For sake of being less intrusive,
leave former file that includes a latter one.

While here, add include to linux/types.h due to bool type in use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/platform_data/x86/apple.h   | 14 +-------------
 include/linux/platform_data/x86/machine.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 create mode 100644 include/linux/platform_data/x86/machine.h

diff --git a/include/linux/platform_data/x86/apple.h b/include/linux/platform_data/x86/apple.h
index 079e816c3c21..1fd0af6ffea9 100644
--- a/include/linux/platform_data/x86/apple.h
+++ b/include/linux/platform_data/x86/apple.h
@@ -1,13 +1 @@
-#ifndef PLATFORM_DATA_X86_APPLE_H
-#define PLATFORM_DATA_X86_APPLE_H
-
-#ifdef CONFIG_X86
-/**
- * x86_apple_machine - whether the machine is an x86 Apple Macintosh
- */
-extern bool x86_apple_machine;
-#else
-#define x86_apple_machine false
-#endif
-
-#endif
+#include <linux/platform_data/x86/machine.h>
diff --git a/include/linux/platform_data/x86/machine.h b/include/linux/platform_data/x86/machine.h
new file mode 100644
index 000000000000..b1e7a560a046
--- /dev/null
+++ b/include/linux/platform_data/x86/machine.h
@@ -0,0 +1,15 @@
+#ifndef PLATFORM_DATA_X86_MACHINE_H
+#define PLATFORM_DATA_X86_MACHINE_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_X86
+/**
+ * x86_apple_machine - whether the machine is an x86 Apple Macintosh
+ */
+extern bool x86_apple_machine;
+#else
+#define x86_apple_machine			false
+#endif
+
+#endif	/* PLATFORM_DATA_X86_MACHINE_H */
-- 
2.24.1

