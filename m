Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCC91A4C10
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Apr 2020 00:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJW1C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 18:27:02 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:28127 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDJW1C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 18:27:02 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 56E6F240006;
        Fri, 10 Apr 2020 22:26:59 +0000 (UTC)
Date:   Sat, 11 Apr 2020 00:26:58 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Message-ID: <20200410222658.GB3628@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/04/2020 19:26:58+0300, Claudiu Beznea wrote:
> Add RTT.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  arch/arm/boot/dts/at91-sam9x60ek.dts | 5 +++++
>  arch/arm/boot/dts/sam9x60.dtsi       | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
> index ab3d2d9a420a..4020e79a958e 100644
> --- a/arch/arm/boot/dts/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
> @@ -617,6 +617,11 @@
>  	};
>  };
>  
> +&rtt {
> +	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> +	status = "okay";

Is there any point using a gpbr register while there is already a much
better RTC in the system?

In any case, this diff should be merge with the other at91-sam9x60ek.dts
change instead of being with the dtsi change.

> +};
> +
>  &shutdown_controller {
>  	atmel,shdwc-debouncer = <976>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
> index 326b39328b58..e1d8e3a4cb0b 100644
> --- a/arch/arm/boot/dts/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/sam9x60.dtsi
> @@ -661,6 +661,13 @@
>  				status = "disabled";
>  			};
>  
> +			rtt: rtt@fffffe20 {
> +				compatible = "microchip,sam9x60-rtt";
> +				reg = <0xfffffe20 0x20>;
> +				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				clocks = <&clk32k 0>;
> +			};
> +
>  			pit: timer@fffffe40 {
>  				compatible = "atmel,at91sam9260-pit";
>  				reg = <0xfffffe40 0x10>;
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
