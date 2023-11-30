Return-Path: <linux-rtc+bounces-374-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDF7FF84C
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Nov 2023 18:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78656B210FB
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Nov 2023 17:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82815811B;
	Thu, 30 Nov 2023 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3qz1RuO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA96A5677C;
	Thu, 30 Nov 2023 17:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B982C433C8;
	Thu, 30 Nov 2023 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365519;
	bh=wxg56W6HTHMTFYDW4lY4u8CY4BkNOVOP9bjh79kHVmE=;
	h=From:To:Cc:Subject:Date:From;
	b=u3qz1RuObFfuunerRon1cBHkIkU7XP6vXJNp5DiAMMPQkvPEoWkUOPZVq+ytWyqs8
	 rh7hJHBIhJl33qrkpiM0Q7WWcXqao7Ry4bCOlPzT6CkSsubV+dC1TsLJfq8vjG/M6G
	 1lPmceDj3EQS4HbiaHHU//CySGBJzKKF5qyYfQhZuEuIh8Ud59jTYgzKSELFJs147a
	 26poZRPxdioOB5zkDpNDbkMay5YADZg7dhw89vYDNDT84MCO9f/ixv7XkCl24c9A5R
	 6z5wPJ8p7zc/fYtt+eesdYQGHBEUagEoqH0nb141XlkzdUJShW5Rk9IWHNxUoGj+l0
	 cucAy8DQJB6Hg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8kts-0003KX-1h;
	Thu, 30 Nov 2023 18:32:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alessandro Zummo <a.zummo@towertech.it>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] dt-bindings: rtc: qcom-pm8xxx: fix inconsistent example
Date: Thu, 30 Nov 2023 18:32:23 +0100
Message-ID: <20231130173223.12794-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8921 is an SSBI PMIC but in the binding example it is described
as being part of an SPMI PMIC while using an SSBI address.

Make the example consistent by using the sibling PM8941 SPMI PMIC
instead.

Fixes: 8138c5f0318c ("dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 774c34c3f8f6..cdc56dfbfac3 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -67,27 +67,27 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/spmi/spmi.h>
-    spmi_bus: spmi@c440000 {
-      reg = <0x0c440000 0x1100>;
-      #address-cells = <2>;
-      #size-cells = <0>;
-      pmicintc: pmic@0 {
-        reg = <0x0 SPMI_USID>;
-        compatible = "qcom,pm8921";
-        interrupts = <104 8>;
-        #interrupt-cells = <2>;
-        interrupt-controller;
-        #address-cells = <1>;
+
+    spmi {
+        #address-cells = <2>;
         #size-cells = <0>;
 
-        pm8921_rtc: rtc@11d {
-          compatible = "qcom,pm8921-rtc";
-          reg = <0x11d>;
-          interrupts = <0x27 0>;
-          nvmem-cells = <&rtc_offset>;
-          nvmem-cell-names = "offset";
+        pmic@0 {
+            compatible = "qcom,pm8941", "qcom,spmi-pmic";
+            reg = <0x0 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            rtc@6000 {
+                compatible = "qcom,pm8941-rtc";
+                reg = <0x6000>, <0x6100>;
+                reg-names = "rtc", "alarm";
+                interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+                nvmem-cells = <&rtc_offset>;
+                nvmem-cell-names = "offset";
+            };
         };
-      };
     };
 ...
-- 
2.41.0


