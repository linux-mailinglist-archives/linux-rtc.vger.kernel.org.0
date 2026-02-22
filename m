Return-Path: <linux-rtc+bounces-6004-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMzOFGz7mmntowMAu9opvQ
	(envelope-from <linux-rtc+bounces-6004-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 13:49:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272616F127
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 13:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF50B300A59B
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 12:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96232405E1;
	Sun, 22 Feb 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnfkM8QM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4023D2A1;
	Sun, 22 Feb 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771764582; cv=none; b=OflcIo9JjOl60J8CTTWJNBD6h2H22wOZM2aWttA849cdf3YBkrk9DgqNhN5jujiWghE7HbiQ3YECg8kQ00vm/rq18q3MiL+nnbQMJYe/dXQGmpB3/VqnwAZcbWzPA271dy+OZOWtnmkRPhTftorI/H4TiKqg9MX9sQNQFVMfFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771764582; c=relaxed/simple;
	bh=D1vodKIQU5ZPSo6JbgHqudOlGasjt/YqcXS8xQTf+lk=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version:
	 References:In-Reply-To; b=mZmkuX6AQUDAw2Vqe7nNtOvvrhlmP4E7CH+GxeUFeKuLOxU+1LTdtrZim6yTCWJILqjuHIpbmCP65+CFoo/g/IhKvHesjm5WYUJc4v+xYQj+5/xkiXsOvcQJ/16TCJji6U7jNy193LUMxiLZBUMzIt+RFeUVwqjnyyyoqOtR5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnfkM8QM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C055C116D0;
	Sun, 22 Feb 2026 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771764582;
	bh=D1vodKIQU5ZPSo6JbgHqudOlGasjt/YqcXS8xQTf+lk=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=rnfkM8QMNLb10ntQ6i2xinpRWD5t1T9HsjO8mZWkXlV8/QuhN4rHf43Vxu//KseA/
	 2nuCk4PIYasHexRzw0810mytwGRg7msK8eotO/uq4dGzRiVo5Re/RbLHX/4WEq0XoB
	 tMpWGPKaeTUbpWB01e6qFLyXTnG+2QxBLadkavMDHmssxKyp8ksoXw7sF0B1uCk2Ry
	 Ej/zE1vEAM7FFfAYce49o1Z6uXJ3c5WJ2CAbGrxyG0WDXCAXhcO+ILinTUNPqKWqy8
	 JLMSR5FoBJ0vR8e2nBZJogC2OjuhoA3EGFcNRDERQwgbuMkCqwN4j2MM8xxWFfXXIH
	 Z0ykddj3R2rUw==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 13:49:35 +0100
Message-Id: <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Alvin Sun"
 <alvin.sun@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
In-Reply-To: <20260222000556ea1938c0@mail.local>
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
	TAGGED_FROM(0.00)[bounces-6004-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 8272616F127
X-Rspamd-Action: no action

On Sun Feb 22, 2026 at 1:05 AM CET, Alexandre Belloni wrote:
> On 21/02/2026 15:33:48+0100, Danilo Krummrich wrote:
>>   (2) Bus device private data vs. class device private data.
>>=20
>>   The change to pass a struct rtc_device in class device callbacks of RT=
C,
>>   rather than the base struct device of the corresponding bus device (e.=
g. AMBA,
>>   platform, etc.) should not aim at storing all data in rtc->dev.private=
_data
>>   that was previously stored in rtc->dev.parent->private_data.
>>=20
>
> But what you explain here is that the drive is forbidden to use
> rtc->dev.parent->private_data at all because the rust core is already
> using it. What I'm saying is that it won't work because more than half
> of the drivers currently need it.

I think I was explaining the exact opposite, i.e. the driver's bus device
private data is stored in the exact same way as in C, but it has a defined
lifetime (from probe() until remove() and all devres callbacks have been
completed) and is managed by the driver-core.

Look at this example:

	// The bus device private data.
	struct SampleDriver {
	   foo: u32,
	   bar: u32,
	}
=09
	impl pci::Driver for SampleDriver {
	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinIni=
t<Self, Error> {
	        // Return the driver's bus device private data. The driver-core
	        // will do all the work for us and eventually call
	        // `dev_set_drvdata()` on the base `struct device` of `pdev`.
	        Ok(Foo {
	            foo: 42,
	            bar: 24,
	        })
	    }
=09
	    fn unbind(pdev: &pci::Device<Core>, self: Pin<&Self>) {
	        // Use the driver's device private data from the method's `self` a=
rgument.
	        dev_info!(pdev, "foo: {}, bar: {}\n", self.foo, self.bar);
=09
	        // There's also the `Device<Bound>::drvdata()` accessor, let's
	        // use that as well.
=09
	        // Get a generic `device::Device` from the `pci::Device`.
	        let dev =3D pdev.as_ref();
=09
	        // Get the `drvdata`; we have to assert the type and let the drive=
r-core
	        // validate that the asserted type is correct.
	        let drvdata =3D dev.drvdata::<SampleDriver>()?;
=09
	        dev_info!(pdev, "foo: {}, bar: {}\n", drvdata.foo, drvdata.bar);
	    }
	}

>> This thread seems to contain quite a bit of confusion and misunderstandi=
ngs --
>> let me try to clarify.
>>=20
>>   (1) How Rust handles bus device private data.
>>=20
>>   In Rust the probe() function of a bus implementation (platform, PCI, e=
tc.)
>>   returns an initializer (impl PinInit<T, Error>) for the driver's devic=
e
>>   private data.
>>=20
>>   The bus implementation takes this initializer and passes it (together =
with the
>>   underlying struct device) to the driver-core. The driver-core allocate=
s the
>>   required memory, initializes the memory with the given initializer and=
 stores
>>   a pointer to the corresponding object with dev_set_drvdata().
>>=20
>>   So, technically, in Rust all platform drivers call platform_set_drvdat=
a().
>>=20
>>   (Note that this is also true when the driver's device private data typ=
e is
>>   empty (i.e. it has no fields). In this case it could still have a dest=
ructor
>>   that must be called when the device private data structure is destroye=
d. Of
>>   course there is no real memory allocation when the struct's size is ze=
ro.)
>>=20
>>   The driver's device private data can only be accessed when the bus dev=
ice is
>>   bound to the driver, i.e. the driver can only access it with a &Device=
<Bound>;
>>   it (the driver's device private data) is automatically freed by the
>>   driver-core when remove() and all devres callbacks have been completed=
.
>>=20
>>   I.e. the rules are - of course - the same as on the C side, but they a=
re
>>   enforced by the type system and the driver-core code.
>>=20
>
> This still doesn't explain how you get the class private data that you
> need when you are in a driver callback that is called from the bus (e.g.
> suspend/resume) from what you explain, the driver doesn't have any
> chance to pass it. The whole goal of a device driver is to be the glue
> between a class device and a bus device as essentially this is the exact
> physical device, just represented differently.

It is not always as simple as "one bus device corresponds to one class devi=
ce".

Sometimes drivers have to deal with multiple class devices for a single bus
device, sometimes they are separated through the auxiliary bus or MFD.

For instance, take struct net_device. In the context of cfg80211 wireless
drivers may create arbitrary struct net_device instances, depending on how =
often
the add_virtual_intf() callback is called (through netlink); example in [1]=
.

Now, regarding your question "How to access class device private data from =
bus
device callbacks?". Nothing prevents a driver from embedding the class devi=
ce in
its bus device private data in one or the other way.

In the net device example above, the driver would probably keep a list (or
xarray, etc.) of net devices in its bus device private data, as they can be
created and removed at any point of time.

(Note that this is also a good example for when the class device private da=
ta
lives shorter than the bus device private data.)

Here is an example of this looks like in code using a DRM device as class
device.

	struct SampleIrqData;

	// The class device private data.
	struct SampleDrm {
	    sched: drm::GpuScheduler,
	}

	// The bus device private data.
	#[pin_data]
	struct SampleDriver {
	    #[pin]
	    irq: irq::Registration<SampleIrqData>,
	    drm: ARef<drm::Device<SampleDrm>, // Refcount of a `drm::Device`.
	}
=09
	impl pci::Driver for SampleDriver {
	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinIni=
t<Self, Error> {
	        let dev =3D pdev.as_ref();

	        let drm =3D drm::Device::new(dev, SampleDrm::new()?)?;
	        drm.register();

	        Ok(impl_pin_init!(Self {
	            irq <- irq::Registration::new(...);
	            drm,
	        })
	    }
=09
	    fn unbind(pdev: &pci::Device<Core>, self: Pin<&Self>) {
	        self.irq.synchronize();
	        self.drm.flush_scheduler();
	    }
	}

Note that the irq::Registration is dropped when the bus device is unbound,
whereas the GpuScheduler is dropped when the DRM device is dropped.

Of course, depending on the actual class device this difference may be more=
 or
less important, i.e. absolutely crucial in the net device example, less
important for RTC apparently. But it is always good to be precise about
ownership and lifetime of data.

As I already mentioned, I don't think it is good to fold ownership and life=
time
for bus and class devices together in cases where it happens that they are
mostly identical, i.e.:

>>   I think it would be good to keep driver authors finding a common patte=
rn,
>>   where class device callbacks carry the corresponding class device stru=
ct
>>   (instead of the parent base struct device).
>>
>>   Especially on the Rust side we now have the chance to make the experie=
nce
>>   of writing drivers as consistent as possible, which should help (new)
>>   driver authors a lot in terms of learning the driver lifetime patterns=
.

[1] https://elixir.bootlin.com/linux/v6.19.2/source/drivers/net/wireless/mi=
crochip/wilc1000/netdev.c#L948

