Return-Path: <linux-rtc+bounces-6016-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5kkNHyUrm2nfuQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6016-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 17:13:25 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80916F98D
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 17:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 709F53002F79
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 16:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC2F3502B4;
	Sun, 22 Feb 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbeuThbf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF82B9B7;
	Sun, 22 Feb 2026 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771776800; cv=none; b=Ze3NgITpWGx1wpfu8AiCCtMNtOho+x4DS4xgCqw/mU9NncsBUaYy2GntwO2Cpruw0jlW4bvCLP9ytJWygMTBGB5F5FQKutpLAlhVnOaRxjrA9hBK93dCtAsdusDm1OcN89hqBhmgEkrGpabe6SyQbxR6xelLjIk4rzClKbW+BJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771776800; c=relaxed/simple;
	bh=0uHqYO6AEOaaPI4NW1bgjpfZn41WJvwRuhen1mUaE+E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DlHsWOiuHpp5GGp7ifGfYn8i8Kqs61j43Ma4W/07TjbejKx/MWIadQxkP/ENEVuPV13JbC+cs6rqxz7j2kVu9qcvsbGpjBa6WhCXuvPqB1549X+4E0aHCeaHkHHy/2judzIaiYBsOqxlhnklTA8krH0L722thcB4NQ0YihSqS00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbeuThbf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255C0C116D0;
	Sun, 22 Feb 2026 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771776799;
	bh=0uHqYO6AEOaaPI4NW1bgjpfZn41WJvwRuhen1mUaE+E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=hbeuThbfKjBK4SIYQnXPSrNFtWEleAP7kq+KK5BS57OsY6+8+NipjfQZLSQZtqgLD
	 sQNbeXmnJY4Htz0vrBD9XiCkN+8Z5sseOe4STR3T7fvZ9/t4GjZYUWRAFaPND74HPa
	 5Ir3WbmXv02msxj9kcFa5MItERu+czPqZ1f/wolQKXVSy2xKiT1tQH9wlFMyLRHt2t
	 Jr7Z7gq2p6/VZZLvD4GZcPJIRA1/LuS7y8jDZKqRVPtg8x7jETx+4CY648wnszcDHg
	 zRMm6dhCMdA2S1IuWHjbL9ToKoF/XNccPCbql85srI5xPnEWfXVfkFAol1cqUKAu3E
	 WKa3Ptb97OVeA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 17:13:14 +0100
Message-Id: <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
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
In-Reply-To: <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6016-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D80916F98D
X-Rspamd-Action: no action

On Sun Feb 22, 2026 at 3:01 PM CET, Rafael J. Wysocki wrote:
> General considerations aside, regarding the $subject patch, I don't
> think that it is an improvement because it would confuse the existing
> RTC class device interface quite a bit.
>
> Regarding whether or not switching over the RTC class device interface
> to passing RTC device pointers to its class callbacks is a good idea,
> I think that the difference really boils down to what data needs to be
> accessed by the driver.
>
> As it stands today, in an RTC class callback, the driver gets directly
> to the parent of the given RTC device and if it does not need to get
> to the RTC device at all, that's convenient.  However, if the driver
> needs to get to the RTC device, it will most likely need to use
> driver_data in the parent device for this purpose (and store the RTC
> device pointer).
>
> If the interface were changed to pass RTC device pointers to class
> callbacks, the driver would get to the RTC device and from there it
> would need to get to the parent device in the majority of cases.  Even
> though getting from an RTC device to its parent device is
> straightforward (and does not require using driver_data at all), in
> some drivers that would be an extra step that would make the picture
> somewhat less clear than it is today (and arguably less clear than it
> really needs to be).  Still, the change of the interface might allow
> some other drivers that do access the RTC device in class callback
> functions to be simplified.
>
> Granted, the above options had already been there when the RTC class
> interface was designed and the choice was made at that time.  Revising
> it now would require clear technical reasons IMV.
>
> How hard would it be for Rust to cope with the existing calling
> convention in the RTC class?

There is no limitation from the Rust side of things, as mentioned in [1], t=
his
should work perfectly fine, but it might be slightly less convinient:

Example 1:

	impl rtc::Ops for MyRtcOps {
	    type BusDeviceType =3D platform::Device<Bound>;

	    fn read_time(
	        parent: &platform::Device<Bound>,
	        time: &mut rtc::Time,
	    ) -> Result {
	        let drvdata =3D pdev.as_ref().drvdata::<MyDriver>()?;

	        ...
	    }
	}

We can improve this by avoiding that the driver has to extract its bus devi=
ce
private data all the time by doing this instead:

Example 2:

	impl rtc::Ops for MyRtcOps {
	    type BusDeviceType =3D platform::Device<Bound>;
	    type BusDeviceData =3D MyDriver;

	    fn read_time(
	        parent: &platform::Device<Bound>,
	        drvdata: &MyDriver,
	        time: &mut rtc::Time,
	    ) -> Result {
	        ...
	    }
	}

However, this would require to type the rtc::Device over the bus device pri=
vate
data type, which works perfectly fine, but arguably is a bit odd.

The alternative to make it convinient for drivers and avoid this oddity is =
to
just let drivers store the data that needs to be accessed from class device
callbacks in the class device private data and data that is only needed in =
bus
device callbacks in the bus device private data. Additionally, drivers can =
of
course save a refcount of the class device in their bus device private data=
 as
well.

This is mostly what patch 5 of this series currently does (with a few
modifications) and I personally think it's the most clean approach in terms=
 of
how it turns out for drivers:

Example 3:

	// The bus device private data.
	#[pin_data]
	struct MyDriver {
	    #[pin]
	    irq: irq::Registration<MyIrqHandler>,
	}

	// The class device private data.
	struct MyRtcData {
	    io: Devres<IoMem<PL031_REG_SIZE>>,
	    hw_variant: VendorVariant,
	}

	impl rtc::Ops for MyRtcOps {
	    type BusDeviceType =3D platform::Device<Bound>;

	    fn read_time(
	        rtc: &rtc::Device<MyRtcData>
	        parent: &platform::Device<Bound>,
	        time: &mut rtc::Time,
	    ) -> Result {
	        let io =3D rtc.io.access(parent)?;

	        match rtc.hw_variant {
	            VendorVariant::Arm | VendorVariant::StV1 =3D> {
	                let my_time =3D io.read(...);

	                my_time.write_into(time);
	            },
	            VendorVariant::StV2 =3D> { ... },
	        }
	    }
	}

(Note how we can directly access the `io` and `hw_variant` fields from `rtc=
`.)

If the data from struct MyRtcData is also needed from other bus callbacks, =
we
can simply extend struct MyDriver:

	#[pin_data]
	struct MyDriver {
	    #[pin]
	    irq: irq::Registration<MyIrqHandler>,
	    rtc: ARef<rtc::Device<MyRtcData>>,
	}

But again, I just want to make sure we do not encourage to just throw all t=
he
private data a driver may potentially have into the bus device private data
struct.

Besides that, it is of course a subsystem decision and I don't want to be
presumptuous or anything.

My recommendation is to go with something like in (3), otherwise I'd choose=
 (1)
and (2) is my least favorite as I think it is a bit odd to type a class dev=
ice
over bus device private data.

[1] https://lore.kernel.org/all/DGLLJ541SEJW.160MET6OCQHKS@kernel.org/

