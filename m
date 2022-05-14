Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFB0526E9B
	for <lists+linux-rtc@lfdr.de>; Sat, 14 May 2022 09:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbiENE3b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 May 2022 00:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiENE3a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 May 2022 00:29:30 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78DA8720D
        for <linux-rtc@vger.kernel.org>; Fri, 13 May 2022 21:29:27 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id z144so10279501vsz.13
        for <linux-rtc@vger.kernel.org>; Fri, 13 May 2022 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0GWEa088/8gygvvNMddpKVADIoKT6txzQQgu1gUUI6Q=;
        b=Dkus6aeJjC7PLy1CCBHq409Il+rO3IPxriIXEkxsoUPB+jHybB8+tm7HhY1WH+DP0E
         F7tRpBNvo79dC4K8ff5GL/aBpYDGgRx/uEtFQoHFg8izVf+5B+FSlMrL9TqlUXk4RoOA
         NCUI6hV3xcmKtGMLDi0oOPNaGXCo+bxeT2HViynRI08FJP20OlUQSjl2C9QTGskDwR7i
         lQGrp++wN3yGxpIZo2ZLEMRXWMUZjexTnwp08zGxd2GECzcvPd/8NYhoPmGELnJyrTuC
         zXNw4W8tKEngEoZGBYAlOamOLmlFYb3AqcULcjg88aRDXAqXTtgNaQ1GfZHaCSl0wZuf
         Ab5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0GWEa088/8gygvvNMddpKVADIoKT6txzQQgu1gUUI6Q=;
        b=s0kGra8OMKb4sPPdOPRoIkuSb2yY70u/HkugNxchJr2AeGuJB//SfHfZsI7YrE67/L
         EOLT6mIWSZUs82CyHXs+FgZbX7qJeZrBlFqqk4SYcjjTecC6bldfRRSW8Cj/btwcuYjz
         PJCRZih2jJDguQariEU8XGdrN4+2jjBlI5fqxB7pNtfbNYCzwbmd++6dvXhnNnbCtZNZ
         z5m34Ui/XQPjo5IIClDH6AT41HcAdfuDDmjBRedzKrG3O+lTbGA/9qRMRcdh36ARrXyl
         3Tm9PahybQENwa+buVp5eAuk9Fmlh6OvAUd1nfkS3Il3c1w1xMLOwjhkPsyz9Anr8hic
         S1Aw==
X-Gm-Message-State: AOAM531NVUTNf5NwUWpu5Ub3sD+Gk70JrnQeaNk8W5ERp5+LXSzK1rBi
        Z/+CRm0Cv15/GwLcATm/QU2vblWeq6/dAn/j9DAy
X-Google-Smtp-Source: ABdhPJyTGVd8B0YWcDGyINB4mGqpFei5GsWH4sqHsmBqvAilzt3RthSV+RCR5yoCvcWTZfl7wbBUnIJl48blNYnoPdc=
X-Received: by 2002:a05:6102:c13:b0:32d:518f:feaf with SMTP id
 x19-20020a0561020c1300b0032d518ffeafmr3303593vss.84.1652502566657; Fri, 13
 May 2022 21:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220513110327.261652-1-miquel.raynal@bootlin.com> <20220513110327.261652-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220513110327.261652-3-miquel.raynal@bootlin.com>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Sat, 14 May 2022 13:29:00 +0900
Message-ID: <CABMQnVKsJwuHNGaLxBKAv44Sx+TiHZ5p20b-FNNTeCxtBLWF+Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] rtc: rzn1: Add new RTC driver
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2022=E5=B9=B45=E6=9C=8813=E6=97=A5(=E9=87=91) 20:03 Miquel Raynal <miquel.r=
aynal@bootlin.com>:
>
> From: Michel Pollet <michel.pollet@bp.renesas.com>
>
> Add a basic RTC driver for the RZ/N1.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/rtc/Kconfig    |   7 ++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-rzn1.c | 245 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/rtc/rtc-rzn1.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 41c65b4d2baf..a00f901b5c1d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1548,6 +1548,13 @@ config RTC_DRV_RS5C313
>         help
>           If you say yes here you get support for the Ricoh RS5C313 RTC c=
hips.
>
> +config RTC_DRV_RZN1
> +       tristate "Renesas RZ/N1 RTC"
> +       depends on ARCH_RZN1 || COMPILE_TEST
> +       depends on OF && HAS_IOMEM
> +       help
> +         If you say yes here you get support for the Renesas RZ/N1 RTC.
> +
>  config RTC_DRV_GENERIC
>         tristate "Generic RTC support"
>         # Please consider writing a new RTC driver instead of using the g=
eneric
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2d827d8261d5..fb04467b652d 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -151,6 +151,7 @@ obj-$(CONFIG_RTC_DRV_RX6110)        +=3D rtc-rx6110.o
>  obj-$(CONFIG_RTC_DRV_RX8010)   +=3D rtc-rx8010.o
>  obj-$(CONFIG_RTC_DRV_RX8025)   +=3D rtc-rx8025.o
>  obj-$(CONFIG_RTC_DRV_RX8581)   +=3D rtc-rx8581.o
> +obj-$(CONFIG_RTC_DRV_RZN1)     +=3D rtc-rzn1.o
>  obj-$(CONFIG_RTC_DRV_S35390A)  +=3D rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)      +=3D rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)      +=3D rtc-s5m.o
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> new file mode 100644
> index 000000000000..685cba87cd90
> --- /dev/null
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Renesas RZ/N1 Real Time Clock interface for Linux
> + *
> + * Copyright:
> + * - 2014 Renesas Electronics Europe Limited
> + * - 2022 Schneider Electric
> + *
> + * Authors:
> + * - Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
> + * - Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +#include <linux/bcd.h>
> +#include <linux/clk.h>
> +#include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/rtc.h>
> +
> +#define RZN1_RTC_CTL0 0x00
> +#define   RZN1_RTC_CTL0_SLSB_SUBU 0
> +#define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
> +#define   RZN1_RTC_CTL0_AMPM BIT(5)
> +#define   RZN1_RTC_CTL0_CE BIT(7)
> +
> +#define RZN1_RTC_CTL1 0x04
> +#define   RZN1_RTC_CTL1_ALME BIT(4)
> +
> +#define RZN1_RTC_CTL2 0x08
> +#define   RZN1_RTC_CTL2_WAIT BIT(0)
> +#define   RZN1_RTC_CTL2_WST BIT(1)
> +#define   RZN1_RTC_CTL2_WUST BIT(5)
> +#define   RZN1_RTC_CTL2_STOPPED (RZN1_RTC_CTL2_WAIT | RZN1_RTC_CTL2_WST)
> +
> +#define RZN1_RTC_SEC 0x14
> +#define RZN1_RTC_MIN 0x18
> +#define RZN1_RTC_HOUR 0x1c
> +#define RZN1_RTC_WEEK 0x20
> +#define RZN1_RTC_DAY 0x24
> +#define RZN1_RTC_MONTH 0x28
> +#define RZN1_RTC_YEAR 0x2c
> +
> +#define RZN1_RTC_SUBU 0x38
> +#define   RZN1_RTC_SUBU_DEV BIT(7)
> +#define   RZN1_RTC_SUBU_DECR BIT(6)
> +
> +#define RZN1_RTC_ALM 0x40
> +#define RZN1_RTC_ALH 0x44
> +#define RZN1_RTC_ALW 0x48
> +
> +#define RZN1_RTC_SECC 0x4c
> +#define RZN1_RTC_MINC 0x50
> +#define RZN1_RTC_HOURC 0x54
> +#define RZN1_RTC_WEEKC 0x58
> +#define RZN1_RTC_DAYC 0x5c
> +#define RZN1_RTC_MONTHC 0x60
> +#define RZN1_RTC_YEARC 0x64
> +
> +struct rzn1_rtc {
> +       struct rtc_device *rtcdev;
> +       void __iomem *base;
> +       struct clk *clk;

clk variables do not seem to be used in this patch series.
If it is not used in the future, I think it can be deleted with
'#Include <linux/clk.h>".

> +};
> +
> +static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_=
time *tm)
> +{
> +       tm->tm_sec =3D readl(rtc->base + RZN1_RTC_SECC);
> +       tm->tm_min =3D readl(rtc->base + RZN1_RTC_MINC);
> +       tm->tm_hour =3D readl(rtc->base + RZN1_RTC_HOURC);
> +       tm->tm_wday =3D readl(rtc->base + RZN1_RTC_WEEKC);
> +       tm->tm_mday =3D readl(rtc->base + RZN1_RTC_DAYC);
> +       tm->tm_mon =3D readl(rtc->base + RZN1_RTC_MONTHC);
> +       tm->tm_year =3D readl(rtc->base + RZN1_RTC_YEARC);
> +}
> +
> +static unsigned int rzn1_rtc_tm_to_wday(struct rtc_time *tm)
> +{
> +       time64_t time;
> +       unsigned int days;
> +       u32 secs;
> +
> +       time =3D rtc_tm_to_time64(tm);
> +       days =3D div_s64_rem(time, 86400, &secs);
> +
> +       /* day of the week, 1970-01-01 was a Thursday */
> +       return (days + 4) % 7;
> +}
> +
> +static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> +       u32 val, secs;
> +
> +       /*
> +        * The RTC was not started or is stopped and thus does not carry =
the
> +        * proper time/date.
> +        */
> +       val =3D readl(rtc->base + RZN1_RTC_CTL2);
> +       if (val & RZN1_RTC_CTL2_STOPPED)
> +               return -EINVAL;
> +
> +       rzn1_rtc_get_time_snapshot(rtc, tm);
> +       secs =3D readl(rtc->base + RZN1_RTC_SECC);
> +       if (tm->tm_sec !=3D secs)
> +               rzn1_rtc_get_time_snapshot(rtc, tm);
> +
> +       tm->tm_sec =3D bcd2bin(tm->tm_sec);
> +       tm->tm_min =3D bcd2bin(tm->tm_min);
> +       tm->tm_hour =3D bcd2bin(tm->tm_hour);
> +       tm->tm_wday =3D bcd2bin(tm->tm_wday);
> +       tm->tm_mday =3D bcd2bin(tm->tm_mday);
> +       tm->tm_mon =3D bcd2bin(tm->tm_mon);
> +       tm->tm_year =3D bcd2bin(tm->tm_year);
> +
> +       return 0;
> +}
> +
> +static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> +       u32 val;
> +       int ret;
> +
> +       tm->tm_sec =3D bin2bcd(tm->tm_sec);
> +       tm->tm_min =3D bin2bcd(tm->tm_min);
> +       tm->tm_hour =3D bin2bcd(tm->tm_hour);
> +       tm->tm_wday =3D bin2bcd(rzn1_rtc_tm_to_wday(tm));
> +       tm->tm_mday =3D bin2bcd(tm->tm_mday);
> +       tm->tm_mon =3D bin2bcd(tm->tm_mon);
> +       tm->tm_year =3D bin2bcd(tm->tm_year);
> +
> +       val =3D readl(rtc->base + RZN1_RTC_CTL2);
> +       if (!(val & RZN1_RTC_CTL2_STOPPED)) {
> +               /* Hold the counter if it was counting up */
> +               writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
> +
> +               /* Wait for the counter to stop: two 32k clock cycles */
> +               usleep_range(61, 100);
> +               ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val=
,
> +                                        val & RZN1_RTC_CTL2_WST, 0, 100)=
;
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       writel(tm->tm_sec, rtc->base + RZN1_RTC_SEC);
> +       writel(tm->tm_min, rtc->base + RZN1_RTC_MIN);
> +       writel(tm->tm_hour, rtc->base + RZN1_RTC_HOUR);
> +       writel(tm->tm_wday, rtc->base + RZN1_RTC_WEEK);
> +       writel(tm->tm_mday, rtc->base + RZN1_RTC_DAY);
> +       writel(tm->tm_mon, rtc->base + RZN1_RTC_MONTH);
> +       writel(tm->tm_year, rtc->base + RZN1_RTC_YEAR);
> +       writel(0, rtc->base + RZN1_RTC_CTL2);
> +
> +       return 0;
> +}
> +
> +static const struct rtc_class_ops rzn1_rtc_ops =3D {
> +       .read_time =3D rzn1_rtc_read_time,
> +       .set_time =3D rzn1_rtc_set_time,
> +};
> +
> +static int rzn1_rtc_probe(struct platform_device *pdev)
> +{
> +       struct rzn1_rtc *rtc;
> +       int ret;
> +
> +       rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +       if (!rtc)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, rtc);
> +
> +       rtc->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(rtc->base))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Mis=
sing reg\n");
> +
> +       rtc->rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
> +       if (IS_ERR(rtc->rtcdev))
> +               return PTR_ERR(rtc);
> +
> +       rtc->rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> +       rtc->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
> +       rtc->rtcdev->ops =3D &rzn1_rtc_ops;
> +       clear_bit(RTC_FEATURE_ALARM, rtc->rtcdev->features);
> +       clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> +
> +       devm_pm_runtime_enable(&pdev->dev);
> +       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Ensure the clock counter is enabled.
> +        * Set 24-hour mode and possible oscillator offset compensation i=
n SUBU mode.
> +        */
> +       writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB=
_SUBU,
> +              rtc->base + RZN1_RTC_CTL0);
> +
> +       /* Disable all interrupts */
> +       writel(0, rtc->base + RZN1_RTC_CTL1);
> +
> +       ret =3D devm_rtc_register_device(rtc->rtcdev);
> +       if (ret)
> +               goto dis_runtime_pm;
> +
> +       return 0;
> +
> +dis_runtime_pm:
> +       pm_runtime_put(&pdev->dev);
> +
> +       return ret;
> +}
> +
> +static int rzn1_rtc_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_put(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id rzn1_rtc_of_match[] =3D {
> +       { .compatible   =3D "renesas,rzn1-rtc" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
> +
> +static struct platform_driver rzn1_rtc_driver =3D {
> +       .probe =3D rzn1_rtc_probe,
> +       .remove =3D rzn1_rtc_remove,
> +       .driver =3D {
> +               .name   =3D "rzn1-rtc",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D rzn1_rtc_of_match,
> +       },
> +};
> +module_platform_driver(rzn1_rtc_driver);
> +
> +MODULE_AUTHOR("Michel Pollet <Michel.Pollet@bp.renesas.com");
> +MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
> +MODULE_DESCRIPTION("RZ/N1 RTC driver");
> +MODULE_LICENSE("GPL");
> --
> 2.27.0
>

Best regards,
  Nobuhiro


--
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
