Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A4B34FF2C
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Mar 2021 13:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhCaLCy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 Mar 2021 07:02:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52124 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235498AbhCaLC1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 Mar 2021 07:02:27 -0400
X-UUID: 6fa1fa07355b4aa99ad9ecaf06ddc507-20210331
X-UUID: 6fa1fa07355b4aa99ad9ecaf06ddc507-20210331
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2087675877; Wed, 31 Mar 2021 19:02:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 19:02:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 19:02:18 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fei Shao <fshao@chromium.org>
CC:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 4/8] dt-bindings: regulator: Add document for MT6359 regulator
Date:   Wed, 31 Mar 2021 19:02:03 +0800
Message-ID: <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

add dt-binding document for MediaTek MT6359 PMIC

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v6:
- fix yaml error.
---
 .../bindings/regulator/mt6359-regulator.yaml  | 385 ++++++++++++++++++
 1 file changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
new file mode 100644
index 000000000000..8cc413eb482d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -0,0 +1,385 @@
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
+patternProperties:
+  "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(fe|bif|io)28$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(fe|bif|io)28$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(aud|io|aux|rf|m)18$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(aud|io|aux|rf|m)18$"
+
+    unevaluatedProperties: false
+
+  "^ldo_vsim[12]$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^vsim[12]$"
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        mt6359_vs1_buck_reg: buck_vs1 {
+          regulator-name = "vs1";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-enable-ramp-delay = <0>;
+          regulator-always-on;
+        };
+        mt6359_vgpu11_buck_reg: buck_vgpu11 {
+          regulator-name = "vgpu11";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vmodem_buck_reg: buck_vmodem {
+          regulator-name = "vmodem";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1100000>;
+          regulator-ramp-delay = <10760>;
+          regulator-enable-ramp-delay = <200>;
+        };
+        mt6359_vpu_buck_reg: buck_vpu {
+          regulator-name = "vpu";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vcore_buck_reg: buck_vcore {
+          regulator-name = "vcore";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1300000>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vs2_buck_reg: buck_vs2 {
+          regulator-name = "vs2";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <1600000>;
+          regulator-enable-ramp-delay = <0>;
+          regulator-always-on;
+        };
+        mt6359_vpa_buck_reg: buck_vpa {
+          regulator-name = "vpa";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <3650000>;
+          regulator-enable-ramp-delay = <300>;
+        };
+        mt6359_vproc2_buck_reg: buck_vproc2 {
+          regulator-name = "vproc2";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vproc1_buck_reg: buck_vproc1 {
+          regulator-name = "vproc1";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <200>;
+          regulator-allowed-modes = <0 1 2>;
+        };
+        mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
+          regulator-name = "vcore_sshub";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+        };
+        mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
+          regulator-name = "vgpu11_sshub";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1193750>;
+        };
+        mt6359_vaud18_ldo_reg: ldo_vaud18 {
+          regulator-name = "vaud18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vsim1_ldo_reg: ldo_vsim1 {
+          regulator-name = "vsim1";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+        };
+        mt6359_vibr_ldo_reg: ldo_vibr {
+          regulator-name = "vibr";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vrf12_ldo_reg: ldo_vrf12 {
+          regulator-name = "vrf12";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1300000>;
+        };
+        mt6359_vusb_ldo_reg: ldo_vusb {
+          regulator-name = "vusb";
+          regulator-min-microvolt = <3000000>;
+          regulator-max-microvolt = <3000000>;
+          regulator-enable-ramp-delay = <960>;
+          regulator-always-on;
+        };
+        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
+          regulator-name = "vsram_proc2";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vio18_ldo_reg: ldo_vio18 {
+          regulator-name = "vio18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+          regulator-enable-ramp-delay = <960>;
+          regulator-always-on;
+        };
+        mt6359_vcamio_ldo_reg: ldo_vcamio {
+          regulator-name = "vcamio";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+        };
+        mt6359_vcn18_ldo_reg: ldo_vcn18 {
+          regulator-name = "vcn18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vfe28_ldo_reg: ldo_vfe28 {
+          regulator-name = "vfe28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <120>;
+        };
+        mt6359_vcn13_ldo_reg: ldo_vcn13 {
+          regulator-name = "vcn13";
+          regulator-min-microvolt = <900000>;
+          regulator-max-microvolt = <1300000>;
+        };
+        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
+          regulator-name = "vcn33_1_bt";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
+          regulator-name = "vcn33_1_wifi";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vaux18_ldo_reg: ldo_vaux18 {
+          regulator-name = "vaux18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vsram_others_ldo_reg: ldo_vsram_others {
+          regulator-name = "vsram_others";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <5000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vefuse_ldo_reg: ldo_vefuse {
+          regulator-name = "vefuse";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <2000000>;
+        };
+        mt6359_vxo22_ldo_reg: ldo_vxo22 {
+          regulator-name = "vxo22";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-always-on;
+        };
+        mt6359_vrfck_ldo_reg: ldo_vrfck {
+          regulator-name = "vrfck";
+          regulator-min-microvolt = <1500000>;
+          regulator-max-microvolt = <1700000>;
+        };
+        mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
+          regulator-name = "vrfck";
+          regulator-min-microvolt = <1240000>;
+          regulator-max-microvolt = <1600000>;
+        };
+        mt6359_vbif28_ldo_reg: ldo_vbif28 {
+          regulator-name = "vbif28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vio28_ldo_reg: ldo_vio28 {
+          regulator-name = "vio28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-always-on;
+        };
+        mt6359_vemc_ldo_reg: ldo_vemc {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2500000>;
+          regulator-max-microvolt = <3300000>;
+        };
+        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
+          regulator-name = "vcn33_2_bt";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
+          regulator-name = "vcn33_2_wifi";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3500000>;
+        };
+        mt6359_va12_ldo_reg: ldo_va12 {
+          regulator-name = "va12";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <1300000>;
+          regulator-always-on;
+        };
+        mt6359_va09_ldo_reg: ldo_va09 {
+          regulator-name = "va09";
+          regulator-min-microvolt = <800000>;
+          regulator-max-microvolt = <1200000>;
+        };
+        mt6359_vrf18_ldo_reg: ldo_vrf18 {
+          regulator-name = "vrf18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1810000>;
+        };
+        mt6359_vsram_md_ldo_reg: ldo_vsram_md {
+          regulator-name = "vsram_md";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <10760>;
+          regulator-enable-ramp-delay = <240>;
+        };
+        mt6359_vufs_ldo_reg: ldo_vufs {
+          regulator-name = "vufs";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+        };
+        mt6359_vm18_ldo_reg: ldo_vm18 {
+          regulator-name = "vm18";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <1900000>;
+          regulator-always-on;
+        };
+        mt6359_vbbck_ldo_reg: ldo_vbbck {
+          regulator-name = "vbbck";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1200000>;
+        };
+        mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
+          regulator-name = "vsram_proc1";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+          regulator-ramp-delay = <7500>;
+          regulator-enable-ramp-delay = <240>;
+          regulator-always-on;
+        };
+        mt6359_vsim2_ldo_reg: ldo_vsim2 {
+          regulator-name = "vsim2";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+        };
+        mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
+          regulator-name = "vsram_others_sshub";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1293750>;
+        };
+      };
+    };
+...
-- 
2.18.0

