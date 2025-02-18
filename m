Return-Path: <linux-rtc+bounces-3225-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67656A3A30A
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 17:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D0E4167514
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Feb 2025 16:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B1726E64D;
	Tue, 18 Feb 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YOk1bZcz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B85D14A4E7
	for <linux-rtc@vger.kernel.org>; Tue, 18 Feb 2025 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739896804; cv=none; b=pGLhHg3W7hafaEKsbERi6/LVWFjLTSP25omxHnMhGTgyROgxLuQ3A5nllk+IuX9HWO6NzhEdKUgq08yF7Xeq/LvpJYXsj4atw7yGZBybsmWoiT/eZhRYhhLRNhHno7PvenUwFq2OK8JX2rgLyMaB7XI/FPIOicRwa5m2teT4QKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739896804; c=relaxed/simple;
	bh=xrQc+cTTEzAmqBHMcWiynKj6h6a9VWnRWZBuaoAgSxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSf03znNQIkAD87MnIkZdjS0rmQD+O1PjjCqVOdSSUFMpw+K9eml33Qpc7Gwk0TRvj/7WYHWhUURowyGSojPX0VTJo0ldkv/fcgl4ZCzPlwfYTVkEdZkJEyOQRmMKWAyx9cMKkdHbyh2a4o8zlEbErST3l8Nt20/NDj4OrjVIHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YOk1bZcz; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4986C1F764;
	Tue, 18 Feb 2025 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739896795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=144uIlwzD9sGybaq+rcaV+3RP8LdLmOlj0rCiW7nBRg=;
	b=YOk1bZcz051n36l4peQ9WcwAGhiDu+QqcVpy3sycIJM6cw49+Y1uc/2AIhxY6nipOVF9cO
	t2f008LVdVegpQX4yN1cKN/1FjrK+vjMtnveHI+NZD1/NGnH7ahtHAuv5Hdm66BXQna7Hj
	xQbLZKXk9MOF9Ls3a6lvXoJ3cM9d0SZr/Rc4xtLMcajTMLMsTYKUEp2WKq422suXDF8FHZ
	HsDsuheGFNbTnvigo2mC3v5OLKoXN3j+umnzZGuZq6Hckv1FgeY5eA8Yh3GEhrFkW+7FEM
	Zekuxtu4zuVm4SvJYUZlKNmAxnN9IMesaFueQOkwKVMwI0fNL1+0ywEGfyNg+w==
Date: Tue, 18 Feb 2025 17:39:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Einar =?iso-8859-1?B?SvNu?= <tolvupostur@gmail.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: class: Fix max epoch in rtc_hctosys on 32-bit
 systems
Message-ID: <2025021816395435e28cd7@mail.local>
References: <20250218111150.3024-1-tolvupostur@gmail.com>
 <CABhNV21ZptxH9d4NyPo1xivS0GAXNsoLMLpPSRAsT8h5CX9hDw@mail.gmail.com>
 <20250218133039de7b063d@mail.local>
 <8163c8e0-58d6-44a9-a5a2-6478fe4b0ff8@app.fastmail.com>
 <20250218154057079fa7e0@mail.local>
 <baebf0c3-22e9-4b3a-9955-ed27fba708a6@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baebf0c3-22e9-4b3a-9955-ed27fba708a6@app.fastmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehtohhlvhhuphhoshhtuhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgv
 ghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/02/2025 17:05:23+0100, Arnd Bergmann wrote:
> On Tue, Feb 18, 2025, at 16:40, Alexandre Belloni wrote:
> > On 18/02/2025 15:51:24+0100, Arnd Bergmann wrote:
> >> On Tue, Feb 18, 2025, at 14:30, Alexandre Belloni wrote:
> >> 
> >> I don't know how many 32-bit machines are affected by the bug
> >> where they return a random time, or if they are more or less
> >> common than in the past.
> >
> > This is going to break some of the Marvell board that RMK uses because I
> > guess he is not updating his userspace.
> >
> > Also, I'd note that OpenEmbedded switched to 64-bit time_t by default
> > just last year.
> >
> > I'm not against removing the workaround but keeping it doesn't actually
> > break anyone, it is still possible to set the time properly from
> > userspace as it should be done anyway so I'm not sure about the urgency.
> > The impact is mostly about messages timestamp in the boot log, before
> > being able to run hwclock or any similar tool.
> >
> > Or am I missing anything?
> 
> The main problem with the current approach is that it suddenly
> breaks systems in the future (at the time_t overflow), which is
> the opposite of how the rest of the time_t conversion worked.

Yes, it will suddenly stop setting the time on boot which the platform
can (and will) survive because it will probably then start NTP. However,
without the workaround, systemd will just crash on boot, bricking the
device. So as I see it, on one hand, I have mostly recoverable breakage
and on the other breakage that mean going on the field and reflashing
the device because the system will probably not be able to do any OTA
anymore.

> 
> We now have distros with systemd that advertize support [1],
> and we know this breaks every single machine they run on that
> uses an RTC to set the time.

No, this breaks systems that only rely on RTC_HCTOSYS without a
fallback.

RTC_HCTOSYS alone is anyway pretty bad idea and no one interested in
time should use it because it can be off up to a second which can take
4 to 7 days to resolve by selewing and not stepping. Anyone serious
should use hwclock or similar to set the system time precisely after
boot so the offset will be closer to a few ms.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

