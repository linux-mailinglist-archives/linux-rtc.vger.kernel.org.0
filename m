Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5010354787
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 22:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240372AbhDEUVn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 16:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbhDEUVl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 16:21:41 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DDFC061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 13:21:33 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id y12so9493540qtx.11
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=2NYgE0/D+7zrUMw4ByXM+ee1juy0IpFdmIAbZkw9Lf8=;
        b=D9xLlqN0Uwsf3IUl/3zdOd7a9ZFs1helLmdiJjQxvE3MDSY4baePpOwf9+GUEGf67M
         OtG2PBaWlIIEnQoebxFmoeIxsRVjDZ3BmpGhL12LMOaIqaaB+1wrDyFk10v7KrRa0c7S
         8P4N/w/OpYn9DaHxPyrDJPwoYmExpr6ShHnpmRSlmyTvUM57TbHmcNzx+rgoYzY9kQj4
         eKw0fZnh/h3RdBl+c8udKCVSZAC+PUaDd7/CMFsFXoMkuvScBpqTZPfN4qfLPNSed0Mi
         Dtp/xoN5mFPw0BSWeIWDIYVHLsE/aJ2ES+Ucj9QesFHgn/WJXAVlJ+YAtNUdagx4+ptG
         bwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=2NYgE0/D+7zrUMw4ByXM+ee1juy0IpFdmIAbZkw9Lf8=;
        b=Ap4dlejBDAm0fGQ7cd+MPHbMfLDwx2BpZc7rncmD13UlfBmVR6q8Sne1rqpuzzfaKG
         Lbd5GZahOpu2UkULXdEahrsAdvMO8lortbbXMo7LPJKa8w50Z9pGbbfsq2aTwrWXnl3h
         lh5+RfHNgrubVcy+KVruK78DqUaNsYhMW0m06+az1K3pT89zVj0f55Qkijp1FJ9NdkA/
         lcnYrBKNGBtvU7/BSf6kTeIWdhH8ftvRrHK8Chrs4Ru5r/DbHTVFkF1+YigyLW03VV9C
         L3uFwUww+L7hYesSByyo/g5lGU947phM/9C6G9vpZDFJau85Q0IbobSl4pAlmGvUXfey
         zg3Q==
X-Gm-Message-State: AOAM531ecF4NQmeLVppVBUooujREi97lmH0Mqnn0dbEAfdYcY59V2Yiy
        udLhD2uG4ALRh4cXzGnlV8MC6cDFdH/euw==
X-Google-Smtp-Source: ABdhPJzIXCX0FdqUnPhlBfDL/nK3vFtDUXB/exQNIzCrYsKwQ7Bul5SiEMXK4jMjUdIzjLjXdtcftA==
X-Received: by 2002:ac8:4c87:: with SMTP id j7mr24544727qtv.338.1617654092853;
        Mon, 05 Apr 2021 13:21:32 -0700 (PDT)
Received: from localhost (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id d68sm14474249qkf.93.2021.04.05.13.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:21:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 05 Apr 2021 16:21:31 -0400
Message-Id: <CAG2IMI8XVGJ.2AM3C0B2V60LA@shaak>
Cc:     <a.zummo@towertech.it>, <panfilov.artyom@gmail.com>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] rtc: ab-eoz9: add alarm support
From:   "Liam Beguin" <liambeguin@gmail.com>
To:     "Alexandre Belloni" <alexandre.belloni@bootlin.com>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-4-liambeguin@gmail.com>
 <YGtL+NvwNd4gd3KQ@piout.net>
In-Reply-To: <YGtL+NvwNd4gd3KQ@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Mon Apr 5, 2021 at 1:42 PM EDT, Alexandre Belloni wrote:
> On 05/04/2021 10:13:33-0400, Liam Beguin wrote:
> > From: Liam Beguin <lvb@xiphos.com>
> >=20
> > Add alarm support for the rtc-ab-eoz9.
> >=20
> > Signed-off-by: Liam Beguin <lvb@xiphos.com>
> > ---
> >  drivers/rtc/rtc-ab-eoz9.c | 140 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >=20
> > diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> > index 379a231f673c..4c8ba62fb1c6 100644
> > --- a/drivers/rtc/rtc-ab-eoz9.c
> > +++ b/drivers/rtc/rtc-ab-eoz9.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/bcd.h>
> >  #include <linux/of.h>
> >  #include <linux/regmap.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> > =20
> > @@ -57,6 +58,24 @@
> > =20
> >  #define ABEOZ9_SEC_LEN			7
> > =20
> > +#define ABEOZ9_REG_ALARM_SEC		0x10
> > +#define ABEOZ9_BIT_ALARM_SEC		GENMASK(6, 0)
> > +#define ABEOZ9_REG_ALARM_MIN		0x11
> > +#define ABEOZ9_BIT_ALARM_MIN		GENMASK(6, 0)
> > +#define ABEOZ9_REG_ALARM_HOURS		0x12
> > +#define ABEOZ9_BIT_ALARM_HOURS_PM	BIT(5)
> > +#define ABEOZ9_BIT_ALARM_HOURS		GENMASK(4, 0)
> > +#define ABEOZ9_REG_ALARM_DAYS		0x13
> > +#define ABEOZ9_BIT_ALARM_DAYS		GENMASK(5, 0)
> > +#define ABEOZ9_REG_ALARM_WEEKDAYS	0x14
> > +#define ABEOZ9_BIT_ALARM_WEEKDAYS	GENMASK(2, 0)
> > +#define ABEOZ9_REG_ALARM_MONTHS		0x15
> > +#define ABEOZ9_BIT_ALARM_MONTHS		GENMASK(4, 0)
> > +#define ABEOZ9_REG_ALARM_YEARS		0x16
> > +
> > +#define ABEOZ9_ALARM_LEN		7
> > +#define ABEOZ9_BIT_ALARM_AE		BIT(7)
> > +
> >  #define ABEOZ9_REG_REG_TEMP		0x20
> >  #define ABEOZ953_TEMP_MAX		120
> >  #define ABEOZ953_TEMP_MIN		-60
> > @@ -182,6 +201,102 @@ static int abeoz9_rtc_set_time(struct device *dev=
, struct rtc_time *tm)
> >  	return abeoz9_reset_validity(regmap);
> >  }
> > =20
> > +static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm=
 *alarm)
> > +{
> > +	struct abeoz9_rtc_data *data =3D dev_get_drvdata(dev);
> > +	struct regmap *regmap =3D data->regmap;
> > +	u8 regs[ABEOZ9_ALARM_LEN];
> > +	u8 val[2];
> > +	int ret;
> > +
> > +	ret =3D abeoz9_check_validity(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_bulk_read(regmap, ABEOZ9_REG_CTRL_INT, val, sizeof(val=
));
> > +	if (ret)
> > +		return ret;
> > +
> > +	alarm->enabled =3D val[0] & ABEOZ9_REG_CTRL_INT_AIE;
> > +	alarm->pending =3D val[1] & ABEOZ9_REG_CTRL_INT_FLAG_AF;
> > +
> > +	ret =3D regmap_bulk_read(regmap, ABEOZ9_REG_ALARM_SEC, regs, sizeof(r=
egs));
> > +	if (ret)
> > +		return ret;
> > +
> > +	alarm->time.tm_sec =3D bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_SEC, regs[0=
]));
> > +	alarm->time.tm_min =3D bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_MIN, regs[1=
]));
> > +	alarm->time.tm_hour =3D bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_HOURS, reg=
s[2]));
> > +	if (FIELD_GET(ABEOZ9_BIT_ALARM_HOURS_PM, regs[2]))
> > +		alarm->time.tm_hour +=3D 12;
> > +
> > +	alarm->time.tm_mday =3D bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_DAYS, regs=
[3]));
> > +
> > +	return 0;
> > +}
> > +
> > +static int abeoz9_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> > +{
> > +	struct abeoz9_rtc_data *data =3D dev_get_drvdata(dev);
> > +
> > +	return regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT,
> > +				  ABEOZ9_REG_CTRL_INT_AIE,
> > +				  FIELD_PREP(ABEOZ9_REG_CTRL_INT_AIE, enable));
> > +}
> > +
> > +static int abeoz9_rtc_set_alarm(struct device *dev, struct rtc_wkalrm =
*alarm)
> > +{
> > +	struct abeoz9_rtc_data *data =3D dev_get_drvdata(dev);
> > +	u8 regs[ABEOZ9_ALARM_LEN] =3D {0};
> > +	int ret;
> > +
> > +	ret =3D regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
> > +				 ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regs[0] =3D ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_SEC,
> > +						   bin2bcd(alarm->time.tm_sec));
> > +	regs[1] =3D ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_MIN,
> > +						   bin2bcd(alarm->time.tm_min));
> > +	regs[2] =3D ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_HOURS,
> > +						   bin2bcd(alarm->time.tm_hour));
> > +	regs[3] =3D ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_DAYS,
> > +						   bin2bcd(alarm->time.tm_mday));
> > +
> > +	ret =3D regmap_bulk_write(data->regmap, ABEOZ9_REG_ALARM_SEC, regs,
> > +				sizeof(regs));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D abeoz9_reset_validity(data->regmap);
>
> This is not right, this must not be used unless the time set on the RTC
> is correct which you don't know at that time.
>

Understood, will drop.

Liam

> > +	if (ret)
> > +		return ret;
> > +
> > +	return abeoz9_rtc_alarm_irq_enable(dev, alarm->enabled);
> > +}
> > +
> > +static irqreturn_t abeoz9_rtc_irq(int irq, void *dev)
> > +{
> > +	struct abeoz9_rtc_data *data =3D dev_get_drvdata(dev);
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG, &val);
> > +	if (ret)
> > +		return IRQ_NONE;
> > +
> > +	if (!FIELD_GET(ABEOZ9_REG_CTRL_INT_FLAG_AF, val))
> > +		return IRQ_NONE;
> > +
> > +	regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
> > +			   ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
> > +
> > +	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int abeoz9_trickle_parse_dt(struct device_node *node)
> >  {
> >  	u32 ohms =3D 0;
> > @@ -257,6 +372,14 @@ static const struct rtc_class_ops rtc_ops =3D {
> >  	.set_time  =3D abeoz9_rtc_set_time,
> >  };
> > =20
> > +static const struct rtc_class_ops rtc_alarm_ops =3D {
> > +	.read_time =3D abeoz9_rtc_get_time,
> > +	.set_time =3D abeoz9_rtc_set_time,
> > +	.read_alarm =3D abeoz9_rtc_read_alarm,
> > +	.set_alarm =3D abeoz9_rtc_set_alarm,
> > +	.alarm_irq_enable =3D abeoz9_rtc_alarm_irq_enable,
> > +};
> > +
> >  static const struct regmap_config abeoz9_rtc_regmap_config =3D {
> >  	.reg_bits =3D 8,
> >  	.val_bits =3D 8,
> > @@ -416,6 +539,23 @@ static int abeoz9_probe(struct i2c_client *client,
> >  	data->rtc->ops =3D &rtc_ops;
> >  	data->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> >  	data->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > +	data->rtc->uie_unsupported =3D 1;
> > +
> > +	if (client->irq > 0) {
> > +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +						abeoz9_rtc_irq,
> > +						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> > +						dev_name(dev), dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to request alarm irq\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source"=
)) {
> > +		ret =3D device_init_wakeup(dev, true);
> > +		data->rtc->ops =3D &rtc_alarm_ops;
> > +	}
> > =20
> >  	ret =3D devm_rtc_register_device(data->rtc);
> >  	if (ret)
> > --=20
> > 2.30.1.489.g328c10930387
> >=20
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

