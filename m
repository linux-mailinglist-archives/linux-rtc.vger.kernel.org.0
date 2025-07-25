Return-Path: <linux-rtc+bounces-4587-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9F3B11E77
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 14:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B301A4E6956
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2432E54DB;
	Fri, 25 Jul 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1VSLg4M0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EA2E5400
	for <linux-rtc@vger.kernel.org>; Fri, 25 Jul 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753446452; cv=none; b=bPsdDBZTWG1dOY65vcVo7pkdMq4Cj+tziObYYc3nNm+6opB88G4IXV0FDP9Yvaf9C/AYddnqlmk3fqItjotFNeb5Yww8hVafn7dZIgq4Uj5JsR9SNQwDnaPgNSPWK8JFaK98geysgVpNzrwqUxpErfuTJVmttdFdALQ+zKou2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753446452; c=relaxed/simple;
	bh=Hcy+1FkKcmyE8pc2/30HA2M4yktRO2YfEreRAJCLW5c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RxXA+2Dh8VO6DjDEj3seJGplijhopotBzOwa5LMeY7TwX3FtT2xz0RwqQcS8sdgLn9eZY7bGATtnWVp3AzgqRW4gpT1YT2xdlpRKRVyk9e5F001OVgdN48fVWAgFX2Fl1AZOKYGqXBGX1BLTbwW43bMp61ML/zJqbl2vfZaH4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1VSLg4M0; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3de1875bf9dso14693765ab.2
        for <linux-rtc@vger.kernel.org>; Fri, 25 Jul 2025 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753446449; x=1754051249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=1VSLg4M0As1uRZ0HSlwP2YA9wUNFDo0y8/0IijusydOkvjtDEbGH+GKQ0Z5rlC1zGO
         cnSEUdTnDUXF8XHZ6Znal8Njx5ZLc44cWIaLfzeTotEO53Nmz3YT8dS4CLL0FD3uqcIF
         CTvBzw3vyuI9CROAhoGGQw7fCfvO4RqAdsjrrBDciVOftbqZ1JJwrtxFJ3DZ+lz5BIgI
         datApO63bWk8rBHQ409OsHt+OOw+CHAN1dak+0fAEEkFgVkdoim7f8WlioXymP/YtXFS
         ElN5EOtwYECTpnqz08sxYvdzk5cBjWWVI95HBjQwJV57LyXfM4L6FzgASngxtZGK5ZKm
         tysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446449; x=1754051249;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=RNCeOvmvBHAqDVKl37keHWEE2lzl+4d8aOPzkmMP67u5ry2pVBVjG9+6O4noqWT4XB
         VZMcEVf5EwsDuPUk85bDniH+5qa3rTsddJ/ndXtEGzM2EXG3SZvxLM0pqfllrbTdeEjk
         iAjN0qj/jE4VClWVovo+jhJYa8DMpySA9d2c81u/IPjInj5ZXlbFB59BtjCgJMnPStH+
         5MvBhnTXD0xpQ3B1h77PYI8yLFZHXgWvzwO9pSRD+ndhv+Cpo2W/gp0V3i8Ul/+OfpCM
         FPBFC5D/VpFpmjdbCzrGm3V/sb5qz79aK2Ewe7pHpkSawAHHAPQ2zLJhJxSDLexl47M2
         iUSw==
X-Forwarded-Encrypted: i=1; AJvYcCW94e3ye6OgSo/LYti7RdPn6Qid/o43AlEm0Zt71cH/zV+BoGHedqWU4Zt4oCNk/5rXDtL20i/FgZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YykFTgQD7ywpoW4CgabNNpyhdQGOXKaC3nlQL1PbomtQQq8L/mY
	ygYbQWG1V2zoFUdGbRi+N/F3Yo9oSEHVjQGt881CX7SuyEieHoakwTDnZygboo6D+vk=
X-Gm-Gg: ASbGncuCkP2PvYoyqkXyo4OsM6kU4mNb43WEICEfK/AriqOwW5eadWOE9sE43vC2eXC
	FUzr7JvYZk13m9cyEaef05kgew4aXp3ZgfkxtbrDtqt6AitmoCARdf8s1AwFRos6BkxsxvC4fhd
	qeoqnibQW36vD22bxwSP+jtsyjtjiGpJcp9b0bfQKcgEKceeufdINZvBJKTmF8OtZF53UvDyJ70
	qpylpJVNDfYBMk9LRyyI9dcXyFHWTMjl5uGKMGJOmA6WqHkN+Oy0IU7nQrcbwnzP2uQeaZWY08u
	BdeB8SHxXcbv6adt4kkdzhbpIgsNgB1+zhLfxT2pJoBhtd2grgU0viCXHk210rohcND1b7WM7D9
	vO/Av+X++bLaVrT76kCpJcLrjBUdyKF/WrA==
X-Google-Smtp-Source: AGHT+IGhO7mEEzu6qStEKP3YhLwseiPFmOnrBPl6/OYfukEuwKgUEIwMH1W9FrN/Z85sZ2BLST8iBQ==
X-Received: by 2002:a05:6e02:1a4b:b0:3e3:b7e7:7a67 with SMTP id e9e14a558f8ab-3e3c52b01f6mr23978105ab.14.1753446449421;
        Fri, 25 Jul 2025 05:27:29 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aebd545fsm992684173.57.2025.07.25.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:27:28 -0700 (PDT)
Message-ID: <e236fa5e-7085-419e-bc68-c49f9416847b@riscstar.com>
Date: Fri, 25 Jul 2025 07:27:27 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-3-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250724202511.499288-3-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/25 3:25 PM, Alex Elder wrote:
> All devices supported by simple MFD use the same 8-bit register 8-bit
> value regmap configuration.  There is an option available for a device
> to specify a custom configuration, but no existing device uses it.
> 
> Rather than requiring a "full" regmap configuration to be provided to
> change only the max_register value, Lee Jones suggested allowing
> max_register to be specified in the simple_mfd_data structure.  The
> 8-bit register 8-bit configuration is still used by default, but
> max_register is also applied if it is non-zero.
> 
> If both regmap_config and max_register are provided, the max_register
> field in the regmap_config structure is ignored.

It occurred to me this morning that the regmap_config structure
can be freed after the call to devm_regmap_init_i2c(), so I'm
going to add a function to free it (if it was dynamically
allocated).

					-Alex

> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v9: - max_register takes precedence over regmap_config in simple_mfd_data
>      - New function simple_regmap_config() encapsulates providing config
>      - simple_regmap_config() allocates a regmap_config if necessary
>      - A small duplicated comment is removed in "simple-mfd-i2c.h"
> 
>   drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
>   drivers/mfd/simple-mfd-i2c.h |  5 +----
>   2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..f3ba79c112d4e 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
>   	.val_bits = 8,
>   };
>   
> +/*
> + * Determine regmap config to use.  If no regmap_config is provided,
> + * regmap_config_8r_8v is used.  If max_register is specified it is
> + * (also) used, whether or not regmap_config is provided.
> + */
> +static const struct regmap_config *
> +simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
> +{
> +	struct regmap_config *regmap_config;
> +
> +	if (!data)
> +		return &regmap_config_8r_8v;
> +
> +	if (data->regmap_config && !data->max_register)
> +		return data->regmap_config;
> +
> +	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
> +	if (!regmap_config)
> +		return NULL;
> +
> +	if (data->regmap_config)
> +		*regmap_config = *data->regmap_config;
> +	else
> +		*regmap_config = regmap_config_8r_8v;
> +	if (data->max_register)
> +		regmap_config->max_register = data->max_register;
> +
> +	return regmap_config;
> +}
> +
>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   {
>   	const struct simple_mfd_data *simple_mfd_data;
> @@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   
>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>   
> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> -		regmap_config = &regmap_config_8r_8v;
> -	else
> -		regmap_config = simple_mfd_data->regmap_config;
> +	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
> +	if (!regmap_config)
> +		return -ENOMEM;
>   
>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>   	if (IS_ERR(regmap))
> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
> index 7cb2bdd347d97..6fa36b3d7a217 100644
> --- a/drivers/mfd/simple-mfd-i2c.h
> +++ b/drivers/mfd/simple-mfd-i2c.h
> @@ -8,10 +8,6 @@
>    * shared by all sub-devices.  Children can use their parent's device structure
>    * (dev.parent) in order to reference it.
>    *
> - * This driver creates a single register map with the intention for it to be
> - * shared by all sub-devices.  Children can use their parent's device structure
> - * (dev.parent) in order to reference it.
> - *
>    * Once the register map has been successfully initialised, any sub-devices
>    * represented by child nodes in Device Tree or via the MFD cells in the
>    * associated C file will be subsequently registered.
> @@ -25,6 +21,7 @@
>   
>   struct simple_mfd_data {
>   	const struct regmap_config *regmap_config;
> +	unsigned int max_register;
>   	const struct mfd_cell *mfd_cell;
>   	size_t mfd_cell_size;
>   };


