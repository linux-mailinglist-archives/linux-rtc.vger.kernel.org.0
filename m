Return-Path: <linux-rtc+bounces-6977-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RZYlN43wVmoHDQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6977-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 04:29:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50675A0E5
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 04:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iVNVJ0Do;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6977-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6977-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C016E3053E9D
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 02:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060103A783B;
	Wed, 15 Jul 2026 02:29:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B62390231
	for <linux-rtc@vger.kernel.org>; Wed, 15 Jul 2026 02:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082564; cv=none; b=lQQN/0sVw50gPDROlxC2FUHe5NtGRnp3O7ygTS0YSy/L+YtZyDgig5MP4eMYxOwD2I64yew0d0yhYPsFbV+gOZixBhkSgXRN/vLZDT/6b5amFOAN5GB6Jy7EyVl53LLxOS/VUpZwTfegpcE+2jNLNg+kygHfd1JqkuBpateIkhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082564; c=relaxed/simple;
	bh=yTeuFGFVBZGYk5/ZRgVlpkcwyL2uMGxdjRMxnnTFmP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHwn81bDUx75Gf7sl96+LDEHAtVUwh5vlb0V9CwKMqxYTWMKCXtr2f/dXILPxr3hB+BHruGjpO0XFwN7YIf6Ire53KN8eBQPXIdoaQ3WC/GKMPWlknXAfslhQfV+RdR/SUBv6trwEea3bO0o/f8vnwUQIgMobIoKKMMy/kgnwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVNVJ0Do; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843FB1F000E9;
	Wed, 15 Jul 2026 02:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784082563;
	bh=2AOsIv6yry7gh9KfxDUue3Xt8TLJGyAlByGbXbwaOjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iVNVJ0DoEO8zGS/wlfJQK1EGiHMjRwtntuJVj5/VjFokc7SRpo1gJTF804cD+UrU6
	 cynd3h1ehi4qNTGo+GQZID+ZuMVbAfl7/hD5amdKo4mATQrfZSqp0nyzdDPTKqJEZ6
	 Vvvxe6SGOek83V7bSSENTDLyoz50+C3o9vwq8yMEaFvu9Teuxly/tkMwEvLUSlwiQ5
	 znhSlg22VSWR21Wk50Bo7d2DAFYoVQITrkJOTWjp0zGplepPLKARk42nHGr0xM91Z7
	 EDBqVcebRl/HtXHUjslhXjVTFWM3qBv1loKpUdzzDtF+UNZhv8aW3KN6ZAaimTJeBO
	 6p6su81fYIpew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-rtc@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260715021933.1551663-1-rosenp@gmail.com>
References: <20260715021933.1551663-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 02:29:23 +0000
Message-Id: <20260715022923.843FB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6977-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E50675A0E5

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `platform_get_irq()` is not checked for errors=
, breaking deferred probing and unnecessarily disrupting hardware state.
- [High] The child watchdog platform device is never unregistered when the =
RTC driver is unbound, leading to a leaked device and potential Use-After-F=
ree.
--

--- Patch [1]: [PATCH] rtc: stmp3xxx: use devm_platform_ioremap_resource() =
---
commit eb7d944b8c0d01b4294ccf13b092d4f30d47bb4e
Author: Rosen Penev <rosenp@gmail.com>

    rtc: stmp3xxx: use devm_platform_ioremap_resource()
   =20
    Replace the open-coded platform_get_resource() plus devm_ioremap()
    sequence with a single devm_platform_ioremap_resource() call, which fol=
ds
    the resource lookup and mapping into one step and returns an ERR_PTR on
    failure, checked with IS_ERR() and propagated via PTR_ERR().

> diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
> index 7afcd14aeee56..05f128ccf8277 100644
> --- a/drivers/rtc/rtc-stmp3xxx.c
> +++ b/drivers/rtc/rtc-stmp3xxx.c
> @@ -245,28 +245,21 @@ static void stmp3xxx_rtc_remove(struct platform_dev=
ice *pdev)

[Severity: High]
This is a pre-existing issue, but I noticed that stmp3xxx_rtc_remove() does=
n't
unregister the dynamically added child platform device created by
stmp3xxx_wdt_register() during probe.

If the RTC driver is unbound, the child watchdog device remains registered.
A subsequent watchdog operation like stmp3xxx_wdt_set_timeout() will call
dev_get_drvdata(dev->parent), which returns NULL because the parent's drvda=
ta
is cleared during unbind. This leads to a NULL pointer dereference when
accessing rtc_data->io.

Could this be fixed by saving the child device pointer and unregistering it
in the remove function?

>  static int stmp3xxx_rtc_probe(struct platform_device *pdev)
>  {
>  	struct stmp3xxx_rtc_data *rtc_data;

[ ... ]

> -	rtc_data->io =3D devm_ioremap(&pdev->dev, r->start, resource_size(r));
> -	if (!rtc_data->io) {
> -		dev_err(&pdev->dev, "ioremap failed\n");
> -		return -EIO;
> -	}
> -
> +	rtc_data->io =3D io;
>  	rtc_data->irq_alarm =3D platform_get_irq(pdev, 0);

[Severity: High]
This isn't a bug introduced by this patch, but does this lack of error chec=
king
break deferred probing?

If platform_get_irq() returns -EPROBE_DEFER, it is assigned directly to
rtc_data->irq_alarm. Later, this negative error code is passed to
devm_request_irq() in stmp3xxx_rtc_probe():

    err =3D devm_request_irq(&pdev->dev, rtc_data->irq_alarm,
            stmp3xxx_rtc_interrupt, 0, "RTC alarm", &pdev->dev);

Since devm_request_irq() expects an unsigned int for the IRQ number, the
negative value is cast and fails with -EINVAL. The driver then returns
-EINVAL instead of -EPROBE_DEFER, which permanently prevents the RTC and
watchdog from probing on systems that require deferred probing for the
interrupt controller.

Should we add a check for negative error codes from platform_get_irq() here?

> =20
>  	rtc_stat =3D readl(rtc_data->io + STMP3XXX_RTC_STAT);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715021933.1551=
663-1-rosenp@gmail.com?part=3D1

