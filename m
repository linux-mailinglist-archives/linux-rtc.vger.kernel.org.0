Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB67433DB2
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 19:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhJSRsv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 13:48:51 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49439 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhJSRsv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 13:48:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E870B1BF206;
        Tue, 19 Oct 2021 17:46:36 +0000 (UTC)
Date:   Tue, 19 Oct 2021 19:46:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <YW8EfIFolQ2SmBHt@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <YW7wTY5VOsPMAT3v@piout.net>
 <CAPLW+4=nO8oPRnGL5PhRJyRZ6gEhA0pe2SOjQ6hrwo=SV_z1zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPLW+4=nO8oPRnGL5PhRJyRZ6gEhA0pe2SOjQ6hrwo=SV_z1zA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 19:31:55+0300, Sam Protsenko wrote:
> On Tue, 19 Oct 2021 at 19:20, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 19/10/2021 16:17:22+0300, Sam Protsenko wrote:
> > > This RTC driver only accepts dates from 2000 to 2099 year. It starts
> > > counting from 2000 to avoid Y2K problem, and S3C RTC only supports 100
> > > years range. Provide this info to RTC framework.
> > >
> > > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > ---
> > >  drivers/rtc/rtc-s3c.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > > index 10e591794276..d9994efd70ef 100644
> > > --- a/drivers/rtc/rtc-s3c.c
> > > +++ b/drivers/rtc/rtc-s3c.c
> > > @@ -454,6 +454,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
> > >       }
> > >
> > >       info->rtc->ops = &s3c_rtcops;
> > > +     info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> > > +     info->rtc->range_max = RTC_TIMESTAMP_END_2099;
> > >
> >
> > This change is missing the if (year < 0 || year >= 100)  removal in
> > s3c_rtc_settime()
> >
> 
> It's not actually removed in [PATCH 3/4] (if I'm following you
> correctly), it was replaced with this code:
> 
> <<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
>     if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
>         dev_err(dev, "rtc only supports 100 years\n");
>         return -EINVAL;
>     }
> <<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
> 

After setting the range, the core will never pass values outside of this
range so it is not necessary to check in the driver anymore.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
