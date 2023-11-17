Return-Path: <linux-rtc+bounces-316-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D363D7EFBA9
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 23:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2300B209CB
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Nov 2023 22:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D12819BDD;
	Fri, 17 Nov 2023 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fq8Lowh/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E26194;
	Fri, 17 Nov 2023 14:57:06 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7899BFF805;
	Fri, 17 Nov 2023 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700261825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9KIy9DRblNLZwax2uMtws630q6MOKJ/pwNRzyK1MdoI=;
	b=Fq8Lowh/99UyB7YM1ExHUkOftLjtP7TTmQ++3NOmeVWQ5Uh+/BrC6mIfIsO4W6yRimcXOR
	LtqqitqzyO4pHkgBk7VjX6NQzLxAB1MYWN9f75PjpYmmrWvFQCtun/HVYmL0pvg+3Fm9pu
	DJc2hAM7W0kt/7qRIIC1Z7PTRpuoVcQA6lkdIswLWIqmNhzL+Pe+qFfjXmQWXKstEmHRcq
	59aX4sHbZqcmml3Vs1bQXuZb2tVzc+9sf2vkaNzMvY6JAx8tIB2qUK3KFpR7fLdp2cnooC
	WEQjeMzsOBAeKy3P2tyjDfdQpzZlGKT8PMGM1pyefXyL6/2usozYW0kHAAdvcw==
Date: Fri, 17 Nov 2023 23:57:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Pavel Machek <pavel@ucw.cz>, Alessandro Zummo <a.zummo@towertech.it>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, alvin.zhuge@gmail.com,
	renzhamin@gmail.com, kelvie@kelvie.ca,
	Raul Rangel <rrangel@google.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
Message-ID: <2023111722570552652970@mail.local>
References: <20231106162310.85711-1-mario.limonciello@amd.com>
 <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
 <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com>
 <20231113223819fb469198@mail.local>
 <ZVM4nFaDTwrKMr8K@duo.ucw.cz>
 <2023111422283827b2a3f2@mail.local>
 <5029e355-6fe8-4d48-9bc3-20256adfbdb7@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5029e355-6fe8-4d48-9bc3-20256adfbdb7@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/11/2023 18:15:02-0600, Mario Limonciello wrote:
> On 11/14/2023 16:28, Alexandre Belloni wrote:
> > On 14/11/2023 10:06:36+0100, Pavel Machek wrote:
> > > On Mon 2023-11-13 23:38:19, Alexandre Belloni wrote:
> > > > On 13/11/2023 15:36:28-0600, Mario Limonciello wrote:
> > > > > Now that the merge window is over, can this be picked up?
> > > > > 
> > > > 
> > > > I'd be happy to invoice AMD so they get a quick response time.
> > > 
> > > That is a really bad joke.
> > 
> > Why would it be a joke?
> > 
> >  From what I get this is an issue since 2021, I don't get how this is so
> > urgent that I get a ping less than 24h after the end of the merge
> > window.
> 
> It's possibly longer; but I don't have a large enough sample to say that
> it's safe that far back.

Would this help this one:
https://bugzilla.kernel.org/show_bug.cgi?id=68331

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

