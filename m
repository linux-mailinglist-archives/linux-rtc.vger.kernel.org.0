Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5614D1468D5
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2020 14:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgAWNOl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 08:14:41 -0500
Received: from mga02.intel.com ([134.134.136.20]:58434 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgAWNOl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 08:14:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 05:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; 
   d="scan'208";a="245384779"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2020 05:14:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BB16E29B; Thu, 23 Jan 2020 15:14:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>
Subject: [PATCH v2 2/3] rtc: cmos: Use predefined value for RTC IRQ on legacy x86
Date:   Thu, 23 Jan 2020 15:14:36 +0200
Message-Id: <20200123131437.28157-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
References: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When legacy devices are present on x86 machine, the RTC IRQ has
a dedicated pre-defined value. Use it instead of hard coded number.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: Added tags
 drivers/rtc/rtc-cmos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index cb28bbdc9e17..aee55b658f85 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1305,7 +1305,7 @@ static int cmos_pnp_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		 * hardcode it on systems with a legacy PIC.
 		 */
 		if (nr_legacy_irqs())
-			irq = 8;
+			irq = RTC_IRQ;
 #endif
 		return cmos_do_probe(&pnp->dev,
 				pnp_get_resource(pnp, IORESOURCE_IO, 0), irq);
-- 
2.24.1

