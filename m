Return-Path: <linux-rtc+bounces-196-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3EE7E0427
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 15:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFA96B21249
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 14:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F4518659;
	Fri,  3 Nov 2023 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AD1862F;
	Fri,  3 Nov 2023 14:02:07 +0000 (UTC)
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6CDD4B;
	Fri,  3 Nov 2023 07:02:02 -0700 (PDT)
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A38gCiZ001828;
	Fri, 3 Nov 2023 10:01:23 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3u4wk811r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 10:01:22 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 3A3E1LoD008711
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 10:01:21 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 3 Nov 2023 10:01:20 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 3 Nov 2023 10:01:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 3 Nov 2023 10:01:20 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3A3E13ht020117;
	Fri, 3 Nov 2023 10:01:06 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
        Alessandro Zummo
	<a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, "Jean Delvare" <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: rtc: max31335: add max31335 bindings
Date: Fri, 3 Nov 2023 16:00:25 +0200
Message-ID: <20231103140051.43174-1-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: cBisYt9uOPjCeFtmhXVBTQHHxdRfnr5D
X-Proofpoint-ORIG-GUID: cBisYt9uOPjCeFtmhXVBTQHHxdRfnr5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_12,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310240000
 definitions=main-2311030117

Document the Analog Devices MAX31335 device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
changes in v5:
 - add `adi,tc-diode` property.
 .../devicetree/bindings/rtc/adi,max31335.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/adi,max31335.yaml

diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
new file mode 100644
index 000000000000..b82a8aa67428
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/adi,max31335.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX31335 RTC
+
+maintainers:
+  - Antoniu Miclaus <antoniu.miclaus@analog.com>
+
+description:
+  Analog Devices MAX31335 I2C RTC ±2ppm Automotive Real-Time Clock with
+  Integrated MEMS Resonator.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: adi,max31335
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#clock-cells":
+    description:
+      RTC can be used as a clock source through its clock output pin.
+    const: 0
+
+  adi,tc-diode:
+    description:
+      Select the diode configuration for the trickle charger.
+      schottky - Schottky diode in series.
+      standard+schottky - standard diode + Schottky diode in series.
+    enum: [schottky, standard+schottky]
+
+  trickle-resistor-ohms:
+    description:
+      Selected resistor for trickle charger. Should be specified if trickle
+      charger should be enabled.
+    enum: [3000, 6000, 11000]
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@68 {
+            compatible = "adi,max31335";
+            reg = <0x68>;
+            pinctrl-0 = <&rtc_nint_pins>;
+            interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
+            trickle-resistor-ohms = <6000>;
+            adi,tc-diode = "schottky";
+        };
+    };
+...
-- 
2.42.0


