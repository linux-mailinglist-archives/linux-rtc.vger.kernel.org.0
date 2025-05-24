Return-Path: <linux-rtc+bounces-4140-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF109AC3193
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 23:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD381898B48
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 21:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE5D27E1C6;
	Sat, 24 May 2025 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E7QNb3Gk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD138F91;
	Sat, 24 May 2025 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123850; cv=none; b=kWqTfA6A631u791aQ8qXU7GnvbIDQLYkUSqHsPT5e6nCjMKV8nSotRa+vKhsN5/RJl+TbMtTWq9fibVUkKWa3QGLykgw0cGbw07HNRDoMkx3QhOGLJIN+gxhx9a6xye2Jk5YDZqE/CBbPzbIWng0jtqlCg6oTf6EMiNEzPGym/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123850; c=relaxed/simple;
	bh=2s94vUMS/9XHAP5DUAb1E/ZFWH5rFVSFdcejczrKv00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnbJR02aBSw5VQ8j2liwKRwntMP+RoLom/ZADgWJWJJiWDFZADEe1C0FAQpujhC913lma+jG21GTU3qouqOwU1WQuJ3Z7QzOBOOfe4b1z1ezCDXyIAyKlKcymm8Sw01ysXtzpvZd9YBp3ic92jXc7bLxG3QX4xKTHuzRJtYNJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E7QNb3Gk; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49D5C4326A;
	Sat, 24 May 2025 21:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748123845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yuigfpZ+G27GeQmpj5dr8hu8Stajt3T05I3/E0ixUb8=;
	b=E7QNb3Gkw0ePngT2ppObvuk80dlcpDteQnv1hoPavUpxPh1c5juFlWA50A354J9cfs4gAw
	YXWf0Tb19HIq2IYBojQdlGJhaZQgWkmOznDW8Lr753WjgUaABntUbo/h6NFiqdPBV6aE3B
	rJr9Flw+aMA6iGuRDiFjAIWBv8goQMF4KzlLM6Q3qfXf6c3kcdx2lTZTlJTTtfbd9olQgo
	vF0MA2qG+BE1ZVEQH51awTuKB70uI5/U7TQo58fNS5XVZzwW2pDTm7xnYepJHmiHLB+g3E
	RcAWkkW2fyS8Y3gksoClLzMmoiRJJRHzvON5/gnfeLfCF/y8jykcvbisMRP3sg==
Date: Sat, 24 May 2025 23:57:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] rtc: pm8xxx: fix uefi offset lookup
Message-ID: <174812376653.1267678.1330291103918803458.b4-ty@bootlin.com>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423075143.11157-1-johan+linaro@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdekgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhohhgrnhdolhhinhgrrhhosehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggtihhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 23 Apr 2025 09:51:39 +0200, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the driver probes.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
      https://git.kernel.org/abelloni/c/b23b91d56863
[2/4] rtc: pm8xxx: fix uefi offset lookup
      https://git.kernel.org/abelloni/c/ead453283279

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

