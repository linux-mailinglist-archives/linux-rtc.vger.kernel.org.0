Return-Path: <linux-rtc+bounces-3116-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E12A2BF5C
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 10:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 211BB16A987
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148261DE3D2;
	Fri,  7 Feb 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D18LWe7S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06601DD886
	for <linux-rtc@vger.kernel.org>; Fri,  7 Feb 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920650; cv=none; b=hNOAsIyaymfPyq7X+cL0Vt4kgH6cpnGnZszAgzTnApTqgwTfy6+p6kD75oPO3lq0j9vtCgZViIN3LXvMGtMkIpRx7HdbatNbAG1Lz2gDz64NWCWoP3ZPR2rOYIx8ho2IpLNYpg2qhZNaRounlZQxjfvmlp5gqwwq6K2ws54ymcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920650; c=relaxed/simple;
	bh=KZz4YXEEectB/KFT/N6DyOq5QWuZSWoD7Tx8B9dY+sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO4/KVHpAQjM4xA84LPzjrlQ3dUtx09SeXAyTfSRZOoOqtgIJYUhvvGgakeEfQTD6vafraI+cC3Ibc5XOs2mFZ0Cc9LzQo0Pqcj+5XKBmyYvJJYH505ZDxixaiScRyAKsbkMgqlMZE6GO+WzqP6Xzdp88Ul04MIGkybnlE4R2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D18LWe7S; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so20229475e9.0
        for <linux-rtc@vger.kernel.org>; Fri, 07 Feb 2025 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738920644; x=1739525444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTv0l3P8oHjIwWa0vJ1xNlM+ceYNV5pE7I4XlmUzuLU=;
        b=D18LWe7SATr2SvijI6IGQPHE0080Jcx/xjtiyuUl9jtog1kGluCwdclyR0M0ALBABe
         dUQ1whnTBxVGGPsLkMNMVB54pcW2RmC//xWIyu9KT0lXpuG/TVDEo6YpJ30nXPzKaXby
         6EVqKpOFPiaKaj8jHtC/PbM/Qmdck9H2mqcSWh5aQLI5/XRdD9xqg3gs6rv1Y0y2bM//
         JrBjjYUJvGKW6ZjRtkYThXCHFQWDWvDGpNbscXO3AJrfqYzI90TRNYx3tT0wsRuJnz3j
         ZDbwtMBtCK3nAP35KkC9oi+H6QuCpvZokQXErkt9RuWGySjL88nQlRUUUZ/bKxaR7qLX
         r8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920644; x=1739525444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTv0l3P8oHjIwWa0vJ1xNlM+ceYNV5pE7I4XlmUzuLU=;
        b=j9MoirlZsTSneD4waKlc903+SYmUk7YSGeG/POMr5nVK3+wbeFTo/1OVHka3jGbCgV
         ZoTT68hVRtv2vUeFXes9MtI4zI8AwDyPFsgnF9SOSUdXmSnkckzt7Qb2u6NogGKZhs/N
         3xLzBnWI8JzyxmXntjENts1uQ+EPD/9D42QA3F3REIZbcFcvpi8PzIOjoVy38Xdnqbf+
         DAK+yUrJzhVz/4Sto7NM+NczNlUVF8u9b3VRgVNY1JTu+XtRyuZF3lQC6kfQNef+U0VP
         nWQqo4DJzpvl2dPAKBXppl8sBl3l5XKcB9uNX6XQyuILZf21v3mV052hKRZkBjPnMR0C
         tGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpf9Ywx2NoK4wM9op6Pl8bINSVNs67wxw+rBfEAv/EA8gpoBwwvWiB+ufU0JQsuriCUH5lursw+ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhjvuzJo8Jk9MpewSNBNRvsaf0b1oTlBvdc/ryTMBLtNVkQKb
	cBFmlNVWI+VkeieRR+swKRjH4NVhIXKadZ4ISy9MZCGhMH/v43D5QVPO6ZU2xyA=
X-Gm-Gg: ASbGnct1zkYByPsTaHN+wEwj+g7T4eUvrCy4kYVor1GuqflQJ0OadSZEAOB+2S48CXN
	2l8jr3wI8BpN9lXA2B4lmis8BHnMEnocM+NviVHMGq4qCRXKx8LeRiyHwLDRxpZC0l5TraHLsle
	vFnv+nVdq09mXt3cwduvbSz+lAcMeCzQtNXyiJJDAJJ0fXijSTjdeaT+cyGDOl0PiKQOffvUOIZ
	hXTmUY7sRJ9cS6bVld4BZJE6lX6XfcKxainzBFdFWFNSaDm0f/+pGyaD03t0ua7nDRMrp7nY9Li
	um1INUnVfN/Wphr2VtswXQEv+gc4FUPeaH3cx9SbhkGh5xacNZwIYfsQoSvRHqU=
X-Google-Smtp-Source: AGHT+IElsKs0XLYEriSWI3dDW9xTs2P0W29PLLdDtB0wMdiWa2+7KZzbYDArv0YRFXODUIVGn6d1iQ==
X-Received: by 2002:a05:600c:4ece:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-439249913damr19584105e9.17.1738920643824;
        Fri, 07 Feb 2025 01:30:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94dd1esm85365915e9.16.2025.02.07.01.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:30:43 -0800 (PST)
Message-ID: <82b5b5d6-2009-45d6-bb4e-517b8978b88c@baylibre.com>
Date: Fri, 7 Feb 2025 10:30:42 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6359: fix year issue
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
 <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
 <202501091546387cff95fd@mail.local>
 <49b100ae-9b81-404d-b64c-93c60baa859f@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <49b100ae-9b81-404d-b64c-93c60baa859f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Alex and Angelo

Thanks for your comments

Angelo, IMHO, "regmap_read_poll_timeout", mutex, RTC_PROT, register read/write,... aren't related to 
this issue (but I've verified anyway to be sure and everything works as expected ;) )

After digging a bit more, RTC_MIN_YEAR_OFFSET (68) hide another problems.
Please, keep in mind that I probably misunderstand how range_min, range_max, start_secs have to be use.

1)
Default driver values:
	rtc->rtc_dev->range_min = mktime64(1900, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2027, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);

First issue is HW alarm doesn't fire.
When the PMIC is powered-on, the year register value is 42 (is it a bug or usefull feature ?)
When "hwclock -r" (read) is sent, the RTC framework steps are:
- read time from the HW registers
- set alarm
- HW alarm triggered
- read time from the HW registers
...

But the year value written during the "set alarm" is different from 42 due to an offset issue. Then 
the alarm will trigger some years later and the timeout fire instead.

I understand that offset_secs value come from different formulas depending of the 3 variable value.
In this case, the formula is 'offset_secs = start_secs - range_min'.

Then change start_secs to mktime64(1942, 1, 1, 0, 0, 0) to have, in theory, the good offset.
But now, I don't reach the set_alarm step and have:

     Waiting for clock tick...
     ioctl(3, RTC_UIE_ON, 0): Invalid argument
     Waiting in loop for time from /dev/rtc0 to change
     hwclock: ioctl(RTC_RD_NAME) to /dev/rtc0 to read the time failed: Invalid argument
     ...synchronization failed


This issue above doesn't appear if I remove this piece of code
	/*
	 * Since the reading time values from RTC device are always in the RTC
	 * original valid range, but we need to skip the overlapped region
	 * between expanded range and original range, which is no need to add
	 * the offset.
	 */
	if (rtc->start_secs > rtc->range_min && secs >= rtc->start_secs)
		return;


Better but not over.
My current local time is 7:31:4 1-0-42 (hour:min:sec day-month-year)
Now the alarm setup value is 7:31:5 1-1-84. Compared to working setup, year value isn't consistent, 
it should be 42 instead of 84.
The removed piece of code isn't the cause of that because before removing it I've workarounded it by 
adding 8 hours (or one day) to the start_secs (mktime64(1942, 1, 1, 8, 0, 0)) and I observe the same 
issue: alarm value = 15:31:5 1-1-84 which is 8 hours and 42 years more than expected. Come back to 
the first issue, alarm doesn't fire, that make sense.

So why the alarm value is 1-1-84 instead of 1-1-42 for "start_secs = mktime64(1942, 1, 1, 0, 0, 0)" ?

2)
Playing with range allow me to find these 2 setup which have a working alarm setup and return me 
clock time : 2070/01/01, and I can't change the 2070 event if I shift the range.
In this case, the formula is 'offset_secs = range_max - range_min + 1', so change start_secs is 
useless unless I go out of the range and then, I have another issue...

	rtc->rtc_dev->range_min = mktime64(1960, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2087, 12, 31, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);
or
	rtc->rtc_dev->range_min = mktime64(2000, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2128, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);
or
	rtc->rtc_dev->range_min = mktime64(2004, 1, 1, 0, 0, 0);
	rtc->rtc_dev->range_max = mktime64(2132, 1, 1, 23, 59, 59);
	rtc->rtc_dev->start_secs = mktime64(2010, 1, 1, 0, 0, 0);

Note that I must add 1 day to the range_max in the 2nd & 3rd example to make it work, probably due 
to leap years ?


My first though was min and max range give the supported hardware year range, and start_secs a 
wished "software" value applying offset to the HW value. But after some try, I see a lot of 
limitations and requierements to make it "working", so I probably misunderstand how range_min, 
range_max, start_secs have to be use.


Regards
Alexandre Mergnat

On 14/01/2025 11:53, AngeloGioacchino Del Regno wrote:
> Il 09/01/25 16:46, Alexandre Belloni ha scritto:
>> On 09/01/2025 16:29:52+0100, Alexandre Mergnat wrote:
>>> Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
>>> introduced a regression.
>>>
>>> ~# hwclock -r --verbose
>>> hwclock from util-linux 2.37.4
>>> System Time: 1262312013.143552
>>> Trying to open: /dev/rtc0
>>> Using the rtc interface to the clock.
>>> Assuming hardware clock is kept in UTC time.
>>> Waiting for clock tick...
>>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>>> ...synchronization failed
>>>
>>> Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.
>>>
>>
>> NAK, you'd have to investigate a bit more, I want to get rid of the
>> RTC_MIN_YEAR_OFFSET insanity.
>>
> 
> If literally all currently supported MediaTek PMICs RTC are working fine (and
> it's not just one), but the one that is introduced here has issues, clearly
> the problem is *not* about the min_year_offset not being there, I'd say!
> 
> Btw:
> "hwclock: select() to /dev/rtc0 to wait for clock tick timed out"
> ...is the WRTGR write failing? :-)
> 
> And no, Alexandre M, don't trust the regmap_read_poll_timeout() to return an
> error, I'm not sure that the CBUSY gets set to zero for *literally all* failures...
> 
> In particular.... some RTCs are *locked* and need to be *unlocked*, and in that
> case I'm not sure if the write just goes through but gets ignored or if CBUSY
> stays set.
> 
> Anyway, check the RTC_PROT register for the unlocking mechanism :-)
> 
> Cheers,
> Angelo
> 
>>> Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   drivers/rtc/rtc-mt6397.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>> index 55e75712edd4..9930b6bdb6ca 100644
>>> --- a/drivers/rtc/rtc-mt6397.c
>>> +++ b/drivers/rtc/rtc-mt6397.c
>>> @@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>>               goto exit;
>>>       } while (sec < tm->tm_sec);
>>> +    /* HW register use 7 bits to store year data, minus
>>> +     * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
>>> +     * RTC_MIN_YEAR_OFFSET back after read year from register
>>> +     */
>>> +    tm->tm_year += RTC_MIN_YEAR_OFFSET;
>>> +
>>>       /* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
>>>       tm->tm_mon--;
>>>       tm->tm_wday--;
>>> @@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>>       int ret;
>>>       u16 data[RTC_OFFSET_COUNT];
>>> +    tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon++;
>>>       tm->tm_wday++;
>>> @@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>>       tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
>>>       tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>>> +    tm->tm_year += RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon--;
>>>       return 0;
>>> @@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>>       int ret;
>>>       u16 data[RTC_OFFSET_COUNT];
>>> +    tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>>       tm->tm_mon++;
>>>       mutex_lock(&rtc->lock);
>>>
>>> -- 
>>> 2.25.1
>>>
>>
> 
> 

-- 
Regards,
Alexandre

