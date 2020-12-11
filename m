Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143BB2D829E
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Dec 2020 00:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407064AbgLKXLT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 18:11:19 -0500
Received: from mail-db8eur05on2137.outbound.protection.outlook.com ([40.107.20.137]:39008
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403763AbgLKXLC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 18:11:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2TZbM0e238kcG7TTJHmKFvg6krhwAbIbRieaB6UnyvOM0WhIphNk8CaIf7NN2byGGArBjHIYZ1+9qFIqK9URkJ/IT5BgsMId05ducoNuit+gq3qkifmJvqIXeNiqONnGLE9mxcqtV1aj9aCn/9EGqP2Rj7LVG/R/DZfOfXnFh5PGteJaU1okq+BOeaSIawk8eNs35qgPUfiORNkTXTVzQa0MM3+80ztSIlplwz+gtD6RXRuTD5UN9UFPfW2FFVlROfIIJGxyJp3A2FOFkyviYqwyZSTgz5gY5FLaHh2n6MtlqY8J8p8McQ2H0/Z1hmg0GpVRgag6WgpK6vpTkarfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O4WtPhDMctkJXG8rs8q+JzJa7xuRMlH0NaZMYU2Acc=;
 b=fnmQGQXUSupNvgfXvAghawSh0uVDDeErQRfSEvSlEQ25CjC8NhOD+yoxWjGiTNetcyU+RFa6b5ZUb6zEw7HrK2Iop6lddZloJ8h+2KsR132GEB8n2l1VIF0FC2O6dV20ba9QHr8BRR+YXVrnwd/xlI7yQ9kFHsuu8e8tPnEJ8z+BShPb6zywWTjTQdyiaIrN+hCfxkpsaXiYoXJRAPK9fXiMTvBO1NLv0NyOc7YP2+QZPv9c3efT++QnWrxYGaiJVB542R5I1g/RbvGqEUXXu7kUcyOqAK1Fb9zIkrmOqL30ikyllhZiOOnM3maSzf1ZbApNLMd7Kt0eSK12AHGqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O4WtPhDMctkJXG8rs8q+JzJa7xuRMlH0NaZMYU2Acc=;
 b=Ce2qsk2ECmxjBUOT/kQH7HwsTMtvtnnloOzYOHtjHFZfLurRXPvRKpyGlhRd5072vgucDwX1CQY8+VDUu9qpb3hBcyzOmBQwbvsnqbr/NGcoS5J9hvM/PwnO4/1YNIjD3uWhydr8Hi5KXMqJgVGi/lLXG9AniEBRbnp+oqQe/AU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB4135.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 23:10:12 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.026; Fri, 11 Dec 2020
 23:10:12 +0000
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
 <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
Date:   Sat, 12 Dec 2020 00:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:203:91::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM5PR0502CA0015.eurprd05.prod.outlook.com (2603:10a6:203:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 23:10:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377c082a-d4bf-406d-f743-08d89e29e9d7
X-MS-TrafficTypeDiagnostic: AM9PR10MB4135:
X-Microsoft-Antispam-PRVS: <AM9PR10MB413513795E1D030653C5666393CA0@AM9PR10MB4135.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QWOQITLnRAVyy/tEdYV6HLJRqlEXohvAA82cbQfP6Z9dSFCBuUbHrr5kjI885/ytxVnsweurTEgQn71LzlXK5agXeKrWiLZObATs+aOTGG16DUzyK1B1YfX5ZZaic/GW3p3MFGhGHVP9ORwCyuSTksrOzICCFx3Dsb1zfthjUj0/qlr7WCW1UYjzjAC2AocsJn5N4VLwDPYYXK45so55uCHGnvYNnbBeTb2fCpQF+fQe+z0E8ki+PAVBiP29E13npdDwvDNwYwk8fEfs+OfelLHuMeazXySi4KV2gXSn8Va+KVSSJLFiJrdzymHLlHRbPe6zVrB5D6nIE9/bCmZxpCyIpqnpspIDFcjslA3XHbPDJc8r98v9sLoJwi3X6l4VXWBqPeKROyN3F/7PQhthpsNIzBhMCZLeGHxZdrKDOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(366004)(39840400004)(16526019)(53546011)(16576012)(36756003)(54906003)(316002)(4326008)(2616005)(44832011)(956004)(66946007)(8976002)(66556008)(26005)(6486002)(66476007)(5660300002)(2906002)(8936002)(31696002)(31686004)(8676002)(478600001)(86362001)(52116002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFRON01CcENSbjduM0cycXVvZlQ5N09ERFZGbzBzWjc1QkRlWkxlS0w4MXFk?=
 =?utf-8?B?MWs0THRRWXlDT0hJUmdKYlNmZWhkdnFwUVFCVnhOaEQ2SHZ3Vi9lbDlkV1gz?=
 =?utf-8?B?TU52alhOTUpvdllSbEtzZ0xUeCtibGhGbXE3Q200OUptNGtrdGRuWFV0Q3hn?=
 =?utf-8?B?dmErZDMwSnBMUDRGVkdTR3gzakhtaWFKMVR3a2laZW90cGxObldVMWo3RlVo?=
 =?utf-8?B?Y0FGcUhscC90WmU5MzVKa0QraU1KTWNyOXd1c0lKWlc4bDdpdHhpWHVVTE5J?=
 =?utf-8?B?WVJHSmYwa2xvdzRLc0hSMzJkSmFPTHIrREh5QnRjeklJVDV0eTZsQkRGaHVS?=
 =?utf-8?B?WU93ZGdDV1B2SXZIYmViL1NRbS9xOUdqUG02dEdwMSsrc2grelpYRlB2Z21q?=
 =?utf-8?B?aVhyMnVIWHJ5TkM5R2JTeW94N000cnZnUjhqTU5DRExxc0srd1JRaFJRTWdF?=
 =?utf-8?B?ZmUyd0F3eUd5L0o3VGFyVkNaYm96TzA5R1RzWkdGSGg0aDEwYi9FUWFMbWFv?=
 =?utf-8?B?aVF4YkE5bEhiZlBFMG82WnFVRjZLejlEV3pKRUx6cWJLSDlIZjNWdVh1WFBx?=
 =?utf-8?B?ck4xeXF2dlV1QldnVnpINjRGT3pFMGtpS3Bpc1NDTTF6ZEcxdWVrNnp3bTZx?=
 =?utf-8?B?b3h5SE1qRVQ3NTBIcXdwME1WS1RqZVo0U1RkR0pXWkdRQ3hnOTR1WEVleCt0?=
 =?utf-8?B?YkpSQ2ptNlltYTlER25XdG1ldzhMbkk2bkRoVG5ZcXlzZ01TYU00RW5jK1VV?=
 =?utf-8?B?ZnFCTDVmSEs1TUVxditYSzRFSlR3Vk9WcllYRDQ2eFRtZSs4MlM3Ull4Ly9B?=
 =?utf-8?B?em52aVhlRnlMeDRsYURIQ3d3SEg5ejM2NzNpdkNjZDFDcE84MndWeDZZNlRw?=
 =?utf-8?B?ZHNUVVYxTHM4SGF1WEdZV2RLQVcwWFNMeFViaWFPU09LSVgyd3h5Y3hiNURL?=
 =?utf-8?B?Y1puODJJa0s2N1RYMGM2V1Y4TWhFVkd0Qzl0TmhNL0YxdnBDN3pzTlRIRFNV?=
 =?utf-8?B?dzV4ZVZjaHJBUFpXMHVId3FXN0dnbnFudGxwUHlhWmZ2OEc3aWMxenExbGFu?=
 =?utf-8?B?SUlwOEJLTjVtWTd6K1ROVDYvbFVhaXZZbzNuU0d1cWJIZll6NUFkNVF6T0dR?=
 =?utf-8?B?S2oxVFM1b0h4T09LVmM2Q042QnQ0bUc5S1d6S2o5cjFBYlY3ODFKeUE5UHRx?=
 =?utf-8?B?V0hJeGlDQkxRSXhGOG9pdXNFeGhDcmV0TCtmeVBjMzZBZkliSGZIN09SanJt?=
 =?utf-8?B?eWYybWRpalU0aEdzY1hvRGhjaXhNa1BZUVB6OW9jNE9XcGR6Sys0NVhEMFl3?=
 =?utf-8?Q?OVf6aVy2KnY8B0Wk1MKd5tep4gCpfu5j9E?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 23:10:12.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 377c082a-d4bf-406d-f743-08d89e29e9d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KnbMUnTHCMZRompVyS+NwGbia1DdZutQlFvVZJ48949xwbctsha+LLHoXrsyExjeQC4d2oLCVm+4bBMwRSwjXIR32gdZ41M4u5dBlTwXow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4135
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/12/2020 23.30, Rob Herring wrote:
> On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
>> if the reset pin is not actually wired up, the driver exposes a
>> watchdog device that doesn't actually work.
>>
>> Provide a standard binding that can be used to indicate that a given
>> RTC can perform a reset of the machine, similar to wakeup-source.
> 
> Why not use the watchdog 'timeout-sec' property?

Wouldn't that be overloading that property? AFAIU, that is used to ask
the kernel to program an initial timeout value into the watchdog device.
But what if one doesn't want to start the watchdog device at kernel
boot, but just indicate that the RTC has that capability?

It's quite possible that if it can act as a watchdog device (and
has-watchdog was also suggested), one would also want timeout-sec and
other watchdog bindings to apply. But that can be added later, by those
who actually want that.

For now, I'd really like to get my board booting again (or rather, not
get reset by the real watchdog just because the pcf2127 driver now
exposes something as /dev/wathdog0, pushing the real one to
/dev/wathcdog1 which doesn't get pinged from userspace).

Rasmus
