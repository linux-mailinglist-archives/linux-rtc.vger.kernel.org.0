Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C99E3A43D7
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jun 2021 16:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhFKOMy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Jun 2021 10:12:54 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:35780 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhFKOMx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Jun 2021 10:12:53 -0400
Received: by mail-wr1-f41.google.com with SMTP id m18so6241734wrv.2;
        Fri, 11 Jun 2021 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=82URU9cmvTixl2FSwYafFXfSvf8pkNUDh3ZZdJXdmRA=;
        b=TiawNvegfX0DEJ8RUA5HKXCKMSsWWG83+j9VvahcIcT4R5y4imjxyTaxr9yXRTngte
         hJD+ZhggROe4QnY+FFpczp5EfyerJrKz7WAP5W3brfmtP31tDN2ljR566kND1nrmNSNu
         RT6d0Ob6Blrt5y5z+HWVLpNTzIG3M+aNOFZKp+wpRYnjBQDup0VCNaPMLtUTEm325tLo
         ZkK2aYs1BuSbkPf7d/Vbm3LMx3N3FCJIv0vWTqpzbO5jBEdWcBDqLDo1txptc8OAoPiC
         vEmOpeQRj7f1lTMxLV8wLgeDns9ikYnt5NDfoMuzD2XRji1t6WC9haynvF18jtmVtnRX
         3Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=82URU9cmvTixl2FSwYafFXfSvf8pkNUDh3ZZdJXdmRA=;
        b=ESho4/ALyWpvQPViYagMdXleQ/g1Exeg+ognzs3E+PGrjgQdO+vjPJpIgd8bqpDAf0
         CVwKQgWhNPuvgCz0cbkvVoywzbdLQ+jhG5NHKporyuzcvPPHhMc2cv2kZijC/j+RiNNv
         w1guLctWxU9hsrnhQ1VyYAAKGQ0wdg1KDzLzTEfLBJ/PUKvfHAXAKrFQqDXULbjdDnS5
         M13ay31lKAEtk263LyTY2pcdbh/zmDe+PN2NwHUTj4KPj6m4VpJY3zxRth8QiZ38zqSr
         pqKrlhAyQ3YFdlxNXQAFXfUG3HxxY7Cx3pyfE/QQjJxNDEWNRr2xVK2zXxeHrFUn9mmx
         pE1Q==
X-Gm-Message-State: AOAM5319VH/Z+Xe3nUPby486CQkSzMXlY9UI/4FiMMtMQHwrBlhlaOH6
        qf4awy8qW9kIwQsQrTL/C5w=
X-Google-Smtp-Source: ABdhPJykxgZ5xAkJOGIEjM5GoNl5ICzqT66O3C7MAEj+xenMWK55fQxtj1QMWGSGjmhv7wVNt837fg==
X-Received: by 2002:a05:6000:186c:: with SMTP id d12mr4370099wri.123.1623420594915;
        Fri, 11 Jun 2021 07:09:54 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id b22sm6262990wmj.22.2021.06.11.07.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 07:09:54 -0700 (PDT)
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Wen Su <wen.su@mediatek.com>
References: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
Message-ID: <a8de7273-7253-0601-4b8d-5bcab85539f0@gmail.com>
Date:   Fri, 11 Jun 2021 16:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 26/05/2021 08:52, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
> 
> add PMIC MT6359 related nodes which is for MT6779 platform
> 
> Signed-off-by: Wen Su <wen.su@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v7:
> - no change.
> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi    | 298 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   1 +
>  2 files changed, 299 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> new file mode 100644
> index 0000000..18c0d53
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0

Any specific reason for not setting it "SPDX-License-Identifier: (GPL-2.0+ OR
MIT)" ?
	
Other then that, looks good.

Matthias

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
> index 0205837..808be49 100644
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
