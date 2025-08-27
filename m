Return-Path: <linux-rtc+bounces-4766-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA69B37EE3
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1006B7C7899
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F31D2877FE;
	Wed, 27 Aug 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="o2u1ajVw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E0278768;
	Wed, 27 Aug 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756287223; cv=none; b=dl2BUhA8xeDQJodQjI9/B4Fg2J5AmzS634l0bj3u+4azi3ofghxSlasL8S86AaEapr1BwwExrom8HPPeY5DtJGBS/n5wvj7VYu/ScL0vojB/9GqLpCqiuYgHmFK3L3vNrti2nEWp0LYm7+Eo83xKdBT6LMvH5ROxwvZEs0PrEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756287223; c=relaxed/simple;
	bh=MQvBfl4kkV2fXT2490Fr950aKJNNuYgYUNBa7ER+5W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kScvR8DEsnzWiSc99irbkJyAMtN7YHPnQwbJjAIoJQuGZigX/yH+D9S5lNIZVAjrBIx20NQxOi/J64eamHUV0hIUvTuuL0W/p1f6wfQ1VjLKCclXH5iltlmleyQEYHmfHDYzLywCGmc0eeP3+Ph4wA0ommMRRA5GuT5CgmOkosQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=o2u1ajVw; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756287214;
	bh=3fghkl2yk9rz5bIVyEjDjhowSDJcsJYAqStEl1qbPDU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=o2u1ajVw6J8byKXyvsA4FI5Na1IjmNbpaaewruGecnAxeLfYYxruTzppuTWq6elVW
	 dX/JrJ5fYSxsz7Pet0fOUoxnv9u03jMfQHMEnpDG8T9Co8Lb9H+2DnIMIAoARP9vye
	 /ys8vQmcK+qHSTJLCuzBu+1Q2THmFupWOjReEP/U=
X-QQ-mid: zesmtpgz8t1756287213t979e8db4
X-QQ-Originating-IP: +p5Udl5pLkD5rldse5I0GLOWxX+xPdjNmzEYXYfq1hY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 17:33:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 295757120406263004
EX-QQ-RecipientCnt: 23
Date: Wed, 27 Aug 2025 17:33:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, lee@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <1D7078ABFE5E7BF8+aK7Q60w5Vhy1Wreg@LT-Guozexi>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-3-elder@riscstar.com>
 <089D29348F246F2C+aJ6bPgJsp5GjhDs5@LT-Guozexi>
 <b387ebdd-ae5d-4711-9e10-c61cb06f4b5b@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b387ebdd-ae5d-4711-9e10-c61cb06f4b5b@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M1tjFO1fqc+0+dhe15nsbY28Re8PVWeceyCs+6WGmafZxIfQhURiu9AZ
	jfZtxllCZ3Kzu25i/WVJGenUwi8Q5QBv5BnithHdqpR86K5vaA2ju9ryi6pNI3lC3Mgrx4G
	jN+uH2BYzWswIWpbrWjcVuXkUanvGwmQTN2amtsk4TYGDOYv5cOVshz0dQChxXEf5jav8PP
	oa9pPw6Rs0JqmW20bLV6UmbwIdHo1E7YDENj7rVMEa43wOQsTJVnmJ3nO61dpTGHZEZUySQ
	AymQE2k0Q5X6cldch/4y9L4bRbDuXAMLMVJTbfBoannxaKSpFY+wZyjemPDom8AWExrdayK
	gXTZDVDyKajkjKl+FAWFCgqbySlsL7fv8Q9bEWU5mckwtHD4lUZYYJfQQBxKRX0r0/JzdHS
	Z/gnFeNzji1rNGXyabCxoUVyXz66pvG6O7t8Gw7Bp40j4WEPjjj2b2bVJao9BhD178PBuB3
	PhWzv896bLJU7NYNI5xrGb0WubtxbgO4MJQ5c7u2xT6HQWWdmKv2V9Ba5K6WwyTO4QGrqhd
	zqArb5w7x4OX8J3v7piEpfo5ZqfTwKl5WMuOVmWkpLRRYU8mSGywpDaM7vOUWVLNXwwRHuX
	Y/lKsffgqfADUDcBulpXfK26P0P+nrMRB5Appq31mUyRppSB0WAeSUpddpZ99lInMY86uhJ
	v1pdvbGSJW0WyGbVujWOj22u3LhWDvIGtknwpwS88meT5fipUcPw3S1wCqgPqq9f5rR1/9p
	lfJYZDgwZ7LVZuhWdY3OgNUvW9R+Oj2jFkPycfMoaMnuHmD9YAWooa1wM7tRqSKjJFfoNj3
	/ErW//PpYbcvRbvUYFKRwjuAo/hlStOgxVulyUNiaYWEXjdSj0lHMv6y5PVaUAjE0mrfLH8
	wNulUmm92TDa1fJL9/vFfCSmQx37Gza16qc90ZK1kQXV/LEIDot/RtAt6GK2xBBbKoKlNkb
	HqmPLlggGAZC2n+ECEiphHKyAbK92mj7PKB809aQDOqv1jUNYAYB+75Egh5OyFVOsLYZqXI
	ZYM1+3vfRusDlJ/J0IRY/N0Fwd1ZsQ4zfwEk+89aoFg6SgHDUuHMqAC3XNZi9dSw3b1SPjr
	Hp/VB2npeVQ
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On Mon, Aug 25, 2025 at 11:08:45AM -0500, Alex Elder wrote:
> On 8/14/25 9:28 PM, Troy Mitchell wrote:
> > Hi, Alex,
> > 
> > I did not find any accesses to the P1 shutdown or reboot registers here.
> > Does this mean that the current series does not support reboot or shutdown?
> 
> Yes, that is correct.
> 
> > If so, do you have any plans to support this functionality?
> 
> At this time I personally don't have any plans to add this, but
> it could be added later (by anyone).
> 
> I actually attempted to do this initially, but gave up.  The PMIC
> is accessed via I2C, and I needed to implement a non-blocking
> version of the I2C register write operation.  I tried that, but
I have implemented a non-blocking version of the I2C driver [1]

Link: 
https://lore.kernel.org/all/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com/
[1]

                - Troy
> then found that the shutdown or reboot still did not work reliably.
> As it was, this was more than I originally planned to do, so I just
> implemented the simple RTC operations instead.
> 
> 					-Alex
> 
> > If I have misunderstood, please correct me.
> > 
> > Best regards,
> > Troy
> > 
> > 
> > On Tue, Aug 12, 2025 at 09:45:03PM -0500, Alex Elder wrote:
> > > Enable support for the RTC and regulators found in the SpacemiT P1
> > > PMIC.  Support is implemented by the simple I2C MFD driver.
> > > 
> > > The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
> > > PMIC provides 6 buck converters and 12 LDO regulators.  It also
> > > implements a switch, watchdog timer, real-time clock, and more.
> > > Initially its RTC and regulators are supported.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/mfd/Kconfig          | 11 +++++++++++
> > >   drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
> > >   2 files changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 425c5fba6cb1e..4d6a5a3a27220 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
> > >   	  Say M here if you want to include support for the Qualcomm RPM as a
> > >   	  module. This will build a module called "qcom_rpm".
> > > +config MFD_SPACEMIT_P1
> > > +	tristate "SpacemiT P1 PMIC"
> > > +	depends on I2C
> > > +	select MFD_SIMPLE_MFD_I2C
> > > +	help
> > > +	  This option supports the I2C-based SpacemiT P1 PMIC, which
> > > +	  contains regulators, a power switch, GPIOs, an RTC, and more.
> > > +	  This option is selected when any of the supported sub-devices
> > > +	  is configured.  The basic functionality is implemented by the
> > > +	  simple MFD I2C driver.
> > > +
> > >   config MFD_SPMI_PMIC
> > >   	tristate "Qualcomm SPMI PMICs"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > index 22159913bea03..47ffaac035cae 100644
> > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
> > >   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
> > >   };
> > > +
> > > +static const struct regmap_config spacemit_p1_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +};
> > > +
> > > +static const struct mfd_cell spacemit_p1_cells[] = {
> > > +	{ .name = "spacemit-p1-regulator", },
> > > +	{ .name = "spacemit-p1-rtc", },
> > > +};
> > > +
> > > +static const struct simple_mfd_data spacemit_p1 = {
> > > +	.regmap_config = &spacemit_p1_regmap_config,
> > > +	.mfd_cell = spacemit_p1_cells,
> > > +	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
> > > +};
> > > +
> > >   static const struct of_device_id simple_mfd_i2c_of_match[] = {
> > >   	{ .compatible = "kontron,sl28cpld" },
> > >   	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
> > >   	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
> > >   	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
> > >   	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> > > +	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
> > >   	{}
> > >   };
> > >   MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
> > > -- 
> > > 2.48.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 

