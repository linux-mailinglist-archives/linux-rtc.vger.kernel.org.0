Return-Path: <linux-rtc+bounces-4451-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AFAFFE2B
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 11:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AEB2188978C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 09:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340682D3A70;
	Thu, 10 Jul 2025 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgnrWZZh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372113B797;
	Thu, 10 Jul 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139864; cv=none; b=sqjFkfVsK8IJqcZR7I6+g+JKxxbaFAbZozjOzx0UCeGEEIRWr8TF+wIM3T0WypNteKUgK9faXnRvVxTh+8JAqMcEqKfeEtS/aoqgy+3mmFr0Q+uEY4H7Jr9HIOH/92dtYBmpvsEr44PyHnCQrp/AGMs21je23SVtppLCaQPj4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139864; c=relaxed/simple;
	bh=1OLkTH0gr4EINtmVQDgFQSV7pdSOH8fbDNoEe6kjG44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3uV9oBQtvMBOMPZ8/t9v2yqDNIqVqoAmx+LDyyRWU2yiiNWj0N291eWm+adAtwbh3c5Phrz3UEq0JPmdUfiFfu8RpFHqUbA/buIsUyvGKmhlfOLdXkpq4PB0Ewty9I0KSjShjCM3jyndcA4W5uqj3AGB+zdR1GqcCpWnUFoapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgnrWZZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2501AC4CEE3;
	Thu, 10 Jul 2025 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139863;
	bh=1OLkTH0gr4EINtmVQDgFQSV7pdSOH8fbDNoEe6kjG44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgnrWZZhKrXP7/aOzpkQbf0KXBDvyyOqr7EZONh4albsSi23wrnb+ar9iNJmfdVn7
	 I8kgJKoFVGBt3X4a3S6qb+hAGpqScuzFkOMfVMc6m73ej1+ih5CJoQsTwd9+ni26YI
	 syd9SjVgYkOWlgMMMD53IB5Ndcrn8P+AODBrLC8wfT6EI1TFtUolaEuYaDmbUcXbv2
	 1WGUsM9wvHlgZG0gP68OT6ILVz5ypKzT9E4aQhhBWp0hLwPYCGIqNiP975IaMkMNTt
	 HFl0cnBMKLH6B84s0D0HmkoUBKXlOY33w/0vqOVSfbnrPi5VqtgR11vwsNVjd3m8Pm
	 x/ruH+RDvZ32w==
Date: Thu, 10 Jul 2025 10:30:57 +0100
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
Subject: Re: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250710093057.GB1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
 <20250710092448.GA1431498@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710092448.GA1431498@google.com>

On Thu, 10 Jul 2025, Lee Jones wrote:

> On Wed, 02 Jul 2025, Alex Elder wrote:
> 
> > All devices supported by simple MFD use the same 8-bit register
> > 8-bit value regmap configuration.  There is an option available
> > for a device to specify a custom configuration, but no existing
> > device uses it.
> > 
> > Rather than specify a "full" regmap configuration to use this
> > option, Lee Jones suggested allowing just the max_register value
> > to be specified in the simple_mfd_data structure.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Suggested-by: Lee Jones <lee@kernel.org>
> > ---
> > v2: - Allow max_register *and* regmap_config to be supplied
> > 
> >  drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
> >  drivers/mfd/simple-mfd-i2c.h |  1 +
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > index 22159913bea03..3f959f4f98261 100644
> > --- a/drivers/mfd/simple-mfd-i2c.c
> > +++ b/drivers/mfd/simple-mfd-i2c.c
> > @@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
> >  {
> >  	const struct simple_mfd_data *simple_mfd_data;
> >  	const struct regmap_config *regmap_config;
> 
> > +	struct regmap_config config;
> 
> Why do we need another regmap_config?
> 
> Can't we just remove the const and make use of the one above?
> 
> >  	struct regmap *regmap;
> >  	int ret;
> >  
> >  	simple_mfd_data = device_get_match_data(&i2c->dev);
> >  
> >  	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> > -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> > +	if (simple_mfd_data) {
> > +		if (simple_mfd_data->regmap_config)
> > +			config = *simple_mfd_data->regmap_config;
> 
> 			regmap_config = simple_mfd_data->regmap_config;
> 
> > +		else
> > +			config = regmap_config_8r_8v;
> 
> 			regmap_config = &regmap_config_8r_8v;
> > +
> > +		if (simple_mfd_data->max_register)
> > +			config.max_register = simple_mfd_data->max_register;
> > +		regmap_config = &config;
> > +	} else {
> >  		regmap_config = &regmap_config_8r_8v;
> 
> I suspect we don't need to have this line twice.
> 
> Either re-jig the if () above (I suspect this explains the existing
> complexity [multiple conditions]) or pre-set regmap_config to
> regmap_config_8r_8v and only over-write it if the conditions are met.

Not sure why this whole thing had to be reworked.

Why didn't the 2-liner I gave you work for you?

-- 
Lee Jones [李琼斯]

