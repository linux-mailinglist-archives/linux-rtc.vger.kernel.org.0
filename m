Return-Path: <linux-rtc+bounces-6877-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ADeEK9mRmoMSwsAu9opvQ
	(envelope-from <linux-rtc+bounces-6877-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 15:25:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1836F84EF
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 15:25:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lqbaxj3f;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6877-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6877-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B97030419F6
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 13:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5C54A2E0F;
	Thu,  2 Jul 2026 13:23:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6949690E
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998607; cv=none; b=hTppAmZSkV6+dGAxbj6hbDciE/rACSaeio4msF0NSAxzjULzpD2imPxun2PH0LHxxFSW5Cmrg5Ekh24kT82UtvViNQ0GrRKhAkPYJWSIKkgrMx10JhwsACG9u86Y6XDqeSSY46WxDyJhkcUXoaVgMiYITaBKUq5Gok4Njp7VMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998607; c=relaxed/simple;
	bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCKH9Ai5dg8bLQ7+ZW0drBF5TsViU/gFXKrtVyT4rJKnsXBg8UdDzXHXK105i0nVAXO/OVa/70xE8hIk/t0zyABfC2jw+GRx1AUSZXm6oNc2qjYE++uO1inuQeau5bg1hQl3ZTaxJUzSwQMQDWDLGJkGFEZNV6JG3ozTnRyycig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqbaxj3f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234021F00A3D
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998606;
	bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lqbaxj3f3sxqz5zXLRjl2SjXgVF2ARha+OAma9+j1biQ+VwgoG5UBa4YwqGIrw3uS
	 1qXzdt/kY8BGNTq0nRffGkovhq/FPQcFGuitj/QOQh4EVlvdOZjtgdCwAMXR3crPKv
	 a9p3F2iAwPgNyMfH9exKu+FoPlltpsyR9b9tti3TCPhqnPtCTm3FBQ4s0qsXadd0xT
	 Yy0vWhz0rVsw4Hnhvys4WT4ssEcGUKzRkUD0kWUCf4Vd1poFUxp4OZI0dSRrN36wIG
	 WSKkFehInXE4OnsbaDnNoqkgYFelTo+mIqZMKTkCgNTC+Qjl40HI5eZ7o/QPdhhjNJ
	 hc25E3eOqDpOg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b1eb7bde5so15596981fa.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 06:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqxT+Q++98k3WKsjk+CNta3XLcSYxGWD9syjpfbU5jtScVAhy/oNNlvsFhoa2fi9HGKG0ibMeCXF+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/+0QcKbqtmrhaOaNlPS4+tO1NSFAhcDSNzlGgbdktxSWxpI+
	7aVWujZNw17cgK+FkZOC+SC+2hSr9m37j7hKSbN8Q1gFUARpL4920aDz1DuF6LjRJB7Xd5xEseW
	meP+WoUSHWQb/O+JTK5HwucU37zpKetA=
X-Received: by 2002:a05:651c:993:b0:39b:4231:8b85 with SMTP id
 38308e7fff4ca-39b42318d0dmr2458931fa.40.1782998604620; Thu, 02 Jul 2026
 06:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 2 Jul 2026 21:23:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
X-Gm-Features: AVVi8CeV6-IjWgsA2LmKA_98iO6chNHg3C1q7oOyJiDDAU0-Mdj71gMQi3ZmkpE
Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on error
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6877-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B1836F84EF

On Thu, Jul 2, 2026 at 4:10=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
> and the number of hw clocks might be different, eventhough they usually a=
re
> the same.
>
> If they are different, it could lead to out-of-bound access or registered
> clock left behind on error.
>
> Use a different variable when iterating on hw clocks so every registered
> clock, and only those, gets unregistered on error.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel=
.org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

