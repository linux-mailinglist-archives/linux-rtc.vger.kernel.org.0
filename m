Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BF62F5CF8
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 10:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbhANJLc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 04:11:32 -0500
Received: from mail-eopbgr30075.outbound.protection.outlook.com ([40.107.3.75]:60384
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727274AbhANJL3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 04:11:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVTKOPJp3JUSa7Ny+veYaN8j0dtDNtjNRBV/u0X+/Zk/Y4DW2RuHG/8Riefe5p8/5Ebb07BBiRvs3B6KRJZX6LSSPGZ5Ew5NNm8IEjDnR6dbVYZikj3IGpSwunTEiztDs2WgMY76mi8gY2/p9R6iCOTEfAtJ5jTH7+Z9uGkSc+EmSkD9QLUZ9k26+ZilCVisHj55OySpzVmjMAwBQeNI+5sIiGik+EDn+Fc6u21g2LQZrkl46wKcLD4ZdlySiFNRrImCdO1k+Yoxrt6iiLFioCDRge/by07HlUADIEpI0Y6PUvytbCwXrIuCd/YyPpS8GtrDHzAnQwZMHG7coFefOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Cw5zN6WkPlTLM1TwA/XAxJBEEJF5++sX2usuHW3c4M=;
 b=IBsxTlZk/mb3librYmn1O7E029/tFXV3gJANcthEs8nnkDZz6PK2b3GtXrLPd32kZrqQLluKfi+I+upFjL8a8CQhOwXy2/ZVCWC/PrX6dXfeHb1O17fdU+YeNTwws3JN++0S6L/GubfKikbfbd/ALCROab3cV59hDpvwmT3GWaVRJXMgGrkeVSN+K30nSlVcXQM8qexvSsOQV6iWpLWvowS7q2LyJre2qW84iBI2fVIp4SSKa8iHgrhByKl+jLEtuI0J3OFyfIxfSFrDpiSFmQR53Sj2ZVtWj8ry8cnH6HlAT0lXzrwV7X6ZJdky5BRKl9KTK9cnzXaQzyKDdGm4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Cw5zN6WkPlTLM1TwA/XAxJBEEJF5++sX2usuHW3c4M=;
 b=g/0X00uq5x82Qjpupjj94SmGydPBTJ72sW0s/3D11Wg0tSEZyxUkZtHcDnFS6uLf+kPlaGKhNcX7LHQgWCTH/2iqeoS/9bVjTOTAOYN1RIG++y3mmYBUT1Ttqg3KXyl+lPbo+rS99Y3/iQKtdfAARwwDJICtXSsgdvTd6uSIqO0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0371.EURP193.PROD.OUTLOOK.COM (2603:10a6:208:60::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 09:10:39 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 09:10:39 +0000
Subject: Re: [PATCH v2 1/2] rtc: pcf2127: Disable Power-On Reset Override
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     dan.carpenter@oracle.com, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, l.sanfilippo@kunbus.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-2-p.rosenberger@kunbus.com>
 <20210114080533.tnipsnqfxeqotvlg@pengutronix.de>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <39a69676-83f2-07f4-99ae-ce4f89d5314c@kunbus.com>
Date:   Thu, 14 Jan 2021 10:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114080533.tnipsnqfxeqotvlg@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:208:14::48) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM0PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:208:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:10:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 379e9d76-d480-431b-4baf-08d8b86c4354
X-MS-TrafficTypeDiagnostic: AM0P193MB0371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0P193MB0371E4B12CA39FC1BFEB8F239FA80@AM0P193MB0371.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3jUqd1nGGmjVYcEweu79aHQNMqiBQ+RkdH9JxKikxUbw3ICbjrG7h7plNihDjyZ1OOQIAYNZWD6uc57KuWhfz0x2hUGNwY+E/W8QIN6QbVSwxVMuBFH9AV//8KZpj1KhPkcFs3flEt9ql1uBjlY1R2HPytGZCabxGPpHFgIR/07xACpGuhBlomyicY7NrJttqTXEKBPKWYIajtbuZDat9Fuy88C6TtFIu0JVF6bI1zj5yzsKRKKy0GM20UmTxEsuRAP/UzyBE5LOEHPdoaS+BfigsfgWX9qaSDhatJA//IcRT/kAqXEKIV33J3Y1Dku5QbGLKF7NKU/mVoJah8ESsCLJwRK7grtn8TDdnA6ylTqIoN7ONazt3dSmT7DTYlRrkYQbQNLVZFnOrPT08GXSW02LwkJ/2bELKXjTj89UWjfuz5THvXCyyLFrSNkX4Nn6a+pQvZaw3UXnWZoJLHNG5CcfFJQcN7WOSB1gBQd100=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39830400003)(376002)(346002)(136003)(83380400001)(6666004)(86362001)(186003)(31696002)(53546011)(16526019)(8936002)(2906002)(5660300002)(66476007)(16576012)(66946007)(478600001)(66574015)(2616005)(8676002)(4326008)(31686004)(316002)(54906003)(36756003)(6916009)(66556008)(26005)(52116002)(6486002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?8WjqlyGK77bWqNtb9BjlDCh0b3hhl6GTWt0QnKZ68iQ52hD18ggGqE2k?=
 =?Windows-1252?Q?tXj1NXUkvAdC4N3CA8GC8Q54xsKhYcJsd5l2OjTzoGpqXtG06pGRjmjq?=
 =?Windows-1252?Q?zHs6cXkI+lYjqGdr0CY4VfLb3daXvMA8NC5mCbZJTlEojn9VLAQiEhxF?=
 =?Windows-1252?Q?5u/ugWTyuYy/pe9ert4KsqKvybKkIizPq3mauIZxEdiNFaM9YDMPJqXq?=
 =?Windows-1252?Q?OVmZhy0iCAtm5kpe5utHfFuuFYo8ZAJH83H7b5nRDqYeszHZbLTKhTmp?=
 =?Windows-1252?Q?BkmK4tYSOrgPjkVhIh/VUmULQKYIeLKTfSJybf5G6f0mLBqFKoOnIYD9?=
 =?Windows-1252?Q?Zmqrg4fWcYCsWbk7arpCyU/q7qCcOGiifY+hdyhMBV8I6rRfTaqhLgGm?=
 =?Windows-1252?Q?g72R68ST4Q63vGRKmi3VdfDVDnO+eRJVDwbvoG7carq10h1cBbbBpldK?=
 =?Windows-1252?Q?28SamwgFp3DaQ9fIVnxDcAB4dSKgeTXBN8M2GDkedBYwLrXQgQHxSuQY?=
 =?Windows-1252?Q?/ehzGLA55PuWiHRd/R0RDiuJEY5RM9wehScihq92Fk5D2LMxoufb1i/R?=
 =?Windows-1252?Q?9s3tELuTzX5ubmOmupvuxePYz+DJBHP2YjrKFXodfAgvskRV7A/oBI+g?=
 =?Windows-1252?Q?ZAgQJ7GDmvuvIr3DVbTXQcsfJauL23tB4Ee+hRDUZcNtpqVMn27gh1GH?=
 =?Windows-1252?Q?ok1fpa9W5LC5Ji3lGjeWMg7nkAIOoA2EwWUUwLu36lul24VkUJT/CROL?=
 =?Windows-1252?Q?elwZFE6pSsvAVf/DnRTpcemotv3VKVZeRIpai6mfvyaY5lFdaYbT5KlN?=
 =?Windows-1252?Q?vXIIfpteBNriZ1hKSQZ41Of+mt7IoYt3mWavWW5vV5Rq8LvMUH/FiBE/?=
 =?Windows-1252?Q?y3uFTmurf7kx737AD9sqi2q61BAlt1b4HMxHtUY7WPWzEWYKbNzD1VCl?=
 =?Windows-1252?Q?r5aWiepTE4V4iBcCk2R7O7doX1dcLBF20JeNlgid4jLnoGLxjm6IrCex?=
 =?Windows-1252?Q?0IdJyViXvG7X0XMjP+ijNMg/ijPHVvrscA4CzCKcFWjN+16XTa/y2VyU?=
 =?Windows-1252?Q?ayklr2l5QIM0rIrO?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:10:39.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 379e9d76-d480-431b-4baf-08d8b86c4354
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIYWmZhO+kHensqhgcHBhPh2WX3E53YbUfCwDxjvkrY3iN6NDGlBk+JxKru/uz8hX9gWVDVC6/r1TBFa6iW7Ex/BBm4sWKSqncmTVQUm3SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0371
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 14.01.21 09:05, Uwe Kleine-König wrote:
> On Wed, Jan 13, 2021 at 12:27:41PM +0100, Philipp Rosenberger wrote:
>> To resume normal operation after a total power loss (no or empty
>> battery) the "Power-On Reset Override (PORO)" facility needs to be
>> disabled.
>>
>> As the oscillator may take a long time (200 ms to 2 s) to resume normal
>> operation. The default behaviour is to use the PORO facility.
> 
> I'd write instead: The register reset value sets PORO enabled and the
> data sheet recommends setting it to disabled for normal operation.

Sounds good, I will rephrase it.

> In my eyes having a reset default value that is unsuitable for
> production use is just another bad design choice of this chip. At least
> now this is known and can be somewhat fixed in software. :-\

Yes, had my fair share of WTF moments with this chip.

>> But with the PORO active no interrupts are generated on the interrupt
>> pin (INT).
> 
> This sentence about no interrupts is your observation, or does this base
> on some authoritative source (datasheet, FAE or similar)?
>

Yes this is only may observation. I tested this with the OM13513 
demoboard with PCF2127 and pcf2129. So I should rephrase it to something 
like this:

Some testes suggests that no interrupts are generated on the interrupt 
pin if the PORP is active.

>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>> ---
>>   drivers/rtc/rtc-pcf2127.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>> index 39a7b5116aa4..378b1ce812d6 100644
>> --- a/drivers/rtc/rtc-pcf2127.c
>> +++ b/drivers/rtc/rtc-pcf2127.c
>> @@ -26,6 +26,7 @@
>>   
>>   /* Control register 1 */
>>   #define PCF2127_REG_CTRL1		0x00
>> +#define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
>>   #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
>>   /* Control register 2 */
>>   #define PCF2127_REG_CTRL2		0x01
>> @@ -612,6 +613,23 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>>   		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>>   	}
>>   
>> +	/*
>> +	 * The "Power-On Reset Override" facility prevents the RTC to do a reset
>> +	 * after power on. For normal operation the PORO must be disabled.
>> +	 */
>> +	regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
>> +				PCF2127_BIT_CTRL1_POR_OVRD);
>> +	/*
>> +	 * If the PORO can't be disabled, just move on. The RTC should
>> +	 * work fine, but functions like watchdog and alarm interrupts might
>> +	 * not work. There will be no interrupt generated on the interrupt pin.
>> +	 */
>> +	ret = regmap_test_bits(pcf2127->regmap, PCF2127_REG_CTRL1, PCF2127_BIT_CTRL1_POR_OVRD);
>> +	if (ret <= 0) {
>> +		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
>> +		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
> 
> I would not emit two messages here. Also including __func__ isn't so
> nice IMHO. (Great for debugging, but not in production code IMHO.)

Yes, I dislike the style of the messages in this module. I just thought 
to keep it consistent.

I'm thinking of rewriting this driver as MFD driver. We use the CLKOUT 
for some products. So maybe a RTC, watchdog and clock driver on top of 
an MFD. But I'm not sure if it is really a good idea. The behavior of 
the chip to disable the watchdog when reading ctrl2 (i think it was) 
giving me a headache.

> We should consider a Cc: to stable.

Yes, this is a good idea. I need to apply this to 5.4 anyway, as we 
develop a product with 5.4.

> Best regards
> Uwe
> 

Thanks and Best Regards,
Philipp
