Return-Path: <linux-rtc+bounces-2434-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B99B8ECF
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 11:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42EA8B20CBB
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01A015A85A;
	Fri,  1 Nov 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DJV+b/L9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C443A14F9F8;
	Fri,  1 Nov 2024 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456028; cv=none; b=o3/0KZIf8TOk6FqgVpOQU1gz9xgBr7ZUi5nKgYletYEcyt0BkZ0TPaea0eloRKHM+mWWQO6G7stds0smQ3MLCDx40faxprzWChUzbyYlkgaZiwk/CbZcNsX92ByAFf9M+7VbjyKDBBj088BnaoIKYelkW0O29GMt9pN5oyk5shU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456028; c=relaxed/simple;
	bh=e00zWZfVfIqdu2m8FU2GXwtFX+jh2hRaBYAD7fGyLTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J9MuVWZwqZ/GCyzoOdTvkC3rzIAcAD/eeomIVinMeUwwGzHRMeIlmFaAumTcYyTPZOPWafOwjSfYhO7tu7i/bWPf4nMnYCIGtTJRt4lolXYg7g45XBCLZMOQlEEGn7mo+fqUGeck8hkCUzGKUorYr6Xz25twbgjBvIdqulb+9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=DJV+b/L9; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6odttG1kh0BU06odttqAPd; Fri, 01 Nov 2024 11:12:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730455953;
	bh=MqViK48ZOFVhYhDKi1KfVPCJOQdOzhjPPwehrUW3dGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DJV+b/L9NAY8zywsApAlxx8dRKxzG9WWz7/nUZk7guunmhsioH5TYXTdR/3OSCm/k
	 o4XqQsTlcxDtAzavKwlVu27JyGvxG119BwoZNWLa7dEqqOPtzzd/z8OUNHBn3SxhuB
	 2eIaKqZFYzYNHVDXvd5CuyyAqLdgH+iMLoLnDqO7kHCJUdaN/RIm3OYPMs/at7lPTc
	 vmgJRZI/BUcOJlEi7HDRfi1xaTBp+pWUxR6H/DnoXOWeGtGI156l7E5YigUrwuRiwK
	 hhuRGnHVdkGmnRsvIDPForPapYO6WXeF/zVUsQqHQE6wks+LF1ccaTt4h3+lk59lds
	 V2K6Nk5NtPBJQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 01 Nov 2024 11:12:33 +0100
X-ME-IP: 90.11.132.44
Message-ID: <f22fc806-7816-4da9-8cac-a84db22d96fd@wanadoo.fr>
Date: Fri, 1 Nov 2024 11:12:30 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: bbnsm: add remove hook
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Newsgroups: gmane.linux.kernel
References: <20241101101032.1446992-1-peng.fan@oss.nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241101101032.1446992-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/11/2024 à 11:10, Peng Fan (OSS) a écrit :
> From: Peng Fan <peng.fan@nxp.com>
> 
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/rtc/rtc-nxp-bbnsm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> index acbfbeb8b070..fa88fd8ffadf 100644
> --- a/drivers/rtc/rtc-nxp-bbnsm.c
> +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> @@ -206,6 +206,12 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
>   	return devm_rtc_register_device(bbnsm->rtc);
>   }
>   
> +static void bbnsm_rtc_remove(struct platform_device *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);

I think that an error handling path in the probe should also be added 
with such calls.

> +}
> +
>   static const struct of_device_id bbnsm_dt_ids[] = {
>   	{ .compatible = "nxp,imx93-bbnsm-rtc" },
>   	{ /* sentinel */ },
> @@ -218,6 +224,7 @@ static struct platform_driver bbnsm_rtc_driver = {
>   		.of_match_table = bbnsm_dt_ids,
>   	},
>   	.probe = bbnsm_rtc_probe,
> +	.remove_new = bbnsm_rtc_remove,

I think that .remove should be used here instead.
(see 
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/platform_device.h#L240)

>   };
>   module_platform_driver(bbnsm_rtc_driver);
>   

CJ

