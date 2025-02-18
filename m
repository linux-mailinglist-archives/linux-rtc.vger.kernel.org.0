Return-Path: <linux-rtc+bounces-3220-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25872A39DA4
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 14:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A33531897855
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 13:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A3813E02A;
	Tue, 18 Feb 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aaan416f"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58361FF2
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885450; cv=none; b=c57kKSAYO+DURkLIRppjiThLG3Zctaf+NGVgrSG0EJzUm89M+bVDhEg8deo0gq1A5abU45kvjoIW5/NLZjAmULCjuyc2jVHS5ddeVbH9jD3GzCxfeUbQ0sFkEZUi9ScmRVsuZ2KaW22Da3o0+VvN3ffw5ap2eHYUTsuw3O4fWc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885450; c=relaxed/simple;
	bh=PpDaBI5OcN5GQpnzxzYKN7yXOsLS9lm3uWtF3cbPBDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1pHMrCcn3p3SSQGjx4CyjbnYg+o/AU1gpj89NfN7PdhrlOysnY+UInYsGujZm23pVatEgue2p9V0COvKmVAiVIbINtPXUu/tZG7x4rx1uzAlQWZhzhX2/6VgOO0V3HQlKXdL4+DjPwoxOKNS4T691TVITGT38HoKrEii80V/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aaan416f; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098184442C;
	Tue, 18 Feb 2025 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739885440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yw9Dbu4RVAj2MPZLUdRWwk0iGbC8iriDFt5lPwWWmb4=;
	b=Aaan416f6Jz058Dr2wRo+LL3iPacfu0qGgTFYeJPSnni0VHfeKwbttFcZMnpeZXRcltYkF
	nkspsB7/f8lv08G5nKbLDvfHytxMjJ2W5VFWjLHeIAiPs7/OXjoePLwxp8OV/lEMTexHyu
	F6+7gCtfLZG4YykrKw8DSf4Ee0fT2V5zxe7gK9qVsclrb8624AYTJdgq5A7OVaZr0PnRhm
	yKDvTRPw3prOzajJlvQmwBdqokj0JQuJB6w0te+DPQ2T00oG+XBzGEnSPwKyF80cdQhJQ1
	y2uIkb7CHiSKOxI6tPK18uMRMBVrr09xJ0SbNKN/VMY+jJ8KK0L6EFZZTtGs7w==
Date: Tue, 18 Feb 2025 14:30:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Einar =?iso-8859-1?B?SvNu?= <tolvupostur@gmail.com>
Cc: linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit
 systems
Message-ID: <20250218133039de7b063d@mail.local>
References: <20250218111150.3024-1-tolvupostur@gmail.com>
 <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffieeiffeffedvgedtjedvhfdvheeftddutdetfeefvdelheeiveekgeeutddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthholhhvuhhpohhsthhurhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/02/2025 13:45:56+0100, Einar Jón wrote:
> Hello again
> 
> On second thought, removing is too general.
> But it's still very much broken. Is there any reason why this was not
> merged?
> https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app.fastmail.com/T/
> 
> Any thoughts on how this should be handled?

The first step is to convince Lennart that mandating RTC_HCTOSYS xwas a
bad idea, the second step is to let userspace set the time instead. The
kernel can't take the proper decision because it simply doesn't know
whether userspace is TIME64 ready or not.

> 
> Best regards
> Einar Jón
> 
> On Tue, 18 Feb 2025 at 12:12, Einar Jon Gunnarsson <tolvupostur@gmail.com>
> wrote:
> 
> > The check for BITS_PER_LONG == 32 makes no sense after calling
> > tv64.tv_sec = rtc_tm_to_time64(&tm);
> >
> > With this check, any 32-bit system will silently return an -ERANGE error
> > instead of setting the correct time if the hardware clock is storing a
> > date after Y2K38 (2038-01-19).
> > Without this check they should all work as intended, since the rest of
> > the function is perfectly 64-bit safe.
> >
> > Fixes: f9b2a4d6a5f1 ("rtc: class: support hctosys from modular RTC
> > drivers")
> >
> > Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> > ---
> >  drivers/rtc/class.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> > index e31fa0ad127e..df58edf99ed3 100644
> > --- a/drivers/rtc/class.c
> > +++ b/drivers/rtc/class.c
> > @@ -72,13 +72,6 @@ static void rtc_hctosys(struct rtc_device *rtc)
> >
> >         tv64.tv_sec = rtc_tm_to_time64(&tm);
> >
> > -#if BITS_PER_LONG == 32
> > -       if (tv64.tv_sec > INT_MAX) {
> > -               err = -ERANGE;
> > -               goto err_read;
> > -       }
> > -#endif
> > -
> >         err = do_settimeofday64(&tv64);
> >
> >         dev_info(rtc->dev.parent, "setting system clock to %ptR UTC
> > (%lld)\n",
> > --
> > 2.34.1
> >
> >
> 
> -- 
> Regards
> Einar Jón

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

