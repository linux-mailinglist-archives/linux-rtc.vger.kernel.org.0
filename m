Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DE83B2766
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 08:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFXGdj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 02:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFXGdh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 02:33:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A81C061574;
        Wed, 23 Jun 2021 23:31:18 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id hq39so7720958ejc.5;
        Wed, 23 Jun 2021 23:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H2iJrlJtPXN3NwQz35MWvG+TuEFicHcxNbxI08ENTP0=;
        b=h8qNMuto94b1n8f5xkYxILSAQOSHre2jeYS8RN7mDpP8nSfpbkjFhPthF2ZyK3DfSg
         HNDuG6QQt9pezlgepuG/2zp2gbMP2wVs+k1IBFtelP2cOAI+byCYF7G0wCwu9fwltCPU
         OEUHBQteh+zzjjSv76MpVMeDwS9QKnHq1Vcrvt2QvUrMFPMAKScO+/ovBL/qWL9uze/b
         eagYCevsgt7l88XqdMppNFZAFc+UZ4qv+o1EqZsQHBcdMUycY1q7gdDm6rfyt6mpy3Ek
         Ao74DobH1L8NIAby+Mi2pZS3PtKG5YmVZEKr6gT/jyyh44bIc1qvUoORE+86H7vf2/rc
         qqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H2iJrlJtPXN3NwQz35MWvG+TuEFicHcxNbxI08ENTP0=;
        b=n3Q6u6reKUS2YiRsYymWL7OwMGJBUlqxP0Yw5Kx8Xp9F9oa3+v/RMUseJA/xauzVY+
         Twk4q5dJq5Mc4O+yS5bZL6mXMb6L6rq8vPlwqZ5xy08f0Ko6oNJYeZaEzPYY1BFuEQdU
         Mc9DRmua3TsL6o8tgBRvwErhVl4Gcx2sujCCgIWiLO98F8fJ89MLWTa4f1TL9fo3IVgK
         LM7L+rgTjWhqFHp7RnBPWIPl3rbWExTuNGGyXcXc3O8Jj6YFCimVe1UNHbAXxm23QVJa
         4WaHezIiSuvMuxI6doCbOIIgy57BO6TTsClBTIqrW1QWJ/prwgXrl5vlcT0wSKzUTah9
         6hmA==
X-Gm-Message-State: AOAM5309efNyHO4mSQgVNKrpoHr9u7V9emcIhayUGWXrqTyP+GwoTtGa
        maxK3bq3g0aoPzdBP7aiybHukSr7uLhftb1ITOY=
X-Google-Smtp-Source: ABdhPJw/OkzSfnDm4gl4Yz261edN1Y3jTnJEvkh2YGv2M9kTLt4lEORrFswa117RZ2ioRuwYOU4XPkvbOJlWZqUIrEk=
X-Received: by 2002:a17:906:28d5:: with SMTP id p21mr3676919ejd.358.1624516276800;
 Wed, 23 Jun 2021 23:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210602104956.806-1-ykaukab@suse.de>
In-Reply-To: <20210602104956.806-1-ykaukab@suse.de>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 24 Jun 2021 08:31:00 +0200
Message-ID: <CAH+2xPAL0w4Urjpxopu8g-kGveTxLXAm8EVUc8s8xpX=fb7NeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v4] rtc: pcf2127: handle timestamp interrupts
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

Hi Mian,

Den ons. 2. jun. 2021 kl. 17.19 skrev Mian Yousaf Kaukab <ykaukab@suse.de>:
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

This must have been introduced when alarm IRQ was added, as
I always thought that tamper IRQ should be handled in user space
with gpiomon. I can see that it looks like I only added a cover letter
to the first 2 versions of patch series[1] and not the 3rd that got applied=
[2].
It contains a link to how the tamper timestamp feature was tested[3].
The script is a simple version of what is running in the product, but
missing D-Bus call with busctl and hardware init when booted for the
first time.

I have just tested your patch with an upstream device tree[4] that uses
the tamper feature, and that does not work. Probably caused by the
fact that it does not use RTC alarm IRQ.

What device tree did you see the error on? If it's not upstream can you
share how you configured the pcf2127 chip?

I am not against changing how the tamper feature works, but I would like
to see the upstream device tree[4] work before merging this patch.

/Bruno

[1] https://patchwork.ozlabs.org/project/rtc-linux/cover/20190813153600.124=
06-1-bruno.thomsen@gmail.com/
[2] https://patchwork.ozlabs.org/project/rtc-linux/patch/20190822131936.187=
72-5-bruno.thomsen@gmail.com/
[3] https://github.com/baxeno/linux-emc-test/blob/master/tamper/tamper.sh
[4] https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/imx7d-=
flex-concentrator.dts

> Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
> before clearing TSF1 and TSF2 flags so that it can't be overwritten.
> Set a flag to mark if the timestamp is valid and only report to sysfs
> if the flag is set. To mimic the hardware behavior, don=E2=80=99t save
> another timestamp until the first one has been read by the userspace.
>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
>  drivers/rtc/rtc-pcf2127.c | 130 ++++++++++++++++++++++----------------
>  1 file changed, 76 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index d13c20a2adf7..7d55f737f38e 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -94,10 +94,19 @@
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
>  };
>
>  /*
> @@ -434,23 +443,82 @@ static int pcf2127_rtc_set_alarm(struct device *dev=
, struct rtc_wkalrm *alrm)
>         return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
>  }
>
> +static void pcf2127_rtc_ts_snapshot(struct device *dev)
> +{
> +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> +       struct rtc_time tm;
> +       int ret;
> +       unsigned char data[25];
> +
> +       /* Let userspace read the first timestamp */
> +       if (pcf2127->ts_valid)
> +               return;
> +
> +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data=
,
> +                              sizeof(data));
> +       if (ret) {
> +               dev_err(dev, "%s: read error ret=3D%d\n", __func__, ret);
> +               return;
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
> +               return;
> +       }
> +
> +       pcf2127->ts =3D rtc_tm_to_time64(&tm);
> +       pcf2127->ts_valid =3D true;
> +};
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
>
> -       rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +       if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
> +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
> +                       ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
> +
> +       if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
> +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +                       ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
> +
> +       if (ctrl2 & PCF2127_BIT_CTRL2_AF)
> +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
>
>         pcf2127_wdt_active_ping(&pcf2127->wdd);
>
> @@ -475,19 +543,7 @@ static ssize_t timestamp0_store(struct device *dev,
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
> -
> -       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> -                                PCF2127_BIT_CTRL2_TSF2, 0);
> -       if (ret) {
> -               dev_err(dev, "%s: update ctrl2 ret=3D%d\n", __func__, ret=
);
> -               return ret;
> -       }
> +       pcf2127->ts_valid =3D false;
>
>         ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
>         if (ret)
> @@ -500,50 +556,16 @@ static ssize_t timestamp0_show(struct device *dev,
>                                struct device_attribute *attr, char *buf)
>  {
>         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);
> -       struct rtc_time tm;
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
>
>         ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
>         if (ret)
>                 return ret;
>
> -       if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
> -           !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
> +       if (!pcf2127->ts_valid)
>                 return 0;
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
> -
> -       return sprintf(buf, "%llu\n",
> -                      (unsigned long long)rtc_tm_to_time64(&tm));
> +       return sprintf(buf, "%llu\n", (unsigned long long)pcf2127->ts);
>  };
>
>  static DEVICE_ATTR_RW(timestamp0);
> --
> 2.26.2
>
