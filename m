Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C40521614E
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jul 2020 00:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGFWJU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jul 2020 18:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgGFWJU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Jul 2020 18:09:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889CEC061755;
        Mon,  6 Jul 2020 15:09:20 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cm21so8048035pjb.3;
        Mon, 06 Jul 2020 15:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+uK4bn6cD0JBlp4TOctK9L6pzNvu2hdJkLGTZY2hRKc=;
        b=i7OfbRWE+0w7dHWZN8HK6djBI8jms1umhg/j2LwNc5MXMuZ+pGQqTQo5X5oMkuSe8Z
         0/A639JjH2U71FHWUvRvop2uL/5XHf2Cwmsatq0f2FrDNQ588wYE8j0ZV53N8moMbdti
         KAM9uXB6tye8WFvumh/gZI8UDcCKcSFue/lPjF/Rwck6ZtSFKMUYTbWPklDzggm05WXI
         nLEP9gR/qEEmTjGPavRNFJDDeatE9vDZVyhSFq+MQ5r2ZTtpf0eFgXjkBPsWTrv5qFBl
         2q1QiCINWiGtmwJwBw4lSw34EIIbI5431MoWeD57VTkwYWkNo1+TX8tyRS7VTnm+mQE7
         essw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=+uK4bn6cD0JBlp4TOctK9L6pzNvu2hdJkLGTZY2hRKc=;
        b=nKY7uhqsE7darn4BuHUPAxc7aR6a9KLtiOi9PCzz6ZADII1A7BQ1gKmXxLH9hNgIkO
         kF0r1QJmoNAnCHUArgb+Ogc41VUqcZXpybx4XZUvtPeL+Mm1ol3n3QYfsNZU6QSOnonO
         L/YIpXILerApiGT+OYpYB3VRPlT0lsxj/bERH886ysPqQ2OB+8yyivEQZvGRG/Hz6D0c
         eQbm2eTRiZoZV0MvBL8byawpN8FE17lIDvzznP/FqDlwbag0rmrWC8ps5QrQZgPS6Sr7
         DNpIVvQHgBDBR36fAwuBqD0Sd0gR0tPkkZ5CioQ4LCma5kLBwKS1H1bUgQ1QPQylgnso
         9Fhw==
X-Gm-Message-State: AOAM533zF4Rjg7gQTQDb9GNj0pH1bONtmKWJP8yMhi1wCrv99ic501ZN
        xJEg4FCnKWPaood/YC0zze0=
X-Google-Smtp-Source: ABdhPJyQj2/o42r5cP5bFEF106zCGkgevjwvfYnV1UPpkRrYkqmvAgt0t/AfuR/7/UzdO8xPlafoSQ==
X-Received: by 2002:a17:90a:66c7:: with SMTP id z7mr1218180pjl.172.1594073359842;
        Mon, 06 Jul 2020 15:09:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g26sm17746049pfq.205.2020.07.06.15.09.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 15:09:19 -0700 (PDT)
Date:   Mon, 6 Jul 2020 15:09:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Johnson CH Chen =?utf-8?B?KO+/ve+/ve+/vUzvv73vv70p?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Message-ID: <20200706220918.GA189452@roeck-us.net>
References: <HK2PR01MB32815738D286AB8A714B7415FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB32815738D286AB8A714B7415FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 06, 2020 at 07:24:25AM +0000, Johnson CH Chen (���L��) wrote:
> Let ds1374 watchdog use watchdog core functions. It also includes
> improving watchdog timer setting and nowayout, and just uses ioctl()
> of watchdog core.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> Reported-by: kernel test robot <lkp@intel.com>

This should be dropped. Yes, the test robot reported a problem with
an earlier version of this patch, but it did not report a problem with
_this_ version of the patch.

> 
> v2->v3:
> - Fix a problem reported by WATCHDOG_CORE if WATCHDOG
> - Remove save_client
> - Let wdt_margin be 0 for watchdog_init_timeout()
> - Use dev_info() rather than pr_info()
> - Avoid more strings in this driver
> 
> v1->v2:
> - Use ds1374_wdt_settimeout() before registering the watchdog
> - Remove watchdog_unregister_device() because devm_watchdog_register_device() is used
> - Remove ds1374_wdt_ping()
> - TIMER_MARGIN_MAX to 4095 for 24-bit value
> - Keep wdt_margin
> - Fix coding styles
> ---

Change log should be here, after "---"

>  drivers/rtc/Kconfig      |   1 +
>  drivers/rtc/rtc-ds1374.c | 253 ++++++++++-----------------------------
>  2 files changed, 61 insertions(+), 193 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index b54d87d45c89..c25d51f35f0c 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -282,6 +282,7 @@ config RTC_DRV_DS1374
>  config RTC_DRV_DS1374_WDT
>  	bool "Dallas/Maxim DS1374 watchdog timer"
>  	depends on RTC_DRV_DS1374
> +	select WATCHDOG_CORE if WATCHDOG
>  	help
>  	  If you say Y here you will get support for the
>  	  watchdog timer in the Dallas Semiconductor DS1374
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..e86e381e52a0 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -46,6 +46,7 @@
>  #define DS1374_REG_WDALM2	0x06
>  #define DS1374_REG_CR		0x07 /* Control */
>  #define DS1374_REG_CR_AIE	0x01 /* Alarm Int. Enable */
> +#define DS1374_REG_CR_WDSTR	0x08 /* 1=INT, 0=RST */
>  #define DS1374_REG_CR_WDALM	0x20 /* 1=Watchdog, 0=Alarm */
>  #define DS1374_REG_CR_WACE	0x40 /* WD/Alarm counter enable */
>  #define DS1374_REG_SR		0x08 /* Status */
> @@ -71,7 +72,9 @@ struct ds1374 {
>  	struct i2c_client *client;
>  	struct rtc_device *rtc;
>  	struct work_struct work;
> -
> +#ifdef CONFIG_RTC_DRV_DS1374_WDT
> +	struct watchdog_device wdt;
> +#endif
>  	/* The mutex protects alarm operations, and prevents a race
>  	 * between the enable_irq() in the workqueue and the free_irq()
>  	 * in the remove function.
> @@ -369,237 +372,99 @@ static const struct rtc_class_ops ds1374_rtc_ops = {
>   *
>   *****************************************************************************
>   */
> -static struct i2c_client *save_client;
>  /* Default margin */
> -#define WD_TIMO 131762
> +#define TIMER_MARGIN_DEFAULT	32
> +#define TIMER_MARGIN_MIN	1
> +#define TIMER_MARGIN_MAX	4095 /* 24-bit value */
>  
>  #define DRV_NAME "DS1374 Watchdog"
>  
> -static int wdt_margin = WD_TIMO;
> -static unsigned long wdt_is_open;
> +static int wdt_margin;
>  module_param(wdt_margin, int, 0);
>  MODULE_PARM_DESC(wdt_margin, "Watchdog timeout in seconds (default 32s)");
>  
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default ="
> +		__MODULE_STRING(WATCHDOG_NOWAYOUT)")");
> +
> +
>  static const struct watchdog_info ds1374_wdt_info = {
>  	.identity       = "DS1374 WTD",
>  	.options        = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>  						WDIOF_MAGICCLOSE,
>  };
>  
> -static int ds1374_wdt_settimeout(unsigned int timeout)
> +static int ds1374_wdt_settimeout(struct watchdog_device *wdt, unsigned int timeout)
>  {
> -	int ret = -ENOIOCTLCMD;
> -	int cr;
> +	int ret, cr;
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
> +	struct i2c_client *client = ds1374->client;
>  
> -	ret = cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> -	if (ret < 0)
> -		goto out;
> +	wdt->timeout = timeout;
> +
> +	cr = i2c_smbus_read_byte_data(client, DS1374_REG_CR);
> +	if (cr < 0)
> +		return cr;
>  
>  	/* Disable any existing watchdog/alarm before setting the new one */
>  	cr &= ~DS1374_REG_CR_WACE;
>  
> -	ret = i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
> +	ret = i2c_smbus_write_byte_data(client, DS1374_REG_CR, cr);
>  	if (ret < 0)
> -		goto out;
> +		return ret;
>  
>  	/* Set new watchdog time */
> -	ret = ds1374_write_rtc(save_client, timeout, DS1374_REG_WDALM0, 3);
> +	timeout = timeout * 4096;
> +	ret = ds1374_write_rtc(client, timeout, DS1374_REG_WDALM0, 3);
>  	if (ret) {
> -		pr_info("couldn't set new watchdog time\n");
> -		goto out;
> +		dev_info(&client->dev, "couldn't set new watchdog time\n");

This should be dev_err(). Note though that I would suggest to drop the message -
there are other errors for which there is no error message, and I don't see
why this one would be more important or relevant.

> +		return ret;
>  	}
>  
>  	/* Enable watchdog timer */
>  	cr |= DS1374_REG_CR_WACE | DS1374_REG_CR_WDALM;
> +	cr &= ~DS1374_REG_CR_WDSTR;/* for RST PIN */
>  	cr &= ~DS1374_REG_CR_AIE;
>  
> -	ret = i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
> +	ret = i2c_smbus_write_byte_data(client, DS1374_REG_CR, cr);
>  	if (ret < 0)
> -		goto out;
> +		return ret;
>  
>  	return 0;
> -out:
> -	return ret;
>  }
>  
> -
>  /*
>   * Reload the watchdog timer.  (ie, pat the watchdog)
>   */
> -static void ds1374_wdt_ping(void)
> +static int ds1374_wdt_start(struct watchdog_device *wdt)
>  {
>  	u32 val;
> -	int ret = 0;
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
>  
> -	ret = ds1374_read_rtc(save_client, &val, DS1374_REG_WDALM0, 3);
> -	if (ret)
> -		pr_info("WD TICK FAIL!!!!!!!!!! %i\n", ret);
> +	return ds1374_read_rtc(ds1374->client, &val, DS1374_REG_WDALM0, 3);
>  }
>  
> -static void ds1374_wdt_disable(void)
> +static int ds1374_wdt_stop(struct watchdog_device *wdt)
>  {
>  	int cr;
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
> +	struct i2c_client *client = ds1374->client;

Nit: Reverse christmas tree looks a bit better.

+	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
+	struct i2c_client *client = ds1374->client;
	int cr;

>  
> -	cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> +	cr = i2c_smbus_read_byte_data(client, DS1374_REG_CR);

Missing error check:

	if (cr < 0)
		return cr;

>  	/* Disable watchdog timer */
>  	cr &= ~DS1374_REG_CR_WACE;
>  
> -	i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
> +	return i2c_smbus_write_byte_data(client, DS1374_REG_CR, cr);
>  }
>  
> -/*
> - * Watchdog device is opened, and watchdog starts running.
> - */
> -static int ds1374_wdt_open(struct inode *inode, struct file *file)
> -{
> -	struct ds1374 *ds1374 = i2c_get_clientdata(save_client);
> -
> -	if (MINOR(inode->i_rdev) == WATCHDOG_MINOR) {
> -		mutex_lock(&ds1374->mutex);
> -		if (test_and_set_bit(0, &wdt_is_open)) {
> -			mutex_unlock(&ds1374->mutex);
> -			return -EBUSY;
> -		}
> -		/*
> -		 *      Activate
> -		 */
> -		wdt_is_open = 1;
> -		mutex_unlock(&ds1374->mutex);
> -		return stream_open(inode, file);
> -	}
> -	return -ENODEV;
> -}
> -
> -/*
> - * Close the watchdog device.
> - */
> -static int ds1374_wdt_release(struct inode *inode, struct file *file)
> -{
> -	if (MINOR(inode->i_rdev) == WATCHDOG_MINOR)
> -		clear_bit(0, &wdt_is_open);
> -
> -	return 0;
> -}
> -
> -/*
> - * Pat the watchdog whenever device is written to.
> - */
> -static ssize_t ds1374_wdt_write(struct file *file, const char __user *data,
> -				size_t len, loff_t *ppos)
> -{
> -	if (len) {
> -		ds1374_wdt_ping();
> -		return 1;
> -	}
> -	return 0;
> -}
> -
> -static ssize_t ds1374_wdt_read(struct file *file, char __user *data,
> -				size_t len, loff_t *ppos)
> -{
> -	return 0;
> -}
> -
> -/*
> - * Handle commands from user-space.
> - */
> -static long ds1374_wdt_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> -{
> -	int new_margin, options;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user((struct watchdog_info __user *)arg,
> -		&ds1374_wdt_info, sizeof(ds1374_wdt_info)) ? -EFAULT : 0;
> -
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, (int __user *)arg);
> -	case WDIOC_KEEPALIVE:
> -		ds1374_wdt_ping();
> -		return 0;
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_margin, (int __user *)arg))
> -			return -EFAULT;
> -
> -		/* the hardware's tick rate is 4096 Hz, so
> -		 * the counter value needs to be scaled accordingly
> -		 */
> -		new_margin <<= 12;
> -		if (new_margin < 1 || new_margin > 16777216)
> -			return -EINVAL;
> -
> -		wdt_margin = new_margin;
> -		ds1374_wdt_settimeout(new_margin);
> -		ds1374_wdt_ping();
> -		/* fallthrough */
> -	case WDIOC_GETTIMEOUT:
> -		/* when returning ... inverse is true */
> -		return put_user((wdt_margin >> 12), (int __user *)arg);
> -	case WDIOC_SETOPTIONS:
> -		if (copy_from_user(&options, (int __user *)arg, sizeof(int)))
> -			return -EFAULT;
> -
> -		if (options & WDIOS_DISABLECARD) {
> -			pr_info("disable watchdog\n");
> -			ds1374_wdt_disable();
> -			return 0;
> -		}
> -
> -		if (options & WDIOS_ENABLECARD) {
> -			pr_info("enable watchdog\n");
> -			ds1374_wdt_settimeout(wdt_margin);
> -			ds1374_wdt_ping();
> -			return 0;
> -		}
> -		return -EINVAL;
> -	}
> -	return -ENOTTY;
> -}
> -
> -static long ds1374_wdt_unlocked_ioctl(struct file *file, unsigned int cmd,
> -			unsigned long arg)
> -{
> -	int ret;
> -	struct ds1374 *ds1374 = i2c_get_clientdata(save_client);
> -
> -	mutex_lock(&ds1374->mutex);
> -	ret = ds1374_wdt_ioctl(file, cmd, arg);
> -	mutex_unlock(&ds1374->mutex);
> -
> -	return ret;
> -}
> -
> -static int ds1374_wdt_notify_sys(struct notifier_block *this,
> -			unsigned long code, void *unused)
> -{
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		/* Disable Watchdog */
> -		ds1374_wdt_disable();
> -	return NOTIFY_DONE;
> -}
> -
> -static const struct file_operations ds1374_wdt_fops = {
> -	.owner			= THIS_MODULE,
> -	.read			= ds1374_wdt_read,
> -	.unlocked_ioctl		= ds1374_wdt_unlocked_ioctl,
> -	.compat_ioctl		= compat_ptr_ioctl,
> -	.write			= ds1374_wdt_write,
> -	.open                   = ds1374_wdt_open,
> -	.release                = ds1374_wdt_release,
> -	.llseek			= no_llseek,
> +static const struct watchdog_ops ds1374_wdt_ops = {
> +	.owner          = THIS_MODULE,
> +	.start          = ds1374_wdt_start,
> +	.stop           = ds1374_wdt_stop,
> +	.set_timeout    = ds1374_wdt_settimeout,
>  };
>  
> -static struct miscdevice ds1374_miscdev = {
> -	.minor          = WATCHDOG_MINOR,
> -	.name           = "watchdog",
> -	.fops           = &ds1374_wdt_fops,
> -};
> -
> -static struct notifier_block ds1374_wdt_notifier = {
> -	.notifier_call = ds1374_wdt_notify_sys,
> -};
>  
>  #endif /*CONFIG_RTC_DRV_DS1374_WDT*/
>  /*
> @@ -652,16 +517,23 @@ static int ds1374_probe(struct i2c_client *client,
>  		return ret;
>  
>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
> -	save_client = client;
> -	ret = misc_register(&ds1374_miscdev);
> +	ds1374->wdt.info = &ds1374_wdt_info;
> +	ds1374->wdt.ops = &ds1374_wdt_ops;
> +	ds1374->wdt.timeout = TIMER_MARGIN_DEFAULT;
> +	ds1374->wdt.min_timeout = TIMER_MARGIN_MIN;
> +	ds1374->wdt.max_timeout = TIMER_MARGIN_MAX;
> +
> +	watchdog_init_timeout(&ds1374->wdt, wdt_margin, &client->dev);
> +	watchdog_set_nowayout(&ds1374->wdt, nowayout);
> +	watchdog_stop_on_reboot(&ds1374->wdt);
> +	watchdog_stop_on_unregister(&ds1374->wdt);
> +	watchdog_set_drvdata(&ds1374->wdt, ds1374);
> +	ds1374_wdt_settimeout(&ds1374->wdt, ds1374->wdt.timeout);
> +
> +

Drop 2nd empty line.

> +	ret = devm_watchdog_register_device(&client->dev, &ds1374->wdt);
>  	if (ret)
>  		return ret;
> -	ret = register_reboot_notifier(&ds1374_wdt_notifier);
> -	if (ret) {
> -		misc_deregister(&ds1374_miscdev);
> -		return ret;
> -	}
> -	ds1374_wdt_settimeout(131072);
>  #endif
>  
>  	return 0;
> @@ -670,11 +542,6 @@ static int ds1374_probe(struct i2c_client *client,
>  static int ds1374_remove(struct i2c_client *client)
>  {
>  	struct ds1374 *ds1374 = i2c_get_clientdata(client);
> -#ifdef CONFIG_RTC_DRV_DS1374_WDT
> -	misc_deregister(&ds1374_miscdev);
> -	ds1374_miscdev.parent = NULL;
> -	unregister_reboot_notifier(&ds1374_wdt_notifier);
> -#endif
>  
>  	if (client->irq > 0) {
>  		mutex_lock(&ds1374->mutex);
