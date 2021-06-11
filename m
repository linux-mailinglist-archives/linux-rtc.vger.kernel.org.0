Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7363A42A5
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jun 2021 15:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhFKNDt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Jun 2021 09:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhFKNDt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Jun 2021 09:03:49 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1073C0617AF
        for <linux-rtc@vger.kernel.org>; Fri, 11 Jun 2021 06:01:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by michel.telenet-ops.be with bizsmtp
        id Fp1o2500U25eH3q06p1oj9; Fri, 11 Jun 2021 15:01:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrgnE-00FgBg-Da; Fri, 11 Jun 2021 15:01:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrgnD-00Clw3-Rh; Fri, 11 Jun 2021 15:01:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>, Eric Nelson <eric@nelint.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: rtc: nxp,pcf8563: Absorb pcf85263/pcf85363 bindings
Date:   Fri, 11 Jun 2021 15:01:45 +0200
Message-Id: <e4f48d97f0e16d78a796f02b77ea3a0018904185.1623416431.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The NXP PCF85263/PCF85363 Real Time Clock is very similar to the NXP
PCF8563.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml    |  4 +++-
 .../devicetree/bindings/rtc/pcf85363.txt        | 17 -----------------
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/pcf85363.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
index a542b6c7ff4445b5..a98b72752349fa6b 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
@@ -17,8 +17,10 @@ properties:
     enum:
       - epson,rtc8564
       - microcrystal,rv8564
-      - nxp,pcf8563
       - nxp,pca8565
+      - nxp,pcf8563
+      - nxp,pcf85263
+      - nxp,pcf85363
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
deleted file mode 100644
index 94adc1cf93d9b10b..0000000000000000
--- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-NXP PCF85263/PCF85363 Real Time Clock
-============================
-
-Required properties:
-- compatible: Should contain "nxp,pcf85263" or "nxp,pcf85363".
-- reg: I2C address for chip.
-
-Optional properties:
-- interrupts: IRQ line for the RTC (not implemented).
-
-Example:
-
-pcf85363: pcf85363@51 {
-	compatible = "nxp,pcf85363";
-	reg = <0x51>;
-};
-
-- 
2.25.1

