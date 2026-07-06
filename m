Return-Path: <linux-rtc+bounces-6915-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BgU9B6l/S2qgSQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6915-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:12:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A570EF5E
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:12:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZDFven0v;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6915-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6915-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 494CD3041CE3
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB92435A91;
	Mon,  6 Jul 2026 09:56:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14C434E59;
	Mon,  6 Jul 2026 09:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331781; cv=none; b=h+yFkLZoOWe58uhnB2AuCgHPZJDWeqrbZtx3Jry4EwVGgX2jdToyRm53YQjBvzykDlBs2gRogzFMTIE7L0+THCl/YBc4QtFffWaJnhpmKc9vcvVf1pqKVhTrfiThlrZMUmTrsbSwHpZkT4m8RRApcqCXqu9wxCnpSqUmBfSMoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331781; c=relaxed/simple;
	bh=lxbYUXc2GuYjJVgEeQ3Otgs6BHLF9/cttk3cowAA7h4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=II4/so3xmh6s7GYXQaJI7a78YfPSPRawJ2naBaeUt+WyV2L4fcjBt+snzoKBSDXupvwtqzpt5NNUhEiLvz+WiKjKoGnUqUWpUcYjluF/jguYAEjfTgM/Wxp30J2tpX+uF1h+wqXbZqxcz07SH7KJsooOMUmXKm3qsh1+/mB2XV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDFven0v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA151F000E9;
	Mon,  6 Jul 2026 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783331778;
	bh=lxbYUXc2GuYjJVgEeQ3Otgs6BHLF9/cttk3cowAA7h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZDFven0vCU5HBacKtsK4Wsh2d7vqxrPBT5w5IxkjmCTFCs9j5bed7J05mSjGgimm6
	 LSoOZyWPFt+PieXsf0K2u3aMQYMOMx+QNSKd3OHHG86kYNY3wQjtJkWMbki/P4qOEQ
	 3Ttk/TXO5kQjCpNCrDfoTEHxqz1Ut3PRl/xh3iEqsMN7NsEAQe7f7GMuI/CLnzLZpL
	 uQgVeOIBqjs/RXBIcUjx2Y8tAnDhOcJFIlQaHyXtLjBHPjs8VTU5LyepEPWEKyNGVj
	 pzof65YV6PIvtFbsirymrMFASs5g17pBRyKaTtg+x9hcbqDyQn+jPBuMO4VMXneGYT
	 mj2pgV8Ufy8Hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/9] clk: sunxi-ng: sun6i-rtc: Add feature bit for
 IOSC calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260706-a733-rtc-v4-5-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
 <20260706-a733-rtc-v4-5-f330728db3d3@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:56:16 +0000
Message-Id: <20260706095617.BBA151F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6915-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:robh@kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-rtc@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid,pigmoral.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32A570EF5E

> From: Junhui Liu <junhui.liu@pigmoral.tech>
>=20
> The sun6i-rtc CCU driver currently uses a global static variable to
> denote whether calibration is supported, which makes IOSC operations
> tightly coupled to this file.
>=20
> Convert this into a feature bit to decouple the logic. This allows the
> IOSC clock code to be moved into a shared module for reuse by other SoCs.
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-a733-rtc-v=
4-0-f330728db3d3@baylibre.com?part=3D5


