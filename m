Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CF733D9EA
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 17:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhCPQ4J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 12:56:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:48372 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229754AbhCPQzv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 12:55:51 -0400
IronPort-SDR: ox9jGUnwGrrK8FWwuzeicagX0SJ4oR/W06xko5VJk8BnpAp1bpVpCGCzWmwIpPyXWPJ3gzz/bF
 Ir64VwDz81SQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="209237585"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="209237585"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 09:55:47 -0700
IronPort-SDR: 1ZnLvylQ4cDnB7HnwETShuxZVyI27yQerkVH4GnO+bQWzugyglMctYBvzI70MfgWX3r00ui2Z4
 o7f/VFF9A4Bw==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="439189178"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 09:55:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMCys-00D0oo-Gy; Tue, 16 Mar 2021 18:55:42 +0200
Date:   Tue, 16 Mar 2021 18:55:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Subject: Re: [PATCH v4] rtc: rx6110: add ACPI bindings to I2C
Message-ID: <YFDjDhsCikxtl5rw@smile.fi.intel.com>
References: <20210316100805.2630481-1-ch@denx.de>
 <20210316144819.4130622-1-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316144819.4130622-1-ch@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Mar 16, 2021 at 03:48:18PM +0100, Claudius Heine wrote:
> From: Johannes Hahn <johannes-hahn@siemens.com>
> 
> This allows the RX6110 driver to be automatically assigned to the right
> device on the I2C bus.

You missed given tag, when somebody sends you one, it's usually your
responsibility to pick it up. Hint: install b4 tool (likely in your distro, at
least Debian, Arch Linux have it) and run it against message ID of the version
in question. It will gather all tags. For example, for this case, run

  % b4 am 20210316144819.4130622-1-ch@denx.de

It will download mailbox suitable for `git am ...` you will read on the screen.

Also, when send a new version, don't attach it to the old thread. It will
confuse people and maybe even tools (i.o.w. don't supply message ID to be put
to In-Reply-To header).

So, repeat again my tag and see one fix to be performed below.
Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> Co-developed-by: Claudius Heine <ch@denx.de>
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  drivers/rtc/rtc-rx6110.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> index 79161d4c6ce4..2a06953c0a84 100644
> --- a/drivers/rtc/rtc-rx6110.c
> +++ b/drivers/rtc/rtc-rx6110.c
> @@ -447,6 +447,12 @@ static int rx6110_i2c_probe(struct i2c_client *client,
>  	return rx6110_probe(rx6110, &client->dev);
>  }
>  
> +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
> +	{ "SECC6110" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
> +
>  static const struct i2c_device_id rx6110_i2c_id[] = {
>  	{ "rx6110", 0 },
>  	{ }
> @@ -456,6 +462,7 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
>  static struct i2c_driver rx6110_i2c_driver = {
>  	.driver = {
>  		.name = RX6110_DRIVER_NAME,
> +		.acpi_match_table = ACPI_PTR(rx6110_i2c_acpi_match),

Since you drop ifdeffery above, you have to drop ACPI_PTR() (besides that
ACPI_PTR() requires acpi.h to be included).

>  	},
>  	.probe		= rx6110_i2c_probe,
>  	.id_table	= rx6110_i2c_id,
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


