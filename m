Return-Path: <linux-rtc+bounces-5994-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W1QgN+eUmWnzVAMAu9opvQ
	(envelope-from <linux-rtc+bounces-5994-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 12:20:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740116CC00
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 12:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01A7D300D918
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8062034F478;
	Sat, 21 Feb 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3X9ezXI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5B2F747A
	for <linux-rtc@vger.kernel.org>; Sat, 21 Feb 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672799; cv=none; b=HlEaUS7OGS9FJDjlLTXx94ueVIU41uy0YgZMM5S6UiQo8+dboqMORNfGtcJ9ZnarJQjxivN7eUNzuOIoTXkJ5AuaYkpOfI/5NWD7Xs056WJQ+E1PCHXdBhD8lwZh1IewElJZrg2KfBUFMy+olNKCWv+rYtovrWNMVb8orOtEB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672799; c=relaxed/simple;
	bh=6muKgQ8aEVIrHd4tRfSWiRy6tgoiQ0Swt7PxdEI0YDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hriEzpDlup4/F1E+nueMheYgw7R1+xch6XtYi4wyzU5IyHXru1OtjvVKBW4blkKF4BRIF7uw+EuvAes99P6MyWl2rbv6/82QAiYwdEmDL4aBld5enqzRJIbyS5ELU4KhGcJOslqnBWp54f7+O0oXGSr0CCTDnKeix4D12hoUUhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3X9ezXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D671BC2BC87
	for <linux-rtc@vger.kernel.org>; Sat, 21 Feb 2026 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771672798;
	bh=6muKgQ8aEVIrHd4tRfSWiRy6tgoiQ0Swt7PxdEI0YDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3X9ezXI6Z6b/r3cK4QvXROX0FaAlsy8sm47GzF0SWRJ7Za31CU8ly6HfAjeICHqV
	 D3h6LJd0TUaZ3hol2fmno27uTgvZjclrSOrKC0JICDcn0AAU2xTJQoUkw60RKhsrUn
	 QInUSGjL6fJj1aF4S6MxDYe4DsweWbDMhGS+Q6vWCUNJ1VQnmHN2AFhOSw39QI1LzC
	 q1FeN21XLc2/ixWuvY+hNSuPTDVcDhG0FNw6HxI8xJ1Lmv0nfGWgIBS+hhhcXYPnXB
	 hmefyfixkmnGdTiosl8YNToAFpu9+yA33WS3K0GpiFHiG9FR3fwFHxtodnnZamEMKC
	 TwBT9qQrzjf9Q==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-413acc82f38so1090301fac.0
        for <linux-rtc@vger.kernel.org>; Sat, 21 Feb 2026 03:19:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPX4YQAagh+aAtZoTyxs5whkjfqxBllh6rLezxbn/2dg4JiHmJdE+J5hrdX9Pfp5qomLfoK7+aZMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5e/gr1rPFizXj/lJbpmFYRPMjqvadMkAA36XiouGqUIhNmtn
	rOEQfj5dHddaI/bCru0GlH1uNcWa1jXJ4FjM5+27pOg0Ah+QfS1EXSrmvNrS8LS5clKHg1mkeen
	8w7OTW9mfrgf5mvbTE8GcKqxNlJZX9gg=
X-Received: by 2002:a05:687c:408f:b0:3f5:74a6:b99f with SMTP id
 586e51a60fabf-4157b0b6a84mr1785227fac.29.1771672797766; Sat, 21 Feb 2026
 03:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116162203.296844-1-sunke@kylinos.cn> <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org> <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local> <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
In-Reply-To: <20260221111619162a41a1@mail.local>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 21 Feb 2026 12:19:46 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
X-Gm-Features: AaiRm532RkVV7APDNxPiwoMpbGuwl1XMnPW-TD2JejrLflaFiynJVycwzEFC0k8
Message-ID: <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-5994-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[i2c.rs:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3740116CC00
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 12:16=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 21/02/2026 17:31:09+0800, Alvin Sun wrote:
> > As in platform.rs [1] and i2c.rs [2], set_drvdata is always called by
> > the bus Adapter's probe_callback, not by the device driver.
> >
> > [1]:
> > https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/platform.=
rs#L80
> > [2]:
> > https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/i2c.rs#L1=
60
> >
> > In Rust the Adapter already sets drvdata on the bus device in probe. If
> > the driver also calls amba_set_drvdata() there, it overwrites that
> > pointer; on remove/shutdown the framework then gets wrong data and can
> > hit use-after-free or crashes. So only the framework must set drvdata
> > on the bus device.
>
> But this is wrong, how do you then handle the class device on
> suspend/resume or on .remove?
>
> >
> > This applies only to the Rust implementation; in C, calling
> > amba_set_drvdata() is fine. In the Rust design the bus device owns the
> > bus device's drvdata and the class device owns the class device's
> > drvdata, so the class driver must not set drvdata on the bus device.
> >
> > This is my understanding of the Rust device driver abstraction design.
> > Danilo is the authority on this.
> >
> > Best regards,
> > Ke Sun
> >
> > > Out of 29 drivers, 18 are doing so.

+1

The vast majority of around 50 platform drivers I've inspected
recently use platform_set_drvdata() or equivalent in probe.

