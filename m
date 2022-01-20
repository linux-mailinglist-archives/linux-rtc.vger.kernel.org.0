Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4FA49542B
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jan 2022 19:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346476AbiATS1p (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jan 2022 13:27:45 -0500
Received: from mail-dm6nam12on2084.outbound.protection.outlook.com ([40.107.243.84]:38593
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346409AbiATS1o (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 20 Jan 2022 13:27:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3M5pZqfaVEqqkcGa5ZdExJMg0X5hTfbVQ4aQfRk8LUaIPSKMr1UFcsZ9Mha3iZ5N0GlJ25k8r9QxAMiyfvv9kRnyPXeZEkKCyyf/9g7fkHW2jWIc3sX5DF9UuY30ajkzeabY+WDjAz/DkkNWzIeA0YW6xKfZ6MtNcayFRUVO4rvh3d1QQpQvCt/YV8hlj32lfelbgoUHWsFn8viBws0rM529UfVB8R+RzmyJbc6lXMYvqSR7bK/E/KvW54zi2BTi1jL5LT3E8cKFoRg/NuLv7ABM6BGJApp8rU0BYqY0SNGV9dTWJWWyTuYHhv8Y0mPeq1dAHhBAI0Dg8oEyKDk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Agmyz6ONWEa+fduJBr7IAgEH8p3do7K0MWIZ7H5d1CI=;
 b=MooI6DeoJJk3LZ5btHG3oJOU0VzcCwOmJBT+q91BlGtOWB2iSeMeslrmMcI8LV/nicEEf7djtEGaxDMnZU2QvoqOG8LyzCUZhQZBZBb7F69fa9hqU1miHsbItxFIPO0TEMATkm6rYE2aIjhn+uRSNzfudxnJzjXtvc122Ty2JtuTDbDpBrpuIh8/ALbhSYBQGsgeLfQLdigHgUwLJwnkD0LNkKJjrhnkcIo3niod3s+dU63o5loPMc+kbpXd6tqfa74vB6neyoVeOuJembJPlPvfzx8+7uqciAFGNgRnQR2aJPUGnOa983JiiygrZpMinpZ/5Jv1yOw0w84EUTcCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agmyz6ONWEa+fduJBr7IAgEH8p3do7K0MWIZ7H5d1CI=;
 b=AqKapNWUWJgr65M291xTbWhrd4Q23XqP4VrYKwLdHsg2xLKRkF6IA7ay+jsyWmwWb1z8J4ROTWahLPBbk0M1fAaNnGh70z+S23qsMto+hMDuFMACg3xtNKFaVkACvU2UB+ZxBgxbZw4UM1zmQ2an770cWZjCamAW+1Ejfs9b4u8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 18:27:41 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 18:27:41 +0000
Message-ID: <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com>
Date:   Thu, 20 Jan 2022 12:27:39 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] rtc: Fix the AltCentury for AMD platforms
Content-Language: en-US
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
References: <20220111225750.1699-1-mario.limonciello@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220111225750.1699-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:208:239::25) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092af1a6-378b-4a42-350a-08d9dc428b7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4047CB8411DA4D5E3305B4BDE25A9@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGe4Akara5Qk7dvChgK9QGuEwvq0G2a6DVMnOWzjJmG/ZxUYzXgQJUCb3gfQGGO1Cl6z5P/nYNfdEPHaZOYoch/9Ii7xGtU7VVVood2/nFtP+q5flxmDTNdOAbVZ2AYMyw2wNbxIu5D+he74ldsS3JztJ8QV3vaCr5vEs9vVlkGpRvurcfRcgYvnUOFGOkd/9w5K6deSxIRkhF2IcbJnSGAJYxJMjTjwRDKYktmOjiCOtJD7g+sNIx7NnCgpVWJpxcrz4gvdQ3InQYDIQ4gXnkcmYYcvv37SAoIckrEb9pNdoi/ui+P2azb/BViyfFQTYLjxUf79kaKdKBLoH8zUr/XK1dPeiNemqyJnIZn0wLLeqestvJZ589rICMNPMGeeEqC6nAd9a5uyFFhDWvWJWUjMUwSMgoHG8RCMv1sBYvhlczSI4pJCAdhddFp3hJHt3FMP5mwAy8txfDU8AyU2sgG6iqywcS4bhdSOPC00bP+Htl2iUXbpS5eOfph2RN6ThH4ttmpIqs0/WfVRC1exld3ZBmFytQ/Sv5l6GIsGjMIOVdVC6o8wqoyE50kn704ndJ/jfzVjWirej5i3wdWLzX408YKFGOcaklLY5rlN205Kw2FIaMt6ois9rBcNRUy2gTBv00Ouo2d0ZaubfBGL0GoZh0lBYM4HlMxTQrzxAPWfsedGvmo/bMTAj9fuv227nGTN+PaieTabpAMlZFgyZBuvtocRGd7fTGV83WYzOov655K2naHXrjL8IiRODBAJun2JsOI8Vx0X51qWf4SNcAtSJ1/wPJ0zsID0NyUP2QfAVFbmmskKjg2Mahkyk/EjGeYkwLp78MGoUK6s9VU0ZOZZkpX4ufBN+nuq+9nA4Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(38100700002)(5660300002)(186003)(8676002)(66556008)(66476007)(8936002)(86362001)(2906002)(110136005)(2616005)(54906003)(508600001)(316002)(6486002)(31696002)(6512007)(83380400001)(36756003)(6506007)(53546011)(966005)(4326008)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGZ3TCsxSU1kVmNFbU9CV291WXd3NndEdWlJN0pDN0k2bVdSY2dIV0dGVUNM?=
 =?utf-8?B?VkxjSXNpTVpRbDNiYUlDa0hidlVabHdFd0ZyeG1JMGNMOGxwTU9ZL2dEbXRq?=
 =?utf-8?B?b2IrZVkraDh1eVFGYmxrY1BqcXl1aXFlVTBpQmpYZHd0T0hmVUVmK0VDVDA1?=
 =?utf-8?B?dUxGdGxNYnJ3czdKVG0zV3VkaVNsY1ZDMUQ0M1dDei85YWFsT3d1Ni9xUTI5?=
 =?utf-8?B?blNHaUdkYXFCUjZRMlFEOEFWaXFSTnFhMWdNSDN2MGp2RHNKdDhlQ0dEc1I5?=
 =?utf-8?B?bmJMWU9Sa1lVdTgxV2VPa3F5RzUzUmpNcjZ4M3M2c0tUMkdjZG4wU3RlK2o0?=
 =?utf-8?B?TzU5SHdKMGhnL1VnYi9jYjhSaVVBR3prZVhOOWVMTjdHU1VFeDhqTE40K2xQ?=
 =?utf-8?B?WlNhQk5JUUVTaCtObnZCU0tnQzVDRXJ4S0dKWmd4MUdzVmZ1MFZTK29MNXhx?=
 =?utf-8?B?WnU3eGRod1lGWUgvYzBsaGhWZzNzWm5LemVYbHlkMXVQcmRiWlNmRkZuVk5C?=
 =?utf-8?B?VFBFZXhpSVg0UTZ0NmEyM2g2czBQYk9haWxZSkF0RG9zaWg2WHZCWENmN0dK?=
 =?utf-8?B?TDRJQjFrQXdia1FrRVZubEN2cS9XTFB3ZzJYYlptV0xYOXdHb0t5WUI0blFS?=
 =?utf-8?B?Uk5RUTJ0Z3RKTmlXdXZ5VXZmZy9mMnFDM2ZmR2V5azN0RlRxaVVXMW5FQldG?=
 =?utf-8?B?SDZuUGlObkppd1ZGeG9LM0ZCeWs3WUdxZUV5TS9lMGMyWEdRUXlKRG1zc2tQ?=
 =?utf-8?B?MnJNdTVJa091U2NiMXFUaHg0TU9xTjRjTExNWTFvMkdnZjBXWUNROWt0ajA0?=
 =?utf-8?B?VnJhWnRBdXgrVWZLRUtZUXVSd1hRSUJ4U0RFdzliMEovckM2VE1sRW1vS3pv?=
 =?utf-8?B?alZZYXVyMXQxcTgzWHBCZllQZlNMd1MyV1FSUk41cVliTHE1Z2ZRVHBJeEFB?=
 =?utf-8?B?T1psUWx4dlRBcmw3Mlh2MFNWbW44UEV0VVd6Zzk1M2VQWUVhWlBOQWpCUlRk?=
 =?utf-8?B?K0dvQ0MyempPUnNFVmJrMVB5QlhGRWU4MHJiSDBtdk1hRDZFYXZuclJVZmZB?=
 =?utf-8?B?QlcvcnR6cWtuOGdzaWxmTGM0ck9ONGlMdDB6T2VSL2FiWURVZEwvcXBBZVp4?=
 =?utf-8?B?WkVwdCtjZzlLZDlhRjBoRTg5ZEI0cUNEZjdmSmM1UmxCcmNmRHI0R2dNWU9Q?=
 =?utf-8?B?NWlRZmdkVG5XalprZlg0S01oMFBQbkt3R1VvZlNndjhmTWFsZkwvZ3JFLzhJ?=
 =?utf-8?B?dGpUNUg5dkZvU3RiSVdRcDRsYnJVYjZEVFY3emdkV3FUcEV3R0xpN1JDcXJM?=
 =?utf-8?B?VDNqeWpmN2sxcTM3K3IvTXRDZGtRNStaMU1LYkQvTlF5eUFHak5yd1U4K1Zs?=
 =?utf-8?B?Sy9nMVlmb1RBd2tUSG0yalBmWDE5ODNmV0ZnbVo2MWM5aTR4dTROV3dqRVZT?=
 =?utf-8?B?SWRPNXk4MU8wZXRaRm82U2xZaVJld2toTysyY1JTdWpIbVBMbHJOYWNScCtH?=
 =?utf-8?B?TXIxQkRnWnAzdTJJZ0ROV0JiUzYxNE1scC9FWG90eG1maDl5K09idGRDdUU4?=
 =?utf-8?B?Sk1EQjJMUFdrdEhyOVRWK2FSUmhEY2Fra29KN3lJSUNLQndWQmU2M2oxK05N?=
 =?utf-8?B?MmhiRzlUZkFYU0Qzd2hKQm5WYW9SQ2E1S0lWek9WZWhVdlNTaHpzU2xIbWdY?=
 =?utf-8?B?Y2E4RWs5OXdGRXQwbFZHcHlBVS9jNWdldXFrUlB6K1RQdGd0Ri9kN0hheDhE?=
 =?utf-8?B?SkZtemZXK1pVcHRVNjdIYjNsU1hXbnRPektVcTRuVWxVb0NScE9FQ1M5MEdY?=
 =?utf-8?B?R09TV0V5SGdFS0IwaUNOdjNycElXYmF6Sk5GaEZWQXI1Y0dPdWk1dzFFNE1C?=
 =?utf-8?B?eEEyRitmWjYvR01OZEhvT1g2RzVIVWhrWGN1L3k2SDVvQnY4YjVYOTA5WDVr?=
 =?utf-8?B?UHdvM01OT0hQUUQvTmpVeGRhcG8xU3NJWHdLVnVVOXlCNGluTCt5SCsyb1RC?=
 =?utf-8?B?K05GUVZ4SFllVklJdXMvRVhEMTlJTmNqdzB3TmZKSEV3SUlpdjIxVjdWOHFo?=
 =?utf-8?B?RytUaUF6eG5KRTV2aFdFanpUcDhaWU1UZ0crdWlubkxTUEQ5d1kvd2p5WDZo?=
 =?utf-8?B?VzBGTmcrMWJYVlR0WEJKN0ZROXZsSld2c1pWSTdpWmIraTBGdUZJeUpaWE1u?=
 =?utf-8?Q?wssjAwXwOSo9biZnH3Y+MXI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092af1a6-378b-4a42-350a-08d9dc428b7d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 18:27:41.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWDUwRji/wJIZdcIUIZBG/QjCPeMZIByp4lQuqhajArmaYfLmcZc4K6+VE7hyb1oLn++mqGJSLu0mspw2oIilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 1/11/2022 16:57, Mario Limonciello wrote:
> Setting the century forward has been failing on AMD platforms.
> There was a previous attempt at fixing this for family 0x17 as part of
> commit 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon
> platform") but this was later reverted due to some problems reported
> that appeared to stem from an FW bug on a family 0x17 desktop system.
> 
> The same comments mentioned in the previous commit continue to apply
> to the newer platforms as well.
> 
> ```
> MC146818 driver use function mc146818_set_time() to set register
> RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
> reset value on Intel platform to 0x7.
> 
> While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
> DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
> as reserved.
> 
> DV0 is set to 1, it will select Bank 1, which will disable AltCentury
> register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
> (AltCentury), the CMOS write will be failed on code:
> CMOS_WRITE(century, acpi_gbl_FADT.century).
> 
> Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
> enable AltCentury(0x32) register writing and finally setup century as
> expected.
> ```
> 
> However in closer examination the change previously submitted was also
> modifying bits 5 & 6 which are declared reserved in the AMD documentation.
> So instead modify just the DV0 bank selection bit.
> 
> Being cognizant that there was a failure reported before, split the code
> change out to a static function that can also be used for exclusions if
> any regressions such as Mikhail's pop up again.
> 
> Cc: Jinke Fan <fanjinke@hygon.cn>
> Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Link: https://lore.kernel.org/all/CABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw@mail.gmail.com/
> Link: https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/rtc/rtc-mc146818-lib.c | 16 +++++++++++++++-
>   include/linux/mc146818rtc.h    |  2 ++
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index dcfaf09946ee..3c8be2136703 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -120,6 +120,17 @@ unsigned int mc146818_get_time(struct rtc_time *time)
>   }
>   EXPORT_SYMBOL_GPL(mc146818_get_time);
>   
> +/* AMD systems don't allow access to AltCentury with DV1 */
> +static bool apply_amd_register_a_behavior(void)
> +{
> +#ifdef CONFIG_X86
> +	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
> +	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
> +		return true;
> +#endif
> +	return false;
> +}
> +
>   /* Set the current date and time in the real time clock. */
>   int mc146818_set_time(struct rtc_time *time)
>   {
> @@ -191,7 +202,10 @@ int mc146818_set_time(struct rtc_time *time)
>   	save_control = CMOS_READ(RTC_CONTROL);
>   	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
>   	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
> -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +	if (apply_amd_register_a_behavior())
> +		CMOS_WRITE((save_freq_select & ~RTC_AMD_BANK_SELECT), RTC_FREQ_SELECT);
> +	else
> +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
>   
>   #ifdef CONFIG_MACH_DECSTATION
>   	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 0661af17a758..1e0205811394 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
>      /* 2 values for divider stage reset, others for "testing purposes only" */
>   #  define RTC_DIV_RESET1	0x60
>   #  define RTC_DIV_RESET2	0x70
> +   /* In AMD BKDG bit 5 and 6 are reserved, bit 4 is for select dv0 bank */
> +#  define RTC_AMD_BANK_SELECT	0x10
>     /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
>   # define RTC_RATE_SELECT 	0x0F
>   

Hi Alexandre, Alessandro,

Friendly ping on this request.

Also if it wasn't made clear in my commit message or by analyzing this 
code change, I do believe that at least part of the reason for the 
previous regression was because of mucking with reserved bits.  This 
patch is much more conservative.

In my testing I found similar behaviors from the old regression on a 
more modern platform when those bits were being touched.

Mikhail,

As you flagged the previous regression, would appreciate if you're able 
to test the new patch (although of course many things in your situation 
have changed now).

Thanks.

