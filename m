Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968B4321DD5
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 18:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhBVROC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 12:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbhBVRNr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Feb 2021 12:13:47 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84253C06178B;
        Mon, 22 Feb 2021 09:13:07 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 6A6A01F451F7
Received: by jupiter.universe (Postfix, from userid 1000)
        id 5B0D84800DF; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        kernel@collabora.com
Subject: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
Date:   Mon, 22 Feb 2021 18:12:46 +0100
Message-Id: <20210222171247.97609-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222171247.97609-1-sebastian.reichel@collabora.com>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The binding is already used by the driver. Update documentation
accordingly.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index f03be904d3c2..40e626e82ed0 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -31,6 +31,7 @@ Required properties:
                  s25sl12801
                  s25fl008k
                  s25fl064k
+                 sst25vf032b
                  sst25vf040b
                  m25p40
                  m25p80
-- 
2.30.0

