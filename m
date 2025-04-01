Return-Path: <linux-rtc+bounces-3712-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D8A777C1
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 11:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92694188085A
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 09:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274291EEA32;
	Tue,  1 Apr 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XCi+bjs0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD9F1E8329;
	Tue,  1 Apr 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499764; cv=none; b=H5JPboLPLM+7oGx/V02be5pqqd0nhWzIplq2lODUR8l5KB1vZMc2M6rkepKoNEWSZoFvMPUKGOqZM9RYc4P/DDlPvrVWhKbHzdBUbdsrBew8zScZZ6vYnA9IZDcgGlCC4lMYN8VByzPxGRNYUyNhwlJdq0z8Anr2JzM/VHJllXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499764; c=relaxed/simple;
	bh=Qj/or2Q04KTYGRZ5J888CDL0Vg3escwFqeWvt4Cko3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scHdFJgULbqS5J4IwTXfjRiesMfwp7hQtwQmo66JxrJ72ZQcsizE6lncZOrAg3Nn/dPgbfYCIoLLlnhB/3pySHxRt8Br1JfkKo1aahd6dojZYxLcrUrHtuu8oJPU2yubXnVh2aRo2/HL3781fL05Zqszc8DHBitYM9OJafq9juE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XCi+bjs0; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 232E4432BB;
	Tue,  1 Apr 2025 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743499759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=avzwe/WKgAbUoML1SJxa9bofRpw84w3MBJ+tnYJfR3Y=;
	b=XCi+bjs0BWxvuQ40hNsMrAQ85Ad65NPwcxwG/ImqODzd8CfpgLywYRKK7TVpCQfYqSGuXy
	ptosRr39u5zx0BuyhH8a6717ubXjDgZ5aDaShR4PsCC50diZoQTcPDqEq7jBGNa17f1AjW
	kuyWd0WiPzFQW+DYAmUN3vxmZCyGT3BlE4NLApFa07v0NDPskVCd2RJ2DFNBDNsKfK78/4
	Sr94ZiooaR1b7dtBBvBzzOKqGrOKZaQo0l6ELK/5CWPJmiB2dUdMHoIl96aQDhC+LwD/MA
	APvYi83h/+Zbmbx81WFCCOYQQCz9Yn8P3p7UgmDZ9CvDzlqaOCcC1PJvMTfuHQ==
Date: Tue, 1 Apr 2025 11:29:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: pcf85063: do a SW reset if POR failed
Message-ID: <174349973787.1865724.9911990020381072512.b4-ty@bootlin.com>
References: <20250120093451.30778-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120093451.30778-1-alexander.sverdlin@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhin
 hesshhivghmvghnshdrtghomhdprhgtphhtthhopehluhhkrghsrdhsthhotghkmhgrnhhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 20 Jan 2025 10:34:49 +0100, A. Sverdlin wrote:
> Power-on Reset has a documented issue in PCF85063, refer to its datasheet,
> section "Software reset":
> 
> "There is a low probability that some devices will have corruption of the
> registers after the automatic power-on reset if the device is powered up
> with a residual VDD level. It is required that the VDD starts at zero volts
> at power up or upon power cycling to ensure that there is no corruption of
> the registers. If this is not possible, a reset must be initiated after
> power-up (i.e. when power is stable) with the software reset command"
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85063: do a SW reset if POR failed
      https://git.kernel.org/abelloni/c/2b7cbd98495f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

