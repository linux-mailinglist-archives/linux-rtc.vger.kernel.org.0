Return-Path: <linux-rtc+bounces-3158-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA46A319B8
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 00:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6BF53A83F2
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 23:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B0F26A0AE;
	Tue, 11 Feb 2025 23:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5lVe+HU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265926A0A3;
	Tue, 11 Feb 2025 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739317633; cv=none; b=Av6Huw5djMiEHcT8hmaUyV3ExOlaHrCut1F4YT+ucT+iznqOH+W6caqBFpm1JvG2DAJKzNd5PCkHJmonVvJ4vSNfQWoeMQySvSupPR/w+kGggwMohGW4cKNAudW/75RVPJ1GzUaa7HbQ/g4P3dn0UtOcG9KGzNUaXTfqmtySX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739317633; c=relaxed/simple;
	bh=LHHTUGJZo0Wyr1bAC1NbIJTWvVpqp2n5mqdPWyzf8zw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ebGUjFIz+b84omWtXgU17mQ5irb/TIM0NQ1KmaX+oqQBq80kd6GODfUPgiB8NX0RdMq76Dd+wCBMdpRyYlGPe0X+TENiW4FIMu9P7+D0ckV13HyZ4d4t7HodS1v2U4eMFed27BPtpgWhQjuLtbZOzZjukxM85NNSAGltkwHhwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5lVe+HU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7d58aa674so290907866b.0;
        Tue, 11 Feb 2025 15:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739317630; x=1739922430; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7cc/bmhw46t99D9MCXz5PtDHnb3kGfZJPYW+IvIGz4c=;
        b=a5lVe+HUkHGn6RtEsS+AmDUv0GTaWtPL9URECSQVdr4/vrAMwkgSahZt4OOZ2GrQFD
         mnvwYG7/vk0dK9TrtQSidDrcvJKaI2gkk70mF7SI5N5396HJmKH8dX/rmPGZGVuOKL7g
         B8URXQkn+6PiqwB3VLlhvdLodSwTSQmFOuNIBJNhaaOMHqs0EIASlmPPcbR5PC3OUfOM
         UM628hUP09ZYBIR4J6Bd9VgmPULHUaQIG6c9ew95vGnwpTfrmh1Pk5p/uDzM8K1LpoE+
         vflVsqNzfLWDPcWqNpjtwkXdxrJhMvvPJDedhNThT1MFu9wKTr1BI4nbHbk4Wl++1K2u
         6gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317630; x=1739922430;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cc/bmhw46t99D9MCXz5PtDHnb3kGfZJPYW+IvIGz4c=;
        b=t4WqufURWHJhI9Xz1J2HlELLeemmIZ2R+wmgYvvN5fYVTzcWSbygLGdmXIJie3sACj
         hkLm9YJmIh99/FusUTdoxBEcxJhIBygvt3nGA4zmzownXKdrk3bkUZqjYx/bdbMBeSXK
         ay2QNO8csP+ypN8ZOodfqJtq1tpGGiXzrctgK3/NeGdqlouljE7CPLvmku9nNH0RwFDz
         Nk/X2HHoxy3ztZ7EheHfLZdBso0cjl2N/w6ltWDy1HzHo5eH+tzpIkuco1sYl0K8jqHf
         bbS+hxmKtuDNdELklY8mYW4D4A5JB5UO7wMw4/SW4SK8VJrv39d+4wSSLp1oPgvK7fVs
         Pw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC2lVtH+1entoeg/li9xf+rlLpbVulJFJlgPkUYWAR0e1kuTr6hRwji/MmGrZEw6GGBxwiiGpN/nqi@vger.kernel.org, AJvYcCWGI6oDI3xseUXnIK81p2kb08J5TUTYQmmDg4BFZJaEZdGvMdPvXYruprfh/WQGJkJgARW9O4uT9A/y@vger.kernel.org, AJvYcCXGS4ubwky6Lo/NtoFGNbPPD9Uj74rSkdqMMnw2AoO5nKj1A4pPno0RUCQtHJLga5GvrYlhvflCRhziPdxl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05AmA16egt4QBpn6MK9G5NxWRwxY8LEwZDr26jD6KejUVS6+1
	NkfWDjMf2vhnTAkn4qZqpfNHvvxwvlhCjgDL1XmjKs6O1NbdBtkI
X-Gm-Gg: ASbGncuaL5zKUc8ApMtVvVCYf9/U6t3yEeG3qq57YXxOu/aRrjtgmokgVLlWHJtaXbE
	oNHqcuOZGeEBnVVyAiUraeNrYI6X/KAQeXz2ao2dp2LdLTgJAqOJqRdfTOuPHMLCdmDiqVLYOlK
	PizNyT9ND+JOnwEg4Dpuf99+e5HS1ZxyywQrC5vkPJmm1H8P6I0pjSa8xqdUg0K9N19t9yUrYUH
	lUoRsMwVZ3rJRFcCv8vg1QTIm6ZxOb3nzXMAH49OXf35DeAq/H7Ad6dE2n5H2fS9M9HhBKg4YbZ
	mDAlonIw1LFSfTF2Jnkt6KNP7JCD6bKn
X-Google-Smtp-Source: AGHT+IGRgxa28yONVo9R4TtNIsLXQnXM9lhkBde8vdOO8gAZtxIxGySQslZtp6sZGTHBN3cW9q3ucw==
X-Received: by 2002:a17:907:7254:b0:ab3:9923:ef4e with SMTP id a640c23a62f3a-ab7f33c1813mr57735866b.22.1739317629587;
        Tue, 11 Feb 2025 15:47:09 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b35b0d2csm624684566b.122.2025.02.11.15.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:47:09 -0800 (PST)
Message-ID: <15a4d019ede6ad8be56832a3b215dfc6ce029bc2.camel@gmail.com>
Subject: Re: [PATCH v9 2/2] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: dlan@gentoo.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
Date: Wed, 12 Feb 2025 00:47:05 +0100
In-Reply-To: <20240428060848.706573-3-qiujingbao.dlmu@gmail.com>
References: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
	 <20240428060848.706573-3-qiujingbao.dlmu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for you patch Jingbao!

On Sun, 2024-04-28 at 14:08 +0800, Jingbao Qiu wrote:
> Implement the RTC driver for CV1800, which able to provide time alarm.
>=20
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

I've tried time read/set on SG2000 SoC (Milk-V Duo Module 01 EVB), however
the time set remains unchanged. Milk-V Duo Module 01 schematics shows
32768Hz oscillator present.

What HW have you tested the driver on? Do you have an idea what could be
the problem on SG2000?

> ---
> =C2=A0drivers/rtc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> =C2=A0drivers/rtc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/rtc/rtc-cv1800.c | 240 ++++++++++++++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 251 insertions(+)
> =C2=A0create mode 100644 drivers/rtc/rtc-cv1800.c
>=20
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2a95b05982ad..b7746ca22b94 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1138,6 +1138,16 @@ config RTC_DRV_DS2404
> =C2=A0	=C2=A0 This driver can also be built as a module. If so, the modul=
e
> =C2=A0	=C2=A0 will be called rtc-ds2404.
> =C2=A0
> +config RTC_DRV_CV1800
> +	tristate "Sophgo CV1800 RTC"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	help
> +	=C2=A0 If you say yes here you get support the RTC driver
> +	=C2=A0 for Sophgo CV1800 chip.
> +
> +	=C2=A0 This driver can also be built as a module.If so, the
> +	=C2=A0 module will be called rtc-cv1800.
> +
> =C2=A0config RTC_DRV_DA9052
> =C2=A0	tristate "Dialog DA9052/DA9053 RTC"
> =C2=A0	depends on PMIC_DA9052
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 3004e372f25f..a0861c0f3c89 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+=3D rtc-cadence.o
> =C2=A0obj-$(CONFIG_RTC_DRV_CMOS)	+=3D rtc-cmos.o
> =C2=A0obj-$(CONFIG_RTC_DRV_CPCAP)	+=3D rtc-cpcap.o
> =C2=A0obj-$(CONFIG_RTC_DRV_CROS_EC)	+=3D rtc-cros-ec.o
> +obj-$(CONFIG_RTC_DRV_CV1800)	+=3D rtc-cv1800.o
> =C2=A0obj-$(CONFIG_RTC_DRV_DA9052)	+=3D rtc-da9052.o
> =C2=A0obj-$(CONFIG_RTC_DRV_DA9055)	+=3D rtc-da9055.o
> =C2=A0obj-$(CONFIG_RTC_DRV_DA9063)	+=3D rtc-da9063.o
> diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
> new file mode 100644
> index 000000000000..f975b169077a
> --- /dev/null
> +++ b/drivers/rtc/rtc-cv1800.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rtc-cv1800.c: RTC driver for Sophgo cv1800 RTC
> + *
> + * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +
> +#define CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08
> +#define ANA_CALIB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x1000
> +#define SEC_PULSE_GEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x1004
> +#define ALARM_TIME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x1008
> +#define ALARM_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x100C
> +#define SET_SEC_CNTR_VAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1010
> +#define SET_SEC_CNTR_TRIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1014
> +#define SEC_CNTR_VAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x1018
> +
> +/*
> + * When in VDDBKUP domain, this MACRO register
> + * does not power down
> + */
> +#define MACRO_RO_T=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x14A8
> +#define MACRO_RG_SET_T=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x1498
> +
> +#define CTRL_MODE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(10)
> +#define CTRL_MODE_OSC32K=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00UL
> +#define ALARM_ENABLE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
> +#define SET_SEC_CNTR_VAL_INIT=C2=A0 GENMASK(29, 28)
> +#define SEC_PULSE_SEL_INNER=C2=A0=C2=A0=C2=A0 BIT(31)
> +#define SEC_PULSE_GEN_SEL_MASK GENMASK(30, 0)
> +#define CALIB_SEL_FTUNE_MASK=C2=A0=C2=A0 GENMASK(30, 0)
> +#define CALIB_SEL_FTUNE_INNER=C2=A0 0x00UL
> +
> +struct cv1800_rtc_priv {
> +	struct rtc_device *rtc_dev;
> +	struct regmap *rtc_map;
> +	struct clk *clk;
> +	int irq;
> +};
> +
> +static const struct regmap_config cv1800_rtc_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static int cv1800_rtc_alarm_irq_enable(struct device *dev, unsigned int =
enabled)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_get_drvdata(dev);
> +
> +	regmap_write(info->rtc_map, ALARM_ENABLE, enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *a=
lrm)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_get_drvdata(dev);
> +	unsigned long alarm_time;
> +
> +	alarm_time =3D rtc_tm_to_time64(&alrm->time);
> +
> +	cv1800_rtc_alarm_irq_enable(dev, 0);
> +
> +	regmap_write(info->rtc_map, ALARM_TIME, alarm_time);
> +
> +	cv1800_rtc_alarm_irq_enable(dev, alrm->enabled);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *=
alarm)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_get_drvdata(dev);
> +	u32 enabled;
> +	u32 time;
> +
> +	regmap_read(info->rtc_map, ALARM_ENABLE, &enabled);
> +
> +	alarm->enabled =3D enabled & ALARM_ENABLE_MASK;
> +
> +	regmap_read(info->rtc_map, ALARM_TIME, &time);
> +
> +	rtc_time64_to_tm(time, &alarm->time);
> +
> +	return 0;
> +}
> +
> +static void rtc_enable_sec_counter(struct cv1800_rtc_priv *info)
> +{
> +	u32 sec_ro_t;
> +	u32 sec;
> +
> +	/* select inner sec pulse */
> +	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN,
> +			=C2=A0=C2=A0 (u32)(~SEC_PULSE_GEN_SEL_MASK),
> +			=C2=A0=C2=A0 (u32)(~SEC_PULSE_SEL_INNER));
> +
> +	regmap_update_bits(info->rtc_map, ANA_CALIB,
> +			=C2=A0=C2=A0 (u32)(~CALIB_SEL_FTUNE_MASK),
> +			=C2=A0=C2=A0 CALIB_SEL_FTUNE_INNER);
> +
> +	sec =3D SET_SEC_CNTR_VAL_INIT;
> +
> +	/* load from MACRO register */
> +	regmap_read(info->rtc_map, MACRO_RO_T, &sec_ro_t);
> +	if (sec_ro_t > (SET_SEC_CNTR_VAL_INIT))
> +		sec =3D sec_ro_t;
> +
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
> +}
> +
> +static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_get_drvdata(dev);
> +	u32 sec;
> +
> +	regmap_read(info->rtc_map, SEC_CNTR_VAL, &sec);
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +static int cv1800_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_get_drvdata(dev);
> +	unsigned long sec;
> +
> +	sec =3D rtc_tm_to_time64(tm);
> +
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
> +	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
> +
> +	regmap_write(info->rtc_map, MACRO_RG_SET_T, sec);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t cv1800_rtc_irq_handler(int irq, void *dev_id)
> +{
> +	struct cv1800_rtc_priv *info =3D dev_id;
> +
> +	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +	regmap_write(info->rtc_map, ALARM_ENABLE, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct rtc_class_ops cv1800_rtc_ops =3D {
> +	.read_time =3D cv1800_rtc_read_time,
> +	.set_time =3D cv1800_rtc_set_time,
> +	.read_alarm =3D cv1800_rtc_read_alarm,
> +	.set_alarm =3D cv1800_rtc_set_alarm,
> +	.alarm_irq_enable =3D cv1800_rtc_alarm_irq_enable,
> +};
> +
> +static int cv1800_rtc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800_rtc_priv *rtc;
> +	u32 ctrl_val;
> +	void __iomem *base;
> +	int ret;
> +
> +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rtc->rtc_map =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &cv1800_rtc_regmap_config);
> +	if (IS_ERR(rtc->rtc_map))
> +		return PTR_ERR(rtc->rtc_map);
> +
> +	rtc->irq =3D platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(rtc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "clk not found\n");
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	rtc->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	rtc->rtc_dev->ops =3D &cv1800_rtc_ops;
> +	rtc->rtc_dev->range_max =3D U32_MAX;
> +
> +	ret =3D devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TRIGGER_HIGH, "rtc alarm", =
rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot register interrupt handler\n");
> +
> +	regmap_read(rtc->rtc_map, CTRL, &ctrl_val);
> +	ctrl_val &=3D CTRL_MODE_MASK;
> +
> +	if (ctrl_val =3D=3D CTRL_MODE_OSC32K)
> +		rtc_enable_sec_counter(rtc);
> +
> +	return devm_rtc_register_device(rtc->rtc_dev);
> +}
> +
> +static const struct of_device_id cv1800_dt_ids[] =3D {
> +	{ .compatible =3D "sophgo,cv1800-rtc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_dt_ids);
> +
> +static struct platform_driver cv1800_rtc_driver =3D {
> +	.driver =3D {
> +		.name =3D "sophgo-cv1800-rtc",
> +		.of_match_table =3D cv1800_dt_ids,
> +	},
> +	.probe =3D cv1800_rtc_probe,
> +};
> +
> +module_platform_driver(cv1800_rtc_driver);
> +MODULE_AUTHOR("Jingbao Qiu");
> +MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
> +MODULE_LICENSE("GPL");

--=20
Alexander Sverdlin.


