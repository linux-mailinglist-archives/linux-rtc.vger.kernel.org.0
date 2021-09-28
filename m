Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7403041AA4A
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239407AbhI1IFr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:05:47 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:40171 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239292AbhI1IF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id D04DC2B0146A;
        Tue, 28 Sep 2021 04:03:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Sep 2021 04:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ZmdtXINGYmBu0
        2djBJGe6yV9X5UcD5lmaNak5MNd08I=; b=JZAWSpY5DR3fKEo5L8/ypw8/yCJ72
        0nw6jB5jXWkWPDR31YVaDknmmgco2QxTM2E41zcSPBJAuw/JLBvrzE8nxOFDjWUS
        FhubaLh7KVpiV1erSQaGJrQv95IoqdHGFtI4MHxLwk61KqgNjYRwZCw5kcsYPjz7
        VVHw3IZBTDSXJM4LxwUYTmeZxrrflelFwb4YnQ59bOEQEHybjgLiIwUhmywBts7O
        rvEqltCHdTRBtx7URty8XYY3tCjCWYwgR146tPDbpK6fuyL31hvwi708vnKmwDkd
        3E06RBAtEx5h55hoYiSJyeBcPwVpjRGeuV7nnAjThQnDLd9Z1a6eU3HjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ZmdtXINGYmBu02djBJGe6yV9X5UcD5lmaNak5MNd08I=; b=sFvxxMU0
        8v11kLsajcIb5RMViEawFvONQeagxQ5KZAhf44UzTmk3mGTYtNACnO/iGFUPUu7f
        tvkPwFEPPa+SeCnxCACcpPZBJEprELwX5oOWM7DpqBBrUt9WdqnRL8DZGgfwi98w
        S8ILlCDSwzV1um+5iFY8Os7azvNG1r3W6pKYOohFJcS1jx1SIQYmaK+1QidT7uQI
        XmB/k8lZ58mFgEz9wP5n0GxiSewEQNznUkhCavH8yBDYoouJPnjB+FyqDGhiOUY6
        yROi9P2DtUvOBlUSV0fH6HLkdprirCrWFfz24zf8HJzuECaK59NPvSaG6bojCqGS
        TO2oexqIQVDPjA==
X-ME-Sender: <xms:XcxSYY3gz5qlWqpjpzC00O3qr-Yp0T-GBQRxDR3QLlea8Xe2l8lJwQ>
    <xme:XcxSYTFmMz5mGvhTBFubt0EmrUCsb4H_NLs8crHmncA5dkfNJLWAleRax8tRf2YFU
    dLp6xNAuXBHjaoXMg>
X-ME-Received: <xmr:XcxSYQ7hPlRpIkQeBbXg0Ncbev0qI0Pk6DRKN74mlUrgsuD4AtPFjOg4bBmmau59DZ0QgcBaPu95htzls4S7CSPpOIgWkMx7obkl1ywMUVQwPO7YkkiF5ZTG4dLI_UbKoI2KZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:XcxSYR3Twz6KYgfH7kfmC43hcpjyYZUlOFVCRB7RB8XsQ7-j81hgQw>
    <xmx:XcxSYbG1DKrIXMfDT3P4V-c-6tPW_i8FeAcMs_rVMkGlKDCZnhwp7g>
    <xmx:XcxSYa_-uFDCitJQJJORGt_v4YDvx3-eJGv9rO4pKuqwNV9pZfFIoQ>
    <xmx:XcxSYbHcYztqNhzuedIw_ARzx_V98NYdR7EC64xFFjwrj9cYu5IIYWdgnGU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:40 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 2/9] dt-bindings: rtc: sun6i: Add H616, R329, and D1 support
Date:   Tue, 28 Sep 2021 03:03:28 -0500
Message-Id: <20210928080335.36706-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These new RTC variants all have a single alarm, like the R40 variant.

For the new SoCs, start requiring a complete list of input clocks. The
H616 has three required clocks. The R329 also has three required clocks
(but one is different), plus an optional crystal oscillator input. The
D1 RTC is identical to the one in the R329.

And since these new SoCs will have a well-defined output clock order as
well, they do not need the clock-output-names property.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - Properly update the DT binding clocks and clock-names properties.

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 72 ++++++++++++++++++-
 include/dt-bindings/clock/sun6i-rtc.h         | 10 +++
 2 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/clock/sun6i-rtc.h

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index a88d46ffb457..b971510a5ae7 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -24,9 +24,14 @@ properties:
           - allwinner,sun8i-v3-rtc
           - allwinner,sun50i-h5-rtc
           - allwinner,sun50i-h6-rtc
+          - allwinner,sun50i-h616-rtc
+          - allwinner,sun50i-r329-rtc
       - items:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
+      - items:
+          - const: allwinner,sun20i-d1-rtc
+          - const: allwinner,sun50i-r329-rtc
 
   reg:
     maxItems: 1
@@ -38,7 +43,10 @@ properties:
       - description: RTC Alarm 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+
+  clock-names:
+    minItems: 1
 
   clock-output-names:
     minItems: 1
@@ -98,7 +106,66 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-r40-rtc
+            const: allwinner,sun50i-h616-rtc
+
+    then:
+      clocks:
+        minItems: 3
+        maxItems: 3
+        items:
+          - description: Bus clock for register access
+          - description: 24 MHz oscillator
+          - description: 32 kHz clock derived from a PLL
+
+      clock-names:
+        minItems: 3
+        minItems: 3
+        items:
+          - const: bus
+          - const: hosc
+          - const: pll-32k
+
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-r329-rtc
+
+    then:
+      clocks:
+        minItems: 3
+        maxItems: 4
+        items:
+          - description: AHB parent for internal SPI clock
+          - description: Bus clock for register access
+          - description: 24 MHz oscillator
+          - description: External 32768 Hz oscillator
+
+      clock-names:
+        minItems: 3
+        minItems: 4
+        items:
+          - const: ahb
+          - const: bus
+          - const: hosc
+          - const: ext-osc32k
+
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-r40-rtc
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
 
     then:
       properties:
@@ -117,7 +184,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clock-output-names
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
new file mode 100644
index 000000000000..c845493e4d37
--- /dev/null
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SUN6I_RTC_H_
+#define _DT_BINDINGS_CLK_SUN6I_RTC_H_
+
+#define CLK_OSC32K		0
+#define CLK_OSC32K_FANOUT	1
+#define CLK_IOSC		2
+
+#endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */
-- 
2.31.1

