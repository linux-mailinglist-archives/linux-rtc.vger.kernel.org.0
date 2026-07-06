Return-Path: <linux-rtc+bounces-6917-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ASxyGJuLS2r2VAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6917-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 13:03:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D68AA70F9E1
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 13:03:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mnsnxFZN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6917-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6917-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 077D131BC60D
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709B830C637;
	Mon,  6 Jul 2026 10:10:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880244213C;
	Mon,  6 Jul 2026 10:10:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332648; cv=none; b=BuB+QXiMlHUQaKj2UvlSJ3BVrOKWiRqeaN+xQOlvqWyPv20rEITB+Hhv54Xuz26rxzYGg7e/s9KSaGmxXCCbSLWr6ogbSFlTmH4Y0AA9XVm+pkIGU0s/AZ/GHwBVjaNUS0Cc7P5A4bhNAlYh0dPR0XEr/7s5jDhojgchjkYmtCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332648; c=relaxed/simple;
	bh=WLIwIV4GvCX3ucV5uyAb6toekaibko4A0uIwk9CdbO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a5bXn8Fugg5L5GDv4OIpeddwzM/22m3xXnfSzjyjdWDvG32mDm9BA76J5FshQ9/AWDhKHdByR2+tSnr/c7mZmo+axmTpmBdrPx1oQWpthZTgDQXo1HNXD+5SPkl985iUFMs7zdnSciHwKOnNtcFVUo6gBRq4zyAbG+P28Et7+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnsnxFZN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9971F000E9;
	Mon,  6 Jul 2026 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783332647;
	bh=WLIwIV4GvCX3ucV5uyAb6toekaibko4A0uIwk9CdbO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnsnxFZNQHpf6/OiaIJhipA2sAVcZqZzTAI4IdyS0ip7r8CrrR5RUO9d8J8IlwAS/
	 ecBGXXL+LqfdrcJXNqviJd9tTPb7iaMYfSXFxseCq20nX4aNu3VuCxKL5lGnA9f5JQ
	 FMDvuIJCTVWKEbTRobLQ2vd3pKXr3wLlqAiszs9Of/gpM+VoequMxGNXkZpQi6VZxS
	 q3LECnGJg1BkZmH5j6adZJG53NsHWWgIg32oMb9gg9z9VumrPuAY/DRabST9XgImq6
	 joBO9BPEuspWPetI3qhhJ/vKF3t9rPTWo4HaEeqVknSh6tZVy6uW2MHILTDcuQ1k6N
	 0MH+/KVsgmu5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] clk: sunxi-ng: mux: remove unneeded export
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
 <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:10:46 +0000
Message-Id: <20260706101046.8B9971F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6917-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D68AA70F9E1

> The export ccu_mux_helper_apply_prediv() symbol is actually not
> necessary. No module other than sunxi-ccu would use it at the moment
> so just remove the export.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-a733-rtc-v=
4-0-f330728db3d3@baylibre.com?part=3D7


