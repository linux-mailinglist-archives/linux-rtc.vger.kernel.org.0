Return-Path: <linux-rtc+bounces-1940-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BE975ABB
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 21:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2BD41C21C91
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 19:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F871B9B4D;
	Wed, 11 Sep 2024 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcaeIvus"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12C224CC;
	Wed, 11 Sep 2024 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726082158; cv=none; b=kL5j3fSndgBcIjxtK/z/lmsE2DkYCL3mj7VCNrYi6ggUAZbY1tzK91bIsSLhfhi0q35l0DmXKh9vUQQE+a5J1v/zxkEBAIHF24/9LTJyt+V5ZCpw9Ajat3TiA0Ze+KVPPF28LX1hyJvYf69wdBayxnktx7B/4His85HOjbcq9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726082158; c=relaxed/simple;
	bh=f5rad1ySYqHXSjFfBwKfxHb+fDtmkXvdG7RtWBDNqQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjvjQMkad6P88qIk9TODk3N73UOifg+CXVlgwP+e+Y3+fq+tdgYwW8JhxHZ2DS/XTts9q+aFhtr2Psq0ulexOxRzysQTRxRtcNd0jZYy7Y2i1IUJfaoM+DZ2mHCUkEYekY3hcyYM2dZkxfYToZVfXewHFt4ZB9ZiRjX5Bvi6Ly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcaeIvus; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86485C4CEC0;
	Wed, 11 Sep 2024 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726082157;
	bh=f5rad1ySYqHXSjFfBwKfxHb+fDtmkXvdG7RtWBDNqQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcaeIvusKXC5Ef1u/zeIHV+Hh9ASPqp/JPPe2lfXfShUmDrKxVoMoCQOx9rfNf3gw
	 Diko6VFo+E1gTq2cG3pNz+MKiDKennENbYaQHn2G807iEBUUz+aSTtbJe1NaGLC1Ik
	 9ZScwQdbr3ceqRzHLBiJp0YQMK1fQs5fAhmfr44/Pj5lFZeJbd/kgmhw4wPtDhk0Oa
	 nfqy/blckDg4LuFhNLGisV6lXc4otouffVTXhrIvsqSgHfQRyzr8IMLPr52DCqGZrr
	 F/RIGZ6UYF8ANFHqH6SGBr+PD0co+4unt4dF+3BY0M9q6k0Rs6QCAwS6MD6Cwr5xmz
	 hgPNtoctRmWLQ==
Date: Wed, 11 Sep 2024 20:15:53 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Drop non-trivial duplicate compatibles
Message-ID: <20240911-cornhusk-labrador-1c2bfa4def8b@spud>
References: <20240910234431.1043923-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tlJ4mE5bzP/uerQp"
Content-Disposition: inline
In-Reply-To: <20240910234431.1043923-1-robh@kernel.org>


--tlJ4mE5bzP/uerQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 06:44:31PM -0500, Rob Herring (Arm) wrote:
> Several compatibles documented in trivial-rtc.yaml are documented
> elsewhere and are not trivial, so drop them.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tlJ4mE5bzP/uerQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHsaQAKCRB4tDGHoIJi
0lqYAQCeWL+RatiMKrcHYjc4J9gGihRTlK/Cv9pH9MlZ0agjtAEA+L43PIrIW2q0
g137a794Zt7r7pdlJwdAU363E4obNw0=
=dPoc
-----END PGP SIGNATURE-----

--tlJ4mE5bzP/uerQp--

