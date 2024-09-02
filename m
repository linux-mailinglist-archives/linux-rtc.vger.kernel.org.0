Return-Path: <linux-rtc+bounces-1827-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99A968ECC
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 22:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 726F81C21DCC
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 20:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7491A3AAF;
	Mon,  2 Sep 2024 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eiNxWOC5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E251A3AA5;
	Mon,  2 Sep 2024 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725308406; cv=none; b=fOETq4XXKVSQmY9pGBIOpUoYyP3AKxep0tD6BUBBwjm5wmYmIp8vRqMsRDTpGjSCzrIhGP1uJdsOVMnxsCHiRhOHkD1glhUOaaIzwURWP91ETEho+j7Xfl6vim3B0xo1yoGUMiT96tdx51Rsi/Ai6BGz2iBhFoirSaMYN4RTCyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725308406; c=relaxed/simple;
	bh=CpfGXUsaMycF4jl2l9nIICgEeKqNYaKOEAKloppFIw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbyt4y4zgh/5dp5N2nMpqFfWfKMQvw+h9zKi5Poggce0uT7to84YvQjm2wn5Jaiol7nXj/+8qiEvaTUzjAnD43JcRYSOiaFCeeeZKWvx2sxJ2ZjrY4gu8Gr0eAJazmQCnwZpFjU/fWPFViIH4ML0z8bRgtrExGXlrkMyNTLcxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eiNxWOC5; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EF2C20004;
	Mon,  2 Sep 2024 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725308396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5LLNc9i9feX+98+maMNyDk10kJ8aqshRdCfXQ8V0pLQ=;
	b=eiNxWOC55M5AEZpFSO0e8abL2V1c2pzRlSTOUG4KQeaHLtV9KJF5Ei0vXoD9LYpnqFYL+u
	2EXwfinJDj27LsxrLtLnU8XiBb08C/AIaRW0ZKkpa+x1w/i+NTpg7Ry/nRUuxpGAtkcqWd
	i14o5IJ4sr/dgMdHexG0J7ZEhBibIUqmN6l5tH6SvdR15LA3HfNA8hnKjwfwHdIyPnMJRT
	uC+KbPv9sat1yNnFgMG1SBMhuhV0TBND9jd6+NlawQlE0YmV8gpMyR/9dKIz/ypmCU8CSr
	Y+DkoZK3DQEUDBg5+YdwAcyJsh2ATkjJVxrUJzw7JeRQYjjMJDl8ajVyr+VxYA==
Date: Mon, 2 Sep 2024 22:19:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <2024090220195462df6c95@mail.local>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
 <2024082609451907fd19e2@mail.local>
 <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 02/09/2024 16:14:45+0800, Xianwei Zhao wrote:
> Hi Alexandre,
>     Thanks for your reply.
> 
> On 2024/8/26 17:45, Alexandre Belloni wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > On 23/08/2024 17:19:45+0800, Xianwei Zhao via B4 Relay wrote:
> > > From: Yiting Deng <yiting.deng@amlogic.com>
> > > 
> > > Support for the on-chip RTC found in some of Amlogic's SoCs such as the
> > > A113L2 and A113X2.
> > > 
> > > Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> > > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > > ---
> > >   drivers/rtc/Kconfig       |  12 +
> > >   drivers/rtc/Makefile      |   1 +
> > >   drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > As pointed out, this is the third amlogic driver so the name of the file
> > must be more specific.
> > 
> 
> This RTC hardware includes a timing function and an alarm function.
> But the existing has only timing function, alarm function is using the
> system clock to implement a virtual alarm. And the relevant register access
> method is also different.
> 
> The "meson" string is meaningless, it just keeps going, and now the new
> hardware uses the normal naming.

The proper naming is then definitively not just amlogic, because in 5
year, you are going to say the exact same thing about this driver
"register access is different, this is for old SoCs, etc"

amlogc-a4 would be more appropriate.

> > > +             /* Enable RTC */
> > > +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
> > 
> >                  This must not be done at probe time, else you loose the
> >                  important information taht the time has never been set. Instead,
> >                  it should only be enabled on the first .set_time invocation do
> >                  you could now in .read_time that the time is currently invalid.
> > 
> There are some doubts about this place.
> 
> You mean that after the system is up, unless the time is set, it will fail
> to read the time at any time, and the alarm clock will also fail.
> In this case, the system must set a time.

Exactly, reading the time must not succeed if the time is known to be
bad.

> 
> When read time invlalid, system is will set time.
> This part of the logic I see the kernel part has not been implemented, so
> only the user application has been implemented. Whether this is reasonable,
> if not set time, you will never use RTC module.

This is not going to be implemented in the kernel. The kernel can't know
what is the proper time to set unless userspace tells it.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

