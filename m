Return-Path: <linux-rtc+bounces-3829-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10AA80DF8
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C964E4C35
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05271E1A3F;
	Tue,  8 Apr 2025 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XgaCSp3l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468722333A;
	Tue,  8 Apr 2025 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122401; cv=none; b=q8jTNaBBiQkELW0LpH1ESxz6gVA5zZmqEpFaTez9qW+Ms+RbNHe7Nuq6rmd6VBdUZlrRaL5eBzZASkgtvOdONCuy8YmJGdCJ6NTUJsb2H9+FbQVjXVRxQKi/LJOTlO6WEFTqhwkzTOMYhTA+AfeQxAM4r7nK6/Bv1hLQmXwRnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122401; c=relaxed/simple;
	bh=CxvlJ7GeKXcjWy+yJR/D0xskEpTINjozfoR3L3+CxCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9HfTdtrg6OZPapeEQuR5xQuryGPRPfnYopjg57y/PILRGn2j12KqGbl2QpwvwgfeQhaOt8ZqKbLIgweOO5anCf7OPTcqY3iV264pCVuHRbzTMBq6lBkZ2j80Szh0v4m38RXv1a5UOkD5Wmd05q7BnOEtlALKhzZYpUnjDdL39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XgaCSp3l; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7004C44307;
	Tue,  8 Apr 2025 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqLwiEm7D3yyHj0siVsICNmKccrtQmlNqBdEAkGQBz0=;
	b=XgaCSp3lj2MyPBS8nUrrBDgHCwiAx9szrF0oqT4DuyvxD0BxhTzN21GvkWfQdEp43DW7YF
	BwX1yE72fl9DlbCUAoKlbcBtDuPVv2QYr14IbEDQKEn9di8p/jAmweUoiDFir1xoGG/B5W
	f4SylLBR47Qr/RHIsoULxHUhYOqNhhuJ1lbyPNh45CKms9Z25aAfkwSyNuP2PGqDkyesCE
	YWkWaEWYOTAbZv4nfsA4p1FJTh+EkH1YSHoAh3DJpjKAQfx6kNS3QDqVR7xI7TfJ0+79qy
	vukqHV8pUwCAE9r49Gfbc3WNj5MbcSvPRrIKdxmPkY5ZiALZv0dCCZVzwssDKQ==
Date: Tue, 8 Apr 2025 16:26:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: clear interrupts on remove
Message-ID: <20250408142636821de253@mail.local>
References: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/03/2025 11:00:00+0100, Wolfram Sang wrote:
> It is good practice to clear running interrupts before removing the
> driver. This is not really a bugfix because on current systems RuntimePM

This is not completely true, most of the drivers would leave the
interrupt enabled after removing the driver because it can still
power on a device.

> will disable the module clock, so interrupts won't be initiated. The
> dependency on that behaviour is subtle, though. Better be self-contained
> and clean up when removing.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v1: fix build failure by adding the 'rtc' variable. Build
> and tested on Renesas RZ/N1D.
> 
>  drivers/rtc/rtc-rzn1.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index eeb9612a666f..3c2861983ff1 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -444,6 +444,11 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>  
>  static void rzn1_rtc_remove(struct platform_device *pdev)
>  {
> +	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
> +
> +	/* Disable all interrupts */
> +	writel(0, rtc->base + RZN1_RTC_CTL1);
> +
>  	pm_runtime_put(&pdev->dev);
>  }
>  
> -- 
> 2.47.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

