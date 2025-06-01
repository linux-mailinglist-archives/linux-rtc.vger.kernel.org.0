Return-Path: <linux-rtc+bounces-4211-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892CACA08D
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 00:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7539A3B2C27
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Jun 2025 22:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11381223704;
	Sun,  1 Jun 2025 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nxl2s+2E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5333F3;
	Sun,  1 Jun 2025 22:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748816079; cv=none; b=WG9p/4UIHt0pq5bt92C0vg+YzACMYC09Umcl/De1vx7Cd5rHmJj2FUO4DuG/aVL4vW+C/9X4ZvP4mxxXprQ989vKSdrtSCHq/CsSVfTnGx0fmpAnL5bQBcMxwKYFAQpCrUdXtFx8Kp3bTTx3GUH0xnepbAOO9wq8on2g6ubhtcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748816079; c=relaxed/simple;
	bh=s7+6UkHahlku6of2TiyCnCOwVOSYSdO0+SZbsLU68nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb83IDpcKPyi8/bNX2w5wLmo4H0gt5GgkdlfJ7iCJ7wBXX0CDIABTia/Z2srUS8ncpDsAFudarTKTz3X569Hs6Sm0ALmj9GD8TCv0tYCtr6LOMUTxPczAXTDxTnclDccfN0/uOr3U+JzAAIpwo7t+edjBeEB39tF+4hBZbmEgJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nxl2s+2E; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFE2E41B5F;
	Sun,  1 Jun 2025 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748816074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=897eqTkE+6wa/adqLJ8b4A7Logj8u38A1oViMUgKXZI=;
	b=nxl2s+2E9lMOi5pQ8rKvwAiPi9V8iphMAmimXEgF2nIeeYND5mah0+UJ7JJnBznnM09aVT
	w1nrlIrHDgtEPXMQm4/il1iIdjAuJYmwjtkcvXsC1ak6DN15X3eImXjHXox2BaASJsKzR/
	iquEkPjuhImoldPRyQbgpoo5zKOtz8/zSBorLuzhadWmE5jvHNTAkK/Fl2vudLCGIaF4Dy
	5QvujPjiTBBxH43W14G5AC/QE6ofXShKW8bnd6Rs6k39y/YSCt3j0lletYYylp3trrzON/
	8Uzk2fzLm2advoTrZgLJ9zTKt0WuJcMWRa5w9Kxdi5/mOWKyrENf7WJShfYh6g==
Date: Mon, 2 Jun 2025 00:14:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Fix pre-1970 date handling
Message-ID: <174881605610.460021.11978572391323956698.b4-ty@bootlin.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsrgholhhinhdrfigrnhhgsehlihhnuhigrdgrlhhisggrsggrrdgtohhmpdhrtghpthhtoheprghmvghrghhnr
 ghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 28 Apr 2025 12:06:46 +0200, Alexandre Mergnat wrote:
> This series fixes pre-1970 date handling in the RTC subsystem. The changes
> are particularly important for MediaTek platforms using the rtc-mt6397
> driver, which can only store dates from 1900-01-01 to 2027-12-31.
> 
> The handling of pre-1970 dates in time conversion functions is improved, which
> is essential for hardware that must reuse earlier dates once their native format
> limits are reached. Sign-related comparison issues causing incorrect offset
> calculations are fixed, and the test infrastructure is enhanced to validate time
> conversions across the entire date range.
> 
> [...]

Applied, thanks!

[1/5] rtc: Make rtc_time64_to_tm() support dates before 1970
      https://git.kernel.org/abelloni/c/7df4cfef8b35
[2/5] rtc: Fix offset calculation for .start_secs < 0
      https://git.kernel.org/abelloni/c/fe9f5f96cfe8
[3/5] rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
      https://git.kernel.org/abelloni/c/46351921cbe1
[4/5] rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
      https://git.kernel.org/abelloni/c/da62b49830f8
[5/5] rtc: test: Test date conversion for dates starting in 1900
      https://git.kernel.org/abelloni/c/ccb2dba3c19f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

