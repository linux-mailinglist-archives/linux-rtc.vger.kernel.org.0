Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1936305D8D
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 14:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhA0NvI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Jan 2021 08:51:08 -0500
Received: from mail-vi1eur05on2105.outbound.protection.outlook.com ([40.107.21.105]:22784
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231233AbhA0NuL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 27 Jan 2021 08:50:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7B0b2j4UxJHZ2Ee6jSVN8El4zmgK8flRNK+z19fwscFqkkF/igiM42mKs3WUmcdaSNTYWCPe/NThJ9dULsj3MtN9kyDIOo5UW+7+CM4mqQeEm3siHWEU8XHGqPUjUZIraieZATPjmXd3BwgeVBWHAKqGTEX40KmTOWOyuH0xFE0kHqOM3PgdFLvlfEl9kRTFgu2bms7q4l/yljBPYeioRpjITzXE9tSjhvthaIhZWo5nOb9LBN1wINxgCGjJ7ziEIfv/jEAlK8cGp0evhV8sVl1myrZrCIEecMdQN/uKWo30ZsehJBl5qdXXKkGUVIDmCai2TaMQ0WkogLXOdVwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QkQYF/h9Hscxv7XLgsByDhoLXnoIFgLJcznNhKnjdA=;
 b=AxX5t0dsPTngZHVPumTtVjFcjTML8DY6iGe3FdatY3oXpIPJyHNAtnc0jTqfk9AMTVK4J8EEQFDgH8HYWg35h6pzyWXGvmd1VZaCTunkXIdqrMBQZUEMN/aDBzW8XZpGIH3tQNYXprYkKpBjTY4b5x2L3MkB7xOZ99Me4p+gt394fQ5d7I0lsqcZFcplR8S5Na8d6hsVf1aasX0P4v+G5f57FlIK23JS4GEyxywWfDf2ILlKkhaKKhqFK3ucilxG0gs8HJSMJY9Seg4B6ibzHgwfBZoINM1btpGkjRJtFs689J9AFwH3X0lG2X4LKsYc9C6c/0yd/xA0HEf0TyKd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QkQYF/h9Hscxv7XLgsByDhoLXnoIFgLJcznNhKnjdA=;
 b=LcrB21QO4/FBtkNB3EpyqlpSBNP91xAOHkP/kQ7FJ3oxmKVKntqhWOoZF7jgFB+YTHLGmbUeUZx8SN4Fo+YoowjfYc41zCk6EPPoNugksIFDiivAfWJNznkgqlzOwpqFOV9IwrIFVttZK1e6g8pMGxS0Dt1QWrGNtkUTKAVr50U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB4321.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 13:49:23 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a%3]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 13:49:22 +0000
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: update bindings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201219013418.3474461-1-alexandre.belloni@bootlin.com>
 <c5290432-a6b0-2b96-585f-3abc2dcc56f6@prevas.dk>
 <20210126224835.GE1196852@piout.net>
 <0a8fd7f3-58c1-9e20-bcfa-9872b3dc3550@prevas.dk>
 <20210127131821.GH1196852@piout.net>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <21d5858b-85b6-8d03-ca82-d314c2a2f2dc@prevas.dk>
Date:   Wed, 27 Jan 2021 14:49:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210127131821.GH1196852@piout.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5P194CA0014.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::24) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM5P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Wed, 27 Jan 2021 13:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee79458f-f950-49f4-3e9a-08d8c2ca5a57
X-MS-TrafficTypeDiagnostic: AM9PR10MB4321:
X-Microsoft-Antispam-PRVS: <AM9PR10MB4321778ACBCC377B4D713ED393BB0@AM9PR10MB4321.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYKb7Cmp00dF7TK1CN4DSI2PQalfaLvMKA6IdAd2zzNN7O6/WBuMHFhZH2JlXcSXnTSNWOwDNUAud5TBBM98n1INHTSNQzZuK6CuPs7gnPeu+nP1hx5I0z79EWpq6Qr+T2YCI6De6SRq0Ir8QaEsFzuCQkOetjzYesuk1jVH9Rkn5AcMHAvKnVEfQGUbz+v2RQktO92ujwW+4SagCMjfBjnp486HQ+VuyJwSuWR0RMYnoCcym1rmp+Cw8vlmEpGOkNoUoz756WJ+a40Pgz2xQkYhUOSIhe86If+yfN4uq0hnIs+IAkWDh6hTOykpTKSpsWCMST8vKe3GmSmFOlR/G9GHXRwEZSGWt7kRcPXWZsbEkzQtT+zKLVci1aZOgRAvsBPFD9ju84DZCr70xocho12oAxxggYl71+79ikvvauksPmdb7jUlwetcr6KR+wMkwo+Y+/k7zUN/nLVHlmTlhxqXNqhKNu9JXOzzpRgTIQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(136003)(39850400004)(346002)(366004)(376002)(6916009)(8676002)(8976002)(83380400001)(8936002)(66476007)(66946007)(16526019)(66556008)(52116002)(26005)(478600001)(6486002)(186003)(956004)(316002)(15650500001)(16576012)(36756003)(4326008)(86362001)(5660300002)(54906003)(2616005)(44832011)(31696002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?Txpy7OQHlZEJ0MaVAEB2R1Vounvpp4qG+OrzQidK1bvfOAPJumk1Bip1?=
 =?Windows-1252?Q?cZrqyn1PX2YZ62t5uoXZEil3K/F5hfhzHe7XYzy1cjVCiPoLZGmO4veZ?=
 =?Windows-1252?Q?6lU2jQWGK3TiTviQSLwKGnLZuqz/qGSGa7/bykYUDbNunuwjktEcywut?=
 =?Windows-1252?Q?swz1lYoS6Yy3kF8Dl0QLXUBPcGyZzEc/I/hrCJ9ZbvcoTeh7IKajy0A8?=
 =?Windows-1252?Q?HkQmNl2fs28sPtsJaPp0QR8N2v6NAZcYIrIDlN3w6XnKr1s9YWxeDpYY?=
 =?Windows-1252?Q?y8vAYz8DqN9gIj453JVVQEAoREpEdfCPLzUKikQ+yfa4QdRawVQj3h+s?=
 =?Windows-1252?Q?Xb++gluLRepzwEJel5IG9LP8pvmGOgoa1DmqfUxl2qu8bhEarJZJb4NP?=
 =?Windows-1252?Q?wAT7BHVIvCUNHMDnVV+0iYgOFs0WfiBFz+k1L4qSv+q1p7D8+TYg9Irn?=
 =?Windows-1252?Q?Nudjk5gX4+tXZ4AKEAA0k7K7RDvAQbSlx2wvHIBwYxC8q1EpUW/2mXM1?=
 =?Windows-1252?Q?F6mSA4GLzYQb0d0C0bvF7pBphMwr3AC1/9yETrs7lE1WyOH0peSzRZa8?=
 =?Windows-1252?Q?zvj7Ah+r6H4SDHTkA6VqyvlTxdSBEghztoH7pYRF1LVMi74TfwOLV4n2?=
 =?Windows-1252?Q?+5oBqBqECMtDmWpi2bf14lKfH4JwyWIn4XSMN//SG2Q6WkNiEunVRWJ3?=
 =?Windows-1252?Q?bVzRmcKz/AHjmhu9LOOWK1qkNEtbgXzWmFxQ8+jlYewblYRhjr6tdbA2?=
 =?Windows-1252?Q?igG3Hvu2aPf92nHeBLo9biS/FcQdh0O+Z0p4+UVGKXOhsfjyxbMOCLlX?=
 =?Windows-1252?Q?sIq6+4zg9QiC1DKPM50Mn6np7gKS2iKOQ4aoHZgQPQFApcHEiMaPGPDq?=
 =?Windows-1252?Q?s3LhLZ9sVBSp8i9y4abfBEMjbeqZ2oEODmCtvabPOn78Guu7teXCKa7L?=
 =?Windows-1252?Q?0SSNJ9ZYp0kr6P9ZwagVY//goUFJ3tmyKFo3uFSJi0KddLPIr2dHrzA6?=
 =?Windows-1252?Q?txJG5MmSr7fqL/HuqgFlpQrfUbLog3zXV2hiqDouM6QQkxguwfqHtasc?=
 =?Windows-1252?Q?oejJnRvyYE1JLThbnStKmv4JbXxKiCgg9GPhNaBZCdxcFoqSLVEi79Th?=
 =?Windows-1252?Q?qnFvv7ECWY9c9WlZkrnSE4Dd?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ee79458f-f950-49f4-3e9a-08d8c2ca5a57
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 13:49:22.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdnlG8GYz93olrs2XEDRP/xm4jZhANYTww214nT4MvIcPGaJrWD3w0n6oQKYxV4yijx3XAYVKFYxBSjo6H5i2P3eFyMd0VoitZnvgUwB+1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4321
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/01/2021 14.18, Alexandre Belloni wrote:
> On 27/01/2021 14:07:59+0100, Rasmus Villemoes wrote:
>> On 26/01/2021 23.48, Alexandre Belloni wrote:
>>> On 21/12/2020 22:17:54+0100, Rasmus Villemoes wrote:
>>>> On 19/12/2020 02.34, Alexandre Belloni wrote:
>>>>> pcf2127, pcf2129 and pca2129 support start-year and reset-source.
>>>>>
>>>>
>>>> No, the 2129 variant doesn't even have a reset output pin. Not sure if
>>>> there's any way to reflect that, and it probably doesn't matter, since
>>>> nobody's going to add the reset-source property to a 2129 node. But the
>>>> commit message is a bit misleading.
>>>>
>>>
>>> Actually no, the INT pin can be used as a reset, the pcf/pca2129
>>> can be used as a watchdog and so it may need the reset-source property.
>>
>> Unless I'm missing something, that would require some rather creative
>> extra circuitry: The interrupt pin is kept low until the appropriate bit
>> in the rtc is cleared, so if that is routed directly to a reset pin on
>> the SOC, the SOC would be kept in reset indefinitely.
>>
> 
> You mean inverting the level of INT? I don't think this is creative or
> complicated...

No, that is not what I meant nor what I wrote.

> And anyway, INT# is active low, like RST# so if the SoC has an RST#
> input, this should just work.

AFAIK (and that may certainly be wrong), most SOCs require a _pulse_ on
their reset input; asserting and keeping the reset pin low would just
keep the cpu in reset, never allowing it to leave that state and then
talk to the RTC to clear the bit that would clear the interrupt.

That's also how the 2127 RST# behaves: it generates a pulse (of width
244us or 15ms). The INT# and RST# pins cannot be used interchangeably.

Rasmus
