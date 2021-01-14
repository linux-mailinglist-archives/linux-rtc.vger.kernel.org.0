Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72EF2F5D15
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 10:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbhANJQe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 04:16:34 -0500
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:20035
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726374AbhANJQ1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 04:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIBsGU8NXlB3jdQ3yDGBt0D8ME24bkcy+AGRAT3Ts3fS9Oo6gZZoiHucBjr9d8YrFOq711voQQN5iAGJtdN2K0zyzyY30VAFb6mN0tVUb4F6dnJxn315LybOqgCGqQLi2Fsfja581p2kSBeYeLLL3xyJjmIpqyFUUDwUHL+pyDA+bQbQP8MFlHrmTaCeO3uxU1j3D3Pb80F85sFm51c0My4C8iwBqKC4EcrpSPVkdJCCL+dNFBkX5YGvYB/LKwW5FfKSGi/smaHG8p+6eqXDiwZuOyybQdvGW5xFghUklKiNPDynAULPsEWiN39YMMBFEYf0fEY1AATzqRwTM3u8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLNSSjSkHji4RLYKuCrFI5ixnNPnCsrz5MUGWn6mvtQ=;
 b=nHe95fmCotN3SY86RVuJKd8HK1483/vipHfU52YwAKSjCOmzRf0TFWe9xmLvKtNuAANxy8ZDkxaM2zYfBhy9xVmKSHvt3GIJttFZdmeIQJ8uy8qztdtPc+CZeWxc+Md0lUJ5ivRhwEfbEuLQK9jxjgxqptdstB9N4noubjM9QliJqDwm1GeHnLbhBfuiy+Y0hB4PwBh/DDv+Xsh1ukWXrpcrssb8U67VvADCLBw4jMVw0vKW/x3+1ApCJVx598AbJ18+hFzqbzIuRAPEIOH0cG7itY5J9M7u3CYLAJNrlrH6OgoStTZyd+y2VLQrjT0O1WG/SCDvGIEglNtgmhE8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLNSSjSkHji4RLYKuCrFI5ixnNPnCsrz5MUGWn6mvtQ=;
 b=rlMms4B2+bZk74MEoths8yWjNdxdSuun9l8uyzT2GcXiujyGhcWeKkDeOoCNWIwmFvZY1/HNFSw5i9Z3VtdrBwIZBJTG6JgIljOHS4HwEmABz2dNBOQJBTNqKOwk+gOnb6Ohv5f+f5Y/bvQ9NHK7EJmgN6JQ8ZEhQPQ/wVoqQ3Q=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0548.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 09:15:36 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 09:15:36 +0000
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-3-p.rosenberger@kunbus.com>
 <20210114080656.ee7fdqufu2biyy4y@pengutronix.de>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <3ee1bb68-7fab-7921-f713-66f7f931d941@kunbus.com>
Date:   Thu, 14 Jan 2021 10:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114080656.ee7fdqufu2biyy4y@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::26) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM0PR01CA0157.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:15:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 101b7c9f-b0e8-4200-aff9-08d8b86cf430
X-MS-TrafficTypeDiagnostic: AM0P193MB0548:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0P193MB05484B7B914A27C3858226EF9FA80@AM0P193MB0548.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+WKLQC5Aqft2dFFsU/lAlVje5XlN8TfRuluzZtQlz8a/74yiBFmjGLMFw4luKRFSWYfJZxOyDkjAvp3pcHtvUG+85hzDVhnjjTa1b0Ae9K+cVSaZIGbPYjJUoVk54oyEEiQGeLkjxKa51HzrjILgavZQzAr5r8Xl7yT9g9n9UfsjX2lJNFtEjw2GsIJiox3f0BHAxRP5QsjBcoAMXvh45UO33U6oWLuh0yrM5WyUnU6bWFKGR9S+9Vztxj/5u5xk5+BhaFfj0qpcZpecALXijx78SryQ0BolN1kxQoHVCy8kS2KXn2j6mCyCRgi7UhltqHXuC0behbzTpbg96jCcGBz29aj/rxcH+USxg2mgDwy51hqLUkIOrJOcxdgdQ9Zc7V1JLsh3t1uYbiv3RapqK/IL0VBVdWGCw1oum7rVmEAXh8uuN5n8xepLBFx/uIP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(366004)(136003)(316002)(86362001)(6486002)(66946007)(66476007)(16576012)(66556008)(6916009)(31686004)(36756003)(8676002)(26005)(956004)(4326008)(53546011)(2616005)(31696002)(478600001)(186003)(54906003)(2906002)(16526019)(6666004)(5660300002)(52116002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?ra03arBl+zFI4FEN9tmrniiJGYOuodKfPN0Q04t79S5XomwmFHHA2uEi?=
 =?Windows-1252?Q?q36TwRvBjcV6kQ3CbDRAS5aF2ITQvGLvR39hplQM9WDYpTjiCqYnA/0C?=
 =?Windows-1252?Q?cUoJaYWnQsTQzoMhKYPIlznaLLXP4aym1trwTkDNjDduKlELE2GuirlD?=
 =?Windows-1252?Q?gsSlJYGTnZv0sJj7QXSuhjEqAnxfWSuUnjbNd6hcFnp4WoJc+WjgdZYQ?=
 =?Windows-1252?Q?pd4sZqYDSoBcAf+z2xbHjcKPAhmKaGUPO14yYdgHwPL0tkzslA0HyZ+d?=
 =?Windows-1252?Q?0EG7q19fXFhCwG367rDsTGj+Hs8B7U562uV5Gkm1uKftLL5ecgMjOrRD?=
 =?Windows-1252?Q?2pGCvr7YUZ2Nk4QcDA0Bkft4ka9YOKNPXRoWukOTPlCBxFcqLfy1vxqI?=
 =?Windows-1252?Q?hR1Ani/FD4S0FIxxaXuoMO9OY7AnFohg+elMmKjVGknQ8e6wAv1e/9Ft?=
 =?Windows-1252?Q?bYh+bU8URsFofeGm7SEY4KKNcfNPSWkp3xDDvhVkRITNq4OoXUqYFsfP?=
 =?Windows-1252?Q?vetzIOAY85rTm5sTId2flygYulDSH9SXc7yGXmc4WHLXYDmEUckuuFnk?=
 =?Windows-1252?Q?S4KWmTPab34F6SxOx4AE4BeHrGvsawePEnP5EebLvzywbcjs4ASP/Ul8?=
 =?Windows-1252?Q?tzBFHZDTHsG52AdWXDKGXCNIaPWXinwuShs5SRmIt6NruoC4Hpac/gAK?=
 =?Windows-1252?Q?t7tZD3tTfZX8psQMnXQZw0EzHQQhDWgPWRECMtJ7yQTlQOKXCz1KqLlQ?=
 =?Windows-1252?Q?6rCt3uojYSVvNPS2BC940zfeFJENtwOg5iTwfqwI0qPVlr4T3IbJ3N/b?=
 =?Windows-1252?Q?VwXsjjAluG7bdwBIZAd4zuZgz9xkiA7e/5GPJ/kr/4lGEkFiRPHhW+BY?=
 =?Windows-1252?Q?ZBe0pLI0Mx4FIxxGynCsmZCtbZvdIRUMl1WU1PjdgfMUmSeliEIFoUI4?=
 =?Windows-1252?Q?xC2HAG2YOG6R+bHRWz8l3PBRcuR2ZfY8fXSVWN/jtYs+um5juNCLUqG7?=
 =?Windows-1252?Q?n8cMQFZZ0LskwAIG7eZP1Aem0WhJiv7PSkP1d8bZV+LfFWn9sCs/6jv+?=
 =?Windows-1252?Q?WHhBN2+uElvgpuD4?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:15:36.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 101b7c9f-b0e8-4200-aff9-08d8b86cf430
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+zyjRi5N3Q7fvwgRejj1y0e2NzKosf2TAQlfbwEYphNHYPd6Bo0KfXQmtQFtn/qVvt1yRnVKAFgyN71r8zo0n/eE3uxxEzAFDJUBB2TiyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0548
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 14.01.21 09:06, Uwe Kleine-König wrote:
> On Wed, Jan 13, 2021 at 12:27:42PM +0100, Philipp Rosenberger wrote:
>> The datasheet of the PCF2127 states,it is recommended to process an OTP
> 
> s/,/, /

ACK

> 
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
>> +		return ret;
>> +	}
>> +	msleep(100);
> 
> This unconditional sleep isn't so nice. Maybe it makes sense to only do
> this when the chip reports a power loss?

Right, will change that

> Best regards
> Uwe
> 

Best Regards,
Philipp
