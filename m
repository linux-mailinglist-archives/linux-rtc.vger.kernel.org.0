Return-Path: <linux-rtc+bounces-3934-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCCA85F50
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 15:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4C61B87E4B
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CFC19F436;
	Fri, 11 Apr 2025 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="idbthJOU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3135961;
	Fri, 11 Apr 2025 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378578; cv=none; b=tyinrubefOCeNH9OI6Vig6o/xwTQblVjpcWC5JsT9ec3Vrvj69qcmrG+wth23HmX7jr0LLf+nqpjnCP5VWxnSApR4XsdU7vux6IagHcAW0M9I1+wDZnT4lX/EcBr5HAEhKQffKnvWtHPwKWjD4688QCHP/VPdJADz4scUooMs9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378578; c=relaxed/simple;
	bh=t8rEUG8Mlt6yj5BQ1zbe9hIkunyXUBQCPigkv9xncUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0Fd0IN2CngD4+PJOe5gx/354l4XB2Mw8zdeR6DV3T9fK3DFejQRetmVgCj3XBnir7k11ahHhljrGJHyH3GLnLD9QOoT1gWC2q4b+SRY6VD43ytqNSMw1+5Uy8upKkFcmcwbVkEkzAIeWIW792lU9MnAXZOHAJGjZZvxvwIMLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=idbthJOU; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 852C81FCF0;
	Fri, 11 Apr 2025 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idxYTJjFmT4fgYqivFM6ttZ4OS4qYnYpnIJHNpNYu30=;
	b=idbthJOU3vn0Or4ETSk4EPNuKDkkQqLUGIFkkT/RWv+pQ876YU0HpOh0rEVa3QWUvB7AM6
	dR0NF4Nhgubi+L2OJSS2Oyt8hk6FGwePpBOaBftnpxZR8bmHIwvu/s+em4vTI211o6D97K
	ESYXH+mwjlWPFtskkZeNp2Bqgme6IY7nwDOlGIQKdJ4ARiO4989kzuI+ksnEoiD09E1nsm
	gjoXQZiO+0eHMhqQ3d6cgWI8GTk+rX7Umjmjm22bIiLBBDxcxg3rO7R1ooyTyzBX/kjSrW
	/XVCi0duHSezGIwzF7pxLpptJNCilZrLi37cb/rUh10Wn9Z34GJ8MF5/DpSnig==
Date: Fri, 11 Apr 2025 15:36:09 +0200
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
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <20250411133609a1295543@mail.local>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegvugguihgvrdhhuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhop
 ehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> The start time parameters is currently hardcoded to the driver, but
> it may not fit with all equivalent RTC that driver is able to support.
> 
> Remove the start_secs and set_start_time value setup because it
> will be handled by the rtc_device_get_offset function using the
> start-year DTS property.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b2..d47626d47602f 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->ops = &mtk_rtc_ops;
>  	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>  	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
> -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
> -	rtc->rtc_dev->set_start_time = true;
>  

This is going to break the time for people upgrading their kernel, you
are unfortunately stuck with this.

>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

