Return-Path: <linux-rtc+bounces-1332-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4ED90A72D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 09:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C33FF1C2178D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 07:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1C118F2C8;
	Mon, 17 Jun 2024 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c7amUsqB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFF1862B0
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609517; cv=none; b=AlWJKRVgUr0bHdrtPZNEPemmRUTZhRIxvD374y63Xu4w0OO6HM2F+sDOBXuWfJDoTE9AdL07bOCYct1ZS4WHRlIYpbxFmmgHVSSj82OrSKC1o3Z1/HNaFqAJrOYuCxnyBOeMYkPd9mMlvOklYx7IFXlTYRUVEUaok7ycvmWXtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609517; c=relaxed/simple;
	bh=4cab+l+3ErFnVYNsjfbxHKynnX0kIO0LOP4jbY4dtIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWWqDzyNVMPTZcmkPG6dVHosD16ZBszl5tpQ5QIOw9yc/IzZynkBE5Ot16E5u/7hookzO+wly6/eAyMGydbRUQlwI2adwSJob98gHH0in4+PXCCHw060UUhd8GpL8C9sngSXulGHF5u9zVLO7hRJef6f2j12ifNO0Ve3098qI7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c7amUsqB; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe3bac6c6so45403821fa.1
        for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 00:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718609513; x=1719214313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi5kSVv+9tuno5ifh0iY5wU3dPT3z2QMr3DXugcnBOU=;
        b=c7amUsqBGVZKVyOHb8Xes3t5yalH1b51vgpmmk49Mk/RBpgLGwvMo0jNUJGCWYWUGp
         M5LGMSQpY7vN8NMdOtHyUT5qetFsO7If7UcZT8eNYvQ8Ufv5Wh8Q3fRvwVYYsOn3VJ1D
         HYottQMNhLAE0hHCkYyZEIvYo/XvZL2qPWy0nMjkoipNa5C2tkhQ5Ybh2VNq0mKhufc+
         yOAgM1RGm6/tdbhp5dcir84XALmNnvcDwsffOeyK3Z+6hU6H7VcASC5xwCNnK+WdJV2E
         KK8lXzrdZvU6xidBj1ItIj9W/jnMjT+loR0xAIyHRQkHeXTF1+ygPDtdnhj/GjuBmtRn
         +XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609513; x=1719214313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qi5kSVv+9tuno5ifh0iY5wU3dPT3z2QMr3DXugcnBOU=;
        b=mWXd5cHPOWmVfRdbmcU5mtcJNq8ggU6U+dF8+u3W3YP+QcPqWqCEKA368W0bl3vGKP
         INm+e6U6PvFbEjsKjy0W87o/r45LqgsfQ0k7co1IaAi+J4meoRYG+uT1cOnlMg5hUeHR
         nbMz0gqUKIjFv9Rl2emN1WWKZsnv+VUT+DSUrCFfW75FM/5aXWTuD2EIMrQ2qVxUGxxZ
         5adgL0AFnntbjjlR7DqY1pNzFHzJkvAd6vbX3ka/DaxQt2oK+UjY7SDJbUzck8Y+2fhl
         ffuJkhp477DXjTlaPFj+s9VqxfzJBZNb1cuxc2Z23rJkxSaROJbvKHHv8M9H9B71igHw
         Vd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2gfZSqGjL3RTejbRlqGdlMQmHCEDLemOQiDHiloNzENd7lftnHHyRrgrFPZoe9OL8jOYXd3neFSF2lSXLnd81Zyz5FVXRNCvF
X-Gm-Message-State: AOJu0YwiSXi0VDi4dmzBynWaBhkxY1DZdIotM5NysjDxNTNJjhXItDmV
	Dbe3V6ZnU6KRw2dby9w5te7TlZt7uVRwq8M/1EksrHWueCjFg0JA3rVCV7tpqU8=
X-Google-Smtp-Source: AGHT+IG6NUWe4l16T9e0fiJ0Sljl3qaxM46VXB2+kbWXexuNwB4kN0H3QGjj6j8BQ10yhKbClCkMvg==
X-Received: by 2002:a2e:990b:0:b0:2ec:26a9:d5bc with SMTP id 38308e7fff4ca-2ec26a9d704mr28756001fa.18.1718609513397;
        Mon, 17 Jun 2024 00:31:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e986asm191491115e9.27.2024.06.17.00.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:31:52 -0700 (PDT)
Message-ID: <f3584295-b396-455a-b988-099443b58dba@tuxon.dev>
Date: Mon, 17 Jun 2024 10:31:51 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] rtc: renesas-rtca3: Add driver for RTCA-3 available
 on Renesas RZ/G3S SoC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-7-claudiu.beznea.uj@bp.renesas.com>
 <2024061409215756e6a10c@mail.local>
 <4a477079-b4a6-4861-ae24-b3b87adb8ecd@tuxon.dev>
 <20240617072551acf731aa@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240617072551acf731aa@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17.06.2024 10:25, Alexandre Belloni wrote:
> On 14/06/2024 14:06:38+0300, claudiu beznea wrote:
>>>> +	/*
>>>> +	 * Stop the RTC and set to 12 hours mode and calendar count mode.
>>>> +	 * RCR2.START initial value is undefined so we need to stop here
>>>> +	 * all the time.
>>>> +	 */
>>>
>>> Certainly not, if you stop the RTC on probe, you lose the time
>>> information, this must only be done when the RTC has never been
>>> initialised. The whole goal of the RTC is the keep time across reboots,
>>> its lifecycle is longer than the system.
>>
>> This was also my first thought when I read the HW manual.
>>
>> It has been done like this to follow the HW manual. According to HW manual
>> [1], chapter 22.3.19 RTC Control Register 2 (RCR2), initial value of START
>> bit is undefined.
>>
>> If it's 1 while probing but it has never been initialized, we can falsely
>> detect that RTC is started and skip the rest of the initialization steps.
>> W/o initialization configuration, the RTC will not be able to work.
>>
>> Even with this implementation we don't loose the time b/w reboots. Here is
>> the output on my board [2]. The steps I did were the following:
>> 1/ remove the power to the board (I don't have a battery for RTC installed
>>    at the moment)
>> 2/ boot the board and issue hwclock -w
>> 3/ reboot
>> 4/ check the systime and rtc time
>> 5/ poweroff
>> 6/ poweron
>> 7/ boot and check systime and RTC time
>>
>> As you can see the time is not lost but continue to increment. I presume
>> the hardware takes into account that time needs to increment when initial
>> configuration is executed.
> 
> I don't think so, I guess it stops ticking but the registers are not
> reset so when ts starts ticking again, you are not too far from the time
> that it should report.

I'll double check with hardware team on this and return with an answer.

Thank you for your review,
Claudiu Beznea

> 
>>
>> [1]
>> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-ghz-cpu-and-dual-core-cortex-m33-250
>> [2] https://p.fr33tux.org/585cd6
>>
>>>
>>> Also, why do you insist on 12H-mode? The proper thing to do is to support
>>> 12H-mode on read but always use 24H-mode when setting the time.
>>
>> OK, I wasn't aware of this. I think I followed this approach as it looked
>> to me the number of operation to update the hardware registers was lower
>> for 12h mode.
> 
> How come, using 12H-mode implies testing for the AM/PM bit and doing and
> addition while 24H-mode would simply be a read?
> 
>>>> +	priv->rtc_dev->ops = &rtca3_ops;
>>>> +	priv->rtc_dev->max_user_freq = 256;
>>>> +	priv->rtc_dev->range_min = mktime64(1999, 1, 1, 0, 0, 0);
>>>> +	priv->rtc_dev->range_max = mktime64(2098, 12, 31, 23, 59, 59);
>>>
>>> This very much looks like the range should be 2000 to 2099, why do you
>>> want to shift it?
>>
>> 2000-2099 was my first option for this but then I saw one of your old
>> commits on this topic and, since I'm not very familiar with RTC,
>> I took it as example. I'll adjust as you proposed.
>>
>> commit beee05dfbead
>> Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Date:   Wed Mar 20 12:30:10 2019 +0100
>>
>>     rtc: sh: set range
>>
>>     The SH RTC is a BCD RTC with some version having 4 digits for the year.
>>
>>     The range for the RTCs with only 2 digits for the year was unfortunately
>>     shifted to handle 1999 to 2098.
>>
>>     Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>     Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> This is because the sh driver predated the introduction of the range and
> was already shifting it.
> 
> 

