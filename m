Return-Path: <linux-rtc+bounces-3263-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF64A43C55
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 11:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661F63BC5D6
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9F9266F1B;
	Tue, 25 Feb 2025 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q6iPJKRS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110C1FE47F
	for <linux-rtc@vger.kernel.org>; Tue, 25 Feb 2025 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480893; cv=none; b=QJ0/b+77z4kGNzQRs6ZqeIH9Vusb7XjUHaa0MjznxURrekKWFiaHvpGaUTZP+eag4pQfxJlxWzARQADP711KUzWFmQU5cHM8+RwcY3HEoBV2Dk5hSXRR90pnwXKJEugb3xhbmUEfgwz7/CORMJGsgw9Hzppl2Oi8/e2t4UqY2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480893; c=relaxed/simple;
	bh=45NnfZyD6oCrUoj122LYtZySjOPsdLiAPQrVbO7Gyhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEKG3zW4tbujgl/ilmf/RwQ+M3BvZu33y3HjoeqbiGn9bk5UuNw7LxyBWRyH5StIps4/Sp/RBVQh7N7oEr1ot9FJovR2VDZRMmvQrgiJyOs6oMve6MzgZvOW4qWbR1bcJeB6q7tCFJj3L+kDPy71Lc/L0ceipZJxFLzg3H7PhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q6iPJKRS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=45Nn
	fZyD6oCrUoj122LYtZySjOPsdLiAPQrVbO7Gyhk=; b=Q6iPJKRSmunpnd5StQm+
	Pmf4j1+2YM+EAFAD6ro4w0sFMZ4Orj5Cvl/0fSIhFmQCAI5Qw4zvwTUisFmynVzD
	jZbtH7KwCs8HL2FQoDcEABGTOcLTFr9n8hZyV6M8CoKq4tyWDti0J9DwbZ+L5c2b
	TntndAJpwPYmo1A8rR9LMefmHmP5pugUurp1KytN+jNfWpKuF/f8SRCqtC/zF6QR
	8F0x25yOTZLdA4iTzS/BhNHvB8JMpfTX+TnZ9+qNZ4g5sMA2otUmQPiXN901sQKv
	mpAdrewJkJOfCtA1T5AkRW/qQWGK0xVNdrBSCJ9u5zhKpbSAfdYtIvnZygOcGKzY
	Mw==
Received: (qmail 187332 invoked from network); 25 Feb 2025 11:54:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Feb 2025 11:54:49 +0100
X-UD-Smtp-Session: l3s3148p1@KtsnSfUu6pQujnvP
Date: Tue, 25 Feb 2025 11:54:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Q: use 1s irqs to overcome alarm minute granularity?
Message-ID: <Z72heU393-y555VT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
References: <Z72ZFf-3Z78O44nm@ninjato>
 <2025022510474487653067@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n9ulxRlfeKutuODQ"
Content-Disposition: inline
In-Reply-To: <2025022510474487653067@mail.local>


--n9ulxRlfeKutuODQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > It would not only gain us a better resolution for alarms, but also
> > allows for enabling UIE.
>=20
> This is already something you can do. I admit this has become super
> convoluted since Jon switched UIEs to be handled using the alarm
> interrupt...

How can I enable UIE with alarms which do not support
one-second-resolution? I found that most, if not all, drivers which have
RTC_FEATURE_ALARM_RES_MINUTE or RTC_FEATURE_ALARM_RES_2S set, they all
disable RTC_FEATURE_UPDATE_INTERRUPT. Which makes sense to me when I
look at the UIE-via-alarms code in the RTC core. But, yes, it is
convoluted, so maybe I am missing something?

Thanks for your fast reply!


--n9ulxRlfeKutuODQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme9oXUACgkQFA3kzBSg
KbYcIg/9FWlPQ6i+Ku1l/EsLOpp1tjJ/1jhqMeS6LfIz9o/SGl7HpW/WEaz36M8s
QpKFGKJ7LWxoM9Ir+b5TE6z4Lk/MmgXTVVN7YO1UGwKxhbtp1AlChstG8mTAe5vb
WH/8y8aA6uf4JlXvmRoWXCz3yGGSZMPRi2tPsLuB7RUO1PM+s1ntm9qsWez1REOi
cJDY5sNf/f74K5Iqtx949cpZdLP6RT3P+zFiWtgPg6IWhAd4et/ksxszbPD8gaeJ
tuBEapG8wb0sUljLlYTpC9TATEGZIiG335txZmo1R0IosbPbAx0HvQOr1qnXnNDC
VwxyXqFZf033MwXmDDE+ltww4jl6DYYkjCm5w6NzUBpbUr5HoxvOlZXzO2RHilmT
O3qsGmWWlWPVnAxhySzXNan9OeXyI8FYxQg2QgHgcVAkzpJcMJgZwsndq912hlvo
8k5Q38aPRyLLQ69SC3D6r0QrkVNkUSZLGQrN5h6vALvK/e9f0JABH3zv2C3K3EbQ
r/bSG429+QPSYR10f2amzgBWRiNh1K+v9bHzotbucMGWDdxIfiC4MWLhp6h2KFfT
ZxpOf6mbK7bZuKdMZgqv8ca3CXxJ+AT2v5ncAZwMi8XgJl2ISGNQEhk1DGglIMaJ
4ykA5ac05N2SZhaqPFpwPWc6PW9TiV8DKIEHzz4cxdK8YUifQdk=
=V6WJ
-----END PGP SIGNATURE-----

--n9ulxRlfeKutuODQ--

