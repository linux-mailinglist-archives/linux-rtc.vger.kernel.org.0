Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E848B225C9B
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 12:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgGTK0f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 06:26:35 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58909 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGTK0f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Jul 2020 06:26:35 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5BE2AE000E;
        Mon, 20 Jul 2020 10:26:29 +0000 (UTC)
Date:   Mon, 20 Jul 2020 12:26:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Message-ID: <20200720102629.GE3428@piout.net>
References: <HK2PR01MB32811CE9FE5DB463A69E94C8FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB32811CE9FE5DB463A69E94C8FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/07/2020 09:46:45+0000, Johnson CH Chen (陳昭勳) wrote:
> Let ds1374 watchdog use watchdog core functions. It also includes
> improving watchdog timer setting and nowayout, and just uses ioctl()
> of watchdog core.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v4->v5:
> - Fix reported build error by replacing RTC_DRV_DS1374_WDT with WATCHDOG_CORE
> 

This is not the correct solution as this will remove the alarm
functionality for anyone enabling WATCHDOG. I already submitted a proper
fix.

> v3->v4:
> - Fix coding styles 
> - Remove dev_info() in ds1374_wdt_settimeout()
> - Fix missing error check
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
> 
>  drivers/rtc/Kconfig      |  13 +-
>  drivers/rtc/rtc-ds1374.c | 272 ++++++++++-----------------------------
>  2 files changed, 72 insertions(+), 213 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index b54d87d45c89..fcc47a613635 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -271,22 +271,17 @@ config RTC_DRV_DS1307_CENTURY
>  
>  config RTC_DRV_DS1374
>  	tristate "Dallas/Maxim DS1374"
> +	select WATCHDOG_CORE if WATCHDOG
>  	help
>  	  If you say yes here you get support for Dallas Semiconductor
>  	  DS1374 real-time clock chips. If an interrupt is associated
> -	  with the device, the alarm functionality is supported.
> +	  with the device, the alarm functionality is supported. If
> +	  WATCHDOG_CORE is enabled, Dallas/Maxim DS1374 watchdog timer
> +	  is supported rather than alarm timer.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-ds1374.
>  
> -config RTC_DRV_DS1374_WDT
> -	bool "Dallas/Maxim DS1374 watchdog timer"
> -	depends on RTC_DRV_DS1374
> -	help
> -	  If you say Y here you will get support for the
> -	  watchdog timer in the Dallas Semiconductor DS1374
> -	  real-time clock chips.
> -
>  config RTC_DRV_DS1672
>  	tristate "Dallas/Maxim DS1672"
>  	help
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..fc6470f5c847 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -29,7 +29,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/slab.h>
>  #include <linux/pm.h>
> -#ifdef CONFIG_RTC_DRV_DS1374_WDT
> +#ifdef CONFIG_WATCHDOG_CORE
>  #include <linux/fs.h>
>  #include <linux/ioctl.h>
>  #include <linux/miscdevice.h>
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
> +#ifdef CONFIG_WATCHDOG_CORE
> +	struct watchdog_device wdt;
> +#endif
>  	/* The mutex protects alarm operations, and prevents a race
>  	 * between the enable_irq() in the workqueue and the free_irq()
>  	 * in the remove function.
> @@ -177,7 +180,7 @@ static int ds1374_set_time(struct device *dev, struct rtc_time *time)
>  	return ds1374_write_rtc(client, itime, DS1374_REG_TOD0, 4);
>  }
>  
> -#ifndef CONFIG_RTC_DRV_DS1374_WDT
> +#ifndef CONFIG_WATCHDOG_CORE
>  /* The ds1374 has a decrementer for an alarm, rather than a comparator.
>   * If the time of day is changed, then the alarm will need to be
>   * reset.
> @@ -324,7 +327,7 @@ static void ds1374_work(struct work_struct *work)
>  	mutex_unlock(&ds1374->mutex);
>  }
>  
> -#ifndef CONFIG_RTC_DRV_DS1374_WDT
> +#ifndef CONFIG_WATCHDOG_CORE
>  static int ds1374_alarm_irq_enable(struct device *dev, unsigned int enabled)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> @@ -354,14 +357,14 @@ static int ds1374_alarm_irq_enable(struct device *dev, unsigned int enabled)
>  static const struct rtc_class_ops ds1374_rtc_ops = {
>  	.read_time = ds1374_read_time,
>  	.set_time = ds1374_set_time,
> -#ifndef CONFIG_RTC_DRV_DS1374_WDT
> +#ifndef CONFIG_WATCHDOG_CORE
>  	.read_alarm = ds1374_read_alarm,
>  	.set_alarm = ds1374_set_alarm,
>  	.alarm_irq_enable = ds1374_alarm_irq_enable,
>  #endif
>  };
>  
> -#ifdef CONFIG_RTC_DRV_DS1374_WDT
> +#ifdef CONFIG_WATCHDOG_CORE
>  /*
>   *****************************************************************************
>   *
> @@ -369,239 +372,99 @@ static const struct rtc_class_ops ds1374_rtc_ops = {
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
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
> +	struct i2c_client *client = ds1374->client;
> +	int ret, cr;
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
> -	if (ret) {
> -		pr_info("couldn't set new watchdog time\n");
> -		goto out;
> -	}
> +	timeout = timeout * 4096;
> +	ret = ds1374_write_rtc(client, timeout, DS1374_REG_WDALM0, 3);
> +	if (ret)
> +		return ret;
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
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
>  	u32 val;
> -	int ret = 0;
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
> +	struct ds1374 *ds1374 = watchdog_get_drvdata(wdt);
> +	struct i2c_client *client = ds1374->client;
>  	int cr;
>  
> -	cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> +	cr = i2c_smbus_read_byte_data(client, DS1374_REG_CR);
> +	if (cr < 0)
> +		return cr;
> +
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
> +	return i2c_smbus_write_byte_data(client, DS1374_REG_CR, cr);
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
> -};
> -
> -static struct miscdevice ds1374_miscdev = {
> -	.minor          = WATCHDOG_MINOR,
> -	.name           = "watchdog",
> -	.fops           = &ds1374_wdt_fops,
> -};
> -
> -static struct notifier_block ds1374_wdt_notifier = {
> -	.notifier_call = ds1374_wdt_notify_sys,
> +static const struct watchdog_ops ds1374_wdt_ops = {
> +	.owner          = THIS_MODULE,
> +	.start          = ds1374_wdt_start,
> +	.stop           = ds1374_wdt_stop,
> +	.set_timeout    = ds1374_wdt_settimeout,
>  };
> -
> -#endif /*CONFIG_RTC_DRV_DS1374_WDT*/
> +#endif /*CONFIG_WATCHDOG_CORE*/
>  /*
>   *****************************************************************************
>   *
> @@ -651,17 +514,23 @@ static int ds1374_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> -#ifdef CONFIG_RTC_DRV_DS1374_WDT
> -	save_client = client;
> -	ret = misc_register(&ds1374_miscdev);
> +#ifdef CONFIG_WATCHDOG_CORE
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
> @@ -670,11 +539,6 @@ static int ds1374_probe(struct i2c_client *client,
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

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
