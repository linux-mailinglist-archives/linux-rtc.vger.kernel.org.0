Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA3A20C145
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2020 14:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgF0MdK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 27 Jun 2020 08:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgF0MdJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 27 Jun 2020 08:33:09 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8601AC03E979
        for <linux-rtc@vger.kernel.org>; Sat, 27 Jun 2020 05:33:09 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dp18so11824553ejc.8
        for <linux-rtc@vger.kernel.org>; Sat, 27 Jun 2020 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1S6U9q7ysclzqD0NlrcTE8kB4/DUBmFQQWp5MkRU3L0=;
        b=I/Bu9P6ZuAJjT4EeeyPiBpjbFgedNDtjpR7KSwx+ICcPQXCgEDSp1/Z+LJCUuzoPZb
         BA8aIrarSEIaVFlmHlODy5dNAlYhYLEPQlDNT89zTvEHc9UFjzn5crpzhsoDCSlsSyky
         896lTLKOSRApXMzzGI2TzyD0ZOIHb66ylD3ebZy3CjL9oKspY52lYnxc6Df01UFyJOhk
         xtWzXhxPjtJcVEdhCiAlFne6rkbhvJzyqNNzPkHFInnrt0HLRA2l813MdWujCrPdpQ4O
         vq5fEhr7usrw4D91IvKnSei8fJb1JdMaryyFiHZG819IJPwLViCC5WWYrbbP6KzNgci6
         +e7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1S6U9q7ysclzqD0NlrcTE8kB4/DUBmFQQWp5MkRU3L0=;
        b=CBi9FxzFrg3l5m2+TN/0p5WH1mYXdGbs3XgjR53D3MlNHB+chq79eDu5nz5dp10TVQ
         8Ox0CVqPH935rNOfsrGZFMXIyoOAsdz45tM2uFBnEul92kwDZ0Wg8NvrI5U9dAYUxaw4
         IXcPwwbJFrUuR6ULm+nH2QCtksP0yOGfgd26pjDOM4IAvQ6EYeYmkqKjc7yFIgDbiAhq
         JpVoQF0sPMKaCPtJ2Y0v24EyGQHavLh2/QiSHYojEXZPY8wEJSuj1UEl7s3XyeIP37Rt
         Ps/4s1ybqwNy/C5M2QkUIUR4ZhTI6o6fojkOup0HzAFjEkVdhD/8zCRTF8TiPQwEF76t
         6tUQ==
X-Gm-Message-State: AOAM532+63cDfX5WvynxeKsPE0lOtBNpIhjTy9a9d2spY2zSI4SqFJZn
        //KxlwtpPyGBQLcr/6ZRwwGsghHYv4ai4MEoSfU=
X-Google-Smtp-Source: ABdhPJzPchizT01wnaxgQFyp5tjq+q1z3EJuaNisyfHmkiwFYAVjdzQcywkYMNqqWojzy2XF+rumqbs7DsHcAdU5IZo=
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr6696451ejw.71.1593261188186;
 Sat, 27 Jun 2020 05:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200619041145.1882-1-liambeguin@gmail.com> <20200619041145.1882-3-liambeguin@gmail.com>
In-Reply-To: <20200619041145.1882-3-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Sat, 27 Jun 2020 14:32:52 +0200
Message-ID: <CAH+2xPA2_gUMV_+BoDx9_9Z_kqH+b5V-arKSYFoVBJS5TVGsmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rtc: pcf2127: add alarm support
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den fre. 19. jun. 2020 kl. 06.12 skrev Liam Beguin <liambeguin@gmail.com>:
>
> From: Liam Beguin <lvb@xiphos.com>
>
> Add alarm support for the pcf2127 RTC chip family.
> Tested on pca2129.
>
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
> Changes since v1:
> - Add calls to pcf2127_wdt_active_ping after accessing CTRL2
> - Cleanup calls to regmap_{read,write,update_bits}
> - Cleanup debug trace
> - Add interrupt handler, untested because of hardware limitations
> - Add wakeup-source devicetree option
>
> Changes since v2:
> - Avoid forward declaration of pcf2127_wdt_active_ping
> - Remove dev_err strings
> - Remove dev_dbg traces since they are now part of the core
> - Remove redundant if in pcf2127_rtc_alarm_irq_enable
> - Remove duplicate watchdog ping in pcf2127_rtc_irq
> - Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
> - Add extra rtc_class_ops struct with alarm functions
>
>  drivers/rtc/rtc-pcf2127.c | 136 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 4accee09bfad..df09d3c6c5c3 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/watchdog.h>
>
> @@ -28,7 +29,9 @@
>  #define PCF2127_BIT_CTRL1_TSF1                 BIT(4)
>  /* Control register 2 */
>  #define PCF2127_REG_CTRL2              0x01
> +#define PCF2127_BIT_CTRL2_AIE                  BIT(1)
>  #define PCF2127_BIT_CTRL2_TSIE                 BIT(2)
> +#define PCF2127_BIT_CTRL2_AF                   BIT(4)
>  #define PCF2127_BIT_CTRL2_TSF2                 BIT(5)
>  /* Control register 3 */
>  #define PCF2127_REG_CTRL3              0x02
> @@ -46,6 +49,12 @@
>  #define PCF2127_REG_DW                 0x07
>  #define PCF2127_REG_MO                 0x08
>  #define PCF2127_REG_YR                 0x09
> +/* Alarm registers */
> +#define PCF2127_REG_ALARM_SC           0x0A
> +#define PCF2127_REG_ALARM_MN           0x0B
> +#define PCF2127_REG_ALARM_HR           0x0C
> +#define PCF2127_REG_ALARM_DM           0x0D
> +#define PCF2127_REG_ALARM_DW           0x0E
>  /* Watchdog registers */
>  #define PCF2127_REG_WD_CTL             0x10
>  #define PCF2127_BIT_WD_CTL_TF0                 BIT(0)
> @@ -324,6 +333,116 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
>         .set_timeout = pcf2127_wdt_set_timeout,
>  };
>
> +/* Alarm */
> +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       unsigned int buf[5], ctrl2;
> +       int ret;
> +
> +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +       if (ret)
> +               return ret;
> +
> +       ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               return ret;
> +
> +       ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> +                              sizeof(buf));
> +       if (ret)
> +               return ret;
> +
> +       alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
> +       alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
> +
> +       alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> +       alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
> +       alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
> +       alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
> +       alrm->time.tm_wday = buf[4] & 0x07;
> +
> +       return 0;
> +}
> +
> +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                PCF2127_BIT_CTRL2_AIE,
> +                                enable ? PCF2127_BIT_CTRL2_AIE : 0);
> +       if (ret)
> +               return ret;
> +
> +       return pcf2127_wdt_active_ping(&pcf2127->wdd);
> +}
> +
> +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       uint8_t buf[5];
> +       int ret;
> +
> +       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                PCF2127_BIT_CTRL2_AF, 0);
> +       if (ret)
> +               return ret;
> +
> +       ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               return ret;
> +
> +       buf[0] = bin2bcd(alrm->time.tm_sec);
> +       buf[1] = bin2bcd(alrm->time.tm_min);
> +       buf[2] = bin2bcd(alrm->time.tm_hour);
> +       buf[3] = bin2bcd(alrm->time.tm_mday);
> +       buf[4] = (alrm->time.tm_wday & 0x07);
> +
> +       ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> +                               sizeof(buf));
> +       if (ret)
> +               return ret;
> +
> +       return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> +}
> +
> +static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       unsigned int ctrl2 = 0;
> +       int ret = 0;
> +
> +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +       if (ret)
> +               goto irq_err;
> +
> +       if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
> +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                            ctrl2 & ~PCF2127_BIT_CTRL2_AF);
> +
> +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +       }
> +
> +       ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               goto irq_err;
> +
> +       return IRQ_HANDLED;
> +irq_err:
> +       return IRQ_NONE;

It's not really needed to use "goto irq_err;" syntax as there is no
common error cleanup
path and can simply be replaced by "return IRQ_NONE;".

Overall this feature looks good to me.

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

/Bruno

> +}
> +
> +static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {
> +       .ioctl            = pcf2127_rtc_ioctl,
> +       .read_time        = pcf2127_rtc_read_time,
> +       .set_time         = pcf2127_rtc_set_time,
> +       .read_alarm       = pcf2127_rtc_read_alarm,
> +       .set_alarm        = pcf2127_rtc_set_alarm,
> +       .alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
> +};
> +
>  /* sysfs interface */
>
>  static ssize_t timestamp0_store(struct device *dev,
> @@ -419,6 +538,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>                         const char *name, bool has_nvmem)
>  {
>         struct pcf2127 *pcf2127;
> +       int alarm_irq = 0;
>         u32 wdd_timeout;
>         int ret = 0;
>
> @@ -441,6 +561,22 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>         pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
>         pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
>
> +       alarm_irq = of_irq_get_byname(dev->of_node, "alarm");
> +       if (alarm_irq >= 0) {
> +               ret = devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
> +                                      IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +                                      dev_name(dev), dev);
> +               if (ret) {
> +                       dev_err(dev, "failed to request alarm irq\n");
> +                       return ret;
> +               }
> +       }
> +
> +       if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source")) {
> +               device_init_wakeup(dev, true);
> +               pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
> +       }
> +
>         pcf2127->wdd.parent = dev;
>         pcf2127->wdd.info = &pcf2127_wdt_info;
>         pcf2127->wdd.ops = &pcf2127_watchdog_ops;
> --
> 2.27.0
>
