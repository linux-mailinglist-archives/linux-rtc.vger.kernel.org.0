Return-Path: <linux-rtc+bounces-6832-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SwpiDrUmRWqI7woAu9opvQ
	(envelope-from <linux-rtc+bounces-6832-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:39:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4A6EEDDB
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OMMDa++I;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6832-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6832-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC19C300C0D4
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67CF345749;
	Wed,  1 Jul 2026 14:32:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6022E736F;
	Wed,  1 Jul 2026 14:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916340; cv=none; b=eVHvGVbbl4Zo+g22HC+PMJl6Fb4uXJXVoZCXu/xgifvQgGcmoTNB3wYQ1dkp64v5kKoUUFZKzEDjvv5m7HZMx1EhUahEmqHJ0dHqQnItugLv9XnohQ/MZIyIMrBKFHTLmuBMvc/ozexOj1gok3I362UgKbqOMGWVmOlTjY6ttPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916340; c=relaxed/simple;
	bh=VowqlL0DJjoWqTg0KD+LrSEe8g7aGsNNd0e3WoMI04g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fZkuH47eD1fXEpsPIBLGCB+eq7rs2hpW4AsSqNyu6KvRWqfxO05aorQmYlfa+AYrbvjgVJ0pMYioYgotRIKc8w2uqQK5co3bC7h4OPmnhsRfUZcONhtEfVhH+MQCjyFnMCO0bXPbXH/O956mcHJ4HQ5ZMuyLVhRnybIGnPHrLZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMMDa++I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209AF1F000E9;
	Wed,  1 Jul 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916339;
	bh=VowqlL0DJjoWqTg0KD+LrSEe8g7aGsNNd0e3WoMI04g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMMDa++IKc27aEh2z+blUe5RxFS22wQ36W/ptiq/Tt/SrPDu0VW5VCYo50E9VP8NB
	 l2Bc7qJFSJ7Udi4H44scwO33J0N3cO6UKO19OJFlItyOqU/rO2RAZ75IDmXJ//29Qf
	 iMpGuu1lRPQ4krdeHbDVY284Vq/JkmEVq2kpwXt5SEauC0YNk8/f4ANvOShQmsB8Ls
	 Ciy1UVz9ORM8sSnfBUKi3Qup+6jVWpluF03t+Ki3xEk0PGL8V2jzbQJL55Y6o1f/fF
	 cd3om51Jz5KlZGTspkWK+KOdNOxd3nQ5pwM0sf0ZIZ+h6NgXu8bE7BEpkWyp4TvHDl
	 jPev7Hs1FmGPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701142953.2014895-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260701142953.2014895-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:32:18 +0000
Message-Id: <20260701143219.209AF1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6832-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:wsa+renesas@sang-engineering.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,vger.kernel.org:from_smtp,renesas.com:email,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5A4A6EEDDB

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
> closing angle bracket on the second author entry creates an invalid forma=
t.
> Correct it to the standard "Name <email>" format.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701142953.2014=
895-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3


