Return-Path: <linux-rtc+bounces-4342-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B014AE5666
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Jun 2025 00:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34B33A6EA7
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 22:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEB02253B0;
	Mon, 23 Jun 2025 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hjBhVmbG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D01F7580;
	Mon, 23 Jun 2025 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717040; cv=none; b=MkvxzHuznNtds4fwAxayOKgNwhAopQEaSz3WMT/Y8Z6dqmavr26uTJq9ffLw/9zY3wGTeqqHY9NvBEm/7+88CzqAk0WQ+KnKvwLqgL8XZfENLeEbCxnt24Y31rbWzFtxeZGtdBjSfA2QVpOK91sQhQPT/ajaJ5hjWAg8kRFEUu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717040; c=relaxed/simple;
	bh=Yb2Oac6qZK2DSoUU4vrrkQAAhRRXhu/4wRFPumLI90k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSYIsm2CdC2SRGZB3xIz+n7igvCY+JOLsI0WvaF+jY3NeAQFFR83MekfGJ5NCYCFr4EaBtdWpYKPJYj0VsQa6vWdfWKh3W/GOEzRFfNil1xmTV7JJKCusybJ761sJ44v8mAg4pkIwc5xf5ps7MxisYpurN/likVlu5HugYXb2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hjBhVmbG; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B816C4316C;
	Mon, 23 Jun 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750717034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wujDbdLCxL/DpdBnoqRy5zFxIIGeoL7Sk6EHzkya0U=;
	b=hjBhVmbGcyiU0FhamaTO4mJ8fYzx9cqq5s7T/OqiVIGwK3l9XsvlKbbCpw2j686knF3DX1
	P6ZDaxbHqy44tYfap8QsCVkqX3NeoNMbHl3OFW5wvubSbJMLHVhe/Ayj9gWLET0IYLCq0A
	0J6lZdsUQjOxotNQWgs9Te5pRl8yw+LcspAy39/cF+NV6YjnO8ljYxSbNuobXgIElu8UQ3
	LcGIIZfm6lOzdIJYy0QcOwZPLG/O5gQ1MDegxr0j99s3n2ubfJV3CHZ6KZzkripG1pYycz
	dgC171lIPK8pBJU5yL3oW4Y+QA4Uo3KW7hjpmpqwvNRvEupji28KO2Kk1RqP8g==
Date: Tue, 24 Jun 2025 00:17:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <175071653812.1309305.11999722555032816982.b4-ty@bootlin.com>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffieeiffeffedvgedtjedvhfdvheeftddutdetfeefvdelheeiveekgeeutddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrnhgrfihrohgtkhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptgiftddtrdgthhhoihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

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

[25/32] rtc: s5m: cache device type during probe
        https://git.kernel.org/abelloni/c/002cc0ee90e6
[26/32] rtc: s5m: prepare for external regmap
        https://git.kernel.org/abelloni/c/a57743bf009e
[27/32] rtc: s5m: add support for S2MPG10 RTC
        https://git.kernel.org/abelloni/c/e64180846e7e
[28/32] rtc: s5m: fix a typo: peding -> pending
        https://git.kernel.org/abelloni/c/972a3b47f6e1
[29/32] rtc: s5m: switch to devm_device_init_wakeup
        https://git.kernel.org/abelloni/c/1dd609587414
[30/32] rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
        https://git.kernel.org/abelloni/c/f5adb1fa04d0
[31/32] rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
        https://git.kernel.org/abelloni/c/b1248da00836

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

