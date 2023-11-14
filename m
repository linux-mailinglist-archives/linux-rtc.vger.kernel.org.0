Return-Path: <linux-rtc+bounces-301-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C577A7EAC7D
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 10:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784DC1F2256E
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Nov 2023 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601BC14F7F;
	Tue, 14 Nov 2023 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="c9ZOPsWK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528B15DA
	for <linux-rtc@vger.kernel.org>; Tue, 14 Nov 2023 09:06:41 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908A7FA;
	Tue, 14 Nov 2023 01:06:38 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B2CB41C0050; Tue, 14 Nov 2023 10:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699952796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XH1nNm8LsiTPOr9BH1J3Bya0FX6aY6ioAnkuYCu5cYo=;
	b=c9ZOPsWKeaekqtoseBVTpiwIiQQ7fkD9pKy4hY1yA/8HzCxaxuDA7AzWUF8ohHrHVgkXGY
	2qOXXkszJG2HOROfc2ecPFqIKlenTrP0oejXMsG+oCaKVl+fD/4nKQGLaUj3lJz/S82PTN
	bAjKJrIyp8cILOUrHnDIEwbPJGh50JQ=
Date: Tue, 14 Nov 2023 10:06:36 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, alvin.zhuge@gmail.com,
	renzhamin@gmail.com, kelvie@kelvie.ca,
	Raul Rangel <rrangel@google.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
Message-ID: <ZVM4nFaDTwrKMr8K@duo.ucw.cz>
References: <20231106162310.85711-1-mario.limonciello@amd.com>
 <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
 <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com>
 <20231113223819fb469198@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U4Vrkl1KF0W4hmrr"
Content-Disposition: inline
In-Reply-To: <20231113223819fb469198@mail.local>


--U4Vrkl1KF0W4hmrr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2023-11-13 23:38:19, Alexandre Belloni wrote:
> On 13/11/2023 15:36:28-0600, Mario Limonciello wrote:
> > Now that the merge window is over, can this be picked up?
> >=20
>=20
> I'd be happy to invoice AMD so they get a quick response time.

That is a really bad joke.
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--U4Vrkl1KF0W4hmrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZVM4nAAKCRAw5/Bqldv6
8viOAJ0R6umVNflD+5mocMd90SFnUq6jcgCeOl/w6uEJ66JALPpzM9ts0iEHVuw=
=MFhy
-----END PGP SIGNATURE-----

--U4Vrkl1KF0W4hmrr--

