Return-Path: <linux-rtc+bounces-4558-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA8B0FC1D
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 23:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689B23BB7E8
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6652526CE28;
	Wed, 23 Jul 2025 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oACApUMN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F814A4F9;
	Wed, 23 Jul 2025 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753305953; cv=none; b=OsQb3uwtifJ4vx5CB0rwQhQ70GyiADvCP0bEZWoa+EQSrJyCkBlKTTmECVOBsQieA1pNs7xnR9i7TbGeEEpVmJJj98RkH4uz0RUgy08+mIygkTU1Zvv4A6MrLL32ka2W4DS9O0IE3mj0DyBUCgEy3LpVaQ7pu2z8BjzFJDytlM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753305953; c=relaxed/simple;
	bh=LgxYyIGtTyJP9hOOR/qvr8QhOR8HdZhoxjEvUb4YpiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYCt11VZGO76nNjNmNJApDIfM8HgdkRFncgfIJ2KlfFhRyZKIw13v6rUxrZsIB0zAO6vkYvVhJGP0vkNcNpwgKuszFZMQ4CFMEanx8qnf/ZUIaGhvMDEAa9dFUocdqWLzTk7TYYDGDMZRBSook8cJtdDSfWQ9rY515k4KYk+F90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oACApUMN; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FDDD44381;
	Wed, 23 Jul 2025 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753305943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yE+1V9Bzs7uInAkzQVm3CUqU/Wbcnor70jQ2KiGKqx8=;
	b=oACApUMNE1abTf1bcxGGtgGDeK6AheNe0cbULcdcdKIWVOaG/gLY0YwrWR2Zsek2q8VdVW
	my6Q86doOFmj7aeJshOIuBsvFVZCdu35FVto0CJ36ADyBu2+3leJVCOFtjJila23kwW2r3
	pSsVEUTGYwqQex9Z82No/SXkDsMPDyn1AG5ucF7VuE2L6AMA3RkWozsUxe+BP0L4hnxNkI
	lQSJPe0I5gKq3TXCi/MdNDi1aP68dGbMoCtHP+TyNWA+z/E6byjvv+hyqONiwdxo5GSNnq
	IvyK+nVlzIDH1sSoXRYvPBpzceDIEk+82BGJveX+rQ3Ivhm2zBUY86ae+v9/+A==
Date: Wed, 23 Jul 2025 23:25:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	code@tyhicks.com
Subject: Re: [PATCH 0/2] Expand oscillator stop flag (OSF) validity check to
 ds1341
Message-ID: <175330593311.840154.1335180460711019905.b4-ty@bootlin.com>
References: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehmvggrghgrnhhllhhohigusehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohguvgesthihhhhitghkshdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 11 Jun 2025 11:14:14 -0700, Meagan Lloyd wrote:
> We would like to use CONFIG_RTC_HCTOSYS to sync a supercapacitor-backed
> DS1342 RTC to the kernel time early in boot. An obstacle is that the
> sync in rtc_hctosys() is unconditional as long as rtc_read_time()
> succeeds and in some power loss situations, our RTC comes up with either
> an unpredictable future time or the default 01/01/00 from the datasheet.
> Syncing a future time, followed by an NTP sync would not be desired as
> it would result in a backwards time jump. The sync feature is useful in
> boot scenarios where power is maintained so syncing only when the RTC
> data is valid would allow us to make use of the feature.
> 
> [...]

Applied, thanks!

[1/2] rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
      https://git.kernel.org/abelloni/c/48458654659c
[2/2] rtc: ds1307: handle oscillator stop flag (OSF) for ds1341
      https://git.kernel.org/abelloni/c/523923cfd5d6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

