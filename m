Return-Path: <linux-rtc+bounces-2129-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C439967FC
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 13:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D11EDB21323
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2024 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FE718FDC2;
	Wed,  9 Oct 2024 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I6e90AM5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC241C6BE;
	Wed,  9 Oct 2024 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471909; cv=none; b=lo6NLGrhy1Z+oZ9EmKlSzOybt2nXCQrx9AwoHCFYveTzuog3jSIFuB0C1xz3Abms8WkhF7a7L2XWWlC7NSvMi4s/oK9uUnK3BsFqVHHzkKItRAZS9oliZ8slz1dEeZad9M1EeQcaXEOqm36L0s2d0JnHZw8A4RctkEVO46ypuqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471909; c=relaxed/simple;
	bh=TKg0yrvwHu/NQPe513WTgLUNfnI/jftaMyGjttredTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awvbqnx6f+2X0qnoTEZrZWfYUTa1/4XPDKzMR3etuQk+oCFKMN3EBVX+YuvlUo9hYJ+YMw+5iJ9gud14coee2305AjwrzI0CXZXDJTptYUUQJZ6LkPtQi8DX8wsXbCdeEgmTDkiRWHEs+gD5SEBsMKjk4zUy7zHHa2ZQUcbS+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I6e90AM5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728471905;
	bh=TKg0yrvwHu/NQPe513WTgLUNfnI/jftaMyGjttredTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I6e90AM5V9SrAtm5zY2/oJst8VLSC7GcUrXw7jqbo/CMwPQGFprGtyaXpdSlaSeBm
	 OXmAtgAZlb5a/ya5Bymg8hqLo115hc8ClFC7T1T2T5AA3fplXHEeMV3oPO+Yz00fvO
	 GioNirBpDaPWu9l2yATMLPgVyXBP6kU027oEGV0b25emFA9oxWm1sdn1B7OLBVq1B4
	 pXykQKUeUw2puJ/lxwuyuI8k5IrCcZWGk6dNuFTjYupPrVCbWosiy7+RNBJ9d3YDXO
	 Xk46wIT7Stapp9Tr1a9nIGnpmd5/HEThuHvJ3TB8kFh4l6Awn5sl7DNhPeo3ODu8am
	 fAR8D8wajrvMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A0E017E1394;
	Wed,  9 Oct 2024 13:05:05 +0200 (CEST)
Message-ID: <e68b3cc7-3851-4085-a16e-8b2c8882e26d@collabora.com>
Date: Wed, 9 Oct 2024 13:05:04 +0200
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
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
 <20241009103307.GD276481@google.com> <20241009103746.GE276481@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009103746.GE276481@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 12:37, Lee Jones ha scritto:
> On Wed, 09 Oct 2024, Lee Jones wrote:
> 
>> On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:
>>
>>> Il 09/10/24 12:15, Lee Jones ha scritto:
>>>> On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
>>>>
>>>>> Enable evaluating the start-year property to allow shifting the
>>>>> RTC's HW range.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
>>>>
>>>> No such file.
>>>>
>>>
>>> In the cover letter, I wrote:
>>>
>>>
>>> For the bindings commit, this series goes on top of the MT6397 schema
>>> conversion from Macpaul Lin [1].
>>>
>>> This series was tested on a MT8195 Cherry Tomato Chromebook.
>>>
>>> [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
>>>
>>>
>>> So, that's why. :-)
>>
>> Nope, try again. :)
> 
> I guess you actually mean:
> 
>    https://lore.kernel.org/all/20240918064955.6518-2-macpaul.lin@mediatek.com/
> 
> It's on my list.  I'll place yours behind it and see how we go.
> 

Yes I actually mean that one.

That's because I use to paste links to the cover letter of a series, and that
one did actually miss it, so that's what happened there I guess.

Anyway, I'm happy that you figured it out - this reminds me that I actually want
to keep asking to add cover letters when I review series..... :-)

Btw, many thanks!
Angelo

