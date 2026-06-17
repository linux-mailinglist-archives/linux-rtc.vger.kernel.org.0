Return-Path: <linux-rtc+bounces-6697-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 063KJxl/MmqA0wUAu9opvQ
	(envelope-from <linux-rtc+bounces-6697-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:03:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0EF698C73
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 13:03:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=VHJLQGJb;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6697-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6697-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3343B3030374
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 10:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE8F3AFD01;
	Wed, 17 Jun 2026 10:58:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA134378830
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 10:58:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693932; cv=none; b=YpRJuKUsBfJDzI2c8Y6t1KYdqMvTxEVsIurVUtcjC9i9hLMdrEvWzV1RtfdZWqqB9o6IYs+/Ll+wtn6THVjZtPQmHMhULyJxqzMadFLpuMSBQ6CJgo+I8obMDHmy8jwe7k5W0hvtjrjOduaybeTDYRe49Xcm9lxxcoyjsTNOeqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693932; c=relaxed/simple;
	bh=cLjo9s5X8S7uXGdMEwPgj8pN7cxLDACJURIhOC46EHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nh0xsy64CJATPR847Odvj3pjHweijqi7pCOtog6UW17RumtF0k5qEqIVIekcQ5R++cW4TN0YKKN59GNJAnA+I/PNMloFUtW/PExZWXaHsThmrX5WEnw/ovHMVPwf4kAOdFxbch20vRKgDs8+CGPju9Jcemuy6auOxGAeqsd/LKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VHJLQGJb; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3WSg
	4noCdqmqODRlIZWDlHRZMDx26KJ/5lYpnLFLNic=; b=VHJLQGJbVrgl6GHo3/oo
	+NJONtDg8iCUkuTOpsJyJY7HW4L2WynxgAUx/NxZlSoD/crRa5iuNt7TFHdx2/pJ
	MdTqB8Gf7SVRsJNBBWRzAZCo3rRUrbAIY4p2z03/TwrSAEmx4taKfiiGwvjL0XLi
	OmNWfG/FGsni1recELHLBa+fXz4xIQ4iWECTQuyHdsHZJjhRKZiFC1z8P3nUNKg6
	9syL0tVlboKHx/1auFjfStwM26vztwh3ua+Tnsrq2UrolcbDky+Wzfhx2kZpt4p2
	EHsbMTDDCYii0RzujCd2sxOhSyFZCo5PPAG6CZ6cjvRxDnprrAyKOmvCUn251A/y
	cw==
Received: (qmail 132594 invoked from network); 17 Jun 2026 12:58:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 12:58:44 +0200
X-UD-Smtp-Session: l3s3148p1@2Hx08XBUiu0ujnvI
Date: Wed, 17 Jun 2026 12:58:44 +0200
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
Subject: Re: [PATCH 08/12] rtc: rzn1: Dynamically calculate synchronization
 delay based on clock rate
Message-ID: <ajJ95P-jxChrTY9w@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I+lGIvlppK+LgZCG"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-6697-lists,linux-rtc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF0EF698C73


--I+lGIvlppK+LgZCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


As mentioned in another thread:

>  drivers/rtc/rtc-rzn1.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 06339adae71f..bc6af59744e4 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -71,6 +71,7 @@ struct rzn1_rtc {
>  	 */
>  	spinlock_t ctl1_access_lock;
>  	struct rtc_time tm_alarm;
> +	unsigned long sync_time;
>  	int alarm_irq;
>  	int sec_irq;
>  	bool alarm_enabled;

rate =3D 32768 here...

> +		rtc->sync_time =3D DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);
> +
>  	}

=2E.. and move this to the main body of the function.


Then, we should have all values always initialized.


--I+lGIvlppK+LgZCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyfeQACgkQFA3kzBSg
KbZ8MRAAiUIskbQZ7nfnyM94FicQ9r5vhi2Q9D1qWdONXbmfXkYE2BgHMmPSo4KO
D6GKdNiWpXtFWU5uuBt6xv5nkmLAVaTPfG7Rq3shO1aSOx6fiZK25CXyGGxhgb5Y
FN8IzOGQ8NjdVecXMKY4Pbp6BwKhOD1vSyE3sHEPiWAt/Db9Jxq7ZDsgupTC6662
QBrv8lMyhqWXekUs8LTOt+2OxEpT8/WrOskbDmY4osN+LPcJKNj0x1a9jPv32bvS
FXFZIme88bn5MCj2RmcXWxK7NT6QaBfhgXTjVKq+maY6jO1RF5FWBGeK+7cWTEUg
yBPBz4+2AtfGgnODEeXPYST4g2NURcwarpgl3LQlmG7b4Edh28dv+/mty1xZXsjp
XU5VzUtxhe6RPjsgyHvdOoG3LgW35WNf/QAFvq+7RcjbhsGEYaFLVx5c6bsYDzMm
wNLCtUpXHZ6tsdlVkpiE64nIti2q5lweOcOLEsBgQIPy3r+WCizUYOITS/W+uQNF
EcNSaKOClBCD3YKxzhrkLhboEZxapJvz56aXdRJ1Grr6baHVRqRAagRossVhOCd7
rjyaijo4oepkviwwRFxzxzajatoWfkSdeJ91d5UJX3g1n/BHl4+bgvr5N2otI0Xi
AY1qM62uPRt70vTyVhRp2SijU+6qUhiklB/Tz2wQus1/wlhHDgI=
=P6B/
-----END PGP SIGNATURE-----

--I+lGIvlppK+LgZCG--

