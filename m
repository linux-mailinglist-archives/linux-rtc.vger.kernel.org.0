Return-Path: <linux-rtc+bounces-5133-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9386C00418
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 11:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD8DD4E83D9
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5313081CB;
	Thu, 23 Oct 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I1YUFUcp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E78F54;
	Thu, 23 Oct 2025 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211957; cv=fail; b=HbaCz+ugH0P+D4fc9tVVhEczEBh4v1P/dyjSE0c3Je9cJvlRjPzZlteQI0frsmb40QiLWsAwVlWdS53zbkVHrCK7rhljBG55RL5E3FY7iXbV8Nu4mQEMAeHrAIPyUuroJ2p332e7C0nN1P+BBLHOrMnGWwNfhJDMtsVnyZXmIIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211957; c=relaxed/simple;
	bh=6vxnEWD4j7sfPq98dBG/sGFRQy1b4V4NMT8ujXXAhng=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nrqlWSKJMBLCHgXlHcjsnMoon7XNuojNmqQc3tf4kID7Suu9qmNIfswlIIeNM/fBq/28GjrxIs+dUxMkdxFb4mWtFMn2cNEy+2dioYgqJ4JL0LIljo6ttXTIFuH237oSIOo5BcAcFcyAku0D5VsYiSptRxu1Detrp8WWSj9YzbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I1YUFUcp; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUDb5Pw48JnMwo/EwAR3C8UUMvjBhl9CToKfuj0mUjwYqwmCwAPyfFNl0AK1Ix+2jQtaVLZMAKCWqVNo+RfCobGgCOzUlsCXTApLUGXdH69t5HYD/dJb9UPAkYZ+VEKnnZAc9OWsvsqqs0O2NDn0w0+f619N+QpL7chy+3d3tTxsQrJOJnJ2LhArgXA/8UNi7t2tX33ee+x2Ztqyfe++C9p6B4bFd72+si657EsUKHabjHIxat8PKGmnyqj23r66y6ExWArTvOGdl4MlrG6PNSe95udHx9zxv/J/X0z90C2zS6nBVLFq8BUBH1rHTzJCZ7WU3EKoJiaZRfQ55sZPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0rJTHwpsvBGW03FY9jPcgIdC5WeuhcH/ckgutMhLus=;
 b=eaEdCTjwb2t0/tVyYWWnNj4TUUcuIPTDiQA9322AAqLCt97v23I6nKXLGr8HEUAF7HR2VX+HoBpcnCCkXEvWrl1mzhwW6NZNS9f0/s/jsm6PPcO3s67A0jwoe3CwEe6tPW034gpQq3a1xrP5bpWVBD3GxsLNFGqfVvhwJTajybOSrT+9O1ALUW1+gympLMODdNhV86qqvc93OOzofXGoD1o+Q1N3g0pstAepSwtyZtHkGcwvs3o03YNoT+rV6Vet52yLpumEwBVhYsLE/sCDrrOlNFncPkLqmAsKUoMfn9avWbsq62Z7uW7CGY/7fpTTYB4Optly1L9Lidollbi2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rJTHwpsvBGW03FY9jPcgIdC5WeuhcH/ckgutMhLus=;
 b=I1YUFUcpNT15vvbntoy5D4Mh0ImBpq6tIMOKkhbqAB5EoxZkz5GJVoOabFfUOkiRYkLWSOK3l8xAN6NmTrEuocRRHm/n/GECGQ2byCW/Tg6xpVtvD0FCPmnNHOpQgmBsl2vJUs31s/7369W58B0OcdFAEmczsWjjNaIygZWJ4E6gQ1jxW8qk9fRzM0+g7+U99/eKbXnQmMuZJ4mU8ox2qko8lY0AuNo252es/bfWGAUKNFTCSPySc+c30m/EdcDPHaRnLIYyNE+3AWaDEVnSv2G2Csh6GS59CnzF+5Q17S8wHl/JozSfys4m5qSNTdhspNzpbGJeeheTbGqIIFFclg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:32:31 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:32:30 +0000
Message-ID: <cdbc7ecc-6676-4702-bbe3-6d275d561185@nvidia.com>
Date: Thu, 23 Oct 2025 15:02:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: tegra: Add ACPI support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022063645.765599-1-kkartik@nvidia.com>
 <aPkPkHr0Hp_MabPx@smile.fi.intel.com>
 <f4defdc9-2cc0-45a0-a391-cb8678eb1b23@nvidia.com>
 <aPna3Q9L4Rc9Ufxt@smile.fi.intel.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <aPna3Q9L4Rc9Ufxt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|IA1PR12MB9031:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb5d76b-7b9b-4dee-ff92-08de12171661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cCtNRzNVOVpCQ0xuVWs0Ly9iaExFL29EWjR5cUhSVFNvNFZLSnYvVm10M3Vh?=
 =?utf-8?B?aW9hWmV4R2tvMSsyUlRtZnZhZlRVbjMxcDZTS0FDUVBTdTFseHUrWU1BOEhv?=
 =?utf-8?B?VVhjelFvSytLc0VlUDh6cEk3YVVIMWF0eitGK3FuRHZVY0dhRi9oQnhCdENB?=
 =?utf-8?B?dUQ2N2Y4am5PUi8yYzhEYk5lYzZSUEptamVVYUNTaWRqTFJNbU1GWFc4RUNi?=
 =?utf-8?B?U2t3aHNNcjVaTkpUaDlYaXhuTlZ5dlRvb3c4S0p1RDY1a0IvQlordjVhUENv?=
 =?utf-8?B?aTRxUXFVRm5rWFRZM3dMU0wyRUVMUWROaTB1OTdoVmF6NUZrUlBCRU10Y2cr?=
 =?utf-8?B?SGNKUzNSNEEzV2l1WEZYTGdWZmg0Nk02Nkk1dlJDMEtZT2Uzdk9BUC9xU3I2?=
 =?utf-8?B?OVJ3dXVkcjBISHRRTjRyenpZZHlCNTdsTVVENEhWK0YyUzQ1NzdSMkNiTVV1?=
 =?utf-8?B?eC9BenJpMnZHK2c4Wm1Ic29XNDU5dkhVc1RVZkNMV2Q5bGVBdFVQcHhMc1JK?=
 =?utf-8?B?WEtTQXJ2Qjk2N1hnUE9JZzdFU1pScSsxUzJhNWU1MkI3VXNtNGJzckJxaTRN?=
 =?utf-8?B?Y05zR29XbTRhTS9jNERLVnhkZmVoOEJob2ZEWFVsdnpEVFBTZitDR0VwNVdQ?=
 =?utf-8?B?Rlo0K2NkaUFjVktUUDFEUjlEOW5WSDduU0hpUUhpQUxmZzB2OFVlTHlJM1Ry?=
 =?utf-8?B?QVRHK3I4VjlpNHJCeHh3ZU9ObVRZb0h4MnNkVy8vMG9CMlRKczRlVUN3R3NK?=
 =?utf-8?B?UmJSN2gxK2l4aFYxbWJqT3dDNHFQWkZtSHlSaUpEem12N21JU1JWYjZvOHdQ?=
 =?utf-8?B?ck9uNFVTS043ME4xUzh4VVg3Ymw0cmlPUXVHU2ZMZm55Q2cxS0xIcEt3WTNY?=
 =?utf-8?B?MEtlNmhpQ1R1RHA2YjF2b0lubURzS0sxZHRKYVlxUHVvejM1Sk0xQ2V1LzVP?=
 =?utf-8?B?N0FURUN4NFpmd0FCbmhVNzVxb2xWWi9ERHl2alExRHpiVlRtQnNDTWRRVC9Y?=
 =?utf-8?B?SU1jNld0MmxEdHQxQ2JJS2hOb2NjR2MxaDM4alAvTFRKcTJGUEtHdk80U2xX?=
 =?utf-8?B?OVhTN0l3TzY2cWhsbzhTbHFyTXlRTFVxdlp1MFdBWWp6Z0JCZ25FT1FBOCt2?=
 =?utf-8?B?SjdSNkV3QXJVNzFrTGFsbjZrV0d1VnErcjkvTHlZTG91VWIvMHF2NHhxa1lz?=
 =?utf-8?B?bmgwb29ZcDNTaWFPeGc1dUExbU03YTQ3czRmZVBZbDZnN0ZWN3NMczJrdDRP?=
 =?utf-8?B?blNUVmNMUnloSmlId2ZVakFHaVR5VFhTRVR0ZTdJdmZONXdTOHBwTEp6di9L?=
 =?utf-8?B?UlJUS0pZWllQYXlpTzNRSUU5Z2Fib2h1bElxKzNQR0lRVHp2UEUvNkZKbTF6?=
 =?utf-8?B?MFZwU3FNMGNvbGE0eitoMTB4WXM0dlpYdVJvYW5YQWM4K1BON0dHRWFDTVdl?=
 =?utf-8?B?bTc2d1BnTnl0Q1RWNWt5T2pVa0pJOVZtcEkwOWgrMzBaSTdPYVJWMDk4bHND?=
 =?utf-8?B?em5oejJBdDluM3UxbkZYL0hlS0pHWXg3OTFjdmtIUlhrd2FnNWlEalRFbEVR?=
 =?utf-8?B?bTFFVFRSbjg5dGVjdmUvYVRGMXhSRTdJb21QQ0hEaXp6RFpGcHR4WGtsYzZV?=
 =?utf-8?B?ZWs2eTFBWnlDcllkQU1SK1hRczZBWDFOVmoza3JvMGk4NVowMEZUS0FBMXM5?=
 =?utf-8?B?c1dwYzNaMmNHTjJZYm8wZERBQlJoTy9Jb3pKeUNUOHVoajFPZ1hrMUovdDFu?=
 =?utf-8?B?TVpZYks1cWJDc0NVRlFpTmlWcmM3a3hIV2ZiSHJMZjlEc3RCOGNGVVJZc0NV?=
 =?utf-8?B?cGp4dUE2azlYT1ZTa3B5c0hNUk8vSzJBU3VqTUM1K1JzL3E5OVk0dURFM0pB?=
 =?utf-8?B?YzJsR1VEemk1OEpBdXJMeWpMRTlQK1ZvT3duMVJpV0FOaDZRWkkvTk1EM2ZX?=
 =?utf-8?B?M3VPUW5yeE5Kc1RxY3ZPT3U2NTdpTlZ5dDVkMFRiTHJLZUdoSVB0L3Y3ZGxH?=
 =?utf-8?B?emlVdkUzaXRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WStOUTVzdThtSDhOTjZqT29qUnp6S3lhK21pMlFIYndDeGpsdG44R2ZRbnhl?=
 =?utf-8?B?MzdyMElPVEJZa2trdkNKU0xzVEg2WEtIVW0yaER6dWJLbm9HcmJnVzNKdk9J?=
 =?utf-8?B?bldHZzR3SXdPclU4VmJ5UVlUQXpPUC8rSlNieXpOanI2SU5BU1BGc1JyV2Fa?=
 =?utf-8?B?TzFTaGRmQ3BPT1FtN2JyU1Mrc21BdjJQMzJQRGIvM2VQS2xoODlxTDNsVWNY?=
 =?utf-8?B?SXFrczlxSnRwaUVOa0tQOWZkUG9VbmszN3BFSGUySmFEakV3M1BKaXFENmlN?=
 =?utf-8?B?Ymk5U0VQV2hrVWJTQm50S3gvcEptUHdveExnZnlzV3ZRMkVQSE51cHZrRHVU?=
 =?utf-8?B?YUNRNnVIWVNPM2ZVZ2k0QW9CS2ZraWQ4dnROOXdkSFNiUFQwUCswSTA1b0E4?=
 =?utf-8?B?RVIwa0t5WGxJMjFrSVM4VkdYNTk2bkh0NHdaNnNLRkhJWE1KeG1Jd3Y4bFZP?=
 =?utf-8?B?ZzNXWEZ5cW1PZW4rUXhlRCt2L2FhUkVVN1cyL0VGYzk5ZEpwOXJKdUlWUXRZ?=
 =?utf-8?B?SmNPbXRyOEZvMkRhOWFRMi91SGVzMXcxL3lzL0tXcWVoUVdRV1BlRVJRdktU?=
 =?utf-8?B?OFpwa3ROWkVOQXlESE5kdmJrT2g3d3ZnTVJXMUJrOW9tZnplVm9lNTM5OTVT?=
 =?utf-8?B?dDFGdWx5ZUxxL1phNy84Yi9UMzRtYzh0ZWxjQW9CMXB6bWd6ZThDWHlDdVJn?=
 =?utf-8?B?M1B2NHl3dWpTbkswNWlTeEdBanBEbnFtUlEzRDZuMUU2UWx6OXFRZTFudm5q?=
 =?utf-8?B?R2wzMlNTQy80M2ZyM0tkQzM1OWNTd2NtWjVnL0k5aGYvR1hVTndSSldQOGZ2?=
 =?utf-8?B?VTJkaDlYd09xY0JwcHNlTTdvRTVwOXNZNzBGR0pmSDNFNFpzdm9XMmp6ZnZp?=
 =?utf-8?B?SkV0UzV2ZWllKzRGREkyc1BXNlUrMjRiRXYxT2s5RTJ4LzhYTUZsb2pHNTI4?=
 =?utf-8?B?dHk2NjEvaDFNdktUdGQ3TUZOTldKNWd3Z3lNRGFLMzM1Umhsc1B2TmdxdENr?=
 =?utf-8?B?ZjcwR1JmcjIvbytXcUlJZTBRMmRTR09KaEFQUk4zNnhnMDR5TEtRY1pRTVQ5?=
 =?utf-8?B?eFBqNGhJTTJDd3Rhc3JXcnA5TmszSnhRS0hja3hKYkNMNlRMWnlyS2gzblls?=
 =?utf-8?B?NndYVE44YlFnTVNoNE94WU15VW1lYW42TU81dHJJQUFZbUh3NUowZjRzWkE4?=
 =?utf-8?B?TWFDNEJ2QTFrV0xqQUEreUp6Tlo0eldYWjBIYzFwUTU0ZmVTb0dEb0ZqWHhL?=
 =?utf-8?B?NE1GVThJMW9RVDRJbkFSR3FSQW4rcmRxcmxIbXdjOUpkWFBDejFVM0t2T0c3?=
 =?utf-8?B?OHVqT2RsKzVhaWpzWmZtc29veUw4TkZKRTNKNGExY3NWamlDV1QwYTNBR3R0?=
 =?utf-8?B?Vyt1TkhWbkxML2ZicjBrQUtyeFp6NlB5N0o4TlRUUWRuNGNpU2pYK2NFdmxV?=
 =?utf-8?B?THc4T1ZLWWdSdnNQKzhTbWdTak4xdGF0dHpndCt6QTFrSEhCaWJxcnVuK2Zs?=
 =?utf-8?B?UkRTK2hsQ0ZsM0FhbU4zV04yUm8xdHN6UXhiVjBhazBqUWh2cHUyaFB5b0JF?=
 =?utf-8?B?ZVdENG5VL1F5ck10cG1jempMa1pHUlZBallLd3JUWlNySWdLVkZKZDZRdklh?=
 =?utf-8?B?UUZxMmdPcnlrQXJvNVZVU3dEbFVOdjNOT0JyZE9hUHB4cE05ZGJGTTlMSmV3?=
 =?utf-8?B?RHNsQmVyQksrK0lIaXJQaWFDQXlDYmhCYkNpaFhJeHdIb3BJNGdHTVRQMWs5?=
 =?utf-8?B?cElJYUZFWWNGZHBqNDBlSWhzbkhNS21vMVdDandGVkR5ZTdsVzJzNWdSdjBQ?=
 =?utf-8?B?eVQ4YVBZSEJXekxoUDQ4ZGo2MTZUN09NZDF2cnFMYjdSeWlJLzVSTEdtd2JC?=
 =?utf-8?B?a2VCNXpQcWZaN3NXekxWNktEbW1xWXRhSnA2ampZSzNTd1B6NzFEd01wNml3?=
 =?utf-8?B?S3RTcGI2TWIwdXc4SHlGRnhxcTV3WnZWb2FOQ3U3cVpvaDhrNW1FM0Q0VitM?=
 =?utf-8?B?UEZPbTNPWmE4a0ZGU1ZWc2tocWd2REFCOUJKZGF3dTM5YVVyL1FvVVE4Y1pN?=
 =?utf-8?B?aUNNYms5ZnJabU5UZXVHcXNVQ0NTRm9sckRybmJUY0lTRTNTN0FYMnZrM0FO?=
 =?utf-8?Q?tycIaDElTDw4tFQvPMHR+JjSh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb5d76b-7b9b-4dee-ff92-08de12171661
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:32:30.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oo3NIUdJK46T7vdEq8iPu9gUmq5IuKUyq+slyPpktpYw3YnF4la1U6M1snYgD+f9CLdvYCrphHsJ7k2lOgvFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9031

On 23/10/25 13:05, Andy Shevchenko wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Thu, Oct 23, 2025 at 12:14:13PM +0530, Kartik Rajput wrote:
>> On 22/10/25 22:38, Andy Shevchenko wrote:
>>> On Wed, Oct 22, 2025 at 12:06:45PM +0530, Kartik Rajput wrote:
> 
> ...
> 
>>>> -     info->clk = devm_clk_get(&pdev->dev, NULL);
>>>> -     if (IS_ERR(info->clk))
>>>> -             return PTR_ERR(info->clk);
>>>> +     if (dev_of_node(&pdev->dev)) {
>>>> +             info->clk = devm_clk_get(&pdev->dev, NULL);
>>>> +             if (IS_ERR(info->clk))
>>>> +                     return PTR_ERR(info->clk);
>>>> +     }
>>>>
>>>>         ret = clk_prepare_enable(info->clk);
>>>
>>> Since we still call CLK APIs unconditionally here, shouldn't be the whole
>>> approach just to move to _optional() CLK API?
>>>
>>>           info->clk = devm_clk_get_optional(&pdev->dev, NULL);
>>>
>>> I haven't checked the code below, but maybe even one can incorporate _enabled
>>> to this as well (in a separate change as it's not related to this patch
>>> directly).
>>
>> The reason I did not use the _optional API is because the clocks are required
>> for the device-tree. Therefore, it must fail if clocks are not provided on
>> device-tree boot.
> 
> I see, please mention this in the commit message. And perhaps add a patch to
> convert to devm_clk_get_enabled().
> 
> On top of that you also can convert driver to use pm_sleep_ptr() and drop ugly
> ifdeffery. But this is really out of scope, and up to you to decide.
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 

Thanks for the suggestions, Andy! I have posted v3 with all these changes here:
https://lore.kernel.org/linux-tegra/20251023093042.770798-1-kkartik@nvidia.com/T/#t

Regards,
Kartik

