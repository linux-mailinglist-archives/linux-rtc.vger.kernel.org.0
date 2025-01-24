Return-Path: <linux-rtc+bounces-3042-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA4A1B983
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 16:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C651656A2
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 15:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3780154C04;
	Fri, 24 Jan 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxhMypph"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80513AF2;
	Fri, 24 Jan 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733284; cv=none; b=BoVCr53UVdP6xhXBFaWP5AnQOkjPWoct2kq/jeo522AKnaBiyCaOVWWAm6t649l25grZpS/3OoXAmrqz5iOpGOjc6p2Gx8/NILjjlm+RSlMBH7k87BZ1IdZ3sDX60GMF31IptpKNOAJxZFXPsxBtty6G9GlJGyVkasGITEWNA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733284; c=relaxed/simple;
	bh=ZyErGrWqBjIUomKxxTQ5ze426h2sH1hN040IREuZJlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amwg5ytuQHo93nM2GLRZLrz2MdeGa/d8T24FhkMQsxMJ9Vi4NWzlT/OONrwfgFlhgu77KRZqs/Fb/+e7LkrKYd1GgteMT1G+55Y1zYkkElPDodKGK5Fppjdfc1XohVRXscmwf6w5dnSv4FSt1mQLDoVKd2aoFUXgIsL4a1i5+0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxhMypph; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so4259438a91.0;
        Fri, 24 Jan 2025 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737733282; x=1738338082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YCnBRMdd1g4JPsRjV+XUECjaKjlK+AZkZriiPXAYBCY=;
        b=cxhMypph7bfRAtKvTm8ly5+JJwYyKNP/IfzAdwB/dKRgAzvIPe3s+bfkB0vVGShtWv
         SsM/i6wIQdIQfCYEERnMBVHRcTL/6buS9gpF/gxTyMFtHa76zmpoJiktu85aRs0X7WvC
         oPlKQTR9SMTompr3eHh6Kwdm2XVVp5DqTZdNxzivC8kQkwOP8ICHUONvudOD2qfLIkPe
         UeREAXeKHn6xTY/ysCnDYIgoNf+9kU+k1o5za3eSVLFgGPGYEQsLMkDxnn1kh2O+Q7Ik
         Lu58+Vn1N+v7vP8IUizKCJhEqCbeh4Kbzy0shFxn5iPZ8/POE6j3Q3K0ci8ng8FlJH+M
         UWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737733282; x=1738338082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCnBRMdd1g4JPsRjV+XUECjaKjlK+AZkZriiPXAYBCY=;
        b=rzMsPUHE7eoltnPiI18hdunsG/tViFmnk9Q6Z2ff/Ua3OIohvpHkkETPxSaDrDfutE
         8I0XH4WnQG7CHgJGMOTAGNirGJ2wM3x1B+0k8A5IJPY7eCGH2kjVkQWeMmeIgeFkrqjF
         o4Qy8XNfR6xTffnzp5YKdgJetLlIOpFNJeAzEF3weMb4UR7fLD4DxkMRBnBxbiGD8VYj
         OXE3G/go8TicIO8ZQDaGAN9eadV2qMaaBIYnsGX95+6OctLi20JGtD3XB2a5LsjR+Y8S
         psmEixnu1D3xglsxtOFf4NDx1XytpqyBXx29TdeTci9bybIbgms7WhkesypQtcNtqT8i
         9+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgO1YuYRUAfMDYsPlD3gTNqQJUT5HRiLOal7Umtb4HkRnuL39BKLCK6uy3HcJC53XnZqCpzkG10Zpp1RQ=@vger.kernel.org, AJvYcCVbjGbT4lUN9ohLai5kF9OAVA6ovFDKT+mHeNOOmwuq++GkALbW1oHm1JB+e5uEG9ffus1HGgZI@vger.kernel.org, AJvYcCVyyrCT/nRh60qDNghdsDNdvsvV9NF/IcG+1Dd0Bk8AL3ySarbxH9vYheIkd4IkbOHk4O3o3kOqVjBIWi8=@vger.kernel.org, AJvYcCX+PfjahlbBNmPqhZu9ugdJA5/HVQ/XCfm2dn6Wb4ss2m5y2SyqJY7M1BHc32PUmWFWy/lWT5JxRjGY@vger.kernel.org
X-Gm-Message-State: AOJu0YzafUHs3jspuDP8yIv9GWzE3RnJtW5qI5EUm0eSYsDS0hBd8SMs
	mqGIZ/XOzGSfjst1RJJn6PD0HJVFSfpj9AvyP2UKI5Gh0DemkeD9
X-Gm-Gg: ASbGncvE5qYy7ecw0oNAs0chAkc2Ls63HhDY0uIjDBoiW/aKevS16y7U0E51ye3GvwH
	tkkpwvjR7cUQHMdW3RWEMrOYP0r4YsdkkTdKObCnjCY7wmDokf1HxEMZdkE4zcNegMVlJxuEwHz
	07o/mnJMp0O4WX/LgotdIlI8unOimr2JD1ZKtSYR0pQpa6frMAUPeqBoZjqXlLCas/KUCCDr1kD
	iiov8xPicsJGmHC0B55HV2aDg54LdO1w/pg5q1wL+Pso6vFDj/r5DzcBhzFSqsT2hrr3YYnjiea
	QHqPECQEp8VetNLCJ3e593sxNWw6oRUPPb1aSYrGjOyJ3n85KxTuOQ==
X-Google-Smtp-Source: AGHT+IE7ltkbcL/QJgvacTii0ri9Nic5YhUNqbSR7uZsa41gdHi9zXTMlQHOYcCmYc7eC5aPxaLV2g==
X-Received: by 2002:a17:90b:2b8e:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-2f782cca5ccmr42067583a91.21.1737733282058;
        Fri, 24 Jan 2025 07:41:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa83f8fsm1844384a91.49.2025.01.24.07.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 07:41:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca9e3821-b793-499c-8ae8-abc677adf375@roeck-us.net>
Date: Fri, 24 Jan 2025 07:41:18 -0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
To: Andrew Lunn <andrew@lunn.ch>, Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-rtc@vger.kernel.org, oss-drivers@corigine.com, matt@ranostay.sg,
 mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, louis.peens@corigine.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kabel@kernel.org, alexandre.belloni@bootlin.com,
 krzk@kernel.org, zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
 liuyonglong@huawei.com
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <fca9ca93-16e4-44db-8fbb-90bc6af952e7@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fca9ca93-16e4-44db-8fbb-90bc6af952e7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/25 07:08, Andrew Lunn wrote:
> On Fri, Jan 24, 2025 at 10:26:26AM +0800, Huisong Li wrote:
>> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
>> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code.
>>
>> Huisong Li (9):
>>    media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
>>    rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
>>    rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
>>    w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
> 
> Please split these patches per subsystem. Maintainers generally have
> scripts to accept patches, and those scripts don't work when there are
> patches for other Maintainers mixed in. So you need 4 patchsets,
> media, net, rtc and w1.
> 
> I would also like to see the HWMON Maintainers opinion on these. A
> patchset containing these have already been NACKed once. These patches
> do however look like valid cleanups. But are they just so you can do
> something bad in your vendor tree, which will never make it to
> mainline?
> 

I no longer comment on hwmon related changes outside drivers/hwmon/
unless there are blatant problems such as someone trying to use an obsolete
API or abusing the current API.

Guenter


