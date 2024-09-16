Return-Path: <linux-rtc+bounces-1995-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEE97A23D
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 14:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6AF7286F91
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 12:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE697156F3B;
	Mon, 16 Sep 2024 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CW58NGkS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D713DBA0
	for <linux-rtc@vger.kernel.org>; Mon, 16 Sep 2024 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726489507; cv=none; b=J7qGpDHpoeKVItZdNMveSRk9S3WSfvhfYg8fTzYRHEXp/QFdJW/TNH6n3YDT+zl6S8aU/m2q/8UT6klPLjQNZwuU+GHPFVvA/i4wk6jBzw/wTXokkfPstdKxSlju7g5L9a/N+ZTBbXG3KUF/8aMZ1KRu+9t3YjbNgRtdvjt8Nh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726489507; c=relaxed/simple;
	bh=SPnD3RvAPtVOEVrDrD+aiFawOqWU8C66/fKxvB+0WFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNmJi7EOBLB2Y3Gst9B9XX+FaWI1GMEpS+Pqc7078HoRFiAuUaXlWIjtBPIJT50jdSd/Xrj4o0SKjhnClGI65NWZDqJAHi50RuvTVuEVdlfS4/+ZIFapU6fuQAdkg5vlhpiUNjgvhAMssDXdMBnlDIxitOmydC5pJMyeyWcumj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CW58NGkS; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1168224000E;
	Mon, 16 Sep 2024 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726489497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1eM5HL1our5CzIrBZnK/imY8wGAB4RNhuKwNPR6sSrY=;
	b=CW58NGkSSusfsLPmaOJairjmIYIJJb9IFEYpytXYI3g1OEAYkKtPTTAvc5xkTgCNI13JPS
	XRsw34L13mLjPnkQIw+MlW51ia2xUxMLbW7YSboWOem9wY3MyUbPn4/j2ETWbcXgkoHOR2
	LJ0fFtEHo1JVbb8zmmBS8hqsy2FuUqELoCgOj+d+c8QJpZwzDMbKSRpSQ+ii/iXli1yrMK
	TmxwcRAXBXi3G3bee2wx9idHhBacpREAl8csu93t1+4BWf6ouYLrvpgUYUFo0y9eKPfTZy
	xA+giWLh/onrcQV6fatG9lluRQ64syhN7I8x11hYxAQuddGKzrcq4XKN2Vai6Q==
Date: Mon, 16 Sep 2024 14:24:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Nikulin <pavel@noa-labs.com>
Cc: linux-rtc@vger.kernel.org
Subject: Re: Re-enabling EFI RTC on X86 for modern systems
Message-ID: <2024091612245674417535@mail.local>
References: <CAG-pW8EGsxV85J+QcP4yKnngutdPoMBGWNN8LnAM3nU+7DKPnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG-pW8EGsxV85J+QcP4yKnngutdPoMBGWNN8LnAM3nU+7DKPnA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 11/09/2024 03:58:49+0400, Pavel Nikulin wrote:
> Hello,
> 
> I noticed that EFI RTC was disabled on X86 really long time ago due to
> Intel reference firmwares coming with broken EFI.
> 
> I edited the Kconfig to enable it, and see how it works on my laptop
> (AMD HX370). I can confirm that it boots well. I have not done any
> more extensive tests than that.
> 
> What do you think about re-enabling EFI RTC behind some expert config
> flag, and ask more people to test it on modern X86 hardware?

I don't mind do that, I believe the issue is that this is going to break
the users that have a broken EFI and rely on CMOS. Please copy the x86
maintainers on your patch.

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

