Return-Path: <linux-rtc+bounces-3199-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9EA352ED
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 01:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BF318901D3
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 00:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F036A1853;
	Fri, 14 Feb 2025 00:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q7+Ky1Na"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010007.outbound.protection.outlook.com [52.103.67.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F017A17E;
	Fri, 14 Feb 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493133; cv=fail; b=U+6893CLGT8kFRAIOBh///7Pkn2s1bda+UgaB0GndC/WFzxq6RF92qdoKTU9IqG69NUFSUpTKdZtTOObTst8ClgPtFpHrA0+mq15mozPuZXiiCOwSTXGEjHPepZUHfYqr05PhV8STQjG65k0WgHvgiSvQIU/mQ9WOv+eEAK09xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493133; c=relaxed/simple;
	bh=eocthF1QvwwIsaHYKhzzZ8Z9xAjFTlWmBo0kQ0FhEAU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TsPa2lnz/gr9lc19ipbtWA/ZQ+8B38r0XCH55XY4W0fxpfsuYT1hBaPmYyKjq4nLnqUdwVBYPShW0wRF/WuJLkQYhxV5yb7kWbQuHJtKNL//5wtpfcs6X7Yt5yquEhgTxCZD0j/lhvJblb5riGkje47cUpIKcjIwN1LjMPfTYmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q7+Ky1Na; arc=fail smtp.client-ip=52.103.67.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz9OqmkHGR+rAkMzZEI4RRF+6lItDlJSR7Goo9fvyDk/DtuL2bsh3kpmGbjWME2eQt4+IIVxiKAOhSYiDb9j81x4QuLACqgnrthyLhDigGU972d0nfkmKT3NYUdKqhs77I85IsA2uTiXNkq/phjBEtQE6kVPYoCg10dUH8KxOtlkxZBoWLX6TxZvRmq28lay4z2YRo1r0QJZVzCYuf9Y9zeP2VBXGk5hZ2W0gHQs7ovCi/rOlj6+6J30x7Dmn9KrrJYnIWTzIk1UlJ6BmY/C+hqkQHYP4NUPxI6vBj3xbDJ0DyyeheIlih9iRdzivZg2mN7dTCK4pZ0hTl5do7eiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu6EViVF1NMmM7eJLraAgiv8alpv0NffUC8vP7Yg1fA=;
 b=naFQG+IMV1fcewmRWn2GXvcYSmuM+5yddu6GuYCULyewI2BvQXVFkzgsw8muaKDbxrJT1kaOvw/jBB6HPFaO2ryjr8mq4jV/ghkpmgM5dzcoYmZStdvLO3KNMbw3+02MziC6Y94m7aDXCWYyPpVtLZE2sqAZSEyUjduV5OWWfE/V4u4PtHdQtKzvAYNrhixJOPyNnVFss1pQEuOu/LkAGKCpmYoVALst8fvob3rn8rYh2nlp4pTamjZqP4yDF0OCg74A+ikIDx3r9QxuNcOzll1hxr2MWBB8yRVCBWzRJnHNS4Lib5TvdsOeVLC5qkaKuUQLwfmI/UW+aGzixk2YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu6EViVF1NMmM7eJLraAgiv8alpv0NffUC8vP7Yg1fA=;
 b=q7+Ky1NaJBRSLiMuspVgLgSd7sqhoc3RBhHhFuF0uR8WWp/eETdNdnNxmAv6iCawzucWY7tuULnTIrg67zF7ksMnbE/EX9GrOx1x/sQ9mO4Gvfi7O3OFER/3im/rbtTSugQs4sI/BLhW1O+gLsIBKsIEeP1CjR3rzEO/RfK4dWskoqM2hAujRVLtxrgr2778nOQaXMyVfJaiotCywX2Cp9ccHmsaXCmRWioljw/23+gEStvC1rGkgWg5NGBxbaUOnj5H94lQXrR4XkRzpyQ0S+HJ1meGcpngNmW36y2f8dWLHO6w9f3LlLqbaDTVDu+gavKxy7sBwxPsMddXFJgkTg==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN0PR01MB5943.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:67::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 00:32:05 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 00:32:04 +0000
Message-ID:
 <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 14 Feb 2025 08:31:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <333327a9-420d-416b-9770-1b98d6b2e4cb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN0PR01MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b049659-e782-42ed-5663-08dd4c8f0121
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|461199028|5072599009|19110799003|8060799006|6090799003|1602099012|10035399004|440099028|4302099013|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tm1ic0dPZVdXOVdvaVZubCtEREtOa1FZUEt5aEptcC9qS3VpSUJkZ21KKzU1?=
 =?utf-8?B?bXUxZ29UT2l5MXNFZTdhbGFsMjlvZWpOc1VwWFVJSURmRElzNGdyUjdIRFM2?=
 =?utf-8?B?eFpnblZHZ2ErUjhVT0hIMU5mTVNENkpjMEJUY1ZsbmI0N2VCV0Q5SGZGZkZi?=
 =?utf-8?B?d2w4d1NqRUNWWU94Y0ZNb1dSNER2ZGhJMnd5ZzJITGFjVlp5NzV4ZlJJT3JP?=
 =?utf-8?B?L1U3dnZjQjlNZzZnaGJtQStlMWNUd1NnTVhCM3dTVmhQdGdXN0s2RFJuK0tP?=
 =?utf-8?B?TVBqZnR0Y3BXWTNuMTh1bjNhNTVCVFpNa3Z2WTRieUQ1ekE1eVZ3RGVUcnZZ?=
 =?utf-8?B?bEt0ZjZLM2EzbUo5Tjk3ODk3MTB3TTk0Z05OQWdkUit5bm40NzZVVEZxdlgw?=
 =?utf-8?B?Q1NCR2VrVU9zaC9yNkhHNytjcWZoYUZmakhxRzlaNWk5elhmL1ZaOGJCYzVQ?=
 =?utf-8?B?WEVUVVh3cXlrMzBQcHpCOVFPRzIzdnZaR2pjazZTWENhMUVjaUVDeFBoTjNu?=
 =?utf-8?B?NWxlQkZHK2ptNlpsNHVEM1BWUU5mSVVCdGRXdTY1b0NZSWlFS2txYkNmRi9s?=
 =?utf-8?B?Mm9jendhOC8vMEwrMHJzRncrNlM3NHozNStFcnUvcnpKNXVQWkFWUzd5Wnlt?=
 =?utf-8?B?bUJGSUZLVEgvRncxazVrNDErM21NMmhJUXIycjlvQWlqZU5EbjN1emZsbGtm?=
 =?utf-8?B?bVk0c04xWkV6dnlqSWdxdnV6bGFlMExuR1k5ZGVkTmhEbjZoUkJPWHBuVU1M?=
 =?utf-8?B?RURiY2tjU0RrRy9wUkJvejRwZHpVTEhCbjhzSTF0MmZoc3FLMWtMUDdVcDUz?=
 =?utf-8?B?ODlWSkRyYnh6ZS9JQWZ0cUhMa1M3Q3ViUE5sWUFFcHJhSzVSNUhIQ3l2bXoy?=
 =?utf-8?B?TmFOelFIOWxwc1dCZzEzeGNLOVRXQ3V4Q25CQmZXL2hrVGZmVW5NajdwMU8r?=
 =?utf-8?B?ckZ6TmhiK2FKN1pFdHI2VzBFSll5bnNRUVJWbHdLVzl6V2pGYVNhS2o4ZTZn?=
 =?utf-8?B?OCtyMVNBVEhVMmdjRU1HK091aTZjbGFLcHZaakRQQ0xIYWRGUWl5TzZIR3Vz?=
 =?utf-8?B?bnRUYnoxM3YyakV2RjExQ05Hc0x3Nk5jdzBBczdMNStCNXNBYi9PbXRwOFpn?=
 =?utf-8?B?djhWL1JJWWxmaERjbXlFQkZZdjFyOVA3eVF2aUUxT3YrVU52QVFJbm5rUi9H?=
 =?utf-8?B?eHFZQ3BRTk45V0htNW9LSjR1Z2JMVy8yUVBxRmMyTmVOL0huZjR3WG1pUmc0?=
 =?utf-8?B?cnlvd0JhbE5ta2hIa1plMXA4ZDZkZGdsem5MSGhCbmdvd0JJNExDYkdtZXNJ?=
 =?utf-8?B?SEFTLy9zQXM5Zm03RERYMFRoeFMwSkw0My9JVEcrYUxQeko0VGxtcnNvY3VT?=
 =?utf-8?B?d0Q2ZnRvTmcrOWxnUW9LSjdpeFpFYzhXdFJpZEZ5cTUxSjV6WXYzN2l0NHMz?=
 =?utf-8?B?UWlmT1kxeHlZc1ZDWFFHaDExVUV3VEpWM3JTTHFLNHJyVktNYVVrR21PSW9R?=
 =?utf-8?B?bnBoU2xzZVdCU2oyU013RmZ6RW1QR2xSVVVvUlFDY0JpdXZwRG9xaHNGcW5V?=
 =?utf-8?B?bFBsdXM1b3R1MnhkOTVFL3RKSHhTTmRybXU1YzgxTUEzZ2NGUDVGSWYxNmZn?=
 =?utf-8?B?b2wzR1pNaHpwQmhxYlJ2NDdwejFza3d2c2lkNmxuTGY5U2JYMzJIOEwxKzVi?=
 =?utf-8?B?WXY5UW5zRys0NGdRNlJBUTN3cDFoN2VJKzBGWmMzMFJNdVJGQS90R0p3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUIwMERtclNWcDc2Z1BqQXVtZ0tKYUh2OFpMdG10N0N0bjU3MHZOSzBybElr?=
 =?utf-8?B?dHE3ZE1aSFo2SExBbWd3QmVKWW5GNHd4amdZUHEreDEwRVhOOEQzeG10K2Ju?=
 =?utf-8?B?YnRYN3BKS0Z2aFVLRTJOU1d5Y1JmRzdjSk5pZmFZQkpiMlM0T21Ed05CUVNG?=
 =?utf-8?B?TEJuWHNvL0lxUHNxUUxMOTRuSFdKNTgzdmhCc1Z0N3JGMWVKa1NMVHVZVlo1?=
 =?utf-8?B?aUloaThsN1lpNUpWQ3RZS2hEbGJoUy9ESXpRd0Vxb3VLRjdtZlZzVGJqUnNN?=
 =?utf-8?B?VTF5ZlljV0xVRTdIcC9xOVByOEJsRFhkUzFDckZkTEZUTEp0TStVa0l1RDNh?=
 =?utf-8?B?OHR2N1loM3dVMUFKckYzc2hrc0RxKzdrY0EyYll0dXppaXIvNmcyd2FjNHNr?=
 =?utf-8?B?M2NvVlU5dXlaRG8rSTZCMWx0R0w5R0I4YzZtUzNPWWVBdXdhRFMyWVdKUFJR?=
 =?utf-8?B?UWRULzNOYUNDVU11WWFEMTlDbklqL1hYbEVHNDNTZzI1NUgxTGxHb3ZMYjBu?=
 =?utf-8?B?K1Buakk0S3U2MVh1OUJpQXgzVkFrVkJXL3puSmh6Y01NVVVhUDhIN0dsMHNK?=
 =?utf-8?B?SWNKL2VPSEtHcVVab1gvSnpUZzkxOFUvVkNjcnpsbUh6S3BLazE5QkJDWmJG?=
 =?utf-8?B?RnEyN2pqSTdIZ3Jwc3dPWWl1KzR2aFJ1d1ZvdVE1d25JMmpYWnRHK1J4dUJt?=
 =?utf-8?B?ektuNEh4WDNqN0puT3lYUEJXQmhKRW85ZnNMNXQ5bTJYYzRib1JWUUpFU1pv?=
 =?utf-8?B?NU5nMGJwdzUySlJuWk02Zm4vTzhtQjZrSmplOHRwdHF0b1VCRW1RYXE3bjlD?=
 =?utf-8?B?dUludlZNNVNqQVNHc05peDB2dy9lVEdCNlBXWHh0a0MycDNET05YbXFyVlJ2?=
 =?utf-8?B?OFdEZVFIb1lUMzRvYWZISGE4SXpPaTNSbDJlZWZlcTk1TEVFTy90TVFzcGpP?=
 =?utf-8?B?NWxjT0R3ZHNockZkalJIRlY4NTUzd1hQbS9lbklxWHdZbEpjWGNzSmU4OEFt?=
 =?utf-8?B?RksrdHFVay9nK044Smx2UWpmbFdIdHdFSko2b3ZyUnJyeERkdXdiT2w1bGty?=
 =?utf-8?B?RFRJeEJxSCtkYWJMVDhrYWk0NGsza2doeDNtZDRmcnNMRXRuaWw2UkN4UzFQ?=
 =?utf-8?B?eEYzN0FneTBjd2pUdGhJRVNFMnZUcXdIbytvUmdwRkpSQ3JHbkRqOTVNY3dD?=
 =?utf-8?B?TWI3Z2VEUU9lVGhVc09mcVd3eHdBRkIyUWF1VW4wNEFNeXp4VFNqeG5CWC8x?=
 =?utf-8?B?ckswTXRIWmU2T1l3TGV5emRHOHpKems1ODZIblVSdW1Renk2aHJSekJZQWpk?=
 =?utf-8?B?OFFwNGxlTk5CQUpVS2hHcFNTNlZOM0hWbURnRi9kWGJPVjhEQVlGd01TWnJW?=
 =?utf-8?B?UFM5MkMwaDRmb3kzZnZSMER5dW5CZ1A2K1JYY2NoOTN2RmhPYmw1WDJ1ZDhT?=
 =?utf-8?B?NmhpWkZZb0VySnBCOGtiTHpWaVpYRnpTSHV1MmpyVnlZNXpBeGN5V3VMMjFx?=
 =?utf-8?B?NkZYMnNqMUMyWnV3Y0tFZ3hoWE9YakNFK1RjR2JCL2UyTGFocDdXVVYrL2tF?=
 =?utf-8?B?UThBd01GZWE5dzBPSGJUcDZtY2VIWVBONENIMnF4VlpSRS90UExPTkhpRlQ1?=
 =?utf-8?B?c1V2ZnJSV3NDSjhRUXZnRlBSYUFDK3Z4RlVmN2pObVpkWnlhbEQxUHRha0pm?=
 =?utf-8?B?UTdxTEJLaWpqbWxKM0V4L0UzSEpGeW0xTy9adVhpVVMzRU5yY3VWdmFoVlBF?=
 =?utf-8?Q?gGJ6yEk6MVu4GyFYnUpUBgoiXIvWHRwDs+oZsNm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b049659-e782-42ed-5663-08dd4c8f0121
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 00:32:04.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5943

Hello, Alexander,

First of all, thank you for re-picking up this orphan patchset.

We recently created a mailing list for sophgo (sophgo@lists.linux.dev), 
and we would appreciate it if you send a copy of any sophgo-related 
patches to the mailist in the future.

You can see https://github.com/sophgo/linux/wiki for more details about 
this mailist, and we are keeping track of the status of upstreaming 
sophgo products through this wiki. We have updated the status of some of 
the patches you are working on, please help double check.

Thanks,

Chen


On 2025/2/14 5:56, Alexander Sverdlin wrote:
> Real Time Clock (RTC) is an independently powered module
> within the chip, which includes a 32KHz oscillator and
> a Power On Reset/POR submodule. It can be used for time
> display and timed alarm generation.
>
> Changes since v10:
> - only start RTC on set_time;
> - add machine restart handler (as separate patch 3/3);
>
> Changes since v9:
> - picked up orphaned series;
> - further simplified bitmask macros;
> - unconditional RTC start (rtc_enable_sec_counter());
> - dropped ANA_CALIB modification;
> - successfully tested on SG2000;
>
> v9: https://lore.kernel.org/linux-riscv/20240428060848.706573-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v8:
> - delete unused macros
> - using 0/1 instead of the DISABLE/ENABLE macro
> - pass in the correct pointer when applying for IRQ
> - convert the incoming pointer into an appropriate
>    structure pointer in the irq handler
>
> v8: https://lore.kernel.org/all/20240204044143.415915-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v7:
> - pass checkpatch.pl --strict
> - using u32 replace uint32
> - using devm_kzalloc(*) replace
>    devm_kzalloc(sizeof())
> - sort header files alphabetically
> - delete unnecessary header files
> - fix wrap error
> - drop dependent description
> - using hardware automatic calibration replace
>    software calibration. see documentation 197 page
>
> v7: https://lore.kernel.org/all/20240122080500.2621-1-qiujingbao.dlmu@gmail.com/
> documentation: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
>
> Changes since v6:
> - completely delete POR dt node
> - remove syscon tag
> - use devm_regmap_init_mmio() replace
>    syscon_node_to_regmap
>
> v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v5:
> - remove unnecessary lock
> - fix cv1800_rtc_alarm_irq_enable()
> - remove duplicate checks
> - using alrm->enabled instead of unconditionally
>    enabling
> - remove disable alarms on probe
> - using rtc_update_irq() replace mess of alarm
> - remove leak clk
> - useing devm_rtc_allocate_device() and
>    devm_rtc_register_device() instead old way
> - add judgment for rtc_enable_sec_counter()
> - add POR nodes in DTS. This POR device shares
>    the register region with the RTC device
>
> v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v4:
> - remove POR dt-bindings because it empty
> - remove MFD dt-bindings because SoC does
>    not have MFDs
> - add syscon attribute to share registers
>    with POR
>
> v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v3:
> - temporarily not submitting RTC driver code
>    waiting for communication with IC designer
> - add MFD dt-bindings
> - add POR dt-bindings
>
> v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v2:
> - add mfd support for CV1800
> - add rtc to mfd
> - using regmap replace iomap
> - merge register address in dts
>
> v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/
>
> Changes since v1
> - fix duplicate names in subject
> - using RTC replace RTC controller
> - improve the properties of dt-bindings
> - using `unevaluatedProperties` replace `additionalProperties`
> - dt-bindings passed the test
> - using `devm_platform_ioremap_resource()` replace
>    `platform_get_resource()` and `devm_ioremap_resource()`
> - fix random order of the code
> - fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
> - using devm_clk_get_enabled replace `devm_clk_get()` and
>    `clk_prepare_enable()`
> - fix return style
> - add rtc clock calibration function
> - use spinlock when write register on read/set time
>
> v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/
>
> Alexander Sverdlin (1):
>    rtc: sophgo: cv18xx: Add restart handler
>
> Jingbao Qiu (2):
>    dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
>    rtc: sophgo: add rtc support for Sophgo CV1800 SoC
>
>   .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 ++++
>   drivers/rtc/Kconfig                           |  10 +
>   drivers/rtc/Makefile                          |   1 +
>   drivers/rtc/rtc-cv1800.c                      | 277 ++++++++++++++++++
>   4 files changed, 341 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
>   create mode 100644 drivers/rtc/rtc-cv1800.c
>

