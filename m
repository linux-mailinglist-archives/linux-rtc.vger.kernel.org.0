Return-Path: <linux-rtc+bounces-6944-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 981QDbrwS2qAdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6944-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:15:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCFB7145DD
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:15:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A4Z2S3BA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6944-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6944-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E0D2301A379
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DBB3FA5DD;
	Mon,  6 Jul 2026 17:58:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C927A107;
	Mon,  6 Jul 2026 17:58:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360695; cv=none; b=n5xbnVxWbnnZGR9M2P2ci2N8aHsOygC7+fCfD09LIwIcrC9hjb83/IhICY3Vjzwd/xuU0p28kcRxm5tSYjXhHsoyuGdK2sUdFwgCMZaH1mmlNoIzkEo0lHPTlT3n1CT1U4Zi+Z16ANCKZY0NCurBqwR8mWbCPFo6wTCZPHxWiQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360695; c=relaxed/simple;
	bh=7KkX+f/up3t1LXyYwoUTG1A3QY/0vuH6V9GC8oJ76qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TFf+nNMkKqcktYrsdL8DICsK4zub+/le3c92HWeQI39I24MQdBh1SEzcr5Z83GqmhBN3sM2qsWEK70lOqW2ZXyYukbp/Qv+nj1pSUGeQT9WrqfH17mEOIBL0fCi5QHcVlLB89vAOLd5lf8I5i4Cj99Xc987vqqtGKlHJWUp3Qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4Z2S3BA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348E61F000E9;
	Mon,  6 Jul 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360694;
	bh=7KkX+f/up3t1LXyYwoUTG1A3QY/0vuH6V9GC8oJ76qI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4Z2S3BAT2ETI0Mel31NmqolMU6ldC4iz/6mIl/WqQKhgi3oGprKRGRRFPRNoCyvs
	 nfIViMuDME0skEOm5Djvb0rPnU5UxsflgM4fqcRZ+FWu8e1LtecBrB9O0U5jV0BM5R
	 +DwmjfJm6FrTxGT2HWYMflRKxJxjQWAhEfemPNSSMY6bHZ/hxZSGCoOwozjtisYoK7
	 pThdwEwj7LpRmjdXURyhw8rtxSz7zlK9GT+uycpt4Y5Iqsy8gqbV/a2au89sVzvSYx
	 UYSIgVlIuyUaq0hGkq64/z6w7QbsDE1OGy0A4p/njJuE/lRNYAQNKCm5cTZSleYQTe
	 /2gXzOehGMQnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] rtc: rzn1: Dynamically calculate
 synchronization delay based on clock rate
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260706175138.12587-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:58:13 +0000
Message-Id: <20260706175814.348E61F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6944-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,renesas.com:email,sashiko.dev:url,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FCFB7145DD

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace the hardcoded hardware synchronization delays with a calculated
> time window derived from the operating sub-clock frequency.
>=20
> The driver currently hardcodes microsecond ranges assuming a fixed
> sub-clock frequency of 32.768 kHz. Newer SoC variants, such as the
> RZ/T2H, drive this hardware block using a much faster clock rate
> (~195.3 kHz). Hardcoding these wait windows forces faster blocks to
> over-sleep, introducing unnecessary delays during clock initialization
> and register configuration.
>=20
> Calculate the duration of the required clock cycles in microseconds based
> on the runtime clock rate, and store this value in the driver private
> structure to adjust the usleep_range() and readl_poll_timeout() boundaries
> dynamically.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8


