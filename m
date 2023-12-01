Return-Path: <linux-rtc+bounces-389-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B9801014
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 17:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04B251C20A0B
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352284CDF0;
	Fri,  1 Dec 2023 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkZ/J/sb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0133D38F;
	Fri,  1 Dec 2023 16:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A783DC433C9;
	Fri,  1 Dec 2023 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701448058;
	bh=njXVksqgpE1XeclAX3UMkcIW+TVRAqYLZ+gVVzqrnbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkZ/J/sbsMCfgSaZ2qbNVoy9pRtzAQUwewg5iqJLNBjvYUwr9aBD685a+74w1LyU7
	 IwvL5riWnox7sdV7wlbcmdBzAlT8G5RCwW6eN6jnNeVxXIi6QrLvyE95azDn5lGf25
	 IAuvkbfRnCMyBR/LEjLsyQBOPtUWw8zHE75fIKOxJcUyoWKx6mFvMKVUKExEwr5Ch6
	 7EdQTm7UrcyRFqOLLNfSWwiqkfQD97eGR/ymDR/Njcscx1iC0FmXvU5WnvhFVGWwIc
	 xoV3nhGcOB7wr1wP/COiDojfZjTZN0nXeTndkFDdu1pZUZYnAfYZKpTehCIHohTzmB
	 PrSHvuh+M74GQ==
Date: Fri, 1 Dec 2023 16:27:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: qcom-pm8xxx: fix inconsistent example
Message-ID: <20231201-pursuable-endocrine-1318f4843597@spud>
References: <20231130173223.12794-1-johan+linaro@kernel.org>
 <ad96b95a-5f4f-4333-b767-762936932061@linaro.org>
 <ZWmn6uicNIqqSwoE@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Rvoo8TjijJDXryr"
Content-Disposition: inline
In-Reply-To: <ZWmn6uicNIqqSwoE@hovoldconsulting.com>


--1Rvoo8TjijJDXryr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 10:31:22AM +0100, Johan Hovold wrote:
> On Fri, Dec 01, 2023 at 09:32:46AM +0100, Krzysztof Kozlowski wrote:
> > On 30/11/2023 18:32, Johan Hovold wrote:
> > > The PM8921 is an SSBI PMIC but in the binding example it is described
> > > as being part of an SPMI PMIC while using an SSBI address.
> > >=20
> > > Make the example consistent by using the sibling PM8941 SPMI PMIC
> > > instead.
> > >=20
> > > Fixes: 8138c5f0318c ("dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8=
xxx rtc bindings")
> >=20
> > Similarly to your thermal patch - this is just an example, not a
> > binding. No bugs are fixed here, no need for backports.
>=20
> A Fixes tag does not in itself imply that something should be
> backported, we have CC-stable tags for that.

IDK, I think at this point every highly active kernel developer should
be aware that the stable maintainers backport way more than just what
gets explicitly CCed to stable.

--1Rvoo8TjijJDXryr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoJdQAKCRB4tDGHoIJi
0kcpAPwOBPDbYEHIiIG5ZgnuEYXaQxnncECWz71C4cPI0PFljgD/RllSKhlIYHPQ
GqC2jbpH54ZYcJgNTHRgB5Ukpd91GQ4=
=ZTcF
-----END PGP SIGNATURE-----

--1Rvoo8TjijJDXryr--

