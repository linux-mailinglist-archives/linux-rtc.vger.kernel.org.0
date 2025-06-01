Return-Path: <linux-rtc+bounces-4209-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE6ACA071
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Jun 2025 23:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67B1D16FB27
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Jun 2025 22:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD9123A98D;
	Sun,  1 Jun 2025 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QBZD3OA+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5972DCBE1;
	Sun,  1 Jun 2025 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748815194; cv=none; b=K4fCglo4Cy7m+OcUoYXeAgC+YraARsjwF7mVJ/RcA3wlmiCLiKVmPw3bb9W2wcQr9BKNo0ZrIhYl8MPQLYQConQXGGWMGCvtTnK5DYQsBHoUBsaLoZ8euGzBEvcb6BU0yg6nu1MeLM7iUzxak15+PrzjHENqotnSQXWiZmSQydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748815194; c=relaxed/simple;
	bh=i22TdQlBf2IMA5EW/rZEwufzvzklGU83tLpXBHkDOrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBvlUVoXvU7mDi8wXZTFf2G0lslRUf2XSBB2tMym6D/T6SS8i5X1qT7yWFlIrGnWWbGDKfet+HTxyV8YcJTKv4m8wh8BOhO9a47U1SrpNUy8in3x3ifJCyAEmFrEbKMCth18JlqXVGn1iTHlqZkKB3gQJMGrANwO+s8OZnn1fXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QBZD3OA+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 777B1430B7;
	Sun,  1 Jun 2025 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748815182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZtWs0aNrfXCtQFL/OtFRB5LFR+E4sAbj9tFpxg9SBI=;
	b=QBZD3OA+yHSX+45mwYUhhmEMSIj3q0ALHZuBRlGIpmLPTm7iyNxJXnqBbgatgV9YdDLi6n
	Z/8kv8I07Xm5lO2DwrhEfqrdgUK7nvxaG11BdnI4wkNMCBrD+tD9bjPvj0aCGbMlIfhRgD
	LKYAILLof8ijNRzCIBCVAonn3Ujtqnj/3yC1QlZcbXPG8eczrJKf4rVoUVlzpeDIA+GIss
	F0pSwXklu+1Ue2Ay/a6flTJmHaf7mq/rcstHudMHqqWbL1naEUUiTC4jR/zsRYq5AovauX
	89ED7MeTMaiyVGcE97ZUzFIE5zELyRGpEX+dUA5GQD/uMwjyUJVBuqPjH/NBWQ==
Date: Sun, 1 Jun 2025 23:59:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] rtc: rzn1: support XTAL clk and SCMP method
Message-ID: <174881499074.457649.14080802492119031789.b4-ty@bootlin.com>
References: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifs
 hgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 26 May 2025 11:58:01 +0200, Wolfram Sang wrote:
> So far, the code and the binding for the RZ/N1D RTC assumed an input
> clock of 32768Hz, so it was not explicitly described. It makes sense to
> do this, though. For one reason, clocks with other frequencies might be
> used. This RTC supports that via the SCMP counting method. The other
> reason is, upcoming SoCs may have only the SCMP method described, so we
> need to use it there later.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: rzn1: add optional second clock
      https://git.kernel.org/abelloni/c/ae95a7e32140
[2/3] rtc: rzn1: Disable controller before initialization
      https://git.kernel.org/abelloni/c/a50f00cb87b1
[3/3] rtc: rzn1: support input frequencies other than 32768Hz
      https://git.kernel.org/abelloni/c/f096bdbf08c9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

