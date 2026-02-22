Return-Path: <linux-rtc+bounces-6012-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8pe8E0UMm2lprAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6012-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:01:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A916F47A
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02E330041D2
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA57136358;
	Sun, 22 Feb 2026 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHYfhAGA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5E1C68F
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771768898; cv=none; b=rxehqka2ZhtO56FPD/j8m+yrdGBGdt8S8OqZ36s0twqJQMvRXvDawBemCKWeYBAjbKzJhYb6mCXKecCyARKZwK9mZBWT7nt59hEl70FRxiUvIBTvtfFr1oL5EeM9VgR+5+JUcQlkWikhCivkjxGr2NnUZXsjh3J2vxQSLPey1nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771768898; c=relaxed/simple;
	bh=hUVdLhpIqLXe68c7M7mDL1QKxH7wSZB9AECd94kLcAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjK2EnEpjZzw0ApnhlqX+R3aZkXhY3kpFwAYKdW3K2EMBOZyPTX8Bc3YTBiDuOhtRYqiP6Vq0I8u9dK3t/9MAwtPlvPV+7yE3/yDFoT4pZ9lmHsSOyGmi4ApXgGIhIUZoLs3HiRl/lVaURnhWSwty8fAxFVfhJN9+ehRuZVOhIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHYfhAGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBE2C2BCAF
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771768898;
	bh=hUVdLhpIqLXe68c7M7mDL1QKxH7wSZB9AECd94kLcAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dHYfhAGAOC884QDdWgBFyUzenyZjjqMOkEcF1tpv2nIWKHPnnXuHLYLxLlEi5aGC3
	 dAfXrTFgsTNnAPN+COkFxun/m61yTtMvIwYtgY9a9+dieO9+Km0GYC0U1XIGVQtCYw
	 slOIT9j7o3sOOIpbHJy+gn8uRO4VgIVrFWiM8gfYATZRvrTS92jynlDL8TU0BlZBUy
	 SYpQgfFSZyYYvUqV1FlDjtX+4dOI5Pv4VuLQat3rHg4PZdeEx7hfihd8Xg42Cl7sra
	 GIFgROUsM8aPpHDqSwvdMyBEYkvrNPRpdZRsXUVevQNs0IYOgcOuRSx3yVl5xn9bhb
	 WFZodRAib3A7w==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4043b909ed4so2349909fac.3
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 06:01:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4BoZVHAycdPWnqoK+P77KMx0NgG0+HwVdwdcOAolAr/MtmYTJO3WQFWwMvLhvOEG8eXxwFaQlPyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw7Wltzl7dONqLG7K3hFww1fv3rmk+SmId3sCZ5m+pvQGMiXIf
	VcFpXVSCvtyIoGIHVUBuGKjfwBf0VZtcQvTWvAf39mH9W6Jn/D4yKsebk+YlyMyZ1KxiEXIukvo
	8dkpbJAFmUWi4cW8lS5zTkPtOHcpmzj0=
X-Received: by 2002:a05:6871:2e88:b0:402:17a4:96b7 with SMTP id
 586e51a60fabf-4157ac80747mr3332728fac.22.1771768897081; Sun, 22 Feb 2026
 06:01:37 -0800 (PST)
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
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local> <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
In-Reply-To: <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 22 Feb 2026 15:01:25 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
X-Gm-Features: AaiRm53EesdsWoLrIsQzAZX749J5oJz7sFmPGg61ajxW3-RQg2jCWKGH7s255B0
Message-ID: <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6012-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,self.bar:url]
X-Rspamd-Queue-Id: C92A916F47A
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 1:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Feb 22, 2026 at 1:05 AM CET, Alexandre Belloni wrote:
> > On 21/02/2026 15:33:48+0100, Danilo Krummrich wrote:
> >>   (2) Bus device private data vs. class device private data.
> >>
> >>   The change to pass a struct rtc_device in class device callbacks of =
RTC,
> >>   rather than the base struct device of the corresponding bus device (=
e.g. AMBA,
> >>   platform, etc.) should not aim at storing all data in rtc->dev.priva=
te_data
> >>   that was previously stored in rtc->dev.parent->private_data.
> >>
> >
> > But what you explain here is that the drive is forbidden to use
> > rtc->dev.parent->private_data at all because the rust core is already
> > using it. What I'm saying is that it won't work because more than half
> > of the drivers currently need it.
>
> I think I was explaining the exact opposite, i.e. the driver's bus device
> private data is stored in the exact same way as in C, but it has a define=
d
> lifetime (from probe() until remove() and all devres callbacks have been
> completed) and is managed by the driver-core.
>
> Look at this example:
>
>         // The bus device private data.
>         struct SampleDriver {
>            foo: u32,
>            bar: u32,
>         }
>
>         impl pci::Driver for SampleDriver {
>             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> im=
pl PinInit<Self, Error> {
>                 // Return the driver's bus device private data. The drive=
r-core
>                 // will do all the work for us and eventually call
>                 // `dev_set_drvdata()` on the base `struct device` of `pd=
ev`.

So that's how I thought it would work.

>                 Ok(Foo {
>                     foo: 42,
>                     bar: 24,
>                 })
>             }
>
>             fn unbind(pdev: &pci::Device<Core>, self: Pin<&Self>) {
>                 // Use the driver's device private data from the method's=
 `self` argument.
>                 dev_info!(pdev, "foo: {}, bar: {}\n", self.foo, self.bar)=
;
>
>                 // There's also the `Device<Bound>::drvdata()` accessor, =
let's
>                 // use that as well.
>
>                 // Get a generic `device::Device` from the `pci::Device`.
>                 let dev =3D pdev.as_ref();
>
>                 // Get the `drvdata`; we have to assert the type and let =
the driver-core
>                 // validate that the asserted type is correct.
>                 let drvdata =3D dev.drvdata::<SampleDriver>()?;
>
>                 dev_info!(pdev, "foo: {}, bar: {}\n", drvdata.foo, drvdat=
a.bar);
>             }
>         }

This helps, thanks!

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
> >>
> >>   (Note that this is also true when the driver's device private data t=
ype is
> >>   empty (i.e. it has no fields). In this case it could still have a de=
structor
> >>   that must be called when the device private data structure is destro=
yed. Of
> >>   course there is no real memory allocation when the struct's size is =
zero.)
> >>
> >>   The driver's device private data can only be accessed when the bus d=
evice is
> >>   bound to the driver, i.e. the driver can only access it with a &Devi=
ce<Bound>;
> >>   it (the driver's device private data) is automatically freed by the
> >>   driver-core when remove() and all devres callbacks have been complet=
ed.
> >>
> >>   I.e. the rules are - of course - the same as on the C side, but they=
 are
> >>   enforced by the type system and the driver-core code.
> >>
> >
> > This still doesn't explain how you get the class private data that you
> > need when you are in a driver callback that is called from the bus (e.g=
.
> > suspend/resume) from what you explain, the driver doesn't have any
> > chance to pass it. The whole goal of a device driver is to be the glue
> > between a class device and a bus device as essentially this is the exac=
t
> > physical device, just represented differently.
>
> It is not always as simple as "one bus device corresponds to one class de=
vice".
>
> Sometimes drivers have to deal with multiple class devices for a single b=
us
> device, sometimes they are separated through the auxiliary bus or MFD.
>
> For instance, take struct net_device. In the context of cfg80211 wireless
> drivers may create arbitrary struct net_device instances, depending on ho=
w often
> the add_virtual_intf() callback is called (through netlink); example in [=
1].
>
> Now, regarding your question "How to access class device private data fro=
m bus
> device callbacks?". Nothing prevents a driver from embedding the class de=
vice in
> its bus device private data in one or the other way.
>
> In the net device example above, the driver would probably keep a list (o=
r
> xarray, etc.) of net devices in its bus device private data, as they can =
be
> created and removed at any point of time.
>
> (Note that this is also a good example for when the class device private =
data
> lives shorter than the bus device private data.)
>
> Here is an example of this looks like in code using a DRM device as class
> device.
>
>         struct SampleIrqData;
>
>         // The class device private data.
>         struct SampleDrm {
>             sched: drm::GpuScheduler,
>         }
>
>         // The bus device private data.
>         #[pin_data]
>         struct SampleDriver {
>             #[pin]
>             irq: irq::Registration<SampleIrqData>,
>             drm: ARef<drm::Device<SampleDrm>, // Refcount of a `drm::Devi=
ce`.
>         }
>
>         impl pci::Driver for SampleDriver {
>             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> im=
pl PinInit<Self, Error> {
>                 let dev =3D pdev.as_ref();
>
>                 let drm =3D drm::Device::new(dev, SampleDrm::new()?)?;
>                 drm.register();
>
>                 Ok(impl_pin_init!(Self {
>                     irq <- irq::Registration::new(...);
>                     drm,
>                 })
>             }
>
>             fn unbind(pdev: &pci::Device<Core>, self: Pin<&Self>) {
>                 self.irq.synchronize();
>                 self.drm.flush_scheduler();
>             }
>         }
>
> Note that the irq::Registration is dropped when the bus device is unbound=
,
> whereas the GpuScheduler is dropped when the DRM device is dropped.
>
> Of course, depending on the actual class device this difference may be mo=
re or
> less important, i.e. absolutely crucial in the net device example, less
> important for RTC apparently. But it is always good to be precise about
> ownership and lifetime of data.
>
> As I already mentioned, I don't think it is good to fold ownership and li=
fetime
> for bus and class devices together in cases where it happens that they ar=
e
> mostly identical, i.e.:
>
> >>   I think it would be good to keep driver authors finding a common pat=
tern,
> >>   where class device callbacks carry the corresponding class device st=
ruct
> >>   (instead of the parent base struct device).
> >>
> >>   Especially on the Rust side we now have the chance to make the exper=
ience
> >>   of writing drivers as consistent as possible, which should help (new=
)
> >>   driver authors a lot in terms of learning the driver lifetime patter=
ns.
>
> [1] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/net/wireless/=
microchip/wilc1000/netdev.c#L948

General considerations aside, regarding the $subject patch, I don't
think that it is an improvement because it would confuse the existing
RTC class device interface quite a bit.

Regarding whether or not switching over the RTC class device interface
to passing RTC device pointers to its class callbacks is a good idea,
I think that the difference really boils down to what data needs to be
accessed by the driver.

As it stands today, in an RTC class callback, the driver gets directly
to the parent of the given RTC device and if it does not need to get
to the RTC device at all, that's convenient.  However, if the driver
needs to get to the RTC device, it will most likely need to use
driver_data in the parent device for this purpose (and store the RTC
device pointer).

If the interface were changed to pass RTC device pointers to class
callbacks, the driver would get to the RTC device and from there it
would need to get to the parent device in the majority of cases.  Even
though getting from an RTC device to its parent device is
straightforward (and does not require using driver_data at all), in
some drivers that would be an extra step that would make the picture
somewhat less clear than it is today (and arguably less clear than it
really needs to be).  Still, the change of the interface might allow
some other drivers that do access the RTC device in class callback
functions to be simplified.

Granted, the above options had already been there when the RTC class
interface was designed and the choice was made at that time.  Revising
it now would require clear technical reasons IMV.

How hard would it be for Rust to cope with the existing calling
convention in the RTC class?

