Return-Path: <linux-rtc+bounces-36-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B07B4D11
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6EBC32815DE
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B451873;
	Mon,  2 Oct 2023 08:05:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2520EC
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928BDBF
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-0004sZ-T4; Mon, 02 Oct 2023 10:05:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-00ATnT-Af; Mon, 02 Oct 2023 10:05:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-007fo3-1c; Mon, 02 Oct 2023 10:05:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 12/12] rtc: sh: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 10:05:29 +0200
Message-Id: <20231002080529.2535610-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002080529.2535610-1-u.kleine-koenig@pengutronix.de>
References: <20231002080529.2535610-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EXgSkZpYj04n/OGQA8Z2ffxLFiTkCLL5yqr1BYZYAKM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSpymP9yQW2f5MUpv66yBlUe0F+5dLWnTGZP+5krH2+I 2/rMZ+7nYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBM5JAF+x/Ouid7dI/7fma7 7S09x4tnW4+idnd8Dts2h2NRn2QvnZXeEy4Syhz6xdBuy7PYjGfc0/hbLMq5Sjdzb1iZNXmGfMC 2ymmdHHlRtelRVoZr1yp9TLDruXizr/Lylplq5e0HhYS1fLKCJ5U49m7vWMagLSS/598CzTvL59 2fr1D/rc7tn9KCji1Nv7Mfah7kklW5vz7CstNFxmbNmWbRwo1rDqzVNLMwyvJdp6T95f+asGC5u T/Cu+az/JouNUkzaavbVEslnxvLszdPZ7ViO25v8X7NqWNdJz0PSQvPcl7dySp8+kN6nvfZOeYP Rds6W2TknW11kkNNi5rVDaTKFk4W+bKH26n0S+jKzWFPAQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-sh.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 3f6a5d130690..15020266c41f 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -620,7 +620,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __exit sh_rtc_remove(struct platform_device *pdev)
+static void __exit sh_rtc_remove(struct platform_device *pdev)
 {
 	struct sh_rtc *rtc = platform_get_drvdata(pdev);
 
@@ -628,8 +628,6 @@ static int __exit sh_rtc_remove(struct platform_device *pdev)
 	sh_rtc_setcie(&pdev->dev, 0);
 
 	clk_disable(rtc->clk);
-
-	return 0;
 }
 
 static void sh_rtc_set_irq_wake(struct device *dev, int enabled)
@@ -680,7 +678,7 @@ static struct platform_driver sh_rtc_platform_driver __refdata = {
 		.pm	= &sh_rtc_pm_ops,
 		.of_match_table = sh_rtc_of_match,
 	},
-	.remove		= __exit_p(sh_rtc_remove),
+	.remove_new	= __exit_p(sh_rtc_remove),
 };
 
 module_platform_driver_probe(sh_rtc_platform_driver, sh_rtc_probe);
-- 
2.40.1


