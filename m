Return-Path: <linux-rtc+bounces-3908-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BBA843D1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 14:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38BA1B8475E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 12:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9972857E1;
	Thu, 10 Apr 2025 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xrPMWijR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012071.outbound.protection.outlook.com [52.101.71.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A12857CE;
	Thu, 10 Apr 2025 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289852; cv=fail; b=LCfsoeIk9acAxnEM8uQ541LyyYGkRjHEI9jt+tZAoQzz/6RcQmlGuZcAEhHCRdgZehmMniYIvZMi6lW4FWX90eu5OPT4JoyZcTu4f06illfNRzsXGnxnvVnNxNmZKEi7cXlsz5n4n0r0/RiW6LFeYR8GxIxgLVpcGF6KeiOu/oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289852; c=relaxed/simple;
	bh=7P01++88PZIY9Aik0ETI1vA3pXZE8up0P7y+XU/iPps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PA8eK/sfj4xtedZiOyL9UGxuVwoxwQUe/G3SM/OVifx/K/5qhOQBjwNOOFc3zu58JBSEat7dxlUWLPLn1VrTZnn0OoH874cIG/8gct8c03nXinaILZ6PieJbeaqClzTu6fRcEU+5CdDwLuZZ2TeuHe+2YNF5PvWivnFazNoobiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xrPMWijR; arc=fail smtp.client-ip=52.101.71.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4vOk4RJ6romQrUwU3dOKyPA7iGxyp92FsVVDsxcZ0H2o5cTNowKk2Efb0TmSVJRRomIKAtAZgcnwFv8HSGgkihM8Lh+c8Ja7nK5Nm7pc6SQdqA4nAFX6vx34Zc+JidB2gQQuyfbsYumfJvFuzZ1ekUTcXQIWhnKCuDbuBtg5WB6Udk7L1WPYi9KQ6q/n2ai9whOF3jIUX/oD/zA1O7YTBMay9pvxwKvMr/R8QTLhXH8+7rFIWrnl1CxQ0UqpInKpsKP/KaI+ZG4dYNREi0oB/Lwy+TOAVUeKsVFMzzOTS8emBKHK6xcBsBeS+khtL4hWXmnbfTmhUdkpMCnUz0pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfgkV+sUVYiwrSpOcVmSIH4pys99w1EwvlhIg6/a9hQ=;
 b=G27Hu7oMu5fMBA51ru4liQQRRgv1gzBOtmkDyJNj2xhpBzZhvQZ38912bu/TyFS0XAIZJA61ywpT80xeOz0fIroaUfMDma7Yssqu83rv0RHd1Z2iSeJyFTP5hpqTCB6M18gLb4eQmjdy23pTvNUk7z0zS8XiGKhqi5dPfa8YHUwqjsGbAIRPlV3xF+ZTRPSfFyrctojm6UWuvVDm2f7XFsWVzI3EKU751mAxdC/t0K7dSnyk4T+kn0mcygYev3fuHzSWu0n3PjBkMbNJHd7uNl3mxwtflnqJzPfqypiPNI2o6svPlizBDw3JI6Cp642Da+GgjWKRutjl5IKUzdN2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfgkV+sUVYiwrSpOcVmSIH4pys99w1EwvlhIg6/a9hQ=;
 b=xrPMWijRkdpt8b1qM3tJETgA8MRvjm+q7+24o4H6F3j662mpiSipvbAOUX0diRgh1fiBZ8TBCTAlybMi1v4jc647xFxEyiCN2jYmXjTL35o+0G0N49Ob4p2E4rgNoeNiJzpt237dwV1rq/nFKkMgQbLycFUSsFf/j0Jj2AxH+jR4hELkFBjyGuCtgwd5fZl89hUSFfyCYRlaD0M00n+IPhWI0/HHkPiUCMrwT/EHIJSQiiOCJVw+hKMSolkdRc2goY6GkfPfYh5ohuQXJ4t0JFy4W8C5a4d8D0+luoHsyMkLHiapO+Dt7va7Ey1hfnMaw2bzbqGOStzbIcYCONBHXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Thu, 10 Apr
 2025 12:57:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 12:57:25 +0000
Message-ID: <e64083ee-3374-4bdf-92a3-ce91e1402b13@oss.nxp.com>
Date: Thu, 10 Apr 2025 15:56:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: pcf85063: handle stopped oscillator at startup
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
 <20250410082548.3821228-3-ciprianmarian.costea@oss.nxp.com>
 <202504100917398f7244e9@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <202504100917398f7244e9@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::6) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 782c711d-599d-44ec-75a5-08dd782f3dc3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmN4SCtpcEp1ZVhBNU9yL3B6K0dzVTAwcndZTHB3WjNmU3lmemljY1JOUkZn?=
 =?utf-8?B?MTZuOHM3NjMzTHpOb001QUIrUHlUWmlvZTF5ZndWVUErdE90eGVoK29jMk1F?=
 =?utf-8?B?T1ZOSWdzdFJmajdDUEtYamM3VGNuOTQxZ05QNklpdXVKMHB2T3dIc2dMbEQ3?=
 =?utf-8?B?dkkyd2tWd1dGOSt2SEJ3Zlo0MmxVSDZZUjBiZWtZNll5WUM0K1VaRkoyb1Q5?=
 =?utf-8?B?NGhGVjV3ZGZST3AzRHBIT1hzOFJncUVvRys3OVRhM2E3L1RoL1c0M1hYZTM0?=
 =?utf-8?B?d2lHQmk2MDVnTXFQRUxURUVPQ1pmZWJLR0FnZEd3Q2pqWFdwam5lWVBmc25r?=
 =?utf-8?B?M0g1NmVKVm9kazZOS3VHZkdnamhvUXJWTU4vQkJPSThnVUJmUTYyRUpiVXZ3?=
 =?utf-8?B?Q05taUxlWk1hYmhHelhueGYyRDd1cFhtSzFTMnB4dGRNejAwUDJFMU5IaG9t?=
 =?utf-8?B?aTZ3bndrcXRPOG56MFB2M3BCVEx5Z05NZVZZSVE1STBkajUvM29NdElOSW9a?=
 =?utf-8?B?eXBkUTB1NnJ5ZERWZDNSSmNRQmxrcXc5L05jWGowbDkvTlVmd0pEdmxhcUYw?=
 =?utf-8?B?alIvOW9PWVkzRTBKRnJsNENOUkdQYlVtTy9HS3l2SUtzQXpFNlBKQnRMYlM3?=
 =?utf-8?B?bS9mTjFYckRJdjB2SDVVWGxRZ0tWZ05xcWVjYjhDL3JxME5wa2xGcFhERzlK?=
 =?utf-8?B?OE9tK1EvOTV1dDkxU1IrNE9pZ29KNzVOUzdSM3pjRFY1dVA0M05CR2VpWWlE?=
 =?utf-8?B?SzdHVC9RTUl5eGVKYVFaTHJwM2pZd1NZelpFR0pKVDdyTTAybmNJdDJoZUsy?=
 =?utf-8?B?b0JFRmRSeTg0T1dPR24yOFdrcXlwVGhCV250M0FlNTJBWC8vQ01pOHZlL2x0?=
 =?utf-8?B?aFNpTFlmZjhOaW90aGxPd244cWcxL3pySkdFWWtlUzRQZW9ndGVxWU5DUTl2?=
 =?utf-8?B?Q3hPTTJCY2VBVW5FT2llWExpV1BuRGcrcitRNy8rS0I4SjYxM0NlQzgvSEd3?=
 =?utf-8?B?T2lKZU14cFJlNlF1RkwzdmJ2RDdHc1hUaDV6cVN3NnB5THJWdmZXa3phR05y?=
 =?utf-8?B?MVptMWx1MEJBRFg2T2RyTndqN3YvZnA1UDlCdlpVcXc0Mm1BNURzRTljWEV2?=
 =?utf-8?B?eUE3QmxXYi9NelVuQWJkTHUwT3BwVmFQbERmQnNoZ3g4SGF0c1g0d0wyM1Rj?=
 =?utf-8?B?bVh0eVUxTldhekxCV3JFY3REQ3ZrT0NBTjhtMEVrTlF4UFlqRW5Gc1JjZkhC?=
 =?utf-8?B?b0dndzkxK0d2T2N0NXB5K3NTeTVmMmNqRzE4VW96a1B4eStjbzVtNEh6Tkwy?=
 =?utf-8?B?NDA5TEVUcnUvcTJSK1Z4anc0RUZaOTRON2s2d3FidjE4alliWHBKaVp5Y2Nh?=
 =?utf-8?B?citFM0VPYjA5VGtkQ3B1M1ZnQ1VaVXI5bVVva3VPVjJXaEZadCtrWU5OMWVm?=
 =?utf-8?B?cVR0ejBVZ21UM2NuQ2VTYmN5NTZPV0tVbFlJSGRzRnVHZmY1aE1aMTFWME5W?=
 =?utf-8?B?WVoyVERLTnVQQWpOTmRJbndPZUJDZFZ3ZEF5T1U4a282TVladjVyUTBPREw4?=
 =?utf-8?B?VFo1TG1JVk1LZnVxRXRYM3pCYkh5cjEzZHRnR3FIUnlJREp1MkUwNUJGb1Qv?=
 =?utf-8?B?ZEhlTzhBZ29iTENMVVgyQUdTbDRvcmIzdHFBWmkwaFRlcExLaFVrd0xKdTJp?=
 =?utf-8?B?d3BKOXRJZmh2aDBObEFHUjNuSUh2WjhOa3RuOUNuZkV2NVpWTlVUODlXTGpY?=
 =?utf-8?B?VjlBUDZjSTEyUWZnV3JWUFdsVzRIY295WG9yNit5NU9ZRm5RWHhFZW5ES1hu?=
 =?utf-8?B?ckVNZDFKRk0xNnpoMG01L2o1RjVpUFlYWkZLbDVydGpkeDlFMlZWMW5VbFJW?=
 =?utf-8?Q?7rNh+i6CARPDr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnBadHc2SFUvUlhZOGVJbXRZcndCMEZiblZNclRqeEg4NUlSdHNaVjBGdEsr?=
 =?utf-8?B?UUxDUU0yZGxERS9LWkNDNDZQb1dkWE90RXBqdGJFSEpnelErYy9IU05MekNs?=
 =?utf-8?B?d0o1OUVObzFkZmVDZ1RUdmVRQWh2ZnBDUFNwbFpXb0tRRzFYcFQ1OXErSnVx?=
 =?utf-8?B?M2FQNEsyNmVvUnA1L2MyUmt2MHVkaFNMMGdMcVYxMExYSWJIRUY3ckZNUkV2?=
 =?utf-8?B?LzZzVi9OL1pVUzcvWGNXS0w5VlJUdHBFenMvN3BBN3NUeStTTFlGMFJJSzhr?=
 =?utf-8?B?bGZxNFQ1TUJCYWZ3Tk5USUNvcXFidDExWFJKY2pyYm5HaUV4cnN6R1J4TFdn?=
 =?utf-8?B?YWlCQ09iSER6TUZlVVJCUFQ5ZTJSNTFjOWs0bll2QkRubmR2YVV1U3BaSUpX?=
 =?utf-8?B?L2dwbzI5TlVzakJDTndVTnByUmpCOHl5THVQMTJOT1Z2ZzZyTkYyYkhkZzRH?=
 =?utf-8?B?VWtaUU13ZDc3bEg0VXNWL2hrd3hobUZRTVppRUd4b3I0YkhoY1ZVQmoxb2lH?=
 =?utf-8?B?dHRabTVOeVlOcHM1UUM3RXJ0WGQ5Tzc2dzQ5QWFRU0tDdDU4b0ova01ZQ2FQ?=
 =?utf-8?B?UDIxalRtU0V0Z1U4ODhQTWFKVkxiOWtTaENvR0ttNWwxdk5neU9vWjNIUHBU?=
 =?utf-8?B?eExFUzdLSW9QaTBDbkdLYlQ0d0pPaTVKeGZoT0U4MEFnWW9QcVVYTXg2NUN3?=
 =?utf-8?B?K2ZubWxCY1FOS0MyaXpiaTJBMzBWaERHallyL1RzeFh1T3ZKWmJacmtGY0Vy?=
 =?utf-8?B?QU5OL0NKSVp6N3N1SDJ2NHZVeEpBV3ZhWXFPaDNmdGttcnNVV01JRW1WVzJT?=
 =?utf-8?B?dlFpS2Z4b25nS3JUVHB2T1p6ejlQNFJNS0RzR1dnU2hNNWZYYkRKZG5pcmpo?=
 =?utf-8?B?aHdPbTA1QUFOT3ZYdy9ZcTgwVTg4RGFYU1FrZ1VTKy83Tm9ta1BjZFNacFl0?=
 =?utf-8?B?OXZzZG0vVXZtZUhYaFJjM1VzWmcwTEVWdmo2WkRGbnlIWmxzZnMxUzUzdUV5?=
 =?utf-8?B?dHVHR0VYUHBnRnFOZFpkUDFZWmIzUVA2WTB3WnNFRXB4REp6WE1BS1V4SGRK?=
 =?utf-8?B?dFhTZ1hrSEwrSGdJVnovSitnUFU0WjB1UU9aRkNzbHlXcDYralFiUHlCR3pz?=
 =?utf-8?B?Mm4xTlc5ZysyaVZvdEVaUzA5bE9DWnVUTlcyUVdvOVhzT2Npc0YzU3VkZWJI?=
 =?utf-8?B?UXFTNVFlZjB0UWR4ZTlxM20vWDAxamdaUXFJNm5HTlNFY2F6YTdDSG8xdFI2?=
 =?utf-8?B?Q1pYbENZYTFEYk9lTXZDVkpmcVQ5ZlhtekVhSS9UUG1PT1QvdldUQmdvSEFq?=
 =?utf-8?B?dXhPWWJieHA2dEorMXRxZGV2NVN6V2pMaWtxeUFJaVUrcXNLbE5pTWMrZVc1?=
 =?utf-8?B?WnAyOTg2bVpMVUJFVCtmZi9FUXg3ZjhoUTB2b25ZaDAxd21hZitTY041ZFNE?=
 =?utf-8?B?Q3NEUXR5bXhZeTNpWk9DOC9UbW9SRTdZOE83UlRIK2dObkVSQ2RZQnJ1WXhW?=
 =?utf-8?B?K05qajEvV3Bpb1k1WndSVm03MFFMcEd3QTBYYTRVWGxlWWlBclQxM3VIVW5W?=
 =?utf-8?B?d2lUS094eUxJd2tCU2RkRWtiZHdOTExWMHFiSXphZ1plOTdqZnVYWHhRZDI2?=
 =?utf-8?B?Rk51cWw5TGZVZlNBdmludUF2aE81TW1aRzArYVFVd3U1WEM0cFp4aGpsWkZy?=
 =?utf-8?B?K1FXT0ZjZDFkZ3FQNms4VGxJUUptdnZnN1Y3TmJ3MGRid2UrY0FBcDBTb0dE?=
 =?utf-8?B?Ymk2UnFrM1VOdUJGalo2bXFyeTB1VjAzKzVsM2ZaVzEzdE1rWExjSnR4RHhZ?=
 =?utf-8?B?QzVqL0Nvbkloaml4WDFUWjNtNE92ZG5EcWx5NzRtR0pZUWhNRUNEVUUreVpr?=
 =?utf-8?B?aTZpNVhDMWhicHZ3ZVFaNUhETFlyUUY4Qk1EMXVudG1yRWovMmdGaWUvU3Fr?=
 =?utf-8?B?WXJkdzIwVDEwQ2dDeUtiZ2pqQi9pdlNJYnkyQmFkMmx0R3pseW5EeUNBUndv?=
 =?utf-8?B?Ym1kRC85Z2tERUxmSHloTlhmYW45MUxtQmlabVhIemZTeHdHM1kzWHdVc3FO?=
 =?utf-8?B?UTM2MmphQjdmeFF4UHdFekpkMGdSbjZ0UEphamQvUXVnbkxRY2FROXdUTjlu?=
 =?utf-8?B?ODBhanpQZEhjQWs5dTh6Z1FKYXFUNnFvUGtkYWU0YkxTc1MvYkExVUl4QnBT?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782c711d-599d-44ec-75a5-08dd782f3dc3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:57:25.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObFwT+vOPBIQs73R6lsl7mrLBg6IJXCupL78yh8SnXfp8o1n6E7+3sNrKaHmzuerLZNXQQOQDe2LM6SCj4JRaLfUyOeN7+vbzzEej+7LpoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

On 4/10/2025 12:17 PM, Alexandre Belloni wrote:
> On 10/04/2025 11:25:48+0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> If the RTC is not linked to any battery, the oscillator is stopped at
>> startup and a SW reset command is generated to the PCF85063 RTC.
>> Manually start the oscillator in case the PCF85063 RTC is not battery
>> backed.
>>
> 
> No, there is no point in starting the oscillator with a know wrong
> time/date. The oscillator must only be started once the time is known
> good, that is in .set_time
> 

Hello Alexandre,

Thanks for your review.
You are correct, please disregard this patchset. I've looked into the 
'set_time' callback and indeed the oscillator is being started here [1].

I've tested, so even with no battery provided for the PCF85036 RTC, 
after setting the hardware clock from userspace, the RTC works as 
expected because of the manual starting of the oscillator from 'set_time'.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-pcf85063.c#n129

Ciprian

>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/rtc-pcf85063.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
>> index 4fa5c4ecdd5a..6de7344d2469 100644
>> --- a/drivers/rtc/rtc-pcf85063.c
>> +++ b/drivers/rtc/rtc-pcf85063.c
>> @@ -590,6 +590,14 @@ static int pcf85063_probe(struct i2c_client *client)
>>   
>>   	i2c_set_clientdata(client, pcf85063);
>>   
>> +	if (of_property_read_bool(client->dev.of_node, "no-battery")) {
>> +		err = regmap_update_bits(pcf85063->regmap, PCF85063_REG_SC,
>> +					 PCF85063_REG_SC_OS, 0);
>> +		if (err)
>> +			return dev_err_probe(&client->dev, err,
>> +					"Failed to start the oscillator\n");
>> +	}
>> +
>>   	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
>>   	if (err)
>>   		return dev_err_probe(&client->dev, err, "RTC chip is not present\n");
>> -- 
>> 2.45.2
>>
> 


