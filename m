Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1EA4BAEB
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2019 16:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfFSOOZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Jun 2019 10:14:25 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53151 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfFSOOZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Jun 2019 10:14:25 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 69DE040005;
        Wed, 19 Jun 2019 14:14:22 +0000 (UTC)
Date:   Wed, 19 Jun 2019 16:14:19 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dylan Howey <Dylan.Howey@tennantco.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] rtc: pcf2123: port to regmap
Message-ID: <20190619141419.GN23549@piout.net>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
 <20190503195149.31297-2-Dylan.Howey@tennantco.com>
 <20190619131925.GM23549@piout.net>
 <20190619134248.GA16304@tennantco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619134248.GA16304@tennantco.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/06/2019 13:42:52+0000, Dylan Howey wrote:
> The 06/19/2019 15:19, Alexandre Belloni wrote:
> > I'm ready to apply that series but...
> > 
> > On 03/05/2019 19:52:10+0000, Dylan Howey wrote:
> > >  static int pcf2123_read_offset(struct device *dev, long *offset)
> > >  {
> > > -	int ret;
> > > -	s8 reg;
> > > +	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
> > > +	int ret, val;
> > > +	unsigned int reg;
> > >  
> > > -	ret = pcf2123_read(dev, PCF2123_REG_OFFSET, &reg, 1);
> > > -	if (ret < 0)
> > > +	ret = regmap_read(pdata->map, PCF2123_REG_OFFSET, &reg);
> > > +	if (ret)
> > >  		return ret;
> > >  
> > > +	val = sign_extend32((reg & OFFSET_MASK), OFFSET_SIGN_BIT);
> > > +
> > >  	if (reg & OFFSET_COARSE)
> > > -		reg <<= 1; /* multiply by 2 and sign extend */
> > > -	else
> > > -		reg = sign_extend32(reg, OFFSET_SIGN_BIT);
> > > +		val *= 2;
> > >  
> > 
> > Please remove that change that sneaked in ;)
> > 
> > -- 
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> I believe this change is necessary. In the old code reg was 8-bit, which
> means reg <<= 1 was discarding the coarse bit. Now that I'm using a
> larger reg I can't use that trick and have to use sign_extend32 and a
> multiply.
> 

That's correct.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
