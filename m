Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E86D214D9E
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Jul 2020 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgGEPYN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Jul 2020 11:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgGEPYM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 5 Jul 2020 11:24:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99368C061794;
        Sun,  5 Jul 2020 08:24:12 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so2336957pll.3;
        Sun, 05 Jul 2020 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7u1sg5j+5edB6l/2AVnqIdXfLKuEI8ngZapb0c0h8SU=;
        b=ASjFx/hA3ZIIqG7oFvAHlMFvECkbzVKegyQMhw53nXSc8vF3eusJZdBssOM3HeJM2k
         ZxirZIOgQ2BWSK02eUNPFYu8qO1AOj1TC6Wq3qDLIj51e2mJz8DAQiIPvk4F2SVd3lTO
         5WhRHEYgUtCMb/UZm2bS5AnyzNh3Pd51n8RytmXgt7c1ZuVjDAUEZmKU5vubGAQnDiym
         Rg8+UOZTF4ZO6CSfNKleWKpq4Qbb2vbFszpKKDqRhOANFeKZItJ9WsfPOIuG2w9JZM0+
         FAotI9Jzd63I4uDquAx8iO+CKvG/LsKbJi8010+2eFrVvrSQTXjmALg0MWrY0WrVvqkB
         IMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=7u1sg5j+5edB6l/2AVnqIdXfLKuEI8ngZapb0c0h8SU=;
        b=bFtCinoEa7+KJmymuaD8bwLuvPGIIoLZiluLAiLUgvAc5JALVfH6zsA//cwaXOyycV
         tfw1zvDiEC6oflF/uOeifDkZszOvNLzEYZp1VZyP3rfhZwb4WooviDnzgl/1xCMfXca3
         bU/iY94R77zHPaRb5EL/FZ5gVouhgCbCw+ooeTBPle3mUe8CIoMvTbTmkXss+NP71LE+
         oJ6FnIbf4ciNJKfFnp1e3FWR+6RcSxSYY0A5XcuMllO3F6Ys0y2HOogfLO12/yFeiGOi
         jirQ9prXjz/PaXfy8jVfFEhyWYynCTYqMk6R+My4VXA6zk9GwwCVaaRma4DOxmmSpwiH
         EdMw==
X-Gm-Message-State: AOAM533MIueCPok+mB/CFOjJ5IFtfALG12fk+CwoyKKtUwO4i0oTl3JL
        ejGG/MGGxgX6BEP0RkQayFyHF5FBxRg=
X-Google-Smtp-Source: ABdhPJzV/4+WaSP/fP1+zFtkEOgocjBLj2Tj8g2JS07j9ru0DIzfeMgI7xk38yPRWvDKS3nIKmTNmw==
X-Received: by 2002:a17:902:7008:: with SMTP id y8mr5817904plk.85.1593962651987;
        Sun, 05 Jul 2020 08:24:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d37sm17121263pgd.18.2020.07.05.08.24.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 08:24:11 -0700 (PDT)
Date:   Sun, 5 Jul 2020 08:24:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Message-ID: <20200705152410.GB5663@roeck-us.net>
References: <HK2PR01MB3281245DE7A646BCB12D987DFA6A0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB3281245DE7A646BCB12D987DFA6A0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jul 03, 2020 at 11:48:09AM +0000, Johnson CH Chen (陳昭勳) wrote:
> Let ds1374 watchdog use watchdog core functions. It also includes
> improving watchdog timer setting and nowayout, and just uses ioctl()
> of watchdog core.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> Reported-by: kernel test robot <lkp@intel.com>
> 
> v1->v2:
> - Use ds1374_wdt_settimeout() before registering the watchdog
> - Remove watchdog_unregister_device() because devm_watchdog_register_device() is used
> - Remove ds1374_wdt_ping()
> - TIMER_MARGIN_MAX to 4095 for 24-bit value
> - Keep wdt_margin
> - Fix coding styles
> ---
>  drivers/rtc/Kconfig      |   1 +
>  drivers/rtc/rtc-ds1374.c | 236 +++++++++------------------------------
>  2 files changed, 52 insertions(+), 185 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index b54d87d45c89..5e2444af5657 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -282,6 +282,7 @@ config RTC_DRV_DS1374
>  config RTC_DRV_DS1374_WDT
>  	bool "Dallas/Maxim DS1374 watchdog timer"
>  	depends on RTC_DRV_DS1374
> +	select WATCHDOG_CORE

This has to be

	select WATCHDOG_CORE if WATCHDOG

to fix the problem reported by 0-day.

>  	help
>  	  If you say Y here you will get support for the
>  	  watchdog timer in the Dallas Semiconductor DS1374
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..57a4e503b34a 100644
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
> @@ -371,72 +374,76 @@ static const struct rtc_class_ops ds1374_rtc_ops = {
>   */
>  static struct i2c_client *save_client;

This is no longer necessary. struct watchdog_device is part of struct ds1374,
so it is possible to derive the pointer to struct ds1374 from it and get the
client pointer from there.

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
> +static int wdt_margin = TIMER_MARGIN_DEFAULT;

Should be 0, not TIMER_MARGIN_DEFAULT.

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
>  
> -	ret = cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> -	if (ret < 0)
> -		goto out;
> +	wdt->timeout = timeout;
> +
> +	cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> +	if (cr < 0)
> +		return cr;
>  
>  	/* Disable any existing watchdog/alarm before setting the new one */
>  	cr &= ~DS1374_REG_CR_WACE;
>  
>  	ret = i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
>  	if (ret < 0)
> -		goto out;
> +		return ret;
>  
>  	/* Set new watchdog time */
> +	timeout = timeout * 4096;
>  	ret = ds1374_write_rtc(save_client, timeout, DS1374_REG_WDALM0, 3);
>  	if (ret) {
>  		pr_info("couldn't set new watchdog time\n");

dev_info() can now be used since we have a device. _info seems to be wrong,
though, since this is an error.

> -		goto out;
> +		return ret;
>  	}
>  
>  	/* Enable watchdog timer */
>  	cr |= DS1374_REG_CR_WACE | DS1374_REG_CR_WDALM;
> +	cr &= ~DS1374_REG_CR_WDSTR;/* for RST PIN */
>  	cr &= ~DS1374_REG_CR_AIE;
>  
>  	ret = i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
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
>  
> -	ret = ds1374_read_rtc(save_client, &val, DS1374_REG_WDALM0, 3);
> -	if (ret)
> -		pr_info("WD TICK FAIL!!!!!!!!!! %i\n", ret);
> +	return ds1374_read_rtc(save_client, &val, DS1374_REG_WDALM0, 3);
>  }
>  
> -static void ds1374_wdt_disable(void)
> +static int ds1374_wdt_stop(struct watchdog_device *wdt)
>  {
>  	int cr;
>  
> @@ -444,162 +451,16 @@ static void ds1374_wdt_disable(void)
>  	/* Disable watchdog timer */
>  	cr &= ~DS1374_REG_CR_WACE;
>  
> -	i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
> -}
> -
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
> +	return i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
>  }
>  
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
> @@ -653,15 +514,25 @@ static int ds1374_probe(struct i2c_client *client,
>  
>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
>  	save_client = client;
> -	ret = misc_register(&ds1374_miscdev);
> -	if (ret)
> -		return ret;
> -	ret = register_reboot_notifier(&ds1374_wdt_notifier);
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
> +	ds1374_wdt_settimeout(&ds1374->wdt, wdt_margin);
> +
> +	ret = devm_watchdog_register_device(&client->dev, &ds1374->wdt);
>  	if (ret) {
> -		misc_deregister(&ds1374_miscdev);
> +		dev_err(&client->dev, "failed to register DS1374 watchdog device\n");
>  		return ret;
>  	}
> -	ds1374_wdt_settimeout(131072);
> +
> +	dev_info(&client->dev, "DS1374 watchdog device enabled\n");

Is that necessary ?

>  #endif
>  
>  	return 0;
> @@ -670,11 +541,6 @@ static int ds1374_probe(struct i2c_client *client,
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
> -- 
> 2.20.1
