Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A332F5EC0
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 11:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbhANKb1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 05:31:27 -0500
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:48364
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725954AbhANKb1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 05:31:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bx/a/BBdtC/UZNalb2RcKHNQiKYmmSoOxRGNFmVAwyrQFB57Pjg63Y7VjW8c/BwvaXEGAtDD37FyeAGpkU4a3ZW/ZA9BleqR4fVgVYImBF2LJEMydV/ZJ3jFiQEXq4qeKcHDcfrM0YOVE5cJULFEJSEeG4O6QFtMcyy8WfN9g/1QNpPEaqClUxua8BztRPGl1Z2B5SuMalTkA9p/EzBWmw74M1t5Dth2sjTvbwHSy629Dr2MJBecCCGcMgXVJRCivHB/4ymPyvuTEpdHNCIG9vzmxhHs7YEaEiji7ZEzsU3PNC9CKNpQqdVu1XJyuA/7THr51ZDT6iuMhy+ozJWkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBiyJesaYJDbc7GV11xI0+3jYJ1j4d+AErJIXUrtXZQ=;
 b=AoJkft69g/ogbPtxpynrXcOkALI2MmodwzN6CReBDm1dpbKK+heKGcHWg8lN2NK7V/y9TEJUkQIuZji3xbuQysFf4tMJ3AW58rH3DS+51k0l/efeMZXdEBe5IqZsW9+QVwj59G1wevFE7ujAHnjzBzjMAethbKiZkGBHYiZ5hOwiKud3PlHOryLrXWk4/mtt0Uro1oDk9mHxCaz0n9aL8T4b7YxOjRAh374VwwZunwQe8HXCgMdOP1DyGKH+oSbo00+LQxxShJacZDyAthnWZ5SJU5t/WNKIHY3gKoajQg1m1zCP16B9NDiWCv10vqcNQ9pjAjxTQ0rRiA0R4Zzgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBiyJesaYJDbc7GV11xI0+3jYJ1j4d+AErJIXUrtXZQ=;
 b=GHdF0rXO2lOQp7ilPe0NdnQnEipU+vaZpk4U6EW17+Nc7ZnSODmeXgLo0gGJVdtvIQ/0OwOHEO1Ceg9AN65Zr20Uf29g4ltnHnO3N1LfceZ9NDDJSKO6DmfV+2dUFLHBjWn8yI51DaXgfCFbhPzf6ikjhgoJ+Z3PwC0J6lWpyrw=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1074.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 10:30:38 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 10:30:38 +0000
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     dan.carpenter@oracle.com, u.kleine-koenig@pengutronix.de,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        l.sanfilippo@kunbus.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-3-p.rosenberger@kunbus.com>
 <20210114095008.GV3654@piout.net>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <77d07f5e-2891-21d6-feee-19e841a8343e@kunbus.com>
Date:   Thu, 14 Jan 2021 11:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114095008.GV3654@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:208:1::48) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM0PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:208:1::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 10:30:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6ceb8f0-aad4-45ed-20ab-08d8b8776f84
X-MS-TrafficTypeDiagnostic: AM8P193MB1074:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB10741CC9D8D8B55B3CB94DBB9FA80@AM8P193MB1074.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTWaokT3oCFKwUWgOVPCXMVP5O2IdGBDeQHHz13/eNAscRfNnQ9s/VVxNckhfSw81ZZgPkhINYMQjscGZzaE8ZSnLKPaeuonH00XAww96hM4NTniNq6+0ReITNbgYz+sv/nR/niBw30a40VFY7b7keRT/nM4P5IPPxI/+Al+fa8AX9snOAokdPX0RGW+cWTtyjKGJzZFSe7yzkcleRTb1ozF50l2idO2Vh5gOq/tAtcgtO5ITxvXNpBrds0IGzeqjT23PBg0EqGJrPHzxdYQKy3G7hm2DZnXJeVI2NjK7wFTRH1TQ4CL1Is8yZ36QeQPNyCXwn2LT6fbOA8bKCDX8musnmmNkXuNZrCKYv9oDxGMTiYkeGh1UNlwLk2etJxrqbUd8lJH9ujyArAiAZZDaaJ3yaShzdYQQnFcEQxGk4ZgREyAtzQA5Bh5wFniAydl3iJXE1BFllrT24cBAZAAUJ6RqXibl88kZUPAQqSSiY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39830400003)(136003)(8936002)(83380400001)(66556008)(52116002)(4326008)(8676002)(956004)(66946007)(31686004)(31696002)(16576012)(5660300002)(16526019)(53546011)(66476007)(2906002)(2616005)(186003)(36756003)(6486002)(478600001)(6916009)(86362001)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUlSd0NSV3BKS1V2RktUQjlsbGhjQVZjVmNhUEhBSmp2cG9wQlB2TFpTQ3pH?=
 =?utf-8?B?YXRwTlhISDF3a1EyL2p1ZUt1Q1dlMENzNHkvTExxa2FFSEh1OFFBeHR0M3g2?=
 =?utf-8?B?blR5RlhIMmdpMzJadkY5Umt1UndmSnIwNzdSejBWSncydzJvRFZWSy9yVHha?=
 =?utf-8?B?Q28xR1FBb3JjL3lXK3hwSm9XMVlTQVE0Nm5EKzEzSzlwTDd4eGw3cDVSVDJM?=
 =?utf-8?B?NXQ2M3lCQkU4TVpsV3ViM3FGZm40eDlXdXFtdzdkTFY1M1dza2xtSkJBNFBZ?=
 =?utf-8?B?RnQ2UTFjM2F2cTJ1MlJ1UzJsTUNlWFNKeFBxZENpdy83ZEx6NUIzVTJTb1hP?=
 =?utf-8?B?cHJ5S0RrOVNMMXN1d0lwQWltbjV5UjJZK3orQzhsNzdiZlZBTmdZTDZQNmU0?=
 =?utf-8?B?d3puYkM0ZUZhczRZV09uaGYrN3U4OVZJcy9pQkk1RUVaRU8rREYwOXB4M2Nk?=
 =?utf-8?B?dDIwWTdWeVEvaUMxU0xJaTIreXo3bzR0YzEzLzM3cndqRWZWTEFoVkhOaGNP?=
 =?utf-8?B?ekhqTTVIb1p0eVFLamdaUW9TOERtUzlmcnIvNlZkYTFUWEkxUDRRSlI2Vkto?=
 =?utf-8?B?K2dVM1dFTldvSVlOcno0Q3RXb2FVSndyU3k4UVRadnB3TjRkR0doTXlGR21O?=
 =?utf-8?B?cDVZRnRoSVNzRTFxbWNTMThpMnlkTFFZajRyL0xURDVNZ0QzSCtxSEt1UjBE?=
 =?utf-8?B?Z0R6ZXBDRXpnRG1LY3dYeG1wdTcwTzc2RTlTSlJocEhISTArY2d4L3pNT1px?=
 =?utf-8?B?SDFDbDhMOGQ2UXE5eGhWUjl3alFWY3JVd01oTlpaeVpyTEd6US80OGJMams2?=
 =?utf-8?B?Uld6QW1HMG8xSTU1RElFeGtiOWZxMWhPTit1M2Vud3V6KzBwbncyTGZaTWQr?=
 =?utf-8?B?Q2pZRlhWMXptSmJTa05FQTBXRkltQWdKczNvNTIrMnJ0NzZkVkNzNk9jWUIv?=
 =?utf-8?B?VmJYMkQ3L2Fhdi9WbTl5N3VVQ3htWDhTOVBoUmFqd3BDNW5TZXJpZUx5R1Vq?=
 =?utf-8?B?QzRSS2c5R28wOUVvdWR6M1FDV1QzaTV2eEhQby9QQUJ3d3ZodFF0dzNMT3FB?=
 =?utf-8?B?d2huMCttNGpTalM1dmhnM0YwUmlYODJRM3pEQnVjWkVwbmZWc2lpYitrNXda?=
 =?utf-8?B?b3d1cyt0L1F4MkE0S2dJamlqMFhQQ2dPalRlTjdpM3RjVFlkaEMyMWdxZnoz?=
 =?utf-8?B?ZE50cCt0eFJUeUtZeCt1MHBob1kwMG1oWHMzbmczaElJZGVUSC9wSzNDNVky?=
 =?utf-8?B?d0YxeVR6MzlEMmdLMDFKQjRGb1A2QndKcnZMbVowZ1U4Q05WdWhTYnJDSEdN?=
 =?utf-8?Q?B/zExlyo8A9QVu8Ln1YLoABubqktMszQt8?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 10:30:38.3160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ceb8f0-aad4-45ed-20ab-08d8b8776f84
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1CRT6FBkJt3HbPyyRNg8lzsORc6bxPWp8/9+4IkhXOd+tnCbxWPGJ5m0T+c4VKce5lp6PiUlsnemCo5qa2t75waa4e12UJu8OWHn9/jYJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1074
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14.01.21 10:50, Alexandre Belloni wrote:
> On 13/01/2021 12:27:42+0100, Philipp Rosenberger wrote:
>> The datasheet of the PCF2127 states,it is recommended to process an OTP
>> refresh once the power is up and the oscillator is operating stable. The
>> OTP refresh takes less than 100 ms to complete.
>>
>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>> ---
>>   drivers/rtc/rtc-pcf2127.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>> index 378b1ce812d6..ca56dba64e79 100644
>> --- a/drivers/rtc/rtc-pcf2127.c
>> +++ b/drivers/rtc/rtc-pcf2127.c
>> @@ -58,6 +58,9 @@
>>   #define PCF2127_REG_ALARM_DM		0x0D
>>   #define PCF2127_REG_ALARM_DW		0x0E
>>   #define PCF2127_BIT_ALARM_AE			BIT(7)
>> +/* CLKOUT control register */
>> +#define PCF2127_REG_CLKOUT		0x0f
>> +#define PCF2127_BIT_CLKOUT_OTPR			BIT(5)
>>   /* Watchdog registers */
>>   #define PCF2127_REG_WD_CTL		0x10
>>   #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
>> @@ -630,6 +633,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>   		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
>>   	}
>>   
>> +	/*
>> +	 * Set the OTP refresh bit unconditionally. If an OTP refresh was
>> +	 * already done the bit is already set and will not rerun the refresh
>> +	 * operation.
>> +	 */
>> +	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
>> +			      PCF2127_BIT_CLKOUT_OTPR);
>> +	if (ret < 0) {
>> +		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
> 
> Please drop this error message.

If I return from the probe with an error, shouldn't there be an error 
message? Or should I ignore the problem at all and don't return from the 
probe?

> 
>> +		return ret;
>> +	}
>> +	msleep(100);
> 
> Maybe this should be done just before setting the time. Or if you want
> to keep it in probe, then you could optimise by not waiting but ensuring
> the time between pcf2127_probe and the first pcf2127_rtc_set_time is
> more than 100ms.
> 

Doing it just before setting the time might be not the best way. The 
watchdog might be used before the OTPR is done.

 From the PCF2129 manual:
| The OTP refresh (see Section 8.3.2 on page 13) should ideally be
| executed as the first instruction after start-up and also after a
| reset due to an oscillator stop.

As I see it this should be done before setting up the watchdog as well. 
So sleeping if the OTPR wasn't done before might be the most viable 
solution.
So I would check the OTPR and only if the OTPR is not set starting an 
OTPR and then sleep 100ms.

Best Regards
Philipp
