Return-Path: <linux-rtc+bounces-577-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3A8389CA
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jan 2024 09:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C821C24C09
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jan 2024 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC39A57312;
	Tue, 23 Jan 2024 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKSNUK71"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D7F56B99
	for <linux-rtc@vger.kernel.org>; Tue, 23 Jan 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000264; cv=none; b=kSxMF8RckcyqDpDgN3w62wunucwAyOMIK4RnCSkiTxYK5ezLxlZ7Oa4DBXFdXkYelP/grK333Ht7r/S5sWukTpoeYu43TGzG0XGHduB31KlYvS3hQj9pZztc0iEHtYpMLVEBC0c7J7Iyvp8CPy/H7/zivnSFCi3/pJTwnWphqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000264; c=relaxed/simple;
	bh=BIscfeeijmjadWnyy8w0J/z2yZrGooUwtRX7iY15Ly4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLZDRa0kc9//k+3wKWhvWjY1iRkRHijGtCvm22AtxQDTAZqIcs5BaZlJPlvkSjzkr9FlR/Hc/AuWS56qhv1qGiVB7EP9vKs+d4qVJM388W7QD30+c9dY8AaDJUc892ZDvIKEHwgeQ9nKr6kot/O3RlIuec4zRZuM4+4eDLE5Lgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKSNUK71; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so52282095e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 23 Jan 2024 00:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000261; x=1706605061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKQcd6zGviGMMPAwidjjHq3Z2rH3vbPkXm0nRap/ryo=;
        b=qKSNUK71/81rmk5fx7vEmczYcR/SZulAVCcJI1KE23nG5OnBxB1VoPTdvea7ucas5m
         xfS5pNX5qLFY8yLvSI9FWIcZrITj8Hp931VLaA9G4hEDMwtRRl1JmC8d4e9ychTazPZT
         xv92a5BKEqFh0JFQVHMaY3wLyjjdgh4o8q4faeL9YzK/lkzU+dL3ERFBu6vcjumpJNKK
         g+4PUbkAeSaNqTImurvz+KaSfmW+rr722BTU/EMEJwRbQ57rr5S+qlbLZko7cIJW0vHk
         vgLuoqebeahFgahJvNwa/9eaHJg4k3MAcrCi+TLYbW+XVrQl4ZzVYLiDPRkmISFCM/mZ
         Hcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000261; x=1706605061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKQcd6zGviGMMPAwidjjHq3Z2rH3vbPkXm0nRap/ryo=;
        b=gobOWV6xK6tvoMF3HW+fzsY7xrslQlWJ3aE+RibGrSwwQV8Y3Z6EAMI8kJ7W16BPHG
         nMN6yfDmKPZDq9p9fFQQTiB/SC2sQ5hdK4gXAXKVxEgL5FsjQZirodZWlQkk5nLSLaHk
         ehmQQfCMOiebGjajraXJP5dH+jJaHW3mAnYNBxZuQEiLvNysEr2bMfGrKXV8Ztv66hRB
         +JIQluDJ3NTYY/IbpqAIR8sUZx+aHtPNfP6SuVyEmsOjjn27upMphSBbp/3j15n+kCNu
         wFMlP7r9lsk4M771Gd5QLXxkk6gelolsDBjDuIScFq1LSSJG445Bj7TLv2ayJoaKX9DY
         6ApA==
X-Gm-Message-State: AOJu0Yy219RcMSpPEELKOBqChVzVeupS/4X5TSx7KcXaLf+xX9SiVudQ
	RyiWRNyWSeIDACSzYPlFgkcDAL/LuSmUMvbbSRLIeNDpVMlw3GSMM2aXrVJT8pE=
X-Google-Smtp-Source: AGHT+IEN98qPl2qnqIv//XZDRvj9oPSlVkhngI8cL6W1ou5M36+YReKQJAY/MPXywqbOrMZRP6QbYA==
X-Received: by 2002:a7b:cbc9:0:b0:40e:7f3f:b1f7 with SMTP id n9-20020a7bcbc9000000b0040e7f3fb1f7mr331602wmi.98.1706000260963;
        Tue, 23 Jan 2024 00:57:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ek15-20020a05600c3ecf00b0040e8e358f82sm18577602wmb.19.2024.01.23.00.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:57:40 -0800 (PST)
Message-ID: <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
Date: Tue, 23 Jan 2024 09:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Ran Bi <ran.bi@mediatek.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
 <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
 <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/01/2024 18:40, Rafał Miłecki wrote:
> On 22.01.2024 14:19, Matthias Brugger wrote:
>> On 22/01/2024 13:49, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This helps validating DTS files. Introduced changes:
>>> 1. Reworded title
>>> 2. Dropper redundant properties descriptions
>>> 3. Added required #include and adjusted "reg" in example
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>   .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>>   .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>>   2 files changed, 39 insertions(+), 14 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>
>> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it and add reference for that RTC as well?
> 
> I see your point but by looking at existing Linux drivers:
> drivers/rtc/rtc-mt2712.c
> drivers/rtc/rtc-mt7622.c
> it seems like quite different hardware blocks.
> 
> Different registers, different programming, clk in MT7622.
> 
> Should they really share a YAML binding just because they use similar
> properties?

Hardware aspect matters more, including features not yet present in the
binding, like some power on/off control. Different clock inputs is also
an argument.

Best regards,
Krzysztof


