Return-Path: <linux-rtc+bounces-6048-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DaiMEma9nWnzRgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6048-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:01:58 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4447188C5C
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52485309876A
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 14:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15993A0E82;
	Tue, 24 Feb 2026 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mcXAobgB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFB43806A6
	for <linux-rtc@vger.kernel.org>; Tue, 24 Feb 2026 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945059; cv=none; b=lV2GHlz5Z+sndFMYIuGefkm3YwRjYC9g+uvZe4EBD9AcqeLnzsn/sLvuC+IKJcwBkIiz5zt9i1SpzMEFrEcYr+HfeR3ygzV+dW5KsDt877mEItQmtV6axZq8kbZTfxX3wmwuXvTAsn2At9kIvIGKJB7QldZIFr5wNCD0nx+7XPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945059; c=relaxed/simple;
	bh=szupPBL5VMlKq6nt6+El2RXtOKnqlDN56+pCm0qFwSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZP0xj2kh8Xkxb6Jsd4qY3LN7dy8Tnv6EmQe4V5eL2gfiUl9l7BECGqhLOdTMwo/yTFqbk6cdGhhOapUi5h6Xd7wTaa0AkQjbor6bCecInZnHxLNCswDdkFWBQ31xDDtPF9FPpzapfumC4pOTRoReeFfxW/XTi2mZ/G21ssBgf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mcXAobgB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44425C143E7;
	Tue, 24 Feb 2026 14:57:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2C0E5FD9D;
	Tue, 24 Feb 2026 14:57:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E664610369189;
	Tue, 24 Feb 2026 15:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771945044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TD35meJIx0tSWD32u5a5s8+Ze4KqZJJ2vlTVst4M7UA=;
	b=mcXAobgB6rIqRh1WLat0kLJSEv+JeUvlXjK9NVWIFkpf0nd+fvF0ocp751ItUIg+9jMIn8
	mhFCtEzH12OHR8B4ml2S+Sm38MHU0Agd0Lbr/PQ9j4pXsk0Xig3SPavJCZUmbbQ9hUcA29
	OYw81AkOQEXSsAgtwrx+dgy7iAPISXDMokzQVtB82C0E1m9Y6fbnX1BJR6Ttv/fJf80ba/
	fliqH3GeFWB4Qk5XaQW1FpWDxMl7jhXFjNY8jEwe8/92BewuvlpV31g+AkmxyzXdM923qR
	1OPg8uaRhN4NVFMe+5T6smV6o171A28OA1tztEe+Xp45/MOEj8zytYYim60TYg==
Date: Tue, 24 Feb 2026 15:57:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alvin Sun <alvin.sun@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Message-ID: <20260224145721a9e69e4d@mail.local>
References: <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
 <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
 <CAJZ5v0habtTt32bTiJF2keifwea4i0=j_s_x7AzOn_xmaO+RWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0habtTt32bTiJF2keifwea4i0=j_s_x7AzOn_xmaO+RWQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6048-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bootlin.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dakr.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.local:mid]
X-Rspamd-Queue-Id: D4447188C5C
X-Rspamd-Action: no action

On 24/02/2026 14:28:48+0100, Rafael J. Wysocki wrote:
> On Tue, Feb 24, 2026 at 1:12 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Sun Feb 22, 2026 at 5:13 PM CET, Danilo Krummrich wrote:
> > > There is no limitation from the Rust side of things, as mentioned in [1], this
> > > should work perfectly fine, but it might be slightly less convinient:
> >
> > When I wrote this on Sunday, I should have been much more precise about this,
> > since it actually does not work perfectly fine without further changes that
> > would (re-)introduce ordering constraints for drivers on the probe() side of
> > things that I want to avoid.
> >
> > The "re-" is in braces as we never had those ordering constraints in Rust, but
> > we have quite a lot of them in C, where they cause endless problems. Which is
> > why I want to avoid them in Rust.
> >
> > > Example 1:
> > >
> > >       impl rtc::Ops for MyRtcOps {
> > >           type BusDeviceType = platform::Device<Bound>;
> > >
> > >           fn read_time(
> > >               parent: &platform::Device<Bound>,
> > >               time: &mut rtc::Time,
> > >           ) -> Result {
> > >               let drvdata = pdev.as_ref().drvdata::<MyDriver>()?;
> > >
> > >               ...
> > >           }
> > >       }
> >
> > Let's have a look at the corresponding probe() side of things.
> >
> >         struct SampleIrqData;
> >
> >         // The bus device private data.
> >         #[pin_data]
> >         struct SampleDriver {
> >             #[pin]
> >             irq: irq::Registration<SampleIrqData>,
> >             rtc: ARef<rtc::Device>,
> >             ...,
> >         }
> >
> >         impl pci::Driver for SampleDriver {
> >             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> >                 let dev = pdev.as_ref();
> >
> >                 let rtc = rtc::Device::new(dev)?;
> >
> >                 Ok(impl_pin_init!(Self {
> >                     irq <- irq::Registration::new(...),
> >                     rtc,
> >                     _: {
> >                         devres::register(rtc::Registration::new(rtc))?;
> >                     }
> >                 })
> >             }
> >         }
> >
> > This is a problem, since even though the registration of the RTC device is the
> > last thing in the initializer, rtc::Ops::read_time() above could race and
> > Device::drvdata() could just fail as it might not be set yet.
> >
> > This is fixable, but - as mentioned - at the price of introducing ordering
> > constraints for drivers.
> >
> > For instance, this could be solved by introducing a pci::ProbeDevice<'a> type,
> > which ensures that pci::ProbeDevice::set_drvdata() can only be called from
> > probe() and can only be called once, as it consumes the pci::ProbeDevice.
> >
> >         struct SampleIrqData;
> >
> >         // The bus device private data.
> >         #[pin_data]
> >         struct SampleDriver {
> >             #[pin]
> >             irq: irq::Registration<SampleIrqData>,
> >             rtc: ARef<rtc::Device>,
> >             ...,
> >         }
> >
> >         impl pci::Driver for SampleDriver {
> >             fn probe<'a>(pdev: pci::ProbeDevice<'a>, info: &Self::IdInfo) -> Result {
> >                 let dev = pdev.as_ref();
> >
> >                 let rtc = rtc::Device::new(dev)?;
> >
> >                 let data = impl_pin_init!(Self {
> >                     irq <- irq::Registration::new(...),
> >                     rtc,
> >                 });
> >
> >                 // The `pci::ProbeDevice` has been consumed by value, and
> >                 // returned a `&pci::Device<Core>`.
> >                 let pdev = pdev.set_drvdata(data)?;
> >
> >                 devres::register(rtc::Registration::new(rtc))
> >             }
> >         }
> >
> > However, note how this wouldn't solve the same problem for irq::Registration, as
> > it lives within the the driver's device private data.
> >
> > If this would be C you would probably just partially initialize the driver's
> > device private data, but in Rust uninitialized data is not allowed for safety
> > reasons.
> >
> > We could probably find other ways to somehow handle this, e.g. by introducing
> > new device context states, additional callbacks, etc., but in the end it would
> > only be workarounds for not having defined ownership, that eventually ends up
> > being more complicated and more error prone.
> >
> > For this reason an irq::Registration has its own private data (which in this
> > example is just an empty struct).
> >
> > Similarly, all other kinds of registrations (and driver entry points) have their
> > own private data, such as class devices, work and workqueues, file operations,
> > timers, etc.
> >
> > I.e. there is a clear separation of ownership and lifetime, which makes more or
> > less (often more) suble ordering constraints obsolete.
> >
> > In fact, in the beginning I did not even plan to expose Device::drvdata() at
> > all, making the driver's device private data only available in bus device
> > callbacks, etc.
> >
> > The reason why I added it was that it was required (and makes sense) when
> > drivers interact with other drivers, e.g. through an auxiliary device.
> >
> > I did also mention this in the commit message of commit 6f61a2637abe ("rust:
> > device: introduce Device::drvdata()"):
> >
> >       (2) Having a direct accessor to the driver's private data is not
> >           commonly required (at least in Rust): Bus callback methods already
> >           provide access to the driver's device private data through a &self
> >           argument, while other driver entry points such as IRQs,
> >           workqueues, timers, IOCTLs, etc. have their own private data with
> >           separate ownership and lifetime.
> >
> >           In other words, a driver's device private data is only relevant
> >           for driver model contexts (such a file private is only relevant
> >           for file contexts).
> >
> >     Having that said, the motivation for accessing the driver's device
> >     private data with Device<Bound>::drvdata() are interactions between
> >     drivers. For instance, when an auxiliary driver calls back into its
> >     parent, the parent has to be capable to derive its private data from the
> >     corresponding device (i.e. the parent of the auxiliary device).
> >
> > Let's have a look at how probe() looks like for the example below, which is what
> > we do in other subsystems, such as DRM or PWM.
> >
> > > Example 3:
> > >
> > >       struct SampleIrqData {
> > >           rtc: ARef<rtc::Device>,
> > >       };
> > >
> > >       // The bus device private data.
> > >       #[pin_data]
> > >       struct SampleDriver {
> > >           #[pin]
> > >           irq: irq::Registration<SampleIrqHandler>,
> > >           rtc: ARef<rtc::Device<SampleRtcData>>,
> > >       }
> > >
> > >       // The class device private data.
> > >       struct SampleRtcData {
> > >           io: Devres<IoMem<PL031_REG_SIZE>>,
> > >           hw_variant: VendorVariant,
> > >       }
> > >
> > >       impl rtc::Ops for MyRtcOps {
> > >           type BusDeviceType = platform::Device<Bound>;
> > >
> > >           fn read_time(
> > >               rtc: &rtc::Device<SampleRtcData>
> > >               parent: &platform::Device<Bound>,
> > >               time: &mut rtc::Time,
> > >           ) -> Result {
> > >               let io = rtc.io.access(parent)?;
> > >
> > >               match rtc.hw_variant {
> > >                   VendorVariant::Arm | VendorVariant::StV1 => {
> > >                       let my_time = io.read(...);
> > >
> > >                       my_time.write_into(time);
> > >                   },
> > >                   VendorVariant::StV2 => { ... },
> > >               }
> > >           }
> > >       }
> > >
> >
> >         impl pci::Driver for SampleDriver {
> >             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> >                 let dev = pdev.as_ref();
> >
> >                 let rtc_data = impl_pin_init!(SampleRtcData {
> >                     io: iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
> >                     hw_variant: VendorVariant::StV1,
> >                 });
> >
> >                 let rtc = rtc::Device::new(dev, rtc_data)?;
> >
> >                 // Internally calls `devres::register(rtc::Registration::new())`.
> >                 rtc::Registration::register(rtc)?;
> >
> >                 Ok(impl_pin_init!(Self {
> >                     // Give the IRQ handler a reference count of the `rtc::Device`.
> >                     irq <- irq::Registration::new(..., rtc.clone()),
> >                     rtc,
> >                 })
> >             }
> >         }
> >
> > With this there are no (subtle) ordering constraints the driver has to get
> > right; ownership and lifetimes are well defined.
> >
> > (I.e. whatever order a driver picks, it either works properly or it does not
> > compile in the first place, which is a huge improvement over the situation we
> > have in C.)
> 
> Thanks for all of this information and let me confirm my understanding.
> 
> In both Example 1 and Example 3 there is a dependency between rtc's
> read_time() callback and the PCI driver probe() because calling the
> former before the latter is complete would be premature (and it would
> fail).  However, in Example 1 the compiler does not take that
> dependency into account because rtc is not passed to the callback,
> while in Example 3 the dependency is visible to the compiler and it
> will refuse to compile the code if the dependency may be missed.
> 
> If the above is correct, the current calling convention of RTC class
> callbacks is problematic because it causes correctness checks done by
> the Rust compiler to be bypassed (which may allow certain ordering
> issues to be missed and functional problems to appear going forward).
> 
> That's convincing and I think that adding an RTC device pointer to the
> list of parameters of RTC class callbacks on the C side would not be a
> very intrusive change.  Arguably, it would be less intrusive than
> replacing the parent device pointer with the RTC device pointer in
> them.

But there is no way the rtc callbacks will be called before the rtc is
registered which will only happen in probe, when we have an actual
device to talk to...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

