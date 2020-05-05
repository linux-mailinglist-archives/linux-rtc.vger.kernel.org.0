Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B872C1C63BA
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgEEWNx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:13:53 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33004 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWNw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588716822; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PNrCYVLQEOQt4/20kwBchqnMdnfToz6u3rGuZz+NRq0=;
        b=Mu8iPDL+iLoUwuHldn8XwkVyEFo8QZA7BZslDeXMU7sQW4qu8O77vzgF+JaBMzG7AOrvRT
        lJhQq98SSaCBSR3zejcafUqk2S+x4H0NFpPEr73tyWpzGIjniuYclfXfSvQsj8JV2thwfQ
        G26Bj0S6KdRvvYdSb+0XP/YwUHD734w=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/7] rtc: ingenic: Use local 'dev' variable in probe
Date:   Wed,  6 May 2020 00:13:31 +0200
Message-Id: <20200505221336.222313-2-paul@crapouillou.net>
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Clean a bit the probe function by adding a local struct device *dev
variable.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 949d395066e2..06ee08089815 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -307,11 +307,12 @@ MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
 
 static int jz4740_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	int ret;
 	struct jz4740_rtc *rtc;
-	struct device_node *np = pdev->dev.of_node;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -325,9 +326,9 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	rtc->clk = devm_clk_get(&pdev->dev, "rtc");
+	rtc->clk = devm_clk_get(dev, "rtc");
 	if (IS_ERR(rtc->clk)) {
-		dev_err(&pdev->dev, "Failed to get RTC clock\n");
+		dev_err(dev, "Failed to get RTC clock\n");
 		return PTR_ERR(rtc->clk);
 	}
 
@@ -335,18 +336,18 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(dev, 1);
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq);
+	ret = dev_pm_set_wake_irq(dev, rtc->irq);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to set wake irq: %d\n", ret);
+		dev_err(dev, "Failed to set wake irq: %d\n", ret);
 		return ret;
 	}
 
-	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtc)) {
 		ret = PTR_ERR(rtc->rtc);
-		dev_err(&pdev->dev, "Failed to allocate rtc device: %d\n", ret);
+		dev_err(dev, "Failed to allocate rtc device: %d\n", ret);
 		return ret;
 	}
 
@@ -357,10 +358,10 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(&pdev->dev, rtc->irq, jz4740_rtc_irq, 0,
-				pdev->name, rtc);
+	ret = devm_request_irq(dev, rtc->irq, jz4740_rtc_irq, 0,
+			       pdev->name, rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request rtc irq: %d\n", ret);
+		dev_err(dev, "Failed to request rtc irq: %d\n", ret);
 		return ret;
 	}
 
@@ -378,11 +379,10 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 					     "ingenic,min-wakeup-pin-assert-time-ms",
 					     &rtc->min_wakeup_pin_assert_time);
 
-			dev_for_power_off = &pdev->dev;
+			dev_for_power_off = dev;
 			pm_power_off = jz4740_rtc_power_off;
 		} else {
-			dev_warn(&pdev->dev,
-				 "Poweroff handler already present!\n");
+			dev_warn(dev, "Poweroff handler already present!\n");
 		}
 	}
 
-- 
2.26.2

