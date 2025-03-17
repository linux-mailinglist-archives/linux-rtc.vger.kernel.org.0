Return-Path: <linux-rtc+bounces-3528-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FDA6514A
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 14:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A10176C16
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D327324166A;
	Mon, 17 Mar 2025 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DQssZf42"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64C4156230;
	Mon, 17 Mar 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218487; cv=none; b=OGKzYf4yjf3ktF7Cg6HvoQ/mxKPWpaRc9/IYEmsAKjbDAV0juwh8x5zR92+V/CP1MqUyiqF51DB785oKLL3SjH0ZrkbTCp0gNbY+0PivMxh22FVIUFOOvC47SY3JNMU4jovQobpu9Iu5f3BbREQhn+fiD1HYL3TiREdsJgjnipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218487; c=relaxed/simple;
	bh=CgszdGGeicl8iIr17lfG9jPPwh40ujTfjKZ3ZY6yZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g51j6yvOLJbMv0DpE1m97UIFy+RoJLQQNZ8g6pHnPiBE2rE2yrZAq6N5iDCi9YE7lwrZvDqjqG4of4urypQPe29DtsjGLjQiAxkGo8QzG0j2KS/c73MmniZVKoOybpzq9pJZ5MeVsbjbs0iSM3Zl/C5Enzas23iFlzye41QFiqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DQssZf42; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE8D9443EE;
	Mon, 17 Mar 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742218483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p089Kuapj5i1IJvwDJhMGH1sE+tEgq9pwXD682PKXmE=;
	b=DQssZf42rNNnb0k6b/qOWY+9eSOCtnoOA+mK0Aaxe0aRB6lc8SBYVe2RZe8CtSp2uxEiID
	SjI6taDZn1UGTrlrp8b2w2ka+evxeNSi1rGDMN31JSg3y58w3cpObfjQpuW48jvBD4GbAz
	UFeM6Lk5PBSbnoZshfRIAy5eXhq2jJkfysqQowb5wgwOrrYi7R9IvVcWN9XLZWIF1JvG2G
	END9hBUYkjpR3di6C6lwva7EkmTRTXxMAHkJvttmyVxT3OJA4Skw9JZvx2t1VnBR++vN5k
	r5KPkk3CtOsidzazo1X5UrKtqml5DZq9jDn+lDDe1dblx7sjoAYWRcPovpoVLw==
Date: Mon, 17 Mar 2025 14:34:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pm8xxx: switch to devm_device_init_wakeup
Message-ID: <20250317133442c86d4728@mail.local>
References: <20250317111312.1518349-1-alexandre.belloni@bootlin.com>
 <Z9gOT5WBaGkBZjl9@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9gOT5WBaGkBZjl9@hovoldconsulting.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehjohhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnodhlihhnrghroheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqm
 hhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 17/03/2025 12:58:07+0100, Johan Hovold wrote:
> On Mon, Mar 17, 2025 at 12:13:11PM +0100, alexandre.belloni@bootlin.com wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
> > is never disabled.
> 
> You should probably mention that this was due to a bad merge. The
> no-alarm patch moved the previous call to device_init_wakeup() into the
> conditional, but you had switched it to use devres so we ended up with
> two calls when you applied the patch.
> 
> Unless you want to and can rebase your tree.
> 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/rtc/rtc-pm8xxx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> > index c6241a0c26e9..70cbac76147b 100644
> > --- a/drivers/rtc/rtc-pm8xxx.c
> > +++ b/drivers/rtc/rtc-pm8xxx.c
> > @@ -647,7 +647,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
> >  		if (rc)
> >  			return rc;
> >  
> > -		device_init_wakeup(&pdev->dev, true);
> > +		devm_device_init_wakeup(&pdev->dev);
> 
> So you need to remove the call to devm_device_init_wakeup() above as
> well (after platform_set_drvdata()) which the no-alarm patch moved here.
> 
> With that fixed:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Right, I fixed my merge instead, thanks!

> 
> >  	} else {
> >  		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
> >  	}
> 
> Johan
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

