Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501F2DBC48
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Dec 2020 08:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgLPHsq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Dec 2020 02:48:46 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:43851 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbgLPHsp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Dec 2020 02:48:45 -0500
X-UUID: 71a97bb221b74fccad21042b41a7978b-20201216
X-UUID: 71a97bb221b74fccad21042b41a7978b-20201216
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1157250689; Wed, 16 Dec 2020 15:47:42 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 15:47:41 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 15:47:40 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v4 4/9] dt-bindings: regulator: Add document for MT6359 regulator
Date:   Wed, 16 Dec 2020 15:47:02 +0800
Message-ID: <1608104827-7937-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: E5771E87116EDF3467D6C5675A246E93ECC222A89CB0EB590F423C9F3F8FAC402000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

add dt-binding document for MediaTek MT6359 PMIC

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
new file mode 100644
index 000000000000..09fd4cb90326
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mt6359-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6359 Regulator from MediaTek Integrated
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+
+description: |
+  List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  MT6359 regulators node should be sub node of the MT6397 MFD node.
+
+properties:
+  $nodename:
+    pattern: "^pmic$"
+
+  mt6359regulator:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    patternProperties:
+      "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
+
+        unevaluatedProperties: false
+
+      "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
+
+        unevaluatedProperties: false
+
+      "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
+
+        unevaluatedProperties: false
+
+      "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
+
+        unevaluatedProperties: false
+
+      "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
+
+        unevaluatedProperties: false
+
+      "^ldo_v(fe|bif|io)28$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(fe|bif|io)28$"
+
+        unevaluatedProperties: false
+
+      "^ldo_v(aud|io|aux|rf|m)18$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(aud|io|aux|rf|m)18$"
+
+        unevaluatedProperties: false
+
+      "^ldo_vsim[12]$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^vsim[12]$"
+
+        required:
+          - regulator-name
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      mt6359regulator {
+        mt6359_vgpu11_buck_reg: buck_vgpu11 {
+          regulator-name = "vgpu11";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-always-on;
+          regulator-allowed-modes = <0 1 2>;
+        };
+
+        mt6359_vcamio_ldo_reg: ldo_vcamio {
+          regulator-name = "vcamio";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+        };
+
+        mt6359_vcn18_ldo_reg: ldo_vcn18 {
+          regulator-name = "vcn18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
+          regulator-name = "vsram_proc2";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+
+        mt6359_vfe28_ldo_reg: ldo_vfe28 {
+          regulator-name = "vfe28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <120>;
+        };
+
+        mt6359_vaud18_ldo_reg: ldo_vaud18 {
+          regulator-name = "vaud18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6359_vsim1_ldo_reg: ldo_vsim1 {
+          regulator-name = "vsim1";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <480>;
+        };
+      };
+    };
+...
-- 
2.18.0

