Return-Path: <linux-rtc+bounces-4564-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5EB101EA
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 09:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FF7F4E5044
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 07:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFD521504E;
	Thu, 24 Jul 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EgTUmD77"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E61F419B;
	Thu, 24 Jul 2025 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342393; cv=none; b=OqV+xVDChZxPzEYWN1SXSqjPMc1mJa7RlMPZsKQNUUO/MZwtAeD9Y4DiuA+dtEjpSC/5crJIdBVysMzo0vD8YF55TR5ji//NRDiVJuIV7909siFku+ZBYiCgpEpStdUdVMyzmryIu9fdnzArldIEEgD9hU0ng9Jue5QhvYoYXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342393; c=relaxed/simple;
	bh=HIkY12IlKTVwDKn1gBkTSIIgYdsHPofcfg9hwAjBsDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBENhdlllJT22v3eQFQk8USqnbYXLptByMVzyCn1//Rzkmtz9LKdNiGDoTki21rKEtEpOqh+M7fzGN17XJCmmffIzvnpnWLS2UF3m1ObFcjnMb0+oLjtaTT/7d1iWlgq3u+cZa98FJTdokhSDWwJVCCXVNNKgx34zLaYoJoAeng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EgTUmD77; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46ED944488;
	Thu, 24 Jul 2025 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753342389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLEgwA4rqo1rmwDZ78MmfkUsU5LApG+RbCApCL8Metg=;
	b=EgTUmD77LywopPiSSgqO3qxA8RJb2Um21ks1ZtCmQfgd9qztbpuZsotBTqlfUZ3U6qiJH3
	Y1vH9cXAeCyh7iwSYftmN3gYwOr6JIow3qSGtt1tKhT9s3xjoZL3x3Eiw8wbHv8y6DD4pv
	HyrdT633kv2iqQQYzTIbYLf4K5fooNwhfAa4Gw/inSQlhvWoYBOLJOQBHZ2YoHbCjBch2k
	a4eo7tfQJpv+f+PV3SpMmV0xKZcpRUV7nxiUVVLZIjdDD50/hhvprfwNdnIWD2pvUwXWXy
	4XTO9rOgjTxDmgHjiJwfhpERJfLdLU3YVACmtUhPMIQ/coV1oe/3btT461MAsw==
Date: Thu, 24 Jul 2025 09:33:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: twl: Check return value of platform_get_irq()
Message-ID: <20250724073308430368ff@mail.local>
References: <aIGVJ7UV1wzkQ2Bt@pc>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIGVJ7UV1wzkQ2Bt@pc>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepshgrlhgrhhdrthhrihhkihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 24/07/2025 03:06:31+0100, Salah Triki wrote:
> platform_get_irq() may fail, so check its return value and propagate
> the error in case of failure.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/rtc/rtc-twl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
> index e6106e67e1f4..992b3e1347f2 100644
> --- a/drivers/rtc/rtc-twl.c
> +++ b/drivers/rtc/rtc-twl.c
> @@ -224,8 +224,11 @@ static int twl_rtc_alarm_irq_enable(struct device *dev, unsigned enabled)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct twl_rtc *twl_rtc = dev_get_drvdata(dev);
> -	int irq = platform_get_irq(pdev, 0);
> -	int ret;
> +	int irq, ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;

It won't ever fail because we know it already succeeded earlier.

>  
>  	if (enabled) {
>  		ret = set_rtc_irq_bit(twl_rtc,
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

