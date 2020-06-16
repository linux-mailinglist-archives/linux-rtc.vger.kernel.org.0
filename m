Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711AD1FAB65
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 10:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFPIiS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 04:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgFPIiS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 04:38:18 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2201C05BD43
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 01:38:17 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id f7so20586947ejq.6
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QVrBOBQL34FbWY9kebYTAGR1NnE/YxMeb4qW9NX6jfc=;
        b=Q444VheC0VFQKk6NlTW6W21Ajl5o77rxeh+EzI2QUQs2lVttLGs1ZivTI0PzhZ7UoI
         sm7KX5CZEH+bZLY+JQcbZ7uAM04HxPDuyupZHU1LLJp7u7fydaUHI62EuFwmxhbBPWj0
         evRhkSx+cE/rNw45OcVLmIr9JEdIhmzVYTQf9rjicOLYvywHi+efQHt51dlP+bCLfw8J
         qOXJ68EHEzzOyxMy3Qm0gmShi1Qwz/BgAP6liGXG3JpOt0xXuec7YJbOaM/4bf/rOHU7
         1VurI6gJ9tG0MpcKmYR8ynjzErLNrp+6wOUqkqG5Y/cwO64hovfLZ4bQwq+jI6JkwClp
         GJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QVrBOBQL34FbWY9kebYTAGR1NnE/YxMeb4qW9NX6jfc=;
        b=pjPZjfYx6nUShQE3ozY6J0rtdoNiXVun75Va7jyw051DqKtyYN/ABnYBZKK9BDtc3g
         cmZLdSlPjilHafQsqh+8EaCxxcLBk3mKP80xBe71bKtCUX7ZI0I7VOyPoA+QDXvJq/pn
         gMiYohFHtfW4le47xMTqJ2d5lMZC/tKkP68gWEksd8dPyuPBke2n/njF/zryJ+CXs27Y
         eDzpAeKa1R9XUeCVCiRfNCj2cWRmFP1PnQ1w79obzley6JvX7ZEVTqIVtE2dsDfjaP3h
         8bpnVLUP54HkRk+CQgnVq2DdoZJZ4vn5iWHnNicsHKDLMirkl5lKPFp6hMU6qeLKBk/z
         25wg==
X-Gm-Message-State: AOAM530YbI5MbhrGYXal4yEGxjxhjpTwO8NWbZ7iP1doWxWmbK5/+d9F
        FadqGEkxn3aJz7lqRGPEvLWM+12i40LEE38PxtQ=
X-Google-Smtp-Source: ABdhPJySygFBWfeyUT75HI3L4pCF1YzC+gEYCLeY7vRSs2NEHzKojzU924D8AO+05SFHUWiqQ8YALd5gOBuQAeDzuDk=
X-Received: by 2002:a17:907:40ed:: with SMTP id nn21mr1751357ejb.71.1592296696418;
 Tue, 16 Jun 2020 01:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200614040409.30302-1-liambeguin@gmail.com> <20200614040409.30302-3-liambeguin@gmail.com>
In-Reply-To: <20200614040409.30302-3-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Tue, 16 Jun 2020 10:38:00 +0200
Message-ID: <CAH+2xPBUuaNsxuTm+JDGWbDMMUn3SVwkOQXo_N5U4HaDiFGScA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: add alarm support
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Liam

Good updates, but you need to rebase patches on top of the latest mainline =
tree.

Den s=C3=B8n. 14. jun. 2020 kl. 06.04 skrev Liam Beguin <liambeguin@gmail.c=
om>:
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
>  drivers/rtc/rtc-pcf2127.c | 169 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 166 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 396a1144a213..87ecb29247c6 100644
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
> @@ -79,6 +88,8 @@
>  #define PCF2127_WD_VAL_MAX             255
>  #define PCF2127_WD_VAL_DEFAULT         60
>
> +static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
> +
>  struct pcf2127 {
>         struct rtc_device *rtc;
>         struct watchdog_device wdd;
> @@ -185,6 +196,140 @@ static int pcf2127_rtc_set_time(struct device *dev,=
 struct rtc_time *tm)
>         return 0;
>  }
>
> +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm =
*alrm)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       unsigned int buf[5], ctrl2;
> +       int ret;
> +
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +       if (ret) {
> +               dev_err(dev, "%s: ctrl2 read error\n", __func__);
> +               return ret;
> +       }
> +
> +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, b=
uf,
> +                              sizeof(buf));
> +       if (ret) {
> +               dev_err(dev, "%s: alarm read error\n", __func__);
> +               return ret;
> +       }
> +
> +       alrm->enabled =3D ctrl2 & PCF2127_BIT_CTRL2_AIE;
> +       alrm->pending =3D ctrl2 & PCF2127_BIT_CTRL2_AF;
> +
> +       alrm->time.tm_sec =3D bcd2bin(buf[0] & 0x7F);
> +       alrm->time.tm_min =3D bcd2bin(buf[1] & 0x7F);
> +       alrm->time.tm_hour =3D bcd2bin(buf[2] & 0x3F);
> +       alrm->time.tm_mday =3D bcd2bin(buf[3] & 0x3F);
> +       alrm->time.tm_wday =3D buf[4] & 0x07;
> +
> +       dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=3D%d, wday=3D%d\n", __f=
unc__,
> +               alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
> +               alrm->time.tm_mday, alrm->time.tm_wday);
> +
> +       return 0;
> +}
> +
> +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                PCF2127_BIT_CTRL2_AIE,
> +                                enable ? PCF2127_BIT_CTRL2_AIE : 0);
> +       if (ret) {
> +               dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
> +                       enable ? "enable" : "disable",
> +                       ret);
> +               return ret;
> +       }
> +
> +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Just do "return ret;" unconditional.

> +}
> +
> +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *=
alrm)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       uint8_t buf[5];
> +       int ret;
> +
> +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                PCF2127_BIT_CTRL2_AF, 0);
> +       if (ret) {
> +               dev_err(dev, "%s: failed to clear alarm interrupt flag (%=
d)",
> +                       __func__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               return ret;
> +
> +       buf[0] =3D bin2bcd(alrm->time.tm_sec);
> +       buf[1] =3D bin2bcd(alrm->time.tm_min);
> +       buf[2] =3D bin2bcd(alrm->time.tm_hour);
> +       buf[3] =3D bin2bcd(alrm->time.tm_mday);
> +       buf[4] =3D (alrm->time.tm_wday & 0x07);
> +
> +       dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=3D%d, wday=3D%d\n=
",
> +               __func__, alrm->time.tm_hour, alrm->time.tm_min,
> +               alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday=
);
> +
> +       ret =3D regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, =
buf,
> +                               sizeof(buf));
> +       if (ret) {
> +               dev_err(dev, "%s: failed to write alarm registers (%d)",
> +                       __func__, ret);
> +               return ret;
> +       }
> +
> +       pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       unsigned int ctrl2 =3D 0;
> +       int ret =3D 0;
> +
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +       if (ret) {
> +               dev_err(dev, "%s: ctrl2 read error (%d)\n", __func__, ret=
);
> +               goto irq_err;
> +       }
> +
> +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +       if (ret)
> +               goto irq_err;
> +
> +       if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
> +               regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                  PCF2127_BIT_CTRL2_AF, 0);
> +
> +               ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +               if (ret)
> +                       goto irq_err;
> +
> +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +       }

Do pcf2127_wdt_active_ping() here to avoid having the same code twice
in the function.

/Bruno

> +
> +       return IRQ_HANDLED;
> +irq_err:
> +       return IRQ_NONE;
> +}
> +
>  #ifdef CONFIG_RTC_INTF_DEV
>  static int pcf2127_rtc_ioctl(struct device *dev,
>                                 unsigned int cmd, unsigned long arg)
> @@ -211,9 +356,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
>  #endif
>
>  static const struct rtc_class_ops pcf2127_rtc_ops =3D {
> -       .ioctl          =3D pcf2127_rtc_ioctl,
> -       .read_time      =3D pcf2127_rtc_read_time,
> -       .set_time       =3D pcf2127_rtc_set_time,
> +       .ioctl            =3D pcf2127_rtc_ioctl,
> +       .read_time        =3D pcf2127_rtc_read_time,
> +       .set_time         =3D pcf2127_rtc_set_time,
> +       .read_alarm       =3D pcf2127_rtc_read_alarm,
> +       .set_alarm        =3D pcf2127_rtc_set_alarm,
> +       .alarm_irq_enable =3D pcf2127_rtc_alarm_irq_enable,
>  };
>
>  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> @@ -415,6 +563,7 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>                         const char *name, bool has_nvmem)
>  {
>         struct pcf2127 *pcf2127;
> +       int alarm_irq =3D 0;
>         u32 wdd_timeout;
>         int ret =3D 0;
>
> @@ -434,6 +583,20 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
>
>         pcf2127->rtc->ops =3D &pcf2127_rtc_ops;
>
> +       alarm_irq =3D of_irq_get_byname(dev->of_node, "alarm");
> +       if (alarm_irq >=3D 0) {
> +               ret =3D devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
> +                                      IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +                                      dev_name(dev), dev);
> +               if (ret) {
> +                       dev_err(dev, "failed to request alarm irq\n");
> +                       return ret;
> +               }
> +       }
> +
> +       if (alarm_irq >=3D 0 || device_property_read_bool(dev, "wakeup-so=
urce"))
> +               device_init_wakeup(dev, true);
> +
>         pcf2127->wdd.parent =3D dev;
>         pcf2127->wdd.info =3D &pcf2127_wdt_info;
>         pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> --
> 2.27.0
>
