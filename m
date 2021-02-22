Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B85E321DD2
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 18:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhBVRNy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 12:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhBVRNr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Feb 2021 12:13:47 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D250CC061786;
        Mon, 22 Feb 2021 09:13:06 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id C6C1F1F451E7
Received: by jupiter.universe (Postfix, from userid 1000)
        id 57D6C4800DE; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
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
Subject: [PATCHv1 4/6] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Date:   Mon, 22 Feb 2021 18:12:45 +0100
Message-Id: <20210222171247.97609-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222171247.97609-1-sebastian.reichel@collabora.com>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Document the compatible for GE B1x5pv2 boards.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 34000f7fbe02..dd2b566314a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -393,6 +393,17 @@ properties:
           - const: armadeus,imx6dl-apf6         # APF6 (Solo) SoM
           - const: fsl,imx6dl
 
+      - description: i.MX6DL based congatec QMX6 Boards
+        items:
+          - enum:
+              - ge,imx6dl-b105v2          # General Electric B105v2
+              - ge,imx6dl-b105pv2         # General Electric B105Pv2
+              - ge,imx6dl-b125v2          # General Electric B125v2
+              - ge,imx6dl-b125pv2         # General Electric B125Pv2
+              - ge,imx6dl-b155v2          # General Electric B155v2
+          - const: congatec,qmx6
+          - const: fsl,imx6dl
+
       - description: i.MX6DL based DFI FS700-M60-6DL Board
         items:
           - const: dfi,fs700-m60-6dl
-- 
2.30.0

