Return-Path: <linux-rtc+bounces-4872-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7296B53BF7
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 20:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7BCBAA383B
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 18:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F82D188CB1;
	Thu, 11 Sep 2025 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPXe2a0d"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10349241663;
	Thu, 11 Sep 2025 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757617046; cv=none; b=actdmVmvO4NnE9e75r839D54G2PWJyGKyKCsZw7maLjpplCPs7ZTSoppMoZDRypkq5XjtvSJuuz3vbfeEqoY7SDmgdMQ3nqa5mj9XG8DaJF51uJgD+/4HG2WeXEQc6yeuj12ZXIKP5RWMGTf+iTyydyYQYu3+uwyGNBy8MBvBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757617046; c=relaxed/simple;
	bh=KCkueulLNti5rMZqCXMGdCyFB/dsr9EyeiTawIyR368=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5GdaL+kbS6FdTe7SXwe2SYx4oGlNpgEwkq6T8lj5HQxgG4cQnbjhJLrO+rBwsZdAQjNV5TxgUR5D4hM/B4o9lzrhLB4JAsqfK8ExEp/1rCavDfoopvY6sv07Tpf2Urkt3RjYBS4OTCD3wEURm5s7MOD2TSes1qX4fLWXL3OEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPXe2a0d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20F6C4CEF0;
	Thu, 11 Sep 2025 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757617045;
	bh=KCkueulLNti5rMZqCXMGdCyFB/dsr9EyeiTawIyR368=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPXe2a0dGVS5459STIEhC4WAQbQAl+LplIH20+wlU2UYWvUDO0EblzkRyRechR4mS
	 WdXrsqBRlRj+l+d2Q5dFenY4suqR7RiuMRXdql/ZZ1ogtq+ZjyMxRogPGmc287RywJ
	 jhHXN4aU6miVRnmJ7bPF8uW0oFtp7FL8bHwOpWkOx6SZKAXp48DDII12uv/kF9RRRS
	 DQZ0zE7cslJpdPOEgMeGLPhJrIE/cACzpr3I9DNUKVbN+14tOy211IvgRiZXtgYF/g
	 KUSFrIEH71s5ufhQXmpEWJmobiYtYpo2+nj/hbg+A9+wH16xFGyAp0aO5wRwm0ft3b
	 PG22aPHf2Sopw==
Date: Thu, 11 Sep 2025 19:57:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66pqKUP3ZIOBeGN0"
Content-Disposition: inline
In-Reply-To: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
X-Cookie: Your domestic life may be harmonious.


--66pqKUP3ZIOBeGN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:

> That leaves patch 3, which enables regulator support, and patch
> 4, which adds RTC support.

> How should these two patches be merged?  Mark has reviewed the
> regulator patch 3 and Alexandre has acked the RTC patch 4.

We'd both have been expecting them to go via MFD.

--66pqKUP3ZIOBeGN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjDG40ACgkQJNaLcl1U
h9AXdQf+IdRJpWhqD0mkQabeBSF65aLfa+7LECsPIv5ruSPrNRMsy61871+68Cyf
XSkwNm0j+n9bp3BKgf2siTNQJP7avTj7SEn3DAwkK8o9ADoOezTymr27J++8fQBu
TejL9xAOdrFLn1hx2wthV5GtW63+q3xaM2FECQUfabMy5q7FsBXi9iKNQzfrE2td
+1BpNUyYqqBf2HZekcEGmsD585KvZ3boJo21s4RPl9IIS4cjKpcDC+rCHuf5bg4H
SXousx1d16uFhqMQ56sHRrtX2cc34nPL2baF3bun4otN0OH+y0R+Xj5U8tlXS7y9
rjXUS6wQJWZ1XE3BbYVgWPfdIvxPhg==
=I2Nw
-----END PGP SIGNATURE-----

--66pqKUP3ZIOBeGN0--

