Return-Path: <linux-rtc+bounces-3998-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE75A9B1CF
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Apr 2025 17:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1613D166B00
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Apr 2025 15:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7C11A841C;
	Thu, 24 Apr 2025 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeY03B1T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6280117A30A;
	Thu, 24 Apr 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507490; cv=none; b=ptEEZF1vlvMgqcP9fxUsQ/9vXzB5u+VY5tsIsD5e3Vs1gLoBL+OsV9/OBSoJBDCdCj3icKZUBSB3QcWRR1zvBUxPJRoHasAWAYmzxkOJ/jzskfpmHc0IItBWyAbyDp14BAhc1B+kXFdzs5b6z6VS08Hq2VEgmmp41sgEbzsQnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507490; c=relaxed/simple;
	bh=BaigLKgi67/CVqkot7IIPq3EJQR29/Gk6ouHiFoFK2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t7em4VqOqWJMMDrkoIwmtOiCrS95vyoHx+eV8OMZryDAxB/48k57mxsPhwq+t/MFIt+J9+NbKcCv/4bFK249boA0Xt/18iRKH6/bmeEfBIfmsDUEEri18NJLQiBBSZH28lrwy4+NGWRos2Fmc95thojWeO7vQCAFGyFUX5VGEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeY03B1T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C47DC4CEE3;
	Thu, 24 Apr 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745507489;
	bh=BaigLKgi67/CVqkot7IIPq3EJQR29/Gk6ouHiFoFK2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JeY03B1TWTc8tOQ1C9dlZuITJhFQrFeGVy6Uq2qfuk5n5BKK63mEq4v+xjtxaRWwm
	 zYcxzm6rZtgEKx13PKAxb8Ghk39ZIP6GxHp8/G5sZ7pN17imkZBppQIGSGVb40O0SG
	 yiIqZlTvRgJY9XS9y1h9Vt7hy6vF62mGYsZm5Abm6tV39Q00uBoPzJBnG+QFOVej1d
	 MmtRb4yZusQ+HbJBU32nPOqndEBs9V8I/WMWWw5SDCa3hyyb2krUmif/76l29o0P2y
	 sgBpBGi/jn6iDifBnU/9PIGo5YS5Rwjb6pQrpxoeZ3KfRs8DqEg8/daA1h/IZgAfO6
	 h05i4tAQoEupg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based
 drivers
Message-Id: <174550748501.1452626.16896113997247650772.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 16:11:25 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Wed, 09 Apr 2025 21:37:21 +0100, André Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/
> 
> [...]

Applied, thanks!

[01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
        commit: 702ac7e59d9bf018126d51a2a3c7708e35afd8b0
[04/32] mfd: sec-core: Drop non-existing forward declarations
        commit: faaad8c7fa7aca377cb0a2ec2b4a64c0bda6f451
[05/32] mfd: sec: Sort includes alphabetically
        commit: 3e18fe35ea16640b53e41e963fb50f8dbd80e004
[06/32] mfd: sec: Update includes to add missing and remove superfluous ones
        commit: e4f9f9942e80bc512da2a2ecacf294b603e6f4a8
[07/32] mfd: sec: Move private internal API to internal header
        commit: 60ab5a460717ebe8306535cce8a4abba4df99b3c
[08/32] mfd: sec: Split into core and transport (i2c) drivers
        commit: 286ee42bcd9b64bf13190769e705620e1d11efb6
[09/32] mfd: sec: Add support for S2MPG10 PMIC
        commit: e60189f7863bc47cbdccd8cca235cc159cb153c6
[10/32] mfd: sec: Merge separate core and irq modules
        commit: 494fb2908480664ea95c5bff26a174dcb8b072eb
[11/32] mfd: sec-common: Fix multiple trivial whitespace issues
        commit: ee5114413def30a79e1892eafe9194c06124e9dd
[12/32] mfd: sec-i2c: Sort struct of_device_id entries and the device type switch
        commit: 742d53cd4487792c2d70d5b5ccc8468a7c4bcc33
[13/32] mfd: sec: Use dev_err_probe() where appropriate
        commit: a745673725d2a63aef8c8c62b2496e345c5f3b78
[14/32] mfd: sec-i2c: s2dos05/s2mpu05: Use explicit regmap config and drop default
        commit: a0164e4ed50bf0cb05d2692a866276a11db0dfa4
[15/32] mfd: sec-irq: s2dos05 doesn't support interrupts
        commit: a5ee21c891befdf9b695f17222f246fda14ec580
[16/32] mfd: sec-common: Don't ignore errors from sec_irq_init()
        commit: 12933bcf7119ec1b75b8d43f17cb7ed4797aba21
[17/32] mfd: sec-i2c: Rework platform data and regmap instantiating
        commit: c206953656074edeabfdf44bbb2bdf89daf6bbe5
[18/32] mfd: sec: Change device_type to int
        commit: edd2e1784f620e1302b660e68578aa353253fa2b
[19/32] mfd: sec: Don't compare against NULL / 0 for errors, use !
        commit: 079b0fe8185c5a6995b3d3c80a6098f857702048
[20/32] mfd: sec-common: Use sizeof(*var), not sizeof(struct type_of_var)
        commit: df7abb6bbc6a75aa0b7829d39f1fe8499d9580c4
[21/32] mfd: sec-common: Convert to using MFD_CELL macros
        commit: d4bddf7d284d61331964d5e46405b7afe0e98bf6
[22/32] mfd: sec-irq: Convert to using REGMAP_IRQ_REG() macros
        commit: c0d96474f496db3fe286fe8ae2072c321205629e
[23/32] mfd: sec: Add myself as module author
        commit: d2bae7c2b23185a71a22f85079461f22143f9b64
[32/32] MAINTAINERS: add myself as reviewer for Samsung S2M MFD
        commit: 8a0542753218d260e23c77311cd909f7b38e6daa

--
Lee Jones [李琼斯]


