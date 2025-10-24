Return-Path: <linux-rtc+bounces-5146-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB74C05A86
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 12:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16133B4091
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766E3126B2;
	Fri, 24 Oct 2025 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YkaCK9IA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059E266B46;
	Fri, 24 Oct 2025 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302915; cv=fail; b=aeL1LfaZ8I1OT+GP09G1IZZevUpWHTNLnua+cUFH4WS8FoeUY0TKgCfq8c9NXsFp8gmGv8SjZb1EzSU7R6GvF+SQy9dC0qR8lZqT4QvGK4EoGG58foCLzBZ6Mgb51GnN10mqeZm9OU2DObZ4+8KcaK1gCk+MO0tVZMzVjMwBWAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302915; c=relaxed/simple;
	bh=VfpYaHni/VajkFA2kP/OBILqlyd/eqe+0qzf9kRJlqQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y6VnTfqUkx+ssHW9LJhN6jXyqw1I+GpV0UZZalUEdJgT3PJi3nmn7z184SlTJ8t6SwDB++9WvcSr6xSKBT9cF9matRHgMQe3GWEXpmPT9Kh1L8pBvSlzTqZ5ka0JadTC2FLyAbZEw/8OdsHppR7Wrg3zuRdl86jH0WadHqCabLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YkaCK9IA; arc=fail smtp.client-ip=52.101.62.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMf2KqzAOv+YMmKNR1ShkzUx/C92IybGQJsbcE46FDV31ZHWbYJXhD3Qp4TnV1x6EvotIY9q9uRXvqwVNakWWlUgxKBAxkFEDz4nU7hkUlV2uNZlVngGLOxrnrC/E21e9XzFnCMn3r/oAaNzZSVq+w2D2+ajD7iH4vXPTAZvJegZSzAcRgAKrHYcxSZttYqEbksGeziRph2VJPyBzyRz+mypF2dFJ7D24emmRC9mqnPnMfoZ6jnTsrtSsAlD0GrufSgCnwko5ZgfJtWAZE04V7oLkBKQj+jj0sX8fzugPs0hoWJ+Q8Vfgvqm1LGkj5MPUB9PmJuO4dU5VFRHvebEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE5zF8Q7RML1tXkywcny2k49KaxJsSrlsvXvNK8Y5OI=;
 b=gkVSKk65peUnMOlj1/jIaJJUJ84yj1CIl63vCtmZTrMPhnugq3deeJBaa7mQQkaoG4bzqX87cQvCPA3hnrh0yEiXIamT7M4YT8kCDDbVgbmYGqEo6d34ssuEaWwbJqB32uS9NtEkZc7mE/yPUkU3hkAnaDkgRytsVN6vJMrfhsf3BHHMEL2JmyxwmsgE3TWG876YnxVuUsg6TFJIan2AGcBED2xkqLK8O8gMbFY69pP4b+6o3YxjTUers7Gnw/RLwisSEIFESyMcXgaNA5M1kgBeX2pIv1skO3zZ7iySZMYG9CV/Ac2hOhMpJhTRKlNtOzQlZytCiCevF3QfnFuHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE5zF8Q7RML1tXkywcny2k49KaxJsSrlsvXvNK8Y5OI=;
 b=YkaCK9IAywzksBdR3ZgmngEeW8AdGv5CTHOc1pDJJWUZe8idJts9N0zd08TWKrQQG9wbW8da8AQ4M/MmoxIQRe8vKC++gCtqUQklTjJkb3nmlgdLgRfVFfntkFZLkpnmvhtu0crgXw1jUSpNRd9OSG3mPcziU00BNXp+xAkU2sXPB9Rc5LZhbM+2R7nWu7qKoElwuEh37Sb2EcpgRR8ALfW7WNZYmoOhU1d/UwAbZoDeHm0SOJ3dkzZ0cyYjgGj7Thyv9jkPa0pLBW/+KQNSK0m70LMXFQJwDONMbEk9dExLMCF36r+Z4JXfFWS4peMXfjsul5a9Hg1torDXD8jQyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:48:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:48:31 +0000
Message-ID: <0610cc18-3918-45f3-a610-584635565258@nvidia.com>
Date: Fri, 24 Oct 2025 11:48:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: tegra: Replace deprecated SIMPLE_DEV_PM_OPS
To: Kartik Rajput <kkartik@nvidia.com>, alexandre.belloni@bootlin.com,
 thierry.reding@gmail.com, andriy.shevchenko@linux.intel.com,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251024064952.775883-1-kkartik@nvidia.com>
 <20251024064952.775883-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251024064952.775883-3-kkartik@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: dcf375fe-1af9-4eda-e057-08de12eadf5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzVGRE1BSDlNc3BCZTM2QW9xenhHVGt3dU9LVzliK2xidkx6dlk1cjBpd1p4?=
 =?utf-8?B?OVlYbm1WZ1lMazVhRkpvSi9zNzVwSTBnUXNuNHNBbElsYyt5TWNMS2Nrb1VU?=
 =?utf-8?B?Y2QrblZMdmVFZy9CSStLVU95WmE3Tzkxekd5RUZSa2JMbDFGTDBmN3JpcnBo?=
 =?utf-8?B?WkRXemVISVdjUjluaUZxVEdISXNjUmVReFd1WDByUlVrbVNpMXlzTm95ZVQ1?=
 =?utf-8?B?NWVIMWo4UVhMZ1lMYk1OK2F2RkJVbEpNdVVwWnFUOEF5Y01qNzRIb0xwcnpZ?=
 =?utf-8?B?MHUrczFIV0w3TFBCM282NjRQQ3JTOEhzREJQSjVLd1Y2RjhLSlVmNTNEc3lo?=
 =?utf-8?B?MWNhZlVPQjBPbmg1ZU01YlZLaDFoT0lzc0l6RjFtbDV6QzdvY3VLcm8rYXlZ?=
 =?utf-8?B?UzhaVFJpWWFNUjY1TUUyWHhCcS9tUmxYbHA1cFJnUWovL1hJNHYyVWwvaTg0?=
 =?utf-8?B?bG9jcXYzQitydlhxemtHTmNBUmRYNWtwYnNCTUZQUnp1Z01sZGlrWXNQV3BS?=
 =?utf-8?B?OVlSUVlsSENkZnNwcnhqUWozSUpzS21pbXZ3dmFOSzNaTHdQaW8zWmRYeUZZ?=
 =?utf-8?B?bEkzMEVVMjk1SC9YdmNscDEveWRwVGl4QmRmTk5iSkJoWG1oaEpBM2xMUU16?=
 =?utf-8?B?Y3ZpYWNXWnhaODh6LzkxNE9wVnU2dE8rckI3a0tNRnJ6VjhMWTJoVHcxT0xX?=
 =?utf-8?B?UEhRZXF4ay9OTWFUNXJTaDhibEtncXNKSFF5cjZBcHdaK0o2OGk0RldlRERY?=
 =?utf-8?B?NmhoMWRBakdLaGI1aklhMUM0ckxKZzhYN0NFYUpGRlFMZ0o4c2ova0JhYWJ4?=
 =?utf-8?B?UDB3L2dnM2pvcGFKM3V3UnA2ZmEweDVjcktoZExCSXM0azBvODAxalJ2bUhD?=
 =?utf-8?B?OUhmamo1NGFBSTRtcDcwdUNCb2hrNWt1VUNrRHB3Y0lybEJDT2tBbjdzcDlX?=
 =?utf-8?B?MWFwdHdvY2tHY1ZqbDFxVG9jeENLQTd0VHV4RXEzS3pBa3pra1pkTmFnQWFI?=
 =?utf-8?B?MTQ4TmVsQUNWYjlhWnZPM1pPNnd4YW9xampFVzFmN3VBNnozcWs4djdubGV0?=
 =?utf-8?B?OElld2tsUC9GN2JqRGhWT3N0Z05wckJvUUhBRENqckx0QlU5ZnpCMmxoc2xl?=
 =?utf-8?B?dnlFVjBpZ3pvbEFEU3JUbXZEVE4zSkZPK0hpS1BteGQzN3piNUVSdm16YnJr?=
 =?utf-8?B?STNtVUpGb21WYWtLTGM1Vjk2RUNKMlhpUTNtNHlCUEloaVV0UnRJY1RXY3RX?=
 =?utf-8?B?YkFHR2R6NlpkT29ZZElrOW9henlnNTBRcjNTRTluSXhDTmNIaEhKMEtZRXNX?=
 =?utf-8?B?UlhEWEowM21sejM4LzM0OTdwYmZvbWNvK3VQd3huNzZPU05SUEJScmpvdUxW?=
 =?utf-8?B?Si9ydG0yTDVhNzlOdW1uc0M5dUhvYjMzbmNybkFTaDV0UWd4REJtbU9ydDJ0?=
 =?utf-8?B?YzMvM3Z6SlU3WnljSzBaMm8ySEs3VlZuZkk2RVk3OWl4WVhiY2NUb2RMMHZx?=
 =?utf-8?B?OWJreUREaFo2NmpHWEpVVmJUallBNkQ4SEkrWUJUbGNrK3h3dCs5aWJUUmtO?=
 =?utf-8?B?aDNGRi9BaGFXTFp4amxLRExCY2ROZ3crYkEyM0hyZXA5bHhlTWc3WXd3ajJF?=
 =?utf-8?B?NlhNMldxNlBFbnROZENObUNqeHh2WGFkOW9PUlNyZFJSUEZkenRYK3hVYzA2?=
 =?utf-8?B?RzNyK3JDaG9DQ05HZERxOFVDWXNtNFI2eXhMNGEvVVJYTzVjVW5RN01MMW90?=
 =?utf-8?B?SkNJUjV2Z2xOV1AzUEhFMG82SU1BRVdoUlphUldBUWlLR0w1WHRpL0VIQkM5?=
 =?utf-8?B?dVI2aWpHcmx3NXM1WUZMS2RDNzQ0MDBXTFFnaEdQY2NmRHd0NGtIRWs3N3pq?=
 =?utf-8?B?NXRCcS8yRkk0TXgveGNURjBmc2ZmM3FqN3pLWXRqRmZZSG1MZjhTZzh3UE81?=
 =?utf-8?Q?IHbccugt/516UwRCZIC1OVRBDhzwZ/ub?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yng3OGVCRlkzeGdrbUlKMlZWZEp3aG9FTWZVUi8xYy9BZ0JWcTNHSmZUTUVh?=
 =?utf-8?B?VlMrVHM1VWJwcUkwNngvSHphaTY0OVl0YTZmd05SVlJKMG9jSUszOTNLSDBC?=
 =?utf-8?B?MjJ4c0JiN2loSjVNcDViUlJ2R1RBQWVSZVdubkhDS1UzMHVucnRrR1ZXaitQ?=
 =?utf-8?B?QWxacmozRTQrc1MyUXpiTXR3NTBZM1g0d1JlTXdQbHhNMkRvVDBHUG1iWjA2?=
 =?utf-8?B?bUl6c3dTbmh1VW51T05JWXdBL0FnaWZZaDJpTUlicEtCYUNlYTl1Z0tDSDZi?=
 =?utf-8?B?QlR0c3RxamhGS0orS25kdU40SGZUZmlTQTYvSXdDL0tGLytFMlg1ZVFuaEV4?=
 =?utf-8?B?dzRNQmxJQWhWbngxWW5DY3BhSkpCWDNTZi9XenpFbi9nTFF6ZEh6eHRJRkd0?=
 =?utf-8?B?M0RhL0dUbnJESHVOS2xiVEdXYzUwazYyVmd0clRpWHZqRFNQVmZ0RU5PUTky?=
 =?utf-8?B?aWFPcUo1dXNTWVQzZHdHTE1JSXVlaXJMQWdaekRiUkE5a2hqYVZZZzN6RlN4?=
 =?utf-8?B?WWNGdzFFM2xKS3J5b25tUUdtZ0tPcloycDUxT1VEZko4KzVVZlc2ajFkRUFi?=
 =?utf-8?B?WTZXVzl2RW15QXlaQWJsREZWaXBZclZBQmlsd2N1cElLakdoSnlQMFRwWXov?=
 =?utf-8?B?MTR3Y3prWXByUGRNY0g1aGF3U3IxQitTejZ0cFVYMDlKamJDMmprd0xVaXIx?=
 =?utf-8?B?NEJsS0JyUHpkLzBhb1BLTlcwRWRkY3Ixc09QTzNreFk5T3BpbUtHSFBNKzN4?=
 =?utf-8?B?WER2SlRPYUlUaHlkMGFWV0xyU1dpa1BwVUxVZTR4ZnRydnNQRXluNkJFckpM?=
 =?utf-8?B?Mkt2TmlRWW9qNW1EZGwxOFE3RXVCRlNwREFKRzdsanZnR2NVeWZ3R0d6NW56?=
 =?utf-8?B?R0lpSmJ0dTV2MU9rTi9lRXRVS0VNNWNEaHBwOUZkMElBUEMyckZPRGZad0Ur?=
 =?utf-8?B?eWVHQ0JIZC9KMnhGdU45KzVwREFXL0lvd2l4Z1dvcXQwZzYzVDhlcnlGMEhX?=
 =?utf-8?B?MDRoMGRjN3FXMEtUNDJlRko4YXpSa2FuSGI3R3BWcklVcW1mbmhBN1RSaGo4?=
 =?utf-8?B?ZVRjT1prUzZqZzZTeGJTRkJtTitCWEVPL1hHQ3EzMmwzc01NczFPWFRZQkNz?=
 =?utf-8?B?RWJuNlNUK0Z3RFBDbWo3SUI1eUE0UGY3UHBheG9iMmR0TVNNL2E2bytaQ0ZU?=
 =?utf-8?B?WGZIbVB6eW44Y1dYemJrY1gyY3I3RVhHNzExVWUxempuWmFYdkpZK3d3SEZw?=
 =?utf-8?B?QUlBamcydXQ4aDVtYVpGUEV0M0RXQkdTUEN3cDV2eVVhbkpuTHcrelVNR2JR?=
 =?utf-8?B?alpRT0tFV1FSMWFUbHltNndvQlRaS2ZrTnZnUTMzKy9jdWRhMHk0THZ0bWxF?=
 =?utf-8?B?b29tRkh3SFR0a251eGFjM3hyTVNBeG5nRUtRM0VvUjEwRTFRNkR2S0c0VnRH?=
 =?utf-8?B?OTBEWjI1c25lWnVZd0FXZDZ4RWJZb1c4UytkNlEyajV6VFZqUGtQMXU0RWVr?=
 =?utf-8?B?MUUzL2RZRE96cFI3amNoczE0Q1UzZTVhOTJjSmdDSUhYUHBaNmh6V2JBcWVG?=
 =?utf-8?B?N2Fob0ExUXViWTZ1eU84WlZVeS9FZkNzb003RW05eXZ5bllRSlFlazMzbjBa?=
 =?utf-8?B?QmF2TERzclU5L3JxeUc5V1NyNUR5Mm5kbVlHSkpmY2NaV0tQOWxKQzZBZ2g3?=
 =?utf-8?B?ZmFjY0ZBUkhDcWI4MlM0TFQ0U0tSQXovZTFRVDBtMlVCQW5raE9HcEN1MjYx?=
 =?utf-8?B?R3R1Zk40ZlBDZE5CbmMzd2t0L3RYM0NaRm01ZXdFSXFkRXlQcVBWRjJObmJj?=
 =?utf-8?B?bEZTd0JVekkyWHR6RCtrWkNCVWhFVWdkdlZLelVpck51ajFkbEVrN0w4K05Z?=
 =?utf-8?B?U3psaGNKd2RMdUxtMlZCSjd3N09xcTNLQVRNeHY3SWZtU0I1VVFVM1JhTHk2?=
 =?utf-8?B?UlhUcUdoVlJ1N0kyOFk0NVFLUlh6K0dmaTk5enQ4T1NEQzV1MExseW9PVmI3?=
 =?utf-8?B?dk0wOHM1UnFVdXp0TGJ4VXA5THJGQURQYVZKaFNwVFdJNUN4TnRCbXZ5VGFW?=
 =?utf-8?B?QXU1aFZFWFQwUkhTUytVNGFTQ053MlJYR1dyNzR2WXQvekQvRXpGamF5UVp5?=
 =?utf-8?B?YmNEWVVLSUdTRzRSdG1VdTVZWmtzVjFzaHhZdFgwdWdtdmVYK09uMGNRM25q?=
 =?utf-8?B?aTJmdnBBVWQ4Si9iNk1OS2I5RVRTdm5KdGNvSlNUVWNIUnVWU05LYzRvMmhi?=
 =?utf-8?B?Z2p0MEQ2WGJIdEs3Qk8zRm9uK25RPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf375fe-1af9-4eda-e057-08de12eadf5f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:48:31.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6mnEgVuvd6yY6o6S61YDu/qmF2GAt9opnOeW49ZA2UNTjMkVI6f7BiQZhhvPS/xxCyBV/wSmvUEtVYXIqKRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073



On 24/10/2025 07:49, Kartik Rajput wrote:
> Replace deprecated SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS macro
> and use pm_sleep_ptr() to initialize pm_ops. This also allows us to drop
> the checks for CONFIG_PM_SLEEP.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes in v4:
> 	* Updated commit subject.
> ---
>   drivers/rtc/rtc-tegra.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index 9e4e9c88178f..528e32b7d101 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -340,7 +340,6 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static int tegra_rtc_suspend(struct device *dev)
>   {
>   	struct tegra_rtc_info *info = dev_get_drvdata(dev);
> @@ -378,9 +377,8 @@ static int tegra_rtc_resume(struct device *dev)
>   
>   	return 0;
>   }
> -#endif
>   
> -static SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
>   
>   static void tegra_rtc_shutdown(struct platform_device *pdev)
>   {
> @@ -395,7 +393,7 @@ static struct platform_driver tegra_rtc_driver = {
>   		.name = "tegra_rtc",
>   		.of_match_table = tegra_rtc_dt_match,
>   		.acpi_match_table = tegra_rtc_acpi_match,
> -		.pm = &tegra_rtc_pm_ops,
> +		.pm = pm_sleep_ptr(&tegra_rtc_pm_ops),
>   	},
>   };
>   module_platform_driver(tegra_rtc_driver);

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


