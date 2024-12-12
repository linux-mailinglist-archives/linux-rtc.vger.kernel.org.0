Return-Path: <linux-rtc+bounces-2725-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCD9EE454
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D54E16751C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64500211490;
	Thu, 12 Dec 2024 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pUE334oG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6D210F62
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999964; cv=none; b=mWIWqBoym5ED5pjsNE5pdQNmoDEDrnzXSQ+gWKs/5UarYlV624IQdjFQl6N7m9EAslIrDB2MPBv4R76xgWNqWdqEdW1CPp+S1B8oQ16Y3TScuN0aDdAb6HdPqoUMESTCB+2pmd+9m7MMCgCYECR7tbacGgS+PVBM8uc2TFzyEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999964; c=relaxed/simple;
	bh=ENnKXnRDs94FQ+SqZcOj0XUjk3S3lgMXy8WwXlM8qQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8hn+9mLhaDTDA4pZG237EVv3wpA+/0puq9RtkNYAfjcG7pg/SX9SspKffScH1cDTsfrvlrcHukyARjSIybxQywhz4cdVXBZdzVZul17ubrAsiVrj2AniqMRfYSsDzsS7mku/y40URpImQqN3INY1dSLJZMEkhC9uwkT6GyPImo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pUE334oG; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7A7BFC2A15
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:35:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5585B40007;
	Thu, 12 Dec 2024 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733999701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSJ5Xk8tQ2M6UA+JwFHKCY1pSoJvo2VrPcSnqBLRIy4=;
	b=pUE334oG9zyVNJHvDIKlawlIUA5K1+hqMqkWv6eJmTRotyDOmw6FN4x5BbckpI7FQNucUf
	MBnB52IBBz8YSffcj4Ndx7X1dZq5xb9K7ksg+oYDoBMKbXKUITslNoo4LNcTqCvGcLdaMy
	fa14xvxP+NmicGy3UIVVJEDQSlxR/2en00QF3rE5MJoTZH0fp9o0/2EySAe17PB/MFa29o
	ouypiB++i30qQ6SMrHnCt9VQ48SNq1eIc/w59Q9AgnxdA5/Ik5JuiDVujF9nIaNL6AJEsJ
	nRw80RyTp/zKdJA/A7STuCiVqc97WXiIdIE0chjhtXHzDo44h4Jt3zHBd8CxXQ==
Date: Thu, 12 Dec 2024 11:34:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: mazziesaccount@gmail.com, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: bd70528: enable the device's wakeup in the last
 step of .probe()
Message-ID: <20241212103459276170c1@mail.local>
References: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/12/2024 19:04:03+0900, Joe Hattori wrote:
> Current code leaves the device's wakeup enabled in the error path of
> .probe(), which results in a memory leak. Call device_init_wakeup() as
> the last step in the .probe() to avoid this leak.

Do you have more info on where the memory is allocated?

Coudln't we have a devm_ version of device_init_wakeup instead?

> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V2:
> - Move the device_init_wakeup() to the last step of the .probe() to make
>   the cleanup simpler.
> ---
>  drivers/rtc/rtc-bd70528.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 954ac4ef53e8..d5cc4993f918 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	device_set_wakeup_capable(&pdev->dev, true);
> -	device_wakeup_enable(&pdev->dev);
> -
>  	rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc)) {
>  		dev_err(&pdev->dev, "RTC device creation failed\n");
> @@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return devm_rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	return 0;
>  }
>  
>  static const struct platform_device_id bd718x7_rtc_id[] = {
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

