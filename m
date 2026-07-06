Return-Path: <linux-rtc+bounces-6911-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t/SPBt6GS2rSUgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6911-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:43:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B570F645
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BZVtTVzw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6911-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6911-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59E9D36B74CB
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558F7478E38;
	Mon,  6 Jul 2026 09:41:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B438E113;
	Mon,  6 Jul 2026 09:41:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330895; cv=none; b=KoPp/pJ828CLsveweiMnpQDplcpDegz9OhO+yK+18K0ThiNJFvnKA11/ONZtMAn2zf6Wtoo6Fkp2Ohpo+CWfsECip8XCbB88YW7bhpnkCjImL+zzGt5+nGsXrf1ABfqrAsA0rF143o5tlZzB1KRNyT6WqjUZhBFMt2zWJA6Pi/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330895; c=relaxed/simple;
	bh=lJoV7mN+tOPWEEgWwlqKCMyeoG/BqxRd+4Ge//xmaVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uKUPdRzDqv85bbIjGC5iLZ9mHNjzF6euVi1ff1Dl9slkca8NU07XfkurB2MpA9VYQ4Nm3tHqfB48soU+hzzj9PbDZWafz4ie25zmF+voiODgzRAIgC7bRfbRFmeRsJNP1VKdSt1aPdOk5hKvUWxgQaJ9Sipev+anmVOnsgxG1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZVtTVzw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9031B1F000E9;
	Mon,  6 Jul 2026 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783330890;
	bh=lJoV7mN+tOPWEEgWwlqKCMyeoG/BqxRd+4Ge//xmaVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZVtTVzwE1PAH3YSHG5vVNL1nKUQ8KM6jZmgtw5TJpxVeRhT0D5D5uJiQFHBZG36x
	 T7vMFpTGEgGiSLAibBgYeNV4xpnPgmFn3bFxOnvY/Ic42sJ9zEsoxgcSsWmJds8ORq
	 K6atO6A/v5yc0c3uhDMHxaFAGmxcZQzgqcshap4KMwKTdj/qBLtNOKmMDTBgDeTCd7
	 46BtdvGuHB5hFuDEJDa8U2bTZ13UD/RAHhZwl5Bc5zsQGaMWJ6Y/h9mViIQLfcocf5
	 nRVbkLXbDzoNv2ttoKqwrxpmfy9Ia4nlBEMSFzBBAtvyC9mzyzhx31MOmEuWCNWcHg
	 By8LhjCZXSMuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
 <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:41:29 +0000
Message-Id: <20260706094129.9031B1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6911-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:conor+dt@kernel.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,baylibre.com:email,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3B570F645

> Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> peripheral oscillator clock gates of this SoC.
>=20
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-a733-rtc-v=
4-0-f330728db3d3@baylibre.com?part=3D2


