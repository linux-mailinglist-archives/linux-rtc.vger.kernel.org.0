Return-Path: <linux-rtc+bounces-6971-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fOG+FWbtVGp3hQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6971-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 15:51:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8874BE3B
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 15:51:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="DPU9gPQ/";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6971-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6971-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7E93303FFEC
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2026 13:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF714189C7;
	Mon, 13 Jul 2026 13:42:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DFC33A033
	for <linux-rtc@vger.kernel.org>; Mon, 13 Jul 2026 13:42:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950178; cv=none; b=cCbyEfFenWKbrWKNm4sK3X9tjFcjPFMO4UTyvjILfZ/0IP2IoxlG8Qwy2NfVzH0H17Hz/jGrl+xHnIEKG6wb0k3F4M4uZecyHxYRlAks2CXGXTXoLyFr2tGkebKnLdW5xk9pEKsM5LGq9pKj98ICeZ3dzwXsOWqHoGP2s9yYN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950178; c=relaxed/simple;
	bh=+gBtcuN46PIx3ua/BFmlX6uY4S5iwuZioy+C6XPDr9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5d3i7L/4rcg3EEAQwz8HYl1XcTmjiZ4oXg4FPVXxpTlBAq/c+UCwGaN3iMJdyjjGagODWLbCM3fYXIpn2CxExIgYdbpfrW0dTeJcxdMvStJOdwB0zMoI53x/aw8sm4h975x/PJ+pKN1f2msss8J8xyVY+t/71k6JkA0sWYdFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPU9gPQ/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0871C1F000E9;
	Mon, 13 Jul 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950177;
	bh=+gBtcuN46PIx3ua/BFmlX6uY4S5iwuZioy+C6XPDr9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DPU9gPQ/fUAKxbQsbJl4yV2wpAOuomxyjfp/Qk1Ru7q0xEsXQ1X7UrkM3RoiDZ6Wn
	 CU7CY1i31k/wSkmw6To1WNDN3mo9y0oDbv5p8hKtnVtxAtYMg7uwj1okkMi4+ItwI3
	 SCAa+xsSc5Sz4KcAJo76m5yA/FgOtCKvZXs0NyvjFlRbwuCktYLLuLSuQSttiZ12D9
	 7JLgDkY/ItZ6TbNqX0ER9r8T1FRP2XifcPdNjTcUI9U9aB9cSzay8hfZEsiDE6UpvH
	 mL2/FRUk8ASnCTyFK+GaE5/hxRctuKsShi/tXpU+wlsZ2apIJ/lJmV9Jxc1+IyPwZW
	 Q1LMYLYXFqX0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: msc313: Select by default on MSTARV7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: linux-rtc@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260713133919.1356748-1-daniel@thingy.jp>
References: <20260713133919.1356748-1-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:42:55 +0000
Message-Id: <20260713134256.0871C1F000E9@smtp.kernel.org>
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
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6971-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:daniel@thingy.jp,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,0x0f.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7F8874BE3B

> From: Daniel Palmer <daniel@0x0f.com>
>=20
> All of the ARCH_MSTARV7 chips have this RTC so it's more likely
> ARCH_MSTARV7 wants it than doesn't.
>=20
> At the same time fix up the indent on the depends on line that looks
> like it got converted from a tab to spaces at some point.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713133919.1356=
748-1-daniel@thingy.jp?part=3D1


