Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F26141051
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 18:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgAQR4b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 12:56:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:62787 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgAQR4a (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:56:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 09:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="262983784"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2020 09:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F2E9BE1; Fri, 17 Jan 2020 19:56:26 +0200 (EET)
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
Subject: [PATCH v1 3/8] x86/quirks: Add missed include to satisfy static checker
Date:   Fri, 17 Jan 2020 19:56:21 +0200
Message-Id: <20200117175626.56358-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Static checker is not happy with

.../kernel/quirks.c:666:6: warning: symbol 'x86_apple_machine' was not declared. Should it be static?

This is due to missed inclusion. Add it to satisfy the static checker.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/quirks.c b/arch/x86/kernel/quirks.c
index 1daf8f2aa21f..5b96654aacc0 100644
--- a/arch/x86/kernel/quirks.c
+++ b/arch/x86/kernel/quirks.c
@@ -4,6 +4,7 @@
  */
 #include <linux/dmi.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/machine.h>
 #include <linux/irq.h>
 
 #include <asm/hpet.h>
-- 
2.24.1

