Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B2221A3B7
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2020 17:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgGIP2L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Jul 2020 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgGIP2L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Jul 2020 11:28:11 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57090C08C5CE;
        Thu,  9 Jul 2020 08:28:11 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so1117474pgc.8;
        Thu, 09 Jul 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WylchBfGGLMzx3ZzERebZby/QP/QB8eRJGUJW1Q7JZ8=;
        b=p5spxUWFsNi5HwqwxSCvJuoRlkLMCVExTlXY8K3oNmOE5xgU4elb6WgeMbN5qWpXVY
         +uVduHvrRFitgzgql5fGcEyThXi56X0YbWmcJ0EILbpDykX5bEEEvqM3C6fW9aZe6P6G
         XS2shukMZhNTe31DkvV6mzEUO8OtEMWgUjpbUCvEOAnZjLRB6jt+NnkcZ9v8Lkph5H2N
         Hn2GEDRg2Uhw5ov3IDIEVhOGjLk/U5iMUWN+cFYqBkJ/YR1Xq1mhPEqymJpf9+C5FaGl
         WhnXhyoojaMQcNHL0Ffpv1WnYEaZnUahz6N4uldRqwzZDH6rFs9/K9Es8DVCFrp7VCB/
         gahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WylchBfGGLMzx3ZzERebZby/QP/QB8eRJGUJW1Q7JZ8=;
        b=phcNRpIzOcKjlfC7NtazK1vvTYMvPlbZ/nMwbVsET2S0QwNbLCQolNWJDg26HZJC6y
         UvsQ/4zvDx1Q+rvT4X4KvX8NK8bST7YxnXrDqgiFRw0ZJkeKiRNDeMxABHWPCCuHBVCo
         Fv3JoGgSEZ1noTOnZKXUym3xqQPxGrAHvKnj2t1Aa9VMzjCvIUTqE4eB+VTNIHaQ64Xk
         hqKlgVbslmWAllSAU1kwvbfbOada/wsWsWee63zUDs5QdXgxmWdodjALL5jiXuFzEQi6
         Is10snbstWFmMVpqADCqzQs0BXCy+BP8b698jeN/VZ5WdS7BB4P1zenVjWye96Qq16N1
         CaGw==
X-Gm-Message-State: AOAM531bC3cxUQO7i2ffbssfd1dbwXXLzn/iF2tZEG9hWfkcEdd2wkc9
        uY87YJddQgVj8WBVToJZmwMwRv+f3h0=
X-Google-Smtp-Source: ABdhPJwkE6R1r6f9kxqbCDr8RYFhE2F4eWjoWE8o1bChozVjjDkAxha8/Y73jw4XM4iwl14zv0Zxag==
X-Received: by 2002:a65:64c5:: with SMTP id t5mr49606615pgv.28.1594308490556;
        Thu, 09 Jul 2020 08:28:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c187sm3103864pfc.146.2020.07.09.08.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 08:28:10 -0700 (PDT)
Subject: Re: [PATCH v4] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
To:     =?UTF-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
References: <HK2PR01MB328182D5A54BFAA8A22E448AFA640@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9643e71a-0819-eff6-80b2-04dd7d879d16@roeck-us.net>
Date:   Thu, 9 Jul 2020 08:28:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <HK2PR01MB328182D5A54BFAA8A22E448AFA640@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=big5
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/8/20 11:34 PM, Johnson CH Chen (³¯¬L¾±) wrote:
> Let ds1374 watchdog use watchdog core functions. It also includes
> improving watchdog timer setting and nowayout, and just uses ioctl()
> of watchdog core.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
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
>  drivers/rtc/Kconfig      |   1 +
>  drivers/rtc/rtc-ds1374.c | 258 +++++++++------------------------------
>  2 files changed, 62 insertions(+), 197 deletions(-)
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
> index 9c51a12cf70f..c71065d26cd2 100644
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
> @@ -369,238 +372,98 @@ static const struct rtc_class_ops ds1374_rtc_ops = {
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
>  #endif /*CONFIG_RTC_DRV_DS1374_WDT*/
>  /*
>   *****************************************************************************
> @@ -652,16 +515,22 @@ static int ds1374_probe(struct i2c_client *client,
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
> 

