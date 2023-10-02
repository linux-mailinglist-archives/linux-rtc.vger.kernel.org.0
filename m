Return-Path: <linux-rtc+bounces-38-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C237B4D15
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 18B2B2815CE
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC7823B1;
	Mon,  2 Oct 2023 08:05:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56401C38
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360F9BD
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004nB-6Q; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-00ATms-CV; Mon, 02 Oct 2023 10:05:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-007fnT-3F; Mon, 02 Oct 2023 10:05:33 +0200
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
Subject: [PATCH 03/12] rtc: imxdi: Mark driver struct with __refdata to prevent section mismatch warning
Date: Mon,  2 Oct 2023 10:05:20 +0200
Message-Id: <20231002080529.2535610-4-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hD7jtxIz4alpV1vV/HRF01zg76WPg+ELREmBkpQS4LQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm8MFbH/zYfW1fw+12Q/4GGGqnVhuqA5bO9x m62ioH65oaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5vAAKCRCPgPtYfRL+ ThuPB/4/GKuG8iiZaMg4jZSywmpCnm69/vyxSEo91QbcpKXoUdKl9tEI4irOZ2tkX7A0MG5ek9q O2Yrk8FRH1FjYFA0J5CtwBbHmJGU13lxIsKhGqKwHn+zw8wGggTfWnjRqGfzv1ZlG3QS7Ftg29z dU3iSo9DbCZojt/k9SVhaB8t9svhTq7hmJRxSe59tI7LoDyrF9FJgp08XrxJVoY68/ZwlfA/K7y 557GhoJ+KSGBmWKTWvRBHBH6PihLswkUifX/r0lDd7EdVtpZZm3+F7h2Wby3TxbiVF+48GS1ePX DKfzZdLntjhRySiYMnYaGAxkziugqYQFwwwjFObPfhi3KPf2
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
 drivers/rtc/rtc-imxdi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 4b712e5ab08a..cf202eaa542e 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -851,7 +851,13 @@ static const struct of_device_id dryice_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, dryice_dt_ids);
 
-static struct platform_driver dryice_rtc_driver = {
+/*
+ * dryice_rtc_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver dryice_rtc_driver __refdata = {
 	.driver = {
 		   .name = "imxdi_rtc",
 		   .of_match_table = dryice_dt_ids,
-- 
2.40.1


