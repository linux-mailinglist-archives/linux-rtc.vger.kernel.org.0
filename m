Return-Path: <linux-rtc+bounces-6080-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G9bMXo8oGmagwQAu9opvQ
	(envelope-from <linux-rtc+bounces-6080-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Feb 2026 13:28:42 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 341371A5B08
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Feb 2026 13:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48FD73017031
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Feb 2026 12:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5132363C75;
	Thu, 26 Feb 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHkG/2EP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEB34F48D
	for <linux-rtc@vger.kernel.org>; Thu, 26 Feb 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108903; cv=none; b=G2lVXQ2EBRomB+hauSqz9eWtn/iPHx2ZPhkAu39A6gBkkzhT7XwEkoFRczGYycgGasYQ54WmiLCtUJ6A8kHn70KD742OB0SaIC37akKe60KID5JrR4LcAGmPfMcivTKIx9baVHH49q1+/IyPq5zaTs0uzidhGmOrudbx+7aeEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108903; c=relaxed/simple;
	bh=suoYzminA3YKvZbZA3gZl3vI0+8D+6GmcsMdqFGnHyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2GOAahaI/90U6KFVIBkJ9PqIIJ3FcxP6g7hCgWfdlQYJektmqeEsxFoaTeBz9CgZzYZdx5d1Ghfb+vWj8sT6gf4LiuoiRWqV3GKGBjo1S8phzI+IwqxA2kHEx+S49WiLIhwMD1GC7L6cTyape9pcqW/+EgwGC5UiymqVpjurXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHkG/2EP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59541C2BC9E
	for <linux-rtc@vger.kernel.org>; Thu, 26 Feb 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108903;
	bh=suoYzminA3YKvZbZA3gZl3vI0+8D+6GmcsMdqFGnHyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DHkG/2EPhYf07XsGNT9zk/2OnpWzg8R7N4HS9oWWrBPgTEPd1n5ftxT6NYCFmREtv
	 gh6Odsg0wWNZ10/lRKwW2dvrVikB+cZR+DqKNUjIEYhIwkZaunLnQJfZzqDyAhyRuN
	 6S69wH2VW5b1gphTnhaq6KrAMwSaH99ne7TGLHQnsp1l72OyYxOdfp8KGUkO46fsEu
	 Td7LFlv9iLL5o+YULiTebSJ8GnTTr7rFSfI6fUuvk4SVY3jX2kz1XtPm4vK/dHEOFc
	 BhoCKGMNJSHxBk+hnJpeRX0rAk0HTBcjp/Krbcxql0+qUsgU8ing/WfT9q7Hjiagar
	 JmXwFsjihtzQQ==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d4c65d772cso348184a34.1
        for <linux-rtc@vger.kernel.org>; Thu, 26 Feb 2026 04:28:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0LgmrIBgOCN2bBhxFTqnTFgkubnh2v0h0ZtGKEhuxzhy+ooKd2wBZ+U+lmzdsQKlxUGMD3Urxm44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/uu9nmQX1sHNzTeKiAj0ZHT2dcsiDcSVS0Rbf6oRkWuKS9Gy
	lCdX+MeS/aU2ZigNcIsEc8lHCdbVuVHBH+9VNzeVsRfr4tsb1fCY48xiVLBY2svjWkoaWaYPzq0
	nV/pogMoQ95VpAadbocM/dUuRJouimW8=
X-Received: by 2002:a05:6830:6d0f:b0:7cf:dbb4:320a with SMTP id
 46e09a7af769-7d586f561ccmr997621a34.27.1772108902360; Thu, 26 Feb 2026
 04:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221111619162a41a1@mail.local> <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org> <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org> <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
 <2026022415010804e28202@mail.local> <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org>
 <20260224172822de7f4569@mail.local> <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org>
 <CAJZ5v0iA88G0ZRVB347dXEu2y8mT=d+aWd42cB2tpO5pLVpKuQ@mail.gmail.com> <DGO6MEKIIHGH.3L06QJ47CP3CU@kernel.org>
In-Reply-To: <DGO6MEKIIHGH.3L06QJ47CP3CU@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 26 Feb 2026 13:28:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iRrfvV5nsfQ=YkhLjp4tOTOzSXHq-sQntf2QMuAW1Lfg@mail.gmail.com>
X-Gm-Features: AaiRm529vrDRa30sD66S8_1_FN511oOwBqQFehS0XzC3HnrG7t02i2PwgmEGgBY
Message-ID: <CAJZ5v0iRrfvV5nsfQ=YkhLjp4tOTOzSXHq-sQntf2QMuAW1Lfg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6080-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,bootlin.com,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 341371A5B08
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 5:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Feb 25, 2026 at 2:33 PM CET, Rafael J. Wysocki wrote:
> > On Tue, Feb 24, 2026 at 11:23=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >> Here's also some sketched up code for what I wrote above:
> >>
> >>         fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> imp=
l PinInit<Self, Error> {
> >>             let dev =3D pdev.as_ref();
> >>
> >>             let rtc_data =3D impl_pin_init!(SampleRtcData {
> >>                 io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/b=
ar0")?,
> >>                 hw_variant: VendorVariant::StV1,
> >>                 irq <- irq::Registration::new(...),
> >>             });
> >>
> >>             let rtc =3D rtc::Device::new(dev, rtc_data)?;
> >>
> >>             rtc::Registration::register(rtc)?;
> >>
> >>             Ok(Self { rtc })
> >>         }
> >>
> >> Note that if any of the RTC callbacks would ever need to call irq.sync=
hronize(),
> >> irq.disable(), etc. the compiler would enforce correct ordering, as th=
ere would
> >> not be any other possibility to put the irq::Registration other than i=
nto the
> >> rtc_data that goes into rtc::Device::new().
> >
> > IIUC, the interrupt handler can only access the rtc_data because the
> > parent's driver_data may not exist yet when it runs.  Or am I missing
> > something?
>
> In the code above the IRQ handler can also not access rtc_data, as struct
> SampleRtcData might not be fully initialized when it runs, i.e.
>
>         let rtc_data =3D impl_pin_init!(SampleRtcData {
>             io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
>             hw_variant: VendorVariant::StV1,
>             irq <- irq::Registration::new(..., rtc_data),
>         });
>
> would not compile in the first place.
>
> irq::Registration, for this purpose, has its own private data on the hand=
ler
> itself, see also [1]. In fact, the C code has the same concept with the d=
ev_id
> argument in request_threaded_irq() [2].
>
> The difference is that the C compiler does not ensure that the IRQ handle=
r
> actually owns the data behind the dev_id pointer. I.e. the driver has to =
somehow
> ensure that whatever is behind the dev_id pointer remains valid for the d=
uration
> the IRQ handler is registered.
>
> In the Rust implementation the compiler does ensure that what is behind t=
he
> dev_id pointer remains valid for the duration of the lifetime of the
> irq::Registration.
>
> Having that said, I assume you wonder what we would pass into the
> irq::Registration instead, if it is not rtc_data.
>
> The answer is it depends; it depends on what's actually needed, what othe=
r
> entities interact with the IRQ (e.g. some scheduled work, etc.) and maybe=
 even
> preference to some extend.
>
> Here is one example:
>
>         let irq_data =3D impl_pin_init!(SampleIrqData {
>             io <- pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")=
?,
>             hw_variant: VendorVariant::StV1,
>         });
>
>         let rtc_data =3D impl_pin_init!(SampleRtcData {
>             irq <- irq::Registration::new(..., irq_data),
>             ...,
>         });
>
>         let rtc =3D rtc::Device::new(dev, rtc_data)?;
>
> This would compile as it ensures that irq_data (struct SampleIrqData) is =
fully
> initialized before irq::Registration::new() is called.
>
> At a first glance this might look like we need an additional allocation, =
one for
> irq_data and one for rtc_data, but that is not the case. irq_data is an
> initializer that is passed to another initializer, i.e. rtc_data is still=
 an
> initializer.
>
> The actual (single) allocation happens in rtc::Device::new().

I think that the key observation here is that C and Rust are
substantially different with respect to how things get initialized.

In C, we first allocate memory, then initialize it, and then start
services that will refer to it.  All of these steps need to be taken
explicitly and separately in the right order and the compiler simply
processes the high-level language into CPU instructions.  On the way
out, all of that needs to be cleaned up directly, most of the time in
reverse order.  If anything is missed or forgotten, or the ordering is
messed up, troubles ensue.

In Rust, IIUC, the compiler is essentially told about what data will
be there in the memory, how to initialize it and what services to
start and all of that happens in one go when memory gets allocated
(so, apparently, a good part of the code doesn't even produce CPU
instructions at all, as it is all about feeding the information to the
compiler).  So long as the compiler has complete information, it can
figure out the right ordering automatically and it will complain if
something is not right.  The difficulty here is to find a way to
provide the compiler with complete information.

> In terms of accessing it through the the rtc::Device in an RTC device cal=
lback,
> we would likely use accessor methods to make it a bit more convinient, i.=
e.
>
>             fn read_time(
>                 rtc: &rtc::Device<SampleRtcData>
>                 parent: &platform::Device<Bound>,
>                 time: &mut rtc::Time,
>             ) -> Result {
>                 let io =3D rtc.io().access(parent)?;
>
>                 match rtc.hw_variant() {
>                     VendorVariant::Arm | VendorVariant::StV1 =3D> {
>                         let my_time =3D io.read(...);
>
>                         my_time.write_into(time);
>                     },
>                     VendorVariant::StV2 =3D> { ... },
>                 }
>             }
>
> As mentioned above there are a few other options to implement this, depen=
ding on
> what's required, etc.
>
> For instance, if the I/O bar is actually shared between multiple entities=
 we
> might want to initialize it within an Arc [3] (reference count it) for sh=
ared
> ownership.
>
> For the future we will also be able to support references within initiali=
zers to
> other pinned fields, which make things a bit more convinient, so you coul=
d do
> things like this:
>
>         let irq_data =3D impl_pin_init!(SampleIrqData {
>             io <- pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")=
?,
>             hw_variant: VendorVariant::StV1,
>         });
>
>         let rtc_data =3D impl_pin_init!(SampleRtcData {
>             irq <- irq::Registration::new(..., irq_data),
>             io: &irq.io,
>             ...,
>         });
>
>         let rtc =3D rtc::Device::new(dev, rtc_data)?;
>
> Note the additional `io: &irq.io,` in the rtc_data initializer. This woul=
d be
> legal as we know that `irq` is pinned within `rtc_data`, hence it is vali=
d to
> hold a reference to one of its pinned fields.
>
> I am not sure how far we are from having this supported, I assume Benno a=
nd Gary
> can say more about this.
>
> I hope this helps, and thanks for asking those questions!
>
> [1] https://rust.docs.kernel.org/kernel/irq/struct.Registration.html
> [2] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/irq/manage.c#L=
2090
> [3] https://rust.docs.kernel.org/kernel/sync/struct.Arc.html

