Return-Path: <linux-rtc+bounces-3607-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3EA704B2
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Mar 2025 16:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4B8175944
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Mar 2025 15:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253D525B693;
	Tue, 25 Mar 2025 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apa/Xgsn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67071EDA3E;
	Tue, 25 Mar 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915498; cv=none; b=YfN4V0j4Iuhx6lq0rsUM3rfpf04IToqcgfij1JPikLYAB4ga1tJw/A6aI14C9zq7FQ05eWZQ0K69kaBYu3lQWWk/OCLrLmG/4mPQ2IEuxo7pnnAJWHNBjVd0om7VlSEWhdWNeUeOjF1wDU4YkLxV5Ha2TxWwdlnXy3BuzGjg018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915498; c=relaxed/simple;
	bh=31T3cY8R212Z8aHTs5rhNTvbbB/uMz7MjuMUCXin76Y=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=D+mGxUAIKHdBVnvuBS3TZn6II2ESXj+pZpurN8gC9qBYQngCZpAQjfHVler83FWxcUSz2LYf+PpFCjpOfX5YlxI/WXeIo92wmYJRNf3Ln575hdju+TZVlNxQ/91ZIste/xMZ7C+bY4LllR8lC9Jjimgvx/Aq8F8Wve1Gl6aDgFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apa/Xgsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C688C4CEE4;
	Tue, 25 Mar 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915497;
	bh=31T3cY8R212Z8aHTs5rhNTvbbB/uMz7MjuMUCXin76Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=apa/XgsnwVd9nOb104wW3rJPdy4fsX4KHS7YuNwZNx7IXRYb2rMvZpWyh3H96xzkl
	 HD7zsjTZAzj0u2HBcFWHipwm96K6sLdM9o2s6qs1e2NSekXo7yhuH03nuzSEsCfcy6
	 3PqXuCLLAr5vVcB6mjV9xUXT+LifQtVX8zzRDG0EU6HiXOvl1fIkq9UkUNFxQneKkx
	 VbH+xCdBzG+XWvJvO/E/3nADw72B42cTxghDKAMX/JhmJ2fNEMTpKuxHO9VFDRWQy3
	 cMsy/zmsiAVnRNRZaZSqyer7kk3IAEgxTBgXt/S18OD4aj2uAjTWvvHgHb3GL8bNrU
	 d9HfLvCQylkFw==
Message-ID: <a3c5e4c369397efcf92dfb4ab6b0fb34@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org> <20250323-s2mpg10-v1-26-d08943702707@linaro.org>
Subject: Re: [PATCH 26/34] clk: s2mps11: add support for S2MPG10 PMIC clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Tue, 25 Mar 2025 08:11:35 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Andr=C3=A9 Draszik (2025-03-23 15:39:42)
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

