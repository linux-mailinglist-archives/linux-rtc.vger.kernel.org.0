Return-Path: <linux-rtc+bounces-5630-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7DCEE3FF
	for <lists+linux-rtc@lfdr.de>; Fri, 02 Jan 2026 12:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBCEE301767C
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Jan 2026 11:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB702DCF46;
	Fri,  2 Jan 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GytaY+J/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD82E040D;
	Fri,  2 Jan 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351732; cv=fail; b=ciZGZanJH1Fu8qFj4Vm+OW+kwltm8WYwhqlWXKhQclZTVknxlcelxvTeclVjHVMSYGXdPJQfHuIbiq/VKWPRQIO1W/+flXeeSPKXaaJXRDoHSDbzR1KyD7m/U/a3Sp18wfqW3BIDYvfDfYGwHgr/dV9l9NP3+jbnm1iaWjTHLb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351732; c=relaxed/simple;
	bh=KKfeeG+mPSSOmUteSwE+h3ptFDgH/x/NvemZIVHAW+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lx1YT6qQNf0G5CYSc+nF0UPyeOUpCTMjx9eX6ZdqlzxvyZJuvO/az5Wg2bGfCHNtj8/BpZkwzJm9Dv8MvuKjVcxG0KDMdcN2BP9J2mx/Z6mwPiuc/5rcjtL8f7YCOHxSKcpHhAQSdNTc+Sx6sItnmOyaPjSk5Bejogus9EbWg80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GytaY+J/; arc=fail smtp.client-ip=52.101.46.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7jvHhOMATT5W44yLhdWej+PLZ9cTODPWMl7CJfcWLMBkz5zMBmaXBAk2giNEtvjW5PHZlWhCVH3VjZmPb4ET6NxuOsw4dDx2VNorhVkGSE1Dd/YUlJFlzkMH0VuFf7sPdm6A6OUCBI3YtZkVcz21cF9QLB7thqhns8Ytx26bM2NJ/YVrE+Ywy65hv3rDPOcP/exgCFfL/rGzvqOW+2kpfOVU1fbTLM1HoSoZLxlOZyUGoMiGL5HAatXxzTu5dXaSFp4k0CwvAW3AOThsB6/wBB8lpJyYM+sgUI/1EBO3Lvstoo45opsACAmmPw8SFagW6UekjOcMB1HCMzk3feTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fmefWQ60LbRsp0Wm/UGIdw18GoX1yhU6Draavjs79I=;
 b=r4NyNqCX0zc90LGQIJRqmMFFw0w288Oh0MFD7axrxf9HYIXZDmQGWIM4ZqC8pnI0568Q2SJ+1mun9xVEULqLXErtzv1ByhuJfvJutOVQV1tBMNv0Cp6WL5DlVxieTex5LKO2wtTkJfL8Jy8hXD1TzWdI1DS5phIK/r41Fb1OuQCWJHvhhWU4ilnYQFAuVU4r9Op+n4frqjnqUQFj7tAoZGTAm3ZZjjpkOHoAuq0sgEfQ03JK2MXmWScYNqNLY+s+2hGf+nr6SVsHO4iFu6j94UoAzRfNl4r4RFCkgoNrKRrFsHN4/hcEk3QcaWrNFiTnrRFFvkhT+l20KOsL7VU5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fmefWQ60LbRsp0Wm/UGIdw18GoX1yhU6Draavjs79I=;
 b=GytaY+J/ApuDRa0kuFh/C4HS3ZuAcKhMB4u3qKxjRnDpIsO6jgv6HFFeDlDypzGKg9CZ3IaB+56hABj/BStY1/M+s85t6ewbAKSTAIajnoSPOvC3ipldLAjReMdz2ExldUqprctm+3Gu8slFOiGK0lYk6g4TbAgpU+vR/66Xet+wodvZQapf+fP/Op808C9mOKX9hdB9o7BYvxJKylEVAO1p0oj1lm+XYksQLLnUYnRUmcsl6wPqPM1Ytl8uGPBhdGeLIYTmaK/7cZDrOBVbVe7hq2s8hgVkpYWMexkucRIrBb2XVsVE9Qyi8n22hG+q0KQmarU/m2Vn3a1KzOcDjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PPFDC28CEE69.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 11:02:03 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 11:02:03 +0000
Message-ID: <dd1f2ecd-033b-4b10-bc27-f561ec315808@nvidia.com>
Date: Fri, 2 Jan 2026 11:01:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: nvvrs: Add ARCH_TEGRA to the NV VRS RTC driver
To: Peter Robinson <pbrobinson@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: Shubhi Garg <shgarg@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251222035651.433603-1-pbrobinson@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251222035651.433603-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PPFDC28CEE69:EE_
X-MS-Office365-Filtering-Correlation-Id: c562c631-2282-4147-5ec8-08de49ee5c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW00MFREN0p1UUlzMTFhTTJKaU9QQjFCbmFkemo5ZHd3aUZoNDlSMTFqbTJT?=
 =?utf-8?B?bGl1eitXNEpTUHJ2ZFMzcUpObTllY2dYMFBMMjZSdkZiOVI3cVhIUjZObDBP?=
 =?utf-8?B?L25YdzhUeFJMQ3VwWVFoZ2pkcVJodEZVTmY0QzRNL1QxQUNIUXJlN2pwYm84?=
 =?utf-8?B?WEZBeVZFRVgzUk9mNTM0YlB5T1MwYkFXcU16cFN1Z3N6ZDF5ZVg2THpPcEFP?=
 =?utf-8?B?Y2IzMmozMVV1dnhOV3B5a2FBaGcwTGJUWHhmK29XVjNjQmpQcHZXYW5DQXJh?=
 =?utf-8?B?b0FVSFJuamJ4eGNrSXZCbHZyN2ZCKzN2cDVOMzUvaWN2NzM4b3Q2aXhUUlZY?=
 =?utf-8?B?MENvV0tLN0gySlBoRUc2bjMzc1dsVXl5T0V2VngvbzlCSkxvbG1wMUlTaDlt?=
 =?utf-8?B?YnlOU0xveTRqb0xaWkE3YTRidmhqN3krT3JZcW5ZQk5kK28yTjhXM1pGMkho?=
 =?utf-8?B?eDBPNWwrSnF1Z201anArQXBhL2tTeG84TVJhcm5oT1FQeHkrSXkrREZNdUVW?=
 =?utf-8?B?VXBpRXZxbExQelI1QWhISjY0YnZWSW1GWDlKR0hrS2ZLMXJ4VXZoN1NmR3RF?=
 =?utf-8?B?ZW5LY2p4OTAzUWRTTkRxb0tRZWN3WVg4UE9aQUJkVU1HSzJocTArOW5zTlV1?=
 =?utf-8?B?QkNqK2p5VjljNlo0ZzdqeUpvV0R6TEZiKzhtTEx3MjE5d3BHNktHRWt6b2Fj?=
 =?utf-8?B?ZW5iOUpkM01lNEp5eFYxVHRMMy9kTEd6R1pvUERVMGZldHpYWjkvb1kzemh0?=
 =?utf-8?B?WXltN0NrSEpFSGNFR3RnaWNRdTJidEdaNjcwMHAwZDNsK1g2S3d4QVZyLzc2?=
 =?utf-8?B?Q1NmTFhCQ2k2RkZPaEYyOVBsRmVLaEh5YWU1QXVlZXNVbjA2ekFNUFNFajhr?=
 =?utf-8?B?a1NJbGh1MjYyMm52MEFUbm4vR0R4QVppY1NiSUZ5S3lmZk8xa1pvUDM1TXlk?=
 =?utf-8?B?cnUrMTcwWDRhQVdyRmJ5L2lSS0xtUDBiQmpkTXdDWU5FRGZkUXI5S2hpMkpi?=
 =?utf-8?B?MTB6dFpRelAyYmsxQ2RzQU5FS1hHME03Y1JWTjg1bkMvdy9PVi9LWG41cUhS?=
 =?utf-8?B?LzR4bDNHWjk4UTN6bEFLcVNZNDdFenQ4TTd6QWxFdDhOSnBpNXB5NXVHYWJI?=
 =?utf-8?B?NWpTbmM1amQwa2tzcjdGTURqT1pGOGtHVFI2c2c2a1RMUzQzNnFaT3pJTGRk?=
 =?utf-8?B?K2F0K25aVWJ1SzZGNnJrWE4vOUN0c2RwTVJEaEtUbGRlRlUxKy8zaWFwWTFp?=
 =?utf-8?B?UU12MlZZQkdYMEFoSW1tQ2RuKzBnbk9kVGNCYlRsL0haT0I0S0NyWGs1aXd0?=
 =?utf-8?B?alNmMDVWWUcwYS9rVUNzVS9EN2FCYkZGTGRHNUZRRy96N3luQzdBZis1UVNF?=
 =?utf-8?B?aXc4VFBNU203TTcxOFBzRFArM01jN3lTZWVGODhRcE8vc0NLenFBQmdpVWJv?=
 =?utf-8?B?WG5hVXZNT0Zhc1FpeGYwYWVUdWtNdjdOS3Brd2FpQXNqNTRseDVtWUpxM1dn?=
 =?utf-8?B?N1VWbXI0eWlTSFBkblhETDJPM3RnNVhNMStoYm01aVpPVVZrb3R6Nkk1M3c5?=
 =?utf-8?B?RkpBUEZPOG1saVNMMVdHcTdZRkk4dnFUY3FLWUxYUEo1a083OGNqZlphdGxD?=
 =?utf-8?B?YkloQXMzeFQrTURaSjdSV3A4NS9qcnkvSitPdDNhQXNvejlScG9lNU1NSDVD?=
 =?utf-8?B?NXpYQUMwYi9wZUVOQUdJVnM3TkhnbkQ2d2YwdVIvY0I0TVg1V25PNHBLNGxN?=
 =?utf-8?B?NXNqcHdZMjcrZ2QxM1lLL3ZKQXQya3lheDZhVWpBVVNSQWgvZUZBYkErY1Jm?=
 =?utf-8?B?b3F5TEhVeFZCT21QWFk1YVYzYktua1pHeXEzOCt2ZDNNMTE4c09qaEFaRVUy?=
 =?utf-8?B?SmpnTGQvSmxhaXBhMEdGb3dNZG1tcnlBblRMOWhZcVhTNHY2RUg5amNZNHFQ?=
 =?utf-8?Q?s7pDQ7o8SpBLkfdFSWrimcd+dKOq73mU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hPT0dZd3EzUmQwRnpkOVc2bk5uakxlY2dYN0J6RGxIaFZuWTZyMXUzS0hS?=
 =?utf-8?B?WnJRK285OHNZbFN5RTFHeUh1R0twVHhZMGZYOHF0RTFvZVlRSHZ0VHdHSGFG?=
 =?utf-8?B?c0pieHJSaElwL3dtbGhsVTJiZ243UUYzRlR6MHFoUHBid1M5by9zL0hJMGJk?=
 =?utf-8?B?Nlk2Nmg3M2ZSNEdlVTJEL0RoU05XaGJxRmM0SjU4MDRzUG5QWDlKU2UzVEIr?=
 =?utf-8?B?RnFELy80UU80cVgyRVE3YjdWeFRHV0NhK1Y2MmhBdXZoRTl4ajNvbm84Tzk0?=
 =?utf-8?B?eFlDVGJPajFKbUhsQTBVVEY4K3lGY0hJYmNyd04zY3NaUGpNRTgzdjYySVRm?=
 =?utf-8?B?N2xRR0VieTlEVERTZ1g1SG8yZGZwQXQ2WVJzbWorTk9TNHAwd1UwcXBuS2o4?=
 =?utf-8?B?YmJtTWNvNDlFdHRLR2lncEF4T2tOT3Q0SHBOWWNqWDhXaGcwVTcxdm55M1dX?=
 =?utf-8?B?UWp4b3ZyYkd0cGR4TFo5SHljcG9KOVE0N3hHYWZndVQvbkNaTEpEWFZHS0JX?=
 =?utf-8?B?RCt2YmNIejhZTmUxSURBYlVGaXRkTVhuOTJxQWV3dng3c3p5anNEMXMvR20r?=
 =?utf-8?B?RDVRcXJBTVNGVmlMWldpSE5qblIrOVhoVUFKa3F4cE5uV0xPSDUxc0tOUXho?=
 =?utf-8?B?dDNmbnBWY1lJZ0VKSmc1bGFuK1lqYkc2VlhnOGRTZTRWV3ZwOG1DYzR0RlIr?=
 =?utf-8?B?RUtMT01TcVYxN3dRYnBBWExtdlp3TnByMUxUSXROM1U0VVhES3NiV0dkQVpr?=
 =?utf-8?B?UXFTbHJTN3dlcENOREh4SHBBdjI4K2pNZlNtc0c0R3JmSWJVN2tPRUNxd2NO?=
 =?utf-8?B?Qmo4L2c1dEZ1bjc0R2VMSTlYYlNKWEFpSnFmQ3ZrSHg2Y3RpNTdWd2U3RzAz?=
 =?utf-8?B?blhWdDh1OGxadXoydFQ1Vis2UGFxcWVRdzJpUDVRb3ppajc2N25EZW5qWC9I?=
 =?utf-8?B?NHlhcm1NUFJLWDBNSmNRby9XUEhkTnZXQ241SUtETDhzTTBBaHNpeHc1TWdk?=
 =?utf-8?B?bDF2RGRkYlI5NHg1WUFFTS9FSFRRUkVnTC9mWEhWZkJUamRmWHFENGNpa2RD?=
 =?utf-8?B?Z0VQM05uTnNNYzA5S09KMUFVdmNiWVVKak1XdFZnT1hIY0FJZ2FkUUxIVkFG?=
 =?utf-8?B?c1o5czVzU3FtSStRU3lteWo4SFlGNkZ4cDRaZGRHKzFXaHlvTmlTQkFUKy9K?=
 =?utf-8?B?bXVMZ2lkTVpHRlhPSUJ0ZE51cUozUm1XVnM0am1jMm44cHRLL1ozK1ZJRXkx?=
 =?utf-8?B?NWRTUUZHK0o0MFVVUFdPQW00blpmNzdEOVV4WERVRWRMUzBJdkd4TjBESU1S?=
 =?utf-8?B?cVlNWHp0dTVybDNncXlCaHN6b2RpWDhzRVlYUjJxOFdWeWFhVTU1SGtTd0p3?=
 =?utf-8?B?VnFBZFl5YUplSzkyT1dvTm1xcURWb2txdVdPLzJnNVFIa3JwSHdmaVpEeHhB?=
 =?utf-8?B?K3JuZCtBUHJqZzJzZUJDY1c5SnN4a2RGaUpOelFmNUY3cjF6ZXdlZkliNVBu?=
 =?utf-8?B?Vnh5cXZDQW4wQzlqYndMMFVLcG14R1RRR3hITUdpWm9yTVlJMXdIaVVzRmVG?=
 =?utf-8?B?TUJRQldwK1FON0p2b1BaaFdFajkyMmZxUk1yL09hQWZIZXF6ZlRjZytjd1Mv?=
 =?utf-8?B?Y2g1NXZPM0J6QUxNTVdUWW5HeU5ITGw5bUdVbXBQV2tIeUhuSDNkZGhDMit2?=
 =?utf-8?B?TGtvYjVoOVV4THV4aUVxV2IwYWkxQlJURUJXaFFmanR2MGdxVGZjZ1BlZDFh?=
 =?utf-8?B?d0RUMGRMZEFpK2kvdHV4MmZpY0RBOXVjUWh0RnN4TXV3TnNQWEhEa09zN1VH?=
 =?utf-8?B?cnBGd2VhM2xCd2I3UTA5aCsrc2xFTUVneVRYMkxGWGsrYXhFVG1jWFk5VEhs?=
 =?utf-8?B?SlU1ZzVZNHVVdDE0K2xsUVpWellMUHZnQW91OUJEVUhUWThDTUtESG9rTkFi?=
 =?utf-8?B?d3pZaXFNdUpVSGtEMlNzZUIreEFIRmpJckdBTk1JQUd3dWk4bUJrZno1RWM5?=
 =?utf-8?B?SlZwOFd6czFaNmhGS1JDT1piTER5eWR4R0JpQ3Z3dzFYaWhWaXdPRHllY1BG?=
 =?utf-8?B?dVdPVmkxbTJNQ3RpQmQxT2pjWFBrSUI4SXpHODFiQ2RVY29ZeldsY1BYSUNp?=
 =?utf-8?B?TC81WHZNZjZxU3ZGWldFTCtXeEFJNWJTMWNsbDE1YVdweVVzSU5QNnlQQVp6?=
 =?utf-8?B?VmVXZmlkaGxHSGNjY3BvUCtqcjFGQisyUzZIeTlWNE5acXlqYWtZS08zNE0r?=
 =?utf-8?B?TThBbEl2cmkvbS8rdFl0Unpkc1BXQUgvUDhJTVA0Qm5rZ1hwLzI4eThRSk5Q?=
 =?utf-8?B?cHU3SzJ4NEJxY0NhME5VVzFxdkZSU1FYeVhVeVdjNWpCd1UyMEZTdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c562c631-2282-4147-5ec8-08de49ee5c78
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 11:02:03.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZXETaakhHZ9wBTIgFQScIN4M2dt/30XG09zVUJm6gqtFSptCt9TaA/cDwu29L+p1pDVKDb7z5yG6nMqtMOpwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDC28CEE69



On 22/12/2025 03:56, Peter Robinson wrote:
> The NV VRS RTC driver currently is only supported on the
> Tegra platform so add a dep for ARCH_TEGRA and compile test
> so it doesn't show up universally across all arches/platforms.
> 
> Fixes: 9d6d6b06933c8 ("rtc: nvvrs: add NVIDIA VRS RTC device driver")
> Cc: Shubhi Garg <shgarg@nvidia.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>   drivers/rtc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 50dc779f7f983..50ba48609d74e 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -418,6 +418,7 @@ config RTC_DRV_SPACEMIT_P1
>   
>   config RTC_DRV_NVIDIA_VRS10
>   	tristate "NVIDIA VRS10 RTC device"
> +	depends on ARCH_TEGRA || COMPILE_TEST
>   	help
>   	  If you say yes here you will get support for the battery backed RTC device
>   	  of NVIDIA VRS (Voltage Regulator Specification). The RTC is connected via


Looks good to me.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!

Jon

-- 
nvpublic


