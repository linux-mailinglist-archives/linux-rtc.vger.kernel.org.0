Return-Path: <linux-rtc+bounces-6943-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TQv2CsftS2p8dAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6943-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:47 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F07143BC
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="K74j5/T7";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6943-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6943-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 948003022CEE
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13E53B7744;
	Mon,  6 Jul 2026 17:57:18 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6127A107;
	Mon,  6 Jul 2026 17:57:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360638; cv=none; b=YuZSCjfHG5IYqo0WU0Tja1NYqMSMAmEXYcT1wzQFO7dkaAEsKtEhP+zaRiGoETwYrO4JHJa3w5j3H2vRz4HENfQDX5WeypbMQiLsFVrpHHJowNGJ/3H256QYfe78hmRes6f4G0rqXyegtaXxNj2BovVZ64bTuNhbSRcnyayNKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360638; c=relaxed/simple;
	bh=W2ym/VLbMXCq5mZbCOlWoQcJCaWATYEHt6aCGQhVVA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eJJoX8kNP7w3IERXY6RKX3xY74RRvpgMGFxiYnIfT/jv0VyCfgJJHXiZgOTxkSRE81iDMdWyR43EfkFG6DuPN+IXMmEAbVYkeK2dnv+oTQfxDFK8FEso/7Kstvr5Wl52U0DDQYbL5oU4zSBv2VlGODHWQLVt+1s1dP5AgoSCwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K74j5/T7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ADA1F000E9;
	Mon,  6 Jul 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360637;
	bh=W2ym/VLbMXCq5mZbCOlWoQcJCaWATYEHt6aCGQhVVA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K74j5/T7HZ9gNNBc7S4onuVbqVpPjG7m46aG9Uv0Hzr47SzFAi8rpWgtI6KzuubmV
	 ZNtRsD4oSQC+sudB9iZcQMwCjd2D6RIwDp0OYFKVr1VdULkbaLAtmBMFBL8wPTlGRV
	 UFaQOcNDkmWBrKkPtHF66/gOy0kRVAVZJ1WOvQUdAawtWu+uENzuwk7lljEPRXNW5J
	 QZS+mxPHh0xOO6dQ9f+eGH70Kju2w857L9k2cUVO2U1gRRKGomqBRUakmUV/MZpz0D
	 wiS7OPr54SyjXC+KNzEyUgLFIeo4Ss7Gl+qqfleVIx63D2qtjaHkCa7kVYibsJxe7V
	 kzqHHBIUOQJpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] rtc: rzn1: use FIELD_PREP/FIELD_GET and
 GENMASK for register access
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260706175138.12587-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:57:17 +0000
Message-Id: <20260706175717.69ADA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6943-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:alexandre.belloni@bootlin.com,m:wsa+renesas@sang-engineering.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,renesas.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B65F07143BC

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace open-coded shift and mask operations with the bitfield API.
>=20
> Note that the weekday field is changed from an explicit 0x0f mask to
> an 8-bit field definition, matching the hardware manual. This does not
> change behaviour, as valid weekday values cannot exceed 7.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D11


