Return-Path: <linux-rtc+bounces-3784-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA5A7BA2C
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 473DA3B710A
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A0B1C8600;
	Fri,  4 Apr 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5dFvF6r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8891C7015;
	Fri,  4 Apr 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759841; cv=none; b=oLLl2ZOAUj/2CgmY4labN4xUXms4fZ/3zwyIDqONxZWvLzo36vly1oPWoasXITiFclBUFk2qkqGe4IvEopgmHCnQd4q7piGu2Taz8DuqhAp1cP5UDyrrOoSqSUlKQW6Ptt3vZh5wyJsQyqkbMRr6m+xhsCPEOF920wEGoJvW/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759841; c=relaxed/simple;
	bh=Ouj5fvu1/IuVsQLww+KunF2lTe4LwrsEfuVusZqS/4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAIhq+VDsdWFORQyEAEsIWtCFN0lYYmQ0ODylLHx5cENlxfeVjcDJIWbByRyET///rN8r/jQDOZbH0wr85EOI00HPakgI+TRbBQiFLcvZ9oeToJ+WbdD1pJDVSVNBCstnodkPo5RStDiiizMCqtXFm/UzXEj3cRmnTut4dVMs+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5dFvF6r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4043C4CEE9;
	Fri,  4 Apr 2025 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759841;
	bh=Ouj5fvu1/IuVsQLww+KunF2lTe4LwrsEfuVusZqS/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5dFvF6r/s1AJ6hFL+aw4Ex7sENHxJ6k6kIgb5sBiOYL3xA3jhGC3NJ8OxIuXZZnW
	 RpSXUw/Rk4nETU45AgDdijUtX3eUTyhT38iZw4UUEKtrkCvqWyXKXlYRQELppibbSW
	 aqmNSAemtrf7dv1zs+eP2liT8CfBLR7vXWnifih4wg8ZcQlGzHinDVRk2mNEcD7Kwe
	 Wv/SI4ut5tpL676jhsaE56Iohz6o9FivcpRb1zvjSeYUidJSzVP3bxgIpFqGkSK84H
	 gL8vCdkNvSiDyhY0cjRVM+u4OyedpKnf3SQ762ijYBWJjK5inDs9NkvzM4sFwTHMt5
	 daFzb90pEmd4g==
Date: Fri, 4 Apr 2025 10:43:54 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250404094354.GG43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>

On Thu, 03 Apr 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).

Okay, review complete.

If I didn't comment on a patch, it means I didn't see any issues with it.

However, saying that, it doesn't mean I won't spot something next time.  :)

-- 
Lee Jones [李琼斯]

