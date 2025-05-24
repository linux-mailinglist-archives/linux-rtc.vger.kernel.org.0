Return-Path: <linux-rtc+bounces-4141-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C912BAC3198
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 23:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E3B7B1458
	for <lists+linux-rtc@lfdr.de>; Sat, 24 May 2025 21:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F8A27E1C6;
	Sat, 24 May 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FpRC2m1g"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEA38F91;
	Sat, 24 May 2025 21:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123858; cv=none; b=GRjuHN60Z+w+Kk/P7HOsrDhO56gNiXcgfqm505r5pbJNbF7FYN941+2ka9w/wKh1gr/jPj0BYaV8Cwk5uqHZe+y/QaJuyivn/QbXwhghdz1CuRHNiTTkwDJ/JClyQ0FPsMXX8Ybi6y53myI3IBM4UNeOCncn9SoJLxCW/9QoYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123858; c=relaxed/simple;
	bh=Pvgx5XlgAR8RRfLkVxvCRFND4xtdaQ0G2JpR4flD76o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhHHAzw1/WqbIByx5tswFeATbJBzmy4BDYEsJjpOqqkeHVW2bXvU6bdLt/rdlYgI0uI+DrNVDfjVTg0iUPVRWyx9eRVMoJ7NMvRuuqhUL9L/KOvqkUZr2e9K08dMA7A34VmhNjOSJcX4P21GixXwVsBApvPi5wT9xfDXJZoWwhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FpRC2m1g; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 039084326B;
	Sat, 24 May 2025 21:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748123854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+y1YopDCw0D08zSD+i2RqHtFiMR0rT7oMvTErXrpHug=;
	b=FpRC2m1gNCNL7H5JrouUKGax6IM8g2YXK3PkJ53bMu5O8bDVrj5bBL26jUvNRr7fmUdqhn
	HOvDk3AEAXJeyu7FEE8G1PCb+K/e9ZpjAK21q7frF698LltVPjSKM4FBtqXHlccO/Wq0T9
	8Ay4tiafc/e/ewyyQkz3hUU08QjNyG56t06BenIaLuJ7aWPvke24G0BVk1aio6M1NWlboz
	bnhJr0LKhIVvJmHRd8CsRLqV4CmsGQgxzZv0AzUJuv0AXNC+aJgaaS01BOi0TIy+Zhz0hP
	zJRo07l3r4kU2cpt+szL8Ujz/iDeMGDntVob6gZ+Nf+pqGOEpVDJ9oagqwXYkg==
Date: Sat, 24 May 2025 23:57:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] rtc: amlogic: Do not enable by default during compile
 testing
Message-ID: <174812376650.1267678.15277074119973516466.b4-ty@bootlin.com>
References: <20250417074640.81363-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417074640.81363-1-krzysztof.kozlowski@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdekgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvl
 hesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 17 Apr 2025 09:46:40 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> 

Applied, thanks!

[1/1] rtc: amlogic: Do not enable by default during compile testing
      https://git.kernel.org/abelloni/c/7498dca1d0d1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

