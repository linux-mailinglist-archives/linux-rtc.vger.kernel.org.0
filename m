Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C97B3482E3
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 21:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237892AbhCXU1h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 16:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237868AbhCXU11 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Mar 2021 16:27:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543DFC061763
        for <linux-rtc@vger.kernel.org>; Wed, 24 Mar 2021 13:27:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lPA5y-0002XA-LK; Wed, 24 Mar 2021 21:27:14 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lPA5x-00028P-BU; Wed, 24 Mar 2021 21:27:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] rtc: at91sma9: Simplify using devm_clk_get_enabled()
Date:   Wed, 24 Mar 2021 21:27:11 +0100
Message-Id: <20210324202711.76734-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
References: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this simplification depends on a patch set that introduces
devm_clk_get_prepared() and friends.

The most recent version of this patch set can be found at

	https://lore.kernel.org/r/20210301135053.1462168-1-u.kleine-koenig@pengutronix.de

Unfortunately I didn't get any feedback at all from the clk maintainers
on it, so I try to make other maintainers aware of it in the expectation
that the simplifications are welcome and so lure the clk maintainers to
share their thoughts.

Best regards
Uwe

 drivers/rtc/rtc-at91sam9.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 2216be429ab7..b52e7bd26303 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -374,21 +374,14 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
+	rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(rtc->sclk))
 		return PTR_ERR(rtc->sclk);
 
-	ret = clk_prepare_enable(rtc->sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
-	}
-
 	sclk_rate = clk_get_rate(rtc->sclk);
 	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
 		dev_err(&pdev->dev, "Invalid slow clock rate\n");
-		ret = -EINVAL;
-		goto err_clk;
+		return -EINVAL;
 	}
 
 	mr = rtt_readl(rtc, MR);
@@ -406,7 +399,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev)) {
 		ret = PTR_ERR(rtc->rtcdev);
-		goto err_clk;
+		return ret;
 	}
 
 	rtc->rtcdev->ops = &at91_rtc_ops;
@@ -418,7 +411,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			       dev_name(&rtc->rtcdev->dev), rtc);
 	if (ret) {
 		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
@@ -432,11 +425,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			 dev_name(&rtc->rtcdev->dev));
 
 	return devm_rtc_register_device(rtc->rtcdev);
-
-err_clk:
-	clk_disable_unprepare(rtc->sclk);
-
-	return ret;
 }
 
 /*
@@ -450,8 +438,6 @@ static int at91_rtc_remove(struct platform_device *pdev)
 	/* disable all interrupts */
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
 
-	clk_disable_unprepare(rtc->sclk);
-
 	return 0;
 }
 
-- 
2.30.2

