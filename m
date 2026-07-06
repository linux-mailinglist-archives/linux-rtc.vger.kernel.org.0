Return-Path: <linux-rtc+bounces-6947-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8GaVG7TtS2p7dAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6947-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:28 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F987143B7
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oQ0PQ0T2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6947-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6947-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 780F43049080
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DB33DF019;
	Mon,  6 Jul 2026 18:00:46 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AB2459D1;
	Mon,  6 Jul 2026 18:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360846; cv=none; b=GvWGIIXkDTBW9kDMJ3nfVtUX72Sk3pFJMkb9lC3+Mi+cG7tlvzK03hEq2pFobrTbKAe6SMQIo/fre7QXMPeOtQe8ytcV4l7VTV+8MXJSIGzhjRETLEupwBb/E769DsQeGaiZ7SVaDy5Lk/8UwiPMNcP3oTo/7DOHJVXn93jmeBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360846; c=relaxed/simple;
	bh=NGqsrgq8qSfnIU6TQqPz/Vf0eayhZ0sRZQfyFvIhFJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GmcIle9T34MHLWcdt+NfSzzs6/lcoP08j2B0CgH/uKcSi4QWJaTeU+rSHDNQT3+riDjTYJRB/asEg0m9+8SOB+aXLXbuBYQ3K7LsuKp6BRcYurP+uRqQ1UcC8ZtNkeuPoQVz2ImVCfj/3WJxXpslllKiPRcyFHT/jARrek//zGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ0PQ0T2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFE41F000E9;
	Mon,  6 Jul 2026 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360844;
	bh=NYtQEPwGd217M7NuJ+d7MF5Ev+LUw1T3TueXJilKaVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oQ0PQ0T20boETqUQ6R9GHbTWb/We4DX5Oen3Fm/Im58r8zgg+H8NBHBapVFArWXQ7
	 dHXEoEVtxMuMAt6NqfRROayfXiBO4XlEVurdTtwvh0xHpVMxI6QcwPLIyLAW7Tw4TI
	 +02MSXYdHugn86hzlwTdOSdx8fZopRKuEUkeFBM0qmq91M8Bc9157qc12hlc5g3HJz
	 mv8G27qEjIenfetJ7EmWndy9ZGh3AJendLAjoJq98GCATrMsUr2eUIs/b10GjRF5JY
	 mHbbX4JzhRtnXu8Ij7tcna9ZfCZPmaYTXDM9DxTmKoGVzz69RhwO62BbkZ70TJv19N
	 E+0ATcnYSeJIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] rtc: rzn1: fix weekday underflow when alarm
 crosses month boundary
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, linux-rtc@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706175138.12587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 18:00:43 +0000
Message-Id: <20260706180044.5CFE41F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6947-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:alexandre.belloni@bootlin.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:robh@kernel.org,m:prabhakarcsengg@gmail.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1F987143B7

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In rzn1_rtc_set_alarm(), the driver attempts to calculate the weekday
> for an alarm by computing the day delta between the alarm time and the
> current time:
>=20
>     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
>     wday =3D (tm_now.tm_wday + days_ahead) % 7;
>=20
> However, if an alarm is scheduled for the beginning of the next month
> while the current time is at the end of the month (e.g., current day is
> 31, alarm day is 1), `tm->tm_mday - tm_now.tm_mday` results in a negative
> value (-30). Since `days_ahead` is an unsigned int, this underflows to a
> large positive number, leading to an incorrect `wday` being written to
> the RZN1_RTC_ALW register. As a result, the alarm fails to fire.
>=20
> Fix this by utilizing the already computed `alarm` time64_t timestamp.
> Convert it back into an rtc_time struct via rtc_time64_to_tm(), which
> automatically handles month boundaries and correctly populates the
> `tm_wday` field.
>=20
> Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3


