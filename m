Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3CB6225D0
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Nov 2022 09:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiKIIuo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Nov 2022 03:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKIIun (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Nov 2022 03:50:43 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2C21789C
        for <linux-rtc@vger.kernel.org>; Wed,  9 Nov 2022 00:50:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a29so6109786lfj.9
        for <linux-rtc@vger.kernel.org>; Wed, 09 Nov 2022 00:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3EQMmOf6u9ACXGswA3bu082sYHDO4D/BwB6U27ApGs=;
        b=bY+qnc6zdmnPt9ShQMzlKoP2tUnMJdnn8NJL6XXmiNXa+J9gmXZIkmGu8Fluz23FkS
         /OfkVnrFUn/ukFu8aMtOxNme3UO7/J1Qt/iDksuACh2ntlE1zFVhgglpssGV10eHNWEF
         zkeFivDMkXQFbjj7Oc1jTXA5kF9qWA+mcOO/EuTPipec9gawuvLCEtr4lH8upq2Ef2VX
         lFcVhW3kHxVr/gzcjYEWYC/NyQZJAB487JocVB0mCSTD6VvDPBSwFj0WSHOEhkGkrWzj
         /K3t0ydEnKmye5J2EvXYGeVAvHymb8MgbZRrP+n86J8SHteoH3+dhCv7gKkuLQKHFCam
         wmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3EQMmOf6u9ACXGswA3bu082sYHDO4D/BwB6U27ApGs=;
        b=8M2lqhZwNSqiJ6wfSNmZJz7gJTufxgBV6ZGIAL6J6EtsSnOdRzzIcE83Gykd4L20xE
         Irg/+TmeINxVNvmRCIZx+8vk/8B97Xj+NyIbH+/mYTWMb1kDXpLP5qllCvmlrgrTjYtT
         rDuW9TSdqFf/3O377ajB7M6cJT8MNnHG5wlawahXVPxTHsqZT24YOMpLyOoy9LwDU8vg
         SxWr70pvMNqlKFqoDdU935QEV1LfpGrOsSNLc61wXbBapXj6FweZFxS/79LQf236B/0b
         zskrFFzHJyCF0qkICs76o8fjZUNlEIN0L1JpscvXq0LTEwOlFIWKUauydrRM27DWB5B4
         GM9Q==
X-Gm-Message-State: ACrzQf3U/sKSy+GI3jbeX/xGfCbGNQ9EKHwKcJa2EVSJ25O/9fJMqoKX
        hsDumGZL5n3/HwI8jKFkipHfDg==
X-Google-Smtp-Source: AMsMyM7+cIg5un+3Int5TRgbTckV1Sexrv8P+mYFfomKJUqU+HT6aXsLD7pB4qu9mM0h6gQ9TPKv6A==
X-Received: by 2002:a19:ca08:0:b0:4a2:8b07:999c with SMTP id a8-20020a19ca08000000b004a28b07999cmr22298068lfg.455.1667983840252;
        Wed, 09 Nov 2022 00:50:40 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e9b18000000b0026bf0d71b1esm2043162lji.93.2022.11.09.00.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:50:39 -0800 (PST)
Message-ID: <b0153383-0bc4-aeda-6df4-c76d682d4cfc@linaro.org>
Date:   Wed, 9 Nov 2022 09:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, brgl@bgdev.pl, lee@kernel.org,
        linus.walleij@linaro.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, vigneshr@ti.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
 <20221109065546.24912-5-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109065546.24912-5-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/11/2022 07:55, Matt Ranostay wrote:
> Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> configured as input or outputs.
> 
> Tested-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  drivers/gpio/Kconfig         |   7 ++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-tps6594x.c | 142 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tps6594x.h |   6 ++
>  4 files changed, 156 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tps6594x.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8c756cb29214..0225e6bddf0a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1405,6 +1405,13 @@ config GPIO_TPS65912
>  	help
>  	  This driver supports TPS65912 GPIO chip.
>  
> +config GPIO_TPS6594X
> +	tristate "TI TPS6594X GPIO driver"
> +	depends on MFD_TPS6594X

Maybe || COMPILE_TEST?

> +	help
> +	  Select this option to enable GPIO driver for the TPS6954X
> +	  PMIC chip family. There are 11 GPIOs that can be configured.
> +

(...)

> +
> +static int tps6594x_gpio_probe(struct platform_device *pdev)
> +{
> +	struct tps6594x *tps = dev_get_drvdata(pdev->dev.parent);
> +	struct tps6594x_gpio *gpio;
> +
> +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);

and here you did it correctly... I don't get why your two patches differ.

> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	gpio->tps = dev_get_drvdata(pdev->dev.parent);
> +	gpio->gpio_chip = template_chip;
> +	gpio->gpio_chip.parent = tps->dev;
> +
> +	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
> +}
> +
> +static const struct of_device_id of_tps6594x_gpio_match[] = {
> +	{ .compatible = "ti,tps6594x-gpio", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_tps6594x_gpio_match);
> +
> +static struct platform_driver tps6594x_gpio_driver = {
> +	.driver = {
> +		.name = "tps6594x-gpio",
> +		.of_match_table = of_match_ptr(of_tps6594x_gpio_match),

Drop of_match_ptr(). It comes with maybe_unused, which you do not have here.

Best regards,
Krzysztof

