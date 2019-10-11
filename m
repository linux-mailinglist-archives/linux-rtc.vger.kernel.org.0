Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2FBD43BB
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2019 17:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfJKPGC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Oct 2019 11:06:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:54566 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726521AbfJKPF5 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Oct 2019 11:05:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 25911B185;
        Fri, 11 Oct 2019 15:05:55 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: ds1685: use devm_platform_ioremap_resource helper
Date:   Fri, 11 Oct 2019 17:05:44 +0200
Message-Id: <20191011150546.9186-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191011150546.9186-1-tbogendoerfer@suse.de>
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Simplify ioremapping of registers by using devm_platform_ioremap_resource.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 drivers/rtc/rtc-ds1685.c   | 23 +++--------------------
 include/linux/rtc/ds1685.h |  1 -
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 51f568473de8..349a8d1caca1 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1040,7 +1040,6 @@ static int
 ds1685_rtc_probe(struct platform_device *pdev)
 {
 	struct rtc_device *rtc_dev;
-	struct resource *res;
 	struct ds1685_priv *rtc;
 	struct ds1685_rtc_platform_data *pdata;
 	u8 ctrla, ctrlb, hours;
@@ -1070,25 +1069,9 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	 * that sits behind the IOC3 PCI metadevice.
 	 */
 	if (pdata->alloc_io_resources) {
-		/* Get the platform resources. */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return -ENXIO;
-		rtc->size = resource_size(res);
-
-		/* Request a memory region. */
-		/* XXX: mmio-only for now. */
-		if (!devm_request_mem_region(&pdev->dev, res->start, rtc->size,
-					     pdev->name))
-			return -EBUSY;
-
-		/*
-		 * Set the base address for the rtc, and ioremap its
-		 * registers.
-		 */
-		rtc->regs = devm_ioremap(&pdev->dev, res->start, rtc->size);
-		if (!rtc->regs)
-			return -ENOMEM;
+		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(rtc->regs))
+			return PTR_ERR(rtc->regs);
 	}
 
 	/* Get the register step size. */
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index b9671d00d964..101c7adc05a2 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -43,7 +43,6 @@ struct ds1685_priv {
 	struct rtc_device *dev;
 	void __iomem *regs;
 	u32 regstep;
-	size_t size;
 	int irq_num;
 	bool bcd_mode;
 	bool no_irq;
-- 
2.16.4

