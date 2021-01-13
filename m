Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383FD2F464C
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 09:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbhAMITX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Jan 2021 03:19:23 -0500
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:31846
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726899AbhAMITW (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 Jan 2021 03:19:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiWrnq+XqZFHYINTDdL5uy3Una/2dgGceJqW6BfqtVuoqqQ9VJsMsXtOOrGLRpEfNhAoqt5rGSQ/V5VVV4/BeP9wbkX19i69fAHpUwwvdpMvpDkg4gh1etXOWvI3wyzu+PMedLXqXy2JcExiZOTEGXgq+15LWV1mT5diRSTwWOu7IY4p+RMLagEfrEaQpvxv3cbiJ3jmD4ZPgNi/zo6kGwsVZ1LwK559eCDVEJ8MYq2ClAyaW//lYpimqb7/nB6T6F/h8+BLRfrDPTVsBlk/45UiVXO2rIIs9fQXSITfFgGj1eEptJ9zwVguapME7q0t8LoBjIABCXoKtY4vGbmrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwAkiBkWrs0XRO3QZ1Pc/A6zmtbtdqMB+OcMDZI+cYs=;
 b=NkcX5J0pm+Yy+GPF+jktURD1QTojP4V+M/3G0O+whE1HNe1YseNRmc1G1P9FT0mEO2yJ9zyFvKZjRJI8ptvyy/H0BSPOrOD2hS3DXMC8TSDePuPxvTLF8dInQWkjL2CoMnAzTPTsc1bzFT9Z68rBWiNeEfLMGSzSBUngz28Qe2OH7sm0hurJDqLYLRVOHTg5Sf/pGiybvkCKP/5dZ550ZtYzE2c7fEIF1DNHuuGsK8z2/PL1dhj9ND7i6tXlpW1R0FeUaoAylpHNKC8WyBvADtzfr6OoVX6lyL3l/Yfy4AANFNZNfUI5YpdDTwHGWGQlrnl15Gh1T8K6xUQ52HRdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwAkiBkWrs0XRO3QZ1Pc/A6zmtbtdqMB+OcMDZI+cYs=;
 b=WyqhVrenE0kNIfGz7wrUdEaE1uK8D9TwXcWxuRWIdJ0YTQnXwq40WMTLRV3ksDLg2OLTuAgoJuvA065zCtJz8mO/yrRwc+NsDh9s66WfQ1yp9voDY5tClMFT0hgNJaTq4D8AtMvgUcWOw7cWbht6Gp6ucifaBdkB2wzCwHHbEAg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0338.EURP193.PROD.OUTLOOK.COM (2603:10a6:208:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 08:18:32 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 08:18:32 +0000
Subject: Re: [PATCH 1/2] rtc: pcf2127: Disable Power-On Reset Override
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, dan.carpenter@oracle.com,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
References: <20210104161910.9144-1-p.rosenberger@kunbus.com>
 <20210104161910.9144-2-p.rosenberger@kunbus.com>
 <20210112192633.yl7nx474r6njfynd@pengutronix.de>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <8bd2f360-c43d-10a4-58ef-804833de4779@kunbus.com>
Date:   Wed, 13 Jan 2021 09:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210112192633.yl7nx474r6njfynd@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM8P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::17) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM8P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 08:18:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c560e5b0-b191-4a62-86f8-08d8b79bd0f5
X-MS-TrafficTypeDiagnostic: AM0P193MB0338:
X-Microsoft-Antispam-PRVS: <AM0P193MB03384E20091E60C3D7A40B4B9FA90@AM0P193MB0338.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHJSLGSReCOiCKidCI8RpcQIicpT1RtBQWTOsX99jr3zw0f39wgerP64OUWFUgA+Oi6IfN2+nB2kxV6aBu28MzQu/N5kaFCCq/TsziBR1K5an6RmNv3rPyd0BRZKypXDVEBtHhjUsmUTSsbYCPMG/8FfxmEwHilxfXx9xdJrNz98shCalGvNp3SM4sTrGclNwFHBClPUUpCn4UwwgzCkFezSqwgTPBUfPuXRKaWeVaeJf/+LzKIA2AQ/hkleKx7Xu3i6RRaYjOdnyHLK9DNTFGwvoYKgks2rxihNSegFLKrBPXVd+BFdHixqyc3LUOdSaxWEGrhbdCVq/jvsYrA7pd2wt15qhOIrKOk6aNXqyqwHW5HZ7ZRwQ5oLWb8sMsngTWZnTfmy/1Enu/iAnzkS5LGcwwRjMu5cyy5CDhfPTkdHGaapTSAQriMUikAdIK6G22kPbTDotSTzmcx7F3RxKuSJ9Oz1PsTvkgbb8ZTFNjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39830400003)(346002)(396003)(366004)(136003)(66946007)(52116002)(36756003)(8936002)(956004)(478600001)(2616005)(66476007)(66556008)(66574015)(26005)(186003)(6916009)(31696002)(86362001)(83380400001)(4326008)(53546011)(16526019)(8676002)(54906003)(5660300002)(16576012)(316002)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?eA85SLzjgXESSeUjY5H0xTxkIXVGKp2ZVIJpI8kQfNmPJYOlv2a0QwDM?=
 =?Windows-1252?Q?kSpuINCp2iIaKkEqsAFktCA4BTxYwip8lYgl7PBJxaJmjvifcgfND0Ff?=
 =?Windows-1252?Q?Ur+6cOSukcRO41Ga3aYEuQB2rbs65PNm9nOZf3+BFyGT8bKP5LaACQZ6?=
 =?Windows-1252?Q?iKt7I85Kb8H4HpkW0TB3bgJ5zWGGJTPOgKty+6aeUxyTSYUEN9Qt4Cb/?=
 =?Windows-1252?Q?2t76zHaiyyDztU8CpzHq/eWAXW+MHRe8PUMNqBceOF0fQK3569XHpcHX?=
 =?Windows-1252?Q?InRtFl5nCdWcoHpFbXRr1ScJRKwrCZAQ5eNTvWAwCfqicqIku5SNp94X?=
 =?Windows-1252?Q?dxt2gQN1zX63iYaqDIBr0U47hiHxt6bIfT1RdBxOtFUgCv5G2LcPQ/z3?=
 =?Windows-1252?Q?YfKEnW0ZJNEGh7Lz20NncSnx0xngHZ05H+Haxi4po4qAxFOPXyfye/w5?=
 =?Windows-1252?Q?rrnpxoMNpDVqZt7N7y9qfx8xwhBPSvDV7U5cLjUAQWoNNpi/gggwdePd?=
 =?Windows-1252?Q?ZFZ+vk7+2Rs5IBifVRbTxBtYKMqTxGm17yYk6A4W5AootJiCzAVG9GZ2?=
 =?Windows-1252?Q?i/9TmSSS7r2F0/i9VJqzhTaWashq+n+SMDSogdzJmn30fTpMZa6eFveR?=
 =?Windows-1252?Q?t0DHflLhmRbxuvkyf7w0DxR0s9HjPDqOSNmy1f1gvCkf/P5ihaBC8wwY?=
 =?Windows-1252?Q?r+i2cI24zHcFaF002y6HLkNRG7k2SKlwoVbn6MSm7uGZ332ADHCbETHP?=
 =?Windows-1252?Q?JeEdFL/3iMcImiK+F6UK7k1uBHyeYiBq6SOSD1JZC+rUzpLRMMsJ6eEx?=
 =?Windows-1252?Q?6GTnFcTekneI+DdPpyvhMzfBzKBeCxfT4n5CxS3I4KE+oKrsZ8DhwwoD?=
 =?Windows-1252?Q?gMyhAgUl5d0Xpl0aSl+lK49UjnXMJbOlUh9nE63+r3kDmTDebx7D6W1e?=
 =?Windows-1252?Q?aRKV65Ye8lrlfxgQL/7r9I67fgNA2wxtEp8cH4WSv2aIO1n0sRxjUtJL?=
 =?Windows-1252?Q?vTyy/UFEbDwP9TiJ1A6IdpZHU2jJIMKnPbwmEQOi0GXWg2S6l2xd3H14?=
 =?Windows-1252?Q?ggN8Qs+eYyYi6SZQ?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:18:32.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: c560e5b0-b191-4a62-86f8-08d8b79bd0f5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0ZxGylXrr/FGtjzJza6M/vuQy9z/sgaQcLmouvxfQzE8UMtKnt+8/9dEOo4dOO+8WGfxWdvMEDpj0BDkFIXG5AgyiQbfsYjOYYX94KqxGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0338
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Uwe,

On 12.01.21 20:26, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jan 04, 2021 at 05:19:09PM +0100, Philipp Rosenberger wrote:
>> If the PCF2127/2129 has lost all power and is then powered again it goes
>> into "Power-On Reset Override" mode. In this mode the RTC seems to work
>> fine. Also the watchdog can be configured. The watchdog timer counts as
>> expected and the WDTF (watchdog timer flag) gets set. But no interrupt
>> is generated on the INT pin. The same applies to the alarm function.
>>
>> The POR_OVRD bit on the Control_1 register must be cleared first. In
>> some cases the bootloader or firmware might have done this already. But
>> we clear the bit nevertheless to guarantee correct behavior the
>> watchdog and alarm function.
> 
> I don't understand this. The reference manual tells us about this bit:
> 
> | The POR duration is directly related to the crystal oscillator
> | start-up time. Due to the long start-up times experienced by these
> | types of circuits, a mechanism has been built in to disable the POR
> | and therefore speed up the on-board test of the device.
> | The setting of the PORO mode requires that POR_OVRD in register
> | Control_1 is set logic 1 and that the signals at the interface pins
> | SDA/CE and SCL are toggled as illustrated in Figure 18.
> 
> So this means that with the bit set (i.e. with this patch added) after a
> power-on the oscillator isn't properly reset. This means the chip might
> not work correctly, right? Does "speed up the on-board test" suggest,
> this is a feature that is to be used while testing the chip and not for
> production use? You missed to ensure that the requested toggling is
> done. Did you test how much time this actually saves? I doubt it is
> worth to trade correct operation for quicker startup time is the thing
> we want here.
> 
> If you still think this is a good idea I guess you need a much better
> commit log (and code comment).

Yes I guess the commit log and the comment are not good enough. I took 
me a long time to find what was wrong with my setup until I realized the 
the PORO was the problem. I find the description in the manual not very 
clear. But from my tests and from the description in Table 7 Bit 3 it is 
pretty clear that the PORO bit should not be set during normal operation.

| Power-On Reset Override (PORO) facility disabled;
|  *set logic 0 for normal operation*

My tests have shown, that as long as the bit is set not interrupts are 
generated on the interrupt pin. So the POR_OVRD bit needs to be cleared 
for normal operation. At least that is my understanding.

If nobody disagrees with my assumption I would try to reword the commit 
log and the comment for a v2.

> Best regards
> Uwe
> 

Best regards,
Philipp
