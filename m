Return-Path: <linux-rtc+bounces-2103-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A835992E0B
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 15:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 070AF2842FE
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 13:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23ADC1D5CCC;
	Mon,  7 Oct 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gTRpQasR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922D1D4176;
	Mon,  7 Oct 2024 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309565; cv=none; b=I8CTlwDQ967KKkUydMlF7RHWhER4aCQObdgrKuij4y6kqkzD892EoWxgj009f+3tHNzcoMhwOibTzIIRBpJjg/ww99ftXWgNWmZgRrmWd9pAiHJVSPrdb8BsIYmLTCgUen/cQzR32hewqPx9/m96nM0+EVZxP9ct0p4arCdThNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309565; c=relaxed/simple;
	bh=0hTEWkTcrmTpBmpnYT+tQaCHKTMiUvk04c6YSiyIpLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI/0fEN0a7/8tRU8ryG9Db8lblGkLD+6UXKiM/mSB8i6OpUhdWGiaptSW7SAsOrPZVLUW+FKs+ZW8pCAu1W66fXrz6u1C61c1Q1l7q4mu4J00iHb7bjL+cK5x8FP+sTdS2KNVqN1ADQtidfNgeAQOmhiIXjwz0YSRUYqoyJ8iwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gTRpQasR; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1674660004;
	Mon,  7 Oct 2024 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728309561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W3J9vhE75jG5a5PbEJCJkk2CaxPRsfgxD6riY7qghpI=;
	b=gTRpQasRNG+5eCi4HMpiS+EI7ca0RnLWXA0b+TqoP/9F5rxlHV6YaE23G/YGss9zhhthjz
	sar8s8wSjPoouKBktBU8jaM3a1xwCGVE4KnMqlBZqBtUH9pKFHb9AxvTHbEocW7zZNoScl
	XMHLsqQ9KJULCTBYbtgULGo1XzIUXjlzgmEV1qpQ2+n27rH9HU0+sM5WPyAq/TfQMZZehA
	D7hIkgPyWqhPLveO/QHuCXjJoNWVoSgo5Df2dTdsmp6OqCtxwoxkAbcOoXTUzzxbYJysj+
	C8CWmab1xvQhWIDMsPERJRYoqodJSXVO4M3Lz9nMaRvuFQGgmXYNmU4A222SOw==
Date: Mon, 7 Oct 2024 15:59:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-mc146818-lib: Use is_leap_year instead of
 calculate leap years
Message-ID: <20241007135920ef75da53@mail.local>
References: <20241006001553.7430-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006001553.7430-1-iwamatsu@nigauri.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 06/10/2024 09:15:53+0900, Nobuhiro Iwamatsu wrote:
> The is_leap_year() for determining leap year is provided in rtc lib.
> This uses is_leap_year() instead of its own leap year determination
> routine.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-mc146818-lib.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index 651bf3c279c74..ce4d68de05831 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -232,8 +232,7 @@ int mc146818_set_time(struct rtc_time *time)
>  
>  #ifdef CONFIG_MACH_DECSTATION
>  	real_yrs = yrs;
> -	leap_yr = ((!((yrs + 1900) % 4) && ((yrs + 1900) % 100)) ||
> -			!((yrs + 1900) % 400));
> +	leap_yr = is_leap_year(yrs + 1900);

Could you also eliminate the leap_yr variable?

Thanks!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

