Return-Path: <linux-rtc+bounces-4765-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDDB350B4
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Aug 2025 03:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB357244B86
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Aug 2025 01:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434E71FF1C7;
	Tue, 26 Aug 2025 01:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NJIULm2I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B31BD9F0;
	Tue, 26 Aug 2025 01:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756170274; cv=none; b=qcz2bMoAgL32cR13cepnJHOcreK04DlQyDROXUe7HIISyACSsIuq2z2SYv5xDVLxU3bKX8PlnEGs0Viwu6SU/0Tq4OKELQte6KsxVpRjnj1URibxswKNwcXIad0uk3xueEqPEg7lw5n/61qdt0v7TsAbFK9UyXjDM6bXmMrNVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756170274; c=relaxed/simple;
	bh=tB6fppnw+UcRDBN5lEThQWkSnIFpbnjuO084/tD3bU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsQzjMmPbEsJ8s0qJVYwqk0ZKe0wGQkqLrgmO/uMG0RBLJIpIsCjNDNtGIr5ZGmeWv30eYVWxsFD6C3RF2WCqCzZ20zSKngRnuofjz8mYziS0I26R+9kZcdLGMFAIzmJTbJ6bI0OZ7JCplgKVVdY5Ct7jUS4sFG1fAOPxSptGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NJIULm2I; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756170260;
	bh=YFNm4O+HT++w/XhGn19PpWttVXNF4FCXA5kWvgTYm9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NJIULm2ITw00OlVySf0zjkJbhgXaJ7GfGuEYcZmo4LgA80CpXz+50mmE34KHqy6rp
	 fBf7RQH6ANXyy2zZIULBEkJ3aAIVHiJQ4ZN1TBDJ6K8wVgPVlroNtlGKXj1Is0+gGx
	 T3Pp0orsc1ZgJADzSx8nYsZLCmOvuvLjpUhOopks=
X-QQ-mid: zesmtpsz5t1756170257t506bec28
X-QQ-Originating-IP: Z9Hix52xyLw0E0FxPAVbErXQgqX6aadOjoYB/9fqoi4=
Received: from = ( [14.123.253.26])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Aug 2025 09:04:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6597786748243803849
EX-QQ-RecipientCnt: 23
Date: Tue, 26 Aug 2025 09:04:15 +0800
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
Message-ID: <A90BFF97E4869C5B+aK0ID3oyoCtco3m5@LT-Guozexi>
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
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M9Bxf819/8YCxgr5E0eCTLJr0bZlmzJWwDmRH2FZekU0xn6PD6v6rNoe
	dP3FI+l5Y2TabLIuZ+pXMq7AqSls/Kb0pqyd/2lP12ecRF5IFegdolFYmdAFGAL5cC7pYtm
	unYTaEl3D9lb0pvw/2e0yoIvivn8EtqMJivGWgMLbERMQMWAPOX2tJF3FnvzI+dOuhGGVSe
	FFIKrApyUSVtGNuW+vfBx4GbdryHB4xbh3zbfAskp0+bI/r6lfhzvip9ax1wIPO3EHYa5An
	cQ/TN3v+wTVK82+Ue5a8wus6wWEXd9y3LU3YmvvCbclID3qa/shf0oF2qd/CeUNez7Tc0cR
	2bgE55pXaKoFFdcQnMbFURCCoQl4nnNIyF4whrRjnrtjzo14ht2sXoS0MEyn3AfJD8IvZ7T
	7/GYrSzY75y3IileD8IexRT1UhWqgZs8/7Sb/PLw2K1NZIrMXSrj7+wlXZs//ghHZn8hE5J
	JU0xiLzXvku3iXb3cOoK06ZYOLhXDl8uNoN45UiJicDXx2a/zMI5HKkRVnqE0yz+VxOb04H
	nZtAUuTb7Z0lExVKjUPbbvRfZwwc0W3NUDWo1pUvikqZM95ska4ny2w9Qry2/kzt+GBAL23
	EwSvxYdDp2dZr0E8WopDPOQxqoDu/bQoXpdk5V5PX22VELzEnhDYuY+fM2EQdFOPKDaoA08
	xQcyiBEfWBpcVJy23BguuauVJNUmUfIbTW2wd0CTtM9RCQKzN/HUPSdv0dSJGDcXkJH0v+D
	ENtaTttTz/h1RsNYoKQo+PsO/dtZs4wmCFtpfMAgveBSUCdyOq1TGMHKJTmCcHUKR7Ju2f+
	2Y8C6JHoIerlxI+IH4p8X2VAh4oroH7PHkCDSB4rmDv+b5RMRUtBzH0CIen2DVZZHq7pAes
	Dhed/+pMY+otrlh/bmSynVv3qpNbqGW6ZI/x8TOvQ/VEDReJUmayesfytyAStECNklmSQd/
	nF6Z3hNBmH1MZkDjw7PEBAfbsnBybB0e7MwrljOLvmZA4HiGBbbPU+sMzPxLJcGxfr70HYU
	RwHxLeTDqapmWrajBZ9Xx7JvLV/R7idTrBGlKoY40C8Xw8nsMDvXIpCpV2byc4ZUkKR5roI
	fObJKo2BPe7i0xC8CsWnmRKvBOLbqqE+g==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
> version of the I2C register write operation.  I tried that,
You tried that? so that means you have implemented a non-blocking version
of the I2C?
If so, can you give me a source tree to test it?
> but
> then found that the shutdown or reboot still did not work reliably.
ditto.

                - Troy

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

