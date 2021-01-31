Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FD0309C27
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Jan 2021 13:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhAaM5k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 31 Jan 2021 07:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhAaLg6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 31 Jan 2021 06:36:58 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C635C061574;
        Sun, 31 Jan 2021 03:06:39 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c127so10686290wmf.5;
        Sun, 31 Jan 2021 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j6de9L6M3x/UQGIOAHTz9LDOPw3rbDy7Qw98hNo3qF8=;
        b=LPB0ITORv4gs6UTdypnDzG80lbtf6UJnjjdIVa2XZyCN1saGwnVkVrKKEiBr0Nvm1d
         wcK/GMkuN3sCAydDxWzm5BweB0gyps0m9HwUF5P1qH9WbeJ2Pma6/H4JCKYXDtlrXJSz
         FI8FnZqy+TiH3bYH42FAOeilyHFALW3xuKAYlUKijBV9gMMuM6Rk9LrcrsOGbNQ/+fcm
         VYbZy4KOfu33ZBryHg6w1LdZbGQp7BWJ2FUWWyRWeXJwOkIdEA4O3BRnuATCBe2+O0Tz
         okZgzT1lgtgGiYZUlDM3f7Ni5Jor9W3b4RWJiMphxzLNQyvXNWBesichj+X8A31QHTth
         5mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j6de9L6M3x/UQGIOAHTz9LDOPw3rbDy7Qw98hNo3qF8=;
        b=n7UevWlHxBsQd0gX1zyhGgpI+3NOs7eoCR9zSqsvG503WPs8wXtZK8icriQi7+KVnv
         Y7JjoOQlmTORxJRJYI/jBlX4nw9XtLFCkv5whg066RmGW+pqTyKAM5JH7owsgakW1Bx8
         9WcxxnLYzZqTgQMF1uglEmy+bQ/+gZNzGFwGlcNODAzE1RLPQTzsjrK1oITU3l4hk83U
         kv65TmTUyjgcL2k9faVaMQ7bv8J9s9ryNYUlvmkHkQ+ZyJrlDJbUOnqGk4BAWTa8dmNn
         FKNpMv9hakl0XOL/uf6fTyFfYt5oBKKoQQUljOsiLBApQN3NT+P0J4+Y/UTqpKevTXjf
         7uFA==
X-Gm-Message-State: AOAM533G8wHGXZQWxPgs2qukvW79O/V/wtfyW3JyiZNX8KLh91sWZKuH
        oULUzBXgidHwnqqHm9iC4Gg=
X-Google-Smtp-Source: ABdhPJxNPCnDTNLcOCIH6ZyBbFgOaIVVsiY2odh7JFWHjIOKu6z6eHYoaebJycOUsNslKaAtJvpWig==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr10849879wma.3.1612091197873;
        Sun, 31 Jan 2021 03:06:37 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id b3sm19790767wme.32.2021.01.31.03.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 03:06:37 -0800 (PST)
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Wen Su <wen.su@mediatek.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Tzung-Bi Shih <tzungbi@google.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-9-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH RESEND v5 8/8] arm64: dts: mt6359: add PMIC MT6359 related
 nodes
Message-ID: <1cbf58f1-376c-fa93-98a2-53a41fa24273@gmail.com>
Date:   Sun, 31 Jan 2021 12:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611913781-23460-9-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 29/01/2021 10:49, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
> 
> add PMIC MT6359 related nodes which is for MT6779 platform
> 
> Signed-off-by: Wen Su <wen.su@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4:
> - add pmic MT6359 support in the MT8192 evb dts.
> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi    | 298 ++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   1 +
>  2 files changed, 299 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> new file mode 100644
> index 000000000000..4bd85e33a4c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
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

I understand that the dmic-mode and mic-type-X depends on the actual board on
which it is used. In that case I think we should add mt6359codec node in the dts
instead of dtsi file. I'd advise to set these properties as well as otherwise we
get a (slightly misleading) warning in the driver.

I'm adding Jiaxin Yu and Tzung-Bi Shih to the thread so that they can judge if
the warning message is appropriate for a optional property.

Regards,
Matthias

> +
> +		mt6359regulator: regulators {
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
