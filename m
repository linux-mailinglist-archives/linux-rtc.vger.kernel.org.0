Return-Path: <linux-rtc+bounces-4148-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB89AC36F7
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 23:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C8E171516
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 21:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944C8199949;
	Sun, 25 May 2025 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aogj0u2E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901F17AE11;
	Sun, 25 May 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748208818; cv=none; b=omSBOBLeZjpfGQnISTaYQxXLua2GO6l2i45AQ/9jnBlLuDKrqQsBig7Ly0HpxdXpPyRPRXwGnYtaZNUdWLh70A95NIpW1erf2/+VhkJXmQjwMkDdxcO3zkWoTsyGYxt48mIgAfpZidYZIlSDmzPuAcp5vykbTVSR4ay3JHLEZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748208818; c=relaxed/simple;
	bh=49QRM26di3irxJKZv6JI2JSKPC+p8yj4N12VwzdxvwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9PLi3t8jE3kYEbxpFKjkF6T925DPYAqm7Hk4IpWkBOffH02IJwnFUTzwjTLzS2WTNrdjagwuLpFB1ULr3Bz1jkwX9X7V0w26TynEZsQK6i6cgCaeewu2uk5eikZZpECFu4iqttIGwEK4LVPbo8NITQ8co8JE6avuiLRCUBK6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aogj0u2E; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 633FB41CFD;
	Sun, 25 May 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748208813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o59WfcN7Dr9R3QoV0+k2kms8MbYLWT5vLgXKAPpDZh8=;
	b=Aogj0u2EtKl1En3kLPuByUlDfhFQ7RKZW8e+m60OrisH/QXsw06oGg0HWF2FBHRaz3F4Jn
	skfd097EDEXJn8NJulIsSknZ3/Go+ySdONotmypX+11IAKs6bLI0FztMKML3HGOCBAQ6Ks
	CELTdCgNyIMsPgt8SeKSf27w+pEUAgqxweoDCnUh5yqjGsn2QhgWisu5wpzfoXZRCPQw/f
	4Lv2VI2NcMIpxdJseMm1UqCgZTR5rqfMNx4GeqVceqozB7QeVZr1NO0m6yni0amfq7Hb6g
	GYawFACBLVAVBjkgH69QfK1avdcmfXBCweCJawLovGCU7dMzJV7slogt79xCZA==
Date: Sun, 25 May 2025 23:33:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: (subset) [PATCH v9 0/4] add NXP RTC driver support for
 S32G2/S32G3 SoCs
Message-ID: <174820879984.1463153.5925371724421505055.b4-ty@bootlin.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheejudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghiphhrihgrnhhmrghrihgrnhdrtghoshhtvggrsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 03 Apr 2025 13:33:42 +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This patch series add support for the NXP RTC hardware module present on
> S32G2/S32G3 SoCs.
> 
> RTC tracks clock time during system suspend. It is used as a time-based
> wakeup source for the S32G2/S32G3 SoCs.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
      https://git.kernel.org/abelloni/c/8568d8b4daec
[2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
      https://git.kernel.org/abelloni/c/818b6709e1cb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

