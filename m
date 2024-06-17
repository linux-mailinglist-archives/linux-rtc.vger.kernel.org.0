Return-Path: <linux-rtc+bounces-1325-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E190A662
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 09:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C251C26D05
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FE0188CBE;
	Mon, 17 Jun 2024 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cnmXkdaK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCC1862BB
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607775; cv=none; b=Cb+aynLC1Pz5Y+2TnqMtLlkWPJZBlPLqH4npjT7RpQgrtsaMqzWkfCdvDnVy/iZm9z9q0Z0mMNaPF/CopgzrdVCJyMt4DEPfozHeSrN4B1C9B3j7V/hKEQ0OOXETOgOoaS6keDWkwqZEGTaRzetnyrTb9FNTKeVg13Y+aNDskMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607775; c=relaxed/simple;
	bh=l5h3MIVf25ta1g+7xz8zPHHRBq5FFSM31NaiWYap4Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbbQwaumMdUbPl5rAvEvSZT5nLX9/UE3F3PMtLtM58ug4iswRBsZmbDz458gqZKXXCxt9ojaieivVlsOvNcWAoJ/6Tli3stKjrVVf42Qv7U++xdXgvL9Sl6foEkSYSnU7WgaDp+qGxuf4xxbRe6BQtMDahlNOkA6/DBRZ4a9CJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cnmXkdaK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso1632515a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 00:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718607770; x=1719212570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9u5RgFlaJzJI59pGIkMpx9evCqFOfmt+BUqY3LGf4Q=;
        b=cnmXkdaKNR4w9BFG8yjkU+AN8oEzApBCAlDVG8SlHRUNtuKwm4eiC9e4aE3CCZ1IYN
         W+SAuyM5V/Hc+ILGmz2tQz699Bs1zkCbMHKjzWaPwdi32AWeZWBnjkaLPK5f/UNgBd1c
         cOi8MS5OZyJPJ97nAdeh69eUuDkVwA5VWqD+fruAr4c/XXIsaUm5MuTwSMnYae1pAq2Z
         Mu0lfY441KZxjyT4ISjRS1lJDU70M90apG5c0rWIb4jaFjv1kR9Hnxb1WPCymTsQYxuV
         r6qTvkxelEDlUh3B1l5fbXMtHn6iuWqbV8W2oXs+emLBcdEd5Z4EO6J2qaaLNZfrZo9n
         +dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718607770; x=1719212570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9u5RgFlaJzJI59pGIkMpx9evCqFOfmt+BUqY3LGf4Q=;
        b=P/sC1538G1g/+NV7WEK5UXiLmS4wW9MVZ7KOQgqSWkC1i/h5v675ygEvEdTPN1nJGV
         vBpNEYGsUTzPF26MiHKuLxuhwQ+Hq69sEiP+SAH4s1wxMTuPVgg1i7RF7MlSMiF8mgWX
         Y26hLnX2E0H9RP9Ym1ayKb7paWHp9swNOJugUqDxtc9Q4qCyqHj58imdPEB/CLleq+YV
         doqrx/mrU9HUD6yZvzBWfkme/jqQteUO/0TAn1CoU0REtkXe/GM/Y327BTFAVybaTtOm
         yDxI9sYTqQRFE0uL8cUGEEtmlVzvdhHCt+KqjbZhImNm/PLRaxhORqrv3Su0+2te2Z1p
         45CA==
X-Forwarded-Encrypted: i=1; AJvYcCWrJRBYmzIEeF1XAN3VpiRcoyFQwgC3gCOdwle+5eQceN9omS0y/65pk4V5NLtXT2pUUc5vt3d1O0agJqZ5iaxg7Jonp/16kZC4
X-Gm-Message-State: AOJu0YwMgAmOAyWIaawLK11AvqZIyUrX+aH9odiK8P6ZGBUo3prXwiMj
	MossWsAeqRN3+H6btqgkEYJH3WcKh8hNX0jjS++VmJ+IPpL01UJzANOCsA+pvlY=
X-Google-Smtp-Source: AGHT+IG+pcKbD9FHXOBzC2Vl0cLGum5HEC0ycJQ5ARdqsW469VQEuDJs55UUPa0z1vAk4z7J+hn3+A==
X-Received: by 2002:a50:ccd9:0:b0:57c:6740:f47c with SMTP id 4fb4d7f45d1cf-57cbd69c7e9mr5872718a12.27.1718607769728;
        Mon, 17 Jun 2024 00:02:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da785sm5972959a12.28.2024.06.17.00.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:02:49 -0700 (PDT)
Message-ID: <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>
Date: Mon, 17 Jun 2024 10:02:47 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <20240615-angler-occupier-6188a3187655@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240615-angler-occupier-6188a3187655@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.06.2024 15:17, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
>> the RTC and the tamper detector. Add documentation for the VBATTB clock
>> driver.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>> new file mode 100644
>> index 000000000000..ef52a0c0f874
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas VBATTB clock
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +description:
>> +  Renesas VBATTB module is an always on powered module (backed by battery) which
>> +  generates a clock (VBATTCLK). This clocks feeds the RTC and the tamper detector
>> +  modules.
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,rzg3s-vbattb-clk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: VBATTB module clock
>> +      - description: VBATTB input xtal
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bclk
>> +      - const: vbattb_xtal
>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  renesas,vbattb-load-nanofarads:
>> +    description: load capacitance of the on board xtal
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 4000, 7000, 9000, 12500 ]
>> +
>> +  renesas,vbattb-osc-bypass:
>> +    description: set when external clock is connected to RTXOUT pin
>> +    type: boolean
> 
> When you say "external clock", is that an input or an output?

I took that statement from the HW manual. As of the HW manual [1], table
42.2, that would be an input.

[1]
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250


