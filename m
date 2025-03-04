Return-Path: <linux-rtc+bounces-3383-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C40A4E2D2
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 16:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E89188090E
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 15:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C68266B77;
	Tue,  4 Mar 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q9xvxPu2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1741FFC70
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100420; cv=fail; b=sLlsSV5gDIco5dzPV0X7Septw5eF6Zn6hRRShA/A93NI36jy5HFPKXvvFjYA+7psg0/2aSFMp+0uyUE1gAe7P5oQ/vNHLvlHARZp6fVNmtmO0VUoQ1/YCAItNKxkUszqQtka8MCXGq3+l4kzaUgYwToySpZWNtkh3uHvsHcEOoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100420; c=relaxed/simple;
	bh=ixT5AOET3fAWri5WkccIxLXehFhzCudG4LWQ9dMG8zA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nzF4xTMYWQ+u1+NMNa7HhRX5qTdjVXBpNALm7D5lwE2gwT2lsLLNFLn/idDfK42/LDbvQNd45lMW7ZUG/A+yp+6Rmxq3ZndAXolxnHAsuejs7dMV/eZyW+jYoPKIwsOVICkQfoYTWFZ0yqSSbeS1QYQcPeZw4KOCz0TcjysZgYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q9xvxPu2; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJotL6fhZYJZVxhHvtn4ZdYvHyKuBoi+r2/RXEwjsixmaHegLxFli4JL1QDAknk3RRIHQArFui5/g/gGrg5SveNZOYGt83cdix2JAhJaSZS68FgeM4wyR1vHiPb6IHkBEfNmgoUx6CW3YRtVr361UOhE0TP0Jc5msrfJzuYtapByEviQ/a5jb/EVpjbNX5RPN+UbVw0+JuYW5PZeNSZJ19v8XvQN9Cw3oLdYVyXW+Ci1H2zdhFe/IdRt5Ut+zRHPSLfmDin/dyFSH/RpR9OeanJrfjPcA9Pb7Q3uWu1ayX9TvukvP1qZDng6FoNXM4gqqDugaXOPYh0luDX528eliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsV1nhPd5vZ8gEQy1qpZhM7SvoOObaQ9mH8IxTvyKrY=;
 b=sxs9DBS/oRnbJpTeJtxydAozOwB60MVMRnKGRHVICUBdOQ2MCd7iZDoXB6vUcVevmxHihpKa9LtWZx2J2PIaCFurAFZ15dDxUme4uvZDKT46sZ5Tk8PawRyFLwdZnkA/129k/Z5GSi2jTDaXNdw7+IrQ0h3sfvPpExh54Msb7WY68jNDMaK4uVr8k+jYxjEfab3KPjwJejyhSRWSiEY37Ml/H+qI2vE9Yu0eR3ax+skNtz4h2b66AuyUAPDJ2ZudUoYzhE6aNnoCV74ttF5tzeXogIBVK1wyYc+NXXR0bo5TynOM026dcppv80dUkCx7w6nVu0jiBWbBU11Rie0d5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsV1nhPd5vZ8gEQy1qpZhM7SvoOObaQ9mH8IxTvyKrY=;
 b=q9xvxPu2iWRwzHgHASChxFHNv+ucB081Ots2KBtovtnzp4fCjQgVjpoiHKfYOYZwBnGZrdp7f19UAG83WSrokLBVhg8f1q6m3BNcsDmOtv5i5IA7XGdixrb2IygSORLZjMIIqrdhrySOda5eENS03v/TEp5kNlyo+S6yON818lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 15:00:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:00:14 +0000
Message-ID: <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
Date: Tue, 4 Mar 2025 09:00:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: LTP rtc01 RTC alarm test fails
To: samasth.norway.ananda@oracle.com, rafael.j.wysocki@intel.com,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:806:24::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f977e2f-145e-4c7b-4bb5-08dd5b2d4479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anBESjNJdWxnampra3VuZDNOMHp3dEF4ODduTUNjTEdjcFBmekhjbExsVk85?=
 =?utf-8?B?aGtoRFU0aDg3N0doS2IwY0dKM1djTGIrUzFHWUJqUUlLb3d0Sy9aS3NqcjRG?=
 =?utf-8?B?MVg5OGljYWdtdEZ2ZXBOQWtMTDBRZXgxZ056Q2hlRFZnQ1VBcE1PZVEvd1M0?=
 =?utf-8?B?VlJaZ3RlMVA4MUs4a1Ewamhiam9aaVAvRUNiUVAzVmZJVXVhQkRpcTFldFN0?=
 =?utf-8?B?cTFuc3VlRTZGRU1HcC9jOTRzY3U1TG5IYU9iN014Q2FyTE01L3Uzb1h5NlNQ?=
 =?utf-8?B?bVc4MVZ0Z0I4L1JjTk5HVXFNWTNvZHplVitMWklxMi9NZHd1VjVmdnJrSjZt?=
 =?utf-8?B?bmIyU3FkTXl2NFZjT3l1amZmck90L084VUg0cWFSU21SN0VZZThrVVdSN0pr?=
 =?utf-8?B?ZjZiYk4xL0pubHRjRDlZZWdnNE94eUFjY29Db0F5YzFocnVhV1oxMFNsR1VG?=
 =?utf-8?B?MnNSN1ByRU9UZ3FmaVpBRysrWnJxL1FsZXpvZlFTMzkrbzNwWW5qaDc0Mlkw?=
 =?utf-8?B?YVA1allxazBWRW9OYUNCZzRScGtxcjdnYVU1akVWWXl6Z2tFT1M3MWpBV1Vx?=
 =?utf-8?B?SHcwUzI3Y0llblVBTEZyVE5ua0pvUTFzR3liTnlqeXNuS2VaSlNtV1pkUVIz?=
 =?utf-8?B?Vk5zQlhZd2I4WnFrZW40U251UHNtZHdyVmM4aFdUc0NIdXZRRTYxUEo4UlJy?=
 =?utf-8?B?emYzSFliVTFiaGdaMXZIcUUxYzBvZnJIZUw1ZFh4d0FaZ3VTUG5YcWFUNTVv?=
 =?utf-8?B?UVBqY21mb2Q3WE1vMjNwRVhXOWdhTUphOWNxMkF5d1dVWkNrTGFpYlV3aXpm?=
 =?utf-8?B?eXRyMDRyMWpRaDQ3aTV5djhaSGZoaWJRWitrWUFFb2g4aTNraXB5aUZsL3k1?=
 =?utf-8?B?ODBWRWs3TTMxK1lvaWorZE5teitCN1hkY0dONkJvVUg2N1lvd0hSTEdVNHZH?=
 =?utf-8?B?YUVtaDYvakRQUnluNU5sNTJYUEh0eWVRV3BIUjRqcDFuKzlhdWJqL3pLZ1Jz?=
 =?utf-8?B?b2Y1K09RTEd5SGh5enE4bk5aWlZ0aUhnSm1HM3gxNXpNZjVpUHBZblpiYmFB?=
 =?utf-8?B?THRmKzRScGducTNhdUNIb09zQy9CUXlTSXlMRGwvWTFScHJXVC9PY0MycTBk?=
 =?utf-8?B?d1BmMjhJTCtnNzFjT1lrbnZ4cFFjN0hXVDhYSjFoN08wY3JrUHdmTDVJTFBS?=
 =?utf-8?B?Mm1DdElIcDU1YklJSlZldjJqVERqWSsvZUJ5L0N1VXJQaUNwYXQ1TUJ3alND?=
 =?utf-8?B?dmxUM3laaGFHSzNTckxDMUJ4MjB6eEtzL2ZmUHNQY3oyN3hNOVh1WHN1cmI3?=
 =?utf-8?B?TS9SZUdibEhvbWd4R3V5RlIwRjdUbnZMQkpIZ1B4MnJPV0hsM2FsL0drM09m?=
 =?utf-8?B?VmpkV0dkZnVVN1ZXaExNK1d3dGJPaXkyU0pyYlhkL2hsdmYyUi9ESm5DOWRt?=
 =?utf-8?B?bjhIWnhFakpoUTVNTy9rK0lRdjB2dC9xNEJwUFJMZWNIOE9DeGkvRDRRWjZ6?=
 =?utf-8?B?VkU1dkk3ckh5NGw3Yms0ZmIxQlQ0cU1sT0hoZXMxY0hzK1lCMmllSnl4Tkpi?=
 =?utf-8?B?MU5BR2w0WnZGOXhxRzZPTkp6SzRacU45eWlnUWtjMlJZSTdGMjBFK0ZZRnBo?=
 =?utf-8?B?RHJxNkZWcmxxeUF0WXpqYTNzc1VQU3l3RE8yR0cvSHU2UzBJTVhVNzN1d21R?=
 =?utf-8?B?Z1dsZHFpVU5iWDZzS0JHNUtLVHBkSG1sYldtNUZ3WHI0amxNYkE5M0RFTHZr?=
 =?utf-8?B?K2oyMzBxVW55Qk85YWhGSEtPRjJvaE1MVHlkYWVlMC9IOFN1dEhWejg0bVU5?=
 =?utf-8?B?RGUyLzBaODZUd1RJTDhxR0dKK3BMbFlFUDVhUDZ1dE1JdFhocDFaWDRoSnFq?=
 =?utf-8?Q?DS2GL+KT2pdHL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGprUjR2c3pvZ05oME9yQVhHTVlhSU5vMXVUOEgrajhGeGJVZ1Y3UmxUazFp?=
 =?utf-8?B?amZiN01MTGRmbEkydEZ1bkZKK1BTYlhEZ0JhZ1pvREdCNkphMjdwYXY3aUs2?=
 =?utf-8?B?elI4M1M0WkUzQWEvdXVGczZwaUxBTlBSZXlEdmxML3FYcGZtdThuZ2o3bWRl?=
 =?utf-8?B?LzdobS9xSHIxNFhkZk1FYWE0Nll1SWpESmxkcDNaWEdNQlhDemNiODVqeG1H?=
 =?utf-8?B?R3NkTVJEWHgxVlhsNE1aaHE1ekFTY2NKMDJsUW8wcE5HTHhZUHJwdUs0SG1W?=
 =?utf-8?B?QlBENXZodGxRN05Qa014TVFPdmlhcU1JOVZMNytieUZaVi9qVjR3bGl0WWV2?=
 =?utf-8?B?UHJUSUwwT3RZNW5EOWRiTi9mNlQ5NHpsdFZnc01mSHhZTGxidHk3MlpPRXc3?=
 =?utf-8?B?cmlmcS9aVUZuSG9HSUhjRExGVnBzMVVMa000aCtYbDRZeUh5bGVyaVpiNzFC?=
 =?utf-8?B?b1hOMWNsUGRHZGkrbkF1Si9TeEttb1FycmlQYkZyeGpOdDBDTVdVenFLVVFZ?=
 =?utf-8?B?Sy9vRkNjSkZPTWZ0bk0yR1dnQ0dLMlNha1NCelVoWTNHNW8rbVBPcFhwMGFG?=
 =?utf-8?B?UXZIZU1MSmN1cXhlYXliTW1DS2J2WnpPOTNIUktjRmh5cW5vUzBsU3NtaHVR?=
 =?utf-8?B?TTdQSXZTeTllbzFRZXZWd0tGMTlGUHorb1pQVXg3Q3NlWWZmZTdQSWwycmUw?=
 =?utf-8?B?K1IvbWRIZjhXU2plMU9GL0IwVTRucGNaOVE3dnNKb1V6U3UyZE9jS1RNY3g1?=
 =?utf-8?B?Y2s2UGU3SDN2M2UzR3hlTHlCd3Qya0dxNTlmd2QwU2FyUkZKTzJ4dWR1ZXUv?=
 =?utf-8?B?SXVNWTJDOHlleTJQUVhkQ1YvMk1SUWZFeFlrOEMvWHRHTDVoTDRkZTFtaE5K?=
 =?utf-8?B?Z1lUYkJ6UVJQaUhFMEV4dVo5VndHTHZmZ3ZyaWJtdE5CZWFZWnE5RmtJZlZD?=
 =?utf-8?B?RWl0cmtCYUMwK0F4TU1pMVF5WTNiM012TW5ud3NaZi9BQU9wb3RZYld2Rmxj?=
 =?utf-8?B?WklmMXMzUEF0akNxY1JXdWZ1UkMvcU1paXVYaEswYXhFRmJTZ0dvRUx2ZUFv?=
 =?utf-8?B?VGFuWnNTMVl6dkRjM0VlTTVqbmFGdDZRZHAwM0lSSU5UT3hQQ01tSldFTjVO?=
 =?utf-8?B?M3NTQS9GTVY3Ky80Uyt2VFJEcC9vaFdqcGw5RVBYZHhpS0pSV290U0RNNjhF?=
 =?utf-8?B?Ti9KRjhNY2dvRTl4SHdQTGYyZEVhMzYwM1dsRloraHI2aUg2RkxxM2FpNDJU?=
 =?utf-8?B?bS9pMDl0M3JBVjZNalkrYTd6TWFxSml3cHlGQXlsc0xOV25qcS9xKy9FeDJH?=
 =?utf-8?B?eWNKeXVNaWhoTWpoQkRUUTFUaUsydlEzWFFaT1Z0Vm1YWmIyVlRLM3Q0SGFh?=
 =?utf-8?B?WExkRExmc05kZnZ3OU82dUN3SVBMdXErK2NmTVdZS0lQMUlnOUZIVFBpejdU?=
 =?utf-8?B?Zkl3eWZOdi9KRFhqZVFHSUtndUltZUZQT3ZDTXRoa3ViTmYzNGdQaG5iVU92?=
 =?utf-8?B?ZzJHUnlGZUluTWQya3ROMlFDTTRzZDREbUJyTWxSN2xlZTZIVlQ2MnhDNzdv?=
 =?utf-8?B?a3BFTFovSk93czVYUEFwS3c2YjlkaTJDVW9wMTlJY0NicDFBUVdWSktMMFc1?=
 =?utf-8?B?eVhXajl2dytIU2dWdHpud1BpNjczdGZaWUwvWUxsTml5TE5UWC8vMUtjZnhW?=
 =?utf-8?B?L2xqbXkzc1NpTGdoaDVRRUFLUmw4Tll4aU9maDkzWDRKUklrK25zQ3R6dE16?=
 =?utf-8?B?V3lYcjB2cThVT25kOWt2dGt4Lzh0SmQ2dFI3MTBVMWRML3daM0dya1FTTGZS?=
 =?utf-8?B?VWJacHlmeVg5bmNwT25BaFVBK0dQUEJGWjdJMXNBWWgxNERiSHRsL2xWMFNB?=
 =?utf-8?B?RWhVUkdDRDdud1ZUSTdVYnRLS1I1QUVPTlppaXVnOGcwMlA3VW9RM09PNUJH?=
 =?utf-8?B?U2ltRFNpQUdnRXlTbGo2cm9SYktyNGdjYnU4VzIyU0dwQ2hwSjd4Z2RCZk9n?=
 =?utf-8?B?dmtzaVRmUWtJaFFhN1FqdFY4WFNhdWY5K0ZYUXVjVG04dlpabUltcEZlbjdh?=
 =?utf-8?B?UXY2S3NONEVTRE9BVjBqTjdvb3RZWERyVmFUOTAxcitScW5OVVhGcFFERmsx?=
 =?utf-8?Q?+IAli4/WT/V2dkQjdAa666kFj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f977e2f-145e-4c7b-4bb5-08dd5b2d4479
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:00:13.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AbKtOUF+vuqGJ+InlkD7FVQ3Dfh/sSpBHdSCgk3BuesuAYRonyvtEYjaCcwW9EAoHjb/Ug72MUDZ63hO39WUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598

On 3/3/2025 17:48, samasth.norway.ananda@oracle.com wrote:
> Hi,
> 
> 
> We recently observed that the LTP rtc01 RTC alarm test fails on intel 
> based VM's. This seems to be observed after the commit
> 6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not check 
> ACPI_FADT_LOW_POWER_S0")
> 
> I noticed that the use_acpi_alarm was set to "N" before the commit, now 
> it is set as "Y"
> 
> # cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
> Y
> 
> #./runltp -d /tmpdir  -s rtc01
> 
> <<<test_output>>>
> incrementing stop
> rtc01       0  TINFO  :  RTC READ TEST:
> rtc01       1  TPASS  :  RTC READ TEST Passed
> rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
> rtc01       0  TINFO  :  RTC ALARM TEST :
> rtc01       0  TINFO  :  Alarm time set to 21:02:25.
> rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
> rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
> rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
> rtc01       0  TINFO  :  Waiting for  5 update interrupts...
> rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the update 
> interrupt
> rtc01       0  TINFO  :  RTC Tests Done!
> 
> 
> I believe that the hypervisor may not fully support ACPI or may 
> implement it differently than physical hardware. ACPI wake-up events may 
> not be properly supported or may be emulated differently in the VM, 
> causing alarms to not trigger correctly or time out.
> 
> On AMD all instances the use_acpi_alarm is set to "N" so no issue seen.
> On intel Bare metal instances the use_acpi_alarm is set to "Y" but no 
> issue seen.
> But, on intel VM's the use_acpi_alarm is set to "Y" and the issue is seen.
> 
> I even check with
> # acpidump > acpidump.txt
> # grep "FADT" acpidump.txt
> 
> no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.
> 
> Is it possible to know we can address this issue? Should we make changes 
> in the LTP test itself? or in the kernel?

I'm a bit surprised it didn't also affect AMD; but maybe that's because 
of the specific date of the "BIOS" for the VM.

To me this sounds like a hypervisor bug though.  Could you add a 
condition to detect this hypervisor and exclude it (and also report it 
to the vendor for the hypervisor "BIOS")?

