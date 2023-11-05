Return-Path: <linux-rtc+bounces-209-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755FF7E13BC
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Nov 2023 14:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4333E1F214A0
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Nov 2023 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC6C8C8;
	Sun,  5 Nov 2023 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0RuFseN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D30A8C0B
	for <linux-rtc@vger.kernel.org>; Sun,  5 Nov 2023 13:39:24 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC8ACC
	for <linux-rtc@vger.kernel.org>; Sun,  5 Nov 2023 05:39:23 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so522364066b.1
        for <linux-rtc@vger.kernel.org>; Sun, 05 Nov 2023 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699191562; x=1699796362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TR2ShhorFXXNshJ9wHf8jcD7HC1y5QPDxQ4W/FIbf6E=;
        b=a0RuFseNXbSGDklVNi8/oom6MZEjcGuSpzY2I/eCo95iG+Jx6Wdtoagi+EF8MuO+wI
         RZqnyqjE72CHclYN48AMEuoyYx48LeS0P8Som6AE9H/zwjrge4WK86Z7T8hyOhYEM9cE
         b9bnciPE+JC1DX6JyQ3OIX8lbhVGsLYZxKo3YuHntgUoaoOe40i1mNhGNLWt0TdckVtk
         Y/xTTPwdBXNeQUMz66acG8aFEKTLMToPCzhhkmyivhU41Ol7NMCGXhmT5+Ne1MsmVYSM
         +0+Gm/ew1QKm1aB21BApS5UDfXlNzIzxha/GNLO4tv/DcJ5lcliz1igmQjqeN72kXd93
         54pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699191562; x=1699796362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TR2ShhorFXXNshJ9wHf8jcD7HC1y5QPDxQ4W/FIbf6E=;
        b=PG6PasHr4mC+ct1TAtOxJWrpq+dw8EXRNL/Cvmx3Lq5DNtD6nGxpwwNxfcZoJlx4Vh
         MDnHEW8eDZZatDr0IleyiGvd6vlGhB5gxy6VU3iYkOiTBMQVZNvBpZygm4gSwVobZhI8
         Bs88c4qE5BofkgPnBf5jV6ZQJ/Ap9VhBTz4EwDCQZ7ZkA2XAu+bv/TUE5tax3jdeE4Bq
         0BGsmK/7R4v7ZUZ94i76IB+tM1Qw12/teJwvyHVnH2EgPW25lkaQB+6uqzxeyAJj6V4a
         wSZXjEJU/7qqDlrlcHvCVP5F7pG+UFi++btNxTn3dS8nqNV3KJ3YfLCi26ayIfSArTa+
         lrQw==
X-Gm-Message-State: AOJu0YyFfXpjpjXpGQe78mRxzxWdja8Vc47c/ptB38C5foTgRheV3ZBP
	pWk9tYTyw83/B8Io96Lh2om3qw==
X-Google-Smtp-Source: AGHT+IGAICkOZeoKr3ZuXcSuSYApLC33bEZdvjlpYtt8jyYXLoaycGYawmcKx66l1onxsoRKfihuRw==
X-Received: by 2002:a17:906:794d:b0:9b2:b2ad:2a76 with SMTP id l13-20020a170906794d00b009b2b2ad2a76mr10816597ejo.16.1699191561974;
        Sun, 05 Nov 2023 05:39:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id bo9-20020a170906d04900b0099293cdbc98sm3077080ejb.145.2023.11.05.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 05:39:21 -0800 (PST)
Message-ID: <8eefb91f-7947-4a0e-b47d-0044b6ce60bd@linaro.org>
Date: Sun, 5 Nov 2023 14:39:19 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: add pcf85053a
Content-Language: en-US
To: Carlos Menin <menin@carlosaurelio.net>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Sergio Prado <sergio.prado@e-labworks.com>
References: <20231103125106.78220-1-menin@carlosaurelio.net>
 <20231103125106.78220-2-menin@carlosaurelio.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231103125106.78220-2-menin@carlosaurelio.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2023 13:51, Carlos Menin wrote:
> Add YAML bindings for NXP's PCF85053A RTC chip.
> 
> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>

Thank you for your patch. There is something to discuss/improve.

> +  quartz-load-femtofarads:
> +    description:
> +      The capacitive load of the crystal, expressed in femto Farad (fF).
> +    enum: [6000, 7000, 12500]
> +    default: 12500
> +
> +  nxp,quartz-drive-control:
> +    description:
> +      The oscillator is designed to be used with quartz with a series resistance
> +      up to 100 kOhms. This covers the typical range of 32.768 kHz quartz
> +      crystals. A low drive mode is available for low series resistance quartz
> +      (up to 60 kOhms). This reduces the current consumption. For very high
> +      series resistance quartz (up to 500 kOhms), there is a high drive mode.
> +      Current consumption increases substantially in this mode.
> +    enum: [low, normal, high]
> +    default: normal
> +
> +  nxp,low-jitter-mode:
> +    description:
> +      If set to true, will decrease the CLK output jitter, at the cost of
> +      increasing the current consumption.
> +    type: boolean
> +    default: false

Drop this line.

> +
> +  nxp,clk-inverted:
> +    description:
> +      Invert clock output. Normally, the low jitter mode reduces jitter on the
> +      rising edge of the output clock. If this property is set to true, then the
> +      low jitter mode will affect the falling edge of the output clock.
> +    type: boolean
> +    default: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +additionalProperties: false

This should be rather unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@6f {
> +            compatible = "nxp,pcf85053a";
> +            reg = <0x6f>;

Please extend the example to include all or almost all properties (which
make sense).

Best regards,
Krzysztof


