Return-Path: <linux-rtc+bounces-6015-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CM2KRckm2mUtgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6015-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 16:43:19 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C223516F8C2
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 16:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DCA3300A251
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746EC3559C4;
	Sun, 22 Feb 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDekDU58"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFA3D3B3
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771774994; cv=none; b=lNVnTTSYgTvGiFzr2xtCIYz1ZmyRpocPI7qvzunO8CAZRARHzX6yIADg02XcB2E2t/+sQjBBIBAO3iVLcckW9EYJ8UHtV0emNwoeC5S0eeFrII/JnNKemeztObu1CT3wVU4GWz5rI6iAsuL/+O64Zb/+7EPFra69YLdBG0vy6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771774994; c=relaxed/simple;
	bh=eF0xgATMlyN2WZRybzMgtl9nazKIjLuvKGIEaB3gkKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdciKUvc9LjXxdkUkxYi945Bd8HASHLq41uZhbXDQZTcaxkfOUsHOc4oeCtRH8WSqaQ7Wp4IJHD3uLDZRotFbMnYFQd5Y4n2hfKUz0Vv54qsnn5QDxKEsnbgvYQTtGi/NujnPDXq/wj+O7oDY2cLH6mvrgynfSk6GGGAy8sj28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDekDU58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDF1C2BCB0
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771774994;
	bh=eF0xgATMlyN2WZRybzMgtl9nazKIjLuvKGIEaB3gkKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JDekDU58LK4xf0dNGrOqLxVIbc334wWgBSXf46X3ycJeZP6bmf3nd+th21yH6dG3I
	 4kpXd+xlI4BFNbJ36yWFCNiTSfSmDKTMeELsVw373KjwJC6iC5XE3R7vVkzzhouh6X
	 1uPJwQORf39gIyfM6slXA5c4Vx12wDPnU5ZP1T9S+gQh3hC7nNoK1tJ5354oF6az3A
	 Ph5x1Xc3o96EMjsIiyfBfRyz/0ucRzuGUxPotuCbCLnWt30Xs63JscG6/JUUmzEH1q
	 7O7BHMO7sLtdpN4Wv1nr7lbwh2icp09+PF7nLyq62tQ4YIqabDlrzQc6o/AGRUrCNU
	 UJUGZF53WJqlw==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-409470ad5bbso1132720fac.0
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 07:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ77a0DxH0GDr14WP51qt1vQgE3umtZNfpq6uwvl3mP4oceyEowNVE9x3Ghm8vvnd2HB1bZQceLy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqU8Zj2Fxg7668WtfAAyIss2k5kdSk4wF5Yc5jt9EB65VLIa+z
	XtQH3tgyEKsNbgEYp4Vls7O+AP6fqHS1AtEhrG1ms9ravEux4MY8hw4CkoH6YacrRQAc7g1FORX
	3QqJCGjYf+M+giTrC+FCbi71IOvDcUdE=
X-Received: by 2002:a05:6820:2290:b0:662:c6f1:9231 with SMTP id
 006d021491bc7-679c424cd4amr3264869eaf.4.1771774992993; Sun, 22 Feb 2026
 07:43:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116162203.296844-1-sunke@kylinos.cn> <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org> <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local> <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local> <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
 <DGLLJ541SEJW.160MET6OCQHKS@kernel.org>
In-Reply-To: <DGLLJ541SEJW.160MET6OCQHKS@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 22 Feb 2026 16:43:02 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iSzm-q=nU=nsSrKpvnkmPqaxehWHjVL1p0a3qWkU-h8Q@mail.gmail.com>
X-Gm-Features: AaiRm53LzIIvL5D_RonEgiDr4UOVJOj3WrAvLFsGWlL_Gqtsmt2_YHf1-Zx1dHo
Message-ID: <CAJZ5v0iSzm-q=nU=nsSrKpvnkmPqaxehWHjVL1p0a3qWkU-h8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
To: Danilo Krummrich <dakr@kernel.org>, Alvin Sun <alvin.sun@linux.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6015-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C223516F8C2
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 4:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Feb 22, 2026 at 1:25 PM CET, Rafael J. Wysocki wrote:
> > On Sat, Feb 21, 2026 at 3:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >>
> >> On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
> >> > On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
> >> > <alexandre.belloni@bootlin.com> wrote:
> >> >> > > Out of 29 drivers, 18 are doing so.
> >> >
> >> > The vast majority of around 50 platform drivers I've inspected
> >> > recently use platform_set_drvdata() or equivalent in probe.
> >>
> >> This thread seems to contain quite a bit of confusion and misunderstan=
dings --
> >> let me try to clarify.
> >>
> >>   (1) How Rust handles bus device private data.
> >>
> >>   In Rust the probe() function of a bus implementation (platform, PCI,=
 etc.)
> >>   returns an initializer (impl PinInit<T, Error>) for the driver's dev=
ice
> >>   private data.
> >>
> >>   The bus implementation takes this initializer and passes it (togethe=
r with the
> >>   underlying struct device) to the driver-core. The driver-core alloca=
tes the
> >>   required memory, initializes the memory with the given initializer a=
nd stores
> >>   a pointer to the corresponding object with dev_set_drvdata().
> >>
> >>   So, technically, in Rust all platform drivers call platform_set_drvd=
ata().
> >
> > So do I understand correctly that the driver is required to tell the
> > core what type its driver_data will be and then the core will allocate
> > memory for it and clean it up on remove?
>
> Yes, but it's not really that the driver actively has to tell the driver-=
core,
> etc.
>
> probe() functions return an initializer for the driver's device private d=
ata, so
> the type is known anyways.
>
>             fn probe(
>                 pdev: &pci::Device<Core>,
>                 info: &Self::IdInfo,
>             ) -> impl PinInit<T, Error> {
>                 ...
>             }
>
> So, the return type is a fallible initializer for T, where T is the type =
of the
> driver's device private data.
>
> I assume this may sound a bit odd with little or no Rust experience. Henc=
e, for
> people without much Rust experience reading along a quick explanation:
>
> On the more general side of things, Rust has a very powerful type system,=
 which
> includes generics, hence modeling such kind of things with generics is pr=
etty
> straight forward and preferred over passing void pointers.
>
> But there is also a much more specific reason; In C dev_get_drvdata() has=
 two
> pitfalls:
>
>   (1) The pointer returned by dev_get_drvdata() is only valid as long as =
the
>       bus device is bound to the driver.
>
>   (2) The driver has to cast the pointer returned by dev_get_drvdata() to=
 the
>       correct type.
>
> Since Rust is a memory safe language, we can't allow UB for safe APIs. He=
nce,
> the Rust Device::drvdata() [1] method has to consider both (1) and (2).
>
> (1) is rather simple as we have a type state found bound devices, i.e.
> Device<Bound>, so drvdata() is simply only implemented for Device<Bound>.
>
> (2) is much more tricky as we can't statically type the device over its p=
rivate
> data, as a single device instance can be bound to multiple drivers at run=
time.
>
> Hence, we need a runtime check, which the driver-core does for us. When a=
 driver
> calls the drvdata() method it looks like this:
>
>         fn foo(dev: &Device<Bound>) -> Result {
>             let data =3D dev.drvdata::<MyDataType>()?;
>
>             data.bar();
>         }
>
> The driver-core takes care of checking that the private data associated w=
ith
> `dev` actually is of type MyDataType. If this is not the case, the call s=
imply
> fails.
>
> The alternative would be an infallible unsafe API, such as:
>
>         fn foo(dev: &Device<Bound>) -> Result {
>             // SAFETY:
>             // - `dev` is guaranteed to be bound, because ...
>             // - The private data type of `dev` is guaranteed to be
>             //   `MyDataType`, since ...
>             let data =3D unsafe { dev.drvdata::<MyDataType>() };
>
>             data.bar();
>         }
>
> [1] https://rust.docs.kernel.org/kernel/device/struct.Device.html#method.=
drvdata
>
> >>   (Note that this is also true when the driver's device private data t=
ype is
> >>   empty (i.e. it has no fields). In this case it could still have a de=
structor
> >>   that must be called when the device private data structure is destro=
yed. Of
> >>   course there is no real memory allocation when the struct's size is =
zero.)
> >
> > So in the simplest case when the driver doesn't need driver_data at
> > all, it will just use a struct with no fields as that driver_data
> > type, IIUC.
>
> Yes, it would look like this:
>
>         struct SampleDriver;
>
>         impl pci::Driver for SampleDriver {
>             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> im=
pl PinInit<Self, Error> {
>                 if !validate_something() {
>                     return Err(EINVAL);
>                 }
>
>                 Ok(Self)
>             }
>         }
>
> >>   But at the same time, this is what leads to a lot of lifetime proble=
ms and
> >>   memory bugs and it is one of those things that Rust aims at avoiding=
 by being
> >>   very strict about initialization, ownership and lifetimes.
> >
> > As a general rule, I agree, but I would advise against applying
> > general rules automatically everywhere.
> >
> >>   However, I do also recognize that drivers creating an RTC device are=
 typically
> >>   very simple and in practice I would not be surprised if it turns out=
 that it
> >>   happens that drivers keep the struct rtc_device alive from probe() u=
ntil the
> >>   bus device is unbound from the driver, i.e. lifetimes just end up be=
ing almost
> >>   the same. But I don't know if that's always the case.
> >>
> >>   Regardless of that, I think it would be good to keep driver authors =
finding a
> >>   common pattern, where class device callbacks carry the corresponding=
 class
> >>   device struct (instead of the parent base struct device).
> >
> > TBH I'm not really convinced about this particular thing and I think I
> > can provide an illustrative example.
> >
> > Namely, quite incidentally, I've recently set out to add an RTC class
> > device to an existing driver, which is the ACPI time and alarm device
> > (TAD) one.  The TAD functionality is based on ACPI control methods
> > provided by the platform firmware and it may (or may not) include
> > RTC-equivalent functions.  So far, the driver has been providing a
> > completely custom sysfs interface to user space, but since more and
> > more platforms contain an ACPI TAD and some of them may not contain a
> > "traditional" RTC, having an RTC class device interface in that driver
> > may be quite useful.
> >
> > I have a prototype of the requisite change (I'll post it shortly for
> > reference) and it turns out that because the RTC class callbacks take
> > the parent device pointer as an argument, wrapping them around the
> > existing driver routines backing the existing sysfs interface is
> > super-straightforward.  Had the RTC class passed an RTC device pointer
> > to those callbacks, the driver would have had to do something to get
> > back from it to the parent device (which is what the driver really
> > works with).  If there are more similar drivers, that would have led
> > to some code duplication that is in fact unnecessary.
>
> The type system in Rust is powerfuly enough, so drivers can even get the =
exact
> type of the parent device the RTC device has as an additional argument to=
 the
> callback. The infrastructure for this is in place and it is used by subsy=
stems.
> I.e. in RTC we can do something like this:
>
>         impl rtc::Ops for MyRtcOps {
>             type BusDeviceType =3D platform::Device<Bound>;
>
>             fn read_time(
>                 rtc: &rtc::Device<MyRtcData>,
>                 parent: &platform::Device<Bound>,
>                 time: rtc::Time,
>             ) -> Result {
>                 ...
>             }
>         }
>
> where the corresponding rtc::Device::register() method would ensure that =
the
> associated BusDeviceType matches the parent device type that is passed to
> rtc::Device::register().
>
> A real example of this can be found in the LED class device abstractions =
[2].
>
> Note that in contrast to a bus device, class devices can be statically ty=
ped
> over their private data: rtc::Device<MyRtcData>.
>
> We usually also implment the Deref trait, such that rtc::Device<MyRtcData=
>
> automatically dereferences to MyRtcData.
>
> Having that said, if RTC drivers *never* have any private data that shoul=
d be
> associated with the RTC device exclusively (i.e. data that is only releva=
nt in
> the context of class device callbacks and class device infrastructure in
> general, or logically belongs to the class device), then the `rdev` argum=
ent
> would indeed be always unused and hence pointless.
>
> I usually would assume that there are such cases, but if that's really ne=
ver the
> case for any RTC drivers, then I agree we should change the above code to=
:
>
>         impl rtc::Ops for MyRtcOps {
>             type BusDeviceType =3D platform::Device<Bound>;
>
>             fn read_time(
>                 parent: &platform::Device<Bound>,
>                 time: rtc::Time,
>             ) -> Result {
>                 ...
>             }
>         }
>
> This way it is at least clear what kind of device is passed through the c=
lass
> device callbacks.
>
> [2] https://lore.kernel.org/all/20260207-rust_leds-v12-1-fdb518417b75@pos=
teo.de/
>
> > Moreover, the RTC device pointer doesn't even need to be stored
> > anywhere in that driver because the driver need not use it directly at
> > all and the RTC device object memory is freed by the core when the
> > driver unbinds.
>
> I don't think that is true, I think there are a few drivers accessing the=
 RTC
> device from IRQs or workqueues.

I was referring to the specific case I had in mind, I didn't mean that
this was always the case.  Sorry for being unclear.

> Besides that, quite a lot of RTC drivers actually seem to save a pointer =
to the
> struct rtc_device within their bus device private data, e.g. [3] and [4].
>
> [3] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/rtc/rtc-ac100=
.c#L91
> [4] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/rtc/rtc-cros-=
ec.c#L30

Right.

> >>   Especially on the Rust side we now have the chance to make the exper=
ience of
> >>   writing drivers as consistent as possible, which should help (new) d=
river
> >>   authors a lot in terms of learning the driver lifetime patterns.
> >
> > Well, I'm not sure if "the experience of writing drivers as consistent
> > as possible" is more important than less code duplication and simpler
> > code.
>
> Yeah, it always depends, and if there *really* is no point in having any =
class
> device private data in RTC, then that's of course fine too.
>
> I just want to make sure we do not encourage to just through all the priv=
ate
> data a driver may potentially have into the bus device private data struc=
t.
>
> I saw this a lot in C drivers and it actually causes ownership and lifeti=
me
> problems.

Sure.

Alexandre doesn't seem to be convinced that it is necessary to change
the RTC class device interface, so if there are any existing RTC
drivers that would benefit from doing so, it would be good to refer to
them specifically as examples.  Alvin, can you find any?

