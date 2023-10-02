Return-Path: <linux-rtc+bounces-28-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888F7B4D0B
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9A963280DEE
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6261FA6;
	Mon,  2 Oct 2023 08:05:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79517C3
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A301BC
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvp-0004mS-Ft; Mon, 02 Oct 2023 10:05:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvo-00ATmm-Uh; Mon, 02 Oct 2023 10:05:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvo-007fnB-La; Mon, 02 Oct 2023 10:05:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 01/12] rtc: imxdi: Soften dependencies for improved compile coverage
Date: Mon,  2 Oct 2023 10:05:18 +0200
Message-Id: <20231002080529.2535610-2-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=XNX35rR3pXajObiBQok7ubcQinMd50VsdtHxQfqy9hk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm6iWx3UtSqDd+eBrma0123jgs09o2xUGqr4 6Wt00PEdBeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5ugAKCRCPgPtYfRL+ TiXoB/9RZQ2XUUwSNcJLAWjktURPdGuJ2m6iaEjv6rHgU2dCes0dhSov+l6rDNTlMIjujKOG7ji ZDIXd9l9/7Ys3I71kZXp9Hu0tUwz3bI8r6NA5Lu3ypnfhzpv7Y1IP0F+ff0aFT3xtt4TZjrp4+j L/AvyqSypPFUMKnJYiWbyhLox9hAz84mo60oUS42W3tSvpe28R0YGMYwNse5CMT9YIv5jrBLez4 fXBlHdsegmla17ORtecEdIMhR6gWsku26JsKboGh5TH6KqUYhVF5H4yaqkJQ4y9a76oR5ZbZyE/ +RgI4UUjEdHfH6ulu5f2uUnZ10FY7Olk/gL2j+wvv8TnCkuX
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

The driver compiles fine on x86_64, so soften the dependencies to
ARCH_MXC || COMPILE_TEST.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index d7502433c78a..f92644a10c7d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1351,7 +1351,7 @@ config RTC_DRV_DIGICOLOR
 
 config RTC_DRV_IMXDI
 	tristate "Freescale IMX DryIce Real Time Clock"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on OF
 	help
 	   Support for Freescale IMX DryIce RTC
-- 
2.40.1


