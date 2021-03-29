Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B7934D3BC
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Mar 2021 17:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhC2PZG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Mar 2021 11:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhC2PYo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Mar 2021 11:24:44 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFD2C061574;
        Mon, 29 Mar 2021 08:24:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo6857869wmq.4;
        Mon, 29 Mar 2021 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DVh8ABWZMn5onrGWDFwrbIkxxxKmdyTojDChdzXMDdM=;
        b=gsuZZWyVbmxOotMTmV9Jewaimv43W3UY+SFzeDxXvQq3H1/jc2FWayvkBNzNfnUHpp
         dkGBSXIhjJS/dGFzPHnHepL1LkX5B2cGI7z6p/TEnZe0mgZJHYdaYZNawQ25JH+KE8jl
         E9DWyZtxVGv2Mgv0/zyNwk05208A3Mm1hzmyjqd+tslELJiNT+s81Rr36yP3BzxvfcIi
         JicHDwWEy3Zzrkv/rZmmHUuigdcE0KRowbJeHH8W2oE5igEs0MCkZcthetxsTZVu2Qr0
         xjMtqz4E9kHIMvDOgSzYznSIuzIi3iVx0np4PF2uoPCz30JmKcOq7kJ+9Xx9cK/liKUj
         Z2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DVh8ABWZMn5onrGWDFwrbIkxxxKmdyTojDChdzXMDdM=;
        b=NQoR6kfQ0VXLfq8Ao3JePy1U5567vYiyRQIRfAHgcarmHweEXl2NJPcOl7RZHez8q/
         hlqKg+STYEGI5jAGLqM377/WbjvgK1xkGh+mGHjfjEMdKem87/HjK2KTx5k1Hnnns3Rl
         CQc1mOkB6SpBuCMe/Evn9CfXufPGS0Rq2K0GDuY57O3G1U9UjZBuY51eLojdls6NhnW7
         bdWjufR3wbFgPjAI44Xil5LY8sbGcGf/iD/jAQXVdihxGh3YCGsslTl8cSAvycAHxu/J
         FOke1VEFtXAcmT7Arwl5NVtXsm8xoIuJza75/n+Lm9U0I4eU7CmrQjQW0fHoaoHFQDir
         HH8Q==
X-Gm-Message-State: AOAM530Jw5UmFWPFcr0YkcbhC+uHdB3M4GGSoRch9ybxIj9No4BROXp7
        yILGZ/s13h9dojCe3mMQ2B8=
X-Google-Smtp-Source: ABdhPJzvtT+jutilUi3594HWfeelYpD/A/H90sg8Z4VGRV4PnuIvvRHQu2/tPmD8pOJ41C3NSK+iig==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr25666834wmc.114.1617031482588;
        Mon, 29 Mar 2021 08:24:42 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com. [80.174.240.175])
        by smtp.gmail.com with ESMTPSA id n8sm28534001wrm.70.2021.03.29.08.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:24:41 -0700 (PDT)
Subject: Re: [PATCH v6 8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Wen Su <wen.su@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-9-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <54050d27-49f1-1c62-49d7-66b761fbb450@gmail.com>
Date:   Mon, 29 Mar 2021 17:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615829757-3223-9-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 15/03/2021 18:35, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
> 
> add PMIC MT6359 related nodes which is for MT6779 platform
> 
> Signed-off-by: Wen Su <wen.su@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v5:
> - update file date.
> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi    | 298 ++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   1 +
>  2 files changed, 299 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> new file mode 100644
> index 000000000000..84235db460f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
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
> +		mt6359regulator: regulators {

should be just:
regulators {

Other than that looks good to me.

Regards,
Matthias

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
> 
