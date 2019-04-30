Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F96F97D
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 15:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfD3NFr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 09:05:47 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42883 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfD3NFr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 09:05:47 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 97BEC60006;
        Tue, 30 Apr 2019 13:05:44 +0000 (UTC)
Date:   Tue, 30 Apr 2019 15:05:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] rtc: digicolor: set range
Message-ID: <20190430130544.GF11339@piout.net>
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
 <20190430093212.28425-2-alexandre.belloni@bootlin.com>
 <877ebbu3lz.fsf@tarshish>
 <20190430114702.GD11339@piout.net>
 <875zqvu1l3.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zqvu1l3.fsf@tarshish>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2019 15:20:08+0300, Baruch Siach wrote:
> Hi Alexandre,
> 
> On Tue, Apr 30 2019, Alexandre Belloni wrote:
> > On 30/04/2019 14:36:24+0300, Baruch Siach wrote:
> >> Hi Alexandre,
> >>
> >> On Tue, Apr 30 2019, Alexandre Belloni wrote:
> >>
> >> > While the range of REFERENCE + TIME is actually 33 bits, the counter
> >> > itself (TIME) is a 32-bits seconds counter.
> >> >
> >> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> > ---
> >> >  drivers/rtc/rtc-digicolor.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> >> > index 5bb14c56bc9a..e6e16aaac254 100644
> >> > --- a/drivers/rtc/rtc-digicolor.c
> >> > +++ b/drivers/rtc/rtc-digicolor.c
> >> > @@ -206,6 +206,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
> >> >  	platform_set_drvdata(pdev, rtc);
> >> >
> >> >  	rtc->rtc_dev->ops = &dc_rtc_ops;
> >> > +	rtc->rtc_dev->range_max = U32_MAX;
> >>
> >> Where can I find documentation on the meaning and usage of the range_max
> >> value? I could not find anything in the kernel source.
> >
> > It should be set to the maximum UNIX timestamp the RTC can be set to
> > while keeping range_min to range_max contiguous.
> >
> > In the digicolor case, you could go up to 8589934590 (Wed Mar 16
> > 12:56:30 UTC 2242) but the driver only writes DC_RTC_REFERENCE and I'm
> > not sure it can also update DC_RTC_TIME safely.
> 
> DC_RTC_TIME resets to zero whenever dc_rtc_write writes CMD_RESET to the
> DC_RTC_CONTROL register. DC_RTC_REFERENCE keeps the value that
> dc_rtc_write stores there. So the driver will return values larger than
> U32_MAX if you happen to cross this point in time between dc_rtc_write
> and dc_rtc_read. But you can't store a value larger than U32_MAX in
> DC_RTC_REFERENCE.
> 
> Will the core RTC code handle the U32_MAX cross correctly?
> 

Yes, this is ok to return a valid value that is higher than range_max.
However, at that time, you will not be able to set any alarms anymore as
the core doesn't allow to set alarms after range_max.

I would think that this is fine because this will happen in 2106 and we
have a way to offset the time (the whole goal of setting the range)
using device tree.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
