Return-Path: <linux-rtc+bounces-1725-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5609595D32F
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 18:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C33E1F22D9F
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DBC189B8F;
	Fri, 23 Aug 2024 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lb12S9uU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847DB18893B;
	Fri, 23 Aug 2024 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430289; cv=none; b=XO6EJxtBcfzPAKZeHwQr1ZKGn7l7FdEASNwNaq66JVyI3fe+UpxBWJrHD0uiIjmCajM2wqZ0yKfu+b25489/KSCJxFGrw54J13x1q/uOp8jw6MEQZZfa0HNnhxe4lS9+lr42Ulo72xfOIcgMIC2valAD824b00j8kk2RpfcRDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430289; c=relaxed/simple;
	bh=TqRnUiE/xdVg1tvwkdwMgIZPeAZqU1OchS7C11W338g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saAdY9hJ/wF7CN2uPM5N8D5zAIQmAMqaiUA8hy5pnH9PswUUGZ4elopIWu+OJtkimCqxz5nNgxsmYo3wLxsFPwfoaoRZMzpRNClUFJdXd/uLy4QQ5zSqIfT6L2qGi3GWCeDeSQL68UwLIj7Y3mFD/wP8NpPlFGPsx+KR4Ha1OWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lb12S9uU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26484C32786;
	Fri, 23 Aug 2024 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724430289;
	bh=TqRnUiE/xdVg1tvwkdwMgIZPeAZqU1OchS7C11W338g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lb12S9uUXo52XJC4u1NIMjE70+xhMeoEPldGQHVd9wilYEp4Ij6cepdZDuMvQPje5
	 VS28NV5mUyM6R5q6EgVa9TSpm+kIj4tgSVvWzCwz8aAMVrYYTbdQ1WjnA6Ra1wNBM7
	 Rn1jW17DRvtDKe6qej5hwlxq0hHVvqhAik3QEpGAKhXdfxYCFQLfJNuwq6JQqb7cFm
	 b2TqxYbALK3e64Ko67xBUeaMXxZNbHpn0+Z82hAyJbnPhlRg8fjBCmrzlXthItjmCx
	 H7ji1MJMFwBccy7fxknkLSHqWbfz+twvIHrz/KXYHxrN4+CJgAmLI9kA7sTZu+raty
	 aFr8ZIjycpltA==
Date: Fri, 23 Aug 2024 17:24:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5/8] Documentation: bindings: rtc: add clock-cells
 property
Message-ID: <20240823-custody-earache-1396c4b236cf@spud>
References: <20240823153528.3863993-1-karthikeyan@linumiz.com>
 <20240823153528.3863993-6-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q3Nd/m88OgL6Pptl"
Content-Disposition: inline
In-Reply-To: <20240823153528.3863993-6-karthikeyan@linumiz.com>


--Q3Nd/m88OgL6Pptl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 09:05:25PM +0530, Karthikeyan Krishnasamy wrote:
> consume clkout from rv3028 rtc which is able to provide
> different clock frequency upon configuration
>=20
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Q3Nd/m88OgL6Pptl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsi3zAAKCRB4tDGHoIJi
0nEfAQDGHakq7Gztov/swTcRsjry/zCl6l1+C5wXiAppsCVOMwEAgBb1+RDwUKTU
TWVZ+CJ7ab62HdTar1ADD15iu7r6+gQ=
=LfDy
-----END PGP SIGNATURE-----

--Q3Nd/m88OgL6Pptl--

