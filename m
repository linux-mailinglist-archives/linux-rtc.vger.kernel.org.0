Return-Path: <linux-rtc+bounces-3896-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968FA8390F
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 08:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5571B638B3
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 06:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66671202989;
	Thu, 10 Apr 2025 06:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgzaIHlH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258861D9A54;
	Thu, 10 Apr 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265916; cv=none; b=QDADwOVoYL26Ih6f2ygIqjST0CDlSxUsrCZS/JTpJO/07EgOhBiVe8oVH0Uf2b808VkW+4lPH+RDfwLVVoYOU2GORC7QOSyZKiy+dvhfFr8Ozolc5pSrUFMPL7M6Kqcfz0pRQKahgHRxe9jWvwZwN2CeKKltGKIdwkBi5WjxMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265916; c=relaxed/simple;
	bh=N/Eq3oO6cAKqd4CF4xM3K5jQF+XUdMLxEdRDr+rjO6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kkm8Ishd46sm9PWR4xCcpvK6FCtu3w3j7/yMQ6crfavA7uv5JmRe6oHR7rrVulR/y3IniyEUnGMFg3wVve/OvwIV9EbkOcrMOewv4PK7T3Vmqu2tVDuofHCFO2XVE7Eu6DrP3mC+14BDZq3VBtZt0XL/HTXQAjVcWGftehRcqAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgzaIHlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF988C4CEDD;
	Thu, 10 Apr 2025 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744265914;
	bh=N/Eq3oO6cAKqd4CF4xM3K5jQF+XUdMLxEdRDr+rjO6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgzaIHlHHtE0k8XMPIzNNeKxfWMEWFu7Fb7zdKLcQserP3WkyzcrpRmhCueuk2Rlv
	 M7RQlkWqOlBxJl/Okb0KGD1CfZyFjcANp0maFk15EgzE94lmCUe8QW6syR9i6rP/fs
	 19IBb8kqDrFCAE4RnLNRegJp45caw01cAbwgibsXB8BlIEfE4i8QAmr/Pisxur8TqH
	 c6ct+7hdJVB7RhLaqvRTePLViGfRT44QLIAY0bCnSGkedQ0vjy9MNTGiFeFWVkNZfD
	 jCMG+6SVA/KaBUrW41KOowuiwPqc8AamB4drQgT1T2I0rnBUEY9YFuh68hERIRpzbt
	 d9I4YXgKYqkkg==
Date: Thu, 10 Apr 2025 08:18:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250410-dancing-free-peacock-536c24@shite>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>

On Wed, Apr 09, 2025 at 09:37:21PM GMT, Andr=C3=A9 Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> *** dependency note ***
>=20
> To compile, this depends on the Samsung ACPM driver in Linux next with

Are you sure these are build time dependencies? Do not look like. Also,
if they are, the patchset will wait for quite some time.

> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro=
=2Eorg/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.=
org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@lina=
ro.org/
>=20
> *** dependency note end ***
>=20
> +++ Kconfig update +++
>=20
> There is a Kconfig symbol update in this series, because the existing
> Samsung S2M driver has been split into core and transport (I2C & ACPM)
> parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
> the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.
>=20
> This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
> talk via I2C, but via the Samsung ACPM firmware.
>=20
> +++ Kconfig update end +++
>=20
> This series must be applied in-order, due to interdependencies of some
> of the patches. There are also various cleanup patches to the S2M
> drivers. I've kept them ordered as:

They should not depend... although actually not my trees, except the
firmware.

Best regards,
Krzysztof


