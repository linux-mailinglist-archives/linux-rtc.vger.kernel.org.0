Return-Path: <linux-rtc+bounces-6051-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOMYEr/FnWnsRwQAu9opvQ
	(envelope-from <linux-rtc+bounces-6051-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:37:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B466318920F
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 652F430EBADE
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 15:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA015292B4B;
	Tue, 24 Feb 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V05JHQdj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8527A465;
	Tue, 24 Feb 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947381; cv=none; b=kWHawtgysNYyGjrVE1UZU6NUb0y41gdGQv9apN5IxDOv9hDg/ftKbufCyXEtayeB2kL36N8El//0E8NPSp7cgzcWRk839s+ioUec7/lvFG/1x+n7CZIfjRofKoqjnTMXafiIs336UaexUs8ZhW9T8/vY2Zp2DbdPGAGUpv6adqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947381; c=relaxed/simple;
	bh=3Fq4GyJ51xygSCu4g96ES50MGDoQvCKhfJ11zDmethE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nTw35E7JA15NVe7INBiW/HQGgQrpmg6G1n0qmSX3J65U/OnL1ZPifZQORT7DTDQvl7VVO2Bc9rFT7850mTek9LlqY872kmsQ4sgT1Mz4xkhPbvS1yzNqia/dED0MRrcjIX9y/i0ID2lJkquyMGn9QK/AqzbQa/uYsAfuch//tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V05JHQdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F903C19422;
	Tue, 24 Feb 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947381;
	bh=3Fq4GyJ51xygSCu4g96ES50MGDoQvCKhfJ11zDmethE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=V05JHQdjXUaavBY/eaiRrALYDMQ2tLZvX6VLUigiA7Ke4oXt4wODd47X/qD+9Y6MB
	 j2Mw/yLzfJ4qOoGZxdP18wFJsWpB7G1OVqmjpS8y/6TAbxTwf+QN51JkhaX1ltl9Yt
	 nJvcyuRuDdewt3VIuysU4tNJUjysbmjFquBrKqLHCFDAV14YvSHGkLoyO1yIaLvCDp
	 wdNIcwuzAEauv6ELh3fRPA+wP3QHqtvkiszHwsPZUBfNWIKxDPjBB0WAaPU+7rKw+a
	 E4B5rry6QZ/nwVPXtW/iotdmisBqgkL6Kl1r/zNJZFizIfzh8bdxl4S8XZssqCuVqI
	 fkvSH4h9IqMCw==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 16:36:16 +0100
Message-Id: <DGNAX70LRK25.1B13ZK4XGPMY6@kernel.org>
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
References: <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
 <CAJZ5v0jo2sLKWVOBJz7QP9x_aMZbaVx+ES7QwYWkTzHp7d2xLQ@mail.gmail.com>
 <DGKPPQI0QE73.S8I1M5NCI2BV@kernel.org> <20260222000556ea1938c0@mail.local>
 <DGLI4H9M0T6D.25RTLDVU5JRBE@kernel.org>
 <CAJZ5v0gtiQxBCknkaOzLKrDqUQfhKh_UjQkvgxJBL4UthbCOkg@mail.gmail.com>
 <DGLMGEZTM7E2.Y8VV9I6LI1P6@kernel.org>
 <DGMR9XOWP1V0.3C9219TYPXV6J@kernel.org>
 <CAJZ5v0habtTt32bTiJF2keifwea4i0=j_s_x7AzOn_xmaO+RWQ@mail.gmail.com>
 <20260224145721a9e69e4d@mail.local>
 <CAJZ5v0jSGs-D+_Tebf+f7w7zO3w=k2rO8zsNyLxmgPoVXWxHGw@mail.gmail.com>
In-Reply-To: <CAJZ5v0jSGs-D+_Tebf+f7w7zO3w=k2rO8zsNyLxmgPoVXWxHGw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6051-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B466318920F
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 4:23 PM CET, Rafael J. Wysocki wrote:
> On the C side it really depends on what probe (of the parent) does.
> If it sets driver_data of the parent before registering the RTC
> device, then it'll all work.  If it registers the RTC device before
> setting driver_data for the parent, there may be a race.
>
> IIUC, the idea on the Rust side is to use the capabilities of the
> compiler to eliminate the possibility of messing up the ordering in a
> driver.

Yes, this is all spot-on.

