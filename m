Return-Path: <linux-rtc+bounces-3167-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1CFA320A8
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 09:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186D6188897A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 08:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344F3204C36;
	Wed, 12 Feb 2025 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FUJCafD5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69292046BD;
	Wed, 12 Feb 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739347909; cv=fail; b=pHrBNNEvw3kpZycuvGKHqZ5VVI/7nQuydPyTPkyKQ97uPxz5nGFOdyydFx8g4y4TqbsEZlZlTjuB4URdplDwRLrd0cXG6HJ40meneiigp5/02+aZ/drt2EL4v8uzT496Lk0XipyXs9IhJRuwHJijic+rt57eiDBfV3AsbzGHbmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739347909; c=relaxed/simple;
	bh=fqnA/80/X+A2GDubvIipe/uEXiE7fupEtFQFy8BsBDQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i9Q2qSUAjEYF7llS+Atw9ZK5MUq3AArIXmK0oq8TruCVt9pGL0avlVXxS2AJ1ZCXDfU05iI49nLxz2GIEyEECtoJ5SIZ6Z0u65KIMD2ENju2Q3LCQmV5nzu5vz5B5o+5SqfA/J9kqh96jozJ1AeHZwxWQT2KOXBXd7FKLfoJ+Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FUJCafD5; arc=fail smtp.client-ip=40.107.22.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3p4VEDgTIdx19dmc8j4LJXe5rTygj/AUjCFDQtSRxAJrcW484gmpuKnMOZAl6/O//hW5YNhvelENPUoiN7x1nAwKb8E1bwhQT3WwPoYlAA5LspoHQAKpOOyx8o3oTeKf2uMncfdDk/INP+Pr0gXuDXKGeL7D/N9U9bhvyAj67oonLIaac7HlXuIoMdGNTL2DSAllTreTEA9hOHvNz3BH019lK3DpHSlDoVfJWndE+5JVGPwoioUehR03hLVfhxbWLNC1CTmEyoYdhzdjZwpOe4RsUZ+NCK12357znMrVjhy2J5fSg724c73HylRNoKneWLCT1vMmYoDhm0O3EHb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUZqhH6JDXYjioU/xrCvQnu+IrLP2cck7TKWst1Y0X0=;
 b=wjZ0ANybrqdUIn9k8w5DyLUoWNyJtxq0YDApjdd9NjsBjhrNYEJsUq88JuXgW9uki6UZbBhSpNSot9YvYznobnUybtXIFg38q5lgDi9Jz5PfWyEgz8YW8CLfaLyGspqiLy2e/4WLEIOiPgXWI6Rf8vmcUb2vQMATESlVk3WNEzHhimNt6hKCfGLB8zZxakI40E1XSpZMh53YZsTX0BuNv+3NdrAr8zT7sYzRgtf8Yk0FpLEVhqbaVXxfVc2Y2EzOaCg5P6yeVzg9B5Ia4IOKDj4+6NFE+Cm+umwFJXZNId8JNhLC2qlSx/KBROj6aNh1CgFBa2rGEZMeaPVcvepi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUZqhH6JDXYjioU/xrCvQnu+IrLP2cck7TKWst1Y0X0=;
 b=FUJCafD5/OY1tytgm+tAuP3ZK0toQ++Xcicgro/hqTSv+RyqzW514nxs7Yek88J/w7JW3Z4qmk2xcLEV1OCkaygL1nT20V0pZBony4CIEunZt8s+x2gMu2b8d7Uv11YGOoB9RAZhhgj05rq12M0n2AnqAvS1VmFBGXifLybHqO81YCDUvS7U6D3J3u7dyHwlB1fnU3SDucTUBmCrszfXa+2WsA+Th+VZeZV/e33ypVkDvhA0FEojccCee0BI/z2EXjmp7k9UNlk9RjHx8PRpUc6qnPjcW8zXh32Xnnbmou4b8cMhgthX+ALlP+hHA6GwXJCjnN5tZXWJlHF41NorNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 08:11:40 +0000
Received: from AS1PR04MB9261.eurprd04.prod.outlook.com
 ([fe80::7b16:7596:6bb4:c5fb]) by AS1PR04MB9261.eurprd04.prod.outlook.com
 ([fe80::7b16:7596:6bb4:c5fb%5]) with mapi id 15.20.8422.012; Wed, 12 Feb 2025
 08:11:40 +0000
Message-ID: <2e633e46-ac59-495d-9ecd-46c34d2d3242@oss.nxp.com>
Date: Wed, 12 Feb 2025 10:11:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
 <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
 <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
 <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
 <Z6uDuL97EB9KqD4b@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z6uDuL97EB9KqD4b@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AS1PR04MB9261.eurprd04.prod.outlook.com
 (2603:10a6:20b:4c7::13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9261:EE_|PAXPR04MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9f9d84-f59f-4780-69da-08dd4b3ce0a0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnBCNjUzQlZOamJRV1d0cmMyRzByNXNVbndXdnpYOTZWWng4aXMwWlZkU3lI?=
 =?utf-8?B?SW9pdi9PUXh5QzlqN0FKRWNXb0tlcHhVRW9xdGZrUjd2Si9RdW40OGQ1THln?=
 =?utf-8?B?VFBFRGZic0pna1JvdlMvNDdZRXoxTlNud3I1Tm9kaEhmY1pBU05qcUNPRjJR?=
 =?utf-8?B?WGFGUEl0dnpYSVVROEZzZk80NzJWSmF1UDRQRk9RL0xSdVRYTnlKaHF5eUFo?=
 =?utf-8?B?RDBjMUZDVG82RDRNOTZ5VkRqOWtzUGxEcE5ZNStENkxTME9QekdYQTB6aHpL?=
 =?utf-8?B?YWQwQ3RReGVVWWliTE5yVHlQRGo2QXVjWE9DQi8wNk9KRnE3M0xvM2xhWWhB?=
 =?utf-8?B?WGd1dHZObVA2aUt6dUZnM1duQ1BiR3Zod2pZRzJZNm5Zb3gxRFZ6RW1ESUtj?=
 =?utf-8?B?TytwZDFXMjN5czgyWnpiZ1dsTkNaR25rdEpHSFZqYVI1SVBuZWdXWCtiTlBV?=
 =?utf-8?B?THRPaTRNakR4WWd0QUZ5emZKbW5WT2RtVTR6ZEdreUFTQTcwd0FuR3IxK2wz?=
 =?utf-8?B?VWU4MUtoeU9OOW5UZkJWWkV2S2FPbTRtZWdkQUNJS0JYdzZUTGt0NzAxaUJG?=
 =?utf-8?B?M0lXdkdrTnQvL01mVzk0QnYxeGNCNjlITVZaT0xnWVBhQ2s1THNaNkVnWVJB?=
 =?utf-8?B?M1ByWEVaczVrcFh2WW9BU0kyQUk2TDhqU1RLNWt6OU9abENDeElqR09JUXlo?=
 =?utf-8?B?Wno2aGpWRFVxWi9PV214anVONFpzN1VnOE1ObUozd0hLVExleGYzYkdDdDVh?=
 =?utf-8?B?cTdvRGh1Z09pRG9UY00vc1R0cS85YXhnb28yTGlVMzF1bkRNVlFvOXRZRTdZ?=
 =?utf-8?B?bC9pV29pRG9TQVEzVFVseFlwVTE3aEIzdzAxeDBCZTZxRWp2RFBXQkY5WEVE?=
 =?utf-8?B?cGZhN1pLVFpNVU5mcUZXRW9URUJXL0N4ZTNlclBzWVZIaE5COGxGTUZuTmxC?=
 =?utf-8?B?YmZ1azdKZVFROWtMWXFMU0tIdGtBdjVPTm5wM2VLbDg1dTY0WnJtY0pTbDE3?=
 =?utf-8?B?dnlxL3ZZRXNkZVJIL2s0YnB5dWRhdzM4b1lGaHFoZWo0ZVdIb09YODlRMXhN?=
 =?utf-8?B?UVFNbzVwNGRtTk5FS3AySHFSNXdQL2JsSHdKN1lmK1ZxUUxLY2cxWXpiZXdl?=
 =?utf-8?B?SkgyS2NmNXowVmo3K3hVR0MxZUlTSWV3UjJCTi9nZCtWM3NVaklZMEM3Q1Bj?=
 =?utf-8?B?T2RoTW1GT0FPRjN3ZFU3cDUycElPbmVtL1ZQUElTTThJTEtObmNCbXQrL3A4?=
 =?utf-8?B?RzlKL25IUUMvSC9hUDd6Y0xHQzBNV2Z2MEdKT3VoR1J6REdoVW5oVThMUnF6?=
 =?utf-8?B?V2FScDFOSkJHMEdVSTVtTGxHWEZUcExFaVdlZkN0WDByMzY2NGlBUVhGYkl0?=
 =?utf-8?B?eTRHVDZEdVZNRVd0RzFZMkE3NWpwdjluWFJYT2NxQ0ZObjZJZXVod3F2MVNP?=
 =?utf-8?B?S3FMdlRONzJxR3VNMDFPQmVhUlh2VndRYkpNU25LOWNwSkhMTE9ISUJ4OE9F?=
 =?utf-8?B?cDlPMWFTbGx0SzdMalRZYnlia0lYbUIwbDhES2lCZk5QSG5nVWdFSXFjQVd0?=
 =?utf-8?B?Q0xVWkdSa282d1pLSjZ1NFJvdUc1a1VVT0U0aDlhTEtQY1VGZUFxR2FiY3Nk?=
 =?utf-8?B?SzFnK2R2TXkrU3VqY3ZodHhMZ0JDVFFQanRTNkZJeWs1czkxQ2tQRUNLY3Zo?=
 =?utf-8?B?WXIwUThCS2MwQi9ZZ2lWZG03SHFFTHhQdEtpZ3lOSTdPN2RkMGpqYXNkSTlO?=
 =?utf-8?B?L0VPUm5MYjVIOXdkaTM2elJveFNrbkZLQzNTb0pkb2ViVEwvaWs2aVpWbVJl?=
 =?utf-8?B?ZUxWZmd1WU5Hb3A1a0JibW94QTNnWXl5em5KMGJVYWlCeXNhOEI0eFZaTG5n?=
 =?utf-8?Q?5yvl5vUZSyI8c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9261.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZuZEdtOHRiaXRYdlpaT25XbUlCN200dEthTUhrMUo2ZHpzREJNeFRuOEdW?=
 =?utf-8?B?aVF2L21JQllPV2UwQitoZUlYRHk0b2c3M1AyOXZtdEtocW5BcllrTG1PQW1R?=
 =?utf-8?B?dXd6YkRMY01ka2JXRVMxNEI4QTljOUhDTGZrVUdTaCtuMk5XRllUYXprZFoz?=
 =?utf-8?B?ZldQRXVRdUJiemxIbDdEVEEvTFQ0UGNoZ2dxTzhjUEF2NUFDcVdFak9yOHBx?=
 =?utf-8?B?cjhZN2E5N0svVUpLZmhDNlBGL1crRFZTRy9MakR3VjAxQjB6RGIvVU91NG43?=
 =?utf-8?B?VDhOd0laNkNFVVduZDE1aTJNYXFLdFZBUU9lcWgwaFdCRWlPbzlVbThSTlFq?=
 =?utf-8?B?WjFRRzF2NlRHUDR0NnEzUUY5TlpwaGN4TlJaY1lKNjlJanplYjcxY0JiRDhY?=
 =?utf-8?B?VjlPcSt5emFsRG80eDVKYmZVVmIvKzRRWGVpVjcvQTZZS3dLcWZKSDJWalFM?=
 =?utf-8?B?UGlxUjIybS9QSDViMm9oMG4xSU45dW1DWVA3MVA5bHlxbkZxT0YzdzJlSm1Z?=
 =?utf-8?B?and5Y29rSy9oczg5cmhhZE9SOWJWNzk1RVlhOTUrTXBRY240cEtETVZKSTd2?=
 =?utf-8?B?dGJHcWRHTE1BaWFPZVVqQkQ5ektmbkpNRndCUnBKZUVVT2pSUldXK2Rac284?=
 =?utf-8?B?ZTVEa1RSZWpFRlpYZENTVVBIbGpKSEFvbks5RnNZQkhOcDdHTjErdS9lTzhk?=
 =?utf-8?B?eTFxa2lsOFBoaHJGbUYwWTZlV0JSNFVJWmNNK0ZsVENrT0lFSDFxdmF6RU9k?=
 =?utf-8?B?NC9mNVN3ckNHN0k1bGx6TlFrY01Nb291Z09TV2NKTHV3QXFNL0dNV09MN25K?=
 =?utf-8?B?YlRxZGxUZUZ0NUxIT3ZFaHJOU0ZsbFVkNXBKVmpObkpQWnZLcmFEOW1ReSty?=
 =?utf-8?B?NWM3L3VBYlNlT1p5L2huckliaHZ0dXY4LzExNk5QU0pUR0x5NkdHa0dkaG5L?=
 =?utf-8?B?NWs2QXRxSUt5MW9aMzB6SFhuWlRiQVFpM0lBWWttMytWZmNmbkd4ZE9JVXIx?=
 =?utf-8?B?Z2JVc1JjVlRJL2h0VjN1UDdxRG40eTZIUWkvUUhUS3JiRUJPVHV5Q3k2SldQ?=
 =?utf-8?B?NVVBOGEzRjZ5MG12S0x3YUI2aGpJYXBUdm5XbmE4Y2w5QndxRWduNy9UR2sy?=
 =?utf-8?B?TFBRN2xVZzFFYzRtTnBOTUhzUC9DM3ZSNTFQeHYzbXp6Y0oxemg2b2R4UWxO?=
 =?utf-8?B?T1J5NUpTOTNYSW5CS0srN3VWbEdob0w1QlFocTlTYVlqdlRHYWJLdFlTZm9J?=
 =?utf-8?B?d3djdXBlTWNTRkFXc253cUxtMDFqR3h5NEx5eEtVZUZYTkQxd2tBQSsvMjRW?=
 =?utf-8?B?Z3FOYWRtaTBQL0hxZ3BrZUUwMzc1RTRrQTBmZnE3OTJEenYxRS9EdlpaK3JT?=
 =?utf-8?B?UXJEelRjRmRUVis5MmVGMzFyeDhCVzF1UnprQWNvRGlnS2xhL01vS2xOU3ZQ?=
 =?utf-8?B?cEpyakY3Yi9TUkFjemhnWUNVR3lXNkZ1aXQ4dDB4QkZLcTAxQmhjZ0FVUXZZ?=
 =?utf-8?B?STdvZWpxUEdHeFNPQWNyNFJuMnRQSElPalZEbm5QVURaKzNnQzVUNmUrcDFt?=
 =?utf-8?B?Q3JzY1ZwR1NmNDloSk92VHRpYVJTK0lIdHlLNEFrbTlrbDdpdlJQWmlDeWZp?=
 =?utf-8?B?OElqR0t0SVNydHhORHhWbWRvOFZPNVlkYWdzWFFzY2JJdTU3alEzaHdac3Y1?=
 =?utf-8?B?alJlRElWU1pQZ0V4bGlvRG1Yb0JLczdNVmVBWUtZRS9RZllsdEZIUnR4MHIv?=
 =?utf-8?B?eGlXT2U1VC96blNxNFhSQXJDL3pBeGtuN2lJUG5IbFFxaVFYbzlPS1Z5Mit5?=
 =?utf-8?B?WjJHUURGd3ptVWl3dEplYUtnTnhuL1l0QzYxN2J6Q042eng5M0R5QVhUTkRC?=
 =?utf-8?B?TENIeEV1c1Q5YUczTVhLQitIYU5ETnF5Uk5aVkxmSGxIaExVc3VWL29WTVdO?=
 =?utf-8?B?M0tZSVRQdzFPQnZlWWZhbG1FS0lUYzVYUnY1dGpkZGhvQnFzSklEWEk1TVNX?=
 =?utf-8?B?ckNpWGtRbTFab2dHUTQrOVFNOTZUYUQ4SHA4eGR2N21EZWUraE9qUzNjbFpR?=
 =?utf-8?B?TFFJbE9VNWN1R1JManFWQk1MUGEyYS94RFUvd0d6ODJlQTBabFc2TUdOTXA4?=
 =?utf-8?B?czRlSS90cTBoOTdjVzBLQnVMcFpSOS9pRVRqeFgxVjhnaFBaTVFhWERXVGM0?=
 =?utf-8?Q?H6zUIFNuBh6mJDd8I7u++RY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9f9d84-f59f-4780-69da-08dd4b3ce0a0
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9261.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 08:11:39.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cvBUVa695ihuoAuEemvWzHiSfFGJOllhyN8qP2AgFiOM+lwtmyLoByHuK3VfnGvbSykC/Or4G1R22kV1hCrs2i63wp56FXbeGnqv4dnvSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974

On 2/11/2025 7:07 PM, Frank Li wrote:
> On Tue, Feb 11, 2025 at 01:25:38PM +0200, Ciprian Marian Costea wrote:
>> On 2/7/2025 10:16 PM, Frank Li wrote:
>>> On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>>>
>>>> RTC tracks clock time during system suspend. It can be a wakeup source
>>>> for the S32G2/S32G3 SoC based boards.
>>>>
>>>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>>>> alive during system reset.
>>>>
>>>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> ---
>>>>    drivers/rtc/Kconfig    |  11 ++
>>>>    drivers/rtc/Makefile   |   1 +
>>>>    drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 395 insertions(+)
>>>>    create mode 100644 drivers/rtc/rtc-s32g.c
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 0bbbf778ecfa..510dc2db745d 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>>>    	  This driver can also be built as a module. If so, the module
>>>>    	  will be called "rtc-amlogic-a4".
>>>>
>>>> +config RTC_DRV_S32G
>>>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>>>> +	depends on ARCH_S32 || COMPILE_TEST
>>>> +	depends on COMMON_CLK
>>>> +	help
>>>> +	  Say yes to enable RTC driver for platforms based on the
>>>> +	  S32G2/S32G3 SoC family.
>>>> +
>>>> +	  This RTC module can be used as a wakeup source.
>>>> +	  Please note that it is not battery-powered.
>>>> +
>>>>    endif # RTC_CLASS
>>>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>>>> index 489b4ab07068..e4b616ecd5ce 100644
>>>> --- a/drivers/rtc/Makefile
>>>> +++ b/drivers/rtc/Makefile
>>>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>>>    obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>>>    obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>>>>    obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
>>>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>>>    obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>>>    obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>>>    obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>>>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>>>> new file mode 100644
>>>> index 000000000000..3244b23c533e
>>>> --- /dev/null
>>>> +++ b/drivers/rtc/rtc-s32g.c
>>>
>>> ...
>>>
>>>> +
>>>> +static int s32g_rtc_suspend(struct device *dev)
>>>> +{
>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>>>> +
>>>> +	/* RTC registers are being reset in suspend.
>>>> +	 * Thus store standby time.
>>>> +	 */
>>>> +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
>>>> +			       &priv->sleep_sec)) {
>>>> +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
>>>> +		priv->sleep_sec = 0;
>>>> +	}
>>>
>>> Strange. If RTC register are reset in suspend. How do it wake up system?
>>>
>>> Frank
>>>
>>
>> Hello Frank,
>>
>> I believe the transition between resume to run is a reset event. This would
>> lead to the RTC registers being reset after resume from suspend (triggered
>> via Suspend to RAM).
> 
> It is weird design. I suppose it should be design error. (any errata for
> it).
> 
> Frank
> 

Unfortunately I could not find any such errata. But this behaviour (RTC 
registers being reset) is what I see when resuming from Suspend to RAM 
operations.

Regards,
Ciprian

>>
>> On the other hand, the RTC is kept on during suspend for as long as its been
>> set up (for example via rtcwake -s), thus waking up the sistem via an API
>> interrupt.
>>
>> Regards,
>> Ciprian
>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int s32g_rtc_resume(struct device *dev)
>>>> +{
>>>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +
>>>> +	return rtc_clk_src_setup(priv);
>>>> +}
>>>> +
>>>> +static const struct of_device_id rtc_dt_ids[] = {
>>>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>>>> +	{ /* sentinel */ },
>>>> +};
>>>> +
>>>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>>>> +			 s32g_rtc_suspend, s32g_rtc_resume);
>>>> +
>>>> +static struct platform_driver s32g_rtc_driver = {
>>>> +	.driver		= {
>>>> +		.name			= "s32g-rtc",
>>>> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
>>>> +		.of_match_table = rtc_dt_ids,
>>>> +	},
>>>> +	.probe		= s32g_rtc_probe,
>>>> +};
>>>> +module_platform_driver(s32g_rtc_driver);
>>>> +
>>>> +MODULE_AUTHOR("NXP");
>>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>>>> +MODULE_LICENSE("GPL");
>>>> --
>>>> 2.45.2
>>>>
>>


