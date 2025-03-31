Return-Path: <linux-rtc+bounces-3710-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E463FA770CA
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 00:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FCB4167B35
	for <lists+linux-rtc@lfdr.de>; Mon, 31 Mar 2025 22:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EF321C17B;
	Mon, 31 Mar 2025 22:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Uh6nLXj4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1D1C5D77;
	Mon, 31 Mar 2025 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459464; cv=none; b=JzpVOczQ33yA/llrmASQ1iC2Jh+72swQDNUeqSkwWWWs0zBdWHC+2k85XsCGDUfTjH22r1PG0djNYHOUv7iLX+gkFu+z+E9rpNWVSMtVLfb6nKOWOJiPqTsWi2C3ZURqct58MYb33RV3S1+MMXOUn+Gdd5m9FwwwOWn0qHQ/HnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459464; c=relaxed/simple;
	bh=Be42ZyZTNQLk3mkfsBsH12nkxXsGhoqOUSxh+W8WzgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHAMvSAnYHc/ZA9niKSxmsU3WQDBDVjx6mQnPDuSd3X4n8bB+5uLmhKhha35Y3WIgrXSXeMYCIiQ9gzARxd3HJrLOre4lijGXU5vLzzLZQkhdrqojohHLFkYbDKhlRmoisUTERZEo3jVtISr4eFwRgsCE3srjiIjcI8aWCwZh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Uh6nLXj4; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A3004327F;
	Mon, 31 Mar 2025 22:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743459454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ODMQA+9M8mHLpeAl1Ix3Y1gYb417FROKcUghxrSljG4=;
	b=Uh6nLXj4qBFWKSX2lOENPREu8rmxdpjZfgPEagcgjxB6WqecB40Ck8A5EAhWcrnqcQqDpW
	QgNwFZnHqd9b8ryBl0Pxb0ZuCmz7UsDHr5dnG2wPNP8VueecPe5bSAIrAjs5wINykwM4RQ
	wh2b5m8HSQLhDPBH9mtU63Q3EkOQxx33Hl0VNZg5BwwdE4Yh22tjTzA5rG6MJW6bR0Vc/O
	yv1uLJiV74ZwCTRLwSW6NqFAVlTbb7Gpzw0RERNBalX/modAWRzZJG2BYk3b13hbvlyCYs
	ZiayYSbXcMWvZfkPs22YesGxpvRakKHeMksELpX/u98Ha7UerCu6jsiO1qXfzQ==
Date: Tue, 1 Apr 2025 00:17:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	PavithraUdayakumar-adi <pavithra.u@analog.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 0/2] Add support for MAX31331 RTC
Message-ID: <174345944323.1766018.15408686611644457738.b4-ty@bootlin.com>
References: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-add_support_max31331_fix_8-v1-0-16ebcfc02336@analog.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrnhhtohhnihhurdhmihgtlhgruhhssegrnhgrlhhoghdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuggvlhhvrghrvgesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepnhhonhgrmhgvrdhnuhhnohesghhmrghilhdrtghomhdprhgtphhtthhopehprghvihhthhhrrgdruhesrghnrghlohhgrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 17 Feb 2025 18:17:15 +0530, PavithraUdayakumar-adi wrote:
> This patch series introduces support for the Maxim MAX31331 RTC.
> It includes:
> 
> 1. Device Tree bindings documentation for MAX31331.
> 2. The driver implementation for the MAX31331 RTC.
> 

Applied, thanks!

[1/2] dt-bindings: rtc: max31335: Add max31331 support
      https://git.kernel.org/abelloni/c/fe135955bed2
[2/2] rtc: max31335: Add driver support for max31331
      https://git.kernel.org/abelloni/c/a4193578631b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

