Return-Path: <linux-rtc+bounces-3473-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48092A5D9EE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366FD1887D1F
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 09:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD3E23C387;
	Wed, 12 Mar 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IFYzrHnB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027923C8B5
	for <linux-rtc@vger.kernel.org>; Wed, 12 Mar 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773223; cv=none; b=Ax+FqCA16lbKROfwa5W6Cbr+naQDF+CXdPl9W2mBB5KxHNa5GSOQCDn19rMHnL/NKhhsTC9WXpeqIkrrLDNaWseizdbeRizDAjSiqFL07Bm/IcDhhZyIUgQspJQRFaRMyjEytZz5wD0ek+0BLXbTp5LqWjLRNmXZ2xhbNIKAkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773223; c=relaxed/simple;
	bh=WXy2KRZCyDwgEKZSCXZfwQVedMGzpR6Ewjja+R1oj2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUcC61GKRKo5YZkigCCE0VuGQWRFIIdVYQvzTdYozv8WVO48Bhkr4LQ6IL8ciy5DbceOg4akbgGE46H0RaBJVugA0RUilla6LXMzE7ISoqwW6Y4fxDx6Sm+9RSaXoAFJykGIDYXdRm1JEfk7pyJXimHA/s/5Tg9kP+NWxNT95Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IFYzrHnB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mBuf
	/GB9tlOiPdvBX0DohdD0AsbQ31adZJ3po7WyTzg=; b=IFYzrHnBu+yGW0vWdmr/
	zl7xvJsLqZ8FM/5UJXSDScfcml1obIp0TMVM4cQRIyXuvhq5M0A416T1jR6xCygu
	D+oOpfK4FgvNN/swL0M/LPJGerb/LVxypK9+FfYyqidYcuM0UlPKHABRAXoY/6cl
	49xQ13a57rJdvtuw7N4/CUf8jzwI41yXYLU8S3j+YeBBve2AkTc8CJYlESfbclJ7
	+ZxEzkhue62zNKr7QWCCrkJm0KXLu02rAiVn4vL2C9RVD5X8aci2/y8ONI33VzuU
	wscOLBKjxcehJY3hGwGxXJYb2JUy8kPzfETA7A9EuBaHpYV2ZVS28qo36w3E9zRM
	gw==
Received: (qmail 1181837 invoked from network); 12 Mar 2025 10:53:36 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Mar 2025 10:53:36 +0100
X-UD-Smtp-Session: l3s3148p1@rKfZLSIwrI0gAwDPXwyXABj42nrU+gpI
Date: Wed, 12 Mar 2025 10:53:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: clear interrupts on remove
Message-ID: <Z9FZoOuTGnlTr-mX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250312075226.22022-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5xpyOTby/Vyet3u"
Content-Disposition: inline
In-Reply-To: <20250312075226.22022-2-wsa+renesas@sang-engineering.com>


--p5xpyOTby/Vyet3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* Disable all interrupts */
> +	writel(0, rtc->base + RZN1_RTC_CTL1);

Embarassing. It doesn't even compile. I checked the wrong branch :(
Really sorry for the noise!


--p5xpyOTby/Vyet3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfRWZwACgkQFA3kzBSg
KbZtAQ/+OEDksJSDfNTDot9pDzHFUUP73a2t9kgxr9oE/FPQhSdxA5Pnj3JJNQTk
E67uwLkpxh9HqTDeww8xRQuVhWEcoIE4w7OoI7zQkKCNlJDJLI1zed28R9e7ELX8
smhs59gQfEoPxRZphNyyUDu1cVNvCtjRPRsrTXFo69qXt8cONcatrUMyT2NR/uqn
qBlX+e53ohij7OaarZhJRo/KQlk2BRL+/tNHxKOXBQsysqPwu8BK+pAQxO7ax2aQ
7t71yXqv5uL6AcAiIhP41CKGtN3WaJDdqewPI+3cKiVXZuCtFZX8A18Na1gzMgto
JjdrVO2Mj/espL+g8tIOADKnMh9OUp3E1MuH35wTddxnQj1p62EnugfX1vUA4exP
Afk1xNJb9meNhFVyaiRmIMbx/U0AhQe3FjH4iOdNtz2wjp1mVuwlSvZhNc9GlH0K
XiCcB43576/j+06X7oeBmnSUOwpWQITfXKkYrtBeSdA0Kpb5peZ3Dc6teQRA3e9u
STsdDskZD6AuicwnFIcLUTmZF+ZDxqtdvCzv+2gotjCCiybmLD3Xwx7BYsSTWS2G
YnD+U5x5huwe68n3gkA9hwKKpNQze4aEdX5/tVdUjvfNyBg2FW4LbGbJXipDA4Q2
XbHvbGweG7Yym3+PRLVTRenhqK3I391tKsvVtp1jzP9XMAfMbMU=
=Erg9
-----END PGP SIGNATURE-----

--p5xpyOTby/Vyet3u--

