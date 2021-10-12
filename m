Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF4429FA3
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 10:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhJLIWG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 04:22:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53700
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234611AbhJLIWF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 04:22:05 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 759463FFF1
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634026803;
        bh=YgBOoBE6WBJkZpoEedU4v+wo/4fFb7GNdHb9LPdBNRo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=BGs++jO/vuCh5StZVLRWBTmKB37QPS5q+A4+htnD5gPqDRl4sJO7y238yUZOs5vSq
         WVPZKXNiSc7gwUjKKJiTDujtlTsew2bC8PyDjQKybiZeAXy7wIyTV3LXwLjUJyQNpO
         XPmTvNbrrYMsb7tomPEzMKfdGTKx6+D3r5WYDv3fBTkGoMBLdXtnw1CC5WGZ/4s5YS
         2l5Exv+ayVcluw+yMyc/x7e4maVInxu/1IFz85WTYQAMt3XTiuSwPMZ2rILyd+It/i
         rKmFWW2XXO8J/ErP/Yk1VgzltrsBdcjtAzb2B25Gda+OfXMMrOEUwQMDV6j/ldP0Sx
         9xyM2jaahEzkQ==
Received: by mail-lf1-f70.google.com with SMTP id br42-20020a056512402a00b003fd94a74905so3055738lfb.7
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 01:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YgBOoBE6WBJkZpoEedU4v+wo/4fFb7GNdHb9LPdBNRo=;
        b=BAUOvZJHAo9/DLhURzfZ3jYgqsjjFqOfh7cQoOKHIRXTkmtKSxDDW3ceYncmcGp8fU
         +62vraSOzMczAg+YsoLHgIV8/AjBn/Um1uAxVjnWO9vKChOAuH5rvfWIRlpLnrn5rmzs
         pwtDR8jBM26u/Iao68r1u7vuQtLtqR7vvCEDsd0/E99kX31O8d9A1mq+AH27iHW0QbV0
         QMVkhK3ocjeMfIgDBzsIhcbmorr6DelT896GRJEd8l+Sr7I5z/VYswyvc7zRKG9jxrOZ
         +o3moXjAcC8rBYOl3aPvnnDEdhvYOApGgVrSauU6tySc/oeesqRgTe6G5qZn/FchUFMY
         5ltQ==
X-Gm-Message-State: AOAM531UqdurGIOln+3rfH1Uq8VpwKeecy+6E4mYGllEZ8eB1x14XS06
        izc6doQsehq1K3t/2FSzmxGJGfz7BpHWBhYX7QKz6aX7JfR0/jtdbF7enj7tGyCizfuc16p0g8v
        +J1EoLYApfnBtpm8HVOns24TrGK/IZmBkk5yleA==
X-Received: by 2002:a05:6512:36d0:: with SMTP id e16mr32049883lfs.562.1634026802678;
        Tue, 12 Oct 2021 01:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5nt1J/J3Tg2BYl7rjsgFihnOVidqeHI1J8sLxUySVlB5v/ZHqHtnXrW819/CHMQt6T+AsOA==
X-Received: by 2002:a05:6512:36d0:: with SMTP id e16mr32049866lfs.562.1634026802484;
        Tue, 12 Oct 2021 01:20:02 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4sm962512lfr.43.2021.10.12.01.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:20:02 -0700 (PDT)
Subject: Re: [PATCH 8/8] rtc: max77686: add MAX77714 support
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-9-luca@lucaceresoli.net>
 <6d7fd095-948a-c5a7-e53a-422fe33fec57@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6af6de2c-673f-3405-6ac4-8b4c842ce9f1@canonical.com>
Date:   Tue, 12 Oct 2021 10:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6d7fd095-948a-c5a7-e53a-422fe33fec57@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 18:12, Luca Ceresoli wrote:
> Hi,
> 
> see below for the issues with interrupt implementation that I mentioned
> in the cover letter.
> 
> On 11/10/21 17:56, Luca Ceresoli wrote:
>> The RTC included in the MAX77714 PMIC is very similar to the one in the
>> MAX77686. Reuse the rtc-max77686.c driver with the minimum required changes
>> for the MAX77714 RTC.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  drivers/rtc/Kconfig        |  2 +-
>>  drivers/rtc/rtc-max77686.c | 24 ++++++++++++++++++++++++
>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index e1bc5214494e..a73591ad292b 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -375,7 +375,7 @@ config RTC_DRV_MAX8997
>>  
>>  config RTC_DRV_MAX77686
>>  	tristate "Maxim MAX77686"
>> -	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
>> +	depends on MFD_MAX77686 || MFD_MAX77620 || MFD_MAX77714 || COMPILE_TEST
>>  	help
>>  	  If you say yes here you will get support for the
>>  	  RTC of Maxim MAX77686/MAX77620/MAX77802 PMIC.
>> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
>> index 9901c596998a..e6564bc2171e 100644
>> --- a/drivers/rtc/rtc-max77686.c
>> +++ b/drivers/rtc/rtc-max77686.c
>> @@ -19,6 +19,7 @@
>>  
>>  #define MAX77686_I2C_ADDR_RTC		(0x0C >> 1)
>>  #define MAX77620_I2C_ADDR_RTC		0x68
>> +#define MAX77714_I2C_ADDR_RTC		0x48
>>  #define MAX77686_INVALID_I2C_ADDR	(-1)
>>  
>>  /* Define non existing register */
>> @@ -203,6 +204,28 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
>>  	.regmap_config = &max77686_rtc_regmap_config,
>>  };
>>  
>> +static const struct regmap_irq_chip max77714_rtc_irq_chip = {
>> +	.name		= "max77714-rtc",
>> +	.status_base	= MAX77686_RTC_INT,
>> +	.mask_base	= MAX77686_RTC_INTM,
>> +	.num_regs	= 1,
>> +	.irqs		= max77686_rtc_irqs,
>> +	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs) - 1, /* no WTSR on 77714 */
>> +};
>> +
>> +static const struct max77686_rtc_driver_data max77714_drv_data = {
>> +	.delay = 16000,
>> +	.mask  = 0x7f,
>> +	.map   = max77686_map,
>> +	.alarm_enable_reg = false,
>> +	.rtc_irq_from_platform = false,
> 
> As far as I could understand, rtc_irq_from_platform should be 'true'.
> This would trigger the 'if' branch in function
> max77686_init_rtc_regmap() [0]:
> 
>   if (info->drv_data->rtc_irq_from_platform) {
> 	struct platform_device *pdev = to_platform_device(info->dev);
> 
> 	info->rtc_irq = platform_get_irq(pdev, 0);
> 	if (info->rtc_irq < 0)
> 		return info->rtc_irq;
>   } else {
> 	info->rtc_irq =  parent_i2c->irq;
>   }
> 
> Calling platform_get_irq() seems correct for the MAX77714, which can
> generate various IRQ events, collecting them in a register, and raise a
> single IRQ to the CPU via a physical pin.
> 
> However, if I set rtc_irq_from_platform = true, platform_get_irq()
> returns IRQ number '1', which ends up in:
> 
>   dummy 0-0048: Failed to request IRQ 1 for max77714-rtc: -22
>   max77686-rtc max77714-rtc: Failed to add RTC irq chip: -22
>   max77686-rtc: probe of max77714-rtc failed with error -22
> 
> I compared my code with other MFD drivers and their cell drivers (but
> their datasheets is not available so I had to add some guesswork), and
> couldn't find out where my code is wrong.
> 
> Unfortunately I have no IRQ access on my board (and I don't need them
> for my use case). For this reason I initially thought of disabling all
> the IRQ code in rtc-max77686.c via a new flag, but it would be quite
> invasive and I wouldn't even be able to test that existing hardware
> still works. Implementing a new RTC driver for the MAX77714 does not
> seem to be a sane option as the hardware is really 99% equal to the
> MAX77686 RTC.
> 

I think the flag should be false, not true. The true means you have RTC
device with its own interrupt. For example in DT it could look like:

  pmic@1c {
      compatible = "maxim,max77714";
      reg = <0x1c>;
      interrupt-parent = <&gpio2>;
      interrupts = <3 IRQ_TYPE_LEVEL_LOW>;

      interrupt-controller;
      #interrupt-cells = <2>;
   };

   rtc@48 {
      compatible = "maxim,max77714-rtc";
      reg = <0x48>;
      interrupt-parent = <&gpio2>;
      interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
   };

In your case, the RTC device will not have its own devicetree node and
will be instantiated as MFD child device. The only interrupt line
available is the parents interrupt line - the same as in max77686 and
max77802 setups.

Have in mind that this does not necessarily reflect real HW, but how we
represent it in devicetree and driver model.

Best regards,
Krzysztof
