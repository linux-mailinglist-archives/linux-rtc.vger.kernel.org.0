Return-Path: <linux-rtc+bounces-35-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2002C7B4D0D
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 461FE1C20832
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A531C01;
	Mon,  2 Oct 2023 08:05:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5B71FDA
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C50DA
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-0004ql-AU; Mon, 02 Oct 2023 10:05:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-00ATnL-U7; Mon, 02 Oct 2023 10:05:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-007fnv-LC; Mon, 02 Oct 2023 10:05:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 10/12] rtc: mv: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 10:05:27 +0200
Message-Id: <20231002080529.2535610-11-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jjAAFoN1btwrDwdP+Y7K5PT6sMrxqSOwWmnts/P5lGo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnnENDAtLizgP+6sr9yvJt8czkpxL2k6fWf2N WyDP0D3g/SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5xAAKCRCPgPtYfRL+ Tg1hB/41epRhAoFzO5yTZTGqqfQasLK/ZqVr1bBqhKr+T5haSgKjCh3F3kPgfesajr+dSRbNV0U fcZnFbDvZCTZf8TBdTsnC1HALmXY5JHw24XXIDT9o95e2rolRgLmsaTSJq8mjLQ5EifaIbwjQHj +q4SGLg4HqkQouN5W7T6f2LW7xcAjkmSAhi1rDzTuvgupFDSzW7szITLNgSpVyPmrEZMzFqqvB7 R6X15D9/x+fIGW75a3ePZcxKRVTiIDqnlC4I19yfQVHofctK6rkDvGPBXRXIo/So2s5IkUfkkYb VoGW9uv89UrLvKdyrTn/cwWVctpOk6El6m3/y9lKn/Of9uT/
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
 drivers/rtc/rtc-mv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index d3c60c5b5897..db31da56bfa7 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -282,7 +282,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __exit mv_rtc_remove(struct platform_device *pdev)
+static void __exit mv_rtc_remove(struct platform_device *pdev)
 {
 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
 
@@ -291,8 +291,6 @@ static int __exit mv_rtc_remove(struct platform_device *pdev)
 
 	if (!IS_ERR(pdata->clk))
 		clk_disable_unprepare(pdata->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -310,7 +308,7 @@ MODULE_DEVICE_TABLE(of, rtc_mv_of_match_table);
  * triggering a section mismatch warning.
  */
 static struct platform_driver mv_rtc_driver __refdata = {
-	.remove		= __exit_p(mv_rtc_remove),
+	.remove_new	= __exit_p(mv_rtc_remove),
 	.driver		= {
 		.name	= "rtc-mv",
 		.of_match_table = of_match_ptr(rtc_mv_of_match_table),
-- 
2.40.1


