Return-Path: <linux-rtc+bounces-306-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D827EB954
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 23:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170C81C204D6
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 22:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05432E844;
	Tue, 14 Nov 2023 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UgY+orYp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520B22E83A
	for <linux-rtc@vger.kernel.org>; Tue, 14 Nov 2023 22:28:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C70C2;
	Tue, 14 Nov 2023 14:28:40 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CE91E0003;
	Tue, 14 Nov 2023 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700000919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEHoD4WBpLlbQl7puiOVvg50WEg0c6JhbpPtiVhKgls=;
	b=UgY+orYpDy2L34IqxwH4o51lCKj0h0+vDd/b0aBaHwQYqnCxh2d/vrfkjxnNC/dt/KoreK
	lhjkQnTw7+CJ9dwmkJ8lE+84tYdMbgf3jVFQZjyzEu0RptiKoP3MTGeA3JZ444HEVo03Wk
	czewxPJexNhl07K5BnDjh/7//aMQS2WCNQnoLMyoB3RZ5GvnK79LwxOkjGuDZzNGsmGOQm
	TUoXsDkFsiiU4Qm1YO32ygBv3R6xKgaY8xHozwCyadntw+j+XVSyudU5H4RLYcRWylNI6O
	B0Wdv6+Cz8bdY6AOy0DoKFyjPzivIVxRlJ9DMRFyabNuTjjvN5s1meNxDseoTA==
Date: Tue, 14 Nov 2023 23:28:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, alvin.zhuge@gmail.com,
	renzhamin@gmail.com, kelvie@kelvie.ca,
	Raul Rangel <rrangel@google.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
Message-ID: <2023111422283827b2a3f2@mail.local>
References: <20231106162310.85711-1-mario.limonciello@amd.com>
 <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
 <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com>
 <20231113223819fb469198@mail.local>
 <ZVM4nFaDTwrKMr8K@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVM4nFaDTwrKMr8K@duo.ucw.cz>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/11/2023 10:06:36+0100, Pavel Machek wrote:
> On Mon 2023-11-13 23:38:19, Alexandre Belloni wrote:
> > On 13/11/2023 15:36:28-0600, Mario Limonciello wrote:
> > > Now that the merge window is over, can this be picked up?
> > > 
> > 
> > I'd be happy to invoice AMD so they get a quick response time.
> 
> That is a really bad joke.

Why would it be a joke?

From what I get this is an issue since 2021, I don't get how this is so
urgent that I get a ping less than 24h after the end of the merge
window.

This touches a driver that handle a gazillion of broken x86 hardware
that I don't know anything about and as soon as I apply this patch, this
becomes my problem so I need to be careful there.

On the other hand, I need to pay my bills so actually, yesterday I was
actually looking at the patch but got interrupted by a project that
ironically involved the radeon driver not working properly in 6.5.

So no, I don't actually expect AMD to have to pay to get me to review
and apply patches but at the same time, they can't expect me to
prioritize their patches over projects that pay the bills.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

