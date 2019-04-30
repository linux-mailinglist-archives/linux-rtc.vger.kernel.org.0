Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DDBF2CF
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfD3J20 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:28:26 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:46829 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfD3J20 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:28:26 -0400
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id C9E6410001D;
        Tue, 30 Apr 2019 09:28:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/7] rtc: jz4740: set range
Date:   Tue, 30 Apr 2019 11:28:15 +0200
Message-Id: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RTC_SEC is a 32-bit seconds counter.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-jz4740.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index d0a891777f44..079469627bd7 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -348,10 +348,18 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					&jz4740_rtc_ops, THIS_MODULE);
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc)) {
 		ret = PTR_ERR(rtc->rtc);
+		dev_err(&pdev->dev, "Failed to allocate rtc device: %d\n", ret);
+		return ret;
+	}
+
+	rtc->rtc->ops = &jz4740_rtc_ops;
+	rtc->rtc->range_max = U32_MAX;
+
+	ret = rtc_register_device(rtc->rtc);
+	if (ret) {
 		dev_err(&pdev->dev, "Failed to register rtc device: %d\n", ret);
 		return ret;
 	}
-- 
2.20.1

