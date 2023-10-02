Return-Path: <linux-rtc+bounces-40-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EA7B4D17
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6B534281AD9
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA191873;
	Mon,  2 Oct 2023 08:05:47 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7A1FDA
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8C7BF
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004q7-US; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-00ATnD-HC; Mon, 02 Oct 2023 10:05:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-007fnn-7v; Mon, 02 Oct 2023 10:05:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 08/12] rtc: at91rm9200: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 10:05:25 +0200
Message-Id: <20231002080529.2535610-9-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DKkHPxkQm9qEEsCyqbnlOc9/FsLh7d26A39v+Wl1Q7c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnnC7RYT9kXgUhny1Udm3bOr0BZAxie5OwST/ RNTnYfckl+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5wgAKCRCPgPtYfRL+ TljPCACw/DGvCHMECECLK+wsDozZCvlpXdl/ADwbm2HdtpHh4G2okzaXmES7dEGAdFnIWna9y2G x4q2rQOpQqwtEE8kVGJag9/BIuO2jPniczJQ75T825EYP2MJ4yETZvsHQZvWFpDTJcSM2of64HH 3Cy9JFeHjVALjzl5/r22gG7UEw0Ic7g5nUZYNYJIJw2miFtxTM1yuK2YZIA8DxW7LGRxhd4LFbv IMTp5uEQ9MGjB62hETe3c78j+yS4my9eOaZcEaQAKHA9iy5SQvLlMNuLO8TlkP0xDO6xWc0Ex28 nGRJhZb+bA09dPCcKH8nzRaIZgmLYUuAargoTYf9Bntcn0tW
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
 drivers/rtc/rtc-at91rm9200.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index 5cf54febcc40..3f5ff9867c02 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -558,7 +558,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 /*
  * Disable and remove the RTC driver
  */
-static int __exit at91_rtc_remove(struct platform_device *pdev)
+static void at91_rtc_remove(struct platform_device *pdev)
 {
 	/* Disable all interrupts */
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
@@ -566,8 +566,6 @@ static int __exit at91_rtc_remove(struct platform_device *pdev)
 					AT91_RTC_CALEV);
 
 	clk_disable_unprepare(sclk);
-
-	return 0;
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
@@ -642,7 +640,7 @@ static SIMPLE_DEV_PM_OPS(at91_rtc_pm_ops, at91_rtc_suspend, at91_rtc_resume);
  * triggering a section mismatch warning.
  */
 static struct platform_driver at91_rtc_driver __refdata = {
-	.remove		= __exit_p(at91_rtc_remove),
+	.remove_new	= __exit_p(at91_rtc_remove),
 	.shutdown	= at91_rtc_shutdown,
 	.driver		= {
 		.name	= "at91_rtc",
-- 
2.40.1


