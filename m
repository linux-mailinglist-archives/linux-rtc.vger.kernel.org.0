Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8192F5F22
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbhANKoO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:44:14 -0500
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:30449
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726224AbhANKoN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 05:44:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOfkOquWNsKP28In7xWPSUKVdgXFlrXiPhVdN5jdnOFNEj0WPh2YVY8dTR4bgCeyAEswQu+M3UGblIM3ODnS4aOcRF3KCfe9dgCC3GPuhKtZS1S3ECQBgRFW4T3nsmBEstcLm9xIM4jRVNgwIo73Fgn/HvHoYxmoGSRY7bHUXZ1fC9QQX6rrhnAWVO8ud0RO2JJ7ZlGwUgP0kfBJ6LQTfehbys4NzgR6uIoU+8p5j22bqSYlP2e1heFJgApoPj1WUVvHdEtfAA/HwRRW7nDbWHnxTxJH8nwIe6rqj0lBfHq8H/Zsk/SJ8XZb/ymcxMM6tIwkdYeWnaWghwv077ROow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWCthnb8alUNXlozKJtA/t5Shxkk0NLlqkVvPy8axvE=;
 b=SOgJvJoPR2Bl4PYBq4bKPeWY5T6WZyPQ1uX0gCWZ6LVW4I2D6vbQD6m2kzKDXhRxDZ/PetKX/kTy/unwobGwZzxp0ZmjFb48fptPpK72seS8eGIf5eBYN7nLfbq8PBlDXWElttfjqDFZK+K1DOP1Jo4TUB7Hzrp0vxxPLPjh2gOtU47J7Jx1AI4tkCjAOTadtG10lQBQ+0ncISllAac01ofuJIT3Z/AiBvlBtaxim/nZ4Y5DpiZVTYyjjHH7p/LIqwg2yCTjo1wD3vLpnysc4DHFLT4BXTnm+QCvNOK1/YWHpq/EOZisoUJOSpK3hcoylpWjy5YGd0mhg0ogjVS0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWCthnb8alUNXlozKJtA/t5Shxkk0NLlqkVvPy8axvE=;
 b=ho5FTXxfha+Y80EBbEgwy7cNUlE+heBtKn4n0NA7LJwMwDpfHE3umxUhz7MJy0WUggy1oXwJvCaezgCXwM6DGG2uuKBrafWF9VTHBDiO+3DMJG4Xw89mj70P11M9zPj6K6Xxa59zMhmin4PqysD5U7XOvKc4C646hfGt0gHCmKA=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0532.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:169::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 10:43:23 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 10:43:23 +0000
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
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <4f5a806d-ca18-cd94-33ea-86e8a84e345a@kunbus.com>
Date:   Thu, 14 Jan 2021 11:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114093325.GU3654@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM8P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::29) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM8P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 10:43:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7068fa0-6fb6-484e-a6e8-08d8b87937a7
X-MS-TrafficTypeDiagnostic: AM0P193MB0532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0P193MB05328592374F0893501217329FA80@AM0P193MB0532.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/cBl7iKtyj/yJ2OeSTiVb6e7v4SxrXALfp7QZtDJkYuB92YpsqiAoEoBpw+8MbgwfY491BAmXCPCkXEO56ZhtrNjW/hwnLqmfT56wGcWaQelE82bRYrHZDfKHmlb9xxrM5JaAiS2BMyVHeOY9Q83A43ImpQPtV8cXOfipV3rSM3Ykaqu8k2oZG5BIjssW+UsLnyJNl1niFVhGdnP1XGQgkGa+aQ3tw0ns0VBZMQNQr9yCDBLiqjg9IrrH2OWObW6PybZkDEKVvqTLmyfFTSaNRi+hUi8Chqv8AJbbjc2qZTBX7EuE/1BrSgRCEiJWSYLIulFyKbkXkEav6oy4xoJUiYmiAF9iqVb8QDIobUEkXqcwvHZkhjhMLJzW4L6s2/doPiq4pjOUN6W5Fa8hgRS4ePf81wKpu3krBo7bZq8gajWHsmc8O5j1K5eVRTBx20FxHb0MGEfU4AtVr5tHWtRKb1sOa/GDIG20oogPOpPYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(366004)(376002)(396003)(136003)(52116002)(36756003)(16526019)(31686004)(186003)(2616005)(6486002)(26005)(53546011)(8676002)(5660300002)(478600001)(31696002)(86362001)(4326008)(54906003)(8936002)(16576012)(316002)(6916009)(83380400001)(66476007)(956004)(66946007)(66556008)(66574015)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enNpOXI2RlpJVXAwUGFKTGZxVHlhc1ZpR3QreUpGM29IMHhhOW1QbEdqTWlZ?=
 =?utf-8?B?VDFpcUltZ1pnd2JEM3cxdjJCUUJhSTR5aUF1TGJGVlNpNXNrTmduM09yR3p4?=
 =?utf-8?B?a25OOHJ0VWg5V0RHRm5jaXIwMGR4b1pUbG9rajBsR2s0czRnN3YxY25qT3Jh?=
 =?utf-8?B?a1pkNitvTElvQnBabTVQQkREeklmQk9FK1NtMTFabUFsMUYxQmtnczJGbWNm?=
 =?utf-8?B?YisvczlSRHhyeEszWVA3L1RBWjBTUG9CdnlNSGVWVTk0UzB4U3hSQ0hwNGFl?=
 =?utf-8?B?dW4ycG9FelhiekQyVlBNQzQyTTRWSkIreURiL3NoOWVpcHhaZjdJMFZGVHdO?=
 =?utf-8?B?bDRvd0FoSTFMSWw0VDQ3aFNUQXlIcVpCMytyL1NlYjJmOGZEUDVHOC8zZXZJ?=
 =?utf-8?B?UzNZYzNLMDdmUmUveE9WUG5NT01QRUJSY3pjenJwSFVEclA1eThITlFocnQy?=
 =?utf-8?B?MnM3L2hmS2sxTzh5TmI1VHNROUF0bzZvQXpqb1FKUkJjbU1EWEk3MXBZbDhm?=
 =?utf-8?B?bnhFV2ZDSG1DK3NxM0twcU9paVMyZTFxSTRlenVlWkQxTFAxc0xDTjlrLzlm?=
 =?utf-8?B?VXVONE1WUDlJSWNINFFVYk16aHQyRzhUQmlleUZ5Q1BrTlR2TFVOelEzbWJY?=
 =?utf-8?B?SUN1QXJXeFFxbWh2YWIyTEx1ZmZ4NS9XdmNQRkJDTGg2Ym1sdHduVm52OThM?=
 =?utf-8?B?WTIyL0dmZ0RZZGMvZ3ZxOHluOEFKM2VDbFNIZFcvaUpKYzBYUUdFTmNRWFFt?=
 =?utf-8?B?bUxsVG45bkxsOFNpb2xEUW9DS3FmVG43Smc4RSt2ckkrYVo0aUYwRUZPZTM4?=
 =?utf-8?B?WWVjZGd6QmQ2VkgzbGYxaVlYWklKUjUrYlBSVkRKZFJqcnNXOUsvTFRCTFlx?=
 =?utf-8?B?K1NUcGh0aVhvSW45QlNNaHUwR2p1Y05kNk9jWHJDcUo4eUptLzlhOVpvbDdV?=
 =?utf-8?B?T0ZlZ3YzVGwvSVFyRXV1TVE4OTUyNUhObWVKeDZlUVNJRTMrZjhKMG9jdmJI?=
 =?utf-8?B?ak5qSkgxUm5JN28vYXpPQWtLZUUyTTFzT3NBa0h0WmQrdHQ1bmpPSitjVEF5?=
 =?utf-8?B?c2k4Mk5tSE9ONE9QbjlhYW81UTZWN250eHdOR0liZWF4aENjOFAzZWM1Vlhz?=
 =?utf-8?B?T2svcjhRNWtHY1VMWWh2bXl6djRYRG5XTld1N2FLSDllMW1vY0JvRjU1OVc1?=
 =?utf-8?B?UktIZzM0RE1ZakNHNlQxZWRBeXpPd096emFrZDlxZUgzaVQ3aXNMRU9COUdH?=
 =?utf-8?B?eGdQd3lyU3R1Uk16OTVhcVFLZVN4c25MWmhyUTFCdkVHYmxDaG45YlByUHFQ?=
 =?utf-8?Q?M7GpDvS9O8CSRRQYhKgrmkEp/PyZtj6i1n?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 10:43:23.2842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: d7068fa0-6fb6-484e-a6e8-08d8b87937a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytlsSw/pNx77EKy7uoETP85es10tymBr9vy3EXAQqzvPxpiTgTxktrHDZALUgDav8TCGtCbHbksrvOxE7fpNBHy0cIsCOpSxjwasIQgGFns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0532
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14.01.21 10:33, Alexandre Belloni wrote:
> Hi,
> 
> On 14/01/2021 10:10:32+0100, Philipp Rosenberger wrote:
>>
>>
>> On 14.01.21 09:05, Uwe Kleine-König wrote:
>>> On Wed, Jan 13, 2021 at 12:27:41PM +0100, Philipp Rosenberger wrote:
>>>> To resume normal operation after a total power loss (no or empty
>>>> battery) the "Power-On Reset Override (PORO)" facility needs to be
>>>> disabled.
>>>>
>>>> As the oscillator may take a long time (200 ms to 2 s) to resume normal
>>>> operation. The default behaviour is to use the PORO facility.
>>>
>>> I'd write instead: The register reset value sets PORO enabled and the
>>> data sheet recommends setting it to disabled for normal operation.
>>
>> Sounds good, I will rephrase it.
>>
>>> In my eyes having a reset default value that is unsuitable for
>>> production use is just another bad design choice of this chip. At least
>>> now this is known and can be somewhat fixed in software. :-\
>>
>> Yes, had my fair share of WTF moments with this chip.
>>
>>>> But with the PORO active no interrupts are generated on the interrupt
>>>> pin (INT).
>>>
>>> This sentence about no interrupts is your observation, or does this base
>>> on some authoritative source (datasheet, FAE or similar)?
>>>
>>
>> Yes this is only may observation. I tested this with the OM13513 demoboard
>> with PCF2127 and pcf2129. So I should rephrase it to something like this:
>>
>> Some testes suggests that no interrupts are generated on the interrupt pin
>> if the PORP is active.
>>
>>>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>>>> ---
>>>>    drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>>>> index 39a7b5116aa4..378b1ce812d6 100644
>>>> --- a/drivers/rtc/rtc-pcf2127.c
>>>> +++ b/drivers/rtc/rtc-pcf2127.c
>>>> @@ -26,6 +26,7 @@
>>>>    /* Control register 1 */
>>>>    #define PCF2127_REG_CTRL1		0x00
>>>> +#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
>>>>    #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
>>>>    /* Control register 2 */
>>>>    #define PCF2127_REG_CTRL2		0x01
>>>> @@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>>>    		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>>>>    	}
>>>> +	/*
>>>> +	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
>>>> +	 * after power on. For normal operation the PORO must be disabled.
>>>> +	 */
>>>> +	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
>>>> +				PCF2127_BIT_CTRL1_POR_OVRD);
>>>> +	/*
>>>> +	 * If the PORO can't be disabled, just move on. The RTC should
>>>> +	 * work fine, but functions like watchdog and alarm interrupts might
>>>> +	 * not work. There will be no interrupt generated on the interrupt pin.
>>>> +	 */
>>>> +	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
>>>> +	if (ret <= 0) {
>>>> +		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
>>>> +		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
>>>
>>> I would not emit two messages here. Also including __func__ isn't so
>>> nice IMHO. (Great for debugging, but not in production code IMHO.)
>>
>> Yes, I dislike the style of the messages in this module. I just thought to
>> keep it consistent.
> 
> No one will ever read the message, the whole test is useless.

Sorry, if I bother you with may questions. I'm unsure of why do you 
think the test is useless. Is it because it is unlikely to happen? Or 
that it is not relevant to report this?

>>
>> I'm thinking of rewriting this driver as MFD driver. We use the CLKOUT for
>> some products. So maybe a RTC, watchdog and clock driver on top of an MFD.
>> But I'm not sure if it is really a good idea. The behavior of the chip to
>> disable the watchdog when reading ctrl2 (i think it was) giving me a
>> headache.
> 
> Don't, this is not an MFD. There is no issue with having the RTC driver
> being a clock provider.

OK, this is a clear statement.

Best Regards,
Philipp
