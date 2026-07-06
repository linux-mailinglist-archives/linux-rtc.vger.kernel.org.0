Return-Path: <linux-rtc+bounces-6913-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4IUzJzOZS2oPWQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6913-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 14:01:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B591710344
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 14:01:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rl2vJMiG;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6913-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6913-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8B7838834F6
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FF93E63B6;
	Mon,  6 Jul 2026 09:43:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D044D022;
	Mon,  6 Jul 2026 09:43:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331022; cv=none; b=UpiHFP/2G3LCsNq6TruZBTCFhGZZohwaGJkjRXCkbhinjt1KfZzbGqTCzJEyKfL9PBEpm+TSVfXb3cdkVKrJdhzC4c1dnKHlZsvwDUWz4o2DEZMUfPZFvdVSlxvrzjeayAFHvkeiXZZFHzqSLnMofM/V1zs9nMnJ8XwJ6Zz4a6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331022; c=relaxed/simple;
	bh=QUrNVelZjB6gfX6pLv5bcQ1wXb4sZSkUjHyYy5GNnO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tHlC/PDdcTsGeC2Y+Tvm8yISAb7TZxGMZWPWDT8oopxAPf5b3sCx4FgBIt3n20hZr+oKG3CyR7BzeLEyVy3qXmrYAQAv/Ia9bFHU4Vq8Hp3wOkrdbaT9RORJoKHGepGAuSuPD99IDE21SQRco/XRaS3nv+j5He4MUgsJ2zc3gb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl2vJMiG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B031F000E9;
	Mon,  6 Jul 2026 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783331014;
	bh=QUrNVelZjB6gfX6pLv5bcQ1wXb4sZSkUjHyYy5GNnO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rl2vJMiG6jxO/opTDc75kFEe0BHFM9o38mHitIEG5ESTicnk9SwegZGDRQqeJcVzx
	 mje3N6N3PthTulEarFrBYuj9w4PigV924LDE0jeU7X25Qd+HxeJGqdsCOtkM7sSNtJ
	 9c7v1DK++afQkRBfxJMvE9SZ9/E8DpAm5VXDieXR+5v/Yj2RZwZu//FwV2V63t2k/r
	 U6OcsVmE+xqsIazOnguj+weVoZP6pS+Kc5OeMsHyrJ1dqGrgo0oZ/DTqY1b/Q9kTwc
	 sQ3H3IFg+WcsLqNbokZmH/MjBSQsqcvUyg0j5goaJCzxGFFZvotEWuAF/XiQ4XiOiN
	 SRXindJDZb6wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/9] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org
In-Reply-To: <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
 <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:43:33 +0000
Message-Id: <20260706094334.78B031F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6913-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:linux-sunxi@lists.linux.dev,m:linux-rtc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[smtp.kernel.org:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B591710344

> When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
> and the number of hw clocks might be different, eventhough they usually a=
re
> the same.
>=20
> If they are different, it could lead to out-of-bound access or registered
> clock left behind on error.
>=20
> Use a different variable when iterating on hw clocks so every registered
> clock, and only those, gets unregistered on error.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel=
.org
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-a733-rtc-v=
4-0-f330728db3d3@baylibre.com?part=3D3


