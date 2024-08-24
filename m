Return-Path: <linux-rtc+bounces-1728-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAB95DCD0
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 09:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375A81F22622
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2024 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50417154C04;
	Sat, 24 Aug 2024 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3kf4DsW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C46376E9;
	Sat, 24 Aug 2024 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486392; cv=none; b=CnftqOKGVMvfqKEcVkVlNS5rv5nPLQL3VnD3n4niythxyNYHE0BtgfcC8AT74lQv3BXVDhl1vrwXDoat2b0/F0cjp2h37o3rb/DlesLrPeIBkuwng5no6l9YB05RO6blgR9VRjsABp9zMzcBThSndmHjDiXuZrWMbv+CSnLQrkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486392; c=relaxed/simple;
	bh=s1cX48c4dGqS99HJ/A0oVBXL2PLUWSeKDKTkEcyvka4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww7AsqHAKdK1VPr5kwv4oEFIHeAG9WQp8LMpLbttcs/z12B2yE5IbYWuHsN6mnCis1LU+QkOXW3yLvxTP5gCvMODIMX8P2ZBrZJr0SyEhggaaESyHBvVnWUd1UfBk1VygvYecPaJ/FGGcVttifSmDgI31ni1PAkgzvpOGxvVLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3kf4DsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29949C32781;
	Sat, 24 Aug 2024 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724486391;
	bh=s1cX48c4dGqS99HJ/A0oVBXL2PLUWSeKDKTkEcyvka4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3kf4DsWIA5PuvL2zvKI9VfFRzJ/LFvd/5Us+xJzPbRRGhhAFcPQbd9Uxi4p2x0R3
	 3YlMGT3fChqEHdWURhPEdkEWd9GXFU7mK/apEQkFCydM4VW/Bi5nKNZc0aFwMgSesQ
	 TrHFvRyuaxFiCu8agoMq3dYUxL2f4WyJRol6ylhlpI/cV14ETYj5aVoGXIXcrsrmw7
	 oXp6Ni9EJlNcD+E3+u5VwnarTZWriqGpPCQs698XdAX2ZU69V3PGnXxGW9mj8JOPSY
	 E/1ZANTJoMRe1cKwgY6O4vixNp01Xr4bqZebh6OExLVm9ySlktPnxEV/83H7yRIxLd
	 akXJxaGWEMmdg==
Date: Sat, 24 Aug 2024 09:59:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 8/8] ARM: dts: rockchip: Add Relfor Saib board
Message-ID: <3qczmjehmxro534jqmophdx3tkbfb6nkdv4jq35cwttqpfcbkx@6zwvtvdmrcbg>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-9-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823153528.3863993-9-karthikeyan@linumiz.com>

On Fri, Aug 23, 2024 at 09:05:28PM +0530, Karthikeyan Krishnasamy wrote:
> Saib is an consumer electronics board from Relfor
> consists of 1GB RAM, 4GB eMMC.
> Other peripherals:
>  - Bluetooth 4.2
>  - WiFi 5G/2.5G
>  - IR transmitter/receiver
>  - RTC rv3028
>  - User leds
>  - Switch
> 
> Add support for it.
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
>  arch/arm/boot/dts/rockchip/Makefile           |   1 +
>  .../boot/dts/rockchip/rv1109-relfor-saib.dts  | 439 ++++++++++++++++++
>  2 files changed, 440 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
> 
> diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
> index ab4cd9aab722..716f5540e438 100644
> --- a/arch/arm/boot/dts/rockchip/Makefile
> +++ b/arch/arm/boot/dts/rockchip/Makefile
> @@ -2,6 +2,7 @@
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>  	rv1108-elgin-r1.dtb \
>  	rv1108-evb.dtb \
> +	rv1109-relfor-saib.dtb \
>  	rv1109-sonoff-ihost.dtb \
>  	rv1126-edgeble-neu2-io.dtb \
>  	rv1126-sonoff-ihost.dtb \
> diff --git a/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
> new file mode 100644
> index 000000000000..7d7292bad779
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Relfor Labs Pvt. Ltd.
> + */
> +
> +
> +/dts-v1/;
> +#include "rv1109.dtsi"
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Rockchip RV1109 Relfor Saib Board";
> +	compatible = "relfor,saib", "rockchip,rv1109";
> +
> +	vcc5v0_sys: vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	/* Power sequence 1 */
> +	vcc_0v8: vcc-0v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_0v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <800000>;
> +		startup-delay-us = <150>;
> +		regulator-max-microvolt = <800000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* Power sequence 2 */
> +	vdd_npu_vepu: vdd-npu-vepu {
> +		compatible = "pwm-regulator";
> +		pwms = <&pwm1 0 5000 1>;
> +		regulator-name = "vdd_npu_vepu";
> +		regulator-min-microvolt = <650000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-settling-time-up-us = <18000>;
> +		pwm-supply = <&vcc3v3_sys>;
> +		vin-supply = <&vcc5v0_sys>;
> +		status = "okay";

Where is it being disabled?

> +	};
> +
> +	vdd_arm: vdd-arm {
> +		compatible = "pwm-regulator";
> +		pwms = <&pwm0 0 5000 1>;
> +		regulator-name = "vdd_arm";
> +		regulator-min-microvolt = <720000>;
> +		regulator-max-microvolt = <1000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-settling-time-up-us = <18000>;
> +		pwm-supply = <&vcc3v3_sys>;
> +		vin-supply = <&vcc5v0_sys>;
> +		status = "okay";

? same question

> +	};
> +
> +	/* Power sequence 3 */
> +	vcc_1v8: vcc-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		startup-delay-us = <51000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* Power sequence 4 */
> +	vcc_1v2_ddr: vcc-1v2-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v2_ddr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		startup-delay-us = <75000>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* Power sequence 5 */
> +	vcc3v3_sys: vcc3v3-sys {
> +		status = "okay";

Huh? Drop

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		startup-delay-us = <75000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* LDO 2.5V */
> +	vcc_2v5_ddr: vcc-2v5-ddr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_2v5_ddr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		vin-supply = <&vcc3v3_sys>;
> +	};
> +
> +	/* Power IR transmitter */
> +	vcc1v8_ir: vcc1v8-ir {
> +		status = "okay";

Drop

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v8_ir";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	sdio_pwrseq: pwrseq-sdio {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc0>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_enable_h>;
> +		reset-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	ir_receiver: ir-receiver {
> +		compatible = "gpio-ir-receiver";
> +		gpios = <&gpio3  RK_PB4 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ir_rx>;
> +		status = "okay";

Where is it disabled?

> +	};
> +
> +	ir_transmitter: ir-transmitter {
> +		compatible = "pwm-ir-tx";
> +		pwms = <&pwm11 0 10000000 1>;
> +		status = "okay";

Do you see the pattern here? Some NEW nodes have status=okay, some not.
It does not make much sense, right?

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button {
> +			gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
> +			status = "okay";

Drop... this applies everywhere.

> +			linux,code = <KEY_DATA>;
> +			label = "GPIO User Switch";
> +			linux,input-type = <1>;
> +		};

Best regards,
Krzysztof


