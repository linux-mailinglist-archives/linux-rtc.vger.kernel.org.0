Return-Path: <linux-rtc+bounces-6916-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LaeMNrZ/S2qnSQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6916-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:13:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D9070EF7A
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:13:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oUWw7TCz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6916-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6916-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB5D3301477D
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8118399D00;
	Mon,  6 Jul 2026 10:06:37 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2630347FC8;
	Mon,  6 Jul 2026 10:06:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332397; cv=none; b=FcagtYfuqYXn/5F82oE9h8E3hgrEHKZEPER9OHIrprKdtRDAPiyVz8cc/m1O2MnEDRUX6YY2bsKwBBQJ7hEgN7hV1lQTkcRk4FCTHd84kvTCQg384VQgHuaQ0q3ocxIKiODJK1jTO93QjI1HpccD7AA5pXSoFf6VnjbaVl9h+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332397; c=relaxed/simple;
	bh=aKqv9iSfEHkhj931jy4Fo7+uDmj5Zz/6/Ir+S9UrMVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWWBhr/S0/2hqnLUjvDi2JFcBfijSPBPXCVE2Na0xLYtOHl2DdQWoaFDL1RTzGf/VDTwVQUPUhO8ISG0F2hBvVR+rwhc7HiuVT/wztSsNOx79wnDIE7E9cv9eJyRvwmw5RoW/5KiHMet4Ekw9GMGPNkf0WSA5iGp33oDx2iXf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUWw7TCz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DC61F000E9;
	Mon,  6 Jul 2026 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783332396;
	bh=I22ZRASJinz7jOIvRBdEl/MHKkZMfQEw0B8gfj9RhCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oUWw7TCzj4IObbsbmnD+wIZsXPiqunNuMbjXRXIni6S5z0VVGPDqmztX5wE439+Wh
	 n/8ZhHl/9SqE6+mGcypHJVu9iI8sivTc0FhXlByTYWfiyfDKE4CBC8KlX5wnqvLeBT
	 I8OBIc27IvsDaK8b69/wT/M56FYkIysLEiUPa2vLKqCwL1mkTe1U5r95Hx7saKk/xg
	 zVq+qGbnoCZw/0eZgUiPLA9XkgjVFs8TaUMMSKHrijuVqFhNutNkjo1JicQ81dhcjU
	 V5rpy/9tQAKb5rRfrjDyez7sKENBBbSQsJ4UA/xTMZgqyIt3dk0EFCzO5L9hh6genJ
	 qF0pJbUs952HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-rtc@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
 <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:06:35 +0000
Message-Id: <20260706100635.E5DC61F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6916-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75D9070EF7A

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Inconsistent rate calculation between `determine_rate` and `reca=
lc_rate` due to division order.
--

commit 39f872462c04ad724c3624b152234160de56a47e
Author: Jerome Brunet <jbrunet@baylibre.com>

clk: sunxi-ng: div: add read-only operation support

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb524b..d1c8c7baa12dc 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
[ ... ]
> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>  					     req, ccu_div_determine_rate_helper, cd);
>  }
> =20
> +static int ccu_rodiv_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
> +{
> +	struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +	unsigned long val;
> +	u32 reg;
> +	int ret;
> +
> +	reg =3D readl(cd->common.base + cd->common.reg);
> +	val =3D reg >> cd->div.shift;
> +	val &=3D (1 << cd->div.width) - 1;
> +
> +	req->rate =3D ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
> +						  req->rate);
> +
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		req->rate *=3D cd->fixed_post_div;
> +
> +	ret =3D divider_ro_determine_rate(hw, req, cd->div.table,
> +					cd->div.width, cd->div.flags, val);
> +
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		req->rate /=3D cd->fixed_post_div;
> +
> +	req->rate =3D ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
> +						req->rate);

[Severity: Medium]
Will this division order cause inconsistent rate calculations compared to
ccu_div_recalc_rate()?

The divider_ro_determine_rate() helper applies DIV_ROUND_UP() to the unadju=
sted
parent rate, and then this function divides that result by fixed_post_div a=
nd
prediv.

However, ccu_div_recalc_rate() applies prediv to the parent rate first, then
calculates the divider rate, and finally divides by fixed_post_div.

Since the Common Clock Framework requires determine_rate and recalc_rate to=
 be
mathematically consistent, could this discrepancy cause rate mismatches or
warnings for clocks using a pre-divider or fixed post-divider?

> +
> +	return ret;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-a733-rtc-v=
4-0-f330728db3d3@baylibre.com?part=3D6

