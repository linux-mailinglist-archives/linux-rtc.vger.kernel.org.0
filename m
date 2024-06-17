Return-Path: <linux-rtc+bounces-1329-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D9A90A6EF
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 09:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686151C20F01
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 07:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD97318C33B;
	Mon, 17 Jun 2024 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b1JPpFO3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B9188CC3
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609047; cv=none; b=fN4PnkcI3Vn3N4JcgvEb2dP/DUC6+33mUk4xKShfMzgXqvSWe5Pc+NNi3ckLjfvGraowq/LM3+K+5ML7rS4lN1/gMo7UqGSWugI1kDXHWfeZtpCZVqKCdkU4qwhe3slB+FdoZJgI1DeHK2tW3G5N9+L9WxuManx/gatLz6bPHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609047; c=relaxed/simple;
	bh=jT8tl0v4dZdWpudW7ezYwWeNJnWfeoTK/DZDNvQhIAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEchBRowD1PKLp3wNd+tkRa6aO3Q/xRPGgEkZB6ChQWnicTRIS0hsm1E3OHvsTXu6ZC5mQ0rkdmSJDcAi4hZ6qjwdGhVLPV9Q7qOjW/oCtkqiSkUGv7ePAs0lIskDdE7tgG6UA66LvvEdOXxGG0lA697xOBQjHM0UDNtLZxUUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b1JPpFO3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so3407204f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718609044; x=1719213844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpoUfU25aFExpQhRHpFgANp2YolLmCOPv3K1gnuPL2Y=;
        b=b1JPpFO3eswtT5JYmC4M2jeMShjPPtJHMJvnUcI8rLp0n0e7g0cHJ8pwDm70uQe8xy
         pJEWtY6lsub8LS2HeloJR/A4vy/ehAkpdioAApx6GTQAXK8PvipSRkmRQmaUPEItjk4o
         eK7H4ysoh67Kf36jziPqAIlf44JWVDma5NbhvLU5m1GnjtVJAh8pwfJwG5buIsYeIHSY
         vKgYVBYdI9ucS1i3jLkIsZS7AhkYHq4RM8AmrTdoVxqlal5BPNQAAa2zKawXf+wYHWEF
         XervL5GuOD0REgy6eE25zR8ZP2j1PYShWivf+F65ZhtUMiNLlHMY5LK9TBROQ82kUjug
         hdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609044; x=1719213844;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpoUfU25aFExpQhRHpFgANp2YolLmCOPv3K1gnuPL2Y=;
        b=T0vUiuNpvRxfczCopsP9iYwsLhNdP1ybo6KH+MlWyzUKl3wVeDsXJFCFt+ob9iI2v2
         E0TO+g+/khF/KzP4A1PwvYeoaCPsBYeQqwNxMW4dmWz6013dpFDCkRbLaEAMqc0dGAs7
         +/METPeVC9P9yHUgPrmoxTt6WoQRa+tFJnO+UCODoPB+BvECdT6C/JfkLi2JnT0Eo9nF
         98eu5rZTnFX4vwb5YyoC53Pg1bPCDaPkbbZyhebryR9JUUoTCNnC+pPmwnfFSXAKt6ya
         6iMVAI+0RDC5+fKUOoZqr9CbqlHgNMkKkHPPMqi5AGhu1NrfzrhC5BqGBgoBg0NQ8Lf5
         j5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWmHGthKvphy17vwObOOqAR7kPwm6i2lh5riLkaPvLnYw6Dp3hYrMW3lS7zdPKJ5RQibmfFbFPMPnw4ZiqpLoHmAN8WdvSRCAY/
X-Gm-Message-State: AOJu0YzA9GwDsLzl1VGM4JSXx78FZbImxN4Nzlyof8KS71gdB3Ggg5xk
	uIlm0hzfQtzaiFBqlUEPyhW+eESGpLq9VGaeV94Wuc34sE8wK+YsJ7wInjJxUqE=
X-Google-Smtp-Source: AGHT+IEOD4FT6z5nxG5bniU7J/sW/K0IX0zmiUgy/bxvKupAzvp/m3MmMTj6Dy5w8kPrtiMfENwRjQ==
X-Received: by 2002:adf:fa8a:0:b0:360:728d:842b with SMTP id ffacd0b85a97d-3607a77fa69mr6262778f8f.52.1718609044415;
        Mon, 17 Jun 2024 00:24:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3609515e16dsm2528937f8f.44.2024.06.17.00.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:24:04 -0700 (PDT)
Message-ID: <46ca8705-cb3a-4a0c-87bf-d1eea7341822@tuxon.dev>
Date: Mon, 17 Jun 2024 10:24:02 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, geert+renesas@glider.be,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <de1077de-baa4-42aa-84c1-6ab629088a07@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <de1077de-baa4-42aa-84c1-6ab629088a07@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.06.2024 10:40, Krzysztof Kozlowski wrote:
> On 14/06/2024 09:19, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: RTC counter clock
> 
> Just items: with description instead.
> 

OK

>> +
>> +  clock-names:
>> +    maxItems: 1
> 
> Nope, it must be specifc. Or just drop. This applies to all your patches.

OK

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    rtc: rtc@1004ec00 {
> 
> Drop label, not used.

OK

> 
>> +        compatible = "renesas,rzg3s-rtc";
>> +        reg = <0x1004ec00 0x400>;
>> +        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "alarm", "period", "carry";
>> +        clocks = <&vbattclk>;
>> +        clock-names = "counter";
>> +        status = "disabled";
> 
> Why do you paste it eevrywhere? It does no really make sense.

Not sure. I'll drop it.

Thank you for your review,
Claudiu Beznea

> 
> Best regards,
> Krzysztof
> 

