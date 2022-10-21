Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53C9607378
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 11:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiJUJJI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 05:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiJUJI7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 05:08:59 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FCB1A3E19
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 02:08:56 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u10so3877371wrq.2
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 02:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bmpdylSa1sCy8CqzpRBiwfPofyXUjj2ucEcBN7svr0=;
        b=p8sK2G9D3ocfVsbCOVy+pUyyryGnPjWOUTja0RQ3u4t+E18YB3GqWBcdGEetM9uIgR
         jCmBS8IAfwMfHpUylIPDelF0weXl/Km68WCibqLaeZ+CVNVuyIAmRLbtQS4BTwUlD/zR
         kdBhVEmqc4bTfQF4jdvr30rlsBQ7HaIwMJGmWnbzvtqjfyi+K8KTAvWcn04WcizUFfpe
         g9OxR2WlB/JYIsAIv+/FRGyfFcxJPXrhzJ+F5eT3C2k1E55dXTV7QeYSZefO7beEm8w5
         TscpJOmuuLVZI35QJCGCBPM3Sul+R5TC7BZCj702RYsFNdyAKLz0bABIUzPZlteX8zAL
         KGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bmpdylSa1sCy8CqzpRBiwfPofyXUjj2ucEcBN7svr0=;
        b=SKSWM+jZICe4yOB9E1J9ehmHuNIXw7QsevgUiQgsK9I2pI1NP96W4/S8iTn2IKPx51
         SqjsGBR7tJEkonEHNbmZe9+QflJWg+JYJgOSkGd1dbyPhfGINi2wfC9qVKSvsPNFFTmg
         ldNCDmPSJJghOSg5t2dv/+1Zvqiq2eGNwFr6wD+DZy4IM4BVFCFgEX56Qc/rPBCnEKE+
         t/9PRq4Ifg63GHlPNmm0XxRUKw4aL/mM14+1mOg406gibmb11EfDlkf+ByMlGyqC2yoS
         iSirSulLH9AZ6rYn9oEgjAGHAUnfadYxBxuhk9rtMkG2gcM/5BKGhLprlWjxJIZc2R3h
         wvaQ==
X-Gm-Message-State: ACrzQf0q043QImpNBg9f59BvMIJSsdAYBE6ydKmsqIUtV/KeOU/kdr1x
        zIcx0g3xvZGIyfgWuYDw/pwAQA==
X-Google-Smtp-Source: AMsMyM6t/CCsb0Stm67+bgDD4Gv/5fYYhC5J2XpPUaLomRSmuSCCbQe3bYxY+Ii3rM+5pLRcJ52eCA==
X-Received: by 2002:adf:fc10:0:b0:22e:55e5:9bb5 with SMTP id i16-20020adffc10000000b0022e55e59bb5mr11487698wrr.112.1666343334296;
        Fri, 21 Oct 2022 02:08:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:53 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:42 +0200
Subject: [PATCH v4 06/11] dt-bindings: input: qcom,pm8921-pwrkey: convert to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-6-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert input/qcom,pm8xxx-pwrkey.txt to YAML, and take in account that
the PM8921 pwrkey compatible is used as fallback for the PM8018 pwrkey.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/input/qcom,pm8921-pwrkey.yaml         | 75 ++++++++++++++++++++++
 .../bindings/input/qcom,pm8xxx-pwrkey.txt          | 46 -------------
 2 files changed, 75 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
new file mode 100644
index 000000000000..12c74c083258
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,pm8921-pwrkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8921 PMIC Power Key
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,pm8921-pwrkey
+          - qcom,pm8058-pwrkey
+      - items:
+          - enum:
+              - qcom,pm8018-pwrkey
+          - const: qcom,pm8921-pwrkey
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: key release
+      - description: key press
+
+  debounce:
+    description:
+      Time in microseconds that key must be pressed or
+      released for state change interrupt to trigger.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pull-up:
+    description:
+      Presence of this property indicates that the KPDPWR_N
+      pin should be configured for pull up.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/interrupt-controller/irq.h>
+   ssbi {
+     #address-cells = <1>;
+     #size-cells = <0>;
+
+     pmic@0 {
+       reg = <0x0>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       pwrkey@1c {
+         compatible = "qcom,pm8921-pwrkey";
+         reg = <0x1c>;
+         interrupt-parent = <&pmicint>;
+         interrupts = <50 IRQ_TYPE_EDGE_RISING>, <51 IRQ_TYPE_EDGE_RISING>;
+         debounce = <15625>;
+         pull-up;
+       };
+     };
+   };
+...
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt
deleted file mode 100644
index 588536cc96ed..000000000000
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Qualcomm PM8xxx PMIC Power Key
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8058-pwrkey"
-		    "qcom,pm8921-pwrkey"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: address of power key control register
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the first interrupt specifies the key release interrupt
-		    and the second interrupt specifies the key press interrupt.
-		    The format of the specifier is defined by the binding
-		    document describing the node's interrupt parent.
-
-- debounce:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in microseconds that key must be pressed or release
-		    for state change interrupt to trigger.
-
-- pull-up:
-	Usage: optional
-	Value type: <empty>
-	Definition: presence of this property indicates that the KPDPWR_N pin
-		    should be configured for pull up.
-
-EXAMPLE
-
-	pwrkey@1c {
-		compatible = "qcom,pm8921-pwrkey";
-		reg = <0x1c>;
-		interrupt-parent = <&pmicintc>;
-		interrupts = <50 1>, <51 1>;
-		debounce = <15625>;
-		pull-up;
-	};

-- 
b4 0.10.1
