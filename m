Return-Path: <linux-rtc+bounces-4550-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B21B0F87A
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84500546995
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FC1201278;
	Wed, 23 Jul 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YVOS+KS7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173B1FCCF8;
	Wed, 23 Jul 2025 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289670; cv=none; b=Pr/zOvQY/HLx1nTruSsE7aejX5qo309cU1ZGTSzppfJtuMoHfPiKaGFX4bC7fcHxV+5Bw8msVjCt58Csbtjo51RWddbSakYB64x7xcclIhX4/xJcs4y1shWAKzWNbxGNY5IZvqg8w5Or0xEnevm97HTNDlA/fxZulqFPC8MAjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289670; c=relaxed/simple;
	bh=j3bMbT/8WNABuBVIZK1J++bLNl26lsl0etsBPAHw8Ew=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgj9YuSGXJM/Im44BQ059LndNB/yuWUVODTe2igAk/7sIONOvefx9EBqx4rwtTZ0PnMTKXQkDycdTaR40aQE0Zuay0Jq6B6/34fbDBOcEs0aFkohk3Mmw6AL3JbviqFpKRhydJEPN8AJT5Ug06SQFkoGMjcIVs0HrhrbsLAAizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YVOS+KS7; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B30E4421D;
	Wed, 23 Jul 2025 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQ4EIRMa/XjXprVBagGuervLIx7cNFO8ztQE7lLjEhI=;
	b=YVOS+KS7+8CuPZ6wPmzjjN0jNpAY8rs77ajsIRgPT/E5HyUb6eZ21rhGun3yledkUWuNhT
	kK0/JRtxtDKTP+WPllO8Uo4tCpTTNHFyhIiO1r8QnZ+9OrvvUDcaxoau/68HFPI29CeCkN
	YpYLZzmu2c8OjIv9KVrVY1W2dBZLEc0z6D2Y24THbHaudCRkFw7ydvJ98mhL8Tx2YW1F84
	fac1BEBJj4alYYF+WoObT59Q9wXX9TMqC4gahOidadFGCS5D3a5u4zi4U6Gb5relw9xfWT
	DZYiepv7DRzdZluqMRcMNNItbw4nsP23fx/ogS4XCn6jEHJ4obLsJ9LAik/dSg==
Date: Wed, 23 Jul 2025 18:54:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] rtc: sysfs: Use sysfs_emit() to instead of
 s*printf()
Message-ID: <175328962922.785597.6364140181851802840.b4-ty@bootlin.com>
References: <20250702061534.2670729-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702061534.2670729-1-andriy.shevchenko@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 02 Jul 2025 09:15:34 +0300, Andy Shevchenko wrote:
> Follow the advice of the Documentation/filesystems/sysfs.rst that show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the value
> to be returned to user space.
> 
> 

Applied, thanks!

[1/1] rtc: sysfs: Use sysfs_emit() to instead of s*printf()
      https://git.kernel.org/abelloni/c/4dda8df717b7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

