Return-Path: <linux-rtc+bounces-6941-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5YQMD6vtS2p1dAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6941-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:19 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02A7143B0
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:02:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gJtTv4KD;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6941-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6941-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 189EA309A2CF
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670F3414A18;
	Mon,  6 Jul 2026 17:56:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EDE3F65EF;
	Mon,  6 Jul 2026 17:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360617; cv=none; b=NWfnTI7uD3Ztr2ite2irY+k1SOuafQl/BFEWMEYDpSesb2MGwPWblCW/DE6akf6xkIeWVK+0fAb6WXHV4226ujmhadhRmN4m82FV8qTs1vexlFj4Oe/+2WCwJ42gvepPD22L9BR8FMVKIajDl8Lr7INf0wL1FQxn3AhR1yT9N08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360617; c=relaxed/simple;
	bh=Wj1UnNP+3shlIoYmWxJc8i+61hFpfMJlcSDuUgMpYGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c4mOihS8UCSieNlUpiYrRBNqZ5STMnQYotejJyOnDr1w3g7vO5o+Ojo+pckn6s4uSAoPvZXiCk7XLGDiP0ksXRI4xNWCh6fHdSBZmdvKKR5QGMJA2HN0T72DF3YURtrW15u2/lNNnPymRuJ3q/UqoBckMeRCOdZlV9q0JRKsE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJtTv4KD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A31D1F000E9;
	Mon,  6 Jul 2026 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360615;
	bh=RShWaVdZQYREA8MuUaVgLWHi2qGDwLh/hCyMYbDcCJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJtTv4KDgw6FrlTobjmHijGegOfNQqJvOys4aqZKWsBtwe/5HlPjv5gKkru/GWyDM
	 ISrHocKBUysXtyiLm8WzXbEkjV/2+GvnQUkIc+GDVwVQmG8umtOqGZFjq008Ar1zl4
	 HTUA4/rBSwUBFjtFFFPXE+57M0sSanjdwEJZAwEp089q/ga/jwlQ47EyYynqTgo1re
	 TMdsP8Cm1SZzqZ/CI/mLHJ1g4NZl0s0PgzIQlrs/G+b6GiVRcloe3AWsA3uObTpKYz
	 6F3oRi7lFGu1YvP5An18vmLSHqejQaPC9cAUNDcYSM5q2Qs44E3GNIJjB0yfvoXKbx
	 gOzalWOW3T3bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/12] rtc: rzn1: Use temporary variable for struct
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260706175138.12587-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:56:54 +0000
Message-Id: <20260706175655.6A31D1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6941-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:devicetree@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:robh@kernel.org,m:alexandre.belloni@bootlin.com,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:prabhakarcsengg@gmail.com,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,renesas.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF02A7143B0

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Asynchronous pm_runtime_put() is used immediately before pm_runtim=
e_disable() during devres cleanup, creating a race condition that leaves th=
e device active.
--

commit 5ee7d58e34962ad10d6a886e40f4b4757bc5611e
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Use temporary variable for struct device

This commit introduces a temporary variable to store the device pointer in
the probe function. This replaces multiple occurrences to avoid repeated
dereferencing.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 12bbbc18f7eab..4917bd223efd7 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c

[ ... ]

> @@ -421,19 +422,19 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
>  	rtc->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
>  	rtc->rtcdev->alarm_offset_max =3D 7 * 86400;
> =20
> -	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(dev);
>  	if (ret < 0)
>  		return ret;
> -	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D devm_add_action_or_reset(&pdev->dev, rzn1_rtc_disable_hardware,=
 &pdev->dev);
> +	ret =3D devm_add_action_or_reset(dev, rzn1_rtc_disable_hardware, dev);

[Severity: High]
This is a pre-existing issue, but does the async suspend queued by
rzn1_rtc_disable_hardware() race with the subsequent runtime PM disable?

During devres cleanup (such as probe failure or driver removal), the cleanup
actions execute in reverse order (LIFO). First, the custom hardware disable
action runs:

static void rzn1_rtc_disable_hardware(void *data)
{
        ...
        pm_runtime_put(dev);
}

Because this is an asynchronous put, the suspend work is only queued.

Immediately after, devres unwinds devm_pm_runtime_enable() which calls
pm_runtime_disable(). This cleanup triggers __pm_runtime_barrier(), canceli=
ng
any pending async idle or suspend work and leaving the hardware powered on.

Should rzn1_rtc_disable_hardware() use pm_runtime_put_sync() instead to
ensure the suspend completes before runtime PM is disabled?

>  	if (ret)
>  		return ret;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706175138.1258=
7-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D9

