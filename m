Return-Path: <linux-rtc+bounces-6872-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ltKuM3siRmogKgsAu9opvQ
	(envelope-from <linux-rtc+bounces-6872-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:34:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309E6F4D1D
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PiF4RbYa;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6872-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6872-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8208030F6DE5
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53E8427A16;
	Thu,  2 Jul 2026 08:23:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0394189B2;
	Thu,  2 Jul 2026 08:23:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980635; cv=none; b=VlR9WCXlUIiM7YBLWpXyJ+1ebEJ90qPjScUBKlNTAdmoInNRiQSZR8JcSIHqj07010PWfNGwFRl7a2cOMpmX8W5iIwv02ubXantuA9mwsy0wZCDtxp6MtnZlXNUA5BHnZ0Pc8GOFqmCaanzH6nyiasFw13vEyJTr6RnK04mq65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980635; c=relaxed/simple;
	bh=7bYHsUXG+FaYYZNg1wJs3IPn7MVk2vRmY/KLPB8trcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HroH4A1G2YlFEmRo9nJQ2FrmWATtvF7SZvtPXSfArHMztGBmNHA2DUjCtGbhzKCQOGmSyjKd2SkqPMCvjuypK6xIgx5J9xpUwzR3ALP2K3Nk6IE2XmFiyCOXx6ucd/LbeukRhb4VWixdBjXYnwsULdnRK+2nhFdbDcXmqJN6ahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiF4RbYa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078A11F000E9;
	Thu,  2 Jul 2026 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980634;
	bh=7bYHsUXG+FaYYZNg1wJs3IPn7MVk2vRmY/KLPB8trcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiF4RbYaDBoEA9LKU5NDa4mSGYKQw8TAf4bBZhdoSjLDLf0cUcyjN0jtquAOpARGQ
	 D38YCShhtVQnm20HfBtsfUg/WvoCKFaZMVNb+LMG2ybt6T8H9vMe85iW5mc2AFa/i6
	 cgX0WYlFkXDHmADed0UJlByxzEdduUPirsYcGq9vY8hzLEbXU+cBuOy23dlnlivrem
	 hm7Dd9FyYhyfLazp2hJmnxgjvgu5ME2RgsBACBhC8zgZqeKIPaOsV1+Pj28eYzvZ65
	 pEU7Oi6+qq0nZHwXklZdanPZLYju4Srp9Zli/EaPIA+hNZiKsjKFiQv7nXJdl9ktWt
	 BpYck+SrXrARg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] clk: sunxi-ng: sun6i-rtc: split main oscillator
 div and gate.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260702-a733-rtc-v3-7-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-7-eb2580374de6@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 08:23:53 +0000
Message-Id: <20260702082354.078A11F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6872-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-sunxi@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3309E6F4D1D

> On the a733 the "osc24M-32k" clock has the same gate bits as the previous=
ly
> supported SoC but a different divider implementation.
>=20
> Instead of a fixed 750 divider, the divider is selected based on the
> rate of the oscillator. It can be seen as a simple read-only divider.
>=20
> To easily replace the divider part depending the SoC, split the divider
> and gate into two separate clock entities.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-a733-rtc-v=
3-0-eb2580374de6@baylibre.com?part=3D7


