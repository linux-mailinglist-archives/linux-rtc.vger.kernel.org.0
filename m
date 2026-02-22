Return-Path: <linux-rtc+bounces-6013-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGQ8L7QRm2lArgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6013-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:24:52 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FEE16F5B7
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 15:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E1A4300B759
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 14:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D20E34FF48;
	Sun, 22 Feb 2026 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmllC0ZK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582BF13A3ED
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771770289; cv=none; b=oo6GROGTVYpUvBgwPrgzw36EBLHvFW9X41yznGXThJ1XP6C8T+cYdc/qTS4swnuG5stAhoU+lLKw9mKOGF8W5pKLKcoBRwI/gfBBZTVzmZQ8okYZPDg3dojrZtRX6h2axTTydqf6sPLsVAKsj52pM89ucMj3FWkRFgyCahhzdZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771770289; c=relaxed/simple;
	bh=lYon6GnGMnLRIGj3zyKwI/QJqdRLSnCaz2Z9r2y7+RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkIQJhHYt3w3sRi2FLDHlIP627MAEsOLWw9eX2U1PFxuBHibNZJYGr/kNWvAKboqvzFmzt6qPgeEXMSCPmm+5u5Z/HGP98sBvabwPe+8zV8/+JZn01nqPHZFLHKMovnNehlr52PMaI55l8+PZg634WVEbm33d41LI348XycK6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmllC0ZK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFF7C2BCB4
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771770289;
	bh=lYon6GnGMnLRIGj3zyKwI/QJqdRLSnCaz2Z9r2y7+RE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UmllC0ZKADGT33Q/GlxpuTqxtidlXBiOeOqOJKRsJZK+2tghQtYLW4ylu/jnmjFg0
	 xyKRQAimCjGRfpC/V3gLqn842y5yYlphO794BnMolWV6ZFAbCflBlVAtV9lYvIotKS
	 4HSI1jBINBVEZwMeanCLIlNx1X4nG+EoDJMWrHjtz1ohbH0ZcS/cDRs/WMZxxdYmqV
	 mr5Zo6JWQtpJVOL5T/vD4v7Dp1aeyYktNHYWz9nCN+WVpCb5y0UETHaDYcp7V+eqci
	 FA5XwlGe6t9lWLL5J/mjj6UgtJByBiBEG5mThRLqsGLsWZ/6VQ2ea4iExVcxTo44WN
	 ETC+OiifV2ekg==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so2098626fac.0
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 06:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJWZDIbWpXrP++Z0R/m7STt+V0amXZFQAobCFyTKARsFVxsbPWD9zO4BeH6hY+9SA60Qw3mMc6XlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPAPmJiGbZW5aS0hndAuvWw4ZJs76Urg8cq8z7988XAE+/7aQ
	SODpukmIUyCKLnDOCUwx6cGZN0GdChsDICpkZNErpiQZ6LmHVwD8mdnpyAbKCaB8cjtj79SwaGg
	V73nlMBuKPzbS7JZUygBeYnaeDaWfyEo=
X-Received: by 2002:a05:6871:7891:b0:40e:e5c1:8617 with SMTP id
 586e51a60fabf-4157b1ab5d0mr3049496fac.47.1771770287918; Sun, 22 Feb 2026
 06:24:47 -0800 (PST)
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
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gtrpFKPV0LPzfz4JHkEqwK1XRoqO8peWYKw_4j5ti1MA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 22 Feb 2026 15:24:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jY+rRupdbGCtYNkh+xaGh6nAyDKSV3hx-3SZ89Gqfx7A@mail.gmail.com>
X-Gm-Features: AaiRm50HuvmxRAFfyKBe0vKuq-B922qwO4jMpi7nEc_5uOMN8KlStDTSnX-01w0
Message-ID: <CAJZ5v0jY+rRupdbGCtYNkh+xaGh6nAyDKSV3hx-3SZ89Gqfx7A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6013-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31FEE16F5B7
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 1:25=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Sat, Feb 21, 2026 at 3:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
> > > On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > >> > > Out of 29 drivers, 18 are doing so.
> > >
> > > The vast majority of around 50 platform drivers I've inspected
> > > recently use platform_set_drvdata() or equivalent in probe.
> >
> > This thread seems to contain quite a bit of confusion and misunderstand=
ings --
> > let me try to clarify.
> >
> >   (1) How Rust handles bus device private data.
> >
> >   In Rust the probe() function of a bus implementation (platform, PCI, =
etc.)
> >   returns an initializer (impl PinInit<T, Error>) for the driver's devi=
ce
> >   private data.
> >
> >   The bus implementation takes this initializer and passes it (together=
 with the
> >   underlying struct device) to the driver-core. The driver-core allocat=
es the
> >   required memory, initializes the memory with the given initializer an=
d stores
> >   a pointer to the corresponding object with dev_set_drvdata().
> >
> >   So, technically, in Rust all platform drivers call platform_set_drvda=
ta().
>
> So do I understand correctly that the driver is required to tell the
> core what type its driver_data will be and then the core will allocate
> memory for it and clean it up on remove?
>
> >   (Note that this is also true when the driver's device private data ty=
pe is
> >   empty (i.e. it has no fields). In this case it could still have a des=
tructor
> >   that must be called when the device private data structure is destroy=
ed. Of
> >   course there is no real memory allocation when the struct's size is z=
ero.)
>
> So in the simplest case when the driver doesn't need driver_data at
> all, it will just use a struct with no fields as that driver_data
> type, IIUC.
>
> >   The driver's device private data can only be accessed when the bus de=
vice is
> >   bound to the driver, i.e. the driver can only access it with a &Devic=
e<Bound>;
> >   it (the driver's device private data) is automatically freed by the
> >   driver-core when remove() and all devres callbacks have been complete=
d.
>
> Well, that's what happens on the C side of things too most of the time
> because driver_data is allocated at probe time, very often using
> devm_kzalloc() or equivalent.
>
> >   I.e. the rules are - of course - the same as on the C side, but they =
are
> >   enforced by the type system and the driver-core code.
>
> OK
>
> >   (2) Bus device private data vs. class device private data.
> >
> >   The change to pass a struct rtc_device in class device callbacks of R=
TC,
> >   rather than the base struct device of the corresponding bus device (e=
.g. AMBA,
> >   platform, etc.) should not aim at storing all data in rtc->dev.privat=
e_data
> >   that was previously stored in rtc->dev.parent->private_data.
> >
> >   Instead, it gives drivers the option to differentiate in terms of own=
ership
> >   and lifetime.
> >
> >   While the bus device private data has a very defined lifetime from pr=
obe()
> >   until the device is unbound from the driver, class device private dat=
a might
> >   live shorter than this, or might even out-live driver unbind in some =
cases. It
> >   really depends on the lifetime of the class device itself, which is n=
ot
> >   generally defined.
> >
> >   Now, from a C side point of view this may not look like a big deal, a=
s it
> >   (unfortunately) is not that uncommon that struct fields are just init=
ialized
> >   and destroyed whenever needed and the code just takes it into account=
.
> >
> >   But at the same time, this is what leads to a lot of lifetime problem=
s and
> >   memory bugs and it is one of those things that Rust aims at avoiding =
by being
> >   very strict about initialization, ownership and lifetimes.
>
> As a general rule, I agree, but I would advise against applying
> general rules automatically everywhere.
>
> >   However, I do also recognize that drivers creating an RTC device are =
typically
> >   very simple and in practice I would not be surprised if it turns out =
that it
> >   happens that drivers keep the struct rtc_device alive from probe() un=
til the
> >   bus device is unbound from the driver, i.e. lifetimes just end up bei=
ng almost
> >   the same. But I don't know if that's always the case.
> >
> >   Regardless of that, I think it would be good to keep driver authors f=
inding a
> >   common pattern, where class device callbacks carry the corresponding =
class
> >   device struct (instead of the parent base struct device).
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
>
> Moreover, the RTC device pointer doesn't even need to be stored
> anywhere in that driver because the driver need not use it directly at
> all and the RTC device object memory is freed by the core when the
> driver unbinds.

The above is referring specifically to this patch:

https://lore.kernel.org/linux-acpi/10819001.nUPlyArG6x@rafael.j.wysocki/

