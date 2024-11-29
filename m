Return-Path: <linux-rtc+bounces-2646-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC859DED88
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Nov 2024 00:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A76BB215BF
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2024 23:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFFC165F1D;
	Fri, 29 Nov 2024 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SR4i4O0s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38A38FAD;
	Fri, 29 Nov 2024 23:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732922444; cv=none; b=eV4dSv1ZU6gb83mZSwmdAntbsWjT4ohy+oROVHd7xVpVJv+6Wy/l/YgiGX6Bar3zM5LgsuJ5ZCL8OC719hhIZcgieGPYGoWLl03qi7+F+y6iFduKSZiM2ULDEl7Gag3PVmIn2mul08tEKmMAYbcuj0i1oTXWbIc1IEJhcraiZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732922444; c=relaxed/simple;
	bh=tVQpUbUALSzFeHsjelEz0sCEXGf2z8kbyz1EmkfnlJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6+ObXbo/ASrzb81smfL+hKPxJFiwqXbPMtoEYbR6pykmUEuVx0kEDtOeHPq1xBauhDLE93SzFFLPyGvV/m/6X8Ok6OkkwdEqfhohRUPzipYo01hbwU28PJ6WMFWYBA7viOeViSlPF1OecbyvIDc9NTfUrkQifRhSpWr3YRZBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SR4i4O0s; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D8FC40003;
	Fri, 29 Nov 2024 23:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732922439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0vCYdInPo1Dg1M0c/jQNcugfGfoOVsoCMaIFPdkpec=;
	b=SR4i4O0srbQJl4PoKMmJD/iwW7lfpgRzk6l4s2poRkmT5d+8yCi78fkmiAwSW28ENQgTA/
	C6vc+TNkpACFFM9dQ8P6oQiLx5I7q5UU7v7ZTt3xSEYzEgbQBXG9jMF2930qn5sp3EahMl
	NG/RbBVvA5JpQl8jBevb4kg9I0trJ8C8nqcJepENycFCXRlr5/6tzDcWglf3nBAD6IGdfF
	hAG0IhskQf+wVjjnd6HxEV0u+qUtEI+8iuH/T0p3gb49RyjYMYRmpDPd8iWrbdgKYZijmD
	Dt6Na5K5w4q6R3f85Jnr89x8B8VRgeqHsHJJSSdnOPIeuerAsJbCdXlmIWFWPg==
Date: Sat, 30 Nov 2024 00:20:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?B?6auY5rC46Imv?= <leonylgao@gmail.com>
Cc: john.stultz@linaro.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yongliang Gao <leonylgao@tencent.com>,
	Jingqun Li <jingqunli@tencent.com>
Subject: Re: [PATCH] rtc: check if __rtc_read_time was successful in
 rtc_timer_do_work()
Message-ID: <20241129232038ad3be3ae@mail.local>
References: <20241011043153.3788112-1-leonylgao@gmail.com>
 <173136306889.3322178.5149197946199507685.b4-ty@bootlin.com>
 <CAJxhyqC9hYo3E=J--EYN9uYQc6_q67X4F5DSgpMFzsWrFcbw4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJxhyqC9hYo3E=J--EYN9uYQc6_q67X4F5DSgpMFzsWrFcbw4Q@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 20/11/2024 22:17:34+0800, 高永良 wrote:
> Hi Alexandre Belloni,
> 
> I've noticed that the post-failure process for __rtc_read_time requires
> careful handling.
> 1. Need to call pm_relax.

I had a look when taking your patch and I'm not convinced calling
pm_relax is necessary.

> 2. Potentially need to set the alarm to ensure subsequent interrupts can
> process the
>     expired timer? Could you give me some advice?

Same thing, if you are not able to read the current time, setting the
next alarm is going to fail anyway.

> Should I continue to submit a fix patch or create a v2 version of the patch?
> 
> Best Regards,
> Yongliang Gao
> 
> Alexandre Belloni <alexandre.belloni@bootlin.com> 于2024年11月12日周二 06:11写道：
> 
> > On Fri, 11 Oct 2024 12:31:53 +0800, Yongliang Gao wrote:
> > > If the __rtc_read_time call fails,, the struct rtc_time tm; may contain
> > > uninitialized data, or an illegal date/time read from the RTC hardware.
> > >
> > > When calling rtc_tm_to_ktime later, the result may be a very large value
> > > (possibly KTIME_MAX). If there are periodic timers in rtc->timerqueue,
> > > they will continually expire, may causing kernel softlockup.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
> >       https://git.kernel.org/abelloni/c/e8ba8a2bc4f6
> >
> > Best regards,
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

