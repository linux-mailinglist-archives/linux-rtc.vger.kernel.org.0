Return-Path: <linux-rtc+bounces-4343-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB9AE5670
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 00:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C00C173A75
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 22:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D90722422F;
	Mon, 23 Jun 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="idfOPu6C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73316D9BF;
	Mon, 23 Jun 2025 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717201; cv=none; b=m1OoupknZH+ul4bFv8ZjPlXlTYOW8koS1DQPUDuycxL3/CqlhFNJnXiWKruOv0OWhjWzPa9yUN8e5ADKtKebVitoBgGeiVfz+94hDyNK9RYHn9EMzOeY2PhcBsapWsPUVWp5Za5cJy5VRsq+6/Fm1JAYjZVmxL8LH6wcchPzXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717201; c=relaxed/simple;
	bh=rDn+5YGvC8gvlSl3EUM+/gCGTWAM9zvrOA0Z/Ltjg1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StqgfOLg5tFWYmMN4RU9lpea5ZlWrMYn2dpM41tf3Vtsa50pjTwAvFY+5wY6iyQdLOKNcK384qi0ZW20vnw5SJOtLRC3QBUBkqEpm1FThZPIBGTDjypLks3XtQDR89LB7U0J4WnZOnJz7gbZikeQmbWaNTVK7aTzzne7r0gvZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=idfOPu6C; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89E8E43881;
	Mon, 23 Jun 2025 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750717196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH1bAfPgsbTdwQOw++nDUnjZRfZFJJLgGsLVCvJ6ahA=;
	b=idfOPu6CKmH+9DH+hAvWkFB5OofPXN392rj5MHDlHB7xm5A8JpjB/Ngp7ZPM83CWguuY3U
	SsIzspdvUAij3+0eOVlPVAHFCA4wtw9YCQTKyzr/Cgk7NwEl/u3VW00Rz+SGPTO5k9v0Cj
	74swYO9CSSSYiqJU01Wr3uTG3QKqeR1khIuQnv9qKVcZc6Qie+rE7jL4gEuZtOrroZGXbQ
	Dd70dgWo6RiOyY8V3o/XAzc++Hwm/8uGcEyKgfwQhVbnyXRdJNvj5dYbEk8x0fGphnqbWe
	mmaDYf8MBvvzHPZZ5/XXCsf7JIm+N7/LT9F4L0J8S/68pbTpJUOvNxq0YAd5qQ==
Date: Tue, 24 Jun 2025 00:19:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <202506232219552539103b@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250415160212.GA372032@google.com>
 <2025041715425693974c6d@mail.local>
 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
 <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduvefhvdehlefgieelfeetudeugfehgfeugfekleejueefueettdffueetiedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhnrgifrhhotghkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtfidttddrtghhohhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhm

On 16/06/2025 12:33:21+0100, André Draszik wrote:
> Hi Alexandre,
> 
> On Mon, 2025-05-19 at 15:41 +0100, André Draszik wrote:
> > Hi Alexandre,
> > 
> > On Mon, 2025-04-28 at 19:17 +0100, André Draszik wrote:
> > > Hi Alexandre,
> > > 
> > > On Thu, 2025-04-17 at 17:42 +0200, Alexandre Belloni wrote:
> > > > On 15/04/2025 17:02:12+0100, Lee Jones wrote:
> > > > > >  drivers/mfd/Kconfig                                |  35 +-
> > > > > >  drivers/mfd/Makefile                               |   5 +-
> > > > > >  drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
> > > > > >  drivers/mfd/sec-common.c                           | 301 +++++++++++++
> > > > > >  drivers/mfd/sec-core.c                             | 481 ---------------------
> > > > > >  drivers/mfd/sec-core.h                             |  23 +
> > > > > >  drivers/mfd/sec-i2c.c                              | 239 ++++++++++
> > > > > >  drivers/mfd/sec-irq.c                              | 460 +++++++-------------
> > > > > 
> > > > > >  drivers/rtc/rtc-s5m.c                              | 197 ++++++---
> > > > > 
> > > > > MFD parts look okay to me now.
> > > > > 
> > > > > With Acks from the Clk and RTC maintainers, I can merge all of the
> > > > > driver stuff together and submit a PR for others to pull from.
> > > > > 
> > > > 
> > > > I don't think the RTC part depends on the MFD one so I was going to
> > > > apply the patches in my tree if this is fine for everyone.
> > > 
> > > RTC patch 27 does depend on the s2mpg10 mfd core driver (due to
> > > using enums and macros introduced there).
> > 
> > Lee has kindly merged all the core driver patches.
> > 
> > Any chance the rtc changes will make it into the same kernel release?
> 
> Friendly ping.

I've applied the patches, I'll try to send them to Linus but there are no
guarantee they will make it for this release.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

