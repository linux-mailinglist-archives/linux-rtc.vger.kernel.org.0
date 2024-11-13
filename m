Return-Path: <linux-rtc+bounces-2552-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88A9C6E1A
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 12:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A1A1F21F68
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C3C1FB8B8;
	Wed, 13 Nov 2024 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="askAXd5G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC51FF611
	for <linux-rtc@vger.kernel.org>; Wed, 13 Nov 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731498289; cv=none; b=N23e/WbwCTy04k1qYZ13sG0pd/1iU+2wy5+uuoAH5A1c9lqrMqrJcAIY9+wrOZsMk51piNhP0pGOqB7ulCaX6LNKF5damfJcADopQEEsiMvANwdds+/MyYVF9rAnbPelxkAWNE8KRza9QIvzz2V+RB2YoIyUx6cYIhTo4JSiR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731498289; c=relaxed/simple;
	bh=JWr0tvbI69pJqh90pW9pxLn0iNyq+zFqQnYyIuWEh8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlEKhQkso4e9rWe6WJ1smAAczWCLU9wP1mngDe1P3YJl+FgOtc+S/XWrw5CGrWJH2/6XehCckQ+3kd+KbfOC0Oun3MwzEkPfiahckdIMyCrrPncLaOYZMuZfR/+Ue1sOkw2TmdUEB8nLVXRpbNr2AdqcCVU+fhd0mk9ZdAlWs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=askAXd5G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bO7W
	vZkVGQbBVnUSSbkhfbrOTy/02wb5SdjE/wQ0gAg=; b=askAXd5G0ztgYxXY3s9f
	Ra97mr6+A72nTIrJ9GFMCuYHAUBPRKuDAy21kOrZgHIC0QwaVp+ASjRxTqwLNWAh
	v5P0BwFOm42QOumAE+oiOF3yH7bsXuC2qG3G48IdKVEJh/w4wE6Te8XbXHBBOp8Y
	mPtkxKgs/vArY+biwTaa/mlsGAaKlOTfHzIZCxnrVedozE1QLn/m8EZ+sniH+m70
	kztVUfR/ioZJQahvjcasH+DCJ4pwaLJyNi6f2odbN8xUo/KFWSHzplbIyhSEL0Js
	GXZ5yOK9H8wFKJBAqqJJwoHIOAVXphSycgnSlfSy1TZ/MT5FmAn2Wm6O6B+0cRNG
	VQ==
Received: (qmail 2817462 invoked from network); 13 Nov 2024 12:44:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2024 12:44:39 +0100
X-UD-Smtp-Session: l3s3148p1@7wjf28kmsKlehhtH
Date: Wed, 13 Nov 2024 12:44:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
Message-ID: <ZzSRJ_rH5oQfzYO1@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
References: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ELVWmk6tI8EHM2g4"
Content-Disposition: inline
In-Reply-To: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>


--ELVWmk6tI8EHM2g4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2024 at 12:30:32PM +0100, Wolfram Sang wrote:
> tm_mon describes months from 0 to 11, but the register contains BCD from
> 1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
> Apply the offsets when converting these numbers.
>
> Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Forgot to add that Biju Das had a nice test case for the months:

    Steps to reproduce:
    ------------------
    date -s "2016-12-31 23:59:55";hwclock -w
    hwclock; sleep 10; hwclock

    Original result:
    ---------------
    Sat Dec 31 23:59:55 UTC 2016
    Sat Dec 31 23:59:55 2016  0.000000 seconds
    hwclock: RTC_RD_TIME: Invalid argument

    Result after the fix:
    --------------------
    Sat Dec 31 23:59:55 2016  0.000000 seconds
    Sun Jan  1 00:00:05 2017  0.000000 seconds


--ELVWmk6tI8EHM2g4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc0kSMACgkQFA3kzBSg
KbY1uQ/9ELNcJsRHXuSHl/zd03dlzPAhWsRo0mWi679cpleUE1ezytrXA0GMHUIj
aDW/RsNLaBOZp3pf9PEqAvFueHA+3Z/c/eh9HcElQ770s5Z7bXPa/T6dzz76sebl
GL6NmBnIMMsFa/RGe5+xIV/T1vj+GbU96k+B0U2z1r7Hd59mWJ3/TsRne2E7tr+u
TDCO85uvWn2zga6O2RqHFxyy8AVpaiKy82AlPnfPkjriVuE3LzP8l9nOgxCDEznA
xzX9fCx3ZjLIT45NdPZCpLGY3AxVMo6MzZL6jFrIaQ9JyAOu5V2YCPo7uByDylwR
b4tVmgSDt0aIjxAjlmKP8Hvf/4/n/ACtBbSc/wngyhG4/W6uWr63nB5x/8hrTKEL
AmMKzolhCdKE/Yrp8pNxw+G1AJVIiMP2s25/jZ+CWoMOrzW0CJKCe8N6aSQQMWE9
wlGFgFDCSQ+iOOyOPUhs8PIIA0/v4a6UgBB5IaOJs+uB2wGj04p6gnEh/87cB7cf
Rc6f0fGUt16c8MzHsxjI2ygtBhH3+qMDWlbTsH6LCcsLEcltWP3chhBOeXnekMve
VOJgKfjDtBDzSd9yq53dAk627L4w2Izpop+2hcLqgkjYD1fpPLUusllp2RbxZA6T
3qlL7PGCcD2MyvjFD3m8UM2Lv9ZB9/S+QFiKSAy6GSU0U7mb2mQ=
=8QnW
-----END PGP SIGNATURE-----

--ELVWmk6tI8EHM2g4--

