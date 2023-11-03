Return-Path: <linux-rtc+bounces-195-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12B7E0333
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 13:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A19A8B20FE8
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 12:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C062171AB;
	Fri,  3 Nov 2023 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carlosaurelio.net header.i=@carlosaurelio.net header.b="d1bqnMWB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557E61642F
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 12:52:56 +0000 (UTC)
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3427CE
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 05:52:51 -0700 (PDT)
Received: from MTA-12-4.privateemail.com (mta-12-1.privateemail.com [198.54.122.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4E28860136;
	Fri,  3 Nov 2023 12:52:49 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
	by mta-12.privateemail.com (Postfix) with ESMTP id 4F89418000A2;
	Fri,  3 Nov 2023 08:52:47 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=carlosaurelio.net;
	s=default; t=1699015967;
	bh=7x6abVPdbko5LarCk/0BZn1SkuXjeT6liiRK10w8DLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1bqnMWBVt8/q7tRhYhjuT27rxqblzI1eR/EgXyN5SZiCLMKLC2bFJtAwN8wVNp26
	 ZH31E2cz4DNKSKYJ0OJ/qARjq8moF6jPJYXlgAdKYbYBEZfddo4DSkdRqJJrbcKxOE
	 uBqa8CBRFM+fJWdsYFrFTgo8nEt4m3Umukp85uv9wHSA8kY5+lN5NZ7VvhQs6UyrIA
	 h0m7SRD4FvVi/648FHhDpRF6rZWaqHNUkNJ/Za365ZYFVXyf7GMpbMWfTMO0BjPjEq
	 ohh7E6B8wBVHbRDpnKMYnFHEY+aK48KrjzyVAv8vkU6crXXRxdOnQNH2tAD9JbDFTa
	 hcZDq7Sw8zmbA==
Received: from GB2-C0476.gertec.local (unknown [187.11.35.108])
	by mta-12.privateemail.com (Postfix) with ESMTPA;
	Fri,  3 Nov 2023 08:52:30 -0400 (EDT)
From: Carlos Menin <menin@carlosaurelio.net>
To: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Carlos Menin <menin@carlosaurelio.net>,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH v2 2/2] dt-bindings: rtc: add pcf85053a
Date: Fri,  3 Nov 2023 09:51:06 -0300
Message-Id: <20231103125106.78220-2-menin@carlosaurelio.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103125106.78220-1-menin@carlosaurelio.net>
References: <20231103125106.78220-1-menin@carlosaurelio.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add YAML bindings for NXP's PCF85053A RTC chip.

Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../bindings/rtc/nxp,pcf85053a.yaml           | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
new file mode 100644
index 000000000000..a1fc29dd30f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF85053A Real Time Clock
+
+maintainers:
+  - Carlos Menin <menin@carlosaurelio.net>
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcf85053a
+
+  reg:
+    maxItems: 1
+
+  quartz-load-femtofarads:
+    description:
+      The capacitive load of the crystal, expressed in femto Farad (fF).
+    enum: [6000, 7000, 12500]
+    default: 12500
+
+  nxp,quartz-drive-control:
+    description:
+      The oscillator is designed to be used with quartz with a series resistance
+      up to 100 kOhms. This covers the typical range of 32.768 kHz quartz
+      crystals. A low drive mode is available for low series resistance quartz
+      (up to 60 kOhms). This reduces the current consumption. For very high
+      series resistance quartz (up to 500 kOhms), there is a high drive mode.
+      Current consumption increases substantially in this mode.
+    enum: [low, normal, high]
+    default: normal
+
+  nxp,low-jitter-mode:
+    description:
+      If set to true, will decrease the CLK output jitter, at the cost of
+      increasing the current consumption.
+    type: boolean
+    default: false
+
+  nxp,clk-inverted:
+    description:
+      Invert clock output. Normally, the low jitter mode reduces jitter on the
+      rising edge of the output clock. If this property is set to true, then the
+      low jitter mode will affect the falling edge of the output clock.
+    type: boolean
+    default: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+            compatible = "nxp,pcf85053a";
+            reg = <0x6f>;
+        };
+    };
-- 
2.34.1


