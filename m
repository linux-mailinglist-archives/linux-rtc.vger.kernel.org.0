Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8FA1209A5
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 16:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfLPP1U (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 10:27:20 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36277 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbfLPP1U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Dec 2019 10:27:20 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so241825wru.3
        for <linux-rtc@vger.kernel.org>; Mon, 16 Dec 2019 07:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=q3MgqIM7Lebzkf8JO0ojhPzDqiRHLK5vJzUfeZMc1zU=;
        b=zrI8kgBBoboagFSLXfmTf0mbONsvoKKFbRJjR42YqaEaWnlMrQyzcWb1XMd3mJDIDA
         XEZRkQ8P8pAI2TuMYE0eBA7sLbLxsitGBmzo66TAenENXpkSFTIFTH0BiQJz45X9zJoE
         H4pmwfVFQeaforibR4y0VCfdsHWTqBW+kukg7d1cOXYSeCS7D/lHY2Uhncb2P8QqzA70
         QSUUf4iuWxxGW1iyZsIULB6RumULY/boFuV9T8RrnUAG3Ab1ce71ZAZH6Wte3H9d3TUM
         oKjbW/zgqasVXHvbr6TC5orVS8GePjn2BhNh9z4+f09Xp+aUnWtHm6yqFLV/d/iNoCV9
         h5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=q3MgqIM7Lebzkf8JO0ojhPzDqiRHLK5vJzUfeZMc1zU=;
        b=fKGFZAjhWVkzR9GqF22a2wSxHawNKJCEXs/Hx7TgahWaKD6yIUzMpiPpPfHeoCGs7u
         vL4wahbYpoRFn3L+GEqphNfkfs70T8wwquBuPRY0dTIn/JR8X9dQme+lTh4r1te+R704
         qim9oSBVzPaNVIEoCXns+cBr3hISaa2D/xFRVy7Ceet2+18B+FtfCLvImOkGRjlAHcYQ
         l1yh227Re4U73pUwj9mal5MD0JdYXNykYVKO/qRFtCS/D2CzQLSWKCieJR1QhrS9Tag5
         TY2+TWEzZIs4Rjbk7R/oWLk5PlUChL5zAyT5KCU4cpFxxBzFUxumvpCSwA/yrRvxdhpJ
         wQIQ==
X-Gm-Message-State: APjAAAUS+Uuo7N61bOqr8JXIxbegC4hdDkcac6sLBQtoSuAloPr2VNze
        1+MWG2ND+Pz+clLWpHT81CySUg==
X-Google-Smtp-Source: APXvYqzUTemS2PAuC/RnjCOMgKkGPqFGklDx/Gs//sa0fLFQ2EuYXh0JOOt4jLFQ6QC7CwPooTMy4g==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr30708752wrx.153.1576510037406;
        Mon, 16 Dec 2019 07:27:17 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id o66sm17974890wmo.20.2019.12.16.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 07:27:16 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:27:15 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 2/5] mfd: rn5t618: add IRQ support
Message-ID: <20191216152715.GH2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
 <20191211215409.32764-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211215409.32764-3-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Dec 2019, Andreas Kemnade wrote:

> This adds support for IRQ handling in the RC5T619 which is required
> for properly implementing subdevices like RTC.
> For now only definitions for the variant RC5T619 are included.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v4:
> merge rn5t618-irq.c into rn5t618.c
> use macros for IRQ table
> 
> Changes in v3:
> alignment cleanup
> 
> Changes in v2:
> - no dead code, did some more testing and thinking for that
> - remove extra empty lines
>  drivers/mfd/Kconfig         |  1 +
>  drivers/mfd/rn5t618.c       | 88 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h | 15 ++++++++
>  3 files changed, 104 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae24d3ea68ea..522e068d0082 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1057,6 +1057,7 @@ config MFD_RN5T618
>  	depends on OF
>  	select MFD_CORE
>  	select REGMAP_I2C
> +	select REGMAP_IRQ
>  	help
>  	  Say yes here to add support for the Ricoh RN5T567,
>  	  RN5T618, RC5T619 PMIC.
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index da5cd9c92a59..76d997c0cfe4 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -8,6 +8,8 @@
>  
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
> @@ -45,9 +47,63 @@ static const struct regmap_config rn5t618_regmap_config = {
>  	.cache_type	= REGCACHE_RBTREE,
>  };
>  
> +static const struct regmap_irq rc5t619_irqs[] = {
> +	REGMAP_IRQ_REG(RN5T618_IRQ_SYS, 0, BIT(0)),
> +	REGMAP_IRQ_REG(RN5T618_IRQ_DCDC, 0, BIT(1)),
> +	REGMAP_IRQ_REG(RN5T618_IRQ_RTC, 0, BIT(2)),
> +	REGMAP_IRQ_REG(RN5T618_IRQ_ADC, 0, BIT(3)),
> +	REGMAP_IRQ_REG(RN5T618_IRQ_GPIO, 0, BIT(4)),
> +	REGMAP_IRQ_REG(RN5T618_IRQ_CHG, 0, BIT(6)),
> +};
> +
> +static const struct regmap_irq_chip rc5t619_irq_chip = {
> +	.name = "rc5t619",
> +	.irqs = rc5t619_irqs,
> +	.num_irqs = ARRAY_SIZE(rc5t619_irqs),
> +	.num_regs = 1,
> +	.status_base = RN5T618_INTMON,
> +	.mask_base = RN5T618_INTEN,
> +	.mask_invert = true,
> +};
> +
>  static struct rn5t618 *rn5t618_pm_power_off;
>  static struct notifier_block rn5t618_restart_handler;
>  
> +int rn5t618_irq_init(struct rn5t618 *rn5t618)

Static?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
