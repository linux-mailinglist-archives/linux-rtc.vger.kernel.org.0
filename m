Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302D270B9DA
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 12:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbjEVKTd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 06:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjEVKTZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 06:19:25 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C942F1A1;
        Mon, 22 May 2023 03:19:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163778330"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:19:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BE8084000AAA;
        Mon, 22 May 2023 19:19:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 03/11] dt-bindings: rtc: isil,isl1208: Document clock and clock-names properties
Date:   Mon, 22 May 2023 11:18:41 +0100
Message-Id: <20230522101849.297499-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As per the HW manual, XTOSCB bit setting is as follows

If using an external clock signal, set the XTOSCB bit as 1 to
disable the crystal oscillator.

If using an external crystal, the XTOSCB bit needs to be set at 0
to enable the crystal oscillator.

Document clock and clock-names properties.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4->v5:
 * Replaced oneOf->enum for clock-names as it is simpler.
 * Added Rb tag from Conor.
v4:
 * New patch
---
 .../devicetree/bindings/rtc/isil,isl1208.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
index 565965147ce6..11f7378d4997 100644
--- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
+++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
@@ -25,6 +25,17 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: |
+      Use xin, if connected to an external crystal.
+      Use clkin, if connected to an external clock signal.
+    enum:
+      - xin
+      - clkin
+
   interrupts:
     minItems: 1
     maxItems: 2
-- 
2.25.1

