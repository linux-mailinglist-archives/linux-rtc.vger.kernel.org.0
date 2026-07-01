Return-Path: <linux-rtc+bounces-6837-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/F9GIorRWqz8AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6837-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 17:00:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B256EF109
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 17:00:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CXKXX1GP;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6837-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6837-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 856D1306EDE3
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0035356740;
	Wed,  1 Jul 2026 14:45:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3134CFA7;
	Wed,  1 Jul 2026 14:45:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917145; cv=none; b=tQ9bsjmLhMagDZsRhuwDoOC0/Hhw2rvdGnHiExSsAoCcEvGxC/WuL08cy1Dluch7n8ay0nhncHFMoEk9oGvETc/Xy/J/4NGPHYu1okP4/RNjORroc4YbkerNRNx2IJA7ah8ux9dkT6SoPLvDf+OxRBWfZ1FO+J6857KyuAybbb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917145; c=relaxed/simple;
	bh=i7sLoaFtWbfJ2KD2Hb2s9w482185yUyBTbaz2swyLOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V+c4/HKhriXCU7+Im/QA+5ZrStjt4Mzhrpn4nNTkqrB7t0vLc5z8sNYlzyyW9i8T430R+U6FTdh0aSCQAJNQ7XLDLnl/ja7LyvjqBKqN7Tu5aF1Vr5Rk0puW0PdGf6O7LBy7CNi85NPwuSy5NmUSkzHK/YwJWDIdENpN2LwC3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXKXX1GP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044351F000E9;
	Wed,  1 Jul 2026 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782917144;
	bh=RJAtqj6epWQJDyTT7jqbknHjrSFrt5SbHOekV9qbzqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXKXX1GPuhad4kv8hVr3+vZfOT1pyKVtCiQ8RHGsHT3KmGZWizJjtnAIekXpugbgO
	 0NJ65WzEum3/XfLmz6xhWzR5PLu0s18aTDm6jttzNXGyHXRt90mBdhLierzgmYKoM3
	 8wAfjjZfEH8QwKUtjGodPYjlToRrcbSft8UhegkWly1w4UU3eIf3WfbFkAXrfHcht4
	 tHbQI425XUOgRAwv0NGqQ/QJ3gMk56Byh1P4owo85/nsGxp2cpTohoPO51pQcAGp4T
	 dZ4Qfv7ME9XZgWfZbRl9Mui7cTeUPRJ1XU17bxr+5Bx6Xvj4AFATIOuP9pT+zjvF2N
	 UNw8N3nJ3e85g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] rtc: rzn1: Fix alarm range check truncation on
 32-bit systems
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260701142953.2014895-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260701142953.2014895-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:45:43 +0000
Message-Id: <20260701144544.044351F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6837-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:alexandre.belloni@bootlin.com,m:conor+dt@kernel.org,m:wsa+renesas@sang-engineering.com,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-rtc@vger.kernel.org,m:prabhakarcsengg@gmail.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B256EF109

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Alarm weekday calculation fails when crossing month boundaries, ca=
using the alarm to be scheduled on the wrong day.
--

commit 461f51253cf0a8326dc4e0cd7278977b7ecc0fbd
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Fix alarm range check truncation on 32-bit systems

This commit resolves the truncation of the alarm and farest timestamps on
32-bit systems. It achieves this by declaring these variables as time64_t
and replacing time_after() with a direct signed comparison.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 866ff595188d8..9969bcefede72 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c

[ ... ]

> @@ -260,8 +261,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, str=
uct rtc_wkalrm *alrm)
>  {
>  	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
>  	struct rtc_time *tm =3D &alrm->time, tm_now;
> -	unsigned long alarm, farest;
>  	unsigned int days_ahead, wday;
> +	time64_t alarm, farest;
>  	int ret;
> =20
>  	ret =3D rzn1_rtc_read_time(dev, &tm_now);
> @@ -271,7 +272,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, str=
uct rtc_wkalrm *alrm)
>  	/* We cannot set alarms more than one week ahead */
>  	farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
>  	alarm =3D rtc_tm_to_time64(tm);
> -	if (time_after(alarm, farest))
> +	if (alarm > farest)
>  		return -ERANGE;
> =20
>  	/* Convert alarm day into week day */

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing
issue in how the weekday is calculated just below this in
rzn1_rtc_set_alarm().

When an alarm is set for the following month (for instance, setting an
alarm for the 1st of next month while today is the 31st), this calculation
is used:

	days_ahead =3D tm->tm_mday - tm_now.tm_mday;
	wday =3D (tm_now.tm_wday + days_ahead) % 7;

Since this only subtracts the day-of-month, wouldn't crossing a month
boundary result in a negative value (e.g., 1 - 31 =3D -30), which then
underflows the unsigned int days_ahead?

This would then result in an incorrect weekday offset being added to the
current weekday, programming the wrong weekday into the RZN1_RTC_ALW
register.

Should this logic be updated to safely handle month boundaries?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701142953.2014=
895-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5

