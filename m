Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE00F2F5FAC
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Jan 2021 12:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbhANLTM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Jan 2021 06:19:12 -0500
Received: from mail-eopbgr50065.outbound.protection.outlook.com ([40.107.5.65]:9766
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726008AbhANLTM (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 14 Jan 2021 06:19:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeIWbez85xHpb5IMtK5PKNg87SQIZVbaj9u5llC3BnodULkb4EgRmOHqG1H6jE5Td0Ji52dj4CsGbxtAgA/3621fI6WxrvkIWnMovDfZ2UhMLU6sqoF8MwcGD4aV9SuIJg1q1sSd/tf8LVXUsrklDe7IiuY6mAVLs98WE4o1ojcOrakVZVnEjdc93b0vUe9kMg10DQkHk5oyB+MJ7YiAxPGo8Njh1m23bfaWcjypr/Wh8RHOoqBa/pc3p44BgFfCTuoej4qJ03/YAw4vVZ0rUmMqKQgy89TLJryQ73RQM3URCsqGTyM1hOLHArihMVdasKqUV6gYJ23Csb1bPsyNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oawgPAVDwqiadwhuDS1ZLQtRIUpEwN2NC+ECeGpvxE8=;
 b=i6S2e+FJLo3vDjn3a9HkwFXHVf/QDpo1oxlzdqw1qao9Ga3OyB0JQtozaoBqvKoZcoxAHgV5HRMj8l2rdat9qCdM6M3/cg64MP0qjkVnqQagzd9mJPddI+auv0FTOeDQms7wVp4voQlFSKdAoDQVDEoExreDoWiVf4uUEbaDXcd3GjpuHEKAjEnv7fSzDp6x16eNp58WeQxkWyRGE2ckmE0IQYXL6zsmHfq5E4heIhtG3IjS0i1iq2yaXck4dfqGVRm26hFb2PQni7FiKYI17wD7pFz5/DVqOBpugdyf8wZ8VBRte8tQP6uzh6Zn5U7di0uPGPPxrF5iLmvGtjKdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oawgPAVDwqiadwhuDS1ZLQtRIUpEwN2NC+ECeGpvxE8=;
 b=dRoOjk46oQ7CYTfHTaPpo2WmH38Gp48nKqBgEKG11m9ZOI5kenIM5TbG50llleZTcrEF6JpefnPv8Vp28t5k5PcktRbykdCMetnWa29YYh6SzrjT1lXrPqjgly5Oc4DdJQzyQBRQJ0FrdcLGShX4/505pLpGQZQvyY2BCTE36Xc=
Authentication-Results: kunbus.com; dkim=none (message not signed)
 header.d=none;kunbus.com; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM0P193MB0769.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 11:18:23 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 11:18:23 +0000
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: Run a OTP refresh if not done before
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     dan.carpenter@oracle.com, u.kleine-koenig@pengutronix.de,
        biwen.li@nxp.com, lvb@xiphos.com, bruno.thomsen@gmail.com,
        l.sanfilippo@kunbus.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210113112742.7354-1-p.rosenberger@kunbus.com>
 <20210113112742.7354-3-p.rosenberger@kunbus.com>
 <20210114095008.GV3654@piout.net>
 <77d07f5e-2891-21d6-feee-19e841a8343e@kunbus.com>
 <20210114111157.GC3654@piout.net>
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
Message-ID: <346be3d3-362e-b1a7-38eb-9e7a82e61ac7@kunbus.com>
Date:   Thu, 14 Jan 2021 12:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114111157.GC3654@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.23.16.123] (87.130.101.138) by AM0PR01CA0111.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 11:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480d7207-a300-46af-d57f-08d8b87e1b68
X-MS-TrafficTypeDiagnostic: AM0P193MB0769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0P193MB0769469EC421F3442216E2769FA80@AM0P193MB0769.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFLpjAjhKzkQPZrf3X19KHrpG6I2AoH3pucbCjTd+RmFf8gvm4ROiaxCnKvxGNcvWHAz5LWRbIzcLoP35A1K2XX8ZCedwu+lCrCPNCZY7hOjegKrXOoXGB1A3GQVJfIVgLoIkjN4lMiuF25U7P/FLIRdAWnzxJP1whSrkTeFS1opqv6TCxdBvkR7k/jdCN0cQ/5MeVx/VLI5RHrL5SM85hpsaa/grYIskZviS8ROV1221YJ9/uTe7/8M3IzujvqeBTpcTbTfbFGklnln+RuHGOBuaH74AlXV6sJIy7tysCMLhQ08iZp7T9Qd5BkDIjKJYyFpbagLSavEc1YPtL2LDk4YweJM700RFXLVH0oJ8q6a/hvvDU134CrCW6F5DVpCGL4wFdynGRyVxbkLQVjbK3uoKtKvHOgWUPR+x2IXaqpiMnH7eqw3DuL09vneheN2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39830400003)(66476007)(66946007)(31686004)(186003)(16526019)(66556008)(8676002)(2906002)(478600001)(956004)(8936002)(36756003)(6916009)(26005)(2616005)(31696002)(5660300002)(316002)(83380400001)(16576012)(52116002)(86362001)(4326008)(53546011)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkpEa2Y4bzRPS2V6VG5FRHhaOVdmdjIwVW5qbnZYNnYvN25pNWJSUmlyUGVM?=
 =?utf-8?B?UVVWc2xtK0tKTEtORlVPYXdUaWQ3ZDVKWHppSzZZMWRFQVNIMWRzWDM4ZGxu?=
 =?utf-8?B?WGZac0Nqa0t5cE5BVG5YS09abXNXamtxMWQ0Q3FsTjRRcEcyOFAyVGwwdGx0?=
 =?utf-8?B?Zm5mSUtLSlM4bzhVYWlFM0Q1bTZ2a2E0Vk5pbmk3WTBxY3NpTFo2ZmE3YlZj?=
 =?utf-8?B?MXRqZGVNYnFWZ3A4V2c5NWpPWnRzVmp0RklocVNLUGN3dnIzejhFZkF5bWZJ?=
 =?utf-8?B?alU3OHVjN0wwVXNXZEowU2Fndjc2TE9NNVU5TnE4K2RvLzhuc3N5WXNxQXJZ?=
 =?utf-8?B?Y09QbjQ0UHNtS3RYekVya2NJcDlxb1RpK0V3bS9idHJxYzRPN0c5MGNSbkY5?=
 =?utf-8?B?NzFLblhVWkdITTU2VmJzWXZ1WUxET1grN3FRRFNsUjZtMEdHWFMxbTg1ZlpF?=
 =?utf-8?B?UlJ5RjBxMnI1K3djT3FTck9mOGRKejFEbnhadjRORzBmWkIzeUV4Sm9tcS8v?=
 =?utf-8?B?bHVWdnhHNWJNL2lHV0xJRFZaMCs2dWNDeEEvVDIreEZJUHVyS01DTDIrMWcy?=
 =?utf-8?B?Ukg3S1RLMGJkamhPTWovVEdUSldtUmMxODVUMWlBWDdLWVdjUWYvRVFjZzdx?=
 =?utf-8?B?U0tZODJVdXMzcGR6dnRnUkJ6L2VWYkRDcW1GUG9xOXorQW9VWG9aaXRLVGlG?=
 =?utf-8?B?RGZUcHlBeGJnMmhkV3pZK3N3aVVzQVRkcnZJWll5Rm1VVU1iNDNlWVpHcHpB?=
 =?utf-8?B?N0R2bzFxZHN3RzNpMlNybExwN2pqU2ZxR1FDU2QzTVYrZlZzOWlFNDExeXBL?=
 =?utf-8?B?T2lhUzQ1T3ZIaFhqenFmdk1PbWkrMjQ4TllXYlJHTFFOV0lDdXVsbTFKZjVa?=
 =?utf-8?B?aG5jcGhLVEJ5VWIrdlQvbWF1SlcreTZpUUw2bjhZSXZudEVOcGNhZC9xL1Ez?=
 =?utf-8?B?YURsc2NXc1g3TFB2OTVBUUYwUlRtVVNCRlNHWHAybkxHdkpqVzV5VEs3Vi9N?=
 =?utf-8?B?cFVBbG9URGprUXV4VEZJaEZzdUxtWGwzVFFKZDJhU3VMOElFSGp3UXRGYllU?=
 =?utf-8?B?MTVsOE5HZEptOTRadEVBcWNMU1NXQVZ3MnZWUWJHRmdKekZoNjVuMHE5ejJn?=
 =?utf-8?B?VGFraHhTcVVkaUkzeUJmOWRTbDBCRGpRL2V0VFczeWd5MG5CRW5KQ3NUL1FV?=
 =?utf-8?B?bDVDcHdJWk9jSlE5dHl4dExncDA4blVPdURyN1NnOVhLUmlKYzJGdkx2aExU?=
 =?utf-8?B?em9ORjM4Ym9jdmY4cmpkN3QvZDNhMk4vR2U4U202Y3pNL3R5TzltcWJSWnhM?=
 =?utf-8?Q?MBZI3kkDqe5eV00UQLfw2CQizZn7IIbLtQ?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 11:18:23.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 480d7207-a300-46af-d57f-08d8b87e1b68
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfU/ZwzLZrv3tCNNSIrICktSc2aRdQ83r3FeQOntVDEakuTFhiIEVoPqONGGs5IooO9jDb3LlKChPlRl0b8LQGEBTy/4mmweJ1hBdckj3BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0769
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14.01.21 12:11, Alexandre Belloni wrote:
> On 14/01/2021 11:30:37+0100, Philipp Rosenberger wrote:
>>>> +	ret = regmap_set_bits(pcf2127->regmap, PCF2127_REG_CLKOUT,
>>>> +			      PCF2127_BIT_CLKOUT_OTPR);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "%s: OTP refresh (clkout_ctrl) failed.\n", __func__);
>>>
>>> Please drop this error message.
>>
>> If I return from the probe with an error, shouldn't there be an error
>> message? Or should I ignore the problem at all and don't return from the
>> probe?
> 
> You can return from probe without an error message.
> 
>>
>>>
>>>> +		return ret;
>>>> +	}
>>>> +	msleep(100);
>>>
>>> Maybe this should be done just before setting the time. Or if you want
>>> to keep it in probe, then you could optimise by not waiting but ensuring
>>> the time between pcf2127_probe and the first pcf2127_rtc_set_time is
>>> more than 100ms.
>>>
>>
>> Doing it just before setting the time might be not the best way. The
>> watchdog might be used before the OTPR is done.
>>
>>  From the PCF2129 manual:
>> | The OTP refresh (see Section 8.3.2 on page 13) should ideally be
>> | executed as the first instruction after start-up and also after a
>> | reset due to an oscillator stop.
>>
>> As I see it this should be done before setting up the watchdog as well. So
>> sleeping if the OTPR wasn't done before might be the most viable solution.
>> So I would check the OTPR and only if the OTPR is not set starting an OTPR
>> and then sleep 100ms.
>>
> 
> Indeed, the remaining question is whether you should test OTPR or OSF.
> OSF states: "oscillator has stopped and chip reset has occurred since
> flag was last cleared" if OTPR is always 0 when OSF is 1, then OTPR is
> probably enough.

The datasheet is unclear about that. And I thought about that as well. 
The OSF flag is and should only reset when the time is set. But if I 
reboot or reload the driver without setting the time the OTRP would be 
rerun. So I thought it would be best to only rely on the OTPR bit. If 
someone has a better idea I'm open far that.

Best Regards,
Philipp
