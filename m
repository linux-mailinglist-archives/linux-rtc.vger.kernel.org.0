Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C4D20EB5C
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 04:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgF3CPR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 22:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgF3CPR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 22:15:17 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DFAC061755
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:15:17 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id u8so8604970qvj.12
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:in-reply-to:date:cc:subject:from:to
         :message-id;
        bh=d2igEZv1NSNJTDRHt2TSuS3TyFGS0rPHG/K448k+v5I=;
        b=QEJVaITkkDyzWvLSznDPp5FBdpQxEAGBygzUQHpxhujLajghp+6KuGwnoljHy8c0sz
         yW8reP9Ykj1pJ7oDGXw86y+r3SCbo5lItRDZaAa2axDNY0UrpHTVJ4zlaOzXJnB74xoA
         JIZtuvdNYpz/CkHgybdNeqUYYzejGwMTHTHDOqMUlQolbu7vlYYcFgEcZFKQvfJwDT3L
         7HqSXXnJXgGQoBi1z0SgoIv0Gr1fvpQYel6bqcBwMybCcdpodY1PFo0hN45KME3ZYtV5
         6ZDCxP0GsafIa0YIc/D6+qTDiq4VHRzAGje+kWl9K7w9tIvsSHzYlg8vXhWZFdNEzL5v
         Fy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:cc
         :subject:from:to:message-id;
        bh=d2igEZv1NSNJTDRHt2TSuS3TyFGS0rPHG/K448k+v5I=;
        b=Iu8SdIMt5o1h9xZlzOeO5F0oGsnXLikTIdQXcNZ6nxu+knM4/lqrM1PPyni4MH5spi
         7cRtWy8bE079m99NMaRsBRWe2EGc+B+tWKkftwbrx1atmVp51OoGltG7pZm2Ft9/cQXG
         zI98jZpVXAIN83TH+CqrrdwLw6+h5abxsgV/9a3dkqbvASc9q0mTZOCN8IPElAbhjhK2
         SmeBjkeIr/0d0at2OGhlJSAhkFPmDRX/DorQKo+4G3MiqC4LLj4iYh3Uluzgy6hl4wTN
         nMhtFRNF7b+JybGMuT/r0iTOHExYrkPBbrAi1HN6xh1JvhoLet/rGqJKh++9NE9mUyF6
         ZJag==
X-Gm-Message-State: AOAM531+nikig5rGUGo+5Jfxw4USvSphAc/4/9DUdxTXLjax7Mk7YHMZ
        bVufIRwHgOL/YzClQR5EBZ4=
X-Google-Smtp-Source: ABdhPJxgfJfioicMZODlQ13Aib8G6ka6HDX8pbXQ0ubtmFA5r20dPrZxbhGADRBlcyxSVcYQ1Y+KPA==
X-Received: by 2002:a0c:f548:: with SMTP id p8mr18069389qvm.149.1593483316266;
        Mon, 29 Jun 2020 19:15:16 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p3sm1723891qtl.21.2020.06.29.19.15.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 19:15:15 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <CAH+2xPA2_gUMV_+BoDx9_9Z_kqH+b5V-arKSYFoVBJS5TVGsmw@mail.gmail.com>
Date:   Mon, 29 Jun 2020 22:15:14 -0400
Cc:     "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] rtc: pcf2127: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Bruno Thomsen" <bruno.thomsen@gmail.com>
Message-Id: <C3U2OWM4LKMC.28K4KYY4UYW6G@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat Jun 27, 2020 at 2:32 PM Bruno Thomsen wrote:
> Den fre. 19. jun. 2020 kl. 06.12 skrev Liam Beguin <liambeguin@gmail.com>=
:
> >
> > From: Liam Beguin <lvb@xiphos.com>
> >
> > Add alarm support for the pcf2127 RTC chip family.
> > Tested on pca2129.
> >
> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> > Changes since v1:
> > - Add calls to pcf2127_wdt_active_ping after accessing CTRL2
> > - Cleanup calls to regmap_{read,write,update_bits}
> > - Cleanup debug trace
> > - Add interrupt handler, untested because of hardware limitations
> > - Add wakeup-source devicetree option
> >
> > Changes since v2:
> > - Avoid forward declaration of pcf2127_wdt_active_ping
> > - Remove dev_err strings
> > - Remove dev_dbg traces since they are now part of the core
> > - Remove redundant if in pcf2127_rtc_alarm_irq_enable
> > - Remove duplicate watchdog ping in pcf2127_rtc_irq
> > - Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
> > - Add extra rtc_class_ops struct with alarm functions
> >
> >  drivers/rtc/rtc-pcf2127.c | 136 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 136 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 4accee09bfad..df09d3c6c5c3 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/regmap.h>
> >  #include <linux/watchdog.h>
> >
> > @@ -28,7 +29,9 @@
> >  #define PCF2127_BIT_CTRL1_TSF1                 BIT(4)
> >  /* Control register 2 */
> >  #define PCF2127_REG_CTRL2              0x01
> > +#define PCF2127_BIT_CTRL2_AIE                  BIT(1)
> >  #define PCF2127_BIT_CTRL2_TSIE                 BIT(2)
> > +#define PCF2127_BIT_CTRL2_AF                   BIT(4)
> >  #define PCF2127_BIT_CTRL2_TSF2                 BIT(5)
> >  /* Control register 3 */
> >  #define PCF2127_REG_CTRL3              0x02
> > @@ -46,6 +49,12 @@
> >  #define PCF2127_REG_DW                 0x07
> >  #define PCF2127_REG_MO                 0x08
> >  #define PCF2127_REG_YR                 0x09
> > +/* Alarm registers */
> > +#define PCF2127_REG_ALARM_SC           0x0A
> > +#define PCF2127_REG_ALARM_MN           0x0B
> > +#define PCF2127_REG_ALARM_HR           0x0C
> > +#define PCF2127_REG_ALARM_DM           0x0D
> > +#define PCF2127_REG_ALARM_DW           0x0E
> >  /* Watchdog registers */
> >  #define PCF2127_REG_WD_CTL             0x10
> >  #define PCF2127_BIT_WD_CTL_TF0                 BIT(0)
> > @@ -324,6 +333,116 @@ static const struct watchdog_ops pcf2127_watchdog=
_ops =3D {
> >         .set_timeout =3D pcf2127_wdt_set_timeout,
> >  };
> >
> > +/* Alarm */
> > +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       unsigned int buf[5], ctrl2;
> > +       int ret;
> > +
> > +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2)=
;
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC,=
 buf,
> > +                              sizeof(buf));
> > +       if (ret)
> > +               return ret;
> > +
> > +       alrm->enabled =3D ctrl2 & PCF2127_BIT_CTRL2_AIE;
> > +       alrm->pending =3D ctrl2 & PCF2127_BIT_CTRL2_AF;
> > +
> > +       alrm->time.tm_sec =3D bcd2bin(buf[0] & 0x7F);
> > +       alrm->time.tm_min =3D bcd2bin(buf[1] & 0x7F);
> > +       alrm->time.tm_hour =3D bcd2bin(buf[2] & 0x3F);
> > +       alrm->time.tm_mday =3D bcd2bin(buf[3] & 0x3F);
> > +       alrm->time.tm_wday =3D buf[4] & 0x07;
> > +
> > +       return 0;
> > +}
> > +
> > +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable=
)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                                PCF2127_BIT_CTRL2_AIE,
> > +                                enable ? PCF2127_BIT_CTRL2_AIE : 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +}
> > +
> > +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       uint8_t buf[5];
> > +       int ret;
> > +
> > +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                                PCF2127_BIT_CTRL2_AF, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +       if (ret)
> > +               return ret;
> > +
> > +       buf[0] =3D bin2bcd(alrm->time.tm_sec);
> > +       buf[1] =3D bin2bcd(alrm->time.tm_min);
> > +       buf[2] =3D bin2bcd(alrm->time.tm_hour);
> > +       buf[3] =3D bin2bcd(alrm->time.tm_mday);
> > +       buf[4] =3D (alrm->time.tm_wday & 0x07);
> > +
> > +       ret =3D regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC=
, buf,
> > +                               sizeof(buf));
> > +       if (ret)
> > +               return ret;
> > +
> > +       return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> > +}
> > +
> > +static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       unsigned int ctrl2 =3D 0;
> > +       int ret =3D 0;
> > +
> > +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2)=
;
> > +       if (ret)
> > +               goto irq_err;
> > +
> > +       if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
> > +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                            ctrl2 & ~PCF2127_BIT_CTRL2_AF);
> > +
> > +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> > +       }
> > +
> > +       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +       if (ret)
> > +               goto irq_err;
> > +
> > +       return IRQ_HANDLED;
> > +irq_err:
> > +       return IRQ_NONE;

Hi Bruno,

>=20
> It's not really needed to use "goto irq_err;" syntax as there is no
> common error cleanup
> path and can simply be replaced by "return IRQ_NONE;".
>=20
> Overall this feature looks good to me.
>=20
> Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
>=20
> /Bruno
>=20

I'll send another revision getting rid of the goto. I'll also add your
Reviewed-by on both patches.

Thanks again for reviewing this,
Liam

> > +}
> > +
> > +static const struct rtc_class_ops pcf2127_rtc_alrm_ops =3D {
> > +       .ioctl            =3D pcf2127_rtc_ioctl,
> > +       .read_time        =3D pcf2127_rtc_read_time,
> > +       .set_time         =3D pcf2127_rtc_set_time,
> > +       .read_alarm       =3D pcf2127_rtc_read_alarm,
> > +       .set_alarm        =3D pcf2127_rtc_set_alarm,
> > +       .alarm_irq_enable =3D pcf2127_rtc_alarm_irq_enable,
> > +};
> > +
> >  /* sysfs interface */
> >
> >  static ssize_t timestamp0_store(struct device *dev,
> > @@ -419,6 +538,7 @@ static int pcf2127_probe(struct device *dev, struct=
 regmap *regmap,
> >                         const char *name, bool has_nvmem)
> >  {
> >         struct pcf2127 *pcf2127;
> > +       int alarm_irq =3D 0;
> >         u32 wdd_timeout;
> >         int ret =3D 0;
> >
> > @@ -441,6 +561,22 @@ static int pcf2127_probe(struct device *dev, struc=
t regmap *regmap,
> >         pcf2127->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> >         pcf2127->rtc->set_start_time =3D true; /* Sets actual start to =
1970 */
> >
> > +       alarm_irq =3D of_irq_get_byname(dev->of_node, "alarm");
> > +       if (alarm_irq >=3D 0) {
> > +               ret =3D devm_request_irq(dev, alarm_irq, pcf2127_rtc_ir=
q,
> > +                                      IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> > +                                      dev_name(dev), dev);
> > +               if (ret) {
> > +                       dev_err(dev, "failed to request alarm irq\n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       if (alarm_irq >=3D 0 || device_property_read_bool(dev, "wakeup-=
source")) {
> > +               device_init_wakeup(dev, true);
> > +               pcf2127->rtc->ops =3D &pcf2127_rtc_alrm_ops;
> > +       }
> > +
> >         pcf2127->wdd.parent =3D dev;
> >         pcf2127->wdd.info =3D &pcf2127_wdt_info;
> >         pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> > --
> > 2.27.0
> >
