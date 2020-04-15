Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCBA1AB234
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 22:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437461AbgDOUAp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 16:00:45 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37125 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436756AbgDOUAo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 16:00:44 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2B469FF804;
        Wed, 15 Apr 2020 20:00:42 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] rtc: mt2712: switch to devm_platform_ioremap_resource
Date:   Wed, 15 Apr 2020 22:00:21 +0200
Message-Id: <20200415200021.157118-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200415200021.157118-1-alexandre.belloni@bootlin.com>
References: <20200415200021.157118-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Using devm_platform_ioremap_resource instead of open coding it reduces the
size of the binary.

   text	   data	    bss	    dec	    hex	filename
   3728	    216	      0	   3944	    f68	drivers/rtc/rtc-mt2712.o
   3744	    216	      0	   3960	    f78	drivers/rtc/rtc-mt2712.o.old

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Note that while I don't approve the trend of doing this change tree wide, it is
way faster to do it myself now and avoid getting the same patch from someone I
don't trust (yet).

 drivers/rtc/rtc-mt2712.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 9868d98f397c..d5f691c8a035 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -310,7 +310,6 @@ static const struct rtc_class_ops mt2712_rtc_ops = {
 
 static int mt2712_rtc_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct mt2712_rtc *mt2712_rtc;
 	int ret;
 
@@ -319,8 +318,7 @@ static int mt2712_rtc_probe(struct platform_device *pdev)
 	if (!mt2712_rtc)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mt2712_rtc->base = devm_ioremap_resource(&pdev->dev, res);
+	mt2712_rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mt2712_rtc->base))
 		return PTR_ERR(mt2712_rtc->base);
 
-- 
2.25.2

