Return-Path: <linux-rtc+bounces-5280-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23406C3B772
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 14:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81FC1AA8387
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20402332916;
	Thu,  6 Nov 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQvUOAAz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE7213E6D;
	Thu,  6 Nov 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437262; cv=none; b=CtUyHadTg6xqeyyP22YxpOx4tgYWVM2bDfCN8AIIFQAMjzqrBVki1LhmNoBgPdi9SBwkKWFbsRV82Ru7iDFZ2Ys/AqA6gEYzBJk/SV3M1IEDDKFzKbugK0eTEJP4Fd3d7p3TF10FVSI7CQTD6nyWp1wzUHy4l7F8Islv8KhGgTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437262; c=relaxed/simple;
	bh=gpGj9lMLnvuz0MT/8CxK0FE+kuoPB2CSVZM/LrsKjdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i88CRfOzyGAr46YtoidUYw5hbniar+oRngJ9bTHgagiG1pYBZZpYpEL+3x+caDYWu3TN9Vtn/LKOpgpKv0IsMU9KUDzrPjm9/yYr5jLuanEf7eo6iVSsnIgEYJjqZ4c46+QSO2P0fW/kjVbuIRT86PWpE8MB1LSaHBAg0r1NsL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQvUOAAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460AAC116D0;
	Thu,  6 Nov 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437261;
	bh=gpGj9lMLnvuz0MT/8CxK0FE+kuoPB2CSVZM/LrsKjdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQvUOAAzRQ71RP1RFBkIEsamS76gIZw1XnPOymu03j1Qb22RtExWxS+omPqMRNcjN
	 nBuU0Cz7BSw9jbp2vZxe+QD+mXy19WzwfNLbRQms+5Kd5vnyAROdYcvHX1m2u6zj41
	 eNIVCkzPE421CW+xRFXRNFd50RkbqKGtOvaopfNk7fEyaIwn1dgNf2ZjLEvjqsu0MX
	 Lb++LzbcqEGnKinMAryDzTFI0oT7fCa7/7SDIWB2g//lBKQobZupVI5l6UQzi3nSb9
	 M0OvsONVZoN/R368gSI7iDqXgtqC6v/gnNzqGFOr3a7QBzOfMIhvjOBl33IZQ5NORG
	 pZjmnvbxZRCsg==
Date: Thu, 6 Nov 2025 13:54:14 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 03/11] rtc: Add new rtc-macsmc driver for Apple
 Silicon Macs
Message-ID: <20251106135414.GO8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
 <20251025-macsmc-subdevs-v4-3-374d5c9eba0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-3-374d5c9eba0e@gmail.com>

On Sat, 25 Oct 2025, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> but most of the PMU functionality is abstracted out by the SMC.
> On T600x machines, the RTC counter must be accessed via the SMC to
> get full functionality, and it seems likely that future machines
> will move towards making SMC handle all RTC functionality.
> 
> The SMC RTC counter access is implemented on all current machines
> as of the time of this writing, on firmware 12.x. However, the RTC
> offset (needed to set the time) is still only accessible via direct
> PMU access. To handle this, we expose the RTC offset as an NVMEM
> cell from the SPMI PMU device node, and this driver consumes that
> cell and uses it to compute/set the current time.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/rtc/Kconfig      |  11 ++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-macsmc.c | 141 +++++++++++++++++++++++++
>  4 files changed, 154 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10f4c0034b5e..3c6322872dd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2460,6 +2460,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
>  F:	drivers/pinctrl/pinctrl-apple-gpio.c
>  F:	drivers/power/reset/macsmc-reboot.c
>  F:	drivers/pwm/pwm-apple.c
> +F:	drivers/rtc/rtc-macsmc.c
>  F:	drivers/soc/apple/*
>  F:	drivers/spi/spi-apple.c
>  F:	drivers/spmi/spmi-apple-controller.c
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 4a8dc8d0a4b7..e165301d4abb 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2078,6 +2078,17 @@ config RTC_DRV_WILCO_EC
>  	  This can also be built as a module. If so, the module will
>  	  be named "rtc_wilco_ec".
>  
> +config RTC_DRV_MACSMC
> +	tristate "Apple Mac System Management Controller RTC"
> +	depends on MFD_MACSMC
> +	help
> +	  If you say yes here you get support for RTC functions
> +	  inside Apple SPMI PMUs accessed through the SoC's
> +	  System Management Controller
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rtc-macsmc.
> +
>  config RTC_DRV_MSC313
>  	tristate "MStar MSC313 RTC"
>          depends on ARCH_MSTARV7 || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 610a9ee5fd33..32083bd5bb81 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
>  obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
>  obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
>  obj-$(CONFIG_RTC_DRV_MA35D1)	+= rtc-ma35d1.o
> +obj-$(CONFIG_RTC_DRV_MACSMC)	+= rtc-macsmc.o
>  obj-$(CONFIG_RTC_DRV_MAX31335)	+= rtc-max31335.o
>  obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
>  obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
> diff --git a/drivers/rtc/rtc-macsmc.c b/drivers/rtc/rtc-macsmc.c
> new file mode 100644
> index 000000000000..05e360277f63
> --- /dev/null
> +++ b/drivers/rtc/rtc-macsmc.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC RTC driver
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/mfd/core.h>

Why is this here?

> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/slab.h>

-- 
Lee Jones [李琼斯]

