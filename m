Return-Path: <linux-rtc+bounces-5145-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B9C05A79
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 12:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B11419A7402
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701E5311596;
	Fri, 24 Oct 2025 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GjB1i/99"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396F31065B;
	Fri, 24 Oct 2025 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302909; cv=fail; b=Hmc38I40FaNdmGc+oxukKCtr9WOUVp3ocAQeFqNLRhVBsQ6XgR4oJ+MoVqtYHkFjP8J/1kGcUd35Of88xItV2Cfz3TrItEjE3QJKZJZcZhBy1N4JF5TqGWT9ZWqp2tI+QwEHuNwjzHE7S06GmIarpMQjDr/Rne9NBGuUPFSxKGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302909; c=relaxed/simple;
	bh=30LYLe7qDf28OxUvyagUwcEiO/9QB2arXorR12uuDBY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RnQWEX5vwFsF70e1g7OoLW67GfrRcV673qK1Dvp7wE7x5kvapERnZVKMABvWM/g/rEloCIoqPcLknQ0Lw/FMYhS99WyXtUKUPjU5zB6BeJ0aEcEKtIhVBCvr5x90lHqijB71efXdt8PwwTyeEcns0Gf6nJW2JZeSPHNhQ68ZCfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GjB1i/99; arc=fail smtp.client-ip=52.101.62.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAHRyBayBuq+pM5h1dHsxsxDCU2R2BkMosQFAX5ocvxgo8QJOt59yXjM4JnxH4GyqWzmKSYmGXft307BjSsZhIxGK+iK31TBSG/toclKk8ql18yqIrYgm+8FuU3Hk9NKasO1EH1CoyBgjDC8c+GGwmSZ53VTD/LspfeToiXjANf4J/7tPe7rEELFRxFMaqv7Uf3VP2q9s4/vTMWUBuYJkNKqZzrQTDqZSC5yqjBjCy7IqBijB3d37tScHHFnep+CAs0Rxuph4bt/Y/T0b9NydNy5FXguETAZU18PzZtlmVeXjd4K4evL32dU8XiglK8dUps9I4YsthQFIQHHvRA+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptTA5R7NvYyORtU0JqiYrl3qIyNPFngt7oB+2r1SO1I=;
 b=QwwezToiujPrCPO7M3tGsdhbc6i+d+nhHig9B/6Mw4v6cpT7wR6fmNT6IqDToshEHsWPT5UlYuebCQtgE2uJypddJlecQZ1OH/kN/FATUCCxD3yGuMJCO0tkK++ZjlVo6zZMigCepjAlUIVyR+JxtFx9wVEI6NkAAMT04w4jRTa+wh6QPWZD0hVpH3oYfxacIUvB5FE9SX7vJ+qHI+vCJK/76X15/THB5D78hpQnONcW3vdbcVZdZkhV0mZ9+EMrQn9xRxpj/A2KNk4xMHy12KSf+Jv+eVwiVXzXdwTcKxjMoqbHATHwOgWOKGc0c1ObbllDGkpClj4gWA0OzZxR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptTA5R7NvYyORtU0JqiYrl3qIyNPFngt7oB+2r1SO1I=;
 b=GjB1i/99sStPT05RTtOA0mFA4hSkwq7YlybzcQdlFUZ2Gqd+PNJq1g6bQGxbOuhO0ElDSgSfP1cldHDdp4yz1grMYb6nnDe5XOTubRxSDID+AI5X+aZWqNTkaZX43SyDaLYJJJyIGySMkFo5tFEwoTlZ8Sq+/s+FMKrHiW0hLf1SU9mrV6DfANGy7kH0p0Cg4QW4bhQ9FYoVzQ5C4CFyvlMWhlUUOkLA/ygRP2LM20nAWnu8LyICtBxosSNYcSAU7qm9RODYCbWvfHE6mjsXqPhCTabwrF5vRNd9bhhqrviK9kqYkfxWh7Inh7IDiJaOEYsUCRKMuCoaRe0FX2b2Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:48:24 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:48:24 +0000
Message-ID: <b6d9c043-8627-4e12-b2db-be4eb50f78d8@nvidia.com>
Date: Fri, 24 Oct 2025 11:48:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rtc: tegra: Add ACPI support
To: Kartik Rajput <kkartik@nvidia.com>, alexandre.belloni@bootlin.com,
 thierry.reding@gmail.com, andriy.shevchenko@linux.intel.com,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251024064952.775883-1-kkartik@nvidia.com>
 <20251024064952.775883-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251024064952.775883-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0631.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: edf3058a-9185-409c-279d-08de12eadb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmRyUEFHd1p2OXVXdGozMlJQTFJ5RzlhM1lwZ3ZmSmZlVnpFclg2MVExWmFm?=
 =?utf-8?B?ZGdLMWNjUjlxZWV6Zm5zS3JMRnhzTE5GblVxSisxaXJ2TnJNVWZxeUR3SERv?=
 =?utf-8?B?bk9qb2hWdmJXUFhYQ1AxeVY5cnJVc1Y5UVpZTFFHS1huMERTc0J3bmtwUDFp?=
 =?utf-8?B?Z0doODBhV25yYXhzNkE5alBtWFpSRVZGVVlyZTRVTkw3YU1CSmFoSWxzQldt?=
 =?utf-8?B?cmxRd05zN1U2ZkZpdTNzdzZPVDlnL2Uxd0RQaG1hRjY3bFB2RzlSZXJnVVAx?=
 =?utf-8?B?RE1nUitsc29MVUZXMVVRTHlvZFlrdjBZTHdOb2JKNUZWVWczaG4zQk0wRnlz?=
 =?utf-8?B?K2lVRXlKRktoSjRMbGdDU2I3ZEdLUGRsS0luN2QvL1dremRnQ3dYZmhFd3JT?=
 =?utf-8?B?OFFHaVp6N2lVZVd2bnRXc3N1Q3loSTJ2WmFZM2R4aTQvZFFzbXk2cGpETTRs?=
 =?utf-8?B?cVlIRzE5S1laMzhXZCtrSnVaMzZLM212aEhoVzMxTENkV2VoaWRDdlZQbG1E?=
 =?utf-8?B?NUpzK3JDTHFjZ2RIZ1d6eHdrWEhzS3JabWtRNmJLWXhBeHpKZ0puVGdLZFBw?=
 =?utf-8?B?ejJCOUZOUUIrdEd1L1AyRzBUa1NTampxaG9qemJBQ0ZmenlHNU40S2pSYzlq?=
 =?utf-8?B?ZzFuWTE4Rmwyb0ZVKy9ZYVQ5ZXBaQmlwNlF5Q2VsYXNaVmtJcGdsbFBxb1hm?=
 =?utf-8?B?NHBadHlXdEc0aUtEMFhaVGUrS1Q1ckhZcnRiTkdFVHVYcVU4LzFqS0F5cHFG?=
 =?utf-8?B?MlAwKzllUThiMXQ4T0lDMEV6OE12YkJ1emNnc3BYa29EM0Z2MG13UVova3h3?=
 =?utf-8?B?YnhlYktRTUtwRWhJLzFuL1QyUGZKK2lqZTU3bytqYnlzTGVKL09VYnk1SW5O?=
 =?utf-8?B?cjAvdzdGemZUeG54Sy9HbXlieTZvMzNZVjlpbHNmNVRZQkhGK2J1OFB2dWFs?=
 =?utf-8?B?SjFaQkY0SXgyaVpYdFp5SUhMcXJ1aTBuTzI4YnVmVnFVZGM4TngwMVBQcDF3?=
 =?utf-8?B?SW83S016U3R4MWk4T0s4Q3hjL3Bac21DeG1uT241V1dLdWhsWWRzbWZYTDdJ?=
 =?utf-8?B?VGg4UThMRkIxWmV1NlVtQS9JQjdRcVArZlB3T1FhUG9NZ0cyZGs3MGtmZlBk?=
 =?utf-8?B?dStDVExwcFJMSGZKS3JKSEMxT0UvNXVMVUFhT1NPWmlhQklaNXJnMTA4RzZN?=
 =?utf-8?B?Smg0UHZkeG5tNUFMRW0rd1RiN0ZabTVuSGw4bm5PNWJpR09qR3RGcEpKcjAw?=
 =?utf-8?B?b2c1VUgxNjI5aUNCKzh1SzVoWS9jVVB3UWNGN09rQ2RCa2Z6T0JpM3UvYzBP?=
 =?utf-8?B?Z1U4UVhBRGE1MHRmT3dtUDlCRk9kSkc2YVE0b3A5TzBCU20rKzlBbDVuVzRv?=
 =?utf-8?B?c1gvTVRuQmpKWGc4UjhTajVhTzBCYnZQSEFrTStDUG1CbnNsWkhPWWxLbXBK?=
 =?utf-8?B?MGpieGRMeURjaGFXYTUvQkNiaGVmMXo3ZGVTZTVpejZSTTBPUzREYnQ0cCtL?=
 =?utf-8?B?ZGd5NFNpV1c0ejVKelc5UndWQk9abGNOMVc2emRraDVNZWN1VzYxbUhiYXVz?=
 =?utf-8?B?dWdueVJxTGRVa3ZlNDZWaGx0K2EraEN3NUxpdENPSzdCSndHVkRQN25wOTgw?=
 =?utf-8?B?VWl1NmR2SjI2ZFdZVzhzZGppOUhzUGVwUWN2UXpkdURTKys1VGcySU82c1l5?=
 =?utf-8?B?L1VmVkY4bjkyN1J1alZGcnUrcWMvQ0d5emhITjc2ZkcxeXlQUzR5SEpnQ1kr?=
 =?utf-8?B?Mm1XQ3B3R204c09UcjV1WE5uQ2hBM0pVMGxFTkZuUE9iTjZ5WUZZREh2WEFM?=
 =?utf-8?B?VFZhWmxGcDRFKytxVWhwZk1OOVQzNmoyK3UwaThpTENiMVp2MlUxOTJTTHJV?=
 =?utf-8?B?Yjdnb3haNE1UVGNTOHQrTXFwaDBUYzNrMFk0THgyU2VtRGhjamwvWUtoNDhU?=
 =?utf-8?Q?ZrkAGGl6HRQwN4kbVX/JvtkTR/No0PQU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRpWFc5eE9UdW5nc3BvNC94bjM2S1FHNmpsNG1walAwcDFYN2QxV1FsQ0cw?=
 =?utf-8?B?UVA4b1phVDdSMlY5c1R1dTU5bEFXOFBncnpnUnFxT2QvVVJ0ZTRyWVdwajhB?=
 =?utf-8?B?eHpLRHR1ZS83SXlldmtFZlI0QzZKSDl5TWI1UUZEdUpzQ1pJMDA0cHgxUTA4?=
 =?utf-8?B?YWliM0JnTzhOU25nN21jR1RlandsYkVOTDNpNGc1UEdoZThMUURodFo3QnJR?=
 =?utf-8?B?ZjBKZ29NMGpYWkdVTG5iRXpOdGJIRTNMVVlRZXBlQVRRQ0pwWVMrcDlQZnVp?=
 =?utf-8?B?dDY0cEhlWm91WnJySXdiWWVyallOaXRGenA1RnBrT0NRcWRGVHQvVXRFdlkz?=
 =?utf-8?B?RjJnUDdRd3J2U3AvR1B0OTNNTGwzQUdsdldIekRSSE1qSEtvTWd3VmxILy9m?=
 =?utf-8?B?aG9PNWV1cHl6TVRDb1dIYlRRZnVhcVBZLzk4RUhmUjRqNFBaRDlydkhCOGFV?=
 =?utf-8?B?c1gvQVBjTXRjZVMrWlZEVUFxSVVmTERaZEZYVEFHNlh2VDQzWlhnOCtTU2RG?=
 =?utf-8?B?ZnN2ejdNT1dJN3VLcmNVWTJVNWVRcWFOblB0RHJBYkJMdG9CdE1RWjlGODRV?=
 =?utf-8?B?TC8rclQwWGxDcXYxOUZGMUprajRjTEdDNTBUMk5vV3BrbUlaeXB0K3Z1ZEJj?=
 =?utf-8?B?MC9hdUN4a1RYeDhtL21UZkkrMjZKYS9qSEVxdXc5a1FCdDFYelI5U0ZiaUxo?=
 =?utf-8?B?ZFZ1NU94bVB6UUJINDVSTXlZekFucnhBTE93QldUVEM5M1lYbzdhVjhvckNR?=
 =?utf-8?B?MTZ6eTdUekpMdEhFYWRlU0FYMG9CVlh2MHJ2TXlsOVB0cGlrSmQycWtnL09h?=
 =?utf-8?B?WGY3M3ltM1pDUlB0UVNnL2cvVEYvdElXWnBhTmxOaVlUeU9JSStmNTk0ZHJH?=
 =?utf-8?B?SHJwLzlFRkFBNEFId29uaHQwR2RzSnZYNStoZzQzRXB6OGpHOXZvNFBjbnpm?=
 =?utf-8?B?ZDc1M2FPRVdzUms3TVZBZWQrMjUwM0V5dnlsVUt0TXdRR1liU3BGb0hyY29U?=
 =?utf-8?B?eWVJNDE4RUwwSW8rZWpycHE0N05idndyN2pCYllmMGlSckM1dmxBdmFkNlcz?=
 =?utf-8?B?Qmh0czV2akE4UENuWUhQdG9DbUQxTndSSDhncDBvdm9FbDJ5Sk5Fay9NanNo?=
 =?utf-8?B?TGg5K0tVKzhCUTNhamc0Tjh4aDJPQjFCZnYrSTd5NmxhOUFaMG90dlBUQXJX?=
 =?utf-8?B?cG9oMnFCRElYWlg1K01INnNEclVDOEZ6ckFHSGErcGFCOUhOU0pwK1Qxd2k0?=
 =?utf-8?B?QTJxeXJLakpDWWdmQmdvbXgzZThNWXpPMWd4eWw0U2hTdVpIUkIwK3NYNTZZ?=
 =?utf-8?B?U05vQXJvZVlGRHJNRFNuZjZubFNnZFYxRGpib2licnR5RHdmOVVoeXdtZW92?=
 =?utf-8?B?QlV6UW1ENW9SK2c1alVnVGZNTXdhbE5SMlRsWHVHWnJEMThWNGxSaTVhNHlP?=
 =?utf-8?B?VEpxcXc2aW1TNUxmaXRkVVlVanJRSzdvdEpwTE9ySi9yYlRyMFBmMXlXTlMz?=
 =?utf-8?B?N1ptMlVvc29Sc202VHArdlUrbjVWK3hkdmRnaXYvaTZRZzZhNzFxczdIVjl3?=
 =?utf-8?B?OThJU3YyRFg1TkRWTUxFaXNZSGxHQWhjMmFOY0paaGVBWjBheGNnSUVybkh2?=
 =?utf-8?B?ZjlUbVRpdGZReG9VT3h0eFdYakxncjB6YkxZLzhWcVdodXQxaTFtbHYyZGxn?=
 =?utf-8?B?YlIxazNiMmQwb0JISGVLTXZVRS9PWUpyd2ZSYkhPbm5NWUMrakV0Q0V6N2RB?=
 =?utf-8?B?K3RFYXcwbWI4YVNwMERkeUtiVG90U3JJNFJmTFVJTHBmazk1T0JFVGFuWkM4?=
 =?utf-8?B?U212VXRyQjhSeVdnS0ZrVXZHTTM4Ukh5QjZVMFh4a0xkWFBNV0xET05Rcmsx?=
 =?utf-8?B?N05wZzdWa1gxNnkxUDd4bkh0VG9ZeUllQzQycnFLNXNGWlJNU1hNUXY2cVZD?=
 =?utf-8?B?UHhoTHVVZDc5amNVRnl0akpqbEJIU05JQVVpb296dGx5UVFQNjlMczI4NWJS?=
 =?utf-8?B?SkZURjNFNFM5cGZxOFZHOWZNZDZScGQwOVhrZlU2dGVlMHZrOXJnaUx6SFlP?=
 =?utf-8?B?Q2xqL20ra25RdWlCSVVzVU9QeFg2R3FLWjZ5SmpKMWFmc3lMRnRENmxmUjZ3?=
 =?utf-8?B?bk1CWnEyaUNnVWdscis0RmhuWnpZZFlZbmx0YUFOMXFrazBuQ2Nkelg5MzdO?=
 =?utf-8?B?WnBxS3JSZzZLNnNhMFU4ZGJjbk5jeEI3a0p5VFFyRXJEVXBYYU0ycXlzcXhZ?=
 =?utf-8?B?a3JGUkxLQkthRHVxV3lnMCtkMEZnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf3058a-9185-409c-279d-08de12eadb3c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:48:24.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmvKuwfx4CJTbTcMGF3rj/4twkwmcScJ1mNOsHkiN47tGWsoGjvPE5LLVf+3TEZrjQydBu9chKhL09IkFn7+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073



On 24/10/2025 07:49, Kartik Rajput wrote:
> Add ACPI support for Tegra RTC, which is available on Tegra241 and
> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
> When ACPI boot is used, the RTC clock is configured by UEFI before
> the kernel boots. On device-tree boot, the probe must fail if clocks are
> not provided in the device-tree.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes in v3:
> 	* Add patch to use devm_clk_get_enabled().
> 	* Add patch to use pm_sleep_ptr().
> 	* Update commit message to specify clocks are requried for
> 	  device-tree boot.
> Changes in v2:
> 	* Dropped "linux/acpi.h" from includes.
> 	* Dropped redundant ', 0' part from tegra_rtc_acpi_match.
> 	* Replaced "is_of_node(dev_fwnode(&pdev->dev))" with
> 	  "dev_of_node(&pdev->dev)" to check device of node.
> 	* Dropped redundant of_node checks before accessing clock
> 	  related APIs.
> ---
>   drivers/rtc/rtc-tegra.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index e8c83a6a96b3..9e4e9c88178f 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -274,6 +274,12 @@ static const struct of_device_id tegra_rtc_dt_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
>   
> +static const struct acpi_device_id tegra_rtc_acpi_match[] = {
> +	{ "NVDA0280" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, tegra_rtc_acpi_match);
> +
>   static int tegra_rtc_probe(struct platform_device *pdev)
>   {
>   	struct tegra_rtc_info *info;
> @@ -300,9 +306,11 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>   	info->rtc->ops = &tegra_rtc_ops;
>   	info->rtc->range_max = U32_MAX;
>   
> -	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(info->clk))
> -		return PTR_ERR(info->clk);
> +	if (dev_of_node(&pdev->dev)) {
> +		info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +		if (IS_ERR(info->clk))
> +			return PTR_ERR(info->clk);
> +	}
>   
>   	/* set context info */
>   	info->pdev = pdev;
> @@ -386,6 +394,7 @@ static struct platform_driver tegra_rtc_driver = {
>   	.driver = {
>   		.name = "tegra_rtc",
>   		.of_match_table = tegra_rtc_dt_match,
> +		.acpi_match_table = tegra_rtc_acpi_match,
>   		.pm = &tegra_rtc_pm_ops,
>   	},
>   };


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


