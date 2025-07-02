Return-Path: <linux-rtc+bounces-4409-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48574AF5CE4
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 17:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF36E3B8136
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CE62F3637;
	Wed,  2 Jul 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYysf/XG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435A2F2C7C;
	Wed,  2 Jul 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469985; cv=none; b=pFcpUqpsXnfADzAAntEgk3+7O0TJ5h+jGBelM1Z1gJXnLMV65KVLrlSUcE5viPocxrt9hhJ0HkbYAVXK5zsSe2fps/MZ0+VkTR+JfauKoi3hoK3Ak+tm84JZISmpxATKdObA3PROFfM2zBg24sWdh58kRi+78CHPlBDDVx+tyq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469985; c=relaxed/simple;
	bh=6FGi4IEXFYBzu4fdh1wRceFY2PzvofwOUBBMZuvdo+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/3twnoRkG0hHGgKUuFC+D+gK5+7hwVUaXiEyjyQlBQOqymdyb4nTxnrQHK6WXD962n788F6xnTME5Ymu7smIX3Uf4FfZGpojNKpQhxX8KUlnePcTVrWhS9wHvvfjHCtX/DaPKRCyu6MH+peFdvNJ51h85sXK/dX2LcDJK2gWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYysf/XG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A9DC4CEEF;
	Wed,  2 Jul 2025 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469985;
	bh=6FGi4IEXFYBzu4fdh1wRceFY2PzvofwOUBBMZuvdo+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYysf/XGP8UP3XV27Ye7UxMKpGa22OsNG0vhuMOHR+dmAdWzz8r8/bMs2rnjEPKEL
	 KNdpNUnqcLO5Httn8Wrxu0ecJLIh9lmnMFGQYkQI76pdQMifuh4gvim68NUaLuixCd
	 l0OOgAi2/bwbB2Twb8/PoEGzMrKbDUtyiGj3HqVz91Wh6uNhZpWQJyxB8lvubQgHuj
	 XP4TAwPXoemmEHWQoT25cZ5U2kyaFSpAUZrjmOXO59bcK/GCV+OPl76ILeyZ1CcyPU
	 hCIA4FcIgJoKiG/PMAj+ppZyzkoHFOm5T0hnhNAJre4YgX2Jxmgl6WGK8E16p6BuI0
	 tmghfMamJW+GA==
Date: Wed, 2 Jul 2025 16:26:18 +0100
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
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250702152618.GU10134@google.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627142309.1444135-3-elder@riscstar.com>

On Fri, 27 Jun 2025, Alex Elder wrote:

> All devices supported by simple MFD use the same 8-bit register
> 8-bit value regmap configuration.  There is an option available
> for a device to specify a custome configuration, but no existing
> device uses it.
> 
> Lee Jones suggested modifying the simple MFD implementation to
> remove the generality of the full regmap configuration and add a
> max_register value to the simple_mfd_data structure.  This can
> be used in the regmap configuration to limit the valid register
> addresses if desired.  It's simpler, and covers all existing and
> anticipated device types.

Woah, not like this.  I wanted to make the framework _more_ flexible.

Just this should do what you want:

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea0..f43be10c0e60 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -44,6 +44,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
        else
                regmap_config = simple_mfd_data->regmap_config;
 
+       if (simple_mfd_data->max_register)
+               regmap_config->max_register = simple_mfd_data->max_register;
+
        regmap = devm_regmap_init_i2c(i2c, regmap_config);
        if (IS_ERR(regmap))
                return PTR_ERR(regmap);

Plus the one line change in drivers/mfd/simple-mfd-i2c.h.

> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v6: - New patch, changing the simple MFD functionality
> 
>  drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
>  drivers/mfd/simple-mfd-i2c.h |  2 +-
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..c1dc315d44dcf 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -24,27 +24,21 @@
>  
>  #include "simple-mfd-i2c.h"
>  
> -static const struct regmap_config regmap_config_8r_8v = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -};
> -
>  static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct simple_mfd_data *simple_mfd_data;
> -	const struct regmap_config *regmap_config;
> +	struct regmap_config regmap_config = { };
>  	struct regmap *regmap;
>  	int ret;
>  
>  	simple_mfd_data = device_get_match_data(&i2c->dev);
>  
> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> -		regmap_config = &regmap_config_8r_8v;
> -	else
> -		regmap_config = simple_mfd_data->regmap_config;
> +	regmap_config.reg_bits = 8;
> +	regmap_config.val_bits = 8;
> +	if (simple_mfd_data)
> +		regmap_config.max_register = simple_mfd_data->max_register;
>  
> -	regmap = devm_regmap_init_i2c(i2c, regmap_config);
> +	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
> index 7cb2bdd347d97..4121fe1bc1d70 100644
> --- a/drivers/mfd/simple-mfd-i2c.h
> +++ b/drivers/mfd/simple-mfd-i2c.h
> @@ -24,9 +24,9 @@
>  #include <linux/regmap.h>
>  
>  struct simple_mfd_data {
> -	const struct regmap_config *regmap_config;
>  	const struct mfd_cell *mfd_cell;
>  	size_t mfd_cell_size;
> +	unsigned int max_register;
>  };
>  
>  #endif /* __MFD_SIMPLE_MFD_I2C_H */
> -- 
> 2.45.2
> 

-- 
Lee Jones [李琼斯]

