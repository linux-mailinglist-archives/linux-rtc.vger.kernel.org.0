Return-Path: <linux-rtc+bounces-1530-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE993381A
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 09:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8D9D1F25613
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 07:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776F1CA89;
	Wed, 17 Jul 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AIBaoPGe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD91B974
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jul 2024 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721201868; cv=none; b=Jv1dyJeXzbpEGXx46i0Q6RHUH0rgLISr3nfplqcPKPG9N6swUgKuTqjoj6Et8BS+hkQIoTi2iAiKMYnylux9kUHRDCmuW/xz2h7Mu09AGVebXG6503EyNp3UTlBrldzdyvDRWgVVaoEZFEKMJe2BhNE8gblrNOoQHEGeqoCeJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721201868; c=relaxed/simple;
	bh=ofiUS+uOsnjhuIaRefgaMe9r3ZaNznbQtZELpuQTjVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1d1nQh5mnNiytsHMLAmBDNGnUsJ4Ffpaats+drcIcBVPVVWByp3orrYd6d8SaDq/yfufR6BADtTKdwuEaIb3TWBXQkXjXEeX3BBzBnMf3U7x4EzbSloATjTmZDWCLouz5srFkzv7hGym24ARUjZsAVWmHjI6Q/9JkYklwAJAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AIBaoPGe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso10514885e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jul 2024 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721201863; x=1721806663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfi0wbFlhXsEa5q0QzjbWGJUIMSELq3SCGvUCwT4j9c=;
        b=AIBaoPGeH/uKzNjCKykwG1g1LixWb4q/Q2hcEryTEmD7SEvjZrOgBHqqTZ5pWK6DXF
         DfGYuvpgNc4GA4H+Aib8A9n4NpMexhDBSDzCQcQaeTDlWUZjsYH8Wvg/a5OjywCvQ+Jb
         8hZfuiSKL1QaWKaGfShTvaXRd62jC2GIKSMaBwKIjJmPrSUtuzYhAco25nEhfvIWxdd4
         6vufqqgadMLOAXQl5lpGEzyLXuPgmI9BbA4cIVV63y8A+yFkrndc19zK4LkP3vfyrdX1
         qc4/i8XLt3U2VM0fvKhphQM+JYXUC2ZqsR/FNY7tYOV5a0sLTrx8x4pkyPAKPDU67mpF
         8w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721201863; x=1721806663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfi0wbFlhXsEa5q0QzjbWGJUIMSELq3SCGvUCwT4j9c=;
        b=COfOr8nmp5GAru1RtVhrnfy32pcnCwHP4EmSewfpawM7ozYD+uLv6R0Hs9gHeZ+whH
         T9/HMihy/4CDz1tsBwbi4R7ydWaHIfNW0J4Gf1ls6XAJsDpSoiBOhWPf0HyaU1eVw0PG
         LoO9xVp649qvKoGtdi4DAY3pmSME8TmwLyiaeILf0s0a83ARIq8xK8Qo2uj3/qLAoyrK
         1AVlRwqIXYZxnQrRrVo59eqQsNDvAUHOBvUQxqtU8MbQaB7lc8QSN3Dak2CmanNd/jpS
         ZCVNtN8DBoqKPim0jWWKE8TPSIHAjIPlLYFs40LcnxiRBIRKKZhMBqOj6IngPOjLXyZD
         tqJw==
X-Forwarded-Encrypted: i=1; AJvYcCXf/YatO+oBv06lOmOa/4GkGXD6F5UFnPdJjQbnug34QEqMVJ/RjlXB4sPxTFiSLQ5hxQPuiBirwgIKKKksHI65+KUitGQITJbY
X-Gm-Message-State: AOJu0YzEWbjZ8CYzg1zCqWlrePFKZc2TE3cdFbRzt1KF3k6IfEimQHKt
	Ynt3Vb8Ct4RML+mUoRyUfjrkv7T1kydfeFisEx4PWvdDVaQ+h2gykpxEAB+S8XU=
X-Google-Smtp-Source: AGHT+IH6DPWOFWGyrbuD3FoepHwzwFHt5aU7f9hN5MQgW4BxazZpRw+PU5n5TYh9enHix4deAENBmA==
X-Received: by 2002:a05:6512:3f01:b0:52c:e3c7:941e with SMTP id 2adb3069b0e04-52ee5411942mr669554e87.47.1721201862870;
        Wed, 17 Jul 2024 00:37:42 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb478sm160478315e9.33.2024.07.17.00.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 00:37:42 -0700 (PDT)
Message-ID: <42216215-4db1-4015-878f-25a7770d44c2@tuxon.dev>
Date: Wed, 17 Jul 2024 10:37:40 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, "lee@kernel.org" <lee@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346ABDBA306410646D3861A86A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346ABDBA306410646D3861A86A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 16.07.2024 14:00, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, July 16, 2024 11:30 AM
>> Subject: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the Renesas VBATTB IP
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Renesas VBATTB IP has logic to control the RTC clock, tamper detection and a small 128B memory. Add a
>> MFD driver to do the basic initialization of the VBATTB IP for the inner components to work.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this driver is new
>>
>>  drivers/mfd/Kconfig          |  8 ++++
>>  drivers/mfd/Makefile         |  1 +
>>  drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 87 insertions(+)
>>  create mode 100644 drivers/mfd/renesas-vbattb.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig index bc8be2e593b6..df93e8b05065 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
>>  	  This driver provides common support for accessing the SC27xx PMICs,
>>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>>
>> +config MFD_RENESAS_VBATTB
>> +	tristate "Renesas VBATTB driver"
>> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
>> +	select MFD_CORE
> 
> There is no MFD calls??  What is the purpose of selecting MFD_CORE??

I missed to remove it from here.

> 
>> +	help
>> +	  Select this option to enable Renesas RZ/G3S VBATTB driver which
>> +	  provides support for the RTC clock, tamper detector and 128B SRAM.
>> +
>>  config RZ_MTU3
>>  	tristate "Renesas RZ/G2L MTU3a core driver"
>>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST diff --git a/drivers/mfd/Makefile
>> b/drivers/mfd/Makefile index 02b651cd7535..cd2f27492df2 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -186,6 +186,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
>>  obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
>>  obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
>>  obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
>> +obj-$(CONFIG_MFD_RENESAS_VBATTB)	+= renesas-vbattb.o
>>  obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
>>  obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
>>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
>> diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c new file mode 100644 index
>> 000000000000..5d71565b8cbf
>> --- /dev/null
>> +++ b/drivers/mfd/renesas-vbattb.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VBATTB driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +
>> +static int vbattb_probe(struct platform_device *pdev) {
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *rstc;
>> +	int ret;
>> +
>> +	rstc = devm_reset_control_array_get_exclusive(dev);
>> +	if (IS_ERR(rstc))
>> +		return PTR_ERR(rstc);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_deassert(rstc);
>> +	if (ret)
>> +		goto rpm_put;
>> +
>> +	platform_set_drvdata(pdev, rstc);
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		goto reset_assert;
>> +
>> +	return 0;
>> +
>> +reset_assert:
>> +	reset_control_assert(rstc);
>> +rpm_put:
>> +	pm_runtime_put(dev);
>> +	return ret;
>> +}
>> +
>> +static void vbattb_remove(struct platform_device *pdev) {
>> +	struct reset_control *rstc = platform_get_drvdata(pdev);
>> +
>> +	reset_control_assert(rstc);
>> +	pm_runtime_put(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id vbattb_match[] = {
>> +	{ .compatible = "renesas,r9a08g045-vbattb" },
>> +	{ /* sentinel */ },
> 
> Drop comma.
> 
>> +};
>> +MODULE_DEVICE_TABLE(of, vbattb_match);
>> +
>> +static struct platform_driver vbattb_driver = {
>> +	.probe = vbattb_probe,
>> +	.remove_new = vbattb_remove,
> 
> Maybe remove canbe replaced with devm_add_action_or_reset()
> That simplifies probe() aswell??

This approach needs a new structure to keep references to the rstc and dev,
to be able to handle reset and runtime PM in action function. I wanted to
avoid adding a new structure.

Thank you for your review,
Claudiu Beznea

> 
>> +	.driver = {
>> +		.name = "renesas-vbattb",
>> +		.of_match_table = vbattb_match,
>> +	},
>> +};
>> +module_platform_driver(vbattb_driver);
>> +
>> +MODULE_ALIAS("platform:renesas-vbattb");
>> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
>> +MODULE_DESCRIPTION("Renesas VBATTB driver"); MODULE_LICENSE("GPL");
>> --
>> 2.39.2
>>
> 

