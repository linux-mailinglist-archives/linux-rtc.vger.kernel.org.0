Return-Path: <linux-rtc+bounces-4340-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE391AE4DD4
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 22:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B808217A07D
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 20:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140E32D3A6B;
	Mon, 23 Jun 2025 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="P4u66Dq5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B82D12F4
	for <linux-rtc@vger.kernel.org>; Mon, 23 Jun 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709012; cv=none; b=YXjbc1PUZByT2C5B1LiD8iTyxYJCYRPEg2MFWonXIXOI5gcCdzDKfEuPbctBYQr41uHt/1n7QK/iFD2YnrQEYfxb9gkzJ6rdW2quKVc02lzNnAfydmJicC+Q32dBQMlAdSTJS7fLjbIxWkJlUT+8biD+0x06o84MzAUtQ/RSO4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709012; c=relaxed/simple;
	bh=Cm0owi4Bcfz/xBzWg7XxfWpBPCPtuvgjqTCncPrPkqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpI+jKAT4kzcRFB9T/uLoWT3pWBPfuAttHnGdqUNQToYJRc16UGmG+JUjhRIVc/63dtGuyyuJAVYlFp9ctPc653uA+ePK2LpR3FHModDep5P0XifOP1PiE1fS8I3liLhpGP9/ECLKMO9UpsCwIlsX7sC2frxqrNLZO9AKE3WD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=P4u66Dq5; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafdd322d3so52184656d6.3
        for <linux-rtc@vger.kernel.org>; Mon, 23 Jun 2025 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750709007; x=1751313807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHvbV5Gb3cOPD4o1UtqsMvsOaltem8eGes/uTQkdjBA=;
        b=P4u66Dq5BmwSd4jlv381O7HFTFUaO+svOtuvd852ArpdvVPIDR61QoMltRazM2eQdR
         Ix/zL2H1qjjV7nD+M9U4ZwE03Nuj8nNHhYk2P3FK2EJ2XAqDcmQvF8Zx0jrrB5RwDwwk
         ZNiRxJqUeEGC+rAWW8J4K598NpjKRg4Zzq9BbmnXmsNpUWZK6BuZ7NMXEc06FLZkgJuN
         Q4g86SkR4okvj+eGIZ4Hrfr9zvH9fYa6AN5nGKC0O8DyrWkQwbDzxLxlC0Jc5sjvqsDw
         AZeAQSdpCGf4ClwWDAZq1M6Y/ORc4DMsktHBF8FiL4A2V7kzJpmM4YkPJgNsRyGkqdeR
         hQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750709007; x=1751313807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHvbV5Gb3cOPD4o1UtqsMvsOaltem8eGes/uTQkdjBA=;
        b=dzXSWXbT8IJD/tixjh5DJBFJFLltyyKAUubOK5l2byN8H5ovYfe/J7ND89+EoOudP/
         gS59jKDSxlTPxlQhQlU21dsAn8IzChPGCHZvX4qrvVMC4p8g/6ItkzQu+H52lXmKfLpu
         OTpz50INhHe5ObLxnkFs/fjd85c0fWXLuWVTxkWr0gGd0LEJLYqyY5ES0f2WwO9WTW02
         fIZ9OrLkXxPxTTl6j6zgRcq7lPjIdImREj84wMG+tg5vkMhugkxEKNdiDtxnWh44AUaC
         0HK/Mw1c7ifYZf9Qu+3x12AvddS+AsFGtrPgNq55kIEtQ52Gx08SuScSrZSxuLa4vxOk
         FCeg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ELnv0sfzyWiHEavnOwoNWJ6ZX6M1ISTfZeeeBmkuy0gbkXbac53p8kHsaA/gJpABtND2s8Rt7GI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/2DuoCBN/8ed+twBvMfROsrkzh5tdXkrQehRl78tumEYrGHNW
	XBzC7V4WdXISfuqhHQFfvbZFIASP4Hsdm3nKh8IPEEw0xB9j0/2f/HwKkHvQmpYoaOc=
X-Gm-Gg: ASbGncuIInyjnJmN23SxRD8wy7NNfTkCL5zJQ0kvbruuydMtJzSQXLtvWoYVsQDkNuy
	QYP9ZHViqPieHO/oFP4MXpuA0IfhkHuBpFkuoGQOygnZbsg8RQoXwPYZNBiqOOkZbWvKoNjQbEZ
	EJzzqzxLueu3qOwWIQlz00y22qxWwRdUtio5Ww8zQY5lHi7o2BKkh3AqTw07QXIws+fYbtkEcAL
	j14MJFwmXZGk+Z5MrmvVg/moaQP3Ml9zn7SZOJcE+5AXDsQUd6/XNuga54Jv8UKxfNcUIHjEddp
	/xM44qlRjLZyIVWktD6KxxNaVVdHrzEsDmmtb1mlkL3Q/XAOPBr58+HHAhIwoLLi5o66RriDvuT
	H39CQKFn6kJt0kxJny65aHbbVKw==
X-Google-Smtp-Source: AGHT+IHumrQ7I9+KWWFuDhRtTXUetnYj5eNaskA2/R5KWnq/Qt2+NVksAOmZOF3H1r8gUpMvuaqYsw==
X-Received: by 2002:a05:6214:540e:b0:6fa:c3c8:d3d9 with SMTP id 6a1803df08f44-6fd0a31b2damr232736376d6.0.1750709007021;
        Mon, 23 Jun 2025 13:03:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd094569bdsm48831816d6.48.2025.06.23.13.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 13:03:26 -0700 (PDT)
Message-ID: <f2d04232-6662-49d5-936d-ec58d0fb01b6@riscstar.com>
Date: Mon, 23 Jun 2025 15:03:25 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 wangruikang@iscas.ac.cn, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
 <20250623191400c330f01f@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250623191400c330f01f@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 2:14 PM, Alexandre Belloni wrote:
> Hello,
> 
> On 21/06/2025 22:29:36-0500, Alex Elder wrote:
>> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
>> only setting and reading the time are supported.
>>
>> The PMIC is implemented as a multi-function device.  This RTC is
>> probed based on this driver being named in a MFD cell in the simple
>> MFD I2C driver.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added this driver to the series, in response to Lee Jones saying
>>        more than one MFD sub-device was required to be acceptable
>>
>>   drivers/rtc/Kconfig  |  10 ++++
>>   drivers/rtc/Makefile |   1 +
>>   drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++
> 
> We need something more descriptive than p1 here

Are you referring to the chip itself, or do you want a longer
file name?   Do you prefer "rtc-spacemit-p1.c" or something?

>>   3 files changed, 148 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-p1.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 9aec922613cec..27cff02ba4e66 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called rtc-max77686.
>>   
>> +config RTC_DRV_P1
> 
> Ditto
> 
>> +	tristate "SpacemiT P1 RTC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select MFD_SPACEMIT_P1
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>> +	  This driver can also be built as a module, which will be called
>> +	  "spacemit-p1-rtc".
>> +
>>   config RTC_DRV_NCT3018Y
>>   	tristate "Nuvoton NCT3018Y"
>>   	depends on OF
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 4619aa2ac4697..f8588426e2ba4 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
>>   obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
>>   obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
>>   obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
>> +obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
>>   obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
>>   obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
>>   obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
>> diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
>> new file mode 100644
>> index 0000000000000..e0d2c0c822142
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-p1.c
>> @@ -0,0 +1,137 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for the RTC found in the SpacemiT P1 PMIC
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/rtc.h>
>> +
>> +#define MOD_NAME	"spacemit-p1-rtc"
>> +
>> +/* Offset to byte containing the given time unit */
>> +enum time_unit {
>> +	tu_second = 0,		/* 0-59 */
>> +	tu_minute,		/* 0-59 */
>> +	tu_hour,		/* 0-59 */
>> +	tu_day,			/* 0-30 (struct tm uses 1-31) */
>> +	tu_month,		/* 0-11 */
>> +	tu_year,		/* Years since 2000 (struct tm uses 1900) */
>> +	tu_count,		/* Last; not a time unit */
>> +};
> 
> I'm not sure this enum actually brings anything

It's just defining the sequence of register values
symbolically.  Do you prefer #defines?

It doesn't matter much to me, I just want to know what
you'd prefer.

> 
>> +
>> +/* Consecutive bytes contain seconds, minutes, etc. */
>> +#define RTC_COUNT_BASE		0x0d
>> +
>> +#define RTC_CTRL		0x1d
>> +#define RTC_EN		BIT(2)
>> +
>> +struct p1_rtc {
>> +	struct regmap *regmap;
>> +	struct rtc_device *rtc;
>> +};
>> +
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	u8 time[tu_count];
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	t->tm_sec = time[tu_second] & GENMASK(5, 0);
>> +	t->tm_min = time[tu_minute] & GENMASK(5, 0);
>> +	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
>> +	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
>> +	t->tm_mon = time[tu_month] & GENMASK(3, 0);
>> +	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
>> +	/* tm_wday, tm_yday, and tm_isdst aren't used */
>> +
>> +	return 0;
>> +}
>> +
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	u8 time[tu_count];
>> +	int ret;
>> +
>> +	time[tu_second] = t->tm_sec;
>> +	time[tu_minute] = t->tm_min;
>> +	time[tu_hour] = t->tm_hour;
>> +	time[tu_day] = t->tm_mday - 1;
>> +	time[tu_month] = t->tm_mon;
>> +	time[tu_year] = t->tm_year - 100;
>> +
>> +	/* Disable the RTC to update; re-enable again when done */
>> +	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
>> +
>> +	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
> 
> Don't you care whether the RTC has been reenabled?

Yes, Mateusz pointed this out.  I'll fix this.

I hope that disabling and re-enabling isn't require,
which makes the error possibilities a lot simpler.

Otherwise it's not clear how best to recover from
an error re-enabling the RTC (but yes, if no error
occurs in the bulk write, an error when re-enabling
will be returned).

>> +
>> +	return ret;
>> +}
>> +
>> +static const struct rtc_class_ops p1_rtc_class_ops = {
>> +	.read_time = p1_rtc_read_time,
>> +	.set_time = p1_rtc_set_time,
>> +};
>> +
>> +static int p1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_device *rtc;
>> +	struct p1_rtc *p1;
>> +	int ret;
>> +
>> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
>> +	if (!p1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, p1);
>> +
>> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!p1->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
>> +
>> +	rtc = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(rtc))
>> +		return dev_err_probe(dev, PTR_ERR(rtc),
>> +				     "error allocating device\n");
>> +	p1->rtc = rtc;
>> +
>> +	rtc->ops = &p1_rtc_class_ops;
>> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
>> +
>> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
>> +
>> +	ret = devm_rtc_register_device(rtc);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "error registering RTC\n");
> 
> This message is unnecessary, there are no silent error path in
> devm_rtc_register_device

Awesome.  I'll just return what devm_rtc_regsister_device()
returns.

Thanks a lot.

					-Alex

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver p1_rtc_driver = {
>> +	.probe = p1_rtc_probe,
>> +	.driver = {
>> +		.name = MOD_NAME,
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" MOD_NAME);
> 


