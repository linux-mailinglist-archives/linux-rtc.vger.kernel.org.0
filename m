Return-Path: <linux-rtc+bounces-6075-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIFNDMokn2mPZAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6075-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 17:35:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872419ABD3
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 17:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51C893006D53
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Feb 2026 16:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C20B3D5227;
	Wed, 25 Feb 2026 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGexLGMP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF43D4110;
	Wed, 25 Feb 2026 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036811; cv=none; b=bU1xEMPLAOdmIiFSN5+BwhefhlXuUll0oaJGRnJsNl6c8mN/CpSJEgokvYNR0CkYzaLmUDcyhuNztDeU6Izq9f2iLNNew6gMdHpc/9NHXiWQ67bmZnHVzrPXEFtAkduYaB12ywp8ZC5ypry+LYIxpnfdB5KHT10q+V/BUFo1oIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036811; c=relaxed/simple;
	bh=YUN9M0AR4tx7LcUF/R+6u5VZbMi7IE1VKfYANVdBxkI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fbS0x6L6SV3gv7uirZi/Drxx6MNbvSUGpgyqpOZQHwNGYp/cSynR38dP2nkxh2XHdydQwPbrddPuSCsh4aWz82kTEOUNzu34whVcgRthOz7RryidJgCiWqrcGVw/RAOZDYe60XXSen5YhdUl0ukzLjcxiKnETIOr+Y53ze7asbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGexLGMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB2EC116D0;
	Wed, 25 Feb 2026 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772036810;
	bh=YUN9M0AR4tx7LcUF/R+6u5VZbMi7IE1VKfYANVdBxkI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GGexLGMPjLpx0LmPFOJBELVinx2geWAs5rZ8WmuSl4lCq/BfvAHDQ/AQr3OSko5BL
	 +auam0L7mAlBPzgKtNJnDZo4gAb1l5OhnhK8H0l+5D3fHNne9EmsyUbUL7S0kWVE30
	 clrXPdUlXaceDAfY80CHRwuku0iGO0foydZJVSonas1xbM6unQZPBxwFoyHSje+oxV
	 oSXoW3JKB8KJYXPao82ei8zZAjGeyPNTndN4cGpTUvo44F0ckr5Hf11MdRuW190ZBX
	 HxgO7i03bgVuF0IY9hsGuPetTadNQVC8FqFNewrq1+6olwWoACgzx942rFUMaSww9R
	 Tde+TjXStwiUg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 17:26:46 +0100
Message-Id: <DGO6MEKIIHGH.3L06QJ47CP3CU@kernel.org>
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
References: <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org> <2026022415010804e28202@mail.local>
 <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org> <20260224172822de7f4569@mail.local>
 <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org>
 <CAJZ5v0iA88G0ZRVB347dXEu2y8mT=d+aWd42cB2tpO5pLVpKuQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0iA88G0ZRVB347dXEu2y8mT=d+aWd42cB2tpO5pLVpKuQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6075-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.970];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 9872419ABD3
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 2:33 PM CET, Rafael J. Wysocki wrote:
> On Tue, Feb 24, 2026 at 11:23=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>> Here's also some sketched up code for what I wrote above:
>>
>>         fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl =
PinInit<Self, Error> {
>>             let dev =3D pdev.as_ref();
>>
>>             let rtc_data =3D impl_pin_init!(SampleRtcData {
>>                 io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar=
0")?,
>>                 hw_variant: VendorVariant::StV1,
>>                 irq <- irq::Registration::new(...),
>>             });
>>
>>             let rtc =3D rtc::Device::new(dev, rtc_data)?;
>>
>>             rtc::Registration::register(rtc)?;
>>
>>             Ok(Self { rtc })
>>         }
>>
>> Note that if any of the RTC callbacks would ever need to call irq.synchr=
onize(),
>> irq.disable(), etc. the compiler would enforce correct ordering, as ther=
e would
>> not be any other possibility to put the irq::Registration other than int=
o the
>> rtc_data that goes into rtc::Device::new().
>
> IIUC, the interrupt handler can only access the rtc_data because the
> parent's driver_data may not exist yet when it runs.  Or am I missing
> something?

In the code above the IRQ handler can also not access rtc_data, as struct
SampleRtcData might not be fully initialized when it runs, i.e.

	let rtc_data =3D impl_pin_init!(SampleRtcData {
	    io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
	    hw_variant: VendorVariant::StV1,
	    irq <- irq::Registration::new(..., rtc_data),
	});

would not compile in the first place.

irq::Registration, for this purpose, has its own private data on the handle=
r
itself, see also [1]. In fact, the C code has the same concept with the dev=
_id
argument in request_threaded_irq() [2].

The difference is that the C compiler does not ensure that the IRQ handler
actually owns the data behind the dev_id pointer. I.e. the driver has to so=
mehow
ensure that whatever is behind the dev_id pointer remains valid for the dur=
ation
the IRQ handler is registered.

In the Rust implementation the compiler does ensure that what is behind the
dev_id pointer remains valid for the duration of the lifetime of the
irq::Registration.

Having that said, I assume you wonder what we would pass into the
irq::Registration instead, if it is not rtc_data.

The answer is it depends; it depends on what's actually needed, what other
entities interact with the IRQ (e.g. some scheduled work, etc.) and maybe e=
ven
preference to some extend.

Here is one example:

	let irq_data =3D impl_pin_init!(SampleIrqData {
	    io <- pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
	    hw_variant: VendorVariant::StV1,
	});

	let rtc_data =3D impl_pin_init!(SampleRtcData {
	    irq <- irq::Registration::new(..., irq_data),
	    ...,
	});

	let rtc =3D rtc::Device::new(dev, rtc_data)?;

This would compile as it ensures that irq_data (struct SampleIrqData) is fu=
lly
initialized before irq::Registration::new() is called.

At a first glance this might look like we need an additional allocation, on=
e for
irq_data and one for rtc_data, but that is not the case. irq_data is an
initializer that is passed to another initializer, i.e. rtc_data is still a=
n
initializer.

The actual (single) allocation happens in rtc::Device::new().

In terms of accessing it through the the rtc::Device in an RTC device callb=
ack,
we would likely use accessor methods to make it a bit more convinient, i.e.

	    fn read_time(
	        rtc: &rtc::Device<SampleRtcData>
	        parent: &platform::Device<Bound>,
	        time: &mut rtc::Time,
	    ) -> Result {
	        let io =3D rtc.io().access(parent)?;

	        match rtc.hw_variant() {
	            VendorVariant::Arm | VendorVariant::StV1 =3D> {
	                let my_time =3D io.read(...);

	                my_time.write_into(time);
	            },
	            VendorVariant::StV2 =3D> { ... },
	        }
	    }

As mentioned above there are a few other options to implement this, dependi=
ng on
what's required, etc.

For instance, if the I/O bar is actually shared between multiple entities w=
e
might want to initialize it within an Arc [3] (reference count it) for shar=
ed
ownership.

For the future we will also be able to support references within initialize=
rs to
other pinned fields, which make things a bit more convinient, so you could =
do
things like this:

	let irq_data =3D impl_pin_init!(SampleIrqData {
	    io <- pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
	    hw_variant: VendorVariant::StV1,
	});

	let rtc_data =3D impl_pin_init!(SampleRtcData {
	    irq <- irq::Registration::new(..., irq_data),
	    io: &irq.io,
	    ...,
	});

	let rtc =3D rtc::Device::new(dev, rtc_data)?;

Note the additional `io: &irq.io,` in the rtc_data initializer. This would =
be
legal as we know that `irq` is pinned within `rtc_data`, hence it is valid =
to
hold a reference to one of its pinned fields.

I am not sure how far we are from having this supported, I assume Benno and=
 Gary
can say more about this.

I hope this helps, and thanks for asking those questions!

[1] https://rust.docs.kernel.org/kernel/irq/struct.Registration.html
[2] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/irq/manage.c#L20=
90
[3] https://rust.docs.kernel.org/kernel/sync/struct.Arc.html

