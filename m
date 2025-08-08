Return-Path: <linux-rtc+bounces-4653-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCFB1EC7B
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 17:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1BF3A0587
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 15:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B64285C91;
	Fri,  8 Aug 2025 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/mvJqO2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE019EED3;
	Fri,  8 Aug 2025 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668423; cv=none; b=RG/Hili0DXqepE+cY+AUBiX4qGOiHzZWBtCEGitV9wAoPDts0dPLGVGjQNv41M7B++GRHITBBKlK1Mv+GJbmqpCnDYTxF9CM+gWjogCe3cTDKXLtKRFmOS5ZjiuKuNbMHTKxWxXwbm75AyYgXXUyXFwU/HnUL/Nq85XdukrqIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668423; c=relaxed/simple;
	bh=r3lg4SDRoe6KbDxHcwFKZkhZpKory0vDk0Qc6SOJO5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2cIY7smNzB7ABO1FlHvWc6As9Ghb13LWhEuuMCSiJwchZ25Aa7up2D8RgELP1NPK5lYTPlgSbig2XDWfZhWlZ2Bd7VVKkRg/WCrXP3N3tlowNqLCKwDk9hiWoX8mu2iBjntkjkWSht33f60VW2IuzjKdp6L4v4a5AqNyUccgS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/mvJqO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0C2C4CEED;
	Fri,  8 Aug 2025 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754668422;
	bh=r3lg4SDRoe6KbDxHcwFKZkhZpKory0vDk0Qc6SOJO5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/mvJqO2v83g6yEjnIk8rDltIYxCG8DBXGsuPprhn+yzQLX0oeP/IXHkAxpWW6L7x
	 Pe5J6bL8PMdPmrY2ueSBFVA3Xbf7Ul8gbc5dr3rwUKa0CfMcdHaygGXFLy3rl1Q0wH
	 712pnt3NCGmUMPPckllP1wq1JK4n3BJTPy6it5w1LqauR56D6qDUsaiiEb5VJrt16H
	 J1P30j1MDJyDlmxr2BxDxQFea3MW+F4gHCwcVNcL07mFMgXD4OCZgHVmOh/IhiSQ8u
	 zy4/0wRNyFalPsa3z9oHPH4icGB7+t2X4ST1PwEVfdODGT2qsDtqRCTGMPkhiGehvm
	 K6FOAYSeUxUiw==
Date: Fri, 8 Aug 2025 16:53:38 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Drop isil,isl12057.txt
Message-ID: <20250808-fanatic-unblended-63c0414e6ed6@spud>
References: <20250807214414.4172910-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwELIG7wYKloDHrN"
Content-Disposition: inline
In-Reply-To: <20250807214414.4172910-1-robh@kernel.org>


--GwELIG7wYKloDHrN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 04:44:13PM -0500, Rob Herring (Arm) wrote:
> The "isil,isl12057" compatible is already supported by rtc-ds1307.yaml,
> so remove the old text binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GwELIG7wYKloDHrN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJYdggAKCRB4tDGHoIJi
0oUDAPsFO9K9ZHbdiNXQMYiEdjw/RivaeL3AREA8tyzOgFFZ+QD/fb424Bd1kCF+
BvtA7YNoRILpAskkXHBEUjDC3oV2WAE=
=IxRN
-----END PGP SIGNATURE-----

--GwELIG7wYKloDHrN--

