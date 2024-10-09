Return-Path: <linux-rtc+bounces-2125-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E79239966E2
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 12:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8813AB2A0DF
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E0A18E36E;
	Wed,  9 Oct 2024 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dMiGuOrC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC159188587;
	Wed,  9 Oct 2024 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469050; cv=none; b=FrFl/Ztc3qvYHeEpd2pNP/3SVSkRbwmS7ktvSBoIyx5u9+gRYx6DO8vA3eyh0dZZRYIpKqonNQu3qQdN1cZBgo0YIQyrcnCMAiMnQLVB/tF58RrNZ5zru0onvbw5pGPZyktgmCcVmRHMiZTiUKwE/ke4SeqoO6yRAZxBgP99wGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469050; c=relaxed/simple;
	bh=bbq465Lr8bF4LJTB3VozOip+eGyEl98TmJOQiFaPP9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Egeeapo9LFPX+TK2CRvCtAs4MbHhUFJYiJTfUL/mCW8CexC1twLVVaXN71lOgPv9zNGs9XXuf+LSw+L6Je/8NTWN5BFuD48EM1YQhgRyqlfsZ/2UmzbgN37WHGfU0E+gY6Z0KnlTIEMMTlkiapFuth1T0FqU8kECxED1EAbYSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dMiGuOrC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728469046;
	bh=bbq465Lr8bF4LJTB3VozOip+eGyEl98TmJOQiFaPP9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMiGuOrCnWmurk2EXJ/dsGkp9OQaPgev161HD/VwTgyh3LqXmxCBXoLgBsxmNoCer
	 NLXOwzpixc8s4AotoOk8DEtIocIfDl4wCF9wMR04IUWUTAlFion9CMBhDHZBPmzou6
	 0TRH6/TOJZTB+rzemzj6ZFdKzabX286TSluSnGrZNsGuDaKrswP2BmTT1DiruMoZfH
	 KZHGJ6CfSRkrYH7Evu6NuoK7TctMqXp7BTGFG56dWnQ5UKbcxc9Cl4GSCmJ6tMj/dq
	 4tpUNm2WFXfML3n6JXtK4X/+7hgcJyBMqMtbBiKlpl8S9hlPJxzFadbGunXvAZy3pj
	 lf0Oeu2axsC2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E59417E1034;
	Wed,  9 Oct 2024 12:17:26 +0200 (CEST)
Message-ID: <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
Date: Wed, 9 Oct 2024 12:17:26 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year
 property to RTC
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com,
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
 macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 kernel@collabora.com
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009101549.GB276481@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 12:15, Lee Jones ha scritto:
> On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
> 
>> Enable evaluating the start-year property to allow shifting the
>> RTC's HW range.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
> 
> No such file.
> 

In the cover letter, I wrote:


For the bindings commit, this series goes on top of the MT6397 schema
conversion from Macpaul Lin [1].

This series was tested on a MT8195 Cherry Tomato Chromebook.

[1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/


So, that's why. :-)

Cheers,
Angelo

>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> index 953358bc997a..a83cc35f51f1 100644
>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> @@ -71,6 +71,8 @@ properties:
>>                     - mediatek,mt6366-rtc
>>                 - const: mediatek,mt6358-rtc
>>   
>> +      start-year: true
>> +
>>       required:
>>         - compatible
>>   
>> -- 
>> 2.46.0
>>
> 



