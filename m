Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DCB1F590C
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 18:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgFJQcM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 12:32:12 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35311 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730635AbgFJQcK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 12:32:10 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1FF9AFF80B;
        Wed, 10 Jun 2020 16:32:08 +0000 (UTC)
Date:   Wed, 10 Jun 2020 18:32:07 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: pcf2127: add alarm support
Message-ID: <20200610163207.GY3720@piout.net>
References: <20200609210549.GU3720@piout.net>
 <C3DJH5QYGX12.2IGEWO7P3BZKU@atris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3DJH5QYGX12.2IGEWO7P3BZKU@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/06/2020 11:49:06-0400, Liam Beguin wrote:
> Hi Alexandre,
> 
> On Tue Jun 9, 2020 at 11:05 PM Alexandre Belloni wrote:
> > On 07/06/2020 13:06:09-0400, liambeguin@gmail.com wrote:
> > >  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> > > @@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
> > >  
> > >  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
> > >  
> > > +	device_init_wakeup(dev, true);
> > > +
> > 
> > This can't be done unconditionally, You need to have been able to
> > request an interrupt or the wakeup-source property needs to be present.
> > 
> > The interrupt handler is also missing from the patch.
> 
> Like I tried to explain in the cover letter, the interrupt line isn't
> connected to the CPU on the board I'm using.
> I'd be glad to add the interrupt handler to this patch. Is there a way I
> can make it conditional?

It is necessarily conditional, as it won't be used if no interrupt is
provided.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
