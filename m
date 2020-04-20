Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB7C1B0EB9
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2020 16:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgDTOmx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Apr 2020 10:42:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1048 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTOmx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Apr 2020 10:42:53 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9db47a0000>; Mon, 20 Apr 2020 07:40:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 07:42:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 Apr 2020 07:42:52 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:42:52 +0000
Received: from [10.26.73.5] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:42:50 +0000
Subject: Re: [PATCH 2/3] rtc: max77686: Make wakeup support configurable
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200417170825.2551367-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <03086f6b-012b-67ab-6a61-fbae1bf0c3c7@nvidia.com>
Date:   Mon, 20 Apr 2020 15:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417170825.2551367-2-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587393658; bh=yn3vUFGEeKaSbo89hQOh0JOD4JoXvUZWh0Hn+nfcebA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=YoHC+xSm7fcf9pCljcNNHfhhJPIsBavuwb36Om0l229okW8gmTlCCxuWYQwNOtFI/
         JYd8IebIAUNEAL+QHM5ikslfpPZg/qCcRFIpS1HOIMqC2+S9RAWyh5s7tsADrr3VLS
         Z0r5o/xEeqZF6sBc6N6ROV+0xunwXc9eyaXoOpnRF56nh9dPOu1IhR/UPMtT3InlUC
         XYaG4esYbscR0t9W7VBcvHn/Y+P2yJPXHXvoblyNIWYr7XWep8Sq1lArR5SuP6ITll
         DLUqh7ugaYgfqoGlo+4IA8Gk3IZ1Qg+Kg+Rbp8wycBaxCvYtcRCr3Lc5D7FhDJ5KnD
         xE35upR4Lcn3w==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 17/04/2020 18:08, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use the standard "wakeup-source" device tree property to determine if
> the RTC can act as a wakeup source for the system. Note that the driver
> by default always assumes that the RTC can act as a wakeup source, but
> whether it can really do so or not always depends on how it is hooked
> up.
> 
> In order to preserve backwards compatibility with older device trees,
> only parse the "wakeup-source" property when a device tree node was
> associated with the RTC device. This doesn't typically happen because
> the top-level MFD driver doesn't list any compatible strings that can
> be used to map child nodes to child devices. As a fallback, check if a
> child node named "rtc" exists and use that instead.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Note that we could obviously add support to the MFD driver to match
> subdevices to their device tree nodes by compatible string, but there
> are side-effects, such as the driver core complaining about the lack
> of a DMA mask for these devices. That in turn could also be fixed but
> it ends up all being rather hacky, so just looking up a child node by
> name seems like a good compromise, especially since there are already
> such subnodes for some of the other subdevices of this PMIC.
> ---
>  drivers/rtc/rtc-max77686.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d5a0e27dd0a0..35fd74b83626 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -722,6 +722,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  {
>  	struct max77686_rtc_info *info;
>  	const struct platform_device_id *id = platform_get_device_id(pdev);
> +	struct device_node *np = of_node_get(pdev->dev.of_node);
> +	bool wakeup = true;
>  	int ret;
>  
>  	info = devm_kzalloc(&pdev->dev, sizeof(struct max77686_rtc_info),
> @@ -746,7 +748,21 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  		goto err_rtc;
>  	}
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	/*
> +	 * Only check for the wakeup-source property if there's an actual
> +	 * device tree node for the RTC. If no device tree node had been
> +	 * attached during device instantiation, try looking up the "rtc"
> +	 * child node of the parent's device tree node.
> +	 */
> +	if (!np && pdev->dev.parent->of_node)
> +		np = of_get_child_by_name(pdev->dev.parent->of_node, "rtc");
> +
> +	if (np) {
> +		wakeup = of_property_read_bool(np, "wakeup-source");
> +		of_node_put(np);
> +	}
> +
> +	device_init_wakeup(&pdev->dev, wakeup);
>  
>  	info->rtc_dev = devm_rtc_device_register(&pdev->dev, id->name,
>  					&max77686_rtc_ops, THIS_MODULE);
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
