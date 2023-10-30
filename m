Return-Path: <linux-rtc+bounces-149-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838AE7DBEE1
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Oct 2023 18:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E05C7B20CE6
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Oct 2023 17:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DA81947D;
	Mon, 30 Oct 2023 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKpkQ4oh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6934319478
	for <linux-rtc@vger.kernel.org>; Mon, 30 Oct 2023 17:28:34 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E99C4
	for <linux-rtc@vger.kernel.org>; Mon, 30 Oct 2023 10:28:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d23be183c6so312637066b.0
        for <linux-rtc@vger.kernel.org>; Mon, 30 Oct 2023 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698686910; x=1699291710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUqympgaZbY4CwpbNsG1E9Za5/1fj3yZOhO3evs+MRE=;
        b=aKpkQ4ohRxfy94qoUy7efeB8dkfFzQzmTE99ElrtSG+X58E40SVWKi0+NmEFOR2V2e
         E2+v831ru40LUOYZyE3bTtyC5/FK/wPG0AeK3F4Cro5fZxXaZ9Ymx1CTwy9iYYSNLcY9
         dBoDJr+SAW5FiuMSw9YUUBe4pY2UtoVmKDvdjPBqSk/dQkNYlEZjlQ56Of92UXQNEU9w
         6+YRjHyf9yOe3x9+MbNmV/IBw6gT2ax3xBBDHZXBCyhLqg843XoeFF7OGwwZFAXXniPn
         HwVckITmldQXs0QI2q6H/wXXW3jMIwcUpEVbUmZyGoJKWtj8J8Uovb+biPRlBW0VvUio
         e83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686910; x=1699291710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUqympgaZbY4CwpbNsG1E9Za5/1fj3yZOhO3evs+MRE=;
        b=K/T6G6Q4FNpuzHBnN/xpum7+3zVcsNqge11HODQX48S2jGWQ90uu/moBl6poLHCWJB
         8AItkhp28q8ByGDiz+JEiZFV5GTqntShOJMe6I4lmMf9VDht0DY8lHSeZhFSVZT9AS4v
         6OfUIYwozMqLHw0Rw9WpPw00yypLWGgN0XGZ0X/O1riLEAOhaYobTS/Xkb36RDrFQhoI
         gWHJAaLi8FlsGaErSXBlch4gFLyZ4SIr8LmTVohD4Ctlzwz88hVIxL/CPigibYuwoPy2
         L+rPAIzdq0jwsSAk2wKU1yU/RlWNaYUVKYfYbvrQA2hDsgX/Ffyc028Y2SsS2CMagnZB
         ohtw==
X-Gm-Message-State: AOJu0Yx7rnF0a8r+LtCx2LaN//sxHckpiw+Qg5oSaGHA/pphdyj3Fbpf
	QsX9QJNiKfjHs9dSC+YgYhp3gg==
X-Google-Smtp-Source: AGHT+IH6mxufACMCiWlN/BYBShqGYwpt5B/+xpeNWsAeDY48UPKAglrHQF/WBUaevJEsR5X6kINn8g==
X-Received: by 2002:a17:907:7e81:b0:9ae:6da8:1819 with SMTP id qb1-20020a1709077e8100b009ae6da81819mr9521877ejc.48.1698686910330;
        Mon, 30 Oct 2023 10:28:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id rn20-20020a170906d93400b009930308425csm6295467ejb.31.2023.10.30.10.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 10:28:29 -0700 (PDT)
Message-ID: <08db17bd-3e09-4608-8cb1-189aa286318e@linaro.org>
Date: Mon, 30 Oct 2023 18:28:28 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: rtc: max31335: initial commit
Content-Language: en-US
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20231030115016.97823-1-antoniu.miclaus@analog.com>
 <20231030115016.97823-3-antoniu.miclaus@analog.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231030115016.97823-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2023 12:50, Antoniu Miclaus wrote:
> RTC driver for MAX31335 ±2ppm Automotive Real-Time Clock with
> Integrated MEMS Resonator.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

There is no "drivers" prefix.

>  drivers/rtc/Kconfig        |  11 +
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-max31335.c | 759 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 771 insertions(+)
>  create mode 100644 drivers/rtc/rtc-max31335.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d7502433c78a..11c7d7fe1e85 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -373,6 +373,17 @@ config RTC_DRV_MAX8997
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max8997.
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

...


> +
> +static int max31335_probe(struct i2c_client *client)
> +{
> +	struct max31335_data *max31335;
> +	struct device *hwmon;
> +	int ret, status;
> +
> +	max31335 = devm_kzalloc(&client->dev, sizeof(struct max31335_data),

sizeof(*)

> +				GFP_KERNEL);
> +	if (!max31335)
> +		return -ENOMEM;
> +

Best regards,
Krzysztof


