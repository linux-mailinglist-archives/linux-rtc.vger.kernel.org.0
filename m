Return-Path: <linux-rtc+bounces-3486-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0706A606B7
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 01:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FAD6460964
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 00:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3790010A3E;
	Fri, 14 Mar 2025 00:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn1ppXOc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DDD51C;
	Fri, 14 Mar 2025 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913510; cv=none; b=cNDOQwI1f1pmUar5kcqgIhl53tTMOGo7yqEI9TQCPL7olxL3oChsSus1DUHW5exhDbbJ2+FA//I+yUFMa1CZIpBVK4y4U0xRH2Q9r3/uvbZY43PJu4ySaN/sw29yk5OHsV2rPF0zM20a/Myt77bcLXP2TGC/Ei7ml5RH46pJsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913510; c=relaxed/simple;
	bh=qzWSYH/eCAhh5s2bxnUnC01sCxZd8637XHy49KgH0+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9mPFaBlzhb7xghbigQiZqwxPwIBF51wEFX5ganxkD9yFDG4XrkXCxb6y9DCqXMAtqJH8zOXVNUwB1y+DtvEXbrP8c41vl3mZ+F1pjmxCrI8xUa3I6zNczeW8skgTIeunqNGJos1xGYOvJ0xpLpS4k7+nCMxL1I83nCBQLWphKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn1ppXOc; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so24160866d6.0;
        Thu, 13 Mar 2025 17:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741913507; x=1742518307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m/qzle7Z8SJPTCv9Yq7wZFdYLpzPxwHjo/0UoVX67k=;
        b=Kn1ppXOcvhPxxIpwrr0nAfnA1v0q95GU/3IbnY1ql+RCP8WZcTpybfuAvh2NYbVMLz
         sW4uCuL5/qbBzeOZC/8Wuo74I7VQnJVwNoIwh/IWFJ8/Z59ECugl0YlPMplV0K4HvDiN
         hlGA+SoeWHSfmqia8lb9VOYjytzan816XEqDK4QujYziyE3AOTjm8/+FKy8lgP0W9zZ5
         PjocajRVD4soDECuuXck9L35uIP+ktAFFZXbbkc+uhfn+QPaKTrur5ntQzGluQK18IYh
         GvgvK21bTXd7mQO3EKvzXy6YI2G8CP5ngz/7I4JBhaLGJtVR5uhjsDmvPc2O5e2Axq91
         xmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741913507; x=1742518307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m/qzle7Z8SJPTCv9Yq7wZFdYLpzPxwHjo/0UoVX67k=;
        b=tjp/gPiwNDdRwQxec6j9BEAt0MlyY5VmXJ2fkJYkGnjMQZ+SQkKrc2vsAboXYru1R/
         wqysOU5P9h20Kymf2dRA4Qr8dshgI9FYEbU21Dzj8Dmoy2wz5dDeX0HXW4JPQOjCGVqb
         tvRjNBZ+4Yg8qEzYPGUFK8LocGqRlrl6cNauY/ltBC26BkiWXRfmhhNzD9oQN/fI578S
         UbnQOOXRbEY/DFkq00TN3/pVz0YKr0uJk6sDR2jERJGishtzwvy4gO3tQiGSnl3bc+fa
         iBtLgX4Gn5VZFxrjZLTMm3Y5dTRX7ugbZUrIAqGFzEhV+HBaifQv41xMl5d+cINHXW1a
         /70A==
X-Forwarded-Encrypted: i=1; AJvYcCV/aTQ3TDFrhRtIJLz9UxJ9l692F6MGewLXhMxyMt5sLhxcaTECQGHcPgJRrlHWhOlkAx1CPqBp8MJQ@vger.kernel.org, AJvYcCVaYqnAr9jLLhwPp3LH0xwtz9NVoTVOmFj1KMjykLZ757TPpz4b6Ph4+LmHrepHAtrUeM8pYa5urPD7BojO@vger.kernel.org, AJvYcCXJed5huM9XCiNstfF+izmb8z0ALitBKvkHW+Xfaup+3Y6pnSvqehlmo2wlLpGDmp3fnqHZKLOX6GLT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7H2zvk0p0ZiMJ7Gv7r/hoxdjDSv5hF69XuNl178sQW6FwXP2
	ZDo/DDtw5OGok+WDNdRLX5gSKi9R9/dggxSBDAPuAz5NEw3Qw4cL
X-Gm-Gg: ASbGnctG3L6k9/Wl7seYlJwO4TajIze+lTwMvNaU6UboKofRYsBpDzB6CtS9+/rCdCT
	hJxif+wineloTa4TQ35u513QJnbrPPSYVQ6yZhVv8t+jr0017p9YnMKgVtcWQSl0uCL8NVXQknE
	+5ZzjP8nN0WAycKpgBqjftsqYYv/HhqjR7ZAqr3o3SQZAqcT5KMaUkmQvX59arfV/gYeSCbADH5
	pIUJeQPCeaSp/Ev5E7pM2V2/nu1cTuzXDBuhVmrl+0k8CdkcmzTajrynWgRZ0XLb4QF5yJfj2mA
	xgcENn0DSXx021oKAd73
X-Google-Smtp-Source: AGHT+IH0tb1brEibUfzMswXbEBGec7NTj4DU78qIWu+exAe9oKFasFAqIPbncsP7Fm+lcRKkKK2XSA==
X-Received: by 2002:a05:622a:612:b0:476:add4:d2cd with SMTP id d75a77b69052e-476ba88ea20mr65691781cf.1.1741913507124;
        Thu, 13 Mar 2025 17:51:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb825396sm15373441cf.69.2025.03.13.17.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 17:51:46 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:51:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309202629.3516822-3-alexander.sverdlin@gmail.com>

On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> machine to control chip power-on, power-off and reset. Furthermore, the
> 8051 subsystem is located within RTCSYS including associated SRAM block.
> 
> This patch only populates RTC sub-device.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v13:
> - Moved the driver from MFD into SOC subsystem
> - Dropped unused "cv1800_rtcsys_rtc_subdev"
> v12:
> - new patch
> 
>  MAINTAINERS                        |  1 +
>  drivers/soc/Kconfig                |  1 +
>  drivers/soc/Makefile               |  1 +
>  drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
>  drivers/soc/sophgo/Makefile        |  3 ++
>  drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
>  6 files changed, 93 insertions(+)
>  create mode 100644 drivers/soc/sophgo/Kconfig
>  create mode 100644 drivers/soc/sophgo/Makefile
>  create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3eee238c2ea2..ac15e448fffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
>  W:	https://github.com/sophgo/linux/wiki
>  T:	git https://github.com/sophgo/linux.git
>  S:	Maintained

> +F:	drivers/soc/sophgo/cv1800-rtcsys.c

Please change to the drivers/soc/sophgo/.
We should maintain all files under this.

>  N:	sophgo
>  K:	sophgo
>  
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 6a8daeb8c4b9..11e2383c0654 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -23,6 +23,7 @@ source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
> +source "drivers/soc/sophgo/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 2037a8695cb2..0381a0abdec8 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -29,6 +29,7 @@ obj-y				+= qcom/
>  obj-y				+= renesas/
>  obj-y				+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> +obj-y				+= sophgo/
>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
> new file mode 100644
> index 000000000000..e50666e423a9
> --- /dev/null
> +++ b/drivers/soc/sophgo/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Sophgo/Cvitek SoC drivers
> +#
> +
> +if ARCH_SOPHGO || COMPILE_TEST

> +menu "Sophgo/Cvitek SoC drivers"

No Cvitek, only left Sophgo here.

> +
> +config SOPHGO_CV1800_RTCSYS
> +	tristate "Sophgo CV1800 RTC MFD"

> +	default y if COMPILE_TEST

I do not think it is necessary.

> +	select MFD_CORE
> +	help
> +	  If you say yes here you get support the RTC MFD driver for Sophgo
> +	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
> +	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
> +	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
> +	  located within RTCSYS including associated SRAM block.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called cv1800-rtcsys.
> +
> +endmenu
> +endif
> diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
> new file mode 100644
> index 000000000000..8f22b4e79311
> --- /dev/null
> +++ b/drivers/soc/sophgo/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SOPHGO_CV1800_RTCSYS)	+= cv1800-rtcsys.o
> diff --git a/drivers/soc/sophgo/cv1800-rtcsys.c b/drivers/soc/sophgo/cv1800-rtcsys.c
> new file mode 100644
> index 000000000000..cb271f02afcc
> --- /dev/null
> +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Sophgo CV1800 series SoC RTC subsystem
> + *
> + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
> + * HW state machine to control chip power-on, power-off and reset. Furthermore,
> + * the 8051 subsystem is located within RTCSYS including associated SRAM block.
> + *
> + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
> + *
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +
> +static struct resource cv1800_rtcsys_irq_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> +};
> +
> +static const struct mfd_cell cv1800_rtcsys_subdev[] = {
> +	{

> +		.name = "cv1800-rtc",

Make this a specifc one, like "sophgo,cv1800b-rtc"

> +		.num_resources = 1,
> +		.resources = &cv1800_rtcsys_irq_resources[0],
> +	},
> +};
> +
> +static int cv1800_rtcsys_probe(struct platform_device *pdev)
> +{
> +	int irq;
> +
> +	irq = platform_get_irq_byname(pdev, "alarm");
> +	if (irq < 0)
> +		return irq;
> +	cv1800_rtcsys_irq_resources[0].start = irq;
> +	cv1800_rtcsys_irq_resources[0].end = irq;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    cv1800_rtcsys_subdev,
> +				    ARRAY_SIZE(cv1800_rtcsys_subdev),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id cv1800_rtcsys_of_match[] = {
> +	{ .compatible = "sophgo,cv1800b-rtc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
> +
> +static struct platform_driver cv1800_rtcsys_mfd = {
> +	.probe	= cv1800_rtcsys_probe,
> +	.driver	= {
> +		.name		= "cv1800_rtcsys",
> +		.of_match_table	= cv1800_rtcsys_of_match,
> +	},
> +};
> +module_platform_driver(cv1800_rtcsys_mfd);
> +
> +MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
> +MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC subsystem driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 

