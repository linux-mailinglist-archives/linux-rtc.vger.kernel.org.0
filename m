Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E6D674563
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jan 2023 23:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjASWBz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Jan 2023 17:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjASWBT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Jan 2023 17:01:19 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBDB460AC
        for <linux-rtc@vger.kernel.org>; Thu, 19 Jan 2023 13:39:40 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id q15so2748727qtn.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Jan 2023 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvnEAnqblTBDjO4L9lAoJAikuecyCt30DJ9Jy9ahvAM=;
        b=XPjTivTM93RwFnsS/ljsxPX3656SstcIyCWz/ntXj5hdmpSndYugg7yxUcU6rdzkNk
         EwuLDbRZkZ8qW2KzsNRlPdkxWupoC7hlWR1jJNklPpyjVD42alTaXQI+g3JiTP9VtTUD
         fDpcf45LF78MkYjJCV/IE4LaUG58VDlzdifWa89+9+iHxv9carzoBVyCSj5k8fWTp2Pp
         YcgS/vM2TqoWHXRZS68OFmmwTntMELqVb1QETDAD6yFP6wtqeU2DP8CJC9Dqb4B3DV3C
         6vLzxj4QRTUw2YTn8aBHMXlx3u2qLPyc+Zrp5YAloicoDCr3DfxWw7yXpoWNGrbVDkhQ
         6GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvnEAnqblTBDjO4L9lAoJAikuecyCt30DJ9Jy9ahvAM=;
        b=t2qWvi+LL4DGy6YJNLAigd0f9ynW8nZWMpUJieBQGMbE6R6lW5jY7/JSj6v2f/yyMK
         ONAFPrIuhzuhvQepdbLQSMxZcLfMAFkS0Sz2kuDG99o1cazjgsOFi7LpthbFTKOUG81j
         ZVOdQyWH57WSk8QwibUYfgI5isgFPv0/TACsbIJhf+Qgp7l7trGE9X4lrKzptTNEERPE
         B2OZt4w/9LWMOFwjaeC9BxMUt1f49JT7O6iHwBuMkCZxob5KEqSL1ydjnrocdaj96Yug
         uGabuyMUi1WHDqZpAOSjukDeArhL7DRdqPC7cEi7ePWW1RdRAw9CkIIthMsB0RcK6da2
         5A/w==
X-Gm-Message-State: AFqh2kqJ/w7CDtmvs6p37/Pr0JiRKCI8QnUydc0ifxrOzSKB1znTImOS
        2CYPwdqGUoDALFhD8cWxci75uQ==
X-Google-Smtp-Source: AMrXdXvH05SRTIswgL/NPk4wgC7B25swx7vGDsNwIubApjxY3JniaRycLxhz6UZ1VXgRljC9SldxGQ==
X-Received: by 2002:ac8:71c1:0:b0:3b6:3abd:fcc2 with SMTP id i1-20020ac871c1000000b003b63abdfcc2mr16964684qtp.46.1674164374360;
        Thu, 19 Jan 2023 13:39:34 -0800 (PST)
Received: from localhost.localdomain (c-66-31-16-167.hsd1.ma.comcast.net. [66.31.16.167])
        by smtp.gmail.com with ESMTPSA id l13-20020a05620a28cd00b0070531c5d655sm2600676qkp.90.2023.01.19.13.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:39:33 -0800 (PST)
From:   Dennis Lambe Jr <dennis@sparkcharge.io>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Cc:     =?UTF-8?q?Myl=C3=A8ne=20Josserand?= 
        <mylene.josserand@free-electrons.com>,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Troy Kisky <troy.kisky@boundarydevices.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Dennis Lambe Jr <dennis@sparkcharge.io>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: m41t80: add xtal load capacitance
Date:   Thu, 19 Jan 2023 21:39:02 +0000
Message-Id: <20230119213903.899756-3-dennis@sparkcharge.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119213903.899756-1-dennis@sparkcharge.io>
References: <20230119213903.899756-1-dennis@sparkcharge.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ST m41t82 and m41t83 support programmable load capacitance from 3.5
pF to 17.4 pF. The hardware defaults to 12.5 pF.

The accuracy of the xtal can be calibrated precisely by adjusting the
load capacitance.

Add default, minimum, and maximum for the standard rtc property
quartz-load-femtofarads on compatible devices.

Signed-off-by: Dennis Lambe Jr <dennis@sparkcharge.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    v2 -> v3:
    	added "Reviewed-by: Krzysztof Kozlowski" to changelog
    
    v1 -> v2:
    	remove accidental wakeup-sources line
    		suggested by Krzysztof Kozlowski
    	spelling fix in changelog

 .../devicetree/bindings/rtc/st,m41t80.yaml       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
index fc9c6da6483f..6673adf6e99b 100644
--- a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
@@ -33,6 +33,11 @@ properties:
   "#clock-cells":
     const: 1
 
+  quartz-load-femtofarads:
+    default: 12500
+    minimum: 3500
+    maximum: 17375
+
   clock-output-names:
     maxItems: 1
     description: From common clock binding to override the default output clock name.
@@ -46,6 +51,17 @@ properties:
 
 allOf:
   - $ref: rtc.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - st,m41t82
+                - st,m41t83
+    then:
+      properties:
+        quartz-load-femtofarads: false
 
 unevaluatedProperties: false
 
-- 
2.25.1

