Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7DA76DC0A4
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Apr 2023 18:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjDIQZz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 9 Apr 2023 12:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIQZz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 9 Apr 2023 12:25:55 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817033A91
        for <linux-rtc@vger.kernel.org>; Sun,  9 Apr 2023 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=onQK1wLBMqPVuUbhaa5c6SRmlbjoStfOD19Kk2WezKM=; b=I+IqWHfdWbE1e9Yeq2NAbAbinV
        KF/sNJihu5Ev1/rneAU03zMrtmz0gWn53/w9LBwb5aTVf3nehSXbh9zo4Aw4aHdUyYA9b6R9TgFms
        mVovSkge2k43nAwPmN2WwBLXUUmlOdaHjcd3bC706ggoQkZPQrhDN8hGtN9L+RakW8hZkSjp/DBsZ
        NjQM4gvLakpBq+eHAYS+18oUmLB8vyzch2DGl7iDFK73VWfWWP3Hv7XejZJtLXtGlMgAsm8pk/zYY
        wHBUWvOBEf14yXA4dGJ9KuAZT+W4F12oSGg+HO7rq1QmhKNDnRE6B2E3b9Qk3rqYxcoQBAA42ADu0
        c1XyjR9Q==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plXrT-000G32-GJ; Sun, 09 Apr 2023 18:25:51 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plXrT-000CVp-0K; Sun, 09 Apr 2023 18:25:51 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-rtc@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] rtc: jz4740: Make sure clock provider gets removed
Date:   Sun,  9 Apr 2023 09:25:44 -0700
Message-Id: <20230409162544.16155-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26870/Sun Apr  9 09:25:02 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The jz4740 RTC driver registers a clock provider, but never removes it.
This leaves a stale clock provider behind that references freed clocks when
the device is unbound.

Use the managed `devm_of_clk_add_hw_provider()` instead of
`of_clk_add_hw_provider()` to make sure the provider gets automatically
removed on unbind.

Fixes: 5ddfa148de8c ("rtc: jz4740: Register clock provider for the CLK32K pin")
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/rtc/rtc-jz4740.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 59d279e3e6f5..36453b008139 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -414,7 +414,8 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret,
 					     "Unable to register clk32k clock\n");
 
-		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &rtc->clk32k);
+		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+						  &rtc->clk32k);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Unable to register clk32k clock provider\n");
-- 
2.30.2

