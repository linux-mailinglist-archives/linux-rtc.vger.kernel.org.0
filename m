Return-Path: <linux-rtc+bounces-39-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93F7B4D16
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 4C467281A91
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D5C17C3;
	Mon,  2 Oct 2023 08:05:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56101C01
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EA9C4
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-0004qh-6B; Mon, 02 Oct 2023 10:05:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-00ATnH-OV; Mon, 02 Oct 2023 10:05:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-007fnr-FB; Mon, 02 Oct 2023 10:05:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/12] rtc: imxdi: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 10:05:26 +0200
Message-Id: <20231002080529.2535610-10-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/lTHYnYuCzs5PHmDMBqfINbSnZ/bqI7diwUh81m6GoM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnnDXrV1AnB+I6Su4nAXJv+vzozY3Uscw4Y2o BCGVskQFi2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5wwAKCRCPgPtYfRL+ Tnw0B/9+DlzhcpVTJ2eSUltHKxfvAU9CohQjKyt+DRTsZ7HTxFY+RXGsjekJQl0czsBHDb7Qq0L 1AqMc/QAqtxtDbQGehfqlbjciuvHUlu31MAp6Y0br9oVXcrcAGyG2fbfeUNfjMkbtJaVxoCoi8P gErWTa2G+0LNcl6bKFeM1rWkD7SEYNMmK15S9nwh4GjVSBmyTBQUj4JeWcy0OWkk097/vmTvxH7 R++bMjd3f2R3/8WPpKHgr7t8WK7596cA8TItj2hc8UBixgclKI46Ha8TIrweOLokzCrIU6E3HSD HMXlkl/x8rO7V/bQ3dEvxjAOt0+QKxfK+U09H0FyVti2Yyi3
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
 drivers/rtc/rtc-imxdi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index cf202eaa542e..284011c419db 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -830,7 +830,7 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int __exit dryice_rtc_remove(struct platform_device *pdev)
+static void __exit dryice_rtc_remove(struct platform_device *pdev)
 {
 	struct imxdi_dev *imxdi = platform_get_drvdata(pdev);
 
@@ -840,8 +840,6 @@ static int __exit dryice_rtc_remove(struct platform_device *pdev)
 	writel(0, imxdi->ioaddr + DIER);
 
 	clk_disable_unprepare(imxdi->clk);
-
-	return 0;
 }
 
 static const struct of_device_id dryice_dt_ids[] = {
@@ -862,7 +860,7 @@ static struct platform_driver dryice_rtc_driver __refdata = {
 		   .name = "imxdi_rtc",
 		   .of_match_table = dryice_dt_ids,
 		   },
-	.remove = __exit_p(dryice_rtc_remove),
+	.remove_new = __exit_p(dryice_rtc_remove),
 };
 
 module_platform_driver_probe(dryice_rtc_driver, dryice_rtc_probe);
-- 
2.40.1


