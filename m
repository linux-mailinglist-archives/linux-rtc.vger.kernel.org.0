Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C719A8BE15
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 18:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfHMQTM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 12:19:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38573 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfHMQTL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 12:19:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id m12so10859377plt.5;
        Tue, 13 Aug 2019 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=my0o1s01dLmu/79yESct77Di2k1yz+iXRggCTeXp54c=;
        b=M9XZ3+L7P0SijEx54Dkne9oM0J0RGF5KNNQCXdpsELjhCDGCyBBrgONrE/fuB9UL5t
         4sjv6MVNX4gD9l5h3oTEI5Ugg9Obj3UJIRCdcNOppW8s+ic5iSYg3EjV1LY0ZadkQqaW
         v8D+dupXTPCVLTaTlcqaTkzUQd5TU+k49IrvC1tBMw2HsVh3t+wAM2GfrjGG4D6FQjpk
         U4UWHAzewUxIrWXoPC0x8aUgOZTIOI3pUZu5M5ou/Rd/rjZ0fw3IIsDKp2F8Vheg7DpD
         xn0NSCKavHvrbsvYtKAtHRbQ+81L0StWbfB4xXrhMyJCZ7t1Oo9dFu39CM7NPmEH5xKL
         TVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=my0o1s01dLmu/79yESct77Di2k1yz+iXRggCTeXp54c=;
        b=hT+3cvGqj7BxBor6acrjdjMTonR2/61tnjRmr4vof7SyJ53gQ43CBbJvlTkPnuSuul
         SiovFUz9z2BFbCIsUmON7L/+facHT7ujpRrMDQcpp89xrVpd5wIltuGlgUcy7U6FsVrF
         SyDN5FTJIpBb+s9nTH1ONNrSaRNobQB+CSiJw78DXQMyB7d+Ns96IszFN4bfjktUYaYY
         zmTFrimv8woK0J8ld8UIAM76HX/uiO++rs0EL/gX5L2yEMAMWCU4VWpvj13GaHudPArL
         i/a1eP5Sw/8M7I+fwO7hadgIPk41OpnlGeif8+5YPgNJ0a+GgdZx7CCuLimAuIyx9wGJ
         3KDg==
X-Gm-Message-State: APjAAAVJ7sQIXcqn/AFmM6cfXIIwIXKOdF24Vs7FGbwtfnjqA/Dp9QHu
        s0dw5d2soo2SwQvIKRO9MO4=
X-Google-Smtp-Source: APXvYqx2H1+VXuqT8Pr3tsEPTB7NkdAgry5/oDSIG83wJysK3GQnET2UYi64X4TtQoaHLq7bPiwOng==
X-Received: by 2002:a17:902:740a:: with SMTP id g10mr39074440pll.82.1565713150772;
        Tue, 13 Aug 2019 09:19:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v184sm102183015pgd.34.2019.08.13.09.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 09:19:09 -0700 (PDT)
Date:   Tue, 13 Aug 2019 09:19:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, u.kleine-koenig@pengutronix.de,
        sean.nyekjaer@prevas.dk, bth@kamstrup.com
Subject: Re: [PATCH v2 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20190813161908.GA7857@roeck-us.net>
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
 <20190813153600.12406-5-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813153600.12406-5-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Aug 13, 2019 at 05:35:59PM +0200, Bruno Thomsen wrote:
> Add partial support for the watchdog functionality of
> both PCF2127 and PCF2129 chips.
> 
> The programmable watchdog timer is currently using a fixed
> clock source of 1Hz. This result in a selectable range of
> 1-255 seconds, which covers most embedded Linux use-cases.
> 
> Clock sources of 4096Hz, 64Hz and 1/60Hz is mostly useful
> in MCU use-cases.
> 
> Countdown timer not available when using watchdog feature.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  drivers/rtc/Kconfig       |   7 ++-
>  drivers/rtc/rtc-pcf2127.c | 127 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 133 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e72f65b61176..a3bb58a08879 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -876,7 +876,12 @@ config RTC_DRV_PCF2127
>  	depends on RTC_I2C_AND_SPI
>  	help
>  	  If you say yes here you get support for the NXP PCF2127/29 RTC
> -	  chips.
> +	  chips with integrated quartz crystal for industrial applications.
> +	  Both chips also have watchdog timer and tamper switch detection
> +	  features.
> +
> +	  PCF2127 has an additional feature of 512 bytes battery backed
> +	  memory that's accessible using nvmem interface.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-pcf2127.
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index ee4921e4a47c..700db7dd3eef 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -5,6 +5,9 @@
>   *
>   * Author: Renaud Cerrato <r.cerrato@til-technologies.fr>
>   *
> + * Watchdog and tamper functions
> + * Author: Bruno Thomsen <bruno.thomsen@gmail.com>
> + *
>   * based on the other drivers in this same directory.
>   *
>   * Datasheet: http://cache.nxp.com/documents/data_sheet/PCF2127.pdf
> @@ -18,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> +#include <linux/watchdog.h>
>  
>  /* Control register 1 */
>  #define PCF2127_REG_CTRL1		0x00
> @@ -35,6 +39,13 @@
>  #define PCF2127_REG_DW			0x07
>  #define PCF2127_REG_MO			0x08
>  #define PCF2127_REG_YR			0x09
> +/* Watchdog registers */
> +#define PCF2127_REG_WD_CTL		0x10
> +#define PCF2127_BIT_WD_CTL_TF0			BIT(0)
> +#define PCF2127_BIT_WD_CTL_TF1			BIT(1)
> +#define PCF2127_BIT_WD_CTL_CD0			BIT(6)
> +#define PCF2127_BIT_WD_CTL_CD1			BIT(7)
> +#define PCF2127_REG_WD_VAL		0x11
>  /*
>   * RAM registers
>   * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
> @@ -45,9 +56,15 @@
>  #define PCF2127_REG_RAM_WRT_CMD		0x1C
>  #define PCF2127_REG_RAM_RD_CMD		0x1D
>  
> +/* Watchdog timer value constants */
> +#define PCF2127_WD_VAL_STOP		0
> +#define PCF2127_WD_VAL_MIN		2
> +#define PCF2127_WD_VAL_MAX		255
> +#define PCF2127_WD_VAL_DEFAULT		60
>  
>  struct pcf2127 {
>  	struct rtc_device *rtc;
> +	struct watchdog_device wdd;
>  	struct regmap *regmap;
>  };
>  
> @@ -220,6 +237,81 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
>  	return ret ?: bytes;
>  }
>  
> +/* watchdog driver */
> +
> +static int pcf2127_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> +
> +	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL, wdd->timeout);
> +}
> +
> +/*
> + * Restart watchdog timer if feature is active.
> + *
> + * Note: Reading CTRL2 register causes watchdog to stop which is unfortunate,
> + * since register also contain control/status flags for other features.
> + * Always call this function after reading CTRL2 register.
> + */
> +static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
> +{
> +	int ret = 0;
> +
> +	if (watchdog_active(wdd)) {
> +		ret = pcf2127_wdt_ping(wdd);
> +		if (ret)
> +			dev_err(wdd->parent,
> +				"%s: watchdog restart failed, ret=%d\n",
> +				__func__, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int pcf2127_wdt_start(struct watchdog_device *wdd)
> +{
> +	dev_info(wdd->parent, "watchdog enabled\n");
> +
> +	return pcf2127_wdt_ping(wdd);
> +}
> +
> +static int pcf2127_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> +
> +	dev_info(wdd->parent, "watchdog disabled\n");
> +

There is a lot of noise in this driver. Please reconsider.

Guenter

> +	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL,
> +			    PCF2127_WD_VAL_STOP);
> +}
> +
> +static int pcf2127_wdt_set_timeout(struct watchdog_device *wdd,
> +				   unsigned int new_timeout)
> +{
> +	int ret = 0;
> +
> +	dev_info(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
> +		new_timeout, wdd->timeout);
> +
> +	wdd->timeout = new_timeout;
> +	ret = pcf2127_wdt_active_ping(wdd);
> +
> +	return ret;
> +}
> +
> +static const struct watchdog_info pcf2127_wdt_info = {
> +	.identity = "NXP PCF2127/PCF2129 Watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +};
> +
> +static const struct watchdog_ops pcf2127_watchdog_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pcf2127_wdt_start,
> +	.stop = pcf2127_wdt_stop,
> +	.ping = pcf2127_wdt_ping,
> +	.set_timeout = pcf2127_wdt_set_timeout,
> +};
> +
>  static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  			const char *name, bool has_nvmem)
>  {
> @@ -242,6 +334,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  
>  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
>  
> +	pcf2127->wdd.parent = dev;
> +	pcf2127->wdd.info = &pcf2127_wdt_info;
> +	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
> +	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
> +	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
> +	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
> +	pcf2127->wdd.min_hw_heartbeat_ms = 500;
> +
> +	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
> +
>  	if (has_nvmem) {
>  		struct nvmem_config nvmem_cfg = {
>  			.priv = pcf2127,
> @@ -253,6 +355,31 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>  	}
>  
> +	/*
> +	 * Watchdog timer enabled and reset pin /RST activated when timed out.
> +	 * Select 1Hz clock source for watchdog timer.
> +	 * Timer is not started until WD_VAL is loaded with a valid value.
> +	 * Note: Countdown timer disabled and not available.
> +	 */
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> +				 PCF2127_BIT_WD_CTL_CD1 |
> +				 PCF2127_BIT_WD_CTL_CD0 |
> +				 PCF2127_BIT_WD_CTL_TF1 |
> +				 PCF2127_BIT_WD_CTL_TF0,
> +				 PCF2127_BIT_WD_CTL_CD1 |
> +				 PCF2127_BIT_WD_CTL_CD0 |
> +				 PCF2127_BIT_WD_CTL_TF1);
> +	if (ret) {
> +		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
> +		return ret;
> +	}
> +
> +	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
> +	if (ret) {
> +		dev_err(dev, "%s: watchdog registering failed\n", __func__);
> +		return ret;
> +	}
> +
>  	return rtc_register_device(pcf2127->rtc);
>  }
>  
> -- 
> 2.21.0
> 
