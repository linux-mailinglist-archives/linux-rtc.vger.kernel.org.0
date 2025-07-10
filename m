Return-Path: <linux-rtc+bounces-4450-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547EAFFE00
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 11:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E101657B9
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51223292B33;
	Thu, 10 Jul 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beM95PWF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6E220F32;
	Thu, 10 Jul 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139496; cv=none; b=LDduIhkvv0DHGC4y8y0KDEHWudwdTQobCsphzr7ZgYysBBUoBbq/SCZKPFxrNFP3xOvQiCp+3b97YtMBvtqZXxsEUKQqBCjnOa5ffXWM3Za4C8/KdADMoLOy5Ku6wTxT5swEERb+kFoiGR75eNjWgGSn8ldB+37s7YevNPco0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139496; c=relaxed/simple;
	bh=/45peu3NvT7yg087IQ10UDKJ5n9K7DKeEA4oRGGZWNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb8xeyt0RqnYWZmPIrZYN6H4VwXT5wl5sMP8bKQQTQBH7X4FEemcg9dwQI9g2dr3BRNTFn73uc0TfqH9aGDIFO0Wf2hOCogVkMxBAzazET77ZgLHycq3sF90inxmZZGQqiZsD8bOI2dC7So6ksH3qtjqFIh97rychZmuKe78yqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beM95PWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342BCC4CEE3;
	Thu, 10 Jul 2025 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139495;
	bh=/45peu3NvT7yg087IQ10UDKJ5n9K7DKeEA4oRGGZWNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beM95PWFxm2r486Twz81PQr1zgS6iAhoqDAROgBDSunXl2Jk6Xvp0H+VJRCHzyHQo
	 M/c4RCCLAP2NCCfTSNLWmshbUligbKhEOSp2/fCNFybUXute9W1QUmHtRfKgl27hCx
	 IUKVxDp4wmeG2KRc3OHddX1vmyOO7plwaMEo6GGBohhBqtRHjnOvANs4aEnki1HvwI
	 hxyZ+WzH2wI6/L3ed2aw1ufFFH1T7eta+t47f1IjNSdwxdoWaPyMFSvzDEqdFNS7ZO
	 Q4S2W7aZIz9K2WvKFfUeJBZvhP19jpJEySqYllU57zaABJMag+g19Ngw4yOyGn5+z+
	 DgLlLSkPv8F7g==
Date: Thu, 10 Jul 2025 10:24:48 +0100
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
Message-ID: <20250710092448.GA1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702213658.545163-3-elder@riscstar.com>

On Wed, 02 Jul 2025, Alex Elder wrote:

> All devices supported by simple MFD use the same 8-bit register
> 8-bit value regmap configuration.  There is an option available
> for a device to specify a custom configuration, but no existing
> device uses it.
> 
> Rather than specify a "full" regmap configuration to use this
> option, Lee Jones suggested allowing just the max_register value
> to be specified in the simple_mfd_data structure.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v2: - Allow max_register *and* regmap_config to be supplied
> 
>  drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
>  drivers/mfd/simple-mfd-i2c.h |  1 +
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..3f959f4f98261 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct simple_mfd_data *simple_mfd_data;
>  	const struct regmap_config *regmap_config;

> +	struct regmap_config config;

Why do we need another regmap_config?

Can't we just remove the const and make use of the one above?

>  	struct regmap *regmap;
>  	int ret;
>  
>  	simple_mfd_data = device_get_match_data(&i2c->dev);
>  
>  	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> +	if (simple_mfd_data) {
> +		if (simple_mfd_data->regmap_config)
> +			config = *simple_mfd_data->regmap_config;

			regmap_config = simple_mfd_data->regmap_config;

> +		else
> +			config = regmap_config_8r_8v;

			regmap_config = &regmap_config_8r_8v;
> +
> +		if (simple_mfd_data->max_register)
> +			config.max_register = simple_mfd_data->max_register;
> +		regmap_config = &config;
> +	} else {
>  		regmap_config = &regmap_config_8r_8v;

I suspect we don't need to have this line twice.

Either re-jig the if () above (I suspect this explains the existing
complexity [multiple conditions]) or pre-set regmap_config to
regmap_config_8r_8v and only over-write it if the conditions are met.

> -	else -		regmap_config = simple_mfd_data->regmap_config;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(i2c, regmap_config); if
>  	(IS_ERR(regmap)) diff --git a/drivers/mfd/simple-mfd-i2c.h
>  	b/drivers/mfd/simple-mfd-i2c.h index
>  	7cb2bdd347d97..706b6f53155ff 100644 ---
>  	a/drivers/mfd/simple-mfd-i2c.h +++
>  	b/drivers/mfd/simple-mfd-i2c.h @@ -27,6 +27,7 @@ struct
>  	simple_mfd_data { const struct regmap_config *regmap_config;
>  	const struct mfd_cell *mfd_cell; size_t mfd_cell_size; +
>  	unsigned int max_register; };
>  
>  #endif /* __MFD_SIMPLE_MFD_I2C_H */ -- 2.45.2
> 

-- 
Lee Jones [李琼斯]

