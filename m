Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EE3210D0D
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2020 16:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgGAOFk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 Jul 2020 10:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729503AbgGAOFj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 Jul 2020 10:05:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E93C08C5C1;
        Wed,  1 Jul 2020 07:05:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a14so6481930pfi.2;
        Wed, 01 Jul 2020 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d7mNpyjBdNbPq08cUTTZ5TQaFmfSbdKaKV8+BkIO3Bc=;
        b=Mi40lH9cIEyETUJG6k0h+bQrI+fmdP3kRWA/GgiJHD4FYFLl1NBVhqv1pS5/9gk7NG
         oQcA0xZxNPnF28hGM4VF0xO3O9UmZn5PeyXcNqvUagzoIXoMm5Ymq1vEBWOF6BDsw6dv
         G9Pb/NSseOOS8Gd375mYlNtkSEQ23uXX9v0h/CUdYQdkMDBol28K34tzge29HtVsd6N3
         uk/ya/LhS2Ws/hLBujlfbxCAVOVEJWHw45Hj+VafRiSCxPf1xfh0zUaiNJWzoAj+4OtZ
         hF+8AjLLMb8k/t/aqgK1r+pstao8ZM3TqDggud2KqYUi8pHbS8/msOEE6nYcNhCIo5EG
         MvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d7mNpyjBdNbPq08cUTTZ5TQaFmfSbdKaKV8+BkIO3Bc=;
        b=e1rfJD6XYA/vDjTnea7LfgGz7CzpJ/jqLHy/NEKOgz8KyEaN7xmCjC75VjCKiy+PSe
         kg8X6GScmkmfG9PUPf+QO3u6pw6bKAVs4+x+DrmcFDBuW8nUhideeextGWubTagbP4pp
         46LD6BhzK/Q7BBso6JzDfmmpFxbanSxKBhwMFI0v33okBIh+eR+ehHhg2U2A0OqhZkN2
         hbjDLHtljjlIIzFMLRH2DZGyHapAUtLk5Fm9M2vZ7xwdIy3RfScyQDbRGoIbVkQoGjte
         mYBzcF9fbPTOCbeaRW6bQmmE2yeZOIyZ6M6XbVw3IEIMsHEis2zgc4UcSj9e66fbp3yQ
         keYQ==
X-Gm-Message-State: AOAM531To5YVOk8fBIVwMkdaWu4cUpvKKzmjApoRwCbYXt3HThu/XXIi
        lMGsPJKppCAqf2dpYH50Jcu74jEt
X-Google-Smtp-Source: ABdhPJwO2atCrhTO+rMFMTIZGDvxw37I8cvFN5HcdkrjgXmDflcVQDJ3pP8OeXWyylfsia5DAhvGUg==
X-Received: by 2002:a05:6a00:78a:: with SMTP id g10mr6588518pfu.0.1593612338658;
        Wed, 01 Jul 2020 07:05:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r8sm6075308pfg.147.2020.07.01.07.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 07:05:37 -0700 (PDT)
Subject: Re: [PATCH] rtc: ds1374: wdt: Use watchdog core for watchdog part
To:     =?UTF-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <HK2PR01MB3281311E985BB6ED61B545FDFA6C0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <cde71ac3-2747-cb8e-6a25-15a3e182da4a@roeck-us.net>
Date:   Wed, 1 Jul 2020 07:05:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <HK2PR01MB3281311E985BB6ED61B545FDFA6C0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=big5
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/1/20 3:09 AM, Johnson CH Chen (³¯¬L¾±) wrote:
> Let ds1374 watchdog use watchdog core. It also includes
> improving watchdog timer setting and nowayout, and just uses ioctl()
> of watchdog core.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> ---
>  drivers/rtc/rtc-ds1374.c | 257 ++++++++++-----------------------------
>  1 file changed, 67 insertions(+), 190 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..25b28f7546ff 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * RTC client/driver for the Maxim/Dallas DS1374 Real-Time Clock over I2C
>   *
> @@ -6,11 +7,7 @@
>   *
>   * Copyright (C) 2014 Rose Technology
>   * Copyright (C) 2006-2007 Freescale Semiconductor
> - *
> - * 2005 (c) MontaVista Software, Inc. This file is licensed under
> - * the terms of the GNU General Public License version 2. This program
> - * is licensed "as is" without any warranty of any kind, whether express
> - * or implied.
> + * Copyright (C) 2005 (c) MontaVista Software, Inc.
>   */

The above should be a separate patch.

>  /*
>   * It would be more efficient to use i2c msgs/i2c_transfer directly but, as
> @@ -46,6 +43,7 @@
>  #define DS1374_REG_WDALM2	0x06
>  #define DS1374_REG_CR		0x07 /* Control */
>  #define DS1374_REG_CR_AIE	0x01 /* Alarm Int. Enable */
> +#define DS1374_REG_CR_WDSTR	0x08 /* 1=INT, 0=RST */
>  #define DS1374_REG_CR_WDALM	0x20 /* 1=Watchdog, 0=Alarm */
>  #define DS1374_REG_CR_WACE	0x40 /* WD/Alarm counter enable */
>  #define DS1374_REG_SR		0x08 /* Status */
> @@ -71,7 +69,9 @@ struct ds1374 {
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
> @@ -257,7 +257,8 @@ static int ds1374_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>  		goto out;
>  
>  	/* Disable any existing alarm before setting the new one
> -	 * (or lack thereof). */
> +	 * (or lack thereof).
> +	 */

Unrelated (and cosmetic). Drop or separate patch.

>  	cr &= ~DS1374_REG_CR_WACE;
>  
>  	ret = i2c_smbus_write_byte_data(client, DS1374_REG_CR, cr);
> @@ -371,14 +372,21 @@ static const struct rtc_class_ops ds1374_rtc_ops = {
>   */
>  static struct i2c_client *save_client;
>  /* Default margin */
> -#define WD_TIMO 131762
> +#define TIMER_MARGIN_DEFAULT  32

Parameter alignment is off. Please use tab after TIMER_MARGIN_DEFAULT.

> +#define TIMER_MARGIN_MIN	1
> +#define TIMER_MARGIN_MAX	(60*60*24) /* one day */

Real limits are necessary. The old limit was 16777216/4096 = 4096 seconds.

Ok, time to look up the datasheet. The counter is a 24-bit value.
The maximum value is thus 0xffffff, or 16777215. 16777215 / 4096 = 4095,
which should be the maximum timeout in seconds to set here.

>  
>  #define DRV_NAME "DS1374 Watchdog"
>  
> -static int wdt_margin = WD_TIMO;
> -static unsigned long wdt_is_open;
> -module_param(wdt_margin, int, 0);
> -MODULE_PARM_DESC(wdt_margin, "Watchdog timeout in seconds (default 32s)");
> +static int timeout = TIMER_MARGIN_DEFAULT;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default 32s)");

This changes the module parameter which may be unexpected.
I would suggest to keep using wdt_margin.

> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default ="
> +		__MODULE_STRING(WATCHDOG_NOWAYOUT)")");
> +
>  
>  static const struct watchdog_info ds1374_wdt_info = {
>  	.identity       = "DS1374 WTD",
> @@ -386,57 +394,61 @@ static const struct watchdog_info ds1374_wdt_info = {
>  						WDIOF_MAGICCLOSE,
>  };
>  
> -static int ds1374_wdt_settimeout(unsigned int timeout)
> +static int ds1374_wdt_settimeout(struct watchdog_device *wdt,
> +					unsigned int timeout)

This fits into one line (new line length limit)

>  {
> -	int ret = -ENOIOCTLCMD;
> -	int cr;
> +	int ret, cr;
> +
> +	wdt->timeout = timeout;
>  
> -	ret = cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> +	cr = i2c_smbus_read_byte_data(save_client, DS1374_REG_CR);
> +	ret = cr;
>  	if (ret < 0)
> -		goto out;
> +		return ret;
>  
Assignment to ret is pointless. Just return cr if negative.

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
> +static int ds1374_wdt_ping(struct watchdog_device *wdt)
>  {
>  	u32 val;
> -	int ret = 0;
>  
> -	ret = ds1374_read_rtc(save_client, &val, DS1374_REG_WDALM0, 3);
> -	if (ret)
> -		pr_info("WD TICK FAIL!!!!!!!!!! %i\n", ret);
> +	return ds1374_read_rtc(save_client, &val, DS1374_REG_WDALM0, 3);
> +}
> +
> +static int ds1374_wdt_start(struct watchdog_device *wdt)
> +{
> +	return ds1374_wdt_ping(wdt);

Unnecessary. Just declare the start function and drop the ping function.
See Documentation/watchdog/watchdog-kernel-api.rst

>  }
>  
> -static void ds1374_wdt_disable(void)
> +static int ds1374_wdt_stop(struct watchdog_device *wdt)
>  {
>  	int cr;
>  
> @@ -444,162 +456,17 @@ static void ds1374_wdt_disable(void)
>  	/* Disable watchdog timer */
>  	cr &= ~DS1374_REG_CR_WACE;
>  
> -	i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
> +	return i2c_smbus_write_byte_data(save_client, DS1374_REG_CR, cr);
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
> -};
> -
> -static struct miscdevice ds1374_miscdev = {
> -	.minor          = WATCHDOG_MINOR,
> -	.name           = "watchdog",
> -	.fops           = &ds1374_wdt_fops,
> +static const struct watchdog_ops ds1374_wdt_fops = {

s/fops/ops/

Those are not file operations.

> +	.owner          = THIS_MODULE,
> +	.start          = ds1374_wdt_start,
> +	.stop           = ds1374_wdt_stop,
> +	.ping           = ds1374_wdt_ping,
> +	.set_timeout    = ds1374_wdt_settimeout,
>  };
>  
> -static struct notifier_block ds1374_wdt_notifier = {
> -	.notifier_call = ds1374_wdt_notify_sys,
> -};
>  
>  #endif /*CONFIG_RTC_DRV_DS1374_WDT*/
>  /*
> @@ -653,15 +520,25 @@ static int ds1374_probe(struct i2c_client *client,
>  
>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
>  	save_client = client;
> -	ret = misc_register(&ds1374_miscdev);
> -	if (ret)
> -		return ret;
> -	ret = register_reboot_notifier(&ds1374_wdt_notifier);
> +	ds1374->wdt.info = &ds1374_wdt_info;
> +	ds1374->wdt.ops = &ds1374_wdt_fops;
> +	ds1374->wdt.timeout = TIMER_MARGIN_DEFAULT;
> +	ds1374->wdt.min_timeout = TIMER_MARGIN_MIN;
> +	ds1374->wdt.max_timeout = TIMER_MARGIN_MAX;
> +
> +	watchdog_init_timeout(&ds1374->wdt, timeout, &client->dev);
> +	watchdog_set_nowayout(&ds1374->wdt, nowayout);
> +	watchdog_stop_on_reboot(&ds1374->wdt);
> +	watchdog_stop_on_unregister(&ds1374->wdt);
> +
> +	ret = devm_watchdog_register_device(&client->dev, &ds1374->wdt);
>  	if (ret) {
> -		misc_deregister(&ds1374_miscdev);
> +		dev_err(&client->dev, "failed to register DS1374 watchdog device\n");
>  		return ret;
>  	}
> -	ds1374_wdt_settimeout(131072);
> +
> +	ds1374_wdt_settimeout(&ds1374->wdt, timeout);

You'll want to do that before registering the watchdog to avoid a
race condition.

> +	dev_info(&client->dev, "DS1374 watchdog device enabled\n");
>  #endif
>  
>  	return 0;
> @@ -670,10 +547,10 @@ static int ds1374_probe(struct i2c_client *client,
>  static int ds1374_remove(struct i2c_client *client)
>  {
>  	struct ds1374 *ds1374 = i2c_get_clientdata(client);
> +
>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
> -	misc_deregister(&ds1374_miscdev);
> -	ds1374_miscdev.parent = NULL;
> -	unregister_reboot_notifier(&ds1374_wdt_notifier);
> +	dev_warn(&client->dev, "Unregister DS1374 watchdog device\n");

Noise.

> +	watchdog_unregister_device(&ds1374->wdt);

Drop: The watchdog was registered using devm_watchdog_register_device().

>  #endif
>  
>  	if (client->irq > 0) {
> 

