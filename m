Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52DF49548C
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jan 2022 20:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377371AbiATTAe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jan 2022 14:00:34 -0500
Received: from mail-sn1anam02on2089.outbound.protection.outlook.com ([40.107.96.89]:5722
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346922AbiATTAc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 20 Jan 2022 14:00:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2pnQa93tmKGL1JmkrrkDUT7+zGSbAvThqq7Fs7w2+1mR5ZrJyJ2PaeK885c66ZaB/YktL7p3lK9u0JDyROw/7MElPzz+2h1QaKsii1Wfo3I/ugTxJhhO6R20wR1nuO6Mv4hwOMLqJkGODeSUEnscQ9ngqSoPqnm3v42llMjruSsUWFMf431sAGgR3iIgwP4attPycOZVPtOzvaZsowggDfdaaGDQ5uOLRNGQI94MBqlPPzIlY5GqQaLy3Fw3HEWPIFF4t/gUd/yL6AMohknQ1isnpyRYJHCm9I8kmoBRf7angLACNFU6N0/+HMXc7HEtGgUPzakvYnji01w4esqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLzcVsNbR6lqAX2h8jQ1BMGm7auU+X7/ELxZ3L6RhNo=;
 b=H8H4ZNiU1KB8nS5DKMiKP7gLcSCxVR0JkmoDuocLKj7Bv+FJ4QB+E51vU+Q7PYzzZF6HGDxKCyNo4M95lE9N4osqpbrcieovW/M+mZgeay04gXeeORW402sDpfWsaimD/2j95OBmWGCmWTD81/A4S1q7kTt5nxvaVEUwEaciXq88PeRoYLgQvNOQXQarn4nnMjQhk97wDRBzbuQvGfBM/ybJCE3ftnUvaDJNCy3eERiLICPbRHyyYoyjXStSUGSTU4AUoxMLs+mwBAUeF5JXSAZ5XRRIBD6QIgDgBOb5ujJZJk8WG8zmVHJsxBrMXsEx549/z8HsZOcFQj643b1rAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLzcVsNbR6lqAX2h8jQ1BMGm7auU+X7/ELxZ3L6RhNo=;
 b=ohbwKfIehBdXnG+P4GVTFfnCZ+QHV5PqNNcdDdIzqrd8quB45f5BidJcMcBiJFRSe79hL9ZTvKgOCbyKebvUqy16Du27VQnk2UuRKG3OrJKkfvFagoGEuQPff+PYxu974JZ5UEn6vdXo4FbIO1AHvzVWeD27CspWlM73e31Kxkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MWHPR12MB1744.namprd12.prod.outlook.com (2603:10b6:300:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 19:00:28 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 19:00:28 +0000
Message-ID: <9547186f-7be0-80a0-cc2a-e259ee320c91@amd.com>
Date:   Thu, 20 Jan 2022 13:00:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] rtc: Fix the AltCentury for AMD platforms
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, Jinke Fan <fanjinke@hygon.cn>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Raul E Rangel <rrangel@chromium.org>
References: <20220111225750.1699-1-mario.limonciello@amd.com>
 <dd1b3f97-316e-09ac-05de-43fb1320c5b0@amd.com> <YemwVn65H2yotmfd@piout.net>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YemwVn65H2yotmfd@piout.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:610:58::16) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e29825-6312-4465-3872-08d9dc471fa9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1744:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1744F9C6AD25643319CDE112E25A9@MWHPR12MB1744.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTPv0dYiKXqZ7gXuaSP2kglA/W4mFGQOSfdg7KzDZt9F7ynGCy+jErAIBVl0+dTOFn0T9afR/9CmMyFkImhL79Sbp9dgGRpnFIOZr6Z4JGzt228CQGNqK5GHst0uY7xxQH4mdgfBm2b0wLT5zz+6SwdN7u6m1JhJMINfZXa5TvF6YRd1gSpNzYoklrbSkRyRHWHTfQlQ7yLsCgaHdsLyhp8MhQh5mxU9wAa8UfBNVJ3ccC5nNjjSPB3qj/r+7nUpqTbWAjLI2ePlmrAAjhgyD8D2FmyfGv1d98Go2h3gepSmXPDGLnVfeg+q+Gu0jKbxxRFglunQycil7+y1KEer6+APQZjZi+T2N2+fIEXXChSa+oxYxF9qxyW73DF6DqZeSQZfr/litzcrD90r3NmqPsHZRemGaKlDhlSkqoAult3fw5xqkA0e6b7rpSjawjRym3XhAFbuKfu0rNRCZx6fyMUWlA242D69me4njFNgzaqbJ1SAu8lKQYs53Pff87SXixTeg712Hb3wqawRw3qgkktBViIhIlBgFts16mItfIvFM2nOFbAMA23mUDK+PyyGKa3DvjiI+ksBybgusLNtmOBsCE1iDb/06iQO4g7Y4n4juIeTymiJpbOf1O8sdOencBGP+gLZmhlNW79MFYc55ciAAK2ubynVTvPy+X1aEINqvIfm7BdLMtnsN33F9z/PTwSUH75l4r+UfmNkxGsg9qcSdJNwbPau32Ud3hkjL2UJruQ2TxAW0peEBy/1KohetBTD65jbm46oU6nSnA9h4eeHT1c/oXaSpjjC79560wl1WwN40EugFhPiCZ+A5O5hhF7dCeKeHs5hkzAJ2SFsYVBS97VBjbWbX1qnD6lyjzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(36756003)(4326008)(86362001)(966005)(6506007)(31696002)(316002)(26005)(508600001)(186003)(66476007)(8936002)(2616005)(2906002)(6512007)(53546011)(5660300002)(45080400002)(8676002)(31686004)(54906003)(83380400001)(38100700002)(66946007)(66556008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mml4blliUkJIdlB0bk53ZVMyUTd6a1hhZFp0YkhQb0ZiR0NrM0RYR1dqK3Rk?=
 =?utf-8?B?RWZwRzhBZHQzMjlvSmUvSk9SRnh6cjRNWEdlazhsTzNETDVySnNrQ1pRcHFk?=
 =?utf-8?B?TjNpY0wyNGVSN3AyTmNJWGYvTSs5NWRCNXdDLzEzcmdBeHJCeGR2eGhYSXJw?=
 =?utf-8?B?b0FPekZWdXRhREZwai85Q0dnYTdTQTJYTzdqWmVxV0piTUtuU0oxN0t5UTRv?=
 =?utf-8?B?MndQaENWNmxLVmxGVFJXblFNUWx1Ly9hMnhwU1lmQW1LUmhCNll4eWxJSUJ6?=
 =?utf-8?B?NzFDNDMwMHd5UUxzVUN6Tzl3S3A4aFBHaTVhaUdNdnViQktNUmw1S1BuNnl2?=
 =?utf-8?B?V1ZVTEl3UmdEOUEyUkdCdzZraVNSbUhsZFczTERHMVNKVE0rSjZzTWtGbzZr?=
 =?utf-8?B?YUQyOTJ1VWVvV1ZUcHJ4WkJreHJISVZMZDljMEFDWXdRazc0K0pMQ0hMSS82?=
 =?utf-8?B?dUdFTVNHOUxicTBGU0t3NGxiSWJJZFVuMnBSYW10OG56M3hwZ01QYzlEcTNR?=
 =?utf-8?B?VVRQTTFzekJQdExBMmJOd1ZjZmpxL1NpaWdMUjczelVsOFdkWTFweEJCeXpQ?=
 =?utf-8?B?elAzbmpWQTNMdmJiRXMzQmthanlQcjYxOGs0Wlp6UThtTUpZNmdoRkxGQm1K?=
 =?utf-8?B?UDBGQlltRjBkRDkzK0lIb3NFd2IwMzBVUzR4Q2p5YVpPbEVRV09oTU1Pc0Fv?=
 =?utf-8?B?S2hUbXZ0R2E3aU5SY3I1Q01YbzI4V3ByaEJpaXZHNkNCOTV4b00rY1c2a08r?=
 =?utf-8?B?SkxlYWJhZkhGVGlwb09kMDVEL2tIanY1VDM5bm1MNVR3ejNySGphcEpCRXpL?=
 =?utf-8?B?eklFck15eDZNUTc4TlRpNWlNODZ5MTlZbzJzeHRZK29pU2dSZHVOVkNDMERv?=
 =?utf-8?B?N0pWZlpVSE05NzFRM1Z0aklEeHNoQ2t2M1pJbGg2cHFQdVlUa0VYS1NDaDBD?=
 =?utf-8?B?YjE4SEtZcWNNL2tIdTF6WWVoYlk1Zkl5S1BManFpK0d3K0ZvOWFMVU5zb0Zm?=
 =?utf-8?B?S2lHcnVldW40VmR6TVpmSmFnS3YvTnB6RDRhODl1K2duQXIvenZIaVhadTlZ?=
 =?utf-8?B?SHgwZFczVytqQTlQTEFxU1FZVm1hbXJtdlE2RkE5Q1ZkdmNUYlZNU0xUTjdS?=
 =?utf-8?B?YUlFT0dla0tNclNMSVRobG41NUczMjVHcFN5ai95ckx5aUk3TCtSampUT21w?=
 =?utf-8?B?cGROV00zMWUyaTRLU1hoSUg4TUo5VGs4ZjRDZ3hWN1hyd2gyNWdIM0RsNkJn?=
 =?utf-8?B?dkpRa3J4YU5hTWQ0TGFGKzNRTTN5M1ZYcTBGMi9DRWZtSHFObXcyakxSMVRM?=
 =?utf-8?B?dEs1R1JJVVo4MTQ1bjZQMG91RlZadllmQTE4WjNjYkk1S3RSVWFDMmtMTnJr?=
 =?utf-8?B?RlpnOVhmb0NNZkllYVNpcTcxSlN4UHVnb2hoQUs4K21uckV5ZUJvUGNVVDJV?=
 =?utf-8?B?cnRtWFFOZ3hpWk9lUjN2cmNtSVIxcDJudWxOa1I4eHllWjA2RHFOeGVpdG0v?=
 =?utf-8?B?OFhJWjNsVXV3ZFdvNWRUVE1FbzUyd2l1TWxiWWpJa3RFbHcwMjhHUm1xZDZX?=
 =?utf-8?B?MXM2QVR2NWFWSTcwQ2xLaXFOMDYvVmRJZEVuMTY2aFhROGEyZ0c5dVRGTExa?=
 =?utf-8?B?Yk5jbTlZR0IxS1E1VXlTMldEK0piYm1FSnNHWDBUcm1LbVVhNlBGd0dFamZP?=
 =?utf-8?B?bWJ6YUw3UlowNUtTUWZZUjE4WTBodE5pZGdETU1WTlVhODZtVnZpRjFrK0pT?=
 =?utf-8?B?SDlJYmlJTkhZaHY4VUI3RFRRdjNXU3BycWlYa0lxWEVVYlB5ZEdQRC9kMkUr?=
 =?utf-8?B?ZFlsZDFNTUg4azQ2WmVhL0dpVEFoejZDQlVySkFPR05HY2FZV2RCZFBPVlpS?=
 =?utf-8?B?MnpVZ1k4U25QN3ROZ3ZDNzZ4M0toa3dZemFUYWwyMmpTdW51aWpySGxkcTBp?=
 =?utf-8?B?SHpBalpzT05UVFUrSGZ3UzA3WE1QWjllNi8vRWtmUVhwYTZNUFBleVNOeVk1?=
 =?utf-8?B?cDI1bWpUWXVNRmxMWmZOK2IwbEdLQUovQ2Vhd3g0Y05iY2lGWHk4WTlEUkFZ?=
 =?utf-8?B?NEQreTYrY25hdU1KeXF0NDkvZVpsRG8rZXpkTFY0UW1CQWZJQlpEazc0SzNV?=
 =?utf-8?B?VmsvOEJCQU55dXhqYlMrOUZLNDUwQUg0ZStsSStmRnEwKzVXNWYyVHc3N214?=
 =?utf-8?Q?QoEuFvP57Lr3EA3NQlWHi/E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e29825-6312-4465-3872-08d9dc471fa9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:00:28.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SN0WSGhuVTjHmp6k7G81eCNfTrGtEXPl6G7gQwS2DhTb9vNayB9i7OkQukus6VdStNy0aBtQFoMK311JyMMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1744
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 1/20/2022 12:56, Alexandre Belloni wrote:
> On 20/01/2022 12:27:39-0600, Limonciello, Mario wrote:
>> On 1/11/2022 16:57, Mario Limonciello wrote:
>>> Setting the century forward has been failing on AMD platforms.
>>> There was a previous attempt at fixing this for family 0x17 as part of
>>> commit 7ad295d5196a ("rtc: Fix the AltCentury value on AMD/Hygon
>>> platform") but this was later reverted due to some problems reported
>>> that appeared to stem from an FW bug on a family 0x17 desktop system.
>>>
>>> The same comments mentioned in the previous commit continue to apply
>>> to the newer platforms as well.
>>>
>>> ```
>>> MC146818 driver use function mc146818_set_time() to set register
>>> RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
>>> reset value on Intel platform to 0x7.
>>>
>>> While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
>>> DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
>>> as reserved.
>>>
>>> DV0 is set to 1, it will select Bank 1, which will disable AltCentury
>>> register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
>>> (AltCentury), the CMOS write will be failed on code:
>>> CMOS_WRITE(century, acpi_gbl_FADT.century).
>>>
>>> Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
>>> enable AltCentury(0x32) register writing and finally setup century as
>>> expected.
>>> ```
>>>
>>> However in closer examination the change previously submitted was also
>>> modifying bits 5 & 6 which are declared reserved in the AMD documentation.
>>> So instead modify just the DV0 bank selection bit.
>>>
>>> Being cognizant that there was a failure reported before, split the code
>>> change out to a static function that can also be used for exclusions if
>>> any regressions such as Mikhail's pop up again.
>>>
>>> Cc: Jinke Fan <fanjinke@hygon.cn>
>>> Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FCABXGCsMLob0DC25JS8wwAYydnDoHBSoMh2_YLPfqm3TTvDE-Zw%40mail.gmail.com%2F&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7C3357df64bb864b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637783018746468575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=CzgBBpAXk2F6Aj1xuYtnUgN12%2BN%2F8CdJa3nexix3eQY%3D&amp;reserved=0
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F51192_Bolton_FCH_RRG.pdf&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7C3357df64bb864b6ef63e08d9dc468eae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637783018746468575%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=l54ilxU2BSuV7L%2ByptnzFFOYqm1gN4M85rzdhmgEJro%3D&amp;reserved=0
>>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>    drivers/rtc/rtc-mc146818-lib.c | 16 +++++++++++++++-
>>>    include/linux/mc146818rtc.h    |  2 ++
>>>    2 files changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
>>> index dcfaf09946ee..3c8be2136703 100644
>>> --- a/drivers/rtc/rtc-mc146818-lib.c
>>> +++ b/drivers/rtc/rtc-mc146818-lib.c
>>> @@ -120,6 +120,17 @@ unsigned int mc146818_get_time(struct rtc_time *time)
>>>    }
>>>    EXPORT_SYMBOL_GPL(mc146818_get_time);
>>> +/* AMD systems don't allow access to AltCentury with DV1 */
>>> +static bool apply_amd_register_a_behavior(void)
>>> +{
>>> +#ifdef CONFIG_X86
>>> +	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
>>> +	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
>>> +		return true;
>>> +#endif
>>> +	return false;
>>> +}
>>> +
>>>    /* Set the current date and time in the real time clock. */
>>>    int mc146818_set_time(struct rtc_time *time)
>>>    {
>>> @@ -191,7 +202,10 @@ int mc146818_set_time(struct rtc_time *time)
>>>    	save_control = CMOS_READ(RTC_CONTROL);
>>>    	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
>>>    	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
>>> -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
>>> +	if (apply_amd_register_a_behavior())
>>> +		CMOS_WRITE((save_freq_select & ~RTC_AMD_BANK_SELECT), RTC_FREQ_SELECT);
>>> +	else
>>> +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
>>>    #ifdef CONFIG_MACH_DECSTATION
>>>    	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
>>> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
>>> index 0661af17a758..1e0205811394 100644
>>> --- a/include/linux/mc146818rtc.h
>>> +++ b/include/linux/mc146818rtc.h
>>> @@ -86,6 +86,8 @@ struct cmos_rtc_board_info {
>>>       /* 2 values for divider stage reset, others for "testing purposes only" */
>>>    #  define RTC_DIV_RESET1	0x60
>>>    #  define RTC_DIV_RESET2	0x70
>>> +   /* In AMD BKDG bit 5 and 6 are reserved, bit 4 is for select dv0 bank */
>>> +#  define RTC_AMD_BANK_SELECT	0x10
>>>      /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
>>>    # define RTC_RATE_SELECT 	0x0F
>>
>> Hi Alexandre, Alessandro,
>>
>> Friendly ping on this request.
>>
> 
> This was sent too close from the merge window to be applied.

I suspected that for 5.17 - but could you at least review it for 5.18 
and ACK/NACK and if ACK put it in your -for-next?

> 
>> Also if it wasn't made clear in my commit message or by analyzing this code
>> change, I do believe that at least part of the reason for the previous
>> regression was because of mucking with reserved bits.  This patch is much
>> more conservative.
>>
>> In my testing I found similar behaviors from the old regression on a more
>> modern platform when those bits were being touched.
>>
>> Mikhail,
>>
>> As you flagged the previous regression, would appreciate if you're able to
>> test the new patch (although of course many things in your situation have
>> changed now).
>>
>> Thanks.
>>
> 

