Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23B44D8696
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Mar 2022 15:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbiCNOSY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Mar 2022 10:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbiCNOSW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Mar 2022 10:18:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D872E19C31
        for <linux-rtc@vger.kernel.org>; Mon, 14 Mar 2022 07:17:12 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVN-00051C-73; Mon, 14 Mar 2022 15:17:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVN-000f3T-JU; Mon, 14 Mar 2022 15:17:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-0097bL-Jv; Mon, 14 Mar 2022 15:16:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH v8 13/16] rtc: at91sam9: Simplify using devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:40 +0100
Message-Id: <20220314141643.22184-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=uwe@kleine-koenig.org; h=from:subject; bh=B46sFCPHlcrcaPsavyXMd4P0PfwkNsS4guEpBZ8cN4Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04VXyfINyi5TQGccw4ZBV+b44hcbVF4eex82mu2 wFwWV0OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OFQAKCRDB/BR4rcrsCZI2B/ 4rREB2v9oI2LNjgrdooT1QZDfkJTLHqnWlnj0U7F3roPGmJNf9o2inI5OZ+YKu3PzeiAOHaWxcN5K6 ilaeNUOTVVa1okyFfTlQZ3qYWvWo96oapuJBTvdQc+o54fpwK07ZxHz6vRDQjTpGUDBwSU1kQmt5lc KSW6EZ4Ug1sLQOXJC8ig8Po3JsAcZSyGYyOxl8Ay9lLYoz1KvUmd3dQf8WA+brtk1n2Cg0UoTUfL6H G0vdL+/BURCGxjN4mfawiu9SDXEfB0w41Tc6n+n99l0bVdOWBkKQh+LKVR4vtpqzc0xHg2nssSYev7 J2DgT63/KX00Fl28bk/KRYN1loDSAG
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-at91sam9.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index b7b5ea1a4e67..d54127aba1e9 100644
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
2.35.1

