Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E9C2DBC4D
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Dec 2020 08:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgLPHsw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Dec 2020 02:48:52 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:36037 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbgLPHsv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Dec 2020 02:48:51 -0500
X-UUID: df63edf87c8f41d3b3a2fb469aff299c-20201216
X-UUID: df63edf87c8f41d3b3a2fb469aff299c-20201216
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 540255850; Wed, 16 Dec 2020 15:47:43 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 15:47:41 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 15:47:42 +0800
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
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Wen Su <wen.su@mediatek.com>
Subject: [PATCH v4 9/9] arm64: dts: mt6359: add PMIC MT6359 related nodes
Date:   Wed, 16 Dec 2020 15:47:07 +0800
Message-ID: <1608104827-7937-10-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Wen Su <wen.su@mediatek.com>

add PMIC MT6359 related nodes which is for MT6779 platform

Signed-off-by: Wen Su <wen.su@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 298 +++++++++++++++++++++++
 1 file changed, 298 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
new file mode 100644
index 000000000000..649c661e9907
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6359";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6359codec: mt6359codec {
+		};
+
+		mt6359regulator: mt6359regulator {
+			mt6359_vs1_buck_reg: buck_vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+			mt6359_vgpu11_buck_reg: buck_vgpu11 {
+				regulator-name = "vgpu11";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vmodem_buck_reg: buck_vmodem {
+				regulator-name = "vmodem";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-ramp-delay = <10760>;
+				regulator-enable-ramp-delay = <200>;
+			};
+			mt6359_vpu_buck_reg: buck_vpu {
+				regulator-name = "vpu";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vcore_buck_reg: buck_vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vs2_buck_reg: buck_vs2 {
+				regulator-name = "vs2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+			mt6359_vpa_buck_reg: buck_vpa {
+				regulator-name = "vpa";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-enable-ramp-delay = <300>;
+			};
+			mt6359_vproc2_buck_reg: buck_vproc2 {
+				regulator-name = "vproc2";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vproc1_buck_reg: buck_vproc1 {
+				regulator-name = "vproc1";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
+				regulator-name = "vcore_sshub";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+			};
+			mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
+				regulator-name = "vgpu11_sshub";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+			};
+			mt6359_vaud18_ldo_reg: ldo_vaud18 {
+				regulator-name = "vaud18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vsim1_ldo_reg: ldo_vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+			};
+			mt6359_vibr_ldo_reg: ldo_vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vrf12_ldo_reg: ldo_vrf12 {
+				regulator-name = "vrf12";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1300000>;
+			};
+			mt6359_vusb_ldo_reg: ldo_vusb {
+				regulator-name = "vusb";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <960>;
+				regulator-always-on;
+			};
+			mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
+				regulator-name = "vsram_proc2";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vio18_ldo_reg: ldo_vio18 {
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-enable-ramp-delay = <960>;
+				regulator-always-on;
+			};
+			mt6359_vcamio_ldo_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+			};
+			mt6359_vcn18_ldo_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vfe28_ldo_reg: ldo_vfe28 {
+				regulator-name = "vfe28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+			mt6359_vcn13_ldo_reg: ldo_vcn13 {
+				regulator-name = "vcn13";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1300000>;
+			};
+			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
+				regulator-name = "vcn33_1_bt";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
+				regulator-name = "vcn33_1_wifi";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vaux18_ldo_reg: ldo_vaux18 {
+				regulator-name = "vaux18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vsram_others_ldo_reg: ldo_vsram_others {
+				regulator-name = "vsram_others";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <5000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vefuse_ldo_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2000000>;
+			};
+			mt6359_vxo22_ldo_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+			};
+			mt6359_vrfck_ldo_reg: ldo_vrfck {
+				regulator-name = "vrfck";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1700000>;
+			};
+			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
+				regulator-name = "vrfck";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1600000>;
+			};
+			mt6359_vbif28_ldo_reg: ldo_vbif28 {
+				regulator-name = "vbif28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vio28_ldo_reg: ldo_vio28 {
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+			mt6359_vemc_ldo_reg: ldo_vemc {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
+				regulator-name = "vcn33_2_bt";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
+				regulator-name = "vcn33_2_wifi";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3500000>;
+			};
+			mt6359_va12_ldo_reg: ldo_va12 {
+				regulator-name = "va12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+			mt6359_va09_ldo_reg: ldo_va09 {
+				regulator-name = "va09";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1200000>;
+			};
+			mt6359_vrf18_ldo_reg: ldo_vrf18 {
+				regulator-name = "vrf18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1810000>;
+			};
+			mt6359_vsram_md_ldo_reg: ldo_vsram_md {
+				regulator-name = "vsram_md";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <10760>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vufs_ldo_reg: ldo_vufs {
+				regulator-name = "vufs";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+			};
+			mt6359_vm18_ldo_reg: ldo_vm18 {
+				regulator-name = "vm18";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <1900000>;
+				regulator-always-on;
+			};
+			mt6359_vbbck_ldo_reg: ldo_vbbck {
+				regulator-name = "vbbck";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1200000>;
+			};
+			mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
+				regulator-name = "vsram_proc1";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+				regulator-ramp-delay = <7500>;
+				regulator-enable-ramp-delay = <240>;
+				regulator-always-on;
+			};
+			mt6359_vsim2_ldo_reg: ldo_vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+			};
+			mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
+				regulator-name = "vsram_others_sshub";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+			};
+		};
+
+		mt6359rtc: mt6359rtc {
+			compatible = "mediatek,mt6358-rtc";
+		};
+	};
+};
-- 
2.18.0

