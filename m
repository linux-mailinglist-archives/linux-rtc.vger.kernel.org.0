Return-Path: <linux-rtc+bounces-5728-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDFD0FB50
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jan 2026 20:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E513026527
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jan 2026 19:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C998352FA7;
	Sun, 11 Jan 2026 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dZYYLfb3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A41352C44
	for <linux-rtc@vger.kernel.org>; Sun, 11 Jan 2026 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161365; cv=none; b=izaccT2200jcVZxbksXE56nx8BzKsJqhaeVhg4aldHAaKVL3E+Cqu3RwoURe96U9m+LItJZAFgp6Ltaj8qmHVcJNfbBC2o083zOOg/NTQmGH/5UGDtj1diBvqWiYJM46z1O6kgV7nxg92eClkTQl/ok/Obmq9vDnHAMkuO0+TL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161365; c=relaxed/simple;
	bh=ZrfWh/ijxCDqCCWp/uJ7Kl1B1mKM00e4Rup8caSKxRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rezySpM9UO23md4wOfw/4fLt1ROiPTZ9kXvaZCukr3A6qo+ZMPbnfswe+uLMJMi4mSyAjQDKGIKpgIsAXAhT3n/cbEa+K2BK7vxBbZoKsEYEsk+zTfSZhWYXWsxeufxqpmlySPbAxeFHHWhw11TJgCAjvWKSvQNbMpwvE64C1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dZYYLfb3; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ba0d6c68a8so674229485a.1
        for <linux-rtc@vger.kernel.org>; Sun, 11 Jan 2026 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161363; x=1768766163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=dZYYLfb3zpVN9bmaqy9gYOIpktPA2hsv2TVM+8CQlLY+NL9oQwXWbeh3EoKOBjn8/R
         n1n0LvJLnKleP9XsWwnjAUo+tqg8EzYwzDYNfNHSmjlTug1JeyZ2/EjK4eytdD0udPQr
         ACXPsuvWguZtKDkElXaUmnnDI4YCEW42umkQgDk12ag6OwdkJnAJm+t4G625raFLXNmL
         H+cjM+5A9O5oEwAlAQBzkvBtvA95Yn6tTrWk+xZ3uJz49AQjZe0/QjDCWPPUTQqRvgJA
         8b0mDZcXdwcTzBht0zvH++YHRG3MIkyeYssrh50mOEjM9zzVsg7wfm3hCELRhK3L9IkN
         gK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161363; x=1768766163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=YdfzvLWAkhBvyZffgmrVaiG2G5EDntXb3JykoTWqPZ9XcXr9h2X/zq1dQ2BUWO+Suq
         7wHu9GSjp1ao5ycrZSXhYUwwip77zljvVO29249FoK3YxCla8WhnMp1E0JEm2MX5JAgL
         kkg1PR0nMaydX+DVSQGxdoelAb207KtV+zVgO0qb595Kb7PCCnOEEEy+TiwWVTqhZ/3a
         lHdGDw0eTdkTCKEhRytSSLeB1AqVqpkFygH1epMvowPsKtEuu1iEZtUbKhj+ZJhUaInW
         NkACFVs1yIyPMPKPulkm4jYj09KmFZ8OUiE6y8G3CYGevoRpNGZB91PGQp0IVo1qMi9Q
         nFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhS3AmH8ypd10Ix+BBia/CZ65TVC9KyE86lkUdoXqEzGMDGAc4yh07WdLO619OlHrbMcZw0bpQUTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YziPAyR/e6UYEGX6yHcWwevvuv/T3ldcpNTOpAWzJzPGwdyHFjU
	0beIjQfUwKtRLvrGrE4oVwKs3zWkE5Yfn8PN4G5NBX1dDMA7QLAYUpaKw5TstE66RV0=
X-Gm-Gg: AY/fxX5y5VWA5bc8fW6kHneRW2wu+D3tAO1BNMYnN6tsT4wAPlaCfVAv0JA5vN48fh5
	ElNcbskFzpI7syQqu0J9rw1HEXSMILXD65WyGIv2VfA/+INppLM6+Hr2ff1QCTSx6IZ57vefBU5
	bljGzthlkoe7aHB5R5lFGbblyxICsfN9B3uKnosQZwO88l9HqZ1XFNgdqS5omeHLXmAf8YS0xdA
	UWGocMpK87onvIz7BdKl7nxpoagNzJCtJc14le75hLVVxRpmQSkLilciYjeqzx4gqpPY524ajqh
	cEL0Eqop52gru5HGk8RmxNEWpJZuFV9x8UQ1epfI9DAFg37AYbdeXer7ZibyrWlbV9I6n6yfK/Y
	I+UNVlbQoAbi86iQRtAw3OltI1rXTKCsqj0IAKq8ljDxsvohUsEUzLppNe3YOr8fKEJRllw2Rqy
	GM/T3nZ1Dtxd2sZVYrpnXSTl4gGzOrqvEHO6++0q5ACPgqADVDBIGhC6NzdO/i2DZZ
X-Google-Smtp-Source: AGHT+IE59tdTZ/GflUoGe/9DlksdMPcDRktcTk1R3UIHBonEpxYes8KI9f6r/aWCmNZietl2oAn6tQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2288627285a.51.1768161362565;
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b90c3sm1395290085a.19.2026.01.11.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Message-ID: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
Date: Sun, 11 Jan 2026 13:55:59 -0600
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
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223627b566d2b0@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>> The purpose is to make the driver a module (not built-in)
>> when "defconfig" is used (without the need for any Kconfig
>> fragments to unselect things).
>>
>>
>> In arch/riscv/configs/defconfig, we have this:
>>      CONFIG_ARCH_SPACEMIT=y
>>
>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>> (added by patch 2 in this series):
>>      config MFD_SPACEMIT_P1
>> 	default m if ARCH_SPACEMIT
>>
>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>> to benefit non-SpacemiT RISC-V platforms.
>>
>> This patch is trying to do the same thing for the RTC,
>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>> by default.
>>
>> I think you understand.
> I'm sorry, I must be dumb but I don't understand. The current behaviour

I think I'm the dumb one.  I think I finally understand your
point.

> is that when MFD_SPACEMIT_P1 is m, then the default value for
> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
> the default of RTC_DRV_SPACEMIT_P1.

Your point is that patch has no real effect, at least not
on the scenario I was talking about.

I.e., I was saying this mattered for using defconfig alone.
But, as you point out, using defconfig alone gives us:

   ARCH_SPACMIT=y	(in defconfig)
   MFD_SPACEMIT_P1=m	(from patch 2)

And then, *without* this patch:
   RTC_DRV_SPACEMIT_P1=MFD_SPACEMIT_P1
meaning
   RTC_DRV_SPACEMIT_P1=m

And therefore there's no need for this patch to set the
default to m rather than MFD_SPACEMIT_P1.


> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
> correct one and the proper fix is then patch 2.

Yes, now I understand.  I'm sorry about my confusion.

					-Alex

