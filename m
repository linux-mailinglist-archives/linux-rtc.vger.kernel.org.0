Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4D06B0E7A
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 17:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjCHQUt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 11:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjCHQUm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 11:20:42 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F61EC1C36
        for <linux-rtc@vger.kernel.org>; Wed,  8 Mar 2023 08:20:38 -0800 (PST)
Message-ID: <ac8895ab-68cb-1250-199e-4758e44e740a@gentoo.org>
Date:   Wed, 8 Mar 2023 11:20:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.0
Subject: Re: [PATCH 11/41] rtc: ds1685: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-12-u.kleine-koenig@pengutronix.de>
 <9e2df07f-92d3-966a-5092-22572e102253@gentoo.org>
 <20230306212218.qzer65c74rb7d6yy@pengutronix.de>
 <00ee8bf1-478b-fdba-7938-221dbefd40f2@gentoo.org>
 <20230307081118.rociwbzuk6dl7fwu@pengutronix.de>
From:   Joshua Kinard <kumba@gentoo.org>
In-Reply-To: <20230307081118.rociwbzuk6dl7fwu@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 3/7/2023 03:11, Uwe Kleine-König wrote:
> Hello Joshua,
> 
> On Mon, Mar 06, 2023 at 09:09:03PM -0500, Joshua Kinard wrote:
>> On 3/6/2023 16:22, Uwe Kleine-König wrote:
>>> On Mon, Mar 06, 2023 at 02:43:20PM -0500, Joshua Kinard wrote:
>>>> On 3/4/2023 08:29, Uwe Kleine-König wrote:
>>>>> The .remove() callback for a platform driver returns an int which makes
>>>>> many driver authors wrongly assume it's possible to do error handling by
>>>>> returning an error code. However the value returned is (mostly) ignored
>>>>> and this typically results in resource leaks. To improve here there is a
>>>>> quest to make the remove callback return void. In the first step of this
>>>>> quest all drivers are converted to .remove_new() which already returns
>>>>> void.
>>>>>
>>>>> Trivially convert this driver from always returning zero in the remove
>>>>> callback to the void returning variant.
>>>>>
>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>> ---
>>>>>     drivers/rtc/rtc-ds1685.c | 6 ++----
>>>>>     1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
>>>>> index 5db9c737c022..0f707be0eb87 100644
>>>>> --- a/drivers/rtc/rtc-ds1685.c
>>>>> +++ b/drivers/rtc/rtc-ds1685.c
>>>>> @@ -1322,7 +1322,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
>>>>>      * ds1685_rtc_remove - removes rtc driver.
>>>>>      * @pdev: pointer to platform_device structure.
>>>>>      */
>>>>> -static int
>>>>> +static void
>>>>>     ds1685_rtc_remove(struct platform_device *pdev)
>>>>>     {
>>>>>     	struct ds1685_priv *rtc = platform_get_drvdata(pdev);
>>>>> @@ -1344,8 +1344,6 @@ ds1685_rtc_remove(struct platform_device *pdev)
>>>>>     	rtc->write(rtc, RTC_EXT_CTRL_4A,
>>>>>     		   (rtc->read(rtc, RTC_EXT_CTRL_4A) &
>>>>>     		    ~(RTC_CTRL_4A_RWK_MASK)));
>>>>> -
>>>>> -	return 0;
>>>>>     }
>>>>>     /*
>>>>> @@ -1356,7 +1354,7 @@ static struct platform_driver ds1685_rtc_driver = {
>>>>>     		.name	= "rtc-ds1685",
>>>>>     	},
>>>>>     	.probe		= ds1685_rtc_probe,
>>>>> -	.remove		= ds1685_rtc_remove,
>>>>> +	.remove_new	= ds1685_rtc_remove,
>>>>>     };
>>>>>     module_platform_driver(ds1685_rtc_driver);
>>>>>     /* ----------------------------------------------------------------------- */
>>>>
>>>> Is there a future planned patch that would remove the .remove member
>>>> and then rename .remove_new --> .remove?
>>>
>>> The eventual plan is to do
>>>
>>> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
>>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>>> index 77510e4f47de..1c65943d6b53 100644
>>> --- a/drivers/base/platform.c
>>> +++ b/drivers/base/platform.c
>>> @@ -1420,14 +1420,8 @@ static void platform_remove(struct device *_dev)
>>>    	struct platform_driver *drv = to_platform_driver(_dev->driver);
>>>    	struct platform_device *dev = to_platform_device(_dev);
>>> -	if (drv->remove_new) {
>>> -		drv->remove_new(dev);
>>> -	} else if (drv->remove) {
>>> -		int ret = drv->remove(dev);
>>> -
>>> -		if (ret)
>>> -			dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
>>> -	}
>>> +	if (drv->remove)
>>> +		drv->remove(dev);
>>>    	dev_pm_domain_detach(_dev, true);
>>>    }
>>> index b845fd83f429..8c5fdaa8645f 100644
>>> --- a/include/linux/platform_device.h
>>> +++ b/include/linux/platform_device.h
>>> @@ -209,15 +209,16 @@ struct platform_driver {
>>>    	int (*probe)(struct platform_device *);
>>>    	/*
>>> -	 * Traditionally the remove callback returned an int which however is
>>> +	 * Traditionally the remove callback returned an int which however was
>>>    	 * ignored by the driver core. This led to wrong expectations by driver
>>>    	 * authors who thought returning an error code was a valid error
>>> -	 * handling strategy. To convert to a callback returning void, new
>>> -	 * drivers should implement .remove_new() until the conversion it done
>>> -	 * that eventually makes .remove() return void.
>>> +	 * handling strategy. .remove_new is a hangover from these times which
>>> +	 * will be dropped once all drivers are converted to .remove().
>>>    	 */
>>> -	int (*remove)(struct platform_device *);
>>> -	void (*remove_new)(struct platform_device *);
>>> +	union {
>>> +		void (*remove)(struct platform_device *);
>>> +		void (*remove_new)(struct platform_device *);
>>> +	};
>>>    	void (*shutdown)(struct platform_device *);
>>>    	int (*suspend)(struct platform_device *, pm_message_t state);
>>>
>>> and then once all the drivers are converted back to .remove() drop the
>>> union and .remove_new().
>>>
>>> Best regards
>>> Uwe
>>>
>>
>> This looks like a pretty simple/minor API change.  Why not just do a patch
>> series that makes both the API change and updates all of the drivers at once
>> (one commit per driver)?
> 
> A bit of statistic: Based on v6.3-rc1 I have 2286 patches like the ones
> from this series that (mostly) convert drivers that today already return
> zero unconditionally. Then there is my todo-list of ~100 additional
> drivers that don't return 0 that need manual inspection and fixing.
> 
> So we're talking about 2300+ drivers in all subsystems here. To get a
> bisectable series that does the complete conversion, we need:
> 
> 	2300 patches to convert drivers to .remove_new()
> 	the above patch
> 	2300 patches to convert drivers back to the new .remove()
> 
> Last time I sent a series with ~640 patches (for a similar conversion
> for i2c drivers) people were unlucky already and I got tons of bounces.
> Please consider the address list for the cover letter. While most
> patches are trivial this would require a massive coordination.
> 
> So no, this isn't a sensible suggestion. I'll continue to send out
> conversions to .remove_new() per subsystem and once most of them are
> converted, the above patch will be sent with the remainder of the
> unapplied patches.
> 
> Best regards
> Uwe

I was actually thinking more along the lines of doing one patch series per subsystem, so for RTC, ~160 
patches, one per rtc-*.c driver making the change to have .remove() be void, plus a patch to adjust the struct 
platform_driver rtc definition itself.  That way you don't have to have that interval period where drivers are 
carrying around the .remove_new() method, cause I've seen instances in the past where such large-scale changes 
could not be completed in a single kernel development cycle.

But it sounds like you've already got a plan worked out, so your call on how you want to handle this.  Thanks 
for the additional clarification!

Acked-By: Joshua Kinard <kumba@gentoo.org>

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And our lives slip away, moment by 
moment, lost in that vast, terrible in-between."

         --Emperor Turhan, Centauri Republic

