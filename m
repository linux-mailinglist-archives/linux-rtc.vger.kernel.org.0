Return-Path: <linux-rtc+bounces-5787-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DADDD3A3CE
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FDB03055F60
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDDF3064A2;
	Mon, 19 Jan 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="FPU2NPXo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021115.outbound.protection.outlook.com [52.101.70.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED465309DA1;
	Mon, 19 Jan 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816333; cv=fail; b=lDb4gnM6hPZHldqDebkgJr5i+QwMBxdjPA9rMSKU1ZP8gAbOrq2VW6bnsK3FKSRG2n4ugxIgrVAQXQCv6lXdOhEh4ksN4RQTynqOPQQy9qYDm3fdrdwYrsONd0DGZbEdqF7IOgjYyY+2OhdyajSl/XhZq5oxunyGtlRKQZy+4PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816333; c=relaxed/simple;
	bh=enDO81h/JES+kKjQNR/vJOEGAOIlvXYAg+NEdsXo9AA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RZt7lo/k3cOrYHVqHfe1sH0Fm+zdPdr2ZCDAJJ5LOp8qdIhv89lzRvMbF7TUWdF6Rnf+POrslAopfJhEP7apOaXAi8T9yJWyh8MTlBRFBx0+010VWYpuiRKtOymSQLfMm92LGiChbDwXyNfRt7JuHpqoIaX/dcjMZbDPT43uIVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=FPU2NPXo; arc=fail smtp.client-ip=52.101.70.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD7s4OYOi2mXTcahK+H4XaOqIuVnCUTOjUlXVKJx3zs0L3eRVvOXzEwQkMupKdmLzCEbksrTcnh8vH/XmRK83Hp8FGV8xlOz+PKKaWrwtTJ1AxpEikQEmKeHo/Qcpea/LfLPsqQKG37FcJ5dmMbeNUjpbFJrHMXcMZBSL/PU/stxFCeBluND3edotMOMCQfj/IBjUXk8U+vdOKPjm1e9fcx1/6LcYMwA3xOyDirrZUpmb4b9N1VW08dnTVCM8tHhSpX2elpnAPkRVcvEFcz9o09I9N5gRV9tEGYQMquo64pB0iwRf3yVrI3iAnjYVic9E2JR/uzaic7a2OYgyoOLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+O1LxNZ+fhmfnMEc5GOdP1CuKQLcbURrp3hAhAFTWEo=;
 b=rOrHzhaJyB0unJO/pCctiGdP/53Ux+bGpw2ChNC2vFS7PKEU3dv7FoxDpgaJTquEH+zogb5QK3Qb9mwl73g0sq++uDEr/UxXQjFh6c1ZqvC78UTm18p5A4zR4mq3mPn09Dv9x7eFEEEf1QLjimEXtN1kYPPtl7s1kFY9L5/IWJSc2Qfp4qOASBhPMf2+c+tAwc8+08c/MWg6gPAxscMonFVYtpXiPDEP80g7sleIfJr4sjnY5rdZRi3+rU8fbX/YrHva2nGakXZVLDXyLkX9Fwp3qztqhr/lXjhJ+xgSqumSR6yAs6zRoCe7Bw5/FRhgXNKx2zPM+M1tjWkwHISPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O1LxNZ+fhmfnMEc5GOdP1CuKQLcbURrp3hAhAFTWEo=;
 b=FPU2NPXoyq1MPaezyAJwcrwaXdr7S4AwDLBXp9MNFkcwsOq8YqliexglF0nfbPaP7N7GG95jrpZm3brT3YZkPPxC61btfHuezr0YF7rZ/NeLf6/Za1LvlUSpyAWkOiovjocWiLDp2H+qH1TBbNhj1DD202Fng1puE+lVim2c72+DpslII2EumZCPqP9Y60DBJ+Gb1sF/92Jr6RnuQF29NyPuUCcDtBpyTzj+He/Up7K8PUffg37wj+oEXt1Iluohy0nZsLDD4G2DiQKc3bQzJlr78fYVjzLHB/Rm7RMSSFbFZmL06zqv7S2MT2CuhtGngjCUSglWOOCYkqcAssi5HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAWPR06MB9950.eurprd06.prod.outlook.com (2603:10a6:102:4c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:51:50 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:50 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:30 +0000
Subject: [PATCH v3 4/6] rtc: zynqmp: rework read_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-4-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=2198;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=enDO81h/JES+kKjQNR/vJOEGAOIlvXYAg+NEdsXo9AA=;
 b=mEdEp8W6DwU1P/pUMiXpw+QtgVyVjZ0zSDemGSEm9jdTO/Vbqi3AgT+PI8+UgWERWXdkw3J+K
 hjNtpJYCp6dBt/1Z2FjlHa7rafsrPpDCNIiL/K3sk2wHXP79Q1tI6SC
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAWPR06MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d3af42-9d70-436e-c43f-08de57405df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTNCeEtWTFU5VlF6Y3F3Q0IzRng5czJSSE9STzRxVENEdGJFSkNIamF3bHNh?=
 =?utf-8?B?SEZiMzhUN1pNcTJJais3RVFHdzA1VmZld2R5NU1xZXpFV3RoQnpZcmlLZGRT?=
 =?utf-8?B?ZFJ1cWk2SDN4ZFAyRDRySTV2RHNsZGVvamxMUGZySGtMM3M2TEdXSEgybjRL?=
 =?utf-8?B?VU5iVXhpcDdmekExaHBYM295dFE0UDUwSFdZMjRGdGVOOVZUelBzMlAwWXRE?=
 =?utf-8?B?aFVMNVltck1JaVY0K0ExWStXVDJleFRJaE5zc0ltYzltdkhTYW5BRW95S0ov?=
 =?utf-8?B?cVdVS2xEcXh2YmdGWjVoNmRHdURBMThaMGdHNW12TjdtcFplYVkrVGdHOHEw?=
 =?utf-8?B?THBnSHZRd05GT2FuczR4LzlLbTVJNjJFaVZqRlhKdUxLTXlGRGFRUVREdlJt?=
 =?utf-8?B?WXFTY0FCSEU4WTkwanNJRWJyTmdhNGJNZzI1YmN1ZVR6bnFzYkVYMk9qL1Jl?=
 =?utf-8?B?dUExWWdJdzdMYzZoQ3lEbFZ5VEJjVXdVajd0dUhvNzE2UXVvcjdaVDFoRnl3?=
 =?utf-8?B?Sy9IWFhmWVpPTVZYbzF6M3hmOWQxZnJ0SmhTb3k1djd6a29jMlFneG15ckpR?=
 =?utf-8?B?ZFhyLzBEcGhsOEJuOGV2YUFaYTdiQ2VDVjlZcGhoQ1Q5V1RmdjBrdDVSMEFv?=
 =?utf-8?B?YWc0b1l3eFZtYVFxN1RJTHp2enFyYXhSQmZsNUVuS3ZRRTdxN0RYZ1dwTS85?=
 =?utf-8?B?ZGRERWh2cm56bXl6RE9VQ21VM3hwaWtBY3lYQ1ZQQ1o5YnNSNGwxZVdzaTFR?=
 =?utf-8?B?S1JFL3l2NmlZNnd6S2c1R1BaSGJGVXRFK01lV0ZoaHJ2a2lMZXhFZThBQzZH?=
 =?utf-8?B?S1NsQW9CWWtMS1prbXRJNzVuT1Zia2orMGlMN0NSWTJFbE5wcEFsK0srVU8x?=
 =?utf-8?B?WmZ4N1FXc0U2eUMzMUY3RDRiMDVIQ09BUG96amg3ekJxSTBpbFJHRkdLcERl?=
 =?utf-8?B?TytYR28rREoxazgwakJKSGJ2N2VmcTZuTm4yb0dDamFqRnFJWUhlV1VTS2ZO?=
 =?utf-8?B?eGhaWlRDa3JaTi8zYmNMbU9lcE9IMU5tQWxzUDRVQ0Zsd2V3VTh6aFZHZEQz?=
 =?utf-8?B?bm1zR3gyUXZwSkt4UzFUaDlaNDJ4SC9PVGZ4YmQyMnlyRGd0bTJVRW9KVDFn?=
 =?utf-8?B?elJEc1NWUlVEQnB5dU16YmFlOU1lYmpqNzROdXh1NG1PeGhpTW80ZlJQZHY2?=
 =?utf-8?B?YlJtTnVpVEFhZWxRcE40MTExTkRuY0VFUFdPbjhtRStHUE1tQ3hPTnNjWGNM?=
 =?utf-8?B?UjcrM3V4b2JnL1o5ZG5ycGY2bXgzaW12TGhwcTA0UW1MRUJLQXZBRjk0RVJa?=
 =?utf-8?B?SmF5bUNGeWVjYWdFS0crR01OeE51VEUxWjFiSlFzU2Z3UTBSNVJrakQ3cTN1?=
 =?utf-8?B?elMwNEVPdUh6Z1ZXbDdmV0JlMjJybkFTT0Z4ZHJPSWltZWJPMlZEMkw2WkM0?=
 =?utf-8?B?OFhkeDU5OGxTeUVQb0RqYmFMbDF4UGZDcFpFbDl6UGpLaHBPQ1JzUUd3S3NO?=
 =?utf-8?B?K3ZSVWUwNmRNWEpLWi9mZ2I0VjNFNnNnM2EyazdsN3VuNnBhdkFDUGNOdmpZ?=
 =?utf-8?B?SWFnSHdxUENxTXhBM2JqeVVDcy83Zmh6bjZvOHNob3ZaOEIxRjMzanBENkZi?=
 =?utf-8?B?WEk1OW8vN0lYSjAvdlhlNUpuM2t0ckllRWw4U3VPdHNWNFV2RHlicEVhaW85?=
 =?utf-8?B?MnM2NGVhUnVTK29Jb0paUEZ4SVR3RWkzVkdIT2MwV04wQzI1VzVoMXVPS2hW?=
 =?utf-8?B?dWhxV3hpbHh2M2piQUM4bFkzOHRUa25JWjcrekxtaUx4N3ZJSWlKK1grT1ZI?=
 =?utf-8?B?YU5LczN2dEN4djFVdEQxdG93cXYxRFBTaUVYSTBhWnJ5VkkrOEg3cG92WTlO?=
 =?utf-8?B?NUlqVlgyYW1oQkhoNXcyUC9FRW9QZFpmUTFzcjJzaGQxUWFQSlZCVG56VlBP?=
 =?utf-8?B?c3ZvSTJLcXUwUGJoZGRxbTcreXAyWWRBTHFBL0grY2Z3QkJUaDYzTk1zOVFR?=
 =?utf-8?B?WFJtL3NUNUZkbUdsMmN6dzhsRGVROFFXNWdZSS9EUlpBTU1jWFhlcFRiRGdj?=
 =?utf-8?B?dkNrNUV3VTVEU2xpSC9ESzZtZUlZRE9OU0ZoaE53L1hIY0Y3QlppYmttNk1S?=
 =?utf-8?B?NWVzTFJ2VzNtU2kwemRCZHFEeW5HQVhPcjNmeWhuL3B0Z1dqY1BKaGlTdnF0?=
 =?utf-8?Q?uPCCp3a5Saj17M7Db5cJekQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjVrVzhWZkF4NDF4d0IreU5qZ016enA0aVBBdVlkd2hYVHdpZVQwcTREYW9r?=
 =?utf-8?B?ZlZ5RGg4T2RyYmVsMkIzQWFadis5OUozUUQrald5K0VnM0lUWUdSOEJnd21O?=
 =?utf-8?B?NDBDRmxUSWtILzNXVStWRVV5ZExtTFRGejRLS1NBM3pCdlJYYkw5TkZvazkw?=
 =?utf-8?B?L2QycXhrUUNuQ2wzelVjQjlLekY5RlZrUGxOOVVHVThsZ3NSUSsza3ZwK0FU?=
 =?utf-8?B?Nk5aa1hMckVDMUdBcjNvQXdGRUVNK0pkbjFmZVlwMlF5TUxZRm9pTEZBSndV?=
 =?utf-8?B?UHdDVDRtN0dBRnJPWkc5OHRDMWNDQ0lPS05kK0FYZk5tdnFqRkF1cE9udGJW?=
 =?utf-8?B?Y2Y2cm5kSzlXaXNVOHNLUHdzbmI0elRGajFNUUdaRUFxd2ZQYVBnbURZeElU?=
 =?utf-8?B?R2l5Y29Dc1BVUmVXUTBXdnE4c1lwSmtrV3F6eWlPWG5pZlB5RWZPaTJsSyt5?=
 =?utf-8?B?M0U0dnFtZUlwTVNnd3Fwc3FHYXpiQTVibXJtSmswWFROTDlIR2pjbDk4ajdF?=
 =?utf-8?B?R3RkUUFnMW9LV25nNXdBZkxRWmplcG03ajRveGQ3eWxMWVkvaW1vRS9qTEla?=
 =?utf-8?B?RHZkTllpNzJiRmFybHYwdmo0a095K2M1ZVpkT2xwOFZlVTB1ZW1uVFVPNVRH?=
 =?utf-8?B?OEFqQjl6SGRORXpya0RoMzNjaDRsRDBJZ2o2MmhjclkzeGt6MWx0RllGZUZW?=
 =?utf-8?B?TTNVSEdmZ2hlK3lqcE4rQm1RUVVtbmlPbXozRmRMcGRTQmlMNCtVU0NuNUgz?=
 =?utf-8?B?aGtkSk4xazNYcTBYZHFYN0RzS1RHZDlreVJLMnNKM2pyS2VWUzhKTG9yYitQ?=
 =?utf-8?B?YndFMXJjdS9sTldWZmNwU2Fqc3poZXN3Lzh3RHcyK1huTXdFT29IdHJmSTRQ?=
 =?utf-8?B?eGtTVzZQOTd2aTJnaU10UFZVNVpJd2pPb2ErSWkwSTU5eDJIYmdHYk5uekVn?=
 =?utf-8?B?Nm5Pb2ZLU2dGbVgzZWU4SG9mVVEzMHVYejhIL0xselEvL3RLSnVYRGxlQ3RK?=
 =?utf-8?B?TGlQZ1pIZzVsUlVFQkRBcFJxK25pZXFMK0FLRXUxY2Y3ZUJodkVqQTdEUUsy?=
 =?utf-8?B?cHhVTCtaOGd5NHg1SC8rSVFhbFIyR0oxcUVjYjFuS3I3R3A3TzRtaWJEOUtr?=
 =?utf-8?B?Z0FPU3JyVXBWSWcvZEFvVDRLK1pyU2N4Nmc2cUs4RUNqY1ZsbzJVTk5FZ1Rh?=
 =?utf-8?B?cHZxb1pvNlQxMzFFT0t5dVBPb3NKRzhtU3V4VzlNUFlUd0ExVkxMU2tEQVJr?=
 =?utf-8?B?TkY4ak9wKzkrSCs3a21oTk5lbHYvbVJrZE43QjR3LzhKcmtua0k1OWZUU1Zj?=
 =?utf-8?B?TnYwbXhZTXZvRWxKWTNhdnV2aS80SEZobTRPWEU0L2w4M3hRaHhxU3lrNHV0?=
 =?utf-8?B?djA5YmcwcS9kZ01sdk94NUxhWFUyanpGKzI3bTRGVVRzazBFSXdrMTBmeS83?=
 =?utf-8?B?R0xKcTRjam1ZWVRFLzlHeUtDTjNEVkt1bWlTWEhaUmcybHdWenhCWm9MdXA0?=
 =?utf-8?B?alhXVkhHdUZkUUFCeUU2cWRiTXp6V0xTSDF1aml5RHZwZlYxTmlNTmU2N3Jk?=
 =?utf-8?B?QVpwREQyYm9lWUZ6TjNrM2xLc2JTQ3Q4cjdFb1BaTGlRcTJ1WUxiV1JXMFRD?=
 =?utf-8?B?dlBxenhLaThsaW1CaHg4UVdFWGZpbVViOXpnNmoxMjVVR21OKzgwV0Uvd1RY?=
 =?utf-8?B?N3ZFNGxTMUZLNFhsYW1QNXJsazNSaFg0b0RRRnlWV1VSNGF0SzN1SEJxWGsw?=
 =?utf-8?B?OHh2bFR1RGtDekFGMjlkWlFGTHRvcHF1NlVyT1UrMmt6MzRPK2JpTUJaSXZF?=
 =?utf-8?B?VWlWTTJUcDVEN0p2STQ3d0c0UW1OZ0Nnc2xpd21odWp2bW9qOXdjUVB2MWJ2?=
 =?utf-8?B?U2tHUlIxUVVLUWY2Y0FPdWRQSUFCeEJHZkhqUFFhMi9aajdiK0ZEZXlMeXJY?=
 =?utf-8?B?N2MwZHN6NER0MmZRb2VrZWNNZ0JEdlllVkN1eTZuaklHMDVZRVQ5bDZhU1Ra?=
 =?utf-8?B?OHJHTEZpR09TVG56dG9LNng2ZSs5a09Nc2xia281UmlBL0M0Zk1LZ203d3NI?=
 =?utf-8?B?NEdENzU0NXU4V3VKaEx4bnY0S1pkMkZEdTVXQnd6UHJTeS9mY2EwNkhzS3Bi?=
 =?utf-8?B?Z3BsdHBpN2cvQjhiSnFiYm1GVHl2Rm4zamxoUEtCd3IwMHpnRFJWVFF6U0hm?=
 =?utf-8?B?UEphc0w4bWJtRUJkd0FhRTVDdDdreHBZZ2FwZk50OXFtSisxc09EWS94SlB5?=
 =?utf-8?B?a1g2SkpYZ1d1U21PV3h1MHBBVXo1RkZhUVdvUzlpdUZVS2lrMnJOdGdvc2xI?=
 =?utf-8?B?emxXM2dRZk1mSWg2dkRUV1VITjlKVTE3NjBKeEJ3T1JxaVNxTEw0M0NFeWto?=
 =?utf-8?Q?pbVZ3JkV3pILa/bo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d3af42-9d70-436e-c43f-08de57405df8
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:50.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIL3D6YIMvGNWlUa3vjMrzPz18Z4c8SHr5NYPMsg2EX/TpSXNt9h3k9fgoMBsW9cDL0aBCoRtoXWYRHMnqH+Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9950

read_offset() was using static frequency for determining
the tick offset. It was also using remainder from do_div()
operation as tick_mult value which caused the offset to be
incorrect.

At the same time, rework function to improve readability.
It is worth noting, that due to rounding errors, the offset
readback will differ slightly for positive and negative
calibration values.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index caacce3725e2ef3803ea42d40e77ceaeb7d7b914..6740c3aed1897d4b50a02c4823a746d9c2ae2655 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned int calibval;
+	unsigned int calibval, fract_data, fract_part;
+	int freq = xrtcdev->freq;
+	int max_tick, tick_mult;
 	long offset_val;
 
+	/* Tick to offset multiplier */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
+
 	calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	/* Offset with seconds ticks */
-	offset_val = calibval & RTC_TICK_MASK;
-	offset_val = offset_val - RTC_CALIB_DEF;
-	offset_val = offset_val * tick_mult;
+	max_tick = calibval & RTC_TICK_MASK;
+	offset_val = max_tick - freq;
+	/* Convert to ppb */
+	offset_val *= tick_mult;
 
 	/* Offset with fractional ticks */
-	if (calibval & RTC_FR_EN)
-		offset_val += ((calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
-			* (tick_mult / RTC_FR_MAX_TICKS);
+	if (calibval & RTC_FR_EN) {
+		fract_data = (calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		offset_val += (fract_part * fract_data);
+	}
+
 	*offset = offset_val;
 
 	return 0;

-- 
2.47.3


