Return-Path: <linux-rtc+bounces-86-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063297C04D5
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 21:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A74281E60
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 19:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67C3321A9;
	Tue, 10 Oct 2023 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDz7tHc4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09932195
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 19:42:18 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1BB99
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 12:42:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-504427aae4fso205682e87.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 12:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696966934; x=1697571734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC7cwQ9l9ehnrfUa93LdFzsS9yDFKMfITnSyWHqNYUU=;
        b=eDz7tHc4i7m7oUh63qS4U0CmTrutf00oAb4t8c30ihUXqNnnys0n2zx5maXlFteb/2
         QKQY1tYNxicUADigV6Hw9JCCqSGLNUMD3gzWSG6mH+vpOTcQYZHVlZEn9lBTEA55nlp6
         Lzvs83HsGpowF5yYlcJHCryD034icvcZ3H2ksRdEqF4IelRVtA1Ueo67ZpNRxH4GW6vh
         sF3yUOsEFHiwG0wkgjYCYdpbMydOxmrgomKOdA/BIAqXyHLbS+4E6ISUNmxFOIP+jgb9
         NgTqUqSYgkB4oOs1ldiAO4QGYMBe75tZcb4cSp7PyqNdod/NoOT+LA5eNgaTG6W1b8kb
         B8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696966934; x=1697571734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC7cwQ9l9ehnrfUa93LdFzsS9yDFKMfITnSyWHqNYUU=;
        b=O5pEs05G2ldarC1ih77ytc8JyurE6JeGbmd9qWxgkO+bw1sZVpxV4DGre1BiPgaio6
         hQDUgHswKDA2k/PEzLLcTOZ1vEs9Ef6pz9YEwv0hVJx+PD77/R9oTAoP5+bW7daMXfU5
         3nyO5IjKGMLdNNr7+DN4yzbDzS6ySIQqKNvSX68AdbhP65dzvrnL1c4SytnlvaG/CR8o
         mT/nr1/R+Ip1Z1XHOzW+K+GMkgKv4dlUA8WqPZczEQxpdYgqGuL/mQuJV8tAH/L1Pnx4
         6ERztG0RE+XE1d5w4IVcXiCVKvfWn7+isXzcspxkJlibdo+l73PsljSpPRnWjuk15wHk
         pbYA==
X-Gm-Message-State: AOJu0YwXPQZwMLmI8lNTzhjwbXwkpI/dQVzvb08HwK2ihQPoirxRd0IA
	kPwUG/khVbAXaIYF8UeiLAJGoA==
X-Google-Smtp-Source: AGHT+IGDZGH9/us/6kfxtvCwYemfgI5jGna/p8VuYhNmwKpNCwcIAIeTuRVpXhwXKyMBh2xkMdi/Mw==
X-Received: by 2002:a05:6512:202d:b0:4fb:8938:48ab with SMTP id s13-20020a056512202d00b004fb893848abmr11873244lfs.16.1696966934417;
        Tue, 10 Oct 2023 12:42:14 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id i19-20020ac25233000000b005041cc98273sm1939927lfl.300.2023.10.10.12.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 12:42:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 21:42:11 +0200
Subject: [PATCH v3 1/2] rtc: rtc7301: Rewrite bindings in schema
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231010-rtc-7301-regwidth-v3-1-ade586b62794@linaro.org>
References: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
In-Reply-To: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, 
 Howard Harte <hharte@magicandroidapps.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This rewrites the Epson RTC7301 bindings to use YAML schema,
and adds a property for "reg-io-width" as used in several
other bindings to account for different register strides.

The USRobotics USR8200 uses the byte IO width.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
 .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 51 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt b/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
deleted file mode 100644
index 5f9df3f1467c..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-EPSON TOYOCOM RTC-7301SF/DG
-
-Required properties:
-
-- compatible: Should be "epson,rtc7301sf" or "epson,rtc7301dg"
-- reg: Specifies base physical address and size of the registers.
-- interrupts: A single interrupt specifier.
-
-Example:
-
-rtc: rtc@44a00000 {
-	compatible = "epson,rtc7301dg";
-	reg = <0x44a00000 0x10000>;
-	interrupt-parent = <&axi_intc_0>;
-	interrupts = <3 2>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
new file mode 100644
index 000000000000..bdb5cadb31cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rtc7301.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson Toyocom RTC-7301SF/DG
+
+description:
+  The only difference between the two variants is the packaging.
+  The DG variant is a DIL package, and the SF variant is a flat
+  package.
+
+maintainers:
+  - Akinobu Mita <akinobu.mita@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - epson,rtc7301dg
+      - epson,rtc7301sf
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description:
+      The size (in bytes) of the IO accesses that should be performed
+      on the device.
+    enum: [1, 4]
+    default: 4
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    rtc: rtc@44a00000 {
+        compatible = "epson,rtc7301dg";
+        reg = <0x44a00000 0x10000>;
+        reg-io-width = <4>;
+        interrupt-parent = <&axi_intc_0>;
+        interrupts = <3 2>;
+    };

-- 
2.41.0


