Return-Path: <linux-rtc+bounces-29-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91127B4D10
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id D6004B20ABB
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1A81FB0;
	Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799E1873
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C449BD
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-0004nI-V8; Mon, 02 Oct 2023 10:05:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-00ATmv-Im; Mon, 02 Oct 2023 10:05:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-007fnX-9g; Mon, 02 Oct 2023 10:05:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 04/12] rtc: mv: Mark driver struct with __refdata to prevent section mismatch warning
Date: Mon,  2 Oct 2023 10:05:21 +0200
Message-Id: <20231002080529.2535610-5-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xAzhtTQd5su+Mue5LoWBU8jNBhZjHfavdbMBedcRZ2k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm9IxzG2lRUUNeNl2YA7bszo7oNW5Aj1FFqr ayaWA7dq3GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5vQAKCRCPgPtYfRL+ Ti3FB/4qv512n8T7h/H+KandjrISvSuULdusQyx5j530ZpaClzk9k1McapO7RmFJaThdDG34BDx HEYbkBf9AvQaGcT0g3JXI45kpgVkD5B9eMvVcyzJpjnHcW+0ZHX9tkKhxamW32NzKQhbdLt30/w TqSJAjkJ/9jRygaGQtuYpsa05sCOhrs4LuXBoWG1bY9/vG1kUo16nfu5BRY4uvcBAEb+9I3Qxl8 fY+BJBVWqOxmhng5dHW/34KOa11MjF/tV6NDaPsB7KLEPOehyef00i0gThvR1o9duR1Vt4p5NgW 6GEHmibgnX+lD4fqDwJ59XRlABEjrOuvdGlKU1PsR5/fJd9O
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
 drivers/rtc/rtc-mv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index 6c526e2ec56d..d3c60c5b5897 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -303,7 +303,13 @@ static const struct of_device_id rtc_mv_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, rtc_mv_of_match_table);
 #endif
 
-static struct platform_driver mv_rtc_driver = {
+/*
+ * mv_rtc_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver mv_rtc_driver __refdata = {
 	.remove		= __exit_p(mv_rtc_remove),
 	.driver		= {
 		.name	= "rtc-mv",
-- 
2.40.1


