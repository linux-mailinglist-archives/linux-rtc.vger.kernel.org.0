Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B129F15E58C
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2020 17:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393808AbgBNQmV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Feb 2020 11:42:21 -0500
Received: from mailoutvs57.siol.net ([185.57.226.248]:53551 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388948AbgBNQmU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Feb 2020 11:42:20 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 3F1E752389C;
        Fri, 14 Feb 2020 17:42:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gPTKP3VPISxT; Fri, 14 Feb 2020 17:42:15 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id D26BF52389B;
        Fri, 14 Feb 2020 17:42:15 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 8286452389D;
        Fri, 14 Feb 2020 17:42:14 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: sun6i: Make external 32k oscillator optional
Date:   Fri, 14 Feb 2020 17:42:13 +0100
Message-ID: <5326350.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20200214081443.ajz2sxh5ztk6qb2i@gilmour.lan>
References: <20200213211427.33004-1-jernej.skrabec@siol.net> <20200213211427.33004-2-jernej.skrabec@siol.net> <20200214081443.ajz2sxh5ztk6qb2i@gilmour.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Maxime,

Dne petek, 14. februar 2020 ob 09:14:43 CET je Maxime Ripard napisal(a):
> Hi Jernej,
> 
> Thanks for taking care of this
> 
> On Thu, Feb 13, 2020 at 10:14:26PM +0100, Jernej Skrabec wrote:
> > Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix TX6
> > (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> > matter if external oscillator was enabled because HW detected error and
> > fall back to internal one. H6 has same functionality but it's the first
> > SoC which have "auto switch bypass" bit documented and always enabled in
> > driver. This prevents RTC to work correctly if external crystal is not
> > present on board. There are other side effects - all peripherals which
> > depends on this clock also don't work (HDMI CEC for example).
> > 
> > Make clocks property optional. If it is present, select external
> > oscillator. If not, stay on internal.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/rtc/rtc-sun6i.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 852f5f3b3592..538cf7e19034 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -250,19 +250,17 @@ static void __init sun6i_rtc_clk_init(struct
> > device_node *node,> 
> >  		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> >  	
> >  	}
> > 
> > -	/* Switch to the external, more precise, oscillator */
> > -	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> > -	if (rtc->data->has_losc_en)
> > -		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > +	/* Switch to the external, more precise, oscillator, if present */
> > +	if (of_get_property(node, "clocks", NULL)) {
> > +		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> > +		if (rtc->data->has_losc_en)
> > +			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > +	}
> > 
> >  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> >  	
> >  	/* Yes, I know, this is ugly. */
> >  	sun6i_rtc = rtc;
> > 
> > -	/* Deal with old DTs */
> > -	if (!of_get_property(node, "clocks", NULL))
> > -		goto err;
> > -
> 
> Doesn't that prevent the parents to be properly set if there's an
> external crystal?

No, why?

Check these two clk_summary:
http://ix.io/2bHY Tanix TX6 (no external crystal)
http://ix.io/2bI2 OrangePi 3 (external crystal present)

Please disregard ac200_clk in first case, it's part of another work.

Best regards,
Jernej



