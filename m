Return-Path: <linux-rtc+bounces-6000-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rom+NnhImmldaQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6000-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 01:06:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C716E4CA
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 01:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDE97300E3FD
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 00:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E3A3EBF33;
	Sun, 22 Feb 2026 00:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BauXhT9Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3B3EBF1F
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771718774; cv=none; b=jyMucG+gWR53sr2Ra4u/UMB8lXP67nq5aMEd3Q8vk4Moc3XcPDS+M19R5fqnmgi8giex6b8y3WhLE/h+aORMLAjjpdV61AoGzTWVyALFV2f16afE7MitlvkSVjLw2giUchOIx+rcgKYA+kKmWz8WtyM0gjuKKP0hjSHdgk7n4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771718774; c=relaxed/simple;
	bh=Ah8lo4WZpBkjeZopq0IefC6nsaLNmX3a+jrUT83i3JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhxy/NgwysDnwEBWxs82dwaLm/eO+dpoNFnTpx5UwJIqtS3jRfX6jRD891FaP9XkKFUlMQrX2kpgOi/1LEfni7RSC1/TKlYdxC5cvurntP0wkCljDAT13i1tDjSOpHK+HSyDXxucIg2jSaDJhA9YTXUnvcB/96CZkS3snB8PLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BauXhT9Q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 579404E40C17;
	Sun, 22 Feb 2026 00:06:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22CA25FB54;
	Sun, 22 Feb 2026 00:06:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B02EB103684CE;
	Sun, 22 Feb 2026 01:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771718762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W22sLyGdJ4g2zxHmS6kFaDnO3wQ9l1d2YFN5dAquDGk=;
	b=BauXhT9QmML3Wq1Yyyyc3k2XFP+BrMwuJqOEliKoNNYr/E0nQOjezEdRlBN8FIazUbrtgo
	1fBHFIvd45hWs7n6uRv/eBOxaqy5+U4yaqge6uIK0Ld1jpaWHhLfLDgRIxVlqpPo3f7LH6
	1MgA6P4qB8lehHmAKCE3W3IrfeXAQK14OSJhwlejI37N6SG6GJI5v6THwTr9cH7cwT0mTp
	5goQPjYP1kyLPIPRqx9S8SWKDsnq0aJmKZCZPZd1xBmBV7Ihp686CIgbOwZbh8VYwYGsTC
	sX1sVV2EmbkHPxJBX3CXue0jpGX+a8ld0BInehbl4J9VjN671yjbHLEuXAnpcg==
Date: Sun, 22 Feb 2026 01:05:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Message-ID: <20260222000556ea1938c0@mail.local>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6000-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url,bootlin.com:email]
X-Rspamd-Queue-Id: 358C716E4CA
X-Rspamd-Action: no action

On 21/02/2026 15:33:48+0100, Danilo Krummrich wrote:
> On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
> > On Sat, Feb 21, 2026 at 12:16 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >> > > Out of 29 drivers, 18 are doing so.
> >
> > The vast majority of around 50 platform drivers I've inspected
> > recently use platform_set_drvdata() or equivalent in probe.
> 
> This thread seems to contain quite a bit of confusion and misunderstandings --
> let me try to clarify.
> 
>   (1) How Rust handles bus device private data.
> 
>   In Rust the probe() function of a bus implementation (platform, PCI, etc.)
>   returns an initializer (impl PinInit<T, Error>) for the driver's device
>   private data.
> 
>   The bus implementation takes this initializer and passes it (together with the
>   underlying struct device) to the driver-core. The driver-core allocates the
>   required memory, initializes the memory with the given initializer and stores
>   a pointer to the corresponding object with dev_set_drvdata().
> 
>   So, technically, in Rust all platform drivers call platform_set_drvdata().
> 
>   (Note that this is also true when the driver's device private data type is
>   empty (i.e. it has no fields). In this case it could still have a destructor
>   that must be called when the device private data structure is destroyed. Of
>   course there is no real memory allocation when the struct's size is zero.)
> 
>   The driver's device private data can only be accessed when the bus device is
>   bound to the driver, i.e. the driver can only access it with a &Device<Bound>;
>   it (the driver's device private data) is automatically freed by the
>   driver-core when remove() and all devres callbacks have been completed.
> 
>   I.e. the rules are - of course - the same as on the C side, but they are
>   enforced by the type system and the driver-core code.
> 

This still doesn't explain how you get the class private data that you
need when you are in a driver callback that is called from the bus (e.g.
suspend/resume) from what you explain, the driver doesn't have any
chance to pass it. The whole goal of a device driver is to be the glue
between a class device and a bus device as essentially this is the exact
physical device, just represented differently.

An i2c RTC is not either an i2c device or an RTC, it is a single device
and we need to be able to tell the framework when something happens on
the bus or we need to be able to talk on the bus when we want to do
something with the device.


>   (2) Bus device private data vs. class device private data.
> 
>   The change to pass a struct rtc_device in class device callbacks of RTC,
>   rather than the base struct device of the corresponding bus device (e.g. AMBA,
>   platform, etc.) should not aim at storing all data in rtc->dev.private_data
>   that was previously stored in rtc->dev.parent->private_data.
> 

But what you explain here is that the drive is forbidden to use
rtc->dev.parent->private_data at all because the rust core is already
using it. What I'm saying is that it won't work because more than half
of the drivers currently need it.

I get that you are trying to avoid most of the issues by using devres
but I'm pretty sure there are cases where this doesn't work.

>   Instead, it gives drivers the option to differentiate in terms of ownership
>   and lifetime.
> 
>   While the bus device private data has a very defined lifetime from probe()
>   until the device is unbound from the driver, class device private data might
>   live shorter than this, or might even out-live driver unbind in some cases. It
>   really depends on the lifetime of the class device itself, which is not
>   generally defined.
> 
>   Now, from a C side point of view this may not look like a big deal, as it
>   (unfortunately) is not that uncommon that struct fields are just initialized
>   and destroyed whenever needed and the code just takes it into account.
> 
>   But at the same time, this is what leads to a lot of lifetime problems and
>   memory bugs and it is one of those things that Rust aims at avoiding by being
>   very strict about initialization, ownership and lifetimes.
> 
>   However, I do also recognize that drivers creating an RTC device are typically
>   very simple and in practice I would not be surprised if it turns out that it
>   happens that drivers keep the struct rtc_device alive from probe() until the
>   bus device is unbound from the driver, i.e. lifetimes just end up being almost
>   the same. But I don't know if that's always the case.
> 
>   Regardless of that, I think it would be good to keep driver authors finding a
>   common pattern, where class device callbacks carry the corresponding class
>   device struct (instead of the parent base struct device).
> 
>   Especially on the Rust side we now have the chance to make the experience of
>   writing drivers as consistent as possible, which should help (new) driver
>   authors a lot in terms of learning the driver lifetime patterns.
> 

The whole point of the RTC is to outlive the system but as Linux can't do
anything with the RTC unless it has a bus device to talk to, the class
device and the bus device have the exact same lifetime and we do handle
device appearing and disappearing from the bus. You may think RTC
drivers afe simple but there are plenty of lifetime issues that you will
never get with any other devices because they simply die with the
system.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

