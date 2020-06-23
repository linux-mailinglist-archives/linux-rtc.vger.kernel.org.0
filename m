Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165C720534C
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jun 2020 15:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732629AbgFWNUe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jun 2020 09:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732580AbgFWNUe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jun 2020 09:20:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2DFC061573;
        Tue, 23 Jun 2020 06:20:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so10061559pfi.13;
        Tue, 23 Jun 2020 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eAYulPUk9vJGqhCnoVz6cakBG1YIc1l1bNLgYnK84s4=;
        b=Ne8CXheIjPCT4j/2NG/cAMtFX8k4jY9iQ0+4KrIWGsmMjF++pGLW6WNkZqMkS8I4aL
         2nIZHGjcFK1wxCTcY73pfTid4p2unQNg6ZHmEuyhghjNBK+ZvevHe1D5nU8iuDseJyKK
         198DL07vrFZ31/GVBAqMsSUcjBMPU0FXhyVWIDWAV7wohPWghUvhNkSN6pFXT3nszX6i
         j1eZPakWOBprzJnBt9fQYyiqtwpLtVnDhprpvJkF6ebMkUg01V24J/JqBgfHE6EfNH84
         isPgNHc1fpsms4QFTElRzUyjd+q4w38wwHHJ8rMjBW/weR1vqEzv870k5epryRnh5OoH
         6b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eAYulPUk9vJGqhCnoVz6cakBG1YIc1l1bNLgYnK84s4=;
        b=nG9Whn516DN9YGkPKP2wZqVMNTNl1KD9Y7lLOfHJBD6YwpjBWnK5Qp9rXoizhR596V
         dU3Eq2k7gp5FbfuGl1Zwc7LVa1HuXDXeyh1ScHXh7AhZErfTQeUBXpw0KhzXIKTEE08Y
         rRhVST7haPYt7uUsNMSZSfL/c3sp7s3CNCPnx0rWrvpZvNIZY0fqE1ocLYwckk1yu/vr
         hXrQ1pWcMZTMzcgxHiwGy7n5OHnwi8us0h9M5McR0T8fnML+VrjQzTDiq88+QWOGqbXu
         9lbvHVqOqR1o1Pi5bJ3bqc//UwTDs9c8eZQ37EhAyKMtOusV/MaKNNdolPsnFInIi/E0
         MebA==
X-Gm-Message-State: AOAM533wrD7+CeBG3MV98o4yUQZFTO8UScn5BTOXjwiAZNsD9FEkYhPd
        EFBGBmxjsn3j/7G6OZb8oPYdVZ35
X-Google-Smtp-Source: ABdhPJxSPbMrF9mxKkux+iRwVwQxFiMHDL5GYab9J0xXrU6nHGrJ6i3x3uh918fGtRlFcDX0j3pvrw==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr17430776pgb.15.1592918433409;
        Tue, 23 Jun 2020 06:20:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b24sm16635928pfo.112.2020.06.23.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 06:20:32 -0700 (PDT)
Subject: Re: [PATCH 3/3] watchdog: ds1374_wdt: Introduce Dallas/Maxim DS1374
 Watchdog driver
To:     =?UTF-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lee Jones <lee.jones@linaro.org>
References: <HK2PR01MB3281885DA5822E1D10ACD07CFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <9af288a5-b2a2-c36b-1b28-6a0b925b4a68@roeck-us.net>
 <HK2PR01MB328183C5595B0BD046146B41FA940@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <de352d8e-7c91-6f8e-5d0d-93497a830940@roeck-us.net>
Date:   Tue, 23 Jun 2020 06:20:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <HK2PR01MB328183C5595B0BD046146B41FA940@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=big5
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 6/22/20 11:28 PM, Johnson CH Chen (³¯¬L¾±) wrote:
> Hi,
> 
> Thanks for your good detailed suggestions!
> 

Other feedback suggests to convert the driver to use
the watchdog core in the rtc code. I would suggest to follow
that suggestion.

>>> + * It would be more efficient to use i2c msgs/i2c_transfer directly
>>> +but, as
>>> + * recommened in .../Documentation/i2c/writing-clients section
>>> + * "Sending and receiving", using SMBus level communication is preferred.
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/device.h>
>>> +#include <linux/module.h>
>>> +#include <linux/ioctl.h>
>>> +#include <linux/reboot.h>
>>> +#include <linux/watchdog.h>
>>> +#include <linux/workqueue.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/uaccess.h>
>>
>> Alphabetic order please.
>>
>>> +
>>> +#define DEVNAME                 "ds1374_wdt"
>>> +
>>> +#define DS1374_REG_WDALM0	0x04 /* Watchdog/Alarm */
>>> +#define DS1374_REG_WDALM1	0x05
>>> +#define DS1374_REG_WDALM2	0x06
>>> +#define DS1374_REG_CR		0x07 /* Control */
>>> +#define DS1374_REG_CR_AIE	0x01 /* Alarm Int. Enable */
>>> +#define DS1374_REG_CR_WDSTR     0x08 /* 1=INT, 0=RST */
>>> +#define DS1374_REG_CR_WDALM	0x20 /* 1=Watchdog, 0=Alarm */
>>> +#define DS1374_REG_CR_WACE	0x40 /* WD/Alarm counter enable */
>>> +
>>> +/* Default margin */
>>> +#define WD_TIMO                 131762
>>> +#define TIMER_MARGIN_MIN	4096 /* 1s */
>>> +#define TIMER_MARGIN_MAX	(60*60*24*4096) /* one day */
>>> +
>>> +static int wdt_margin = WD_TIMO;
>>
>> Sjould not be pre-initialized. Also, 131762 isn't 32 seconds, it is 131,762
>> seconds.
>>
> 
> 131762 is 32 seconds actually because watchdog counter increases per 
> 1/4096 seconds for DS1374. If DS1374_REG_CR_WDALM is set to 0 (alarm), 
> alarm counter will increase per 1 second.
> 

The watchdog core keeps timeouts in seconds. For the watchdog core,
131762 is 131,762 seconds. Your code assumes that the watchdog core
does not care about / need to scale, which is wrong. Besides,
MODULE_PARM_DESC below clearly states "Watchdog timeout _in seconds_"
(emphasis added).

>>> +module_param(wdt_margin, int, 0);
>>> +MODULE_PARM_DESC(wdt_margin, "Watchdog timeout in seconds (default
>>> +32s)");
>>> +
>>
>> As a new driver, it would be better to just use the customary "timeout".
>>
>>> +static bool nowayout = WATCHDOG_NOWAYOUT; module_param(nowayout,
>>> +bool, 0); MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped
>> once
>>> +started default ="
>>> +		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +struct ds1374_wdt {
>>> +	struct i2c_client *client;
>>> +	struct watchdog_device *wdt;
>>> +	struct work_struct work;
>>
>> Not used.
>>
>>> +
>>> +	/* The mutex protects alarm operations, and prevents a race
>>> +	 * between the enable_irq() in the workqueue and the free_irq()
>>> +	 * in the remove function.
>>> +	 */
>>
>> There is no workqueue here, and the remove function is not needed.
>>
>>> +	struct mutex mutex;
>>> +};
>>> +
>>> +static const struct watchdog_info ds1374_wdt_info = {
>>> +	.identity       = DEVNAME,
>>> +	.options        = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>>> +						WDIOF_MAGICCLOSE,
>>> +};
>>> +
>>> +static struct watchdog_device ds1374_wdd;
>>> +
>> Move declaration please.
>>
>>> +static int ds1374_wdt_settimeout(struct watchdog_device *wdt,
>>> +					unsigned int timeout)
>>> +{
>>
>> How is this synchronized against accesses by the RTC driver ?
>>
> By original design in rtc-ds1374.c, it seems no synchronized problem between 
> rtc and watchdog, but I think we can add mutex lock to deal with it.
> 
The mutex is used there where needed.

>>> +	int ret = -ENOIOCTLCMD;
>>
>> Not an appropriate error code here.
>>
>>> +	u8 buf[4];
>>> +	int cr, i;
>>> +	struct ds1374_wdt *drv_data = watchdog_get_drvdata(wdt);
>>> +
>>> +	ret = cr = i2c_smbus_read_byte_data(drv_data->client, DS1374_REG_CR);
>>> +	if (ret < 0)
>>> +		goto out;
>>
>> "goto out;" is unnecessary. Just return the error. Same everywhere else below.
>>
>>> +
>>> +	/* Disable any existing watchdog/alarm before setting the new one */
>>> +	cr &= ~DS1374_REG_CR_WACE;
>>> +
>>> +	ret = i2c_smbus_write_byte_data(drv_data->client, DS1374_REG_CR, cr);
>>> +	if (ret < 0)
>>> +		goto out;
>>> +
>>> +	/* Set new watchdog time */
>>> +	for (i = 0; i < 3; i++) {
>>> +		buf[i] = timeout & 0xff;
>>> +		timeout >>= 8;
>>> +	}
>>
>> The value passed to this function from the watchdog core is the timeout in
>> seconds. I don't see a conversion to internal values here.
>>
> 
> For original design in rtc-ds1374.c, ds1374_wdt_settimeout () will call 
> ds1374_write_rtc() to write hardware register. To separate watchdog and rtc 
> functions, expand code from ds1374_write_rtc() here, and final buf[] values 
> will be written into hardware register for DS1374.
> 

ds1374_wdt_settimeout() is an API function, It gets timeouts from the watchdog
core in seconds. Those timeouts have to be converted to chip internal values
in this function.

>>> +
>>> +	ret = i2c_smbus_write_i2c_block_data(drv_data->client,
>>> +						DS1374_REG_WDALM0, 3, buf);
>>> +	if (ret) {
>>> +		pr_info("couldn't set new watchdog time\n");
>>> +		goto out;
>>> +	}
>>
>>> +
>>> +	/* Enable watchdog timer */
>>> +	cr |= DS1374_REG_CR_WACE | DS1374_REG_CR_WDALM;
>>> +	cr &= ~DS1374_REG_CR_WDSTR;/* for RST PIN */
>>> +	cr &= ~DS1374_REG_CR_AIE;
>>> +
>>> +	ret = i2c_smbus_write_byte_data(drv_data->client, DS1374_REG_CR, cr);
>>> +	if (ret < 0)
>>> +		goto out;
>>> +
>>> +	return 0;
>>
>> Pointless. Just return ret.
>>
>> Also, this function needs to store the new timeout in struct watchdog_device.
>>
>>> +out:
>>> +	return ret;
>>> +}
>>> +
>>> +
>>> +/*
>>> + * Read WD/Alarm counter to reload the watchdog timer. (ie, pat the
>>> +watchdog)  */ static int ds1374_wdt_ping(struct watchdog_device *wdt)
>>> +{
>>> +	struct ds1374_wdt *drv_data = watchdog_get_drvdata(wdt);
>>> +	int ret;
>>> +	u8 buf[4];
>>> +
>>> +	ret = i2c_smbus_read_i2c_block_data(drv_data->client,
>>> +						DS1374_REG_WDALM0, 3, buf);
>>> +
>>> +	if (ret < 0 || ret < 3)
>>> +		pr_info("WD TICK FAIL!!!!!!!!!! %i\n", ret);
>>> +
>>
>> This is not an info message, this is an error. Besides, it is just noise.
>> Just return the error and drop the message.
>>
>>> +	return ret;
>>> +}
>>> +
>>> +static int ds1374_wdt_start(struct watchdog_device *wdt) {
>>> +	int ret;
>>> +
>>> +	ret = ds1374_wdt_settimeout(wdt, wdt_margin);
>>
>> This is wrong. The timeout may have been updated by userspace.
>> It is inappropriate to change it back to the default here.
>>
> Thanks, I will keep in mind.
> 
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ds1374_wdt_ping(wdt);
>>
>> Please do not ignore errors.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int ds1374_wdt_stop(struct watchdog_device *wdt) {
>>> +	struct ds1374_wdt *drv_data = watchdog_get_drvdata(wdt);
>>> +	int cr;
>>> +
>>> +	if (nowayout)
>>> +		return 0;
>>
>> Not needed.
>>
> Thanks!, it has been implemented in watchdog_stop().
> 
>>> +
>>> +	cr = i2c_smbus_read_byte_data(drv_data->client, DS1374_REG_CR);
>>> +	/* Disable watchdog timer */
>>> +	cr &= ~DS1374_REG_CR_WACE;
>>> +
>>> +	return i2c_smbus_write_byte_data(drv_data->client, DS1374_REG_CR,
>>> +cr); }
>>> +
>>> +/*
>>> + * Handle commands from user-space.
>>> + */
>>> +static long ds1374_wdt_ioctl(struct watchdog_device *wdt, unsigned int
>> cmd,
>>> +				unsigned long arg)
>>
>> The whole point of using the watchdog subsystem is to not need a local ioctl
>> function - and most definitely not one that duplicates watchdog core
>> functionality.
>>
>>> +{
>>> +	int new_margin, options;
>>> +
>>> +	switch (cmd) {
>>> +	case WDIOC_GETSUPPORT:
>>> +		return copy_to_user((struct watchdog_info __user *)arg,
>>> +		&ds1374_wdt_info, sizeof(ds1374_wdt_info)) ? -EFAULT : 0;
>>> +
>>> +	case WDIOC_GETSTATUS:
>>> +	case WDIOC_GETBOOTSTATUS:
>>> +		return put_user(0, (int __user *)arg);
>>> +	case WDIOC_KEEPALIVE:
>>> +		ds1374_wdt_ping(wdt);
>>> +		return 0;
>>> +	case WDIOC_SETTIMEOUT:
>>> +		if (get_user(new_margin, (int __user *)arg))
>>> +			return -EFAULT;
>>> +
>>> +		/* the hardware's tick rate is 4096 Hz, so
>>> +		 * the counter value needs to be scaled accordingly
>>> +		 */
>>> +		new_margin <<= 12;
>>> +		if (new_margin < 1 || new_margin > 16777216)
>>> +			return -EINVAL;
>>> +
>>> +		wdt_margin = new_margin;
>>> +		ds1374_wdt_settimeout(wdt, new_margin);
>>
>> Is the idea here to bypass the watchdog subsystem's notion of keeping the
>> timeout in seconds ? If so, that would be wrong and unacceptable.
>>
> It seems take care about 4096Hz for original design in rtc-ds1374.c. I think we
> can just use ioctl() which watchdog core provides and input margin time
> appropriately.
> 
> 
>>> +		ds1374_wdt_ping(wdt);
>>> +		fallthrough;
>>> +	case WDIOC_GETTIMEOUT:
>>> +		/* when returning ... inverse is true */
>>> +		return put_user((wdt_margin >> 12), (int __user *)arg);
>>> +	case WDIOC_SETOPTIONS:
>>> +		if (copy_from_user(&options, (int __user *)arg, sizeof(int)))
>>> +			return -EFAULT;
>>> +
>>> +		if (options & WDIOS_DISABLECARD) {
>>> +			pr_info("disable watchdog\n");
>>> +			ds1374_wdt_stop(wdt);
>>> +			return 0;
>>> +		}
>>> +
>>> +		if (options & WDIOS_ENABLECARD) {
>>> +			pr_info("enable watchdog\n");
>>> +			ds1374_wdt_settimeout(wdt, wdt_margin);
>>> +			ds1374_wdt_ping(wdt);
>>> +			return 0;
>>> +		}
>>> +		return -EINVAL;
>>> +	}
>>> +	return -ENOTTY;
>>> +}
>>> +
>>> +static int ds1374_wdt_notify_sys(struct notifier_block *this,
>>> +			unsigned long code, void *unused)
>>> +{
>>> +	if (code == SYS_DOWN || code == SYS_HALT)
>>> +		/* Disable Watchdog */
>>> +		ds1374_wdt_stop(&ds1374_wdd);
>>> +	return NOTIFY_DONE;
>>> +}
>>> +
>> Not needed - see below.
>>
>>> +static struct notifier_block ds1374_wdt_notifier = {
>>> +	.notifier_call = ds1374_wdt_notify_sys, };
>>> +
>>> +static int ds1374_wdt_probe(struct platform_device *pdev) {
>>> +	struct ds1374_wdt *drv_data;
>>> +	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
>>> +	int ret;
>>> +
>>> +	drv_data = devm_kzalloc(&pdev->dev, sizeof(struct ds1374_wdt),
>>> +				GFP_KERNEL);
>>> +	if (!drv_data)
>>> +		return -ENOMEM;
>>> +
>>> +	drv_data->wdt = &ds1374_wdd;
>>> +	drv_data->client = client;
>>> +	mutex_init(&drv_data->mutex);
>>> +
>>> +	watchdog_init_timeout(drv_data->wdt, wdt_margin, &pdev->dev);
>>> +	watchdog_set_nowayout(drv_data->wdt, nowayout);
>>> +
>>> +	watchdog_set_drvdata(drv_data->wdt, drv_data);
>>> +	platform_set_drvdata(pdev, drv_data);
>>> +
>>> +	ret = watchdog_register_device(drv_data->wdt);
>>
>> Use devm_watchdog_register_device()
>>
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "failed to register Watchdog device\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = register_reboot_notifier(&ds1374_wdt_notifier);
>>
>> Call watchdog_stop_on_reboot() before calling watchdog_register_device()
>> instead.
>>
>>> +	if (ret) {
>>> +		watchdog_unregister_device(drv_data->wdt);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ds1374_wdt_settimeout(drv_data->wdt, wdt_margin);
>>
>> Unnecessary here; called from start function.
>>
>>> +	dev_info(&pdev->dev, "Dallas/Maxim DS1374 watchdog device
>>> +enabled\n");
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int ds1374_wdt_remove(struct platform_device *pdev) {
>>> +	struct ds1374_wdt *drv_data = platform_get_drvdata(pdev);
>>> +
>>> +	dev_warn(&pdev->dev, "Unregister DS1374 watchdog device\n");
>>> +	watchdog_unregister_device(drv_data->wdt);
>>> +	unregister_reboot_notifier(&ds1374_wdt_notifier);
>>> +
>>
>> Call watchdog_stop_on_unregister() before calling
>> watchdog_register_device().
>>
>>> +	return 0;
>>> +}
>>> +
>>> +static void ds1374_wdt_shutdown(struct platform_device *pdev) {
>>> +	struct ds1374_wdt *drv_data = platform_get_drvdata(pdev);
>>> +
>>> +	mutex_lock(&drv_data->mutex);
>>> +	ds1374_wdt_stop(drv_data->wdt);
>>> +	mutex_unlock(&drv_data->mutex);
>>
>> Unnecessary and pointless.
>>
>>> +}
>>> +
>>> +static const struct watchdog_ops ds1374_wdt_fops = {
>>> +	.owner          = THIS_MODULE,
>>> +	.start          = ds1374_wdt_start,
>>> +	.stop           = ds1374_wdt_stop,
>>> +	.ping           = ds1374_wdt_ping,
>>> +	.set_timeout    = ds1374_wdt_settimeout,
>>> +	.ioctl          = ds1374_wdt_ioctl,
>>> +};
>>> +
>>> +static struct watchdog_device ds1374_wdd = {
>>> +	.info           = &ds1374_wdt_info,
>>> +	.ops            = &ds1374_wdt_fops,
>>> +	.min_timeout    = TIMER_MARGIN_MIN,
>>> +	.max_timeout    = TIMER_MARGIN_MAX,
>>
>> .timeout should be set here.
>>
>> Also, there can (at least in theory) be more than one ds1374 in the system. The
>> code does not support this case. ds1374_wdd should be moved into struct
>> ds1374_wdt.
>>
> Thanks for good suggestion.
>>> +};
>>> +
>>> +static struct platform_driver ds1374_wdt = {
>>> +	.driver         = {
>>> +		.owner  = THIS_MODULE,
>>> +		.name   = DEVNAME,
>>> +	},
>>> +	.probe          = ds1374_wdt_probe,
>>> +	.remove         = ds1374_wdt_remove,
>>> +	.shutdown       = ds1374_wdt_shutdown,
>>> +};
>>> +
>>> +module_platform_driver(ds1374_wdt);
>>> +
>>> +MODULE_AUTHOR("Johnson Chen <johnsonch.chen@moxa.com>");
>>> +MODULE_DESCRIPTION("Dallas/Maxim DS1374 Watchdog Driver");
>>> +MODULE_LICENSE("GPL"); MODULE_ALIAS("Platform:ds1374_wdt");
>>>
> 
> Best regards,
> Johnson
> 

