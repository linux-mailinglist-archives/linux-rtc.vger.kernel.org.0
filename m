Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522861A7938
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 13:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390853AbgDNLQJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 07:16:09 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58671 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390852AbgDNLQH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 07:16:07 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E9207240008;
        Tue, 14 Apr 2020 11:16:00 +0000 (UTC)
Date:   Tue, 14 Apr 2020 13:16:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu.Beznea@microchip.com
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Message-ID: <20200414111600.GE34509@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
 <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/04/2020 08:42:08+0000, Claudiu.Beznea@microchip.com wrote:
> > Why would one use the RTT while the RTC is far superior?
> 
> I didn't enabled this for a particular use case, but: couldn't this be used
> by some user that wants to generate multiple alarms? from multiple RTCs?
> 

I very much doubt that as Linux is able to properly multiplex alarms and
basically, the only one we are interested in is actually wakeup.

> Moreover, this IP's counter has the possibility of being clocked at 1Hz.
> Couldn't this minimize the power consumption while being in a power saving
> mode?
> 

And that 1Hz clock is coming from the RTC so using the RTC is
definitively consuming less power.

> > 
> >>>
> >>> In any case, this diff should be merge with the other at91-sam9x60ek.dts
> >>> change instead of being with the dtsi change.
> >>
> >> The changes in this patch are related to enabling the RTT. The other dts
> >> change is related to enabling gpbr. The RTT uses that enabled gpbr -> one
> >> change per patch.
> >>
> >> If you still want to merge then, I'll do it, but then it becomes mixed.
> >>
> > 
> > This patch is already mixing add the gpbr in sam9x60ek and add the node
> > in sam9x60.dtsi which is worse.
> 
> This patch is like this:
> 
> diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts
> b/arch/arm/boot/dts/at91-sam9x60ek.dts
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
> 
> It doesn't adds the GPBR in sam9x60ek, it adds rtt in sam9x60ek which uses
> GPBR.
> 
> > 
> > Just have one patch adding the rtt node to the sam9x60.dtsi and then a
> > patch adding the RTT to sam9x60ek.
> 
> Ok, I understand this.
> 
> > Because the RTT uses the gpbr, it is
> > a good time to add enable the gpbr, this is a single functionnal change.
> > 
> > Let's say that for some reason, the RTT patch on sam9x60ek has to be
> > reverted, then the RTT node is still defined which is good for all the
> > other eventual users.
> 
> RTT node would still be defined but GPBR node will not be enabled.
> 
> If RTT patch contains this change that I understand you want me to merge here:
> 
> +&gpbr {
> +	status = "okay";
> +};
> +
> 
> then, theoretically, some other IPs using the GPBR (RTC have the
> possibility of doing this), may be broken by reverting the RTT patch that
> includes the GPBR enabling patch.
> 

But this is very unlikely to happen because this would be limited to a
single board device tree instead of impact every sam9x60 based boards.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
