Return-Path: <linux-rtc+bounces-6069-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HRzAvMknmn5TgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6069-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 23:23:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33A18D1B2
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 23:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 776A0300B9CC
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 22:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AD833D6D4;
	Tue, 24 Feb 2026 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZP22ovgR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C653191BB;
	Tue, 24 Feb 2026 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971814; cv=none; b=mBbWmpfNb0Ct4PGyoPR+2nHa6hsDR5zaFyaEEj38vuQtqSzHLaiDJcywWpXjHM6yolJeFwl6ogMJRkKlDEaeKyov51TEAQNcwJyskh8trfD+vG1E9Q4KpmJQNQa3cxAhAFdOsp6u06ciRotcaRTyoLApDAQfi74ArlNGnbqn1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971814; c=relaxed/simple;
	bh=J2fynfHOABkZGDgR4kc0ETezbHngS79q+9KgNVP7N6s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ETII9T3gnmo1iFC5vQFRj5jrRda7GvZOFVb+IgSNLHZHt0x/V2yhEjXtlB4a2t7vhjDyxiahAKFzIkACySbNKGC7dXce0B249oW7sH+v8lXuZoGBiJ7/nQEeCx6J4bKpIMaC61zz/HJXuYE0gUkxVskS8ZUftDUEGNEFttxNF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZP22ovgR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009D7C116D0;
	Tue, 24 Feb 2026 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771971813;
	bh=J2fynfHOABkZGDgR4kc0ETezbHngS79q+9KgNVP7N6s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZP22ovgRHWUDHxxqVR6LASqa4J5zTropMDPU6grqSoNkL7GK56V4dwpJLU6h/Jp9A
	 SNcQgGgT9TtiGt1aTqgw6ff05kE6YhyN7za7jJBrb8MP929qJQuos70VU8ap+/pcKo
	 nnLh5a/LXb3Z/7qMyevjx5uhWRFSk2zcIo5lnkpbgTnwenQXdGlvQFbZcOJBHxYztk
	 jP/vkBeFdUZJZ/Mq3gKiTtTbuf1nJfJYYu31+rLRpANhROqfBIzJb4VyfG3dUQLJNU
	 yrVZLx0urxsppXfoS2iEfgNpOjWiHH3W4kbGR0eSaCQDodzKxqn7ZFaJhiUVwuzY+2
	 CrgQhzj+wrXyQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 23:23:29 +0100
Message-Id: <DGNJKZA00MNT.2C7NAQYG597MO@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
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
References: <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org> <2026022415010804e28202@mail.local>
 <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org> <20260224172822de7f4569@mail.local>
In-Reply-To: <20260224172822de7f4569@mail.local>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6069-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D33A18D1B2
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 6:28 PM CET, Alexandre Belloni wrote:
> On 24/02/2026 17:35:23+0100, Danilo Krummrich wrote:
>> (I did not have any specific hardware in mind when sketching this up (e.=
g. an
>> IRQ could also only be needed in bus device callbacks, e.g. for loading =
firmware
>> etc.). But for RTC it obviously is common that it is relevant to the cla=
ss
>> device too.)
>>=20
>> So, I assume you mean because there could already be an ioctl before the=
 IRQ has
>> been successfully registered, and this ioctl may wait for an IRQ?
>>=20
>> In this case the irq::Registration should go into rtc_data instead to ac=
count
>> for this dependency. Unfortunately, this is a semantic dependency that w=
e can't
>> always catch at compile time.
>>=20
>> The reason we sometimes can is because, if you would need access to the
>> irq::Registration from ioctls (e.g. for calling synchronize(), enable(),
>> disable() etc.) it would be caught, because you couldn't access it witho=
ut it
>> being in rtc_data in the first place, and being forced to have it in rtc=
_data
>> guarantees that the ordering can't be wrong.
>
> No, once you register the rtc, the character device will appear in
> userspace and may be opened, at this point, probe is not allowed to fail
> anymore which you are allowing by trying to register the IRQ so late.

This does not seem to correspond to my previous reply -- may I kindly ask y=
ou to
read it again?

Here's also some sketched up code for what I wrote above:

	fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Se=
lf, Error> {
	    let dev =3D pdev.as_ref();

	    let rtc_data =3D impl_pin_init!(SampleRtcData {
	        io: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
	        hw_variant: VendorVariant::StV1,
	        irq <- irq::Registration::new(...),
	    });

	    let rtc =3D rtc::Device::new(dev, rtc_data)?;

	    rtc::Registration::register(rtc)?;

	    Ok(Self { rtc })
	}

Note that if any of the RTC callbacks would ever need to call irq.synchroni=
ze(),
irq.disable(), etc. the compiler would enforce correct ordering, as there w=
ould
not be any other possibility to put the irq::Registration other than into t=
he
rtc_data that goes into rtc::Device::new().

Besides that, you above mentioned "probe is not allowed to fail anymore" af=
ter
the RTC device is registered and the corresponding character device becomes
visible to userspace.

While there most likely isn't any good reason for probe() to fail afterward=
s for
RTC devices, it is not the case that this isn't allowed. We generally can u=
nwind
from a class device registration. In fact, this is not different to remove(=
)
being called (immediately).

Imagine a case where a driver registers multiple class devices, or a class
device and an auxiliary device, etc.

(But I assume your point was more that for an RTC device specifically this =
would
be odd or uncommon.)

