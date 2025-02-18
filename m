Return-Path: <linux-rtc+bounces-3222-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A1A3A195
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 16:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0A5C3A1C42
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 15:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9276023497D;
	Tue, 18 Feb 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b/OawQsc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991226B2B2
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893262; cv=none; b=oxqY146MIpvojxji4jiO4Aaie9LQ+QVOI4Vf0spnf8zD7L+0AYsEGWnb9+9+aMLYru1N0kP8qspT/J/ejJr+vFiGzbF0IlddHmJ579f4Sf3LDqJfjqPlYzaJNveC14RbEBAV4OGM0OLklXeuOHVKRtNLbnsZLaMpHtQVCx2FdhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893262; c=relaxed/simple;
	bh=f/xt7CPM36dIAkH1dF0t1a2sltYri1ZkKOYhavgEA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4uVJ9r5br4CdnQfEPasLZiR+Cc6DLBCVInsoNsQWfdAhQNWV8fJg/+fA74OXvMFH1sgUaE+iMNTMU28T7XjMW51y3wjSsONPDmVWJdjG9CmwuSM6sjDL0ZicfcPsmnD6EB/3J6o5lqTWQZe4An0D4hqVNd9uEO/vwwPx/dJRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b/OawQsc; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AB9A44437;
	Tue, 18 Feb 2025 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739893257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDP6Naed2An5mBTm7XIMx4kpHloGvgFb2CMhmAUnhRM=;
	b=b/OawQsc/xhBt7IChwpE2zXJSZsWvjc5+Y+85lHeNxNwhKJHfu+jRmbF++wCEVba5VfDRC
	wuJpW2ogyfORriuXfvzFZatQuaF6mIuBaeKEyfRrAM8TQ2hQRmEhdVmlxEhCyYety/ZIfw
	MKwZsmZ2VSeKCh7jgHvuRYHRP0Al2s+oIC+/Zwin2Ih1K1o3Rr+Kk5of/1a/bUu9nWvNjk
	RSvHINGOzm8LBBFXWk4yhGugfw9m92BbwDcts48q+xtYej2oK7jPktAoid4SOKvuZ1O180
	kX6OIOt67ujEQk9aawkQKsQlfs0I5GjyHo2GWNVVP8X6l9mj2EPl2ehe9kO4vw==
Date: Tue, 18 Feb 2025 16:40:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Einar =?iso-8859-1?B?SvNu?= <tolvupostur@gmail.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit
 systems
Message-ID: <20250218154057079fa7e0@mail.local>
References: <20250218111150.3024-1-tolvupostur@gmail.com>
 <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local>
 <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffieeiffeffedvgedtjedvhfdvheeftddutdetfeefvdelheeiveekgeeutddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehtohhlvhhuphhoshhtuhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepl
 hhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/02/2025 15:51:24+0100, Arnd Bergmann wrote:
> On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
> > On 18/02/2025 13:45:56+0100, Einar Jón wrote:
> >> Hello again
> >> 
> >> On second thought, removing is too general.
> >> But it's still very much broken. Is there any reason why this was not
> >> merged?
> >> https://lore.kernel.org/all/c5e8ab50-aacb-4651-8893-a6dd9edcd155@app.fastmail.com/T/
> >> 
> >> Any thoughts on how this should be handled?
> >
> > The first step is to convince Lennart that mandating RTC_HCTOSYS xwas a
> > bad idea, the second step is to let userspace set the time instead. The
> > kernel can't take the proper decision because it simply doesn't know
> > whether userspace is TIME64 ready or not.
> 
> It's been seven years since the you added the workaround, and
> there are a few things that have changed in the meantime:
> 
> - most distros that use systemd have stopped supporting
>   32-bit targets
> - most distros that still support 32-bit have moved to a
>   64-bit time_t
> - 2038 is only 13 years away instead of 20, adding to the
>   urgency of having future-proof default behavior.
> 
> I don't know how many 32-bit machines are affected by the bug
> where they return a random time, or if they are more or less
> common than in the past.

This is going to break some of the Marvell board that RMK uses because I
guess he is not updating his userspace.

Also, I'd note that OpenEmbedded switched to 64-bit time_t by default
just last year.

I'm not against removing the workaround but keeping it doesn't actually
break anyone, it is still possible to set the time properly from
userspace as it should be done anyway so I'm not sure about the urgency.
The impact is mostly about messages timestamp in the boot log, before
being able to run hwclock or any similar tool.

Or am I missing anything?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

