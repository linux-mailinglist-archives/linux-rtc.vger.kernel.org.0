Return-Path: <linux-rtc+bounces-2021-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2C97B920
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 10:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84A2EB23769
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 08:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49D8194123;
	Wed, 18 Sep 2024 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iS/wcAkX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF01940AB;
	Wed, 18 Sep 2024 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647202; cv=fail; b=ZDqe+d7ORfX/JARjH+eawGAPbDtECz3c+7ZZsw66q9E/6loKYwq7eq+vmp9PYGPdStgfqO+4Fo+pC+BWu9y+pJ9/QuLu2nmPQ6w90+SARypKW/8Yd8zproTyPFx/PjOFGm+C088m3R5E9F4V/sGUuguGrriaGu9P9cRFQZa2moI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647202; c=relaxed/simple;
	bh=PeN5m4dqEacrZQqE7z8p2Q1Or8d/pdSrrz7j7keCYqE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ChHyTix8PSgCYExhnBg7hJKZxxP/JJIHAEyT4RcCTCqPK8iDpkSX5ZNAy8IwVnjgcvBdKkKOWQRm1bwdWfdfiC1XdGMQkv/RUAlmcKRAfjUnDctgOtr/cPdLOqh5T4C+LoXqP2mwxIw2TjBqtvMRWl9RuiSMpzgnN2vLT0YCRd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iS/wcAkX; arc=fail smtp.client-ip=40.107.241.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gws24rDS1Bl+EuRAWmD1qWU35dcyueNfnoFJzB7aTX5t5UW6AubbdElyZcMKDsS2H0VU9PoSKIqZ5RYphsn2yU5p6MojmcE/F0xq70F54kpAycX68E/3MhD4o5k7h8c8ez1P+hbSIm3ghG2t/KmDOE14cYIwP+EjvGK3fE77hve1j+v4q2/eHLbJCk0WwH0XgHbY57XZ5bLcJT9qzUHvleIGV35yuC+0YF0mU2PynstD4FOhTtzJ0gg3NSpZiTPR8phn9l52wEbDnloci7to/LFBkn2Bi1pctEd0h7x5kPT2dNv64UJ35m9bmHtPkXjcM6utZj8STZ5JYlAyAbvpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2915Mbh3NGRxBpNU6XzJNwRpn+07sfzU9fWd9U1Cdw=;
 b=PsVoIxRrl6Lt6s39C37kMJhml+pZhYYFvqZyb2Etpk5UvaqWfh+YMsjreCVVv/Ik8Og4rLUN48UOXZJ8e8gYRdDsq4xE4DCzuKsCbN3VNR6v49MIBc84+0UtR7cfGuIzlo3FBUOEJmDaxM9vX+DJ1RgO7xlgX6fe8s8Df+B2lPU5l5nEaX7MpBQXH3dwBZAFqx8KebpLqpl7p0IyQJ7l7jXL+IPKbpdU7U96RJX+AFDY/a7PirzSjBeyysOk53kme7zq0RvY3iTLYSdcumCGYW0JWs+JEMvAEjKlRHCMGF9PjuCQbxSwzJ21HOSKOxrOcGpUKC9qw060ELzprt0Oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2915Mbh3NGRxBpNU6XzJNwRpn+07sfzU9fWd9U1Cdw=;
 b=iS/wcAkXW8bldmx0D62r/4b2Vr9acMBhfk4qVBnbwmDJkQ74+c8SBM1qj+jVVOCjwXQFRComjrtUs78bbKI1lI772B7GBYjrNpYv26VTq2S8ZhM/Pir9ZowIIOClUlOwqTD4Wfr1UQiqHeMJEMy3/cPDw5wP42vpa32hjGdSOf0vlYQ1s3nmDBFrORdD3GXakzBmAxDyW+GhAxQLM/I17dwHB29blrRrNPQtlKHZA2oqEyoX8PKIS+Ve5+y2VMpFgfeqiS/MCd1dPwYmVos31qDWWpteSfJMEgiOxRXY9n9ZoCNN/j/J3v2/1pEmS/Wv+d2c11XyCk5g9nlmZoxI3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 08:13:17 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:13:17 +0000
Message-ID: <85a13ce0-d821-4afa-ae69-6ce8e2e3edf7@oss.nxp.com>
Date: Wed, 18 Sep 2024 11:13:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] MAINTAINERS: add MAINTAINER for S32G2/S32G3 RTC
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-5-ciprianmarian.costea@oss.nxp.com>
 <56c16398-faeb-4c99-9eaf-66ac5a872072@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <56c16398-faeb-4c99-9eaf-66ac5a872072@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::28) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 0622500b-a09f-485c-7bd8-08dcd7b9c01c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDl1TmE0U3cxRmtiQU51QW81eUtxL201d3BkcjFCTFg0UlpCQ1ZuY0Q4cGpz?=
 =?utf-8?B?aE1tODM5dlRWMVloSGlVOE0reW9Nc0p6WFdFZytsY0FyYnF3b0x5MEZwWW83?=
 =?utf-8?B?dDBwaHB1b0lDVlRlYVJvdlhyY3lpczBpckZSVHo2K1Z4NDBVOU1tOWtmNTFm?=
 =?utf-8?B?RjZNc1ZZWWg1eENzMURRQXlSbTVNQ0hBZUcvN0luTW1hK1VxQWxyY3g1U21N?=
 =?utf-8?B?TVRqN1dsQWZPWHBKRE9zSHdNMUVoMnBQczY3NmRvQ0FvQWZhMzhOL1A5d3RO?=
 =?utf-8?B?OTJ1dG1LZER0YlhWYVBjTGJZbGtiUmNralpicWVCNFhHY3VuZWNCOXVUYjY3?=
 =?utf-8?B?VlY4YzlmMU44RUpwdU1SQzEwdFYrZkMyaHJUcmprT0VDWWpVaDFnMndIekVO?=
 =?utf-8?B?L2J1MUVmekM3UVpYSXk2OTZRZFhwRkxhbkF4TXFOZFU1VGVJS1UrdmZ3R05p?=
 =?utf-8?B?eVVHdUZYZWZ0c3liQzNrUWhTUjJyeW1zMGNCOTB5QzhFNmNWMDdjWEtBYnkz?=
 =?utf-8?B?VWphaytUVm5LR0UvQmZGdUJoNVdHYTM2bysrR3A3a2Mvamd6blhKVHp6MDho?=
 =?utf-8?B?ZlI0a0psQ3BERlZEbU9rTVNidytYNFpSeHUvOHU4UnRaVkUwOENGWlFodG5P?=
 =?utf-8?B?bWM0NzFQYllDcmpCTTNZR09sYmlNUkRFcEQ4OTJOYUpGVUV2eUJYZWptL0Nw?=
 =?utf-8?B?OVc1TGdWZ1lSZk1OL05SYVpaRUhIRGwzekh3MnR3MURHSythMFgxWEZEaGR0?=
 =?utf-8?B?S3BTQUw1WXVHWGk0VFE4Sm80K3ZUUDdtVmhQZHJXUUVXWGJnZy9ycFlma2Fw?=
 =?utf-8?B?YzZkQit2M05XNHNMYzUwZDBwUEFKb3lQUXlvR0ZxOUJyeWJxbEkrQ2RCQ1Ns?=
 =?utf-8?B?OEFuWjBUWVZqenBFb1ZIUTd4cXlPZE1lUks2ay9NTW1qL0VIWFp1QitYMU8z?=
 =?utf-8?B?VGk0QmJGYStvZFFlN0oyWi9yR0lpTFRWKzI1cHkxYXBCNkEzYmVXTWw5Rko5?=
 =?utf-8?B?ejhMQ01nNjJqNmk4OE5Wa2RSUXBCZWppaXZPVjJXQWtNK2xuNDhpRTRlWkVB?=
 =?utf-8?B?aWswaCtUQTdEczkxVUJXc3p6WEpzWEhnMElMNi81Z2ZVTll5Qm5RcHFJWSs1?=
 =?utf-8?B?bGM1YWxlR3hMTEdWUHNlcFBHRmVMdU9CRkZMeXVoTUsyWFNaVWtCTm9raHBN?=
 =?utf-8?B?a2laNjZDZ2lqT3ZoSjV6MlRsWC9CZHdNSVhnV2lxSk9jZVV6RHFkTDlpWnpI?=
 =?utf-8?B?ajJuVE05VWhFLzhacGFwcE5CZENnOVorV0RVMG5iS1RQNld3SHY3cTZIUnRO?=
 =?utf-8?B?UmlTVndZNGNVQjl6R0Rub3RBTWhFdXJrV3RpTFZDK21mMlpkbmFzZkdONkZI?=
 =?utf-8?B?T2tlRUNhdjJOVHdRS3kyUVNlREJhM1h4amNKYU45eWZNdmJmbEdzOE8ydGcx?=
 =?utf-8?B?alg0WWRnUWNMSDd4Q0ZSZTZmKzNjVVB2T2lDSGJtcWg0ZThqNURzajBwbXhH?=
 =?utf-8?B?RndjcS9LcjlPK01ralo2eGdBZ0JxeHlyM1JVK2xPUHhqL1dyRDJCVmtmdVVu?=
 =?utf-8?B?MzdmbENJZjNOd2p2UTQ1YmZhUnc1STVGa2J3TEQvbStTNkR0OWZFK0dhQTNO?=
 =?utf-8?B?WjBFMDBmU3ZqU0RHQjNabDU5NmhFZks0UEVWRGhxVVZxdW1tYTUxY0JUaUlH?=
 =?utf-8?B?dnNNSi9KMDFtOVQyd3IrWTBLeFFDckNSQTFLbWFScE44VHlWVDhKZjBQTzB6?=
 =?utf-8?B?NTl5WGE2VU5xZnVaVzdZcXhiTUJRaUpuUGhNaFBZTVBzUjlPVnNOYmoyb1R3?=
 =?utf-8?B?WDFhWVo4bnpmdEp0d1Awdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE0yYjJPK0FRTVVCS2FvRVJ4bUV5UjlTdG5mcHVJaVMyNVQ1Ui85ZVMrTHpQ?=
 =?utf-8?B?NzhlbDNUUVNqMlFVR3hEZTF4MG9udzRvU28xenVLSVdrRFRMZzVlYTJDdWtE?=
 =?utf-8?B?d2NwZ3RmZEFKUmZDOG1aMUVsdytwdlhmNWFHNW15Q1BiZjlIWjlkYzRtcXFK?=
 =?utf-8?B?ZndyR2ZWbnRya2dHTlE1cUN1WU1COS80MjdnTjI1clJPZUZ4enAxUWNGak04?=
 =?utf-8?B?SFlqUEJKNkRjRGk2WUttREV4dnZRRkVWT0dzMkNONGc5TlBJblpKUVFmWENQ?=
 =?utf-8?B?MFBxSU00b25JVUd6aUdBQnBoUm9ONW16K2ZKNDROeEthZkhyVDJsZzRFWHJY?=
 =?utf-8?B?M2c0Mk1SajczSWNmMmZrRUNyT3g2TENjVHFZd0EwQ082NzkyMzA5UUVkemZ5?=
 =?utf-8?B?OXA0R0VTM0pZVlhwRmhCazFDMjZwY0N5UEFqTXIxbDc1bUphZ0ZwdFRBUmpr?=
 =?utf-8?B?NHJUYzlGY3lBNmllQUlZNkcxWHRrRmNZV0R4aENnN0MxT0dDOFQvMG1SSDg4?=
 =?utf-8?B?NEJTL1lKUEx4VUZ0MmFlSDlXd21RZlRLR0QxNk9BbzdlVklGTm02a3lGU2ZG?=
 =?utf-8?B?bFZCamVzbStGdTdKV1JJc3pWbVQwemRFS0NTWnZSVFFzNnZnYnNqOGJTcFhz?=
 =?utf-8?B?aU9SalYyRm5CakwrNXlob3I3NnlhR0JOSldiTmJEdXE0NnF4MEcwbnYwQnpF?=
 =?utf-8?B?SkZmRG42dCtlTXA5TlZSODYxY21vY2plYlJmeUJEdGgvakg5Q0w5c05iUlZl?=
 =?utf-8?B?d3RPN3NRTjJrdmhuMTJHaEpxWnpjVEdIUXNISGJrWjFtNXJ3VXJiRUpsMGZV?=
 =?utf-8?B?VEV2TitvbE1NNWMzSjh0RHMvODF1K1JKeFdKT01lYXlHd0FyOEU2S2c3ejRk?=
 =?utf-8?B?M2ZyMVprQlFxRE1ZejdDZDNzSkZoWGxUQW9Sb1VlWmVScUZqKytWMTc4SFpD?=
 =?utf-8?B?NFk2NHJMWFd5K01NcnBLeVR0dGhiRXd5Tmw4b3BjZEo1RXBrSDVKTTg3cTNp?=
 =?utf-8?B?dGxDcTN6elN2cHF1NUw4M1JLZThLcDhRRFNPdk9qWWVzMUVwcmhyakhxdnBO?=
 =?utf-8?B?QzdsdTVGRnh5LzF4aXdyTXNhL01uRTFRMGNSNEs4dUdXcE51azhJOWZvU0Za?=
 =?utf-8?B?alNtSWRtYW1QSmNKcXUzUHVTVXZoN2Q5TXNubmdRcm1TRE5xN3BvdmFVM0N6?=
 =?utf-8?B?ZVpKZXVvUlZCYVhvdG0xKzRFdmluVVVvWFZVWm1VN3hFMVdHVnRuMndQajZp?=
 =?utf-8?B?QjJnMGZGaExIcUFzdkJkMUozU0l2a2FoNXJsNDFyVGFkSzNiYXJ6RWRTVS9N?=
 =?utf-8?B?MytpWkJYQUE2OTI1VVZ4Y0xEWjZOQ25RRG44L1pwZ0lIUHNWVkJXM0hjRWxw?=
 =?utf-8?B?aklyOGwvSWlDbVhLTStEUVBHRVNSendJSCtTVG4yWWhHNVhWbWpEMGxiOXBl?=
 =?utf-8?B?SnJsTHZWaGRKU1NUZGdLVUd5NjFRNkQrbTc5S1V3V2lvQ1hSQzlVdXBWUmZ1?=
 =?utf-8?B?SHhYUHVIa1BTa1BDZ3l6MWZ5REdiMFFtMHVRWFNNOUFSVkViYmlSRnh5VDFa?=
 =?utf-8?B?REVwcWZSWFVsSlBvT2UvazYvNk5tY3RRdmJtbG0wWXpaSWZha09RelU0d3V1?=
 =?utf-8?B?VFl6OFNIQXZkUUY2OWZQQlVLd3BPMWt5QTdCRlMvMHdCbDJPNEswV0paeGp6?=
 =?utf-8?B?TmxQUm9TcmQyRGNONjErMnBRYy9GK1Y0T1JONWd6bFB2OUZoalRmT0oxMnp5?=
 =?utf-8?B?U2FsU3FnNXp3ZDlRdkVaRlBuTUFhVXp3bisxVU1HYnY4V2RQbTdoRncwVHdt?=
 =?utf-8?B?b3Mxa1JMdzdYcThtUThnY2U3WHR0SGlDWkwzY3R5VEplTkppeEZpWU5BZG9q?=
 =?utf-8?B?VVZjaExrdVdtU2RHdHVsMXFzTERZM2I1cU1vV2drSjhBZkErWGJhMlVjSkpX?=
 =?utf-8?B?eFhMS0E2ZkNiUEo2SGhKUDVQQUVKOEZiR1RWNEpLRGYvQUp3eWRmZjl4dUtW?=
 =?utf-8?B?Sm5iTlAvU0dnMVFKMXdTNms3VUN2YkxRc2RVSG15ZGo3ZHlGUjJueUhVL2NO?=
 =?utf-8?B?dVIwWUF4NkF1ZWhESG9mdnRVZE5iNlVlVzg4N0czRWo1OXQ1R25nM3FRRVRt?=
 =?utf-8?B?QnZId0I1V1NBT3A4dEw3TkROTlQwUFQ0WkRkUE9mcjVreEhSaXVLeU94MDBR?=
 =?utf-8?Q?mAWPvrYk5SsG5ClLXIpiza4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0622500b-a09f-485c-7bd8-08dcd7b9c01c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:13:17.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15myyVV1AMz8g+E5xr/4JojIMf9x1+suQswQOHUc0qmgd2O8OYfkFf5z0/TfzzxOGLV5wuIVZvBoKz2CPoKxNEigOqARe3UIjrVWdPWr3ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

On 9/17/2024 8:37 PM, Krzysztof Kozlowski wrote:
> On 11/09/2024 09:00, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Now that a RTC driver was added for S32G2/S32G3 SoC, update
>> the mainainters list for it.
> 
> Why? You don't do that alone. You add yourself for entire platform!
> 
>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f328373463b0..a6d91101ec43 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2686,11 +2686,13 @@ ARM/NXP S32G ARCHITECTURE
>>   R:	Chester Lin <chester62515@gmail.com>
>>   R:	Matthias Brugger <mbrugger@suse.com>
>>   R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> 
> If you are touching someone's maintainer entry, at least you could do is
> to CC them.
> 
> And how many reviewers do you want to have in that platform? Are all
> entries real or some are stale?
> 
> Best regards,
> Krzysztof
> 

Hello Krzysztof,

My intention was to add myself as a reviewer for the S32G Architecture 
and not as a maintainer.

I plan to send more patches targeting this architecture and I would like 
to review any other changes to them in the future.

On the other hand I understand your point, already having a list of 
reviewers. If its unacceptable, I can only add myself as a maintainer 
for the S32G RTC driver, in V2 of this patchset.

Best Regards,
Ciprian



