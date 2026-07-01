Return-Path: <linux-rtc+bounces-6840-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jey2KOspRWpZ8AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6840-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:53:31 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 443256EF033
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:53:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UwIgfLHA;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6840-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6840-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED0D5300DEFB
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACB635E1B6;
	Wed,  1 Jul 2026 14:50:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F0348C5C;
	Wed,  1 Jul 2026 14:50:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917455; cv=none; b=ehxBcwAw/jkbe/2kUJGR1tewxm54W0XTXERn7LULcRDNBS+PF3Q+DaBa6IUnXrqmy9pZUDcBVzy1Gxkp9sEXYJWLA7VlCjTLq3tsCjn21kVJMuZJXzA5G6IYVOe0lWdN3vQSFQ5Cfq+kI5DU3z4paoQhN64qo6BCBHH439H0JbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917455; c=relaxed/simple;
	bh=MDlHhwvbadiOZHKr1JF3JUzDSAh5NSOcXZOekgyLkYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MFR3hrkO8njiMpwpcKoegoFYzTRiKdWAOEQ4vz3UO6n00GxPwl5DX40zYEL1WbgDlYdmJrXsogFygqWfSq3AC2pp9/L2fCR6QHK6GfZMw96FWQrptux6YnwWzAlycPoOet1P+KhVhA2e2dH10b7vud2A6s5aGBvXmIhh5mjHxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwIgfLHA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757001F000E9;
	Wed,  1 Jul 2026 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782917453;
	bh=4dulwvD55+9wwlESTkQpE/4rzpGt4X57YDRb66/k8w4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UwIgfLHAhusuK5G/5qODflNM7essgFMbNsqt+xCet5ZI+JU3YpCj2vedRW/5dJ6/z
	 O508RWR71aRlA+xhM4LXDdI+QG3nUddolMt8rMug4nR1731yRAFV2Qpo9qDmEOEgjD
	 3RdQzCHm/DGDpZT+Rr8kO2IVMn69CTkieeygHAbmpnRqp8pkkHXS58uEnJA18/VVea
	 RmUODdpD0+tjdkG/rHkABbSFtLBVbt2gdrIcGmFFzKMzkaVe5VhBeGD85p+9Gbo3AL
	 f8St9tprZWmiKLqCk1rnjqgv6TsUKMOp/6mSAUcB6p0aZkt0BkzE5jSWB0QWa17HzR
	 vmZ2UiAhuZl7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] rtc: rzn1: Consistently use dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260701142953.2014895-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260701142953.2014895-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:50:53 +0000
Message-Id: <20260701145053.757001F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6840-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:alexandre.belloni@bootlin.com,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,renesas.com:email,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 443256EF033

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature pm_runtime_put() in remove callback leads to a potential=
 bus fault or kernel panic due to devres teardown ordering.
--

commit 20388d9c3bb9eb8111711742d828f2997e736384
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Consistently use dev_err_probe()

This patch updates rzn1_rtc_probe() to use dev_err_probe() when the alarm
interrupt request fails. This brings the error handling into alignment with
the rest of the probe function.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 244d0fc70fdad..d990075839c13 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -471,7 +471,7 @@ static int rzn1_rtc_probe(struct platform_device *pde=
v)
> =20
>  	ret =3D devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Ala=
rm", rtc);
>  	if (ret) {
> -		dev_err(dev, "RTC alarm interrupt not available\n");
> +		dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
>  		goto dis_runtime_pm;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but since we are looking at driv=
er
error handling and teardown paths, is there a potential use-after-suspend
issue during device removal?

Since the RTC is registered using devm_rtc_register_device() in
rzn1_rtc_probe(), it remains registered and accessible to user space until
the devres teardown runs, which happens after rzn1_rtc_remove() returns.

However, rzn1_rtc_remove() manually drops the runtime PM reference:

drivers/rtc/rtc-rzn1.c:rzn1_rtc_remove() {
	...
	/* Disable all interrupts */
	writel(0, rtc->base + RZN1_RTC_CTL1);

	pm_runtime_put(&pdev->dev);
}

If a user-space process accesses the RTC device (like reading the time via
ioctl) precisely during driver unbinding after pm_runtime_put() is called,
would this access hardware registers while the clock is gated and trigger
a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701142953.2014=
895-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8

