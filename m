Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934E972E3AD
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 15:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242339AbjFMNBR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 09:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242495AbjFMNBO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 09:01:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146CC184
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f122ff663eso6674860e87.2
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686661271; x=1689253271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2BuYK+BLXe7S2DEn820yRWucPw/Ya8vxrHBKxBUFTU=;
        b=VW0s26oZQSMnoLdD1XtO6Sbm+5CKcWoB+Q7FT2wkCBByXrvyd4MuUxGUXjzW+Kp4CQ
         5nCmJUneRGBaa3iNL1XLl8bypsgCWvBPhFjwjQ49ikffcabCQLAWsGKTlljZlHz+Z+TJ
         pl0F4PByr0eZ4axlzqCNUNCwr7XJ9AOFmx6bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661271; x=1689253271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2BuYK+BLXe7S2DEn820yRWucPw/Ya8vxrHBKxBUFTU=;
        b=HP9GwGrQ3smN0NrLYxNrn6LlgH7CvshRxSjzYYZ+b3Zz7JylFUQw5zhSykRds1XtQn
         UQvAnM/TzrwigtG1zaXs+5YffcMTOtLlbGQlleE2rh412jUVbCto2U6ltaGcBKrI5fgD
         bE4WVXYsj49YtFIwYq+V2S+fWmFvQ3XiKHjTVQvGx5MAdcHyjYmVhdBbjTLNAZBOMTm4
         N3VrRvgj6o5bpT/mUphf1x5ZnxMVJzNrCKob1Ic9AWVGV8SukoPAwKhcfm3T91F6VJV7
         koRgHAKfvt/PvIq/TcigYgZ0I3nxvf3+SWgKTIaYEDzc+BcAErL46CvcPQHuZ8GmvEDU
         ZfMA==
X-Gm-Message-State: AC+VfDway6vWOvbYDqUe0aML1We90ExX1dp3VSgN0ybeVBB4cWSIWW3b
        WxqGOIcNnaSFnQc2vU+BWeibdgc9ITlhJEtjBV8/hQ==
X-Google-Smtp-Source: ACHHUZ4Vmcblu3a2hlJgEmgFkSoLF15ZlnTZT0o98F0oUGKtad9W7DKUKMX7FUQe0j3pGgF/pLdX/Q==
X-Received: by 2002:a19:915e:0:b0:4d8:6540:a731 with SMTP id y30-20020a19915e000000b004d86540a731mr5013742lfj.47.1686661271195;
        Tue, 13 Jun 2023 06:01:11 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id u24-20020ac243d8000000b004f14ae5ded8sm1793786lfl.28.2023.06.13.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 06:01:10 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] dt-bindings: rtc: isl12022: add #clock-cells property
Date:   Tue, 13 Jun 2023 15:00:09 +0200
Message-Id: <20230613130011.305589-8-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230613130011.305589-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The isl12022 has a dual-purpose irq/f_out pin, which can either be
used as an interrupt or clock output.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 .../devicetree/bindings/rtc/intersil,isl12022.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
index d5d3a687a34d..a9ef68b5fdcd 100644
--- a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
+++ b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
@@ -11,6 +11,13 @@ maintainers:
 
 allOf:
   - $ref: rtc.yaml#
+  # If #clock-cells is present, interrupts must not be present
+  - if:
+      required:
+        - '#clock-cells'
+    then:
+      properties:
+        interrupts: false
 
 properties:
   compatible:
@@ -22,6 +29,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#clock-cells':
+    const: 0
+
   isil,trip-level85-microvolt:
     description: |
       The battery voltage at which the first alarm should trigger
-- 
2.37.2

