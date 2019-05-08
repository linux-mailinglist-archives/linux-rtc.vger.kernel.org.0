Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360B31730D
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2019 10:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEHIAz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 May 2019 04:00:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7791 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725910AbfEHIAz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 May 2019 04:00:55 -0400
X-UUID: f9d29b6a6cb445dfb6f50a135c6d7032-20190508
X-UUID: f9d29b6a6cb445dfb6f50a135c6d7032-20190508
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 315186190; Wed, 08 May 2019 16:00:42 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 8 May
 2019 16:00:40 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 May 2019 16:00:39 +0800
Message-ID: <1557302439.22641.4.camel@mhfsdcap03>
Subject: Re: [PATCH v3 08/10] arm64: dts: mt6358: add PMIC MT6358 related
 nodes
From:   Ran Bi <ran.bi@mediatek.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Mark Brown" <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>
Date:   Wed, 8 May 2019 16:00:39 +0800
In-Reply-To: <20190503093117.54830-9-hsin-hsiung.wang@mediatek.com>
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
         <20190503093117.54830-9-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: AD1F05E2E033372105E63A636EB902B46C8DA9CE0938F5E6DBD825BE23C881332000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 2019-05-03 at 17:31 +0800, Hsin-Hsiung Wang wrote:
> add PMIC MT6358 related nodes which is for MT8183 platform
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi | 358 +++++++++++++++++++++++
>  1 file changed, 358 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> new file mode 100644
> index 000000000000..74da59de3794
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +&pwrap {
> +	pmic: mt6358 {
> +		compatible = "mediatek,mt6358";
> +		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <182 IRQ_TYPE_LEVEL_HIGH>;
> +		#interrupt-cells = <2>;
> +
> +		mt6358codec: mt6358codec {
> +			compatible = "mediatek,mt6358-sound";
> +		};
> +
> +		mt6358regulator: mt6358regulator {
> +			compatible = "mediatek,mt6358-regulator";
> +
> +			mt6358_vdram1_reg: buck_vdram1 {
> +				regulator-compatible = "buck_vdram1";
> +				regulator-name = "vdram1";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2087500>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vcore_reg: buck_vcore {
> +				regulator-name = "vcore";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vpa_reg: buck_vpa {
> +				regulator-name = "vpa";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3650000>;
> +				regulator-ramp-delay = <50000>;
> +				regulator-enable-ramp-delay = <250>;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vproc11_reg: buck_vproc11 {
> +				regulator-name = "vproc11";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vproc12_reg: buck_vproc12 {
> +				regulator-name = "vproc12";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vgpu_reg: buck_vgpu {
> +				regulator-name = "vgpu";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vs2_reg: buck_vs2 {
> +				regulator-name = "vs2";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2087500>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vmodem_reg: buck_vmodem {
> +				regulator-name = "vmodem";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <900>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6358_vs1_reg: buck_vs1 {
> +				regulator-name = "vs1";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <2587500>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vdram2_reg: ldo_vdram2 {
> +				regulator-name = "vdram2";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <3300>;
> +			};
> +
> +			mt6358_vsim1_reg: ldo_vsim1 {
> +				regulator-name = "vsim1";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +				regulator-enable-ramp-delay = <540>;
> +			};
> +
> +			mt6358_vibr_reg: ldo_vibr {
> +				regulator-name = "vibr";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <60>;
> +			};
> +
> +			mt6358_vrf12_reg: ldo_vrf12 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vrf12";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +
> +			mt6358_vio18_reg: ldo_vio18 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vio18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <2700>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vusb_reg: ldo_vusb {
> +				regulator-name = "vusb";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3100000>;
> +				regulator-enable-ramp-delay = <270>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vcamio_reg: ldo_vcamio {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vcamio";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vcamd_reg: ldo_vcamd {
> +				regulator-name = "vcamd";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vcn18_reg: ldo_vcn18 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vcn18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vfe28_reg: ldo_vfe28 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vfe28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vsram_proc11_reg: ldo_vsram_proc11 {
> +				regulator-name = "vsram_proc11";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vcn28_reg: ldo_vcn28 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vcn28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vsram_others_reg: ldo_vsram_others {
> +				regulator-name = "vsram_others";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vsram_gpu_reg: ldo_vsram_gpu {
> +				regulator-name = "vsram_gpu";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +
> +			mt6358_vxo22_reg: ldo_vxo22 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vxo22";
> +				regulator-min-microvolt = <2200000>;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-enable-ramp-delay = <120>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vefuse_reg: ldo_vefuse {
> +				regulator-name = "vefuse";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1900000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vaux18_reg: ldo_vaux18 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vaux18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vmch_reg: ldo_vmch {
> +				regulator-name = "vmch";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <60>;
> +			};
> +
> +			mt6358_vbif28_reg: ldo_vbif28 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vbif28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vsram_proc12_reg: ldo_vsram_proc12 {
> +				regulator-name = "vsram_proc12";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <6250>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vcama1_reg: ldo_vcama1 {
> +				regulator-name = "vcama1";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vemc_reg: ldo_vemc {
> +				regulator-name = "vemc";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <60>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vio28_reg: ldo_vio28 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vio28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_va12_reg: ldo_va12 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "va12";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-enable-ramp-delay = <270>;
> +				regulator-always-on;
> +			};
> +
> +			mt6358_vrf18_reg: ldo_vrf18 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vrf18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +
> +			mt6358_vcn33_bt_reg: ldo_vcn33_bt {
> +				regulator-name = "vcn33_bt";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3500000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vcn33_wifi_reg: ldo_vcn33_wifi {
> +				regulator-name = "vcn33_wifi";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3500000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vcama2_reg: ldo_vcama2 {
> +				regulator-name = "vcama2";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vmc_reg: ldo_vmc {
> +				regulator-name = "vmc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <60>;
> +			};
> +
> +			mt6358_vldo28_reg: ldo_vldo28 {
> +				regulator-name = "vldo28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vaud28_reg: ldo_vaud28 {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vaud28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <270>;
> +			};
> +
> +			mt6358_vsim2_reg: ldo_vsim2 {
> +				regulator-name = "vsim2";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +				regulator-enable-ramp-delay = <540>;
> +			};
> +		};

Missing mt6358 rtc node here:
+		mt6358rtc: mt6358rtc {
+			compatible = "mediatek,mt6358-rtc";
+		};

> +	};
> +};


