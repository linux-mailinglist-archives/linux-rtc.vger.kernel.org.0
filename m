Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A2772C332
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jun 2023 13:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjFLLjg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Jun 2023 07:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjFLLix (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Jun 2023 07:38:53 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEBA7EF9
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 04:31:14 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so4939183e87.1
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686569472; x=1689161472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/dhIkHJ/Bd/JpiRxxUt23+FRsEwSHxsnLx/azCSW6k=;
        b=LecpfOFA5R5ROPy2U4qCs9GjXST0XM1loQRP+J1c5EvCrAsd9vg3Ubk1q79K3T7GaL
         BAKxYsX2y3JPonza2iOv7Tk47bT4Po5+hRG4xdRnDdnjxbh728+YOQLt49LjKNpod2dd
         hoqlX3Te6x0E17igFGqYoXS8Sk3zJ8q78VKiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686569472; x=1689161472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/dhIkHJ/Bd/JpiRxxUt23+FRsEwSHxsnLx/azCSW6k=;
        b=YOuX9UeztIQEdqK51/eZn9Fmjy83QsasgsoAXjnEhauYXd7RAb0qUrNM3sacf2AyZK
         MfrHqw98HohuehUrGgPC4UJBnrgyx68bREfJbsmDwZbWfAYbaBSnCeX9SEbB5GvL6CEH
         SimF8m8nM8rxWCI6Fs1mAXaj0/Q3N9rhNBKlDOCYL7GCKSycgSxtUkbvypainfXy7luK
         9ECZkA11rcUSabu+3iD3iQmbsN5s0ffsXy+9K45aT/ub3RXdkNV3JYCmPw86TOyoFS0X
         sfOPqmyMCFW5f934f1An7ZNT5iX5Eux5lEDu2tFK3cEgb65Oosfjrhq3SQyccc5Y5DKU
         fYHw==
X-Gm-Message-State: AC+VfDy+eDL/X6DYF+oP9nfphloGVpWvNG0za8WdYTj5VfueOEMrDOWN
        LR+pdeljkQgzT1d1a4a2iMgn2A==
X-Google-Smtp-Source: ACHHUZ6w5tcUE3ULY1nK4ZqT+0gZwpI40pYe1yZEZMnG7ZSDhAjpuXKbtGJjor8ogsv7s6GC6GbELw==
X-Received: by 2002:a05:6512:548:b0:4f6:4a10:ac4c with SMTP id h8-20020a056512054800b004f64a10ac4cmr3872985lfl.42.1686569472698;
        Mon, 12 Jun 2023 04:31:12 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004edb8fac1cesm1399320lfe.215.2023.06.12.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:31:12 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: rtc: isl12022: add #clock-cells property
Date:   Mon, 12 Jun 2023 13:30:57 +0200
Message-Id: <20230612113059.247275-8-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The isl12022 has a dual-purpose irq/f_out pin, which can either be
used as an interrupt or clock output.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

I've tried to express the fact that the pin can either be used
for interrupts or as a clock source, so that at most one of
"interrupts" and "#clock-cells" can be present, but I don't really
have any idea if this is the proper way to do that.

 .../devicetree/bindings/rtc/intersil,isl12022.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
index 1e85a9c8945b..345abed9234f 100644
--- a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
+++ b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
@@ -19,6 +19,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#clock-cells':
+    const: 0
+
   isil,trip-level85-microvolt:
     description: |
       The battery voltage at which the first alarm should trigger
@@ -35,6 +38,13 @@ required:
   - compatible
   - reg
 
+if:
+  properties:
+    '#clock-cells'
+then:
+  properties:
+    interrupts: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.37.2

