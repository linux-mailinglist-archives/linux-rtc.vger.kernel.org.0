Return-Path: <linux-rtc+bounces-34-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 231307B4D0E
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 041811C20828
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8428C1873;
	Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EC1FC6
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10D3D9
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-0004r5-Ih; Mon, 02 Oct 2023 10:05:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvr-00ATnP-3y; Mon, 02 Oct 2023 10:05:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-007fny-R5; Mon, 02 Oct 2023 10:05:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 11/12] rtc: pxa: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 10:05:28 +0200
Message-Id: <20231002080529.2535610-12-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/vrOQ0mB+ksi0TGfXpbcO1rn0tzg0u6o846ozf1E8j0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSpyqN2pwTcHk94FZclxlwlz2Zwgfc4h6x5zbsT/9wtF CX3XbjQyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBETvKz/w+pfip8kNFFtmXN x7cmOQFredNfiy5eZXNq0a1XGpOWP86ROFBY8PKXdcpCw1vMO2pmec1KWeETWFPy/sDbtNKFTYl Zk1bxnG36KljS0nS4X8fOq0NcSCp9ctp0Z2Ydf60z8ZZnWgWstDW2zfU+Hmcwc3/e5++BN/6YFc 7sqNCe2GnnEyXX311RwcH142a824cmhk/lpy0uHP0nzS6bN6u8rH7X7OxIv9ctPKcsJx5gcWnOu ytzTqX14b6VAnEBglPULx9Ib+PSqC5xWZyz4svMcPGzKyZNLuPlzHtbwbeYeVGNREGYQtV0L189 hiMGGyf69+x98NHepl+l2OzfqRXWElMbRHffWj/Rp2IjAA==
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
 drivers/rtc/rtc-pxa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index 41fe2e20d177..cdb39fc4cab5 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -365,12 +365,11 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit pxa_rtc_remove(struct platform_device *pdev)
+static void __exit pxa_rtc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	pxa_rtc_release(dev);
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -410,7 +409,7 @@ static SIMPLE_DEV_PM_OPS(pxa_rtc_pm_ops, pxa_rtc_suspend, pxa_rtc_resume);
  * triggering a section mismatch warning.
  */
 static struct platform_driver pxa_rtc_driver __refdata = {
-	.remove		= __exit_p(pxa_rtc_remove),
+	.remove_new	= __exit_p(pxa_rtc_remove),
 	.driver		= {
 		.name	= "pxa-rtc",
 		.of_match_table = of_match_ptr(pxa_rtc_dt_ids),
-- 
2.40.1


