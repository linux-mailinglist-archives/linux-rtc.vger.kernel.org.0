Return-Path: <linux-rtc+bounces-5624-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6ECE7CA4
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Dec 2025 19:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11E69301B2FD
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Dec 2025 18:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F7E3203A0;
	Mon, 29 Dec 2025 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t2wdZ+4w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5D17A31C
	for <linux-rtc@vger.kernel.org>; Mon, 29 Dec 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767031349; cv=none; b=p6gFL6znc5P/TOL+5Dm+8BcRJqpsRVEUO9h3METrRNgHdne61/DtRPY4vPc0EJsndfHaUkUjbyk4YmLvW7vArtZ8scJwjZhimBj2Zy+nEoliUe3n1UiQ9pCztrDjaYvCT+2/Lp0JLUOg/EV7HAekA1GC4EcJvwVVDyzZIGmMJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767031349; c=relaxed/simple;
	bh=Wq4FNyNXdL2dOO4wrLWKkEOSeqpU9XuvsacZ1Is3UGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQqBki/rMCdZa3Zd9cHwxmcqyuykRml+ar2qAR1uobqnLhcCSmkFkGKdZmm8oYK+Xj1Xx7wfzcXQdad/MeB22IFBBrRwXIqfj1a4bFB5tfkzI6aEVjqi2y9ZmdlSG+h7wh6trQqAqMU6xoOO1nOl2VYSM/SYut3tilRZR7H4zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t2wdZ+4w; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88059c28da1so89099546d6.2
        for <linux-rtc@vger.kernel.org>; Mon, 29 Dec 2025 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767031345; x=1767636145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=t2wdZ+4w7Ajz9fevd3tA4lUf7mV2qblpu2vBsU0ua3j5homu2HKBkWKh9wqHlG8Y8g
         rVMsep/LABt5BBO3IcpeuuMFidISDOcw/xMp53tE6lmr+G3HNFx6Z/apYh3HWMruQ2ru
         Uk4ppvmmIGOOB3vfa3zfKTgRh/lltcPtlgd3wNKuzGHJ0s66P0BAhMGBZRrOFqcWLtNj
         zSxioC9zTU92v8EaPz6Q2O0P2qGYDlRmrXmXkTvOYNIOm0Hm7ep5HqVbSFS65XuFAZpo
         bWwZ3r6zlncjEBGD015G3GZwpKOWFLTAQ5ytNnJX8n4wgl6SvwEstNcDvzCr/VhRSd70
         8Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767031345; x=1767636145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDy1M86lySMiZB+6e+NfnSGr5v4JHWbEjB5Zb9z5vPo=;
        b=QYX249y2fqY4/RBUbQH42rHXWMrHt8Q0NDdeerhfHmxHp6E3ht2kqURQTXUyhI1W7Z
         2j2f6EhTu7iTKv287FGp9ESdvDQ05nGVySw5nSqZvPsWiq5ZmGCQB+JrmpkWcfWw3zIr
         8DHo3OGmhNHHil6EWeoed2grJLjSNFgvB9EfcxsY9hLTO5KTZcEUW0X/2PsUaLfdVOVH
         Z9vsdutXvLfvXypqJoH/mRp89J130Sj2m0bOyspORXYCLRKNyynqs3z/X8osyR5Tql2c
         I1ewD8VH/Bpgx1IlCEkyPSchlLrbBg1k8RUdAKhC1S2SCauavtkvzHnIKru0Ed3j8WS0
         PuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1bZKp2dUj53e0L5s4Y4Mn2VOk1LT5dE3Ge028kazCBmFu/4a7wWRO8Zm77N03bXdKGarU5rZfrNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvacsgTxVPDHreMfSvvD2RMVO9ZrMCUfLiBsJjkSHWm+Ee6Csb
	44XtIXNDvgWCQ7lQKUT877KUQGgcvHAhlmfMMpMiY57WaU5OadZw10q6wuLc9xN3AVc=
X-Gm-Gg: AY/fxX5RtMs3P7ls1j0HpCNUCiE401ssu11rtdPgn8JVuz6cXfzGGDO/dkD0IGiUwis
	F/kqLsGt7kke9QK50R+mgR8DcpDBkBUL/5oyeQwMRYz05s5WR/p22jmQT1UNh9W6J7ULZJ2vdx9
	VwM0WWUEit5qhl49FWolJVlPHwDqoKz929/1GW2HQOgruRQEqerPRtAhSe463O0uKcUofWB9vcZ
	wNfO1WNekPVXLUpDXlz+JVBavqIuTsK944WyAGpZeohWiA79JngzltIxjQ0YAnyw00sUjSMzQaR
	7N/rXjtDlAIklt04N+0cxQc3tNVqZAa2W41c/DJaGjtIdDxE8y2cPO93fOqCpjPA+T/hbxCeB/3
	DPUf7amBtpzwvP3AMeLrk4WmfPpAadaPsNgaYwuoYxwiY5m9ilPVZiF7jSriZD/nHNr6Z6bVvLm
	LzcCf0haB5f7gNHXJNXQ4nak1NeA==
X-Google-Smtp-Source: AGHT+IGXtGMT6O6A6KaQIdzPXBUgINz+WinbQ4cwEL4NneioBCpZL0bLeOv1X+9oO0ye3ANqbf5YQw==
X-Received: by 2002:a05:6214:3a83:b0:888:7d0a:18db with SMTP id 6a1803df08f44-88d83a78234mr548804566d6.48.1767031345078;
        Mon, 29 Dec 2025 10:02:25 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997ada77sm231925916d6.37.2025.12.29.10.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 10:02:24 -0800 (PST)
Message-ID: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
Date: Mon, 29 Dec 2025 12:02:23 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202512251653368b33c7e7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>> caused it to be built-in automatically whenever the PMIC support was
>> set to y.
>>
>> This is not always desirable, as the RTC function is not required on
>> all platforms using the SpacemiT P1 PMIC.
> 
> But then, can't people simply change the config? I don't feel like
> this is an improvement.

It's not an improvement for people who want to use the SpacemiT
P1 PMIC, but it's an improvement for all the other RISC-V builds
using "defconfig" that would rather have that support be modular
to avoid needlessly consuming resources.

I haven't done any testing on this but it looks fine to me.

Acked-by: Alex Elder <elder@riscstar.com>

I think it's a small change worth merging.  I don't think
doing so does any harm.  Your call or course, Alexandre.

					-Alex

>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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
> 


