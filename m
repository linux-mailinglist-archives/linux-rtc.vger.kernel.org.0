Return-Path: <linux-rtc+bounces-1962-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701A9768E5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070EE1F2136B
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358BD13D503;
	Thu, 12 Sep 2024 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BRSBhdzh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72510FF;
	Thu, 12 Sep 2024 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143421; cv=fail; b=fcw9xJtesof0WqTzfUM+XeKm20IlrZJmmJnueMk0FE3s/yqV4KeIKbqky79xZz+8caicXL+5Zsm6m6OClHPUzeK4idpdqkeH/ceDHhS02xtrBvk1QSOF2qYZBZMb3lPm0uXi+/b27LygIM7s1qnOzE/J3sX40OyNDz5DEyQZtv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143421; c=relaxed/simple;
	bh=pE5I0gwMsLgqzrYEI5Qk+Agd2Y51t3vXWQFkyROZguc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SUKgFL1HOhcH9fH8APL9Net6IAnfgSPEWQP/mwUzs3ocgGTdgs4qzX/6GOSRZVzAkiKQh3UY4uFg2aC++hwEe6MGX6W9e2c7Bn+VxKhKNx63O5s+6PYkA8ep7BFtjggzJTazdlSDgzaCnMC/C1CctoQ0CoCX0l2mlgciEKUaAuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BRSBhdzh; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC+o52/tmQpninwGm+vmnyg6uAC8rOrMlSd8OSUSJGB3mwh0hLYkmLi5F67h4Bsb0gFgZ+JnyVpuBO6FHeqp4jBXRpQFHzsJ0ZhiqBSqoXX7/42vc6GW716SSInWD7OGJStva4Q7JZTsKnaOHvroOdxC8aUmnFvPF8m4m1B5T0NyHD2uD60udnVjFn3WbBPhOjcf9NoD6E52ykK2thHF7g7hDUFRZw0b9+akk9+sIzy2HJNgy0qxlOEEtKSJ6tdsHq/nl5Wbq7B4DIxUp7rmS0M4YgxNbrk22mdz8/yX24GmAJF5R+E8D1/fhpoefLt1pHei/e8MFlFmae1LDIsANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZX8ryptQZSohMs8v+aXs4ybm72hUgyKTaf82fFdkaw=;
 b=cUOXApXpHarsGjqW5LAXCmpgiSzU/htcvKMuv/yY+0KFqfLA7k6B7w2nx3ZGM+bV1D8ahyrX3pommO6BvciEJXi1aoHNhtM3vjbTGF5lxGLzADi7Q9HznIyCPo6C9UR93li98PlnRo5kz7A32jlsn7ytVeKtdOGCFPIGhBrl7QPs/1bzrDHdP1kYzXqh76qXx2drPyiFeLOMfpZdJZjwuccI2/EpQUvxq9FFUa71PGrf5KiNa3tZvQUX5Xso4LzykkSrhHUiGAUfi4ir7CPxv+0AES7gZvYcmTxU/GLFitzFD8UDtZMsFyKBpZeTvYXW2s4LytiDag/Xhbo10VB/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZX8ryptQZSohMs8v+aXs4ybm72hUgyKTaf82fFdkaw=;
 b=BRSBhdzhLAwB2ZqulTUtDKHwdhzHPJaw4VOcK1IzEyFHDvRCvn0CsKOoikF/r3IU9RcJdv4TC3BfbtGLnXa8LcXzK4uTXygF+Me0/U7m6h4dVf9gp73xzeOnTWcqJ3MOj58VryysQpGikeqGV1L8qOv1HhoxvIBK9H3sqTqr8s29QwrTBcfkjwClfA4d6tpGNWwnTEcCkeXk01c9GTYVXUAaMNQcyjtxhr8mhCIl6H+xCqe/NMpm7Hm/dMYzYynhHvi12nkI5ZDYzIpUPHbkdQOMUQOG6ss+ZQx+HMRGgNzLI1KrSMHFadqezzW36Kjm1TLomy1e3LgbEZ9MnpMYhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10865.eurprd04.prod.outlook.com (2603:10a6:102:48a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 12:16:55 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 12:16:49 +0000
Message-ID: <63e83303-1bb8-44b4-b271-9052fbfd41e4@oss.nxp.com>
Date: Thu, 12 Sep 2024 15:16:37 +0300
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
 <f6c4a4b4-d05d-40e1-8ecd-45df7cc21ebd@oss.nxp.com>
 <20240912-trodden-lens-1dbf15786960@wendy>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20240912-trodden-lens-1dbf15786960@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::29) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 382b0747-56ba-43bc-7e7f-08dcd324c731
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3RTbUloS3ZzUytHeDNTYUIybkVROXlJZXVyanBLUmFhVm53aStsZjJSQnNW?=
 =?utf-8?B?a3BncVBEWTQraldtMGQzVVdnaDF2MmllQW0rWFp4MHYyenJwbVBWQ1BZTXly?=
 =?utf-8?B?YUVwRG1pYnJGSGpaU1dzWC9zdkgvUjl2L0dWelZkSGtyZTNFTEE4MG1vVHB6?=
 =?utf-8?B?UmtlK2JtdWM1VGVqYkZwMlpkVGNLMmE2TDVzR2dUdTJ5VS9vTGZSazF2YVEx?=
 =?utf-8?B?SjkwOVBzekIweFZJdWpHRENYQ09teHR1ZjExbm5IM1NRcVNKbUx0aXZGRVlK?=
 =?utf-8?B?NTBCaGZHcUREY01zTDVZMzNMR05mcVozRVNnejJGWGFPbnhyajJxUGlDUGli?=
 =?utf-8?B?NUtOMFpTU1RsQW0wbDNJMzNzWUgxdkJwd0U1ZmhpTHVVNmlRRW5ORkN2bysz?=
 =?utf-8?B?WHR1OWVBaTRVeUM0dHF1dDFvWEkvYSs3Z2NoRjlQMWVMcmRkNHFUQlFwbUlE?=
 =?utf-8?B?ZEJZbmVSY0Zod1VkZjllZ2ZvZlJST2ZqbXBkczhQVUlLVkx4NDQ5eU5SMVZS?=
 =?utf-8?B?SkRsYk1lWDg0Zzg2eHZDWExMV0Q5VmpkaVptMUwxamJJY0R3Y1llcjJFaW5p?=
 =?utf-8?B?YjRMRk0yWXFOK3Z6QVZnUzBvYk8vWEV2QWxNTzRka0piWXF3bGhUUkNNUkhw?=
 =?utf-8?B?Mm5Wa2pRVEZpR0FQSTcwTGlDTGJRbHpxNXEwVmVBNXlZWnhpODBvN2tmYUlS?=
 =?utf-8?B?UHB6elB5Y0Z0UzJQd1VlNnBOblJoWWZKK0pneHNFc080ZEJLbEwxeFNmWnZW?=
 =?utf-8?B?WVJuNnJXaFAweHRybHJET2NBVzRFN0RDV3RBWUdvenJ3YWJoN1RWMXVXeFhn?=
 =?utf-8?B?QkxuZGY3SEx6TkNJbDk4SWJ0cEZBdkxzZEFyRzFWRkNtTDhFcWxaeUFaUjAr?=
 =?utf-8?B?M3REMCtld2tQWVVpRXB6cnZ6VnUrYnV4MzdubmlPWm1zV1pPTlpNTFBkMFJX?=
 =?utf-8?B?TXJjSU5wS2NzaDc4WlJSb2F0UzZtZGFrWFJzWTA3a0dIOTl3elB3TXpxMk1h?=
 =?utf-8?B?dTg1NXpGSUtPU0l2emhYd0V5Q2hpN2Q2WHRWQ1hIQnVpdklxeWpMaVM1bUo5?=
 =?utf-8?B?cFlXNjBQZHRFNnRHWjFvT2pkNytTdUhCc1RLSFJLUlpLZ2hIOUJjQjVIdzFS?=
 =?utf-8?B?Mm15VERRUFpZMzZpdm9yZjB1ZDR5R1V6allVTWhUeUdiRFhTOC81d3NZMmxU?=
 =?utf-8?B?SFh1dW15L29jdWhvbmhHc2hFUUYxY0E5T3pIVG5qWEpZOXZrNEptSG1RSXN3?=
 =?utf-8?B?NGFVNGdIa1VuT1NNWnA0WWFjYmZIREhkS0F3bFhaWGliOEdHcjVmWlFpN3RO?=
 =?utf-8?B?WnJYa1BGTzV5anJUTlZ5azlpejhQU3VWRGpDbEdGSUpZSmhWME9FTHlKM0Fr?=
 =?utf-8?B?U3daTHFpaTE2TEhEZTl3TTgrN2RTeTdvQ25ZUFk2cjdZajBhVmRYUnlGT0Q2?=
 =?utf-8?B?WFNpazVCQjROZjVHWDVrZmY2djJRMGd6YWg4TWgyVmpEcGg3N3N2MnRZNVlT?=
 =?utf-8?B?M1hYK2xHbDdEMWlnVVRoNGx3bzJKclhQbHRDVjhRZXZ3cVpEWkJkMVFUVUhD?=
 =?utf-8?B?SlZyMFgzeGRlZStNRzF0ZldudTBWVnpGdzdsZkFZOFdtbytWTFlXMDlBR0sy?=
 =?utf-8?B?QWNLUUV3Vk44c1BlRmhQMnlKQlhaaXVHaHFmR0lZTmVpLytyeHpUdFpPZ2Rp?=
 =?utf-8?B?VWxwWkVKUWxGZFBVNFhwdUJDY0hUL3dMYzZJRVRBUVNlaEFET2ZwUFYrU010?=
 =?utf-8?B?NnhtRThEWVJlVXhDKzJFVVVsZnZveFduWVBRN3pqOWcwU0laSFozbEQzTWNF?=
 =?utf-8?B?a2pEMml6RVVnRzlicUg1QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVEc2ErU0V0TE9uaVJCKzNwd3ZRbU5WMSt4NnZvUHZER3lDTWxnYndXcytT?=
 =?utf-8?B?T2JvbkNjcGg2bTZwV2FkQ2pCVktQUTBML3hJTGdqd0lOUW9NbFdSajRXNXQ3?=
 =?utf-8?B?MElWRG9SOXFBT1Z4NEhTejFNaHdRRDI0WFZjYXp0QWp1cjk3QlpmUi9pM2Fy?=
 =?utf-8?B?cmlFcXlpUUlScEE4ZkNDZWluZlJIdFpuMDBRSCtLSmtwOGJmbnFoS2JTVnNj?=
 =?utf-8?B?TTdwdk9ISUVKNG1aYXJaMER5MDR5RVFVRDArMy9sWGlKQ2UyQTZ2aTdCclcy?=
 =?utf-8?B?ZFlyeHJrK1BnZGFIbFkyQjV2ZlIxRUxRSEJ6L1VOdStzYXNEZXRDcHJCR2Fv?=
 =?utf-8?B?dHFaQ0lpc2VWb2p6eFFzNTd3UzdJVU5lWCt3dmVkUEdNeTRORTkrcXFpelN2?=
 =?utf-8?B?czhtMnJoTVFucXR0ZVhPcnNPN2RwaUpTdDF2U2dJVGhwOHZSZnp4dG9Wcktt?=
 =?utf-8?B?dE95bDh4V3hRZ0JvSUFVN25MOE9kd2NxT3UzalpCNVpvbWhCMUIzS2c0MlBX?=
 =?utf-8?B?ZlEySjRyQ0h0UHN0SU5JWjN6UmhWMnJNVXY3VEpCa29ORWZkRDEyRVFuVTJh?=
 =?utf-8?B?NkF1anQvQjUxM29FMEhuUmxOUmhXQVpkYS95ZVE1NHd4S1Jab1FEUkVYQVp6?=
 =?utf-8?B?TVUwbGQ3RDZZUDRVbThUdGF0U1FSWUNKR01wcDB5UzVyK0VhUTB2c0x2WFI4?=
 =?utf-8?B?aE9nZE1VeTljbFE3dndnWEdIQjJHNkZkVFZFMkJCb205eWgzbGZBYVJpTEM3?=
 =?utf-8?B?TjFIeHp3VFFOalhibE5rUEJpaURKZkN4ejRaaHczNDdQc1k4R0ZzMXZUUG1h?=
 =?utf-8?B?b1NtVkQ4WTZjdFhzeUNWRHFkSDRxdVBsM1VCRVRINTNkNVZ5VjJwYW95Qi8z?=
 =?utf-8?B?T1VjQjJxUzdPNjB5eERxd0FVK0QxWEJKRy90RGdya1cvVUV5WmJqVnhFY0Fx?=
 =?utf-8?B?MHRLay9LMWRwSVpIamNreDFYTHZGNFBOQ2IyRkhKRXp6dG9lbEpiamlNMG40?=
 =?utf-8?B?bDRGaURMWEMvTXBOYnhMOWJQVmNWUnZmSUUwMHRaVGduTEdwdFFidkhWdFJH?=
 =?utf-8?B?T0Q4RTFONkJacnJqQzdBVVVUVGFnYXUrRTlaVkEwNTZKWmt5bm5sbGRCdlQw?=
 =?utf-8?B?Y0dtdHdKeFFsTndlRmZ1YUF3ampYbTJadWRxejNEWlNIUzAwbVFKRjBERm4x?=
 =?utf-8?B?ckZIcFVtZG8wN1M1Z0lya2sxZC9NYW85Z1ljK1F6Njg3dytvM3VIZ09lSmZm?=
 =?utf-8?B?eWFlMXFSaGFoTExtQ05oYW1hM3hqYWlCZEJuMzlQcm9vVVY5TUU2VlFmQ1pk?=
 =?utf-8?B?d3hhYUkwSFhBMXBZZVVSZ01aNDBEaU1XV3VVRklucTV2VkxXdHpuMHlwM1lr?=
 =?utf-8?B?ZWNkRDhBRGhhYTRNVlhXNjJOQ1cwQmxWcjVHQzYwMFpPczhyRHZkMjJ3a0g5?=
 =?utf-8?B?akpWdDBYNUVRU1Q0UFlnbFFZMTBPZkVkNGh1T2xORDBRclVSbTRXaGZrNFZ0?=
 =?utf-8?B?VFJiTExDMjIydmtGNHF4dWJQeVp1eGRJRmpCeHB1Ylp2Umo0NlduQVJUK29Z?=
 =?utf-8?B?eHhXRlNFVXBCdWpMaGdHcG1sQ01HRzg4aDV2d2pIei9wbGdvbmxVWW1VMk5Q?=
 =?utf-8?B?ZVVEbjQ3MzdQekY1aFFNMzVqdVVlVmpKZlhOR0xuS3J4YXNoNXNRSE1CMVBt?=
 =?utf-8?B?OFdOVmJIWkJkS2hUdU5KMGZDTkJYaWIwK1R5Wkg4Z25jNHM2RTZ3Y00zcjBx?=
 =?utf-8?B?RTVvRm5FRjVkN3NselF1dVJMdDhIZEdqNERJeWxIcmZiU0hBVHM3dUZzeC9D?=
 =?utf-8?B?YkVCNEp6YlovUlcwT2VZNzRuMktNVzFhM3YxNk43MGNzY1ZpVkZ3cTNJY054?=
 =?utf-8?B?KzBYQ2hlcHJOTDg2K3BYZmZXd01WeWxZOXJoN3Z2MzJrdEFQa0VNMDB5bnpi?=
 =?utf-8?B?ZEdLSmgwS3BGSEgwMWdaTGMveDVBNlAwazNaSXNoSHI0N2xCclNIQkxDYjRH?=
 =?utf-8?B?NVZlY0t4dUhNZnpGNTI5a2l3WnMweGxIK01zQ2s2bTJrSFI3VUlqYUw3VFNN?=
 =?utf-8?B?MUhya2pRWEFJMEJ4OXAyc0QwWC9hY3QzaHg2eVJBK3NQcnFSWGg3TjNrQllY?=
 =?utf-8?B?R1h3aFNHWi83Y24rcDVzWnR2ODZOTC9wZytyejcyUVc3RTdYTSsyajA0OUZq?=
 =?utf-8?Q?1OpA3D799FEJniWU4IWQ55M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382b0747-56ba-43bc-7e7f-08dcd324c731
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 12:16:49.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBXYXgpy4TkerGeG1/qmGgioTGVHVSeDqheJy4PBGxuPgKkfS6GevvDOpGqT8EbqlwkW3JPdCG3Bx79L1deN62W2SnMBssa9rKt44AQVQIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10865

On 9/12/2024 3:12 PM, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 03:00:20PM +0300, Ciprian Marian Costea wrote:
>> On 9/12/2024 2:13 PM, Conor Dooley wrote:
>>> On Thu, Sep 12, 2024 at 01:55:34PM +0300, Ciprian Marian Costea wrote:
>>>> On 9/11/2024 9:22 PM, Conor Dooley wrote:
>>>>> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>>
>>>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>>>
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: nxp,s32g-rtc
>>>>>
>>>>> Also, how come there are not specific compatibles for the two SoCs
>>>>> supported here?
>>>>
>>>> The RTC module is the same for S32G2 and S32G3 SoCs.
>>>> Therefore, I did not wanted to add two compatible strings ('nxp,s32g2-rtc'
>>>> and 'nxp,s32g3-rtc') when there is no actual difference which they could
>>>> target.
>>>
>>> Are these different fusings of the same silicon, or are they distinctly
>>> different SoCs that happen to share an IP block?
>>>
>>
>> S32G2 and S32G3 are different SoCs that share the RTC IP block.
> 
> In that case, I'd expect there to be two compatibles, one for each SoC.
> One can then fall back to the other, so the driver only has to be aware
> of one compatible. Had they been different fusings of the same silicon,
> thus sharing the same integration etc, a generic compatible would have
> been fine.

I understand your point. I will update accordingly in V2 of this patchset.

