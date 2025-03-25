Return-Path: <linux-rtc+bounces-3608-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DBA704B5
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Mar 2025 16:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6167817644F
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Mar 2025 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D26925BAAA;
	Tue, 25 Mar 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Buz5aBcw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D461EDA3E;
	Tue, 25 Mar 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915540; cv=none; b=sprsk7u+9DcQ2AXs8PTfRVFW27PKwhxzKCiGGuBtmUrmFqRqHCi7YIHMxC7sIMxMzndcT7p/zA9YfIyYxz4k+ES37F/wEdgC3HgByLnLTqXLYBSP3SMEIDHFcn5a6BNIyZNUgYc7ayqIjkIIcQV5wAOJkdDFpkqvKrCLQMS5eww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915540; c=relaxed/simple;
	bh=gMaFKEYDqxU0ukF9d1/iE8OtHkD7HAfzgFtwGGFzkrY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=FDNyS83nUGhYe3SjX99t3GHkMNXNP3Z7/ush3NX69VBFhvSJtOQ6udGyVDVyScOuwh8YOSFgBqYzVeM+pxzFfJEAcUM8Ts1ZOUEySulDOgAbR3Zdx37yjbnFzJM5Q7l65bj2TLsi+JACf6QnrEcMRsBMi3MBtfgKP0KTM6Q23kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Buz5aBcw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D7DC4CEE4;
	Tue, 25 Mar 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915539;
	bh=gMaFKEYDqxU0ukF9d1/iE8OtHkD7HAfzgFtwGGFzkrY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Buz5aBcwYHUVeK4wL2EJ74DjZNr85CzIFffbsLD+EgAWTdh8P/mz2RCh7Bz6Pl+6P
	 Yl5nUlD30r7TW8eKXg6EtaSbc45/mTTUziNe88wPfYeSWHkSgrP1UMtgjARkwa6hmu
	 +doIC01SYRuNsmkt2h6l6pBnc1XfWFqgecNObnT2aaEVrkmOOGJXDKSVVEMXO8eIoQ
	 vza1IOFkqp/dv2PWyo3VKZHvXPS9YxAS3iEJDoS5lRsaxmJL7XHjSMQB+G/Z0cSsig
	 gAq6qtxDmU/NFjLs2dWdH2JwHzPG9BCOtw0lzhf0DnOH5wVLjiMOVLigf4bRo/Jity
	 ps9nZj/7zweAg==
Message-ID: <f72d5f25b58dbbd8571f1895968847bd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org> <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
Subject: Re: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Tue, 25 Mar 2025 08:12:17 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Andr=C3=A9 Draszik (2025-03-23 15:39:18)
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

