Return-Path: <linux-rtc+bounces-6014-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cq0FfQgm2n6tAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6014-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 16:29:56 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9116F87B
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 16:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AA36300824D
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF47205E25;
	Sun, 22 Feb 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtmKuQ6C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B791E5702;
	Sun, 22 Feb 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771774193; cv=none; b=XOSl7FfCca5mAN2v1Vf62KDiT0L/71g1FVVvpDLcbE5JcHmfSlQACUyieqUlGcryDOb04W07mdam5Fimauw+NN4Jg7G/4Ykcrajows+tK3yqi/ijNtyVquDN6KeAfYHRS/XvuJDvMnLV3PiSPgAWJvo8VbeFzKvX0jpNnYk2bFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771774193; c=relaxed/simple;
	bh=5CBBUksxiAvYzZohmg7UEmmxjex9id3jZ5rz19HAgPQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=MO1V7A916aBWVpxQhMZFUHoAESpHg3V8/aDhGrZbvwhhXfSLqRH1bTA2UlPZFIO5tKcnSy8k2WLT13Qe+v3CdcRI17dMTbfT3Te70l4qbxF1XY5Jv4iaCPWt2hU9IwcxQ5Ya9v/MugaY+Pnqc/bBt4Vvwu+0RZejfVfGsGY88Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtmKuQ6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC660C116D0;
	Sun, 22 Feb 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771774193;
	bh=5CBBUksxiAvYzZohmg7UEmmxjex9id3jZ5rz19HAgPQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=CtmKuQ6CIWnmm7lVEe1nCDZ/33gKHGYbh11FpB3LNBVRpd928Lm4xnbFW82UiS5/c
	 V0k0ysGkB/DDv9y7SWyZhjJv2zC/M5tE1sNiVU7wZeRw7Ds2GOAnt/B0hDQMLy4F6T
	 woY0Fn9Joc5/i4cHZ/4iJagYTX8sdCaGdXGuJTh0aJuGWtdXzIjpNWnN+ufeDoWSpP
	 yTCUdCb6Cm/FCoqkKEj6O5mqL3MLr2FgBXuWTfA077aKZoe1WFO4iUBHBq1idaAUTW
	 NhVO3gZt9TdJgAxPMK7+iObiDP+6jM6JtmxNXNeWUNkMZEbOw1SHDGVsPBMALmhfPm
	 l0DURKm2pB46A==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 16:29:47 +0100
Message-Id: <DGLLJ541SEJW.160MET6OCQHKS@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
 <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6014-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6F9116F87B
X-Rspamd-Action: no action

On Sun Feb 22, 2026 at 1:25 PM CET, Rafael J. Wysocki wrote:
> On Sat, Feb 21, 2026 at 3:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
>> > On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
>> > <alexandre.belloni@bootlin.com> wrote:
>> >> > > Out of 29 drivers, 18 are doing so.
>> >
>> > The vast majority of around 50 platform drivers I've inspected
>> > recently use platform_set_drvdata() or equivalent in probe.
>>
>> This thread seems to contain quite a bit of confusion and misunderstandi=
ngs --
>> let me try to clarify.
>>
>>   (1) How Rust handles bus device private data.
>>
>>   In Rust the probe() function of a bus implementation (platform, PCI, e=
tc.)
>>   returns an initializer (impl PinInit<T, Error>) for the driver's devic=
e
>>   private data.
>>
>>   The bus implementation takes this initializer and passes it (together =
with the
>>   underlying struct device) to the driver-core. The driver-core allocate=
s the
>>   required memory, initializes the memory with the given initializer and=
 stores
>>   a pointer to the corresponding object with dev_set_drvdata().
>>
>>   So, technically, in Rust all platform drivers call platform_set_drvdat=
a().
>
> So do I understand correctly that the driver is required to tell the
> core what type its driver_data will be and then the core will allocate
> memory for it and clean it up on remove?

Yes, but it's not really that the driver actively has to tell the driver-co=
re,
etc.

probe() functions return an initializer for the driver's device private dat=
a, so
the type is known anyways.

	    fn probe(
	        pdev: &pci::Device<Core>,
	        info: &Self::IdInfo,
	    ) -> impl PinInit<T, Error> {
	        ...
	    }

So, the return type is a fallible initializer for T, where T is the type of=
 the
driver's device private data.

I assume this may sound a bit odd with little or no Rust experience. Hence,=
 for
people without much Rust experience reading along a quick explanation:

On the more general side of things, Rust has a very powerful type system, w=
hich
includes generics, hence modeling such kind of things with generics is pret=
ty
straight forward and preferred over passing void pointers.

But there is also a much more specific reason; In C dev_get_drvdata() has t=
wo
pitfalls:

  (1) The pointer returned by dev_get_drvdata() is only valid as long as th=
e
      bus device is bound to the driver.

  (2) The driver has to cast the pointer returned by dev_get_drvdata() to t=
he
      correct type.

Since Rust is a memory safe language, we can't allow UB for safe APIs. Henc=
e,
the Rust Device::drvdata() [1] method has to consider both (1) and (2).

(1) is rather simple as we have a type state found bound devices, i.e.
Device<Bound>, so drvdata() is simply only implemented for Device<Bound>.

(2) is much more tricky as we can't statically type the device over its pri=
vate
data, as a single device instance can be bound to multiple drivers at runti=
me.

Hence, we need a runtime check, which the driver-core does for us. When a d=
river
calls the drvdata() method it looks like this:

	fn foo(dev: &Device<Bound>) -> Result {
	    let data =3D dev.drvdata::<MyDataType>()?;

	    data.bar();
	}

The driver-core takes care of checking that the private data associated wit=
h
`dev` actually is of type MyDataType. If this is not the case, the call sim=
ply
fails.

The alternative would be an infallible unsafe API, such as:

	fn foo(dev: &Device<Bound>) -> Result {
	    // SAFETY:
	    // - `dev` is guaranteed to be bound, because ...
	    // - The private data type of `dev` is guaranteed to be
	    //   `MyDataType`, since ...
	    let data =3D unsafe { dev.drvdata::<MyDataType>() };

	    data.bar();
	}

[1] https://rust.docs.kernel.org/kernel/device/struct.Device.html#method.dr=
vdata

>>   (Note that this is also true when the driver's device private data typ=
e is
>>   empty (i.e. it has no fields). In this case it could still have a dest=
ructor
>>   that must be called when the device private data structure is destroye=
d. Of
>>   course there is no real memory allocation when the struct's size is ze=
ro.)
>
> So in the simplest case when the driver doesn't need driver_data at
> all, it will just use a struct with no fields as that driver_data
> type, IIUC.

Yes, it would look like this:

	struct SampleDriver;
=09
	impl pci::Driver for SampleDriver {
	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinIni=
t<Self, Error> {
	        if !validate_something() {
	            return Err(EINVAL);
	        }
=09
	        Ok(Self)
	    }
	}

>>   But at the same time, this is what leads to a lot of lifetime problems=
 and
>>   memory bugs and it is one of those things that Rust aims at avoiding b=
y being
>>   very strict about initialization, ownership and lifetimes.
>
> As a general rule, I agree, but I would advise against applying
> general rules automatically everywhere.
>
>>   However, I do also recognize that drivers creating an RTC device are t=
ypically
>>   very simple and in practice I would not be surprised if it turns out t=
hat it
>>   happens that drivers keep the struct rtc_device alive from probe() unt=
il the
>>   bus device is unbound from the driver, i.e. lifetimes just end up bein=
g almost
>>   the same. But I don't know if that's always the case.
>>
>>   Regardless of that, I think it would be good to keep driver authors fi=
nding a
>>   common pattern, where class device callbacks carry the corresponding c=
lass
>>   device struct (instead of the parent base struct device).
>
> TBH I'm not really convinced about this particular thing and I think I
> can provide an illustrative example.
>
> Namely, quite incidentally, I've recently set out to add an RTC class
> device to an existing driver, which is the ACPI time and alarm device
> (TAD) one.  The TAD functionality is based on ACPI control methods
> provided by the platform firmware and it may (or may not) include
> RTC-equivalent functions.  So far, the driver has been providing a
> completely custom sysfs interface to user space, but since more and
> more platforms contain an ACPI TAD and some of them may not contain a
> "traditional" RTC, having an RTC class device interface in that driver
> may be quite useful.
>
> I have a prototype of the requisite change (I'll post it shortly for
> reference) and it turns out that because the RTC class callbacks take
> the parent device pointer as an argument, wrapping them around the
> existing driver routines backing the existing sysfs interface is
> super-straightforward.  Had the RTC class passed an RTC device pointer
> to those callbacks, the driver would have had to do something to get
> back from it to the parent device (which is what the driver really
> works with).  If there are more similar drivers, that would have led
> to some code duplication that is in fact unnecessary.

The type system in Rust is powerfuly enough, so drivers can even get the ex=
act
type of the parent device the RTC device has as an additional argument to t=
he
callback. The infrastructure for this is in place and it is used by subsyst=
ems.
I.e. in RTC we can do something like this:

	impl rtc::Ops for MyRtcOps {
	    type BusDeviceType =3D platform::Device<Bound>;
=09
	    fn read_time(
	        rtc: &rtc::Device<MyRtcData>,
	        parent: &platform::Device<Bound>,
	        time: rtc::Time,
	    ) -> Result {
	        ...
	    }
	}

where the corresponding rtc::Device::register() method would ensure that th=
e
associated BusDeviceType matches the parent device type that is passed to
rtc::Device::register().

A real example of this can be found in the LED class device abstractions [2=
].

Note that in contrast to a bus device, class devices can be statically type=
d
over their private data: rtc::Device<MyRtcData>.

We usually also implment the Deref trait, such that rtc::Device<MyRtcData>
automatically dereferences to MyRtcData.

Having that said, if RTC drivers *never* have any private data that should =
be
associated with the RTC device exclusively (i.e. data that is only relevant=
 in
the context of class device callbacks and class device infrastructure in
general, or logically belongs to the class device), then the `rdev` argumen=
t
would indeed be always unused and hence pointless.

I usually would assume that there are such cases, but if that's really neve=
r the
case for any RTC drivers, then I agree we should change the above code to:

	impl rtc::Ops for MyRtcOps {
	    type BusDeviceType =3D platform::Device<Bound>;
=09
	    fn read_time(
	        parent: &platform::Device<Bound>,
	        time: rtc::Time,
	    ) -> Result {
	        ...
	    }
	}

This way it is at least clear what kind of device is passed through the cla=
ss
device callbacks.

[2] https://lore.kernel.org/all/20260207-rust_leds-v12-1-fdb518417b75@poste=
o.de/

> Moreover, the RTC device pointer doesn't even need to be stored
> anywhere in that driver because the driver need not use it directly at
> all and the RTC device object memory is freed by the core when the
> driver unbinds.

I don't think that is true, I think there are a few drivers accessing the R=
TC
device from IRQs or workqueues.

Besides that, quite a lot of RTC drivers actually seem to save a pointer to=
 the
struct rtc_device within their bus device private data, e.g. [3] and [4].

[3] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/rtc/rtc-ac100.c=
#L91
[4] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/rtc/rtc-cros-ec=
.c#L30

>>   Especially on the Rust side we now have the chance to make the experie=
nce of
>>   writing drivers as consistent as possible, which should help (new) dri=
ver
>>   authors a lot in terms of learning the driver lifetime patterns.
>
> Well, I'm not sure if "the experience of writing drivers as consistent
> as possible" is more important than less code duplication and simpler
> code.

Yeah, it always depends, and if there *really* is no point in having any cl=
ass
device private data in RTC, then that's of course fine too.

I just want to make sure we do not encourage to just through all the privat=
e
data a driver may potentially have into the bus device private data struct.

I saw this a lot in C drivers and it actually causes ownership and lifetime
problems.

