Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABAE9A645
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 05:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403787AbfHWDp4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 23:45:56 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47706 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390863AbfHWDpz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 23:45:55 -0400
X-UUID: e64cf142f9194a6dab415b04025ad60a-20190823
X-UUID: e64cf142f9194a6dab415b04025ad60a-20190823
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1596718171; Fri, 23 Aug 2019 11:45:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 23 Aug 2019 11:45:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 23 Aug 2019 11:45:35 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v5 05/10] regulator: Add document for MT6358 regulator
Date:   Fri, 23 Aug 2019 11:45:26 +0800
Message-ID: <1566531931-9772-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

add dt-binding document for MediaTek MT6358 PMIC

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../bindings/regulator/mt6358-regulator.txt        | 358 +++++++++++++++++++++
 1 file changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
new file mode 100644
index 0000000..9a90a92
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
@@ -0,0 +1,358 @@
+MediaTek MT6358 Regulator
+
+All voltage regulators provided by the MT6358 PMIC are described as the
+subnodes of the MT6358 regulators node. Each regulator is named according
+to its regulator type, buck_<name> and ldo_<name>. The definition for each
+of these nodes is defined using the standard binding for regulators at
+Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are::
+BUCK:
+  buck_vdram1, buck_vcore, buck_vpa, buck_vproc11, buck_vproc12, buck_vgpu,
+  buck_vs2, buck_vmodem, buck_vs1
+LDO:
+  ldo_vdram2, ldo_vsim1, ldo_vibr, ldo_vrf12, ldo_vio18, ldo_vusb, ldo_vcamio,
+  ldo_vcamd, ldo_vcn18, ldo_vfe28, ldo_vsram_proc11, ldo_vcn28, ldo_vsram_others,
+  ldo_vsram_gpu, ldo_vxo22, ldo_vefuse, ldo_vaux18, ldo_vmch, ldo_vbif28,
+  ldo_vsram_proc12, ldo_vcama1, ldo_vemc, ldo_vio28, ldo_va12, ldo_vrf18,
+  ldo_vcn33_bt, ldo_vcn33_wifi, ldo_vcama2, ldo_vmc, ldo_vldo28, ldo_vaud28,
+  ldo_vsim2
+
+Example:
+
+	pmic {
+		compatible = "mediatek,mt6358";
+
+		mt6358regulator: mt6358regulator {
+			compatible = "mediatek,mt6358-regulator";
+
+			mt6358_vdram1_reg: buck_vdram1 {
+				regulator-compatible = "buck_vdram1";
+				regulator-name = "vdram1";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2087500>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6358_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-always-on;
+			};
+
+			mt6358_vpa_reg: buck_vpa {
+				regulator-name = "vpa";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-ramp-delay = <50000>;
+				regulator-enable-ramp-delay = <250>;
+			};
+
+			mt6358_vproc11_reg: buck_vproc11 {
+				regulator-name = "vproc11";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-always-on;
+			};
+
+			mt6358_vproc12_reg: buck_vproc12 {
+				regulator-name = "vproc12";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-always-on;
+			};
+
+			mt6358_vgpu_reg: buck_vgpu {
+				regulator-name = "vgpu";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <200>;
+			};
+
+			mt6358_vs2_reg: buck_vs2 {
+				regulator-name = "vs2";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2087500>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6358_vmodem_reg: buck_vmodem {
+				regulator-name = "vmodem";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <900>;
+				regulator-always-on;
+			};
+
+			mt6358_vs1_reg: buck_vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <2587500>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+
+			mt6358_vdram2_reg: ldo_vdram2 {
+				regulator-name = "vdram2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <3300>;
+			};
+
+			mt6358_vsim1_reg: ldo_vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <540>;
+			};
+
+			mt6358_vibr_reg: ldo_vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <60>;
+			};
+
+			mt6358_vrf12_reg: ldo_vrf12 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			mt6358_vio18_reg: ldo_vio18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <2700>;
+				regulator-always-on;
+			};
+
+			mt6358_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <270>;
+				regulator-always-on;
+			};
+
+			mt6358_vcamio_reg: ldo_vcamio {
+				compatible = "regulator-fixed";
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vcn18_reg: ldo_vcn18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vfe28_reg: ldo_vfe28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vfe28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vsram_proc11_reg: ldo_vsram_proc11 {
+				regulator-name = "vsram_proc11";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+
+			mt6358_vcn28_reg: ldo_vcn28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vsram_others_reg: ldo_vsram_others {
+				regulator-name = "vsram_others";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+
+			mt6358_vsram_gpu_reg: ldo_vsram_gpu {
+				regulator-name = "vsram_gpu";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <240>;
+			};
+
+			mt6358_vxo22_reg: ldo_vxo22 {
+				compatible = "regulator-fixed";
+				regulator-name = "vxo22";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <120>;
+				regulator-always-on;
+			};
+
+			mt6358_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vaux18_reg: ldo_vaux18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaux18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <60>;
+			};
+
+			mt6358_vbif28_reg: ldo_vbif28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vbif28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vsram_proc12_reg: ldo_vsram_proc12 {
+				regulator-name = "vsram_proc12";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+
+			mt6358_vcama1_reg: ldo_vcama1 {
+				regulator-name = "vcama1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vemc_reg: ldo_vemc {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <60>;
+				regulator-always-on;
+			};
+
+			mt6358_vio28_reg: ldo_vio28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_va12_reg: ldo_va12 {
+				compatible = "regulator-fixed";
+				regulator-name = "va12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <270>;
+				regulator-always-on;
+			};
+
+			mt6358_vrf18_reg: ldo_vrf18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			mt6358_vcn33_bt_reg: ldo_vcn33_bt {
+				regulator-name = "vcn33_bt";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vcn33_wifi_reg: ldo_vcn33_wifi {
+				regulator-name = "vcn33_wifi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vcama2_reg: ldo_vcama2 {
+				regulator-name = "vcama2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <60>;
+			};
+
+			mt6358_vldo28_reg: ldo_vldo28 {
+				regulator-name = "vldo28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vaud28_reg: ldo_vaud28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaud28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <270>;
+			};
+
+			mt6358_vsim2_reg: ldo_vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <540>;
+			};
+		};
+	};
-- 
1.9.1

