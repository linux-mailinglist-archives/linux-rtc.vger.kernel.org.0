Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A80F651263
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Dec 2022 20:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbiLSTJc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Dec 2022 14:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbiLSTJ3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Dec 2022 14:09:29 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E717653
        for <linux-rtc@vger.kernel.org>; Mon, 19 Dec 2022 11:09:29 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3b56782b3f6so139802267b3.13
        for <linux-rtc@vger.kernel.org>; Mon, 19 Dec 2022 11:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK5TSyyNAxFyXbebfxPbStKYwQ+QFfdsKkMuy6XtJfo=;
        b=OnUKpSFaN8t2aIjjI7uFwBz0cJMxPX5TKo3WgWz+MQStEMBcc7bguKH9u0uxdpr6F3
         Bt15BepxBCOl+uLkZbEipvuRh5UB4JtcyOyaFAJDiVzrAA4865XBankn/vUFyA9Q9XsK
         ZA/2YByOv/XacUu+FETQdP6GwhzOUvHbuYxX2GV0ErgS6sYuBnCZtonZu2oq80SPXXQo
         gKFg0LkLXwNxAtI92p14Alx0r+zgEi4v5/S+HTN+7btBpbVz83e9aBESJg8dU3OUgmqP
         JPv6pO5I5Loi5vkh5q/Dkj2j86u4evVhaJh03QW5GTppxwBdhcHLUjX01BVHV96u4HNc
         7zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK5TSyyNAxFyXbebfxPbStKYwQ+QFfdsKkMuy6XtJfo=;
        b=6kNsY1jUU55ZQ9yofMnVsK/Fzn2k/UOfdg/iAMJL244MVOB906TCqZBNvivvU0ZXrk
         ccwb7EsG5/RIEAGvM4KVniJKYcPbuwPt7eBfp6a12bnTp86zQwXk7Fj5h+KeasDkJfyO
         KuUBVUqIGwUFYwGW6QYZvacjzB462qhV8hzjbP6E45O3O/eQfgi+7YVqCsLIYWvpruOt
         JLfN+GEfTsllBYtojTzZV/Td1fuuxXMnn9uQBeREc7lN4u5jZNfcdulFBNRwwUXHc2Zw
         BmhIXJ0RQDoPiasDdNt9jzNiL0eidT+8VnX62PIXYyAxcAJvTMR3hMkYW2KInXkRpord
         L+gw==
X-Gm-Message-State: ANoB5plIA0iflxwPrYT2T7cV20CyEgEHrDD4qAZ151pwUsL6xxRxKnvr
        WuniqGUYx7z4i6UlPls1EarkDA==
X-Google-Smtp-Source: AA0mqf44nMz5abpw0HK4kEBj2kKEH3vxLyWo3MJtQh8GEuw7y7qKmmjIxm/2+br+4bkTBKOW+LiDsg==
X-Received: by 2002:a0d:dd10:0:b0:421:2aa5:7410 with SMTP id g16-20020a0ddd10000000b004212aa57410mr27132070ywe.28.1671476968392;
        Mon, 19 Dec 2022 11:09:28 -0800 (PST)
Received: from localhost.localdomain (c-66-31-16-167.hsd1.ma.comcast.net. [66.31.16.167])
        by smtp.gmail.com with ESMTPSA id i16-20020a05620a249000b006fa9d101775sm7503743qkn.33.2022.12.19.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:09:28 -0800 (PST)
From:   Dennis Lambe Jr <dennis@sparkcharge.io>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alexander Bigga <ab@mycable.de>,
        Dennis Lambe Jr <dennis@sparkcharge.io>
Subject: [PATCH 2/3] dt-bindings: m41t80: add xtal load capacitance
Date:   Mon, 19 Dec 2022 19:09:14 +0000
Message-Id: <20221219190915.3912384-3-dennis@sparkcharge.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219190915.3912384-1-dennis@sparkcharge.io>
References: <20221219190915.3912384-1-dennis@sparkcharge.io>
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
load capacicance.

Add default, minimum, and maximum for the standard rtc property
quartz-load-femtofarads on compatible devices.

Signed-off-by: Dennis Lambe Jr <dennis@sparkcharge.io>
---
 .../devicetree/bindings/rtc/st,m41t80.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
index fc9c6da6483f..6b72580dc031 100644
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
@@ -44,8 +49,21 @@ properties:
       clock-frequency:
         const: 32768
 
+  wakeup-source: true
+
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

