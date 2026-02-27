Return-Path: <linux-rtc+bounces-6084-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DUMJKS1oWmMvgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6084-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 16:17:56 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950D1B9913
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 16:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 095DF300AECD
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Feb 2026 15:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C96F436375;
	Fri, 27 Feb 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWNPPCGu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9F436352;
	Fri, 27 Feb 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204987; cv=none; b=JGMtxZ+g5ULapOrG3ZJbHMqXNoiIflg0YOjnD/wKvDsMr9/6h/Aychs4Y5hWUiz9lv261KOEv9MzuR4aiG/MA2pYasW8I8rcD8H5XHbqdZwZmcP5Di6tr7uancSQPmGhKNlHMnbvluwIWMyTQko7SERZbSo+ebwojqnrFUl1duE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204987; c=relaxed/simple;
	bh=0yqN5dTX/ixzOtodz7NizEgEOEjte8QFyiCaU6F6XTQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SeFPE+gfmAnzh0lL3V+PSZ6Eo3nRSUUt4Hj/5csSyvAiPeLQyw6XQCJqO3uiA5dI0ZGzo92++yYx8wurvWI2GXQPCcR5mUhvVrdu/6hjYqeAd9WcpsZUMi/JepNQePYPeZn3YqYRJWNPTG/DFh/aMw4YfXQ7b3gXgCF12WuA9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWNPPCGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2228C19422;
	Fri, 27 Feb 2026 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204986;
	bh=0yqN5dTX/ixzOtodz7NizEgEOEjte8QFyiCaU6F6XTQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fWNPPCGuHNVc1p17psub485eGCIrdMelnqPja5XEvxMNQCATVPa1XBdtgfy+c3HIb
	 k04n4wBbHbLFP6GlD2Xwwp6hL/NOeNtt5UGfaNZ3GCotTP7GH4GUXqQNFF4I/Adt/f
	 zaGyigVs7mF9pENt1+pOII9HssyXNj2cTpQxBbKZn4tuFqrmdWmIbeNmg3pwSlGxK2
	 6WXj4WNEJ3ZxMt6UYThrtFZCpjL44Ngib+OuGSb2G8GMSgn1ZdwG8FGKb8+PAgjX3W
	 m2rUMqvL4SF4tFZlP0Cy2w5ZeHJaEQneeyZ4PhpA+HMDeTKRKhW/PbNlv/rj6b5CY/
	 gPFeipVM6jX/g==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 16:09:41 +0100
Message-Id: <DGPU8HAAHHEL.289YRTRTFQEKK@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Alvin Sun"
 <alvin.sun@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
X-Mailer: aerc 0.21.0
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
 <DGO6MEKIIHGH.3L06QJ47CP3CU@kernel.org>
In-Reply-To: <DGO6MEKIIHGH.3L06QJ47CP3CU@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6084-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.dev,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0950D1B9913
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 5:26 PM CET, Danilo Krummrich wrote:
> For the future we will also be able to support references within initiali=
zers to
> other pinned fields, which make things a bit more convinient, so you coul=
d do
> things like this:
>
> 	let irq_data =3D impl_pin_init!(SampleIrqData {
> 	    io <- pdev.iomap_region_sized::<BAR0_SIZE>(0, c"my_rtc/bar0")?,
> 	    hw_variant: VendorVariant::StV1,
> 	});
>
> 	let rtc_data =3D impl_pin_init!(SampleRtcData {
> 	    irq <- irq::Registration::new(..., irq_data),
> 	    io: &irq.io,
> 	    ...,
> 	});
>
> 	let rtc =3D rtc::Device::new(dev, rtc_data)?;
>
> Note the additional `io: &irq.io,` in the rtc_data initializer. This woul=
d be
> legal as we know that `irq` is pinned within `rtc_data`, hence it is vali=
d to
> hold a reference to one of its pinned fields.
>
> I am not sure how far we are from having this supported, I assume Benno a=
nd Gary
> can say more about this.

We added that support in 42415d163e5d ("rust: pin-init: add references
to previously initialized fields"). Note that any references created
during the initializer are only valid inside of that initializer. You
can convert into a raw pointer though and if the struct is `!Unpin` it
is sound to use that pointer at the same time as references to the
pinned value.

Cheers,
Benno

