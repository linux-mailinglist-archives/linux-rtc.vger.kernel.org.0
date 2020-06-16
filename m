Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BDE1FB1AB
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 15:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgFPNID (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 09:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNID (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 09:08:03 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AD0C061573
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 06:08:03 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id y1so15328876qtv.12
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:in-reply-to:date:cc:subject:from:to
         :message-id;
        bh=2Ht7PpzY5O2vTtdihtTEyhSp+XnDQY3XZqjpf15Wh4g=;
        b=pitqRSJDclZ00digQtyi3ARn7RL6npvxMTCO76RcLel2/KHu3nblZYpvIG5diHZu6e
         Py5SQLV9KX5TmFBiiQW9j4Qyt+deFnRqwV8FjB5oQ3DLwQnSkddnqiAtIGNMv+pZda1r
         kt4rYdMhm+lecIsXNW5DDS78aIkbGEdVuhbbdUNAUZf2EodsySVDVihWTP7qCxB6j5gF
         +nd0GsIW8SRFWBvDB63Miu8C2vI0ntxeSjyrFHPTCyhxntEcZwinXaNsOuZmaa0EgM/8
         v0jTKPSSdm8b+WnouTJvSWGtJHKkgigdFoSPvW4J9YMYNbd+opBp+iBGDRn2z4Xc0702
         RLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date:cc
         :subject:from:to:message-id;
        bh=2Ht7PpzY5O2vTtdihtTEyhSp+XnDQY3XZqjpf15Wh4g=;
        b=V8gLbP3jLPzY0tz46wN5+E/k5ZQPXofbQL5Eg9yiTbLP9b45e889Qi/ZBYQmHNFfTN
         V2hcz+54gamK2ZJfWvNCdhyQlwdL40wVFX+EOQIr1xJa0aXKHibzczrMDz/L8ree0M/O
         UqgkBi8ZeBMhj4ABEOImW1KUeu5Jyva3S2/epZJ5PIT2JfLlfDkZxycuqhFOpAbPFof8
         CEu9YNskjw2rFS9rqRZPV2vYUtb+ZQl2Ku4D+tPPPJ3+1gX+HRotXry56MoEfYOH+CQu
         c54tJcehYo5tC+nUbenb0/BA2Abyed0GKiUhfwovGPK4ZPX2ZEXuo4p7jQe0MHREL54L
         6NGw==
X-Gm-Message-State: AOAM532rFr/5s85HA8ELz9j/APbyfNpeqmtWmMApR3OQb34Vdc0o5aYQ
        day4r/ZBcR5hVsJTshIQhjA=
X-Google-Smtp-Source: ABdhPJzUe1deU8AynUOPS5ODOACBRADZGdYZ+iaAFfWc0zTQIORdUx0hbEoUXjtiXhHkRVVi2Q16rg==
X-Received: by 2002:aed:3f6d:: with SMTP id q42mr21659227qtf.41.1592312882000;
        Tue, 16 Jun 2020 06:08:02 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id c17sm14478191qtw.48.2020.06.16.06.08.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jun 2020 06:08:00 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20200616090254.GH241261@piout.net>
Date:   Tue, 16 Jun 2020 09:07:59 -0400
Cc:     <bruno.thomsen@gmail.com>, <a.zummo@towertech.it>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Message-Id: <C3IJT2LEDYLY.2NK6MCEXUHZHA@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue Jun 16, 2020 at 11:02 AM Alexandre Belloni wrote:
> Hi,
>=20
> On 14/06/2020 00:04:09-0400, Liam Beguin wrote:
> > From: Liam Beguin <lvb@xiphos.com>
> >=20
> > Add alarm support for the pcf2127 RTC chip family.
> > Tested on pca2129.
> >=20
> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> > Changes since v1:
> > - Add calls to pcf2127_wdt_active_ping after accessing CTRL2
> > - Cleanup calls to regmap_{read,write,update_bits}
> > - Cleanup debug trace
> > - Add interrupt handler, untested because of hardware limitations
> > - Add wakeup-source devicetree option
> >=20
> >  drivers/rtc/rtc-pcf2127.c | 169 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 166 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 396a1144a213..87ecb29247c6 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/regmap.h>
> >  #include <linux/watchdog.h>
> > =20
> > @@ -28,7 +29,9 @@
> >  #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
> >  /* Control register 2 */
> >  #define PCF2127_REG_CTRL2		0x01
> > +#define PCF2127_BIT_CTRL2_AIE			BIT(1)
> >  #define PCF2127_BIT_CTRL2_TSIE			BIT(2)
> > +#define PCF2127_BIT_CTRL2_AF			BIT(4)
> >  #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
> >  /* Control register 3 */
> >  #define PCF2127_REG_CTRL3		0x02
> > @@ -46,6 +49,12 @@
> >  #define PCF2127_REG_DW			0x07
> >  #define PCF2127_REG_MO			0x08
> >  #define PCF2127_REG_YR			0x09
> > +/* Alarm registers */
> > +#define PCF2127_REG_ALARM_SC		0x0A
> > +#define PCF2127_REG_ALARM_MN		0x0B
> > +#define PCF2127_REG_ALARM_HR		0x0C
> > +#define PCF2127_REG_ALARM_DM		0x0D
> > +#define PCF2127_REG_ALARM_DW		0x0E
> >  /* Watchdog registers */
> >  #define PCF2127_REG_WD_CTL		0x10
> >  #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
> > @@ -79,6 +88,8 @@
> >  #define PCF2127_WD_VAL_MAX		255
> >  #define PCF2127_WD_VAL_DEFAULT		60
> > =20
> > +static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
> > +
>=20
> This forward declaration should be avoided.
>=20

I'll try to move things around to avoid this.

> >  struct pcf2127 {
> >  	struct rtc_device *rtc;
> >  	struct watchdog_device wdd;
> > @@ -185,6 +196,140 @@ static int pcf2127_rtc_set_time(struct device *de=
v, struct rtc_time *tm)
> >  	return 0;
> >  }
> > =20
> > +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> > +{
> > +	struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +	unsigned int buf[5], ctrl2;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> > +	if (ret) {
> > +		dev_err(dev, "%s: ctrl2 read error\n", __func__);
>=20
> Honestly, I would prefer avoiding adding so many strings in the driver.
> The reality is that nobody will look into dmesg to know what was the
> issue and even if somebody does, the solution would simply be to start
> the operation again. Something that can already be deducted when
> returning a simple error code. (This is valid for the subsequent
> dev_err).
>=20

Understood, I'll get rid of these unnecessary strings.

> > +		return ret;
> > +	}
> > +
> > +	ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> > +			       sizeof(buf));
> > +	if (ret) {
> > +		dev_err(dev, "%s: alarm read error\n", __func__);
> > +		return ret;
> > +	}
> > +
> > +	alrm->enabled =3D ctrl2 & PCF2127_BIT_CTRL2_AIE;
> > +	alrm->pending =3D ctrl2 & PCF2127_BIT_CTRL2_AF;
> > +
> > +	alrm->time.tm_sec =3D bcd2bin(buf[0] & 0x7F);
> > +	alrm->time.tm_min =3D bcd2bin(buf[1] & 0x7F);
> > +	alrm->time.tm_hour =3D bcd2bin(buf[2] & 0x3F);
> > +	alrm->time.tm_mday =3D bcd2bin(buf[3] & 0x3F);
> > +	alrm->time.tm_wday =3D buf[4] & 0x07;
> > +
> > +	dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=3D%d, wday=3D%d\n", __func_=
_,
> > +		alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
> > +		alrm->time.tm_mday, alrm->time.tm_wday);
> > +
>=20
> It is generally not useful to have those debug strings anymore because
> the core already provides tracepoints at the correct locations.
>=20
> If you really want to keep it, then please use %ptR.
>=20
> This is also valid for the other dev_dbg.
>=20

I'm not particularly attached to keeping these in. I just left them in
since it seemed to be common in other rtc drivers.

I'll update to use %ptR.

> > +	return 0;
> > +}
> > +
> > +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable=
)
> > +{
> > +	struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +				 PCF2127_BIT_CTRL2_AIE,
> > +				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
> > +	if (ret) {
> > +		dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
> > +			enable ? "enable" : "disable",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> > +{
> > +	struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +	uint8_t buf[5];
> > +	int ret;
> > +
> > +	ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +				 PCF2127_BIT_CTRL2_AF, 0);
> > +	if (ret) {
> > +		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
> > +			__func__, ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	buf[0] =3D bin2bcd(alrm->time.tm_sec);
> > +	buf[1] =3D bin2bcd(alrm->time.tm_min);
> > +	buf[2] =3D bin2bcd(alrm->time.tm_hour);
> > +	buf[3] =3D bin2bcd(alrm->time.tm_mday);
> > +	buf[4] =3D (alrm->time.tm_wday & 0x07);
> > +
> > +	dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=3D%d, wday=3D%d\n",
> > +		__func__, alrm->time.tm_hour, alrm->time.tm_min,
> > +		alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday);
> > +
> > +	ret =3D regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> > +				sizeof(buf));
> > +	if (ret) {
> > +		dev_err(dev, "%s: failed to write alarm registers (%d)",
> > +			__func__, ret);
> > +		return ret;
> > +	}
> > +
> > +	pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> > +
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> > +{
> > +	struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +	unsigned int ctrl2 =3D 0;
> > +	int ret =3D 0;
> > +
> > +	ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> > +	if (ret) {
> > +		dev_err(dev, "%s: ctrl2 read error (%d)\n", __func__, ret);
> > +		goto irq_err;
> > +	}
> > +
> > +	ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +	if (ret)
> > +		goto irq_err;
> > +
> > +	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
> > +		regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +				   PCF2127_BIT_CTRL2_AF, 0);
>=20
> In that case, I think it makes more sense to use regmap_write as this
> would avoid another read of ctrl2.
>=20

Thanks, will update that.

> > +
> > +		ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
> > +		if (ret)
> > +			goto irq_err;
> > +
> > +		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +irq_err:
> > +	return IRQ_NONE;
> > +}
> > +
> >  #ifdef CONFIG_RTC_INTF_DEV
> >  static int pcf2127_rtc_ioctl(struct device *dev,
> >  				unsigned int cmd, unsigned long arg)
> > @@ -211,9 +356,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
> >  #endif
> > =20
> >  static const struct rtc_class_ops pcf2127_rtc_ops =3D {
> > -	.ioctl		=3D pcf2127_rtc_ioctl,
> > -	.read_time	=3D pcf2127_rtc_read_time,
> > -	.set_time	=3D pcf2127_rtc_set_time,
> > +	.ioctl            =3D pcf2127_rtc_ioctl,
> > +	.read_time        =3D pcf2127_rtc_read_time,
> > +	.set_time         =3D pcf2127_rtc_set_time,
> > +	.read_alarm       =3D pcf2127_rtc_read_alarm,
> > +	.set_alarm        =3D pcf2127_rtc_set_alarm,
> > +	.alarm_irq_enable =3D pcf2127_rtc_alarm_irq_enable,
> >  };
> > =20
> >  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> > @@ -415,6 +563,7 @@ static int pcf2127_probe(struct device *dev, struct=
 regmap *regmap,
> >  			const char *name, bool has_nvmem)
> >  {
> >  	struct pcf2127 *pcf2127;
> > +	int alarm_irq =3D 0;
> >  	u32 wdd_timeout;
> >  	int ret =3D 0;
> > =20
> > @@ -434,6 +583,20 @@ static int pcf2127_probe(struct device *dev, struc=
t regmap *regmap,
> > =20
> >  	pcf2127->rtc->ops =3D &pcf2127_rtc_ops;
> > =20
> > +	alarm_irq =3D of_irq_get_byname(dev->of_node, "alarm");
> > +	if (alarm_irq >=3D 0) {
> > +		ret =3D devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
> > +				       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> > +				       dev_name(dev), dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to request alarm irq\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (alarm_irq >=3D 0 || device_property_read_bool(dev, "wakeup-source=
"))
> > +		device_init_wakeup(dev, true);
>=20
> The last thing here is that you should have two different rtc_class_ops
> struct, one with alarm and the other one without. at this point, you
> know which one you should use. I know this is not convenient but I'm
> working on a series to make things better. Until this is ready, this is
> what we will have to live with.
>=20

Okay, will update that too.

Thanks for your time,
Liam

> --=20
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
