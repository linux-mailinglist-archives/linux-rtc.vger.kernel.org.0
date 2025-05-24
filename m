Return-Path: <linux-rtc+bounces-4142-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DFAC31BD
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 00:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD837A27BD
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 22:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCFD13A265;
	Sat, 24 May 2025 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bv/0+pnm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D251548C;
	Sat, 24 May 2025 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748124228; cv=none; b=pNUTvUApF+avPdY+XiuAN/L7gosm5bDGv6KMyGS0TG0DAHSFQhCSnAxxtQgkzeEiNljg6cfo68GKF2O+BJrzw5qFfiffIFHotLji7gHAix3Ltfyi8gy6TfQRUYoyaqzYM6G928Jp4aEGfUv/JDivH4RopBO37Q6hzRushbTfr0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748124228; c=relaxed/simple;
	bh=NyGkYLHn+4wvG1CCUoe2sgBHEOgHL6z2srZowwL7TN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBgvC50ixmqzWV0ibxW6uT0PfD+5SoHQ25RCNhKCtnPyD7STf7kNb2JlmHFZgQU1vUVSqU6cYchiWGgTxjZ3YLA6jixjY6cNnelfpqghdmOomkTHd4GNLR4Oa8TYdRPAAixuZv1yZTkWvjGm8nAqaQ+4E4nmSoIeMmY5AGMmpp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bv/0+pnm; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43DED4327D;
	Sat, 24 May 2025 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748124217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2tWvDkOGbxEzj1cckDOuTnzkYFYG3B1UFP6JqxS+Ns=;
	b=Bv/0+pnmASgB5ZV5BbbBzynyd8OfsjOXmVQ30pBEMbu0Qsb5ItZI21jZcK1xEqCEeaFFDc
	PqDNHDH/CvecOCarxXk7n8MtFq6kpXCjEo9u81rYIXFyq+XaDM/DlPNb2i1MnMVRbLihBu
	q5o6AYMIPij8FgwakznE0E+yZgXW/2eSdnf5ttWaR6IrtbM6HSWJOPgOl4+wOAXpPjiYv3
	HwDe7tlcyEL9YMwjTV9WunZeDD6qxiIJkWeWTpoWvN0winkx6z7FTQtuB44e/JvqJtsxKd
	pq0/1S0kwQPXqs0+u/Ia1RqB3lkBb0ZZqAGl2HdZ5SK0e2HKv66bhUFA2l5uJA==
Date: Sun, 25 May 2025 00:03:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] rtc: drop unused module alias
Message-ID: <174812394749.1268882.4992875410324551120.b4-ty@bootlin.com>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423130318.31244-1-johan+linaro@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdekieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehjohhhrghnodhlihhnrghroheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrv
 gesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehprghulhestghrrghpohhuihhllhhouhdrnhgvthdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepshhrvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 23 Apr 2025 15:03:11 +0200, Johan Hovold wrote:
> When working on the pm8xxx driver I noticed that it had a platform
> module alias while only supporting OF probe. This series drops it along
> with unused aliases in the other RTC drivers.
> 
> Johan
> 
> 
> [...]

Applied, thanks!

[1/7] rtc: at91rm9200: drop unused module alias
      https://git.kernel.org/abelloni/c/9f05c3943eb6
[2/7] rtc: cpcap: drop unused module alias
      https://git.kernel.org/abelloni/c/5f28ab049fb3
[3/7] rtc: da9063: drop unused module alias
      https://git.kernel.org/abelloni/c/ac45f6e2473b
[4/7] rtc: jz4740: drop unused module alias
      https://git.kernel.org/abelloni/c/c61f165617b1
[5/7] rtc: pm8xxx: drop unused module alias
      https://git.kernel.org/abelloni/c/d5e85c8bfaa6
[6/7] rtc: s3c: drop unused module alias
      https://git.kernel.org/abelloni/c/149834a414e1
[7/7] rtc: stm32: drop unused module alias
      https://git.kernel.org/abelloni/c/3639b35857e2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

