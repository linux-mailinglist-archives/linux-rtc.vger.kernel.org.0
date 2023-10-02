Return-Path: <linux-rtc+bounces-33-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360057B4D0F
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 95779281127
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D01017C3;
	Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE81C2F
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7BCC9
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004pv-N4; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-00ATn9-A2; Mon, 02 Oct 2023 10:05:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-007fnj-0m; Mon, 02 Oct 2023 10:05:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 07/12] rtc: pcap: Drop no-op remove function
Date: Mon,  2 Oct 2023 10:05:24 +0200
Message-Id: <20231002080529.2535610-8-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TNDoO3C+VH4vQQmYi4YDDPHgfDtzrqx/TOZBMYyNcmo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnnBV82cEURZN4diI+0M7doJfgn9ExjXvTBYF PXkwpUwh1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5wQAKCRCPgPtYfRL+ TvlQB/4+RwieLPCxw51im/9xqOaIN77AwmvFSWc2wXa1VTHfsukUhAYmnJ64wVUbHptuu70AjyG hJxTbkV5IOFqf0hWsyKHifY2R0/6pDYWGLxsDazThP3BTNln0qeSUFrxlPawFONAchkFqg+zEgd Y2HxGvfyUTAn+KHkpl3JRvlnoRknyYcN5U6+u4+DM83SBqIcLehLVBqaZs+pyBKHXAluyghoTu3 fEYJ9IOIHJgA7ubovDEvCpvDsU2HAJ6OAtsjRf2vReNWNZUkEiBZRp2oy8CVj/DY1GVpEcg1Uya zcIsaW4+itP45jXEt3IfwN6sYcrJME+bdkDY5xmpQwuLdc8w
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

A remove callback that just returns 0 is equivalent to no callback at
all as can be seen in platform_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-pcap.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
index 8c7a98a5452c..d6651611a0c6 100644
--- a/drivers/rtc/rtc-pcap.c
+++ b/drivers/rtc/rtc-pcap.c
@@ -166,13 +166,7 @@ static int __init pcap_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(pcap_rtc->rtc);
 }
 
-static int __exit pcap_rtc_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver pcap_rtc_driver = {
-	.remove = __exit_p(pcap_rtc_remove),
 	.driver = {
 		.name  = "pcap-rtc",
 	},
-- 
2.40.1


