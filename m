Return-Path: <linux-rtc+bounces-2613-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC19D6652
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 00:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB435160E34
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 23:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A477E18C920;
	Fri, 22 Nov 2024 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SyTwMv7X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22515B554;
	Fri, 22 Nov 2024 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317991; cv=none; b=Qfspv+OrFgpeAAER7KjIgwILez1v97TLAPlmrcrjmDlD98WRCgAqR824ot/9+A9DMFXwKppHpzcCbY/lhAwzc4q3+CDgCehJcX4YqKAfyRJmeI256EkW9aKbrTs0207it5XZqBeQC7bBIahPZAUsPP6psdtzCzdKWI0EWJC4ubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317991; c=relaxed/simple;
	bh=tsH0Y1i1GfFUs1dwVu1RafwWthN/30G4THVaeZFudgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhlPkLR+ejJZq8qLKWXLsBMp3N78zusOrMCxphY9gqEuyIh5FyIxa/7+OaygKai0K87ha5eY7+Fq/G6RNxK2uICiUvMYY/G7oV2tUmfx91SidvQhB5LfT7pzA3CmMS9rMG6bF4OY5POyclg9+rknVkQrTXsINFCTFFAa1ULZpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SyTwMv7X; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90F04E0002;
	Fri, 22 Nov 2024 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732317985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA0q0r6k2ZZrL6TZtDraAfb4jVOuEuy4SPMw+Zrwo8o=;
	b=SyTwMv7XJutP+XxYx0rEWSP2zPeXic+XhE8QK7i+uk5suTH18SvdQ31DXF195RGnW3bTtC
	/Yq/mZZKY7FApbgtkS9JcnEcMlgoe0CJi66Aik+5JzLMiFPJBTHQ2xGhgLmOHzjnPRVTer
	jD3ZpivbSbuZQ25dOvn6HtIptdu8jD2RyXjHIrty/wqCTno1/4SLFwyrxtb41uavumt7uq
	KaDNR5eD+wEaK4V9ER81zqepzl67H0QW9NZIweVOou9ucqWyljGiiN1j48Fsxun8ucwYPu
	ueC+wzuVKknbB2lpwbXO/bKPsqwXgJIxF81oPyq6T1Wtud5YZnYPyB9YJjVzng==
Date: Sat, 23 Nov 2024 00:26:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rtc: rzn1: drop superfluous wday calculation
Message-ID: <20241122232625c5adab8e@mail.local>
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
 <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 22/11/2024 11:14:47+0100, Wolfram Sang wrote:
> The week register simply counts from 0 to 6 where the numbers do not
> even represent a specific weekday. So we can adopt 'tm_wday' numbering
> of the RTC core without converting it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/rtc/rtc-rzn1.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index b0ea2847e982..4ae6e349faa0 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -75,19 +75,6 @@ static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm
>  	tm->tm_year = readl(rtc->base + RZN1_RTC_YEARC);
>  }
>  
> -static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
> -{
> -	time64_t time;
> -	unsigned int days;
> -	u32 secs;
> -
> -	time = rtc_tm_to_time64(tm);
> -	days = div_s64_rem(time, 86400, &secs);
> -
> -	/* day of the week, 1970-01-01 was a Thursday */
> -	return (days + 4) % 7;
> -}
> -
>  static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> @@ -109,7 +96,6 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	tm->tm_sec = bcd2bin(tm->tm_sec);
>  	tm->tm_min = bcd2bin(tm->tm_min);
>  	tm->tm_hour = bcd2bin(tm->tm_hour);
> -	tm->tm_wday = bcd2bin(tm->tm_wday);

With this, you're not even using wday anymore. This is fine as there are
probably no userspace users of the value but the commit message claims
it is now using it without conversion.

>  	tm->tm_mday = bcd2bin(tm->tm_mday);
>  	tm->tm_mon = bcd2bin(tm->tm_mon) - 1;
>  	tm->tm_year = bcd2bin(tm->tm_year) + 100;
> @@ -126,7 +112,6 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	tm->tm_sec = bin2bcd(tm->tm_sec);
>  	tm->tm_min = bin2bcd(tm->tm_min);
>  	tm->tm_hour = bin2bcd(tm->tm_hour);
> -	tm->tm_wday = bin2bcd(rzn1_rtc_tm_to_wday(tm));
>  	tm->tm_mday = bin2bcd(tm->tm_mday);
>  	tm->tm_mon = bin2bcd(tm->tm_mon + 1);
>  	tm->tm_year = bin2bcd(tm->tm_year - 100);
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

