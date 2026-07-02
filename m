Return-Path: <linux-rtc+bounces-6871-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JtneJfciRmpBKgsAu9opvQ
	(envelope-from <linux-rtc+bounces-6871-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:36:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE76F4D88
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:36:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MjKGydHU;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6871-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6871-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F379B302E7FD
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340B44266B1;
	Thu,  2 Jul 2026 08:21:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619E3D5C32;
	Thu,  2 Jul 2026 08:21:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980518; cv=none; b=Bvo6X5MbCIcj6R5bXGwLMvYJ9wUhOFQrWlqgAv8CqSClPL/+mEDcJ3PLEFKCR4GUCJKACPmXtk24lVvJ8ggZQ4iUiCFvzGJdrZUXSngbJZAETmBodpJNV/z9HFwkYMtlvZ6pbT0Ca5OgBoTQ/sQhv8oBb4dQBHj3S4v4R4ENiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980518; c=relaxed/simple;
	bh=3HISegeDoiIC9nay9d8fLQ0exKiUD5Y6GU8C+loQwxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TVV4ixrQkOcimyi0RCQsg54oXAZRts/Whoc2lvo3WD+WPdPowYrgleGuSl63DKMiIBnQfF/80Im0kkZSk3S1sYcM1LvjnsrCAThRoeVDSff+tKofEmOwOvLqzkHMOE3PXYm14iOaBgFrjO6un6sp4Jod3iiGOyavHvWA490frPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjKGydHU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6681F00A3A;
	Thu,  2 Jul 2026 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980516;
	bh=3HISegeDoiIC9nay9d8fLQ0exKiUD5Y6GU8C+loQwxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MjKGydHUozWbdWdO7ZF36vlvQVL8nvLm+8opXT5tDNTG93yY3sTz2PtENQhrJEg5e
	 VtyoZx9V97eEn4xDN5l+C3X2l9OHjJezo46WswWcq5HUAqgbQwwMZqAR7HMmaFAF8Y
	 QU/o2yFk1GYOXoC1W7Rg8EZzPPQk+w3L4X//nz11cq/93Vp8WKADYap7lODLc1K5Gt
	 l0suhbucXscYPhSMwKezgbXDaD4j7jQ15gIMEYveDbvGAGZFFyh12ykvdirFvA48NJ
	 ToRqD2SZR4hTiCKgseM5wRpD5LrB1qxmvvw7nmZ68gd/MVYHaL2G+R3xqSyruqkoBv
	 V5oL4i7noPhpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] clk: sunxi-ng: sun6i-rtc: clean up DT usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, linux-rtc@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702-a733-rtc-v3-4-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-4-eb2580374de6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 08:21:55 +0000
Message-Id: <20260702082156.5D6681F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6871-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:robh@kernel.org,m:linux-rtc@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2EE76F4D88

> With sun6i-rtc compatible devices, the "ext-osc32k" clock input
> is optional for the devices that support this input (r329 and onward).
>=20
> Probably preparing for older SoC support, the driver does something funny
> when parsing DT. It check if "ext-osc32k" is present in the clock-names a=
nd
> if it is not, it uses the first clock as "ext-osc32k". This clock will
> actually be the rtc bus clock so what the driver does is wrong.
>=20
> At the moment, the driver does not support the older SoCs that would have
> an external 32k clock provided on index #0 so just remove this quirk.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-a733-rtc-v=
3-0-eb2580374de6@baylibre.com?part=3D4


