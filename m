Return-Path: <linux-rtc+bounces-203-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C77E09A0
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 20:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99712B2133D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 19:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D64522F18;
	Fri,  3 Nov 2023 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfiRWiK6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37279224F2;
	Fri,  3 Nov 2023 19:48:35 +0000 (UTC)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93466D50;
	Fri,  3 Nov 2023 12:48:30 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a8ada42c2aso28715157b3.3;
        Fri, 03 Nov 2023 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699040910; x=1699645710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71hiR2M4614A24flgU9oexTeRtUyJjbPBhFi4ecHoW8=;
        b=AfiRWiK6RK+k5QFQIOrpHpabefUGbYKckx2MvlCO+ykbeLljcEk2MJO9UQ78tdAbD5
         x0Zxzy6ezoKiRvRXZoalXUmlpU3HJbyVLbE48DxuugN5p/XV2y36H7mtF4pgyPjC/ICw
         jZFwqopdw946GNjxHXow68Dp0ss8psem43+CPv4DTErtPJXcxDoZ4ZzKfR41U68HZpfP
         gsHAcMNgXoGUPad1iUuGSgEmvVniw3xW3bW5/Vyge+/PHU5D42DyFB7lTVx8WvGA+2+i
         5BumEBQIkWXgvSHk5W5GMEdA7Z3Ucbm7tdRRTDXRqD8KLhxfOnTxXD6FUahmFfwfbu9T
         g+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699040910; x=1699645710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71hiR2M4614A24flgU9oexTeRtUyJjbPBhFi4ecHoW8=;
        b=YLXJ/A+Lp1nf4fAAa8aeyVk1xNeC4sT3amVvEReXvrvSOzmDohX2uAh+QuBsbaI/vl
         uepBVok/OgtLAONNCW8xXKoKVb2Irfr8Ljdtcu4jTfzGCuYI5z7wzKCFIoTPjFEFmtwn
         vcEJo/xqNdJmgCCaYNBIJkXxcAVAEU9rXWre4Sc49KhY9s1nyeJWsDJffNaw4IbF++/u
         atneQZZKUAw/ECY7TNmJYbzazEmhxHRczMSOEipUtSp5M7ly5Xue2LAOkTOc+SYMAydA
         GEblWfTgMiJa6zaQvwZFl/Ty6umfDm3bI7T+Wm7brFKeD46ZpNkTJfxu/VQ1DExSeij+
         emnQ==
X-Gm-Message-State: AOJu0Yy4zW57R/nIMMJOawa4EYzegJij9lMXH6J/CZOZ2lFIaGMBANSl
	6lHUFomB2LjZ/Oob0pQRelM=
X-Google-Smtp-Source: AGHT+IGXUJ4A2QHfkW46307v/6Xfx4nO2jmU4DTmuZXW8DJ39U79ZOJVTB0xJUJkv9QfuKFHWgDLCA==
X-Received: by 2002:a81:7893:0:b0:5a7:a989:b85c with SMTP id t141-20020a817893000000b005a7a989b85cmr3816975ywc.16.1699040909707;
        Fri, 03 Nov 2023 12:48:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o63-20020a0dfe42000000b005463e45458bsm1308339ywf.123.2023.11.03.12.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 12:48:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Nov 2023 12:48:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/2] rtc: max31335: add driver support
Message-ID: <f2a58018-d907-4401-a2d9-fe53bebc1459@roeck-us.net>
References: <20231103140051.43174-1-antoniu.miclaus@analog.com>
 <20231103140051.43174-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103140051.43174-2-antoniu.miclaus@analog.com>

On Fri, Nov 03, 2023 at 04:00:26PM +0200, Antoniu Miclaus wrote:
> RTC driver for MAX31335 ±2ppm Automotive Real-Time Clock with
> Integrated MEMS Resonator.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
>  MAINTAINERS                |   8 +
>  drivers/rtc/Kconfig        |  20 ++
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-max31335.c | 700 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 729 insertions(+)
>  create mode 100644 drivers/rtc/rtc-max31335.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd5de540ec0b..bc484cb997ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12823,6 +12823,14 @@ F:	Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
>  F:	Documentation/hwmon/max31827.rst
>  F:	drivers/hwmon/max31827.c
>  
> +MAX31335 RTC DRIVER
> +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
> +L:	linux-rtc@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/rtc/adi,max31335.yaml
> +F:	drivers/rtc/rtc-max31335.c
> +
>  MAX6650 HARDWARE MONITOR AND FAN CONTROLLER DRIVER
>  L:	linux-hwmon@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d7502433c78a..360da13fe61b 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -373,6 +373,26 @@ config RTC_DRV_MAX8997
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max8997.
>  
> +config RTC_DRV_MAX31335
> +	tristate "Analog Devices MAX31335"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the Analog Devices
> +	  MAX31335.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-max31335.
> +
> +config RTC_DRV_MAX31335_HWMON
> +	bool "HWMON support for Analog Devices MAX31335"
> +	depends on RTC_DRV_MAX31335 && HWMON
> +	depends on !(RTC_DRV_MAX31335=y && HWMON=m)
> +	default y
> +	help
> +	  Say Y here if you want to expose temperature sensor data on
> +	  rtc-max31335.

CONFIG_RTC_DRV_MAX31335_HWMON is not used in the driver. What is the point
of having it ?

Guenter

