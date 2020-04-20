Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1191B0EC0
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2020 16:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgDTOnL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Apr 2020 10:43:11 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7930 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTOnK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Apr 2020 10:43:10 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9db4c10000>; Mon, 20 Apr 2020 07:42:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 07:43:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 Apr 2020 07:43:10 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:10 +0000
Received: from [10.26.73.5] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:08 +0000
Subject: Re: [PATCH 3/3] rtc: max77686: Use single-byte writes on MAX77620
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200417170825.2551367-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6331768f-5d4a-aefb-03f2-5b04d0193440@nvidia.com>
Date:   Mon, 20 Apr 2020 15:43:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417170825.2551367-3-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587393729; bh=rkEWzk13vJOdCYuBxdqwzU8DwSEAOs3BX62D8zlHGDc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WUHWcWTIwQ0h2TZPImSD6rnmHrAejDzENhytJdfrzOhwlVCEkhzQY8wnP4mTAm+Qv
         iUXc7fAOb+n/GGM3uSpgMF45tWMeOUMDJMlg2HCg+t4Pa1b7jTtdaxjVQ5UGD6Fq37
         g39DY1u44FytXyhJnwjov9iWgJmQCoA5MyqfQ/j7T21ZWjhqREEc/2zhl5ahDkG3Tg
         CuSNyHqJGHZvQurmbK2tWSkLDKpiHq7BcPmqJ4RIzXDKgcCdJ316A5I40oAjhmkKbJ
         gwBFD8hQfOc1g1kGsN0/IO24Q1TMA1uneKiiMM1ApFIx98bWLaCPWl72I3ok/dr0n+
         aRPcgzB6f7XSQ==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 17/04/2020 18:08, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/rtc/rtc-max77686.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 35fd74b83626..f53db4d6bead 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -78,6 +78,8 @@ struct max77686_rtc_driver_data {
>  	int			alarm_pending_status_reg;
>  	/* RTC IRQ CHIP for regmap */
>  	const struct regmap_irq_chip *rtc_irq_chip;
> +	/* regmap configuration for the chip */
> +	const struct regmap_config *regmap_config;
>  };
>  
>  struct max77686_rtc_info {
> @@ -182,6 +184,11 @@ static const struct regmap_irq_chip max77686_rtc_irq_chip = {
>  	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs),
>  };
>  
> +static const struct regmap_config max77686_rtc_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
>  static const struct max77686_rtc_driver_data max77686_drv_data = {
>  	.delay = 16000,
>  	.mask  = 0x7f,
> @@ -191,6 +198,13 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
>  	.alarm_pending_status_reg = MAX77686_REG_STATUS2,
>  	.rtc_i2c_addr = MAX77686_I2C_ADDR_RTC,
>  	.rtc_irq_chip = &max77686_rtc_irq_chip,
> +	.regmap_config = &max77686_rtc_regmap_config,
> +};
> +
> +static const struct regmap_config max77620_rtc_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.use_single_write = true,
>  };
>  
>  static const struct max77686_rtc_driver_data max77620_drv_data = {
> @@ -202,6 +216,7 @@ static const struct max77686_rtc_driver_data max77620_drv_data = {
>  	.alarm_pending_status_reg = MAX77686_INVALID_REG,
>  	.rtc_i2c_addr = MAX77620_I2C_ADDR_RTC,
>  	.rtc_irq_chip = &max77686_rtc_irq_chip,
> +	.regmap_config = &max77620_rtc_regmap_config,
>  };
>  
>  static const unsigned int max77802_map[REG_RTC_END] = {
> @@ -658,11 +673,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
>  	return ret;
>  }
>  
> -static const struct regmap_config max77686_rtc_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -};
> -
>  static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>  {
>  	struct device *parent = info->dev->parent;
> @@ -698,7 +708,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>  	}
>  
>  	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
> -						&max77686_rtc_regmap_config);
> +						info->drv_data->regmap_config);
>  	if (IS_ERR(info->rtc_regmap)) {
>  		ret = PTR_ERR(info->rtc_regmap);
>  		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
