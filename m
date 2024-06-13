Return-Path: <linux-rtc+bounces-1294-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD3907628
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 17:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A011C2358E
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 15:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D55E1494C3;
	Thu, 13 Jun 2024 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="ucqrYGlJ";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="ucqrYGlJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D684144D11;
	Thu, 13 Jun 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.110
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291485; cv=fail; b=qWyHUkfSP0uF0VlmV2bA6OOtfsZ9rDG/hSueXXZ1DlxkzbBDEXvxx4J5yWsyHHNNqh2D+MXpF5K1I+lAuOvOvCX/iDAac27374zCjVWE2LxE5RJcgpP7+HVhvOY0lXnOXXvoHhKiybyJPB1H70i0pbmsAOfywSzjBuTECsWHY0I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291485; c=relaxed/simple;
	bh=njhyMa05MxSlEqzganD+fmICRV8Hw1c6wEu/CefFqSg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cM2iyNdHrSf96PG5QKUpTi+CALqNfSuP6ddXrkOCj9wm6JXSju1UjVNQ9+5WII4g/oaN7rJHMH4s5vgcIjCl/EHiJ3u4p5UfjI2I8rxSKmuD4EoBFxny33jjm5hdvDV8ovD+Cdd9yV6Cq1pLCYCpYrKpXPNZrAp+ArWv9LeWfPU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=ucqrYGlJ; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=ucqrYGlJ; arc=fail smtp.client-ip=40.107.22.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RuEWMnLv5+hrfuadxMNQhxlsFpBttv1HOKyEOGAFc7sanijZwAqQ97AVR5QBVoAae4Q2pgSDOuxPUF1J53fG7lVw8Lu9NnOwH/3bG5dc64TDJnxrOwrT+Z899Qe5q2Vg7/30PAuOSsAKt53exr0wkxid5+EiemwpHEr352j8Mf0eoYz1Gf44rdpjnIT5DM/Qqk5lbCsolsx0WYrt20BE5YbBgSGOc8kOSx4KYvxRBns5JSVIDxvwQ2W4olFCI+xLkOeVPczuavre3ne+EZ7s7MCtYDae0Ks97WZ5vl1dA5R7lxRGcStYKAKLsKZQ4KLhHjG2XKfqt+8DsjRndUNrxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzRdmDmwBl7fcCp7wq46YeqeUjX6z9vMsaRD5xJDy6s=;
 b=mD7XaMfI715HnTb3A5pzdn6k1JcnkiN4TPdI8eJ/RlACFeL27gRUPihhgysjAV4dGQgydITxfbDOdbDS+Dm1Fr+GW9+rGSMZyPRMfqT4S/p0LLLx3/HYsUqsBAjC4CFzGzaJUimS3nYdt+V75+EYyqztYkGFtuyNhhno8Ud+bDa/AQLr9NrO8YC7nNtBLQqAU6NWDulEiWS3d4hXTC7Kz02uqRUHw+qUa/4kl5c31j8vxn2ORNs8KPkoyBk3YIld7A5N4q5MOXfVJcgCjMKTxrB63VTC+jNA3VDgvEUqpycLc/JOD3vew6FQcA+n3smRMjPRHQZivDPTC1eN2uKeyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.86) smtp.rcpttodomain=bootlin.com smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzRdmDmwBl7fcCp7wq46YeqeUjX6z9vMsaRD5xJDy6s=;
 b=ucqrYGlJjyRYq+ZhmnuZh1vfSvCZ1Soc9PvvFMR35xfDFHgXZwas3k12n7/w3RyF49N1nJwJyfAEDfebmFBaGuKH2wVz9aeVkTTkBZSPdpFgBEfC72YjJOhznWJspGCShJexAryLFoSdV8exUPRM+4/G8jrEQu7SVIP+XlrOFAxSqwdUHJGhwBB8Oq3M/iSdy73LOaS4nTsvp5yMUPNFe5t3mJsYGVzPwYnE3PIhE/tlIL+lD155i92trEXwLQtjv5oTRuKfwPypLURUmPhNV7xFp6i8xQmMmcRvRNPPa+3ElYZQbS7fW8+xvJivgZCIL+Kgx4iHXgVBQbkPJ5flbA==
Received: from AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) by AM9PR03MB7850.eurprd03.prod.outlook.com
 (2603:10a6:20b:431::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 15:11:14 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:468:cafe::ae) by AS9PR0301CA0030.outlook.office365.com
 (2603:10a6:20b:468::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 15:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 13 Jun 2024 15:11:13 +0000
Received: from outmta (unknown [192.168.82.140])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 6CE4F20080F84;
	Thu, 13 Jun 2024 15:11:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.40])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 211682008006E;
	Thu, 13 Jun 2024 15:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEoQZORJV7noFWtkxBUg0xsikcsnZ9uz1XccBHRtLKwXea1C5ynlo7aKYzaqlYF8YgDVq79YD1FIolbQjMO2uoIuNgFTfXC02yImdot/K7UL/jm88AbA6rH/hnkvD3tLrDpLmLts74Kd8jXob4FhYHrBTlOj2Oj0eha4CKwUA0+Rp6eW93NNRWYNOoF9QMuw67cTvyT4Kp/DUf1/Z8iF9/vXznVuN7I56kyHtVwrsdtAtjQs/ZeAtZHZQaJCZGrvN9aSHmamtQ1B+4W0PIGgJULQwnHc95cK4LCgTAZEbpipocjIBv1KWb1hsyRmI8+o+6GtkZTmHWJPxCoincxeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzRdmDmwBl7fcCp7wq46YeqeUjX6z9vMsaRD5xJDy6s=;
 b=Ho16oJC5OEV0BRVBEMXfFaQbivXrhXlnfMIEB6o0W3x8vEO5YpqjUhk1zwHwY1pjZqXmSY5pySrXs2NKCFOnzLFymf6YxOYkGWNHhDXW8vTHSorsCwdEGMlWkpwJFEqAJVxjYyC8Wk3NYrQCYo0Q2MHN75K5nvgglTVdcZEO08FENYGyxHb74iS00YJugbyWX5PBN1V78raSE5vn3lIhzHb9+/ayeq/i0Av8U7X35Ymr9vF3RCtBFRSZCzLcVtpB1xxxFfUIBGlTunaiKevKqlKmfk22LcEKpNGPePUnhDHvAf2ZVsrkf3IoB/lfOEA7JyJNOVEcqWAPpw7JxVoJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzRdmDmwBl7fcCp7wq46YeqeUjX6z9vMsaRD5xJDy6s=;
 b=ucqrYGlJjyRYq+ZhmnuZh1vfSvCZ1Soc9PvvFMR35xfDFHgXZwas3k12n7/w3RyF49N1nJwJyfAEDfebmFBaGuKH2wVz9aeVkTTkBZSPdpFgBEfC72YjJOhznWJspGCShJexAryLFoSdV8exUPRM+4/G8jrEQu7SVIP+XlrOFAxSqwdUHJGhwBB8Oq3M/iSdy73LOaS4nTsvp5yMUPNFe5t3mJsYGVzPwYnE3PIhE/tlIL+lD155i92trEXwLQtjv5oTRuKfwPypLURUmPhNV7xFp6i8xQmMmcRvRNPPa+3ElYZQbS7fW8+xvJivgZCIL+Kgx4iHXgVBQbkPJ5flbA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by VI0PR03MB10805.eurprd03.prod.outlook.com (2603:10a6:800:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.22; Thu, 13 Jun
 2024 15:11:07 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::3acf:6b06:23c3:6cfa]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::3acf:6b06:23c3:6cfa%4]) with mapi id 15.20.7677.014; Thu, 13 Jun 2024
 15:11:06 +0000
Message-ID: <b26d352b-145f-4fdd-8e7c-2d67ef8967d7@seco.com>
Date: Thu, 13 Jun 2024 11:11:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
To: Joy Chakraborty <joychakr@google.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240613120750.1455209-1-joychakr@google.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240613120750.1455209-1-joychakr@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0054.prod.exchangelabs.com (2603:10b6:208:23f::23)
 To DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR03MB8847:EE_|VI0PR03MB10805:EE_|AM3PEPF00009BA0:EE_|AM9PR03MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: df616738-6312-4141-1b51-08dc8bbb10d6
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230035|1800799019|366011|376009|52116009|38350700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bXVBRCswTzFxd2tRMGN1TE1VWDhnSng1Z09DeWxoV1VQL0p0YU4vYjJCMEJ3?=
 =?utf-8?B?dTI1VWYxdnBITW9UTzF0Wm5JOWNXM2ZPQVBnVFIxSTNHeHdKSElEaklSN20v?=
 =?utf-8?B?N0ZJNnhtaGhTcnRzRWNDVXNsUjBicjcwYlJlUW0zeWd4KzJIdTFqeG9DWkR0?=
 =?utf-8?B?eHVIT2pHb2x5YzRLVVB2QTlSWHVBQWE1NHJ6aFpDN0hIeXV3c3VoVTM4YTQw?=
 =?utf-8?B?QUFtcmQ0STkzcVdmVVJ3V20yUU9wd2V5dzY3eUJVd0FjcERQb3VYTkZ2WlRY?=
 =?utf-8?B?Vjd1S01KeCtzQnZRYjQyWE5KanF1TGd6Vm9jbHZnWW4wdVZKcFFVYW9Ta3BK?=
 =?utf-8?B?NlFNTzNnK2RCMkJCSCt3UHVhOS9OV3hwdlplNmJVd2xNK1NMdHNGbGJWVFJk?=
 =?utf-8?B?KzU2Nm5aNUdUVFhMTVRVcGxnZ1c1MlZTZ3hEQVpZTTJwaHRmWFpKc1BVaXVn?=
 =?utf-8?B?R1NKZC96cTdrQjgraXJNZlFGUWw3UzMvS2tGek5hUDlqWFVKcDVvdUREQjRl?=
 =?utf-8?B?cVJXZ1YxeUdibzlZSnRNMlI0dmhpMlRpU05qNFhqdHQ1SDZISCs3U3IvazdO?=
 =?utf-8?B?eVJaeTFsRHBUandNdGlISVRMOEFxL3RZNm40YmlTSWhwSyt1bExCSTR0UHpr?=
 =?utf-8?B?UUQ2ZG5NNEZGWWwrRGtSSWIyYk1xQWl0TkpLUEhueTBBYkVCQjBla24vVG5Z?=
 =?utf-8?B?TmFMM1FnNC9oWXJJa1h1N1BYaEZVK2xIbEh0b0xvTGxKOFZuUStyUFV2VHBl?=
 =?utf-8?B?MW0wMmdyMmZQRDNwenNFb1ZsL0lwRzlraCthTE03U0paaEU1UjN6QnNwSFdV?=
 =?utf-8?B?M0hBbVlWdmhRL0E1L21EdDBKamlIbUoxWjBOV0tFeGtHOE8xSHJNUTI2NkRG?=
 =?utf-8?B?ZGhTRFdrOVFxR2hjZkYvMC9aclhRS3YyVFA4Ujk1M2xsZEQ5UlMxbUFyeWIv?=
 =?utf-8?B?NmhYWlZHQkJiZ0Q2U3pLUm5XVVREaEdXa01MNEVTTnV6QnY5cGNybXVyQ014?=
 =?utf-8?B?blVrQTBJMS9JZEpUYVo0aWl2MkhJbVlHNWJZREFZektDTzhtWlltQzFKN1Vp?=
 =?utf-8?B?d1E0bHMyVzE4WUU2MlkyaUdWMzlTb2l0cU02anhyQ0h5TVQ3TmZQRHBPZWVw?=
 =?utf-8?B?cDQzQWZKZnpUY1RSYVhSZnJRKzNYY2dwNVRtbitwSDByNTVlMmtLNGdtTWNP?=
 =?utf-8?B?YjE0ZVFPTUIyblYva2lqZERPQnd4WnZrQUlmckJqS3dQZ3ZPTGhWbzdNaDFu?=
 =?utf-8?B?NHA1Z25uQTlUbGQxNkMrMXZSQWozNXNET1YvTCtRZkIxTkJUZW1zRm1zd3Jz?=
 =?utf-8?B?ZnFHeXBKVFl3M08yWXY2b3FRbEkxTVk1RS8yTHRDZEdhVGxxenRrbmMyMUJB?=
 =?utf-8?B?UzdRVlNjYW55MUZVZkZvWGNKVmxidVNBeEl6dW5BemRTanpPY2lZdktzUjBK?=
 =?utf-8?B?bEFMR3krL21hamRQeDhVZGhaREs0WFNDYmV4QktuZkgyM1M3enU3YUpMWE5r?=
 =?utf-8?B?UkFjTFlXVU5sMThabmJPVk9kQlZ1eVdNVXZOQTlRNjY1dGk0WDA3eDRudGZi?=
 =?utf-8?B?QzZaMnZIQURzQmZiL2gzNFI1T2RxMHF2QzZUb255QXdHeDFZdTJCMlprdGpm?=
 =?utf-8?B?Rk9YWTBZM3JpUjdxNFM1ZGpZNStRTU5NNWpySTVDYUtwTFZLNVFiY2JrZ3FN?=
 =?utf-8?B?cy9XVzR6OFBMaVVNVlJzcjc1ZmtnVDVFN3ZNUkJiWjdDVHpUOFR0TmVodzlY?=
 =?utf-8?B?cThxbHEwVE5wL1VENW40cDJvRVRsOHo5VkdBV0RlMGFjUUFCcFdKMmFkNUNs?=
 =?utf-8?Q?f1qwQsoeyWN6PJxOR1omj48M/oKg1pZebgFbk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009)(52116009)(38350700009);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10805
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f985abd-0910-4f40-91f2-08dc8bbb0c8e
X-Microsoft-Antispam:
	BCL:0;ARA:13230035|36860700008|82310400021|1800799019|35042699017|376009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXVPaFNoRGNNckw4djV0ZnhlMFZvaitMWm1XTmxoMjRtUjEvaUNCN0NKNlFt?=
 =?utf-8?B?T1Q4K3VpQVZjYVFSYkh5dGVwWW5FaVdIa29nb0pLUXRCWnlSbkNVbEcvWkgv?=
 =?utf-8?B?RERrV2Vob04zMUVWUW4vdWovdEtUTHllcGxCTjZybHRQTXNneHo1OVQxYURo?=
 =?utf-8?B?KzdWYkJySTdYZnVVcDBFYmdBT05uTVNTclM5eXd5TTR0bEZLWGdPZmNWOUNH?=
 =?utf-8?B?aFFBK2M0NGllUnMwTVplTmhFZE5BRWJMRnBabWZLbDdrT0hMaHRKUDNrMHlE?=
 =?utf-8?B?WFJjdUw2c2FNQjFmYTNNdEtlZ0t0d3dHZjNuOE03VDdGbmVFTjI1NnR6Sytr?=
 =?utf-8?B?T25NcmRENFVxY1FIN09iR0p3UmJ2QUlobUZ3Mm9DMUxXbUwvQmFjVERmVUpY?=
 =?utf-8?B?NnE4U2ZMTzRreDA4NHRiUThoazBmLzltbjk2NjYvbk85Qkx1YkVHLy9IN1JZ?=
 =?utf-8?B?QXVQanpCMThZOG9QdS95Y08yekdKdkxnNzBWc2VlY2M2OTJ5N0RwZk9UbFoy?=
 =?utf-8?B?NjlaVWphVGpuQndmeUNJOXFpUlBXYzFyQ29TSzIyVXdITno2MXFCV055dDRn?=
 =?utf-8?B?MUszZ3NDcEtBL0hCL0NwL3dlZjl2b2RjeTR0cE9NTGgzNHcxSUJRcEpNc29S?=
 =?utf-8?B?SFZuNDF5K2JsclNWT2lqbEdyK2NOMXlWOGZaU1R6UXV3VDN3QTE0WVVlRjI3?=
 =?utf-8?B?cHp5RWUxSGFyT0Jyd1M1RjEwQW1rRzRacnp2ZGdlaFRSTXdJTFoxR2Q5WjNJ?=
 =?utf-8?B?bER5eGpGbWtaNGdBZU1GbjdYdEc0dzczQkJPOGViWk1KTlEvYS82K0FiQTNn?=
 =?utf-8?B?dHV4a24rWFlOUWJZQ2pVNlJxSm5hN3VrcUtaTWdCMnhpMEFKQ3VZVGQwS2c0?=
 =?utf-8?B?VkFJalg0cm14L2xyVGZqa2Z0WWV6S3FzZy9GZExpTExsZ0JnOTBTQTd1T3JP?=
 =?utf-8?B?dEZXdkh6cllWRllmMWtQSzNoNzZ5djdYMFpmZVlZVCtEL3pybDVMZ1R5dENk?=
 =?utf-8?B?Y2l6Ky9kY2dxV2dxeVBuUEVlZ20yM2xXOElEbzR3MGpmSkhjQXBlSVlZbFR4?=
 =?utf-8?B?RTB0NnU0eExRdFpDa2tmb1dxWkkwNTBMN2JMaWxuVkYrUmVjYmJsL2JDZ0FS?=
 =?utf-8?B?Qlk0YzEydXY0REZJSHpUckplckNiL1o3ZDd6clFadjg0dUxYb1hZanFsNXNY?=
 =?utf-8?B?RkZRcWUzc3J2SERhYUNFendTczVkby92L0V6VjEvUEE1cE1OTjRGbXg5WW1T?=
 =?utf-8?B?NUhwWDI0cjJnL0VLOUlKMmVpUHdyRlhjRHpmejBDeFJwbzhhQlVOQzB2SWFY?=
 =?utf-8?B?ak5ObUZCT05kL3RHM01HbXBqNXVhK2VIY0ZOM1RFRmNzb2t1MDRDcVI0NThE?=
 =?utf-8?B?dENveXVWR2U5cFZ1OFZ5NW9la29wVEg3bzAxQThxaUhFaFRjY2NJVndCV2R1?=
 =?utf-8?B?ditDRWtUSFlVY2NVc2JNUGl2bzdSTE8rQzZ1VmZ0eTZRdURXb2NuTGhEVnlq?=
 =?utf-8?B?L3JmZ3lhZUp1ZFdWc2ErU2E4cXYvZStzeTMyc0ZuOHRNK0M5R1RscHZ1WW84?=
 =?utf-8?B?MjJaUzJ4dm9UQjNGUVRudk1TUUc1cDd5MTZkZEdUcERmSGpvZHNlaVFLTWpI?=
 =?utf-8?B?ZU04bGI4b1hjd25kc3BCN0wvU09CNmw1N3hDUEJjNnJqUW0rcjlrd05QbFoy?=
 =?utf-8?B?VWt0cGVzd2xHRjUyVS85aFhoOFJoV3VGZkxSME1WTnVybXlvR2U4SDhPaTVH?=
 =?utf-8?B?UUpHTC9JMVFIb0dtalJjSEdLdEppK1ZIMG1hRjRhOFI4VmN6QmtHTFVhV2l5?=
 =?utf-8?B?TFlVMllpNk51UmlERUt2Z1ZmN3lpZjFwY2VTQloyMGdya3YycDZGRHJaT3ZQ?=
 =?utf-8?B?RnFnbFBrNkFzZWdOM0ViUC9zdEhwRmJYRW9zaHdDWlpLS2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230035)(36860700008)(82310400021)(1800799019)(35042699017)(376009);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 15:11:13.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df616738-6312-4141-1b51-08dc8bbb10d6
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7850

On 6/13/24 08:07, Joy Chakraborty wrote:
> Read callbacks registered with nvmem core expect 0 to be returned on
> success and a negative value to be returned on failure.
> 
> abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> returns the number of bytes read on success as per its api description,
> this return value is handled as an error and returned to nvmem even on
> success.

Humm, I wish this were documented in nvmem-provider.h...

> Fix to handle all possible values that would be returned by
> i2c_smbus_read_i2c_block_data().
> 
> Fixes: e90ff8ede777 ("rtc: abx80x: Add nvmem support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/rtc/rtc-abx80x.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index fde2b8054c2e..1298962402ff 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -705,14 +705,18 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
>  		if (ret)
>  			return ret;
>  
> -		if (write)
> +		if (write) {
>  			ret = i2c_smbus_write_i2c_block_data(priv->client, reg,
>  							     len, val);
> -		else
> +			if (ret)
> +				return ret;
> +		} else {
>  			ret = i2c_smbus_read_i2c_block_data(priv->client, reg,
>  							    len, val);
> -		if (ret)
> -			return ret;
> +			if (ret <= 0)
> +				return ret ? ret : -EIO;
> +			len = ret;
> +		}
>  
>  		offset += len;
>  		val += len;

Reviewed-by: Sean Anderson <sean.anderson@seco.com>

