Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8DF1665A3
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Feb 2020 19:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgBTR75 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 20 Feb 2020 12:59:57 -0500
Received: from mailoutvs13.siol.net ([185.57.226.204]:57929 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727298AbgBTR75 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Feb 2020 12:59:57 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 925215246B1;
        Thu, 20 Feb 2020 18:59:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 9gCUlovdAPR5; Thu, 20 Feb 2020 18:59:54 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1F4BF524768;
        Thu, 20 Feb 2020 18:59:54 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id EADDA5246B1;
        Thu, 20 Feb 2020 18:59:52 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: sun6i: Make external 32k oscillator optional
Date:   Thu, 20 Feb 2020 18:59:52 +0100
Message-ID: <4534371.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20200220174749.ih3pcj3oxiwvuurz@gilmour.lan>
References: <20200213211427.33004-1-jernej.skrabec@siol.net> <5326350.DvuYhMxLoT@jernej-laptop> <20200220174749.ih3pcj3oxiwvuurz@gilmour.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne četrtek, 20. februar 2020 ob 18:47:49 CET je Maxime Ripard napisal(a):
> On Fri, Feb 14, 2020 at 05:42:13PM +0100, Jernej Škrabec wrote:
> > Hi Maxime,
> > 
> > Dne petek, 14. februar 2020 ob 09:14:43 CET je Maxime Ripard napisal(a):
> > > Hi Jernej,
> > > 
> > > Thanks for taking care of this
> > > 
> > > On Thu, Feb 13, 2020 at 10:14:26PM +0100, Jernej Skrabec wrote:
> > > > Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix
> > > > TX6
> > > > (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> > > > matter if external oscillator was enabled because HW detected error
> > > > and
> > > > fall back to internal one. H6 has same functionality but it's the
> > > > first
> > > > SoC which have "auto switch bypass" bit documented and always enabled
> > > > in
> > > > driver. This prevents RTC to work correctly if external crystal is not
> > > > present on board. There are other side effects - all peripherals which
> > > > depends on this clock also don't work (HDMI CEC for example).
> > > > 
> > > > Make clocks property optional. If it is present, select external
> > > > oscillator. If not, stay on internal.
> > > > 
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > ---
> > > > 
> > > >  drivers/rtc/rtc-sun6i.c | 14 ++++++--------
> > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > > index 852f5f3b3592..538cf7e19034 100644
> > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > @@ -250,19 +250,17 @@ static void __init sun6i_rtc_clk_init(struct
> > > > device_node *node,>
> > > > 
> > > >  		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > > >  	
> > > >  	}
> > > > 
> > > > -	/* Switch to the external, more precise, oscillator */
> > > > -	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> > > > -	if (rtc->data->has_losc_en)
> > > > -		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > > +	/* Switch to the external, more precise, oscillator, if present 
*/
> > > > +	if (of_get_property(node, "clocks", NULL)) {
> > > > +		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> > > > +		if (rtc->data->has_losc_en)
> > > > +			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > > > +	}
> > > > 
> > > >  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > > >  	
> > > >  	/* Yes, I know, this is ugly. */
> > > >  	sun6i_rtc = rtc;
> > > > 
> > > > -	/* Deal with old DTs */
> > > > -	if (!of_get_property(node, "clocks", NULL))
> > > > -		goto err;
> > > > -
> > > 
> > > Doesn't that prevent the parents to be properly set if there's an
> > > external crystal?
> > 
> > No, why?
> > 
> > Check these two clk_summary:
> > http://ix.io/2bHY Tanix TX6 (no external crystal)
> > http://ix.io/2bI2 OrangePi 3 (external crystal present)
> 
> I was concerned about the "other" parent. In the case where you don't
> have a clocks property (so the check that you are removing), the code
> then registers a clock with two parents: the one that we create (the
> internal oscillator) and the one coming from the clocks property.
> 
> clk_summary only shows the current parent, which is going to be right
> with your patch, but in the case where you have no clocks property,
> you still (attempts to) register two parents, the second one being
> non-functional.
> 
> Further looking at it, we might be good because we allocate an array
> of two clocks, but only register of_clk_get_parent_count(node) + 1
> clocks, so 1 if clocks is missing.

Yes, my patch rely on "of_clk_get_parent_count(node) + 1". If there is no 
property, it will return 1 thus only first parent (internal RC oscilator) will 
be registered.

Anyway, following line:
parents[1] = of_clk_get_parent_name(node, 0);
should evaluate to null. I didn't research further what clk framework does 
with null parent because number of parents will be set to 1 and this null 
value will be ignored anyway.

> 
> Still, I think this should be more obvious, through a comment or
> shuffling a bit the parent registration maybe?

I think code is in correct order, just maybe a bit more explanation in form of 
comment(s) to make it more obvious how it works for either case.

Best regards,
Jernej


