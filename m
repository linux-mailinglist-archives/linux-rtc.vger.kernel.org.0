Return-Path: <linux-rtc+bounces-2897-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EDA0C469
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 23:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A700A18897B5
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 22:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F227A1E9B13;
	Mon, 13 Jan 2025 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ql8266XP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C341C3C0D;
	Mon, 13 Jan 2025 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806210; cv=none; b=hori3P7Su7FohjrciVvpB7lIWvbTz+JgWiVV0LgiVr6XSHMlF/UUUSZvYisfBdL1R+6p8xP2brbGLldO4kmAvbl1ncU2fNvgDTMVpSfPHd07CNuSunjp1Ga4d06BiOPv+K/QZihkR4HTpGnl5BDZJ8Wzz8adYZgfso/tRHS1vPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806210; c=relaxed/simple;
	bh=xm/wqELNd1UFmDO87Vp0rm/+OA+YJ4ZTdl5OiQs4Kaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuFmHOpaIPXYnX1vVQF6LvLaDwAxqCysuO7TMX9jIGmjdjXplEsvPeaJuCk9MG2jkanGr+t+4fmgI3tzDZgxzhS2Uk6TdeJd85S8qAz1n5s7dw7AtoviG3D+7JbBEMSwyU4JQDCD0E/Ks+1nOgD5OghZFmy2KlU+G/ces/DcFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ql8266XP; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A9AA240004;
	Mon, 13 Jan 2025 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736806206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9lpEum+UVM5PLRHz8fJOxbMX/DUVH4Rmv5D3rZTKhI=;
	b=Ql8266XPikUkLR0VJLt5/s+Al8xLEdiJk5VVX/cvmnFh2vxnTsUx6RlMDssCP4xtCBT66G
	GcKrQ/hlouke4aWT4NZBaxtWeJtdTi5v7k1Ro1lnuOfS6QCHJKAz3ngCL81lZB9mQERxxF
	tqsKqfDofvXD/TVne3QWNGME54p13S/Yzf+ulnTiYsJXcxuIcOYtPaXvNvHDwYHrTSsnAq
	XKrAvdtE+mSkIwVK3SyEeQ0oPL/epMXqgS4t2Ok5RSXyEEK5TOdWM9/ukxO95h2Zjd38dX
	LLK95RxP0fzFP3wgDNTme024psS04PpraJvpOGxL0LRgNFDhVp1TBUpB9O+EHw==
Date: Mon, 13 Jan 2025 23:10:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: bp@alien8.de, mingo@redhat.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, linux@treblig.org
Cc: x86@kernel.org, linux-rtc@vger.kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Remove hpet_rtc_dropped_irq()
Message-ID: <173680619784.1569360.16053638472676619467.b4-ty@bootlin.com>
References: <20241215022356.181625-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215022356.181625-1-linux@treblig.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 15 Dec 2024 02:23:56 +0000, linux@treblig.org wrote:
> hpet_rtc_dropped_irq() has been unused since
> commit f52ef24be21a ("rtc/alpha: remove legacy rtc driver")
> 
> Remove it in rtc, and x86 hpet code.
> 
> 

Applied, thanks!

[1/1] rtc: Remove hpet_rtc_dropped_irq()
      https://git.kernel.org/abelloni/c/58589c6a6e9e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

