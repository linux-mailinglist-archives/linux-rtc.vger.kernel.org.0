Return-Path: <linux-rtc+bounces-5006-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E0EB8E266
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 19:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E51617BC4F
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 17:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204B1273D7B;
	Sun, 21 Sep 2025 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOEkMpRY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1A827281D;
	Sun, 21 Sep 2025 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758476640; cv=none; b=f8LqbAIwsc+L16dZGkfw3UI6VkePmbSmH/5TzQn5maIL5Su0q3iU4Y48PtP0oHe+GdnLZpazJyMMygYvCdJwvDkXQzcW5QAVsIfDkemtR2t+vcrltULLBk4nMV5EIqPw3cyps77ZHgGk7ZZNPsbbeYVdAxIyiBdqzh1VwG6y5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758476640; c=relaxed/simple;
	bh=HNCuIkFLlg7Zhk9/3GF9Znm4JqW+TxU/QNyqHxbMO2E=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZmUMN6GSRvOhcaNIGaZyzWU5yynRTxbnj5/1QxJkLKLiiX/mc04XC/Y01Kxlfobpy1Ddp83y8NAam3Z/ofQLT9nxbLYAbNTyAatGAYtS7YHwQhsDUxo1XVRRk+/iSfUlDEW/EJlqy5Q43HRh9F33f00Z6B57Xpr9bvtDdrLnhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOEkMpRY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2F7C4CEE7;
	Sun, 21 Sep 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476639;
	bh=HNCuIkFLlg7Zhk9/3GF9Znm4JqW+TxU/QNyqHxbMO2E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gOEkMpRYvVlgcY4nNw9GoslJjP/3D6/qNd27SQs8TOiivwQSWwiSHBVChoKWHZEeP
	 axRjEkxhXreGBBNtWKHnSxzdGUUPVz/c+nEuHh0RJCCx4j5W5iga/lraC+RU/yTtRD
	 /vCoiGUOAtDBB3RcE1AJswrwL2Bixu1cfMGds5Q6/zJ4x/8wxXRkJ5w6QjVok+ctZb
	 6aQ7v5caRz/bAbN1TCkKTrMhWxM7J+8O7YcracYCcsIeufbsOs2YEmNFVO2FwVAbkr
	 prXKog3Ff3AP2vMl1u7iR0s94uoOHUk6SoQw8qxgPpnTrcDBwhsq7PHksGGOmsE4dg
	 keSXWTgboO5Cg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
Subject: Re: [PATCH v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Sun, 21 Sep 2025 10:43:58 -0700
Message-ID: <175847663814.4354.1879115669724877566@lazor>
User-Agent: alot/0.11

Quoting Andr=C3=A9 Draszik (2025-07-30 02:31:35)
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Applied to clk-next

