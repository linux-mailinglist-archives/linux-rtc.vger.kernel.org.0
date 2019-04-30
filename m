Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FF7F75D
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 13:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbfD3L6q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 07:58:46 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35847 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730650AbfD3LrE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 07:47:04 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1D5E31C000C;
        Tue, 30 Apr 2019 11:47:02 +0000 (UTC)
Date:   Tue, 30 Apr 2019 13:47:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] rtc: digicolor: set range
Message-ID: <20190430114702.GD11339@piout.net>
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
 <20190430093212.28425-2-alexandre.belloni@bootlin.com>
 <877ebbu3lz.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877ebbu3lz.fsf@tarshish>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2019 14:36:24+0300, Baruch Siach wrote:
> Hi Alexandre,
> 
> On Tue, Apr 30 2019, Alexandre Belloni wrote:
> 
> > While the range of REFERENCE + TIME is actually 33 bits, the counter
> > itself (TIME) is a 32-bits seconds counter.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/rtc/rtc-digicolor.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> > index 5bb14c56bc9a..e6e16aaac254 100644
> > --- a/drivers/rtc/rtc-digicolor.c
> > +++ b/drivers/rtc/rtc-digicolor.c
> > @@ -206,6 +206,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, rtc);
> >  
> >  	rtc->rtc_dev->ops = &dc_rtc_ops;
> > +	rtc->rtc_dev->range_max = U32_MAX;
> 
> Where can I find documentation on the meaning and usage of the range_max
> value? I could not find anything in the kernel source.
> 

It should be set to the maximum UNIX timestamp the RTC can be set to
while keeping range_min to range_max contiguous.

In the digicolor case, you could go up to 8589934590 (Wed Mar 16
12:56:30 UTC 2242) but the driver only writes DC_RTC_REFERENCE and I'm
not sure it can also update DC_RTC_TIME safely.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
