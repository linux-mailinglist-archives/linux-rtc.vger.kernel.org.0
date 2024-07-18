Return-Path: <linux-rtc+bounces-1554-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E4934F3E
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 16:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 035D4B23B84
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB3E14373E;
	Thu, 18 Jul 2024 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HgVax8GW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F17140E30
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jul 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313671; cv=none; b=lIAxk6/mBiHdJ97W5Wkj1rNx7HQbvMHeRr1Tp/ZGjbFHoosbG+RFqgy/EYD3C2Bbu03LVuvOi2bVE+Tdb3Tm61oaKkzjKv4Xqv5gzYUNu0LkCxGX3jgqnwVTkdVNpa0pBU80D3K0iaPnX4dn7rJBf5aUeRiYkZLBmUq8htmc26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313671; c=relaxed/simple;
	bh=8iksS6ZFnv53ZcAghL65KYmsNJMU8ft6S6eoiAhZaOk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mnuCkVFr0c/lZ1eAN1AiBW+XveLFP2gmuTSFY6r7dqkKm8rR8+WDjEv8xZ86lV2tieTStfXES1bRsYjI2Gk5oarpxS5/lL6iN5UUt/yk2QHXC3gUafL5k6jJBmOWo/siYRlPlv8TnxeBE1ObxLVADUVrd1OetOj5OtT1Jj2kV5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HgVax8GW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3685b9c8998so310565f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jul 2024 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721313666; x=1721918466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d5zeQJ5Ow3UH0+RdZ7WJRjKIJGbUGTjL+v0QPQ6ApNI=;
        b=HgVax8GWSB4R1kltVA/DXD5F3bYvs9nzcMo1TE75KXYE4mZNQsa7M4YXog31whlRoO
         wNpaLOwqMIHbGcmstQU2Lwzp/khKUTLoQrZlz8tz7F1FjAaRghMZcuraCYbOHfDMPcXF
         1vGgXDVJu6f+/Xp8nynyuzd6GYuaMZCE+flQ9LqUTKTh/KeuSM4Ym5BJ3qoDeukfrlIq
         0XEzsmF2M/5Mp978T+woQvLKlkhiv3Vlnck+HETRVLcZKjLKhFJapu2Dd4UjxbW8vurn
         OiRCcDf+Ch0B8yRglLobsL7MeCFPGSb8WyqQkVctOeRGzW540/rf0v/d/cFFWXIM5ArV
         FyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721313666; x=1721918466;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5zeQJ5Ow3UH0+RdZ7WJRjKIJGbUGTjL+v0QPQ6ApNI=;
        b=YKxPqtzixxjYXkJwHbpedQy2KcYnrAQUQZaZoLR1DC7Oh3yk1yReCHCINMdaU8n7aO
         0XPB319Qwct6GMlmAjcEieEkqr1U5yDJhuiQAqAPkOnCk80CKCmVpeTdS0HXFY8JusLC
         iR+8mehTsm+ianIxkLT5lb/ulMrkPQanVBvupIZJE9e++e5/lEbxypk7ukEsZOo1kW7d
         o+q25cuoN53o9yPzAUmlVcQ/bR5QhoegisO9wfie11YNp2UviWvmAdLlnKOFtvius1o2
         Mo+ndPOONectZdSXg/o5xHlLiy5ftV/DRWrJLb4X3R5Ny+VwIwKvQjnjReALxk95LwPL
         xtQg==
X-Forwarded-Encrypted: i=1; AJvYcCXcC+3yD8c5Kg/stIP3MLSesBajli72ruPockFj1SjG52kVDP4frBo/OrW6NqZoe8WvaHSdDpQDV5GJ1YhHhOazoSsq4uD4poZS
X-Gm-Message-State: AOJu0Yz0ynRRHNkm/8OSqFxMvCSW4LOdfJQTQRs4KODu96UNSidI7ZCA
	icrvK3qG76/VvDk6FQnzY22BPaAi1Z4MyqP3+625SHtSYM6Rk1rqfLLVhnhrhDlWLoZrf2mjDl3
	j
X-Google-Smtp-Source: AGHT+IHLLY7FV8d3TW5DeDftcP9CR4qKgZexsCdXD1McSEmqtB8zHI2JozSns5pNcAAnLe1mJiEB7g==
X-Received: by 2002:a5d:59a2:0:b0:367:9073:3496 with SMTP id ffacd0b85a97d-3683160e527mr4242349f8f.29.1721313666237;
        Thu, 18 Jul 2024 07:41:06 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685043637fsm1903132f8f.66.2024.07.18.07.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 07:41:05 -0700 (PDT)
Message-ID: <fd8078cb-fe1c-4aef-9e83-be2baa529720@tuxon.dev>
Date: Thu, 18 Jul 2024 17:41:03 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
To: Stephen Boyd <sboyd@kernel.org>, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
 lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
 <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
 <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev>
 <4cacf090dc56c3ffd15bccd960065769.sboyd@kernel.org>
Content-Language: en-US
In-Reply-To: <4cacf090dc56c3ffd15bccd960065769.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.07.2024 03:39, Stephen Boyd wrote:
> Quoting claudiu beznea (2024-07-17 01:31:20)
>> Hi, Stephen,
>>
>> On 17.07.2024 01:28, Stephen Boyd wrote:
>>> Quoting Claudiu (2024-07-16 03:30:17)
>>>> diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
>>>> new file mode 100644
>>>> index 000000000000..8effe141fc0b
>>>> --- /dev/null
>>>> +++ b/drivers/clk/renesas/clk-vbattb.c
>>>> @@ -0,0 +1,212 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * VBATTB clock driver
>>>> + *
>>>> + * Copyright (C) 2024 Renesas Electronics Corp.
>>>> + */
>>>> +
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/clk.h>
>>>
>>> Prefer clk providers to not be clk consumers.
>>
>> I added it here to be able to use devm_clk_get_optional() as it was
>> proposed to me in v1 to avoid adding a new binding for bypass and detect if
>> it's needed by checking the input clock name.
>>
> 
> Understood.
> 
>>
>>>
>>> I also wonder if this is really a mux, 
>>
>> It's a way to determine what type of clock (crystal oscillator or device
>> clock) is connected to RTXIN/RTXOUT pins of the module
>> (the module block diagram at [1]) based on the clock name. Depending on the
>> type of the clock connected to RTXIN/RTXOUT we need to select the XC or
>> XBYP as input for the mux at [1].
>>
>> [1] https://gcdnb.pbrd.co/images/QYsCvhfQlX6n.png
> 
> That diagram shows a mux block, so at least something in there is a mux.
> From what I can tell the binding uses clock-names to describe the mux.
> What I'd like to avoid is using clk_get() to determine how to configure
> the mux. That's because clk_get() is a clk consumer API, and because we
> want clk providers to be able to register clks without making sure that
> the entire parent chain has been registered first. Eventually, we'd like
> clk_get() to probe defer if the clk is an orphan. Having clk providers
> use clk_get() breaks that pretty quickly.
> 
>>
>>
>>> and either assigned-clock-parents should be used, 
>>> or the clk_ops should have an init routine that looks at
>>> which parent is present by determining the index and then use that to
>>> set the mux. The framework can take care of failing to set the other
>>> parent when it isn't present.
>>
>>
>> On the board, at any moment, it will be only one clock as input to the
>> VBATTB clock (either crystal oscillator or a clock device). If I'm getting
>> you correctly, this will involve describing both clocks in some scenarios.
>>
>> E.g. if want to use crystal osc, I can use this DT description:
>>
>> vbattclk: clock-controller@1c {
>>         compatible = "renesas,r9a08g045-vbattb-clk";
>>         reg = <0 0x1c 0 0x10>;
>>         clocks = <&vbattb_xtal>;
>>         clock-names = "xin";
>>         #clock-cells = <0>;
>>         status = "disabled";
>> };
>>
>> vbattb_xtal: vbattb-xtal {
>>         compatible = "fixed-clock";
>>         #clock-cells = <0>;
>>         clock-frequency = <32768>;
>> };
>>
>> If external clock device is to be used, I should describe a fake clock too:
>>
>> vbattclk: clock-controller@1c {
>>         compatible = "renesas,r9a08g045-vbattb-clk";
>>         reg = <0 0x1c 0 0x10>;
>>         clocks = <&vbattb_xtal>, <&ext_clk>;
> 
> Is vbattb_xtal the fake clk? If so, I'd expect this to be
> 
> 	clocks = <0>, <&ext_clk>;
> 
> so that we don't have a useless clk node.
> 
>>         clock-names = "xin", "clkin";
>>         #clock-cells = <0>;
>>         status = "disabled";
>> };
>>
>> vbattb_xtal: vbattb-xtal {
>>         compatible = "fixed-clock";
>>         #clock-cells = <0>;
>>         clock-frequency = <0>;
>> };
>>
>> ext_clk: ext-clk {
>>         compatible = "fixed-clock";
>>         #clock-cells = <0>;
>>         clock-frequency = <32768>;
>> };
>>
>> Is this what you are suggesting?
>>
> 
> Sort of. Ignoring the problem with the subnode for the clk driver, I
> don't really like having clock-names that don't match the hardware pin
> names. From the diagram you provided, it looks like clock-names should
> be "bclk" and "rtxin" for the bus clock and the rtxin signal. Then the
> clock-cells should be "1" instead of "0", and the mux should be one of
> those provided clks and "xc" and "xbyp" should be the other two. If that
> was done, then assigned-clocks could be used to assign the parent of the
> mux.
> 
> #define VBATTBCLK          0
> #define VBATTB_XBYP        1
> #define VBATTB_XC          2
> 
>     vbattb: vbattb@1005c000 {
>         compatible = "renesas,r9a08g045-vbattb";
>         reg = <0x1005c000 0x1000>;
>         ranges = <0 0 0x1005c000 0 0x1000>;
>         interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-names = "tampdi";
>         clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&ext_clk>;
>         clock-names = "bclk", "rtxin";
>         power-domains = <&cpg>;
>         resets = <&cpg R9A08G045_VBAT_BRESETN>;
>         #clock-cells = <1>;
>         assigned-clocks = <&vbattb VBATTBCLK>;
> 	assigned-clock-parents = <&vbattb VBATTB_XBYP>;
>         renesas,vbattb-load-nanofarads = <12500>;
>     };

I think I got it now. Thank you for the detailed explanation.

> 
> One last thing that I don't really understand is why this needs to be a
> clk provider. In the diagram, the RTC is also part of vbattb, so it
> looks odd to have this node be a clk provider with #clock-cells at all.

I did it like this because the RTC is a different IP mapped at it's own
address and considering the other VBATTB functionalities (tamper, SRAM)
might be implemented at some point.

I also failed to notice that RTC might not work w/o bclk being enabled
(thanks for pointing it).

I saw that diagram more like describing the always-on power domain
(PD_VBATTB) where the VBATTB logic and RTC resides. That power domain is
backed by battery. From HW manual [1]: "PD_VBATT domain is the area where
the RTC/backup register is located, works on battery power when the power
of PD_VCC and PD_ISOVCC domain are turned off."

[1]
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250

> Is it the case that if the rtxin pin is connected, you mux that over,
> and if the pin is disconnected you mux over the internal oscillator? 

From the description here at [2] I'm getting that the "32-KHz clock
oscillator" block is used when crystal oscillator is connected to RTXIN,
RTXOUT pins and it is skipped if external clock device is connected.

[2] https://i2.paste.pics/RFKJ0.png?rand=Xq8w1RLDvZ

> I'm
> really wondering why a clk provider is implemented at all. Why not just
> hit the registers directly from the RTC driver depending on a
> devm_clk_get_optional() call?

I did it like this because the RTC is a different IP mapped at it's own
address with it's own interrupts, clock, power domain and considering that
the other VBATTB functionalities (tamper, SRAM) might be used at some point
in future. At the same time I failed to noticed the VBATTB clock might be
needed for RTC.

Do you consider better to just take a regmap to VBATTB from RTC driver and
set the VBATTB from RTC driver itself?

Thank you,
Claudiu Beznea

