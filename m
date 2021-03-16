Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2459D33D313
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 12:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhCPLbB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 07:31:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:39090 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237164AbhCPLap (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 07:30:45 -0400
IronPort-SDR: JM9nifR9OtbHBmSIjSUbtyxD+FVqgzDjZUPfaATNv7QEVjIz6tUBMv3A8F5L+Orf1+MUGUenhk
 Z7XJHF3vWa1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="185880954"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="185880954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 04:30:42 -0700
IronPort-SDR: ZVKwbcwwsCKJONUcPCa4daCsOEKrNpj90LeDkeI6p0fo4fqZPVJkeRmwWtGkiJNqcvfLw0aNq4
 0K0Q5Qrpf2ew==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="522473255"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 04:30:39 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lM7uG-00CwGT-S5; Tue, 16 Mar 2021 13:30:36 +0200
Date:   Tue, 16 Mar 2021 13:30:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Claudius Heine <ch@denx.de>
Cc:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
Subject: Re: [PATCH v3 1/1] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFCW3Kx9MPm0MT8H@smile.fi.intel.com>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
 <20210316100805.2630481-2-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316100805.2630481-2-ch@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 16, 2021 at 11:08:05AM +0100, Claudius Heine wrote:
> From: Johannes Hahn <johannes-hahn@siemens.com>
> 
> This allows the RX6110 driver to be automatically assigned to the right
> device on the I2C bus.

Thanks for all effort!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
after addressing the below comments.

> Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> Signed-off-by: Claudius Heine <ch@denx.de>

> Signed-off-by: Henning Schild <henning.schild@siemens.com>

I think this is somehow confusing. Either you need to add Co-developed-by of
the corresponding people, or remove SoB (because of From line), i.o.w seems
like Co-dB tag is needed for Johannes or you and something should be done with
Henning's SoB.

> ---
>  drivers/rtc/rtc-rx6110.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> index 79161d4c6ce4..29bd697f82cb 100644
> --- a/drivers/rtc/rtc-rx6110.c
> +++ b/drivers/rtc/rtc-rx6110.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>

> +#include <linux/acpi.h>

Usually it's not needed if you leave IDs always to be compiled.
Instead mod_devicetable.h is used. But it's all up to you and maintainer.

>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/spi/spi.h>
> @@ -447,6 +448,14 @@ static int rx6110_i2c_probe(struct i2c_client *client,
>  	return rx6110_probe(rx6110, &client->dev);
>  }
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
> +	{ "SECC6110", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
> +#endif
> +
>  static const struct i2c_device_id rx6110_i2c_id[] = {
>  	{ "rx6110", 0 },
>  	{ }
> @@ -456,6 +465,9 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
>  static struct i2c_driver rx6110_i2c_driver = {
>  	.driver = {
>  		.name = RX6110_DRIVER_NAME,
> +#ifdef CONFIG_ACPI

This is implied by the stub ACPI_PTR() macro for ACPI=n case.
I.o.w drop this ugly and redundant ifdeffery.

> +		.acpi_match_table = ACPI_PTR(rx6110_i2c_acpi_match),
> +#endif
>  	},
>  	.probe		= rx6110_i2c_probe,
>  	.id_table	= rx6110_i2c_id,
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


