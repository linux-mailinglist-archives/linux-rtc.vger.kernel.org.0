Return-Path: <linux-rtc+bounces-4919-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2908B59CA0
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 17:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A20A0324069
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Sep 2025 15:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1163705B8;
	Tue, 16 Sep 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9Hlf1Vd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469AB34167D;
	Tue, 16 Sep 2025 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038159; cv=none; b=RqNoo+LG+UMPFvKOdFrpeVEzrcOIR/BZ+EP821bvKnSVprFEqt/8j6Rz8UViXnDDXxh0sfskXJbozDMtiW9nlmRyoZ8FPfnGRrP3JwLXMKN1ADhpdC08uiVA2nThO1eFZSTkeC3UV6BHvPLP7fscRWQHNWWa1+HnFP/lZ+MwzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038159; c=relaxed/simple;
	bh=1aQLI3N+v4KCkYrGwa/1zSx8nmkzO1iW/T0ekZORUQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwsDoqVk01AWeA5kWTBzirzPKzNPBQqvXk0QQSVfspjxP1OL+kq+sSZqWcxehlWmTEWnC0+r1leUxOf9tD5AsVSWP+l/vetDTyCeicWu1eMc7yJTtnOEyay4sBBM3O2n4+Ij2dDRPpYwWheL/JUSWYr0xlXmKJB7llChiYt0ROI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9Hlf1Vd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C21C4CEEB;
	Tue, 16 Sep 2025 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758038159;
	bh=1aQLI3N+v4KCkYrGwa/1zSx8nmkzO1iW/T0ekZORUQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9Hlf1Vd3Oi8xPpxHXzOMCNIPRuHj04/HtnNCapH/Bv8ielmI0+pkmQ4Ojf94c/Sn
	 wkCkRwBwlzb1Vm1D10+aHkodvd8obKwqHOMBSX/1Sz7Jak2QWO0GTWzQy7LJZPiOmK
	 ymtjjz7+xTWfcrem3DFz0KO/QGk4J+jiZ5/bSWTwOKlli4fIq5kuVwjYmb7I15hLRQ
	 SLSaqyV6cTHCzV6cMF3lrnxVP6uslGumSLAL4/G3nDqZHUWSL6lrbliFeNxOd41VAY
	 qx3gwMF4l4nttROnULkSqqwQA9sb5ZT9wOHGe1Z5/KE4cRN2dQR+7AIa4kKdhUOtTM
	 X/M5EgZs3RoKg==
Date: Tue, 16 Sep 2025 16:55:53 +0100
From: Lee Jones <lee@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/7] mfd: sec: add support for s2mps16 pmic
Message-ID: <20250916155553.GB3837873@google.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250914124227.2619925-5-ivo.ivanov.ivanov1@gmail.com>

On Sun, 14 Sep 2025, Ivaylo Ivanov wrote:

> Add support for Samsung's s2mps16 pmic. It's the primary PMIC used by
> exynos8890 devices. It houses regulators (38 LDOs and 11 BUCKs), three
> 32.768KHz clock outputs and an RTC device.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/mfd/sec-common.c            |  10 ++
>  drivers/mfd/sec-i2c.c               |  16 +++
>  drivers/mfd/sec-irq.c               |  46 +++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  66 ++++++++++
>  include/linux/mfd/samsung/s2mps16.h | 195 ++++++++++++++++++++++++++++
>  6 files changed, 334 insertions(+)
>  create mode 100644 include/linux/mfd/samsung/s2mps16.h

Looks okay.  Once you have the Regulator Ack we can merge this through MFD.

-- 
Lee Jones [李琼斯]

