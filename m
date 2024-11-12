Return-Path: <linux-rtc+bounces-2524-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3C9C4CFA
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 04:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F6B62812D4
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 03:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C40204F71;
	Tue, 12 Nov 2024 03:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="tXyY4+Oo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2097.outbound.protection.outlook.com [40.107.215.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83491990AB;
	Tue, 12 Nov 2024 03:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731380541; cv=fail; b=c7wHQhAL24pWDvrSpMDUmQY3MsJIXSjr8SVVVxZBjtwhKKs6/SUEWfEuDeLYFB3N3I93yTCM3xHxRPfvdipWw6DHEuuBxmppOeeXMtlDqc3RQmjsLTM1eWDb3LkPucBfMwz6pSSCviM1rihpU/kK7VcmFui9Kv8c4yiDDvwkWAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731380541; c=relaxed/simple;
	bh=YC6NNnSXDJr8q5jcKLqClgAODF7K2tLYoi6x4Xb+SMo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=am/iW7LTdDOabNP9n78R8Whgo0saL7Qjy0ThMDkqRVksNgGcWMWDdOuIAq0WR3HQSVv5phRYbsYk4ojvrmAeH9w8FS5y6uKsTa51isBdNOHUwq1FOzIqM527tO5pSGUYoYUx7m5w4T1gu8yi8Y7ei6vtBBuO5qwatS/7ksuNNt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=tXyY4+Oo; arc=fail smtp.client-ip=40.107.215.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm0qeeuRx7lAySYzplYnWsuf7+yVyAE5mJZ+GO2wQNFZ1yq+CUclA7+Hrzwd7vOYRX0H0pKZcbcKTuPNy+F/ey+6wQQcmSSUGNQ5TIhX+k5hnY8AfSphmpvrBiGTjck7DQIz0VCc/fm7qFyIEnJ4gMhwKsJIZvTh3pGxSJeB6HtxYIvTtylthpjolgZkwoksIVbslJ8cDL/LYaLiNjcVqPSBou1IBp3E1IyHspLZrasPj57ctoC6dCjdqcFX6LF+dr0hhUDXdaw/PBwiaUhCDZh+zTXjww9yY6eZzTBGs6jtsNykKB6XU4Ur+aVvn2RzjIkYqfcr2UT3ZOQGh9Jv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj2TndJ4PETExMBmuRMjw9DM/xmNGJPlzo9ueJtz1DE=;
 b=RyoLh9I+x2fPQAKcG/+RW4mFg9Qvcf2DrdPxgIN1tjKQeVD4KAk9mFufUAjO7RQJQ5h92vu7U3CY/cuNeA7K2yR7lHjq8gmjU+hnAEOHUlNEr9lWMKvVW68DSeDwt5nXDlbI2S4+3IOqZwsau/NO4Tl04mXrwyj6tok4JsP25g1OoFPYp78xsDwGTL3gI4134glM0al+jku1Nw6iMk89awY/EcnHdBtgM26aK9SLQPh609q+jQoHqcz7wxMSKMuUMGome+VMgl1weUyiYTVElyhYsMDhJYMIQns4CFfW5pK0ln0/pUHsFPo8ISw1BZLBzey+tV6TarAKV5oodCjPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj2TndJ4PETExMBmuRMjw9DM/xmNGJPlzo9ueJtz1DE=;
 b=tXyY4+OoB7jcgjpoyOC+QohXqWM+x9nARh4u6RBdgLd0ZyBnjQluDCr3oMSeSKAFxDiYiImdYTm1OCDKeW6hucCtF/lHRxiiogDApX4GFY7+nNBKcsKp/YpwvoKhtiP96+B4BIoxXjEb99VSg2IVgTMLxjEvAwXIGhG5mDV2C4j2MmGZAORpAJpKCuBNt+UG76M/Tcn9x3DKwLoFBX8KK5CsW+BX2YwrZNb9Bf2E9GSfbkFAmEJS/A7GKJmRnbF5/RLXJg4U4DjkzVwCycsvIuwPmk/zlCzT+a8gu5vCBDvj+6DoURC6g5blOlIGRWQJ/6CJIJ9wbzmnwey8/ZaW1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7335.apcprd03.prod.outlook.com (2603:1096:820:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 03:02:14 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 03:02:13 +0000
Message-ID: <c4ff8f00-35e7-402b-9e97-0641a192a9ea@amlogic.com>
Date: Tue, 12 Nov 2024 11:02:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
 <20241108-rtc-v5-2-0194727c778b@amlogic.com>
 <202411112207234c96cc30@mail.local>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <202411112207234c96cc30@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5e0e2c-df83-495b-9c42-08dd02c6681b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NCtFeHhxTWswTU8xQjVVS1VXeEIzZUZ1M0FhYVlOUE1RZTlzZkdSQzdXVzZ3?=
 =?utf-8?B?K1MxWWxGOVRpdlNBbis1SkRqT3BXcDQvMnBPZWVmeWhvajVvcUVacXltMmJC?=
 =?utf-8?B?am5DeVJvZlNoQU5FMktlVjI5R3Mva3NvRENocFA5TzBiQ0JVRk05VE9wTnor?=
 =?utf-8?B?S3BDRE9TeFE5VzVKKzFxenZSZkZzMy90UEV3TUl5OWVDUGJOeVZqVzJPT01X?=
 =?utf-8?B?Njd5T2dxRE16aytldkFvWURIYkx1VFRWVWRLMkpOcTk2OCt0TG4vSW9nNElo?=
 =?utf-8?B?UEZjZklVYjVGaTBqV3pJYXVpZW1TZ2xmYmh6V2lKaUw5TXllalo4VDNFMHBY?=
 =?utf-8?B?Z3djYWxHYjBFdUx6aStiR1BaVXRrR3Zkc01hOWlhRnRBVG5kUVZXV0trODRx?=
 =?utf-8?B?TjZjWFBzN3Z3RFo1dVJOc1B2aFJaaGkzYnQ5REtGQUIyT2tYQ2lTamV0Wlds?=
 =?utf-8?B?WWpmcjBXYlVNWS93NjZneFJLenU3eDhTaC9PaWJ5NS8vamZ6a3l5M0RYMzdN?=
 =?utf-8?B?Qjh6RytVcHJ1MU1mdlRsMVl6cWpaa21JWGlyZGpPUmdKTFVVWWIvSFBRdG5I?=
 =?utf-8?B?Wmx1UEUyRkZZSFhaUUZQMHBKMS9BU2F1dXo2Z1QzZXB6MVdacTFXUFBtaUQ1?=
 =?utf-8?B?N255aWlYRFZVbVBxdCtoVFArd3dDekF6OVA1bXNHZ3ZqeXdQQkMyR0UvS3hM?=
 =?utf-8?B?c2hwY1Z1Y21BbWJ6WGJUNVNFZHFkU3E5UDRiaUJXS0hYc2d1c0Y1UHVsUDBP?=
 =?utf-8?B?V3dWbFRqZnVqVVBHREU4bXBLUXNxL1lqR0V3MUdmUmJidGJFOFZUVTNTSVNU?=
 =?utf-8?B?R0JsTGN3SmpkcnpvcStiNHRSVWxXb0RtR3I4RE5aRXQ2S3pwMW1UdHBBa01p?=
 =?utf-8?B?MXFTU0JlUEJ2aDc2SEs3K0V3U3g4aUNqWmQ1OE4valNWYWNJZXNydThpbndF?=
 =?utf-8?B?cHYzL1M0M1gwYmI0K2FNU1hiOUJ1QzJNemI3MVl0RVZ0MENUQ1dBcDZOLzFi?=
 =?utf-8?B?TUtXSGZrT0pWRmV5Q3BtUFJiR0tveEtvZ0lsZmRsanV0REhzdDhCUDJCTm5D?=
 =?utf-8?B?cmI1S3k5TzNoTlN6RVZGUm9iUXFkd2t6dkFXU0VyRjk3eFIrUUlxaUR3emZR?=
 =?utf-8?B?QmJON2d4Z1o1dlRUajlkTGU5UjhzYjN5SDhFOGpmSzl1Y3JyWEF3M3FpMGlE?=
 =?utf-8?B?TXhtWVU5b1p4Qkh4eEhjK1U5RGxjZmhDd0J1T2lveXZiSDBBTzhTbmZ4YWZR?=
 =?utf-8?B?cDVJd0ZPNTZ0anBGV1VzaG1mb1doRjZaNWZNWWcrK1l1WTNybzRDamMrMlpo?=
 =?utf-8?B?bFBZMnNsd2hqLzFkZ0NjS2dEVWdIb1RQZ3VzOW1QQ1hvakdzait2aHBTcHVj?=
 =?utf-8?B?OTFMZ1pnc2N4TjJPMUNmaG9qdkg0emZudU1PeGYwUk9IUGRNKy90WGl0TzAx?=
 =?utf-8?B?eHdNRzJTejliazY3TFNvZEJLNHFhMWpWaFF1ZTdnY1FYcWFmTnN0VWpZbEUx?=
 =?utf-8?B?Y2hGM2lSRXZUeHRMTm1GL2RZSGo3MVhQakx1RjZtd0tzV1g3VEEwSEVaNHFa?=
 =?utf-8?B?amFKRUFETjJTZDJkSFlKR05rSlU2ZGdLdlQ5Vm9UdmdMQVZRRksvb3I1QWNC?=
 =?utf-8?B?RWFIOTdpNlowTmhPd3NEQlRsbTlyNktHK0Z6ZWxjZEJ6OS9xZTM1Mk5SNXZh?=
 =?utf-8?Q?DJLdzvm26TsB15x4H5yT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVMTS9XLzc0Z2orRW91ODZiWTF3cnp1U3JpV3F6eTdBL1p3cU5BMHVnYVRj?=
 =?utf-8?B?cU9zb2lvZFBCMkRORW5vR3F4TGFUTEtSeHVxSUxwK3dtcG05d3JScWpoelVC?=
 =?utf-8?B?MzJLbVY4aEVrU0xVYjg0akJwYVM0QVhZOWlSajc2YUJhMkVQTDhLbWJtQ0FZ?=
 =?utf-8?B?SndTUSs2RHozK2pUR3MxMjM2aGxSWEdtRTNGQThrTFNzOXYzOGR2WGpuRng3?=
 =?utf-8?B?ZGYrbHBQaUZNd2tadVArZ3RuSzFQZTgrNmRkVzJwbnY4Z2lkMk9YdFV2N0Vr?=
 =?utf-8?B?RW9rRnJBbzhycHl5KzQrU1dYdERKUnZ1ZVBtb3lDSG94ZndjS0x0cXN6N1JS?=
 =?utf-8?B?azFIamhLR2U2MTA1RkhSMFlaQVIyUmRjang1N1JtRWJHdzdMRlZSZVVVbXBD?=
 =?utf-8?B?Rit3MkRKVHhSZWRORkdvdk15dmF6a2xtRmRGbndoVDBIcHA0TDZTenRIZndL?=
 =?utf-8?B?SzZYdUNWbGlSM3p3MzU0V1JlcG0zUXo3TTZYZ3hiVm9GSURRcmthZ2RTL0lk?=
 =?utf-8?B?YUp0Nm91TktmU0RGRHBXb1Noa3N5dEJiVERoQWliRFZFbUZrd3U3d3Zzd05S?=
 =?utf-8?B?ZDkyM1Nvb1BnaDQrNVlZV0xSTUhlZXlCaWJmYncrbFErZVRSYnkwL0N6SVRE?=
 =?utf-8?B?NXUrSVdYaGpwTmQ3clJLRGZFbTRNckR6SkF1NTRySmFuTHlhNkZGY3NVOHE0?=
 =?utf-8?B?NE5qMEd6bEt1TTFQd3UwWGcwVzhDMUdObEFsTGg5TEs5WmxFYTIxZ05vUGpG?=
 =?utf-8?B?YitjZ2dLWEVPalNCWkNFOERwOXFSQVB0VjF2RG9oTENDbVE3SW4ycGo4Q2kx?=
 =?utf-8?B?WEpRdXQwMVBUcDdWN2ZNNFNjSElGUlBUSTVieWZWRGZGSnB1REJRWXEvZkhQ?=
 =?utf-8?B?RmJTWERUaHdVVGN6ZlFLQmN3REZIaEorWllUL2lTUDhuSjRPcTZkTEV5KzR3?=
 =?utf-8?B?cTJ4eDI1ay82ekZZVms4ZVdBbEJoMm5sN1NGQ25tNjhsT0JsVmV3QS9DZ2pJ?=
 =?utf-8?B?WWxBY25wYzk3MDNzYnRreTZQUExEYlhienc5VWxXb0tUcXUwdTI4ZnM0dG1Q?=
 =?utf-8?B?cHIxRFFZUDQ4b2R6L3RGYnQ3Q1lQb3Q1MkJmZGJrWTZLZ3QxeVE5SlN6N1o2?=
 =?utf-8?B?emFIeTMzSm1aZHVSVjhOSVh0U0ZBdUVyTi9KNWVIWXV3T0FKdUxBd1lVRTc0?=
 =?utf-8?B?b2g1Z1FoNUh3VDJKZHBBVitSYXBhd0lZa1U1ZHBRM0g5Mnh2eFFJenVkN0tL?=
 =?utf-8?B?aWVMMUVvdStJL0U4ZlNwV2VkL1g5V0ZaK2VVZDJWQ3NUVkV1M0liUFVZRTVV?=
 =?utf-8?B?Z25yaXhsenNRMlBTSllrQkcvOFVxUm5NNkZmU1IxSkQ0R2hPZ2o0WkE4Wkty?=
 =?utf-8?B?N0pMMkdaNjZkVnRVOUVLQiszUmFZOHFFTHRNM1JvdWR0cVlPaFBrWTZjckh3?=
 =?utf-8?B?U1ZrZmFkTThtY0hjM2dLUWpWVWVhZERjeGh6RkRXcTgvN0xLVEsvWCtDdVpz?=
 =?utf-8?B?S2hUVUpVblgyL25EZkVSMTgwYzhGRVRESnR2T0lKYUN1M3FBRzVZcHZzS3pU?=
 =?utf-8?B?UDRxSXJyVHN3UXdGWloxUk8rZ3NJN3BJUUhFMUF2TkUxY2dGaWR4K1FoQ1Q4?=
 =?utf-8?B?WGk4SVNpWVRMQzRlMUJRZHB4S0Ftbk1mbzNLUGJwcW1rR2JXK1Rnd3pwNjd6?=
 =?utf-8?B?amdFcUNCbnlvRzdydFVwN3FPSGkvcXdkSlp4L2xHSXJjekprRldFenpiZmZp?=
 =?utf-8?B?cS9lMDFqbmRIYjZCWlhTQVFxb2kwU1ZzUjBuNUpMdi9DYnVKRDBNM1ZQTUIy?=
 =?utf-8?B?N2Znb0o1VE1uOWsyR3gwKy9UblZPeTBTaGxsZEdJUGxUbU9PN3pGSE1oUUM5?=
 =?utf-8?B?TmljQTU3akl4Q3lqNTN4dGszdWFmSWRWRGRXbzVMaTFCd3lqWlZqS0FSbnAz?=
 =?utf-8?B?amUrRmdhMXNReFBCaGZwdTZkc3BVTE5LbEFNdDhXbm9hVzRBaThBOVVoL0Ur?=
 =?utf-8?B?TUhoei9aNS94bHpVcUYwVEVXYXJlaUlZYldGVEVTcmxQU0Z4Ylc1Q2pQUmhs?=
 =?utf-8?B?NXBudStVZm5wTk9PNDlFYnY5bUQ0SnBCVXROKyttZUw1NHZLZGo1Tm1KZE5G?=
 =?utf-8?B?MVk2QVRPdy9wQ1VXUS9RMjFKSmRibVBQbTFpQ21OeFpTQWc3aHlSa0JtU3ZZ?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5e0e2c-df83-495b-9c42-08dd02c6681b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 03:02:13.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+jSjs4Lqt8+f138HUVYxo1t7jyA0Bp3AoPRiUJC0b4+vHaMYuPuOWgkOqfHrpZZIc51yvfk5rhSq6WTig4VGN1JfKGlbPC4nigkrLFnUX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7335

Hi Alexandre,
      Thanks for your review.

On 2024/11/12 06:07, Alexandre Belloni wrote:
> [ EXTERNAL EMAIL ]
> 
> On 08/11/2024 13:54:42+0800, Xianwei Zhao via B4 Relay wrote:
>> +static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 time_sec;
>> +
>> +     /* if RTC disabled, read time failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, read time failed\n");
> 
> These messages should be dropped, they probably won't be seen by any
> user.

Will do.
> 
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
>> +     if (rtc->config->gray_stored)
>> +             time_sec = gray_to_binary(time_sec);
>> +     rtc_time64_to_tm(time_sec, tm);
>> +     dev_dbg(dev, "%s: read time = %us\n", __func__, time_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_time(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 time_sec;
>> +
>> +     /* if RTC disabled, first enable it */
>> +     if (!rtc->rtc_enabled) {
>> +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
>> +             usleep_range(100, 200);
>> +             rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
>> +             if (!rtc->rtc_enabled) {
>> +                     dev_err(dev, "RTC enable failed\n");
>> +                     return -EINVAL;
>> +             }
>> +     }
>> +
>> +     time_sec = rtc_tm_to_time64(tm);
>> +     if (rtc->config->gray_stored)
>> +             time_sec = binary_to_gray(time_sec);
>> +     regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
>> +     dev_dbg(dev, "%s: set time = %us\n", __func__, time_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     time64_t alarm_sec;
>> +
>> +     /* if RTC disabled, set alarm failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, set alarm failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_update_bits(rtc->map, RTC_CTRL,
>> +                        RTC_ALRM0_EN, RTC_ALRM0_EN);
>> +     regmap_update_bits(rtc->map, RTC_INT_MASK,
>> +                        RTC_ALRM0_IRQ_MSK, 0);
>> +
>> +     alarm_sec = rtc_tm_to_time64(&alarm->time);
>> +     if (rtc->config->gray_stored)
>> +             alarm_sec = binary_to_gray(alarm_sec);
>> +     regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
>> +
>> +     dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
>> +             alarm->enabled, alarm_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 alarm_sec;
>> +     int alarm_enable;
>> +     int alarm_mask;
>> +
>> +     /* if RTC disabled, read alarm failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, read alarm failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
>> +     if (rtc->config->gray_stored)
>> +             alarm_sec = gray_to_binary(alarm_sec);
>> +     rtc_time64_to_tm(alarm_sec, &alarm->time);
>> +
>> +     alarm_enable = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN);
>> +     alarm_mask = regmap_test_bits(rtc->map, RTC_INT_MASK, RTC_ALRM0_IRQ_MSK);
>> +     alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
>> +     dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
>> +             alarm->enabled, alarm_sec);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_read_offset(struct device *dev, long *offset)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     u32 reg_val;
>> +     long val;
>> +     int sign, match_counter, enable;
>> +
>> +     /* if RTC disabled, read offset failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, read offset failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
>> +     if (!enable) {
>> +             val = 0;
>> +     } else {
>> +             sign = FIELD_GET(RTC_SEC_ADJUST_CTRL, reg_val);
>> +             match_counter = FIELD_GET(RTC_MATCH_COUNTER, reg_val);
>> +             val = 1000000000 / (match_counter + 1);
>> +             if (sign == RTC_SWALLOW_SECOND)
>> +                     val = -val;
>> +     }
>> +     *offset = val;
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_offset(struct device *dev, long offset)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +     int sign = 0;
>> +     int match_counter = 0;
>> +     int enable = 0;
>> +     u32 reg_val;
>> +
>> +     /* if RTC disabled, set offset failed */
>> +     if (!rtc->rtc_enabled) {
>> +             dev_err(dev, "RTC disabled, set offset failed\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     if (offset) {
>> +             enable = 1;
>> +             sign = offset < 0 ? RTC_SWALLOW_SECOND : RTC_INSERT_SECOND;
>> +             match_counter = 1000000000 / abs(offset) - 1;
>> +             if (match_counter < 0 || match_counter > RTC_MATCH_COUNTER)
>> +                     return -EINVAL;
>> +     }
>> +
>> +     reg_val = FIELD_PREP(RTC_ADJ_VALID, enable) |
>> +               FIELD_PREP(RTC_SEC_ADJUST_CTRL, sign) |
>> +               FIELD_PREP(RTC_MATCH_COUNTER, match_counter);
>> +     regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_alarm_enable(struct device *dev, unsigned int enabled)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +
>> +     if (enabled) {
>> +             regmap_update_bits(rtc->map, RTC_CTRL,
>> +                                RTC_ALRM0_EN, RTC_ALRM0_EN);
>> +             regmap_update_bits(rtc->map, RTC_INT_MASK,
>> +                                RTC_ALRM0_IRQ_MSK, 0);
>> +     } else {
>> +             regmap_update_bits(rtc->map, RTC_INT_MASK,
>> +                                RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
>> +             regmap_update_bits(rtc->map, RTC_CTRL,
>> +                                RTC_ALRM0_EN, 0);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct rtc_class_ops aml_rtc_ops = {
>> +     .read_time = aml_rtc_read_time,
>> +     .set_time = aml_rtc_set_time,
>> +     .read_alarm = aml_rtc_read_alarm,
>> +     .set_alarm = aml_rtc_set_alarm,
>> +     .alarm_irq_enable = aml_rtc_alarm_enable,
>> +     .read_offset = aml_rtc_read_offset,
>> +     .set_offset = aml_rtc_set_offset,
>> +};
>> +
>> +static irqreturn_t aml_rtc_handler(int irq, void *data)
>> +{
>> +     struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
>> +
>> +     regmap_write(rtc->map, RTC_ALARM0_REG, 0);
>> +     regmap_write(rtc->map, RTC_INT_CLR, RTC_ALRM0_IRQ_STATUS);
>> +
>> +     rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
>> +
>> +     return IRQ_HANDLED;
>> +}
>> +
>> +static void aml_rtc_init(struct aml_rtc_data *rtc)
>> +{
>> +     u32 reg_val = 0;
>> +
>> +     rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
>> +     if (!rtc->rtc_enabled) {
>> +             if (clk_get_rate(rtc->rtc_clk) == OSC_24M) {
>> +                     /* select 24M oscillator */
>> +                     regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
>> +
>> +                     /*
>> +                      * Set RTC oscillator to freq_out to freq_in/((N0*M0+N1*M1)/(M0+M1))
>> +                      * Enable clock_in gate of oscillator 24MHz
>> +                      * Set N0 to 733, N1 to 732
>> +                      */
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_IN_EN, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_CFG, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_N0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_N1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL0, RTC_OSCIN_IN_EN
>> +                                       | RTC_OSCIN_OUT_CFG | RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +
>> +                     /* Set M0 to 2, M1 to 3, so freq_out = 32768 Hz*/
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_M0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_M1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL1, RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +             } else {
>> +                     /* select 32K oscillator */
>> +                     regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, 0);
>> +             }
>> +     }
>> +     regmap_write_bits(rtc->map, RTC_INT_MASK,
>> +                       RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
>> +     regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
>> +}
>> +
>> +static int aml_rtc_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct aml_rtc_data *rtc;
>> +     void __iomem *base;
>> +     int ret = 0;
>> +
>> +     rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
>> +     if (!rtc)
>> +             return -ENOMEM;
>> +
>> +     rtc->config = of_device_get_match_data(dev);
>> +     if (!rtc->config)
>> +             return -ENODEV;
>> +
>> +     base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(base))
>> +             return dev_err_probe(dev, PTR_ERR(base), "resource ioremap failed\n");
>> +
>> +     rtc->map = devm_regmap_init_mmio(dev, base, &aml_rtc_regmap_config);
>> +     if (IS_ERR(rtc->map))
>> +             return dev_err_probe(dev, PTR_ERR(rtc->map), "regmap init failed\n");
>> +
>> +     rtc->irq = platform_get_irq(pdev, 0);
>> +     if (rtc->irq < 0)
>> +             return rtc->irq;
>> +
>> +     rtc->rtc_clk = devm_clk_get(dev, "osc");
>> +     if (IS_ERR(rtc->rtc_clk))
>> +             return dev_err_probe(dev, PTR_ERR(rtc->rtc_clk),
>> +                                  "failed to find rtc clock\n");
>> +     if (clk_get_rate(rtc->rtc_clk) != OSC_32K && clk_get_rate(rtc->rtc_clk) != OSC_24M)
>> +             return dev_err_probe(dev, -EINVAL, "Invalid clock configuration\n");
>> +
>> +     rtc->sys_clk = devm_clk_get_enabled(dev, "sys");
>> +     if (IS_ERR(rtc->sys_clk))
>> +             return dev_err_probe(dev, PTR_ERR(rtc->sys_clk),
>> +                                  "failed to get_enable rtc sys clk\n");
>> +     aml_rtc_init(rtc);
>> +
>> +     device_init_wakeup(dev, 1);
>> +     platform_set_drvdata(pdev, rtc);
>> +
>> +     rtc->rtc_dev = devm_rtc_allocate_device(dev);
>> +     if (IS_ERR(rtc->rtc_dev)) {
>> +             ret = PTR_ERR(rtc->rtc_dev);
>> +             goto err_clk;
>> +     }
>> +
>> +     ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
>> +                            IRQF_ONESHOT, "aml-rtc alarm", rtc);
>> +     if (ret) {
>> +             dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
>> +                           rtc->irq, ret);
>> +             goto err_clk;
>> +     }
>> +
>> +     rtc->rtc_dev->ops = &aml_rtc_ops;
>> +     rtc->rtc_dev->range_min = 0;
>> +     rtc->rtc_dev->range_max = U32_MAX;
>> +
>> +     ret = devm_rtc_register_device(rtc->rtc_dev);
>> +     if (ret) {
>> +             dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
>> +             goto err_clk;
>> +     }
>> +
>> +     return 0;
>> +err_clk:
>> +     clk_disable_unprepare(rtc->sys_clk);
>> +     device_init_wakeup(dev, 0);
>> +
>> +     return ret;
>> +}
>> +
>> +static int aml_rtc_suspend(struct device *dev)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +
>> +     if (device_may_wakeup(dev))
>> +             enable_irq_wake(rtc->irq);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_resume(struct device *dev)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +
>> +     if (device_may_wakeup(dev))
>> +             disable_irq_wake(rtc->irq);
>> +
>> +     return 0;
>> +}
> 
> Building this, i got:
> 
> drivers/rtc/rtc-amlogic-a4.c:409:12: error: ‘aml_rtc_resume’ defined but not used [-Werror=unused-function]
>    409 | static int aml_rtc_resume(struct device *dev)
>        |            ^~~~~~~~~~~~~~
> drivers/rtc/rtc-amlogic-a4.c:399:12: error: ‘aml_rtc_suspend’ defined but not used [-Werror=unused-function]
>    399 | static int aml_rtc_suspend(struct device *dev)
>        |            ^~~~~~~~~~~~~~~
> 

Will fix it.

> 
>> +
>> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
>> +                      aml_rtc_suspend, aml_rtc_resume);
>> +
>> +static void aml_rtc_remove(struct platform_device *pdev)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
>> +
>> +     /* disable RTC */
>> +     regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 0);
> 
> You can't do this, this defeats the purpose of the RTC. Once started an
> set, it must not be stopped.
> 
OK, will dropped this action.

>> +     clk_disable_unprepare(rtc->sys_clk);
>> +     device_init_wakeup(&pdev->dev, 0);
>> +}
>> +
>> +static const struct aml_rtc_config a5_rtc_config = {
>> +};
>> +
>> +static const struct aml_rtc_config a4_rtc_config = {
>> +     .gray_stored = true,
>> +};
>> +
>> +static const struct of_device_id aml_rtc_device_id[] = {
>> +     {
>> +             .compatible = "amlogic,a4-rtc",
>> +             .data = &a4_rtc_config,
>> +     },
>> +     {
>> +             .compatible = "amlogic,a5-rtc",
>> +             .data = &a5_rtc_config,
>> +     },
>> +};
>> +MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
>> +
>> +static struct platform_driver aml_rtc_driver = {
>> +     .probe = aml_rtc_probe,
>> +     .remove = aml_rtc_remove,
>> +     .driver = {
>> +             .name = "aml-rtc",
>> +             .pm = &aml_rtc_pm_ops,
>> +             .of_match_table = aml_rtc_device_id,
>> +     },
>> +};
>> +
>> +module_platform_driver(aml_rtc_driver);
>> +MODULE_DESCRIPTION("Amlogic RTC driver");
>> +MODULE_AUTHOR("Yiting Deng <yiting.deng@amlogic.com>");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.37.1
>>
>>
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

