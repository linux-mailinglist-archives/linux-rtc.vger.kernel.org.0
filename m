Return-Path: <linux-rtc+bounces-2257-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CD9A56A4
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Oct 2024 22:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C931C20401
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Oct 2024 20:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B193195980;
	Sun, 20 Oct 2024 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wi7nbFOF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4871370;
	Sun, 20 Oct 2024 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729455516; cv=none; b=YoTATxVdCkWq/k5oKcwugNDntaY8n6OZ5vzbRFFFHPDnGNPSC/+VOd0e42E+YABs7/vUrQvS/06tvP2eL4TFDNzF35bkNsQn/2dmr1FQegP4DHzqZs6S4mVjRYDEnA76wbpxRo4snywheewr58Uu0zV018+2QtzrLonZNOB1DuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729455516; c=relaxed/simple;
	bh=27WFFzbfZyuvWFBvD9ko+uizz7ObjM0eHbyWqMCOylw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kde8Y9Mzpf7fKxXFx2ryygeLGJNCzBXsPyGIHnAn4nLRby0/ekP2I4eh1e1gw9hytiLe/RQFNq2xue59i/L/bq/in8BTdQpJP1Fv/Q2d38jm6Su3kbjZkaf2Pg916fISSQzDgTs7eccgIp6SSOz4SyHkhCEtIZhB3IUcDrgbG2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wi7nbFOF; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 316BE60003;
	Sun, 20 Oct 2024 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729455505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+YMkIV7G+tIEF7UwEOL6emuvE8Bb3D+dX0suFbitnY=;
	b=Wi7nbFOFYg28AwUmtq9qVJ/NvPVe6GAlWCTU7KgZ0O8mUgRoQF/qdkxXDU50nYG403Ap24
	nN0jmUPLF9RqMLycN9xPVnpAUE79RrnSHIsFGUY6vx5VpuTZD8BrBK1vKpgPDCDBggE4WF
	8tFWcCAKNGE7SGPVhCdY6zFgR+hV5brdWFya4nl5h60O/JUAJ3wZtCa9A1MHKFHL+uc4Y1
	7c4xwEMiGBJomq7VwBowRQuYeWS3syYnSkVZfLFmTHQlYS+UsFjxuLWROhJ/zCAAJadbIw
	WLmC0jHakXIritgOAxddQQNBNtW0AOAHMGhgwH2EoD6CMWj0MvTd5UMMlwAe3A==
Date: Sun, 20 Oct 2024 22:18:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Palmer <daniel@0x0f.com>,
	Michael Pavone <pavone@retrodev.com>,
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century
 bit
Message-ID: <202410202018247178e729@mail.local>
References: <cover.1727925802.git.fthain@linux-m68k.org>
 <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
 <20241003081015363ed024@mail.local>
 <10bb949d-07f5-5cea-b658-8969b5bda6ae@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bb949d-07f5-5cea-b658-8969b5bda6ae@linux-m68k.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 05/10/2024 14:23:28+1000, Finn Thain wrote:
> 
> On Thu, 3 Oct 2024, Alexandre Belloni wrote:
> 
> > 
> > ... while you are it, can you use m48t59->rtc->start_secs and 
> > m48t59->rtc->set_start_time in probe instead of offsetting tm_year in 
> > read_time/set_time so we can later use device tree or any other 
> > mechanism to extend the range?
> > 
> 
> That didn't work out as I'd hoped. I booted a patched kernel (diff below) 
> under qemu-system-sparc64:
> 
> ~ # for yyyy in 1970 1971 1999 2000 2024 2025 2068 2069 ; do 
> date 01010101$yyyy ; hwclock --systohc --utc && hwclock --utc ; echo ; done
> Thu Jan  1 01:01:00 UTC 1970
> Thu Jan  1 01:01:00 1970  0.000000 seconds
> 
> Fri Jan  1 01:01:00 UTC 1971
> Tue Nov 24 18:32:44 1998  0.000000 seconds
> 
> Fri Jan  1 01:01:00 UTC 1999
> Tue Nov 24 18:32:44 2026  0.000000 seconds
> 
> Sat Jan  1 01:01:00 UTC 2000
> Sun Jan  2 23:29:16 2000  0.000000 seconds
> 
> Mon Jan  1 01:01:00 UTC 2024
> Tue Jan  2 23:29:16 2024  0.000000 seconds
> 
> Wed Jan  1 01:01:00 UTC 2025
> Thu Jan  2 23:29:16 2025  0.000000 seconds
> 
> Sun Jan  1 01:01:00 UTC 2068
> hwclock: RTC_SET_TIME: Numerical result out of range
> 
> Tue Jan  1 01:01:00 UTC 2069
> hwclock: RTC_SET_TIME: Numerical result out of range
> 
> ~ # 
> 
> Here's the result from an unpatched kernel (v6.11):
> 
> ~ # for yyyy in 1970 1971 1999 2000 2024 2025 2068 2069 ; do 
> date 01010101$yyyy ; hwclock --systohc --utc && hwclock --utc ; echo ; done
> Thu Jan  1 01:01:00 UTC 1970
> Thu Jan  1 01:01:00 1970  0.000000 seconds
> 
> Fri Jan  1 01:01:00 UTC 1971
> Fri Jan  1 01:01:00 1971  0.000000 seconds
> 
> Fri Jan  1 01:01:00 UTC 1999
> Fri Jan  1 01:01:01 1999  0.000000 seconds
> 
> Sat Jan  1 01:01:00 UTC 2000
> Sat Jan  1 01:01:00 2000  0.000000 seconds
> 
> Mon Jan  1 01:01:00 UTC 2024
> Mon Jan  1 01:01:00 2024  0.000000 seconds
> 
> Wed Jan  1 01:01:00 UTC 2025
> Wed Jan  1 01:01:00 2025  0.000000 seconds
> 
> Sun Jan  1 01:01:00 UTC 2068
> hwclock: RTC_RD_TIME: Invalid argument
> 
> Tue Jan  1 01:01:00 UTC 2069
> hwclock: RTC_RD_TIME: Invalid argument
> 
> ~ # 
> 
> 
> I'm afraid I don't see how we might avoid adding/subtracting in 
> read_time/set_time given that we must avoid messing up the present date 
> when users boot into an upgraded kernel.

I'm pretty sure this is avoidable as this is exactly what the offset
mechanism is trying to achieve. I guess the issue is in the RTC core
because both range_min and start_secs are negative which has never been
tested. My plan was to have unit tests for this but this never
happened...


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

