Return-Path: <linux-rtc+bounces-154-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548887DCC0D
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 12:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0572813EE
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Oct 2023 11:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FCD1A73C;
	Tue, 31 Oct 2023 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="V5S0NbEI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F61D532
	for <linux-rtc@vger.kernel.org>; Tue, 31 Oct 2023 11:44:15 +0000 (UTC)
X-Greylist: delayed 451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 04:44:14 PDT
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7AC9CC1
	for <linux-rtc@vger.kernel.org>; Tue, 31 Oct 2023 04:44:14 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xn2xqgsfSOWoRxn2xqgwky; Tue, 31 Oct 2023 12:36:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698752202;
	bh=9KvNXF6pEJh/jTsRIm8nizvmtEilekGphzqImz455pY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=V5S0NbEIvGxPADjcYc+bU1NBTQLnjjvHHkEN7xNE+/mV2HlGqpWkqYH4cjh+svGnI
	 XtohOlwTVUntCBSWXn3bSAx8o8ebKZU7MTjoDADiubzAD/E2gfSwc4ULzrnhZZUZOh
	 y6i97d4QloK2R0cvq19YWCwdnVYObE1JSkZKhLitIKT4z/L4AJWQqRg6b7VVLwwmWu
	 0MYTbqd28wFE984H7arsrGMLrBsFI4PC81xJ3AYj8G34xC5P197n6dz4/Efar6Q0ii
	 +x2iPmbZn9lbx52pcnpvNF2OZmDuHvT8yd6ruQd1Zaedx2ojy9WOK2YKKPFFZHLVXe
	 aK3CI9WbQ92fw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 31 Oct 2023 12:36:42 +0100
X-ME-IP: 86.243.2.178
Message-ID: <e1a06870-985a-4041-a21d-83d99d731fd6@wanadoo.fr>
Date: Tue, 31 Oct 2023 12:36:35 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: rtc: max31335: initial commit
Content-Language: fr
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
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231030115016.97823-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2023 à 12:50, Antoniu Miclaus a écrit :
> RTC driver for MAX31335 ±2ppm Automotive Real-Time Clock with
> Integrated MEMS Resonator.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

...

> +static bool max31335_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	/* time keeping registers */
> +	if (reg >= MAX31335_SECONDS &&
> +	    reg < MAX31335_SECONDS + MAX31335_TIME_SIZE)
> +		return true;
> +
> +	/* interrupt status register */
> +	if (reg == MAX31335_INT_EN1_A1IE)
> +		return true;
> +
> +	/* temperature registers */
> +	if (reg == MAX31335_TEMP_DATA_MSB || MAX31335_TEMP_DATA_LSB)
> +		return true;

return false otherwise?

CJ

> +}

...


