Return-Path: <linux-rtc+bounces-6079-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EESeEpdmn2lRagQAu9opvQ
	(envelope-from <linux-rtc+bounces-6079-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 22:16:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF319DBC2
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 22:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17E973035018
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 21:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D909F30CDB6;
	Wed, 25 Feb 2026 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih0Gf01V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A0B2D839C
	for <linux-rtc@vger.kernel.org>; Wed, 25 Feb 2026 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054136; cv=none; b=WCBsKIzGeyBYV3ip8FqXf90R4Yje+VFTrMhyh5KM4qruzqyRV2df67BT4STIz4cRoMvcdh0gP9V6hMAO4HS8vA6z0cn4fIuA0Y2u9dxY+UoqYcByrvacHgd1b6eB+yAghd9UOaiw6zVvfDrOfHVdfB75VsOD6mfVLwhhB50jGIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054136; c=relaxed/simple;
	bh=z+DlvjYWMPDQTmDpWzttaYmRaVtwEVuc2YhqCyYm9ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKniqMYmb3kqQs4fFsSZdRSprDJ3oKpYOze0uUXZMG/pIpi2HRDrQqn1RVO75a9km+cSWL+y3Y6m55rejGpWpmlRn1UOpJgH5ibtZ0r61x020ryb9DQPZA2//WiVoBxNi8ZWocP3/Mofsz/7sIFKcWSedbkNS6Sie/geNiQOiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih0Gf01V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3DAC19422
	for <linux-rtc@vger.kernel.org>; Wed, 25 Feb 2026 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772054136;
	bh=z+DlvjYWMPDQTmDpWzttaYmRaVtwEVuc2YhqCyYm9ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ih0Gf01VMg1kh8vyFaCbNT4KpoTECSVi+GHss1CxELIv/RsFIcoNN47vRdiziJAnL
	 hffuDgaXE3zJwjexAP7eWS+o3jLgPgL6QJQgx+VP7/jfYG1Lxhl/VWnboU/hsmbDYa
	 vfBGal8BK9kk/y+UbQx4jRAxXqwixMBCsyoxeICncJ3Oj2FH6UvtWV98r9agoh7WCV
	 JCvpqWvAE0pneh3WgSrJMKz7uDZwi7bomfszhIyYzM1VSL5mU8nJhrSZoKsdL/tArA
	 K6hczuIe/fmfaxf0ZF+B3EC9KAHiV6a1vlh4CutLIMMyinhfVC6N6BOCyZ0CIKm7Ts
	 ave4NsVuhpMLw==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-463208653d6so120402b6e.3
        for <linux-rtc@vger.kernel.org>; Wed, 25 Feb 2026 13:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiCYbGWFVj3qYvFRt8v6SjnFkSX41oC2geQuknzktw0KLWOAAHVG+wokoxQd9iH97Ms7D9s1XqYwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPrWZeS1o+mp48aLJlPCzKQ+8aD05h1xz8a8nh6wv5hEOafRA
	tdQ6ywLbSE3lR81BWWVjyQOLhvTRmwAmMr952MGqDCFoewNi4gIpRxfarh0zrsTZIWJ0Ulo6H/R
	fT+BFACuDGdwjI+PDzrkvqtWmX5SpUMg=
X-Received: by 2002:a05:6808:878b:b0:464:a066:aa6a with SMTP id
 5614622812f47-464a066b160mr763959b6e.45.1772054135325; Wed, 25 Feb 2026
 13:15:35 -0800 (PST)
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
Date: Wed, 25 Feb 2026 22:15:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hAF5qwv6wDAviqkkZSza7Dj-p_AGCrAzXjFrMOhDKAMg@mail.gmail.com>
X-Gm-Features: AaiRm52YfPaPRjAqJHfFoPr_qwe67MHx8wdiZzY3CovJZo-BOto2n_ITHC6YYKk
Message-ID: <CAJZ5v0hAF5qwv6wDAviqkkZSza7Dj-p_AGCrAzXjFrMOhDKAMg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6079-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: B5CF319DBC2
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
>
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

Well, I'm using an opportunity to learn something, thank you!

> [1] https://rust.docs.kernel.org/kernel/irq/struct.Registration.html
> [2] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/irq/manage.c#L=
2090
> [3] https://rust.docs.kernel.org/kernel/sync/struct.Arc.html

