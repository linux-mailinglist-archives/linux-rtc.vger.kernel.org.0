Return-Path: <linux-rtc+bounces-4438-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F1AFBDC0
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 23:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA1E1BC014F
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 21:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB91A288525;
	Mon,  7 Jul 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bB1GCunE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9230287272;
	Mon,  7 Jul 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924604; cv=none; b=lGTJ6FzPeBNtRAtrysqEG52Vyv8MNzYC6tj2W2UEoX5N5QSj97xdeWuN0uG1uvgsE3c2aTEdfd8q6B66QPRVQVc6uwBN6n/FV3tHEIryt01qPyClIOPoj9mShJWXdZb7NTXUWsUnYVKm23oTxs9cmYTB47ZJyro5D7EynJB2F2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924604; c=relaxed/simple;
	bh=VMKBNVRlRgT11GhoCwBHVcaT4m4qvmajWqJmr+51fsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV3HpaGSCau09eGuX0frOVmh8q4MT4BiFS4FYAVys2PEN3ZBWB34+XXQcqq4ENbSSdBFg1pF4WWYcG12Vy4EURmiYa+yIqEQDcx4/uhO+5dveov+Th/BJ+qflw4KZnCnb7gQbeMNG7kEwgPtqxbDNWBrmJ4GEskt+vrqQZI1Vm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bB1GCunE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B20E3433E7;
	Mon,  7 Jul 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751924601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c7rg0H0UtvonuewxZSrBE++gJiKtjBYQRfKjsM6NYg0=;
	b=bB1GCunEKj7LNLsoeMCIF5UUE4FQRb2KoGuyHZAsrKWXvR00gMNMUAZG3T47j+gRdLlmTW
	wPxSkCwSn7U5Ng2AJ3EO3OUXoJtG2fQ1TG9viOUg2AV0Ndp/LyX9vogTeiVfyiIqBPuEiz
	+lXeaPfCGbf2hS9ZGKTfLRQFYMbOG3sNDyafhe8M+ZQVuJ47HVlGKY4eYSJhcbgSQgVHTM
	vUSqhTouLgz/5PfpWpO96hf5tbPtUk2VTsihXj2d+WnAJBSkGj+ApObqBQqa3zcdvQwSAh
	pe7gb/hXuU/mlitLdnMIXtxUImY4ub1tkjwPFj4Lx8v2O2dBUO2PLq5DTf1Oqw==
Date: Mon, 7 Jul 2025 23:43:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: move nxp,lpc3220-rtc to separated
 file from trivial-rtc.yaml
Message-ID: <175192458510.1515124.8597547350494726539.b4-ty@bootlin.com>
References: <20250624201733.2515971-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624201733.2515971-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 24 Jun 2025 16:17:32 -0400, Frank Li wrote:
> nxp,lpc3220-rtc have clocks property, so move it from trivial-rtc.yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: move nxp,lpc3220-rtc to separated file from trivial-rtc.yaml
      https://git.kernel.org/abelloni/c/d754e2c4aaea

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

