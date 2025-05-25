Return-Path: <linux-rtc+bounces-4150-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8644AC374C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 00:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEE7D3AC278
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 22:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DF11BEF74;
	Sun, 25 May 2025 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d0XDJD3x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E019D07A;
	Sun, 25 May 2025 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748211868; cv=none; b=AcMacmVybr4Y3au6o4S8MdCW1eZfJL9vhNCCr57xA8SSMEmXLrw6tPLA8rPWP9EsGOxlVxRasapFVgQaSZESLl4sLTB4xfTpY7Hsg4cXWy7/yRYEQmaf2MBeUwc1NyNdCTfXWZFQyZEF5fzhWY1kFuglg9KemOpknf6eDj2sV0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748211868; c=relaxed/simple;
	bh=E5rA9pis6wkYSuCB7XuBhq5eVUJ1HrIegMcFYnLida4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L49j9VTz3ct6yRAFWCmKtmU+Q3BBIqF1w3/kiiDS7H/D+99MUO/WxIVcKiJBI7+yAImUbuF41EzPYOkXRNhZ2lNqoRDIqOCMV6GTHy9faXd/JSXVf4EPtqe4PxDwrQFgfBl2CMAu1tzZ0lzYc29kwYb91BZkAIEY2CPwxdzThLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d0XDJD3x; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B214340C;
	Sun, 25 May 2025 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748211858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8W1VTM85Fz1ruxk+eNmM+ZO9oMXV6QdzZv/88apBqZE=;
	b=d0XDJD3xv1e3ScwxVbNOsNCdeIPYAaOF22v88CDDwdB60O63F/5k86Kgl9Al/k+PnIZ4aS
	bYQ/buuQ6MZDoCe2QTPXrkGA/fPP4LZeNTugqlrvM+mMLPYdNdvu8GozLBuyA9KD8vrYpq
	XOAzKndBRoB0tkK/ocRhDNa/ZR6jauqfmIiDpWiJ3nD3U0UgWrY1lvzIFuV94N2oNoOhxC
	X3yp0bJPEBeZyzGs+yjTgIIskmeKxqVZcHTUJ3G8h/p1uv047IVhJS/YaNjybuqODQTWbu
	vqhhSp8mOi4GxKstzvQlc8x2EoNS2biUiMlWnczdaDmDV+UZi7nW58McQUkZ9g==
Date: Mon, 26 May 2025 00:24:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: nmydeen@mvista.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cminyard@mvista.com
Subject: Re: [PATCH v2] rtc-m41t62: kickstart ocillator upon failure
Message-ID: <174821184156.1473423.15173521547458647986.b4-ty@bootlin.com>
References: <20250401090454fb0ccf16@mail.local>
 <20250402120546.336657-1-nmydeen@mvista.com>
 <20250402120546.336657-2-nmydeen@mvista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402120546.336657-2-nmydeen@mvista.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheekudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedtffevudelveeitedvueejieegffelieelueekgedvuefgjefftddttdevhfffnecuffhomhgrihhnpehsthdrtghomhdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehnmhihuggvvghnsehmvhhishhtrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghmihhnhigrrhgusehmvhhishhtrgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 02 Apr 2025 17:35:46 +0530, nmydeen@mvista.com wrote:
> The ocillator on the m41t62 (and other chips of this type) needs
> a kickstart upon a failure; the RTC read routine will notice the
> oscillator failure and fail reads.  This is added in the RTC write
> routine; this allows the system to know that the time in the RTC
> is accurate.  This is following the procedure described in section
> 3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"
> 
> [...]

Applied, thanks!

[1/1] rtc-m41t62: kickstart ocillator upon failure
      https://git.kernel.org/abelloni/c/1a7ed2fffbe3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

