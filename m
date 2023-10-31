Return-Path: <linux-rtc+bounces-165-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D867DD11A
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 17:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5FE1C209E8
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95DB200C1;
	Tue, 31 Oct 2023 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRow5zti"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482FA1E515;
	Tue, 31 Oct 2023 16:01:21 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A968BE6;
	Tue, 31 Oct 2023 09:01:19 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b9af7d41d2so5155643b3a.0;
        Tue, 31 Oct 2023 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698768079; x=1699372879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fSkWUAaL15CpGTewW928PS3JdYXegcRfmO7SVs8ug3U=;
        b=TRow5zti8xTzIPlcclFjqenjSiCADQaddGpaiA8zxM9+z9ycMSdP5cVEadTi6Jz139
         I6eeZVIZbXTKV3qcaAlfUugM/gZ0sAoLE/r5Bx8InPwcIGs448bONdOlVfh1cp9xvr2L
         WYo8QiWLTSd9Ceq8x55KWrzbOpqX6jFHs5N7PiNbgejOCh9JITn6iupXWf4lIdbrHJUw
         r562goY3ZNQ8S9QlD4ZrgqaJ3o1ALv8TwU6GkKeR4qj17zKpYi1447+HCsg+mJiPgX6H
         DZTSXj9rpSZTTRsd4N7hYd3ohKiNTVMxVl0CNOLb9nsjqmSiM60lXfWngAEIfbSiYCsK
         SUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698768079; x=1699372879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSkWUAaL15CpGTewW928PS3JdYXegcRfmO7SVs8ug3U=;
        b=j0F0pwdKTm3PtQlTNoGCbqtPHr0XC/gvbEum4ONIjJywDQJs1dz0mdEZ7Ye7jJ2cwx
         wAA4jY//7mT+9zGzGhhoMzEprKRiA/f8GWHFyiQIiAzAcLJeztU57pKgNFH3ugfDwxxf
         ZCrvN/hVgJ6K/mjvywdMWQMRAtas8qJkBjNEYNr48hkD3JWV7E6fFOz5dm53TZMRDTN5
         Ri9p4A6GSaEfThKD03h194qUg5UVdEIrVrNJF1QJ+axWI/lkxB9oFtmzDClwLp6PRlqG
         DOaq97QJNiGzuPjVg84rlJ7KMQEZwv2bPxMcep8H8+wOyZEPtUjSnU23WrJivBIHz99h
         wY3Q==
X-Gm-Message-State: AOJu0YyyYaoAHeSDtWhFmHgJEvVAeuJomd+yPotR094qMxb++y1eQFtU
	ceuHBzanNZPFJcmyiyoXosM=
X-Google-Smtp-Source: AGHT+IEB5Jt8XmT4PAsYiOxccvkYS0Vkr7blEiqbpZrF8DzB2UBJIReZDxHKCaFoLwGSij+DTEs8pQ==
X-Received: by 2002:a05:6a20:3956:b0:17f:66f7:e079 with SMTP id r22-20020a056a20395600b0017f66f7e079mr13674944pzg.19.1698768078850;
        Tue, 31 Oct 2023 09:01:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c25-20020a637259000000b0058a9621f583sm1242444pgn.44.2023.10.31.09.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 09:01:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <95e41f16-4b5f-4f2a-bc31-17273032312b@roeck-us.net>
Date: Tue, 31 Oct 2023 09:01:16 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] rtc: max31335: add driver support
Content-Language: en-US
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20231031153100.92939-1-antoniu.miclaus@analog.com>
 <20231031153100.92939-2-antoniu.miclaus@analog.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231031153100.92939-2-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/31/23 08:30, Antoniu Miclaus wrote:
> RTC driver for MAX31335 ±2ppm Automotive Real-Time Clock with
> Integrated MEMS Resonator.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> changes in v3:
>   - drop MAX31335_STATUS1 register check inside probe function.
>   drivers/rtc/Kconfig        |  11 +
>   drivers/rtc/Makefile       |   1 +
>   drivers/rtc/rtc-max31335.c | 765 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 777 insertions(+)
>   create mode 100644 drivers/rtc/rtc-max31335.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d7502433c78a..11c7d7fe1e85 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -373,6 +373,17 @@ config RTC_DRV_MAX8997
>   	  This driver can also be built as a module. If so, the module
>   	  will be called rtc-max8997.
>   
> +config RTC_DRV_MAX31335
> +	tristate "Analog Devices MAX31335"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the Analog Devices
> +	  MAX31335.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-max31335.
> +

Just out of curiosity, is this an unreleased chip ? I only find
MAX311331 and MAX31334 on the Analog website, but the register
map for those is different, and they don't support reporting
the chip temperature.

[ ... ]

> +
> +static const struct hwmon_channel_info *max31335_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),

According to the register map above, the chip does support
low and high temperature limits as well as over- and undertemperature
alarms and interrupts. I would suggest to add support for all of those.
You might also consider adding support for temperature alarm interrupts
and report temperature alarm events by calling hwmon_notify_event()
if a thermal event occurs.

[ ... ]

> +
> +	hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name,
> +						     max31335,
> +						     &max31335_chip_info,
> +						     NULL);

There is no "depends on HWMON" in the Kconfig entry, meaning this will fail
to compile if HWMON=n or if HWMON=m and RTC_DRV_MAX31335=y.

Guenter

