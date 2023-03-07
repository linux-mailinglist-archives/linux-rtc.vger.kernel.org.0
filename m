Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DD16AD46D
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Mar 2023 03:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjCGCJK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 21:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjCGCJJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 21:09:09 -0500
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B2632CF4
        for <linux-rtc@vger.kernel.org>; Mon,  6 Mar 2023 18:09:07 -0800 (PST)
Message-ID: <00ee8bf1-478b-fdba-7938-221dbefd40f2@gentoo.org>
Date:   Mon, 6 Mar 2023 21:09:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.0
Subject: Re: [PATCH 11/41] rtc: ds1685: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-12-u.kleine-koenig@pengutronix.de>
 <9e2df07f-92d3-966a-5092-22572e102253@gentoo.org>
 <20230306212218.qzer65c74rb7d6yy@pengutronix.de>
From:   Joshua Kinard <kumba@gentoo.org>
In-Reply-To: <20230306212218.qzer65c74rb7d6yy@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 3/6/2023 16:22, Uwe Kleine-König wrote:
> On Mon, Mar 06, 2023 at 02:43:20PM -0500, Joshua Kinard wrote:
>> On 3/4/2023 08:29, Uwe Kleine-König wrote:
>>> The .remove() callback for a platform driver returns an int which makes
>>> many driver authors wrongly assume it's possible to do error handling by
>>> returning an error code. However the value returned is (mostly) ignored
>>> and this typically results in resource leaks. To improve here there is a
>>> quest to make the remove callback return void. In the first step of this
>>> quest all drivers are converted to .remove_new() which already returns
>>> void.
>>>
>>> Trivially convert this driver from always returning zero in the remove
>>> callback to the void returning variant.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>>    drivers/rtc/rtc-ds1685.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
>>> index 5db9c737c022..0f707be0eb87 100644
>>> --- a/drivers/rtc/rtc-ds1685.c
>>> +++ b/drivers/rtc/rtc-ds1685.c
>>> @@ -1322,7 +1322,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
>>>     * ds1685_rtc_remove - removes rtc driver.
>>>     * @pdev: pointer to platform_device structure.
>>>     */
>>> -static int
>>> +static void
>>>    ds1685_rtc_remove(struct platform_device *pdev)
>>>    {
>>>    	struct ds1685_priv *rtc = platform_get_drvdata(pdev);
>>> @@ -1344,8 +1344,6 @@ ds1685_rtc_remove(struct platform_device *pdev)
>>>    	rtc->write(rtc, RTC_EXT_CTRL_4A,
>>>    		   (rtc->read(rtc, RTC_EXT_CTRL_4A) &
>>>    		    ~(RTC_CTRL_4A_RWK_MASK)));
>>> -
>>> -	return 0;
>>>    }
>>>    /*
>>> @@ -1356,7 +1354,7 @@ static struct platform_driver ds1685_rtc_driver = {
>>>    		.name	= "rtc-ds1685",
>>>    	},
>>>    	.probe		= ds1685_rtc_probe,
>>> -	.remove		= ds1685_rtc_remove,
>>> +	.remove_new	= ds1685_rtc_remove,
>>>    };
>>>    module_platform_driver(ds1685_rtc_driver);
>>>    /* ----------------------------------------------------------------------- */
>>
>> Is there a future planned patch that would remove the .remove member
>> and then rename .remove_new --> .remove?
> 
> The eventual plan is to do
> 
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 77510e4f47de..1c65943d6b53 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1420,14 +1420,8 @@ static void platform_remove(struct device *_dev)
>   	struct platform_driver *drv = to_platform_driver(_dev->driver);
>   	struct platform_device *dev = to_platform_device(_dev);
>   
> -	if (drv->remove_new) {
> -		drv->remove_new(dev);
> -	} else if (drv->remove) {
> -		int ret = drv->remove(dev);
> -
> -		if (ret)
> -			dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
> -	}
> +	if (drv->remove)
> +		drv->remove(dev);
>   	dev_pm_domain_detach(_dev, true);
>   }
> index b845fd83f429..8c5fdaa8645f 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -209,15 +209,16 @@ struct platform_driver {
>   	int (*probe)(struct platform_device *);
>   
>   	/*
> -	 * Traditionally the remove callback returned an int which however is
> +	 * Traditionally the remove callback returned an int which however was
>   	 * ignored by the driver core. This led to wrong expectations by driver
>   	 * authors who thought returning an error code was a valid error
> -	 * handling strategy. To convert to a callback returning void, new
> -	 * drivers should implement .remove_new() until the conversion it done
> -	 * that eventually makes .remove() return void.
> +	 * handling strategy. .remove_new is a hangover from these times which
> +	 * will be dropped once all drivers are converted to .remove().
>   	 */
> -	int (*remove)(struct platform_device *);
> -	void (*remove_new)(struct platform_device *);
> +	union {
> +		void (*remove)(struct platform_device *);
> +		void (*remove_new)(struct platform_device *);
> +	};
>   
>   	void (*shutdown)(struct platform_device *);
>   	int (*suspend)(struct platform_device *, pm_message_t state);
> 
> and then once all the drivers are converted back to .remove() drop the
> union and .remove_new().
> 
> Best regards
> Uwe
> 

This looks like a pretty simple/minor API change.  Why not just do a patch series that makes both the API 
change and updates all of the drivers at once (one commit per driver)?  It gets it done and out of the way and 
you don't have to worry about fixing things later on.  I've seen far more intrusive changes done via patch 
series before with little resistance.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And our lives slip away, moment by 
moment, lost in that vast, terrible in-between."

         --Emperor Turhan, Centauri Republic

