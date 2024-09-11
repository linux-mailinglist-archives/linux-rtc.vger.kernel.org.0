Return-Path: <linux-rtc+bounces-1946-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5784975D40
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BCF6B24F52
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B40E1AED49;
	Wed, 11 Sep 2024 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eLTAOgnK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89051A3047;
	Wed, 11 Sep 2024 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093842; cv=none; b=gBbsf2KyiaFSkKQKhBil9vPQjPzpFx/msmafQDyyGwmCGrqMt3FSy3jToEueCBQhMDdR36WCZxwQ7tLg9pSgpDgRX1N1gMM/WVWG50boEfihmp6/VewtIIo+0XMpnOZVHtt2wtkHeoOP232FhZDJXVwGa7mY1Rr3l8+gdO3TiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093842; c=relaxed/simple;
	bh=npOevJMDfW/arh3BY6Od23R/CP3junI1c4HvN1FSpL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqqVkwyS6I17mDNA1ZW3CssdxIRKnlOtT48IS2GmtpikbSaoatxtjLTAXpoCgWr3ChdSOS3uA1DwFXXuqauFE71Az20lE0WGBJJ1xSXu1HeGgrPn7GXd6DlnhyFKQymGGYdHzSlqGDYNlm+xHQ00DPhFChTU2iXz1wOlXIvlDkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eLTAOgnK; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9ACB41BF204;
	Wed, 11 Sep 2024 22:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qU4uYN5RMPRB/LA33aUfiA2ctd0kCy7zU3BPdp1ZL4=;
	b=eLTAOgnK4EYIldY+QvnYQYy2sTaoqt5lefdcseKFntQT+ffxxiISq8axnZ3bneGGYqYe3R
	6KkLyUDlWslhX6o/0bfuNw89vrmJuGnm5D5J3U8MSdTvnOGSXtC6f4MEj/4GXMn4RFdd+p
	TKUNCh8sa7x34ixoUpLOpA6b2E8/2acNVfIjtOnICo1wSkhOAR+ZwnVpDvOeAVH9ilasRY
	N6Qi6HswkU25Fwm6C1PywOdWDEpJKXuXeWLiThN09/WB8fMUVZlBZSi3YURUBgQHlb/6Tn
	0wokkx/hNonyI6UdB4OgO15dm1muaVr7TFmHcYDz/qEN+NIxue/kIabG2rZJYw==
Date: Thu, 12 Sep 2024 00:30:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: disable automatic clock input switching
Message-ID: <172609381393.1549758.1447288374525041880.b4-ty@bootlin.com>
References: <20240730194905.2587202-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730194905.2587202-1-mwalle@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 30 Jul 2024 21:49:05 +0200, Michael Walle wrote:
> The V3(s) will detect a valid external low frequency clock and if it is
> not present will automatically switch to the internal one. This might
> hide bugs and (hardware) configuration errors. It's even worse because
> the internal RTC runs significantly slower (32.000Hz vs 32.768Hz).
> Fortunately for us, the V3(s) has an (undocumented) bypass of this
> switching and the driver already supports it by setting the
> .has_auto_swt flag.
> 
> [...]

Applied, thanks!

[1/1] rtc: sun6i: disable automatic clock input switching
      https://git.kernel.org/abelloni/c/2cd71297070b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

