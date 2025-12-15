Return-Path: <linux-rtc+bounces-5535-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A09CBCC3F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 08:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B12C3002625
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 07:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAEE313278;
	Mon, 15 Dec 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2b9RvOQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A78634F;
	Mon, 15 Dec 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783744; cv=none; b=XsnH3qJ6ULTVoh4gszY/acXHUvLbmT2US/suvcR+6HSwp0T3XM5z7nPgRW7ij9YUiZq0T+Fz5TP25ZrD5JnYzqJLpIQXXn9E/pWHq93kyy86bVAvoiMohBYRyhSUajZl2FAtGRIDxTW2fjBxlYylTH+GoY8pHFe88QoDMQ6Z8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783744; c=relaxed/simple;
	bh=+acBqxMrq6CWcFTVPTL0XBwbI38gJhfbp6LXCHPsn/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgIxt3nGPpyOYzdIBN8YCgQ85R54Ua0VaJd+54RDy+f/p4uyTJdYaRJgg9TCI0iM3eCrsL3CbiSVqas1t9tCEcuLbkQHGPOZ9vq//QmvxdISjut6373WnfTYnJIp0E2BzwXPNf/y4VVcV8G45XJ7DBB8J0vpulq2uD68/piCF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2b9RvOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E58C4CEF5;
	Mon, 15 Dec 2025 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783743;
	bh=+acBqxMrq6CWcFTVPTL0XBwbI38gJhfbp6LXCHPsn/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2b9RvOQZmqZdZdFSgFyEDnssGAjMKvA5qvUCp1UeLcw10rWuoCWZcM4Oi22MOwxG
	 5W3ZZ+1SGOf1UB8cBkjLuGQ/rBoUfo+bGtaZ90PRNX9QO/yUHuIg1DpDX/6jvkV5t2
	 6MF7NAc2ctPeMvPVgNT3NoKHFJ+mBVGMLUfM44+p0aZQw0JgzNN5LXGhjdV4PRDS30
	 ZsEDU3HsRRAf62mLNsljHfit4lQiaffrm1MsjkT1aE1WlWjhtLIAxS6OKCPnSE7CIB
	 tXJIJ06nyUT0dw6pDfFfcBmEZT3P1IHfNcCK8RMA1pq2hAoy30I5IQqm6XOeYez8k/
	 vMtsH6nknJCMg==
Date: Mon, 15 Dec 2025 16:28:58 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	op-tee@lists.trustedfirmware.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/17] rtc: optee: Migrate to use tee specific driver
 registration function
Message-ID: <aT-4usVp-PhNNw7T@sumit-X1>
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

On Thu, Dec 11, 2025 at 06:15:00PM +0100, Uwe Kleine-König wrote:
> The tee subsystem recently got a set of dedicated functions to register
> (and unregister) a tee driver. Make use of them. These care for setting the
> driver's bus (so the explicit assignment can be dropped) and the driver
> owner (which is an improvement this driver benefits from).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/rtc/rtc-optee.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

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

