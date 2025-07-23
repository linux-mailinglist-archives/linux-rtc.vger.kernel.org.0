Return-Path: <linux-rtc+bounces-4556-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD1B0F8CB
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 19:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F81E58540F
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 17:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A9220F079;
	Wed, 23 Jul 2025 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ib6XOG+f"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DE204C07;
	Wed, 23 Jul 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753291082; cv=none; b=a9OWIliVkS23pQdhyUib6me76wSW2wCzHHOoix/3182ujbGnCL13su2rQAszlT4ZEEveroc1DOP96QEB/UAsDvVsU8fUg7aIolwiaC+TIBi5zk4k0JzRXTtElcJKhEHXvFMVle9ZfOYfDhMpzaq3Iqbe61JA3El1bgLtI9X7nWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753291082; c=relaxed/simple;
	bh=lAoa/7WBW9R4oRohPX20bWHr4hyFjGv/+34QFZTbYJw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEATmAEC52VpsCV62KEk0ugFnsP4o1KgWvWFCgm34iUJtwweIobC6EoCpPMvgAVnbFEHA7Mf01dpLPBqQvgyIAkT7LsYlFP10NBtqrt/gL5f5cgZVWM7/nL4n9pbbUanz6VzxnV5G5oxTsbuDWYWcUFWFkJk2FtCujtFpcKXU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ib6XOG+f; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [IPv6:2001:4b98:dc4:8::236])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 85CC2580A5C;
	Wed, 23 Jul 2025 16:54:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48F90449C7;
	Wed, 23 Jul 2025 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MerPCYCKuOLv2ngqH6Em+64KuJoa9ZACZbl9S4HS3JQ=;
	b=Ib6XOG+f/PNWfuVL9CWZkq69RiO59E/1cHR6qv/ZsydE5uQJX3pEgy68Q1MAdbv7CcX2Nn
	Q+R9ITrg4BnfD5s4PYxOntDTj4Ap62iN2Gwx6KtAtRxDq/IlS2Cncb4gDS3FP6FKdfGR6S
	AlCEuturZu6BoicMYezRS+EzlkUUMMqkRUFmhMVguRtXjxrmF0Q3tCorXXi8kArLebdZh0
	FVVkyvLWs+2YmtY0nEevayUQtokJCYUHF1MeZmbqgqckXQfv7rgP2rzNq63gtp35KDb5h4
	1vCJyZq4PBKV+oirDf5HGiXJwLUoaupXaILbGysAq8TL1gN6LrLspOKqVUzCwA==
Date: Wed, 23 Jul 2025 18:54:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] rtc: sysfs: use __ATTRIBUTE_GROUPS()
Message-ID: <175328962923.785597.2895888040349836678.b4-ty@bootlin.com>
References: <20250702080108.2722905-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702080108.2722905-1-andriy.shevchenko@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhm

On Wed, 02 Jul 2025 11:01:08 +0300, Andy Shevchenko wrote:
> Embrace __ATTRIBUTE_GROUPS() to avoid boiler plate code.
> This should not introduce any functional changes.
> 
> 

Applied, thanks!

[1/1] rtc: sysfs: use __ATTRIBUTE_GROUPS()
      https://git.kernel.org/abelloni/c/fed5aaeb4e94

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

