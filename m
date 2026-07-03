Return-Path: <linux-rtc+bounces-6883-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SV7PC/iaR2o8cAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6883-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Jul 2026 13:20:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A8701C34
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Jul 2026 13:20:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fQF/+12W";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6883-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6883-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AFFD30E0AD7
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jul 2026 11:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0266D388885;
	Fri,  3 Jul 2026 11:14:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517A39E17E;
	Fri,  3 Jul 2026 11:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077279; cv=none; b=mcAYZyMyy/ec7QXwHLCaQV1ujMRwGIva492IMpbFuHx9uzzAC+k0/ydasRxwMW6oOQss4XyoNX6uEssZ6Cleco+J74HW+zMNobsPbpZYLaS2u5qtFPVwN+DZ3NWEeDvld/mTDht+YyYLroVL9fE68+peOSS0z1Lne6qZCyYMVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077279; c=relaxed/simple;
	bh=B2Cv9HdI4Z9YbV/iZl05x/8vKlZkC2XZ55yv2DZvb6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6JaalvpH6wWmJGMjnD0qfYxamGIPqKJu6lkd2I4aoeSl+I2JIPKd8RGXYTXxF1/hV0+kvFzebOGO0fPYZd9aDTFWfor2VmYOXsaPfU6MTNnITiBvj7lBRkfzbaNE2GVrunXJQaEw235BZilMszDDdyqVHE2nqXUxyG/lHJTAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQF/+12W; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E781F000E9;
	Fri,  3 Jul 2026 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077278;
	bh=B2Cv9HdI4Z9YbV/iZl05x/8vKlZkC2XZ55yv2DZvb6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQF/+12WnVHg8vFoiTvfyAYguhU7IOGXbpBUWI7Z1M44vdzNYfQppYdomsn1JI5zV
	 O+6I1I4TF10Ecx6xTC8SUeT9Ucl5LaGWxIYRFRbhMoQjOH8CAcALWH+p+yhFWZZH39
	 J40icATFJxmpTo3MDAQNV8asxWJlc/yvtM3BLihHaeIDnvP23GW2uLiOZ0hipZzMtT
	 FA9cWzx/2GDcvohQWSkcrLroCRCjH+6w5oZaSQ21JUq5/BZWkiTyXmk4F4T4SUHJ2H
	 LGF1E6Rlv/rei1pDlQsfjn1sr62WzI9dW5mh8g+uXC057F4kZjbmtEvypl/nsJmv3h
	 VwgJ3ZiTLfTrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: microchip,pic32mzda-rtc: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260703110442.205026-1-challauday369@gmail.com>
References: <20260703110442.205026-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:14:36 +0000
Message-Id: <20260703111438.22E781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6883-lists,linux-rtc=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:challauday369@gmail.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:alexandre.belloni@bootlin.com,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE7A8701C34

> Convert Microchip PIC32 Real Time Clock and Calendar devicetree binding
> from legacy text format to DT schema.
>=20
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703110442.2050=
26-1-challauday369@gmail.com?part=3D1


