Return-Path: <linux-rtc+bounces-5729-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C4D0FB88
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jan 2026 20:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A84ED300092B
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jan 2026 19:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB7D352F9F;
	Sun, 11 Jan 2026 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dwl50Ziz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A4349B1E
	for <linux-rtc@vger.kernel.org>; Sun, 11 Jan 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161486; cv=none; b=Gz7OUfL0k5fD91r9M3VuaKtFEFAwkI87LL61xsvTS8Ipt0Xus5o6Ls2lpvT/sPb9KGBgLxQHoX61eh4W4x6c7bz8CUYuom5FK84NdDep6u/96Y1xMh+dXDEfhI8JJcY4K8Gaw6I6eQq4P4Xo6djW6MR7wIpyJqKEPUy2/hkyD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161486; c=relaxed/simple;
	bh=z/9aym3YtgfCN06pEMgzSWhuMz1pnW2LST7SY6XR2LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7KE+kAEynwqajiQM3WdjTrz9ddT0Hz5ofqV/2Fa0ug3HN1tDU9coGErBGqPhIA3tE6gVYJX8IT/piU4KzIKZLnnyY371OmSTfwtG+35hP9IZRYpqqIHdLNbBV7gzWHIwnsN3hieKm2tfDh0GvPfi/OT/LKDgaNgs25Y4BqVRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dwl50Ziz; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b25ed53fcbso23354685a.0
        for <linux-rtc@vger.kernel.org>; Sun, 11 Jan 2026 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161484; x=1768766284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=Dwl50ZizRYphHifgJPOcqzTPN2f5o22/3Hg6GyaX2pP400yqYVD40JF8MWpSSsvnff
         TCrvFVyOBEjCqcn9uma3DYzXrhw0PxFsRUyX/XvycnP0Gm1itqF+XLjG8wtreUXK0ctD
         oAHiAFNM9l/Lgp9CTfyG8GU+GU90o3znJQKGr783w11l8LiKkfCkHkgmeA3rEp/oo/FD
         wexT7QP/ZuUbeQ9jK68gTNcULdfyKQGRgzQQ5iTOw7yxAVC14nmXRtjrcksykif+Mynb
         vaSnRyf1JpUx2XRBRKvzhxQ59NyetMa5pLBTHFCzi4pfxYN3mT3ebSDyW4BnmtOkGi54
         9PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161484; x=1768766284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp7nIV1t3K3PnuJ7T0RnV1mDaWDy2tcwUgBfEvmqexc=;
        b=qv9lbIRvFbaMrPFx8c3tRAURNVo2ZtcxY5/bDDhrV+601VtoUayg/hlw6pAPa+ps0c
         Hmhx8Ki8By13ab+XtwlxNbWyoSC23ji87TLrB03z7m1/DmzlCD8vcUQkHYv1k92p/AAt
         73E6SQ6lKkJE7B2neBCBsHEsdFc2g5dsreGgWjLjjQF/+bd0+xixoQTbNeOD3caCf/CX
         gEVG1hswj6RWlNyKqLxppydt0OcjHtTld+K8McPvB18lSdNUkgCmBCWL594RDdOnCRw1
         6/5dkqMHC3y+sukK/M1I7O1lFWumBRA58dzelYqUon9n/iUfvI+py3MqIR/0raAL/cKE
         GA0g==
X-Forwarded-Encrypted: i=1; AJvYcCV3ekktSHOMbgZOCdy8WI8PqjyR9vHBi3K/Mja7SFGV/ZZro+wRZpXA+MZa8blLVhNuh/EL8QePyEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXNdhY7hRsApUsNnWjf2j6uIPPERqxykDetKCVNy2PFRxRe6m
	VynJ+cbKVlL0sNwJsk+N+r9x/dKK2XqYp0Oa1GJ12cAq5w1f4pDs9oqRQxzXvFS0amY=
X-Gm-Gg: AY/fxX6BiUIgO7ZIrbl5WaGJq/BIiu1WP1F7nTBTGdRgUX/EK7VGrO1JjMOu3bAX7xi
	tDSPQXPYtNxp5TFT1JhFgkCgiiHUO7wMd7KODymqrau+7wb88T6DXik3hUHfmeftLKWCSVIUoxI
	9GvxWL9vNccQZqEEHTuZZmf/XhaLVNPWEBpUDwdVI8sDmgiAtOLLvF/fzqbtQ/FGvqXEvOiGc/j
	I5tVzaAgIsTyHUQj9vPFX/IpgzXw+lyZ5AA8qRinbqx8lqtKiOgW/RhTgpGWKQi2LoqrAa+oE8S
	qTsGZFre2LhSr2yLfm9poHHBbeMrYGUWWNHBSkQYBOqLV+mGATugEAexKz8EwXoPpakMo4FMU2y
	tufL0PxpxeomIVT0avF5xvAxiqzRNOcRFim+uSIGLWDg057ryqHJ15jHI7FKuuVfeZWBiPc8I8h
	ozfNaZBTGM4m94xfxJyfJlxwvMoSkYzVQQ+vufy/kv0GGnDxXJEQqGkpD3jWQeC5pw
X-Google-Smtp-Source: AGHT+IGdzsnyz2r9XcWFhgYQrFdZnMY+NLVEokAuWRYPrckTaify+dIl447b52d76HmKL9FYD5Hb5g==
X-Received: by 2002:a05:620a:4804:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c389416effmr2293547585a.73.1768161484118;
        Sun, 11 Jan 2026 11:58:04 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5312d3sm1325432385a.43.2026.01.11.11.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:58:03 -0800 (PST)
Message-ID: <efe5c5e8-6b29-47ff-a3cf-9449f03890e6@riscstar.com>
Date: Sun, 11 Jan 2026 13:58:01 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
 <20260109223839b59ca7ce@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223839b59ca7ce@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:38 PM, Alexandre Belloni wrote:
> On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - add Alex's tag
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
> 
> See my reply on v4, this is still a NAK for me, I don't believe this
> change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

Yes I have reconsidered what Alexandre was saying and now I
agree with him, I don't believe this patch is required.

					-Alex

>> ---
>>   drivers/rtc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>   	tristate "SpacemiT P1 RTC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on MFD_SPACEMIT_P1
>> -	default MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>>   	help
>>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>   	  This driver can also be built as a module, which will be called
>>
>> -- 
>> 2.52.0
>>


