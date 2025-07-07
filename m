Return-Path: <linux-rtc+bounces-4439-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831EAFBDC3
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 23:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BC6173E52
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 21:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B136C28A1E1;
	Mon,  7 Jul 2025 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W+SX+Jkp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380D28A1C6;
	Mon,  7 Jul 2025 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924609; cv=none; b=IgbO2lTqH1j+FsiWShey7xQ9ZJ+53rUC/znUF6TVUThXeBE+7Xuz11yh1muS8GyVxblx3pU6aKUzWT/iG3dFC63kZJ4a4BKhZcGU8vf7UXqXaVKkpwlAEKtNrJDhtLYeQdhlchvtostRCHSphadOQzSOKGW9Cko644fiDj/3AdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924609; c=relaxed/simple;
	bh=S5VrA1Fv1bop6itk2sBIHF1gEPiF67onTvsI0+PwHcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkC5D5AQWsFFow8r9MPdfUUW2rR0VAqeABbz6gsJssFiDmGS7Aijl/FqpRo/A8JDPh6oSIjjLXK0IJQyAZMkGskkgvx6DX0M8gIli4NH/P16xATVcmMwv70CvnswrSZ0Pj5xMwpbRj5sIquwJiSVx3O3+kyCjH8KNkO12vqFmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W+SX+Jkp; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 914454316C;
	Mon,  7 Jul 2025 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751924605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMP42vTSIRu/MJRd0CpvPMXCES7ovEyZJ74cGt6sV7s=;
	b=W+SX+JkpQRUC+w3M626Hn5hoDDhJjXDaf8hEIHGrL4LFZLM/V7vQs3MKsVOKQd8zo+dhLH
	Y7uQgLfei57JlVjLpM9GUDd4mKwshCrwhkgYfEIrXnpWbq4vYGjkT1JeSY6Ebepks5mxTc
	SURSqp+4i+8cGWaKUQ7o883ehKg7cbGVShlPOcjQA2evMFQ+DtWofvb1J8kRUylNsdE8Dv
	5t/ypMOqhIrSM6Q/gMRxN8aSXpZEaLzEazq+QFp/BIi/1iTujXnKyYvWuOPl04b8yTuMLY
	pP1mW9sLaXP7oEl2kFzAvaZXvxL3szImpFeTGQ6isSSolCql3RY+59jQhvBVmw==
Date: Mon, 7 Jul 2025 23:43:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: nxp,lpc1788-rtc: add compatible
 string nxp,lpc1850-rtc
Message-ID: <175192458511.1515124.16159734236221921549.b4-ty@bootlin.com>
References: <20250602142842.942700-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602142842.942700-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghvihgvrhdrtggrrhhrrghstghordgtrhhuiiesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 02 Jun 2025 10:28:41 -0400, Frank Li wrote:
> Add compatible string nxp,lpc1850-rtc and fallback to nxp,lpc1788-rtc.
> 
> Fix below CHECK_DTB warning:
>   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: nxp,lpc1788-rtc: add compatible string nxp,lpc1850-rtc
      https://git.kernel.org/abelloni/c/0bafe291cb42

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

