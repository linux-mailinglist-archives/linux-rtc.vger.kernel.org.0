Return-Path: <linux-rtc+bounces-2030-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C897BE6B
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 17:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C677DB20DAE
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947A91C8FB9;
	Wed, 18 Sep 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TfQ9FrS2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E281BAEF4;
	Wed, 18 Sep 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726672124; cv=fail; b=asOaPjIKqrRMhaM4Rx4pLDgAP2opRq/mHawdA1AagfaVAgeB0xrHWT5NaPZRU2X3sah4dQFMEzQuenNBRZv2SHbmRvo1uzWN9mCqRYjE4TNYJpc0mFxoVK0FwH4LMcR9pH1Yj3n1pAXbmUueRL03PDy4wfUIKzqh8pd/IDMDOfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726672124; c=relaxed/simple;
	bh=F3ax7JGF2bii4CtqI0nBDNlnDYP3cdzRLc1379HxgZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CM2PR7C4xPAoZLUWhKW5IrvkayIuUoh4dSuX3U4GTR37GeNJi8Y7jFNrduqqdtzCquVGOZgZoIZE2psp49r0T9AR4yzFYREcVoIqnJ/0GEzMHMe7EgnGoU+VUE65G/ISEZz6WCozEv0F5tBB4feAPn9MW/LFl0fYhFU/4+0RhDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TfQ9FrS2; arc=fail smtp.client-ip=40.107.21.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yA/d+cqf2FKQj2d7AvhxGJjQ+cenZ2XiBHJamIgr1Wm4NXBGMW9V+5CveBOKK+FxmuG2jyNhgK+x39R0Y9BqEyhhVYr70Mum35N/i8dftnSIsjBkGcoirTL2SpfbIy+DItcX48vhfN/gTztfj4g1KomYZh9uXLrcfh+Y/7W3kwijMOXKApDkZ2CLu0Av7Rkh9XyBVb86iQqse2XLZSgmgUeIpA/hNEmXiFtw2DRXOVUi3QKIiCkzoo3Y4p2emfYLplv8Kj97yuvlz9vx59uAiW2wajhZ1/L8+0fftqAkK7NdvPPgoVYKu52G3Mqysjrt9Vy6UlNPRlxmsvZv1AMCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6YaC9hGzNSuOicXZXJvSppxH3R4bIlEcllLw87+KBg=;
 b=EXiiqbEvgSylJ0nIKVLqlIA65+JPc0AzjSxNb6Ojscu+JXYo3E6QjxRZU8XR1wW98dOsffNI04kdhYoNw3Gsm+9QaFV3u+Bnmsjizw2J3myRWjsp+EfXc3uHFcj/ZuHpdDFkHpLghlMmKWjG+UwbtcD7XCTP60tFKDstLSjDb4bYV784RgcuaG6oRqnigt/I+KKM712uBtHYLsHb9BsCmI9lYFwCecEouwK1/riI5PhpQuBeWUOXjhKNdTlA5bJvougBnuNtXh3A1rMKhaaY8diFla5vOeXcwZJwBvR2TuJIG1kSwX8QvdrdAYy70Wer+IM91Gm37dDUcQGmoEVgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6YaC9hGzNSuOicXZXJvSppxH3R4bIlEcllLw87+KBg=;
 b=TfQ9FrS2Em3gZIbLZ6s9QPequFQP7Z3s+66Of0EgGR7FnXElvwYFc5Wlty+OSU10fNqBcQZhYzUj6IZxK6423bmBS1aXa6EKHiPKn5vx6nHsyzUtkeUE2ZhNG4ZjMK1cOu1QeyXGLsyZ/dChehCkbZQqrpY4qhgbu1nYuEeKCfdWIOQ/AeLy6dJMNtZbjkAlK4gntgZhodp+06qn2xz4Pv6bAetWnBNrD4PLGK2eVjzSUJGP6HbEJF77n21QQTwiYdAKbqCchbL1xJ+A9/RCwk4G++fukpGShNVxQbmCIrJfJrXVm55hNskXNH7cqDQn769h+paZ8csrUiIM1QSssQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GVXPR04MB10684.eurprd04.prod.outlook.com (2603:10a6:150:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 15:08:16 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 15:08:16 +0000
Message-ID: <6659aa90-53c5-4a91-a9f9-01120c88f107@oss.nxp.com>
Date: Wed, 18 Sep 2024 18:08:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
 <2024091810261833316e25@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2024091810261833316e25@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GVXPR04MB10684:EE_
X-MS-Office365-Filtering-Correlation-Id: 79549f57-441d-4277-7c3c-08dcd7f3b8f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0l6Sm1pQjJqdFZ6ZzdPZC9KTytGWkJGcWg4d3puNE53NnRQL1hPUitvTFdx?=
 =?utf-8?B?MlQ1cmtLRE14c29XRVN1b3hYaE04OGlhUzhwTjBwTE9uczdWTFMvOFdOemhN?=
 =?utf-8?B?WTJxV1RFSUI0VDJLdmVUcTY4MjFhc0pQVHBreUdRNm1Md0t4NU93d2Ezcyt6?=
 =?utf-8?B?U1AzeTJCRS96UmtNM1pCaHBtUFdXVXdUZDNJeDhhcU01K1VhclpsMDVtcXhu?=
 =?utf-8?B?ZHlQa3NJRGlvQis2cWJmUVgwdDVhRWZXcjFLMlVINHNlL05CT1JMSlBLeEVv?=
 =?utf-8?B?dUZMSzFxTmRVZER4TTBaWVFER2tGcXZLMmpyRnFQVmtHYTkzQW90K0VjUEFj?=
 =?utf-8?B?dzk3bDMrRnNYNDdKb25LSDJCVXpSNDVaMEtWZkpyakNydWlFbEhUbUpSOFJt?=
 =?utf-8?B?dVZnZlNEWkFLdDhSZWgyY3dsSnhKcHBkY2I4cWlYMkR6V0lLbGRZdXN1cHFp?=
 =?utf-8?B?dUdXM0xwWVAvUXBuVzFuZXVZc1FhYVFxTzQxdTMwdGJqK3JaWEI1SURUZWpH?=
 =?utf-8?B?M0FrdFB5dWpkbWtQWXFGWDlmaFBPMS9EeCsrKzY1dWU4dWVjVDVXaFFKakFq?=
 =?utf-8?B?bzVHS3FiS3NhYURGZmNhTDFjMkhuczBWYkRhaWg1clhEOUo2OWh6OFQ3RGNZ?=
 =?utf-8?B?Y0M5SFdZbXFHQVFmei9QM2xVS2x5YnhTQWh1RklhbzZaSlg5MEhsdkYyVSt4?=
 =?utf-8?B?TkwxaW05b25kcktIaE5yZkhYY0pzVkpWaURkdFV1Rlp2OFRyaE9hOURBOEdy?=
 =?utf-8?B?R2JBNFQrY2ZnVzdXWjJ5VThZS3pyam92d3VyQW1FbjlsQ2I2UEtlN01ZbDNu?=
 =?utf-8?B?Z1hRM0RRTVBMNnRnYkNiYWZkWCtsc3Z1NVh4UHlxZVlsRHVnQzVqYVNUcVZm?=
 =?utf-8?B?NVNJbXJ6QXdsbnl2QmV6ZFhPYWhjR0loTnhMMXJabkQrcGFQQ0piem9mRUlz?=
 =?utf-8?B?VG1icXBWcG1uc255NmJ6cjQ1MHlQK3FPWFhyclRDclhDMHNsV3ZSTkVBSHpJ?=
 =?utf-8?B?c1R4T2h3RkZDbVA1MER1aTFNOVdiRzBVbDNBYlMrSFJDdnFnN0tqa0FZUUFC?=
 =?utf-8?B?MmhlSExuaFpvdm1RYlI0WDhYSW80VGo5Szd0em83QUdkajFpaVR6aDN1RVk5?=
 =?utf-8?B?RUJDcW9NV0ZnaVBOVWptcVJaSzZVQXU4a05yMjJCZlM4Q2E0VkNxcmdES2RC?=
 =?utf-8?B?a2UveDNUMnBEM0JBOTU2T3hxOFVtYjV5Zlc1Szl1WnJCNklNWlNaV2MxQXNn?=
 =?utf-8?B?R2pCRldpYnh3b3J5K2REek9xbjhzaVVNUXJtMTFjbldSdjc0aW1WellTaEtQ?=
 =?utf-8?B?T1F6UE5MM2VvSVNaanJnVjRBamROTTFJL25ubDR5L3FoOVZhNTBtWWFBL3l2?=
 =?utf-8?B?UTBRRytzWU12dVRkRDh4bytVaytqY3UwZUp5UzhodTcvMGNrK3ovRTYzMDZN?=
 =?utf-8?B?SnNwczFYVFVyMXRKMTk4aUlnQnRyNitIL3YvRXlQY0E0UnFOeXJ1ekZvVTBo?=
 =?utf-8?B?M3VOOGNlZTlwcCtLK3phVlAySmJwWjRoRTVNbE1pYTlaOHpvekQ2bnM3T0xC?=
 =?utf-8?B?Q0dVci9iWk1LUUxjdnVuS0luamxXWTVibTNGbjJEejZhVXQ5bGFYbENuQUdD?=
 =?utf-8?B?LzE0SDVIbXhVeUV4RjdrbUc1SXd3NUp2dCs4ZndvakZtdWxnTU8wcVVXQ2NT?=
 =?utf-8?B?STBRSmhxVEJpMW9RYk1na1VTakJXZ1pGOXRUbHMzNTV6V1RJaE1Dd2RWaG9h?=
 =?utf-8?B?TkVGUTdFK1lTREl2c2NYODNoTHFmMGtuMXZVZk81dEtDNWVkK2lWT24zNjBO?=
 =?utf-8?B?YU5LTEx3bDNmNDRFaml3QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2U2QzZNTENlb2E5Y3pQWllSK2s5bytzeHppNFRiSzJJNGlOQzZ4dE1ZV1dh?=
 =?utf-8?B?N0p0aTZLN3owNys4cW92VjNldlRQU1drSmxkK2JlbzlVT1hHVzMyejkrUWVq?=
 =?utf-8?B?R3YrVmkyWFp5UnBKTWF2Y2MwZ2JGbjFMRW1FNzJjZGRxOVQxeFRsQmlnb3Rx?=
 =?utf-8?B?RHp3Y29MRVR3aWRjd0hkRHRoaHpwL1orVUU1R05ZRHh5VFppRWtoelUwSFJI?=
 =?utf-8?B?blZSeU5ldFlRd1VPTExZOGNPZDBHNkxMMFFpKzl0N083YW5mSlhqVlVScEZa?=
 =?utf-8?B?WGFpRFhGWWxWTFBoNUZWMmFtMStqd3R0OE0vT0QrMzNuTEp5NFdHak1kbXUr?=
 =?utf-8?B?RU9XdmJnQnV2V3BrOURGdDZGL05QSVRoL0pCdDkwT0owcHZoUGJER0ZJU0VI?=
 =?utf-8?B?UEMybDV3SjRZUVpJUHJGamJJRlVGZVF4R0UxUTNiNGVSWllxMFdqTjZhVlRR?=
 =?utf-8?B?RmlYcE9pRmdLSndtckI1N1Nxbnl1WHN2NCthcE56a0J0N01BelRQeXp5SCtU?=
 =?utf-8?B?NFE5amg5TmI2LzZoSUtQM0FJZ1NSN0xsMHZvWmZOWlVwQlNvaEl6RUpEQ2lE?=
 =?utf-8?B?L0tKdi9jRzNyWlhaM3BzUjV2UXQ2Y2RTV2xCNERGUE5PQVVsaHFVT01iNW5i?=
 =?utf-8?B?ZWZTTE40b2JKTEFWOVBmblVkREtMMmlTVUdaUWJGOTdDZXl5VzJUcmt0SURN?=
 =?utf-8?B?TjFEUkVzSTVZUndsSE16US8yR2cyVnhQamxFYys0QnJrYkt2M0NMQUpUQ3Zw?=
 =?utf-8?B?dkNReGxrVUFYRHErenRvMklrUTJqcTVHckN4NzkwbXpsQlVUOWlXUVF1K1hs?=
 =?utf-8?B?L3h4WS9qWDhrVVpCUkI1MUVzYTZtNjA1WDliYzMzZWxQMXdoMlhYSVEvMDFr?=
 =?utf-8?B?UkNGTU4vMG15S2Y3ZXYrSWxVc3JENmFrY1FkaVQ5ZnpZU3Z0YW83Q0RrRk01?=
 =?utf-8?B?d0haVjcxSE0yRkNCM3RpOENoelkzWU1YbGw2WStaaDVLK1VrMmlESFZ0TEhs?=
 =?utf-8?B?cjkzOWlaWWhERWwrb2FpYmIyYWVGTVV2cFN0UVp4WGVGSHNvMDRwRk9ML0Nx?=
 =?utf-8?B?Rlc3Rno1RnJKL1NHVTE4YUNxd3dSenJuVWNKNVFBWUhOZ3NvbVQ2RXJQRUpr?=
 =?utf-8?B?WURDU25jeDEwOXBxdy84eVdkV3lVVjRNcFlyZjAzTmNDSXMrVDhqcVVveVd0?=
 =?utf-8?B?NXJYZnk4alZTUlpVTXE4VjB2MEQ5Y2pSOWdpQXR4d2VFaURiMk5nNjJPaFZt?=
 =?utf-8?B?bjlBRWJOdWt5NEdIaVFqODlmUjRxQlcwYmo5eGxVSk5oT3I5clVTWStRS0hE?=
 =?utf-8?B?cGpLTmdXNW14REs5WEZsZkU2RXBxUEY1UU1SZExJUEJOeDMyYzBYMHNGS1Ry?=
 =?utf-8?B?WENYMFlqQ2UyUS9FdWtxUlF5dHltVmlqK0Y4aUtVVUdnYUFZcXZmbzhLNkJp?=
 =?utf-8?B?d2ZXdERrOSthRE9IWDJsSk1Ma2dVOXpLSkprc1owMlFacTZoV2gwa3NraGVz?=
 =?utf-8?B?bHRDSENpb3IrL1lTTnFhN2ZsZTZrRmF1b1dKdVN6a0R6am41eVV0Y1pZMHFO?=
 =?utf-8?B?MEVOM3IzdWRFYlZMSFdFZDRRTGY4UHpvM05oZnplYk9KSWRvNzFqekxsd2g3?=
 =?utf-8?B?RDZrRlBUc1I1STFMaFZ2Q0x5djdCWnZOWXhkWHRNM3oyakg2SDM1c1ZmN0Nw?=
 =?utf-8?B?TFJWR2hOM3hKaC9MRlRobTd4cWZDSDJaV2VHRXFKTHhMVmgwZThhajR1cHFR?=
 =?utf-8?B?aEdwbTNHRU9ySU8zOVVod3E3c1p3QS9mUEdMbkc2WjJocDg5b1VidWMwRmc2?=
 =?utf-8?B?N0hza2pmaVVLUkR1dmxqVnlJYWVkUTlhUXgyVG1zQ3lRWWo0andLcGQwM3dn?=
 =?utf-8?B?dzlad1ptbHp0dU56cVJHR0ZBT2lMbGdhZ2Z6MHUzbVpXYVpVSnptb1FGdks2?=
 =?utf-8?B?aUZGeU9TSElaM1NOMXVaSm1Ed2daaVgvOUpuQ0tVNmljZnhNYmwxTUd5UVh6?=
 =?utf-8?B?Q0x2enNQcUpvdXhNcjZONUxYaWVsVGREQnIvVzFvUVZURDE1NVJMVmRhYzZE?=
 =?utf-8?B?MTRMMnhVaStGc3VNTWhzVklWREZsSzRjOUxQWHNmZUVxYUEwdkhLQ3RKMlVn?=
 =?utf-8?B?anIySHlnbEUwNGM2enFuN3NUM2pjVFF5TU05N2UzVXBkMk9VU3NZa2JKMTRW?=
 =?utf-8?Q?PU0FalGlABH+nk5yaayiMHA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79549f57-441d-4277-7c3c-08dcd7f3b8f5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 15:08:16.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGY4vRq0+VrU39ztVRzPUfWk5+2neqfMU9kprEDy6QHYz4vcFywSag4JB9sWZ1/AMMdMJC03ASmy+8KiLZiZX6lPhhFG4hGCEUHBoHGeXTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10684

On 9/18/2024 1:26 PM, Alexandre Belloni wrote:
> On 11/09/2024 10:00:26+0300, Ciprian Costea wrote:
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	u64 rollovers;
> 
> The whole rollovers implementation seems useless as the rollover may
> happen when Linux is off.
>

Hello Alexandre,

Thank you for your valuable tehnical feedback on this RTC driver proposal.
I will try, to the best of my knowledge to address your concers.

Regarding the rollover implementation, the Hardware RTC module registers 
present of NXP S32G2/S32G3 SoCs are being reset during system reboot.
On the other hand, during suspend, the RTC module will keep counting if 
a clock source is available. In this case, an internal low-rate 
oscillator (32K -- SIRC) is used, or an external clock can be provided.

The meaning of 'rollover' in this driver refers to a field which will 
count the number of times the RTC counter transitions from value 
0xFFFFFFFF to 0x0. At a 52MHz counting rate (FIRC clock), this would 
mean once in around 18 seconds. Its value is used to report the time 
after multiple rollovers. This can be observed in function 
's32g_rtc_get_time_or_alrm'.

>> +#ifdef CONFIG_PM_SLEEP
>> +	struct rtc_time tm;
>> +#endif
>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	struct device *dev;
>> +	u8 __iomem *rtc_base;
>> +	struct clk *firc;
>> +	struct clk *sirc;
>> +	struct clk *ipg;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	u64 rollovers;
>> +	int dt_irq_id;
>> +	u8 clk_source;
>> +	bool div512;
>> +	bool div32;
>> +};
>> +
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +	return cycles / hz;
>> +}
>> +
>> +/*
>> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
>> + * current configuration.
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
>> + *          twice the rollover interval
>> + */
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 rtccnt, delta_cnt;
>> +	u32 target_cnt = 0;
>> +
>> +	/* For now, support at most one rollover of the counter */
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ULONG_MAX))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * RTCCNT is read-only; we must return a value relative to the
>> +	 * current value of the counter (and hope we don't linger around
>> +	 * too much before we get to enable the interrupt)
>> +	 */
>> +	delta_cnt = seconds * priv->rtc_hz;
>> +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +
>> +	if (~rtccnt < delta_cnt)
>> +		target_cnt = (delta_cnt - ~rtccnt);
>> +	else
>> +		target_cnt = rtccnt + delta_cnt;
>> +
>> +	/*
>> +	 * According to RTCVAL register description,
>> +	 * its minimum value should be 4.
>> +	 */
>> +	if (unlikely(target_cnt < 4))
>> +		target_cnt = 4;
>> +
>> +	*rtcval = target_cnt;
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t rtc_handler(int irq, void *dev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(dev);
>> +	u32 status;
>> +
>> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
>> +	if (status & RTCS_ROVRF) {
>> +		if (priv->rollovers == ULONG_MAX)
>> +			priv->rollovers = 0;
>> +		else
>> +			priv->rollovers++;
>> +	}
>> +
>> +	if (status & RTCS_RTCF) {
>> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
>> +	}
>> +
>> +	if (status & RTCS_APIF)
>> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
>> +
>> +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int get_time_left(struct device *dev, struct rtc_priv *priv,
>> +			 u32 *sec)
>> +{
>> +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	if (rtcval < rtccnt) {
>> +		dev_err(dev, "RTC timer expired before entering suspend\n");
>> +		return -EIO;
>> +	}
>> +
>> +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +				     u32 offset)
>> +{
>> +	u64 cycles, sec, base_cycles;
>> +	u32 counter;
>> +
>> +	counter = ioread32(priv->rtc_base + offset);
>> +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
>> +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
>> +
>> +	if (cycles < base_cycles)
>> +		return -EINVAL;
>> +
>> +	cycles -= base_cycles;
>> +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
> 
> What happens after you reboot?
> 
> This doesn't seem to be a proper RTC, unless you have some NVMEM to
> store the offset between the current time and the value of the counter.
> As-is, the driver is not working.
>

With the existing hardware on S32G2/S32G3, only parts of what Linux 
expects from an RTC can be implemented in software.

Please note that the RTC module is not battery-backed.
Would it be acceptable to return errors for the use cases that cannot be 
fullfilled by the driver and list its limitations in the Kconfig menu ?

In the end, the main goal of this driver is to represent a time-based 
wakeup source for the SoC.

>> +
>> +	return sec;
>> +}
>> +
>> +static int s32g_rtc_read_time(struct device *dev,
>> +			      struct rtc_time *tm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u64 sec;
>> +
>> +	if (!tm)
>> +		return -EINVAL;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, tm);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc, sec_left;
>> +	u64 sec;
>> +
>> +	if (!alrm)
>> +		return -EINVAL;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, &alrm->time);
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
>> +
>> +	alrm->pending = 0;
>> +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
>> +		alrm->pending = !!sec_left;
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc;
>> +
>> +	if (!priv->dt_irq_id)
>> +		return -EIO;
>> +
>> +	/*
>> +	 * RTCIE cannot be deasserted because it will also disable the
>> +	 * rollover interrupt.
>> +	 */
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= RTCC_RTCIE;
>> +
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	struct rtc_time time_crt;
>> +	long long t_crt, t_alrm;
>> +	int ret = 0;
>> +	u32 rtcval, rtcs;
>> +
>> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	t_alrm = rtc_tm_to_time64(&alrm->time);
>> +
>> +	/*
>> +	 * Assuming the alarm is being set relative to the same time
>> +	 * returned by our s32g_rtc_read_time callback
>> +	 */
>> +	ret = s32g_rtc_read_time(dev, &time_crt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	t_crt = rtc_tm_to_time64(&time_crt);
>> +	if (t_alrm <= t_crt) {
>> +		dev_warn(dev, "Alarm is set in the past\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret) {
>> +		dev_err(dev, "Synchronization failed\n");
>> +		return ret;
>> +	}
>> +
>> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_time(struct device *dev,
>> +			     struct rtc_time *time)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +	if (!time)
>> +		return -EINVAL;
>> +
>> +	priv->base.rollovers = priv->rollovers;
>> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	priv->base.sec = rtc_tm_to_time64(time);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rtc_ops = {
>> +	.read_time = s32g_rtc_read_time,
>> +	.set_time = s32g_rtc_set_time,
>> +	.read_alarm = s32g_rtc_read_alarm,
>> +	.set_alarm = s32g_rtc_set_alarm,
>> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>> +};
>> +
>> +static void rtc_disable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc &= ~RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void rtc_enable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc |= RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int rtc_init(struct rtc_priv *priv)
>> +{
>> +	struct device *dev = priv->dev;
>> +	struct clk *sclk;
>> +	u32 rtcc = 0;
>> +	u32 clksel;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(priv->ipg);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->sirc);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot enable 'sirc' clock, error: %d\n", ret);
>> +		goto disable_ipg_clk;
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->firc);
>> +	if (ret) {
>> +		dev_err(dev, "Cannot enable 'firc' clock, error: %d\n", ret);
>> +		goto disable_sirc_clk;
>> +	}
>> +
>> +	/* Make sure the RTC ticking is disabled before we configure dividers */
>> +	rtc_disable(priv);
> 
> At this point, you lost the RTC accuracy, this must not be done on probe

The 'rtc_init' procedure is called during the probe and suspend
callbacks. The first one is expected, while the latter may be a bit of a
surprise, but it follows what the hardware expects to see when switching
from one clock source to another.
In this case (suspend), we are forced to switch from a clock source that
can be used only during running (FIRC) to SIRC, which is the only option 
for the period when Linux is suspended.

>> +
>> +	clksel = RTCC_CLKSEL(priv->clk_source);
>> +	rtcc |= clksel;
>> +
>> +	/* Precompute the base frequency of the clock */
>> +	switch (clksel) {
>> +	case RTCC_CLKSEL(S32G_RTC_SOURCE_SIRC):
>> +		sclk = priv->sirc;
>> +		break;
>> +	case RTCC_CLKSEL(S32G_RTC_SOURCE_FIRC):
>> +		sclk = priv->firc;
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid clksel value: %u\n", clksel);
>> +		ret = -EINVAL;
>> +		goto disable_firc_clk;
>> +	}
>> +
>> +	priv->rtc_hz = clk_get_rate(sclk);
>> +	if (!priv->rtc_hz) {
>> +		dev_err(dev, "Invalid RTC frequency\n");
>> +		ret = -EINVAL;
>> +		goto disable_firc_clk;
>> +	}
>> +
>> +	/* Adjust frequency if dividers are enabled */
>> +	if (priv->div512) {
>> +		rtcc |= RTCC_DIV512EN;
>> +		priv->rtc_hz /= 512;
>> +	}
>> +
>> +	if (priv->div32) {
>> +		rtcc |= RTCC_DIV32EN;
>> +		priv->rtc_hz /= 32;
>> +	}
>> +
>> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +	return 0;
>> +
>> +disable_firc_clk:
>> +	clk_disable_unprepare(priv->firc);
>> +disable_sirc_clk:
>> +	clk_disable_unprepare(priv->sirc);
>> +disable_ipg_clk:
>> +	clk_disable_unprepare(priv->ipg);
>> +	return ret;
>> +}
>> +
>> +static int priv_dts_init(struct rtc_priv *priv)
>> +{
>> +	struct device *dev = priv->dev;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	u32 clksel = S32G_RTC_SOURCE_SIRC;
>> +	/* div512 and div32 */
>> +	u32 div[2] = { 0 };
>> +	int ret;
>> +
>> +	priv->sirc = devm_clk_get(dev, "sirc");
>> +	if (IS_ERR(priv->sirc)) {
>> +		dev_err(dev, "Failed to get 'sirc' clock\n");
>> +		return PTR_ERR(priv->sirc);
>> +	}
>> +
>> +	priv->firc = devm_clk_get(dev, "firc");
>> +	if (IS_ERR(priv->firc)) {
>> +		dev_err(dev, "Failed to get 'firc' clock\n");
>> +		return PTR_ERR(priv->firc);
>> +	}
>> +
>> +	priv->ipg = devm_clk_get(dev, "ipg");
>> +	if (IS_ERR(priv->ipg)) {
>> +		dev_err(dev, "Failed to get 'ipg' clock\n");
>> +		return PTR_ERR(priv->ipg);
>> +	}
>> +
>> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
>> +	if (priv->dt_irq_id < 0) {
>> +		dev_err(dev, "Error reading interrupt # from dts\n");
>> +		return priv->dt_irq_id;
>> +	}
>> +
>> +	ret = device_property_read_u32_array(dev, "nxp,dividers", div,
>> +					     ARRAY_SIZE(div));
>> +	if (ret) {
>> +		dev_err(dev, "Error reading dividers configuration, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = device_property_read_u32(dev, "nxp,clksel", &clksel);
>> +	if (ret) {
>> +		dev_err(dev, "Error reading clksel configuration, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->div512 = !!div[0];
>> +	priv->div32 = !!div[1];
>> +
>> +	switch (clksel) {
>> +	case S32G_RTC_SOURCE_SIRC:
>> +	case S32G_RTC_SOURCE_FIRC:
>> +		priv->clk_source = clksel;
>> +		break;
>> +	default:
>> +		dev_err(dev, "Unsupported clksel: %d\n", clksel);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_priv *priv;
>> +	int ret = 0;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(struct rtc_priv),
>> +			    GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->rtc_base)) {
>> +		dev_err(dev, "Failed to map registers\n");
>> +		return PTR_ERR(priv->rtc_base);
>> +	}
>> +
>> +	device_init_wakeup(dev, true);
>> +	priv->dev = dev;
>> +
>> +	ret = priv_dts_init(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = rtc_init(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	rtc_enable(priv);
>> +
>> +	priv->rdev = devm_rtc_device_register(dev, "s32g_rtc",
>> +					      &rtc_ops, THIS_MODULE);
> 
> This is deprecated, please use devm_rtc_allocate_device and devm_rtc_register_device
>

Thanks, I will update in V2.

>> +	if (IS_ERR_OR_NULL(priv->rdev)) {
>> +		dev_err(dev, "Error registering RTC device, err: %ld\n",
>> +			PTR_ERR(priv->rdev));
>> +		ret = PTR_ERR(priv->rdev);
>> +		goto disable_rtc;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>> +			       rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->dt_irq_id, ret);
>> +		goto disable_rtc;
> 
> You must not fail after registering the RTC, else your driver will be
> opened to a race condition;
> 
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_rtc:
>> +	rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void rtc_remove(struct platform_device *pdev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
>> +
>> +	rtc_disable(priv);
> 
> Disabling the RTC when shutting down renders the RTC useless.
>

The RTC hardware module state is not preserved during system poweroff.
Hence why I've disabled it on remove callback.

>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static void enable_api_irq(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
>> +	u32 rtcc;
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= api_irq;
>> +	else
>> +		rtcc &= ~api_irq;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int adjust_dividers(u32 sec, struct rtc_priv *priv)
>> +{
>> +	u64 rtcval_max = U32_MAX;
>> +	u64 rtcval;
>> +
>> +	priv->div32 = 0;
>> +	priv->div512 = 0;
>> +
>> +	rtcval = sec * priv->rtc_hz;
>> +	if (rtcval < rtcval_max)
>> +		return 0;
>> +
>> +	if (rtcval / 32 < rtcval_max) {
>> +		priv->div32 = 1;
>> +		return 0;
>> +	}
>> +
>> +	if (rtcval / 512 < rtcval_max) {
>> +		priv->div512 = 1;
>> +		return 0;
>> +	}
>> +
>> +	if (rtcval / (512 * 32) < rtcval_max) {
>> +		priv->div32 = 1;
>> +		priv->div512 = 1;
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	int ret = 0;
>> +	u32 rtcval;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Save last known timestamp before we switch clocks and reinit RTC */
>> +	ret = s32g_rtc_read_time(dev, &priv.base.tm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (init_priv->clk_source == S32G_RTC_SOURCE_SIRC)
>> +		return 0;
>> +
>> +	/*
>> +	 * Use a local copy of the RTC control block to
>> +	 * avoid restoring it on resume path.
>> +	 */
>> +	memcpy(&priv, init_priv, sizeof(priv));
>> +
>> +	/* Switch to SIRC */
>> +	priv.clk_source = S32G_RTC_SOURCE_SIRC;
>> +
>> +	ret = get_time_left(dev, init_priv, &sec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	rtc_disable(&priv);
>> +
>> +	ret = adjust_dividers(sec, &priv);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to adjust RTC dividers to match a %u seconds delay\n", sec);
>> +		return ret;
>> +	}
>> +
>> +	ret = rtc_init(&priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return ret;
>> +	}
> 
> All of this seems super fishy.
>

I agree it is... above rollover support enables RTC alarm during Sleep
for a maximum timespan of ~3 months.
In this case, the rollover does not matter as it's not involved in sleep 
period settings. The only way we could avoid all of this is to always 
keep the counter on SIRC, starting with driver's probing.
This would avoid the transitions, but the precision would not be as 
accurate as running at 51MHz.

>> +
>> +	s32g_rtc_alarm_irq_enable(dev, 0);
>> +	enable_api_irq(dev, 1);
>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>> +
>> +	rtc_enable(&priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	enable_api_irq(dev, 0);
>> +
>> +	/* Reinitialize the driver using the initial settings */
>> +	ret = rtc_init(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	rtc_enable(priv);
>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
>> +#endif /* CONFIG_PM_SLEEP */
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{.compatible = "nxp,s32g-rtc" },
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>> +			 rtc_suspend, rtc_resume);
>> +
>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
>> +		.of_match_table = of_match_ptr(rtc_dt_ids),
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove_new	= rtc_remove,
>> +};
>> +module_platform_driver(rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.45.2
>>
>>
> 


