Return-Path: <linux-rtc+bounces-3605-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB29A6E06B
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 18:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDFBA7A0F87
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 17:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE48A263F49;
	Mon, 24 Mar 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhxwBWqP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253F79F5;
	Mon, 24 Mar 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742835686; cv=none; b=c+C8FK6fqi6z+XiF260QbR5JtR4+0hMSz3yROg0fbQo6in6DmlLD+xjm8KjiP48gVj54fq317E+xiIAqhW19DEVH4Awx2xTzBBZlxJ/LpBe8fYzfNm4/Ui5MogT4dBqqnsfSRss6i3uvj2NdrE1P5FvO/OmEzHaKtlPX23X6b50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742835686; c=relaxed/simple;
	bh=uWJNLYuWvKSvpsPRw892gm1JEBoBmwCB/Kop1T7r8K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPBUBtMbYVQDipPyI6Vjaa7WvlW+/VallFdvQkEEkliS9L2Pi+FZMYS7HiqkQd4T+wortxWeOlR9l834dwsI0sH9hY3RVTLCbNIhh7hyqB90q/PrhB9K0sPHK442U+RNnmKdgtH5F3kZlkyudtVupBB6/LAS2kuNmplAwEcTyo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhxwBWqP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69D1C4CEDD;
	Mon, 24 Mar 2025 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742835686;
	bh=uWJNLYuWvKSvpsPRw892gm1JEBoBmwCB/Kop1T7r8K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhxwBWqPsnqc/FF3Vh2Uq4XV7t5y8Ng7wB30cTge8lrbx9tO9gHSCqN3gBtdWPs03
	 EpxpBwBLmPm3ahwXAOUOplvw1bcj3RZyMZw1tFz6+dEnObr48te3KjBa52QkvhNTBp
	 MGEQ96c9nbqodOF5YsDbVx8YZepknuJjjkw5Mf5O5TtPEjUdeMZr8HvZ0cRsJuHzdv
	 udbLUFCDFV9rSFStSJMKni8cpM7WHPHrsL/H4cr4jyewMzPJK5DJJzsHqhYQg9olHH
	 9//4CbGTsTu/bB7IyIJcK88r5+O9BZheTpqmTHM5CP1UMBeASsvm0UdBBlg6DgtLBP
	 MZ8ngxjMamstQ==
Date: Mon, 24 Mar 2025 12:01:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Message-ID: <174283568389.583762.1651160249139720114.robh@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
 <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>


On Sun, 23 Mar 2025 22:39:18 +0000, André Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


