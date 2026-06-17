Return-Path: <linux-rtc+bounces-6696-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K0ZiFc6EMmqY1QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6696-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:28:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82C699125
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:28:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=AsbJadg0;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6696-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6696-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3635830FB141
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F43E3BFAD9;
	Wed, 17 Jun 2026 10:57:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0A3A542F
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 10:57:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693844; cv=none; b=a+xJrasG+VHXZvXFLsV1ZwVb6bqyyiBKtcJFjDbJluxrbOA2AKNDnOtm3qjVWdcM5q4I1ppV8p/XmNL9jte0soBvy74uv/VRpW4k4D29XCE7G+Mmo4LkWTpdurOtGTNjHC4ynw3/IMmgLTvv8yH2zTKaInIWNVYIo3QMOdzvUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693844; c=relaxed/simple;
	bh=SrQGcHxnwDDOUojhSoINofXui/YLV1mpplcSEF39A0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baglCN47VPlgsMluhVpPgqk5C4ImZvqVJ8AfyjMCC1kul1+juxY1+Hd2lY0o1DA8vR5wMW5MWmpr/3fmhSAjlX/b/88UYQ1pXvW7zdEK+rUePPH5meoBd9qVlYwvnweIO1qZQpMpPkjlORdJ5WZIU6mqHVIvJuMorDp08+D3XWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AsbJadg0; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=A66O
	hVaau/oXf3aL5Xb1Lz2SOCD/p8h3g8zjy0LluY8=; b=AsbJadg0MweNsUnDlFBs
	v6BmoruVZiHT59vZN57fGFuzl8jQ8WkKNR9wePVl2wZqiv1NkAIw39/nmVPSqumz
	/R/T0rCpslHco/9KHIskaX6EwHOmERiB7SxzXqI0KTml4Jwyd86xyZs48aGjKPnm
	Ohz8XYTbM3Dy6Aj+/DlNIGLldkfIK8jgqL/U3/icZcURZ07Az5EDN7BZfUl4aqBE
	9yQ7OdwZF570vXU99BdaFacVK7+Muve4XuVXc50zuGKO/9u6HabeKgbT7RaZJnbv
	lREgFDOtYYhZ820iLJf49gXmua0vwDGXYB5v7+PaQ4kA9c/FHVv/ABUjOTmbwPza
	AA==
Received: (qmail 132204 invoked from network); 17 Jun 2026 12:57:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 12:57:20 +0200
X-UD-Smtp-Session: l3s3148p1@Mk1w7HBUhKAujnvI
Date: Wed, 17 Jun 2026 12:57:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
Message-ID: <ajJ9kNJtrY6DyQ-S@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N7WhwjKZosg3kYrf"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6696-lists,linux-rtc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,shikoro:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E82C699125


--N7WhwjKZosg3kYrf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sashiko found issues, not introduced by your patch, but still.. I
curated the list and left only those which I think are valid. Do you
have time to look at these issues?

Thank you and happy hacking,

   Wolfram

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Incorrect hardware alarm weekday assignment due to unsigned unde=
rflow when the alarm crosses a month boundary.
> - [High] Unconfigured alarms in `rzn1_rtc_read_alarm` can return an inval=
id `tm_wday` value of `-1`, risking out-of-bounds array access in userspace.
> - [High] Potential spurious interrupt when sequentially updating active h=
ardware alarm registers.
> --
>=20
> commit d278abd6309a65fff235820bea9a8e8631da47be
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: rtc: rzn1: fix alarm range check truncation on 32-bit systems
>=20
> This commit fixes a silent truncation issue on 32-bit systems by changing
> the alarm and farest variables from unsigned long to time64_t. It also
> replaces the time_after() macro with a direct signed comparison.
>=20
> > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > index fe21fa6242881..06339adae71f6 100644
> > --- a/drivers/rtc/rtc-rzn1.c
> > +++ b/drivers/rtc/rtc-rzn1.c
> [ ... ]
> > @@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, s=
truct rtc_wkalrm *alrm)
> >  {
> >  	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> >  	struct rtc_time *tm =3D &alrm->time, tm_now;
> > -	unsigned long alarm, farest;
> >  	unsigned int days_ahead, wday;
> > +	time64_t alarm, farest;
> >  	int ret;
> > =20
> >  	ret =3D rzn1_rtc_read_time(dev, &tm_now);
> > @@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, s=
truct rtc_wkalrm *alrm)
> >  	/* We cannot set alarms more than one week ahead */
> >  	farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
> >  	alarm =3D rtc_tm_to_time64(tm);
> > -	if (time_after(alarm, farest))
> > +	if (alarm > farest)
> >  		return -ERANGE;
> > =20
> >  	/* Convert alarm day into week day */
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does the calculation for
> days_ahead underflow if the alarm crosses a month boundary?
>=20
> In rzn1_rtc_set_alarm(), days_ahead is typed as an unsigned int and is
> calculated like this:
>=20
>     days_ahead =3D tm->tm_mday - tm_now.tm_mday;
>     wday =3D (tm_now.tm_wday + days_ahead) % 7;
>=20
> If the alarm is set for the 1st of the next month, and today is the 31st,
> the subtraction results in -30. When assigned to an unsigned int, this
> underflows. Because 2^32 % 7 evaluates to 4, the resulting wday calculati=
on
> shifts the weekday by exactly 4 days, causing the hardware alarm register
> to be programmed for the wrong day.
>=20
> [Severity: High]
> This is a pre-existing issue, but is there a risk of a spurious interrupt
> when updating the active hardware alarm registers?
>=20
> Just below this hunk in rzn1_rtc_set_alarm(), the match registers are
> updated sequentially:
>=20
>     writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
>     writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
>     writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
>=20
> The RTC core can invoke this function without first disabling the hardware
> alarm if replacing an existing timer. If the hardware alarm interrupt is
> active, modifying these registers sequentially could cause the intermedia=
te
> hardware state to momentarily match the current time, triggering a spurio=
us
> interrupt and prematurely expiring the next timer in the queue.
>=20
> [Severity: High]
> This is a pre-existing issue, but what happens in rzn1_rtc_read_alarm() if
> the hardware alarm is unconfigured?
>=20
> If the hardware alarm register reads 0, fls(0) - 1 evaluates to -1:
>=20
> drivers/rtc/rtc-rzn1.c:rzn1_rtc_read_alarm() {
>     ...
>     wday =3D readl(rtc->base + RZN1_RTC_ALW);
>     ...
>     delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
>     tm->tm_wday =3D fls(wday) - 1;
>     ...
> }
>=20
> If the current weekday is Saturday (6), delta_days evaluates to 0:
> ((-1 - 6 + 7) % 7) =3D=3D 0.
>=20
> Because delta_days is 0, the rtc_time64_to_tm() block is skipped, and the
> function returns with tm->tm_wday =3D -1. Since rtc_valid_tm() does not
> bound-check tm_wday, this -1 is passed to userspace where tools commonly
> use it as an array index, which could cause an out-of-bounds memory read.
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.16=
19693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D7

--N7WhwjKZosg3kYrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyfY8ACgkQFA3kzBSg
KbbmyQ/7BR0AcHluzi9aoZnjrUV/bWHbeb15red6ogbzxLDRp8grO68lev6cvviF
uc9zRDtY8cXU9KWTFni64v2uh0O0cE7df1/PCbtaB8HPsdv0HbMWs3ypHJPT4arD
W4aIQfN+C9PIrxNqBrqqJLPADDZHRqBeSYDf0BjEXAirMe1e0uHCPIPBlB515Mb3
onTn6q34U9LmUEMFPW/AYJjVJExwoRC1LCEcmm5jeTvfembNFPQIOYSoygHA5WCa
VzP9TGaPpRJjgckrG8h+uf41NEMtOUtDNX/6iK4VCLK8cuL0xMmu+Rpls1M39V0c
rVQ9Vrl3uCf52oz86xyArWEgAbhNm1LJMF5w6QoCwtYfaZIw8PPhwDz2PSTVqMbs
Z6di3+jo0ZMbsrNSfkNSXeIbaMBaEcz+wUn+Bmv4glXj6Kr2eh2XnYrDZlOx8JnJ
Y9c9/XOQSBw+ad3BAGFDualir78Cm6tVyLyD2OD7In7ph9QUK+4QJXy5iCv+yzek
5cmtT0ncGd0/NimRk425UGhkwwCNO21jsaLvM/KNK+dZdt7mv44Y0ApZgRXUFB+3
1hitid++B8YxjvrX2+8twa8HMYKNwCovify/YVq4sMdeKToDP+uom+2Oibz7kkzs
ZR6dsUiQEoEfuaegXWJWJzjrm49QZxUjjtsq00hwn58gcj7V1NM=
=Gax5
-----END PGP SIGNATURE-----

--N7WhwjKZosg3kYrf--

