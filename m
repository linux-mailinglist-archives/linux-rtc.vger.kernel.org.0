Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E001D9153
	for <lists+linux-rtc@lfdr.de>; Tue, 19 May 2020 09:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgESHt6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 May 2020 03:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgESHt6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 May 2020 03:49:58 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE741C05BD0A
        for <linux-rtc@vger.kernel.org>; Tue, 19 May 2020 00:49:57 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by michel.telenet-ops.be with bizsmtp
        id gXpu2200Y4CPMDc06XpuSk; Tue, 19 May 2020 09:49:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax0c-0008UA-OA; Tue, 19 May 2020 09:49:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jax0c-0006L9-LZ; Tue, 19 May 2020 09:49:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: rtc: rtc-sh: Add missing power-domains property
Date:   Tue, 19 May 2020 09:49:53 +0200
Message-Id: <20200519074953.24328-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r7s72100-rskrza1.dt.yaml: rtc@fcff1000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

Fix this by documenting the missing power-domains property.
Update the example to match reality.

Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
Fixes: 7ae8b2f5dfb357f0 ("dt-bindings: rtc: rtc-sh: convert bindings to json-schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
index b95cb017f469613e..eff9df4b856ac8c2 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
@@ -43,6 +43,9 @@ properties:
     items:
       enum: [ fck, rtc_x1, rtc_x3, extal ]
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -50,6 +53,7 @@ required:
   - interrupt-names
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -68,5 +72,6 @@ examples:
         interrupt-names = "alarm", "period", "carry";
         clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
                  <&rtc_x3_clk>, <&extal_clk>;
+        power-domains = <&cpg_clocks>;
         clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
     };
-- 
2.17.1

