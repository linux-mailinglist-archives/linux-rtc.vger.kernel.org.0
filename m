Return-Path: <linux-rtc+bounces-6516-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBCZJNIpB2rgsQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6516-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 16:12:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E5551185
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 16:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69FE83095BD9
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 14:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA20448BD22;
	Fri, 15 May 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrgqacc3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E948BD2D
	for <linux-rtc@vger.kernel.org>; Fri, 15 May 2026 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853871; cv=none; b=siWKNtRRN+XA9BUWyakBpL9FH+mzA/aB/Pz4JNGLN3qOEMAB01eQCWAHryFhDWBe1EQ9cfGMh6Ycn6x7uBxpjMml5Vcf/3lGP6SQMv9o7UABaXiaK1spLFoEIUvLETaADR83iOTB9pduNFy0cwo1REeUVHQK0/8qTy+jJ+HluJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853871; c=relaxed/simple;
	bh=GG46pSh5d0vn9yBp53h1hxap4udjkrgURZeJc5+2YyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtu+kNEC39Z6UKanntFR2YYEh2xovVLi/R6TwlVZWyBqE3l1EHNUCl0ZUlrzYuxYUSpcdp9zz7iktzWOXzb/c5d87uDDoPRA55GjbuPCamFpAoQ9yAOhqtBrqI6oIQ46ndIN+UHkJFDEEIxaAdFeVh4cK9C57CM6gI+Ht3X7p8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrgqacc3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ff5472f263so5592071eec.1
        for <linux-rtc@vger.kernel.org>; Fri, 15 May 2026 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853866; x=1779458666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1xq8W0xM16bA8z+e9ItjmHiUZEnug/7oVf/JqPTdq4Q=;
        b=qrgqacc3bN3q4/aMGMXmyVsjVbYFnMF9yaTqR6tKQj5sKos+LG9K/Oj951Ijhy33lp
         Ouy2EjLVatPBLFLFDFfiuXJRllLrfHu40dvyogEkuH+BBvq7/7FqQhSdKe693raoDdmD
         LsP7sP4ILMGFejpioDq6dE0rBH5tHSQL/TgCzbmhLAQ5DNSCdAzmlec+nf91zE9aRW16
         EwzisdEzHwLx2Vo+81XlG9ZkghK/ASdD6SoOL6mpOCwYH3/2Ha+07fgHqVxQbdPOMN0B
         9Dat3cUb6sS4DkY6BG7ssnWcExPZHSGUVvJkbY46BYTBMX9vP7NzKYPKPpyDCWik6PPV
         3lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853866; x=1779458666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xq8W0xM16bA8z+e9ItjmHiUZEnug/7oVf/JqPTdq4Q=;
        b=Nf+JJvLWNOSFLAXw5ohH6XYbbgLLhhBOPedu4RKaCcCYMl4I2EbEiByLTKrD0oVJDR
         kOnQzARW04ncH2qPM30hmfEaW04WSc7O8p9JzyrYxd39PicZy+92zfyJCY19WsNa+DDq
         4QXEo9YNrxM2amGPUMKFeE6PdbnCSOwGT7QUk+50b3iLHKnJHud4itSDBgnJG4Xi2KRt
         yWsbl4Dt8IKKd5pTZ6E4WA2UwxXVSzsT6PLi8CId6fU8IMGwLC1GAfiLXwqJdgZr2SYf
         gtKYVd3/ZGz4wlsqoL/ODwtuyOkgkJ15och9H4/aHAGWbeUPs4cE+GbIpfP1bSFJBSj0
         MEgA==
X-Forwarded-Encrypted: i=1; AFNElJ86eewUlFIWXPIt3RqYthfR0q96FONCEUtxX75fwIlfOvJvsVViQIsB/4AiogAr4lsC85i3uI0C/C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXGYJpqzOYOxwNqZfpP2wm6rUCG7V8B6aEOplN2HPClDHe5eQ
	hH0k8aVyMtmkFRrOKrfW7eoptne4c9C1fcK11zqDVK/YfDJQvp8SciDP
X-Gm-Gg: Acq92OGiw4RIVAmJK2xxhuGvKH0d32dd9iKe4TMBjZBN6WrA4iRR38n36R868yTBXXv
	fTobSaz1zqVCZoLNkv1sdXef8Fz50vmes8oLGbK9UPe8ztNrok1cmEBaQDgPMbDIzQOf4aG6izA
	YBodXR3o78wR4i5KIZwW3TMmE1kIWYi8fcHxZSVwUBojdZ2RjA3e1sF3BnZvHdaZQmZWxhk4+yS
	BHE81UZ4S+g9GL7MExmvsRbYjHm+5SS0s+r4HSRQtS8w1rLC78BtWjk1e/owLU2FGUiivzfu3Km
	V4R5I4IxRJs1cS0NVg+NeGaKx/tdeiKOUpIGztAh0hN+N7Tp9/g8dub57wITgTlr/H81BSMSL0x
	IgKK1vJgIlq/VjuITmpv+vEoNyxlomL2D1O2eNMKlV85RTm33Z115el+ajUHAmW81DQ83D8aARm
	dGKCHbOc7tzjINRNb8IdADbfM4xcgS1C0tbalMIPavU9Ka21KAYw5lNhZIDKa5mFNOs1klH5Z1
X-Received: by 2002:a05:7301:6448:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-3039867fa16mr2160782eec.22.1778853864553;
        Fri, 15 May 2026 07:04:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm7099623eec.25.2026.05.15.07.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:04:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <17828a1b-86c7-4ad6-a93b-3f91c6b2c24f@roeck-us.net>
Date: Fri, 15 May 2026 07:04:22 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] mfd: Add Host Interface (HIF) support for Nuvoton
 NCT6694
To: Andrew Lunn <andrew@lunn.ch>, a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, linusw@kernel.org, brgl@kernel.org,
 andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de,
 mailhol@kernel.org, alexandre.belloni@bootlin.com, wim@linux-watchdog.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260515085746.114361-1-a0282524688@gmail.com>
 <20260515085746.114361-2-a0282524688@gmail.com>
 <ef9449dc-ef2a-415e-8acc-a15f349bac24@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ef9449dc-ef2a-415e-8acc-a15f349bac24@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 343E5551185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6516-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/15/26 05:41, Andrew Lunn wrote:
>>   MAINTAINERS                         |   1 +
>>   drivers/gpio/gpio-nct6694.c         |   7 -
>>   drivers/hwmon/nct6694-hwmon.c       |  21 -
>>   drivers/i2c/busses/i2c-nct6694.c    |   7 -
>>   drivers/mfd/Kconfig                 |  47 +-
>>   drivers/mfd/Makefile                |   3 +-
>>   drivers/mfd/nct6694-hif.c           | 663 ++++++++++++++++++++++++++++
>>   drivers/mfd/nct6694.c               | 111 +++--
>>   drivers/net/can/usb/nct6694_canfd.c |   6 -
> 
> The networking change here is very small, so my influence as a
> networking Maintainer should be considered small.
> 
> However, i would say this patch is too big, does too many different
> things at once, making it harder to review. Please could you break it
> up into lots of small patches, each with good commit messages, and
> being obviously correct.
> 
Add my influence as hardware monitoring maintainer. I very much agree.

Guenter


