Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD34449E60
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Nov 2021 22:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240502AbhKHVnD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Nov 2021 16:43:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57946
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240524AbhKHVnD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Nov 2021 16:43:03 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 773653F1ED
        for <linux-rtc@vger.kernel.org>; Mon,  8 Nov 2021 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636407617;
        bh=xMlhz60Y7Re9w6VZ4mCdMM9k1oT7By2/e2a+Ful96Aw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=n7tx2GeDQUCwefzrPqQv56Gx2rTPNcS640Yj9BjD3CMX3lEsXauBt+dpX9/VmPIwU
         evITa5oN5vpzWLFHX3SGNN6dse8e5/ghXVGlsh0bNBl2VVTWymd0ZF9PSoMi2MtbO+
         ilT5DB6V+aPq4xAU4sK1HwXEhPlDzzIpUeLo11XPLZD4yxoA66YKzVj6P6BQOtuUpx
         S2UnzDmMVT9Rh3Al9a1I1sAEpTl11vtu0HbEbRx0kt8v31UREpDPlMFhqjsLEe//vT
         S/vSRx7VeExKoUTelTMb9SPCAYagnAgUlWqUKm2GnhCM2OoByvk6+2zu6IBLdmVbUn
         B9I4f/WCqgVwg==
Received: by mail-lf1-f71.google.com with SMTP id p19-20020a056512139300b003ff6dfea137so7001133lfa.9
        for <linux-rtc@vger.kernel.org>; Mon, 08 Nov 2021 13:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xMlhz60Y7Re9w6VZ4mCdMM9k1oT7By2/e2a+Ful96Aw=;
        b=OrveZ5z0JEsp+O+SsfEYUS9n4qKPlyVXR101MqH55WwSFcYQLFfo1mtZeLyUDbn2N4
         8sVJGeV7wUAKcOQzRzyZBcRu74NbHUmk4kOLE9IJU3Zmoxv5N72wUUvkyvsskOnRj0yi
         8rWoWiiPY83rrobm1hqeXu6nwZDJ929sod4UAR26T1plKEGfrZc47OaBjjMJO+b532WQ
         WPmt4oMAgISTomJkO7+jtWcsfurx8ZjSX7yVEEHqehpmboYyQMhg67An+AHxp4PME4iS
         JD1zMn8L1DmhCmhYyywmjKwKdrZxstYlgKbUyanSgnRxiRdAfezz5xlOCb+/3MQsKNhZ
         DTeg==
X-Gm-Message-State: AOAM531ECR1VKcdMXGsvfMuaVm+uWU8EN4KX8OXG3lX1hIAF35cM0Krp
        FzxTnO+Vspc1UvEITOQMp0U2ci/2x6uMbK+8W1hgn48z5ht2qpz1jyRbvamsZZ4feMenI2N2AVV
        IUA5DCiYhO+sFuaayZJnW8jzpjcextlk5jVcfgA==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr2168826lfq.307.1636407614495;
        Mon, 08 Nov 2021 13:40:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym1HJFJOCiKpshotep+fEMHGVvuCHCUht7Znnr1Fptl/CMGw7zMKN16qBDQpX9jY7h2z+d7w==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr2168813lfq.307.1636407614293;
        Mon, 08 Nov 2021 13:40:14 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h18sm295563ljh.133.2021.11.08.13.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:40:13 -0800 (PST)
Message-ID: <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
Date:   Mon, 8 Nov 2021 22:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-13-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the device tree for the icicle kit by splitting it into a third part,
> which contains peripherals in the fpga fabric, add new peripherals
> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> map which have been changed.

This should be multiple commits because you mix up refactoring (split)
and adding new features. The patch is really, really difficult to
review. I gave up in the middle.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
>  .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
>  3 files changed, 428 insertions(+), 85 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> new file mode 100644
> index 000000000000..8fa3356494f1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +	fpgadma: fpgadma@60020000 {
> +		compatible = "microchip,mpfs-fpga-dma-uio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x0 0x60020000 0x0 0x1000>;
> +		interrupt-parent = <&plic>;
> +		interrupts = <PLIC_INT_FABRIC_F2H_2>;
> +		status = "okay";
> +	};
> +
> +	fpgalsram: fpga_lsram@61000000 {

Node names go with hyphen, but actually you should not need it, because
the name should be generic, e.g. "uio".

However there is no such compatible and checkpatch should complain about it.

> +		compatible = "generic-uio";
> +		reg = <0x0 0x61000000 0x0 0x0001000
> +			0x14 0x00000000 0x0 0x00010000>;
> +		status = "okay";
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index fc1e5869df1b..4212129fcdf1 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>  
>  /dts-v1/;
>  
> @@ -13,72 +13,187 @@ / {
>  	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>  
>  	aliases {
> -		ethernet0 = &emac1;
> -		serial0 = &serial0;
> -		serial1 = &serial1;
> -		serial2 = &serial2;
> -		serial3 = &serial3;> +		mmuart0 = &mmuart0;
> +		mmuart1 = &mmuart1;
> +		mmuart2 = &mmuart2;
> +		mmuart3 = &mmuart3;
> +		mmuart4 = &mmuart4;

Why? Commit msg does not explain it.

>  	};
>  
>  	chosen {
> -		stdout-path = "serial0:115200n8";
> +		stdout-path = "mmuart1:115200n8";
>  	};
>  
>  	cpus {
>  		timebase-frequency = <RTCCLK_FREQ>;
>  	};
>  
> -	memory@80000000 {
> +	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
> -		reg = <0x0 0x80000000 0x0 0x40000000>;
> -		clocks = <&clkcfg 26>;
> +		reg = <0x0 0x80000000 0x0 0x2e000000>;
> +		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x0 0x0 0x40000000>;
> +		clocks = <&clkcfg CLK_DDRC>;
> +		status = "okay";
>  	};
>  };
>  
> -&serial0 {
> +&mmuart1 {
>  	status = "okay";
>  };
>  
> -&serial1 {
> +&mmuart2 {
>  	status = "okay";
>  };
>  
> -&serial2 {
> +&mmuart3 {
>  	status = "okay";
>  };
>  
> -&serial3 {
> +&mmuart4 {
>  	status = "okay";
>  };
>  
>  &mmc {
>  	status = "okay";
> -
>  	bus-width = <4>;
>  	disable-wp;
>  	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>  	card-detect-delay = <200>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
>  	sd-uhs-sdr12;
>  	sd-uhs-sdr25;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
>  };
>  
> -&emac0 {
> +&spi0 {
> +	status = "okay";
> +	spidev@0 {
> +		compatible = "spidev";

1. There is no such compatible,
2. You should have big fat warning when booting, so such DT cannot be
accepted.

> +		reg = <0>; /* CS 0 */
> +		spi-max-frequency = <10000000>;
> +		status = "okay";
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	pac193x: pac193x@10 {

Generic node name. Looks like compatible is not documented, so first
bindings.


> +		compatible = "microchip,pac1934";
> +		reg = <0x10>;
> +		samp-rate = <64>;
> +		status = "okay";
> +		ch0: channel0 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDREG";
> +			channel_enabled;
> +		};
> +		ch1: channel1 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDA25";
> +			channel_enabled;
> +		};
> +		ch2: channel2 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDD25";
> +			channel_enabled;
> +		};
> +		ch3: channel3 {
> +			uohms-shunt-res = <10000>;
> +			rail-name = "VDDA_REG";
> +			channel_enabled;
> +		};
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
>  	phy-mode = "sgmii";
>  	phy-handle = <&phy0>;
> -	phy0: ethernet-phy@8 {
> -		reg = <8>;
> -		ti,fifo-depth = <0x01>;
> -	};
>  };
>  
> -&emac1 {
> +&mac1 {

I gave up here, it's not easy to find what is effect of refactoring,
what is a new node.

Best regards,
Krzysztof
