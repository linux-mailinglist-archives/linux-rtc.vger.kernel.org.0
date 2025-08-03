Return-Path: <linux-rtc+bounces-4628-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E63B1916C
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 03:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F62F3A335F
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Aug 2025 01:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA9872607;
	Sun,  3 Aug 2025 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hlo+rA47"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF22249E5
	for <linux-rtc@vger.kernel.org>; Sun,  3 Aug 2025 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754184564; cv=none; b=cr8+v6LaYedmTeorHoS+IaaTiwPUxtYNSHa3Zxa94iBmeAdmOKWVn8QOaRqWj2E2np2/fxuZf77iONBg/Y0ROAOAmdSxFhvo+1i45ipxT5HShLljdZF44a2KlalOMesyWupKX2nHefK1lXz6MK9o3gH4Hc+wk+5PPu7MsOcZ0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754184564; c=relaxed/simple;
	bh=Str+b7AUSIphICsT0rkxuNhGc2fVj5MCjwFERx/+HDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOygp4fWlkSv05Gv3RR1aIBpjL0H3MCW2JLgSCSEVkIYLsmHLTcvIUzewYgvIPsgkduLY6OkpUzax5hdv6/UcRRKbR9SUl1bToUADXvPIq+2mEcDxUw6ye7KomQptc6u+5Vv55qlZ3r6OuwFuNmhhx6GjVw0HVvjgrDMfrbvs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hlo+rA47; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA75E43215;
	Sun,  3 Aug 2025 01:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754184553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9I1nhSskMx/90fgwlt4OS2fl7bhRiEu2Oepp9ISEBsg=;
	b=Hlo+rA47lfVJLQq6WqBgDn97X25NJJzO7Ro2IRFWWkCZpDT8cXYLq6P4E88UX00JVxJkaM
	Totv1zw8sPKX9z2uCYqf4tNg0LXxy8GC3V9RDnieuQWgp298jist1kFnFopmmJ3QIV3v7P
	Ojog1j+aoPxa5twi8C2vPpUfdduthbdUw6MRlITD0HpgIQjnvbhu96Nby+3bDOnN0zH810
	CyiPuqH7Hy/C5Vu4foTU2wTDY6kThFrT+SVN/psUiFFzJSjxNs9WEPFVekCmNxahYGlUmt
	W2gtc9asGM8AvVJQQDbyG5Dxnvum40NfkTzOCWxrMVDYNS/sV2sGkKWcaxQWew==
Date: Sun, 3 Aug 2025 03:29:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>
Cc: Joshua Kinard <linux@kumba.dev>
Subject: Re: [PATCH] rtc: ds1685: Update Joshua Kinard's email address.
Message-ID: <175418454413.2373432.4430474295088591218.b4-ty@bootlin.com>
References: <20250721170051.32407-1-kumba@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721170051.32407-1-kumba@gentoo.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdekudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhumhgsrgesghgvnhhtohhordhorhhgpdhrtghpthhtoheplhhinhhugieskhhumhgsrgdruggvvh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 21 Jul 2025 13:00:51 -0400, Joshua Kinard wrote:
> I am switching my address to a personal domain, so need to update the
> driver's files and the entry in MAINTAINERS.
> 
> 

Applied, thanks!

[1/1] rtc: ds1685: Update Joshua Kinard's email address.
      https://git.kernel.org/abelloni/c/bb5b0b4317c9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

