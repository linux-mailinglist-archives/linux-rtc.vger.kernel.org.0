Return-Path: <linux-rtc+bounces-31-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F77B4D13
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id AB642B20AC5
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BD32117;
	Mon,  2 Oct 2023 08:05:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF31FBC
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370CFD8
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004ne-7B; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-00ATmz-R2; Mon, 02 Oct 2023 10:05:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-007fnb-Hw; Mon, 02 Oct 2023 10:05:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 05/12] rtc: pxa: Mark driver struct with __refdata to prevent section mismatch warning
Date: Mon,  2 Oct 2023 10:05:22 +0200
Message-Id: <20231002080529.2535610-6-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=I/BqfnUXO94th6sX5A/HYUAzCz7RFkuERkYkwhP5u/c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm+/idIGkzKZLEvuuLS+xZvdOFUpX1fg4LUW CLvrUA/eRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5vgAKCRCPgPtYfRL+ Tj28CACcBz+oTRbAIhIm83HAj8uFs97+M52aRBAoanZKgy0M7j9/BXBHvnO7tORr++UWzJWFegx +IB2e9rNBKofr/YkX6HfYoPGvydVTU/jofawgt00QKm9W6hKokSmx5pHIYyl9Z0hX5Rx875IZby 49bPjUnn3Wm8rQ3xd1E7BfrQzDWv9Oy5YIkg2xuXPvyVOQLhReSD4VvWQfpqC0Lty88t4Hi3ukN HACrB2fDln9m05h9m6zPXmaeFYY7OXH4QVBAGRww+cNDJ4cZDdz3Gc6ocQ84YVD+5Jhtbb9I4sP 1o7p26l7rLo5nplf7VS5NMo5cRJqcMimIAKs3Wu6c96WkjWq
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

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent a section mismatch warning.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-pxa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index e400c78252e8..41fe2e20d177 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -403,7 +403,13 @@ static int pxa_rtc_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(pxa_rtc_pm_ops, pxa_rtc_suspend, pxa_rtc_resume);
 
-static struct platform_driver pxa_rtc_driver = {
+/*
+ * pxa_rtc_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver pxa_rtc_driver __refdata = {
 	.remove		= __exit_p(pxa_rtc_remove),
 	.driver		= {
 		.name	= "pxa-rtc",
-- 
2.40.1


