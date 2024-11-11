Return-Path: <linux-rtc+bounces-2499-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B699C41D6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E69B23635
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB62F1448C7;
	Mon, 11 Nov 2024 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vWvDtWxe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC949625;
	Mon, 11 Nov 2024 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731338929; cv=fail; b=VgI75GN+jlTBPwAztVqD5tjrhxdi0CsdBaOuznzD4QJXvkfbi1mf8T2DuorM6+HyYDsDdop/O07f3cbK6ThMTI/zHOhqNajJPFr8t9QpGx6fNOuSMd408bRDtFoarSKCCQc/md5s57CRpafjFA15UIRTEJhaotPo3mXp1LVgNuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731338929; c=relaxed/simple;
	bh=DW0F6hkG/dHAcjOg1/j6gbuMmTTdO02/w4GiVJ91OCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W8wdSYPJ5SsC8mBYEFZaR2sHmoCVfpwTxVeoTruvYIqRO+b3tBwviwKVQ7cbJvLp7OK8ayyzvvLU/Cb2gc3dI3zrOSpu6leWeUxBuu1iSnrjx2LOTd3kJr+BYHXZZqCUHr9DrHkHKxzmdrwkBJjLk43vhD1P7o9KI/8Tkqiz5X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vWvDtWxe; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ31e9nlT7fMs/6qd1C69cIoipCJZcjqz8xnUME0tyRdcVoInppkhVmqsLPwgxuNv8ITD1gStCco4ylU8roBT8pYaGTgbLiclCevUksboOdFndkYH94y2Ti0QR5kGrTNr46OMd/05GWjvm0kvzBq7QIBzDgIQhqFq0cLqQ+W68sT6ZIJIQGqY/T4E9KqT6pjTAFdIz0lSY9gqzH45cFzVLl9Pukd0Rdo0xpUrOJNz+SD2pfLKAKWUBLe/C6HqcZ7jCpObbFsDeCtVzWs8KBNEoXag/WppEwrQVHRE6EUjmAQ8mLwVXyUCw/W8J4YnKR2lBuwkczSMtwBmU0woWQqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D18yWPeYdHPkWE3SPkFruv8Msmxg6Vk8Wh9ab62hLlc=;
 b=vqTQoTRKYkuEROtovKWWyV/u9W0fmjofe6Ydtc04X+wJk1TYtY/Ke7bpPNPUQz0RGqxDSU0o60U9Sk7zz1WdNqcpNK1CAjXmiIpcNViN1FGS3Agx7rf+vUejJJeNVZ/DBo6QXcZyesz4oo7U+aIwSFc0Ff/AQDYrQQsCAOQTayzpi10G/7oBOy5TyWksjkjuXTuiQCX/+vym0TSgLOCe8mnfkX4sSM+P64rn4+0tmz3ZSg5bw86sqs0/uzt28VgjmfF3uCTbAGLO8z7mFUnqqwcVDXdF9KxzgSqABRkIKlZeGVb22B+1psWhcQRbcw7wwMXz1vOS9/WhewrihGeVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D18yWPeYdHPkWE3SPkFruv8Msmxg6Vk8Wh9ab62hLlc=;
 b=vWvDtWxe9MNRvvFZ1ywv8E7Ics1OkAonHxv3QDiQjnaxWkila9+cx/WHyI4W5tJ3ls1YB8l/NtPxz1ln92N2bP2h2n1dUqUrxExzd86GRx6dJjKdQ4Av8Uh0PaaDsNX5+2pLzLZwrq474L3BczU9gtsZKglDNxiKVigv494z00AVEcezjt5TbF1EzyFfLcP/WAlSJxw/upVNxEpb6/YuCVcU6MaD6oy43BuIoaKzQQ8T3t050ZBtDC40FSvmB1g32pEAZ08OjcZoi+V6qQLc9CVSVP2zQH9zPsMYlJGI/yRo8uMHujJnTldUMJ8KzRoTmXjPSx/0CMuOoakrKCG1pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:28:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 15:28:44 +0000
Message-ID: <28ad9cbd-0a5b-4da2-bab4-6e55fb04c8a7@oss.nxp.com>
Date: Mon, 11 Nov 2024 17:28:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
 <ZzIfOwm9b0IjPd80@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZzIfOwm9b0IjPd80@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0084.eurprd05.prod.outlook.com
 (2603:10a6:208:136::24) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 36db9d84-dd9c-49f9-2a23-08dd02658701
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWhESFBGTVptTGdZVHNqekpYTjZHVkdHRkpPYjdYeTJzTllnYU9vWjVuWnJN?=
 =?utf-8?B?cVRTVVhaSlVYSXRaWDU3YUprZzdzcXJZVEdvVldjQjNDWWFTdkZUQ2FUdVpi?=
 =?utf-8?B?V2h1TTNCRzEwdmNodDJjMEdYeUsxTXRxVHU5UzhrMjg2Rm1hSjR4N3N5TlB4?=
 =?utf-8?B?WTZGeDE4Q0x3V2pZeFlrQWlaVC9rK20yWU9qUm5GUG5vNGFudDZGZ1NOM2d5?=
 =?utf-8?B?WVV6aEphOFF1QlFYdUR0RHBCWlprdlUxWURsTER1eDFVUWg0UHR2RUFQMkNB?=
 =?utf-8?B?ampJWHBnd2VlamFtb1NjRERHenZrK2NLV2FMTHA2a21SdjFWZXpBTTB6anVt?=
 =?utf-8?B?NDR1cDIrODNWTW84aTRjQVMxcXJhT1lORzFwQ2tuZUNsL0xjUlB6bGJRQ2dO?=
 =?utf-8?B?SlllUG45ekdSdFZjcDN2SEEraGQzQWEwWjJYenRqTkdZbkQvU3BIUU5iWllK?=
 =?utf-8?B?UmhBY0l3Slp5eXBINjVYd0RPVldYcEtXVnFlMFAvZVZJdlEzVCtKMWJWd0M5?=
 =?utf-8?B?bEVEK0I1ZzM0YW5hZW5WSmpvN0FVNXIzYkdZUFlobC8wc1FUOGx1QkZxbGkw?=
 =?utf-8?B?QXBia1Ruc2ZQZzJmeGNWKzI5a25zTk9KYTQ3Q3U3bVArMmhMU2cxSjl0NXZm?=
 =?utf-8?B?ekhCSmNmSGJIeXUrQ040bGNuSS90ZTBlRnB3cFd3SElLc1R1SGN0bGVaSTFP?=
 =?utf-8?B?RDBYWkhDYnlDYjd4b1dBSnloemdsejEycys0eGtPY05QM1pCY1p2QW9uOFJy?=
 =?utf-8?B?eVU5WEFLeTZudVoxamdURmFORHloYXljZzZxWnN0Z2RwQVRpSXBnL1NqbGtJ?=
 =?utf-8?B?YnRGek83NXhPWEI3NklrS0U4RURLc3M2YlNTdTBicDZRRkJMZ1JIcHJ6VjBM?=
 =?utf-8?B?UUNkSlhaU01qRHhTaElGTUdyS0liajBGK2RmNWN2V001WVdWaDN4L3RJQkpR?=
 =?utf-8?B?eU5pVm9ubjYxZUhIQXFLemg1S3lmNW1kbWJpZDlxQXlrMk5WOTI2b3lvU0gx?=
 =?utf-8?B?UnJQejlZVWpVQzNmb3N5L0R3YUNpTjdCeW0xUnlUdjdmTVVvU0hmaGFuVkFI?=
 =?utf-8?B?MSs4VWlvUVhUVXBUNkZsREh2YTVuQmtqcjNyWHY0MS90UlNlTVpyRjc3SVJG?=
 =?utf-8?B?ZWJpSzVGeVhJejc4NDlHb1J2Qi90eGF1VmNGcFRWMHc0UFNyUUZVM2l4SEF4?=
 =?utf-8?B?VDkrRDVoajJ2dWRwNzkxTUZUYis5dko5eHYrUEM2c0FtemZvenl1MzZ4UndI?=
 =?utf-8?B?NU52bFYwTlVyRDdtMGFLSkFFRXVXWlZPcllZNFhOS3pLdVp2aEJrQmhmMnFG?=
 =?utf-8?B?RmpMQnh2U05uWnU0cko3OUYvbXZveXMxMWlWOHd2SktkYzdUa0xsUUJOZG9v?=
 =?utf-8?B?a3daQ1NoVTJydWpsVXJZM1BRSXRYbEN2QlAyRUFhamxHZDQ0ZlpYUklqM24w?=
 =?utf-8?B?QU84SnhYYUdteXkrV1hjNTBxbFhicjErQzY1aUJ1dEdsTjJEeGd2WC9ZdmM4?=
 =?utf-8?B?R2IwOWhuUmVyYzdoNFZmeU9qcjVSOFBBeGpncWU3bUNRTFZCeFo3eGlFMnZY?=
 =?utf-8?B?MDZiZ01VU2wxdGVLb1JnMG5sV2ZCdjRzZkxhTXgxejNBU2RhTjRUdFZiTmli?=
 =?utf-8?B?OUZoOUxKR0xJZXY2M0R1RzBTZFlLamZ1UzgyN2ZPNmZ3ZjBDTlFSNzloWWY2?=
 =?utf-8?B?SGxQZFl0WEZaRGx6N01rcDVIVWp1QUQrMDhGSzhKY0tScnpIRk95bGxnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldvbEVuRllHcm9hMXl4RFY1VGtwMCthQmt2SjhtbTFzZVJhN0xrREtRZXJ2?=
 =?utf-8?B?Sm15U05PNU90RHZtbk1WeG5QcWhaQS9KaHEyc3d6U3R6Ym9ueXRjUnh0azBh?=
 =?utf-8?B?YlNmdHJIbUdjOU9XM2kwYXhTZ3VyUHNWN0ZkTXNYclJxRzhUaFBuc0lqZjFN?=
 =?utf-8?B?WkVNTnZSUURwa3BySDNRcytraEVXRnJEQnd5YVBWTDgreE8yQVZ6dStVb3dE?=
 =?utf-8?B?SW5xTXdqOU1VWVd3OUFFZllmUDYzM3pRNENWWGpTekRXbGpWZjRhRUgyTkZV?=
 =?utf-8?B?YUI0MmJ0bHRIUTFRZUdHaXQrMHpVM205UzVSUm50MC96WSs5OGdmSHU1b3Vn?=
 =?utf-8?B?WXU4TGt5YUZRYTM0V0FOeU02SndTZzBQRHRhcVFlcmhoN3h4WUlXYU1hbENq?=
 =?utf-8?B?enhqUTM3TDNpQUU2QmlMTEdLWUVWanZvTkF4ekVxeDF2d0w0aU1CeGVseU5N?=
 =?utf-8?B?bzFkdTV3TU4yTWMzRDA5K3NBb3N4VlIwb0dmd21rREV1SWttRHFpbDR0MWRa?=
 =?utf-8?B?YldpaDdVaVRMT2x2YjJmRW9MVE5hUFpBK0lwbVVrZms2OTJ5MHJTZUY4Z3l3?=
 =?utf-8?B?RWFTaW03R3dZNTB0dVA0OE45emk1NFF6Q1pULzlZWTNDZXBxSnJBUUEweTlE?=
 =?utf-8?B?WHp4RjlOY0w2QzJIanlaK1dKRWYrMllNVnVyTVpMTjkwV3M1QXFFVTNrSjFz?=
 =?utf-8?B?ZGhwTFRyMDlrTmNGbFVySXhpYmpjV2tObUxyckY5Q3hySEdpd2V2L0YxK3B2?=
 =?utf-8?B?TnJlTnB4UnNqWnd4V3NvNzNrRXpxU01uTTIyUkUxYTZ5WUpxZkY0Q1RJYzND?=
 =?utf-8?B?N09aRU1FRWhNck5oajhodnZMaWllQW54RzgzQWtvOWFLbCs0ZGpSajBjTDhU?=
 =?utf-8?B?OTYydUtKM25QZjJmeDFENnI4QXR3MUZVV0xmM3ZEN0FMektWRUxHa3pkYW5O?=
 =?utf-8?B?NEwxaHdSdzNWdkg4a1V2WUVNbXZtV1M0Ulc2eHpReHJNUW5Kc01xbzI5UGZp?=
 =?utf-8?B?bVQyWm41ZXl2TkxJbk5kMThtR2kxZXZNRTZXWmduVURxdEVPejVZWHVORW56?=
 =?utf-8?B?ZENCQ1ZSN0FZL2FxL29DYWRydk9CTE1vS21UcGF6K0dYNnpuU1ovODdtYWlR?=
 =?utf-8?B?SXJPdUFVYnFUbFZMc2FLS0ZDaU9FRlhoRHczU1VYNXE5UkYyRi9zd3pkZldq?=
 =?utf-8?B?SlpyWkN1Zk1pNTJBWC9xSElYNmpJMkEvM0RmMEJnSEl3WjR3YjBKcXdoWVQ2?=
 =?utf-8?B?d3h2QkpEMXFyaVg3UkRKMWcrdHpONXo3ZzRiU0lBYmMyeXk0WUY3L2FodHdt?=
 =?utf-8?B?WGVTMFpuRWM0c3VXdnlQZ0Q1RE1SeVh1TUY1K1YyWnYyWkR3RFFZSW1DU2VC?=
 =?utf-8?B?QzNsL0Z3ZU8rU2FHZjBxbVlLQVJ5WUNXdXA4RUYxR1BSYnh1T2lweXZhZW1i?=
 =?utf-8?B?WmY4aDJnWlJ5QTR6VWpEOVJLWDdFUEVwVlJ3d1YrdnJxNVdrZmMxYzJFTDNv?=
 =?utf-8?B?Q3h3RDBVYnR6V0V0aEdlbkdTbzRiTi9LdW9iaGJIU1dFLzg3TUkyMlZHc2Ra?=
 =?utf-8?B?QnU2M3FGdVNnSWg4WVduN2ZFNkdKUGlmcm9pQThnamRaOW9FVjZSOEo2Mk1m?=
 =?utf-8?B?M04vd2hmaVlqQnZxRk5yYTVBMEowWDJKeTJFeDhJankyMlNaaFFaYTdwakVa?=
 =?utf-8?B?THhZMHNvekkrdkJPYTU5bEJmeTVQcTIvYklYRU5VUlh4c1piMDJOQ1V0ZEhS?=
 =?utf-8?B?ckZsVTNWT1RQT1RiV1RMZjFHeDhodWdNQ2c1M3lzaXlOcThmbldLQS82ckho?=
 =?utf-8?B?R1Y2NlFadEpjaitiNVNoV0lNanRsTWswVGxpaGFzbkpkQ2NrbTd0N0k4ZlBS?=
 =?utf-8?B?OGFGTmhqaDRZclB1UmFxQTdDL2wrUUdsTWo1dS9tckhoMGhLbE8yZjNvSXlp?=
 =?utf-8?B?MnViTWw5bVMyeTFNL1ZLQjk2MlhPVHNZVVlaVU0wdDczem9QSzF0UnNWSkdR?=
 =?utf-8?B?b29scnpTa09TYUVpaDlkcUNMUEdacWtDR3BqOHZJZGZkOGdoTldoU0pBWG0x?=
 =?utf-8?B?S09sc2Vsa0xxVEE1ZWFwUHVpaEhaUVYrK09MR005NkZ1V3NwT3BYY0Y1Y0ZP?=
 =?utf-8?B?VzY0WTBteUkyTTZ0c0g0S3ZCM3pDemFZaG4vNHlod1pPbzRhdnVPdkxBQUo3?=
 =?utf-8?Q?hYSPKCCWUlSgUhPhga7dymM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36db9d84-dd9c-49f9-2a23-08dd02658701
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:28:43.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1/7MSYap3cf0j2CfdIeCr76YOxm2LYr8wl7Se8ffLrywQxYLUt3UCnkfXv5Rmu3iwffi/LF8tMaIJ1wWYhTr2esCHcYyYcD61yyFed6lt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884

On 11/11/2024 5:14 PM, Frank Li wrote:
> On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> RTC tracks clock time during system suspend and it is used as a wakeup
>> source on S32G2/S32G3 architecture.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
>> during system reset.
>>
>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> new file mode 100644
>> index 000000000000..231811579e1b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>> +
>> +maintainers:
>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> +
>> +description:
>> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup
>> +  source. It is not kept alive during system reset and it is not
>> +  battery-powered.
>> +
>> +  RTC hardware module contains a hardware mux with 4 entries/inputs
>> +  for clock source selection. On S32G2/S32G3 SoCs, this mux is used
>> +  to select between a clock source for runtime which brings more
>> +  precision but is not available during system standby, and a clock
>> +  source for suspend state.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - nxp,s32g2-rtc
>> +      - items:
>> +          - const: nxp,s32g3-rtc
>> +          - const: nxp,s32g2-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +    items:
>> +      - description: ipg clock drives the access to the
>> +          RTC iomapped registers
>> +      - description: Runtime clock source. It must be a clock
>> +          source for the RTC module. It will be disabled by hardware
>> +          during Standby/Suspend.
>> +      - description: Standby/Suspend clock source. It is optional
>> +          and can be used in case the RTC will continue ticking during
>> +          platform/system suspend.
> 
> wrap at 80, keep wrap pos consisent in this file.
> 

Hello Frank,

Thanks for your review.
I will update wrapping to 80 characters in V5.

>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    rtc@40060000 {
>> +        compatible = "nxp,s32g3-rtc",
>> +                   "nxp,s32g2-rtc";
> 
> align to previous line "
> 

I will update this alignment in V5.

>> +        reg = <0x40060000 0x1000>;
>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clks 54>, <&clks 56>, <&clks 55>;
>> +        clock-names = "ipg",
>> +            "rtc_runtime_s2",
>> +            "rtc_standby_s0";
> 
> align to previous line "

I will update this alignment in V5.


Best Regards,
Ciprian

> 
>> +    };
>> --
>> 2.45.2
>>


