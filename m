Return-Path: <linux-rtc+bounces-5548-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827BCBD650
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 11:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D42E300D907
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCBF3168E4;
	Mon, 15 Dec 2025 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b/iVlkhq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE127227599;
	Mon, 15 Dec 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795326; cv=none; b=p6aARtkrdGU6gijpjd96qQssKp+CpbDiKLf9rZJRrcmQn0KYjRUz/X2bksamPtklSOHLI9DwFT7RNuPkjR0Y8YvexlUbZ2rhuRE3EL4kUTQNUtVoiMAsCAQ9FNxnkZ7gVX+RCzb7pc4R0guIsuhxnCQW3Tut+5AWyzji5BdemNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795326; c=relaxed/simple;
	bh=1ROjGf/hsTf0lhC3w/5rY8hx2rynx3949E5ZtD6gekY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra0kjbkxb9SUdnpIcUlt3KMNP0HCyde3tWA9sBJBbl9r75NmbrSRo1fHqHc1GhdyAV5bjYuCliDWRboNs/F7g5UEErf0MDNEMHa/ndX5V6Tk0euN7JmXyX2MnpQgGhRwDdNeSMvOdsd6zsZPRds6vF2C4LXREG+oc24FY0YeSVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b/iVlkhq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7F063C19D15;
	Mon, 15 Dec 2025 10:41:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D764D60664;
	Mon, 15 Dec 2025 10:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8998511941C6F;
	Mon, 15 Dec 2025 11:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765795309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EUBV6XSQpX1AofrFO8TKRN3vjQObFhvyS/Q6s52icVw=;
	b=b/iVlkhqa6DufO+mHtMb971AG3039Ptu5Xc+nyaBEScChO/NPquLSNONryRngqJFD2WZP0
	pzqy8pVV4dw+POe66rZLCpPUkbLXxiwZ3aXecRDodt9h5XDTY1yzV0LE2w4goZCd8fAHiY
	8zVmEoAU7ZanSrQDDNj0hu6s6Hddz6cIDJtK+Afjpil5MMq+j29h10fALy4J5TSF04qEXM
	n8TfM0rtozRTCoWSTtQoBcf3z8J5ng6zdEmBuLI2eMyYmnLG4ARMNSEaorIQE/3ywIiUVe
	XnLAizzyVvVkmc8T+0UQoBdqYRXsGzWGPPhStjrLK3samR6QXkFuzjjn5HbMlQ==
Date: Mon, 15 Dec 2025 11:41:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/17] rtc: optee: Migrate to use tee specific driver
 registration function
Message-ID: <202512151041471a0eabfc@mail.local>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <a586934215a4971f9920398655cb85fd29d91c9f.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a586934215a4971f9920398655cb85fd29d91c9f.1765472125.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3

On 11/12/2025 18:15:00+0100, Uwe Kleine-König wrote:
> The tee subsystem recently got a set of dedicated functions to register
> (and unregister) a tee driver. Make use of them. These care for setting the
> driver's bus (so the explicit assignment can be dropped) and the driver
> owner (which is an improvement this driver benefits from).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-optee.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
> index 184c6d142801..f924a729ead0 100644
> --- a/drivers/rtc/rtc-optee.c
> +++ b/drivers/rtc/rtc-optee.c
> @@ -726,25 +726,13 @@ static struct tee_client_driver optee_rtc_driver = {
>  	.id_table	= optee_rtc_id_table,
>  	.driver		= {
>  		.name		= "optee_rtc",
> -		.bus		= &tee_bus_type,
>  		.probe		= optee_rtc_probe,
>  		.remove		= optee_rtc_remove,
>  		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
>  	},
>  };
>  
> -static int __init optee_rtc_mod_init(void)
> -{
> -	return driver_register(&optee_rtc_driver.driver);
> -}
> -
> -static void __exit optee_rtc_mod_exit(void)
> -{
> -	driver_unregister(&optee_rtc_driver.driver);
> -}
> -
> -module_init(optee_rtc_mod_init);
> -module_exit(optee_rtc_mod_exit);
> +module_tee_client_driver(optee_rtc_driver);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Clément Léger <clement.leger@bootlin.com>");
> -- 
> 2.47.3
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

