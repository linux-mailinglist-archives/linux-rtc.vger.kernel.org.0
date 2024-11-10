Return-Path: <linux-rtc+bounces-2485-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4839C3516
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A25C2816E9
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE83158868;
	Sun, 10 Nov 2024 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lqUCZOvm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E07149011;
	Sun, 10 Nov 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731277972; cv=none; b=MmX2fvfWAkAwi49j7gSMf5vo2tbHEtJYfej5lM1Ezni3hIWbvtrJp7xEISZ5khnQPrC0yRKxnE8x9tzoH2KwWSQBg3vyMBiFe4jGCPLj9UIdTiTpOiqkB/Kn+nRvnWk04IlEQTIft2pSwl0cR0JlJKwcG7bDA+GDHDBiGEEwGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731277972; c=relaxed/simple;
	bh=8Y02PEzpRcYroGsKozdZ4KCvQKxfAWVE/c3L3FdFJi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR2PLOuFE19td01zO8lK7cBkGwj63IPF+C39NXuEkNFjMIbS3BH32uPzGzOqyEYQv3bl9I0EL6DCS5THHIXsHKG2x+4z5msE9sAV7bUqJP2BJfVUfgr6u5e2kUJ98YIEXFmrgdcQhHzu1iOyffolVtCfJk7hmTypo5oW8m24qAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lqUCZOvm; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59817C0002;
	Sun, 10 Nov 2024 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731277962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vs5++IMDesvG2eeYFv4ijGbvd37PHXUsHPfdu3xHjM=;
	b=lqUCZOvmxLstRYXfLfriyzboiwzvX6qN6fXeRKOC6IHmg6e7mSXUN3RV8ZaVrYxSr9sKz7
	acFX4jwFoW/0rPXPbuZzP7BB88kJvDu+MAbKvxe+u1rDARJBfWprzKKA/XtnOXFjlfYkCy
	Jp/WR5PwwsWuwjXGsqqKnMoUW1EgaF2yxq6gk5k0nn7jQ3Ss56Dr3hM7J96CiaJ7kHtVcK
	q6b/kAT191H7W+PUvkoMfqP2RvwyySUGrHy3nmn8mtQoqGSN6XdaJzcnhsvT9EowoyR7Ks
	q0JXicPm/fMnpJOCHqpex7yPnn/VOtClgrQEXghN9k+09FkZ3b+BVUoKLdfGhQ==
Date: Sun, 10 Nov 2024 23:32:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH V2] rtc: bbnsm: add remove hook
Message-ID: <202411102232429e48d10c@mail.local>
References: <20241104031512.3474790-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104031512.3474790-1-peng.fan@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/11/2024 11:15:12+0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Per Christophe JAILLET
>   Use remove, not remove_new
>   Fix error handling in probe
> 
>  drivers/rtc/rtc-nxp-bbnsm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> index acbfbeb8b070..31225baddadf 100644
> --- a/drivers/rtc/rtc-nxp-bbnsm.c
> +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> @@ -197,13 +197,30 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
>  			bbnsm->irq, ret);
> -		return ret;
> +		goto err;
>  	}
>  
>  	bbnsm->rtc->ops = &bbnsm_rtc_ops;
>  	bbnsm->rtc->range_max = U32_MAX;
>  
> -	return devm_rtc_register_device(bbnsm->rtc);
> +	ret = devm_rtc_register_device(bbnsm->rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register rtc :%d\n", ret);

No extra error message, all the failing paths of
devm_rtc_register_device already have one.

> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +	return ret;
> +}
> +
> +static void bbnsm_rtc_remove(struct platform_device *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
>  }
>  
>  static const struct of_device_id bbnsm_dt_ids[] = {
> @@ -218,6 +235,7 @@ static struct platform_driver bbnsm_rtc_driver = {
>  		.of_match_table = bbnsm_dt_ids,
>  	},
>  	.probe = bbnsm_rtc_probe,
> +	.remove = bbnsm_rtc_remove,
>  };
>  module_platform_driver(bbnsm_rtc_driver);
>  
> -- 
> 2.37.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

