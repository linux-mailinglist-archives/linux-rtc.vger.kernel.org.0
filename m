Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA5142F88C
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 18:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241538AbhJOQsR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 12:48:17 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40184 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234519AbhJOQsP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 12:48:15 -0400
Received: from [77.244.183.192] (port=62394 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mbQLO-0059Hy-Gd; Fri, 15 Oct 2021 18:46:06 +0200
Subject: Re: [PATCH 8/8] rtc: max77686: add MAX77714 support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
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
 <6af6de2c-673f-3405-6ac4-8b4c842ce9f1@canonical.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <c64f79c8-7928-3243-265f-8536ed2aaf10@lucaceresoli.net>
Date:   Fri, 15 Oct 2021 18:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6af6de2c-673f-3405-6ac4-8b4c842ce9f1@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 12/10/21 10:20, Krzysztof Kozlowski wrote:
> On 11/10/2021 18:12, Luca Ceresoli wrote:
>> Hi,
>>
>> see below for the issues with interrupt implementation that I mentioned
>> in the cover letter.
>>
>> On 11/10/21 17:56, Luca Ceresoli wrote:
>>> The RTC included in the MAX77714 PMIC is very similar to the one in the
>>> MAX77686. Reuse the rtc-max77686.c driver with the minimum required changes
>>> for the MAX77714 RTC.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>> ---
>>>  drivers/rtc/Kconfig        |  2 +-
>>>  drivers/rtc/rtc-max77686.c | 24 ++++++++++++++++++++++++
>>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>> index e1bc5214494e..a73591ad292b 100644
>>> --- a/drivers/rtc/Kconfig
>>> +++ b/drivers/rtc/Kconfig
>>> @@ -375,7 +375,7 @@ config RTC_DRV_MAX8997
>>>  
>>>  config RTC_DRV_MAX77686
>>>  	tristate "Maxim MAX77686"
>>> -	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
>>> +	depends on MFD_MAX77686 || MFD_MAX77620 || MFD_MAX77714 || COMPILE_TEST
>>>  	help
>>>  	  If you say yes here you will get support for the
>>>  	  RTC of Maxim MAX77686/MAX77620/MAX77802 PMIC.
>>> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
>>> index 9901c596998a..e6564bc2171e 100644
>>> --- a/drivers/rtc/rtc-max77686.c
>>> +++ b/drivers/rtc/rtc-max77686.c
>>> @@ -19,6 +19,7 @@
>>>  
>>>  #define MAX77686_I2C_ADDR_RTC		(0x0C >> 1)
>>>  #define MAX77620_I2C_ADDR_RTC		0x68
>>> +#define MAX77714_I2C_ADDR_RTC		0x48
>>>  #define MAX77686_INVALID_I2C_ADDR	(-1)
>>>  
>>>  /* Define non existing register */
>>> @@ -203,6 +204,28 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
>>>  	.regmap_config = &max77686_rtc_regmap_config,
>>>  };
>>>  
>>> +static const struct regmap_irq_chip max77714_rtc_irq_chip = {
>>> +	.name		= "max77714-rtc",
>>> +	.status_base	= MAX77686_RTC_INT,
>>> +	.mask_base	= MAX77686_RTC_INTM,
>>> +	.num_regs	= 1,
>>> +	.irqs		= max77686_rtc_irqs,
>>> +	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs) - 1, /* no WTSR on 77714 */
>>> +};
>>> +
>>> +static const struct max77686_rtc_driver_data max77714_drv_data = {
>>> +	.delay = 16000,
>>> +	.mask  = 0x7f,
>>> +	.map   = max77686_map,
>>> +	.alarm_enable_reg = false,
>>> +	.rtc_irq_from_platform = false,
>>
>> As far as I could understand, rtc_irq_from_platform should be 'true'.
>> This would trigger the 'if' branch in function
>> max77686_init_rtc_regmap() [0]:
>>
>>   if (info->drv_data->rtc_irq_from_platform) {
>> 	struct platform_device *pdev = to_platform_device(info->dev);
>>
>> 	info->rtc_irq = platform_get_irq(pdev, 0);
>> 	if (info->rtc_irq < 0)
>> 		return info->rtc_irq;
>>   } else {
>> 	info->rtc_irq =  parent_i2c->irq;
>>   }
>>
>> Calling platform_get_irq() seems correct for the MAX77714, which can
>> generate various IRQ events, collecting them in a register, and raise a
>> single IRQ to the CPU via a physical pin.
>>
>> However, if I set rtc_irq_from_platform = true, platform_get_irq()
>> returns IRQ number '1', which ends up in:
>>
>>   dummy 0-0048: Failed to request IRQ 1 for max77714-rtc: -22
>>   max77686-rtc max77714-rtc: Failed to add RTC irq chip: -22
>>   max77686-rtc: probe of max77714-rtc failed with error -22
>>
>> I compared my code with other MFD drivers and their cell drivers (but
>> their datasheets is not available so I had to add some guesswork), and
>> couldn't find out where my code is wrong.
>>
>> Unfortunately I have no IRQ access on my board (and I don't need them
>> for my use case). For this reason I initially thought of disabling all
>> the IRQ code in rtc-max77686.c via a new flag, but it would be quite
>> invasive and I wouldn't even be able to test that existing hardware
>> still works. Implementing a new RTC driver for the MAX77714 does not
>> seem to be a sane option as the hardware is really 99% equal to the
>> MAX77686 RTC.
>>
> 
> I think the flag should be false, not true. The true means you have RTC
> device with its own interrupt. For example in DT it could look like:
> 
>   pmic@1c {
>       compatible = "maxim,max77714";
>       reg = <0x1c>;
>       interrupt-parent = <&gpio2>;
>       interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> 
>       interrupt-controller;
>       #interrupt-cells = <2>;
>    };
> 
>    rtc@48 {
>       compatible = "maxim,max77714-rtc";
>       reg = <0x48>;
>       interrupt-parent = <&gpio2>;
>       interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>    };
> 
> In your case, the RTC device will not have its own devicetree node and
> will be instantiated as MFD child device. The only interrupt line
> available is the parents interrupt line - the same as in max77686 and
> max77802 setups.
> 
> Have in mind that this does not necessarily reflect real HW, but how we
> represent it in devicetree and driver model.

Good to know. Thank you for the explanation.

-- 
Luca
