Return-Path: <linux-rtc+bounces-6052-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A5XFYLTnWk0SQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6052-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 17:36:18 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC015189DB1
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 17:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87B8230927C5
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694063A8FEA;
	Tue, 24 Feb 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jybKs8Q6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456343A8FE1;
	Tue, 24 Feb 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950928; cv=none; b=AvlIvL7g4Rvmw03C+FfU7PIJh8VuUsMmY+wFBux5mAyqhgO3OO0y9xyIin7C8xyeXDBrmmPXzS6cOY+5K1J+I7xza5d4HSIqTCuJ9QlNdD2cKvcx1VlYD0IVGXVmTffdvhOrqehVOmNLoM7VBZIvU9QV7ByaR7N4DZnwjKQ/C7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950928; c=relaxed/simple;
	bh=OzigO6c+dArWtHRsz+dmj92Kzhjc1yxExDnuGmeqgbU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=N0E2rPm0Su6ddgynA688czIe1729VK9VYa94eyDATvOexKpTqk7+bemCXUTsNTr/ar1Y0V5sWrxPgTKVz+s7Df514GFapLi8E7Pyqf8doix2hggBD0mSLpgxA+Pb7UMhlNEV0bidXRojHGwY8hUC72bzaua0GpJba1ozOafOMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jybKs8Q6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C561C116D0;
	Tue, 24 Feb 2026 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771950927;
	bh=OzigO6c+dArWtHRsz+dmj92Kzhjc1yxExDnuGmeqgbU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jybKs8Q6AGFvL6l1KQlMjPGeATR1Z42nW3evbAPMII/s0DasJr72DxR0ZlF7AEX8q
	 LucXAw48wFPXZuLSvty6DFPUZiQY9GcobN7PP/cJHB97ZkdWcRVHC9YZfHl85wOO4K
	 KOvngxTdw1/PfuddBug9TEN7DuRfQr8MzYsolTUoPt6e36htnG/D7l3A09MZ/tEtGB
	 JNnScTTlRDTJe5p7jweIonZR4msz32qpkaj1KRtYj8zKZy+A4uHff9HOkSFxW/Hjij
	 hsZDB59n7jS4CzC2g2MmIg8DIheiKFtcP0X0Km+XIa5a5rpLhZPUnbHrTlCQcwdsX2
	 ybdgfOOevGnew==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 17:35:23 +0100
Message-Id: <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org>
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
References: <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org> <2026022415010804e28202@mail.local>
In-Reply-To: <2026022415010804e28202@mail.local>
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
	TAGGED_FROM(0.00)[bounces-6052-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC015189DB1
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 4:01 PM CET, Alexandre Belloni wrote:
> On 24/02/2026 01:12:32+0100, Danilo Krummrich wrote:
>> 	impl pci::Driver for SampleDriver {
>> 	    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl Pin=
Init<Self, Error> {
>> 	        let dev =3D pdev.as_ref();
>>=20
>> 	        let rtc_data =3D impl_pin_init!(SampleRtcData {
>> 	            io: iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
>> 	            hw_variant: VendorVariant::StV1,
>> 	        });
>>=20
>> 	        let rtc =3D rtc::Device::new(dev, rtc_data)?;
>>=20
>> 	        // Internally calls `devres::register(rtc::Registration::new())=
`.
>> 	        rtc::Registration::register(rtc)?;
>>=20
>> 	        Ok(impl_pin_init!(Self {
>> 	            // Give the IRQ handler a reference count of the `rtc::Devi=
ce`.
>> 	            irq <- irq::Registration::new(..., rtc.clone()),
>> 	            rtc,
>> 	        })
>
> I can't really read rust yet but this seems to open a race condition
> with userspace if irq::Registration::new(...) fails, there is an
> ordering constraint you missed.

(I did not have any specific hardware in mind when sketching this up (e.g. =
an
IRQ could also only be needed in bus device callbacks, e.g. for loading fir=
mware
etc.). But for RTC it obviously is common that it is relevant to the class
device too.)

So, I assume you mean because there could already be an ioctl before the IR=
Q has
been successfully registered, and this ioctl may wait for an IRQ?

In this case the irq::Registration should go into rtc_data instead to accou=
nt
for this dependency. Unfortunately, this is a semantic dependency that we c=
an't
always catch at compile time.

The reason we sometimes can is because, if you would need access to the
irq::Registration from ioctls (e.g. for calling synchronize(), enable(),
disable() etc.) it would be caught, because you couldn't access it without =
it
being in rtc_data in the first place, and being forced to have it in rtc_da=
ta
guarantees that the ordering can't be wrong.

