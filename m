Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38D238D7E1
	for <lists+linux-rtc@lfdr.de>; Sun, 23 May 2021 02:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhEWAIY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Sat, 22 May 2021 20:08:24 -0400
Received: from foss.arm.com ([217.140.110.172]:35646 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231479AbhEWAIY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 22 May 2021 20:08:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59FD81042;
        Sat, 22 May 2021 17:06:58 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D1A3F73B;
        Sat, 22 May 2021 17:06:56 -0700 (PDT)
Date:   Sun, 23 May 2021 01:06:43 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 05/17] rtc: sun6i: Add Allwinner H616 support
Message-ID: <20210523010643.7fdfd419@slackpad.fritz.box>
In-Reply-To: <10265315.EKgO2cQaHd@kista>
References: <20210519104152.21119-1-andre.przywara@arm.com>
        <20210519104152.21119-6-andre.przywara@arm.com>
        <10265315.EKgO2cQaHd@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 22 May 2021 09:29:26 +0200
Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sreda, 19. maj 2021 ob 12:41:40 CEST je Andre Przywara napisal(a):
> > The H616 RTC changes its day storage to the newly introduced linear day
> > scheme, so pair the new compatible string with this feature flag.
> > So far the clock parts seem to be the same as the H6, so combine the
> > compatible string with the existing H6 support bits.  
> 
> There is one more difference - H616 alarm value is now broken down to days, 
> hours, minutes and seconds.

That's a good point, that actually requires adjusting the driver in
this respect as well. And contrary to what the manual says ("Counter
Register will down count to zero"), and the previous RTCs do, those alarm
registers now need to be set to the actual wakeup time, not the time
left before wakeup.
Will fix the driver accordingly.

Thanks for the heads up!

Cheers,
Andre

> 
> Best regards,
> Jernej
> 
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 0228e9dfd969..ec0cd0ee539a 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -382,6 +382,8 @@ static void __init sun50i_h6_rtc_clk_init(struct   
> device_node *node)
> >  }
> >  CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
> >  		      sun50i_h6_rtc_clk_init);
> > +CLK_OF_DECLARE_DRIVER(sun50i_h616_rtc_clk, "allwinner,sun50i-h616-rtc",
> > +		      sun50i_h6_rtc_clk_init);
> >  
> >  /*
> >   * The R40 user manual is self-conflicting on whether the prescaler is
> > @@ -773,6 +775,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
> >  	{ .compatible = "allwinner,sun8i-v3-rtc" },
> >  	{ .compatible = "allwinner,sun50i-h5-rtc" },
> >  	{ .compatible = "allwinner,sun50i-h6-rtc" },
> > +	{ .compatible = "allwinner,sun50i-h616-rtc",
> > +		.data = (void *)RTC_LINEAR_DAY },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> > -- 
> > 2.17.5
> > 
> >   
> 
> 

