Return-Path: <linux-rtc+bounces-3424-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDEA570AA
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 19:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5323B1893AB9
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 18:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC64224061B;
	Fri,  7 Mar 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VKjeM+T2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02519219E98;
	Fri,  7 Mar 2025 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741372703; cv=none; b=Kst/lghA8zPw36l27BKQhIDk/v5cCU7VVrdXRehwLrlq3LHbCbn9p/HgE/2BTqH8X+rehnYXwqfqVvYjZ+aG5Q0Eiw4qv1BH2Zy2mkLfiu80AF/LPbhek8S5WKlCa3ezhsZouN57ucy9mVUYhHGIJ6rL7BEcEmb2AbSTmNV0dAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741372703; c=relaxed/simple;
	bh=P1VXMPHeZZlmztuvDdaFxiTD3O/avPFmB1pPHBShE2s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCzBWrdnuhWUxwEN9aRrf8+iDutCqqT8xcCYLIvuD9/drjobWMRfBrTzj50+9OFb9F/rRdjla72z7zx8rDE1z1Lll8iGhr3wseB6TA+XxUIQdlMMAWME/Cq0SG7VMCARAOpi++Rl1cfZCQCvdtgykaEd9knlLNXBhdogefm0FqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VKjeM+T2; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBE1C44527;
	Fri,  7 Mar 2025 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741372699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2EMx0nNPXT57V1592jE/LVrbUGwVjGH9CmLQ4l8VPko=;
	b=VKjeM+T2k10gppVhl/WzoNQsZwuh67lNjI+ijY2iXzkVDiTZIyqOVY6q7R9Z4IlPgCKWDB
	B0tJKkcKvsUp04CJZiNuuaBsBRMkvKjKL0dufER4cSzep7wobAPM265cJan133lMnjoewt
	7sQhNpfmMzESz210ZjSXNVDmmVl61AAL5l9bkAT3TFcSs17W47P3P1XN3zUSskEXLddvm6
	Il0Q1Ozoss2u5pgthiFSknV+Zzm0dMR2xqZyh6KhwLprDz6USTI9gbkx0kA7v8ZZdmtmdC
	ll4+xxDpUTIG67PGk4IxyMMvkL3SQu+icuRLBJlE4FHBKA4wQLp8FjVKstAMbg==
Date: Fri, 7 Mar 2025 19:38:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <20250307183817b7747a66@mail.local>
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qYM2-LQPgIe2JE@shikoro>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddugedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtledttdduueejffekfffhffetkedtgedutdevgeelkeeukedujeevfeejudekheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 07/03/2025 07:55:33+0100, Wolfram Sang wrote:
> Hi Alexandre,
> 
> thank you for replying even though you are on holidays.
> 
> > What I'm really wondering about is the use case. What is expected here?
> > I guess that would be so you could go back to sleep between each 1s
> > interrupt? Does this actually happen and does it actually save any power
> > versus waking up early and waiting for the timer to actually elapse?
> 
> There is no specific use case and it is not about saving power. My
> customer wants this IP core fully supported. And it seemed strange that
> UIE is not supported even though there is an 1s interrupt. The primary
> intention was to support that. And my digging in the RTC subsystem made
> me think this is all handled via the regular alarm timerqueue. So, I
> added second granularity to the alarms so the timerqueue can be used for
> UIE. Giving the alarms a higher resolution was a neat side effect. What
> is wrong about that? Are wakeups from deep sleep states the only use
> case for RTC alarms? Can it not be that some other tool just wants an
> interrupt at some second? I assumed so, but actually, I dunno.

There is nothing wrong with your approach, I'm fine with the complexity
if you are ok with it. I don't think any application would use RTC
alarms as timers. The main use cases for RTCs are:

 - set the initial system time, for this UIE is actually important to be
   able to set the time with some accuracy.
 - wake up the system from any sleep mode, usually th sleep will be
   fairly long and waking up early because of the minute resolution is
   fine as the system will then wait for the actual timer to elapse this
   timer being based on the system time instead of the RTC time.


> 
> > > +		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
> > 
> > Is this message really necessary? I remember someone giving a talk about
> > how we should avoid adding countless strings to the kernel ;)
> 
> Can be argued.
> 
> > I'm on holidays and didn't reply to your previous email. The way to
> > support UIE while keeping the alarm at 1 minute resolution would be to
> > look at which timer is enabled.
> > 
> > The rv8803 driver does:
> > 
> > 	if (alrm->enabled) {
> > 		if (rv8803->rtc->uie_rtctimer.enabled)
> > 			rv8803->ctrl |= RV8803_CTRL_UIE;
> > 		if (rv8803->rtc->aie_timer.enabled)
> > 			rv8803->ctrl |= RV8803_CTRL_AIE;
> 
> I totally believe you it works, but I am still not entirely sure why. I
> have no problems following the code until rtc_timer_enqueue(). After
> then, I see __rtc_set_alarm() being used again. Does it work because the
> actual alarm time is set but basically discarded for UIE? And the next
> interrupt is just used to be the right one, matching either UIE or
> regular alarm depending what is next in the timerqueue? So, basically
> the flags RTC_UF and RTC_AF are not really used anymore? I don't find
> specific RTC_UF handling in the core?

Yes, you followed the code correctly, I have a series that is removing
RTC_UF that I didn't send yet.

Again I'm fine with the patch as is, I just wanted to point out that the
complexity may not be needed.

Regards,
Alexandre Belloni


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

