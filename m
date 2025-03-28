Return-Path: <linux-rtc+bounces-3664-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96910A7451D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 09:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBAA1789CA
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 08:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704B0212FA7;
	Fri, 28 Mar 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbJhLYTV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748E212D8D;
	Fri, 28 Mar 2025 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149479; cv=none; b=QaT6SEvQiK1Svqj8SFWwnRxqVPZTJAQgn5sbFWVpbAuMMhVhvpYiottO9WJ9AIXDSmF82GnfiPFzGd2pWbodbRRERdVovMZVPMZ1f4Rd20Zczdo9pqWeAncJqj12aykNG6LAWjlv1Zl7P288SzhyXZM3ZXj9+k7OxK3JM4/P/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149479; c=relaxed/simple;
	bh=ZNaYWFv07hnLmJ9t204CNI9QvNiZyS05eYgMuawmNeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2owv1pV1FSOu/iPN+E1c4d3z7hyk/kpyXvcJKeRrxHehCRR4HooUGjeFxwe4sKdNA/1SWbZi9s0Vhwv8GKbdGzcyo8HVyNKH13ae6fMXAynkLYGCeZLtjt8OOyyNL8tkL6MaB0A195WoWfa5QKMmqxXVCTfqBHaS/n9vVsJ9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbJhLYTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7847FC4CEE4;
	Fri, 28 Mar 2025 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743149477;
	bh=ZNaYWFv07hnLmJ9t204CNI9QvNiZyS05eYgMuawmNeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbJhLYTVmN2DzSXg+9Z1Zap5RcmMrU/7n3IWA4E2scR1NMRk7ZW/g4uLcU21mqg/T
	 5uNDMh1P4nFMyKPtZwd5jCSBIlaaioCsDWkJ777fb+EeA4LTKjxljxkK0XkmMXKFya
	 xHUg/PtG+nzvRwWYfsyH4ZbU5JiQQN7PP0Y2AftAxAqUhE+i/A/gITOhsN7NmHXFvY
	 U5+thN5A0+8XBxHhKEKxn4ToYmz9mc0aiXBJ+hqgZUMAcX2CZSgU9adBik2KpuPQWZ
	 6M5gtVw2FoW4ujodcMx25nHUHf0T9XQV4msE2ySyJKE3jbevu0eoPChvE/CigTGJ7s
	 YyQwnTPbJX4Ww==
Date: Fri, 28 Mar 2025 08:11:10 +0000
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
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 00/34] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250328081110.GA585744@google.com>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>

On Sun, 23 Mar 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> This depends on the Samsung ACPM driver in Linux next, and runtime
> depends on some fixes for it:
> https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/

FTR, I have no intention of reviewing this until Krzysztof's review
comments have been satisfied.

-- 
Lee Jones [李琼斯]

