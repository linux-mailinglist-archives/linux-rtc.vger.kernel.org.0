Return-Path: <linux-rtc+bounces-3947-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3DDA8851B
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 16:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E807556466F
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FAF2957D4;
	Mon, 14 Apr 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nSue+Mhi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D525393E
	for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638980; cv=none; b=ItSJ7UBmRfln1cHNSq33bjjvNQtXMBhgpJ7xwraIgO0bBcm4DIozHovrJp3a5v46MNv62u7VqbNK/MnAj9p68N6bret9pL/a8z3zF6Y0UvfH5Kh95FqA9HW+goDhDhe9O24LKXdqrYsCPNVJhtJQ0SpMW/szscJujax1a6zl22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638980; c=relaxed/simple;
	bh=uhXCK6Zf6sye5f+kTXxkk6TOXTEo1CmGh0O5s/dDSHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nX3UBMNKrO8g3yodclt9BoTSx376VyMICndowSaQ1eNcqMNV/h1OBQlmhCVZhkj3v2Rhog6lXkyjw0X/lTb8Jg8xU5dFVHreWiZ0NPTQ2xDUzU2gD/I4LLIx5u5F17G6Eb5yUHmMYOPo+CYkJhPP6MLELuW6cCw8MOiFBzpVdIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nSue+Mhi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-399749152b4so2268534f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 14 Apr 2025 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744638973; x=1745243773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=nSue+MhiY3cycxAybvNK3uHNe2NCl9lvw9NNR6a84Yb+byMHjsJFem+SAbZb3J2cV8
         BkWS4aXWxAoqeVooRYXHv+w07YAh7IWJ90/7AeJm0NYd16wfICPG8LdX9hrorDpsr48r
         0BeMMwyB8jVatjgS1m/NUOFr9/CzehvhwQ7G4XcIsK5xzEYDJi+qH1INZ3fAR0dRZVTL
         zw9XPCSkroOKVcz9GQdK9kEnWqPqktqlcsDD6tge/ejf0pBPSGv70fEbPtKoJtD5RCoy
         +hwOA6QKAObXpPETcI7hb5s+KMBBVy8HB9cw0rNHKGO/z2a7RhhWpQ+ZQ6lnBW1OuAI4
         bMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638973; x=1745243773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSPX/TbzronNETf+6T1qob9Fj8RgDBqBjqNXnAsD94g=;
        b=vYq2Gkah/dVEqo0sJS+8A8hfPqO/8Rnzzw8VdqYFImxgnsutmJhncE+ualO4jZq6eK
         eqKLK7zib86fcVIsa2ic2JlGBxdt6UX8YWNzmfvIuPZNgl/1orRDhykIa/mGeUwMI7iq
         kH8v3f0jBgZupPj4CyBWSRZcUBMEZ8xvt3cBmw4xRoMCpZmVFG15Q6jE1i11XClFRKEK
         oWxlfMGkarzSdurhWdyGb5WavAQFPUYpWN89a2J8LS5JSOCkBYFA3Oft4QjnnecE8zSn
         r9bCqWY80d1td6YwveJYA4UsJUwvVaetpB8MF6ta3fo2Dh7jhBZiMidAAB8dPjds29cb
         FhHA==
X-Forwarded-Encrypted: i=1; AJvYcCWf6PtK4upIb9206s38Mg9nsb86MhXI077+1XURJCdvZQmMxpXHWZEsv79soA4puEbPeORSSacIskU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkg3u6hJSmr5IunQxr3PtAC+GWHHA2IWLhKJVARdelpMSC+6Xy
	eOTh8AlJNUX6L4e6sHud/O0T6E3m538E+4lc10Dman7wAp8E0aOIopueb+yPdq0=
X-Gm-Gg: ASbGnctAq+mPVo2fKOPLzciUX3bOEHTWCkBKvL/u2gebG6vpF/6QrmK+dmLICEKZyZX
	Fm+SkMylog6DgvaMtpWwVnSDb6UuD7HnuUfvAEHWQL/gF3U3JBWpcBVS6qLU4mEWe3SMf2Uk3YA
	X2ACJZpPzKJMUq3pu+KQ54mhpBeXG3o32EUxxVALQefckXJHs/ZEfkM7nR8kX28DRWz5KxIRRU6
	q9cNGHvc73vBQvPfoVtR/3pP/moNdR2moqA5vSOH5ScO+8S4DdMp6kL9klx3dc6rgSkGIQj8wPv
	tuSpnvsEZa2cJ+Fux5bp7aOpuBb3ruOWZVJZZg8SieFcRyvmReLboaBr6vNqraJSVtflkYNvIgF
	cnD9W5G+lGyyt
X-Google-Smtp-Source: AGHT+IEiisaCyzTv/c4YGT/191xkPS9XSCL07GXPd0MhBX6X1cLo7SxgbsZldJJbAyTaapzLfN0VMA==
X-Received: by 2002:a05:6000:2507:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39ea51eef37mr9727002f8f.9.1744638973332;
        Mon, 14 Apr 2025 06:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c? ([2a01:e0a:5ee:79d0:2dda:96f4:b94d:164c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97751fsm11004403f8f.41.2025.04.14.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:56:12 -0700 (PDT)
Message-ID: <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
Date: Mon, 14 Apr 2025 15:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local> <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/04/2025 13:09, AngeloGioacchino Del Regno wrote:
> Il 11/04/25 15:39, Alexandre Belloni ha scritto:
>> On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
>>> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
>>>> The start time parameters is currently hardcoded to the driver, but
>>>> it may not fit with all equivalent RTC that driver is able to support.
>>>>
>>>> Remove the start_secs and set_start_time value setup because it
>>>> will be handled by the rtc_device_get_offset function using the
>>>> start-year DTS property.
>>>>
>>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> ---
>>>>   drivers/rtc/rtc-mt6397.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>>> index 692c00ff544b2..d47626d47602f 100644
>>>> --- a/drivers/rtc/rtc-mt6397.c
>>>> +++ b/drivers/rtc/rtc-mt6397.c
>>>> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>>       rtc->rtc_dev->ops = &mtk_rtc_ops;
>>>>       rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>>>       rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>>> -    rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>>> -    rtc->rtc_dev->set_start_time = true;
>>>
>>> This is going to break the time for people upgrading their kernel, you
>>> are unfortunately stuck with this.
>>>
>>
>> To be clear, the breakage will happen when upgrading the kernel but not
>> the device tree with 5/5
>>
> 
> Yes, you're stuck with this. Devicetree has to be retrocompatible.
> 
> Besides, this start_secs is what gets used by default, and the start-year
> devicetree property should take precedence and effectively override the
> start_secs default.
> 
> Just keep it there.... :-)

When you boot your board for the first time, is the date January 2nd 1968 ? If not, that mean it is 
used as a finetune offset year.
IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework issue we try to solve in 
this serie because start_secs is negative (1968 < 1970). Now framework handle the negative value 
properly, even if you keep mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to 
notify you.  :)


TBH, it's hard to follow the logic, so I've a question:
If I push in my V4 a framework fix that drivers using year < 1970 will need to have a new start_secs 
or start-year value to stay aligned with there previous value, do you will accept it ?

Because drivers implementation are based on a bugged framework, so it's impossible, IMHO, to fix the 
framework without impacting date values.

If you don't want to touch framework, then consider offset year in the drivers to reach above 1970 :)

If you have a solution to keep "rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);" without 
having the date changed, don't hesitate to tell me, I'm not forcing for a specific one, just tell me 
what you prefer for the V4.

Regards,
Alex


-- 
Regards,
Alexandre

