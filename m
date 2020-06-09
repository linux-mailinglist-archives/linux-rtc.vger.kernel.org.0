Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF5C1F483C
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jun 2020 22:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFIUnE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 16:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgFIUnD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 16:43:03 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DECC05BD1E
        for <linux-rtc@vger.kernel.org>; Tue,  9 Jun 2020 13:43:03 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e12so17459299eds.2
        for <linux-rtc@vger.kernel.org>; Tue, 09 Jun 2020 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hKWEVk/WuU/tbRHHak5m28tcFjIGT0aeOA2jf5Uqkh8=;
        b=e764SDjZgCCGz3jOlMZvXcx/oLlOJxzvrDdSZdEWUFsavEUr+40thztpjiVlZE34ID
         eN2aZbzxg+I5PwMM2ZnTgS96crHN0E9r/mPRIvjjncPhkRaMAnABaPlgJWg0kqX/W/36
         BsI/VvnfLt9wmtxQb3IKp5XsK/kohm4KJPzSai0BsMCRMt14FWY/dIEvlsPrmaUuFq56
         jndjXieBwmHAZClRp05wy+aU/nN+pbWZddOSDOjqHg0mBjA3XXEajUCM7X/haHX96lAG
         U9/bnLIxMkzqof3dLsbcS7aotFOy2BjmnKIdtCYowrIKopTtxaFP0fDITseYQezHhdvr
         rG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hKWEVk/WuU/tbRHHak5m28tcFjIGT0aeOA2jf5Uqkh8=;
        b=q0qIkQEWU2wIdQ/nBLH9cDyEcqHQygYeTDYdnWVHW4QqFyEymaodOR3PYpWmrn+ogH
         Bh56sZ5dUXeCPzoKJiNrJ505ByzEleAPWJUABXVLUvxN82Z20Fnw5PW1scTVejv1Bngy
         TUJzS1gxs1q/1o/UfE4+i8Id4/66BGH1f0cdKcgNt6QBTcgxKwHpwhTvlofywHIbZEvN
         1CSy10e1VFV3Y8FN/7GIoFHphTriz0ItjC2zW0JzdV3JUKNvZe2Hy7nmI0A/y4aNdUCR
         e5m+vz8MUjUzBTV4/05mwZNWHclsFq3J9R1acau/TqzSV+9RqJkW1La24ksYV+lacUNp
         nlow==
X-Gm-Message-State: AOAM5307SzNAJgghD+tSG/G5yzc5wn9vb7bJ/JWG9BCWP4hwaa+w/GhB
        ZmfgyT/sF/YkJhwWLfEsbBV+Zxg5R6HRE5sbF4Q=
X-Google-Smtp-Source: ABdhPJw2wYX9RMvXVIgQWtJSzI7Lqjm6s+NspYXmkSAQAlbo4C6cj5n93ItWVWvCWpmxTCQIGhald99+5bN6zTBHsCg=
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr29393117edk.52.1591735381977;
 Tue, 09 Jun 2020 13:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200607170610.24534-1-liambeguin@gmail.com> <20200607170610.24534-3-liambeguin@gmail.com>
In-Reply-To: <20200607170610.24534-3-liambeguin@gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Tue, 9 Jun 2020 22:42:45 +0200
Message-ID: <CAH+2xPD=MgEC-WZQYK8gFbT40jzqxjNDR2Xc2WyC9okVswC6Yg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: pcf2127: add alarm support
To:     liambeguin@gmail.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Liam,

See comments below.

Den s=C3=B8n. 7. jun. 2020 kl. 19.06 skrev <liambeguin@gmail.com>:
>
> From: Liam Beguin <lvb@xiphos.com>
>
> From: Liam Beguin <lvb@xiphos.com>
>
> Add alarm support for the pcf2127 RTC chip family.
> Tested on pca2129.
>
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 120 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 396a1144a213..3eeb085a7c72 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -28,7 +28,9 @@
>  #define PCF2127_BIT_CTRL1_TSF1                 BIT(4)
>  /* Control register 2 */
>  #define PCF2127_REG_CTRL2              0x01
> +#define PCF2127_BIT_CTRL2_AIE                  BIT(1)
>  #define PCF2127_BIT_CTRL2_TSIE                 BIT(2)
> +#define PCF2127_BIT_CTRL2_AF                   BIT(4)
>  #define PCF2127_BIT_CTRL2_TSF2                 BIT(5)
>  /* Control register 3 */
>  #define PCF2127_REG_CTRL3              0x02
> @@ -46,6 +48,12 @@
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
> @@ -185,6 +193,107 @@ static int pcf2127_rtc_set_time(struct device *dev,=
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

Reading CTRL2 register causes watchdog to stop.

Aways call pcf2127_wdt_active_ping() after CTRL2 access to ensure the watch=
dog
is running if enabled.

> +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, b=
uf, 5);

Replace 5 with sizeof(buf).

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
> +       unsigned int ctrl2;
> +       int ret;
> +
> +       dev_dbg(dev, "%s: %s\n", __func__, enable ? "enable" : "disable")=
;

Delete debug trace.

> +
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +       if (ret) {
> +               dev_err(dev, "%s: ctrl2 read error\n", __func__);
> +               return ret;
> +       }
> +
> +       if (enable)
> +               ret =3D regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                  ctrl2 | PCF2127_BIT_CTRL2_AIE);
> +       else
> +               ret =3D regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                  ctrl2 & ~PCF2127_BIT_CTRL2_AIE);
> +
> +       if (ret) {
> +               dev_err(dev, "%s: failed to enable alarm (%d)\n", __func_=
_,
> +                       ret);
> +               return ret;
> +       }

Replace regmap_read() and regmap_write() with a regmap_update_bits().

So something like:

ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
                                          enabled ? PCF2127_REG_CTRL2 : 0);

And remember to call pcf2127_wdt_active_ping().

> +
> +       return 0;
> +}
> +
> +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *=
alrm)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       unsigned int ctrl2;
> +       uint8_t buf[5];
> +       int ret;
> +
> +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                                PCF2127_BIT_CTRL2_AF,
> +                                (unsigned int)~PCF2127_BIT_CTRL2_AF);

If you just want to clear the AF bit in CTRL2, just do:

ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
                                           PCF2127_BIT_CTRL2_AF, 0);

> +       if (ret) {
> +               dev_err(dev, "%s: failed to clear alarm interrupt flag (%=
d)",
> +                       __func__, ret);
> +               return ret;
> +       }
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
buf, 5);

Replace 5 with sizeof(buf).

/Bruno

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
>  #ifdef CONFIG_RTC_INTF_DEV
>  static int pcf2127_rtc_ioctl(struct device *dev,
>                                 unsigned int cmd, unsigned long arg)
> @@ -211,9 +320,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
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
> @@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>
>         pcf2127->rtc->ops =3D &pcf2127_rtc_ops;
>
> +       device_init_wakeup(dev, true);
> +
>         pcf2127->wdd.parent =3D dev;
>         pcf2127->wdd.info =3D &pcf2127_wdt_info;
>         pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> --
> 2.27.0
>
