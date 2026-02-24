Return-Path: <linux-rtc+bounces-6046-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCS8BDGqnWmgQwQAu9opvQ
	(envelope-from <linux-rtc+bounces-6046-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 14:40:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E221187DCF
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 14:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E56B931F24B4
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 13:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC92F39E18E;
	Tue, 24 Feb 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7HNn4ay"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CE39E165
	for <linux-rtc@vger.kernel.org>; Tue, 24 Feb 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939742; cv=none; b=s2YXSIbLQDT/j6L2HVCUWz8kjgRjz1qb5pwRsAzawj79RsdM9FsnAJE2Frp8aP2gF18NQSi1+3YjbFJ3kpNdSdHAQJNiPfMFvkRSXCI+parFZxJDg/4nVzrfA4FAS7NoHSbiS+myG/uIb5w1Y25PCexrai/xJbXPgJt+rPL8GmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939742; c=relaxed/simple;
	bh=pL44JEmVxwbp1k/qS3yXaCp0qIV9PiVZbSYO2UGxnGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MU5mq6P1S6+Pueh6aHL69CajiAjSrRkZqr8CODzwj+jolZvcO6DZgnfA9N9I2b7efuAxGuho1Je7uieb5aGPxcy4kTshu/K82iVwgjklxnVWhW/sdN3N6iBO7tZI/0b/+tn1nx5J9Tp2DBZr5u2JwDZDRx7BTNnVevkAPpHVO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7HNn4ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58701C2BCAF
	for <linux-rtc@vger.kernel.org>; Tue, 24 Feb 2026 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771939742;
	bh=pL44JEmVxwbp1k/qS3yXaCp0qIV9PiVZbSYO2UGxnGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D7HNn4aydTabUFHosbByDnumG1eB63mhUlotxHqpFzBNBUaEKAFXXX2c8vk1PS2ab
	 5mIBa/EwWPw5myayeh9yMuXLCQiwCHvS8UJAOCgvZxhNc8IuG6oZ2fJ2gqsLuCEOB8
	 S/kero6yqIYrYSdRM7+14BzaRBmAnuN6QHqJJZVsL9hrQYuMg3tkQpQiQFbzdOZSQF
	 ENO1KP+BiAylBeedcXQPLqy/nRl5iVOMGVyUyCWnCRiTZjEuGsN5WsYgOyTuiEMKaQ
	 XhebrpP9zovWymH1BgpYeXyr1sJKDeg6atN56dyUa/lNaStVRr74IDPisFbJr9J2V3
	 DBUm5xSg3Q4AQ==
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4638fe85a7eso2047250b6e.2
        for <linux-rtc@vger.kernel.org>; Tue, 24 Feb 2026 05:29:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzk/UMUxPV70Xj3hTtUeRLRnZ7sqeo9lV1qWwiP3L04tV0HwMSMaWKEA0m7Xyants9B0Iw4/MsPcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiq0q+J6immRCIr4vUk0zNpsgiAZzUJfH1eaQQ40iZlg/FV88
	pJ10TKsiSPvL1D84AB+BCsInGx2AwvtIPxRoSA3ys4Xl+R6HE9zOPZFOLjmQz3y2kCSyE1aaFTZ
	lfk24Algi6BoLqKOWcVYq+hMmoUoy+f4=
X-Received: by 2002:a05:6808:30a4:b0:45e:63d9:a678 with SMTP id
 5614622812f47-464461421ddmr6361137b6e.1.1771939741276; Tue, 24 Feb 2026
 05:29:01 -0800 (PST)
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
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org> <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org> <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
In-Reply-To: <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 Feb 2026 14:28:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0habtTt32bTiJF2keifwea4i0=j_s_x7AzOn_xmaO+RWQ@mail.gmail.com>
X-Gm-Features: AaiRm52CPAAwqcjVC4yB47kje6aJWT7as3AG5d5vxx6TL8qz33OMl61qpmdIpZQ
Message-ID: <CAJZ5v0habtTt32bTiJF2keifwea4i0=j_s_x7AzOn_xmaO+RWQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6046-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E221187DCF
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 1:12=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Feb 22, 2026 at 5:13 PM CET, Danilo Krummrich wrote:
> > There is no limitation from the Rust side of things, as mentioned in [1=
], this
> > should work perfectly fine, but it might be slightly less convinient:
>
> When I wrote this on Sunday, I should have been much more precise about t=
his,
> since it actually does not work perfectly fine without further changes th=
at
> would (re-)introduce ordering constraints for drivers on the probe() side=
 of
> things that I want to avoid.
>
> The "re-" is in braces as we never had those ordering constraints in Rust=
, but
> we have quite a lot of them in C, where they cause endless problems. Whic=
h is
> why I want to avoid them in Rust.
>
> > Example 1:
> >
> >       impl rtc::Ops for MyRtcOps {
> >           type BusDeviceType =3D platform::Device<Bound>;
> >
> >           fn read_time(
> >               parent: &platform::Device<Bound>,
> >               time: &mut rtc::Time,
> >           ) -> Result {
> >               let drvdata =3D pdev.as_ref().drvdata::<MyDriver>()?;
> >
> >               ...
> >           }
> >       }
>
> Let's have a look at the corresponding probe() side of things.
>
>         struct SampleIrqData;
>
>         // The bus device private data.
>         #[pin_data]
>         struct SampleDriver {
>             #[pin]
>             irq: irq::Registration<SampleIrqData>,
>             rtc: ARef<rtc::Device>,
>             ...,
>         }
>
>         impl pci::Driver for SampleDriver {
>             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> im=
pl PinInit<Self, Error> {
>                 let dev =3D pdev.as_ref();
>
>                 let rtc =3D rtc::Device::new(dev)?;
>
>                 Ok(impl_pin_init!(Self {
>                     irq <- irq::Registration::new(...),
>                     rtc,
>                     _: {
>                         devres::register(rtc::Registration::new(rtc))?;
>                     }
>                 })
>             }
>         }
>
> This is a problem, since even though the registration of the RTC device i=
s the
> last thing in the initializer, rtc::Ops::read_time() above could race and
> Device::drvdata() could just fail as it might not be set yet.
>
> This is fixable, but - as mentioned - at the price of introducing orderin=
g
> constraints for drivers.
>
> For instance, this could be solved by introducing a pci::ProbeDevice<'a> =
type,
> which ensures that pci::ProbeDevice::set_drvdata() can only be called fro=
m
> probe() and can only be called once, as it consumes the pci::ProbeDevice.
>
>         struct SampleIrqData;
>
>         // The bus device private data.
>         #[pin_data]
>         struct SampleDriver {
>             #[pin]
>             irq: irq::Registration<SampleIrqData>,
>             rtc: ARef<rtc::Device>,
>             ...,
>         }
>
>         impl pci::Driver for SampleDriver {
>             fn probe<'a>(pdev: pci::ProbeDevice<'a>, info: &Self::IdInfo)=
 -> Result {
>                 let dev =3D pdev.as_ref();
>
>                 let rtc =3D rtc::Device::new(dev)?;
>
>                 let data =3D impl_pin_init!(Self {
>                     irq <- irq::Registration::new(...),
>                     rtc,
>                 });
>
>                 // The `pci::ProbeDevice` has been consumed by value, and
>                 // returned a `&pci::Device<Core>`.
>                 let pdev =3D pdev.set_drvdata(data)?;
>
>                 devres::register(rtc::Registration::new(rtc))
>             }
>         }
>
> However, note how this wouldn't solve the same problem for irq::Registrat=
ion, as
> it lives within the the driver's device private data.
>
> If this would be C you would probably just partially initialize the drive=
r's
> device private data, but in Rust uninitialized data is not allowed for sa=
fety
> reasons.
>
> We could probably find other ways to somehow handle this, e.g. by introdu=
cing
> new device context states, additional callbacks, etc., but in the end it =
would
> only be workarounds for not having defined ownership, that eventually end=
s up
> being more complicated and more error prone.
>
> For this reason an irq::Registration has its own private data (which in t=
his
> example is just an empty struct).
>
> Similarly, all other kinds of registrations (and driver entry points) hav=
e their
> own private data, such as class devices, work and workqueues, file operat=
ions,
> timers, etc.
>
> I.e. there is a clear separation of ownership and lifetime, which makes m=
ore or
> less (often more) suble ordering constraints obsolete.
>
> In fact, in the beginning I did not even plan to expose Device::drvdata()=
 at
> all, making the driver's device private data only available in bus device
> callbacks, etc.
>
> The reason why I added it was that it was required (and makes sense) when
> drivers interact with other drivers, e.g. through an auxiliary device.
>
> I did also mention this in the commit message of commit 6f61a2637abe ("ru=
st:
> device: introduce Device::drvdata()"):
>
>       (2) Having a direct accessor to the driver's private data is not
>           commonly required (at least in Rust): Bus callback methods alre=
ady
>           provide access to the driver's device private data through a &s=
elf
>           argument, while other driver entry points such as IRQs,
>           workqueues, timers, IOCTLs, etc. have their own private data wi=
th
>           separate ownership and lifetime.
>
>           In other words, a driver's device private data is only relevant
>           for driver model contexts (such a file private is only relevant
>           for file contexts).
>
>     Having that said, the motivation for accessing the driver's device
>     private data with Device<Bound>::drvdata() are interactions between
>     drivers. For instance, when an auxiliary driver calls back into its
>     parent, the parent has to be capable to derive its private data from =
the
>     corresponding device (i.e. the parent of the auxiliary device).
>
> Let's have a look at how probe() looks like for the example below, which =
is what
> we do in other subsystems, such as DRM or PWM.
>
> > Example 3:
> >
> >       struct SampleIrqData {
> >           rtc: ARef<rtc::Device>,
> >       };
> >
> >       // The bus device private data.
> >       #[pin_data]
> >       struct SampleDriver {
> >           #[pin]
> >           irq: irq::Registration<SampleIrqHandler>,
> >           rtc: ARef<rtc::Device<SampleRtcData>>,
> >       }
> >
> >       // The class device private data.
> >       struct SampleRtcData {
> >           io: Devres<IoMem<PL031_REG_SIZE>>,
> >           hw_variant: VendorVariant,
> >       }
> >
> >       impl rtc::Ops for MyRtcOps {
> >           type BusDeviceType =3D platform::Device<Bound>;
> >
> >           fn read_time(
> >               rtc: &rtc::Device<SampleRtcData>
> >               parent: &platform::Device<Bound>,
> >               time: &mut rtc::Time,
> >           ) -> Result {
> >               let io =3D rtc.io.access(parent)?;
> >
> >               match rtc.hw_variant {
> >                   VendorVariant::Arm | VendorVariant::StV1 =3D> {
> >                       let my_time =3D io.read(...);
> >
> >                       my_time.write_into(time);
> >                   },
> >                   VendorVariant::StV2 =3D> { ... },
> >               }
> >           }
> >       }
> >
>
>         impl pci::Driver for SampleDriver {
>             fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> im=
pl PinInit<Self, Error> {
>                 let dev =3D pdev.as_ref();
>
>                 let rtc_data =3D impl_pin_init!(SampleRtcData {
>                     io: iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0"=
)?,
>                     hw_variant: VendorVariant::StV1,
>                 });
>
>                 let rtc =3D rtc::Device::new(dev, rtc_data)?;
>
>                 // Internally calls `devres::register(rtc::Registration::=
new())`.
>                 rtc::Registration::register(rtc)?;
>
>                 Ok(impl_pin_init!(Self {
>                     // Give the IRQ handler a reference count of the `rtc=
::Device`.
>                     irq <- irq::Registration::new(..., rtc.clone()),
>                     rtc,
>                 })
>             }
>         }
>
> With this there are no (subtle) ordering constraints the driver has to ge=
t
> right; ownership and lifetimes are well defined.
>
> (I.e. whatever order a driver picks, it either works properly or it does =
not
> compile in the first place, which is a huge improvement over the situatio=
n we
> have in C.)

Thanks for all of this information and let me confirm my understanding.

In both Example 1 and Example 3 there is a dependency between rtc's
read_time() callback and the PCI driver probe() because calling the
former before the latter is complete would be premature (and it would
fail).  However, in Example 1 the compiler does not take that
dependency into account because rtc is not passed to the callback,
while in Example 3 the dependency is visible to the compiler and it
will refuse to compile the code if the dependency may be missed.

If the above is correct, the current calling convention of RTC class
callbacks is problematic because it causes correctness checks done by
the Rust compiler to be bypassed (which may allow certain ordering
issues to be missed and functional problems to appear going forward).

That's convincing and I think that adding an RTC device pointer to the
list of parameters of RTC class callbacks on the C side would not be a
very intrusive change.  Arguably, it would be less intrusive than
replacing the parent device pointer with the RTC device pointer in
them.

