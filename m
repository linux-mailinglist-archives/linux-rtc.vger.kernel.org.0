Return-Path: <linux-rtc+bounces-4538-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F1B0EEC5
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 11:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F9417FC3E
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 09:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F972877FB;
	Wed, 23 Jul 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jg5aYMkV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C7B283141;
	Wed, 23 Jul 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264292; cv=none; b=YjIQovZgjOfLacjpoVqkc4YGiT+T60YddnR4fbjbfFWjd2eN+3Cc4nleYyi/qqP5BXJAWjcYPQR6XdnV1CyNF1wMc73r9uoPcXYgr4Dtb3VdVb48+bjf6Y/TqG9/qjYVjzPVLS0x9zSiLf1GMI4jQHgplsvMiyAfDTvWGOA4Y6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264292; c=relaxed/simple;
	bh=wXjG20KF++mohZAH82whMjcdBO3WgxTkFDej6WjYGKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB8G01LIHNS1G3U4qekspj5KG8gd0S1/nCNy5nR1VjE8KI1Vr3x9zGUlodsWBi42cJZMOgqlE0HJhgDi1vEC9DHYfUUsoHavIU8fOAZoK0cww+mp0TeBbEe72k7ZKjJNpKgSErXU+K6vbxHJNq/kku4S76Vr9zzF3xhlP/bsIqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jg5aYMkV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9761CC4CEE7;
	Wed, 23 Jul 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753264292;
	bh=wXjG20KF++mohZAH82whMjcdBO3WgxTkFDej6WjYGKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg5aYMkVGz1FmNjRpleo21K2HbOH++CwJlJB5kEXO6Cy00OTib+Kmm14pG6kH65ip
	 ytlCj34yf2c1WsgTr7JBftxDXfACRw5BsZ0kRr1cxVECFA2qPqZahYsfoYk/Zu89S6
	 0C5eeDdwg9L2Y5d+OfqT1yHOKlfHuTvSONFoVo5YMf1ADoeHDI2e0/UHjJabLAo+4T
	 lYWJ1Tw85Ep6j5uHVwu22vaMFYHKIwemckIrB6VeLfBn5qoNYk7hWmWd0uA0MTPYKo
	 0r9W2dUMrQQOflJdvmXEUKxwFDXlLUMAbx0lBNrDG3UsctiLjCTJ8OATi4iDlZ5/Og
	 qvPImRcHSSg0A==
Date: Wed, 23 Jul 2025 10:51:25 +0100
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
Message-ID: <20250723095125.GR11056@google.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710175107.1280221-3-elder@riscstar.com>

On Thu, 10 Jul 2025, Alex Elder wrote:

> All devices supported by simple MFD use the same 8-bit register 8-bit
> value regmap configuration.  There is an option available for a device
> to specify a custom configuration, but no existing device uses it.
> 
> Rather than specify a "full" regmap configuration to change only
> the max_register value, Lee Jones suggested allowing max_register
> to be specified in the simple_mfd_data structure.  If regmap_config
> and max_register are both supplied, the max_register field is ignored.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v8: - Use regmap_config_8r_8v, modifying it if max_register supplied
> 
>  drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
>  drivers/mfd/simple-mfd-i2c.h | 3 ++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..5138aa72140b5 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -24,15 +24,16 @@
>  
>  #include "simple-mfd-i2c.h"
>  
> -static const struct regmap_config regmap_config_8r_8v = {
> +static struct regmap_config regmap_config_8r_8v = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> +	/* .max_register can be specified in simple_mfd_data */

Drop this comment please.

>  };
>  
>  static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct simple_mfd_data *simple_mfd_data;
> -	const struct regmap_config *regmap_config;
> +	struct regmap_config *regmap_config;
>  	struct regmap *regmap;
>  	int ret;
>  
> @@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  		regmap_config = &regmap_config_8r_8v;
>  	else
>  		regmap_config = simple_mfd_data->regmap_config;
> +	if (simple_mfd_data && !simple_mfd_data->regmap_config)
> +		regmap_config->max_register = simple_mfd_data->max_register;

If max_register is set in simple_mfd_data, it should take precedence.

if (simple_mfd_data && simple_mfd_data->max_register)
	regmap_config->max_register = simple_mfd_data->max_register;

>  	regmap = devm_regmap_init_i2c(i2c, regmap_config);
> +	regmap_config->max_register = 0;

Does max_register definitely have persistence over subsequent calls?

>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
> index 7cb2bdd347d97..ea2a96af8bce4 100644
> --- a/drivers/mfd/simple-mfd-i2c.h
> +++ b/drivers/mfd/simple-mfd-i2c.h
> @@ -24,7 +24,8 @@
>  #include <linux/regmap.h>
>  
>  struct simple_mfd_data {
> -	const struct regmap_config *regmap_config;
> +	struct regmap_config *regmap_config;
> +	unsigned int max_register;	/* Ignored if regmap_config supplied */
>  	const struct mfd_cell *mfd_cell;
>  	size_t mfd_cell_size;
>  };
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]

