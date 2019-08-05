Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4047816DC
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 12:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHEKUE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 06:20:04 -0400
Received: from vps.xff.cz ([195.181.215.36]:59036 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfHEKUE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 5 Aug 2019 06:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1565000401; bh=UbKSHNJhmMN1hbm43YULL0GmnUkGg9ph8ySUEjcpnw0=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=gsRiiR+hnT1hK6iZz/qjoDRZZUwcrGRhpW7vfRTN2k5xKzRytohkBdYtwuthstZt2
         GShvGFYLVp7Due3TLXPxA5DD084qKPe0jdHh72dNNW1aFWkq0LPgoS8+R69qLgP1ZH
         0bSenMR3uUaxxtBVF+UvvsOSPh7jTqXHluzeQFEc=
Date:   Mon, 5 Aug 2019 12:20:01 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
Message-ID: <20190805102001.guo7e52bl5agp2w4@core.my.home>
Mail-Followup-To: Chen-Yu Tsai <wens@csie.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
References: <20190412120730.473-1-megous@megous.com>
 <20190412120730.473-3-megous@megous.com>
 <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 05, 2019 at 06:16:14PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> <linux-sunxi@googlegroups.com> wrote:
> >
> > From: Ondrej Jirman <megous@megous.com>
> >
> > RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> > mostly in features that are not yet supported by this driver.
> >
> > Some differences are already stated in the comments in existing code.
> > One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> >
> > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> > external low speed oscillator is working correctly.
> >
> > This patch adds support for enabling LOSC when necessary:
> >
> > - during reparenting
> > - when probing the clock
> >
> > H6 also has capacbility to automatically reparent RTC clock from
> > external crystal oscillator, to internal RC oscillator, if external
> > oscillator fails. This is enabled by default. Disable it during
> > probe.
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 38 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index 11f56de52179..7375a530c565 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -41,9 +41,11 @@
> >  /* Control register */
> >  #define SUN6I_LOSC_CTRL                                0x0000
> >  #define SUN6I_LOSC_CTRL_KEY                    (0x16aa << 16)
> > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS                BIT(15)
> 
> Manual says bit 14? Or is this different from LOSC_AUTO_SWT_EN?
> 
> The rest looks ok.

Yes, see H6 BSP:

drivers/rtc/rtc-sunxi.h

 20 #define REG_CLK32K_AUTO_SWT_EN                  BIT(14)
 21 #define REG_CLK32K_AUTO_SWT_BYPASS              BIT(15)

regards,
	Ondrej

> ChenYu
