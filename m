Return-Path: <linux-rtc+bounces-1724-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D546A95D326
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 18:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1414E1C23765
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 16:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A6A18B49C;
	Fri, 23 Aug 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXJBoVR3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A40B189B87;
	Fri, 23 Aug 2024 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430146; cv=none; b=CnUNX064gLwr3n3ghq3vT1IR9lIEc67Tk8oTMRH+OWixMDb7DiBDZJapj4UMv9fqLa/dzZemi+4JBHn3JKu5vbSUJEb8DFgjrGHK1vpy6TLuvleh8cE5D7djRMgse2tJmH0CA+QOp+WM+Z+DkEj7bFVZt0WsHYcBgjYbpWmjHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430146; c=relaxed/simple;
	bh=cRksg5gA77X5Nn0TxC8LDeTuia+xBj3QqI16BYDiOrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1kAqAzUdvtlgNWj4w4K/EZlqJiARhdQWwGTwqBwDmwq8LSmlpMunCYwi/D4tkn2+1h7rSvuwTZa2/lmg8TL5FjrOM25L3bwCdfH8R24aF/xrKhFKK/onXAEb5icBTWE6cS7RT1fANxjxqGezRlGSLVt6vc8JNbpix7zrN6QIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXJBoVR3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB73CC4AF0B;
	Fri, 23 Aug 2024 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724430146;
	bh=cRksg5gA77X5Nn0TxC8LDeTuia+xBj3QqI16BYDiOrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXJBoVR3OUZJqVfBFRNroqCqzHRuIq850WFKwh9eywtevheLZRh9rY4SQTaJfPIle
	 KhOW9N+a/9ExHFy33bmXmDCAON5KeWkksheKyplklt7gou99iktABnpWRSLplq70+b
	 ZzRpz0f7j9EY64WBXSb4GgH20/Zvpftg791MME90uXEUQDVoQYgKnXEC6krBDwL2vL
	 JIIUnPQCFl7EvJPy4IDwYSkuCXLuPPTveY6a/trZ39Wm3ngb1gXtduNbrrCNAQ2ZWN
	 c656bwjpNiXmexDZ3i4cC1PPcYEWcw2tUoA4YGmAd8CfDf6j9JIPite+Wx/LdTA4SF
	 0HqO0s4urJ6Pw==
Date: Fri, 23 Aug 2024 17:22:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: vendor-prefixes: Add Relfor labs
Message-ID: <20240823-congested-doormat-dcdf42b8e178@spud>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-7-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ClhCpSOfzQT2MZPU"
Content-Disposition: inline
In-Reply-To: <20240823153528.3863993-7-karthikeyan@linumiz.com>


--ClhCpSOfzQT2MZPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 09:05:26PM +0530, Karthikeyan Krishnasamy wrote:
> Add Relfor Labs Pvt. Ltd. vendor prefixes
> https://www.relfor.com/
>=20
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ClhCpSOfzQT2MZPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsi3PQAKCRB4tDGHoIJi
0ln1AQDln6hXhsNoFtUsWVsqzsMFcqyAfuTpM1ryFyw4PAgI5wEAlH8zBy6G/MNk
bf2h+y+scDkDEvYlJXv7BLucJQit8wA=
=HmLp
-----END PGP SIGNATURE-----

--ClhCpSOfzQT2MZPU--

