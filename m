Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB022B31AC
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Nov 2020 01:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKOAtT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 19:49:19 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:54355 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgKOAtT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 19:49:19 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5A0C2100006;
        Sun, 15 Nov 2020 00:49:16 +0000 (UTC)
Date:   Sun, 15 Nov 2020 01:49:15 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Sandeep Sheriker <sandeepsheriker.mallikarjun@microchip.com>
Subject: Re: [PATCH] rtc: at91rm9200: add correction support
Message-ID: <20201115004915.GS4556@piout.net>
References: <20201108232001.1580128-1-alexandre.belloni@bootlin.com>
 <edfb367f-0a97-f7ef-1a75-8d4d8f5f536b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edfb367f-0a97-f7ef-1a75-8d4d8f5f536b@microchip.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/2020 14:18:27+0100, Nicolas Ferre wrote:
> Hi Alexandre,
> 
> Thanks you for adding this feature to newest at91 RTC IPs.
> 
> 
> On 09/11/2020 at 00:20, Alexandre Belloni wrote:
> > The sama5d4 and sama5d2 RTCs are able to correct for imprecise crystals, up
> 
> FYI, sam9x60 RTC has the same correction capability.
> 
> ... and I now realize that sam9x60 using sam9x5-rtc compatibility sting is
> maybe not the right choice...
> 

I did see that when I reviewed the sam9x60 dtsi and it has its own
compatible string upstream.

> > to 1953 ppm.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >   drivers/rtc/rtc-at91rm9200.c | 103 +++++++++++++++++++++++++++++++++--
> >   1 file changed, 99 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> > index 5e811e04cb21..1eea187d9850 100644
> > --- a/drivers/rtc/rtc-at91rm9200.c
> > +++ b/drivers/rtc/rtc-at91rm9200.c
> > @@ -36,6 +36,10 @@
> >   #define                AT91_RTC_UPDCAL         BIT(1)          /* Update Request Calendar Register */
> > 
> >   #define        AT91_RTC_MR             0x04                    /* Mode Register */
> > +#define                AT91_RTC_HRMOD          BIT(0)          /* 12/24 hour mode */
> > +#define                AT91_RTC_NEGPPM         BIT(4)          /* Negative PPM correction */
> > +#define                AT91_RTC_CORRECTION     GENMASK(14, 8)  /* Slow clock correction */
> > +#define                AT91_RTC_HIGHPPM        BIT(15)         /* High PPM correction */
> > 
> >   #define        AT91_RTC_TIMR           0x08                    /* Time Register */
> >   #define                AT91_RTC_SEC            GENMASK(6, 0)   /* Current Second */
> > @@ -77,6 +81,9 @@
> >   #define                AT91_RTC_NVTIMALR       BIT(2)          /* Non valid Time Alarm */
> >   #define                AT91_RTC_NVCALALR       BIT(3)          /* Non valid Calendar Alarm */
> > 
> > +#define AT91_RTC_CORR_DIVIDEND         3906000
> > +#define AT91_RTC_CORR_LOW_RATIO                20
> 
> IMHO, it's worth telling here that these values are from the product
> datasheet in formula coming from explanation of HIGHPPM bit of register
> RTC_MR.
> 
> > +static int at91_rtc_setoffset(struct device *dev, long offset)
> > +{
> > +       long corr;
> > +       u32 mr;
> > +
> > +       if (offset > AT91_RTC_CORR_DIVIDEND / 2)
> > +               return -ERANGE;
> > +       if (offset < -AT91_RTC_CORR_DIVIDEND / 2)
> > +               return -ERANGE;
> > +
> > +       mr = at91_rtc_read(AT91_RTC_MR);
> > +       mr &= ~(AT91_RTC_NEGPPM | AT91_RTC_CORRECTION | AT91_RTC_HIGHPPM);
> > +
> > +       if (offset > 0)
> > +               mr |= AT91_RTC_NEGPPM;
> > +       else
> > +               offset = -offset;
> > +
> > +       /* offset less than 764 ppb, disable correction*/
> 
> Does it correspond to the 1.5 ppm value of the datasheet?
> (sorry I'm not so used to these computations?)
> 

Yes, 764ppb is closer to 1525ppb (the 1.5ppm from the datasheet) than 0
so at that point it starts to make sense to correct the offset.

> > +       if (offset < 764) {
> > +               at91_rtc_write(AT91_RTC_MR, mr & ~AT91_RTC_NEGPPM);
> > +
> > +               return 0;
> > +       }
> > +
> > +       /*
> > +        * 29208 ppb is the perfect cutoff between low range and high range
> > +        * low range values are never better than high range value after that.
> 
> And here, I'm lost. Does it correspond to the sentence:
> "HIGHPPM set to 1 is recommended for 30 ppm correction and above." ? And
> rounding using register values, am I right?
> 

The values in the datasheet are not that well rounded, the comment is
really the answer, starting with 29208ppb, with highppm = 1 the values
are a superset of the ones with highppm = 0

> > +        */
> > +       if (offset < 29208) {
> > +               corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset * AT91_RTC_CORR_LOW_RATIO);
> > +       } else {
> > +               corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset);
> > +               mr |= AT91_RTC_HIGHPPM;
> > +       }
> > +
> > +       if (corr > 128)
> 
> Okay, it's maximized to the width of register field, got it.
> 

Yes, this handles corrections between 764ppb and 1525ppb.

> > +               corr = 128;
> 
> I'm kind of following and don't know what other RTC drivers are doing... but
> would prefer more explanation on numerical values.
> 

Well, there isn't much more to explain. However, I think the IP could be
a bit more friendly because high correction values means very little
correction is happening. Also, NEGPPM is reversed versus other RTCs and
it was not 100% clear from the datasheet.

> Alexandre, you know much more than me about the habits of RTC drivers
> writers. Even if I would like a little more documentation on values used, I
> absolutely won't hold this feature adoption, so here is my:
> 
> Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> 

The offset calculations are usually coming directly from the datasheet
so it is not unusual to have little explanation. It is obviously easier
when there is a more direct correlation between the register value and
the offset value in ppb.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
