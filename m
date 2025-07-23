Return-Path: <linux-rtc+bounces-4555-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F2B0F885
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB0A13B3A17
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACBB204C07;
	Wed, 23 Jul 2025 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kUlNdQdg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA9A17A2E8;
	Wed, 23 Jul 2025 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289713; cv=none; b=h9jYfpbnq2Yd39/ODbsxBKwBJeDqLx7UOZX8n6wjY+khIdBmOyMHDEV4bSr0uxJwSZR8WVZeV9Ii5TKC1brSdjbp/ENF8NC8I7quKEb4qIA2xPpJA3bOv2Fru9qsZDOkjr/BKpEylH1YvbcWaCX/RnWMtWpOFmu+YNQPV5A57tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289713; c=relaxed/simple;
	bh=BSLLvtlYygxM4E3ulhuKdamOfi57Oq85sKTVssrDi+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+JfND1dwdBqPUI2ExedSPUO7lb44OsJsAnyM1HKfDp9+TV1m/BLY4lotxmlLbPi9QPnyTxXRFDcSbC+U1/iWXZWCh5VawG65O9WXpT7IlxOeAI88OO70w1hllEUHCKwWhWkG+PzSpxWpdntiWqe++8aVDEYkdUPwFsh7Ci45Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kUlNdQdg; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598EC43E9D;
	Wed, 23 Jul 2025 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pp062RJnuSktZWWFIVceCfGoKyjaV8RefQJODM9yHzA=;
	b=kUlNdQdgl2WUoRqxRiR8iQtsP4HCIv618u45ws9uHlH8UbydaZkNehkj28re7FRS+s7asa
	67CQdG5ljgABw8cdB+cwash3ULe1+FBeOWNNImCrCNAfB4W9fHwv9G9DZTLrHHfoPY7gvM
	vvHeuHmc5WYQ9bog6C7gFnbNzdXp7MJ9ScGri5KUeeF3xqkTyaQ/GF4c2Uenva11/jv9bq
	S3xAGS1Cb2eHROI1k48OqZEgZycxWemkxu5dRh0dJwRxtddLeMR9wk5rdK+/uQZMDvLKOA
	0uaZsZTE2uWeI8dsw57jP/YXAyBnH/9t77046rk/ePcVpBzFTP3VQVz15zB35Q==
Date: Wed, 23 Jul 2025 18:55:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dev.tailor@samsung.com
Subject: Re: [PATCH] rtc: s3c: Put 'const' just after 'static' keyword for
 data
Message-ID: <175328962924.785597.6378003953276159638.b4-ty@bootlin.com>
References: <20250707092200.48862-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707092200.48862-2-krzysztof.kozlowski@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtohepuggvvhdrthgrihhlohhrsehsrghmshhunhhgrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 07 Jul 2025 11:22:01 +0200, Krzysztof Kozlowski wrote:
> Convention is to define static data as 'static const ...', not 'static
> ... const' because of readability, even if the code is functionally
> equal.
> 
> 

Applied, thanks!

[1/1] rtc: s3c: Put 'const' just after 'static' keyword for data
      https://git.kernel.org/abelloni/c/8b52144f0e08

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

