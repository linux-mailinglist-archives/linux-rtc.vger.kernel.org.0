Return-Path: <linux-rtc+bounces-6869-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TffvAlggRmqvKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6869-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:24:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C36F4C22
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:24:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K7+uu7hp;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6869-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6869-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB25E30471EF
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B88426400;
	Thu,  2 Jul 2026 08:19:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8B2C21E8;
	Thu,  2 Jul 2026 08:19:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980365; cv=none; b=VCNk99ET58jCS2KREnM2KSpbq54WAuCDi8kUtyeWO7e/HLU75vX/pnHWZOJNBIxkgnGyx/kNkYKOuPZf7VIZIsybEWixr7BZTMF5ccFCWsfmH/RwWXlTxLwfSpOOtlCMSnQ1zN4rhTujQcmyr+tsUyKG8LO3wknWtAmUDa3Va7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980365; c=relaxed/simple;
	bh=F/g2A+3gY3n10XXKCo5QO61/eH9gAq5coGzK/C4aAOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BmquXSMrVFPVsann5maFAoncEQCaJl9scflGm+7l8UCnRd6jV3N+rJ8Z6nemFaCAqpcsjywnuynCbWNw2+clk7Lp+8EdiqLHJTJO+bvQPTCZy6/TwM+OrwBAyWXcFr4HPDQ9u1uv87E4CcZCTjc371lUMYsi3UKjM9nbwM4W0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7+uu7hp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABFE1F000E9;
	Thu,  2 Jul 2026 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980364;
	bh=F/g2A+3gY3n10XXKCo5QO61/eH9gAq5coGzK/C4aAOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7+uu7hpYqgN/JH5k+GbDUZd50OvEQ9qks0LtLu+JKieautnHdYs7xZs4GTJl7+VD
	 UEfCJ0rQWHSMRZVHpeyXaCee6jfTJV9qTjL9fdPK3IxUMlb4AwySCK0eqNJbHL9jsl
	 JK/ppEI5CeD1aQf8mQqSGSMmTg2mn6glEN7OS9CyXiNgOQwDjeltWl/+FveGq8gijz
	 T1Y5haFG82TVdmZ+xpnp4oFZtL/Lxfxqystlxf5433v1GjCxkhNr8aX/kDZV4yJCZW
	 v0aJYP0cRdtG9jr3+NGj9wMyPhziob/JO5cZWsERGq7CajqV+7TyUYe/SomyEsLm39
	 YV3Fz7borB2KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] clk: sunxi-ng: sun6i-rtc: Add feature bit for
 IOSC calibration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260702-a733-rtc-v3-5-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-5-eb2580374de6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 08:19:23 +0000
Message-Id: <20260702081923.BABFE1F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6869-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:linux-sunxi@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,pigmoral.tech:email,sashiko.dev:url,baylibre.com:email,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 664C36F4C22

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-a733-rtc-v=
3-0-eb2580374de6@baylibre.com?part=3D5


