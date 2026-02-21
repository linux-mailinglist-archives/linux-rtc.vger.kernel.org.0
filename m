Return-Path: <linux-rtc+bounces-5997-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEkxM1TCmWlhWgMAu9opvQ
	(envelope-from <linux-rtc+bounces-5997-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 15:33:56 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78716D087
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 15:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45374300998C
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CA51DF965;
	Sat, 21 Feb 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6gwKZLV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028D262BD;
	Sat, 21 Feb 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771684433; cv=none; b=uo9Pn6NRSjvk3p3IUtabAGoCe6eROSE0W4KqLNiHy4NKoR8YjGxY2fO9Y8/L0yc20QS3BOISreaJ5Rp6u4E/lOMAx3lp6eCjcwGuEi5jhsLvoagv0OUsU9cC9mH+W0+J8yFFM3x42Q6wtjgIAjTk9iu6bpGwVRK9hytkPilC65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771684433; c=relaxed/simple;
	bh=XjVc8WYemFdIrSWOiPIohhWHiePuI0UIIDF7cj68pOI=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=qJCaMOK9rWy8eaXmjgGAa+65n/ZfIuwQdiYEvibG6H1Kh9/CzfZ+dYfrNTt6m2249hBYxHdK5tnrEfr62CJpb23B6S1sC0PABRNG2gbAcay5zdvvhVFOZgd+L+XaUzlQgESfnSPZYpZjiR3df9rTTYUZqLdInqmsSDG+aiG28aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6gwKZLV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80C4C4CEF7;
	Sat, 21 Feb 2026 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771684433;
	bh=XjVc8WYemFdIrSWOiPIohhWHiePuI0UIIDF7cj68pOI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=r6gwKZLVAflZJ3PuTTea9qwjjWph1YstDpXWnqB93u8SNqCnf9oV3ACQFp+v61B7H
	 xKcCQiNx7GM4E/ms8f4YgCeERa/7RIokIkXL/DA9G19tIHp+4qcOgk1Xs6Z9AXS48F
	 CyiwkS4la5EtoNNa6hs6p70iF1S+QO7nVrQmf9V8LDqohOIDogYDS8jM6FnJycSQcP
	 YY+RmBA4GyVnvyiJ2KnOm/qNByRGxP/AM8xjg2wDTssvVokLufaTB7OGZvHmcnyHH3
	 aDD4fjwK7xEI/CFBTfXZTsD+ZgpVgs1xeTFzf88GphKglA7iIGBR6njXCNu8xRHEaX
	 bR022rZKyIPXg==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 15:33:48 +0100
Message-Id: <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Alvin Sun" <alvin.sun@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5997-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B78716D087
X-Rspamd-Action: no action

On Sat Feb 21, 2026 at 12:19 PM CET, Rafael J. Wysocki wrote:
> On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>> > > Out of 29 drivers, 18 are doing so.
>
> The vast majority of around 50 platform drivers I've inspected
> recently use platform_set_drvdata() or equivalent in probe.

This thread seems to contain quite a bit of confusion and misunderstandings=
 --
let me try to clarify.

  (1) How Rust handles bus device private data.

  In Rust the probe() function of a bus implementation (platform, PCI, etc.=
)
  returns an initializer (impl PinInit<T, Error>) for the driver's device
  private data.

  The bus implementation takes this initializer and passes it (together wit=
h the
  underlying struct device) to the driver-core. The driver-core allocates t=
he
  required memory, initializes the memory with the given initializer and st=
ores
  a pointer to the corresponding object with dev_set_drvdata().

  So, technically, in Rust all platform drivers call platform_set_drvdata()=
.

  (Note that this is also true when the driver's device private data type i=
s
  empty (i.e. it has no fields). In this case it could still have a destruc=
tor
  that must be called when the device private data structure is destroyed. =
Of
  course there is no real memory allocation when the struct's size is zero.=
)

  The driver's device private data can only be accessed when the bus device=
 is
  bound to the driver, i.e. the driver can only access it with a &Device<Bo=
und>;
  it (the driver's device private data) is automatically freed by the
  driver-core when remove() and all devres callbacks have been completed.

  I.e. the rules are - of course - the same as on the C side, but they are
  enforced by the type system and the driver-core code.

  (2) Bus device private data vs. class device private data.

  The change to pass a struct rtc_device in class device callbacks of RTC,
  rather than the base struct device of the corresponding bus device (e.g. =
AMBA,
  platform, etc.) should not aim at storing all data in rtc->dev.private_da=
ta
  that was previously stored in rtc->dev.parent->private_data.

  Instead, it gives drivers the option to differentiate in terms of ownersh=
ip
  and lifetime.

  While the bus device private data has a very defined lifetime from probe(=
)
  until the device is unbound from the driver, class device private data mi=
ght
  live shorter than this, or might even out-live driver unbind in some case=
s. It
  really depends on the lifetime of the class device itself, which is not
  generally defined.

  Now, from a C side point of view this may not look like a big deal, as it
  (unfortunately) is not that uncommon that struct fields are just initiali=
zed
  and destroyed whenever needed and the code just takes it into account.

  But at the same time, this is what leads to a lot of lifetime problems an=
d
  memory bugs and it is one of those things that Rust aims at avoiding by b=
eing
  very strict about initialization, ownership and lifetimes.

  However, I do also recognize that drivers creating an RTC device are typi=
cally
  very simple and in practice I would not be surprised if it turns out that=
 it
  happens that drivers keep the struct rtc_device alive from probe() until =
the
  bus device is unbound from the driver, i.e. lifetimes just end up being a=
lmost
  the same. But I don't know if that's always the case.

  Regardless of that, I think it would be good to keep driver authors findi=
ng a
  common pattern, where class device callbacks carry the corresponding clas=
s
  device struct (instead of the parent base struct device).

  Especially on the Rust side we now have the chance to make the experience=
 of
  writing drivers as consistent as possible, which should help (new) driver
  authors a lot in terms of learning the driver lifetime patterns.

I hope this helps.

- Danilo

