Return-Path: <linux-rtc+bounces-1310-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEEA9085FA
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 10:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A3361C222BE
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40EA18410E;
	Fri, 14 Jun 2024 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FrzuS8rP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DBB383B0
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718353010; cv=none; b=tultwOG0V1C6lfFr05j5xLpfbDNEYFgN11Caf7Uq7uKa+5UUOXv5ZGGupGr9RiZzoGp1qn9sqYd7vWImttAeKl3StZm4NGa0W+Hq4DqK1RiQhz+WGqznd1nfCGKP+t+hgly3U9EyX1LwpTfJ/Gaz0pO8ON118DjpTWpc8j9GJDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718353010; c=relaxed/simple;
	bh=nwE7qH3et0xBAyB0MTDxfmgBc8lMSr+/9XrUUisIykQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdvE59zY801EGNVxixOkOW+VkiQNwu28msGKUxDIQho9ol5i/xkN47kWEqa2Yvb2M4vMWDZ99QiqiljYAE+yoxxKzosC81dXxQJjrw25y+sdG92ppd+4mNYjV79RvswKReuu2ESZ10a78EWnvtdlRCiH1/rkeO1AxSeMhW7BP4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FrzuS8rP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so33297841fa.0
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718353007; x=1718957807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGmOzn1R1K16dkDMQJjEQ6wgWuo7/3DN6CTKOSNpNgg=;
        b=FrzuS8rPAQXu5iSoydjMExSyF0JG+sUoXV2L9KKhAr3STgNHLgSQy3RJ9DFISFD2jh
         RJIaamNFcx6y3QzFGFgMkyXtZyCs3N/Yd4Ri0WILV4SqrgR6wM5wx5icfRFqrqDfCBE8
         GAZMoQdOeh1DYaZH/6ezzQCTaZPlDO/Xbj3lX3VijjB919wqP/MjTs56z4GU9mYxD394
         swGKG+ChzC/dgP+gb1DZ2njamktxwk17e3LYy/vZJqeZxD2GiFgoVdwvgeNk9ewvYBGy
         bZ5MXFrOwPGAf9etp/CNI0NbjA01Pwt7qNSRL8k73q1bkneRy6TvuZp5RQrUdyxbzua6
         Wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718353007; x=1718957807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGmOzn1R1K16dkDMQJjEQ6wgWuo7/3DN6CTKOSNpNgg=;
        b=Zty/av7b90S+3mEozJbtzMCeXbODhYgOtdACAa7E+qDTUiws/RNXGgWwxBCNfWG2XB
         laiYy/Z6Buc4PoxomEcn3QaQEgXvW1k9oaLoMEJvG6wfOawQ6XL6qgU5ST9C32EMBWLR
         jhzsc84LSJz0JNnSzKjPOZXZ3tVM+jVzuJgPMtQ3v35dScdHDC1RZ1CLlG85cRAPlV6k
         EezL95nQFv2qFS30gFKFBQjvmpxc+sIi2974OlcLw+QCYov0FG7wXLK/SVK56e/W8Rjm
         NxiKX8v+Q5OjUpWTk9unzwIR3CnB41aP5FY76pzWtP+1H85fWqHs6H+J9KY+Y4hy67xF
         LzIg==
X-Forwarded-Encrypted: i=1; AJvYcCUdDSzf1NiPh286XG+crpktWjyYG+09HKGLuLeEToauN3R2g98sxSEwkdTWGanfGVfWcZMQnQyvkV/D1O6O81//jZrmLBpmlpv8
X-Gm-Message-State: AOJu0Yy+8+iisG5L0M2y97WTcQJbR/Tsw7ZGQzXCXRMdpo7WqSMmdHdm
	I7ekyFy9dJsZ7dWZ5xmIFwx0OCu+d1VJrE8n5UOmj7XvYrnC3aMWg9EYe0X/2Vc=
X-Google-Smtp-Source: AGHT+IGdVz9wnYuErYpbzpZPBaxajSeBzfE2NEQMkvFihFynmrdBmCln5caVCr3TFMsMNsUcb/jj1Q==
X-Received: by 2002:a2e:7d03:0:b0:2eb:e56c:c90a with SMTP id 38308e7fff4ca-2ec0e5c8c3dmr14354061fa.43.1718353006713;
        Fri, 14 Jun 2024 01:16:46 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6127c6fsm51121795e9.24.2024.06.14.01.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 01:16:46 -0700 (PDT)
Message-ID: <d6b4e0cc-c16e-4ea7-bbc4-ddbaaadc9a25@tuxon.dev>
Date: Fri, 14 Jun 2024 11:16:43 +0300
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
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "lee@kernel.org"
 <lee@kernel.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464811F43F19115FCF62A786C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113464811F43F19115FCF62A786C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 14.06.2024 10:53, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Claudiu
>> Sent: Friday, June 14, 2024 8:19 AM
>> Subject: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RZ/G3S RTC
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>> b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>> new file mode 100644
>> index 000000000000..0e17f8a36155
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
> 
> Please make it generic renesas,rtca3-rtc.yaml. Future SoCs may use this IP.
> So use IP name instead.

From what I know the file name should correspond with the compatible that
file was introduced with, and this one shouldn't be generic but SoC specific.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Real Time Clock for Renesas RZ/G3S SoC
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,rzg3s-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: alarm
>> +      - const: period
>> +      - const: carry
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: RTC counter clock
>> +
>> +  clock-names:
>> +    maxItems: 1
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
>> +        compatible = "renesas,rzg3s-rtc";
>> +        reg = <0x1004ec00 0x400>;
>> +        interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "alarm", "period", "carry";
>> +        clocks = <&vbattclk>;
>> +        clock-names = "counter";
>> +        status = "disabled";
>> +    };
>> --
>> 2.39.2
>>
> 

