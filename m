Return-Path: <linux-rtc+bounces-6053-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLOqKbHXnWk0SQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6053-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 17:54:09 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41C18A202
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 17:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8453047BE1
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Feb 2026 16:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5DE3A7F73;
	Tue, 24 Feb 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tn29oDym"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987703A7F70;
	Tue, 24 Feb 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951358; cv=none; b=G0Z6h2/XVNFbMwl7m7iF5D0xke7X6f+E2+hnkWJGC0nK/GDgB8apemoHLP5ekSyuJ1i18oTryaSZyjBXTzlzf2P2uGx7l8nc4hG1LCgRWnm+Rlxpb7A3VQXYqIGwYQXx81MyhjOTiNFu9H13h2rESdbJdpjV3+Io12H5bnueHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951358; c=relaxed/simple;
	bh=YRQlQ6MCIsYjUFukWeNyAIgQdUxG7sGbhDfq2JfCUHo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZXIeah41/VJuQ/XRB+Uv1CW7VYYDuM8DZEf8may/QkWMykW0TRMUVvGZUW9jToJs6pbm19sF2OY9OP4LLx0UAl7UaF8gXKsX/1rVXk6pH37yTgV1fF/+6QoiOGCHx26M4+iOmLxgF3RVBzozjPp+QE+wZseVepISuPPXUetOFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tn29oDym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C6CC116D0;
	Tue, 24 Feb 2026 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771951358;
	bh=YRQlQ6MCIsYjUFukWeNyAIgQdUxG7sGbhDfq2JfCUHo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tn29oDymGPjH73/ziawaVMH+uaHe989A9o+IPI1YsV0IkMNdoT5/LspWz09jMKcv7
	 QfqYjDDH3k0vW0CynC8PTsy8eo/s7op+TSDGkO/MuPJuuUa3Si5KbVHVxbt9nJH1WL
	 oyhy7Ag6og/JhSfl2tv2NZkHsyAWpDTG8e5XeX57vBkKFPIpEAxOr77bmxw8o/lE9j
	 HXKGGbs+mTWmbC88zE6k3SAgjTChWZh4Pt1L3C9dLH1VuhV50TnNnbSgxLVr/cVPil
	 dp5ks/KcoMFCEqu8/V9ZMzPK62rmjUaUZvpGNV1opefVi4HYR8yJA/MfvunxZvZOgF
	 zt86RPFP7tpMQ==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 17:42:33 +0100
Message-Id: <DGNCBY578GN2.2W7UIUULQ7U4N@kernel.org>
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
 <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org>
In-Reply-To: <DGNC6GEH8EV7.2WWAQ8DNCLRAB@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6053-lists,linux-rtc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C41C18A202
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 5:35 PM CET, Danilo Krummrich wrote:
> The reason we sometimes can is because, if you would need access to the
> irq::Registration from ioctls (e.g. for calling synchronize(), enable(),
> disable() etc.) it would be caught, because you couldn't access it withou=
t it
> being in rtc_data in the first place, and being forced to have it in rtc_=
data
> guarantees that the ordering can't be wrong.

I.e. as long as we can model a data dependency we can catch those things at
compile time.

