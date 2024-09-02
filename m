Return-Path: <linux-rtc+bounces-1824-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9E9681BC
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 10:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27B91C21DF5
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 08:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708D185B68;
	Mon,  2 Sep 2024 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OlSfwIUs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FFA17A5BD;
	Mon,  2 Sep 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265660; cv=fail; b=F/SonbYXItE7FAvLFs0uVafDslN4sCYE2zRgEa8r1oBWFOnklI5I1VHFCISnEciHoWk1YhiLmuoWKxeINAhcpZW3OS8Oz+3HIqABaOCxp2ydsVyS0vQtf4jKYuxgLt06YB9afiZnYsH/6NFbri89YcSMvtUXI7GJopR9jNFYc7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265660; c=relaxed/simple;
	bh=SF3efS6JJddd4KZqFw7MQUWZPF57NG3CvKygWzI+DcI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cqKjr4JBJZIQl+LjwxtofKPAg154J+MMaxDqIf/FEUWoFkwNynSXzb/tN2yJS9ECLn1qm489nTkAXk2ZQGVqVuyRevCQXA5SkmlnS02itMCqClWt7UBFMZiHOnrNxH5SgMN6Ge8rznGe7tJK8uq3eOBGWs3NPtGtPsT1gaO0hps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OlSfwIUs; arc=fail smtp.client-ip=40.107.215.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eD4hZqg3sEZ9RKRHCTmFV4wMZz0w6lZvbuH4VTdkr3hz2SK02dXIzel0OhyhdYEZX9wxyUq8/N/YETw0eIct2UiPlDO9mCI8hA4EBUcqROvWcs6FbOyZmh5+M9P5UE8ppnW2jmn+Lk7ksEbt2vmKe5fIFE448hBctWhfZdp3HcHvg92HHOX+ec1ymUzOuPrhVeO1cxDYipFe0h4+eCfsJZM9oGKjfIgV4XeNlvVcV2dal6YcKgF2D4RfYBpd3rk096eS7o/BdPp3AhQf4LfVEve+vRt6E9uJUo8pIClFB5US0xzHXnQvzEsGPvOHmYrdg1NWHMyN03Kxm9AQK4ZN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUZeETGtmA5nZjcPbblvs/z0HFESX80PF/sLS3KmaWg=;
 b=SH0FcCdVvTscPrOAGGY+OfpTlteXrNRvnzTLyKE6UegK60MncweCyXNEO+lVfwpTE2RvqDpAHyGUrpFrSNZB0GdSR3BvAlf3YC2hVSPbc/vz1JCsKhD58DhFD7rTkGxnVNcgjz1lNTSVyTBtVfVHP64auSacPexycuS1fYuVOFqvNho+E3U6G0IfvMoUceRKucOS/3N8gj0GS8mtuXaVVM0MUU1toAjq4YgSwgAYZDUBttul1osTda52krYfqEF5H0LIl6nuB/wpmV2v3oGIqKRYa8P1rgR1YKj+byqICqxpqDhofajvUfReH7ts5KTUhQsXacmG0JwDtc58gR1j9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUZeETGtmA5nZjcPbblvs/z0HFESX80PF/sLS3KmaWg=;
 b=OlSfwIUsZqX/yVveTawido0+B5JDOO/5I2d2iiLxWUK4uui3LjWtEuSWrWdnHsF2QySXEUsBUDciS3Sq87JpASpNnA95OfAzWyo9E3OFjewjoRF98ZrF6N3CV/2giovCOdOETneR5Sfuz7hVeQy4iOovJ4DAMjDuOokBBs1pFp/6ggv/0YmWqCjUSOxqLGKmnGTdCyPPkBHjuIeFL6G/ZWQqE5t3PR1ZiITKoYRv1w0bKEUeIuW1O4CmraGhZMUp6BbwFqfA4tCkgywP/ffarl4DdIruhZJI3TMNyEbcwrbQ/QzjTV/TYSlgKNS3AHG8vT45rwCrkU4Y6xs740nJlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB8592.apcprd03.prod.outlook.com (2603:1096:405:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 08:27:34 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:27:34 +0000
Message-ID: <3e889ca9-e124-413a-a672-c7369cd2b3c0@amlogic.com>
Date: Mon, 2 Sep 2024 16:27:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-3-6f70381da283@amlogic.com>
 <4b79fb7e-7ff6-499b-b615-e1bd69a46d0b@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <4b79fb7e-7ff6-499b-b615-e1bd69a46d0b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: c389c5d8-dc68-4a34-46f1-08dccb29182b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckNVQzFtaHlmU294Y1A5RFVSaWU2dDN0ODZycFBNWnExMU9pRExRcWlRejRY?=
 =?utf-8?B?TCs2dmtadFlKSUpGWUVIZjBzZnVyeWZoTFZ0L1ZMaSs0M3Q4anV3Y1oxOHh5?=
 =?utf-8?B?UERuc1JhV2VUK0tEemF3TWtSZjI1TnE3VFQ0ZFVlUWErNVA4M0xqQ3lHYkl1?=
 =?utf-8?B?bjgrNzQ3dEYvelRQbFJTSC9yeC8zdUZpcGpUV1hsZEdqdEVmaFo4L1kxUTRB?=
 =?utf-8?B?MHZQRHNxV0IzK09CMFppMzJFS0U3VzIrVXBwUjcvYnJwWmlBNDFCMk5DdzF3?=
 =?utf-8?B?elN4M1BIVWxFV01NMVdSdTllajdqa1JJS1o2Q3VrMThUbGN2THdxcm1tRmF2?=
 =?utf-8?B?Mm9SNlA0ZnZUUkJOMHVhNS82RzRFSTl1bGxCZ0NHaEpPdmNTOGZoTTVNMEVu?=
 =?utf-8?B?QUtTUHpDNjdncU52WEdqWk56SEc0QnVuLzYwSm9nNkRyZ1ZlK1V1Wk43NE1t?=
 =?utf-8?B?WHd3Z0ZWL1MzQWxscVN6dkxxN3FwL0JIRlR3MXZXSnZZeHhtYnphQmJlc1du?=
 =?utf-8?B?RXhRNHBEMkptTTVSRC85WkV2cnhkaTVGK09JS1BIamZsNmNXNndvaHBqSzVN?=
 =?utf-8?B?K202Rkd4WHZHTWtmMXhpN1VRbjdvdzFkVWlqenhBaG8vK3Q2bm5aMldKckRt?=
 =?utf-8?B?V2h4bXg0aXpjOXFBVnU4TzNWTHdFNlhVOHl1ejhTZjU5bzRMZndkM0lvYmNs?=
 =?utf-8?B?MGRWVEI2a0ZqVDY3T3N4VVUvV3dMWWk1NDlmbkgvbHFnWk5yYWNvS2V5TXV0?=
 =?utf-8?B?MHUxQWpyLzMxaVNITGxUSEdWT2ZzK3R3c2d0MzVpQlF0T05LelFVNFZ0K0s1?=
 =?utf-8?B?SzByUUZZaDVMKzA4NmRwMVkzR25DN0lVM2x1VkhZTVM3aENHK3Q4ZWVGa21C?=
 =?utf-8?B?UmxIUnBDVXM4Vzh5KzNWYTk2THFwSVY1WTZPMm9IWXhlOEhWQkNqSXphVGN5?=
 =?utf-8?B?ZFhTNXdTL0dRWVI0ekRzeHoyR1FvY3gxQnVpYk12L3hhUUFva3BtQTNiR01i?=
 =?utf-8?B?YXZlWWFsbTN4NFRKaiticlB1WDllK3lXSGJwdzE1K1piamdFNnRuR0Y4Z0Rl?=
 =?utf-8?B?N3F5WFNlb1RZb01TRXRZUzd1bTdod0E0MWdWOGZyanliUlU0bWJxS3VOT0hD?=
 =?utf-8?B?WkFCcW00bnhJOHpES0hUV21ac0lGUXNhYmtxZDd0YTVEbi9zSGRLL1pMRHZG?=
 =?utf-8?B?cndjNnhjMzZ4eDB0c0dCd0V0ejAvQUZBM2VYWVpGUHZKNlBnaGoybmJuaHJI?=
 =?utf-8?B?cXIrYmhKcDBuVDA5VGczR21JT2kwQnFHYm91azUwK05zYkxnMS9tc1RzcXB4?=
 =?utf-8?B?RmZnYXhwR2pBSDVhUnZZY3JILzZDNXNxSFg5YlJnVlM3TUhkeVhvRnRvNWFn?=
 =?utf-8?B?b1g5SzlIZ1Y1NkdENkdZRGRPRG5MeDlwRXZ1Mk5zeUordW51S21GRUFWVDc1?=
 =?utf-8?B?c3kyMnJ4VlFjN2xyVXdoeXJ6dEdSOFI4TjN0NThCSW5yZjBWT0U1U3pTRGFE?=
 =?utf-8?B?cDZvWkpBQ0JDQWc5MUNLdzhZeC9odVdicnNRTnMxVUZKeW5BN2tRNjZFUFVN?=
 =?utf-8?B?cDZNQ0xaVmVXRzdpOWQ3bVRtK2lpY3dRd3gwWlNFQWJvM2FsdWxmQ25iSFky?=
 =?utf-8?B?MUdOM3lyOVF1cjB3ZzcvSkxBemNYbFdZa2FxMlJSZ29ocTJsNmtDMlFJQytu?=
 =?utf-8?B?YmNzUWRBT2FDbkFxYWFDOHNabWVzcmVrRVJKd0VqV1VFdEp1dDByN3M2eVp4?=
 =?utf-8?B?cnpKajJHRmsvOHJ1MkgyQm10Y3E4cnZ3SUZsejk2YmU3bFJPZTJVbVVBc3hP?=
 =?utf-8?B?bGpTSXdEblB0SWd3Vm42UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFscHdkbnhhTVl0WGxRYXB1MDRGRmJnMGc4czF4TmRCNHNSYWcyZlFzcy82?=
 =?utf-8?B?dlc5SmF4RnA3cDJxNkRFSytFSGIyS1d1Zk9wdXhwaXU4a3ZUenVPdkJRU1lI?=
 =?utf-8?B?OGVxRERWbHIzREdxbkRPZmE4RC8rTzRKWHR4anpXVllrU2l0cGthMXFBcGRR?=
 =?utf-8?B?NURHam1mVVJCOVZjMVhWazd1Q25GTG1oREFpYWVQb3M5RlZTdWFWQVY3MThY?=
 =?utf-8?B?ME9BblNKUHU4eG5EMnNyVjkwb3FOY0pNZFhQL0FhRG1EczRUaTllYUtaa2l4?=
 =?utf-8?B?a0lJUDRJSnRTcGlXKzl4TDlsQ1NlOXdnaWJVTmpUQzRhY0hvM1FKdkdtVGs5?=
 =?utf-8?B?NEYxTGxZdk9UWDZPUlV4WUZYem5JNlVCYTJKaXNWV09QRkZESVhrZjBVL0Fi?=
 =?utf-8?B?NGlxZmk0UU14UjBYdDQwZERnRzhOTUJEemxhZVZ6Q3ZEUkdUZ3ZqbnArdTZL?=
 =?utf-8?B?Rk9qYjZ3MTdVbVRxc3hDZzhlOTlVdUlWemJQZ09UUzdwSUhJWDN0ampueDRq?=
 =?utf-8?B?UVhERWZpUVRFajBlUmpoMWRaRHNXaGVOQXFWZGZzaCswMzhLem91QjZQOEZD?=
 =?utf-8?B?YUhQYzFscjBMQzJ4M2JHYnBYbzk3ZmtwWjRYdFYzUTF3dDVFZUVkSzkzZCtW?=
 =?utf-8?B?NTBZYzQ0NkVyU2JXSlE1S2dEdi9tMjc4a3ZpbmdSVDdSREVHOU1UTWxsdDRa?=
 =?utf-8?B?Zk81dmc2WGhlK0lmQmxobXRMR3RIYVduMFBqTy8vSEVFcjloWkRSRXVRZmNj?=
 =?utf-8?B?MXJVR3RRSCtaTnoxNHY5dEJDai85SS9tMVR3alNZM3JqblhXdGdyYndPWXBT?=
 =?utf-8?B?WG1Sc0Q4dXdNQnRmMndQTVNTYzlVbCtnVXdRY0YxTjJGYXRsemNBblB6aFNB?=
 =?utf-8?B?YitROGFCbEJTdVNsSDdadU5KMnhQTnZIZTJJRUNHTzVmajVTS0Jxdmw2SzFa?=
 =?utf-8?B?YzFLVHlyWmxqRFV1N1BvSFhoejBzZUxhNGwrUytodXhMa0hwMFZBK3NQbkx1?=
 =?utf-8?B?VmhHbGRvQTV3dTRmSk42ZWE0VUtaZWZXbVZHaDJXTlB6bWsrRndpekl6dmhj?=
 =?utf-8?B?UzJ1THVsOExqNFJNcEllRnVIcEtWVGJCR0YxREVncXF3VDhJa01XQnNDbVZU?=
 =?utf-8?B?Uk5SZmtCclNjblJuL1F0cXhSd2E4TWxGZ0lQMy9ZbXlzYmZVR3BVOGw2dVE2?=
 =?utf-8?B?TmtseXo2TTNUeVFCc3NOYmc4MWwrQ01abnRQWk95eDAvNWt0QURQaDRTaTlM?=
 =?utf-8?B?a0s3d2sxWjY5TzZZV3V1U1F3cTF0Tkg0SlhXU3ZGcVBkeUhyRkVqUCtkemFH?=
 =?utf-8?B?Y1kxZjFWSHdDUUlCWERCN25sNUlsMUhTVjYwanBURG1yYjA2TXd1RVlmTXpD?=
 =?utf-8?B?Ui9oaElHSEZUZk9tZEk2VHVzSnBNRVpGS3FkSEhaSUlsblpkcjVpMEtHRjZY?=
 =?utf-8?B?eVp1ZkV0RDlNRWI4QnE4VkNSelNudmVmU3lKZlV2U2pLSktrRFBSZERFQlNB?=
 =?utf-8?B?TUxXNC9XOUNUTVF3WjhNNGltekNpR204NmZpY01wMHN2eVBsNm1HZFV1bTJT?=
 =?utf-8?B?MElwRTZWcDduc0JYckZ5Wk03cmZ0ZHFicU13SCtKcmpuSkh4cEZUQjNDcWdv?=
 =?utf-8?B?WWxaQ2R2Y0tOa2JPbEIweGVDVmxOaWR1amZPeGlKZUlFZWlmblZ4ZzVVcGdC?=
 =?utf-8?B?cU9yMHZ4bzAxTTUxelBOeU45ak9zcVRaemQxOWJHdlZQOXJpYnQ3Q0JPL25P?=
 =?utf-8?B?ZkxGNWxDWHBZZ3VyWjJRSlBUMld0OTVPZlppRUw3WHdiYmZoMm80c1dtcWNr?=
 =?utf-8?B?R3RQNzRxeWdWUGFrQm1ER2FzMGdkNGVtOEpjYXBTZEFNaWdXNEsyclNnamRp?=
 =?utf-8?B?OUZhMXlMRk4yODRKR0pRS0VQWDhFUjJBMkJNM1ZySnZuQys1RVVVUjd2TGVk?=
 =?utf-8?B?bzN4Mmd3ajlGT1FLS2RMVjlWQjNQRmNlRFRTTldZcnVmbGpWZFZrNXVKaDRX?=
 =?utf-8?B?S0lXWFdNNDU0NmtkYVE0V201Zk9WSndYMnZJQ1hUMXBHeXZoK3FQc2dQeUNS?=
 =?utf-8?B?TlB6WUhUdERPQUdHMXoxM1dhVllBS3crVmUweUNOK0xQZUxJVW90dDdsMHFR?=
 =?utf-8?B?dCtRNFdOejZ3SmluWGlQR3B0ZVhqU2wzTHhaZ3RSU3pETExaVEdxcnhnWXpu?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c389c5d8-dc68-4a34-46f1-08dccb29182b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:27:34.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Txhji8aepdIrw8fE7dz2QAX5fMKd6O85tQxr/vYK6gRAP2SyZ8OUrkQ1aZ8ZQRJi88A25IaAGowDfGwhCaTXWOSZRAZ1NpTReyCkhP+PaMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8592

Hi Krzysztof,
    Thanks for your reply.

On 2024/8/26 16:28, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/08/2024 11:19, Xianwei Zhao via B4 Relay wrote:
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
>> index 42decde38320..672290dddaaa 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2481,6 +2481,14 @@ F:     drivers/irqchip/irq-mvebu-*
>>   F:   drivers/pinctrl/mvebu/
>>   F:   drivers/rtc/rtc-armada38x.c
>>
>> +ARM/Amlogic RTC Driver
> 
> "ARM" is for Soc entries, not individual drivers. Drop. Place it
> correctly and use capital letters.
> 

Will do.
> 
> 
> Best regards,
> Krzysztof
> 

