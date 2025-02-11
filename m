Return-Path: <linux-rtc+bounces-3153-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64195A309DE
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 12:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03AFA166643
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9501F8691;
	Tue, 11 Feb 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eHpVAW3F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE81F63FE;
	Tue, 11 Feb 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273149; cv=fail; b=cDPUfXMYPyQ4ODlh/9jDOwT8Q6X5jg9FOJKT2r4OdVrS1PmsuEb0FkGGkRNnJWxzbnAUF71chKOArDNGfWXXCVXYNenG3UF+gaeOYuzFUXJe1lU+mNRV66ViQzmycGhBOwCxEEqDoqOWw1JgPaIEQN5qUt0gjg0X7gIEhjRCU6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273149; c=relaxed/simple;
	bh=5MIbDCZI3okAEw97LTE+0u7pmrY5eGSK5y6pMeZMarY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A/eHZgkN96Eroeqnyozb599kxESEzPB8aIZc/4IJb6WjDkoYMdA3em1t4OAwESh66jpCksi8zXVFDDn62PT26RRw4BT21OrO07KaGm6pN5pT9Drlu4Im6tK0u8w+ooCqNqo2nBOr6hJbWAnnL5V0FbwW5TpjdJeR8Q/uZFrT0k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eHpVAW3F; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV2eiuG6GqavgL6W4bvysYMYWezUwKbO+vMmZf6sGfWHOc3QFal3/g2bG+8ypCuCPH2mPOP6WZzAL1J7UrUUFEeSKLmD3QqAQ3IrkNuiSYf2Wu2ZONkosit66364bcSOMegLHYzRMRZDigvDkxo3F25cb+Jbpk1Nl/9UffDwzNUcdsWXeVlroRezebDH1QY2Qilnk5u4kMarBEFZdFgNxMBaiA0sfxiycoQPH/HYkHO9P6xGtem0psYkh7aAnY5epYHMbedS1rZwz0JvbdKp/0535Ot/62RyGqukpiumpuEymGOstZpQHYmC78aeaEIxAYUlZP7BLFgGRrollNp9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vM4EtxTy2x9Fr672oVNtnbd1hiWXfarDYrKZqRYF8jQ=;
 b=ZV2iJCbYWwDe/PK+jGRVAfHKf0DzJSiPDSEpD5jE38CLdi0FARAYYZtppI2/bDY4X+IfQtX1MoH3rBsPEoc7DSPl4UhjomenE3efTeaLukG3aT+F7dM3mgHArAPkuMYbKiuGNWsaxibi+/uQQ4LBmMWH4Qb6OK0bwvL/AM+od4MRjkc111E/0jx1xeIHxbpu/87nywfRoTCDLoCQ17RDk010V6I0OpKYFucdWiEtvodfH7ykf4C2YVnXWqFKIzIhOhVxIsXG9P4H9MulixXq+XiZimDnxhJUeYTZlnZOdff/HqnV2EuU9wzp83sOldXFPtLrb5yrk5hESEws43QnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM4EtxTy2x9Fr672oVNtnbd1hiWXfarDYrKZqRYF8jQ=;
 b=eHpVAW3FxizqrDIXU7JgIv4b4PVm9leIq8EhGzxyAKwJp9slf00U6s4/SX0vIl69fhXztzIUp4YKvh41ljmi10OCCJdMzJzkKnH86Qr7zhSdAN3ZDnnHq8H4S+wAv6xYzwHQHNqk3XzZLC6SZ8NKdP60s90H12fGreSdwsuJ8BFmyyY2QjBCAiqxJIjGV+Jb3mxOpSMDxXvjvLoaeVjvjkCCbQWVqBAwnHl+CBRTKGFanPPbpMJNEDHtxflstehAh6Hf6IOfWa62BRI03Rcs+K7fPZdb+T4nH78CTir/oN8e2vDHGdrvYEf0Ynj8vszVD64S9Z6oJV+PRIz5OEBBTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU0PR04MB9671.eurprd04.prod.outlook.com (2603:10a6:10:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 11:25:43 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Tue, 11 Feb 2025
 11:25:43 +0000
Message-ID: <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
Date: Tue, 11 Feb 2025 13:25:38 +0200
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
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::7) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU0PR04MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9e265b-4f1a-4303-a6af-08dd4a8ed23a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFMrM1ZTeEU5elE3S0w5c0tMTElvd0k3T1FTVVNyOTdxK1hNMWxtUXNPYURn?=
 =?utf-8?B?c2RLNC9ZYk9uQ3VaZGpuVHo1RGlZb0d2eDdDSUJMWUgySXJLTHhHR0ZjenJO?=
 =?utf-8?B?dkZoamo3dmRmWGRFL25zUmowOTF0Rk5rS29iOVp6VHcrM2tOMWJNU3gxckNM?=
 =?utf-8?B?QjZnMHNjejc4M285Qno1WDhuTEFNb00rU3MxQnVidlU1QmxBS1BYcGRkNFdZ?=
 =?utf-8?B?YjBaaWpXQnBadkZmTHMwTzRnSy9DdkJoMkpWVDg0d2JXbmIwSUFvYnpDb3Jl?=
 =?utf-8?B?dUNDNDVpZlFJeTE4NmY2V3FJMUJ2R1E3SjhoQW9VSDVjYzdkN3phWWhHVGc0?=
 =?utf-8?B?TnZDSExhdlpjb002UUt5OW1ZelZBNldPY1VBNGhWV2htbWR0ZVpJeFBQYTBp?=
 =?utf-8?B?bG5Nbm8xUFpLRmJFTVBJSzlNc0Nha3BNaS9DYU5YekM0alE2SW1keGlDR3Fw?=
 =?utf-8?B?b3pnQjYvYndUYU10eExqZXVDeExzQ3ZGYnYxem51QlhMS0RJckEvQU9kUzUy?=
 =?utf-8?B?VUxTWGNPOVJJVVdVVGgrOVo1Nlh0QTJOb1pOVCtiZzNObnAwbENsL09UZGJF?=
 =?utf-8?B?OWViZGhPSGVZcCtXZHRpSDZJSzdtQ3NkUTRjcDlBMkk5YVIyNnhrTkVYOFQx?=
 =?utf-8?B?R1cvWnY0Y2o1L3N4Kzd1akNHajFva0JmVi9TS0R2OVlhVHp3bS9UWlR1M3JL?=
 =?utf-8?B?T2hRT1NOVVFoaUVyVGZTWkhOOEw2TXc3SkVCeEQyUGRJTndNdDBRUVZIN2tQ?=
 =?utf-8?B?VUJsaVhaR2xLSjgwcFFza1Zwdi8yUVZzZEhuS3N3Q2o1bThkK0NXaVlJWks1?=
 =?utf-8?B?WWRkSmNvRmJFanpwRGkwL2dRVWUvRitOKzJSMEgzelQ2bWhMa0lEQ2hYbnlk?=
 =?utf-8?B?MFAzbitSWThIakdtY1RCL2FWeDlGc201TGl6RmpXSXJFTi94RXdRL2tJUEVz?=
 =?utf-8?B?YzN2ajRseWlNTUsyS2hHOGpRcmhSbXAvajRxTVJmSGc0QTZPeGh2aUxGK0hv?=
 =?utf-8?B?NTUwUTZLNFdKTmMxQlR3ZUQ0cktHN1c0S0Zqc0ZqOVkzQitIZTJhL1cwcmhF?=
 =?utf-8?B?alVGamlwcnYxK2F1UmhGUExHTHl6WXBIeVVNZ2pqK016TVFPdy9saGhrVUNw?=
 =?utf-8?B?empWaDAwN0FlMVZEckNqNmlDdE5KTjdOT2hqS09ub0E1M1hCdmJ6VTFFMkNs?=
 =?utf-8?B?bFVtNzRHelNKTStHOTU2MjR1WkEySEcvVDdnOVFVYmZCSzR4Y2huZEpaK2Er?=
 =?utf-8?B?VWwyV2VoY01sYXUrd1MxR2ZqWVQreThRMmJtVTFvWGpudFNwMUsxY0xscnBM?=
 =?utf-8?B?NVMzaHgxZzJIMjFSOGtHelZIM0N1emt3SEltNkhOb3UrbXRjUFhRa0hydllM?=
 =?utf-8?B?QTBMN2UxU0FiU0cva09uK3NoOTh1akZCT3Fxd0VUaG5DZERNTHdBTlA3Mk0w?=
 =?utf-8?B?SGRuak5DNGg4aVFUYTJwdlkvUlJ4cjJuSU1DZ3VDbXh5SlVuTUdtVVFaV0xi?=
 =?utf-8?B?eURUeTZ2T3p4d1lQY3BxenBXL2YvbmhaVE84VkR3YXh2bFlJVThQS3ZrSDll?=
 =?utf-8?B?RkdncHJBTzFpTGlMMml5dDNxSVp3Yi80dEpGZFFxU2tEWTIxUmF3dTlFaFVK?=
 =?utf-8?B?aHVHbWxjUEh0ZXFYYmo2VmxmYjZpMVFwS0NFSXhTS2ZneDlSaGdra3htQ0FK?=
 =?utf-8?B?UVc1UHFxc0Z6bllGZUR6anR5YlJyYU9jczdkR0tRK2lBYTRMMGZjLzdRUTh1?=
 =?utf-8?B?REZ3SERJU1VRODh3RzVBQmhvS21PbXZVSTBZMHF6blN3c2Rjekp0MWxqWUFJ?=
 =?utf-8?B?SEVHYXFzSGJURG50SjI0c04vUUtwWENNMXZINS8rWHVLMDgybThJeG9rWDhX?=
 =?utf-8?Q?A4EYpcW0Zm8UU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJXMGw2V0dlR1hjQlhzUTBnZm9Fa0hsbHlwQlBBQ3JINUNHcmRNMy9uQnM4?=
 =?utf-8?B?dndyY1BPSXM1cUpKdC9CUWN1VVZFS21IWm5BMFlYemhieGhOcFdxeWt3ZmxQ?=
 =?utf-8?B?WVVaUWx5STMyMkJFN25CYlhFMm96cmdJbkZGbnc5blgyamx4Z2hSNSsxaFNi?=
 =?utf-8?B?THpFSjczNzdpbVZRMU1ZaHpmeVZ4SlIzQVUxa0ZiNk56bUE4cDY3VDgxUENN?=
 =?utf-8?B?TWV4VnJuMVlVRVl3eXhtcFEydFI0YzYwN3A4OXRON3lGWlBTTDdaZ2YzWXdk?=
 =?utf-8?B?UDN6RFIyUzNjdzBJeG1zY011aDdnR3NxVUFFREtOdERjMFNZY3VsdjR1ZU8v?=
 =?utf-8?B?NEovdWlmMGg2bzVIcXNpV0MzbEdTK1d0Rjh6UlpHazdMdHgrYmtsUnNUSkZI?=
 =?utf-8?B?aU14aEVEZUpyR2x3WmkrTTJmK29hMUxhaVBveWREZUhUMjF3RzZGY0R4WkVa?=
 =?utf-8?B?R1ZNTUIyc3BtVXFwemVzOGswNzRMemY3Q1hzaXJIbkdSYzNqaG9PMEgzeTVL?=
 =?utf-8?B?eVJtMFM0L0VTYTB6cktpZGVEcVMyWG1FenlPa3FPVjJsa0ZtZy9UZzFjekVa?=
 =?utf-8?B?OUhRaDBxRkxFYkM0eFVSdm1lYVg4QWZRdVJUUGhpZEoxdEpsbGhON0U4STdo?=
 =?utf-8?B?RzZEeXNSdHYxbUxXcnFDTmJnZThBeE9vZHRCdEJMWUlPNm1YT2xSaFcrcXBG?=
 =?utf-8?B?VHdMMWR5cE1ZbHBnWHFFVjBVU2tWVDJXMkNnZHMrM3dOa29UUFYzdnJOWTJy?=
 =?utf-8?B?eHVDWTR4bnVML3R2ZEE1WTZlbXZpUUNNRi9GSmtSZ21VdnJHMGptUHJnMXF5?=
 =?utf-8?B?WGNhUUE0N1B0MGN3a0wvSi9BbTVVMXZFQ2dwTXZMWHUxa3lOT2xWUnF6Umpt?=
 =?utf-8?B?QlhDM2ZSM1YvdDJaODRlOEdnUmJpc2tVZmZ2MHNSZUJ4RXV1bnhFbXE3QU1Q?=
 =?utf-8?B?Qm1DdEkwZmlPeXB4aHRXL1BPMVg1RVYvZ0p3VFVCQi9mZyt0KzZkOXJReHlw?=
 =?utf-8?B?YS9BeHIxSWtwQmVaN3MvQjJHQTZEZHpGVE91U2N3QkhUUnpkbWhwd3hXTHJG?=
 =?utf-8?B?L1FHZ0ZmSlBHOG5VTjlVMnRVYTZ1RmQ4TVNoRFdvTUwvUmNpVEJZVUJFQ1hG?=
 =?utf-8?B?cTlaVXhLeXc5Sm9VNDFWNjZzMnBzNmVqdVdJNjh0OVo3WWpsTWhmSVpDSk55?=
 =?utf-8?B?ZGVJc2tyMmJ4K3p5MGJPaWp2QkRQWTFMZUh0RVc2eTBxSEZack9xUlZMZTNS?=
 =?utf-8?B?dS9EaE1zUlhSbWFDVEdOc1pUWE5tK0ovUE42RGEvWFB3cDEvMyt5SVordGcx?=
 =?utf-8?B?SHo4K0ExZUU5Rk0rNjhMRXgzQVNjZDlJUlhYZCszbW43Nzc4RHZCVXA3QUh0?=
 =?utf-8?B?TWs2am9aRmtIa2V4VEUxaE5WemRDamNIa0Z4Snp6OTZXdkNKSmg0UFo3aGZT?=
 =?utf-8?B?cFBhOGZaVGhaNElHTG9aWTFubWxvZnc3cHk0VnlnV2M4NDQzdXp4R1NBUUNW?=
 =?utf-8?B?U1hwdzBpYW9UQlRiVC96eXkyUTRYTlh1RWJLSVVoOVBZTXovbHY0cEFqT0Vz?=
 =?utf-8?B?YStsb3NRNEkrOU5LZ2EzR2Z4VTdRdlZnT01uUHFFMnkzMTd5ZEVzYXZvS0RX?=
 =?utf-8?B?bnpjcitjYVMyRDNVbTAwMXVwNXVxSkVYWXNOV3pLOERvWjdDQjUrYnhXbXpk?=
 =?utf-8?B?dmp5ZDQ5ODRHSk10eThEZjFCSjB5bTIxRGtNb0FFa1pXNXZmMWFuL0JNa1BZ?=
 =?utf-8?B?OXIzZWZRRVFLaHA1MXpSdjVpWnhrZjNJd3VqSTdwUzgwSVh4OVZsMzZWM0lh?=
 =?utf-8?B?Y2dxNHE1NytuZml4RnRXcVMwSlB4M0RLL0l0YzE3NU13UHJFMXFVeVp3cHIz?=
 =?utf-8?B?MTB4QjdKK21OenI4N0g1NElFT3JMQUZWY1hpUTV4YjdMYnJEcVlaMkdNcHNU?=
 =?utf-8?B?NDF4eGl6V242bHNiTFNrOTMzUUJqUVkrL1lvVHlISWhuVGxHREUyaC9BVUw5?=
 =?utf-8?B?UkR3b2dNKzl2M1RNaWlZVzBZYlRVV0Z0dW80dzRTYysvL0l6QnJJb3AxbWNK?=
 =?utf-8?B?YVlscU9SQXdhdFptKy8zbnJnZmRyTWl1RHpzWGZNMUwrNG1MYW1NTFl1czJu?=
 =?utf-8?B?TWt2dzc2MEhsdUtQVjMwQWVyMEJRTndWTFVOSDAyV3NUMjgwZHpiTUw2TDkv?=
 =?utf-8?Q?D73r8k5g682ejXJA7UvZ1xM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9e265b-4f1a-4303-a6af-08dd4a8ed23a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 11:25:43.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atPy+/w8e0KG4hvizi6AgU78TvpL99dLJj7Lf9ti9v+BtFdVfuPqpOVnYTldtLFUBZFQsukftOpkdthxuLoxt1ftBylzI1s+XRHVF6+PAGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9671

On 2/7/2025 10:16 PM, Frank Li wrote:
> On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> RTC tracks clock time during system suspend. It can be a wakeup source
>> for the S32G2/S32G3 SoC based boards.
>>
>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>> alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 ++
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 395 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 0bbbf778ecfa..510dc2db745d 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called "rtc-amlogic-a4".
>>
>> +config RTC_DRV_S32G
>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>> +	depends on ARCH_S32 || COMPILE_TEST
>> +	depends on COMMON_CLK
>> +	help
>> +	  Say yes to enable RTC driver for platforms based on the
>> +	  S32G2/S32G3 SoC family.
>> +
>> +	  This RTC module can be used as a wakeup source.
>> +	  Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 489b4ab07068..e4b616ecd5ce 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>>   obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..3244b23c533e
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
> 
> ...
> 
>> +
>> +static int s32g_rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>> +
>> +	/* RTC registers are being reset in suspend.
>> +	 * Thus store standby time.
>> +	 */
>> +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
>> +			       &priv->sleep_sec)) {
>> +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
>> +		priv->sleep_sec = 0;
>> +	}
> 
> Strange. If RTC register are reset in suspend. How do it wake up system?
> 
> Frank
> 

Hello Frank,

I believe the transition between resume to run is a reset event. This 
would lead to the RTC registers being reset after resume from suspend 
(triggered via Suspend to RAM).

On the other hand, the RTC is kept on during suspend for as long as its 
been set up (for example via rtcwake -s), thus waking up the sistem via 
an API interrupt.

Regards,
Ciprian

>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +	return rtc_clk_src_setup(priv);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>> +			 s32g_rtc_suspend, s32g_rtc_resume);
>> +
>> +static struct platform_driver s32g_rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= s32g_rtc_probe,
>> +};
>> +module_platform_driver(s32g_rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.45.2
>>


