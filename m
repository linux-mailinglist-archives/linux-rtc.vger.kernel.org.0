Return-Path: <linux-rtc+bounces-1960-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA4E97687E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08341C22D6C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0C819E963;
	Thu, 12 Sep 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J8rdceNy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98D18E043;
	Thu, 12 Sep 2024 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142431; cv=fail; b=nqPCGfxM0KnX35jnjB4T/R0tLg5hdq8NzCbnT0+CM4v0/xA6ps2OWFGaIW/YpFZFUeAAqSMGxiFBFQmbYZk/Q7ExrQUHy460sadus7rZLJStSWrTPWMhUL2kUVx7oa+DTlaU1FlB3Y4rLaU4Rm1kkuKsv4uSg4Y/HpAyLOoEO4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142431; c=relaxed/simple;
	bh=+ob6RXlKvj341GlCkhTFTjK4hDCEfa7PD16wHTVoxIU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dAFlNx0pqft/gMMOOMDObhp+7aEeNzGgE8iE045ryctMChcAZ9Ob31zZBRqj+e1Ra0UQB8FQFkzqE3e+bY/wVyRbvmnHIit13W18gGKax2npoolNfylur9m3HJAeg1enIJ1viPNqTlqUKTePEeAB/JzY9ELuJVZYLwA6ntS8SqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J8rdceNy; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6K2T+uTqkUTtfjIAnhFhojL/ZMnYAfua4WNJfFogMwSOLAqdj0Nlq3mwkRgUzmZ5R2hnUTIffHcoYdlfQTg0ocqcRrkEBtFkSderM65xD6PBhEU8EJ55sogRKOQJaHF2yfDAbHKaT8wZHHSXRTEXRKFvzZcG/pgdY4CBaIbITrh4HTnwhVlCGNXT6fsVSJqyPWcezEbGaXqiLHXPmZzYXpsQuv/XYRBXJNdgvEDen9RU03RshnwSRmzcGOz/IiRi+8QZdTZavnDVLwpr3BmRAgy2NmnfaJQQszKVGxYLt0MVu7nHsRKhuF4A5GKpSHkbpDEiqRTDtFB4qkSB7gmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gFGpTfK0wHRDo6og97kADPm0paPCbvG/3u7cTDeyoo=;
 b=S8lJBR37gA75rt2oyWHwZjHaRPDN7kU9OwpHjrzEznFbYrAo/vMcH2EZNof2BdKIwfj+dSxvBfpHHgTCCs7Yeqi/3Sog9LNRhZA1h0/DKnY4b691JpSg4QXI4HFmTecK4Tw3rLM8z2PJELc5cT2ru2l/96AD8Na57FPjkpqVLKJjSOrc0RscTBCk67BiUdakab8PIv5BuXScoO07K9krAnI+I6FNTwBdenly//1/jYwCGvOROJjAR54zyoMbJZezAShSHIf6oKbJgYngi1DHHLBNW3H5KAVeC9DrrWuRX17KK+8z+fZFjSCMqNIRWffoUvranyYkD7RuaKbVwY2vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gFGpTfK0wHRDo6og97kADPm0paPCbvG/3u7cTDeyoo=;
 b=J8rdceNymrEYMzZKQ0OxIo9cOOpn+wmCqvPKkvnAYD7QitLxPvjLPiemB8g1urd5p2e71ggn92Yf1ORZG9fw1Vq8iDuf+Uqv/19G3yZyEOODg6d1AlsrSZaAZ+xvXuQGeWhWPGLuTQuyVY6RmKqh+LqqrVWWWUjzY4cycHUAmzKdYboM1QQLSoOz8GuBW4xbgABRhhQ3BROiWs6JRlM9Xi9UApECZ4mo54Jz5KFch5RnF1Q7Om35ueNQcZVmNZjby78RaI+WuObqkpqawLvErt8+fCnzQcVuRR3a08cuFYCdyTBAFKF+XqONsBT7/VRyL+bx1IkVqAZ/zioG/ISKzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10842.eurprd04.prod.outlook.com (2603:10a6:102:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 12:00:24 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 12:00:24 +0000
Message-ID: <f6c4a4b4-d05d-40e1-8ecd-45df7cc21ebd@oss.nxp.com>
Date: Thu, 12 Sep 2024 15:00:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-caretaker-dropper-424e102f8634@spud>
 <2aa1d3ff-bc9b-4c1f-a6d7-5673981d0ed6@oss.nxp.com>
 <20240912-skedaddle-till-2fa6f44c6e66@wendy>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20240912-skedaddle-till-2fa6f44c6e66@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0053.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed6776c-94ed-433b-8e55-08dcd3227ba9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZSsxd1lDTURzWTVuSm5zYjBBcVV6MkYrTW43RUkveW9yVFpqOUpWa3BFV2ho?=
 =?utf-8?B?S2tVdDh5U2txelg1L1FkaDVmMlIrUng4RVA2UlkxdkFDbG1GbTNaMDgxSWla?=
 =?utf-8?B?L0hXWUkvWGg2YkNxMmRldlF0ekUwajEzK1VxVHdhTUVneFpBZlFBY3hJQ3p1?=
 =?utf-8?B?eWRQc281cVliV2tKemFvZjJobVNMYXZEVWdYNGVIQm5IWXgvTTN0alkyeGFs?=
 =?utf-8?B?OHdYb3lrS1R0cWt0N0tZTGUzeS9scWgxU1FUeFpRKzNyRkhkZjYrMCtrOU9o?=
 =?utf-8?B?SnFrOGZZeEhCVXZreW1WMit5ak4zMjNXQytqNDVGaVFrMzgybWUrMDNlQXZa?=
 =?utf-8?B?b3ZzWFA1NUVyWHRiSENpU2FBYmQ3a1RqY1FDSkEzRVAyT3BFR2duNW5pZTVX?=
 =?utf-8?B?ZjRjZlRKZ0xOdVdrSUE2aFRITDUrZ09RemVvQm1QOXBUN3VEalFmd3RjMGFk?=
 =?utf-8?B?NFFId3ViSDhYbUxadzlzMmF5RkZKRmdObVZFdEkvTmFoaXk3ZlloclNYbnRD?=
 =?utf-8?B?WnEwWkNuUWRLZ3pKS1VTTDBHMm1yNzlUaWt1QlhWd1dZazFkcHBRMGJIWm1v?=
 =?utf-8?B?anZPN2ZTbVFtVUtLek5ud2hnOVMyVDFrWFAxOFNUdXpmSy9DU3YyKy9QeFJj?=
 =?utf-8?B?K1FBQzY3azhNS1d4SENIR3RLWldkMjExaWp5b293aU1KaXNQcXdwbUd3dHVs?=
 =?utf-8?B?b0FaTVhIZ2phbmV2bXExWDdjNFVNckI3aHdXWVN2b1VOMTZWT01WSVg4MzJ4?=
 =?utf-8?B?Slg3bWdiblpjVmNJOWpNempJOVhCcXBqZXpETFJsaE1ySW9xYTNFMFhpQnhN?=
 =?utf-8?B?UG1pUjcxeEVIZlJDUEtENCtEVHdsUENuNTNHbVg3RHY4N1NLNi9aRDJzcEty?=
 =?utf-8?B?TEc0eHA1WUErT29UQUx4d0ZKOGZQZVZvZGdIN3gwdG40SlNZZ1lXRWUxalRs?=
 =?utf-8?B?c0E4YXBCYTVURnBuN2xTeDhZUm5rZ1BvZFU4MDhzalFqSmQzNGo1cGFxalB5?=
 =?utf-8?B?eE9LY0FISitEdW5Wc09ySTFJenJ5a1p2T1EzYUFYTExhSjFJZnc5WlVXOGRi?=
 =?utf-8?B?M3ZZMDg1V3dqdHFubFJURVJHSHFoR1FZRmZCVU1MaHpaZ3RnMnFWQ3NhRTc2?=
 =?utf-8?B?SmlSMUo1R0dTS3RQOFdTSXFkd0cxTFJmRm5qemYvcXRSUjRmMWFtN0VQdHk5?=
 =?utf-8?B?SlVTaGlLUW9yMmlra24wbFlXcU5tYUE2R01Ba1p0Um43T2JMdTl0S1N4Rm1y?=
 =?utf-8?B?OUM4eFc2VDJHcnk3M1BSWDBvS1BhbkJMdi9PSE5nekQvZ3oyK204Q1Iva29T?=
 =?utf-8?B?WVN5T29McnRyZmJFSlZ0NHRHby82Q29rTm9Sanh2ZjZDSnRWQWROWjllQndx?=
 =?utf-8?B?RFNsWEpqQzROS1hPVXhybWNPUXhubFFMSTZDVm5qSVpjZlR3YWo1RW0xeU13?=
 =?utf-8?B?TzZIUVlpTFJMWWxDTElhT2xhYi8rZGtqZDc0Y3lFb00xYXZhWlIwMEJYNzVp?=
 =?utf-8?B?SUtBUE5XK21tWm90M0xzL2ZJeUhYSHNBM1FZcVZ0VHd1ZVQ3ZXNPODRZUkpK?=
 =?utf-8?B?WE95elJQLzhSQTVCMmJhY0x3a29IZ1pNaUsvRUNOa1ZJN0o1dDZwTGZWZEV6?=
 =?utf-8?B?Wk8vZDVqQm9MSUx5SjgrYzAvdmxHb0p6aFJ4SjNkUmpvc3lDRzNUREZJOXQ4?=
 =?utf-8?B?b01yNURZWWFlQkNMbi9MWlVadGx3K1dEM0xjMEZJMVRsdnVtVVd3SWhUbVF4?=
 =?utf-8?B?WDhoMWpZTnlqRTgvc1p2K2lKYU9PN3R0UGJQR3JkQ04vVE5zTE56TDJETWxU?=
 =?utf-8?Q?eOrHsHC1HzUlrefzv4FQEpBJElJ9zFCqMsCLA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1aZm1veFZOa0Q3TEZUSzdZNFdxZER1cW4zbmV1b0tiTHl6SWdoNitQbFVo?=
 =?utf-8?B?L0pBcXFkYVNoT09VejlLWkJjckk4TkZsakxsRUtzZFAzK1o2Y1JCL2VBSHht?=
 =?utf-8?B?VTdIUkIyMEh4TDk2R3FYQmNnZy9ndjM2dGMzNGRFZFNxdW5GNGZOUHZ2TjU3?=
 =?utf-8?B?ejVnUHdXVkZSRlVGZ0xSeDVmVys2TldoMFpPbks2NTJ3Q3BSbkVRWDRIeUFQ?=
 =?utf-8?B?YjdQSVZaTFVJSjg3U1hQSVFXTXA1YUJRZ005TXEycUlTMzNNbUdWUVhaeEdS?=
 =?utf-8?B?QlduOEFQczJabDFlcXlLSW92NTFLRVI0S1hsT3MxTWZuRWU4MW0yOHJNRm0z?=
 =?utf-8?B?a2FVNXo3VUJ3ckxWSDk5dHdOMHFTaWJpWHBjN0FJbGxmekZGa2NlUEs0Y1ZH?=
 =?utf-8?B?c3pBdk5RdjlHaXdzd2lzZ1VVem5QR1Zxa1VidWlCajZvcDRqcE5RWTJ0aDdl?=
 =?utf-8?B?T3E0d2FDVkZFMm91Q29uenU4YjlvMWVncGNVZ0UxZmEzSHdMNHlBMkJxNXc0?=
 =?utf-8?B?K05xZnBBZVdjV3BNSGdhT2IzUWIyY1Q1L0NSUWc2eGxSM3VWTlptemxkUHZw?=
 =?utf-8?B?aTRnSk9DOUt4VXowQ1dHcmZIWjZxTytaZXhXVmphbG9QcUNWUU42L01uWWJq?=
 =?utf-8?B?bUhkN0lNYytacnBZbHpkSjI1MjJUdFJvYVB4OFhueUhzK2FWMnpEMGFiS0ty?=
 =?utf-8?B?a1c1Z0lsdndwbUczMnJRbDU3MHFvT3pNcmsrSENuck1ENmVIaE5ZdnptWTdS?=
 =?utf-8?B?OVNKRkFzNlJOU25lQURVOEh0V2pFYXgyM2lYZExtemdDUnErMStXN1luVXdp?=
 =?utf-8?B?bXFFUzVxL0RsbStsMGd6Tklzb1pzaTRrYTFEUlZLOUtoWFdCRkgwU3QvYk02?=
 =?utf-8?B?Z1FSVGl6MllTamFlc05jK1o4YXhtbnB5RkNRbHVCUjNHQjNhYnNXbEJYL2Y2?=
 =?utf-8?B?K2RjdU91aGxUU0htbHc1RkdPL2xhMThsWEQ1aUdGVzhXWTZWcDZCaVVpcGVG?=
 =?utf-8?B?eUFXNldWeklMMHNPMDVSQStSbmxZUGNKak9LVVNZdE42Kzk0V1pIdkFWYU42?=
 =?utf-8?B?NWl2MldhNjhvWEdnbU5NeE1xU2pSbzhSZWk4b3pqMW9hMjlzTXBGb2EvTVRz?=
 =?utf-8?B?M1JKVURLaUJYWi96VnppVXVsZWduNWNzNlZpOXcyeHNVdFJVVzArZ2F0YmZq?=
 =?utf-8?B?bXBiNkJyVTdjVzZBazhCL1N3R0Z1SlorSlMvNGYxY1J4VUcyWmlORFM3T3ZI?=
 =?utf-8?B?SEJkNWJIQ2NiWnhKN2ZTTzg0OE05eGhJVVJlQUt3NGtGcVpRK3dVZFFsVVA0?=
 =?utf-8?B?aGRZS3R4emhTbGh3Y1hrYlVrQXhnb0pLbkpRWktwV3dCSUh5aUpPREhEamZw?=
 =?utf-8?B?cGxubE9EL1FyaG9CTzdiL284REJiNUYxMEJRL2tGNzFkdElRdTdPNVZOaENY?=
 =?utf-8?B?MlFmRWptd1pqUGx3c3pSVmFGaUhRenVSV0RVaHFER1JIbDM2Ylg5OE1MSElB?=
 =?utf-8?B?OTdhWVJwQmMreTZoOERDVGVuUUhobUxnT0haN3FuL3dSOTgrd1ZnV041cVo0?=
 =?utf-8?B?NEhvckV1ZnpKNjZMUXBwQ3dJOHAxMks1T09ncGJRQkxHN2pBT0owdzNsSkNS?=
 =?utf-8?B?NnllWVVpZjVIODBoZ1AzUUhRTm0vd3VnalhVSW9xZWl5RU1FUDFYbDlPVEk3?=
 =?utf-8?B?TFUxejhHUVIwcFBCdFBPcXM4cUlPcFhoN0hidThSN2pFWGl2SXlHT0hZcnRR?=
 =?utf-8?B?bmF2S1pLRDNiVGtkRGs3QnFqMWhVbWhDUmRjV3plekJWMjBNaHIwb3JMUFVZ?=
 =?utf-8?B?ekh4Qk9tUFBmcFl5WnpoTk9OcnFwWkJrMUdBekFSYTN1RnZuaTB5Vk5tM0R6?=
 =?utf-8?B?T0o1aEdHQzY1Y0RaSnQyMHZPUEVaajcyU1Rneno3ZVZOVE1tVjExK29PWU1Z?=
 =?utf-8?B?MFkvZlc2Ny9zWWQ4cVpJSWV1QzlJUW5KaUFEV0FOcTBnMDhSOWE0VkpwWVlm?=
 =?utf-8?B?ZDZPY0pjdFZDcGJ6YUg4WHhSUlY1cEpVL3l2aW1yUElkT3ovNFpRYW1sNVpI?=
 =?utf-8?B?Q2RoL05mWjB4VG9pK21EeFE1Y1RqdUk2akkwVGJLOXQrRFlVM1FSZE5KdVBE?=
 =?utf-8?B?YXpFck9mdUlTUWh6ZVlkMVptYnZBU0lmT3lLUGp2dHF5eXhUL25WYy90NC9u?=
 =?utf-8?Q?RaZjoaK0YUPq7ue+POXZR+8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed6776c-94ed-433b-8e55-08dcd3227ba9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 12:00:23.8946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQmi3ljZEVhnO3d1lFLvNJQYRJ+HnD2FIpj7AzWPV5QPoB1AY8VglSgUAYr64NGhNljhO6JXd8Wq3V8Nar8ff5bh5xtbFXDt7ute/RLVshk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10842

On 9/12/2024 2:13 PM, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 01:55:34PM +0300, Ciprian Marian Costea wrote:
>> On 9/11/2024 9:22 PM, Conor Dooley wrote:
>>> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    const: nxp,s32g-rtc
>>>
>>> Also, how come there are not specific compatibles for the two SoCs
>>> supported here?
>>
>> Hello Conor,
>>
>> The RTC module is the same for S32G2 and S32G3 SoCs.
>> Therefore, I did not wanted to add two compatible strings ('nxp,s32g2-rtc'
>> and 'nxp,s32g3-rtc') when there is no actual difference which they could
>> target.
> 
> Are these different fusings of the same silicon, or are they distinctly
> different SoCs that happen to share an IP block?
> 

S32G2 and S32G3 are different SoCs that share the RTC IP block.

>> Furthermore, in the future I plan to refactor the common part from [1] and
>> [2] files into 's32g.dtsi'. Maybe then such common compatible strings would
>> make more sense.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/s32g2.dtsi
>>
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/s32g3.dtsi
>>
>> Regards,
>> Ciprian


