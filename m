Return-Path: <linux-rtc+bounces-2571-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CE9D0BB7
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 10:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6200BB2475E
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8277A15667D;
	Mon, 18 Nov 2024 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ax4cwR+I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E025760
	for <linux-rtc@vger.kernel.org>; Mon, 18 Nov 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922249; cv=none; b=H18FP7PSceiXmYLaZ4+/wH350GGkTTmNVbzE5u8/voE0eb6Ijj+6vpDOhEE9FdiFZsclS+5FO06bCYuHvPcbvYdqLgNcTeWPLzm+lTP3KJDgzBHJW62jxOodNQ/dbgDoyjiXhZJ/yUe2JSpHUdvQPkNtwaZRpu0lafQ94s8pSkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922249; c=relaxed/simple;
	bh=2/SSQCIWp0jn+AzJ3aQpGVAwcg7O9xTedyS9eaS+CDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVHF3DoqVXtKkkT9REwoeB4NrPMtDRjLhmpAPWedl1mn0Yc6FG1cUJG+4nDihEF3Hyw4FN36Qq9eLGK2ZczHULMilggq4Ctn7tsrF0J9WdZl7WapFLAIro0VRkx5mmNOu5g8SkflEkK2C/4+jixDMBPF30M38x6CxnzaUaXOmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ax4cwR+I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2/SS
	QCIWp0jn+AzJ3aQpGVAwcg7O9xTedyS9eaS+CDs=; b=Ax4cwR+IYg51YKTFRFsi
	qYrQskNECKMf0IVvKlkpL6QMOJdqUDGs1c3y7INn600a4esxb47PsM2qiofKqU55
	ML5B3Q4zfgfbehcI6tIbJYvk7GngwVV8RxvK7DqbvJoDxo463tGIJBpXiRNerrRb
	7uUia0VJwvCX9fCqZPvoeHeckOc0k6vXTKzwR8PwcKSUaQM76KKOzCat7NjjMabN
	38jj/Iw3n7aZebnwSg1t7CCxu/W/mDeWD33pXSafty/oLhPPZcTnkL9UxifG4DT9
	HkvNxirQxJe7V13BHPbtXDq7KYrge4/i4a2OGjhNvZ+mckSDWokVH4HCt4RD/Yr7
	Dw==
Received: (qmail 151026 invoked from network); 18 Nov 2024 10:30:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 10:30:41 +0100
X-UD-Smtp-Session: l3s3148p1@nin3kSwnyqAujntT
Date: Mon, 18 Nov 2024 10:30:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
Message-ID: <ZzsJQO80dmhce_Mp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
References: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
 <87o72gnvbu.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YcEKBR0cMNJUghX+"
Content-Disposition: inline
In-Reply-To: <87o72gnvbu.fsf@bootlin.com>


--YcEKBR0cMNJUghX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 08:36:05PM +0100, Miquel Raynal wrote:
> Hello Wolfram,
>=20
> On 13/11/2024 at 12:30:32 +01, Wolfram Sang <wsa+renesas@sang-engineering=
=2Ecom> wrote:
>=20
> > tm_mon describes months from 0 to 11, but the register contains BCD from
> > 1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
> > Apply the offsets when converting these numbers.
> >
> > Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
>=20
> Should probably be Cc'd to stable?
>=20
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks, Alexandre do you want me to resend CCing stable?


--YcEKBR0cMNJUghX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc7CT0ACgkQFA3kzBSg
KbYb7BAAlcEIr7Uyhx+kb1B+3nrSDsw427owSqxy4mrsC7zMzNhQcks4ERdPMO4b
hsuwNJNPUdn4+a22nNcad1cds3ath+tJzIRkg5qyC6xn7dVQO+IQXm38Mwpsq7o/
W2qjA5EIvmvheD5PygN84U7TNvSfn/EZ2fdhSF5DAnif4yhqziQOngLQJ0RUinM+
RcsBy4LksqUVA+YqsiV7kx7hgufftV5j0z3ZhA5OXFUEx4PzGxYN7HMFl8ZinkIW
7CwwoYt9pyQ5MzRTbjQChLqU82M33DIOpL4hGeLNKkdBTpUEwZ6vIRdWCArSBGLj
q+JCDqAxUw719YIFqGdgse+W7MTYkqv6J8mGWi45gGPSTMX/Jrk344sTIXeFmc+Z
UEsgTqTSh/67z9XuBoibUtDsqkWiH9LaAKEoJntcmiaCg18ctM+jZHXlD6YPG1lc
LZ2BVdzPGys90pK+/kEX0iAHsdQtLRd0WgIPwppsKdAhy3R42GLy4sCDb3/T4DSS
/iiy+6ndcJ8PirCQudAkG5UNEZ0gikONEoI+fA4w65RusRFdSH6hx8N4NS+Aza7E
mb0RdPBbQvVX0JLoPWKFHBRgWBl5nHM41r6CRhDpFnmd/TNqamaLz68ZAhncXy50
uRsOKazpbOcOO+H4gRHSn3madNGQK6D4H0OAhNDCgEunNuNJ88M=
=/Nay
-----END PGP SIGNATURE-----

--YcEKBR0cMNJUghX+--

