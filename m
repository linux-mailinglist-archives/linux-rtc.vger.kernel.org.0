Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF671C63C0
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgEEWOP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:14:15 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33408 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWOP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588716824; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mdo6pYpTrP6F5dtEJmimot3ccnIA8oDcbI51nIstwwY=;
        b=pLATXSnFlK9q+rAvxLaRNOX8J0rXuRLjmajFDB+rdvbDgZhG1DoapPO/7/pHfvNvynFULd
        m+pgjC2TgIaC5N7nokWexQ+BTcilh0cGv368FHla/fThRF+AQvivFcobgyVWVvLjoLrnMn
        Zov9E2E8BbZqPmUv9OAwJoCbOVr7nKE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/7] rtc: ingenic: Remove unused fields from private structure
Date:   Wed,  6 May 2020 00:13:34 +0200
Message-Id: <20200505221336.222313-5-paul@crapouillou.net>
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The 'clk' and 'irq' fields were only ever used in the probe function.
Therefore they can be moved to be simple local variables of the probe
function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 8927fd0fb086..3193eb8bd131 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -55,9 +55,6 @@ struct jz4740_rtc {
 	enum jz4740_rtc_type type;
 
 	struct rtc_device *rtc;
-	struct clk *clk;
-
-	int irq;
 
 	spinlock_t lock;
 };
@@ -313,9 +310,10 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	int ret;
 	struct jz4740_rtc *rtc;
 	unsigned long rate;
+	struct clk *clk;
+	int ret, irq;
 
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -323,27 +321,27 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	rtc->type = (enum jz4740_rtc_type)device_get_match_data(dev);
 
-	rtc->irq = platform_get_irq(pdev, 0);
-	if (rtc->irq < 0)
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
 		return -ENOENT;
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	rtc->clk = devm_clk_get(dev, "rtc");
-	if (IS_ERR(rtc->clk)) {
+	clk = devm_clk_get(dev, "rtc");
+	if (IS_ERR(clk)) {
 		dev_err(dev, "Failed to get RTC clock\n");
-		return PTR_ERR(rtc->clk);
+		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(rtc->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "Failed to enable clock\n");
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, jz4740_rtc_clk_disable, rtc->clk);
+	ret = devm_add_action_or_reset(dev, jz4740_rtc_clk_disable, clk);
 	if (ret) {
 		dev_err(dev, "Failed to register devm action\n");
 		return ret;
@@ -355,7 +353,7 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(dev, 1);
 
-	ret = dev_pm_set_wake_irq(dev, rtc->irq);
+	ret = dev_pm_set_wake_irq(dev, irq);
 	if (ret) {
 		dev_err(dev, "Failed to set wake irq: %d\n", ret);
 		return ret;
@@ -371,14 +369,14 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->ops = &jz4740_rtc_ops;
 	rtc->rtc->range_max = U32_MAX;
 
-	rate = clk_get_rate(rtc->clk);
+	rate = clk_get_rate(clk);
 	jz4740_rtc_set_wakeup_params(rtc, np, rate);
 
 	ret = rtc_register_device(rtc->rtc);
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(dev, rtc->irq, jz4740_rtc_irq, 0,
+	ret = devm_request_irq(dev, irq, jz4740_rtc_irq, 0,
 			       pdev->name, rtc);
 	if (ret) {
 		dev_err(dev, "Failed to request rtc irq: %d\n", ret);
-- 
2.26.2

