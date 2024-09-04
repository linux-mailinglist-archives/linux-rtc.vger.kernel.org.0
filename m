Return-Path: <linux-rtc+bounces-1868-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C44AD96B571
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 10:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4361B1F215B0
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F78F1CCB35;
	Wed,  4 Sep 2024 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="g9mtfzUx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2095.outbound.protection.outlook.com [40.107.255.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F81C8714;
	Wed,  4 Sep 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439817; cv=fail; b=YTYiQxxlTsHIMgntJ2mQoA10EI6mU4Pd/6FpEOuy3aIIYbXwO3Fagx06vGPkl024D5F3zc5h75186/YEpA1PCR1j1NG/udnp1B0n40+r5H88O5/ZCrjUamtt50eCVXcKZR++1yamlFMOktqLn4LqdJhNC9UxTmoRg/W74BsgATk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439817; c=relaxed/simple;
	bh=D7Hi/lSYrjfx4kz1qmZWqsIDcHBSX7L1MCgNUk2H+1Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GjkBTjnBuAZb+xt32aoVbKjvhOyo4KSMpf251ZdQNPLAvWXShBfgNc1wifZGSRNwVNMfYzdzF06Hc4VQFWS2JZVbY0Mv93vGlugQXVRSsIyXMgyS8OMo+HerMPdzIdaXwqfpxH6Ys59lRjkVjL2i9b7TsLFrsEsAe09Z75u28ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=g9mtfzUx; arc=fail smtp.client-ip=40.107.255.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP39N8jvBB/D7I+QTYPDv8PqaeLLZ/mPW7BvdxRy0mVOWYSXVjQYnstmPYVbjqWTxpAKrf5A6OpI4FWq5qTCB9QUuFuFK7AAo76ckA3z+xmjEnGQoDSWNAmksiMPJPnZudF47611FnQKOs13SMagWsx7wkXy48k/sTRTp8CIWOxjbHuTN52uUDNTYTfCzbCBJuI2r5W92cvixaAVqmREr8sfQiJbo+qCBEpuvyRyqgXv4jS4PZQamzAsUjqWirsoGdC5nOqFW4TLbqrqNqOKjRwSici8b+CazdxAfoca+mH3G5luxDodGpStLt1mZ13UyH+CxHNgFdp0xZMW7s+sXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+pwANj/K4C2jimuxDBO9N6ACKwsbEV/9KrG6ivF6yY=;
 b=fNyKvYeRtdjT89UrMmuq8gI2onrTLxmyKpive3hbspM/Ihhzl2hs3YSMUAN+GpNBG8G+5sWu2NbPAXirx+ITVfa5t5/gqdnIowKeltMlNHJkAA6JeJRb79mrHfGgV2djpQKiI14KvA44i7kxLxtpNtlwVMvC9ChH+DsblB8jmiqaiXIrWH+Ehjdl1SfEsFwZK1f715B1eHjQ0k1oIs0nKRJ6KJz3YG6ageCScC3ZEd30TmY2/bQXchcE80o7lNmIpW8Ah1TEYzecIWhCFQQRCh/aWRvm2nDqnGkh18Wx94veNmEXMlVMcv3NKR9c8Ac4vpVGF38QBQgNvVD5KMW2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+pwANj/K4C2jimuxDBO9N6ACKwsbEV/9KrG6ivF6yY=;
 b=g9mtfzUxlM8+pqS+UVYD9203Em7UbuqZiZRJwO3NuUlmX9WIcY1ipxwWHnZRWh4pIRxAzhwor1bG437nEz/UXv2l2xovblWOn7P5L4QbRKgNFTKNS7r5asP3HaAjiXbFEhBw9mS2ZzL6LpLlmspGRSxDn+I7iPkkwGnVgfG7o9MFRar88saKbpfuZId3SjaneU6XP77JVY3MNFKzt0OLKsryu7gj8VR6HNaG3w8NM+50uz0B53IOO1Vb/P3ZNS2hkyew+Q1l4/rJvDpYjrsamNwmrCwxVtzVPDwHxaX45un8kE65nZqiHvth5lXNveOQDXH3p2doNmqfu9ky0XE4wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB7828.apcprd03.prod.outlook.com (2603:1096:820:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 08:50:11 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:50:11 +0000
Message-ID: <4b50c93f-2a1a-46a1-8cf1-48e726d66aac@amlogic.com>
Date: Wed, 4 Sep 2024 16:50:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
 <20240903-rtc-v2-3-05da5755b8d9@amlogic.com>
 <2804a57d-fb92-4317-b4c4-e1811a915265@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <2804a57d-fb92-4317-b4c4-e1811a915265@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:f6::35) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a02abd-3e4c-4bc5-e27f-08dcccbe95cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUVIMEIySm9Ga3dOa3RHS0h1TDBlK2VaeFlhRnJtSjNtYlVwWXcydTlLYUds?=
 =?utf-8?B?RGxqWXB2bmRvRnNVeXJCVjk5ZzhMcjB0Nmo3djU3K0lFVDBSN3NoVTQrSVEz?=
 =?utf-8?B?RUtDblhKaEU5TG5ETUIxOGtXZ1ZJMlEwNkxRd3p2NGw0U08xeE8xM2UyTUMv?=
 =?utf-8?B?Uk4zZjlSVmI3eHlHMkxsMmpHcDZrYUY3VFhWc0o0M2ptMGkvaUl2a2xaZXlu?=
 =?utf-8?B?TTd1NzB0aHRwaDZ2blhCUXRVbTJpaUZQSFh2eDNmREM4cGJqaDFhamk0bVQx?=
 =?utf-8?B?bGNhcmVmUWRZTWdDQTUwWjBvcGVleGhCaU1tdEhheHE1K2NFL3owais4SWNF?=
 =?utf-8?B?bWhYUEdqOCtWTWNGaEhXOWl2clZHR3pkVHNTbEhlV1BHcjVRcjFQdEllR3BU?=
 =?utf-8?B?QXBjaWkxQkFjR1VUazg3amZicEExNXgzbG1oVWNwUXJhT05lRk9reXQrb01K?=
 =?utf-8?B?K2I3ekdWQUlWUnZrZlZiWmRaclBhZWQzNGoxVlk1REl1U3VNZUJBNFlqeEMz?=
 =?utf-8?B?djRRQWtpS0Y2SkdkakVsMUhYK3RPTkZ2UHF6aHBBNlIySXJod3lSUUpRS3dY?=
 =?utf-8?B?OExTNWVsdDgrbWthUUNtOHROYzBiVkNFN3JjSHJrWkNBNnVDWUcyR3FWNUlx?=
 =?utf-8?B?eHRYbU9BemhJejE1M2dYLzZRWFFZZFJNMzZ2LzVxWDRsY0poa3RyNTc3SGR5?=
 =?utf-8?B?bkM4M3dMVjRUSFNhQ05IdERJN2x4MkFTVnJEcTgyeWpSeEQ1OTlJdkhxajNH?=
 =?utf-8?B?WGhqL29ldEU1YXNlaGdmSEdEV0tWbVNQdXNCQWY3N0F3L2RGbHRvREtHcUdR?=
 =?utf-8?B?VDBUM2hpbDlSR0xCWWU2bjZ6c0VIS29RaHEzQkpNdEFRU2FubFRZMXpzM2cr?=
 =?utf-8?B?d2oxOGdWQnVIR3hyUXZVcmhrZWVacVJ3Q3czUm9Da2ZUSjJzaFF2dDM2WEFU?=
 =?utf-8?B?TnVzRlRNZGhvd20zMFNqb29Jd3RkNTlsMVp2TXZoMzJRRkRQdzVPbzBwbGtY?=
 =?utf-8?B?cXp6TVlLclE4cWJMVGpOVkptYlhlNFd5Y2FwaHMwTUN3dklmUi94TlJUakds?=
 =?utf-8?B?bkkwWE9YM0JqL3N6ekk0NDBBZTBiSmpncGNISkZqejI3VzhOaU5TWm1Va0R3?=
 =?utf-8?B?ZWZrZDNLNFhXeHFsbWFGY1ZBR0s0M1VYbkhMRkg3c2dKcmlBdFFwNzBYeDV6?=
 =?utf-8?B?RWxZL0l6T2ZoVmxjT3l0QnB2cmlxQ3pqQXVZK2lDSkkzdkcwVThMUlAvV1hS?=
 =?utf-8?B?amlkWlBDRk5kSVI0MWcyVVR2L1pGNlpLUXhzTHNuSitPWkViaHNYUW0zRUh6?=
 =?utf-8?B?MnpXamZqbUdGVTR5encyOGZNdllOc3QvRGcxVlhGOGZlUlcwVDhCR0Z3R0tJ?=
 =?utf-8?B?MUwyWXZSZHh0Q01oRk5UNFVnWG55VGx4ZjlYdUNHNTVZMGtWT2RhUi9pMlRJ?=
 =?utf-8?B?TGVIS2NxaWJhdU40U05UTmhpL3VzQ05FdXhVcEF5SVkwQm1rTkZIaUdEU0F2?=
 =?utf-8?B?d2Z5Qm52Z2QzR2Z2eTlsQTF0WmM0K0NzeFBBc0ZackpqUlh2WkllRmxRdE9W?=
 =?utf-8?B?UGtjN0xzemdCUm41T2xLeGpyS1NKWWpXbEx1elBnL0hzdm56RS9pcWova1hU?=
 =?utf-8?B?RlVRQTlTdS82TkpPcUt3aEozMys1MHB0bDJnajY4Sm9XQjEycmt6cURqamtG?=
 =?utf-8?B?eHFLRXRjTTRoL1o2Z2ZiODVkd2NjMHNBTHBLV2RyT1ZBcHNCOWR0UXVpUGtL?=
 =?utf-8?B?aGFzNysrL3lCQVVlNk1KNU9rMk14Z2NTTW1LNmpudmE3VHNiQlZONDRVWG0w?=
 =?utf-8?B?TTdvY0liNWxmS2lXcDczUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1pteEFZT1hMWG5NdG83WFVMT3RmOXk2bkhuSlRRNC9HVkVQNUJWMGdab3NH?=
 =?utf-8?B?WE4xdXY1RUdMOGhFTW8yMkl3dVNrK2sxdVRPa2JCbUlrNGtWeW1UNldwY1ht?=
 =?utf-8?B?cmtBNTdxUE9NN3NydElyTTNLUjU1ak5mOFM2aVpSbERYRG9vZGlSRUpIU1pz?=
 =?utf-8?B?Q3l5NHFlZXZzZTlBcW03UlJTR3AvQmZrQ2NQUTQ3VEZWQ1R2bjYrU05MR2dT?=
 =?utf-8?B?c2d3RDMrTUlxVzNiTndYN0tXMS9uTVBUd1c1MnJIMFNySU5OYTFieXB5dnZR?=
 =?utf-8?B?VE1neWFLemQ2VzZwWlgxWkRhTlBpTlhCV3ZSZDBML3lDM3JrR21ZVGdUVFdP?=
 =?utf-8?B?V1poN2N4dXVmajNYek1SRFo5THZrdXJMcmkrWStxVktSTE83Q2Yzc3Z0RUNM?=
 =?utf-8?B?OGN5KytlV1ZONk5mQWxteWUwRW1iQnYrcnVTWWVhUVRWWjlONE5nMjA3M3p2?=
 =?utf-8?B?Z0cyeVM4dmdxN01KRHluY28yWE11YkhlRmlTSW10M1hxWUhFVm9rb2FqU2VV?=
 =?utf-8?B?VVFnclBsQVBwa0tkWVJBU014VFRVdWJNV0RHMkVEZUg3a0tRQnVsTGVnRWow?=
 =?utf-8?B?alh2MERmMFZqOGlEK0ROQWhmbDNXbUNDdCt3U1N3c0xmVmpDY0tFN3ZpdEJw?=
 =?utf-8?B?eXNzWDd6VFpWTGpVRzg0ZnJicWFZWkNBdGFwZHJ5VXhRUmpCZ3FrNjZpZ0pq?=
 =?utf-8?B?aFdsbVM1YmEzU3FZejFpaWgrZWMyVTJYLzJ6ZjY3UmtyS3BZNUdzQTM0UXJK?=
 =?utf-8?B?dE1xNi9Ma3FvNmdSOVZIUXZUOWZTL21ncndxOXhjeG45d1pJTkpjWFI4YzZG?=
 =?utf-8?B?ZFYzdUE1WVRnT25hUWpmRUt3UGxzdzhYa0xEbzFrWG1WYU5UL081cUJVZC9k?=
 =?utf-8?B?K1dFRWpnZHBJdGd5UnBaSHhCZE5zUDlteUE0anFCMGlCZzJmTUk3VXBWTkh1?=
 =?utf-8?B?R2ljbVZZKyt4OEhyVVNBUmI3UHh1Y2JIQkt6WXZBTVFvNENtOGVmemh0YnBB?=
 =?utf-8?B?TEZLRUEraVNZZGhVdzRnRTVsdjZBcko4MEQzdGltRFY1VmtJNHlwRTJ6em16?=
 =?utf-8?B?czI1RTJaTXZkRFpYR3VUeVhEOUl6MXBiZkVVRktiRDJ5emNqNThCSzgyTkFu?=
 =?utf-8?B?YmN5Y0k0T2VRSTA3dnJSQVRMUUE3OXQ0Nm9CZmUva3dsMld4VVIzaWJoVGlJ?=
 =?utf-8?B?SjdLZFdwazM2b243blZZeUgrRi9GbnZjME85T0RYakIzakVGV1dKaEk5dzI5?=
 =?utf-8?B?SDBPcmMrUUZWUHNmQmRPZ2tkWUIxR3dUQjI0czA2UzFUdjVqK2VFWnorOEI3?=
 =?utf-8?B?WGYwR3grUnpPdEJBN3h4SW51R2o0N0Jud281RjdOazh4TUcyV3hkYUhSNFF4?=
 =?utf-8?B?bDJDOFlFNzF1Z2RLTlZVNUxBTGdPRTRIVkdZMlVkSkIrK3lDWXI0Z0NMWVlJ?=
 =?utf-8?B?Q3NxcUpLTThVVkZXMEdnU0RydnRIVFpyYVJFSGthVFZnalZvS0wyejVHcm43?=
 =?utf-8?B?ZCtaZldsbjNxYlFxOWhhdXNKZ3l0a3ZaSkx0b0NlMmJkWWRhdmJlemt4Zytz?=
 =?utf-8?B?Q1dyNGFFMHhEQk52RVFKN1FXK2xiYklOZGc3MVNFN1lHVS94dS9jSnorckN6?=
 =?utf-8?B?RGJaSEhaVzY2WE5vSFhHdEExbWc0S25EME9seCtSVkJXNFArZnd1QW1oUEkw?=
 =?utf-8?B?SENxNXRvaTVJd1JLUDAyT1duSExtck5TTzhzVnJpR0M0eEdtSFZhMGhoOEVn?=
 =?utf-8?B?YkdoQlNzMTFnbDN0RTlNQU41RitNSmZ4c2wrSGR3cHJEcE91TUpjOXVTVkFC?=
 =?utf-8?B?SWRrVGtSY1ZlTmxZVmswazNZOWdMUUJCTGUwY081K2NESjFOYjJQVVlkenkz?=
 =?utf-8?B?bHM3QWxWdEdmbHZrZDZhb2xYUEpkcjZzZW9xK2RUM3hIaFhZMWRmVDFKekFv?=
 =?utf-8?B?MzVXUTlzTzN2RXFsbnFlblRpd084S0F5VjlHUnIxWEMrZWljajhXdHRBNGRH?=
 =?utf-8?B?ZUNINDdCc0ZVRjlmb1JzZHUxMGZwb3NjazRKamFMVm1YNC9zWGt3ckhYOEhO?=
 =?utf-8?B?MG5tV0NYZGZDTHJOSzFNWWN0NXRuNFpGQzVwS3NEQWpoWFlQU3dIc2JrRTBI?=
 =?utf-8?B?bTB5enJlMGtidzR2QUt5MHo1YVYrL0J2Mlg2a29RQU1lS2ZHekV0dzdWYlh0?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a02abd-3e4c-4bc5-e27f-08dcccbe95cd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:50:10.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsMas2/mXKKGIeCbDvmBLuuPGhrRhEKyoX96ErIXt+w09/wbbv2HeOUFQHccRYZMYVvK5v3v9zRUHzXQ2YN4FITiW+h0vl6Xoi9sk0jYFK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7828

Hi Krzysztof,
    Thanks for your reply.

On 2024/9/3 22:05, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 03/09/2024 09:00, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng <yiting.deng@amlogic.com>
>>
>> Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers
>>
>> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   MAINTAINERS | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 42decde38320..cdcd23456567 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2481,6 +2481,14 @@ F:     drivers/irqchip/irq-mvebu-*
>>   F:   drivers/pinctrl/mvebu/
>>   F:   drivers/rtc/rtc-armada38x.c
>>
>> +AMLOGIC RTC DRIVER
> 
> Nope. Read the note in the file about order.
>

Will put it in the right place alphabetically.

> Best regards,
> Krzysztof
> 

