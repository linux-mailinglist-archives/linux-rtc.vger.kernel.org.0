Return-Path: <linux-rtc+bounces-3044-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5FA1C4F7
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2025 19:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73B118887FB
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Jan 2025 18:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7A88633F;
	Sat, 25 Jan 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZzJY5dQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837667083D;
	Sat, 25 Jan 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737830779; cv=none; b=Grq+ViMMj4f0aAzVkfZGiL1WDzpXm0gQNOEp9QZvJXvMdsJ8TpD4QAnoEb3/NXmiRv9a441bgaVtuQ1zLPTZMq0rgmVRsPgl3K3Ch9VTxh8Q1x21ZdGbqAXX7PYx0/ojNuvwvw0mTpWu/6JOnbB/sVKtKz5tskafV+2WG/OskMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737830779; c=relaxed/simple;
	bh=H8QwGyV0uR+W7rIUL6aSwdgYBF4gwlvwp7RqlTEl5fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onh959ivlAcpKd74Ka5fOBQ/WcsiA7PIRvPdAPXZfD6Qe6NaGwLK8EZdvZikuXddUIcK9besfHsDoa6ixXHyRii/Q6/sEf0uDFjOPAmWH3e37gb0IVbOXDWNXLH/CuCAxLPpWKNfnoe2fRR2N3M92s71PjBo729OBgQA1INNgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZzJY5dQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7FFC4CED6;
	Sat, 25 Jan 2025 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737830779;
	bh=H8QwGyV0uR+W7rIUL6aSwdgYBF4gwlvwp7RqlTEl5fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZzJY5dQYZBNtN69P02xWQLG0SlpQfLphrFx1Qa/zehiCeiSIiyB5h2aR8ZRoiXj2
	 BjqoVfmiNC54kC1V/xbDHpvRS74QGU+zwaMHxP+qidhWejw1XBK4hf+dOx4QwtFNeC
	 zRIVMjiiNnyUsfKgDJ3xm3RiLnzxnLCls6LQU4LCz3rYXYemBz2ruIAnuUy0JvvjGC
	 xDwdDwtwpmpURF0WNBDf/DyaKmUtifhXdaV/Rvz/RA5qscAz0vQzQ6CBgTz8H2+aeC
	 6MT9EC/upOd2PTCLuvzMTFN8aB+k7rBZnH/TW/ycVKsP678VrSM7p0CcfGWBPtX5BO
	 VYBDu+Vpi0r/w==
Received: by venus (Postfix, from userid 1000)
	id B59D318389A; Sat, 25 Jan 2025 19:46:16 +0100 (CET)
Date: Sat, 25 Jan 2025 19:46:16 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <lxmbrjscksvvq63o4w2vehiubuseajyu4ruqxpb3mcvrebekc5@vzwhpg5j2p2o>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="twmgl5q7xfyqqjth"
Content-Disposition: inline
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>


--twmgl5q7xfyqqjth
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
MIME-Version: 1.0

Hi,

On Mon, Jan 20, 2025 at 03:41:45PM +0100, Johan Hovold wrote:
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
>=20
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.

I've been using this series for the last few days and it seems to
work well.

Tested-by: Sebastian Reichel <sre@kernel.org> # Lenovo T14s Gen6

Greetings,

-- Sebastian

--twmgl5q7xfyqqjth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmeVMXAACgkQ2O7X88g7
+po3sQ/+K8NMmf84/+Ka/THBmL37nNwGSk9jkKIM1pbfE2VE4+iucxmCcptX9uxo
W3SDUosI80ZvSZv0BuUJZqE9ON7GVR14pMVcx8LxCvyQ0oYzRu8ti4T/0rCCO0Uo
23Ku8afn1PhXpuwssHRiPoHX9atJ+0MUKKmjNYq01xstoqZcv7EUFoFMRwMbwdH7
H/RQ6I7rQcsmkPN3M0yUiOL1dtR5CvhfgDvkCnBMy5e+hOXXrNy7Xku5C96SdCoN
KMVTxtCuYyzxBK8CztyP9ycJ6Oy8abiN/WDvD/XyXEAWQdmx5pdPBgU744DdD6rK
0K2eTT9Lfid9m2A3jN3EIghTPXx5PlmkoITyvNXMJn5b0S1iyl5sdWpzb7Ombh7d
AmwXtk3Y05fxv1vEsMVkywEa4kmDuwlBamEGLFy8KfnEwYr/53L2nL+3+ugkHLnk
yzP3HiaJarz9pLhzG3U59XXuCKGkcOdyoexP+BJuyKKWykOAvnfk3smnNKeTRJpH
a+WoI/o/A5yOiSzirE+Mj6suuo5DKclQy0NgrozWP5nfNu4lUbM7wnJzZLPV6q2T
V5rdOQUaCMfw3oZghVv7nRVQ+ojbPBXZYWjXfMVIHgGNqu9n9jZ2o+fGqYUd3rj5
SYtKNutlLQ0tn2/zYrBDoQQmUwwxrnmhiSGzMpfrm9lnzErLQMI=
=ukGj
-----END PGP SIGNATURE-----

--twmgl5q7xfyqqjth--

