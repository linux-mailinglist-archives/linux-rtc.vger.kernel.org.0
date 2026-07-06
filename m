Return-Path: <linux-rtc+bounces-6942-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JjTTKTMCTGpwegEAu9opvQ
	(envelope-from <linux-rtc+bounces-6942-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:29:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF6714F69
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:29:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a1q29NJE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6942-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6942-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DEAD36F2398
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7C841DEC9;
	Mon,  6 Jul 2026 17:56:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4A42088C;
	Mon,  6 Jul 2026 17:56:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360617; cv=none; b=I4tFKFuo5o3uttNzL7DMT4bI/EysMbfPsrs0NkY23cwVunPZaM+eLQujo2kf3RIMfSdytHUQE8fZaVh6wYx19u9V+8cOow0s4+LR8jIrzrMxXPi3+X384GEFKTaQ+7lkjFdjm6T0tQ8Rl9ObNJkRHmUtxSTh7I0RKff8Yi/ku10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360617; c=relaxed/simple;
	bh=Q1p089HhHWgvI8PGe8Ku81Bu61YGbYxPL0q7T7fdOyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=siUy83gQ8eTnhIpBNztDSDtv/mmz6aGztwJmB3UEMjU3vxAUmflTrfBpw5Mwe46tDIFCG5FpKoTVsoIdrHiuk3gmwImJt4zCrZo0Fx7yuxTiolCOgwhD3xsk/qnuiZ8iWFTwI379gyeSMLkGd/Lf0fmvpUNt11mAAoPROzJgEmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1q29NJE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6202E1F00A3D;
	Mon,  6 Jul 2026 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360616;
	bh=Q1p089HhHWgvI8PGe8Ku81Bu61YGbYxPL0q7T7fdOyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1q29NJED5H2I2jncyWQemhRNZ0Pq3cbP4GGhYq7k7sLdUSMiVjGo2hW+LR3uXD3W
	 XBtmE89fp0If6iP+x7md/DIUy/BUZHDf/tuof47HcecV4zK9v/2PfDaNmdeLGu8HnM
	 bc6e9z9Lam32gg6+tnGd2XmhiCmGGDZ8xNQZ4zkndcdURIBsh44XkULN8DNCG7Po1I
	 TAgWsv3ROMEEyxmloJ3p+78dEd0q091uwDPACLn4O1LWIyL+NCn2tTQSj9L6whS3SI
	 krJFBnmdk9M/TbDM6pAYgmil5+lEB6vEpmIICgFlcoFOkJwIEs48uA3gy8lA5MPlQX
	 9eI0WxqLGSqvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional
 pps interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, wsa+renesas@sang-engineering.com
In-Reply-To: <20260706175138.12587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:56:55 +0000
Message-Id: <20260706175656.6202E1F00A3D@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6942-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:linux-rtc@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:wsa+renesas@sang-engineering.com,m:prabhakarcsengg@gmail.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1EF6714F69

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
> the deferred probe request properly.
>=20
> Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
> indicates that the interrupt subsystem is not yet ready. Intercept this
> specific error condition, assign it to the return value, and jump to the
> dis_runtime_pm label to avoid ignoring a valid probe deferral.
>=20
> Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarm=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2


