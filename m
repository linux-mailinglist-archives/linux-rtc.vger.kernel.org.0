Return-Path: <linux-rtc+bounces-5794-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70037D3BBB0
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 00:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60AA63034FB4
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 23:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71B01EA7CB;
	Mon, 19 Jan 2026 23:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ikDtSC0A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645250096E
	for <linux-rtc@vger.kernel.org>; Mon, 19 Jan 2026 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864663; cv=none; b=Ql5NXOMT0wW97/yPMyrjE+hEg5YGlfIgb4Fphtk2S5KkEO51SDsE+ggSVdlkEYigS6zjLpegpO4ZY175BouaIJMu88bIXnnzsy7rMEAoFJZS6+oc96z4ZIb5PKSBCtrke2n9ELmlfsJsBIH4Msgn0ycj4tNlAw6Aa39cWzJvor0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864663; c=relaxed/simple;
	bh=RjK/Jl82HlQrFiPImt20SWh5Tf5SSvhmsQ4rIoe2Vto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+RJc16iBYR0CcsIFBhSQ871uIX//Fgm6L8N/l87ulr5LLUw3a0i/Ey1i8etzLA6qTOkZ0ZeL96fssAIFJKzXm+hYqmU11kQAUQGmysj1GExKtzdmfNkIZvYCVe/lMYvm0S1J1Bod5HPl1teSqr6+iLrFE0k5NbWm1Pc13FWbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ikDtSC0A; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E28F8C214DD;
	Mon, 19 Jan 2026 23:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECAA560731;
	Mon, 19 Jan 2026 23:17:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D07E10B68D31;
	Tue, 20 Jan 2026 00:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768864660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gfuuk5Cw1ooUIHMBZYvvWR42y3Lv84nlLOXzrMLrL4k=;
	b=ikDtSC0AdzsMxr1ViYIit2BpiffwkwPLBROmHuUe1e6ls3DfNYE55jJjmnxCmb+d5zNaVl
	KBR9ep/CvkJpsk70hnsgf449HHfJoXWhd4Or3MBWJ0pRd351X6+sb/Yi6RiHF6Ko1n5DnS
	BDolWb4RToHqx26uXHObgEcUhP59nPGQHCgfVyABv8VlWRMXLiee5036EuwBnsx5c64wg7
	tCW3+pd9yY2q0jSKESHO+oP6mctu7+ymsF+QNTN0zgbpryEe+Mwgs3KAccdRn3M4jb5bMt
	dvzqO0psDuNPs8IzmfRypPId3bjbb+edoipFPmG722tIHgMPpFwsSM6LSXU6YQ==
Date: Tue, 20 Jan 2026 00:17:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
Cc: Shubhi Garg <shgarg@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] rtc: nvvrs: Add ARCH_TEGRA to the NV VRS RTC driver
Message-ID: <176886462034.2629875.11478192607776161790.b4-ty@bootlin.com>
References: <20251222035651.433603-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222035651.433603-1-pbrobinson@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 22 Dec 2025 03:56:48 +0000, Peter Robinson wrote:
> The NV VRS RTC driver currently is only supported on the
> Tegra platform so add a dep for ARCH_TEGRA and compile test
> so it doesn't show up universally across all arches/platforms.
> 
> 

Applied, thanks!

[1/1] rtc: nvvrs: Add ARCH_TEGRA to the NV VRS RTC driver
      https://git.kernel.org/abelloni/c/f9ecfd9bfedb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

