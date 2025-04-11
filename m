Return-Path: <linux-rtc+bounces-3935-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6CA85F58
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 15:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1707618947D7
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 13:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010D81C07D9;
	Fri, 11 Apr 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iWU8Dx/J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220C61624D5;
	Fri, 11 Apr 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378725; cv=none; b=hLzzCIzUaDaXHzkoDjgEECTtsTk0Lh7yPcke5LJECssTSKthzo54b4rCkr/WnJnRiye2OXCsa8JlHUchMEiwmBkUoZrajTSi/qNM1lBTXSwumpRm3pQ3urFY9M3EFiXDmk3wCvDrlvE7eSw12xNBt+ECW+ov11eP1t88ue17Gw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378725; c=relaxed/simple;
	bh=9nOXjdvRPnZ2BF4Sz2SL+rND/MjoCbT+d+bZEAd8Qrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnfOr4sYCVBtIt5YgWeibvMr4eU6WUWGhDr5XJe9HJEUwAjfGBKNAp8o0PvNTnBQ+kTcYoV1nas9jBRp4p9mlRsTTejIiTSnvLrIbNYD1d5Icq7sjgJwvEpzHt/VxSYviJaasOrpHYJXhcKuuKaoyfktDYsfVg/K5PpV6is5XOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iWU8Dx/J; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A709143837;
	Fri, 11 Apr 2025 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Se307jMf8bJRrVTshEHtUk2COFPI+eANTJd1fN8fBls=;
	b=iWU8Dx/JYqm/sFQgZoR26vjC41ZWuxjgOZhVY1/LATuPozDi8aQWRB4v9yfoH/bgxG53C9
	f+X37mqdvqCDQAb7yrUuNmi3ZqDim/Hgq34MfFfSMaEOhdTQAWxq/cqwZLHvRbyz7wY5Ub
	Ziu8XpfvAbftJkqqaiV/hVB+AFjnzn+ambnyplYjxxcz/scTZo3wvmgGdga209+onQY9IR
	EwnENl2XV+Kkn10eSYTxDf3J90fCf+NwYjVvwuL6+HT349VivHuiQ28SzOTB1JccXcpWCi
	3SUy8iWvfKTcAWxFdGbeGUJMSxHOitp5FqTX0odc1wUDrEz8bbzH1J8F47jAtA==
Date: Fri, 11 Apr 2025 15:38:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
Message-ID: <202504111338408af44d7b@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/04/2025 14:35:56+0200, Alexandre Mergnat wrote:
> The RTC subsystem was experiencing comparison issues between signed and
> unsigned time values. When comparing time64_t variables (signed) with
> potentially unsigned range values, incorrect results could occur leading
> to runtime errors.
> 
> Adds explicit type casts to time64_t for critical RTC time comparisons
> in both class.c and interface.c files. The changes ensure proper
> handling of negative time values during range validation and offset
> calculations, particularly when dealing with timestamps before 1970.
> 
> The previous implementation might incorrectly interpret negative values
> as extremely large positive values, causing unexpected behavior in the
> RTC hardware abstraction logic.
> 

range_max is explicitly unsigned, casting it to a signed value will
break drivers.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/class.c     | 6 +++---
>  drivers/rtc/interface.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e9..1ee3f609f92ea 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	 * then we can not expand the RTC range by adding or subtracting one
>  	 * offset.
>  	 */
> -	if (rtc->range_min == rtc->range_max)
> +	if (rtc->range_min == (time64_t)rtc->range_max)
>  		return;
>  
>  	ret = device_property_read_u32(rtc->dev.parent, "start-year",
> @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	if (!rtc->set_start_time)
>  		return;
>  
> -	range_secs = rtc->range_max - rtc->range_min + 1;
> +	range_secs = (time64_t)rtc->range_max - rtc->range_min + 1;
>  
>  	/*
>  	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
> @@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>  	 *
>  	 * Otherwise the offset seconds should be 0.
>  	 */
> -	if (rtc->start_secs > rtc->range_max ||
> +	if (rtc->start_secs > (time64_t)rtc->range_max ||
>  	    rtc->start_secs + range_secs - 1 < rtc->range_min)
>  		rtc->offset_secs = rtc->start_secs - rtc->range_min;
>  	else if (rtc->start_secs > rtc->range_min)
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index aaf76406cd7d7..93bdf06807f23 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -37,7 +37,7 @@ static void rtc_add_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  	 */
>  	if ((rtc->start_secs > rtc->range_min && secs >= rtc->start_secs) ||
>  	    (rtc->start_secs < rtc->range_min &&
> -	     secs <= (rtc->start_secs + rtc->range_max - rtc->range_min)))
> +	     secs <= (time64_t)(rtc->start_secs + rtc->range_max - rtc->range_min)))
>  		return;
>  
>  	rtc_time64_to_tm(secs + rtc->offset_secs, tm);
> @@ -58,7 +58,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  	 * device. Otherwise we need to subtract the offset to make the time
>  	 * values are valid for RTC hardware device.
>  	 */
> -	if (secs >= rtc->range_min && secs <= rtc->range_max)
> +	if (secs >= rtc->range_min && secs <= (time64_t)rtc->range_max)
>  		return;
>  
>  	rtc_time64_to_tm(secs - rtc->offset_secs, tm);
> @@ -66,7 +66,7 @@ static void rtc_subtract_offset(struct rtc_device *rtc, struct rtc_time *tm)
>  
>  static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
>  {
> -	if (rtc->range_min != rtc->range_max) {
> +	if (rtc->range_min != (time64_t)rtc->range_max) {
>  		time64_t time = rtc_tm_to_time64(tm);
>  		time64_t range_min = rtc->set_start_time ? rtc->start_secs :
>  			rtc->range_min;
> @@ -74,7 +74,7 @@ static int rtc_valid_range(struct rtc_device *rtc, struct rtc_time *tm)
>  			(rtc->start_secs + rtc->range_max - rtc->range_min) :
>  			rtc->range_max;
>  
> -		if (time < range_min || time > range_max)
> +		if (time < range_min || time > (time64_t)range_max)
>  			return -ERANGE;
>  	}
>  
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

