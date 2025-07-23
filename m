Return-Path: <linux-rtc+bounces-4549-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBBB0F876
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 463FA540256
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A181FFC5E;
	Wed, 23 Jul 2025 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aYnzVY2S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665A1FCCF8;
	Wed, 23 Jul 2025 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289658; cv=none; b=glpwWzBblVSTfRTj/yfBJR34uVwifpXqYxeR8sPUM2mhWDo7YdlvpU9TqMw62vYdreCHRJ/wJ95IfS68lTCIJXcGIzgu2XbLNsdJ4FhUXa0fvHzWw7asjHFsI+XZX5GybmVITJoH1CSof2hRsuK/ZYSI0ElZGImIxakFMGuGfbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289658; c=relaxed/simple;
	bh=ggeNLGSbJpXmgT+D4mYyV1Wq2RusVrPIEWx2Soke6zo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgNx78TmBy2+mwKttLlQ4IHvfgEVY7/3m0rRGwre4e//ud3VHBB67Fy2fHfSK0GLBehzUsIvowIkBeqgVJ42/a8iQmNXCqmHb1nmRSg+Fi3Y2ZwuLCe4Ijn5ft96MTdCPSpJ/XstFps3rxnXNc2INwLoRztJZ+rfo8LTwhSrpp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aYnzVY2S; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 941A04421D;
	Wed, 23 Jul 2025 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jDzUJuHQQqu14XAl7Jrb1OaTHmOvr1WrVXI/WdxFEA8=;
	b=aYnzVY2SYyyT8f/D+jEX/w8aFJzvFDmrykntagLJg7D17ImMEvFSqlgyg7yJShmBI/E6hH
	JoKGq+5E1v0/vRaMcNTS4JQrzJv1gvzZzy5bGmzTO4amyBc5/Q6RhkEtbFzh4OqSRnnZyy
	+mMF2Mkwt6qIF/eAIz0dKtnInmRLAWIvFwVirsGRje5IgAK0aHCCq2EitynLUt8VB0mt73
	LvxY0ehYXXNCEqvLkKM9RfE3ShGtonNOaSLgoxbdBD3vGuEeJTB24qNo0ud18DI6lJR2LE
	7SI3ikns96wKqISpbgfFc6wZ1L5pjs2XEgd2oR/TUz71DX136/u0HlHHZgP85Q==
Date: Wed, 23 Jul 2025 18:54:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] rtc: sysfs: Bail out earlier if no new groups
 provided
Message-ID: <175328962922.785597.14715415724003387861.b4-ty@bootlin.com>
References: <20250702073224.2684097-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702073224.2684097-1-andriy.shevchenko@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 02 Jul 2025 10:32:24 +0300, Andy Shevchenko wrote:
> When there is no new groups provided, no need to reallocate memory,
> copy the old ones and free them in order to do nothing. Do nothing
> instead.
> 
> 

Applied, thanks!

[1/1] rtc: sysfs: Bail out earlier if no new groups provided
      https://git.kernel.org/abelloni/c/bbe8d4fef308

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

