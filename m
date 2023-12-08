Return-Path: <linux-rtc+bounces-402-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12E80A7CA
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Dec 2023 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4311C2082A
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Dec 2023 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430E531A74;
	Fri,  8 Dec 2023 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9FXX7K9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780930327
	for <linux-rtc@vger.kernel.org>; Fri,  8 Dec 2023 15:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6B8C433C7;
	Fri,  8 Dec 2023 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702050368;
	bh=d66daHmWbMCUMbZAv8R2P4fXdyVqForZCPIK4FmV15g=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=h9FXX7K9oXuFGiV1cPXN9SRN/4XpGvh8oHxYRboCWXCW2SvdLZ4N75lIjbntUUSUU
	 dSr4j6DgtEuV8PUxNCId+RriRjvmtdXJA2T1/1CHeWEURdbkUiUWSERun0DeiTuInS
	 71ylthe8dPgoYYzB066qEl77T1DhI5Zv680Emi9gTeoCIw5BnntASqnMnnCkZ2KdaV
	 Td0jQhDbwO70BopdE/dmi3wuHJsjHjSCjUuP+5vGSJeMdNRLE3qv67G/9KLPeQ3pvf
	 LxJhr9vFqB1dglbmj11e6wonhBp/+09GN4EHNXVhqPDExZXSFkEajUthNRsrBAkqNp
	 GmE7rhDV/MTHw==
Date: Fri, 8 Dec 2023 16:46:03 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alessandro
 Zummo <a.zummo@towertech.it>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 4/7] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <20231208164603.5c52723a@dellmb>
In-Reply-To: <202311031923161422b866@mail.local>
References: <20231026161803.16750-1-kabel@kernel.org>
	<20231026161803.16750-5-kabel@kernel.org>
	<202311031923161422b866@mail.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Nov 2023 20:23:16 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 26/10/2023 18:18:00+0200, Marek Beh=C3=BAn wrote:
> > +static int omnia_get_uptime_wakeup(const struct i2c_client *client, u3=
2 *uptime,
> > +				   u32 *wakeup)
> > +{
> > +	__le32 reply[2];
> > +	int err;
> > +
> > +	err =3D omnia_cmd_read(client, CMD_GET_UPTIME_AND_WAKEUP, reply,
> > +			     sizeof(reply));
> > +	if (err)
> > +		return err;
> > +
> > +	if (uptime)
> > +		*uptime =3D le32_to_cpu(reply[0]);
> > +
> > +	if (wakeup)
> > +		*wakeup =3D le32_to_cpu(reply[1]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int omnia_read_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +	u32 uptime;
> > +	int err;
> > +
> > +	err =3D omnia_get_uptime_wakeup(to_i2c_client(dev), &uptime, NULL);
> > +	if (err)
> > +		return err; =20
>=20
> Does this get the real time or the board uptime?

Hi Alexandre,

sorry I did not notice your email sooner.
This returns board uptime. The MCU does not remember real time.

> > +
> > +	rtc_time64_to_tm(uptime, tm);
> > +
> > +	return 0;
> > +}
> > +
> > +static int omnia_read_alarm(struct device *dev, struct rtc_wkalrm *alr=
m)
> > +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct omnia_mcu *mcu =3D i2c_get_clientdata(client);
> > +	u32 wakeup;
> > +	int err;
> > +
> > +	err =3D omnia_get_uptime_wakeup(client, NULL, &wakeup);
> > +	if (err)
> > +		return err;
> > +
> > +	alrm->enabled =3D !!wakeup;
> > +	rtc_time64_to_tm(wakeup ?: mcu->rtc_alarm, &alrm->time); =20
>=20
> I don't think this works properly as on boot, mcu->rtc_alarm will not be
> set whereas wakeup could be.

mcu->rtc_alarm is the value that is to be written to MCU wakeup
register when we enable the RTC alarm with .alarm_irq_enable().

When the alarm is enabled by other means than the driver (prior boot or
by a userspace utility), the omnia_read_alarm() will determine it
correctly, since it will read via I2C the MCU wakeup value.

If it is non-zero, it will return that the alarm is enabled and the
alarm time is determined by this non-zero value.

If the alarm is disabled on the MCU, we return that the alarm is
disabled, but we fill in the alrm->time with the cached value of
mcu->rtc_alarm which was set in previous call to the .set_alarm method.
This is because we want to support both the new IOCTLs (RTC_WKALM_RD,
RTC_WKALM_SET) and the old (RTC_ALM_SET, RTC_AIE_ON, RTC_AIE_OFF).

>=20
> Also, is wakeup actually an absolute time? I'm not sure I get how the
> MCU works then.

The wakeup value is in the same units as uptime: seconds elapsed since
MCU started.

Example:
- uptime is 2000 seconds (MCU has been powered on 2000 seconds ago)
- we are going to power off the board, but we want it to power on in
  one hour
- we will therefore set wakeup to uptime + 3600 =3D 2000 + 3600 =3D 5600

> > +	mcu->rtcdev->ops =3D &omnia_rtc_ops;
> > +	mcu->rtcdev->range_max =3D U32_MAX; =20
>=20
> You probably need to add:
>=20
> set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, mcu->rtcdev->features);
>=20

Thx, will do. Is this bit documented? Could only find its definition
and one usage with git grep.

Marek

