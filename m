Return-Path: <linux-rtc+bounces-1570-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40236939B76
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2024 09:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EDB61C21B46
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2024 07:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A569214A639;
	Tue, 23 Jul 2024 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KQbaIA0/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B0013C823
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jul 2024 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721718612; cv=none; b=t/dg07JcgIP/QKI+kj5af7qpPDT6EaX6V0fEld1ebBI0J8lcQACPuSmaZjd/DkRwsqDNZ0FIfqZml2ds0tm37dAUYiS6fdw3aPZfQe3Lp2PdIL0ulKZo1021REoZjVK+3QG6uUESnl/LaaCs5f9HZrfm2ACdbDJI5qH5MsypmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721718612; c=relaxed/simple;
	bh=pDrcpwPThooXOhuo8yBT0CKcsbido5m6PcRHkzyYUr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkuuIwBy2z9AgpkdDpvV9Gy6Mn+W9aYDwPmSS5HjtCNQWVTwHv6YgO/D3+9sy3dUN+5T+8VwDWtMFsqXJ2zuNVjBQH4fmBqQydh2vwLyl2uOgIK/mNIERAav0PRxCT7bSEhWGVFQs6X1f8W+tQc05Q3/dGhaRKTx6L7W/zLOwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KQbaIA0/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso35772666b.0
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jul 2024 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721718608; x=1722323408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbY9hIILRpQ3t2kLWFKU5JlJAqMsH+KZEUPDJfybT0Y=;
        b=KQbaIA0/TEPMsD24OnRsEErGVV7S5gq++zOE9txhTZoHwCUuhDlCYlHZyEaHDA3l5q
         qy/hYWQ2K9HxXvJtlJW1NlCmNCZZte+2TpSd3ltHk5nV8X///HLiNyeMxcN09MBmGO7e
         Ue5q+pUbrPrG2yy+3MI4FTLICSIyJ0KDrasM4TTu/5/vSmf3iZk5mZva15VpCFItUScI
         m3pfStWFTmk3imN6nCkT0NZTmMClc/EWDd457AxdhhSoDIg6o6LW9Tfe2Dp+sXIiWvrl
         kDARsfWOuRT8GcfDKkMmXsNHZ/LUAF5a1aptUXTStuV+f1FAGddZ+P5BRuTqQ3z5Ltl6
         IRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721718608; x=1722323408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbY9hIILRpQ3t2kLWFKU5JlJAqMsH+KZEUPDJfybT0Y=;
        b=N0KmD9/67JTfSkfzhduIxSf2Oym3GFbpgMmy4jc/t/gi8RY18pwsbJ3b2czP+eQMxK
         zC4zDJgijaKMnvrgLoDpg0pL9iIlDT16QOk+Tfe3bFaY/LvHutFaOYryMa56UF1SZ/TI
         IwHdjZ9klPpBgH7sv2niTmSqnXJ6/V8TZQTgkLo6N19PiZfsmC/fO2fDf/VTZ/ncT77+
         eEGSKPow/wmAKj8DQ1KmAIFaTcn94Ngr7PWqbmOqGZFlKPSs91VUdPgJOTqkh/sZ16X/
         UwgmiLYLXvln6ThTZm6Sqa/aRhMqP40lKTW2hkLqTI7VSOw2ae6lDGLZmIVFXLgclSVL
         sReA==
X-Forwarded-Encrypted: i=1; AJvYcCXbIDT3z6iYTPKBRjxvd/o/aXO/oAUjY52mRl4aWguPK2YaJ2omsAk2HExdAziIRt8HYjldvQzcseRWc5PTMM50K5qHmdrXqW3x
X-Gm-Message-State: AOJu0Yyw12mwLh+zGd3oJ9gByaUHNMAn136IG7wKcb/d1VcgLMZTHenk
	yMDCaktRMwMGxqgOI66Y85KyO2gvztjsvNbZvP2ivN9KTr2PmSGMJ+cgcUODCMw=
X-Google-Smtp-Source: AGHT+IE+F6g3SA1qf6FRpSztSzuggO/YnYuDsDxPqrtwq9kpss+HQL9yVbIZjttzYydPEUxBHj5Afg==
X-Received: by 2002:a17:907:96a8:b0:a77:c364:c4ef with SMTP id a640c23a62f3a-a7a87c85d96mr158186366b.5.1721718607688;
        Tue, 23 Jul 2024 00:10:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c94fc2esm497807966b.210.2024.07.23.00.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 00:10:07 -0700 (PDT)
Message-ID: <f0439b5c-1b93-48f3-a130-e4e7ef06c862@tuxon.dev>
Date: Tue, 23 Jul 2024 10:10:05 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: mfd: renesas,r9a08g045-vbattb:
 Document VBATTB
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-2-claudiu.beznea.uj@bp.renesas.com>
 <20240723021713.GA40385-robh@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240723021713.GA40385-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 23.07.2024 05:17, Rob Herring wrote:
> On Tue, Jul 16, 2024 at 01:30:15PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
>> the tamper detector and a small general usage memory of 128B. Add
>> documentation for it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - changed file name and compatible
>> - updated title, description sections
>> - added clock controller part documentation and drop dedicated file
>>   for it included in v1
>> - used items to describe interrupts, interrupt-names, clocks, clock-names,
>>   resets
>> - dropped node labels and status
>> - updated clock-names for clock controller to cope with the new
>>   logic on detecting the necessity to setup bypass
>>
>>  .../mfd/renesas,r9a08g045-vbattb.yaml         | 136 ++++++++++++++++++
>>  1 file changed, 136 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
>> new file mode 100644
>> index 000000000000..30e4da65e2f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
>> @@ -0,0 +1,136 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/renesas,r9a08g045-vbattb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas Battery Backup Function (VBATTB)
>> +
>> +description:
>> +  Renesas VBATTB is an always on powered module (backed by battery) which
>> +  controls the RTC clock (VBATTCLK), tamper detection logic and a small
>> +  general usage memory (128B).
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a08g045-vbattb
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ranges: true
>> +
>> +  interrupts:
>> +    items:
>> +      - description: tamper detector interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: tampdi
> 
> Don't really need -names with only 1 entry.
> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: VBATTB module clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bclk
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: VBATTB module reset
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
>> +patternProperties:
>> +  "^clock-controller@1c+$":
>> +    type: object
>> +    description: VBATTCLK clock
>> +
>> +    properties:
>> +      compatible:
>> +        const: renesas,r9a08g045-vbattb-clk
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      clocks:
>> +        items:
>> +          - description: input clock for VBATTCLK
>> +
>> +      clock-names:
>> +        description: |
>> +          Use xin if connected to an external crystal oscillator.
>> +          Use clkin if connected to an external hardware device generating the
>> +          clock.
>> +        enum:
>> +          - xin
>> +          - clkin
>> +
>> +      '#clock-cells':
>> +        const: 0
>> +
>> +      renesas,vbattb-load-nanofarads:
>> +        description: load capacitance of the on board xtal
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [ 4000, 7000, 9000, 12500 ]
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - clocks
>> +      - clock-names
>> +      - '#clock-cells'
>> +      - renesas,vbattb-load-nanofarads
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    vbattb@1005c000 {
>> +        compatible = "renesas,r9a08g045-vbattb";
>> +        reg = <0x1005c000 0x1000>;
>> +        ranges = <0 0 0x1005c000 0 0x1000>;
>> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "tampdi";
>> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
>> +        clock-names = "bclk";
>> +        power-domains = <&cpg>;
>> +        resets = <&cpg R9A08G045_VBAT_BRESETN>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@1c {
>> +            compatible = "renesas,r9a08g045-vbattb-clk";
>> +            reg = <0 0x1c 0 0x10>;
>> +            clocks = <&vbattb_xtal>;
>> +            clock-names = "xin";
>> +            #clock-cells = <0>;
>> +            renesas,vbattb-load-nanofarads = <12500>;
>> +        };
> 
> Is this really a separate device?

It's not.

> Doesn't really look like it. This can 
> all be moved to the parent node.

I'll move it to the parent node.

Thank you for your review,
Claudiu Beznea

> 
> Rob

