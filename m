Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2F9DF759
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 23:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJUVOZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 17:14:25 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:56384 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJUVOZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 17:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xvGSKvqzjuuP3O4pym8xIcNAiYSiLt8GMngYWMF48gs=; b=XauLaS0zaUjqoKfiIJq3BIUd4
        AKhS7OW37q90+7qm65BFge0GEJ6z5d703scSbu24uLELBaHG49kSjyXZaAKwg6FHNFkcJ8CytQkcg
        Am90xMYefp5SJ5yIvsTouSUr0MyPlFmDTa3+0eiUagn6ZlxZJvcEa8POQiVcTJKqtr3ww=;
Received: from p200300ccff0955007ee9d3fffe1fa246.dip0.t-ipconnect.de ([2003:cc:ff09:5500:7ee9:d3ff:fe1f:a246] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMf0N-0002Qf-L1; Mon, 21 Oct 2019 23:14:20 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMf0M-0002Nu-Ic; Mon, 21 Oct 2019 23:14:18 +0200
Date:   Mon, 21 Oct 2019 23:13:59 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191021231359.1cada218@kemnade.info>
In-Reply-To: <20191021101528.GU3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
 <20191021054104.26155-6-andreas@kemnade.info>
 <20191021101528.GU3125@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q_1q=yDwlKmL/4Eb1qEqbaF"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/q_1q=yDwlKmL/4Eb1qEqbaF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 21 Oct 2019 12:15:28 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hi,
>=20
> The subject line is weird, how is it related to rc5t583?
>=20
well, yes, rc5t583 driver source was opened next to the window where I wrote
the commit message...

> On 21/10/2019 07:41:04+0200, Andreas Kemnade wrote:
> >  config RTC_DRV_S35390A
> >  	tristate "Seiko Instruments S-35390A"
> >  	select BITREVERSE
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > index 6b09c21dc1b6..1d0673fd0954 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -136,6 +136,7 @@ obj-$(CONFIG_RTC_DRV_PXA)	+=3D rtc-pxa.o
> >  obj-$(CONFIG_RTC_DRV_R7301)	+=3D rtc-r7301.o
> >  obj-$(CONFIG_RTC_DRV_R9701)	+=3D rtc-r9701.o
> >  obj-$(CONFIG_RTC_DRV_RC5T583)	+=3D rtc-rc5t583.o
> > +obj-$(CONFIG_RTC_DRV_RC5T619)	+=3D rtc-rc5t619.o
> >  obj-$(CONFIG_RTC_DRV_RK808)	+=3D rtc-rk808.o
> >  obj-$(CONFIG_RTC_DRV_RP5C01)	+=3D rtc-rp5c01.o
> >  obj-$(CONFIG_RTC_DRV_RS5C313)	+=3D rtc-rs5c313.o
> > diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
> > new file mode 100644
> > index 000000000000..311788ff0723
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-rc5t619.c
> > @@ -0,0 +1,476 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * drivers/rtc/rtc-ricoh619.c
> > + *
> > + * Real time clock driver for RICOH R5T619 power management chip.
> > + *
> > + * Copyright (C) 2019 Andreas Kemnade
> > + *
> > + * Based on code
> > + *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
> > + *
> > + * Based on code
> > + *  Copyright (C) 2011 NVIDIA Corporation =20
>=20
> Based on is not useful.
>=20
Well, ok, I guess 90 % of the lines are rewritten by me.
So I could remove all that Based on copyright notices?

> > + */
> > +
> > +/* #define debug		1 */
> > +/* #define verbose_debug	1 */
> > + =20
>=20
> No dead code please.
>=20
ok.

> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/rn5t618.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/bcd.h>
> > +#include <linux/rtc.h>
> > +#include <linux/slab.h>
> > +#include <linux/irqdomain.h>
> > +
> > +struct rc5t619_rtc {
> > +	int			irq;
> > +	struct rtc_device	*rtc;
> > +	struct rn5t618 *rn5t618;
> > +};
> > +
> > +#define CTRL1_ALARM_ENABLED 0x40
> > +#define CTRL1_24HR 0x20
> > +#define CTRL1_PERIODIC_MASK 0xf
> > +
> > +#define CTRL2_PON 0x10
> > +#define CTRL2_ALARM_STATUS 0x80
> > +#define CTRL2_CTFG 0x4
> > +#define CTRL2_CTC 0x1
> > +
> > +static int rc5t619_rtc_periodic_disable(struct device *dev)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	/* disable function */
> > +	err =3D regmap_update_bits(rtc->rn5t618->regmap,
> > +			RN5T618_RTC_CTRL1, CTRL1_PERIODIC_MASK, 0);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	/* clear alarm flag and CTFG */
> > +	err =3D regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2,
> > +			CTRL2_ALARM_STATUS | CTRL2_CTFG | CTRL2_CTC, 0);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_clk_adjust(struct device *dev, uint8_t clk)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	return regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_ADJUST, clk); =
=20
>=20
> Is it useful to have a function for a single regmap_write?

well, I could live without.
>=20
> Also what is that adjusting? If this is adding/removing clock cycles,
> you need to use .set_offset and .read_offset.
>=20
It the moment I am just clearing it at init. Since I do not know the
exact meaning of the value, I am not offering it through set_offset/read_of=
fset.

> > +}
> > +
> > +static int rc5t619_rtc_pon_get_clr(struct device *dev, uint8_t *pon_f)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	int err;
> > +	unsigned int reg_data;
> > +
> > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &reg_dat=
a);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	if (reg_data & CTRL2_PON) {
> > +		*pon_f =3D 1;
> > +		/* clear VDET PON */
> > +		reg_data &=3D ~(CTRL2_PON | CTRL2_CTC | 0x4a);	/* 0101-1011 */
> > +		reg_data |=3D 0x20;	/* 0010-0000 */ =20
>=20
> Is it possible to have more defines for those magic values?
>=20
Well, I only have some GPLed source code as documentation, no good document=
ation.
So I only know that one bit must be VDET.
rtc-rc5t583 seems not to be helpful to find these magic numbers.
0x40 might be VDET. At least that is conform with rtc-rs5c348.c.
rc5t583 seems not to know a VDET.
But there seems to be no clear duplicate anywhere of those two
ctrl registers. It seems that the rc5t619 is a cross of everything, having
6 byte bcd time in common with everything.=20
So we have to keep a bit of magic here.

> > +		err =3D regmap_write(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2,
> > +					reg_data);
> > +	} else {
> > +		*pon_f =3D 0;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/* 0-12hour, 1-24hour */
> > +static int rc5t619_rtc_24hour_mode_set(struct device *dev, int mode)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	return regmap_update_bits(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
> > +			CTRL1_24HR, mode ? CTRL1_24HR : 0); =20
>=20
> Is it useful to have a function for a single regmap_update_bits?
>=20
Again I could live without that.

> > +}
> > +
> > +
> > +static int rc5t619_rtc_read_time(struct device *dev, struct rtc_time *=
tm)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u8 buff[7];
> > +	int err;
> > +	int cent_flag;
> > +
> > +	err =3D regmap_bulk_read(rtc->rn5t618->regmap, RN5T618_RTC_SECONDS,
> > +				buff, sizeof(buff));
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to read time: %d\n", err); =20
>=20
> Please reconsider adding so many strings in the driver, they add almost
> no value but will increase the kernel memory footprint.
>
Well, removing all those things which are just i2c io errors makes sense.
=20
> > +		return err;
> > +	}
> > +
> > +	if (buff[5] & 0x80) =20
> A define for the century bit would be good.
>=20
yes, that is a clearly understood bit.

> > +		cent_flag =3D 1;
> > +	else
> > +		cent_flag =3D 0;
> > +
> > +	buff[5] =3D buff[5] & 0x1f;		/* bit5 19_20 */ =20
>=20
> This assignment is unnecessary, you can mask the value when using it.
>=20
ok.

> Is the RTC 1900-2099 or 2000-2199? Please include the ouput of rtc-range
> in the commit log:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tr=
ee/rtc-range.c
>=20
# ./rtc-range=20

Testing 2000-02-28 23:59:59.
OK

Testing 2038-01-19 03:14:07.
OK

Testing 2069-12-31 23:59:59.
OK

Testing 2099-12-31 23:59:59.
KO RTC_RD_TIME returned 22 (line 138)

Testing 2100-02-28 23:59:59.
KO RTC_RD_TIME returned 22 (line 138)

Testing 2106-02-07 06:28:15.
OK

Testing 2262-04-11 23:47:16.
KO  Read back 2102-04-11 23:47:16.

I think it is 1900 to 2099.

> > +
> > +	tm->tm_sec  =3D bcd2bin(buff[0]);
> > +	tm->tm_min  =3D bcd2bin(buff[1]);
> > +	tm->tm_hour =3D bcd2bin(buff[2]);		/* bit5 PA_H20 */
> > +	tm->tm_wday =3D bcd2bin(buff[3]);
> > +	tm->tm_mday =3D bcd2bin(buff[4]);
> > +	tm->tm_mon  =3D bcd2bin(buff[5]) - 1;	/* back to system 0-11 */
> > +	tm->tm_year =3D bcd2bin(buff[6]) + 100 * cent_flag;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_set_time(struct device *dev, struct rtc_time *t=
m)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u8 buff[7];
> > +	int err;
> > +	int cent_flag;
> > +
> > +	if (tm->tm_year >=3D 100)
> > +		cent_flag =3D 1;
> > +	else
> > +		cent_flag =3D 0;
> > +
> > +	tm->tm_mon =3D tm->tm_mon + 1; =20
>=20
> This assignment is not necessary.
>=20
ok.

> > +	buff[0] =3D bin2bcd(tm->tm_sec);
> > +	buff[1] =3D bin2bcd(tm->tm_min);
> > +	buff[2] =3D bin2bcd(tm->tm_hour);
> > +	buff[3] =3D bin2bcd(tm->tm_wday);
> > +	buff[4] =3D bin2bcd(tm->tm_mday);
> > +	buff[5] =3D bin2bcd(tm->tm_mon);		/* system set 0-11 */
> > +	buff[6] =3D bin2bcd(tm->tm_year - cent_flag * 100);
> > +
> > +	if (cent_flag)
> > +		buff[5] |=3D 0x80;
> > +
> > +	err =3D regmap_bulk_write(rtc->rn5t618->regmap, RN5T618_RTC_SECONDS,
> > +				buff, sizeof(buff));
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to program new time: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_alarm_is_enabled(struct device *dev,  uint8_t *=
enabled)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	int err;
> > +	unsigned int reg_data;
> > +
> > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1, &reg_dat=
a);
> > +	if (err) {
> > +		dev_err(dev, "read RTC_CTRL1 error %d\n", err);
> > +		*enabled =3D 0; =20
>=20
> Is it necessary to set enabled here?
>=20
probably not.

> > +	} else {
> > +		if (reg_data & CTRL1_ALARM_ENABLED)
> > +			*enabled =3D 1;
> > +		else
> > +			*enabled =3D 0;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/* 0-disable, 1-enable */
> > +static int rc5t619_rtc_alarm_enable(struct device *dev, unsigned int e=
nabled)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	int err; =20
>=20
> err is not necessary.
>=20
ok.

> > +
> > +	err =3D regmap_update_bits(rtc->rn5t618->regmap,
> > +			RN5T618_RTC_CTRL1,
> > +			CTRL1_ALARM_ENABLED,
> > +			enabled ? CTRL1_ALARM_ENABLED : 0);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u8 buff[6];
> > +	unsigned int buff_cent;
> > +	int err;
> > +	int cent_flag;
> > +	unsigned int enabled_flag;
> > +
> > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_MONTH, &buff_ce=
nt);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to read time: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	if (buff_cent & 0x80)
> > +		cent_flag =3D 1;
> > +	else
> > +		cent_flag =3D 0;
> > +
> > +	err =3D regmap_bulk_read(rtc->rn5t618->regmap, RN5T618_RTC_ALARM_Y_SE=
C,
> > +				buff, sizeof(buff));
> > +	if (err)
> > +		return err;
> > +
> > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL1,
> > +				&enabled_flag);
> > +	if (err)
> > +		return err;
> > +
> > +	if (enabled_flag & CTRL1_ALARM_ENABLED)
> > +		enabled_flag =3D 1; =20
>=20
> Why don't you set alrm->enabled directly here?
>=20
> alrm->enabled =3D !!(enabled_flag & CTRL1_ALARM_ENABLED);
>=20
yes, makes sense.

> > +	else
> > +		enabled_flag =3D 0;
> > +
> > +
> > +	buff[3] =3D buff[3] & 0x3f;
> > +
> > +	alrm->time.tm_sec  =3D bcd2bin(buff[0]);
> > +	alrm->time.tm_min  =3D bcd2bin(buff[1]);
> > +	alrm->time.tm_hour =3D bcd2bin(buff[2]);
> > +	alrm->time.tm_mday =3D bcd2bin(buff[3]);
> > +	alrm->time.tm_mon  =3D bcd2bin(buff[4]) - 1;
> > +	alrm->time.tm_year =3D bcd2bin(buff[5]) + 100 * cent_flag;
> > +	alrm->enabled =3D enabled_flag;
> > +	dev_dbg(dev, "read alarm: %d/%d/%d %d:%d:%d\n", =20
>=20
> Use %ptR
>=20
oh, that is nice.

> > +		(alrm->time.tm_mon), alrm->time.tm_mday, alrm->time.tm_year,
> > +		 alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u8 buff[6];
> > +	int err;
> > +	int cent_flag;
> > +
> > +	err =3D 0;
> > +	rc5t619_rtc_alarm_enable(dev, 0); =20
>=20
> This may fail
>=20
will add checks

> > +	if (rtc->irq =3D=3D -1)
> > +		return -EIO; =20
>=20
> This has to be -EINVAL to get UIE emulation working.
>
so then ordinary hwclock still works without irq?
=20
> > +
> > +	if (alrm->enabled =3D=3D 0)
> > +		return 0;
> > +
> > +	if (alrm->time.tm_year >=3D 100)
> > +		cent_flag =3D 1;
> > +	else
> > +		cent_flag =3D 0;
> > +
> > +	alrm->time.tm_mon +=3D 1;
> > +	buff[0] =3D bin2bcd(alrm->time.tm_sec);
> > +	buff[1] =3D bin2bcd(alrm->time.tm_min);
> > +	buff[2] =3D bin2bcd(alrm->time.tm_hour);
> > +	buff[3] =3D bin2bcd(alrm->time.tm_mday);
> > +	buff[4] =3D bin2bcd(alrm->time.tm_mon);
> > +	buff[5] =3D bin2bcd(alrm->time.tm_year - 100 * cent_flag);
> > +	buff[3] |=3D 0x80;	/* set DAL_EXT */ =20
>=20
> This bit needs a define.
>=20
ok.

> > +
> > +	err =3D regmap_bulk_write(rtc->rn5t618->regmap, RN5T618_RTC_ALARM_Y_S=
EC,
> > +				buff, sizeof(buff));
> > +	if (err) {
> > +		dev_err(dev, "unable to set alarm: %d\n", err);
> > +		return -EBUSY; =20
>=20
> Why EBUSY?
>=20
will just return err without message.
> > +	}
> > +
> > +	rc5t619_rtc_alarm_enable(dev, alrm->enabled); =20
>=20
> This may fail.
>=20
will add a check.

> > +
> > +	return 0;
> > +}
> > +
> > +static const struct rtc_class_ops rc5t619_rtc_ops =3D {
> > +	.read_time	=3D rc5t619_rtc_read_time,
> > +	.set_time	=3D rc5t619_rtc_set_time,
> > +	.set_alarm	=3D rc5t619_rtc_set_alarm,
> > +	.read_alarm	=3D rc5t619_rtc_read_alarm,
> > +	.alarm_irq_enable =3D rc5t619_rtc_alarm_enable,
> > +};
> > +
> > +static int rc5t619_rtc_alarm_flag_clr(struct device *dev)
> > +{
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	/* clear alarm-D status bits.*/
> > +	return regmap_update_bits(rtc->rn5t618->regmap,
> > +				RN5T618_RTC_CTRL2,
> > +				CTRL2_ALARM_STATUS | CTRL2_CTC, 0);
> > +}
> > +
> > +static irqreturn_t rc5t619_rtc_irq(int irq, void *data)
> > +{
> > +	struct device *dev =3D data;
> > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	rc5t619_rtc_alarm_flag_clr(dev);
> > +
> > +	rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +
> > +static int rc5t619_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct rn5t618 *rn5t618 =3D dev_get_drvdata(pdev->dev.parent);
> > +	struct rc5t619_rtc *rtc;
> > +	uint8_t pon_flag, alarm_flag;
> > +	int err;
> > +
> > +	rtc =3D devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (IS_ERR(rtc)) {
> > +		err =3D PTR_ERR(rtc);
> > +		dev_err(&pdev->dev, "no enough memory for rc5t619_rtc using\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	rtc->rn5t618 =3D rn5t618;
> > +
> > +	dev_set_drvdata(dev, rtc);
> > +	rtc->irq =3D -1;
> > +
> > +	if (rn5t618->irq_data)
> > +		rtc->irq =3D regmap_irq_get_virq(rn5t618->irq_data,
> > +				RN5T618_IRQ_RTC);
> > +
> > +	if (rtc->irq  < 0) {
> > +		dev_err(dev, "no irq specified, wakeup is disabled\n");
> > +		rtc->irq =3D -1;
> > +	}
> > +
> > +	/* get interrupt flag */
> > +	err =3D rc5t619_rtc_alarm_is_enabled(dev, &alarm_flag);
> > +	if (err)
> > +		return err;
> > +
> > +	/* get PON flag */
> > +	err =3D rc5t619_rtc_pon_get_clr(&pdev->dev, &pon_flag);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "get PON flag error: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	/* using 24h-mode */
> > +	err =3D rc5t619_rtc_24hour_mode_set(&pdev->dev, 1);
> > + =20
>=20
> Doesn't that corrupt the time if the RTC was previously set in 12h-mode?
>=20
>=20
Probably it can. but probably that is only important in a multi-boot scenar=
io but
who knows... If that is important enough I can try to implement 12h mode.

Is there any testing tool for 12h vs. 24h? Or should I expand
rtc-range.c? BTW: apparently rtc-rc5t583.c seems not to properly care
about 24h mode too, so I took a bad example. Well, not tested that...

> > +	/* disable rtc periodic function */
> > +	err =3D rc5t619_rtc_periodic_disable(&pdev->dev);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "disable rtc periodic int: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	/* clearing RTC Adjust register */
> > +	err =3D rc5t619_rtc_clk_adjust(&pdev->dev, 0);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "unable to program RTC_ADJUST: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	/* disable interrupt */
> > +	err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "disable alarm interrupt: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	if (pon_flag) {
> > +		alarm_flag =3D 0;
> > +		err =3D rc5t619_rtc_alarm_flag_clr(&pdev->dev);
> > +		if (err) {
> > +			dev_err(&pdev->dev,
> > +				"pon=3D1 clear alarm flag error: %d\n", err);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	device_init_wakeup(&pdev->dev, 1); =20
>=20
> Do you want to do that even without an irq?
>=20
probably not.

> > +
> > +	rtc->rtc =3D devm_rtc_device_register(&pdev->dev, pdev->name,
> > +				       &rc5t619_rtc_ops, THIS_MODULE);
> > + =20
>=20
> Please use devm_rtc_allocate_device and rtc_register_device
>=20
ok.

> > +	if (IS_ERR(rtc->rtc)) {
> > +		err =3D PTR_ERR(rtc->rtc);
> > +		dev_err(dev, "RTC device register: err %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	/* set interrupt and enable it */
> > +	if (rtc->irq !=3D -1) {
> > +		err =3D devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> > +						rc5t619_rtc_irq,
> > +						IRQF_ONESHOT,
> > +						"rtc-rc5t619",
> > +						&pdev->dev);
> > +		if (err < 0) {
> > +			dev_err(&pdev->dev, "request IRQ:%d fail\n", rtc->irq);
> > +			rtc->irq =3D -1;
> > +
> > +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > +			if (err)
> > +				return err;
> > +
> > +		} else {
> > +			/* enable wake */
> > +			enable_irq_wake(rtc->irq);
> > +			/* enable alarm_d */
> > +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev, alarm_flag);
> > +			if (err) {
> > +				dev_err(&pdev->dev, "failed rtc setup\n");
> > +				return -EBUSY;
> > +			}
> > +		}
> > +	} else {
> > +		/* system don't want to using alarm interrupt, so close it */
> > +		err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > +		if (err) {
> > +			dev_err(&pdev->dev, "disable rtc alarm error\n");
> > +			return err;
> > +		}
> > +
> > +		dev_err(&pdev->dev, "ricoh61x interrupt is disabled\n");
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rc5t619_rtc_remove(struct platform_device *pdev)
> > +{
> > +	rc5t619_rtc_alarm_enable(&pdev->dev, 0); =20
>=20
> If the PMIC can be used to start the platform, you probably don't want
> to disable the alarm here. Even if it doesn't, is it actually useful to
> disable the alarm?
>=20

well, I think this is not executed if you do
rtcwake -m off -s something
At least my device powers on after that.

Somehow I expect the driver to clean up there. e.g. rc5t583 does that, too.
But no strong opinion here.

Regards,
Andreas

--Sig_/q_1q=yDwlKmL/4Eb1qEqbaF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2uH5kACgkQl4jFM1s/
ye/djQ//dliFTjlW5dskMzCCBkBPrj43S3ANwJ80zWJlm05twMp3zCPE6e3mm7Q8
i7tlAPrHTyq4JeJPk+LDIRiODuffCErU22XvdWmTvVkLe3J1gIA7kQqdXevhyWJx
jiPhlnOyLXTNSe+qIDOQl7GOXbR/Cy9JJeXTSQ7F6tejnmeQM3MHloP7cAoYpaNu
l4NvaP0cGYGb2YW0vYurv4Ijaf/Uoasx+fJxL6/4Rv8DY4BnfWU8A1JZwzHG/4jv
Dyz1872eor20fdVBbB2NizfCK0Vd5PNrdgyk9BGI8a6UrVa5nJSEPjUnOxtnnAnQ
F05QmiSxG3XaEzf3+YQglUCVzr/o2ejLWP1BYPF2UIyKcM7PsR+mE/xu9qLrbpKq
x7w7WkgI8FetJKOAIBrbZCynjbZFLP1e3IxoticqxxReSsYL944fFXY3N5isT/65
OR6rqgZTANgxObmduBg1Q+wRQijF1HJB2PsnPaP1FvaW/54A99Y2JidI28YsQxcB
+AAyFUTiUmCbZMnqKPZv+3B1P3cnmukCqNHi0ublNVFl/wKmPYEN1wRHYvIK44PL
SaHDHPGSuX/HkGQOUFnkeHktgYRHpMxR2kWLQTOgO2V8zzZBsIqnq3jB9Pbwwjmy
II5OtZI1gDCVNLxyx11yPeX7tod+gLuj5QdGbqq0hNjzr5aYEIU=
=122Z
-----END PGP SIGNATURE-----

--Sig_/q_1q=yDwlKmL/4Eb1qEqbaF--
