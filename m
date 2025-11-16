Return-Path: <linux-rtc+bounces-5392-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E33C61E1A
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Nov 2025 23:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E095350FED
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Nov 2025 22:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2862C25A2A4;
	Sun, 16 Nov 2025 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UEZsciCK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A7199D8
	for <linux-rtc@vger.kernel.org>; Sun, 16 Nov 2025 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763330944; cv=none; b=YCuvYX+Zx6sDs6CUBQQIphaPQmn9C1nZQPRfrBbfY1O4qf45tfcTQZwda/6MvqKOOc4o3jDxnZ2/4RhY9jTx8pZf6MlceuB88EXcGw+BI0ncOf+5CdexfgbYtCHgkW6x7C1/JdZFDteMKulTP93QjTqd5rgJ8zCQnFtTUDVVtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763330944; c=relaxed/simple;
	bh=P9N5xGf+caqc7lNOlCoabHMugFlSjuJBV19MIaQL0Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxFFiPJqSfp2/7JQ0mih9nisM4xiJoJr72W/kTesMVJ7gO/F8g5mgBfPS5sWPec9CZetFdC5e44u1iRU24X519JVg0Jam3PB0eSqIoqLG58mI8vhgA7AcQqu4NUoJcwiGSC4CTUuXTrAGJAkuck9wwoX1ToOQ3MrO+QmZj8apmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UEZsciCK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 989F7C12029;
	Sun, 16 Nov 2025 22:08:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61D54606F6;
	Sun, 16 Nov 2025 22:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA57C10370C35;
	Sun, 16 Nov 2025 23:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763330928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=A/ygzaiV+3hz+YuIZcsbb6JzPXpP04/+av+fRinj3M0=;
	b=UEZsciCKXu9qM/a5TASaWPA7Nrp/i0HfLDAuBZhHRp/YK4TGLFal/97K/1D0W1HRHwjZaW
	SVry0nttv92RkXDre0QczidXx/IDZ4waI1ixXBobWFGI/ohNn6dTpgy/UlctJU4AQySMKC
	u8rOhbIiPgV3dJK8jhZKDam6oXXBjEKtACGQsykJWat9ucfg0VAxWASle4wisDQt71iXso
	k18MtzJ62VxiYh9FYlq2IQD5UImIEio8lgml0oQujsEsAjb/diajLwVMq5dZFg9PZJxs4B
	fajsAl9H4/fJQVvazyeydamFCarW+W/fF6DvzdWKjsmcAlgCV2wyYmlfBTHj8g==
Date: Sun, 16 Nov 2025 23:08:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: andriy.shevchenko@intel.com, david.daney@cavium.com,
	ddaney@caviumnetworks.com, david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH] rtc: isl12026: Implement callbacks for alarm feature
Message-ID: <202511162208431d06192b@mail.local>
References: <20251115-1156-3147571@bhairav-test.ee.iitb.ac.in>
 <20251115112421bdd368f5@mail.local>
 <20251116-51715-3266073@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116-51715-3266073@bhairav-test.ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3

On 16/11/2025 10:47:15+0530, Akhilesh Patil wrote:
> > >  static const struct rtc_class_ops isl12026_rtc_ops = {
> > >  	.read_time	= isl12026_rtc_read_time,
> > >  	.set_time	= isl12026_rtc_set_time,
> > > +	.set_alarm	= isl12026_rtc_set_alarm,
> > > +	.read_alarm	= isl12026_rtc_read_alarm,
> > > +	.alarm_irq_enable = isl12026_rtc_alarm_irq_en,
> > >  };
> > >  
> > 
> > This is missing an interrupt handler and proper handling in probe for
> > the wakeup-source property as this seems to be how you use it.
> 
> Agree. However, I thought of first implementing alarm callbacks only and
> test them independedntly using ioctls for alarm settings in this patch.
> I will add interrupt handler and wakeup-source in v2 to complete this
> functionality.

Sure, the issue is that without interrupt handling and wakeup-source,
the driver will behave in a way that will break DT backward
compatibility later on.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

