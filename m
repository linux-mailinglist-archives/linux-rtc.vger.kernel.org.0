Return-Path: <linux-rtc+bounces-6940-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JgkbNTb1S2rTdgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6940-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:34:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B617148F3
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:34:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OaCEjJxa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6940-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6940-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766CE36DED99
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E293D810F;
	Mon,  6 Jul 2026 17:55:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B23B7B6E;
	Mon,  6 Jul 2026 17:55:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360554; cv=none; b=tX5V9RvqpDBQVQ9k30nP0Y5QyJ1gvtRNmpMxXBDvPmE76AZrtjliDLOC88vdDIEiGAR0qDJQWJ6kIVWl2s/Gt06MNTHk1lruXNPbjQPEDR6YE+DaiSflY/NG5iBO8i0e9OHTd2Q+hRuwbUe65CAUX6kWKdSfpw61IlzRw9tOneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360554; c=relaxed/simple;
	bh=i8sYLarjLURvO3XkpAALJzAFmlUkduVrHHulfmo010w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/mNZS13KOL1lPuPThuIv2RiEGcS8hwlc4VVeC+IMStv6LxZdlm7azC0jeMHz4xkJ7Ra0h1koCnyjrQZjSjPCji5rPjeiRNIvGjZuWO9X6/cqf/qacvql9rW6t9bgcnvi7DlaYBmxdBrz7G9/r1x4XAPx5N8wDMlV78Xej5uol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaCEjJxa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B1F1F000E9;
	Mon,  6 Jul 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360553;
	bh=i8sYLarjLURvO3XkpAALJzAFmlUkduVrHHulfmo010w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OaCEjJxa6/7m4rmGwhdcUWl7/9Vxxrq9W/C8lbtNvQ3OwA4ZQebLzKHbGDqesP5zr
	 jS4tN5uks+DpBJ5mmgASE0DdLQBHcbgw5hYL8AeHRG9WvsRKBviqoHUXwql3veYZgE
	 EKBTUp+gVMZ8ObWLiGXLMxY4pexIzG/l2pcAU4wuouEurNSNrUhGwxGgIC8NWsH6m8
	 msh/O+e4aeMdiJay1o0lvciY8Mw0fi97MEDtBc9GSDs1uPuE50u7rX2210V6BHwpID
	 zsWUFvJX2rbCbDwDdGItfnBBy0f18nqSVxyYr7pV2hxce+fAGe0dUonsDgfD2vJ8+s
	 ZPjj7F0lqRROg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/12] rtc: rzn1: Consistently use dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706175138.12587-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:55:52 +0000
Message-Id: <20260706175553.32B1F1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6940-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:wsa+renesas@sang-engineering.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05B617148F3

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D10


