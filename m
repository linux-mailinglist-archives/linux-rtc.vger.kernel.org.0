Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17B97315E8
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jun 2023 12:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343806AbjFOK6y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Jun 2023 06:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343774AbjFOK6m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Jun 2023 06:58:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009E42135
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso794843e87.1
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686826717; x=1689418717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfopBjHrRqDySJuSAMCUvhXmj8ZxffTN4Fp5DsieY7A=;
        b=Lz6b6vSFV436npcr01hqfn/fSPQ3iCiWMoVTbEZAZeaDjmqE5NJUwJofa1Mqm0ORzg
         IyzgJkRfQEkALXUjUiCeKMY3E/6lAZqVq0T+ta77WY2h/GVPUdggQ6vemrz3VanJr10E
         dAfiyEgfami0fJahzDv9md1i7sRI5xr3dysBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686826717; x=1689418717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfopBjHrRqDySJuSAMCUvhXmj8ZxffTN4Fp5DsieY7A=;
        b=QJ0+/CY/XUYxlK5PWlHnVtxsWvIjCUi2v9m75Q8wY3ehFyL6A5kRVXCpz2dNjgqaBZ
         bPtYRLcbWD7OZ7asEF74yQwZFXZmMZNJuUMcsBqst4KcQbAUbFFUTu7YX+BBqjEo+YdW
         WYV8as+YMFpjK/f1g217g+NYUoAtu1GX3AV2uJ3OUgrWmpxZ2CeZcnMhwtcLc887DDOe
         tVtuCzozUBF0CfTZuutsPcjolG1Xm21N5gMRwIZpp9sqACIYabU/s/NOW+G6AFAHnPAA
         jZsOkSMPe5l8tm5gxo9mnxVmOGj77gY5bRZ3cdT5JJTmIv9EI78OEhaTRklJ3Hwo96kK
         zz6Q==
X-Gm-Message-State: AC+VfDz/tva6e7JHZgDYYCQ28zyQ+KcsTZNnYMPlU6u8IVyJyGLHuX/F
        IIJ7SYt3zyEbPQGHvdY5lM3yYA==
X-Google-Smtp-Source: ACHHUZ7IkH/iPRuaojwiROlR5IplUqvPDIVOTVziRavD7wWfI4f+xvSDjHul6Uwh8je0aBQ193us0A==
X-Received: by 2002:a05:6512:46d:b0:4f1:2ebf:536f with SMTP id x13-20020a056512046d00b004f12ebf536fmr1457824lfd.16.1686826717359;
        Thu, 15 Jun 2023 03:58:37 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm165364lfp.186.2023.06.15.03.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:58:37 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] dt-bindings: rtc: isl12022: add bindings for battery alarm trip levels
Date:   Thu, 15 Jun 2023 12:58:21 +0200
Message-Id: <20230615105826.411953-4-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230615105826.411953-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-1-linux@rasmusvillemoes.dk>
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

The isl12022 has a built-in support for monitoring the voltage of the
backup battery, and setting bits in the status register when that
voltage drops below two predetermined levels (usually 85% and 75% of
the nominal voltage). However, since it can operate at wide range of
battery voltages (2.5V - 5.5V), one must configure those trip levels
according to which battery is used on a given board.

Add bindings for defining these two trip levels. While the register
and bit names suggest that they should correspond to 85% and 75% of
the nominal battery voltage, the data sheet also says

  There are total of 7 levels that could be selected for the first
  alarm. Any of the of levels could be selected as the first alarm
  with no reference as to nominal Battery voltage level.

Hence this provides the hardware designer the ability to choose values
based on the discharge characteristics of the battery chosen for the
given product, rather than just having one battery-microvolt property
and having the driver choose levels close to 0.85/0.75 times that.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 .../devicetree/bindings/rtc/intersil,isl12022.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
index 054d3fc649ba..3c6c07aaa78f 100644
--- a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
+++ b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
@@ -19,6 +19,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  isil,battery-trip-levels-microvolt:
+    description:
+      The battery voltages at which the first alarm and second alarm
+      should trigger (normally ~85% and ~75% of nominal V_BAT).
+    items:
+      - enum: [2125000, 2295000, 2550000, 2805000, 3060000, 4250000, 4675000]
+      - enum: [1875000, 2025000, 2250000, 2475000, 2700000, 3750000, 4125000]
+
 required:
   - compatible
   - reg
@@ -39,6 +47,7 @@ examples:
             compatible = "isil,isl12022";
             reg = <0x6f>;
             interrupts-extended = <&gpio1 5 IRQ_TYPE_LEVEL_LOW>;
+            isil,battery-trip-levels-microvolt = <2550000>, <2250000>;
         };
     };
 
-- 
2.37.2

