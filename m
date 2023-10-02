Return-Path: <linux-rtc+bounces-30-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864817B4D0C
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8D57B28128A
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A2920F8;
	Mon,  2 Oct 2023 08:05:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D711C01
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E97AC6
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004oP-EZ; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-00ATn3-1D; Mon, 02 Oct 2023 10:05:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-007fnf-OT; Mon, 02 Oct 2023 10:05:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 06/12] rtc: sh: Mark driver struct with __refdata to prevent section mismatch warning
Date: Mon,  2 Oct 2023 10:05:23 +0200
Message-Id: <20231002080529.2535610-7-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xC9km4Thelh5moc+bAWipo74OHEz1GoJuIXzpbIZGT0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm/DRutpKCsd667RNVxAegDOZf3ywVdfJrbX n7OVT3U/lmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5vwAKCRCPgPtYfRL+ TldsB/9hECfHY55kww9s8P4KQ6m7cufzz8QTpwzuvB23qzKE+OYm1LF4EjQqY7wLOTWzGKTA0lN kU2y0IDf4QyB+9W2R2y7f8xELyMXo8zPXDoNJSz4ndQ7WGUmYcQNWEA2frgGlZquhvdPsmgLGjV 2qXv626lxxOKr5NEtohHbO+XfnhH/RCS5T6o/1hI2LAeR23BAdLBKZcvQRH+B4UBFJgqhBtcIcw 1IDpjjplDkMoHg4Z48Q+FoIp3KrXcbxKeioloMLOJfelATZ9YkhX07qjtvCMKolMETMjyoc9OS+ +E2x+dVqy+4RpA6Qy0Y4tmZSNObm+1YwGY699Ad6CtXEf2ms
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
 drivers/rtc/rtc-sh.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index cd146b574143..3f6a5d130690 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -668,7 +668,13 @@ static const struct of_device_id sh_rtc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sh_rtc_of_match);
 
-static struct platform_driver sh_rtc_platform_driver = {
+/*
+ * sh_rtc_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver sh_rtc_platform_driver __refdata = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.pm	= &sh_rtc_pm_ops,
-- 
2.40.1


