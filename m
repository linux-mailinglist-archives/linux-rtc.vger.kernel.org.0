Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816B12F5F8C
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 12:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbhANLMt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 06:12:49 -0500
Received: from mail-eopbgr150058.outbound.protection.outlook.com ([40.107.15.58]:61375
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726472AbhANLMs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 06:12:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9phjVf9PilAvQZ6pjWjCxt8rOSK6G9eDopdjLX57VH9gQyfhPcDfThmaqu7cL/aZB6RYq7+zkJXbMq0mwpXDSflfVmbGdBHB+/9cHt9CmIXrmSdkMLyGo1Xmy4mqsrdkx2mY2y4Md/dUw4kzA/J9fdu5SKi44nSEN4QHElu1ChDtzb36vz+lz+AM0OPf/KhhrTPJd/8Ac66x8pjUBKjmgwMRZ7t4nMC7jQYSql0NXAWdBed5Kn5zL/Y6ICu1ugUXJVfGKXFWIOk0rhFC0uvo7EJNUsQuvS8CE95WYpTEbJfVhbR9qFxQNZVQBj3aPVbjREyaQkx335T7nqAGfTQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4HXGdbVs5qrRiRyDm2q/AruA+NgHQ02asE+tUUD0mo=;
 b=hWfZyGNSteKUtj/B1IwhvDVVyNbXxVnBK9q50Mv5dwxk+DpEUcTotfH/pJ2JPxGBwvhkJ+KO8rgYo7oMK1xX/lOQf7GJvEojNXSCgbPsJkXIWoXpUdTWZPGtq7j6myxyQID87DJcXyyPN1Px/rIsvA0dcbOT4zywNpGVfrgRIS2eAe622B3kPc77b1wBrtM/a5asgLRIyl3eqoiSWQZ36ZXLULvGazsAp0HD6QJnApbrhtB69As6+nmpqAe3uAE46dNHVgx3zS5CvrSPBF8vA3Cp/LFDi89I6cT4DMH8XIJizPO1fBnqjJj/0JevWyJzuignVQYV7eafzEkvGjyx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4HXGdbVs5qrRiRyDm2q/AruA+NgHQ02asE+tUUD0mo=;
 b=h7tmjmRCXXlHrCbVCYxtUmHZN/ch+AlB3Zm1jw2C2dQhWsVXkEYeZjvoE6CcQOxpJiaYqHB5OWt5OS+F9q6iYrXSuZNl6ukUBM4cJLFvwmdTnJvnprChAVnwFC1l1ZX8BIZXROyiu3+ksmvYv2XDVMdBZb98R1cGJmjYo+O5xNU=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM9P193MB0872.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 11:12:00 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 11:12:00 +0000
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: Disable Power-On Reset Override
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-2-p.rosenberger@kunbus.com>
 <20210114080533.tnipsnqfxeqotvlg@pengutronix.de>
 <39a69676-83f2-07f4-99ae-ce4f89d5314c@kunbus.com>
 <20210114093325.GU3654@piout.net>
 <4f5a806d-ca18-cd94-33ea-86e8a84e345a@kunbus.com>
 <20210114105344.GW3654@piout.net>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <2bbee1b4-f2f8-a187-df06-83daa46bd9a2@kunbus.com>
Date:   Thu, 14 Jan 2021 12:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114105344.GW3654@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR03CA0097.eurprd03.prod.outlook.com
 (2603:10a6:208:69::38) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM0PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:208:69::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 11:11:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e04749fb-f544-40ff-ef8e-08d8b87d36b4
X-MS-TrafficTypeDiagnostic: AM9P193MB0872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9P193MB0872F6D8D928E19FB7EC6B489FA80@AM9P193MB0872.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQ7W5w988lTg46q4J21grIKjE1BWvB/1J2979yYx68wxxBQANpiuGEaEr/R3r1zbGjxwXfnjyMIap+ATbXzvrCZy273AX23qKzX3q31HMCvH1pqfEVFRo6wpI76hknUS5d37Dx4eVgWCy0I62q8cEiuHjoLapnOQT8LXzPQ3Z7bZZ+HTEuWOzIRjBlabRh21L9ngWOWuH7fdZNd+vq84vSUv2NJQ5XhdRmgF+7/Gl6Q4hRMJkJStewjQ89IbxV96XVEUXk9pi/vkbrhmnAf2un8VtgBgGocsp30z6gUsdRt5b7CzlwTbf6hT2kFqKOf/Q+bpp3Pt/Un6VGwPHpCcPcel64qwm+m4be5Po7G71Wyiyt4R+mMP8IqLiM6kutw3EGKh5FV3ctXRFHxmkgwonX/2EqO1IAB6qd8IBBv1QDxDKWbuRJsc+iba7BNukqVukrfqwRkH6wmOcqKN9dd2pzmurySQMlPmeq3OfCxiifk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(136003)(346002)(366004)(956004)(8676002)(52116002)(2906002)(186003)(66476007)(83380400001)(2616005)(478600001)(16526019)(66556008)(66574015)(86362001)(36756003)(26005)(66946007)(6916009)(6486002)(16576012)(54906003)(5660300002)(316002)(4326008)(53546011)(8936002)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekVjcWlSaTBhdFo5OHBEaHdnYmRzaVFQL1Z4a1dlL2tkS3oreFJnOHo3anMy?=
 =?utf-8?B?NnppaWpINW5CSmdsTXJMSkY0V0R3elRSSmpwTjM3Y0dFMWp1K2Eyb3RVQ1Fm?=
 =?utf-8?B?dkJvTE1BSk4zQzk4dHEvZ3psYlhrY0pVN21Cdk1qRFUrelhSV3VMb3FmMHJ2?=
 =?utf-8?B?Qi9MbldpcE9NbDNMQWNUNFNuMzlqWThZN3VqMUZNWHBYSzdIYVJsQWVjVXNq?=
 =?utf-8?B?OTA2ZUQ3eFBEd0p5ZlQyMGxpZTJpZlBZaElyTzZySmJoS2NuU3RjUUhGeVVJ?=
 =?utf-8?B?UHhIY2NvNGlySnlxR3NNVjMvUmRyZGtxUEFzamNhV1VvbFVudjVabkhHM1hH?=
 =?utf-8?B?QzdLUklCVDh2MkxMR2xEQ1NQdlJ5czhOblRKRlBKMGExUDJRRjhUKzhJaGpM?=
 =?utf-8?B?cjN4cXBveC9KbmYxNzRNeFA5aldQdVBYMDZrQ3NjV0dZVVI1WDF6bHpUZjZU?=
 =?utf-8?B?a2YrTFJ6dFJiSmpKTFZDb1NUSUpRcTBRTVJCSkNtY1g2NUpoaGtrUEtHdEdn?=
 =?utf-8?B?eWJGZzUya3phT0czNy9kZ0JJSmlheUpReWxhb1FMLzBJODRmQlJxTENWUEJM?=
 =?utf-8?B?S1Q0TnRocllEei8zdnkyZlZGKytVcmlZWnlSVm50cTRuWklrcWVHdzJDM0wv?=
 =?utf-8?B?SEc5NnRvcDhFVENDbjRzNUxKQXc1NG1pMG9rUyt5cjc5MTVpUHpWdWFjVS9v?=
 =?utf-8?B?dHp2NHZ0TGwwMXoyNlFLNGIyTlMyNmZDdFRzNlg2emR6ZVJOQmxodHM0Wml2?=
 =?utf-8?B?NWh4cEpySmV5ekJUZzBjcUh6NVpJbTFNT1ZXWklJd2xYRytEWlJnNFBKWit1?=
 =?utf-8?B?MVhzcHZiSEFMMnNISHd3TURKc2pDM3pWV0MybWlGekFCc2hMYVZtOU5nL3Rr?=
 =?utf-8?B?SDZlcmJIbGFwN3BrcW54WUpxOC80MzBWNDZMRmE5YkxFWUZJQ2ZTaDAyNGtG?=
 =?utf-8?B?cSt5YTJvNWxhREljNGo3SFltKzFjRysyU2tUVGM3MmYxd0lOR2NBNnMxc1pU?=
 =?utf-8?B?WWV1NkNVZlk1N1ZPZkliaUFIbjJXSXZLdE15NEZzbUZHVzRGYnNLUTFYbUV1?=
 =?utf-8?B?MDNHU3hWdlhuTE91WUYzUGovdzFHcmtSbW5UU2tiSUUyWUFSVjdscUNvV0VY?=
 =?utf-8?B?aEN2TElmYTZUNDE1K205ZkJpRHNlZEd0bno1MkJCWkFwVExmNm1IUWt0QnFr?=
 =?utf-8?B?c3p3UzRwb252aDhab28yOCtkUkozU0VrdDY2N1JTTDFoRndjM0tQQ29QUTBx?=
 =?utf-8?B?aHNqek9FWTdXTko1eVRCaE8raDQ1U28xRFNXWGdGdHJRY1FISXNIQk5BSkdx?=
 =?utf-8?Q?pn+xr7bw2HEIWXmXjWCmA4zrbw5yKoPKCr?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 11:12:00.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: e04749fb-f544-40ff-ef8e-08d8b87d36b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ChcbzpDj21cop5/aPg5r6bsuTDsRtuoMxxIUM/k9lZCLGfJ316/uxOvZBoOgsPVEtXxQTo2s971pg+mLY8AIVwPaqn1Fq1K6DVh3Rns6uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0872
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 14.01.21 11:53, Alexandre Belloni wrote:
> On 14/01/2021 11:43:22+0100, Philipp Rosenberger wrote:
>> On 14.01.21 10:33, Alexandre Belloni wrote:
>>> Hi,
>>>
>>> On 14/01/2021 10:10:32+0100, Philipp Rosenberger wrote:
>>>>
>>>>
>>>> On 14.01.21 09:05, Uwe Kleine-König wrote:
>>>>> On Wed, Jan 13, 2021 at 12:27:41PM +0100, Philipp Rosenberger wrote:
>>>>>> To resume normal operation after a total power loss (no or empty
>>>>>> battery) the "Power-On Reset Override (PORO)" facility needs to be
>>>>>> disabled.
>>>>>>
>>>>>> As the oscillator may take a long time (200 ms to 2 s) to resume normal
>>>>>> operation. The default behaviour is to use the PORO facility.
>>>>>
>>>>> I'd write instead: The register reset value sets PORO enabled and the
>>>>> data sheet recommends setting it to disabled for normal operation.
>>>>
>>>> Sounds good, I will rephrase it.
>>>>
>>>>> In my eyes having a reset default value that is unsuitable for
>>>>> production use is just another bad design choice of this chip. At least
>>>>> now this is known and can be somewhat fixed in software. :-\
>>>>
>>>> Yes, had my fair share of WTF moments with this chip.
>>>>
>>>>>> But with the PORO active no interrupts are generated on the interrupt
>>>>>> pin (INT).
>>>>>
>>>>> This sentence about no interrupts is your observation, or does this base
>>>>> on some authoritative source (datasheet, FAE or similar)?
>>>>>
>>>>
>>>> Yes this is only may observation. I tested this with the OM13513 demoboard
>>>> with PCF2127 and pcf2129. So I should rephrase it to something like this:
>>>>
>>>> Some testes suggests that no interrupts are generated on the interrupt pin
>>>> if the PORP is active.
>>>>
>>>>>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>>>>>> ---
>>>>>>     drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
>>>>>>     1 file changed, 18 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>>>>>> index 39a7b5116aa4..378b1ce812d6 100644
>>>>>> --- a/drivers/rtc/rtc-pcf2127.c
>>>>>> +++ b/drivers/rtc/rtc-pcf2127.c
>>>>>> @@ -26,6 +26,7 @@
>>>>>>     /* Control register 1 */
>>>>>>     #define PCF2127_REG_CTRL1		0x00
>>>>>> +#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
>>>>>>     #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
>>>>>>     /* Control register 2 */
>>>>>>     #define PCF2127_REG_CTRL2		0x01
>>>>>> @@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>>>>>     		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>>>>>>     	}
>>>>>> +	/*
>>>>>> +	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
>>>>>> +	 * after power on. For normal operation the PORO must be disabled.
>>>>>> +	 */
>>>>>> +	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
>>>>>> +				PCF2127_BIT_CTRL1_POR_OVRD);
>>>>>> +	/*
>>>>>> +	 * If the PORO can't be disabled, just move on. The RTC should
>>>>>> +	 * work fine, but functions like watchdog and alarm interrupts might
>>>>>> +	 * not work. There will be no interrupt generated on the interrupt pin.
>>>>>> +	 */
>>>>>> +	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
>>>>>> +	if (ret <= 0) {
>>>>>> +		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
>>>>>> +		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
>>>>>
>>>>> I would not emit two messages here. Also including __func__ isn't so
>>>>> nice IMHO. (Great for debugging, but not in production code IMHO.)
>>>>
>>>> Yes, I dislike the style of the messages in this module. I just thought to
>>>> keep it consistent.
>>>
>>> No one will ever read the message, the whole test is useless.
>>
>> Sorry, if I bother you with may questions. I'm unsure of why do you think
>> the test is useless. Is it because it is unlikely to happen? Or that it is
>> not relevant to report this?
> 
> It is not relevant because no action will be taken by the user following
> this message.

I can't really agree on that. As I consider myself a user. And I spend 
some time on debugging the watchdog of this chip as I didn't get any 
error or warning.
It is your subsystem, so you make the rules. But I don't like the idea 
of a watchdog which silently fails. But if you insist on removing this 
test I will do so.

Best Regards,
Philipp

>>
>>>>
>>>> I'm thinking of rewriting this driver as MFD driver. We use the CLKOUT for
>>>> some products. So maybe a RTC, watchdog and clock driver on top of an MFD.
>>>> But I'm not sure if it is really a good idea. The behavior of the chip to
>>>> disable the watchdog when reading ctrl2 (i think it was) giving me a
>>>> headache.
>>>
>>> Don't, this is not an MFD. There is no issue with having the RTC driver
>>> being a clock provider.
>>
>> OK, this is a clear statement.
>>
>> Best Regards,
>> Philipp
> 
