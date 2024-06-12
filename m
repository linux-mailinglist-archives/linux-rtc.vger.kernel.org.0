Return-Path: <linux-rtc+bounces-1286-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4A905104
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 13:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E289286A8C
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D581534EA;
	Wed, 12 Jun 2024 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JUuagIPQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444B3D388;
	Wed, 12 Jun 2024 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190092; cv=none; b=k4m0LDn5jU+PQRTPSjTDVH3PPZzfJsNDaiA/3CesgwaRdlag0lbon1tfkYyedKpKjaZV+CGywcLOCWG70Yzosh1HQSr3iA5AYVMUxLaUaOv668B5prkulozXk86Kq1+9qTbHRrfgLF5mh2Yq1Bdzn/iu6Lq8cGdd3W65fVSQu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190092; c=relaxed/simple;
	bh=NNQLKjgkGeccMfGsnuL1MDtgD5ZRTMQ0Y1kyLbDsTFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xou+eBTek2I/U7qPs3HwX3WvG/vAYOpXvm/FvcD85NZmkZS+LclcV+Kq0wt2g6hg9Q5dXtvqd5SLMaNNpOthAph4JwIOLtoPYZnK8VvvzFu3lno6dZ5H5p+I2uJP/0FzrS6ig7R8Z9K2ymnU3HPm6QQP8uavlfpI6vbLZG3ho1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JUuagIPQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B5DF60002;
	Wed, 12 Jun 2024 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718190087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7rG/GEjvXPlerb9QqvuKiLbAOCohc8u7hrLFYRHIqM=;
	b=JUuagIPQ9RTp9a9IV0xljGSyy8wwd2k1OZFvNFHuJ6ONMVsu/dfLEGHpkaxcYCjnjrv7OH
	Sx6WSA3PcfQZqWT+2RFTJ58iUihfwVAx2kOXbpHzGqAtft7rTW7cRJc3TV8cxPLnapMt55
	R8ftNVmv//tdeDjSdCbw7LiD6XvS6yvxtbOEdcCQoxXnnMl5C1pp+cbbvjcwRegQPh0qWp
	CHBhwG7+310/n3k4kQTwTTBrM8Dg1mGZx/flP9uN/8opPXvXIgHhyM1J2v1CxOsf5bYKK9
	On8ZW8SEZ7/dTA4Aw1UsZwIHYqZ0d2N/5VgS9vypygFnTZn29VlOh8FKBeXJ9Q==
Date: Wed, 12 Jun 2024 13:01:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Miroslav Lichvar <mlichvar@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Szentendrei=2C_Tam=E1s?= <szentendrei.tamas@prolan.hu>
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <202406121101270f7d84a9@mail.local>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
 <Zmks31shpsnoLQ3k@hoboy.vegasvil.org>
 <ZmlTQsgRiW9fmYcB@localhost>
 <c0b6ad83-b9d4-43e7-8c1a-14b71a2060f8@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0b6ad83-b9d4-43e7-8c1a-14b71a2060f8@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/06/2024 11:16:02+0200, Csókás Bence wrote:
> On 6/12/24 09:50, Miroslav Lichvar wrote:
> > On Tue, Jun 11, 2024 at 10:06:39PM -0700, Richard Cochran wrote:
> > > On Tue, Jun 11, 2024 at 05:04:57PM +0200, Csókás, Bence wrote:
> > > 
> > > > PCF2127/29/31 is capable of generating an interrupt on every
> > > > second (SI) or minute (MI) change. It signals this through
> > > > the Minute/Second Flag (MSF) as well, which needs to be cleared.
> > > 
> > > This is a RFC, and my comment is that a PPS from an RTC is not useful
> > > to the Linux kernel.
> > 
> > I think a TCXO-based RTC can be useful to user space to improve
> > holdover performance with NTP/PTP.
> 
> Exactly.
> 
> > There already is the RTC_UIE_ON
> > ioctl to enable interrupts and receive them in user space.
> > 
> > The advantage of the PPS device over the ioctl would be more accurate
> > timestamping (kernel vs user-space). Should PPS be supported, it would
> > be nice if it worked generally with all drivers that support RTC_UIE_ON.
> 
> As we've discussed in v1, UIE hardware support is being removed from the RTC
> subsystem, which I tried to optionally re-introduce. Since there was no
> response since then, I assumed that there is no willingness to do that, so I
> chose the next best option, the PPS subsystem.

I won't reintroduce UIE but I'm going to fix the issue you see with the
pcf2129.

> 
> On 5/28/24 19:56, Alexandre Belloni wrote:
> > This has been removed from the kernel 13 years ago. What is your use
> > case to reintroduce it?
> 
> I also agree that multiple RTCs would benefit from this feature. However, we
> should only add it to those which *have* hardware support for a "one second
> has elapsed" signal. UIE is currently implemented by setting an alarm to the
> next second, which didn't work well with the PCF2129.

I agree with Miroslav that if done, this should be subsystem wise and
not just for individual drivers.



> 
> Bence
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

