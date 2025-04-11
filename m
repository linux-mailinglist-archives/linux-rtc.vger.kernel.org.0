Return-Path: <linux-rtc+bounces-3926-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA8A85639
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 10:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633B94A6F3E
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 08:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D887293B4E;
	Fri, 11 Apr 2025 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tZYTpqyV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FC293B50;
	Fri, 11 Apr 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358974; cv=fail; b=BfNlCpHUCPj7X9X8A6rz6sABDHjSCv61bDL+pSDis3A7MNyr6vQ2AxDqdOLwChV7mPNN7gljlReLH06yinbzbwLTuZloo57LmBd0wws8JLolamaMVeFwSh5JmX4exF0pRRbmb913UZOrckx5lsoubpvHPWqDB95yKIFgxe7Y6S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358974; c=relaxed/simple;
	bh=SIyamjms6Wclpd72ci4mWRF7kYhgsn12aG3nDwvXN4s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gXZSBFrWQ0uagvDPlxhPqn79EzzIFPTSJF5XRiu6mQprB3YUAjqoULM4ZNV4cX368awJ/2pCwD0CC3i/zKeNFqoMBLIf/fXzAZ2PKKq4lTna5bFFW7rLZvcPs+qgbUNjgIAOlO/6ujD5KD6xDEbP4Fx728lNypUpK77US7QKqzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tZYTpqyV; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d09M6zyIrKcvd9tiDLnkSvMEz9GUiTSEnq1OlomnMPcfCYNQmDCK6HcoTqrKQwFSDorWEacgDpF87BzqF8XyPkBSEiKSd+9XJunNSWDJtV3lq4vW50Z1l7RrkP7gZWFKD/9q5HLFl8b3Vw7dU92sM04o0Fg0VYML2k//e2j0/emSTuRL1ei0YpBkRjFyVDzLORRnoLKSUzOMJlGd2XIO7PQ5E8sFxlYfuuqg5v8brqJKkGGqikdsF2bEpaNNubv5GGOqupkQQdhiK4ZZBEDW4YwwkiqPEQ5pZrmDuw2DSNPwnXV0pZeLpkqsCANOue2XSNuikWGBlILnnPgSAm0V5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9URa2F0JWMe/eQZrPCqCQr4l3P0C7Jl2AZkDDah0JY=;
 b=gdozPQDFE7gm4GW0dQwTOw4TtQaNg8dfjqdJkJZSRfRkK4L+l9Y4CZjJXvTrFXh9rnLt6vkkuRGzEXQNYqVP8zE+lQZd0W2phaymTa0j0Qz7ZU0m2EVOkGHgw1tUKNlFsvmBoPK1ZeUK3PTs5m67duPnAgOPFt9O9mNCd6rffB0pg1ZdVEjKSZaBOgfnDrCFUfgsXm4QaHZo9NZ0Gwbsw9Disdo96ngB3UfNSumU9yaRqU3KAqoUzL38xMyN0lBp8PCwBmRumzG3S3r80PsUTp+6gfK4UZbx/ZJW7o8wvnhbUU3lY4jOGk4QX77hlDBQ1O5vZRDWcSVmdr9eV9VxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9URa2F0JWMe/eQZrPCqCQr4l3P0C7Jl2AZkDDah0JY=;
 b=tZYTpqyVOVBWp7hEIjUlZd4c8Bjmygzz+4tumfNeu2GYzTFmWWu88+k3bn0IsYWBVOzLFhRzD4ZxhJQeIFYE5MB2DgPswT8thAKp5oO18uw/LKpLfiipdQrmndyRgl1WCY5UrbRDH0hPy6vUhE9ENvXMjIVHxyMeHujvAfV3axf82U97aDHK9RIxW4g51KnyqQex6HZrFmSI8yYw5NqFf3yZ5vYOH/xz+m5RPUUzYGLrWD4+Lh4krPD5wBj5BjzZcDy7KlYLUemLkXpXZ0401GV0TQ6/klAX5TW4S18WpUks97mdGRnewraln2M6WADVMinJEkYt0yTjV5RTNjFaHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GVXPR04MB10136.eurprd04.prod.outlook.com (2603:10a6:150:1bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 08:09:27 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 08:09:27 +0000
Message-ID: <689511b2-c4a4-4047-a932-ff9ebfcedf22@oss.nxp.com>
Date: Fri, 11 Apr 2025 11:09:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Enric Balletbo <eballetb@redhat.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-3-ciprianmarian.costea@oss.nxp.com>
 <CALE0LRs3VA9kLy4QSEOBCixZbptW4B4DVjZqbN=GDoONHq2oeA@mail.gmail.com>
 <9f982548-c5e3-45ed-963a-afb5256acf31@oss.nxp.com>
 <CALE0LRvUXck_FSP0jCZ1Ene-LCEa8MDFQWVCHGpOzd_yGk+v4g@mail.gmail.com>
 <64843c72-37e3-4080-880f-a020e372b521@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <64843c72-37e3-4080-880f-a020e372b521@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GVXPR04MB10136:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cfb4cc-1b28-43c5-5dbe-08dd78d02d7f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ulk5VXpFTk9LWmgzZjRFS2lEWXhuWloydnUxcEYrYUFaWkJkMWZZR09wdjll?=
 =?utf-8?B?MnVQVlF2S0grNjRCYUszVUFCTHNveUc1R2l1TTJnVVVRdWpmVE5PNmh4b1Iz?=
 =?utf-8?B?RERNZ0ZWZnlmOTJWcUNNNXF4bDVKSmNRdEhIK2l3ZEZvemFFbnNkdmpwTUoz?=
 =?utf-8?B?ZUQ2VnZRR0pQdUY3d3FzTW5kMVBsdEJib1hzSGVpbVRYenZXc0pqbHAzR00w?=
 =?utf-8?B?amN2ckdiU1ZJL3JrL0JJVkZGMUNIM05ZTDJTdG5NQytuaWFUdVZkbWNDd3Mv?=
 =?utf-8?B?aTQvdHBOTkRYZzFLdld1N2RiRVZMeU5PYzN6T2hkZjhlNzQyZW9aam1DYm0v?=
 =?utf-8?B?SC9na2dyZkxzMmxuWGF2ckYxeVlraWxlWko4THlmcDlKV3UrVkpzMGdMK2N6?=
 =?utf-8?B?RHVGcmlwM2ltMnZOOG5FVzFoeG40RHJ2dWhSczROdUdRWmt3WHVGaG9aSFZQ?=
 =?utf-8?B?N21nN1lzTzF4MTZVK2VxUGxNUytjeTdSQkZZWURNeThmQUF2b0czRVNSMmFn?=
 =?utf-8?B?dUJMSnFQdHRDR0tTS1FGR0w5VDNjNEhTWVoyZEZuOFZ4SUtta2hpYWxVRHVC?=
 =?utf-8?B?UUoyZkdoaWk5U3YxYXp2Q2xXVnpKS3pxUUhpWDRLVXppZXJMczV3d0NIZ3hF?=
 =?utf-8?B?cnhNNWZ3QStWekExWDZTaDVwTmM3cnhsUDFJdzdxbzJUUGZiell0TTQwd1Fn?=
 =?utf-8?B?a3hHQ0YvOHpHNW9yRzRNSDRnSEllRWFCL0FpWC90TzFIV0VmY251Y1NvWlE3?=
 =?utf-8?B?WmI0K2hWTnM2YllIMXd1cDJGYlFRamNic1ZienBoWE1ZcFdlb3lyQU8vK2FM?=
 =?utf-8?B?T2dkTGkwcHBuL0dhbmpJSC9pSm1pVEtYUmxGUWZoRmFWeFl4Yk5lQjFVTXlq?=
 =?utf-8?B?ZE1WTW0wbDlXaC9aNlN3K1lzMncra0JGMUswNHZCdExQZzdOOTNrY21CMFV4?=
 =?utf-8?B?emZIWEdpb0ljVE8vUklmQ2RoTGNYa0JyREV0NWpuZDhEcjlyTTdwM2ZRK1h1?=
 =?utf-8?B?eTNIMXk1aEgrZU52S2lUOFNOVDR3YXRpWmZYLzF0MGg3KzQzWmJRd08zMlRP?=
 =?utf-8?B?UUU0ZzZ4YmJ0eWNaQWh6bFJWQjRLc2ZvK3hZVFJBSVJxa1p4bFU5MEtCQyty?=
 =?utf-8?B?MUF5UDdJTlpoU0hWa3o2aGp4SFMvazdTbXA4Rk5HN3lGUDZJOHp0dGZFZ09Q?=
 =?utf-8?B?alY2cld6dGw3Y2NtdFp1dFpuaXZ0Uzl6RjRoNE5LS1ZSQWxjTW1XYVRtVGZZ?=
 =?utf-8?B?bTNPdG03a2ZMWUtpVk93LzlGSXQveG5zR3dJTHE0d3l0eUV4OHRMU0lBNjdm?=
 =?utf-8?B?UWlLMzg3SmJ4cUdvc0pYTGF2NWllL0JEVmNWeGpHRm5Gd0srOW9EcmtWUFQ5?=
 =?utf-8?B?NXA0OEpTRTdJMUJIWVBML05tQmRtL0tSUkZKbTlweTJycHlaS2tVSFNwS1JN?=
 =?utf-8?B?c2ZjenprN3BiR0tvYTJHREp2dTRGeFEvanRLRmV3ckprcHNXQVhDMHlvcERD?=
 =?utf-8?B?eWlUcTFyUXNabThQUlNXT254ZjF3T2xDN1g0eXpXMktqczNzNGJiY0hkYlVs?=
 =?utf-8?B?eUMzcmlybkJBd1piQXU2M0hoaEw4YTJ2MEtBT2xJU2F4WDFtL01Md1d5OHlr?=
 =?utf-8?B?R1lqZ0VrbEY2STNxYkovUUtJRnZOQ1hYL29uMnpiMnZ1dVo4NHNMMDY2bStj?=
 =?utf-8?B?ck1IZklsQTEycHI4djVkMnU3QXdKSm1BeE4zREczb2IxZzBQd2V4TjhyOTNQ?=
 =?utf-8?B?REd5em4xVDdaM2hUcVlzTmpCUFM1MGZ0NzVNblA1TW5WaDI1a1lBVUdpZEJt?=
 =?utf-8?B?L0w0RDdqTks5SFdIakYrT3hrS293dGlXRlR2b2l6ZElvV3lqQkp1TW94V05a?=
 =?utf-8?B?Q2V4czh5Z1B1VGdhUGJBTS9jYnE1YnBPTCt3TnoydWVZSlRMMDE0Nk9zV2NC?=
 =?utf-8?Q?C5Coi7+gRDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snd0L1BkLzNUUHk3ZlZITDl5YTNlVk5kdXlJT2FrWE45NTNzalRBN0x3cEZ1?=
 =?utf-8?B?dEdOdWFaL1hLQVZDVDgwa0FCV2c2LzZqczNtWWEycGwwUFNzRmsxRkVWUks0?=
 =?utf-8?B?R1VWWVJZMXRCRVI5VC9aWk80NTVJL29zV0k5UnVodUhjaUlBRTl0K0RwRDg4?=
 =?utf-8?B?UXcya3dZUWpXb3ZIZWdITGY2V3M5enpjNjhDdTl4czFGSEtqUlNVVVVYdGFS?=
 =?utf-8?B?ZUtWeVA2WTRuYWpwRGlxR2NzdGhGbTZZQjBhb0kwcmlVMksvcER6Ym9iOWF0?=
 =?utf-8?B?c0F4ZU9hQUN1Unc5MnRBNEF1S2hqSWhGRHdLQ01HOXZvYm83YWk4cjF6YjBr?=
 =?utf-8?B?TXliUnUwY0xGNm1hcUE4bjdFY1N1Z1VxVGZSNStjMXd2OTY1eCsvNjJrbFFp?=
 =?utf-8?B?bGRVL0ZZaU1QU2dsTHMyTUFRbS9hRlNsOTRmbjlHdVZ2b2hrQ3h0U2RNUEk4?=
 =?utf-8?B?em00d29RMmRXUjh5SExRZU9EVmZMdm40SmMzaTlDMmVnbGU1UTZKeG5ka3Qy?=
 =?utf-8?B?ZEUrQURyUDRzRzRqNkpMTFFpcVZ4Vyt4VWxtMG5qbXJGMzhsdWtLeng0NEVZ?=
 =?utf-8?B?MTFHaUtMN1F1RUV4Vk9OSDhDUTNtRjNwUTlHaDEwQ1p0M2YrRkxSRllhejBE?=
 =?utf-8?B?RXZpY2VqdXFvYm13VktSY2NYdjlSU0RCb1V6eEswbmE1azFRaFcyeFFmbE9T?=
 =?utf-8?B?MlE3aithMmU5akhuZ1hwVjZra1NXTmNnSEdmSW9wZTJwTzdzV1dwQ0g4OFRj?=
 =?utf-8?B?N2VFVXlqVUZvQXFvK3hHV21uS1d2cndVUmJOOXd3bGErS3VTTW01eklyUUh4?=
 =?utf-8?B?V1BJN0d6a3ZiQjI2eDVjNlFPZnpzeGx0Rlh4bUtZcjgyRnlOYWpWbXFkM1Az?=
 =?utf-8?B?cm41dm52QzNxSWplVnYwQkRmRmRoc2VxcHFMZkt6OWk1YUZMSjkrUTBxU2RH?=
 =?utf-8?B?UHNyWUkydDkzNTNxcU1VODljMEc1MDEvdncvdityTHVXNVlWckY2eUloRDdo?=
 =?utf-8?B?dC9VV1ZjZHVYK1MrUGg1K0R1NUYzKzFQTCt3NkZwUkhOWHJKcnhvUjlyazVF?=
 =?utf-8?B?NFZ4Wm4zdTI2WXVUUk8wVEZGcUUrRUNra2dsT29PaWdIYms5Q0pCMmRXM0tx?=
 =?utf-8?B?eUx4aW1ZMk1WMGVMTnJEWXRJdlJLWWRyT3RGd1ZxSWRnZXdpY1REQ0wweUgv?=
 =?utf-8?B?SGNWOGxucFlEMDFHWUZTNjBPSFlab0NaaEE5ZUYrMHhNTDduRlZ1Slo5cXp2?=
 =?utf-8?B?WXZYbmI0UDJRNFRUNnRFWFZ1RFJpbno2K29QQk9YeTRuYjJjc0FaOTRSOUJo?=
 =?utf-8?B?bXNyYllVd0dhT0IvQ3hjWTBzZ2hKZnM4K0xXbkE5UEJkTE9JSEdaYm1JUmRn?=
 =?utf-8?B?aDd4a3hKd2hwcnY2MVE2Nkc4WENrQ0xwUnBza1RxMmxZcWdGaXFnRjJScHpj?=
 =?utf-8?B?eDBMbmtMN2FMVTdVWm92dzB2eTQvUDI5a0hOTXRVTDNnV0EwRVNjRUVYQkhG?=
 =?utf-8?B?d1dnM1MybFl2Y0NuaE5GL1c5TU9aZ3BYSjlnNzhiVHB5SXBlVUlrWnJNcFp6?=
 =?utf-8?B?czlnTE1pWHZrbVJNRzF0UHFvWUJkbWptNkEwSFpuZm9raVpWeU1PWXRIdU9B?=
 =?utf-8?B?ZUwyTnIwRXhtc3ByNlFWQy8xMVR0N0Q1dkdPYk1aN3ZpVEQzVWVHbjhYSXYy?=
 =?utf-8?B?T2tXWitqQmpsNG1qVVRJUEZvSFR5c0k2M3l2K0Ivd3RmNjA1bC93RnNHOEVI?=
 =?utf-8?B?cXBJWENRMmNlOEZLTGJiZ1FSd21xdEoxcmcrSk1iZjRYSDBGR2kzZncvMG81?=
 =?utf-8?B?MW80RWxmTE01MVFTS045elArNWV1dG9uZXBqMTd1aHUzb2l1RzZCbVVlUmtT?=
 =?utf-8?B?WmtneTEySzdSUHJUVm1MVzhVa1ZvbThjKzZXTWI0SDhFWjBqcng5S2ZRSTNt?=
 =?utf-8?B?T1A2Z2lySm90Rjl2d2oxNVlWTzVkUGEzelU4STZsYWEyZzE1TFV0ZTFyRzNC?=
 =?utf-8?B?R20yNXNPVmd3eldkcmc2RmFyaE9UZjQ2YXdNY3VMbys5SXg1V3NJb2lNdVk0?=
 =?utf-8?B?ZDRvOXkrZjJxOVBWRngrdDc0NndLMGNLa2ZodXgxa2ZPNDZhTk9GMEt3TkF5?=
 =?utf-8?B?OHZzYmtXVENsKzVrZGYzcFA0QUNvWVFFL1dFcS9ZK0tUVFovQlZVK1FXKzc0?=
 =?utf-8?Q?uh9b7psap6fjtdKqo7+YNxo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cfb4cc-1b28-43c5-5dbe-08dd78d02d7f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 08:09:27.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr20/jfMlF/Oh/xQ8laVIKcjsUo2VVYIh470r+7SlvBrKUxmJHzLebuLJUVhS241pqhs9HbcoV9N4FaFWkyMYtvdK6YIu9G8ujBWUdg23DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10136

On 4/9/2025 5:58 PM, Ciprian Marian Costea wrote:
> On 4/9/2025 5:42 PM, Enric Balletbo i Serra wrote:
>> Hi Ciprian,
>>
>>
>> On Wed, Apr 9, 2025 at 4:26 PM Ciprian Marian Costea
>> <ciprianmarian.costea@oss.nxp.com> wrote:
>>>
>>> On 4/9/2025 5:14 PM, Enric Balletbo i Serra wrote:
>>>> Hi Ciprian,
>>>>
>>>> Many thanks for your patch.
>>>>
>>>> On Thu, Apr 3, 2025 at 12:34 PM Ciprian Costea
>>>> <ciprianmarian.costea@oss.nxp.com> wrote:
>>>>>
>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>
>>>>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>>>>
>>>>> RTC tracks clock time during system suspend. It can be a wakeup source
>>>>> for the S32G2/S32G3 SoC based boards.
>>>>>
>>>>> The RTC module from S32G2/S32G3 is not battery-powered and it is 
>>>>> not kept
>>>>> alive during system reset.
>>>>>
>>>>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>>>> Signed-off-by: Ciprian Marian Costea 
>>>>> <ciprianmarian.costea@oss.nxp.com>
>>>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>>>
>>>> I went through the code and it looks good to me, so:
>>>>
>>>> However, I did a basic rtctest selftest in my S32G-VNP-RDB3 board,
>>>> and some tests failed (it shows a small deviation), any idea what
>>>> could be wrong?
>>>>
>>>> This is the output of the test:
>>>>
>>>> # ./rtctest
>>>> TAP version 13
>>>> 1..8
>>>> # Starting 8 tests from 1 test cases.
>>>> #  RUN           rtc.date_read ...
>>>> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:17:49.
>>>> #            OK  rtc.date_read
>>>> ok 1 rtc.date_read
>>>> #  RUN           rtc.date_read_loop ...
>>>> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
>>>> (with 11ms breaks after every read).
>>>> # rtctest.c:151:date_read_loop:Performed 2638 RTC time reads.
>>>> #            OK  rtc.date_read_loop
>>>> ok 2 rtc.date_read_loop
>>>> #  RUN           rtc.uie_read ...
>>>> #            OK  rtc.uie_read
>>>> ok 3 rtc.uie_read
>>>> #  RUN           rtc.uie_select ...
>>>> #            OK  rtc.uie_select
>>>> ok 4 rtc.uie_select
>>>> #  RUN           rtc.alarm_alm_set ...
>>>> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:18:31.
>>>> # rtctest.c:282:alarm_alm_set:data: 1a0
>>>> #            OK  rtc.alarm_alm_set
>>>> ok 5 rtc.alarm_alm_set
>>>> #  RUN           rtc.alarm_wkalm_set ...
>>>> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 
>>>> 00:18:34.
>>>> # rtctest.c:353:alarm_wkalm_set:Expected new (1738023515) == secs 
>>>> (1738023514)
>>>> # alarm_wkalm_set: Test terminated by assertion
>>>> #          FAIL  rtc.alarm_wkalm_set
>>>> not ok 6 rtc.alarm_wkalm_set
>>>> #  RUN           rtc.alarm_alm_set_minute ...
>>>> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:19:00.
>>>> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
>>>> # rtctest.c:420:alarm_alm_set_minute:Expected new (1738023541) == secs
>>>> (1738023540)
>>>> # alarm_alm_set_minute: Test terminated by assertion
>>>> #          FAIL  rtc.alarm_alm_set_minute
>>>> not ok 7 rtc.alarm_alm_set_minute
>>>> #  RUN           rtc.alarm_wkalm_set_minute ...
>>>> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
>>>> 28/01/2025 00:20:00.
>>>> # rtctest.c:483:alarm_wkalm_set_minute:Expected new (1738023601) ==
>>>> secs (1738023600)
>>>> # alarm_wkalm_set_minute: Test terminated by assertion
>>>> #          FAIL  rtc.alarm_wkalm_set_minute
>>>> not ok 8 rtc.alarm_wkalm_set_minute
>>>> # FAILED: 5 / 8 tests passed.
>>>> # Totals: pass:5 fail:3 xfail:0 xpass:0 skip:0 error:0
>>>>
>>>> Best regards,
>>>>     Enric
>>>>
>>>
>>> Hello Enric,
>>>
>>> In order to obtain a better resolution/precision you could try to only
>>> use DIV512 hardware divisor instead of both DIV32 and DIV512.
>>>
>>
>> That makes the tests pass, so I'm wondering if by default you should
>> set DIV512 in platform data instead. With that change you can add my
>>
>> Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>
>>
> 
> This change would decrease the RTC rollover time. Initially indeed only 
> DIV512 was enabled, but during review [1] I've agreed enabling both 
> hardware divisors to increase the RTC rollover time. Personally, I am ok 
> with the current 1 second resolution capability.
> 
> Alexandre Belloni, are you ok with the current version of this driver ? 
> Or should I send a V10 patch in which I enable back only the DIV512 
> divisor in order to increase the RTC precision at the downside of losing 
> rollover time.
> 
> [1] 
> https://lore.kernel.org/all/9f4fc9d8-ec7f-43b4-8bdd-01a4ba4855c5@oss.nxp.com/
> 
> Regards,
> Ciprian
> 

Hello Alexandre,

I just want to make sure this email reaches you with my above question, 
since you were just in CC previously.
Sorry for the inconvenience, I just do not want all the effort invested 
in this driver (development + review) to get lost.


Regards,
Ciprian

>> # ./rtctest
>> TAP version 13
>> 1..8
>> # Starting 8 tests from 1 test cases.
>> #  RUN           rtc.date_read ...
>> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:00:34.
>> #            OK  rtc.date_read
>> ok 1 rtc.date_read
>> #  RUN           rtc.date_read_loop ...
>> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
>> (with 11ms breaks after every read).
>> # rtctest.c:151:date_read_loop:Performed 2656 RTC time reads.
>> #            OK  rtc.date_read_loop
>> ok 2 rtc.date_read_loop
>> #  RUN           rtc.uie_read ...
>> #            OK  rtc.uie_read
>> ok 3 rtc.uie_read
>> #  RUN           rtc.uie_select ...
>> #            OK  rtc.uie_select
>> ok 4 rtc.uie_select
>> #  RUN           rtc.alarm_alm_set ...
>> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:01:14.
>> # rtctest.c:282:alarm_alm_set:data: 1a0
>> #            OK  rtc.alarm_alm_set
>> ok 5 rtc.alarm_alm_set
>> #  RUN           rtc.alarm_wkalm_set ...
>> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 
>> 00:01:17.
>> #            OK  rtc.alarm_wkalm_set
>> ok 6 rtc.alarm_wkalm_set
>> #  RUN           rtc.alarm_alm_set_minute ...
>> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:02:00.
>> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
>> #            OK  rtc.alarm_alm_set_minute
>> ok 7 rtc.alarm_alm_set_minute
>> #  RUN           rtc.alarm_wkalm_set_minute ...
>> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
>> 28/01/2025 00:03:00.
>> #            OK  rtc.alarm_wkalm_set_minute
>> ok 8 rtc.alarm_wkalm_set_minute
>> # PASSED: 8 / 8 tests passed.
>> # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>>
>> Thanks,
>>   Enric
>>
>>> Regards,
>>> Ciprian
>>>
>>>>> ---
>>>>>    drivers/rtc/Kconfig    |  11 ++
>>>>>    drivers/rtc/Makefile   |   1 +
>>>>>    drivers/rtc/rtc-s32g.c | 385 
>>>>> +++++++++++++++++++++++++++++++++++++++++
>>>>>    3 files changed, 397 insertions(+)
>>>>>    create mode 100644 drivers/rtc/rtc-s32g.c
>>>>>
>>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>>> index 0bbbf778ecfa..510dc2db745d 100644
>>>>> --- a/drivers/rtc/Kconfig
>>>>> +++ b/drivers/rtc/Kconfig
>>>>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>>>>             This driver can also be built as a module. If so, the 
>>>>> module
>>>>>             will be called "rtc-amlogic-a4".
>>>>>
>>>>> +config RTC_DRV_S32G
>>>>> +       tristate "RTC driver for S32G2/S32G3 SoCs"
>>>>> +       depends on ARCH_S32 || COMPILE_TEST
>>>>> +       depends on COMMON_CLK
>>>>> +       help
>>>>> +         Say yes to enable RTC driver for platforms based on the
>>>>> +         S32G2/S32G3 SoC family.
>>>>> +
>>>>> +         This RTC module can be used as a wakeup source.
>>>>> +         Please note that it is not battery-powered.
>>>>> +
>>>>>    endif # RTC_CLASS
>>>>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>>>>> index 489b4ab07068..e4b616ecd5ce 100644
>>>>> --- a/drivers/rtc/Makefile
>>>>> +++ b/drivers/rtc/Makefile
>>>>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)        += 
>>>>> rtc-rx8111.o
>>>>>    obj-$(CONFIG_RTC_DRV_RX8581)   += rtc-rx8581.o
>>>>>    obj-$(CONFIG_RTC_DRV_RZN1)     += rtc-rzn1.o
>>>>>    obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)    += rtc-renesas-rtca3.o
>>>>> +obj-$(CONFIG_RTC_DRV_S32G)     += rtc-s32g.o
>>>>>    obj-$(CONFIG_RTC_DRV_S35390A)  += rtc-s35390a.o
>>>>>    obj-$(CONFIG_RTC_DRV_S3C)      += rtc-s3c.o
>>>>>    obj-$(CONFIG_RTC_DRV_S5M)      += rtc-s5m.o
>>>>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>>>>> new file mode 100644
>>>>> index 000000000000..3a0818e972eb
>>>>> --- /dev/null
>>>>> +++ b/drivers/rtc/rtc-s32g.c
>>>>> @@ -0,0 +1,385 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * Copyright 2025 NXP
>>>>> + */
>>>>> +
>>>>> +#include <linux/bitfield.h>
>>>>> +#include <linux/clk.h>
>>>>> +#include <linux/iopoll.h>
>>>>> +#include <linux/of_irq.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/rtc.h>
>>>>> +
>>>>> +#define RTCC_OFFSET    0x4ul
>>>>> +#define RTCS_OFFSET    0x8ul
>>>>> +#define APIVAL_OFFSET  0x10ul
>>>>> +
>>>>> +/* RTCC fields */
>>>>> +#define RTCC_CNTEN                             BIT(31)
>>>>> +#define RTCC_APIEN                             BIT(15)
>>>>> +#define RTCC_APIIE                             BIT(14)
>>>>> +#define RTCC_CLKSEL_MASK               GENMASK(13, 12)
>>>>> +#define RTCC_DIV512EN                  BIT(11)
>>>>> +#define RTCC_DIV32EN                   BIT(10)
>>>>> +
>>>>> +/* RTCS fields */
>>>>> +#define RTCS_INV_API   BIT(17)
>>>>> +#define RTCS_APIF              BIT(13)
>>>>> +
>>>>> +#define APIVAL_MAX_VAL         GENMASK(31, 0)
>>>>> +#define RTC_SYNCH_TIMEOUT      (100 * USEC_PER_MSEC)
>>>>> +
>>>>> +/*
>>>>> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
>>>>> + * should not be used.
>>>>> + */
>>>>> +#define RTC_CLK_SRC1_RESERVED          BIT(1)
>>>>> +
>>>>> +/*
>>>>> + * S32G RTC module has a 512 value and a 32 value hardware frequency
>>>>> + * divisors (DIV512 and DIV32) which could be used to achieve higher
>>>>> + * counter ranges by lowering the RTC frequency.
>>>>> + */
>>>>> +enum {
>>>>> +       DIV1 = 1,
>>>>> +       DIV32 = 32,
>>>>> +       DIV512 = 512,
>>>>> +       DIV512_32 = 16384
>>>>> +};
>>>>> +
>>>>> +static const char *const rtc_clk_src[] = {
>>>>> +       "source0",
>>>>> +       "source1",
>>>>> +       "source2",
>>>>> +       "source3"
>>>>> +};
>>>>> +
>>>>> +struct rtc_priv {
>>>>> +       struct rtc_device *rdev;
>>>>> +       void __iomem *rtc_base;
>>>>> +       struct clk *ipg;
>>>>> +       struct clk *clk_src;
>>>>> +       const struct rtc_soc_data *rtc_data;
>>>>> +       u64 rtc_hz;
>>>>> +       time64_t sleep_sec;
>>>>> +       int irq;
>>>>> +       u32 clk_src_idx;
>>>>> +};
>>>>> +
>>>>> +struct rtc_soc_data {
>>>>> +       u32 clk_div;
>>>>> +       u32 reserved_clk_mask;
>>>>> +};
>>>>> +
>>>>> +static const struct rtc_soc_data rtc_s32g2_data = {
>>>>> +       .clk_div = DIV512_32,
>>>>> +       .reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
>>>>> +};
>>>>> +
>>>>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
>>>>> +{
>>>>> +       struct rtc_priv *priv = platform_get_drvdata(dev);
>>>>> +       u32 status;
>>>>> +
>>>>> +       status = readl(priv->rtc_base + RTCS_OFFSET);
>>>>> +
>>>>> +       if (status & RTCS_APIF) {
>>>>> +               writel(0x0, priv->rtc_base + APIVAL_OFFSET);
>>>>> +               writel(status | RTCS_APIF, priv->rtc_base + 
>>>>> RTCS_OFFSET);
>>>>> +       }
>>>>> +
>>>>> +       rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
>>>>> +
>>>>> +       return IRQ_HANDLED;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * The function is not really getting time from the RTC since the 
>>>>> S32G RTC
>>>>> + * has several limitations. Thus, to setup alarm use system time.
>>>>> + */
>>>>> +static int s32g_rtc_read_time(struct device *dev,
>>>>> +                             struct rtc_time *tm)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +       time64_t sec;
>>>>> +
>>>>> +       if (check_add_overflow(ktime_get_real_seconds(),
>>>>> +                              priv->sleep_sec, &sec))
>>>>> +               return -ERANGE;
>>>>> +
>>>>> +       rtc_time64_to_tm(sec, tm);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_read_alarm(struct device *dev, struct 
>>>>> rtc_wkalrm *alrm)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +       u32 rtcc, rtcs;
>>>>> +
>>>>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>>> +       rtcs = readl(priv->rtc_base + RTCS_OFFSET);
>>>>> +
>>>>> +       alrm->enabled = rtcc & RTCC_APIIE;
>>>>> +       if (alrm->enabled)
>>>>> +               alrm->pending = !(rtcs & RTCS_APIF);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned 
>>>>> int enabled)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +       u32 rtcc;
>>>>> +
>>>>> +       /* RTC API functionality is used both for triggering 
>>>>> interrupts
>>>>> +        * and as a wakeup event. Hence it should always be enabled.
>>>>> +        */
>>>>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_set_alarm(struct device *dev, struct 
>>>>> rtc_wkalrm *alrm)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +       unsigned long long cycles;
>>>>> +       long long t_offset;
>>>>> +       time64_t alrm_time;
>>>>> +       u32 rtcs;
>>>>> +       int ret;
>>>>> +
>>>>> +       alrm_time = rtc_tm_to_time64(&alrm->time);
>>>>> +       t_offset = alrm_time - ktime_get_real_seconds() - 
>>>>> priv->sleep_sec;
>>>>> +       if (t_offset < 0)
>>>>> +               return -ERANGE;
>>>>> +
>>>>> +       cycles = t_offset * priv->rtc_hz;
>>>>> +       if (cycles > APIVAL_MAX_VAL)
>>>>> +               return -ERANGE;
>>>>> +
>>>>> +       /* APIVAL could have been reset from the IRQ handler.
>>>>> +        * Hence, we wait in case there is a synchronization process.
>>>>> +        */
>>>>> +       ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>>>>> +                               0, RTC_SYNCH_TIMEOUT, false, 
>>>>> priv->rtc_base + RTCS_OFFSET);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +
>>>>> +       writel(cycles, priv->rtc_base + APIVAL_OFFSET);
>>>>> +
>>>>> +       return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>>>>> +                               0, RTC_SYNCH_TIMEOUT, false, 
>>>>> priv->rtc_base + RTCS_OFFSET);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Disable the 32-bit free running counter.
>>>>> + * This allows Clock Source and Divisors selection
>>>>> + * to be performed without causing synchronization issues.
>>>>> + */
>>>>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>>>>> +{
>>>>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>>> +
>>>>> +       rtcc &= ~RTCC_CNTEN;
>>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>>> +}
>>>>> +
>>>>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>>>>> +{
>>>>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>>>>> +
>>>>> +       rtcc |= RTCC_CNTEN;
>>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>>> +}
>>>>> +
>>>>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
>>>>> +{
>>>>> +       u32 rtcc;
>>>>> +
>>>>> +       rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
>>>>> +
>>>>> +       switch (priv->rtc_data->clk_div) {
>>>>> +       case DIV512_32:
>>>>> +               rtcc |= RTCC_DIV512EN;
>>>>> +               rtcc |= RTCC_DIV32EN;
>>>>> +               break;
>>>>> +       case DIV512:
>>>>> +               rtcc |= RTCC_DIV512EN;
>>>>> +               break;
>>>>> +       case DIV32:
>>>>> +               rtcc |= RTCC_DIV32EN;
>>>>> +               break;
>>>>> +       case DIV1:
>>>>> +               break;
>>>>> +       default:
>>>>> +               return -EINVAL;
>>>>> +       }
>>>>> +
>>>>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>>>>> +       /*
>>>>> +        * Make sure the CNTEN is 0 before we configure
>>>>> +        * the clock source and dividers.
>>>>> +        */
>>>>> +       s32g_rtc_disable(priv);
>>>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>>>>> +       s32g_rtc_enable(priv);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct rtc_class_ops rtc_ops = {
>>>>> +       .read_time = s32g_rtc_read_time,
>>>>> +       .read_alarm = s32g_rtc_read_alarm,
>>>>> +       .set_alarm = s32g_rtc_set_alarm,
>>>>> +       .alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>>>>> +};
>>>>> +
>>>>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>>>>> +                            struct device *dev)
>>>>> +{
>>>>> +       u32 i;
>>>>> +
>>>>> +       priv->ipg = devm_clk_get_enabled(dev, "ipg");
>>>>> +       if (IS_ERR(priv->ipg))
>>>>> +               return dev_err_probe(dev, PTR_ERR(priv->ipg),
>>>>> +                               "Failed to get 'ipg' clock\n");
>>>>> +
>>>>> +       for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
>>>>> +               if (priv->rtc_data->reserved_clk_mask & BIT(i))
>>>>> +                       return -EOPNOTSUPP;
>>>>> +
>>>>> +               priv->clk_src = devm_clk_get_enabled(dev, 
>>>>> rtc_clk_src[i]);
>>>>> +               if (!IS_ERR(priv->clk_src)) {
>>>>> +                       priv->clk_src_idx = i;
>>>>> +                       break;
>>>>> +               }
>>>>> +       }
>>>>> +
>>>>> +       if (IS_ERR(priv->clk_src))
>>>>> +               return dev_err_probe(dev, PTR_ERR(priv->clk_src),
>>>>> +                               "Failed to get rtc module clock 
>>>>> source\n");
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +       struct device *dev = &pdev->dev;
>>>>> +       struct rtc_priv *priv;
>>>>> +       unsigned long rtc_hz;
>>>>> +       int ret;
>>>>> +
>>>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>>> +       if (!priv)
>>>>> +               return -ENOMEM;
>>>>> +
>>>>> +       priv->rtc_data = of_device_get_match_data(dev);
>>>>> +       if (!priv->rtc_data)
>>>>> +               return -ENODEV;
>>>>> +
>>>>> +       priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>>>>> +       if (IS_ERR(priv->rtc_base))
>>>>> +               return PTR_ERR(priv->rtc_base);
>>>>> +
>>>>> +       device_init_wakeup(dev, true);
>>>>> +
>>>>> +       ret = rtc_clk_dts_setup(priv, dev);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +
>>>>> +       priv->rdev = devm_rtc_allocate_device(dev);
>>>>> +       if (IS_ERR(priv->rdev))
>>>>> +               return PTR_ERR(priv->rdev);
>>>>> +
>>>>> +       ret = rtc_clk_src_setup(priv);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +
>>>>> +       priv->irq = platform_get_irq(pdev, 0);
>>>>> +       if (priv->irq < 0) {
>>>>> +               ret = priv->irq;
>>>>> +               goto disable_rtc;
>>>>> +       }
>>>>> +
>>>>> +       rtc_hz = clk_get_rate(priv->clk_src);
>>>>> +       if (!rtc_hz) {
>>>>> +               dev_err(dev, "Failed to get RTC frequency\n");
>>>>> +               ret = -EINVAL;
>>>>> +               goto disable_rtc;
>>>>> +       }
>>>>> +
>>>>> +       priv->rtc_hz = DIV_ROUND_UP(rtc_hz, priv->rtc_data->clk_div);
>>>>> +
>>>>> +       platform_set_drvdata(pdev, priv);
>>>>> +       priv->rdev->ops = &rtc_ops;
>>>>> +
>>>>> +       ret = devm_request_irq(dev, priv->irq,
>>>>> +                              s32g_rtc_handler, 0, dev_name(dev), 
>>>>> pdev);
>>>>> +       if (ret) {
>>>>> +               dev_err(dev, "Request interrupt %d failed, error: 
>>>>> %d\n",
>>>>> +                       priv->irq, ret);
>>>>> +               goto disable_rtc;
>>>>> +       }
>>>>> +
>>>>> +       ret = devm_rtc_register_device(priv->rdev);
>>>>> +       if (ret)
>>>>> +               goto disable_rtc;
>>>>> +
>>>>> +       return 0;
>>>>> +
>>>>> +disable_rtc:
>>>>> +       s32g_rtc_disable(priv);
>>>>> +       return ret;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_suspend(struct device *dev)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +       u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>>>>> +
>>>>> +       if (check_add_overflow(priv->sleep_sec, div64_u64(apival, 
>>>>> priv->rtc_hz),
>>>>> +                              &priv->sleep_sec)) {
>>>>> +               dev_warn(dev, "Overflow on sleep cycles occurred. 
>>>>> Resetting to 0.\n");
>>>>> +               priv->sleep_sec = 0;
>>>>> +       }
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int s32g_rtc_resume(struct device *dev)
>>>>> +{
>>>>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>>>>> +
>>>>> +       /* The transition from resume to run is a reset event.
>>>>> +        * This leads to the RTC registers being reset after resume 
>>>>> from
>>>>> +        * suspend. It is uncommon, but this behaviour has been 
>>>>> observed
>>>>> +        * on S32G RTC after issuing a Suspend to RAM operation.
>>>>> +        * Thus, reconfigure RTC registers on the resume path.
>>>>> +        */
>>>>> +       return rtc_clk_src_setup(priv);
>>>>> +}
>>>>> +
>>>>> +static const struct of_device_id rtc_dt_ids[] = {
>>>>> +       { .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>>>>> +       { /* sentinel */ },
>>>>> +};
>>>>> +
>>>>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>>>>> +                        s32g_rtc_suspend, s32g_rtc_resume);
>>>>> +
>>>>> +static struct platform_driver s32g_rtc_driver = {
>>>>> +       .driver = {
>>>>> +               .name = "s32g-rtc",
>>>>> +               .pm = pm_sleep_ptr(&s32g_rtc_pm_ops),
>>>>> +               .of_match_table = rtc_dt_ids,
>>>>> +       },
>>>>> +       .probe = s32g_rtc_probe,
>>>>> +};
>>>>> +module_platform_driver(s32g_rtc_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("NXP");
>>>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>>>>> +MODULE_LICENSE("GPL");
>>>>> -- 
>>>>> 2.45.2
>>>>>
>>>>
>>>
>>
> 


