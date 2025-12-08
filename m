Return-Path: <linux-rtc+bounces-5510-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED3CAE470
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F84930517EF
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5412C2E2665;
	Mon,  8 Dec 2025 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ga+j6OHg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F3217659
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231745; cv=none; b=pTQZOgj04OItdrFnKj6ICYuwJpW0qUSS7uoH8zYbfP55rldX9OxPU8hPcKfS47xFenpGGZmh+aG8OBxuLDPybi1QVnzcTV1Aa7DtFbA7QxhaLL2su0fHJc4Is9Tkem4wYNfh8SDmMa+u6Qo3hjTpsUVF3/KJlFNjXZNx+h1YN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231745; c=relaxed/simple;
	bh=DUqRli0nxSti2hkeyVHxCVSXpcipRk9bFxGZ4j9Pqss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4PG4askIoVojv8hxdSWaiDQzfId0WNqjjWo4bJES7SCs7gzFMdNNqOeq5NkV4h6Tcs+sUciHslLibnRArcYmJWdrQmLIDGIr5n6rkIbwywRB5xwTMMYRlMsF0WibubaCQDKiab+HKcS9RXx653fYFZn+ajYpGffTdhPAvzfcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ga+j6OHg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 814AF4E41AF2;
	Mon,  8 Dec 2025 22:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5767C606DD;
	Mon,  8 Dec 2025 22:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3068B103C8E29;
	Mon,  8 Dec 2025 23:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lvs4pRLHDrzl0zfJuB5oUtLIpOt8kqAlRKlem7ApBJ4=;
	b=Ga+j6OHgGeFcquoiwCI5Am3F218oBBicgyW5/o+Ic2xqO7tTj+z6wO27WYnHCIcI14Ffx+
	FD1QeDazr3bsgXW91SPARFz/O4AHnUk6ixoARwr5om9PzGbmIaBSqlJF1Pkpk0RmE6cbVY
	UC97T6GTRGtFn4KXUFenjmRGRT5CM+QC9sW7obNeWg9KriAM92QC+ALwwCx8UckFUZZFGg
	vPBG+XH0BoKGQR/GGOJmMLGX7BSPK8qfEsLsm7++hyDABzujfKCa/4/8UO8ooCFbbm6O68
	qNTUeJtH0iJj2RL4ud0veZYz02WC/9DxSl8mFAQ25TTxNEexzRlECsCYecliTA==
Date: Mon, 8 Dec 2025 23:08:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: CL Wang <cl634@andestech.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <176523152356.342815.6072782957739777163.b4-ty@bootlin.com>
References: <aRxPGBEX8hbY6sjV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRxPGBEX8hbY6sjV@stanley.mountain>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 18 Nov 2025 13:48:56 +0300, Dan Carpenter wrote:
> The "atcrtc_dev->alarm_irq" variable is an unsigned int but it needs to
> be signed for the error handling to work.  Use the "ret" variable
> instead.
> 
> 

Applied, thanks!

[1/1] rtc: atcrtc100: Fix signedness bug in probe()
      https://git.kernel.org/abelloni/c/159a740c768e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

