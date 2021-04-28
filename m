Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067C836E1B8
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 01:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbhD1Wan (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 18:30:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51378 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235751AbhD1Wam (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 18:30:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id B5C2F1F42CA7
Received: by jupiter.universe (Postfix, from userid 1000)
        id B1DF34800C8; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
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
        Saravana Kannan <saravanak@google.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        kernel@collabora.com
Subject: [PATCHv2 4/5] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Date:   Thu, 29 Apr 2021 00:29:52 +0200
Message-Id: <20210428222953.235280-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
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
index e3c50f231d71..6e5b14c75325 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -400,6 +400,17 @@ properties:
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
2.30.2

