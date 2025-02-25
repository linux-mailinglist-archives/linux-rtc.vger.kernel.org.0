Return-Path: <linux-rtc+bounces-3269-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF972A447E2
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 18:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2DF1887FB3
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 17:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCB320D4F0;
	Tue, 25 Feb 2025 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UINu0SKR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F620D4F9;
	Tue, 25 Feb 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503787; cv=none; b=la0h4IN6YbCoXkTRsUgI7vbPv9JZmGNbtk7ens63YKvam5ydhlqzHrZlHr3sJvqUcCI1npO54/0uErLd5UK31mMOJLiDGRhpGg2baWXUVDXkJZD87jUpcdghRsRx4QV1aS6wVBXdfd1BaUOaRjvx7tpq2nm2PHER6UCxWnH4G0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503787; c=relaxed/simple;
	bh=PiW3oyd3LJ50AwwT8auxr+DQNorOwqlXnETe1D8UDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hb5xegxf1PGnwhaAMRf0HyeJKDzWr5kXPLoDvdalBTgxWc8RNKjRsF1RcWY3F31po6zoLMiUrdC9Va+n+Uo8pcrNNDEvQuUiIrBIRJfP2qA23Hi73PS/2lZ75Ewa7QZplemi5jS0vRippDPe7cCaKAfR1CfT/YsyJID6TWh/Dug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UINu0SKR; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7001F1F764;
	Tue, 25 Feb 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740503783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6Tzhw1DFNp7/+6yHEU3hAytv87VLc+f+JErlOlCl90=;
	b=UINu0SKR7sV3xtmdD0Qsxi1a8TDXUYMi98Dq9JAtgcAqz7qRyRgs+8m/UgPgnda/7qRGvm
	qWnzgXBhCjyf6AzXph0uClQyD/99MaA7YvXs19Fvr0gz/uTjKoUQHB17AYJWXwJTEhkWqI
	RJoodSRK5FDi9enQU29uopMXLUiQRasLSbLT+NINg3M6kpDPYXtZCJLKy3GnWneyw8mP39
	omQ1XHTgXZZt0Py3salu/OBbmemany8rm5Cug4mM8WbS40v1OMILdDuhIdcxGoOUwXlWoN
	BXIJLmnq51mTciDuPw31SDw7y6GHHqGAbN07NbcFoQAe9O4Ne9XBQFn23TeyUA==
Date: Tue, 25 Feb 2025 18:16:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: fsl-ftm: remove incorrect ACPI_PTR annotation
Message-ID: <20250225171623302b7862@mail.local>
References: <20250225163427.4168570-1-arnd@kernel.org>
 <db184d51-db88-4f90-bf6b-dd92d3089eb3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db184d51-db88-4f90-bf6b-dd92d3089eb3@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemhegsudgrmeejtdhfudemieegugemjedtvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemhegsudgrmeejtdhfudemieegugemjedtvgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvp
 dhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 25/02/2025 18:12:10+0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 17:34, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Building with W=1 shows a warning about ftm_imx_acpi_ids being unused when
> > CONFIG_ACPI is disabled:
> > 
> > drivers/rtc/rtc-fsl-ftm-alarm.c:312:36: error: unused variable 'ftm_imx_acpi_ids' [-Werror,-Wunused-const-variable]
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I already sent a fix for this few days ago:
> 
> https://lore.kernel.org/all/20250222114146.162835-1-krzysztof.kozlowski@linaro.org/
> 

But wouldn't Arnd's one be better?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

