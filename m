Return-Path: <linux-rtc+bounces-4617-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572EB1720D
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 15:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8222C1AA7364
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 13:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83E92C3749;
	Thu, 31 Jul 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rHju3D5P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E977D2C3260
	for <linux-rtc@vger.kernel.org>; Thu, 31 Jul 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753968506; cv=none; b=WXF4VyGVBkF1719t+Bu+pudIjvOP2ONP+defmZGPAfvhUBNioK+yQGXj863kxyp+QGq9EnA/uMgZv9W526YF05HVneHalZF7EAwSjEASWSW/gizlF9zQn9Nt9bw2tJrqOo6Xv+TTZ0HYYc6R/6UU/ynDt4Bod3po8spZSUeAiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753968506; c=relaxed/simple;
	bh=i9Ok6TMVJzIWF/A/OfsfP1hoZ9qTWvQyujzq0OMG6yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chUt/HSCnVJ/DEluzni0E1zEk82LApO9CyHaZrWDnrQC2BkuYC3AwoTlJxynVbor1M7AXQhZtpztyaPG9r1gJlGvW5r4hicrqwnpuyDBhesKH5HljXnsYKubDqXw4fRtgwgfRDiMLSGnCS1OvEIlZ96rXGEoR1qQLEGwzOtluV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rHju3D5P; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso11108139f.3
        for <linux-rtc@vger.kernel.org>; Thu, 31 Jul 2025 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753968504; x=1754573304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=rHju3D5Pb37j/G9lIDCHh+XeufJa9rwOWCrlID2sutADTkYheA7ytCOmm4WDRXqnBf
         fGb8ijZpzpAI4VUmdNbpE7qR22St5aaJJjd7EyxS2QbdiGxonpdKevDCp45rfJNN7DD7
         ZCXOPuBjhxiXfAiGkBlbGARF92lrCGILibrCpHqPpGGtV4c9ccVaBFNHzoY8okB0P9vt
         GS/5EOdew3C8MW9b5HVMpGQEx7D/jreHMOgTXLI9m7Uv7Xs3de7oEMzZqA4XPSKwqWiH
         ze6/P3RBzODONwBOWOCVJJTp+K/WmuQiKKbC1kWBOvdt+Sw6TIMC0gTvtfNIz3EjRR+b
         3z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753968504; x=1754573304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=sbpeBFc8RRweHhnclLUAd3bn+TsqhS5bO8Adl3cWVy511TrIHjzJZ5+QZfLMUzniKF
         JDLhtSzZgpNrhBY49fXN5ykUQL0VckCgDqEonO/63ELHWgWbQhrDr0qk4Q/HHhwAz23i
         oRBuIG0P7iqb/B6o4iON+crtKM6cWgCsMQD3KofUz/NXES6tuoxVBMUcB4YITmhT3+Dq
         xHXtIjuZdPXY0q+rASVxeGgF0BMVPbBQWynPWc2eJNMeopIOTbg5ZmQtHlrhFwqfCExb
         8lvyZrNZICsk+t+av+DXg6oTl3gOWW0u3tkK38vsiS8RE1eMR/c5PxtPWLgBKNYK5S00
         wZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU07x90sJ27TSxpNuV++YLGL09ekR03LMWrRG5O9qpeuM3KjtQy1UB3f2ASobjDMfT4BJZYBgtvMw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzo4LcDsZ0n/xTmIcVIkaDvMxxCTpW1lQCo5C+4Qfjq2dsBSBq
	NXHo1FJkXD/QmucXlxWxtIcuuGCYhEVCO/Z6d+qqjwaVrkZUXWsz6I1x0F8t/21+IpU=
X-Gm-Gg: ASbGnctkgepkAb4+f0qOx7OQxuqQlUCxSAlAj4tunwGjj6NCxYWFwO12iinLR7R4EXv
	oZOIcFWwdno/6pcOSMMSJTZbafRitx2vOLtf8IJKPjBVx85WucQe2xEGOqKiPEQJHZFkeg9pijT
	np2aDfAuAzKJezJN5lb9gg+dm23+gZ074Ea4LShyIqJFG/OU4M4PC/D4c5/ErRQdDzr14Z8T6ZD
	0xHaaWItR5/kmgocx0SgZfepc8OxxKZSytYyyCv6aLQpnc734H6ifwntqNLwgHZxJqWEhbXWB4R
	8eINKWuL/k/iNFyacDRMjk+cNyElQ0TwycqGrLdM/+OGL8Ikt5UL7tr5UtZNWzg2S3NuCZmLiYu
	UbflNFTcIx4kxXjYu84tdI6jYolxfkdGbNBrtQcuauikmlY1RBEwFJoC0kUqvr1+2Jiq443/H
X-Google-Smtp-Source: AGHT+IHVd8Qk8sqX9PKUb1Vz0+PsKeeTL23Bh9mFH1nZ3uKrxB6affe8zrVEVY8SyiLFctiuAowOkQ==
X-Received: by 2002:a05:6e02:16cc:b0:3e3:fc32:3178 with SMTP id e9e14a558f8ab-3e3fc323db0mr107094465ab.8.1753968503711;
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e402b34285sm6538805ab.57.2025.07.31.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Message-ID: <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
Date: Thu, 31 Jul 2025 08:28:21 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux.amoon@gmail.com,
 troymitchell988@gmail.com, guodong@riscstar.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
 <20250731131827.GG1049189@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250731131827.GG1049189@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/25 8:18 AM, Lee Jones wrote:
> On Sat, 26 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than requiring a "full" regmap configuration to be provided to
>> change only the max_register value, Lee Jones suggested allowing
>> max_register to be specified in the simple_mfd_data structure.  The
>> 8-bit register 8-bit configuration is still used by default, but
>> max_register is also applied if it is non-zero.
>>
>> If both regmap_config and max_register are provided, the max_register
>> field in the regmap_config structure is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
>>       - Introduce simple_regmap_config_put() to free regmap_config
>>
>>   drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
>>   drivers/mfd/simple-mfd-i2c.h |  5 +---
>>   2 files changed, 41 insertions(+), 9 deletions(-)
> 
> This has gone from an in-function 11 line change to 50 lines and the
> inclusion of 2 new functions.  As much as I _really_ appreciate the time
> and effort you have put into this [0], the added complexity being added
> here doesn't sit right with me.  How would you like to go back to your
> v4 idea of providing a bespoke regmap_config for for device?

I LOVE this suggestion.  I will send v11 shortly and it will
be very much like v6 (or something like that).

> [0] Beers on me for sending you down this path!

I'm looking forward to seeing you again, beer or not.

Thanks Lee.

					-Alex

