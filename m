Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86813B8865
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jun 2021 20:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhF3S2v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 30 Jun 2021 14:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhF3S2v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 30 Jun 2021 14:28:51 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE30C061756;
        Wed, 30 Jun 2021 11:26:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w17so4577467edd.10;
        Wed, 30 Jun 2021 11:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A4DSim85cEL04A6jshzq7TJ6zVaYIOErI8yCN4Fe/kA=;
        b=WZS8edPDT+SnLVnNEj9mkyuxG5wOyvB+zQb8kbk11LkVRzyieQQ7j4sw3nSQfCMJfN
         BDR0mM6pbuqrYpnzFlIWVzWQuU4balccDuE3xwg8CmZHynr+IcJFih+LrhjR9iXQRdA3
         q0A3wk3PFVAco767CE+VjPvoCbX/s9ENbcqwzPI5Xsjspq4f16VsyH2xyyPr4RRgUkcE
         oqo6RlIKrtIH7SNtYlluV8I56SX/Ddc4EELbgNGqimH6HvyX5yAZ6ss7iThCrtrxKZXs
         sze/sM3okq9kexjarRf8HZ1IIBzlayUxs/zPs6LIExgaeoaaWWRX9U46TeGJ8ML7lzzD
         cSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A4DSim85cEL04A6jshzq7TJ6zVaYIOErI8yCN4Fe/kA=;
        b=LNNcyI0FSgzzvWZKZj/U036opQnJNrJQiKwFQH1X3rdkTXdpU2x3fbl7V74D06xS+f
         0MAjPZh2xQqYC3AljRtPsT3H0UydXGNa9y6Htst+VL4FYeaLXIEPUUTA0W7EsBOrpyUt
         ABy5nGvkv/zr0/CcHjcAnsmAXFCtI7xR34WubZGwRtislVmc0G/BzgkPLNpAhcjEARAH
         bM9VW9RiENX58fg/xvdTlXh6B0W4pG6s0ay8xVImjMgoxBPD2wn6QxbVHb46ULteyRX+
         KP1b/+t47sJ0C547DT5QABiFCdwi+zbtbdky1iZ/m8TQNKrO7vHy/I1u+HXAg5F/XQci
         DTYg==
X-Gm-Message-State: AOAM533zBlYruHMMsX8a1vyYdVnKMkfhuK+ixor1H4EqSMW33SKvfYuf
        7nDdAhaCI2j8VFl6HR5BhC5gOZ5JBePJx7gvPdo=
X-Google-Smtp-Source: ABdhPJyQoUSFiP2YQ05xABwS54zttS1hGP9tmwk4qTCYtkCiBl2KEN/GMm7+rv55Yz/qt4WTT26DgToP5akMkrwv58Y=
X-Received: by 2002:a05:6402:406:: with SMTP id q6mr48278732edv.149.1625077580298;
 Wed, 30 Jun 2021 11:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210629150643.31551-1-ykaukab@suse.de>
In-Reply-To: <20210629150643.31551-1-ykaukab@suse.de>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Wed, 30 Jun 2021 20:26:04 +0200
Message-ID: <CAH+2xPAYD--=RWHTw8yuUGb7xKWUd+hGo7QHCsKzz8BNzNwUbA@mail.gmail.com>
Subject: Re: [PATCH v6] rtc: pcf2127: handle timestamp interrupts
To:     Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den tir. 29. jun. 2021 kl. 17.06 skrev Mian Yousaf Kaukab <ykaukab@suse.de>=
:
>
> commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> added support for timestamp interrupts. However they are not being
> handled in the irq handler. If a timestamp interrupt occurs it
> results in kernel disabling the interrupt and displaying the call
> trace:
>
> [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" optio=
n)
> ...
> [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded =
[<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> [  121.248971] Disabling IRQ #78
>
> Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
> before clearing TSF1 and TSF2 flags so that it can't be overwritten.
> Set a flag to mark if the timestamp is valid and only report to sysfs
> if the flag is set. To mimic the hardware behavior, don=E2=80=99t save
> another timestamp until the first one has been read by the userspace.
>
> However, if the alarm irq is not configured, keep the old way of
> handling timestamp interrupt in the timestamp0 sysfs calls.
>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
> Sorry, once again compile tested only due to lack of hardware
> availability. Hopefully, I will be able to do some real tests tomorrow.

Hi Yousaf,

I have tested patch version 6 on an imx7 board with the pcf2127
chip using SPI interface and no alarm IRQ in the device tree.
The same board that produced an oops earlier, and now it's working
as expected. Both tamper events that occur when the device is
powered on and when an event happens with the device powered off.

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
Tested-by: Bruno Thomsen <bruno.thomsen@gmail.com>

/Bruno

>
> history:
> v6: -Fix pcf2127_wdt_active_ping() calls according to comments from Bruno
>     -Call pcf2127_rtc_ts_read() with correct dev pointer
> v5: -Add irq_enabled flag to keep track of alarm irq. Revert
>      to current way of handling timestamp interrupt in sysfs callsbacks
>      if alarm irq is not configured
> v4: -Save timestamp before clearing TSF1 and TSF2 flags
>     -Rename timstamp_valid flag to ts_valid
> v3: -Restore call to pcf2127_wdt_active_ping() in timestamp0_store().
>      It was removed by mistake.
> v2: -Add a flag to mark the occurrence of timestamp interrupt
>     -Add Biwen Li in Cc
>
>  drivers/rtc/rtc-pcf2127.c | 192 ++++++++++++++++++++++++++------------
>  1 file changed, 133 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 48ce1e85deb1..56c58b055dff 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -94,10 +94,20 @@
>  #define PCF2127_WD_VAL_MAX             255
>  #define PCF2127_WD_VAL_DEFAULT         60
>
> +/* Mask for currently enabled interrupts */
> +#define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
> +#define PCF2127_CTRL2_IRQ_MASK ( \
> +               PCF2127_BIT_CTRL2_AF | \
> +               PCF2127_BIT_CTRL2_WDTF | \
> +               PCF2127_BIT_CTRL2_TSF2)
> +
>  struct pcf2127 {
>         struct rtc_device *rtc;
>         struct watchdog_device wdd;
>         struct regmap *regmap;
> +       time64_t ts;
> +       bool ts_valid;
> +       bool irq_enabled;
>  };
>
>  /*
> @@ -434,23 +444,96 @@ static int pcf2127_rtc_set_alarm(struct device *dev=
, struct rtc_wkalrm *alrm)
>         return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
>  }
>
> +/*
> + * This function reads ctrl2 register, caller is responsible for calling
> + * pcf2127_wdt_active_ping()
> + */
> +static int pcf2127_rtc_ts_read(struct device *dev, time64_t *ts)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       struct rtc_time tm;
> +       int ret;
> +       unsigned char data[25];
> +
> +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data=
,
> +                              sizeof(data));
> +       if (ret) {
> +               dev_err(dev, "%s: read error ret=3D%d\n", __func__, ret);
> +               return ret;
> +       }
> +
> +       dev_dbg(dev,
> +               "%s: raw data is cr1=3D%02x, cr2=3D%02x, cr3=3D%02x, ts_s=
c=3D%02x, ts_mn=3D%02x, ts_hr=3D%02x, ts_dm=3D%02x, ts_mo=3D%02x, ts_yr=3D%=
02x\n",
> +               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2=
],
> +               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> +               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> +               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> +               data[PCF2127_REG_TS_YR]);
> +
> +       tm.tm_sec =3D bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> +       tm.tm_min =3D bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> +       tm.tm_hour =3D bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> +       tm.tm_mday =3D bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> +       /* TS_MO register (month) value range: 1-12 */
> +       tm.tm_mon =3D bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> +       tm.tm_year =3D bcd2bin(data[PCF2127_REG_TS_YR]);
> +       if (tm.tm_year < 70)
> +               tm.tm_year +=3D 100; /* assume we are in 1970...2069 */
> +
> +       ret =3D rtc_valid_tm(&tm);
> +       if (ret) {
> +               dev_err(dev, "Invalid timestamp. ret=3D%d\n", ret);
> +               return ret;
> +       }
> +
> +       *ts =3D rtc_tm_to_time64(&tm);
> +       return 0;
> +};
> +
> +static void pcf2127_rtc_ts_snapshot(struct device *dev)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       /* Let userspace read the first timestamp */
> +       if (pcf2127->ts_valid)
> +               return;
> +
> +       ret =3D pcf2127_rtc_ts_read(dev, &pcf2127->ts);
> +       if (!ret)
> +               pcf2127->ts_valid =3D true;
> +}
> +
>  static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
>  {
>         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> -       unsigned int ctrl2 =3D 0;
> +       unsigned int ctrl1, ctrl2;
>         int ret =3D 0;
>
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
> +       if (ret)
> +               return IRQ_NONE;
> +
>         ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
>         if (ret)
>                 return IRQ_NONE;
>
> -       if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
> +       if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ=
_MASK))
>                 return IRQ_NONE;
>
> -       regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> -                    ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2_W=
DTF));
> +       if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_T=
SF2)
> +               pcf2127_rtc_ts_snapshot(dev);
> +
> +       if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
> +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
> +                       ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
> +
> +       if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
> +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                       ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
>
> -       rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +       if (ctrl2 & PCF2127_BIT_CTRL2_AF)
> +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
>
>         pcf2127_wdt_active_ping(&pcf2127->wdd);
>
> @@ -475,23 +558,27 @@ static ssize_t timestamp0_store(struct device *dev,
>         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);
>         int ret;
>
> -       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> -                                PCF2127_BIT_CTRL1_TSF1, 0);
> -       if (ret) {
> -               dev_err(dev, "%s: update ctrl1 ret=3D%d\n", __func__, ret=
);
> -               return ret;
> -       }
> +       if (pcf2127->irq_enabled) {
> +               pcf2127->ts_valid =3D false;
> +       } else {
> +               ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_C=
TRL1,
> +                       PCF2127_BIT_CTRL1_TSF1, 0);
> +               if (ret) {
> +                       dev_err(dev, "%s: update ctrl1 ret=3D%d\n", __fun=
c__, ret);
> +                       return ret;
> +               }
>
> -       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> -                                PCF2127_BIT_CTRL2_TSF2, 0);
> -       if (ret) {
> -               dev_err(dev, "%s: update ctrl2 ret=3D%d\n", __func__, ret=
);
> -               return ret;
> -       }
> +               ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_C=
TRL2,
> +                       PCF2127_BIT_CTRL2_TSF2, 0);
> +               if (ret) {
> +                       dev_err(dev, "%s: update ctrl2 ret=3D%d\n", __fun=
c__, ret);
> +                       return ret;
> +               }
>
> -       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> -       if (ret)
> -               return ret;
> +               ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +               if (ret)
> +                       return ret;
> +       }
>
>         return count;
>  };
> @@ -500,50 +587,36 @@ static ssize_t timestamp0_show(struct device *dev,
>                                struct device_attribute *attr, char *buf)
>  {
>         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);
> -       struct rtc_time tm;
> +       unsigned int ctrl1, ctrl2;
>         int ret;
> -       unsigned char data[25];
> -
> -       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data=
,
> -                              sizeof(data));
> -       if (ret) {
> -               dev_err(dev, "%s: read error ret=3D%d\n", __func__, ret);
> -               return ret;
> -       }
> -
> -       dev_dbg(dev,
> -               "%s: raw data is cr1=3D%02x, cr2=3D%02x, cr3=3D%02x, ts_s=
c=3D%02x, "
> -               "ts_mn=3D%02x, ts_hr=3D%02x, ts_dm=3D%02x, ts_mo=3D%02x, =
ts_yr=3D%02x\n",
> -               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2=
],
> -               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> -               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> -               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> -               data[PCF2127_REG_TS_YR]);
> +       time64_t ts;
> +
> +       if (pcf2127->irq_enabled) {
> +               if (!pcf2127->ts_valid)
> +                       return 0;
> +               ts =3D pcf2127->ts;
> +       } else {
> +               ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &=
ctrl1);
> +               if (ret)
> +                       return 0;
>
> -       ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> -       if (ret)
> -               return ret;
> +               ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &=
ctrl2);
> +               if (ret)
> +                       return 0;
>
> -       if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
> -           !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
> -               return 0;
> +               if (!(ctrl1 & PCF2127_BIT_CTRL1_TSF1) &&
> +                   !(ctrl2 & PCF2127_BIT_CTRL2_TSF2))
> +                       return 0;
>
> -       tm.tm_sec =3D bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> -       tm.tm_min =3D bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> -       tm.tm_hour =3D bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> -       tm.tm_mday =3D bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> -       /* TS_MO register (month) value range: 1-12 */
> -       tm.tm_mon =3D bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> -       tm.tm_year =3D bcd2bin(data[PCF2127_REG_TS_YR]);
> -       if (tm.tm_year < 70)
> -               tm.tm_year +=3D 100; /* assume we are in 1970...2069 */
> -
> -       ret =3D rtc_valid_tm(&tm);
> -       if (ret)
> -               return ret;
> +               ret =3D pcf2127_rtc_ts_read(dev->parent, &ts);
> +               if (ret)
> +                       return 0;
>
> -       return sprintf(buf, "%llu\n",
> -                      (unsigned long long)rtc_tm_to_time64(&tm));
> +               ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> +               if (ret)
> +                       return ret;
> +       }
> +       return sprintf(buf, "%llu\n", (unsigned long long)ts);
>  };
>
>  static DEVICE_ATTR_RW(timestamp0);
> @@ -594,6 +667,7 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>                         dev_err(dev, "failed to request alarm irq\n");
>                         return ret;
>                 }
> +               pcf2127->irq_enabled =3D true;
>         }
>
>         if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-sourc=
e")) {
> --
> 2.26.2
>
