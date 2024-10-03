Return-Path: <linux-rtc+bounces-2095-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99698EB19
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 10:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87681F22C0C
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 08:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0813213A;
	Thu,  3 Oct 2024 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kKD4KNuS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF112F588;
	Thu,  3 Oct 2024 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943022; cv=none; b=ARpcmhl3oDPz6VYhMY6NQ6SXycJGAneSNkEkTbfUQjnBjDJ35ul3EEo5btPzCq76VLguA6F5gRey6p7ZVca+oSj7QaE1ZuKF9ywEdbGomwuaFZ2HSSG2oRsrETaZGsRP/ju/OscOJ0ZhYOQYht6k1ioqojYYmzsKag//BATyWsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943022; c=relaxed/simple;
	bh=QzTERALHyTEG4h+Y+/mIuqwIWcubmy2PsQIWQY5Y3Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J020EZ1Y7gGD4B3rbkC/ZGUhxgqifdcO24lZvR34EPK2TBElWE6XxVL3kdBuh9TyGeEMjPNkHzV+jN7tgK0lOmZI1bSApqzunj5MiTLkUmUs4wmP4gp5SSJkBhdpybITJ37i3Hb59Xv1upICFG3hA+J7vZfr0AAkvFDxsH8bWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kKD4KNuS; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C72EE000A;
	Thu,  3 Oct 2024 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727943016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7uztNqnOcmwAnPYMR9Ht/6YMo/cJN46npD8WECtincI=;
	b=kKD4KNuSvHygpR0E6Q7sxzKBNfQCTyeR9j/R356CLA3E6PxM2KSY5W/3fCA1gf6ZorDbaI
	EdX5BVajxwMJXyTlRGqaWz+Fs1XGTR61tpb8dnxmRPBYTwPit8R/E10X7KBu1XCVoeeNxa
	8r8V5/SPRmxg0dU286zPi/JrOK0ffjEveREsI7I0jhzA1HJrJ59HM9LmHFyBtXWYVnu1Hw
	nM1VYI40EzQhq5XPX6d3b2JWmzpDlc4+tNLd4KHXUasw+kVGctH6WRvKyACO7e7aROM7dK
	+XWdr6ZEdgZRTZLQvdUiLXoeyDWwYqCw4mK/UWf2jzKfFjypPd6/jIt43ZJx6A==
Date: Thu, 3 Oct 2024 10:10:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Palmer <daniel@0x0f.com>,
	Michael Pavone <pavone@retrodev.com>,
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century
 bit
Message-ID: <20241003081015363ed024@mail.local>
References: <cover.1727925802.git.fthain@linux-m68k.org>
 <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 03/10/2024 13:23:22+1000, Finn Thain wrote:
> The m48t59 driver is needed by both SPARC and MVME systems. Linux on
> MVME uses 1970 as "year zero" rather than 1968 that's used on SPARC.
> Add support for the MVME convention. Otherwise, the RTC on non-SPARC
> systems can only read and write dates between 1900 and 1999.
> 
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  drivers/rtc/rtc-m48t59.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
> index f0f6b9b6daec..e2d882ea5c2f 100644
> --- a/drivers/rtc/rtc-m48t59.c
> +++ b/drivers/rtc/rtc-m48t59.c
> @@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
>  	return readb(m48t59->ioaddr+ofs);
>  }
>  
> +/*
> + * Sun SPARC machines count years since 1968. MVME machines running Linux
> + * count years since 1970.
> + */
> +
> +#ifdef CONFIG_SPARC
> +#define YEAR0 68
> +#else
> +#define YEAR0 70
> +#endif
> +
>  /*
>   * NOTE: M48T59 only uses BCD mode
>   */
> @@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		dev_dbg(dev, "Century bit is enabled\n");
>  		tm->tm_year += 100;	/* one century */
>  	}
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	tm->tm_year += 68;
> -#endif
> +	tm->tm_year += YEAR0;
>  

I'm super happy to see someone working on this, while you are it, can
you use m48t59->rtc->start_secs and m48t59->rtc->set_start_time in probe
instead of offsetting tm_year in read_time/set_time so we can later use
device tree or any other mechanism to extend the range?

It is super funny because I was telling Geert that I wanted to get rid
of this #ifdef CONFIG_SPARC two weeks ago at LPC. That could indeed then
come from platform data.

>  	tm->tm_wday	= bcd2bin(val & 0x07);
>  	tm->tm_hour	= bcd2bin(M48T59_READ(M48T59_HOUR) & 0x3F);
> @@ -108,10 +116,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	u8 val = 0;
>  	int year = tm->tm_year;
>  
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	year -= 68;
> -#endif
> +	year -= YEAR0;
>  
>  	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
>  		year + 1900, tm->tm_mon, tm->tm_mday,
> @@ -163,10 +168,7 @@ static int m48t59_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
>  
>  	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR));
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	tm->tm_year += 68;
> -#endif
> +	tm->tm_year += YEAR0;
>  	/* tm_mon is 0-11 */
>  	tm->tm_mon = bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
>  
> @@ -199,10 +201,7 @@ static int m48t59_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	unsigned long flags;
>  	int year = tm->tm_year;
>  
> -#ifdef CONFIG_SPARC
> -	/* Sun SPARC machines count years since 1968 */
> -	year -= 68;
> -#endif
> +	year -= YEAR0;
>  
>  	/* If no irq, we don't support ALARM */
>  	if (m48t59->irq == NO_IRQ)
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

