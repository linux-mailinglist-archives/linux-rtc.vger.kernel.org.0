Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2DFD43B5
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2019 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfJKPF5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Oct 2019 11:05:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:54564 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbfJKPF4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Oct 2019 11:05:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 256C9B166;
        Fri, 11 Oct 2019 15:05:55 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rts: ds1685: remove not needed fields from private struct
Date:   Fri, 11 Oct 2019 17:05:43 +0200
Message-Id: <20191011150546.9186-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

A few of the fields in struct ds1685_priv aren't needed at all,
so we can remove it.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 drivers/rtc/rtc-ds1685.c   | 3 ---
 include/linux/rtc/ds1685.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 184e4a3e2bef..51f568473de8 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1086,12 +1086,10 @@ ds1685_rtc_probe(struct platform_device *pdev)
 		 * Set the base address for the rtc, and ioremap its
 		 * registers.
 		 */
-		rtc->baseaddr = res->start;
 		rtc->regs = devm_ioremap(&pdev->dev, res->start, rtc->size);
 		if (!rtc->regs)
 			return -ENOMEM;
 	}
-	rtc->alloc_io_resources = pdata->alloc_io_resources;
 
 	/* Get the register step size. */
 	if (pdata->regstep > 0)
@@ -1271,7 +1269,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	/* See if the platform doesn't support UIE. */
 	if (pdata->uie_unsupported)
 		rtc_dev->uie_unsupported = 1;
-	rtc->uie_unsupported = pdata->uie_unsupported;
 
 	rtc->dev = rtc_dev;
 
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 43aec568ba7c..b9671d00d964 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -43,13 +43,10 @@ struct ds1685_priv {
 	struct rtc_device *dev;
 	void __iomem *regs;
 	u32 regstep;
-	resource_size_t baseaddr;
 	size_t size;
 	int irq_num;
 	bool bcd_mode;
 	bool no_irq;
-	bool uie_unsupported;
-	bool alloc_io_resources;
 	u8 (*read)(struct ds1685_priv *, int);
 	void (*write)(struct ds1685_priv *, int, u8);
 	void (*prepare_poweroff)(void);
-- 
2.16.4

