Return-Path: <linux-rtc+bounces-4582-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A695B112D8
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 23:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A69F57B9BFE
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 21:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B1E2750ED;
	Thu, 24 Jul 2025 21:11:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8711494C3;
	Thu, 24 Jul 2025 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391480; cv=none; b=MStmh4h4xM7KInCwX1r7YX08qrE6OIiStRVc/Z/850eG6jYQvU+tw5ZOMjX++r77Qq6F9zw0KCuLsgSpxb3MdDKa04c3xjgkOC/6Ez50viX5kyVRDnlMIrSO29JAhFGqoMrlE3edlqsft0iUkBuJhO+Z+VmuuknC0JmPuKyXtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391480; c=relaxed/simple;
	bh=Sg/5pE6bUeWBvnfigj1Hnnl3+6CiShL1sby6PguO+14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB1Y0/+qhFrCSWiZW4RCJHVjQpWVd2YZPDG8d6H9e1EpcZhPN8/f75P3bVemaIqXcBQHgJL3yT+vb1fRTgXvwlkPcIGDdRssyzi9ukOuoGdNvOEXaNOqf+PgkoPcUisTNN1zAl3sZ4pIqO6X/Z1/prd47vHMsLa0HJCgrrpxWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE945340D1F;
	Thu, 24 Jul 2025 21:11:17 +0000 (UTC)
Date: Fri, 25 Jul 2025 05:11:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Message-ID: <20250724211113-GYA748868@gentoo>
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-7-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724202511.499288-7-elder@riscstar.com>

Hi Alex,

On 15:25 Thu 24 Jul     , Alex Elder wrote:
> Define properties for the I2C adapter that provides access to the
> SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index fe22c747c5012..7c9f91c88e01a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -40,6 +40,21 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
..
> +	#address-cells = <1>;
> +	#size-cells = <0>;
I think these two can be moved into dtsi, as they are
common and fixed properties for the i2c controller

> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
..
> +		status = "okay";
status property here can be dropped as enabled by default
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 3810557374228..96d7a46d4bf77 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -11,6 +11,13 @@
>  #define K1_GPIO(x)	(x / 32) (x % 32)
>  
>  &pinctrl {
> +	i2c8_cfg: i2c8-cfg {
> +		i2c8-0-pins {
> +			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
> +				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
> +		};
> +	};
> +
>  	uart0_2_cfg: uart0-2-cfg {
>  		uart0-2-pins {
>  			pinmux = <K1_PADCONF(68, 2)>,
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95c..2a5a132d5a774 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
>  			status = "disabled";
>  		};
>  
> +		i2c8: i2c@d401d800 {
> +			compatible = "spacemit,k1-i2c";
> +			reg = <0x0 0xd401d800 0x0 0x38>;
..
> +			interrupts = <19>;
I'd suggest to move interrupts property after clock, see my similar
comment
https://lore.kernel.org/all/20250724121916-GYA748228@gentoo/

> +			clocks = <&syscon_apbc CLK_TWSI8>,
> +				 <&syscon_apbc CLK_TWSI8_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			status = "disabled";
> +		};
> +
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
>  			reg = <0x0 0xd401e000 0x0 0x400>;
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

