Return-Path: <linux-rtc+bounces-3259-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8431A43B3D
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 11:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930553AC4A8
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 10:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9349A266B6B;
	Tue, 25 Feb 2025 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NFfdGqte"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE4266B51
	for <linux-rtc@vger.kernel.org>; Tue, 25 Feb 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478754; cv=none; b=NdMv+1b3FO+GEJxlQuuO1PoUb7ze6upHd4XCNsNXFPjk7OlZSRQneCt2oZQExxN4Yfg1u/ub3aDdYInwCtV+ri7OGSwLKO7WK6hTUA4ibZhh4OpiQOPGH6pNoo9jkCPEx+Ggw0zTjMO2s2gd9Phg6mjr7exuWIO9yjKWAgRgCeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478754; c=relaxed/simple;
	bh=UsVMLDo+m64zyK+lmUJineIYg7VYad5kNvrRXF+EdbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihhrLSUqKidmzlBhueqaN8A14DD6BHUsJCQBTnKTJXXpJXOqnLi8AdVGasul09iz6YkR7KRPE6IJNNYYZT4fX31cWqkB6Gf0dqsZpWsP4EBm/axLWh1M3M7Pqm2aZ2eV+G9sIQKM9RvCeaYP5QL5FKXMegxSVC0iehWKUeLcdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NFfdGqte; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:mime-version:content-type; s=k1; bh=5Xoxc08WwmhdH/WoNPYD56lohXL
	6Tv3QWLszz+sCvIA=; b=NFfdGqteebMc0/384a8c5wEkhl/5d7HeAv6mCvxAmaS
	4SAztN+SPyakIMCAELJmRFL87g1HZF9uKJOkLiKcbP2TjNz0E/4EP2ov3I2jr4eE
	3o8mwLfn4pvQVERlv4cPRX0im4XsxNTdAnx5vFe5cWyl5jEGYS2KwfJMt76OYmo0
	KW+e8jn6Ly9EHJrAuCZC2hnBIEKyrr6YAKcit7qH4OD+EDqzpR0xWWJxwGVeX+F8
	z0y+iUxefRgwXJvvszNXbfnw1A09vZ1Y+nsVrsWzuHggrZYxVafoTdh4eF5L7QUU
	L1ybdcOMosFC9+TnBfaMnpWpRF+UlNkS+bcnrfmP/bg==
Received: (qmail 176125 invoked from network); 25 Feb 2025 11:19:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Feb 2025 11:19:02 +0100
X-UD-Smtp-Session: l3s3148p1@TiIlyfQuLtsujnvP
Date: Tue, 25 Feb 2025 11:19:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Q: use 1s irqs to overcome alarm minute granularity?
Message-ID: <Z72ZFf-3Z78O44nm@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pksJuOurlPU6X6JM"
Content-Disposition: inline


--pksJuOurlPU6X6JM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

so alarms of the Renesas RZ-N1 RTC can only have one-minute-granularity.
However, it does have a one-second-interrupt. Has it been tried already
for some driver to use such an interrupt to emulate second-granularity
of the alarm? My searches did not yield results so far.

So the idea is, of course, to the let the alarm fire on the minutes.
Then, enable the second-update irqs until reading the seconds matches
the requested seconds of the alarm.

It would not only gain us a better resolution for alarms, but also
allows for enabling UIE.

I get it that handling the different interrupts may get tricky if e.g.
there is a change in the timerqueue while something has already been
setup or so. I need to research this, I have currently no idea how this
is handled at all.

But while doing so, I wanted to ask if there are already opinions if
this approach is feasible or not. I can't imagine that I am the first
one to try it, so there probably are experiences out there?

Thanks and happy hacking,

   Wolfram


--pksJuOurlPU6X6JM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme9mREACgkQFA3kzBSg
KbZbmw/+IfpKP08eBbj/mD8xWmINuCz7zPOFa/JflZfmCL08MhDCnKRrKlN3FCDJ
rEOQ4gagV/T7OXcXarWZRxxBR95lk/OQopnzp7nwpcUpkOFmjIAuYqSlobF34JHD
x6GzAQrU/vFCPxJ9iexTHhr90W7tJ/33zhVtsU1YGffNV1KhahhQO8dFQwelypcC
/mSzxsIbooJQhSlNZuepv4N4XalH+8G+550GjjfQMMazuxwH58joDolZnQf3cH4b
aBa8K5eB8dNBlaR9SKNbhXvqU8kkD82yNiDAxtF79+974J5D3rNpQFNwAZ5pJ8cH
b5kFWBXgIi48OeKjA1eLVb7wTiTtv8XHOjLrQD4CdcHIIHpw6d/MDaPeqSlx8BGC
mbcSGtjMlTTjBDl6TEAokYQc5LfxWj9vBZ3liN/D2j3VmnWuntoKlz2ToVmO5jX6
/h4M3ZGfeyILnZo+C+yEOuuNnzH9LVvk+NaB8tBqTAWw6AvPbEZ+CEyyUB/h9mhk
fcQLc4KBbs7ete2usGi4GITOeD/b/S/AYxdhU5gQBZAiGIVaLF2VQN81CNVzGgyc
YHE0qSWOcX2+OtpkvzL2uU0XxPzIMOtZhUf6Fq0+bbaBzqLNUwT3B/Q4vr1+Yk0l
/PtD5tqPb3+vkuwQ3ixbsW9X8NMQPRU7jLRXwgOO0maFb5JF0SM=
=fn2v
-----END PGP SIGNATURE-----

--pksJuOurlPU6X6JM--

