Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA466AAA36
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjCDNci (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjCDNci (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B6B20D23
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyN-0000be-7f; Sat, 04 Mar 2023 14:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-001nZ1-4u; Sat, 04 Mar 2023 14:30:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyD-0027GF-AN; Sat, 04 Mar 2023 14:30:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Joshua Kinard <kumba@gentoo.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vincent Shih <vincent.sunplus@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
        kernel@pengutronix.de
Subject: [PATCH 00/41] rtc: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:47 +0100
Message-Id: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5947; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pCaRjKbsihInauNKYog8PJUZGzXfOUbEoxu4a7CE/hA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0dmCZ37vDreXRwIALTBz7LkP9UVbo7kIC2m5 /YcXNXxgQOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHZgAKCRDB/BR4rcrs Cb37B/9X0mwN6W28M9A+kpBV/hix7liXqpKGHjVS5tdrD2imP2auSWPldHmFFosH098N6HNifk7 6+TcL+2KaFszesDc+QQNKeynJwPBzACiIccRP9yGXkasW87KaTMlcX7VErNrSWPE6UGyMlxJOTa a4AOMGRUBQskxMq0U7AbhviH7BTHC6NEZ3ZH1+pbDjh+/VXycM+HsrxMEiMWZvNqXLQpExUobSR JA724JcAIucnmX8DSUbinzkcmmKKgpKV3o2w4NmOqT7ifFL84jMXKcFYHU3Xp3iPDk5USIl1ixA IWXh4m4XPq/JrCh0hIXE1DJGgznkrP8gqXlAkcxQpLw2ESLE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

this patch series adapts the platform drivers below drivers/rtc to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot reasonably
assume any more that there is some kind of cleanup later.

All drivers touched here returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

Note that this series depends on commit 5c5a7680e67b ("platform: Provide a
remove callback that returns no value") that is already in Linus' tree but not
yet included in a tagged version. I guess this will change tomorrow.

Best regards
Uwe

Uwe Kleine-König (41):
  rtc: 88pm80x: Convert to platform remove callback returning void
  rtc: 88pm860x: Convert to platform remove callback returning void
  rtc: ab8500: Convert to platform remove callback returning void
  rtc: ac100: Convert to platform remove callback returning void
  rtc: asm9260: Convert to platform remove callback returning void
  rtc: at91sam9: Convert to platform remove callback returning void
  rtc: brcmstb-waketimer: Convert to platform remove callback returning void
  rtc: cadence: Convert to platform remove callback returning void
  rtc: cmos: Convert to platform remove callback returning void
  rtc: cros-ec: Convert to platform remove callback returning void
  rtc: ds1685: Convert to platform remove callback returning void
  rtc: ftrtc010: Convert to platform remove callback returning void
  rtc: hid-sensor-time: Convert to platform remove callback returning void
  rtc: lpc24xx: Convert to platform remove callback returning void
  rtc: max77686: Convert to platform remove callback returning void
  rtc: mc13xxx: Convert to platform remove callback returning void
  rtc: mpc5121: Convert to platform remove callback returning void
  rtc: mpfs: Convert to platform remove callback returning void
  rtc: mt7622: Convert to platform remove callback returning void
  rtc: mxc_v2: Convert to platform remove callback returning void
  rtc: omap: Convert to platform remove callback returning void
  rtc: palmas: Convert to platform remove callback returning void
  rtc: pcf50633: Convert to platform remove callback returning void
  rtc: pic32: Convert to platform remove callback returning void
  rtc: pm8xxx: Convert to platform remove callback returning void
  rtc: rc5t583: Convert to platform remove callback returning void
  rtc: rtd119x: Convert to platform remove callback returning void
  rtc: rzn1: Convert to platform remove callback returning void
  rtc: s3c: Convert to platform remove callback returning void
  rtc: sa1100: Convert to platform remove callback returning void
  rtc: spear: Convert to platform remove callback returning void
  rtc: stm32: Convert to platform remove callback returning void
  rtc: stmp3xxx: Convert to platform remove callback returning void
  rtc: sunplus: Convert to platform remove callback returning void
  rtc: tegra: Convert to platform remove callback returning void
  rtc: tps6586x: Convert to platform remove callback returning void
  rtc: twl: Convert to platform remove callback returning void
  rtc: vt8500: Convert to platform remove callback returning void
  rtc: wm8350: Convert to platform remove callback returning void
  rtc: xgene: Convert to platform remove callback returning void
  rtc: zynqmp: Convert to platform remove callback returning void

 drivers/rtc/rtc-88pm80x.c           | 5 ++---
 drivers/rtc/rtc-88pm860x.c          | 6 ++----
 drivers/rtc/rtc-ab8500.c            | 6 ++----
 drivers/rtc/rtc-ac100.c             | 6 ++----
 drivers/rtc/rtc-asm9260.c           | 5 ++---
 drivers/rtc/rtc-at91sam9.c          | 6 ++----
 drivers/rtc/rtc-brcmstb-waketimer.c | 6 ++----
 drivers/rtc/rtc-cadence.c           | 6 ++----
 drivers/rtc/rtc-cmos.c              | 5 ++---
 drivers/rtc/rtc-cros-ec.c           | 6 ++----
 drivers/rtc/rtc-ds1685.c            | 6 ++----
 drivers/rtc/rtc-ftrtc010.c          | 6 ++----
 drivers/rtc/rtc-hid-sensor-time.c   | 6 ++----
 drivers/rtc/rtc-lpc24xx.c           | 6 ++----
 drivers/rtc/rtc-max77686.c          | 6 ++----
 drivers/rtc/rtc-mc13xxx.c           | 6 ++----
 drivers/rtc/rtc-mpc5121.c           | 6 ++----
 drivers/rtc/rtc-mpfs.c              | 6 ++----
 drivers/rtc/rtc-mt7622.c            | 6 ++----
 drivers/rtc/rtc-mxc_v2.c            | 5 ++---
 drivers/rtc/rtc-omap.c              | 6 ++----
 drivers/rtc/rtc-palmas.c            | 5 ++---
 drivers/rtc/rtc-pcf50633.c          | 6 ++----
 drivers/rtc/rtc-pic32.c             | 6 ++----
 drivers/rtc/rtc-pm8xxx.c            | 5 ++---
 drivers/rtc/rtc-rc5t583.c           | 5 ++---
 drivers/rtc/rtc-rtd119x.c           | 6 ++----
 drivers/rtc/rtc-rzn1.c              | 6 ++----
 drivers/rtc/rtc-s3c.c               | 6 ++----
 drivers/rtc/rtc-sa1100.c            | 6 ++----
 drivers/rtc/rtc-spear.c             | 6 ++----
 drivers/rtc/rtc-stm32.c             | 6 ++----
 drivers/rtc/rtc-stmp3xxx.c          | 8 +++-----
 drivers/rtc/rtc-sunplus.c           | 6 ++----
 drivers/rtc/rtc-tegra.c             | 6 ++----
 drivers/rtc/rtc-tps6586x.c          | 5 ++---
 drivers/rtc/rtc-twl.c               | 6 ++----
 drivers/rtc/rtc-vt8500.c            | 6 ++----
 drivers/rtc/rtc-wm8350.c            | 6 ++----
 drivers/rtc/rtc-xgene.c             | 5 ++---
 drivers/rtc/rtc-zynqmp.c            | 6 ++----
 41 files changed, 83 insertions(+), 156 deletions(-)

base-commit: 0988a0ea791999ebbf95693f2676381825b05033
-- 
2.39.1

