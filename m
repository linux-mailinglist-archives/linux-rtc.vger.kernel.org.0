Return-Path: <linux-rtc+bounces-5626-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFBCE880E
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Dec 2025 02:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7122530019DC
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Dec 2025 01:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A73420F079;
	Tue, 30 Dec 2025 01:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KZPy0NC5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C30139D0A
	for <linux-rtc@vger.kernel.org>; Tue, 30 Dec 2025 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767059224; cv=none; b=f/F2PuY2OdLR6m7IzmewzbUk9VXKm6AVr2LCBwDR5RhLa5qzH9HBlY06/CT+yNCJgEpzbC3JYH4rrUDw5QoG92HTf28HF9Fjs0bz7W8aIDr0VLCdwtTU6IhZteWu/LoazLPJcry6u3MPcpA2p4YvzpDN3+kcE6mSx4U6bA/32Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767059224; c=relaxed/simple;
	bh=jlqIQKlYvkLjCzXyksQk1n/qM4/mPjttP55BeybqUeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRdYsX7ArulANk+LrdLxN8Hho6EnaS+WNMwtjjU0X+wzIbwpxB2UU6alSCpzavm05E9K13MygndNcXRtC4f0aW3IgOFY1jAmieHoW2og1gsMo7A9Ruc0/pohixQyDNZnwmkgzwz1UcPFE4nbb6no7K2omJGSIhiXOZ03s8BHeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KZPy0NC5; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a379ca088so109561326d6.0
        for <linux-rtc@vger.kernel.org>; Mon, 29 Dec 2025 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767059221; x=1767664021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=KZPy0NC5kKT+sO6ei5K8f6Y0rf4j1KMlKRq8U2M/VPKYiutwAl9cIaItK0eprbDqul
         pG0svkL6HdYwvq6xVCpBakkielgFIJrVs5gK7dnSy05pgwxlx4IvhN4Whs5lf8allVm7
         FpOxx0qE+1juJmEw9Wec8LljVTNue6TDR+WCiva5i6q2+r/HZ5DoMT7e+b2MFHu+LJF0
         vhFmqt1A48xw/mSsMM42APV366Mygi7XrslsgHL1eMR570wIieRFKMxeASGJLxG2RCpF
         5ODwOkfYdbE36yn+QR0bJ/QoVezm3ASuUrv/BIcxDkXbezSFhPNzp3lvkMOvzbkALcwZ
         ILSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767059221; x=1767664021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=DdnR9BB4/+aNuItc7Vze+btowjdABLWaGvW2tZuQ+xubvWFLW4Mv7MqPbr1Dx9+NUF
         S4jfbednkAYRXRLjNA+y1dGfag2LwhC1qBZaxj8yUBtIOfXNP9rmEIVktC7DsoPnsTDt
         CEIm9L+R5iFOyColTGAYTfuXIa19vuBv+O++l8AegSw+8V0jlup7SPUEt9Jr1GkbxU/q
         QabPTz2/EPUDPRIGpY9rU3lB3lv3hgXYwdSvZE2r3EuL0lF4E2BxMWB1AX+wN3E2bupx
         6fmgDmW0Q9nJ+NXFR28b4l1eEkjQKNltEYQWiyerPsRomwiaV02BKcAkKyTN08k3W1Cb
         TCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5TBgQaiyo0tMJuUy0X+LuknXcOeMDZ4iWq2sYYKUhhp1QceeaJnldJODQcDjma/VlNTkQK+1JJkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpi4PLg9KKGfs8Bhxr9obT2pzB0q5LHOxcAjd78kadHRJTPNdO
	igKk0SIAD75iuPFCGzQTTUJVSWqDVA4w4kfBgGD6sWbgDbCp5rOV2fJHmBe/2pFs840=
X-Gm-Gg: AY/fxX5xjXsCCZ/gqfs96DjqI6OFrow6ecOuKrXwAhpFJw+E6B190CWaj1hSq9vtXJL
	gud6JxlX9jaB60dZgMkTmibSHnUSHP5PlfZeCkRiNJDEonSS++5Gl5f91d9Jd8J37OdDf7b9TMr
	lfLQ27vdjLRhksx8eR80ziv5VpK/EELjrMqK5D4Qop/iHXlKHk0iwCgOr5pPxlPlQqe4rO+n47z
	yQ8L9RNfbxPN5J9CvxQvxqOVvrigspBFjz5LLCvm1bR5eeBAAW9U4HHeFDlkyWEqmrkLYJzasT/
	gMh7rHI7cU+byLxKio+GZEbW1wmnBU85WAmRKWDfpsJ7YICF6QapRwohCBRlABCXwTjSV4bx0Gd
	qHrQYqwOdC1Fdf5Z90Kd18pQFxqt1i6p3f7qbcQMl65MZrz3x7dEIxgQ4qbSS3YaG47sFREIc6g
	MDiFufJYCNfrzfpQ2xdF/uIMfdIRNHsvPhBz3LebiUXhgvHbkPFKs=
X-Google-Smtp-Source: AGHT+IH4p1A30uXu3TD99f1+30CbrJGzeImlEYTCEw3r0NYjnmHP1a52MpRfSdM/LAChoyn1EIiZLQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id 6a1803df08f44-88fcaa1aecbmr389519426d6.32.1767059221300;
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm244416516d6.38.2025.12.29.17.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Message-ID: <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
Date: Mon, 29 Dec 2025 19:46:59 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230005142d1bfc6f7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/25 6:51 PM, Alexandre Belloni wrote:
> On 29/12/2025 12:02:23-0600, Alex Elder wrote:
>> On 12/25/25 10:53 AM, Alexandre Belloni wrote:
>>> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>>>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>>>> caused it to be built-in automatically whenever the PMIC support was
>>>> set to y.
>>>>
>>>> This is not always desirable, as the RTC function is not required on
>>>> all platforms using the SpacemiT P1 PMIC.
>>>
>>> But then, can't people simply change the config? I don't feel like
>>> this is an improvement.
>>
>> It's not an improvement for people who want to use the SpacemiT
>> P1 PMIC, but it's an improvement for all the other RISC-V builds
>> using "defconfig" that would rather have that support be modular
>> to avoid needlessly consuming resources.
> 
> But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
> this doesn't have any impact on other RISC-V builds while it makes
> people using the SpacemiT P1 PMIC jump through hoops to be able to use
> the RTC as this is a very uncommon way to set default values.
> 
> My point is:
>   - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
>     have MFD_SPACEMIT_P1 set to m
>   - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
>     is built-in doesn't really hurt any SpacemiT P1 users but would be
>     the expectation of those using the RTC.

The "hurt" isn't about P1 users, it's about everyone else.

>   - those wanting to optimise because they won't use the RTC, they can
>     already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.


The purpose is to make the driver a module (not built-in)
when "defconfig" is used (without the need for any Kconfig
fragments to unselect things).


In arch/riscv/configs/defconfig, we have this:
     CONFIG_ARCH_SPACEMIT=y

In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
(added by patch 2 in this series):
     config MFD_SPACEMIT_P1
	default m if ARCH_SPACEMIT

So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
to benefit non-SpacemiT RISC-V platforms.

This patch is trying to do the same thing for the RTC,
i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
by default.

I think you understand.

					-Alex
>> I haven't done any testing on this but it looks fine to me.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>>
>> I think it's a small change worth merging.  I don't think
>> doing so does any harm.  Your call or course, Alexandre.
>>
>> 					-Alex
>>
>>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>>> ---
>>>>    drivers/rtc/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>>>    	tristate "SpacemiT P1 RTC"
>>>>    	depends on ARCH_SPACEMIT || COMPILE_TEST
>>>>    	depends on MFD_SPACEMIT_P1
>>>> -	default MFD_SPACEMIT_P1
>>>> +	default m if MFD_SPACEMIT_P1
>>>>    	help
>>>>    	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>>>    	  This driver can also be built as a module, which will be called
>>>>
>>>> -- 
>>>> 2.52.0
>>>>
>>>
>>
> 


