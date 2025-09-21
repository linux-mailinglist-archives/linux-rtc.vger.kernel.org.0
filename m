Return-Path: <linux-rtc+bounces-5005-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4AB8E257
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 19:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5D8F17B921
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 17:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E642272E46;
	Sun, 21 Sep 2025 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ML5teVJg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F951A2387;
	Sun, 21 Sep 2025 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758476617; cv=none; b=r7bU/wGpBtCvh4Xwd8wCtYQPAlALyJTpIl81mXL7V0Uo93QLgfRnpvctglPdnAfuuCvFt5dTMfJUL35LRQc7gqt6LTPYf9pXKkLuPiTIQ3tfwxJhKZCZEz8sxMTG/IwcbThFQNGr6JGUReYdfFJ/skWsSsHcpSpzLjTbawAjFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758476617; c=relaxed/simple;
	bh=7PTad7OMHIed/Tvkrk1FCHhngYVwqvmJrToxhsfWbqE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=m3ZOWFJwm6onmdzjj9WL7yoYVGDycwLdJOyl3U+7AvS6QNIs1feh4Rdiz6lazpyawM0rZZRKwCLcaeYjrxHdQGAzO4XRcDAtGBYFGdMEDKrQPQCgeeiEqE3zV9GEsxCJ3GmdTbC1oL6sbnRB1JWWDA8XLa4XDT7IY+xCAE4x7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ML5teVJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C86C4CEE7;
	Sun, 21 Sep 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476616;
	bh=7PTad7OMHIed/Tvkrk1FCHhngYVwqvmJrToxhsfWbqE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ML5teVJgkR9ZPb42Dv74OpPB5L6BTBJ735F2Q4+5pK73DI4TCu2KGiK5naS4a4Gaf
	 pKsIk6x09XRUI2Agy9f0vXJ5dBf38+zsBIdcZAZ/OygthO5MSQIKOHMKj3Nre1JiCM
	 +HIatdkBQXPrH19hiWeuB1VC4FneQDe6LTLpvaQ3EQipFLjqRHj0KbeaBjMft3MPIV
	 dPpW8B0FeX8y+aMApr3OZtQfdPTGfg34yy7WaXXExhaHuwznZrBzxs1CpZNjY1HGRd
	 F+laUFCb9gKl4OIoqDvT1Z7P0SACMqFEOPbhbKUhvZh61Y2aiRpj2Bh1fPEzXhrupL
	 DRSgHTK0TPvsA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org> <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: samsung,s2mps11: add s2mpg10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Sun, 21 Sep 2025 10:43:34 -0700
Message-ID: <175847661488.4354.3014976375536307738@lazor>
User-Agent: alot/0.11

Quoting Andr=C3=A9 Draszik (2025-07-30 02:31:34)
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Applied to clk-next

