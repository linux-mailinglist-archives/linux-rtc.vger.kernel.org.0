Return-Path: <linux-rtc+bounces-578-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9399838C47
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jan 2024 11:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD6E3B237FF
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jan 2024 10:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE945C905;
	Tue, 23 Jan 2024 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KCXB9rsP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E75C61E;
	Tue, 23 Jan 2024 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706006455; cv=none; b=WySQau3SpO1JFSdP8x8cG2phUbhTRGQnmTV3LtNRwOHvIzB0zMu93WTv7vryIn46Xq3fEinWbDkJFGmmeM5uLI0Dx1UL4epjEj7WIpZJ2iI0vOsWWLCqkrQb9OrYW2Tbhr879aoetx207tmcdY9p4zEn/FQtxTbr4oUjVEXRq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706006455; c=relaxed/simple;
	bh=s4p4CLV+pTT8G1cNbeHX4mdCI5yB1F5H8tIRN0w1MxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERaMwDIOrmPhimRnQSYWKAt2LDiHad3S1SVBMYQAtZ9ckUf0F2VPKJTb7uSmeWHidi0ViwjHr/uDOQv89jxpVNyaKkRscl/3fcIYpw2Za0ct4/lahAc4BRMqQL18ibGA1+zdQ1JhSVvod1XEqjh+KR/02e+/Ds232BajtcRWfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KCXB9rsP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706006451;
	bh=s4p4CLV+pTT8G1cNbeHX4mdCI5yB1F5H8tIRN0w1MxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KCXB9rsPb1aJGlxX68Ab5Gb+R5dgLfA4hoWCkrUVDATQVt6rF8xnwh1l2wICT8cvQ
	 bL6Mi2RnXULodReB52ZrM1ASZqBFAW9/4eSKLQTECXEH/a2Hp/WhX6Ocx4YCS5I07G
	 GnEzZ0QXeMR4cLeM3JYDuTYLyezw6mQ+tOH3U3NsdPiilxFcljraNkuXIu0obmrGj6
	 KXo+M1jRKkc8wkS8kDIpU7BtcmInaFlL2a3kmIrhfGvwTgq6janE1BSjDzMJauRL6R
	 /q8omfi++AYEuaqECFFEfTlIgLm2E7JbUYQfB+r/5CHmpLHhQDHML9liBP8wWzOHCD
	 Gz7EuP1GlqDHg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B138737820A9;
	Tue, 23 Jan 2024 10:40:50 +0000 (UTC)
Message-ID: <6e2c7fed-0e61-41fe-8213-9c7ae483cfd7@collabora.com>
Date: Tue, 23 Jan 2024 11:40:50 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240122124949.29577-1-zajec5@gmail.com>
 <1c4e14f7-ca34-4433-96cb-0ba6d6c6906d@gmail.com>
 <311fa703-7dbc-41d2-bfde-85dd7cb20657@gmail.com>
 <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <227a0fec-d295-45ea-8d65-3cb0a7ce1af5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 23/01/24 09:57, Krzysztof Kozlowski ha scritto:
> On 22/01/2024 18:40, Rafał Miłecki wrote:
>> On 22.01.2024 14:19, Matthias Brugger wrote:
>>> On 22/01/2024 13:49, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> This helps validating DTS files. Introduced changes:
>>>> 1. Reworded title
>>>> 2. Dropper redundant properties descriptions
>>>> 3. Added required #include and adjusted "reg" in example
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
>>>>    .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
>>>>    2 files changed, 39 insertions(+), 14 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>>    delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
>>>
>>> In this schema can easily fit "mediatek,mt7622-rtc", so how about renaming it and add reference for that RTC as well?
>>
>> I see your point but by looking at existing Linux drivers:
>> drivers/rtc/rtc-mt2712.c
>> drivers/rtc/rtc-mt7622.c
>> it seems like quite different hardware blocks.
>>
>> Different registers, different programming, clk in MT7622.
>>
>> Should they really share a YAML binding just because they use similar
>> properties?
> 
> Hardware aspect matters more, including features not yet present in the
> binding, like some power on/off control. Different clock inputs is also
> an argument.
> 

I agree - those IPs are different, we should have two bindings for the two
(very) different IP versions.

Cheers,
Angelo


