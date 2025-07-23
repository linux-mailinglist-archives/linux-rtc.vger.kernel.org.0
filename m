Return-Path: <linux-rtc+bounces-4551-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FBB0F87D
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 18:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64470561DF5
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 16:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532CE2046A9;
	Wed, 23 Jul 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZlIZ/VvH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2B201278;
	Wed, 23 Jul 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753289680; cv=none; b=fImNGl1OHpypHw6mj0/K1171O7U0TbZIOpTmriNdbWgIn1dWlhdH575MqCB9GeDIUmF8kb7TTCnTQAnFezpl2lbxeFFYMZj51VeSedmUcDZ/XaSNBjc85mseicmeB8g+Ev58UhYur+vhC1G5HS52qzJAJe4huk4pT5hSyzU2+VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753289680; c=relaxed/simple;
	bh=qnh2o2DhNuYIBkSp7LUf3XJd8d68bR2VCco+1mnXmIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmLzECJdBHTuRT+yT9oBmtDDTmxgTwymo0gFxqB9bEEEiSdZQbptzNpNBLabgLaNhxF01qKi7pRZAcurio8i4GkkT7o/zbdNTvpDIsULftk2x7omdH0zngW0HnaBIxVtaGyWNqXf9BoudGw5boKeO2ET9sXr6OMOzffo8YpbMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZlIZ/VvH; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65AC51F68E;
	Wed, 23 Jul 2025 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753289675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbfzRJvW5ulvA/Ta9laMhAujPy5SNsmsl3qxHLs6l0A=;
	b=ZlIZ/VvHQUwmyP3kCf5I+kecKSpE3PojVoahqplx4VqQxOWglGGJs0ddMY70zvo0zYR06l
	fdLEOq7zVaL435olpJQbAje1bfLdMpDvZ59wGunkIcpvV2yJcap1JfeVyu9L+2Y2InFvMv
	Dn87+w1idH4t3ENIp3MEDwUyqmWmGQvBjeIckZx/1bmfBUu4jSxNOqJrLQxgW944RSs56A
	MZ03lNUvEM3f7OlbPoyf0FBHNR6Dzcxl8reT2Dox6s15rDFPJlClB79ATCKgHoZo/YZPtA
	bNGkguaxCmA8bzJp0KBeeILeInXunJtgMxQe/Qe1czzblzoWbfL6U+UkNeCRmw==
Date: Wed, 23 Jul 2025 18:54:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
	alexander.stein@ew.tq-group.com,
	Antoni Pokusinski <apokusinski01@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] add support for RV8063 SPI rtc
Message-ID: <175328962925.785597.4433646531544130528.b4-ty@bootlin.com>
References: <20250413130755.159373-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413130755.159373-1-apokusinski01@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfehuddtfeduieeljedvgfegtdffffegtdekffejleelffffvdettedtheegvdenucffohhmrghinhepmhhitghrohgtrhihshhtrghlrdgtohhmpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrphhokhhushhinhhskhhitddusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 13 Apr 2025 15:07:52 +0200, Antoni Pokusinski wrote:
> This patch series adds support for the Microcrystal RV8063 real time
> clock module with SPI interface. This device is very similar to RV8263
> (which however uses I2C), so I decided to extend the existing driver instead
> of creating a new one.
> 
> RV8063 datasheet: https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8063-C7_App-Manual.pdf
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: rtc: pcf85063: add binding for RV8063
      https://git.kernel.org/abelloni/c/b265cb1d68a9
[2/3] rtc: pcf85063: create pcf85063_i2c_probe
      https://git.kernel.org/abelloni/c/29ac4cedb00e
[3/3] rtc: pcf85063: add support for RV8063
      https://git.kernel.org/abelloni/c/a3c7f7e16ea8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

