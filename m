Return-Path: <linux-rtc+bounces-573-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B58836F74
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jan 2024 19:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740BD1C291CA
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jan 2024 18:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9537B46538;
	Mon, 22 Jan 2024 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5zbWg3p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84924642C;
	Mon, 22 Jan 2024 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945251; cv=none; b=UrpvB2KG0/ANgLqbvn6zeAEFnYWaIkgOIa2OgWx7xJWXGVBFXD06pfbadPdjTAjdpVyKQn5yYxetrbsffmw9bUNFvgt+eGu6BMHWtiOVQHNoLXBSZVPSb7D3zB2X82zV1Fj9iwKxMrmvFXhbSlg2oQhlwCHrBaB6ksrVsNIitXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945251; c=relaxed/simple;
	bh=z0YX+nshrLb1ARNNrOWMxFE3wzzsiMY5HD6g7Q/E/UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv1bCIe+WFI70Rz74JOfVp/zwhigWHzo9hzWj6HxNopW/djQDQJoZPYooTlf9bOuB07jrIYwFjKBJ3g3MObtphNUdVoozVD0H+ORB0ywAgSHeTITBBwfeLaSWMfYHwjm9485oEZQq933RiTpAp7FQhdpnksOacAOeMRmDWaYy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5zbWg3p; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2a17f3217aso328201566b.2;
        Mon, 22 Jan 2024 09:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705945248; x=1706550048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg8I5JcHrRlXUy9GUlV4Auo+UENFvpBlf45H7DNqd2g=;
        b=A5zbWg3pG1scupMA+GwI83zK/RnroWgLrxfqiG304MJkYsGvjY8fTrFFcEOUpoEl9y
         DuZe1N5BZU7bt9z1vzlZFOsSwyLpYHUQnTQVsOTwQJXAIj/pItx/lIRkn8HMV6bvgzGL
         z5aTWiayPpQz84tSGM9HM/USQW7lOElRl8/a2IZ26Cify9KUU5BpkCsltGHNkIzMk94n
         f16FVNPy92jCeliRcCpg1RmmLpC9KV+xzPSIFRpQO9gdUYb9dI9lqXpstgE0fIAZnw7/
         QeCU50jlaMjPURu1Ks1+vaOmQ1vY0PSA5PBUyuNAUPKwMtAPqXkD43iBNr0hqoxePucY
         OCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945248; x=1706550048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg8I5JcHrRlXUy9GUlV4Auo+UENFvpBlf45H7DNqd2g=;
        b=fPvIDi245ZJgpY8E+Sylri3CDW12Fwk6+fvgeJbMR6l6Ha1aZJdsM8zmQOkjN291pS
         OfPEQdpUnaHYYIr7FmuaDzHfWHDSZAMRT3clvfnn/Nui2CzFAGIVTK2ETtRvHT+lzWO1
         oXNxViKwpEgKtyESo4oITR3nqaGoqcIjneCgpLwWuEzZALAE+IF0zFnyAgPk0VwcAd5f
         Wx1OBQnCzj4JJ0dewhiW0n7V+DT1+OUp/dqJxuWudKhse8tNVTLwtF0eXGmYd7K4ZOko
         5oqB39Ba174zxEnrnPNi/x84B5EqZ9Sdp7JTX2ezhy+3kWoU9SblMLu6zu8aVXWV/jE/
         UFvw==
X-Gm-Message-State: AOJu0YxojYgpueUoKy7/K1+g2cuCYD/8HY3DChPmwVQNSoYyMBOSkkSS
	S+xxTmFihFgUU9Z7IVf2wO901W75udIQ1glSxpznTpk4AysMTJY8
X-Google-Smtp-Source: AGHT+IFx6SIU847X6czNf31z+hKTviMy+yuipEXqcOFLhPZbLoNL5KT2/P9O4hOGrFtB2Z4tFJvI/Q==
X-Received: by 2002:a17:907:1601:b0:a2f:c791:7739 with SMTP id cw1-20020a170907160100b00a2fc7917739mr2615956ejd.30.1705945247871;
        Mon, 22 Jan 2024 09:40:47 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id t19-20020a1709067c1300b00a2ca9d38654sm12642103ejo.85.2024.01.22.09.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:40:47 -0800 (PST)
Message-ID: <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
Date: Mon, 22 Jan 2024 18:40:45 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.01.2024 14:19, Matthias Brugger wrote:
> On 22/01/2024 13:49, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files. Introduced changes:
>> 1. Reworded title
>> 2. Dropper redundant properties descriptions
>> 3. Added required #include and adjusted "reg" in example
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>   .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>   2 files changed, 39 insertions(+), 14 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
> 
> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it and add reference for that RTC as well?

I see your point but by looking at existing Linux drivers:
drivers/rtc/rtc-mt2712.c
drivers/rtc/rtc-mt7622.c
it seems like quite different hardware blocks.

Different registers, different programming, clk in MT7622.

Should they really share a YAML binding just because they use similar
properties?

-- 
Rafał Miłecki

