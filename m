Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD3C83D56
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Aug 2019 00:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfHFW1s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Aug 2019 18:27:48 -0400
Received: from vps.xff.cz ([195.181.215.36]:59796 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbfHFW1r (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 6 Aug 2019 18:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1565130464; bh=YnUe9nO1reZh1wJeAJ2u1t5MU9YY2rsyNLvvyCQTrAE=;
        h=Date:From:To:Subject:References:X-My-GPG-KeyId:From;
        b=cmOTNyqtomCaAE49oK6zE4xyHw9UqWaLRTjlBrdtuMu8jNY0c6mX1wCXWmHtBHWhS
         Mh+QXQi5tJGiNzVEuRYie/4TnHF1mgSe46qsMKc5+XY7rwvydKSZQui5d46/DuApnu
         uIMfFW3U+NGf1GQ+bMd9bnaZf4bOfkOT9QTUi7+A=
Date:   Wed, 7 Aug 2019 00:27:44 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Message-ID: <20190806222744.xqxocjfwbl3g5z4g@core.my.home>
Mail-Followup-To: Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806183045.edhm3qzpegscf2z7@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Aug 06, 2019 at 08:30:45PM +0200, megous hlavni wrote:
> On Mon, Apr 15, 2019 at 04:18:12PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> > <linux-sunxi@googlegroups.com> wrote:
> > >
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > I went through the datasheets for H6 and H5, and compared the differences.
> > > RTCs are largely similar, but not entirely compatible. Incompatibilities
> > > are in details not yet implemented by the rtc driver though.
> > >
> > > I also corrected the clock tree in H6 DTSI.
> > 
> > Please also add DCXO clock input/output and XO clock input to the bindings
> > and DT, and also fix up the clock tree. You can skip them in the driver for
> > now, but please add a TODO. As long as you don't change the clock-output-name
> > of osc24M, everything should work as before.
> > 
> > We just want the DT to describe what is actually there. For the XO input,
> > you could just directly reference the external crystal node. The gate for
> > it is likely somewhere in the PRCM block, which we don't have docs for.
> 
> So I was thinking about this for a while, and came up with this:
> 
> ----------------- arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi -----------------
> index 64c39f663d22..ac99ddbebe5c 100644
> @@ -627,14 +635,15 @@
> 
>  		rtc: rtc@7000000 {
>  			compatible = "allwinner,sun50i-h6-rtc";
>  			reg = <0x07000000 0x400>;
>  			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> -			clock-output-names = "osc32k", "osc32k-out", "iosc";
> -			clocks = <&ext_osc32k>;
> +			clock-output-names = "osc32k", "osc32k-out", "iosc", "hosc";
> +			clock-names = "losc", "dcxo";
> +			clocks = <&ext_osc32k>, <&osc24M>;
>  			#clock-cells = <1>;
>  		};
> 
>  		r_ccu: clock@7010000 {
>  			compatible = "allwinner,sun50i-h6-r-ccu";
>  			reg = <0x07010000 0x400>;
> 
> I'm not completely sure how (or why?) to describe in DTSI which oscillator the
> designer used (XO vs DCXO). This information is signalled by the pad voltage and
> can be determined at runtime from DCXO_CTRL_REG's OSC_CLK_SRC_SEL (bit 3). It's
> not possible to change at runtime.
> 
> HOSC source selection is only material to the CPUS (ARISC) firmware when it
> wants to turn off all PLLs and the main crystal oscillator so that it knows
> which one to turn off. I don't see any other use for it. It's just
> informational. I don't think (future) crust firmware has space to be reading
> DTBs, so the detection will be using OSC_CLK_SRC_SEL anyway.
> 
> Maybe whether XO or DCXO is used also matters if you want to do some fine
> tunning of DCXO (control register has pletny of options), but that's probably
> better done in u-boot. And there's still no need to read HOSC source from DT.
> The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> be using this info to gate/disable the osciallator.
> 
> If we really want this in DT, maybe we can model it by having just two input
> clocks to RTC described in DTSI, and the DTSI for H6 would have this by default:
> 
> 	clock-names = "losc", "dcxo";
> 	clocks = <&ext_osc32k>, <&osc24M>;
> 
> And the board designer could change it from a board file, like this:
> 
> &rtc {
> 	clock-names = "losc", "xo";
> 	clocks = <&ext_osc32k>, <&osc24M>;
> };
> 
> The driver could decide which oscillator is used by the presence of either
> dcxo or xo input clock.
> 
> But in any case, the driver can also get this info from DCXO_CTRL_REG's
> OSC_CLK_SRC_SEL, so it doesn't need to read this from DT at all. So it's a bit
> pointless.
> 
> So I see two options:
> 
> 1) skip adding dcxo/xo to input clocks of RTC completely
> 2) the above
> 
> What do you think?

I tried option 2) and it feels pointless. It just creates this clock tree:

osc24M
  hosc
    plls...

from:

osc24M
  plls...

and doesn't achieve anything else, other than complicating things, for no reason
because no driver will ever need or use this info from the DT.

So my preference is for keeping it simple and going with option 1).

regards,
	o.


> regards,
> 	o.
> 
> 
> > > There's a small detail here, that's not described absolutely correctly in
> > > DTSI, but the difference is not really that material. ext_osc32k is
> > > originally modelled as a fixed clock that feeds into RTC module, but in
> > > reality it's the RTC module that implements via its registers enabling and
> > > disabling of this oscillator/clock.
> > >
> > > Though:
> > > - there's no other possible user of ext_osc32k than RTC module
> > > - there's no other possible external configuration for the crystal
> > >   circuit that would need to be handled in the dts per board
> > >
> > > So I guess, while the description is not perfect, this patch series still
> > > improves the current situation. Or maybe I'm misunderstanding something,
> > > and &ext_osc32k node just describes a fact that there's a crystal on
> > > the board. Then, everything is perhaps fine. :)
> > 
> > Correct. The external clock nodes are modeling the crystal, not the internal
> > clock gate / distributor.
> > 
> > Were the vendor to not include the crystal (for whatever reasons), the DT
> > should be able to describe it via the absence of the clock input, and the
> > driver should correctly use the internal (inaccurate) oscillator. I realize
> > the clocks property is required, and the driver doesn't handle this case
> > either, so we might have to fix that if it were to appear in the wild.
> > 
> > > For now, the enable bit for this oscillator is toggled by the re-parenting
> > > code automatically, as needed.
> > 
> > That's fine. No need to increase the clock tree depth.
> > 
> > ChenYu
> > 
> > > This patchset is necessary for implementing the WiFi/Bluetooth support
> > > on boards using H6 SoC.
> > >
> > > Please take a look.
> > >
> > > Thank you and regards,
> > >   Ondrej Jirman
> > >
> > > Ondrej Jirman (3):
> > >   dt-bindings: Add compatible for H6 RTC
> > >   rtc: sun6i: Add support for H6 RTC
> > >   arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree
> > >
> > >  .../devicetree/bindings/rtc/sun6i-rtc.txt     |  1 +
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
> > >  drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
> > >  3 files changed, 55 insertions(+), 16 deletions(-)
> > >
> > > --
> > > 2.21.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > For more options, visit https://groups.google.com/d/optout.
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
