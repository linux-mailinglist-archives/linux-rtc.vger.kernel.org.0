Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CF041AA56
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 10:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhI1IGF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 04:06:05 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:52695 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239299AbhI1IF3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 04:05:29 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 69A2F2B01457;
        Tue, 28 Sep 2021 04:03:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 28 Sep 2021 04:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=JytbvXDUrvEuY
        lSDKA4dbMchRQzLLS6KYGETkodTZPc=; b=FT0ljHoZpM6nJZmt6+oyBK9M0U/3Q
        pTDqmDUACY0BPyjsoVqJ8f5eMB1GK51GJHH08twrWi6xxFXz6J01hluEtLvsb14g
        xRenKXuiBdirVrUtAYvaMGeJdd6LgJIOQ8DKt0Hc4f4oglnJLPU7coIIfELv42xH
        grgTxvU0wWRtmMIaN/+EjNjIuQrisEnQbBZDYtLmaj1BJyhIQMrQzfViXJugnwMq
        Z32+pDOMZL6pLg/HvyJmBVkWZn7SIrtbZ8DFhNoSSgGIpEP5UEV9Pr4FOKOXH9UF
        XKWBX41/yifxTfiRUw38vd0UVxT69nifj8+JTIFtctmzSSPJuPeMr0vhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=JytbvXDUrvEuYlSDKA4dbMchRQzLLS6KYGETkodTZPc=; b=fIwBZgg+
        np7Y3NzI51tpWPUw/dCs0GgHLglg+7A1sHDn5i1QBNH5B/Gn/HoYm4Xc+VPS6Oc2
        xGIXZYEavbN+nwQPX5peLANGO7I/4jwvAvdGWH6hrrqoR/3rE7laSvSmiKxsGnUr
        +0KqNFnGje4qCngnrY/MWN9bVOJdm+WLeXxIU8WOV5oVSuixt1TFippg+8wZxZJW
        wBRipGDJ/YEPxZVLYHdnu8QMsXYawsDjkD+3ZeW/4HzQklAeKfU3HttUqY6Qlh0B
        lXkgJqzqSiDGQDen/hteNZnpnksazGbGl7c4OGLqYIxLVMgn0AZyv8OewaGztdWD
        uF0KFZWGx9MEVg==
X-ME-Sender: <xms:WsxSYUhZlnOVTrQojAUnPQzXbWh9pktMM4_xZ59DJQBWFOoecCRtLg>
    <xme:WsxSYdDPkFEDUmiVUz-YL46gwefUuKILw_r_NL9-Xow6BZHNOJtlhL3jOS6s0KrF6
    5HeUUzsZlK9vMxVNg>
X-ME-Received: <xmr:WsxSYcGzfcBdt5zFs2aqEIVY5enPuJW_sGgbzIUoyAMuI6rCzNEmRUn62mDTWIMI3HE1UG7E79jz4nN8XAiv6QNX5orjOEEh7OpYm4oqzuz9fslbX88Ei_MLGyFSbL291JK5zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheej
    vdfgjeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WsxSYVRb1D0i2qDji6AxYHF16z7Av4vpcR7FMfLRWJM2lA4eT0xBvA>
    <xmx:WsxSYRwfLGNqgTPM8WsfStOfkbhX3CBNC7R0TJQVlJrri3G4frVLMQ>
    <xmx:WsxSYT4Dc1SIdInf-oe-YV8cFN4AII4kjk-AqlOn9l9xVGQFCcc3tA>
    <xmx:W8xSYRjJbz0ZWjrD9CIvxmMZNfgbvriZBrovZEJIfZF_3R8DwrpzNguJibo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:03:38 -0400 (EDT)
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
Subject: [PATCH v2 1/9] dt-bindings: rtc: sun6i: Clean up repetition
Date:   Tue, 28 Sep 2021 03:03:27 -0500
Message-Id: <20210928080335.36706-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-1-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

- Use "enum" for compatibles instead of several "const" alternatives.
- Merge the H6 clock-output-names minItems/maxItems constraint into the
  identical block above.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes since v1:
  - New patch.

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 28 ++++++-------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index beeb90e55727..a88d46ffb457 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -16,16 +16,17 @@ properties:
 
   compatible:
     oneOf:
-      - const: allwinner,sun6i-a31-rtc
-      - const: allwinner,sun8i-a23-rtc
-      - const: allwinner,sun8i-h3-rtc
-      - const: allwinner,sun8i-r40-rtc
-      - const: allwinner,sun8i-v3-rtc
-      - const: allwinner,sun50i-h5-rtc
+      - enum:
+          - allwinner,sun6i-a31-rtc
+          - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-h3-rtc
+          - allwinner,sun8i-r40-rtc
+          - allwinner,sun8i-v3-rtc
+          - allwinner,sun50i-h5-rtc
+          - allwinner,sun50i-h6-rtc
       - items:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
-      - const: allwinner,sun50i-h6-rtc
 
   reg:
     maxItems: 1
@@ -85,18 +86,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-rtc
               - allwinner,sun50i-h5-rtc
-
-    then:
-      properties:
-        clock-output-names:
-          minItems: 3
-          maxItems: 3
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: allwinner,sun50i-h6-rtc
+              - allwinner,sun50i-h6-rtc
 
     then:
       properties:
-- 
2.31.1

