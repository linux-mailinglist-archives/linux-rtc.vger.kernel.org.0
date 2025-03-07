Return-Path: <linux-rtc+bounces-3423-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC9A5615D
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 08:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3753A98CA
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 07:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC9C19CC0E;
	Fri,  7 Mar 2025 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SJoW6eMM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA618DB3E
	for <linux-rtc@vger.kernel.org>; Fri,  7 Mar 2025 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741330942; cv=none; b=hEP3yiCYz6CV86xDh69j16owMWxIAR33O+5NsIrfQou/55ZLKEpBwvnIE+1ht1m6aYRNmeZCoq1auIVbTMK87/XcSVBLrQQAoRop0FXxt1K7qUKOuqbWeyiWU+S/f5kKvhKnKFynFgX/BljWtWrvBgkyPD0AiQY5lIKUwInI3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741330942; c=relaxed/simple;
	bh=xRCj/sJMN5WZJAl+z4ZrvU4e3EpPVc1+QTFzocJAOrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFEtENaJjYug2Nuwd6FjtZld6rk9jSTLkYb0aQBXgXvDJDbLQuEhr3iqnNNDo8dOGtU3YIXermK0fQoj3Ct8VSGlmh9txfE7FHErU+VLiQrsBv2e9c7J5ZnzoSo7jStWQjqyG+s7vHdHEaLp52a5Vk67oPP99L1G8eizy3Ah7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SJoW6eMM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UHzh
	xl7bjpiMbW+dOP1wLXTtREcA05lo4mZIMytBE5s=; b=SJoW6eMMi3m/AY0BtnFO
	I1HwPeMQm8AgirBPrjsN9u9K7oTJSSxIw9fxlxSWfuydmdzse0UEz9b5Ovfp2tOA
	NyUm95O/htSwjP7lVijdmdS5TeHe0KwTsaggFlFsGhYJRPxShdFw4wg0maA52wUf
	sjB9O3nxcQdSV39WE0uC5zSlcUfhxz/xMItV2Gh0a5k3g25V6xLt9jlnrQoVKn7y
	W7Z7ejNcSpj0r1p539XeZ4jHund70vOTcY40e3W796bmFDanLHzC3swzics7IiOc
	vkGOFEp+xTeQrs6ij3xCQltoNf9+ivdJG9qJ/TassBVkJlyvfoA1cqm8d1E3wpJc
	gQ==
Received: (qmail 3579772 invoked from network); 7 Mar 2025 07:55:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Mar 2025 07:55:35 +0100
X-UD-Smtp-Session: l3s3148p1@fmH1G7svax5tKPC9
Date: Fri, 7 Mar 2025 07:55:33 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <Z8qYM2-LQPgIe2JE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFcfYDV0h6V54Q9B"
Content-Disposition: inline
In-Reply-To: <2025030522061502555577@mail.local>


--BFcfYDV0h6V54Q9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

thank you for replying even though you are on holidays.

> What I'm really wondering about is the use case. What is expected here?
> I guess that would be so you could go back to sleep between each 1s
> interrupt? Does this actually happen and does it actually save any power
> versus waking up early and waiting for the timer to actually elapse?

There is no specific use case and it is not about saving power. My
customer wants this IP core fully supported. And it seemed strange that
UIE is not supported even though there is an 1s interrupt. The primary
intention was to support that. And my digging in the RTC subsystem made
me think this is all handled via the regular alarm timerqueue. So, I
added second granularity to the alarms so the timerqueue can be used for
UIE. Giving the alarms a higher resolution was a neat side effect. What
is wrong about that? Are wakeups from deep sleep states the only use
case for RTC alarms? Can it not be that some other tool just wants an
interrupt at some second? I assumed so, but actually, I dunno.

> > +		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has onl=
y minute accuracy\n");
>=20
> Is this message really necessary? I remember someone giving a talk about
> how we should avoid adding countless strings to the kernel ;)

Can be argued.

> I'm on holidays and didn't reply to your previous email. The way to
> support UIE while keeping the alarm at 1 minute resolution would be to
> look at which timer is enabled.
>=20
> The rv8803 driver does:
>=20
> 	if (alrm->enabled) {
> 		if (rv8803->rtc->uie_rtctimer.enabled)
> 			rv8803->ctrl |=3D RV8803_CTRL_UIE;
> 		if (rv8803->rtc->aie_timer.enabled)
> 			rv8803->ctrl |=3D RV8803_CTRL_AIE;

I totally believe you it works, but I am still not entirely sure why. I
have no problems following the code until rtc_timer_enqueue(). After
then, I see __rtc_set_alarm() being used again. Does it work because the
actual alarm time is set but basically discarded for UIE? And the next
interrupt is just used to be the right one, matching either UIE or
regular alarm depending what is next in the timerqueue? So, basically
the flags RTC_UF and RTC_AF are not really used anymore? I don't find
specific RTC_UF handling in the core?

All the best,

   Wolfram


--BFcfYDV0h6V54Q9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfKmGUACgkQFA3kzBSg
KbZ2JA/+Le9S21wNSsresB1jeJr8hSo/UbfXmyRifZFQycnDV11OfHFEVAX0vUVY
m8wljGAyk7UYZrmi5vhistv1WZNvSsaTZBx5tK7rJvivzxLGc/sLgstmzhegyXjl
G+azSkX4/Q1L4cJZZZpLc5oEY+6+42G8SfUpS8LlsdkRw0/0nM9NlBZWetfMP+g+
zLWzQts8kr5F/BLSlY+kmU3kWTjNNYEfCGDQOk8Lv9vtHww3yulQ2+omYWzsS1KC
UZ60tLxqK2ZvHh+L/ndCjmjLB6WwWKP0z8cCQ1zBXnCWuFJHUyAlnhFC27gO6cIo
lVc55K414GRISbzePmD2gQU6JL1TXmA26FXyWAz5Z9u82pIV993F2fpfX4ZAK4/4
eDLZHnpD/moGndfrah7F3MJGEkajI98Vno84Nlp9u0QMoLo9JTnunm7Tmp2uArqk
GV765l5zkcmdDXEG+SEtUOy4+SBxBz7mu0keic6SRcS48yUpabC76uZft2HPL9Dh
qc9FGSHyGviKh6byKWALY2tuc1y0r9RXg6QdZLdv3btcwC4K3GF9BqTeigLGVOuq
5q3G7qBlEwKMWeoJQNIbtRvbPuW4czmTTnLFZeIUwSdDwvfxBX4H8JZ6BJHYEqfX
Gat57FQVU3frJ3gpdzxYzMi0B1fJtF6h/tcXooEt+876QPtOpzY=
=PnW3
-----END PGP SIGNATURE-----

--BFcfYDV0h6V54Q9B--

