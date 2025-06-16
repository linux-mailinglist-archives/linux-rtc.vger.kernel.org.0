Return-Path: <linux-rtc+bounces-4303-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349FADB3D3
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 16:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46DF2173696
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D6B1DEFD2;
	Mon, 16 Jun 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="kxakv2Fl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD981ACEDC;
	Mon, 16 Jun 2025 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084163; cv=fail; b=n+Jr8gyAQCXGmNcCdC7lX5GbVrsMq90eOhBIBWVhF5nVbrEI6yYEdANatUTdl7Qh9lY+vutuTE6xSNVGKU6QP9UqjzeeUfec6Ga9qy8PeWT+FyUUOTy1hZ/1ZMLtGe1UoP/bgwA2UFvaYX/P37ZaLvYm5sWw960STP7Ftkf/2zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084163; c=relaxed/simple;
	bh=3CyWaU5sQ2qAHS/DaSRvKKaz+4/MsMfIo0akzRvqL9Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a7cMv4gvTh5saHKKG3K3WmALr4hn2qrt0SvdxRmN5XJMUbnJJ229GBqHer7NZA5MQv4T786bSAQNKNJz4qa/9n7QFgnEjcMxa5pLy2lw5ewzcv/45vZ9r2IDILpG6ALdrTJLoLzyquIQvyjpFt3z8FOL37nJIqmCjlK2B6cq0UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=kxakv2Fl; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbZgLT32LgCOIv/p7/4EHvVV1SijSqRaXoUPth10A1zzRF6XIfi5zBZIBgj81SlYe7/MGOiqlG/9ypkPmAOqi2hZ75AMQxZVeC4LJ/34mC9hMALcO/a1ARFw9UafX0xewXkAsIzsf9hmp+jlU4imCOUjlFsTqZU/YMo4lISmTXuB5Z6pdONL96sRXKH9ItlPXtGTiW8lM0H4nnd5TuhO/a680Nm8QDrCXIBII3KFneSIzcKdGA/vmWMGUHY+E6NEYBO/eYNkLTY3Z+vQ65hIPx9z3VfJ0xRRCvb7e0/hnzDxARYLeoYMSVMWsqtwuYvM8Y8/jIaXsRlNW+X5/7WfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuoBMg0V18/M2J7HLJlZ1z5/biRY+PO4IuJiVqAD2Z8=;
 b=tLMEy6tjfBiUY8xp1AUPsk2Z6uUSKKAeN81amU19f5QczAAi9coDvbMp25ZetVZDMc2Jsx81qAr/Y+dZT1I9xntm3l6N12gFBLhWsTDOpuAxgnQBwhiv2PMZKhX3OYO/zzQxObEFc/cyXuhaYp1msNI8lXl71pLkL3Skr7iLxFSyCjc1fgn/+r3UwVieurCG/b/QRLKOs8vXkmSu0CjcVvOeD7XqYWpxNXRraRnEv0fEgQBXBQKXToYh31b+Q4YiUSAeN34XXZrCxTCqTZGZHLHQRsnpahGlCdGSsCl8ENrooWSQbsC9GXspvO4Ap05pQo4TScZRglhV6rDxcncthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuoBMg0V18/M2J7HLJlZ1z5/biRY+PO4IuJiVqAD2Z8=;
 b=kxakv2Fl3JZDxrXRNLJYR/UWtHjVMxDcDN1yFIs7ACMI7z6x09BcgndOg9B+zDD1jySx1qyPCqE5to9vbCByodve4kHWPwqO+aWuv6pqJAliwW/dQ2O5lm4qrkyAE6CVE/IPSdzIXnvtwL+kgSHdlz+4mbKmBf1GfIoSkAFicw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20) by PAWPR02MB9903.eurprd02.prod.outlook.com
 (2603:10a6:102:2ec::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 14:29:15 +0000
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40]) by AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40%3]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 14:29:15 +0000
Message-ID: <a15141d7-db98-457e-98ee-a978a4c875dc@axis.com>
Date: Mon, 16 Jun 2025 16:29:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: rx8111: Add NVMEM and timestamp functionality
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
Content-Language: en-US, sv-SE
From: Anders Sandahl <anders.sandahl@axis.com>
In-Reply-To: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0048.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::30) To AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB10373:EE_|PAWPR02MB9903:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a216b0-86f2-445a-5125-08ddace22baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXdZL0Qvd3JsQVRYanJCWFZOdUl3VG9qem9LVW5palJseTFLTUVRZThXMHVR?=
 =?utf-8?B?ajVoTkZmRHlISVJHbzZKak5KckE1b2VhWmNXNkpvZGRBZ2taZWY4UXlsODhi?=
 =?utf-8?B?dkVQQzlMT2hobmhoSUVNcFFMNVFKUWRGUEdremRjREIwRFFIdmE3VXY1VThw?=
 =?utf-8?B?S3R6RUJER3pOY0tad290MmNYQUFQNlk4VVc0TjJWNWtyOFErdk5UM05idFJt?=
 =?utf-8?B?TWtVZnBLVWZxU3JORkZPQXlKYzdlVWd2ZFpLSTJXZmJvSkM5K3RmSmlCU043?=
 =?utf-8?B?NTFiZloyV0NGek1LY3Q1eENOeUw1WVpCcjdiVzFoQnltWkdkSlFvUzRndS9n?=
 =?utf-8?B?TGg3Q21JQW5FQ3BoRzc2RUlSYVJrT2lKRTVDbnh1RlNIeHp6WjJnenBob2dl?=
 =?utf-8?B?QVJIL2VKMFVZa3RxOXdHSlBSMDYreEVxeFBHMUxnU01TVDRiSFNjd1FBMGlK?=
 =?utf-8?B?c0FLUkZhWmhoMWhXZDVIeEcyNm4vaTJTbnpMSWp2YWlyV0FhODNlazFGTmxw?=
 =?utf-8?B?dUd2ZXFQOWZ0b2o4RHRSM253SFdjUW5hT3JFaHFvYVE5blVPbERYR0NTUUpH?=
 =?utf-8?B?cWVoQUFYR1haR2VEMTR4MWtiMlpJTGJUUXhLNURDeTJJTzFyUkRlS1BCUUlC?=
 =?utf-8?B?SjdKVm1UaG9zZlh5dHRudUJHdEFrdU81S0E5Y0hSYS9ESzlnVDd0SmwrWE5X?=
 =?utf-8?B?YzNEdUhQQXhzUG80bmhpZllrc1gzbkRWaTVjcm9hUVVrcFdQUVJYOTdZaUZo?=
 =?utf-8?B?VGJsZlM4YWl5YnNMRW1Ea0ZYQnBacXdrUkU2REt0TGRQRVh4MklFK0ZEUGs2?=
 =?utf-8?B?V1BBcThobUR4YXlIalQrKzZBMlM3ZDdtNHpydnVDRzBUR1V4emNDWU1OZ09L?=
 =?utf-8?B?VTZydTZlSWFyNGc2SGpPbm1UWElYQ0orYVI3QWl5Z1M3Q2VQZU5UWENpaVVy?=
 =?utf-8?B?bWZhTmxLcGtiVldkN1FPcEtnNEtzY2R5UXFrVWFxaEJzNnhoeEM1dklEZGJa?=
 =?utf-8?B?LzVCejZ0MmN3bTVOT1BkUS8rSkI3NURRRkVzMCtnRmtocE1LMldZMCtWWlRS?=
 =?utf-8?B?L2N2VWs5cGFpK2QrMEEzN3JhM09qYW4zRlYxVjRHaWlQTWlnY21GTXBmT2RE?=
 =?utf-8?B?QVk0cXhjYmRabFIzNWF2VmRLSVdWdmMvaXJHSEpHWU5WTFNNWnRLVWJMUEJt?=
 =?utf-8?B?NUtIcVZjNnVKSXg0MTFYSDdpZGY2clJYRE1xNnRvQTNWK3RCc2VlTEl2TU1W?=
 =?utf-8?B?MmhWMkZaZGJPOVF4Rk5vNDN6akhIYUZPK2VQVytZaXpFeEtVN05YbUQrSEtr?=
 =?utf-8?B?dWh1OG02MjVQRHJrc0E1dElwUEdUR0hKekhOcllXVEtIK1lvV1QySHBvTFdF?=
 =?utf-8?B?MlZSQXBjQWoybnlIQVRHN1VyT1ozbTZVZ0N1TVJGaGJIdWVYTDJGdnpOZGRZ?=
 =?utf-8?B?VlNISjE3czZiTFl4Z2taZWRJMVQzUjZDb3IvYVVrRlh0T2FjZzRtOE54WU1C?=
 =?utf-8?B?ZmJZcTNKSXZpSnlmR01YUVp2YTBvL3BGcnVJOVU0aWkzSmFrcTROY09QNkpN?=
 =?utf-8?B?MWdCczlUZElxMVpOY3BWK0J3Y0RpRGlvLzEzci9ZaitqMEVhdjBVWFl2QUdu?=
 =?utf-8?B?UEppUndicjdJK1hGSjFlY3ZVdS9SVlpwS3FuVkVNelBwRUNXRFpEM1dkNWZY?=
 =?utf-8?B?R0RVTFdGemNMMzAxdTZMd1Z1cEphT053VmhEWFJLRnQ3U0VXUGo5Z1VFbXZT?=
 =?utf-8?B?YVZtdzRPbWZLNEhlb3pLZGlYWno1djdIYXZkNUUyeHVnU0VxZFg3Q2tRS29s?=
 =?utf-8?Q?DQxamAtQc/h2tQGh0/TyDOlaCnLLTxgl3x/Q4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB10373.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFdiTnoycmFUM014MmJxTnpZaHdUdTZnR3NoMVM5cExCZlVvS3E3S2xHR3Vm?=
 =?utf-8?B?Nlk5bG44NnU5b1dDOU81MnJTU2NQT1d0MTZ0S2hPMW9hQW9HcDhpaTYxM3RO?=
 =?utf-8?B?TkJOdjAvdW5DQ1JSRXJzTXRoZTh3WjRzZkdxcUV6WUM0ODVpdmRzZEZUdXQ3?=
 =?utf-8?B?NDJEYVNNUW9RUnJzZzFYNm44QjRKQSsxcFV5eXlMMjR6WitHNTdFa3FSYVRV?=
 =?utf-8?B?UjNyaTVJeTJvRFIvMDh0WnNISG5KK2UxTmJENG9IeDF2S0RTUmQxb1R4bXlE?=
 =?utf-8?B?dzd2a2Era3dENFJmV2JIelpFclRDNlJqaDFDYmZFb3RoRUdvMXZZbDR3VHZz?=
 =?utf-8?B?a0VOTkl4UkhpUTN5U3JLOUp2blJIUzVIZVZER2h4a2UxSUFGQ1g0d2xjNGMx?=
 =?utf-8?B?Y05DZW5JYlFyZVNSTEZoU1gvbE83WnRqdVBRZlNBTzI3RXBSbGN3K1huKzNH?=
 =?utf-8?B?MjIzWEowRU5LMUdMS3RQRmI2Q1V2UG91Z3hsZUJBcjJHZGF5RHFLYTBoUlBx?=
 =?utf-8?B?MzQvckRqLzVYRDlmdm9iS0R2eTRNbzY3WjFnekxQcXAzbGR0YTJZTGtEZmpS?=
 =?utf-8?B?SUdTZGJZS3hMYTJYQk1Qem1qcjYrck9ZcmJ3eWU5dTlvaFNDcUI3U1FWaG5K?=
 =?utf-8?B?eUFXNEx2QXdrYzgzenpnYjJEb0VXbVJWQjJnVjVwUVpMV2dJZ2Z0OWNtYVBL?=
 =?utf-8?B?OE5WQkpwRE9SSnNQTXh1TVJPeGZBTER2QUNTNFlNTWRYUEhXMXJSMU9meEl1?=
 =?utf-8?B?QTBMcFZlSGlZUkJHaS95Wk01Rnc1L2QxbU1meGtHS1JHSmROVmZvWWV5N2Zr?=
 =?utf-8?B?ZHNMMVRTV0xpcUhZTjJiLzJydlo3YzFkV1plaE5RR0ZuQ3FleFNkempPeCtx?=
 =?utf-8?B?dDJtdmJSeVRMVTM2ZVRsZGF1V1g5U3hTa20zS3BhbkxzUk5RcHJ3eXB2TTR5?=
 =?utf-8?B?Z3BXQ0tDYk9FWklaM3c3NVRyRW9CMTh2NG8ycG5JS09FVVB0RHNsYmFzdHF5?=
 =?utf-8?B?eGV5b3luSzh1MllwdmI5bWV2ZWcyOUhNYW5IeXBvck5HbVYySGt4clYxemx5?=
 =?utf-8?B?eWw4R1JOZDhFSjhldG9jNTZ3NitpSUR4eUpmd0tabWJEWFlyc0xxZXAzd2Fz?=
 =?utf-8?B?MVkzZCtoYVN1VkhXVk1lSUU0TUpGN2F0YURUSENYb2Y2ZW1MOW02cjMvQy95?=
 =?utf-8?B?UDFiSmwxSWtvT2F5YUZQaVBsR3Bpc0FZbVdudkVnZGlIWmxqQ09odGZ4NUNB?=
 =?utf-8?B?Q3pwT2xNWXd6TjdKS0xURUVZUGFYNWhwczlnVGRMcFhhdkxYbmZVTW5rV21p?=
 =?utf-8?B?Zzljb1VDZUxmTk9KN004M1FEVUpHdGp1ZzM2L0pXbzlyTWJ1bXQ4RlNxL1dF?=
 =?utf-8?B?dm9EMlNRZCtlQ0RsVUhXQVQ0ZGFLbS9HS1J5Rk9iMXA4ZVVZd2FVc0QyNmFX?=
 =?utf-8?B?NHFqdUZlOFc5MDRMZW04MlBWMXRLbFFKWmJWc21TaE13clZESFI5SVhWR0NS?=
 =?utf-8?B?VmJJOXFCZnFBUWhzSmN2TXJ6L2F6YWxnYko4WnpYRklHTDJ6TTlGQ0E0UWx4?=
 =?utf-8?B?bU1CUysreXB2UFlPWXFScktpdWdydFZsMVp0TTFXM2FIZXhSUzdjQkVhbXY0?=
 =?utf-8?B?QndaOEVQYjlZK0plQzNkSE9tM3RQNG1aMHQvdWQxTWs0MisyYVdTaWd5d0ZU?=
 =?utf-8?B?Z0dWb3BhbGpOMzhVM2p5a1o0NkRVS2hPbS9MR2x3Y2Y1ZXY2UHhvMnFuajNr?=
 =?utf-8?B?VzFHSW9GWWhZczE2MEZxaStKZHA3KzEwaFRmWW5TeHh4Uk1vR3pQdjlxTGdi?=
 =?utf-8?B?R255MzRCVGRWYldzcUZobWFJNi9YSGlRU2xYK2VXV09tb3NYZXBPNnBVY1Jx?=
 =?utf-8?B?UlB6bThSbFI2K2w0aG95UkNjUUViWVlXY0tPRE1paUxzeDNkUDM2cXhsdkp1?=
 =?utf-8?B?NUtxT0ZGb1loQ3ZuR2EzY3l6VTBsdmFGelIvUXZNd3dlVW52THdpVzAwcVFL?=
 =?utf-8?B?SnhpRVRQR0VqMnNpNW5DYStJZ3d1K2NRTldlbENuMVNRR1RhUHFDMXVpZHN5?=
 =?utf-8?B?QUo4NGM1L0MvSERNQmZGM0RNaVJsbWVqUVpyLzJwZEdNZmNQaHFiaTFzUmEy?=
 =?utf-8?Q?TQTSLIIGOMMhT6pvWTCYPN3Kl?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a216b0-86f2-445a-5125-08ddace22baf
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB10373.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:29:15.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir58DbofnB52l84KLpZgeP8R37XXrSEXvlw24VgsSRAoTvr/ks/q122un5QUfeACL/6mBLYLLUIbKqR1B6UD6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9903

Hello,

Please let me know if I need to do something more?

BR Anders

On 4/29/25 15:59, Anders Sandahl wrote:
> Introduce support for saving a timestamp triggered by an external
> event via the EVIN pin. After an event detection, the timestamp can be
> retrieved from timestamp0 in sysfs.
>
> Also add a sysfs control timestamp0_write_nvmem to enable the RX8111
> feature that stores timestamps in NVMEM as a circular buffer.
>
> Signed-off-by: Anders Sandahl <anders.sandahl@axis.com>
> ---
> The Epson RX8111 device has support for saving a time stamp when a
> hardware trigger occurs. It also has a register area that can be used
> as non-volatile memory.
>
> Datasheet: https://download.epsondevice.com/td/pdf/app/RX8111CE_en.pdf
>
> Timestamp is made available in the same manner as in "rtc-rv3028.c"
> through sys-fs. NVMEM is made available using the framework functions.
> ---
>   drivers/rtc/rtc-rx8111.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 349 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-rx8111.c b/drivers/rtc/rtc-rx8111.c
> index 8450d9f0b566c63bca04988d892ea4db585ac526..4f428eb98f4858b4c70b3a5709d8204a77d0a1ea 100644
> --- a/drivers/rtc/rtc-rx8111.c
> +++ b/drivers/rtc/rtc-rx8111.c
> @@ -58,7 +58,14 @@
>   #define RX8111_FLAG_XST_BIT BIT(0)
>   #define RX8111_FLAG_VLF_BIT BIT(1)
>   
> +#define RX8111_REG_TS_RAM_START		0x40	/* Timestamp RAM area start. */
> +#define RX8111_REG_TS_RAM_END		0x7f	/* Timestamp RAM area end. */
> +
> +#define RX8111_BIT_EVIN_SETTING_OVW	BIT(1)	/* Enable overwrite timestamp RAM. */
> +#define RX8111_BIT_EVIN_SETTING_PU1	BIT(3)	/* Pull up select 1. */
> +
>   #define RX8111_TIME_BUF_SZ (RX8111_REG_YEAR - RX8111_REG_SEC + 1)
> +#define RX8111_TS_BUF_SZ (RX8111_REG_TS_YEAR - RX8111_REG_TS_SEC + 1)
>   
>   enum rx8111_regfield {
>   	/* RX8111_REG_EXT. */
> @@ -98,6 +105,11 @@ enum rx8111_regfield {
>   	/* RX8111_REG_STATUS_MON. */
>   	RX8111_REGF_VLOW,
>   
> +	/* RX8111_REG_TS_CTRL1. */
> +	RX8111_REGF_TSRAM,
> +	RX8111_REGF_TSCLR,
> +	RX8111_REGF_EISEL,
> +
>   	/* Sentinel value. */
>   	RX8111_REGF_MAX
>   };
> @@ -134,12 +146,16 @@ static const struct reg_field rx8111_regfields[] = {
>   	[RX8111_REGF_CHGEN]  = REG_FIELD(RX8111_REG_PWR_SWITCH_CTRL, 7, 7),
>   
>   	[RX8111_REGF_VLOW]  = REG_FIELD(RX8111_REG_STATUS_MON, 1, 1),
> +
> +	[RX8111_REGF_TSRAM]  = REG_FIELD(RX8111_REG_TS_CTRL1, 0, 0),
> +	[RX8111_REGF_TSCLR]  = REG_FIELD(RX8111_REG_TS_CTRL1, 1, 1),
> +	[RX8111_REGF_EISEL]  = REG_FIELD(RX8111_REG_TS_CTRL1, 2, 2),
>   };
>   
>   static const struct regmap_config rx8111_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
> -	.max_register = RX8111_REG_TS_CTRL3,
> +	.max_register = RX8111_REG_TS_RAM_END,
>   };
>   
>   struct rx8111_data {
> @@ -147,8 +163,224 @@ struct rx8111_data {
>   	struct regmap_field *regfields[RX8111_REGF_MAX];
>   	struct device *dev;
>   	struct rtc_device *rtc;
> +	spinlock_t ts_lock;	/* Don't allow poll of ETS bit when it's temporarily disabled. */
>   };
>   
> +static ssize_t timestamp0_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	int ret, etsval;
> +
> +	/*
> +	 * Clear event only if events are enabled. This is to protect
> +	 * us from losing events in the future if events have been disabled
> +	 * by mistake (error in read function).
> +	 */
> +	spin_lock(&data->ts_lock);
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_ETS], &etsval);
> +	spin_unlock(&data->ts_lock);
> +
> +	if (ret) {
> +		dev_dbg(dev, "Could not read ETS (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (!etsval)
> +		return -EINVAL;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_EVF], 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not write EVF bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_TSCLR], 1);
> +	if (ret) {
> +		dev_dbg(dev, "Could not write TSCLR bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t timestamp0_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +
> +	struct rtc_time tm;
> +	int ret, evfval;
> +	u8 date[RX8111_TS_BUF_SZ];
> +
> +	/* Read out timestamp values only when an event has occurred. */
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_EVF], &evfval);
> +	if (ret) {
> +		dev_dbg(dev, "Could not read EVF (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (!evfval)
> +		return 0;
> +
> +	spin_lock(&data->ts_lock);
> +
> +	/* Disable timestamp during readout to avoid unreliable data. */
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not disable timestamp function (%d)\n",
> +			ret);
> +		goto err_out;
> +	}
> +
> +	ret = regmap_bulk_read(data->regmap, RX8111_REG_TS_SEC, date,
> +			       sizeof(date));
> +	if (ret) {
> +		dev_dbg(dev, "Could not read timestamp data (%d)\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
> +	if (ret) {
> +		dev_dbg(dev, "Could not enable timestamp function (%d)\n", ret);
> +		goto err_out;
> +	}
> +
> +	spin_unlock(&data->ts_lock);
> +
> +	tm.tm_sec = bcd2bin(date[0]);
> +	tm.tm_min = bcd2bin(date[1]);
> +	tm.tm_hour = bcd2bin(date[2]);
> +	tm.tm_mday = bcd2bin(date[4]);
> +	tm.tm_mon = bcd2bin(date[5]) - 1;
> +	tm.tm_year = bcd2bin(date[6]) + 100;
> +
> +	ret = rtc_valid_tm(&tm);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%llu\n",
> +		       (unsigned long long)rtc_tm_to_time64(&tm));
> +
> +err_out:
> +	spin_unlock(&data->ts_lock);
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RW(timestamp0);
> +
> +static ssize_t timestamp0_write_nvmem_store(struct device *dev,
> +					    struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	bool enable;
> +	int ret;
> +
> +	if (count < 1)
> +		return -EINVAL;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_TSRAM],
> +				 enable ? 1 : 0);
> +	if (ret) {
> +		dev_dbg(dev, "Could not set TSRAM bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t timestamp0_write_nvmem_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct rx8111_data *data = dev_get_drvdata(dev);
> +	int enable;
> +	int ret;
> +
> +	ret = regmap_field_read(data->regfields[RX8111_REGF_TSRAM], &enable);
> +	if (ret) {
> +		dev_dbg(dev, "Could not read TSRAM bit (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return sprintf(buf, "%s\n", enable ? "1" : "0");
> +}
> +
> +static DEVICE_ATTR_RW(timestamp0_write_nvmem);
> +
> +static int rx8111_sysfs_register(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = device_create_file(dev, &dev_attr_timestamp0);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_create_file(dev, &dev_attr_timestamp0_write_nvmem);
> +	if (ret)
> +		device_remove_file(dev, &dev_attr_timestamp0);
> +
> +	return ret;
> +}
> +
> +static void rx8111_sysfs_unregister(void *data)
> +{
> +	struct device *dev = (struct device *)data;
> +
> +	device_remove_file(dev, &dev_attr_timestamp0);
> +	device_remove_file(dev, &dev_attr_timestamp0_write_nvmem);
> +}
> +
> +static int rx8111_setup(struct rx8111_data *data)
> +{
> +	int ret;
> +
> +	/* Disable multiple timestamps; area is used for nvmem as default. */
> +	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL2, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup TS_CTRL2 (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL3, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup TS_CTRL3 (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Configure EVIN pin, trigger on low level. PU = 1M Ohm. */
> +	ret = regmap_write(data->regmap, RX8111_REG_EVIN_SETTING,
> +			   RX8111_BIT_EVIN_SETTING_PU1 |
> +				   RX8111_BIT_EVIN_SETTING_OVW);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not setup EVIN (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Enable timestamp triggered by EVIN pin. */
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not enable timestamp function (%d)\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/* Disable all interrupts. */
> +	ret = regmap_write(data->regmap, RX8111_REG_CTRL, 0);
> +	if (ret) {
> +		dev_dbg(data->dev, "Could not disable interrupts (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>   {
>   	int ret;
> @@ -160,6 +392,17 @@ static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>   	return ret;
>   }
>   
> +static int rx8111_clear_vl_flag(struct rx8111_data *data)
> +{
> +	int ret;
> +
> +	ret = regmap_field_write(data->regfields[RX8111_REGF_VLF], 0);
> +	if (ret)
> +		dev_dbg(data->dev, "Could not write VL flag (%d)", ret);
> +
> +	return ret;
> +}
> +
>   static int rx8111_read_time(struct device *dev, struct rtc_time *tm)
>   {
>   	struct rx8111_data *data = dev_get_drvdata(dev);
> @@ -289,11 +532,69 @@ static int rx8111_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>   		vlval |= regval ? RTC_VL_BACKUP_LOW : 0;
>   
>   		return put_user(vlval, (typeof(vlval) __user *)arg);
> +	case RTC_VL_CLR:
> +		return rx8111_clear_vl_flag(data);
>   	default:
>   		return -ENOIOCTLCMD;
>   	}
>   }
>   
> +static int rx8111_nvram_write(void *priv, unsigned int offset, void *val,
> +			      size_t bytes)
> +{
> +	struct rx8111_data *data = priv;
> +	int ret, len;
> +
> +	/*
> +	 * The RX8111 device can only handle transfers with repeated start
> +	 * within the same 16 bytes aligned block.
> +	 */
> +	while (bytes > 0) {
> +		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
> +		ret = regmap_bulk_write(data->regmap,
> +					RX8111_REG_TS_RAM_START + offset, val,
> +					len);
> +		if (ret) {
> +			dev_dbg(data->dev, "Could not write nvmem (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		val += len;
> +		offset += len;
> +		bytes -= len;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rx8111_nvram_read(void *priv, unsigned int offset, void *val,
> +			     size_t bytes)
> +{
> +	struct rx8111_data *data = priv;
> +	int ret, len;
> +
> +	/*
> +	 * The RX8111 device can only handle transfers with repeated start
> +	 * within the same 16 bytes aligned block.
> +	 */
> +	while (bytes > 0) {
> +		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
> +		ret = regmap_bulk_read(data->regmap,
> +				       RX8111_REG_TS_RAM_START + offset, val,
> +				       len);
> +		if (ret) {
> +			dev_dbg(data->dev, "Could not read nvmem (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		val += len;
> +		offset += len;
> +		bytes -= len;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct rtc_class_ops rx8111_rtc_ops = {
>   	.read_time = rx8111_read_time,
>   	.set_time = rx8111_set_time,
> @@ -305,6 +606,16 @@ static int rx8111_probe(struct i2c_client *client)
>   	struct rx8111_data *data;
>   	struct rtc_device *rtc;
>   	size_t i;
> +	int ret;
> +	struct nvmem_config nvmem_cfg = {
> +		.name = "rx8111_nvram",
> +		.word_size = 1,
> +		.stride = 1,
> +		.size = RX8111_REG_TS_RAM_END - RX8111_REG_TS_RAM_START + 1,
> +		.type = NVMEM_TYPE_BATTERY_BACKED,
> +		.reg_read = rx8111_nvram_read,
> +		.reg_write = rx8111_nvram_write,
> +	};
>   
>   	data = devm_kmalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>   	if (!data) {
> @@ -312,6 +623,8 @@ static int rx8111_probe(struct i2c_client *client)
>   		return -ENOMEM;
>   	}
>   
> +	spin_lock_init(&data->ts_lock);
> +
>   	data->dev = &client->dev;
>   	dev_set_drvdata(data->dev, data);
>   
> @@ -331,6 +644,10 @@ static int rx8111_probe(struct i2c_client *client)
>   		}
>   	}
>   
> +	ret = rx8111_setup(data);
> +	if (ret)
> +		return ret;
> +
>   	rtc = devm_rtc_allocate_device(data->dev);
>   	if (IS_ERR(rtc)) {
>   		dev_dbg(data->dev, "Could not allocate rtc device\n");
> @@ -343,7 +660,37 @@ static int rx8111_probe(struct i2c_client *client)
>   
>   	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>   
> -	return devm_rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not register rtc device (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = rx8111_sysfs_register(data->dev);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not create sysfs entry (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(data->dev, &rx8111_sysfs_unregister,
> +				       data->dev);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not add sysfs unregister devres action (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	nvmem_cfg.priv = data;
> +	ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
> +	if (ret) {
> +		dev_dbg(data->dev,
> +			"Could not register rtc nvmem device (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   static const struct of_device_id rx8111_of_match[] = {
>
> ---
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> change-id: 20250424-rtc-rx8111-events-df9a35810a73
>
> Best regards,

