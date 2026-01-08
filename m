Return-Path: <linux-rtc+bounces-5704-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D7D0367E
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B09493010543
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C5399A6E;
	Thu,  8 Jan 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zEOCgo3p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015384D4F97;
	Thu,  8 Jan 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880900; cv=none; b=uVT55GR1Q2jTlF/m+l+QXrcGjEmS8JdGOhq2zO9c9QUhLUqLLC90I6j/GTPfs7iiNzwLUErXhKON5429ShGEyOOxFH+IW/ASEZTTEvzJBZek9NyBuOgYKC+o7nb1h6RagApfYUWVOaC1/0CSGD0TeFakG3x1iwp4rHksai52YjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880900; c=relaxed/simple;
	bh=9LRcIjcJobOLmVJdYm+PQfiI989ZcTD/UWNYjem3eu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR8pp/8UznysByzB+I27NypnwysOraAArPUXVdmScQ/RyVsl7mDmD2PGG6eSCijXZYkcHlajye4z0uAg5/0Mneyf9rLIVNcFW+oBH1dhvll/IAaivEF32oL7EA4pp0DWsPo88DIRCqCLbKzGMEn2mD6c44RNRHBU7OL5ihns9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zEOCgo3p; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA38BC1ECB3;
	Thu,  8 Jan 2026 14:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9DB3606B6;
	Thu,  8 Jan 2026 14:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13A96103C8867;
	Thu,  8 Jan 2026 15:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767880895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=O52h1yOplH3UsV/WLhX4RkBxV5Zoz7l6qXxGiBG0oxY=;
	b=zEOCgo3pA2N8/voWQPyW/7lf+I8ZNFnGEmz0Lj5cCYhEdVEULNREmYSaf0+30o+qmep2Mu
	elYHN40x66GsLYJJcTf87cDDWPkUGqvVP0PbGkaks+nytNW/+C1RXPvo8FkPbW92zxxATW
	cJ52PjQqp8Weh6tgFFLR5UmJXjhKHyNVZ2qNmx+CQ0f3A08eGhgV5RMNWVJ8H3vRY9gvWi
	FFj2VCGLIvTRxXWw+KsVKuODc5Fx3tBDg6ajIptNMzwzELc+T++WiQxBYpqCgmD78spLqV
	4kSNaxEF0hGcs2+yQYL98i14zmN5M3JLzx48SiFCmQNboifS+hQ3R60rTWcxnA==
Date: Thu, 8 Jan 2026 15:01:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Message-ID: <202601081401239bbfff9d@mail.local>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On 08/01/2026 14:52:08+0100, Danilo Krummrich wrote:
> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
> >
> > On 1/8/26 19:12, Danilo Krummrich wrote:
> >> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> >>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> >>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
> >>> --- a/drivers/rtc/dev.c
> >>> +++ b/drivers/rtc/dev.c
> >>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
> >>>   		}
> >>>   		default:
> >>>   			if (rtc->ops->param_get)
> >>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> >>> +				err = rtc->ops->param_get(&rtc->dev, &param);
> >> It would make more sense to just pass a struct rtc_device than the embedded
> >> struct device in the RTC callbacks.
> > I considered passing struct rtc_device directly, but chose &rtc->dev
> > to minimize changes to existing drivers, since most callbacks use
> > dev_get_drvdata() on the device parameter.
> 
> No, you should not expose the embedded base device. For accessing the private
> data you should add helpers like rtc_get_drvdata(). This is what other
> subsystems do as well, e.g. [1].
> 
> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371

This is not a correct example as i2c is a bus, just like amba is...
Actually, I don't think the rework is necessary at all or this would
mean we need to rewor most of our existing subsystems.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

