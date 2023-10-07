Return-Path: <linux-rtc+bounces-53-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B937A7BC779
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 14:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3523281EF1
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA20B1643A;
	Sat,  7 Oct 2023 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1rsKkeq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D42772D
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 12:30:54 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0DABC
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 05:30:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-504a7f9204eso3716511e87.3
        for <linux-rtc@vger.kernel.org>; Sat, 07 Oct 2023 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696681851; x=1697286651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEmvs2sZsMEqyjDKDTqp8o0I9KZnW9keEx0nKVJ6imY=;
        b=E1rsKkeqfbhPv+PaYrCI5RAnovDbviwMOXYMwqKOSw+2g2/99UBjqGtUxIoZEVik8c
         RuzZoD1s8bUEfqmXCpJzTETwcQjUdfWA1Ijk8eOKlFrQpqWlUlIPcB2MPovlUE72PRsT
         tH2G5BftIY9eQ8ApEybYikhsFxCgOtRlfyKnYjcE6iGjBl0rlg/Cck8FZ0OgC6hI6rtk
         2QUhKnAxtI+CB+FWm1pfKrGN/BCkWQJt1GjPta/6hQMSHbK9sBlLLRlFWnq8ASBkWjm2
         7MLG1vcE5pSGutXAoQ9NXP9S6nE5x12IyIDltyikRpm0DEkrVWR1Fd09h+pIB8cdOA2L
         2f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696681851; x=1697286651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEmvs2sZsMEqyjDKDTqp8o0I9KZnW9keEx0nKVJ6imY=;
        b=vrRAglR5HKb2mAcdHDvljyRrX/mVRE4TK4K6pzb7TF2/GSc8/65F0lARrq3aXidmP3
         oG5VP6dq5xKF9Q62PZ597eRjoL37yYYugB+o8DKzU+TIvtDwobLBbtCyYp707tZ55E+z
         m9A+hZixU4KmtwuGL7X2ho7nsch1mDPujELjhHFYgf4rHZxYIvjUbXa6+ns82Eg2aGCx
         FryrGotuBAT6W2u6R5p2F2siPXapbcjp9HaA8q1EqewMYH4JCJ6RaMBO7NgPED8H+9KR
         xdOHNKqPRybV19VcNdAXiQThSV5TXKgKNG+mG6DfCd2vQmgOYE2/x2btNTbDYU9bJsAf
         jRIg==
X-Gm-Message-State: AOJu0Yz8ctnrtwNmih59VZlyWfLPCp6zrMbygXmD0jkw6et96nlcr0WK
	miGJYHdtk4gwtzhxRKzTtyhNsQ==
X-Google-Smtp-Source: AGHT+IEQ66aqbACFExWgB2QTaCVfRmQI5Nr7NO/lZ/Hue+rmUnJ+3qMV9hvqZo1jU5FMhEb961JahQ==
X-Received: by 2002:a19:2d56:0:b0:505:8075:7c17 with SMTP id t22-20020a192d56000000b0050580757c17mr8406645lft.22.1696681850816;
        Sat, 07 Oct 2023 05:30:50 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 28-20020ac25f5c000000b005068d6de988sm410569lfz.226.2023.10.07.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 05:30:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 07 Oct 2023 14:30:49 +0200
Subject: [PATCH v2 1/2] rtc: rtc7301: Rewrite bindings in schema
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231007-rtc-7301-regwidth-v2-1-c913aa95f666@linaro.org>
References: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
In-Reply-To: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, 
 Howard Harte <hharte@magicandroidapps.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This rewrites the Epson RTC7301 bindings to use YAML schema,
and adds a property for "reg-io-width" as used in several
other bindings to account for different register strides.

The USRobotics USR8200 uses the byte IO width.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
 .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 50 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 16 deletions(-)

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
index 000000000000..0937b094821d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
@@ -0,0 +1,50 @@
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
+      on the device. If not specified, the default is 4.
+    enum: [1, 4]
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


