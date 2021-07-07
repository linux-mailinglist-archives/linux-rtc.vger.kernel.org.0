Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769BB3BE378
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 09:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhGGHUI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 03:20:08 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42889 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230327AbhGGHUH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 03:20:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id EB26A5C0143;
        Wed,  7 Jul 2021 03:17:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 07 Jul 2021 03:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=qWSOt0gGfUpBv
        wE5RaWU1tB/jIDs+S806JHTjV04tWw=; b=ndUWsJpNu4iFHFS4xZjv/K0RJftEQ
        Ij3cDV7XxE94hE6PwgtdFk8zSbdMR7LV9+eRLEqSQmSrvgSFgrPG6K4K8IS5FVn0
        Mhp8OepO9crszdlkbC8cei6qjy+q0gTzhqnPywF68SXo3/l+/7sqLm72q/bt4Y8c
        KSX8SCo04yp/dNM/CpIqJRQiYKMVq5rDYHTpq6hhLhpyAfAXd7AJeBEXnrUM9/E3
        YRTjzk1211OiXr+PDIPPWf8DImj0y1rLasz2WqvRBq/j4oVR0xpO/mobzk+7HdLo
        ALxN7Dgo6J+c6vuBggvZYgIoupZmsplkfSTwjE9WSATs8tvQpbdQMwnhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=qWSOt0gGfUpBvwE5RaWU1tB/jIDs+S806JHTjV04tWw=; b=H29aRc7E
        TZck2xW8br1WNNeHD5xPLMTJFjsAUy0+9SR7oVuOoF19E5Co1HTt6fAHF+Tl6PBl
        8BJ59RGZwK4tIfO7Lm9RUzIinFoCWnjHaM8ip6FsimR4IoZYxc0Tzg95J6okCln/
        9eAB5w8rF0VCTk7vT69UXHr1CZpSJbAyYM1AwIgmJJLvUfy1h3U+rUwwcFZKuxun
        bBx4RgKzzWNpcafiryKbBOPknHF78ajypYzqX44IN/vkXTdPbf3dGGZ5I/UI5mtD
        JBcP2P+VZFPwljrudGQgvAYZJwrUTivO+mpPOEtvxvr0p0ZuDjYz2tLKgatVe4+r
        uz6kMK3Xb0uXaQ==
X-ME-Sender: <xms:B1XlYO3Eoaiv6rGpAdxGPqBbCxymTL585c_pOFwoS48AGmynUivX5A>
    <xme:B1XlYBHjP3xA7EgO0l8Chk0sq6saWbDZOSusYp0hGIVNV54RgyCY0dBBrZM4BnTB8
    p1FMohekxzy6F1hhp4>
X-ME-Received: <xmr:B1XlYG5MQVbGLSD8R5ZJ4UwgXj4exj_SKtlpQwnso8mq-cPuOfmiPIx6zauM5dBLmrwCRJcRQy-29IoUQLXhQ-ycMkqhQ5GBPTDzebZLfC_evUsqBQ22d2_RjlKZRr4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpeekleevteelvdduheetgfdvfeelueekffeggeethedtteeljeeivedv
    gfehjeejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:B1XlYP3Kw4L9hwHp-aloR5h0sMXSGCHFVYxAnJrIy-DEX5gr386mXA>
    <xmx:B1XlYBGAPFlRwm_7EPPzmb33xSns83Dm78m2dUtOns7xWSCdidffqQ>
    <xmx:B1XlYI9pZKhG22j_ULnC53vnbgKzg2szA0m3sl8rzVMvW9A0ySRE3w>
    <xmx:B1XlYFhwqzBj638xzwpqumfNSB-feEF4VkcdSzlFEki6H30_UvKkqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 03:17:25 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH 2/2] dt-bindings: rtc: add Epson RX-8025 and RX-8035
Date:   Wed,  7 Jul 2021 07:16:16 +0000
Message-Id: <20210707071616.28976-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210707071616.28976-1-matt@traverse.com.au>
References: <20210707071616.28976-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These are supported by the rtc-rx8025 module. RX-8025
also has support in ds1307 due to compatible time registers.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7548d8714871..13925bb78ec7 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -32,6 +32,9 @@ properties:
       - dallas,ds3232
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8010
+      # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
+      - epson,rx8025
+      - epson,rx8035
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE with Battery Backed RAM
       - epson,rx8571
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-- 
2.30.1

