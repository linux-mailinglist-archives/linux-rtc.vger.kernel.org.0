Return-Path: <linux-rtc+bounces-5019-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD16B9A86B
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 17:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C11A7A4FD0
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Sep 2025 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A1430EF83;
	Wed, 24 Sep 2025 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0Armg1o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347D30CB33;
	Wed, 24 Sep 2025 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726800; cv=none; b=USd/NpsZ6niNtysIMDUGUvF2im8QXGr1i/RvBJeZWP/EsKWv0kkNW2HVaj6aHStW6PZbvIkRuhD3aT1+hB/1RombEC8e1rxnBRfiLW+jOcexRp3yD6F5jinEBF6oJZ8BGOnjVeFQvtH78GVdbM7W1bGXEDK6uFq93Chpq88B7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726800; c=relaxed/simple;
	bh=WLWq8FRx0LA6k1DnbOTBZtT06hgY4te7GIwCEVKHYTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxVQrrrgroDBxSxkA0dA38cj87cOVoGuukKkalj2Q+U+N7g6fjjRv6uUFr7sbVIIb6OwCQsonDwFX4Bsp/u07xfKkcfSn57VPt3UEX7GYAIsPQoXjYP8BmRPqbsU/sfkw02iYCMHlwftNnVGjOmsct96GdAXsheni0Hh4NMfl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0Armg1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A20EC4CEE7;
	Wed, 24 Sep 2025 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726799;
	bh=WLWq8FRx0LA6k1DnbOTBZtT06hgY4te7GIwCEVKHYTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0Armg1oua2oJUWyResEnOFFQYFgpEdbmNDul/Q6GJLd2TgRw5Yoj6jMT4WrpB2v2
	 sAjwNErnz9OTP9ypKoK3A2lBy6w/mb7cvzDvW3djM6JQ9gBHSkfgFz0mUMpIylSoaI
	 BTLvwlG7C2ghhqaCihKXaID5hB47uoDLmpMaQ5IT3ajidxzhrRuu884hcZ/HxSDPi1
	 62rucnp+ZYPTjKz6/w4KxfTOjGgjKBLvTCO2Io0ByUCzgL4pSwlSZ3nt9OmVzwjodh
	 86bcLfhVSQLWBZK5t6r2Oq1/CEOI81Gwz+/cPG8yu1/AjajakABY0fkyko099DdpCl
	 y8KE8+LA6yaNQ==
Date: Wed, 24 Sep 2025 10:13:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-rtc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 2/7] dt-bindings: mfd: samsung,s2mps11: add compatible
 for s2mps16-pmic
Message-ID: <175872679791.1728755.6102987294273042603.robh@kernel.org>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-3-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 15:42:22 +0300, Ivaylo Ivanov wrote:
> S2MPS16 is a PMIC present in Samsung's exynos8890 devices. It houses
> voltage regulators (38 LDOs and 11 BUCKs), an RTC and a clocks module.
> Add the compatible string "samsung,s2mps16-pmic" to the PMIC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/mfd/samsung,s2mps11.yaml           | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


