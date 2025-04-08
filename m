Return-Path: <linux-rtc+bounces-3832-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D34A80ED7
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C2E8880A55
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465FB1DEFEC;
	Tue,  8 Apr 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jfQl1bWj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AE18E75A;
	Tue,  8 Apr 2025 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123492; cv=none; b=G0GHA5+YJPbbqhitC7u1ayDSYl05Wjx3oTfyBuGgtCJUBc/gpTjyUgU/0gjCLL14s79F08S5fyBkT+au66zLgxOIsC52qAbvpLLt7CZeqAZeBH5yp3kTpR7GCeYt8xYr9mQhLiswvLIsxmj6MMjyHvffsXDeUTReKrWAk3fTav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123492; c=relaxed/simple;
	bh=uE7S/ykKBA+F4uBfxgSOxwKaFbesP06UyxIwdr8A5fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/EwDY9AeUeSZloAdCLnZSa9olj7ouMrnCB4RU0twJRmN8cy894PIQQ4DvrnlVB72kmmlnjKPR9lYjLqdXhagNR6DO/Qk3zsFIn7FoSdbsnP89bq2n9JeHpACqSUCquxt56FgYR6NxZrf4QtYcGyCNskQDZB2XB/wTF25r7thik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jfQl1bWj; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78A6844346;
	Tue,  8 Apr 2025 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744123488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nmvsBSW6ruA3VHmjOYi5BlHpcx0V3rnt1Hh0gBhaoY=;
	b=jfQl1bWjU3Gm3/ktsT+5L3jBi0rAZgoz2/Ir10OsHBfr4PCEAQ1zOah9y23oo1As98/PN5
	PD7ykcVKYZ+1ZwrpKVckfRLH2ar4VSKk4ldgFPbjp0WDP0jrVbGEdMiDrFhe4LqJTO2aYL
	Y1BMpIi61UM9b9Js8kngkQw5ntyjOBVZQ4q3MfAJ0BoEK5rMS8yqKwe3biXTrjKHCUGVrd
	mta0bGDaQ+VddqgV+2IClT02l+LEaXUQ6vYRfPahis1blqQ3p/YN0ulqvsWRjIwii3CXt6
	gGRZTZQbJVrb3x6ExcLU0Zi7o1OLLZpE33RFo+SJCF42KRob4OS6hKkxTkReVw==
Date: Tue, 8 Apr 2025 16:44:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: linux-rtc@vger.kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
Message-ID: <2025040814444859857143@mail.local>
References: <20250317183349.346399-1-bharadwaj.raju777@gmail.com>
 <2025031721511050987ca2@mail.local>
 <CAPZ5DTHKSzg6UV0bT5U9Xet7jL1c__n+GgfYz-38GybGzerYNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPZ5DTHKSzg6UV0bT5U9Xet7jL1c__n+GgfYz-38GybGzerYNQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheeuieeikefhgfdvhfehiedvhffgjeetfffgtefhudfgtefffeevledtleejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghhrghrrggufigrjhdrrhgrjhhujeejjeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 29/03/2025 19:59:46+0530, Bharadwaj Raju wrote:
> On Tue, Mar 18, 2025 at 3:21 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 18/03/2025 00:03:43+0530, Bharadwaj Raju wrote:
> > > The trace call invokes rtc_tm_to_time64 on a
> > > potentially uninitialized alarm->time. Move the
> > > trace call to the path where we do successfully
> > > initialize and read that struct.
> > >
> > > This fixes a KMSAN warning.
> > >
> > > Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")
> > >
> > > Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> > > ---
> > >  drivers/rtc/interface.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> > > index aaf76406cd7d..82ba33bf478b 100644
> > > --- a/drivers/rtc/interface.c
> > > +++ b/drivers/rtc/interface.c
> > > @@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
> > >               alarm->time.tm_yday = -1;
> > >               alarm->time.tm_isdst = -1;
> > >               err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
> > > +             if (!err)
> > > +                     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
> > >       }
> > >
> > >       mutex_unlock(&rtc->ops_lock);
> > >
> > > -     trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
> >
> > This removes the tracepoint when there is an error, rendering it les
> > useful.
> >
> > Also, as discussed about a year ago, alarm-time being uninitialized is
> > not actually an issue as mktime64 can handle whatever is the input so
> > this will never cause any problem so this isn't really a fix.
> >
> > I suggest the following:
> 
> Thanks for reviewing. Would you like me to make a second version of
> the patch with this suggestion?

I've sent my patch now.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

