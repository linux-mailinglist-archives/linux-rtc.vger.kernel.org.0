Return-Path: <linux-rtc+bounces-1684-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA1959A92
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7270E1F2125B
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99E41CE706;
	Wed, 21 Aug 2024 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HE0Nznir"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296E1B5EDF;
	Wed, 21 Aug 2024 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239635; cv=none; b=m8AwEIw5ZL/4vzzPEshXjay4MT/hlQ604yNpnaeRUuD2Ru7zbXlH0jjw0p0tWmUJWBxfDMO0xeaHhbyl5ylUs6Xk3nfCy7Z5DGRbYXlfMDhX2s26Y8i+c21OZfmqxirHmimnS7yiDKbWIfXy1EAtCRJAMCCCs1xNkQ63Zm+0dlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239635; c=relaxed/simple;
	bh=RIgj+fxLvUgks5CiRU4J+CoV6zVmwErlvHsS5aOLdoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DN0CFYXzGCZYyBcmgkseAv7+WaCcoe92PrE9avNRqf3WYaqYc9n7xC9WfCBElx2jCckG0BfaQPTgl3CSgBMz8j5XTYbiPgGxAAmIGy1AFCWk5/NGg/7eMFaoxVHbmR1s/qcbXSHYIxAia/Xe6mot/tkOEtlU3BfLjRQNc3a0pzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HE0Nznir; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gjUdsanWW80YWgjUdsjbK7; Wed, 21 Aug 2024 13:27:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724239632;
	bh=Z7iKeS1dBxPOkTQrH4RWH+c56keCzZSNCP2umVxwGxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HE0NznirUpAPo5Cb3JtQI3R/ABvSFij5udG0mmok5Xz+HwJ0iDP7WYzWF5cefYdNs
	 i23lZgyO67bRFCBRzfzrasZyVq7XAsdmSMfTncNzHliRW+tCw1hNzDzpUqF9wFrEKZ
	 zX9xWctxhreAkV8sLUR4Ax5jQQEXFYKc1rrJDOtECnYwU4VsmA+kLx4JT5rDem37Yc
	 QredvfStAffhL5MLGzFt9rURtuwnr4B4v8vZOnj7vEFvbgPJrQUn9URlCoV+k8q6ZP
	 Wnia02adXUEhmY0zCEjc/zfDZeNIAIcTit5+EsPmaJucLVjGGP264Cyx5OXm3vYvau
	 DIDw7EwR16uTg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 13:27:12 +0200
X-ME-IP: 90.11.132.44
Message-ID: <303d0b93-f6b7-44f0-a61a-fc8e558b1173@wanadoo.fr>
Date: Wed, 21 Aug 2024 13:27:11 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240821092846.20138-1-liaoyuanhong@vivo.com>
 <20240821092846.20138-6-liaoyuanhong@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821092846.20138-6-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 11:28, Liao Yuanhong a écrit :
> Use devm_clk_get_enabled() instead of clk functions in rtc-sa1100.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/rtc/rtc-sa1100.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> index 0b2cfa8ca05b..2e72daa6a152 100644
> --- a/drivers/rtc/rtc-sa1100.c
> +++ b/drivers/rtc/rtc-sa1100.c
> @@ -177,15 +177,12 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
>   
>   	spin_lock_init(&info->lock);
>   
> -	info->clk = devm_clk_get(&pdev->dev, NULL);
> +	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);

Hi,

the clk field in struct sa1100_rtc could also be easily removed now.

CJ

>   	if (IS_ERR(info->clk)) {
>   		dev_err(&pdev->dev, "failed to find rtc clock source\n");
>   		return PTR_ERR(info->clk);
>   	}
>   
> -	ret = clk_prepare_enable(info->clk);
> -	if (ret)
> -		return ret;
>   	/*
>   	 * According to the manual we should be able to let RTTR be zero
>   	 * and then a default diviser for a 32.768KHz clock is used.
> @@ -206,10 +203,8 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
>   	info->rtc->range_max = U32_MAX;
>   
>   	ret = devm_rtc_register_device(info->rtc);
> -	if (ret) {
> -		clk_disable_unprepare(info->clk);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	/* Fix for a nasty initialization problem the in SA11xx RTSR register.
>   	 * See also the comments in sa1100_rtc_interrupt().
> @@ -305,7 +300,6 @@ static void sa1100_rtc_remove(struct platform_device *pdev)
>   		spin_lock_irq(&info->lock);
>   		writel_relaxed(0, info->rtsr);
>   		spin_unlock_irq(&info->lock);
> -		clk_disable_unprepare(info->clk);
>   	}
>   }
>   


