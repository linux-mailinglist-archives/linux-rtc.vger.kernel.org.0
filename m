Return-Path: <linux-rtc+bounces-6045-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJvGAPvsnGnqMAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6045-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 01:12:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22795180277
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 01:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3AC93008C8B
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 00:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A7A12D21B;
	Tue, 24 Feb 2026 00:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsypuPUr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704ED70810;
	Tue, 24 Feb 2026 00:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771891957; cv=none; b=StTDAH3TxT/ruyA/3E4y1s4h2+Gwhy0Xknr4cOC+mZumEjMCld/VQsLQYoSFFrJf2aibyp/cYEajZBldjec6JJywEALnuVgdOvArosqmxEt4X6NfQR61th/Rdzmd0P1tiZqeikcE+HFVajqknjZu+g77ymRAdLlw7bJRz3oD9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771891957; c=relaxed/simple;
	bh=5MoNpm6w13iH1OdpASvRWeXDOeQYYcPrWRjlmiy22yA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IrQm6v3XqXfDZGWNLgg8lL9fVKgJfg9u5Fp1/j9SoiTzpeVaoMUr/G6G32QagWFj+2rONjpMz9SAFzaCYV4LcEp7QuvOv7zPd6WKRX2dtu3nz19cWDZqjbhVyulAYQyDdp9pXG/IH+r3VDhMLxGmClvRXAeUQNvFLqCtmXwOMYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsypuPUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7A6C116C6;
	Tue, 24 Feb 2026 00:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771891957;
	bh=5MoNpm6w13iH1OdpASvRWeXDOeQYYcPrWRjlmiy22yA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TsypuPUrgxou8ammBptWG3KG0R28ghyv62RNx5KnQrVjmf1hUtNklXYtMhQH6DV6S
	 ZTgB5CGJmv4R9mEDFfk9cToIjs5vOzCjxKl50Eyq/jtYoW+0KsRppOpXi6uhaUIpMx
	 1CYmg4xENqSJPeO/plt0lJ8QjKfrGXo8+P9p3OiRDAct7qMbrpsrgEHS9jM4DBjH5s
	 JQ2QCIGwir7alEsyL6gPf51i+KZTjYzm9QCk56gpBtQICAXfjxF83QlBN6HQqaNwtC
	 S/YW895b5wflgRbfPf9tadxJGSZ18mu2sFLkDujITNvLWrYZi1BYFpu0qXMlFjiVtB
	 O2qUPEFkk6+vQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 01:12:32 +0100
Message-Id: <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Alvin Sun"
 <alvin.sun@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
In-Reply-To: <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6045-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.dev,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22795180277
X-Rspamd-Action: no action

On Sun Feb 22, 2026 at 5:13 PM CET, Danilo Krummrich wrote:
> There is no limitation from the Rust side of things, as mentioned in [1],=
 this
> should work perfectly fine, but it might be slightly less convinient:

When I wrote this on Sunday, I should have been much more precise about thi=
s,
since it actually does not work perfectly fine without further changes that
would (re-)introduce ordering constraints for drivers on the probe() side o=
f
things that I want to avoid.

The "re-" is in braces as we never had those ordering constraints in Rust, =
but
we have quite a lot of them in C, where they cause endless problems. Which =
is
why I want to avoid them in Rust.

> Example 1:
>
> 	impl rtc::Ops for MyRtcOps {
> 	    type BusDeviceType =3D platform::Device<Bound>;
>
> 	    fn read_time(
> 	        parent: &platform::Device<Bound>,
> 	        time: &mut rtc::Time,
> 	    ) -> Result {
> 	        let drvdata =3D pdev.as_ref().drvdata::<MyDriver>()?;
>
> 	        ...
> 	    }
> 	}

Let's have a look at the corresponding probe() side of things.

	struct SampleIrqData;

	// The bus device private data.
	#[pin_data]
	struct SampleDriver {
	    #[pin]
	    irq: irq::Registration<SampleIrqData>,
	    rtc: ARef<rtc::Device>,
	    ...,
	}

	impl pci::Driver for SampleDriver {
	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinIni=
t<Self, Error> {
	        let dev =3D pdev.as_ref();

	        let rtc =3D rtc::Device::new(dev)?;

	        Ok(impl_pin_init!(Self {
	            irq <- irq::Registration::new(...),
	            rtc,
	            _: {
	                devres::register(rtc::Registration::new(rtc))?;
	            }
	        })
	    }
	}

This is a problem, since even though the registration of the RTC device is =
the
last thing in the initializer, rtc::Ops::read_time() above could race and
Device::drvdata() could just fail as it might not be set yet.

This is fixable, but - as mentioned - at the price of introducing ordering
constraints for drivers.

For instance, this could be solved by introducing a pci::ProbeDevice<'a> ty=
pe,
which ensures that pci::ProbeDevice::set_drvdata() can only be called from
probe() and can only be called once, as it consumes the pci::ProbeDevice.

	struct SampleIrqData;

	// The bus device private data.
	#[pin_data]
	struct SampleDriver {
	    #[pin]
	    irq: irq::Registration<SampleIrqData>,
	    rtc: ARef<rtc::Device>,
	    ...,
	}

	impl pci::Driver for SampleDriver {
	    fn probe<'a>(pdev: pci::ProbeDevice<'a>, info: &Self::IdInfo) -> Resul=
t {
	        let dev =3D pdev.as_ref();

	        let rtc =3D rtc::Device::new(dev)?;

	        let data =3D impl_pin_init!(Self {
	            irq <- irq::Registration::new(...),
	            rtc,
	        });

	        // The `pci::ProbeDevice` has been consumed by value, and
	        // returned a `&pci::Device<Core>`.
	        let pdev =3D pdev.set_drvdata(data)?;

	        devres::register(rtc::Registration::new(rtc))
	    }
	}

However, note how this wouldn't solve the same problem for irq::Registratio=
n, as
it lives within the the driver's device private data.

If this would be C you would probably just partially initialize the driver'=
s
device private data, but in Rust uninitialized data is not allowed for safe=
ty
reasons.

We could probably find other ways to somehow handle this, e.g. by introduci=
ng
new device context states, additional callbacks, etc., but in the end it wo=
uld
only be workarounds for not having defined ownership, that eventually ends =
up
being more complicated and more error prone.

For this reason an irq::Registration has its own private data (which in thi=
s
example is just an empty struct).

Similarly, all other kinds of registrations (and driver entry points) have =
their
own private data, such as class devices, work and workqueues, file operatio=
ns,
timers, etc.

I.e. there is a clear separation of ownership and lifetime, which makes mor=
e or
less (often more) suble ordering constraints obsolete.

In fact, in the beginning I did not even plan to expose Device::drvdata() a=
t
all, making the driver's device private data only available in bus device
callbacks, etc.

The reason why I added it was that it was required (and makes sense) when
drivers interact with other drivers, e.g. through an auxiliary device.

I did also mention this in the commit message of commit 6f61a2637abe ("rust=
:
device: introduce Device::drvdata()"):

      (2) Having a direct accessor to the driver's private data is not
          commonly required (at least in Rust): Bus callback methods alread=
y
          provide access to the driver's device private data through a &sel=
f
          argument, while other driver entry points such as IRQs,
          workqueues, timers, IOCTLs, etc. have their own private data with
          separate ownership and lifetime.

          In other words, a driver's device private data is only relevant
          for driver model contexts (such a file private is only relevant
          for file contexts).

    Having that said, the motivation for accessing the driver's device
    private data with Device<Bound>::drvdata() are interactions between
    drivers. For instance, when an auxiliary driver calls back into its
    parent, the parent has to be capable to derive its private data from th=
e
    corresponding device (i.e. the parent of the auxiliary device).

Let's have a look at how probe() looks like for the example below, which is=
 what
we do in other subsystems, such as DRM or PWM.

> Example 3:
>
>	struct SampleIrqData {
>	    rtc: ARef<rtc::Device>,
>	};
>
> 	// The bus device private data.
> 	#[pin_data]
> 	struct SampleDriver {
> 	    #[pin]
> 	    irq: irq::Registration<SampleIrqHandler>,
> 	    rtc: ARef<rtc::Device<SampleRtcData>>,
> 	}
>
> 	// The class device private data.
> 	struct SampleRtcData {
> 	    io: Devres<IoMem<PL031_REG_SIZE>>,
> 	    hw_variant: VendorVariant,
> 	}
>
> 	impl rtc::Ops for MyRtcOps {
> 	    type BusDeviceType =3D platform::Device<Bound>;
>
> 	    fn read_time(
> 	        rtc: &rtc::Device<SampleRtcData>
> 	        parent: &platform::Device<Bound>,
> 	        time: &mut rtc::Time,
> 	    ) -> Result {
> 	        let io =3D rtc.io.access(parent)?;
>
> 	        match rtc.hw_variant {
> 	            VendorVariant::Arm | VendorVariant::StV1 =3D> {
> 	                let my_time =3D io.read(...);
>
> 	                my_time.write_into(time);
> 	            },
> 	            VendorVariant::StV2 =3D> { ... },
> 	        }
> 	    }
> 	}
>

	impl pci::Driver for SampleDriver {
	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinIni=
t<Self, Error> {
	        let dev =3D pdev.as_ref();

	        let rtc_data =3D impl_pin_init!(SampleRtcData {
	            io: iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
	            hw_variant: VendorVariant::StV1,
	        });

	        let rtc =3D rtc::Device::new(dev, rtc_data)?;

	        // Internally calls `devres::register(rtc::Registration::new())`.
	        rtc::Registration::register(rtc)?;

	        Ok(impl_pin_init!(Self {
	            // Give the IRQ handler a reference count of the `rtc::Device`=
.
	            irq <- irq::Registration::new(..., rtc.clone()),
	            rtc,
	        })
	    }
	}

With this there are no (subtle) ordering constraints the driver has to get
right; ownership and lifetimes are well defined.

(I.e. whatever order a driver picks, it either works properly or it does no=
t
compile in the first place, which is a huge improvement over the situation =
we
have in C.)

