Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2F61C63BC
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 00:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgEEWOA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 18:14:00 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33192 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgEEWOA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 18:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588716823; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lj+1IC/mCdRZ2YkRPPAJK3O363dMRQmiiWEc1dB++G8=;
        b=qao47Pz37rtyeFWZWPnQSMRTnLWhyjwnPathtrxSFLxRJmqcAUd1x4qgbUGQdfc3C/Hp0v
        5knmCR3JsMR5+mkis8C6DjUCEFlWk5Abiuup9CeeGEm/ZCaeT3HrVo2+ktI+rOlOueC+id
        KLRf30BS7aNx3anUYZ9NaBZ1w+/ozxM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/7] rtc: ingenic: Enable clock in probe
Date:   Wed,  6 May 2020 00:13:32 +0200
Message-Id: <20200505221336.222313-3-paul@crapouillou.net>
In-Reply-To: <20200505221336.222313-1-paul@crapouillou.net>
References: <20200505221336.222313-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It makes no sense to request a clock and not enable it even though the
hardware is being used. So the driver now enables the clock in the
probe. Besides, now we can properly handle errors.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 06ee08089815..129c68cebb92 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -264,8 +264,6 @@ static void jz4740_rtc_power_off(void)
 	unsigned long wakeup_filter_ticks;
 	unsigned long reset_counter_ticks;
 
-	clk_prepare_enable(rtc->clk);
-
 	rtc_rate = clk_get_rate(rtc->clk);
 
 	/*
@@ -297,6 +295,11 @@ static void jz4740_rtc_power_off(void)
 	kernel_halt();
 }
 
+static void jz4740_rtc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static const struct of_device_id jz4740_rtc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-rtc", .data = (void *)ID_JZ4740 },
 	{ .compatible = "ingenic,jz4760-rtc", .data = (void *)ID_JZ4760 },
@@ -332,6 +335,18 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->clk);
 	}
 
+	ret = clk_prepare_enable(rtc->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, jz4740_rtc_clk_disable, rtc->clk);
+	if (ret) {
+		dev_err(dev, "Failed to register devm action\n");
+		return ret;
+	}
+
 	spin_lock_init(&rtc->lock);
 
 	platform_set_drvdata(pdev, rtc);
-- 
2.26.2

