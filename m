Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0263F1F57F3
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 17:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbgFJPiF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 11:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgFJPiE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 11:38:04 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACC2C03E96B
        for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2020 08:38:04 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e16so2106577qtg.0
        for <linux-rtc@vger.kernel.org>; Wed, 10 Jun 2020 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:in-reply-to:date:cc:subject:from:to
         :message-id;
        bh=U3sn/BTReTOR195PhwKhheSBJl3Vco39Za/zPMkTs8Y=;
        b=nFYQ/L6XKKUab2IE8BQK1bV/+c2dkK+hqtDzY1Gy1emjZWzM0UWWNQ7d588gJYmPpd
         mbwWyqpCHwvYvbhxanj396GvOGSl5BszazJu2GqI24FDgc0wIvTKtFC9YIcaIHuY/yDb
         DIZusktltbP45gkbTh32NijhEbW6KFdwPXUUepOjnuq9+rjxDjsfpHUc/BKhxmsnCeZd
         L2C8GyUM+C2P85gcWqgKQjdI6mpggn2SHlXXZ2xGGjLWkZJzHn7iWWNGK0+n8K9QqVP4
         9vHjwGZ6m6EvT7UyygcNTcTBki6//Ap0PhLOiD9yOqAcmkAPgdhi4YxRP3DV05Cixhco
         LgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:cc
         :subject:from:to:message-id;
        bh=U3sn/BTReTOR195PhwKhheSBJl3Vco39Za/zPMkTs8Y=;
        b=udQ8Bzd9JU6jfPoo8ece6SNJT9IOaugDKq56aza9RbMTDeisJC2B4PsWkTabQJ8E3s
         1PWJ/9KHi01qJrYEU2zs8bglVx++LKIC8/EseBQeloqyxmy3laro3v5yqWgSfdmzOvto
         dMzJEnBUcC5LVVcz+73+tmyWSaKctHP2CaKUMdPZ6mIzxTX4XfVDWcdV0b/WFtoFQlv1
         Lb2c4MCyz1WDFx6Jd/rVlKtnft4xfH0ILVIPavUYoSpikJa9TNqiriwvjNbkJk7j4oX4
         mZp7UYkVFfVQzhgq5CeeDfQ5b56hJ0U+ewZEWlNrUoRG+C5S521fiRvJAfMAaxbjfXM0
         65zQ==
X-Gm-Message-State: AOAM530YC5nD9GjQV/6+7EZC2URheUZP+P5H65ioSVuj0Q3qW05rS8fi
        1qKQW2/crbDnCIcU4b4W0bkI0oBv
X-Google-Smtp-Source: ABdhPJz29FY2idy0Rrq0mL73RLpCcxtAbNJor5O6dd62p5qj4nd5xvGWlUSk838Era7Ln3jurTesig==
X-Received: by 2002:ac8:7c2:: with SMTP id m2mr3814337qth.282.1591803482971;
        Wed, 10 Jun 2020 08:38:02 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id 137sm30861qkf.44.2020.06.10.08.38.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 08:38:01 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <CAH+2xPD=MgEC-WZQYK8gFbT40jzqxjNDR2Xc2WyC9okVswC6Yg@mail.gmail.com>
Date:   Wed, 10 Jun 2020 11:38:01 -0400
Cc:     "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 2/3] rtc: pcf2127: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Bruno Thomsen" <bruno.thomsen@gmail.com>
Message-Id: <C3DJ8NZ5LS2R.2SSTTAUS4K16S@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Bruno,

Thanks for your comments, I've updated the patch and will send a v2
soon.

On Tue Jun 9, 2020 at 10:42 PM Bruno Thomsen wrote:
> Hi Liam,
>=20
> See comments below.
>=20
> Den s=C3=B8n. 7. jun. 2020 kl. 19.06 skrev <liambeguin@gmail.com>:
> >
> > From: Liam Beguin <lvb@xiphos.com>
> >
> > From: Liam Beguin <lvb@xiphos.com>
> >
> > Add alarm support for the pcf2127 RTC chip family.
> > Tested on pca2129.
> >
> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 120 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 117 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 396a1144a213..3eeb085a7c72 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -28,7 +28,9 @@
> >  #define PCF2127_BIT_CTRL1_TSF1                 BIT(4)
> >  /* Control register 2 */
> >  #define PCF2127_REG_CTRL2              0x01
> > +#define PCF2127_BIT_CTRL2_AIE                  BIT(1)
> >  #define PCF2127_BIT_CTRL2_TSIE                 BIT(2)
> > +#define PCF2127_BIT_CTRL2_AF                   BIT(4)
> >  #define PCF2127_BIT_CTRL2_TSF2                 BIT(5)
> >  /* Control register 3 */
> >  #define PCF2127_REG_CTRL3              0x02
> > @@ -46,6 +48,12 @@
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
> > @@ -185,6 +193,107 @@ static int pcf2127_rtc_set_time(struct device *de=
v, struct rtc_time *tm)
> >         return 0;
> >  }
> >
> > +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       unsigned int buf[5], ctrl2;
> > +       int ret;
> > +
> > +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2)=
;
> > +       if (ret) {
> > +               dev_err(dev, "%s: ctrl2 read error\n", __func__);
> > +               return ret;
> > +       }
>=20
> Reading CTRL2 register causes watchdog to stop.
>=20
> Aways call pcf2127_wdt_active_ping() after CTRL2 access to ensure the wat=
chdog
> is running if enabled.
>=20
> > +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC,=
 buf, 5);
>=20
> Replace 5 with sizeof(buf).
>=20
> > +       if (ret) {
> > +               dev_err(dev, "%s: alarm read error\n", __func__);
> > +               return ret;
> > +       }
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
> > +       dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=3D%d, wday=3D%d\n", _=
_func__,
> > +               alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_se=
c,
> > +               alrm->time.tm_mday, alrm->time.tm_wday);
> > +
> > +       return 0;
> > +}
> > +
> > +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable=
)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       unsigned int ctrl2;
> > +       int ret;
> > +
> > +       dev_dbg(dev, "%s: %s\n", __func__, enable ? "enable" : "disable=
");
>=20
> Delete debug trace.
>=20
> > +
> > +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2)=
;
> > +       if (ret) {
> > +               dev_err(dev, "%s: ctrl2 read error\n", __func__);
> > +               return ret;
> > +       }
> > +
> > +       if (enable)
> > +               ret =3D regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2=
,
> > +                                  ctrl2 | PCF2127_BIT_CTRL2_AIE);
> > +       else
> > +               ret =3D regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2=
,
> > +                                  ctrl2 & ~PCF2127_BIT_CTRL2_AIE);
> > +
> > +       if (ret) {
> > +               dev_err(dev, "%s: failed to enable alarm (%d)\n", __fun=
c__,
> > +                       ret);
> > +               return ret;
> > +       }
>=20
> Replace regmap_read() and regmap_write() with a regmap_update_bits().
>=20
> So something like:
>=20
> ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
>                                           enabled ? PCF2127_REG_CTRL2 : 0=
);
>=20
> And remember to call pcf2127_wdt_active_ping().
>=20
> > +
> > +       return 0;
> > +}
> > +
> > +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       unsigned int ctrl2;
> > +       uint8_t buf[5];
> > +       int ret;
> > +
> > +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                                PCF2127_BIT_CTRL2_AF,
> > +                                (unsigned int)~PCF2127_BIT_CTRL2_AF);
>=20
> If you just want to clear the AF bit in CTRL2, just do:
>=20
> ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
>                                            PCF2127_BIT_CTRL2_AF, 0);
>=20
> > +       if (ret) {
> > +               dev_err(dev, "%s: failed to clear alarm interrupt flag =
(%d)",
> > +                       __func__, ret);
> > +               return ret;
> > +       }
> > +
> > +       buf[0] =3D bin2bcd(alrm->time.tm_sec);
> > +       buf[1] =3D bin2bcd(alrm->time.tm_min);
> > +       buf[2] =3D bin2bcd(alrm->time.tm_hour);
> > +       buf[3] =3D bin2bcd(alrm->time.tm_mday);
> > +       buf[4] =3D (alrm->time.tm_wday & 0x07);
> > +
> > +       dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=3D%d, wday=3D%d=
\n",
> > +               __func__, alrm->time.tm_hour, alrm->time.tm_min,
> > +               alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wd=
ay);
> > +
> > +       ret =3D regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC=
, buf, 5);
>=20
> Replace 5 with sizeof(buf).
>=20
> /Bruno
>=20

Thanks again for your time,
Liam

> > +       if (ret) {
> > +               dev_err(dev, "%s: failed to write alarm registers (%d)"=
,
> > +                       __func__, ret);
> > +               return ret;
> > +       }
> > +
> > +       pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> > +
> > +       return 0;
> > +}
> > +
> >  #ifdef CONFIG_RTC_INTF_DEV
> >  static int pcf2127_rtc_ioctl(struct device *dev,
> >                                 unsigned int cmd, unsigned long arg)
> > @@ -211,9 +320,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
> >  #endif
> >
> >  static const struct rtc_class_ops pcf2127_rtc_ops =3D {
> > -       .ioctl          =3D pcf2127_rtc_ioctl,
> > -       .read_time      =3D pcf2127_rtc_read_time,
> > -       .set_time       =3D pcf2127_rtc_set_time,
> > +       .ioctl            =3D pcf2127_rtc_ioctl,
> > +       .read_time        =3D pcf2127_rtc_read_time,
> > +       .set_time         =3D pcf2127_rtc_set_time,
> > +       .read_alarm       =3D pcf2127_rtc_read_alarm,
> > +       .set_alarm        =3D pcf2127_rtc_set_alarm,
> > +       .alarm_irq_enable =3D pcf2127_rtc_alarm_irq_enable,
> >  };
> >
> >  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> > @@ -434,6 +546,8 @@ static int pcf2127_probe(struct device *dev, struct=
 regmap *regmap,
> >
> >         pcf2127->rtc->ops =3D &pcf2127_rtc_ops;
> >
> > +       device_init_wakeup(dev, true);
> > +
> >         pcf2127->wdd.parent =3D dev;
> >         pcf2127->wdd.info =3D &pcf2127_wdt_info;
> >         pcf2127->wdd.ops =3D &pcf2127_watchdog_ops;
> > --
> > 2.27.0
> >
