Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3E42AD753
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Nov 2020 14:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgKJNSd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Nov 2020 08:18:33 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:39848 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJNSc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Nov 2020 08:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605014312; x=1636550312;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=djNZbuQbk/vOJocfvjNujmT49r4Bz90s8iG07uZWDGs=;
  b=ebtkZKlvnHVAQi8mYn5BNjCV08c231oCKuoDV0x9IWe2UmMLhXVMynmx
   HwjIL7CpBH0pVz31CmY3tY4CRr70tb6rBh622U2CEY7G4s+rPNPjwlq/E
   4CADSNf/2UDHnl6F1ga1G/Utz6LKk5pMgYnw35fuR6gfIq2bd1Bbfr6FT
   6JSMeGCfLo3vQv49uNFzwUMKS4PzLLPkVa3RrG5wCUMln264w1J/UclL4
   yv7kpwpiJVEttSNw0B7/AN0yxsF0eOI4tY4n5L+SQ0y8wJQ/mpPA5I03g
   eIvzFMHuKUsZ9e57h9eafqzXrZyc4KsV5aK+3IQOYdFCxNsm4tAxn98rd
   A==;
IronPort-SDR: dcYzYo+VKe9fTg/JVxm4AZL2bIDeok7COnO0GxMDjNnYnbfv/tL8xQvXqNsjFdh/uDbNoaxAKC
 Q8wC3Ek4uN+CHvwEDKA8dra4FEjAx88Od8ZT+qjl51vyK0fv1K/ecIEQ8r3X0kR6J7wQM0N4vC
 ENE5PLA9qcD8Pzfp2NQO6PnbdbulGG5s3EMpw3H8XXnuy0L6fE8+jYAV9nrJQg6D5+hZ2ON9mq
 0q4zHFjkpT9M2WT+tzZvyEJKFqs4oNbD3h5ErW1FrhWs5Vhor6XEZ4NdrN8R5qZ9jLdtnMtbpf
 EDY=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="93122854"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 06:18:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 06:18:31 -0700
Received: from [10.171.246.109] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 10 Nov 2020 06:18:28 -0700
Subject: Re: [PATCH] rtc: at91rm9200: add correction support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Sandeep Sheriker <sandeepsheriker.mallikarjun@microchip.com>
References: <20201108232001.1580128-1-alexandre.belloni@bootlin.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <edfb367f-0a97-f7ef-1a75-8d4d8f5f536b@microchip.com>
Date:   Tue, 10 Nov 2020 14:18:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201108232001.1580128-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

Thanks you for adding this feature to newest at91 RTC IPs.


On 09/11/2020 at 00:20, Alexandre Belloni wrote:
> The sama5d4 and sama5d2 RTCs are able to correct for imprecise crystals, up

FYI, sam9x60 RTC has the same correction capability.

... and I now realize that sam9x60 using sam9x5-rtc compatibility sting 
is maybe not the right choice...

> to 1953 ppm.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-at91rm9200.c | 103 +++++++++++++++++++++++++++++++++--
>   1 file changed, 99 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> index 5e811e04cb21..1eea187d9850 100644
> --- a/drivers/rtc/rtc-at91rm9200.c
> +++ b/drivers/rtc/rtc-at91rm9200.c
> @@ -36,6 +36,10 @@
>   #define                AT91_RTC_UPDCAL         BIT(1)          /* Update Request Calendar Register */
> 
>   #define        AT91_RTC_MR             0x04                    /* Mode Register */
> +#define                AT91_RTC_HRMOD          BIT(0)          /* 12/24 hour mode */
> +#define                AT91_RTC_NEGPPM         BIT(4)          /* Negative PPM correction */
> +#define                AT91_RTC_CORRECTION     GENMASK(14, 8)  /* Slow clock correction */
> +#define                AT91_RTC_HIGHPPM        BIT(15)         /* High PPM correction */
> 
>   #define        AT91_RTC_TIMR           0x08                    /* Time Register */
>   #define                AT91_RTC_SEC            GENMASK(6, 0)   /* Current Second */
> @@ -77,6 +81,9 @@
>   #define                AT91_RTC_NVTIMALR       BIT(2)          /* Non valid Time Alarm */
>   #define                AT91_RTC_NVCALALR       BIT(3)          /* Non valid Calendar Alarm */
> 
> +#define AT91_RTC_CORR_DIVIDEND         3906000
> +#define AT91_RTC_CORR_LOW_RATIO                20

IMHO, it's worth telling here that these values are from the product 
datasheet in formula coming from explanation of HIGHPPM bit of register 
RTC_MR.

> +
>   #define at91_rtc_read(field) \
>          readl_relaxed(at91_rtc_regs + field)
>   #define at91_rtc_write(field, val) \
> @@ -84,6 +91,7 @@
> 
>   struct at91_rtc_config {
>          bool use_shadow_imr;
> +       bool has_correction;
>   };
> 
>   static const struct at91_rtc_config *at91_rtc_config;
> @@ -293,6 +301,75 @@ static int at91_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>          return 0;
>   }
> 
> +static int at91_rtc_readoffset(struct device *dev, long *offset)
> +{
> +       u32 mr = at91_rtc_read(AT91_RTC_MR);
> +       long val = FIELD_GET(AT91_RTC_CORRECTION, mr);
> +
> +       if (!val) {
> +               *offset = 0;
> +               return 0;
> +       }
> +
> +       val++;
> +
> +       if (!(mr & AT91_RTC_NEGPPM))
> +               val = -val;
> +
> +       if (!(mr & AT91_RTC_HIGHPPM))
> +               val *= AT91_RTC_CORR_LOW_RATIO;
> +
> +       *offset = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, val);
> +
> +       return 0;
> +}
> +
> +static int at91_rtc_setoffset(struct device *dev, long offset)
> +{
> +       long corr;
> +       u32 mr;
> +
> +       if (offset > AT91_RTC_CORR_DIVIDEND / 2)
> +               return -ERANGE;
> +       if (offset < -AT91_RTC_CORR_DIVIDEND / 2)
> +               return -ERANGE;
> +
> +       mr = at91_rtc_read(AT91_RTC_MR);
> +       mr &= ~(AT91_RTC_NEGPPM | AT91_RTC_CORRECTION | AT91_RTC_HIGHPPM);
> +
> +       if (offset > 0)
> +               mr |= AT91_RTC_NEGPPM;
> +       else
> +               offset = -offset;
> +
> +       /* offset less than 764 ppb, disable correction*/

Does it correspond to the 1.5 ppm value of the datasheet?
(sorry I'm not so used to these computations?)

> +       if (offset < 764) {
> +               at91_rtc_write(AT91_RTC_MR, mr & ~AT91_RTC_NEGPPM);
> +
> +               return 0;
> +       }
> +
> +       /*
> +        * 29208 ppb is the perfect cutoff between low range and high range
> +        * low range values are never better than high range value after that.

And here, I'm lost. Does it correspond to the sentence:
"HIGHPPM set to 1 is recommended for 30 ppm correction and above." ? And 
rounding using register values, am I right?

> +        */
> +       if (offset < 29208) {
> +               corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset * AT91_RTC_CORR_LOW_RATIO);
> +       } else {
> +               corr = DIV_ROUND_CLOSEST(AT91_RTC_CORR_DIVIDEND, offset);
> +               mr |= AT91_RTC_HIGHPPM;
> +       }
> +
> +       if (corr > 128)

Okay, it's maximized to the width of register field, got it.

> +               corr = 128;

I'm kind of following and don't know what other RTC drivers are doing... 
but would prefer more explanation on numerical values.

> +
> +       mr |= FIELD_PREP(AT91_RTC_CORRECTION, corr - 1);
> +
> +       at91_rtc_write(AT91_RTC_MR, mr);
> +
> +       return 0;
> +}
> +
>   /*
>    * IRQ handler for the RTC
>    */
> @@ -343,6 +420,10 @@ static const struct at91_rtc_config at91sam9x5_config = {
>          .use_shadow_imr = true,
>   };
> 
> +static const struct at91_rtc_config sama5d4_config = {
> +       .has_correction = true,
> +};
> +
>   static const struct of_device_id at91_rtc_dt_ids[] = {
>          {
>                  .compatible = "atmel,at91rm9200-rtc",
> @@ -352,10 +433,10 @@ static const struct of_device_id at91_rtc_dt_ids[] = {
>                  .data = &at91sam9x5_config,
>          }, {
>                  .compatible = "atmel,sama5d4-rtc",
> -               .data = &at91rm9200_config,
> +               .data = &sama5d4_config,
>          }, {
>                  .compatible = "atmel,sama5d2-rtc",
> -               .data = &at91rm9200_config,
> +               .data = &sama5d4_config,
>          }, {
>                  /* sentinel */
>          }
> @@ -370,6 +451,16 @@ static const struct rtc_class_ops at91_rtc_ops = {
>          .alarm_irq_enable = at91_rtc_alarm_irq_enable,
>   };
> 
> +static const struct rtc_class_ops sama5d4_rtc_ops = {
> +       .read_time      = at91_rtc_readtime,
> +       .set_time       = at91_rtc_settime,
> +       .read_alarm     = at91_rtc_readalarm,
> +       .set_alarm      = at91_rtc_setalarm,
> +       .alarm_irq_enable = at91_rtc_alarm_irq_enable,
> +       .set_offset     = at91_rtc_setoffset,
> +       .read_offset    = at91_rtc_readoffset,
> +};
> +
>   /*
>    * Initialize and install RTC driver
>    */
> @@ -416,7 +507,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>          }
> 
>          at91_rtc_write(AT91_RTC_CR, 0);
> -       at91_rtc_write(AT91_RTC_MR, 0);         /* 24 hour mode */
> +       at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
> 
>          /* Disable all interrupts */
>          at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
> @@ -437,7 +528,11 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>          if (!device_can_wakeup(&pdev->dev))
>                  device_init_wakeup(&pdev->dev, 1);
> 
> -       rtc->ops = &at91_rtc_ops;
> +       if (at91_rtc_config->has_correction)
> +               rtc->ops = &sama5d4_rtc_ops;
> +       else
> +               rtc->ops = &at91_rtc_ops;
> +
>          rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
>          rtc->range_max = RTC_TIMESTAMP_END_2099;
>          ret = rtc_register_device(rtc);
> --
> 2.28.0

Alexandre, you know much more than me about the habits of RTC drivers 
writers. Even if I would like a little more documentation on values 
used, I absolutely won't hold this feature adoption, so here is my:

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

-- 
Nicolas Ferre
