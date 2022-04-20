Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B095093B4
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Apr 2022 01:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240273AbiDTXuy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Apr 2022 19:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiDTXux (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Apr 2022 19:50:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DBC3A739;
        Wed, 20 Apr 2022 16:48:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 5295F1F44C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650498483;
        bh=WC7KxXaDUtbCrh+fg5MNJhOuLbmVACU3JQUrXUrXSiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fquYeL/Oo/CzvSJpcGaIrmXocXN4NDcrChOMglh3+lIJIImJHPKouQwxhLxsLRa2i
         O/M5/n/0tY0bcY/OLR+nlxyuah34hkmQJo1UO/WQddoKQb8WsvPXCq/4zflkKmJNB1
         Qz08URNskx4QGqG5LRjH240MZV8JhuY08sTiTKV2gQI3Y3IF2r56yXhhzZMph22v5u
         4pRzLeNDpQCT0OHiJqLcwNMlcC98eqjuF8zXhD5Fmnh/TFOznealaD3L4gmq+/4B3h
         yvEXwA6gMzWOrXDBZh6bKqfINnWtZyQWQvpwswU2B8y/+TJK/RcbuvdsXKUgjmUdNu
         bdIaCdwewpHCg==
Date:   Wed, 20 Apr 2022 19:47:57 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Hui-Liu Liu <hui.liu@mediatek.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, eddie.huang@mediatek.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        fshao@chromium.org, srv_heupstream@mediatek.com,
        zhiyong.tao@mediatek.com, hsin-hsiung.wang@mediatek.com,
        sean.wang@mediatek.com, macpaul.lin@mediatek.com,
        yuchen.huang@mediatek.com, wen.su@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/1] arm64: dts: mt6359: add PMIC MT6359 related nodes
Message-ID: <20220420234757.f6oyrelohbwxhq7d@notapiano>
References: <20220420125501.571-1-hui.liu@mediatek.com>
 <20220420125501.571-2-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420125501.571-2-hui.liu@mediatek.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Hui-Liu,
thank you for the patch.

On Wed, Apr 20, 2022 at 08:55:01PM +0800, Hui-Liu Liu wrote:
> From: Hui Liu <hui.liu@mediatek.com>
> 
> MT6359 is the promary PMIC for MT8192.

promary -> primary

> Add PMIC MT6359 related node which is used for MT8192 platform.
> 
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Reviewed-by: N�colas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N�colas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N�colas

> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi    | 298 ++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   1 +
>  2 files changed, 299 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> new file mode 100644
> index 000000000000..df3e822232d3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +
> +&pwrap {
> +	pmic: pmic {
> +		compatible = "mediatek,mt6359";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		mt6359codec: mt6359codec {
> +		};
> +
> +		regulators {
> +			mt6359_vs1_buck_reg: buck_vs1 {
> +				regulator-name = "vs1";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +			mt6359_vgpu11_buck_reg: buck_vgpu11 {
> +				regulator-name = "vgpu11";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1 2>;
> +			};
> +			mt6359_vmodem_buck_reg: buck_vmodem {
> +				regulator-name = "vmodem";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-ramp-delay = <10760>;
> +				regulator-enable-ramp-delay = <200>;
> +			};
> +			mt6359_vpu_buck_reg: buck_vpu {
> +				regulator-name = "vpu";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1 2>;
> +			};
> +			mt6359_vcore_buck_reg: buck_vcore {
> +				regulator-name = "vcore";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1 2>;
> +			};
> +			mt6359_vs2_buck_reg: buck_vs2 {
> +				regulator-name = "vs2";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1600000>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +			mt6359_vpa_buck_reg: buck_vpa {
> +				regulator-name = "vpa";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3650000>;
> +				regulator-enable-ramp-delay = <300>;
> +			};
> +			mt6359_vproc2_buck_reg: buck_vproc2 {
> +				regulator-name = "vproc2";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +				regulator-ramp-delay = <7500>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1 2>;
> +			};
> +			mt6359_vproc1_buck_reg: buck_vproc1 {
> +				regulator-name = "vproc1";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +				regulator-ramp-delay = <7500>;
> +				regulator-enable-ramp-delay = <200>;
> +				regulator-allowed-modes = <0 1 2>;
> +			};
> +			mt6359_vcore_sshub_buck_reg: buck_vcore_sshub {
> +				regulator-name = "vcore_sshub";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +			};
> +			mt6359_vgpu11_sshub_buck_reg: buck_vgpu11_sshub {
> +				regulator-name = "vgpu11_sshub";
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1193750>;
> +			};
> +			mt6359_vaud18_ldo_reg: ldo_vaud18 {
> +				regulator-name = "vaud18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +			mt6359_vsim1_ldo_reg: ldo_vsim1 {
> +				regulator-name = "vsim1";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +			};
> +			mt6359_vibr_ldo_reg: ldo_vibr {
> +				regulator-name = "vibr";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +			mt6359_vrf12_ldo_reg: ldo_vrf12 {
> +				regulator-name = "vrf12";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1300000>;
> +			};
> +			mt6359_vusb_ldo_reg: ldo_vusb {
> +				regulator-name = "vusb";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <960>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
> +				regulator-name = "vsram_proc2";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <7500>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vio18_ldo_reg: ldo_vio18 {
> +				regulator-name = "vio18";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1900000>;
> +				regulator-enable-ramp-delay = <960>;
> +				regulator-always-on;
> +			};
> +			mt6359_vcamio_ldo_reg: ldo_vcamio {
> +				regulator-name = "vcamio";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1900000>;
> +			};
> +			mt6359_vcn18_ldo_reg: ldo_vcn18 {
> +				regulator-name = "vcn18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +			mt6359_vfe28_ldo_reg: ldo_vfe28 {
> +				regulator-name = "vfe28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +			mt6359_vcn13_ldo_reg: ldo_vcn13 {
> +				regulator-name = "vcn13";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1300000>;
> +			};
> +			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
> +				regulator-name = "vcn33_1_bt";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3500000>;
> +			};
> +			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
> +				regulator-name = "vcn33_1_wifi";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3500000>;
> +			};
> +			mt6359_vaux18_ldo_reg: ldo_vaux18 {
> +				regulator-name = "vaux18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsram_others_ldo_reg: ldo_vsram_others {
> +				regulator-name = "vsram_others";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +			mt6359_vefuse_ldo_reg: ldo_vefuse {
> +				regulator-name = "vefuse";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <2000000>;
> +			};
> +			mt6359_vxo22_ldo_reg: ldo_vxo22 {
> +				regulator-name = "vxo22";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vrfck_ldo_reg: ldo_vrfck {
> +				regulator-name = "vrfck";
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <1700000>;
> +			};
> +			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
> +				regulator-name = "vrfck";
> +				regulator-min-microvolt = <1240000>;
> +				regulator-max-microvolt = <1600000>;
> +			};
> +			mt6359_vbif28_ldo_reg: ldo_vbif28 {
> +				regulator-name = "vbif28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +			mt6359_vio28_ldo_reg: ldo_vio28 {
> +				regulator-name = "vio28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vemc_ldo_reg: ldo_vemc {
> +				regulator-name = "vemc";
> +				regulator-min-microvolt = <2900000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
> +				regulator-name = "vemc";
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
> +				regulator-name = "vcn33_2_bt";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3500000>;
> +			};
> +			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
> +				regulator-name = "vcn33_2_wifi";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3500000>;
> +			};
> +			mt6359_va12_ldo_reg: ldo_va12 {
> +				regulator-name = "va12";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-always-on;
> +			};
> +			mt6359_va09_ldo_reg: ldo_va09 {
> +				regulator-name = "va09";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1200000>;
> +			};
> +			mt6359_vrf18_ldo_reg: ldo_vrf18 {
> +				regulator-name = "vrf18";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1810000>;
> +			};
> +			mt6359_vsram_md_ldo_reg: ldo_vsram_md {
> +				regulator-name = "vsram_md";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <10760>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +			mt6359_vufs_ldo_reg: ldo_vufs {
> +				regulator-name = "vufs";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1900000>;
> +			};
> +			mt6359_vm18_ldo_reg: ldo_vm18 {
> +				regulator-name = "vm18";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <1900000>;
> +				regulator-always-on;
> +			};
> +			mt6359_vbbck_ldo_reg: ldo_vbbck {
> +				regulator-name = "vbbck";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1200000>;
> +			};
> +			mt6359_vsram_proc1_ldo_reg: ldo_vsram_proc1 {
> +				regulator-name = "vsram_proc1";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +				regulator-ramp-delay = <7500>;
> +				regulator-enable-ramp-delay = <240>;
> +				regulator-always-on;
> +			};
> +			mt6359_vsim2_ldo_reg: ldo_vsim2 {
> +				regulator-name = "vsim2";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +			};
> +			mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
> +				regulator-name = "vsram_others_sshub";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1293750>;
> +			};
> +		};
> +
> +		mt6359rtc: mt6359rtc {
> +			compatible = "mediatek,mt6358-rtc";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> index 0205837fa698..808be492e970 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> @@ -5,6 +5,7 @@
>   */
>  /dts-v1/;
>  #include "mt8192.dtsi"
> +#include "mt6359.dtsi"
>  
>  / {
>  	model = "MediaTek MT8192 evaluation board";
> -- 
> 2.25.1
> 
> 
