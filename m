Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC9AF2B4
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfD3JW7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:22:59 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44663 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfD3JW7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:22:59 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EA81E1BF20F;
        Tue, 30 Apr 2019 09:22:56 +0000 (UTC)
Date:   Tue, 30 Apr 2019 11:22:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Howey, Dylan" <Dylan.Howey@tennantco.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Message-ID: <20190430092256.GC11339@piout.net>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net>
 <20190429150913.GA15052@tennantco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429150913.GA15052@tennantco.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/04/2019 15:09:18+0000, Howey, Dylan wrote:
> Thanks for the quick response. This is actually the first time I've
> submitted changes to this project.
> 
> The 04/27/2019 15:00, Alexandre Belloni wrote:
> > > -static int pcf2123_write_reg(struct device *dev, u8 reg, u8 val)
> > > -{
> > > -	u8 txbuf[2];
> > > +static const struct regmap_range pcf2123_ranges[] = {
> > > +	{
> > > +		.range_min = PCF2123_REG_CTRL1,
> > > +		.range_max = PCF2123_REG_CTDWN_TMR,
> > > +	},
> > > +};
> > >  
> > > -	txbuf[0] = reg;
> > > -	txbuf[1] = val;
> > > -	return pcf2123_write(dev, txbuf, sizeof(txbuf));
> > > -}
> > > +static const struct regmap_access_table pcf2123_access_table = {
> > > +	.yes_ranges = pcf2123_ranges,
> > > +	.n_yes_ranges = ARRAY_SIZE(pcf2123_ranges),
> > > +};
> > 
> > This covers all the registers, I don't think this is necessary.
> > 
> This would cover the same registers that are exposed by the sysfs
> interface. I can take out the timer registers since this driver does not
> support the periodic timer.
> 

What I meant is that you probably don't need the access table as the
whole range is already between 0 and max_register so there is no need to
double check.

> I agree with the rest of your feedback. When I send a V2 patch should I
> respond to this thread?
> 

This should be sent as a separate thred.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
