Return-Path: <linux-rtc+bounces-6003-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMSRCeT1mmmnoQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6003-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 13:26:12 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EE16F07E
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 13:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 787E1300C801
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 12:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8A92046BA;
	Sun, 22 Feb 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVcZcblv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94515B0EC
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771763168; cv=none; b=m2wj3wZ2xaec0XTv8Ps8MDR958dFOy/eEBDOTzSVWKTI+UbF4I2cuohVwJXWHp+rxqdiIASHZ4oq8x0lY+o5vy/UfdttumHd/IK2a+1TFnnASjbH2QTPUoLmQHCBA/1f+2xTtKJ5B/opywBix/CfPqoKfa7eHzt0LbGaC8nm55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771763168; c=relaxed/simple;
	bh=I/09C4WEJE7zJIiRP9zLpThjOL9vAYCbPofgG/8LFbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJwjy2jJ1nACJAsDwTjZM9me5+MLhzmptXo9CYENvE5t4+6T/jsv4HUCsLPxvsAA/C3cuCZVqTD3QKCI/NXvZu3EO8QUx6OJdRstvI6KBVYroviLSZf9HWUiXNiIVQH8XM+b3rwbDLTkuTbfwX8Cy+APZRgYDufwCzERQ38Rd14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVcZcblv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41886C2BC87
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771763168;
	bh=I/09C4WEJE7zJIiRP9zLpThjOL9vAYCbPofgG/8LFbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eVcZcblvLBtMXj6YagSeE8avX2OmtIxNv5ocONb7qZ8Rt7Myuav5BcVHrsc3Qu1ks
	 e+DIFZXoH2GFX8RW2+pv/De7RLNDCgQsL5GdcLPp32Aph181psEJVWtpraW8Twtz3O
	 NVLv9ju+g6eSMNg7+5Ibq0I1kwgzpX4MgOZcbglJ4e0DXEHaxVzz1WCvAP8t3JqcWC
	 dwQ8YagS0Erp20KYFFVDw5KholaPrrRMCq1O6fQKc0DZ2caoxCVkJrjr+2WE1yV1y+
	 CdF3rxfkQ31uf1bvk7tkJelUi5qxeQSULtpghk1L9zg+L0fAIvOcia+cHoX4+8EPyH
	 hH0QD2v7vT08g==
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45f053b7b90so2278119b6e.0
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 04:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqSiL42KaXcDgcydt7t+mietlineLyICRfPoS3VfqwbxKMYNYjXyOWtDoh3KIOiz77sZyhIshA7UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIglddi8rf9kI7X6ozJpt/2XXiPDnkADC55+uqRC/gcGLkLfY7
	hFmGWMZfz2uKm3JhsUFzPzDCvplyuCYUCHqdGOOV8GZOUxJ0k23//I8vEUpzI4CMcLatQS+hSIW
	/bV1S4r2LJIDlJVYcbzjoyVbMGgICl20=
X-Received: by 2002:a05:6808:448e:b0:462:acd3:4c64 with SMTP id
 5614622812f47-4644613c6dbmr3702918b6e.5.1771763167076; Sun, 22 Feb 2026
 04:26:07 -0800 (PST)
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
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
In-Reply-To: <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 22 Feb 2026 13:25:53 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
X-Gm-Features: AaiRm534i2yHu0e91k7PTIo_UozbXiafjMko9imR4VATKVdVoP_DeoPy-b_ZUbI
Message-ID: <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6003-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 875EE16F07E
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 3:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
> > On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> >> > > Out of 29 drivers, 18 are doing so.
> >
> > The vast majority of around 50 platform drivers I've inspected
> > recently use platform_set_drvdata() or equivalent in probe.
>
> This thread seems to contain quite a bit of confusion and misunderstandin=
gs --
> let me try to clarify.
>
>   (1) How Rust handles bus device private data.
>
>   In Rust the probe() function of a bus implementation (platform, PCI, et=
c.)
>   returns an initializer (impl PinInit<T, Error>) for the driver's device
>   private data.
>
>   The bus implementation takes this initializer and passes it (together w=
ith the
>   underlying struct device) to the driver-core. The driver-core allocates=
 the
>   required memory, initializes the memory with the given initializer and =
stores
>   a pointer to the corresponding object with dev_set_drvdata().
>
>   So, technically, in Rust all platform drivers call platform_set_drvdata=
().

So do I understand correctly that the driver is required to tell the
core what type its driver_data will be and then the core will allocate
memory for it and clean it up on remove?

>   (Note that this is also true when the driver's device private data type=
 is
>   empty (i.e. it has no fields). In this case it could still have a destr=
uctor
>   that must be called when the device private data structure is destroyed=
. Of
>   course there is no real memory allocation when the struct's size is zer=
o.)

So in the simplest case when the driver doesn't need driver_data at
all, it will just use a struct with no fields as that driver_data
type, IIUC.

>   The driver's device private data can only be accessed when the bus devi=
ce is
>   bound to the driver, i.e. the driver can only access it with a &Device<=
Bound>;
>   it (the driver's device private data) is automatically freed by the
>   driver-core when remove() and all devres callbacks have been completed.

Well, that's what happens on the C side of things too most of the time
because driver_data is allocated at probe time, very often using
devm_kzalloc() or equivalent.

>   I.e. the rules are - of course - the same as on the C side, but they ar=
e
>   enforced by the type system and the driver-core code.

OK

>   (2) Bus device private data vs. class device private data.
>
>   The change to pass a struct rtc_device in class device callbacks of RTC=
,
>   rather than the base struct device of the corresponding bus device (e.g=
. AMBA,
>   platform, etc.) should not aim at storing all data in rtc->dev.private_=
data
>   that was previously stored in rtc->dev.parent->private_data.
>
>   Instead, it gives drivers the option to differentiate in terms of owner=
ship
>   and lifetime.
>
>   While the bus device private data has a very defined lifetime from prob=
e()
>   until the device is unbound from the driver, class device private data =
might
>   live shorter than this, or might even out-live driver unbind in some ca=
ses. It
>   really depends on the lifetime of the class device itself, which is not
>   generally defined.
>
>   Now, from a C side point of view this may not look like a big deal, as =
it
>   (unfortunately) is not that uncommon that struct fields are just initia=
lized
>   and destroyed whenever needed and the code just takes it into account.
>
>   But at the same time, this is what leads to a lot of lifetime problems =
and
>   memory bugs and it is one of those things that Rust aims at avoiding by=
 being
>   very strict about initialization, ownership and lifetimes.

As a general rule, I agree, but I would advise against applying
general rules automatically everywhere.

>   However, I do also recognize that drivers creating an RTC device are ty=
pically
>   very simple and in practice I would not be surprised if it turns out th=
at it
>   happens that drivers keep the struct rtc_device alive from probe() unti=
l the
>   bus device is unbound from the driver, i.e. lifetimes just end up being=
 almost
>   the same. But I don't know if that's always the case.
>
>   Regardless of that, I think it would be good to keep driver authors fin=
ding a
>   common pattern, where class device callbacks carry the corresponding cl=
ass
>   device struct (instead of the parent base struct device).

TBH I'm not really convinced about this particular thing and I think I
can provide an illustrative example.

Namely, quite incidentally, I've recently set out to add an RTC class
device to an existing driver, which is the ACPI time and alarm device
(TAD) one.  The TAD functionality is based on ACPI control methods
provided by the platform firmware and it may (or may not) include
RTC-equivalent functions.  So far, the driver has been providing a
completely custom sysfs interface to user space, but since more and
more platforms contain an ACPI TAD and some of them may not contain a
"traditional" RTC, having an RTC class device interface in that driver
may be quite useful.

I have a prototype of the requisite change (I'll post it shortly for
reference) and it turns out that because the RTC class callbacks take
the parent device pointer as an argument, wrapping them around the
existing driver routines backing the existing sysfs interface is
super-straightforward.  Had the RTC class passed an RTC device pointer
to those callbacks, the driver would have had to do something to get
back from it to the parent device (which is what the driver really
works with).  If there are more similar drivers, that would have led
to some code duplication that is in fact unnecessary.

Moreover, the RTC device pointer doesn't even need to be stored
anywhere in that driver because the driver need not use it directly at
all and the RTC device object memory is freed by the core when the
driver unbinds.

>   Especially on the Rust side we now have the chance to make the experien=
ce of
>   writing drivers as consistent as possible, which should help (new) driv=
er
>   authors a lot in terms of learning the driver lifetime patterns.

Well, I'm not sure if "the experience of writing drivers as consistent
as possible" is more important than less code duplication and simpler
code.

