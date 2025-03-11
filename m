Return-Path: <linux-rtc+bounces-3465-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD0A5C358
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Mar 2025 15:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D2016BB3C
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Mar 2025 14:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CE825B678;
	Tue, 11 Mar 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DM14bhxs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1F1D63E2;
	Tue, 11 Mar 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702316; cv=none; b=go6BCxbBQP3RDkqvaLJFPIyI8tzJ1eq0dOzHdNofxwfsJkdaTsd4ubl+71fanYuda0c8eQsCSapgIBtUanHNQnvV+gRjvtFqLrxzJbr+NdVi0jsIRwyLpGZ73M1MBiSzI3BY3Lm4MwUgns6gn8UPABvDhhfGSmgCCQa4jAOKgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702316; c=relaxed/simple;
	bh=bfaMTGHPhk1ROPPWz+lvzVxAVt/RKbL3UwHoErVij2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICClnqHvDT0MKEUc7fPi1RRIB+liugPuCVMEG7j1zobDpwtY80Fusb1mHhfroek+NjSyvbjfEcGUb19IvAVQsumy6WHeniiJ0WEwmvrDDxXmzErYjolAbrAhg0gXMF1uOpwpS+EPR2/Em/kMHGRVtfOhQ1ekcVrKh90tsWTHJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DM14bhxs; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CC294327D;
	Tue, 11 Mar 2025 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741702305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VnD0/j7A5kLTdouB7koNfwd2+FVajSUDEgPjLiIZJUA=;
	b=DM14bhxsvPKrP393J6w0wlGT9PI+ovv2AdPQXmeBvSmzDDaNp9er8zik5E8q450BP4/NCi
	u8O7vrz94sxxkF1lkoV487xeCPRS+ZgfzP4OZnZsCGXdO0NI79fSymZAV/RHk5Oco8iSoL
	3IE9sqTJwLHfsKpgZKSNEMxSuCuYcLL6gRbuhgIrUP16BsXyBzkRe25AK/IcqnSrFUAPD0
	3B7g/gHAyOX/Wr1Owiu/eX2NtFtuPQwmda5LRhsgXUdEY6zRoqeLqj47MPvbRI5Qeg7i23
	gNVVYF9i+/94dsGZHhW0swBa1d3wvgX/IFAc9RGDhioHE2sOBXYPY2UfTffbmw==
Date: Tue, 11 Mar 2025 15:11:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] rtc: renesas-rtca3: Disable interrupts only if the RTC
 is enabled
Message-ID: <174170229131.122687.7673769665221505854.b4-ty@bootlin.com>
References: <20250205095519.2031742-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205095519.2031742-1-claudiu.beznea.uj@bp.renesas.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekledrvddtjedrudejuddrjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeelrddvtdejrddujedurdejhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgvnhgvshgrshdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 05 Feb 2025 11:55:19 +0200, Claudiu wrote:
> If the RTC is not enabled and the code attempts to disable the interrupt,
> the readb_poll_timeout_atomic() function in the
> rtca3_alarm_irq_set_helper() may timeout, leading to probe failures.
> This issue is reproducible on some devices because the initial values of
> the PIE and AIE bits in the RCR1 register are undefined.
> 
> To prevent probe failures in this scenario, disable RTC interrupts only
> when the RTC is actually enabled.
> 
> [...]

Applied, thanks!

[1/1] rtc: renesas-rtca3: Disable interrupts only if the RTC is enabled
      https://git.kernel.org/abelloni/c/27b2fcbd6b98

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

