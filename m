Return-Path: <linux-rtc+bounces-4570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B362AB10789
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 12:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 075EDAA5862
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 10:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACC2260575;
	Thu, 24 Jul 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDrsj7RG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA625FA3B;
	Thu, 24 Jul 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753352094; cv=none; b=DXqUgDrLqVwm6JrOdU4f8Iyhzd4SywT9pS5r3+rgmzPZ4UgQyS1rv+xiTPoUR8AYAvaLY7S6wYd2J+oxPdwP8WV/xZ3yFSe6IvFIFGENDmxsdQkGFL2mQRElhftuxHXcxMmKZW+rwTrfJZ8gUDvin6/yrKdq7vTqnezd/OCsjko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753352094; c=relaxed/simple;
	bh=zORcxo3mS6brPEl87DE6MRdiyeVVqdihj/3FCEKbiTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSKkmBkuJsCw8rawUtgzccMF6pBcCKZYskU7exrgp0uSDFFQIsyD/Qktm1WSKVDYiWJPh2YUcOosPhnFmXsUu1zLCODN0WB+XR7Y+p9irRDhR3lGq9bvfN0yuoRxN13iXVZzR76YZd/gUnCb357l1NmOKWgKht99NFPXuGWiBdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDrsj7RG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D83C4CEF4;
	Thu, 24 Jul 2025 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753352093;
	bh=zORcxo3mS6brPEl87DE6MRdiyeVVqdihj/3FCEKbiTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDrsj7RGaUKmRFe2YmNRj6/sLBAYZIQjaT4lMyvILBdotUjyjjp9PjzGhfiKnPkhb
	 wdo+ZkLnBwjW8MtDK3qrZT7gMrPKySmosNZNHnzunk3wcRAkiPozCGDIZanfeUFgR1
	 JifMizySQ87kY9Pm3P9t03L8anZuOJDiarkZFUJ0flEAYrfHrsK18EJ2xknSeOXqRz
	 kOeRWhTUSd9D/VoqhMCSIepkmo4hSmWSqD2ge6ibK6qHY9ZAPPSgQIbGWpUypKRJcv
	 guW2Mq5oK6fCWyBpdzQlM/jYkEZrA0jC4Wt0ykT5pBBgdlJdG5Mk+6GNzR10ZpJps1
	 lO2wqUbfktYPw==
Date: Thu, 24 Jul 2025 11:14:47 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250724101447.GY11056@google.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
 <20250723095125.GR11056@google.com>
 <877dcf99-107e-4d96-8790-6608976d13ca@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877dcf99-107e-4d96-8790-6608976d13ca@riscstar.com>

On Wed, 23 Jul 2025, Alex Elder wrote:

> On 7/23/25 4:51 AM, Lee Jones wrote:
> > On Thu, 10 Jul 2025, Alex Elder wrote:
> > 
> > > All devices supported by simple MFD use the same 8-bit register 8-bit
> > > value regmap configuration.  There is an option available for a device
> > > to specify a custom configuration, but no existing device uses it.
> > > 
> > > Rather than specify a "full" regmap configuration to change only
> > > the max_register value, Lee Jones suggested allowing max_register
> > > to be specified in the simple_mfd_data structure.  If regmap_config
> > > and max_register are both supplied, the max_register field is ignored.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > Suggested-by: Lee Jones <lee@kernel.org>
> > > ---
> > > v8: - Use regmap_config_8r_8v, modifying it if max_register supplied
> > > 
> > >   drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
> > >   drivers/mfd/simple-mfd-i2c.h | 3 ++-
> > >   2 files changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > index 22159913bea03..5138aa72140b5 100644
> > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > @@ -24,15 +24,16 @@
> > >   #include "simple-mfd-i2c.h"
> > > -static const struct regmap_config regmap_config_8r_8v = {
> > > +static struct regmap_config regmap_config_8r_8v = {
> > >   	.reg_bits = 8,
> > >   	.val_bits = 8,
> > > +	/* .max_register can be specified in simple_mfd_data */
> > 
> > Drop this comment please.
> > 
> > >   };
> > >   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
> > >   {
> > >   	const struct simple_mfd_data *simple_mfd_data;
> > > -	const struct regmap_config *regmap_config;
> > > +	struct regmap_config *regmap_config;
> > >   	struct regmap *regmap;
> > >   	int ret;
> > > @@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
> > >   		regmap_config = &regmap_config_8r_8v;
> > >   	else
> > >   		regmap_config = simple_mfd_data->regmap_config;
> > > +	if (simple_mfd_data && !simple_mfd_data->regmap_config)
> > > +		regmap_config->max_register = simple_mfd_data->max_register;
> > 
> > If max_register is set in simple_mfd_data, it should take precedence.
> 
> I don't really agree with that.  If simple_mfd_data->regmap_config
> is provided, why not use the max_register field already available
> there?

Why would a user add a max_register override to simple_mfd_data if they
didn't want to use it?

> This is why I said above that I think this feature doesn't add
> much value.  It provides a second way to specify something, but
> in the end it complicates the code more than it's worth.
> 
> The only time this new simple_mfd_data->max_register field seems
> to make sense is if it were the only thing provided (without
> simple_mfd_data->regmap_config being supplied).  In that case,
> I see the benefit--a null simple_mfd_data->regmap_config means
> use regmap_config_8r_8v, and overlay it with the max_register
> value.  The new max_register field avoids defining another huge
> but mostly empty regmap_config structure.

This is your use-case, right?

> Anyway, back to your original point:  I said in v7 "If both
> are specified, the max_register value is ignored" and I think
> that's the simplest.  Specify one or the other--if you want
> to define things in regmap_config, then that's where you add
> your max_register.  If you like regmap_config_8r_8v but want
> to define a max_register value, just provide max_register.
> 
> If you insist, I'll do what you say but before I sent another
> version I wanted to explain my reasoning.

I hear you and I get what you're saying.

I see no use-case where a user would provide both regmap_config AND
max_register either.  However, I see max_register in simple_mfd_data as
an override, so I would like it to take precedence please.

> > if (simple_mfd_data && simple_mfd_data->max_register)
> > 	regmap_config->max_register = simple_mfd_data->max_register;
> > 
> > >   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
> > > +	regmap_config->max_register = 0;
> > 
> > Does max_register definitely have persistence over subsequent calls?
> 
> It is a global variable.  Isn't that how they work?  When
> it was read-only there was no concern about that, nor about
> any possible concurrent access (though I don't think multiple
> probes can be using this code at once).
> 
> We could allocate a new one each time instead.
> 
> I think what I offered in v5 was acceptable.  If you're
> willing to accept that I will be happy to keep discussing
> (and implementing) the max_register feature.

Yes, I'm inclined to agree.

Make the call and I will respect your decision.

-- 
Lee Jones [李琼斯]

