Return-Path: <linux-rtc+bounces-4701-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6CB275CF
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Aug 2025 04:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78D217B81CF
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Aug 2025 02:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9B029D296;
	Fri, 15 Aug 2025 02:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="n3pke1/m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AACD29D278;
	Fri, 15 Aug 2025 02:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755224907; cv=none; b=foaCc7P3prVjMni7kmn//VT5RLBI4J2we9uKwhgv9zbWng9/w6f3rwhAracJYJ22SzLC0zR1tFDdpyY8bJg5sm1B+Qc6CC2pKE42vtJsUqDc4wYsGSyIBbhmepR5IvU5EX/kZR2XhRyy8+9bgbEc4TQjZlJsy8+Twz5qEODN/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755224907; c=relaxed/simple;
	bh=gmXz+McnzyPjXPi6OUhiohI/xUC56gZuLS5gnq0kbxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PInhJ1JvMTh2cNLUQxbw09HyoOaJv26ztg5leLf1JViClfliRRLk6NMeCkfR3V35WkEpM9nBKaNyhOxdGspe+nK+J59YTpNIcdFTkn+1vatlA90PfYIeL+NGehN9AZE6bZgDKNfLyMpgMFAz2E9ekduFaNTHutbC2VqdK/p+bAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=n3pke1/m; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755224898;
	bh=C8FPcDjjyvmDVFKC1++BAFYe4RVNG4mt5PvVSNaRksk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=n3pke1/mkxzRIkDkrumzt+gmCCpCKLLz/4I/G+Mc2oz3ar9f6IerMyX3tWAvdHHUd
	 otTWeizsuzET1sx3uGqDQpNPVFKHnnpSDgMfSR0+BLLqEWAld7yG2ORwvKdBFAVTFX
	 SbOKOSOan6PPqIOOlgvv3+U/Bk0WKw4DwpTBHcmg=
X-QQ-mid: zesmtpgz5t1755224896tbd303590
X-QQ-Originating-IP: jlBHOZ+VAUej3deF8SZeiYt46tnagK7aAe41l0Xfo84=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Aug 2025 10:28:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14352481301099076382
EX-QQ-RecipientCnt: 23
Date: Fri, 15 Aug 2025 10:28:14 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <089D29348F246F2C+aJ6bPgJsp5GjhDs5@LT-Guozexi>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813024509.2325988-3-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nc4Sv39/e83W4tor1UZ0MMaqxN5N6dzek1YXRT7J2xQvpJbhgtQbR8EX
	jh/WyY992HCnuPuemFj2BLr9OABrESwdZl91+eg2t3xFHpYmNXqe4GhT1e8zCL9mNkfQcBP
	hZlaCESZGIe8rPdfXr4EmxTiMyNN+gjmSDvwWz0vqhOe7sRhryybu+Ioubl86PBq8G+JAVR
	leqYt5eAXQ1ERLJ023cxz80rSQ6zOTXsn2IDUF0SwHqrLhJfljRYQsg9rf0w9wJxu4NAenS
	0FtZgds3eA/Cu+WoSrgKLnhipIcf2Ay8BOmttgEO/1kv12CsUJEnraQ6gpNgJqePeYWuDBO
	RVfC7IYk3BUulU5EQ45xtyzxFRTdfunQ2C2JlO+u1zH7oYbkpTZN/dP5i3Js53zlKeDABLU
	dY6GtUtzOdZEYVeTyVDkzWUZD1Dfh0qPFlImT0g7kADGjw26VsJfG17cWo+B3BhUkOn9eb+
	e7hF8GfDxwZpuvc60WWAEhvY+u0tB8UMZU4LivD0Ev/hQNktYElxeB2R9KxV/MNK1CPRfSv
	7GpJ9yjdZpMOLo+B4W3w2fhcbn7l9rKWT5iqpxOoK73v2cuc8bCv8mMXLrI34Hus2n8Inan
	coiV8T8B9+lE3JqiItoYho8LcVDtNfsBp46BdLCv6WWrAFOqkAYOrYpwjWo3yrFvqEjPuxJ
	IGgPddazQVKmmOIA2CVTf/meTQAJxO9ldCr2agzCk/EgTWT4bf/FajxEPWYWcTuwxuBdf39
	wPJ16kMp+ncJ9wqel7OymZAI1ouSGC1YHslNsKztQ1YCBi28fD0z432BtwiTAT9RTMkdGzA
	A8DpNea8f9i9TouGL5MhOqHO2ZOWyLQyZAC7vdnz+7qM68I9/EXx4L3Y5DdaDh4eX3arb4S
	TU4iwuvni46ZFydiT3YYeUNuoQXamVRBVQbY/jXxu+kAhhDMa+18JCYCWBpaqN3J0BdNIAM
	mfGtFgPqdYtSHNcZBW0Cg3RMHvTTUg2SUJH+m6ElQWBn2pZ2YSPYt2tle3eTvaMUCVVjwS8
	FI1ZpzeB8W2hH6DntPK42WQf0lIbn1yVPui1/YofVBoEXdudCu7EXOqlx7xnz+jinICBnqA
	bPOiAQytaZY
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Hi, Alex,

I did not find any accesses to the P1 shutdown or reboot registers here.
Does this mean that the current series does not support reboot or shutdown?
If so, do you have any plans to support this functionality?
If I have misunderstood, please correct me.

Best regards,
Troy


On Tue, Aug 12, 2025 at 09:45:03PM -0500, Alex Elder wrote:
> Enable support for the RTC and regulators found in the SpacemiT P1
> PMIC.  Support is implemented by the simple I2C MFD driver.
> 
> The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
> PMIC provides 6 buck converters and 12 LDO regulators.  It also
> implements a switch, watchdog timer, real-time clock, and more.
> Initially its RTC and regulators are supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/mfd/Kconfig          | 11 +++++++++++
>  drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 425c5fba6cb1e..4d6a5a3a27220 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
>  	  Say M here if you want to include support for the Qualcomm RPM as a
>  	  module. This will build a module called "qcom_rpm".
>  
> +config MFD_SPACEMIT_P1
> +	tristate "SpacemiT P1 PMIC"
> +	depends on I2C
> +	select MFD_SIMPLE_MFD_I2C
> +	help
> +	  This option supports the I2C-based SpacemiT P1 PMIC, which
> +	  contains regulators, a power switch, GPIOs, an RTC, and more.
> +	  This option is selected when any of the supported sub-devices
> +	  is configured.  The basic functionality is implemented by the
> +	  simple MFD I2C driver.
> +
>  config MFD_SPMI_PMIC
>  	tristate "Qualcomm SPMI PMICs"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..47ffaac035cae 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>  	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>  };
>  
> +
> +static const struct regmap_config spacemit_p1_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static const struct mfd_cell spacemit_p1_cells[] = {
> +	{ .name = "spacemit-p1-regulator", },
> +	{ .name = "spacemit-p1-rtc", },
> +};
> +
> +static const struct simple_mfd_data spacemit_p1 = {
> +	.regmap_config = &spacemit_p1_regmap_config,
> +	.mfd_cell = spacemit_p1_cells,
> +	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
> +};
> +
>  static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "kontron,sl28cpld" },
>  	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
>  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> +	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
> -- 
> 2.48.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

