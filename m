Return-Path: <linux-rtc+bounces-2019-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0297B8EF
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 10:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8C41F212DE
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8C9166F3D;
	Wed, 18 Sep 2024 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QS3ujdQF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B7F34CDD;
	Wed, 18 Sep 2024 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726646597; cv=fail; b=cPh04NlJhgFDAyDJi/ev5Nh/aG7g4IlF1BC1ceRpKYbCGG9t/+JYbA5u9Ea2c3hAR/wWtqiiZbEhTpROPkbswdCY5jzPmqQS2QGg5j/lVrOF0E4MfLrYHevOSXqQ/uJxU66uJ3BU+P72fgS3tD07YW5BmwTlVGe450CRU7Uf5v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726646597; c=relaxed/simple;
	bh=rm0FQdf7H56TGSSI2f6AP4QBobdfPE+m4N9KkhN/VHc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ciBSq+42PoC+VF6E48i00awh5IeFDNLfbgYYQIu2S/OgEXLmmNUZUNsxhgoUn7pdT871HPJZKWfbccTSgJCFqXDLDSR3/zvBo70x4PyT2q/FVs5Icw/VKTyVQSCufA2CKFlAyDrFqfuCAWfGMJ/jRTlxd6B8Pw3ZmFD52kIbPD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QS3ujdQF; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp52E+F068H2Frz+tC3z6TahOOr6zvoPIbo3M/4PKCYNxV2O2XlCte1VgXa/u6cwRfsDZ37FWMwfaANhpD/NxaF60LraIgwa7d/rgE3VGPDsSRPxFwnCDFfm7e+rzIO/FX9gWGjKezJ0J3THcEpEgh/rvaMUgtiQJqLgDQSqeF5d/CXeNaxh0B5uTVMMNU7Abxj/hKIjL6dEDHPUjSJ1xnXnJ1q4IT+m6aGSHKJo++XTMAes354vUPIRAEFtIccFq58ZVr9sE3rJzrvyQTUfDARf+aqJ8KKRe2vjZ+/JpraKewKr1GwFlMBJCCKPTfYwhim0Lw4+EFCqJYKIVREjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvIT4gCbtwLCx73B1CU2OJ0Fb4cfrTSudUw4eE5MOqg=;
 b=SmCLzGLjMyOQARX08ubpszSzsmlT1Y+n8jCtPlZ/cbh7108VWrriEV97zRNfw8G41u1Gkv21+9D4ArBFe8ET2qsCd5LQgqTFfQ1HPEa+IlwZy2WnoSJjTe6J7HwzQPWlCl3AFTzAQmpZX7WHyusgX9zkxMWp16j9Pjt5z/Jr9yNCMRLUOpBffuV3YPqo1giUfevpFUxLsnBxb4NPIp2hSyDrjvVfvelB5CxWJqkb68VE5lk5V92GcLy3QkAUWA0qyvhHhK3xr1hHRrVx0ytIzkjLUc82qSPMIuFzzPtEQSBfkpDgQi0YAB8LGVQhgsdQ6G1/5ahuSHVZdSPOCDUMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvIT4gCbtwLCx73B1CU2OJ0Fb4cfrTSudUw4eE5MOqg=;
 b=QS3ujdQFhceCPr0nxRdvmEDzlRVoKIxaAY/7iNUWSBhEVWaC4gUW62MPXE1eD7NH5XDSE/Fp2i0pasmfuvZHqgMrj0IuwIC2dtFA2hfexzE8n4kTuUR40i8AvEFkc+7jUXC+AFW96fQQS5TXjwc07BW2B/yxcAG8V1BVSvi261uil9pQ9c5eymHc0l5VHlsdE0PGsg4pS0FgZ2LJWDgmD1Bd1vuqDyctgHr2I25LGwTYPAVOITmbOzyjR/Au1x16UbUG49KOu1stVvOOSHLA3YYOfIxj7HU7pmJSA3tKQnmAqqrfT5XMd0SWh+C5elHFE3wHFTM4aln1pWTYhL17HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 08:03:12 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:03:11 +0000
Message-ID: <1dffa158-0608-4480-9281-3b891acc8c6b@oss.nxp.com>
Date: Wed, 18 Sep 2024 11:02:45 +0300
User-Agent: Mozilla Thunderbird
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH 3/4] arm64: defconfig: add S32G RTC module support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-4-ciprianmarian.costea@oss.nxp.com>
 <f39900f0-f99a-4a31-88bc-13d459392ffc@kernel.org>
Content-Language: en-US
In-Reply-To: <f39900f0-f99a-4a31-88bc-13d459392ffc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::6) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b00382e-844f-4124-1538-08dcd7b85742
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk9wRUNpMEFIZWMzZ05FL1JIZWJrb0tybGxGb25Qa1c5ZzhjKzgrUStoZXdO?=
 =?utf-8?B?VUxLQVRqc1g2T3JvQmFrUW1xR1hxcTdFZ0pnV3R6ZzE5R1hTSWlwUVhQSGdk?=
 =?utf-8?B?bFpYc0dqbSs3YVM2aU04cDNrUk9sNzc2S3FQNVN5WFM3MjA1TzFiZXMxa2la?=
 =?utf-8?B?N091YnBoS1h0NW5OVEM1UlA2NmsyV3NwOGx6Y2IrRFVZUXM3d0k4TzZyUkdS?=
 =?utf-8?B?WSt6YnJlNng3ZTBQUzNna3V6eFJOblFhK1lNVlc1NGJkVmFtZ1RDR2RjWWdu?=
 =?utf-8?B?NHIwaHY2dWlSd2ZrUnB2S1c2UkZ6bzE2SWVybVZ0ZVI2R2VvVEw3dWNRNktm?=
 =?utf-8?B?TWwrQ1pVT1JXZkFBQjRIVzUyaGd6U1dTdnZKRkRwSU1va3dnQmRqTzQ1MlBj?=
 =?utf-8?B?dmF3c25Ib3RnRHpCcVR4bkVCYngzVFJHeFdlQzR3L2RLU291U3V1UmxVekxm?=
 =?utf-8?B?UnpjTURiaEtGaUZXVlhhSm5oVVNLK05FL3Z0dEhObEtqdGd1THpUWUtVRzVI?=
 =?utf-8?B?UnlkVEphSDh0eEZZeThuczUwTmt5Ui85enlIMUlvakZ1eVFzcWlGY0xSNnVL?=
 =?utf-8?B?MXhpN0VJQk82TjVYU0tzbTFzZ1dJQlY5SFRVNEFmeXpVQ3lRQzZETy9BazR4?=
 =?utf-8?B?TmIzQ1Zmck92RndBZGNZYWRsSlY3ZFd3SHpGOE5abEN2OWRUbVZjcWtLRWNC?=
 =?utf-8?B?MEszeVByZlpZbFZMZTBzLzc3cmlQdXc3amVNOGFEUitIY3UxK1U4eEZvSnNB?=
 =?utf-8?B?YnlwSGJQT1liRFZSK3l1MFBEK3htWHJwNVpqSDNxaUZzWGgwL0tIUXV3MkxT?=
 =?utf-8?B?bGVtQzI2SkJwTWNsV0JldUhPMlhUMXl6NjgrTzJXNVgzY01TMnJ4UXRlVmRv?=
 =?utf-8?B?VHErVit1Zjd1M1BtcXhKZmRNa084TmFvRGR3N3laUWlhamtqZFNxRjhkTmx0?=
 =?utf-8?B?YWtaLzdoMVB4dmU3Z1VpOGYweGgzeTl1dkppczNoWE9oUEx5VnVnUkJTV1pU?=
 =?utf-8?B?bXFYU0J0d0huTlJNcnVoRUVORkQ5Ym1PclFlQW5GTWlaeHd1TjJYVitlbE9w?=
 =?utf-8?B?eWVXTi9QeVp1S1YzaHI2ZzdqSVVsOU0yREpPZHNVSXF2aVZOV2lMb0xpU0VR?=
 =?utf-8?B?Rkp6Mys0dkxxUXlvQlJUbHh3VURlZitWWTZCOFVGckwxak84MUFrWjY5dElW?=
 =?utf-8?B?SG5jOGZ5QzBNZkg1cXEvblZ1WjJTbW8wa3cyT0Ftd1k4bElGUVZkLytQeFB1?=
 =?utf-8?B?SGtVWVdxdWowV3BxRzFLWVpUaG91Q2txOHAvVXBxMXliUWlvcFdlQ1B6QUxF?=
 =?utf-8?B?QXhLWlhEZW53bEF3eVlRMUgvRGZMcERVNXV2K2JTd3NyZTNzSUZ6Uy95NWRx?=
 =?utf-8?B?ZzVGK29OMXcvSW5MeVVqSitTdWRYa21HUHl2SDd4cWhZaGRHdTVRb00vSENy?=
 =?utf-8?B?bDNmYW1WK3hiKzl1cTJxQ1htS21yQ29aclRMcGx5OEdiTTBNMXAvRW5oOXJ5?=
 =?utf-8?B?MUVyaXY2VFZrQ2FYMkdwT3EvdmZWblRrVlVPY1FxQ2J6WXloSVV0bWcwVkdr?=
 =?utf-8?B?YWxJeEZ4RVUxQkNoUkZIMHNkZDhZNU5YcXpWSnZydHZtcUlVeDFTV3R1L041?=
 =?utf-8?B?WGptMmhEbEthOHc2MWFMV2F6amlzNEYwdDNaamVFY0oxWFA0b2Q5WWdqZ3dh?=
 =?utf-8?B?bEF1NHd5NW10RjNPdVlBVTljakxEMzAraW1TMXV2TUVLT0FGU2FGMnlDVEJ2?=
 =?utf-8?B?SlZCdnVoRHFacERCY3VuQzNBN1VEM1Y3VWIrYktORzVRRTVrV3VaNjVkbFdV?=
 =?utf-8?B?TFlDZHRKRWFGclJNZ1BTQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3kydFVVbFdKSERiTXB5d2N3Mjk5cVY1b0dBRmExRWNjWEM1MHdrTmtPMFEx?=
 =?utf-8?B?dXhDVThTM3NpVkd4cDJCUVNvYXVuT3NDQk5XV21IbTA2cXJjUDlKMFM5QmFR?=
 =?utf-8?B?ZVdtSVVBSHFwdThVRStHMjQrVzlXUk9BSHp4RjBtV25ZRVEzcE1VTmFZczVT?=
 =?utf-8?B?K256bUJiMnBvZkg0Vm9ybmwvdzJpeFA5aUdDN1VMSFNORy9neHN6UjZKRVpx?=
 =?utf-8?B?SUo3TGF2OVJmM0VOZFNmd1J4eVZ1dHBQRzVid0k0N01lR3pzUzQ1c0IvOElq?=
 =?utf-8?B?U2EvZ1Y3VU9GOFlndTdzSVRzUjh2UTJOY04rWTV4bnRPdUM5NGVDZ1YzMmJB?=
 =?utf-8?B?bzd4Zmd4cU1CZzlrQkJwamIza1ZIRFJMaDNiR3JnMiswd0NIRXExeFBHeGhY?=
 =?utf-8?B?VmNkMmQvbytDaHNqNTV5dnppYUVETVZZVlVFRTgxcUhxNnAxQXllb3ZMa0kz?=
 =?utf-8?B?MEc5UXpKUERhSHY2YWVLOE9DVUhCdkdLTVZ1bFBEeTFoT0s2ejFvcjlRa2V4?=
 =?utf-8?B?bU9USjdKN0lVVkJFSHBJcEhoeGpBbDRIWVFRT2o1aU9ZMXFaL3JZWGMrNmts?=
 =?utf-8?B?U0dqQ3Fia2dEMkdTZDFWQnZwcTRVdVJubkRHcXhNTkZhVzZGNFRhb1liZEw0?=
 =?utf-8?B?NVNYekFRdEVScWNPTTBsSlg2SVBpOE5Wd0dVNEdZY2g5MGFOVm1TZWhxWnVu?=
 =?utf-8?B?TXRyOTlKaVJoR0pEQTZjbWFodzBiZXpUTG94N3NZbFJpWldpd3BodWFndWdq?=
 =?utf-8?B?YUdTL1F5aTE4b1R3b3BSek9KOTNROG1RbERNN1lnNTJFVFhIN29aUDJGQVZo?=
 =?utf-8?B?MUdNT1M4eXhEcTIveWRweWw4bEt4NlZiRS80dFNBL1paMXZWZjRud2gwTHly?=
 =?utf-8?B?cEhURjFtbXV4ZGZnL3B2Y2lKblN5cnI4ZGRNU2U4bW1jQjRJaGJtUU9jSEpo?=
 =?utf-8?B?QW9OdHZpdm03SXIzVndKNFRVSWZUQkxIOG1ubjJ0Q09jb3J0RWhTSGoxK2U5?=
 =?utf-8?B?VndKb1JSOHdaRUdkZU5nSXNMcHBiN2xXM0NaNFpubDBFV3c2bEluNWZXNFBZ?=
 =?utf-8?B?V3RzNTZaK1ZlRFJLMFNnS3RncjFvNldDK0lzL0hxTHBUQi94dVprOFRmOFNm?=
 =?utf-8?B?UmhWaGlsbDBoRUNuSEZOZ1NBckxtd3ZmbVJmZVoyWitmeFFBZGUzZHlDZGs2?=
 =?utf-8?B?bS9PSytXZjBOc3J2UlpNUUMrOHNUdnFiWC9aNkxlYWxUOC9VWFR5eUx3RjlB?=
 =?utf-8?B?SUwvM1UwV2hDYysxU3ZaQ3ZvTnZETVY2QldwTUVtK2xUZk1NWlQwZTUyYVda?=
 =?utf-8?B?MnBrRkcrVHlzY2Mza2hTdTY2SDlFWnBzUHN0M2s4OWxNRWFlTGp4aE41S2lh?=
 =?utf-8?B?clRTRmNrRWU0ZTB2bUN3WkRVS1JySDgzRWIwekI2dUFGYmg2Y0dnSzVNaTI2?=
 =?utf-8?B?bE1FNGNoalRvZ21hb1JpQ0dVak9DUEl0YnZSenJOaGl2cHRHWTkwRTNOT2pJ?=
 =?utf-8?B?WHh1QWtDdGVmQWFjc1pLaEl3N0J3T3ZDc0J5dk1rTzhQTjZXOTljeXlJelJT?=
 =?utf-8?B?MUhXY0FSQUlmRUtZczdTaFBmUHVXend4TXBjNVVpeThHYWRqbWpIZUd4TDF4?=
 =?utf-8?B?N25qNnVLT1ZKOGJTRU9FMmV4TUQrS29ic05FRDRIUTMrc216R2diTFNSYUli?=
 =?utf-8?B?TUdLZjZpbHVrUWxWWlg2bEViQitmZXZMYXFlSGVWZU5QclRCZitzWlU0ZUJM?=
 =?utf-8?B?MHlSdkRpcHVkMzNabUFSOEJOUVZORmJyT1dhTHpXQzRPaWxsRHlMYnpxMnUw?=
 =?utf-8?B?NGtaK0dsQzFSamgrN1o5R2hleHlGRHUyV2J6bWJ6NWtveHZJa04wU2xka0Fx?=
 =?utf-8?B?cHFWVUF2cENEeW5kYXlPcmhlQmhOUUwvYzQwYVVYU0psWjNMZHFQL2ZHSjVn?=
 =?utf-8?B?T29oY2I3b2t2TnhEUkJrMk91WHJ6andwcTU4ZjZoaWtJYjI3ajQyU0Z2Tmpp?=
 =?utf-8?B?ZUZqSkVLMG5lWE11L1gvb215WUVqd1pZNHVkc01FQm9pZjJaWlpXNTBkSkNK?=
 =?utf-8?B?TXp6VlJWYXMvMHArZW00L2kvMXgzYzd4RFJ2UlZtdmh5VTdPaTkvNk1MK29E?=
 =?utf-8?B?ZlRmNVlNb0xmZmQ4aFFpS0hZbENNZlNqVCswN2ZxcHRNQjlJUkFlaFJNTjRh?=
 =?utf-8?Q?fQ/kBjg/7Jdfeam190CvEyQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b00382e-844f-4124-1538-08dcd7b85742
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:03:11.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VCKvq2tFoYz929vVJ2MkEZZZOLOFp7hLCqI2vvcXN4J1AiGoJce8hMNK8aWA6rmTmOzlbsdWab/eLSzK+1yYGq6zwInUd/tOGHNJS1Z7vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103

On 9/17/2024 8:36 PM, Krzysztof Kozlowski wrote:
> On 11/09/2024 09:00, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> This patch enables CONFIG_RTC_DRV_S32G as module by default.
> 
> We see this from the diff. We do not see why we would like this.
> 
> Best regards,
> Krzysztof
> 

Hello Krzysztof,

Thanks for your feedback.

I can see how not providing any information in the commit message 
regarding why this config is important for S32G2/S32G3 SoCs is not ideal.

Considering this, if I would add such information, would it be 
acceptable to enable this config as module ? Or should I drop this 
commit instead ?

My decision to enable it as module by default was also influenced by 
other similar RTC related configs, which are present in 'defconfig'.

Best Regards,
Ciprian

