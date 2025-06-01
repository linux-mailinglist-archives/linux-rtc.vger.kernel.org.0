Return-Path: <linux-rtc+bounces-4210-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB1ACA08A
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 00:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402C5171D95
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Jun 2025 22:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B21239E69;
	Sun,  1 Jun 2025 22:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U/oRR790"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3619CCEC;
	Sun,  1 Jun 2025 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748815474; cv=none; b=ZIfz+NhEZ+67ha82zMoK5Zg6IMKq5FTNHgnzpvshbc2SdufgImiNuE8zlS/FqqgMLpAvXgeCZODurVTOjS+kpQ3SUDLpVV8o9uXv5Z+4J2zSVhRtSzmi/Z0k3a8bGNAdMbbRbpmOSRtiYbt6QUKr8wJdAU9RsvAo/TkkPBw9uBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748815474; c=relaxed/simple;
	bh=s7khWwta5s0xc+D+jjocQFJTKge5Tm9nXfcQRqGIZCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOBDZkLdnO5Zoo0wIQby0/KtT1H1TirXq/n1ZpHc2wtkHt4zmBJH3Qznq7P0AtzBLOXJwgKqukEtq49SfkPavPeCBRro0ixcrgT3+wqBTjazFKkGuei2jZqNgjCRYD5WAwaFXrHm711SnVsT1Nt1bbG/XwJpJOWpHzs1E0M88hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U/oRR790; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DAB4433E9;
	Sun,  1 Jun 2025 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748815463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6FOimge9EmL8gTkdEA6K2NXsKzEvjjKB6uc5vv42fk=;
	b=U/oRR790Kxb9PK1DphQKoZtGrxwkath4enCtQPhCc1pw9EeDLZAVsQNsoT5NsNeoa+Nr/D
	R46Qif5C83Ovf5QmlVSlChxxhqPXXmAtfyB4vJ94sKZjxNYStvVbCU8vSzMu0kBjEqzNTi
	5rBns5qwKyFadOTOwNyXCscEjiCsiLjgWZ1WyUDg38q0SU9F3ULKwhuYvr5BlKnMlcqRH5
	Zr2lQ52B+URczRZGhZM8aHiSyAdyrZmsfdCdUl+QCiO3giZmve2xjRFZci9Ru99UkCUR2v
	2ibmnx5BBc/i5sO3A5CS5W0HL1XXevZ/HlpKHfQRjOySuEF4+0nQJv9mTLMJow==
Date: Mon, 2 Jun 2025 00:04:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: pcf8563: fix wrong alarm register
Message-ID: <174881535812.458598.12955859438798777134.b4-ty@bootlin.com>
References: <20250531-pcf8563-fix-alarm-v2-1-cac4b1716167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-pcf8563-fix-alarm-v2-1-cac4b1716167@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtrhhohihmihhttghhvghllhelkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 31 May 2025 15:20:40 +0800, Troy Mitchell wrote:
> When the regmap framework was introduced to this driver,
> the PCF8563_REG_AMN register within the set_alarm function was
> incorrectly changed to PCF8563_REG_SC.
> 
> The PCF8563_REG_SC register is the seconds register.
> This caused alarm values to be written to the seconds register
> when an alarm was set. Which means the alarm would not trigger
> as expected and the seconds register would be overwritten
> with an incorrect value.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf8563: fix wrong alarm register
      https://git.kernel.org/abelloni/c/1e15a6803df0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

