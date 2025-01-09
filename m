Return-Path: <linux-rtc+bounces-2857-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1897A07C54
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 16:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6613162208
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D34221DA3;
	Thu,  9 Jan 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jYyL7GkI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355421E088;
	Thu,  9 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437604; cv=none; b=hBCZpYSP97QS4BCGe8R7sgf6RH/7Q2aFTgXsFTbmGhF+MwTC+QK/SLq732qnuYtuySaNTv7pJXCERquBhtp90kcXND663rVcKuNbr9vBVyi5sQjGGhoSHNGM3b6tCorvw601bFVsa3sIEo42tmn0F8YvPqU4t24RI5dH6RjhIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437604; c=relaxed/simple;
	bh=duog635ltKLC+mOlcEn76pG00nsiqiGmKvr4U1jb154=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdSzrlAzrZ7AeWN+B4/nwqvFvJqFZj0qwfZYNXktcIXWY/Lxcv+WCnx45TlV9ugHIqFjwO1jaUFfGYgwM/tUKpeDWcYY7tYNAk9weGuGkdO4M8TfzYS5vYpGG6yGQPlTT4JC92o48M3FXb7d46QkqkMAYZJ7+5kzcRqdA7DEZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jYyL7GkI; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5D091BF206;
	Thu,  9 Jan 2025 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736437599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcUXFptebfMrvGhDxe7112Zqb3/zYWm85RNBPbS8bvY=;
	b=jYyL7GkIne9oYb8FfybPUDkwzY0fOSPguU5OcA0GaTE7DAglUSKrm2ReCMMqXhdhwrsVAy
	KvktXwI+fOv6k6wxomXnn42zUPVNEgewwfXgQZlUbCAQ49Lbh88w3BQzvl8INX8Z51zEni
	v7+njmfFUctYEwS4KY3e3nFSeUAO6JcJu/4csGT0dmGZtwW82+iVg5XOrxnPrIruCp1xGS
	MZ58xCxKFtfkq3sWLgmrkIL1O0sBwGgdltStFiw7fIG1WSKGnT7Z3c3LS+bPnaIL3Hb0ym
	Zy1U+tdEEzP8SGCd1/d3/AxOChMUB2QjtBAJwmGIL/HSOZvaLa9HAP62R6ykEA==
Date: Thu, 9 Jan 2025 16:46:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: mt6359: fix year issue
Message-ID: <202501091546387cff95fd@mail.local>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
 <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 09/01/2025 16:29:52+0100, Alexandre Mergnat wrote:
> Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
> introduced a regression.
> 
> ~# hwclock -r --verbose
> hwclock from util-linux 2.37.4
> System Time: 1262312013.143552
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> ...synchronization failed
> 
> Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.
> 

NAK, you'd have to investigate a bit more, I want to get rid of the
RTC_MIN_YEAR_OFFSET insanity.

> Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 55e75712edd4..9930b6bdb6ca 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  			goto exit;
>  	} while (sec < tm->tm_sec);
>  
> +	/* HW register use 7 bits to store year data, minus
> +	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
> +	 * RTC_MIN_YEAR_OFFSET back after read year from register
> +	 */
> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
> +
>  	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
>  	tm->tm_mon--;
>  	tm->tm_wday--;
> @@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	int ret;
>  	u16 data[RTC_OFFSET_COUNT];
>  
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon++;
>  	tm->tm_wday++;
>  
> @@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
>  	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>  
> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon--;
>  
>  	return 0;
> @@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	int ret;
>  	u16 data[RTC_OFFSET_COUNT];
>  
> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>  	tm->tm_mon++;
>  
>  	mutex_lock(&rtc->lock);
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

