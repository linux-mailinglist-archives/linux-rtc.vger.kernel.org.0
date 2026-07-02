Return-Path: <linux-rtc+bounces-6874-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xt4jHaokRmqoKgsAu9opvQ
	(envelope-from <linux-rtc+bounces-6874-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:43:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC16F4EB3
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yv18ov77;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6874-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6874-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C8BC301256A
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA96357CF9;
	Thu,  2 Jul 2026 08:26:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1242A793;
	Thu,  2 Jul 2026 08:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980787; cv=none; b=eCiygI6lb26RhPCE4pVGHV+8xS2LXrYuP/c63AByX6XqiGH3HnPiXmZ5gLKnjIXTZekC6UnN3NxTgBC3DU3q+LnsabHtgwCPawW81+ZfkNt727MtWzNWiNIHZIAdqsP1w6ApdACen50s52MFx1IJr/jDZJVAtzYIMHXSgdGNEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980787; c=relaxed/simple;
	bh=cQRXf6ceBp0PQVF0NXLpsm76S87d1W1+E10MJf4GIaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LoMluk5CbH6dD7m6VuAxBncx31iAqggGoaaOulDGtQOhuXg2GHqJaa5SDbC73PcJSxB55iilkOWLgD8y3b9JjW8iJ1r9W1q17h2tqi4ShfC6kPmmCDZV77/3gCoBzfJDlRig8fzsMxABbRoTeoVVfi+z0pbpe/wGFcJq7Mh9d2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv18ov77; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FF81F000E9;
	Thu,  2 Jul 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980781;
	bh=4oT17v1Ou6RaD6Z4K4iOm7mKLYuKxL7qii+MGUf6YTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yv18ov77wofXSSC3MNogefT6nH9Ui17HXRxy1Ptqrr5DZLsU0xCdeF+UyTGNWz9lw
	 7ZKC5089xaU6upLZT+uafke0Z5lMx7ceNZHAk+B0jdkrUCLXbvH/d97Vn5T/7JEJ0O
	 aZSxUi2GOeFV1d2I0BSr5DWNmrDlZYWrQNTggByrkVIoFfvohCiDim2EMqLC/XrylD
	 spS3P+VlkzvbZTcC4EHWN7/D4+sJJT44GQWdG2q3zIdI7mXKUOxdowcQQJq6dTpGRZ
	 S07dcmP92yp8J/UMqYUBD7fnWJbEbX3cOVpDlwsnN44y/68WBRfN32kbJCZMRxAvrk
	 bkD2ULvIRoWiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-rtc@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 08:26:20 +0000
Message-Id: <20260702082620.C9FF81F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6874-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:conor+dt@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,baylibre.com:email,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3DC16F4EB3

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The existing ccu_div_determine_rate_helper incorrectly asks the ha=
rdware parent for a non-predivided rate when CLK_SET_RATE_PARENT is set, re=
sulting in unvalidated parent rate requests.
--

commit 20e3c89e1fcae37e3eaf3a9be6d0c4e28094d07d
Author: Jerome Brunet <jbrunet@baylibre.com>

clk: sunxi-ng: div: add read-only operation support

This commit adds support for sunxi-ng read-only dividers to be used
by the a733 oscillator detection logic.

> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb524b..d1c8c7baa12dc 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>  					     req, ccu_div_determine_rate_helper, cd);
>  }

[Severity: High]
This is a pre-existing issue, but does ccu_div_determine_rate_helper
incorrectly ask the hardware parent for a non-predivided rate when
CLK_SET_RATE_PARENT is set?

When ccu_div_determine_rate is called on a clock with a pre-divider, it
delegates to ccu_mux_helper_determine_rate, which calls
ccu_div_determine_rate_helper. That helper then directly invokes
divider_determine_rate() which queries req->best_parent_hw for
req->rate * div.

Could this cause the clock core to query the upstream parent for a target
rate without accounting for the pre-divider? If the core subsequently sets
the parent rate to an unvalidated higher rate, it seems the parent PLL may
fail or clamp because it was asked for an achievable rate that it cannot
actually sustain when multiplied by the pre-divider.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-a733-rtc-v=
3-0-eb2580374de6@baylibre.com?part=3D6

