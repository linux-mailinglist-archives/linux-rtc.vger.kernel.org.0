Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A732DE9EE
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 12:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJUKnu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 06:43:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:10461 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727517AbfJUKnu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 06:43:50 -0400
X-Greylist: delayed 541 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 06:43:45 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571654624;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9G+mgDbyUFDVeZU/1Nj3vP+xHXG7yXxeHxh8NnZNPtc=;
        b=J5pzLBe6wP+CUvS83326aEaUHWoKQniPIJSCCN0K7OPfCe1IKILSGuIBqxKU2ZFR00
        B1/NBvARqmV1HFMiU/TJhi6wpAaOLGlUQm/kha1txFVgXIK+aDgQ1LVe/0RMS9c3KwHE
        yKLSPxqXIdGMozhrwJmV+kIabn7ME8UK/Ad/vKXHToGg4PxKzZyOI9SPpPH1ircQEz3n
        bM90Gw+xlR6lFh7zdQWuTOyVKkwn8FOGhlJEtspuoG3TmXe20s4VLpYLIGn4911hiXhL
        Ciyq3PM1fXFDg8q54sfRgxgsrNWeySznkBP8fhHazLtWPf54350/yGwDv7boDHyKOpir
        JRrg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCbXA4Ewxc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9LAVVJYg
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Oct 2019 12:31:31 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191021101528.GU3125@piout.net>
Date:   Mon, 21 Oct 2019 12:31:30 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>, linux-rtc@vger.kernel.org,
        a.zummo@towertech.it,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        lee.jones@linaro.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F16BC3B8-5497-4A7D-AC88-4DB221038519@goldelico.com>
References: <20191021054104.26155-1-andreas@kemnade.info> <20191021054104.26155-6-andreas@kemnade.info> <20191021101528.GU3125@piout.net>
To:     alexandre.belloni@bootlin.com
X-Mailer: Apple Mail (2.3124)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Just a meta-comment...

> Am 21.10.2019 um 12:15 schrieb Alexandre Belloni =
<alexandre.belloni@bootlin.com>:
>=20
> Hi,
>=20
> The subject line is weird, how is it related to rc5t583?
>=20
> On 21/10/2019 07:41:04+0200, Andreas Kemnade wrote:
>> config RTC_DRV_S35390A
>> 	tristate "Seiko Instruments S-35390A"
>> 	select BITREVERSE
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 6b09c21dc1b6..1d0673fd0954 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -136,6 +136,7 @@ obj-$(CONFIG_RTC_DRV_PXA)	+=3D rtc-pxa.o
>> obj-$(CONFIG_RTC_DRV_R7301)	+=3D rtc-r7301.o
>> obj-$(CONFIG_RTC_DRV_R9701)	+=3D rtc-r9701.o
>> obj-$(CONFIG_RTC_DRV_RC5T583)	+=3D rtc-rc5t583.o
>> +obj-$(CONFIG_RTC_DRV_RC5T619)	+=3D rtc-rc5t619.o
>> obj-$(CONFIG_RTC_DRV_RK808)	+=3D rtc-rk808.o
>> obj-$(CONFIG_RTC_DRV_RP5C01)	+=3D rtc-rp5c01.o
>> obj-$(CONFIG_RTC_DRV_RS5C313)	+=3D rtc-rs5c313.o
>> diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
>> new file mode 100644
>> index 000000000000..311788ff0723
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-rc5t619.c
>> @@ -0,0 +1,476 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * drivers/rtc/rtc-ricoh619.c
>> + *
>> + * Real time clock driver for RICOH R5T619 power management chip.
>> + *
>> + * Copyright (C) 2019 Andreas Kemnade
>> + *
>> + * Based on code
>> + *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
>> + *
>> + * Based on code
>> + *  Copyright (C) 2011 NVIDIA Corporation
>=20
> Based on is not useful.

Yes, it is difficult to track what the real contribution was
and what is left over.

On the other hand it is IMHO fair to attribute those who have
spent time to save ours.

What would be a better way for attribution?

>=20
>> + */
>> +
>> +/* #define debug		1 */
>> +/* #define verbose_debug	1 */
>> +
>=20
> No dead code please.
>=20
>> +#include <linux/kernel.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/mfd/rn5t618.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/bcd.h>
>> +#include <linux/rtc.h>
>> +#include <linux/slab.h>
>> +#include <linux/irqdomain.h>
>> +
>> +struct rc5t619_rtc {
>> +	int			irq;
>> +	struct rtc_device	*rtc;
>> +	struct rn5t618 *rn5t618;
>> +};
>> +
>> +#define CTRL1_ALARM_ENABLED 0x40
>> +#define CTRL1_24HR 0x20
>> +#define CTRL1_PERIODIC_MASK 0xf
>> +
>> +#define CTRL2_PON 0x10
>> +#define CTRL2_ALARM_STATUS 0x80
>> +#define CTRL2_CTFG 0x4
>> +#define CTRL2_CTC 0x1
>> +
>> +static int rc5t619_rtc_periodic_disable(struct device *dev)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	/* disable function */
>> +	err =3D regmap_update_bits(rtc->rn5t618->regmap,
>> +			RN5T618_RTC_CTRL1, CTRL1_PERIODIC_MASK, 0);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	/* clear alarm flag and CTFG */
>> +	err =3D regmap_update_bits(rtc->rn5t618->regmap, =
RN5T618_RTC_CTRL2,
>> +			CTRL2_ALARM_STATUS | CTRL2_CTFG | CTRL2_CTC, 0);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_clk_adjust(struct device *dev, uint8_t clk)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +	return regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_ADJUST, =
clk);
>=20
> Is it useful to have a function for a single regmap_write?

I'd say yes. It is wrapping all regmap accesses in getter/setter =
functions
whose name describes what it is setting. And it may do type conversion.
IMHO this makes code better readable and maintainable.
And a good compiler may even decide to inline this.

>=20
> Also what is that adjusting? If this is adding/removing clock cycles,
> you need to use .set_offset and .read_offset.
>=20
>> +}
>> +
>> +static int rc5t619_rtc_pon_get_clr(struct device *dev, uint8_t =
*pon_f)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int err;
>> +	unsigned int reg_data;
>> +
>> +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, =
&reg_data);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (reg_data & CTRL2_PON) {
>> +		*pon_f =3D 1;
>> +		/* clear VDET PON */
>> +		reg_data &=3D ~(CTRL2_PON | CTRL2_CTC | 0x4a);	/* =
0101-1011 */
>> +		reg_data |=3D 0x20;	/* 0010-0000 */
>=20
> Is it possible to have more defines for those magic values?
>=20
>> +		err =3D regmap_write(rtc->rn5t618->regmap, =
RN5T618_RTC_CTRL2,
>> +					reg_data);
>> +	} else {
>> +		*pon_f =3D 0;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +/* 0-12hour, 1-24hour */
>> +static int rc5t619_rtc_24hour_mode_set(struct device *dev, int mode)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +	return regmap_update_bits(rtc->rn5t618->regmap, =
RN5T618_RTC_CTRL1,
>> +			CTRL1_24HR, mode ? CTRL1_24HR : 0);
>=20
> Is it useful to have a function for a single regmap_update_bits?

Same as above. I can immediately understand

	r =3D rc5t619_rtc_24hour_mode_set(dev, MODE_SOMETHING);

somewhere else in code but deciphering=20

	r =3D regmap_update_bits(rtc->rn5t618->regmap, =
RN5T618_RTC_CTRL1,
				CTRL1_24HR, mode ? CTRL1_24HR : 0);

spread over several places is probably difficult.

>=20
>> +}
>> +
>> +
>> +static int rc5t619_rtc_read_time(struct device *dev, struct rtc_time =
*tm)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	u8 buff[7];
>> +	int err;
>> +	int cent_flag;
>> +
>> +	err =3D regmap_bulk_read(rtc->rn5t618->regmap, =
RN5T618_RTC_SECONDS,
>> +				buff, sizeof(buff));
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to read time: %d\n", err);
>=20
> Please reconsider adding so many strings in the driver, they add =
almost
> no value but will increase the kernel memory footprint.

You mean removing error messages is better than taking some footprint?

>=20
>> +		return err;
>> +	}
>> +
>> +	if (buff[5] & 0x80)
> A define for the century bit would be good.
>=20
>> +		cent_flag =3D 1;
>> +	else
>> +		cent_flag =3D 0;
>> +
>> +	buff[5] =3D buff[5] & 0x1f;		/* bit5 19_20 */
>=20
> This assignment is unnecessary, you can mask the value when using it.
>=20
> Is the RTC 1900-2099 or 2000-2199? Please include the ouput of =
rtc-range
> in the commit log:
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tre=
e/rtc-range.c
>=20
>> +
>> +	tm->tm_sec  =3D bcd2bin(buff[0]);
>> +	tm->tm_min  =3D bcd2bin(buff[1]);
>> +	tm->tm_hour =3D bcd2bin(buff[2]);		/* bit5 PA_H20 =
*/
>> +	tm->tm_wday =3D bcd2bin(buff[3]);
>> +	tm->tm_mday =3D bcd2bin(buff[4]);
>> +	tm->tm_mon  =3D bcd2bin(buff[5]) - 1;	/* back to system 0-11 =
*/
>> +	tm->tm_year =3D bcd2bin(buff[6]) + 100 * cent_flag;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_set_time(struct device *dev, struct rtc_time =
*tm)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	u8 buff[7];
>> +	int err;
>> +	int cent_flag;
>> +
>> +	if (tm->tm_year >=3D 100)
>> +		cent_flag =3D 1;
>> +	else
>> +		cent_flag =3D 0;
>> +
>> +	tm->tm_mon =3D tm->tm_mon + 1;
>=20
> This assignment is not necessary.
>=20
>> +	buff[0] =3D bin2bcd(tm->tm_sec);
>> +	buff[1] =3D bin2bcd(tm->tm_min);
>> +	buff[2] =3D bin2bcd(tm->tm_hour);
>> +	buff[3] =3D bin2bcd(tm->tm_wday);
>> +	buff[4] =3D bin2bcd(tm->tm_mday);
>> +	buff[5] =3D bin2bcd(tm->tm_mon);		/* system set =
0-11 */
>> +	buff[6] =3D bin2bcd(tm->tm_year - cent_flag * 100);
>> +
>> +	if (cent_flag)
>> +		buff[5] |=3D 0x80;
>> +
>> +	err =3D regmap_bulk_write(rtc->rn5t618->regmap, =
RN5T618_RTC_SECONDS,
>> +				buff, sizeof(buff));
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to program new time: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_alarm_is_enabled(struct device *dev,  uint8_t =
*enabled)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int err;
>> +	unsigned int reg_data;
>> +
>> +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1, =
&reg_data);
>> +	if (err) {
>> +		dev_err(dev, "read RTC_CTRL1 error %d\n", err);
>> +		*enabled =3D 0;
>=20
> Is it necessary to set enabled here?

Well, in case of error it is probably more safe to assume it is *not* =
enabled
that keeping the random value passed by the caller of this function.

>=20
>> +	} else {
>> +		if (reg_data & CTRL1_ALARM_ENABLED)
>> +			*enabled =3D 1;
>> +		else
>> +			*enabled =3D 0;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +/* 0-disable, 1-enable */
>> +static int rc5t619_rtc_alarm_enable(struct device *dev, unsigned int =
enabled)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int err;
>=20
> err is not necessary.
>=20
>> +
>> +	err =3D regmap_update_bits(rtc->rn5t618->regmap,
>> +			RN5T618_RTC_CTRL1,
>> +			CTRL1_ALARM_ENABLED,
>> +			enabled ? CTRL1_ALARM_ENABLED : 0);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_read_alarm(struct device *dev, struct =
rtc_wkalrm *alrm)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	u8 buff[6];
>> +	unsigned int buff_cent;
>> +	int err;
>> +	int cent_flag;
>> +	unsigned int enabled_flag;
>> +
>> +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_MONTH, =
&buff_cent);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to read time: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (buff_cent & 0x80)
>> +		cent_flag =3D 1;
>> +	else
>> +		cent_flag =3D 0;
>> +
>> +	err =3D regmap_bulk_read(rtc->rn5t618->regmap, =
RN5T618_RTC_ALARM_Y_SEC,
>> +				buff, sizeof(buff));
>> +	if (err)
>> +		return err;
>> +
>> +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
>> +				&enabled_flag);
>> +	if (err)
>> +		return err;
>> +
>> +	if (enabled_flag & CTRL1_ALARM_ENABLED)
>> +		enabled_flag =3D 1;
>=20
> Why don't you set alrm->enabled directly here?
>=20
> alrm->enabled =3D !!(enabled_flag & CTRL1_ALARM_ENABLED);
>=20
>> +	else
>> +		enabled_flag =3D 0;
>> +
>> +
>> +	buff[3] =3D buff[3] & 0x3f;
>> +
>> +	alrm->time.tm_sec  =3D bcd2bin(buff[0]);
>> +	alrm->time.tm_min  =3D bcd2bin(buff[1]);
>> +	alrm->time.tm_hour =3D bcd2bin(buff[2]);
>> +	alrm->time.tm_mday =3D bcd2bin(buff[3]);
>> +	alrm->time.tm_mon  =3D bcd2bin(buff[4]) - 1;
>> +	alrm->time.tm_year =3D bcd2bin(buff[5]) + 100 * cent_flag;
>> +	alrm->enabled =3D enabled_flag;
>> +	dev_dbg(dev, "read alarm: %d/%d/%d %d:%d:%d\n",
>=20
> Use %ptR
>=20
>> +		(alrm->time.tm_mon), alrm->time.tm_mday, =
alrm->time.tm_year,
>> +		 alrm->time.tm_hour, alrm->time.tm_min, =
alrm->time.tm_sec);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_set_alarm(struct device *dev, struct =
rtc_wkalrm *alrm)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +	u8 buff[6];
>> +	int err;
>> +	int cent_flag;
>> +
>> +	err =3D 0;
>> +	rc5t619_rtc_alarm_enable(dev, 0);
>=20
> This may fail
>=20
>> +	if (rtc->irq =3D=3D -1)
>> +		return -EIO;
>=20
> This has to be -EINVAL to get UIE emulation working.
>=20
>> +
>> +	if (alrm->enabled =3D=3D 0)
>> +		return 0;
>> +
>> +	if (alrm->time.tm_year >=3D 100)
>> +		cent_flag =3D 1;
>> +	else
>> +		cent_flag =3D 0;
>> +
>> +	alrm->time.tm_mon +=3D 1;
>> +	buff[0] =3D bin2bcd(alrm->time.tm_sec);
>> +	buff[1] =3D bin2bcd(alrm->time.tm_min);
>> +	buff[2] =3D bin2bcd(alrm->time.tm_hour);
>> +	buff[3] =3D bin2bcd(alrm->time.tm_mday);
>> +	buff[4] =3D bin2bcd(alrm->time.tm_mon);
>> +	buff[5] =3D bin2bcd(alrm->time.tm_year - 100 * cent_flag);
>> +	buff[3] |=3D 0x80;	/* set DAL_EXT */
>=20
> This bit needs a define.
>=20
>> +
>> +	err =3D regmap_bulk_write(rtc->rn5t618->regmap, =
RN5T618_RTC_ALARM_Y_SEC,
>> +				buff, sizeof(buff));
>> +	if (err) {
>> +		dev_err(dev, "unable to set alarm: %d\n", err);
>> +		return -EBUSY;
>=20
> Why EBUSY?
>=20
>> +	}
>> +
>> +	rc5t619_rtc_alarm_enable(dev, alrm->enabled);
>=20
> This may fail.
>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rc5t619_rtc_ops =3D {
>> +	.read_time	=3D rc5t619_rtc_read_time,
>> +	.set_time	=3D rc5t619_rtc_set_time,
>> +	.set_alarm	=3D rc5t619_rtc_set_alarm,
>> +	.read_alarm	=3D rc5t619_rtc_read_alarm,
>> +	.alarm_irq_enable =3D rc5t619_rtc_alarm_enable,
>> +};
>> +
>> +static int rc5t619_rtc_alarm_flag_clr(struct device *dev)
>> +{
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +	/* clear alarm-D status bits.*/
>> +	return regmap_update_bits(rtc->rn5t618->regmap,
>> +				RN5T618_RTC_CTRL2,
>> +				CTRL2_ALARM_STATUS | CTRL2_CTC, 0);
>> +}
>> +
>> +static irqreturn_t rc5t619_rtc_irq(int irq, void *data)
>> +{
>> +	struct device *dev =3D data;
>> +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +	rc5t619_rtc_alarm_flag_clr(dev);
>> +
>> +	rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +
>> +static int rc5t619_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct rn5t618 *rn5t618 =3D dev_get_drvdata(pdev->dev.parent);
>> +	struct rc5t619_rtc *rtc;
>> +	uint8_t pon_flag, alarm_flag;
>> +	int err;
>> +
>> +	rtc =3D devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
>> +	if (IS_ERR(rtc)) {
>> +		err =3D PTR_ERR(rtc);
>> +		dev_err(&pdev->dev, "no enough memory for rc5t619_rtc =
using\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	rtc->rn5t618 =3D rn5t618;
>> +
>> +	dev_set_drvdata(dev, rtc);
>> +	rtc->irq =3D -1;
>> +
>> +	if (rn5t618->irq_data)
>> +		rtc->irq =3D regmap_irq_get_virq(rn5t618->irq_data,
>> +				RN5T618_IRQ_RTC);
>> +
>> +	if (rtc->irq  < 0) {
>> +		dev_err(dev, "no irq specified, wakeup is disabled\n");
>> +		rtc->irq =3D -1;
>> +	}
>> +
>> +	/* get interrupt flag */
>> +	err =3D rc5t619_rtc_alarm_is_enabled(dev, &alarm_flag);
>> +	if (err)
>> +		return err;
>> +
>> +	/* get PON flag */
>> +	err =3D rc5t619_rtc_pon_get_clr(&pdev->dev, &pon_flag);
>> +	if (err) {
>> +		dev_err(&pdev->dev, "get PON flag error: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* using 24h-mode */
>> +	err =3D rc5t619_rtc_24hour_mode_set(&pdev->dev, 1);
>> +
>=20
> Doesn't that corrupt the time if the RTC was previously set in =
12h-mode?
>=20
>=20
>> +	/* disable rtc periodic function */
>> +	err =3D rc5t619_rtc_periodic_disable(&pdev->dev);
>> +	if (err) {
>> +		dev_err(&pdev->dev, "disable rtc periodic int: %d\n", =
err);
>> +		return err;
>> +	}
>> +
>> +	/* clearing RTC Adjust register */
>> +	err =3D rc5t619_rtc_clk_adjust(&pdev->dev, 0);
>> +	if (err) {
>> +		dev_err(&pdev->dev, "unable to program RTC_ADJUST: =
%d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* disable interrupt */
>> +	err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
>> +	if (err) {
>> +		dev_err(&pdev->dev, "disable alarm interrupt: %d\n", =
err);
>> +		return err;
>> +	}
>> +
>> +	if (pon_flag) {
>> +		alarm_flag =3D 0;
>> +		err =3D rc5t619_rtc_alarm_flag_clr(&pdev->dev);
>> +		if (err) {
>> +			dev_err(&pdev->dev,
>> +				"pon=3D1 clear alarm flag error: %d\n", =
err);
>> +			return err;
>> +		}
>> +	}
>> +
>> +	device_init_wakeup(&pdev->dev, 1);
>=20
> Do you want to do that even without an irq?
>=20
>> +
>> +	rtc->rtc =3D devm_rtc_device_register(&pdev->dev, pdev->name,
>> +				       &rc5t619_rtc_ops, THIS_MODULE);
>> +
>=20
> Please use devm_rtc_allocate_device and rtc_register_device
>=20
>> +	if (IS_ERR(rtc->rtc)) {
>> +		err =3D PTR_ERR(rtc->rtc);
>> +		dev_err(dev, "RTC device register: err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* set interrupt and enable it */
>> +	if (rtc->irq !=3D -1) {
>> +		err =3D devm_request_threaded_irq(&pdev->dev, rtc->irq, =
NULL,
>> +						rc5t619_rtc_irq,
>> +						IRQF_ONESHOT,
>> +						"rtc-rc5t619",
>> +						&pdev->dev);
>> +		if (err < 0) {
>> +			dev_err(&pdev->dev, "request IRQ:%d fail\n", =
rtc->irq);
>> +			rtc->irq =3D -1;
>> +
>> +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
>> +			if (err)
>> +				return err;
>> +
>> +		} else {
>> +			/* enable wake */
>> +			enable_irq_wake(rtc->irq);
>> +			/* enable alarm_d */
>> +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev, =
alarm_flag);
>> +			if (err) {
>> +				dev_err(&pdev->dev, "failed rtc =
setup\n");
>> +				return -EBUSY;
>> +			}
>> +		}
>> +	} else {
>> +		/* system don't want to using alarm interrupt, so close =
it */
>> +		err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
>> +		if (err) {
>> +			dev_err(&pdev->dev, "disable rtc alarm =
error\n");
>> +			return err;
>> +		}
>> +
>> +		dev_err(&pdev->dev, "ricoh61x interrupt is disabled\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rc5t619_rtc_remove(struct platform_device *pdev)
>> +{
>> +	rc5t619_rtc_alarm_enable(&pdev->dev, 0);
>=20
> If the PMIC can be used to start the platform, you probably don't want
> to disable the alarm here. Even if it doesn't, is it actually useful =
to
> disable the alarm?
>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver rc5t619_rtc_driver =3D {
>> +	.driver	=3D {
>> +		.name	=3D "rc5t619-rtc",
>> +	},
>> +	.probe	=3D rc5t619_rtc_probe,
>> +	.remove	=3D rc5t619_rtc_remove,
>> +};
>> +
>> +module_platform_driver(rc5t619_rtc_driver);
>> +MODULE_ALIAS("platform:rc5t619-rtc");
>> +MODULE_DESCRIPTION("RICOH RC5T619 RTC driver");
>> +MODULE_LICENSE("GPL");
>> --=20
>> 2.11.0
>>=20

BR,
Nikolaus=
