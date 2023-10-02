Return-Path: <linux-rtc+bounces-32-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A67B4D12
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id BBE64B20AC9
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA57211C;
	Mon,  2 Oct 2023 08:05:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F531C38
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:05:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBA7C4
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:05:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvq-0004mL-6I; Mon, 02 Oct 2023 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvo-00ATmj-P8; Mon, 02 Oct 2023 10:05:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnDvo-007fn8-FU; Mon, 02 Oct 2023 10:05:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 00/12] rtc: various improvements
Date: Mon,  2 Oct 2023 10:05:17 +0200
Message-Id: <20231002080529.2535610-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RO4+u2xUS25morBKu8xSmwllfFo/DYDv6Fn59913WrI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGnm5Btf/UYlj4t+bvwaIhoZIHWnPxowvWxNuu C6TsFfq0sCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp5uQAKCRCPgPtYfRL+ ThcSB/sEZlrU0C9NQhn9X6GIJtArqP24drPMNSQeeCA2Onpe253B7uIryrmpg9VoEl9Vb6IOp6s rftYG6mFBFC6XtFTl4//qDJgf78qlktObY84Hn70XJGt5maE4FjYPUL1pXqEoz0c9bEnZ5Ce95z 4KqeaEmbLWKEPgnpESD2nCowWwPeQgrO+J4WAoFfhGqumBQaBiClC8DQC4cxNcPHzp+fSS8gbYS 4pf76Rm4H9GeHYuNiNQhIGZBh815tLdhg5mYXUahD4bUu/36g9ATDQM694fvb9RaYEfQkEGXLPR oIB336yr8SRYUAeNaMFxCdCG+uY2E/BQ4rYCxXHqNMoUcb/H
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

Hello,

the section mismatch check will get more strict soon. See
https://lore.kernel.org/linux-kbuild/20230930165204.2478282-1-u.kleine-koenig@pengutronix.de
for the details.

Several rtc drivers that use module_platform_driver_probe() trigger a
warning with the above patch applied. Here they are marked with
__refdata to prevent this warning from triggering.

While touching these drivers I noticed that my coccinelle patch that
converts platform drivers to .remove_new failed to match for drivers
using

	.remove = __exit_p(...),

So I added these preparing patches on top. A separate series would have
been justified, too, but as the patches conflict with each other I kept
them in a single series.

Best regards
Uwe

Uwe Kleine-König (12):
  rtc: imxdi: Soften dependencies for improved compile coverage
  rtc: at91rm9200: Mark driver struct with __refdata to prevent section
    mismatch warning
  rtc: imxdi: Mark driver struct with __refdata to prevent section
    mismatch warning
  rtc: mv: Mark driver struct with __refdata to prevent section mismatch
    warning
  rtc: pxa: Mark driver struct with __refdata to prevent section
    mismatch warning
  rtc: sh: Mark driver struct with __refdata to prevent section mismatch
    warning
  rtc: pcap: Drop no-op remove function
  rtc: at91rm9200: Convert to platform remove callback returning void
  rtc: imxdi: Convert to platform remove callback returning void
  rtc: mv: Convert to platform remove callback returning void
  rtc: pxa: Convert to platform remove callback returning void
  rtc: sh: Convert to platform remove callback returning void

 drivers/rtc/Kconfig          |  2 +-
 drivers/rtc/rtc-at91rm9200.c | 14 +++++++++-----
 drivers/rtc/rtc-imxdi.c      | 14 +++++++++-----
 drivers/rtc/rtc-mv.c         | 14 +++++++++-----
 drivers/rtc/rtc-pcap.c       |  6 ------
 drivers/rtc/rtc-pxa.c        | 13 +++++++++----
 drivers/rtc/rtc-sh.c         | 14 +++++++++-----
 7 files changed, 46 insertions(+), 31 deletions(-)

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.40.1


