Return-Path: <linux-rtc+bounces-3773-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB72A7B7C2
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 08:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168053B5E0B
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 06:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ABE186E40;
	Fri,  4 Apr 2025 06:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EAIS0M2Y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F53FF1;
	Fri,  4 Apr 2025 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747939; cv=fail; b=O/pLv4+56rZ1rqsjqShpZlA2ujLx1nWoC/yepZ7qn9nyzqpkZqe97yO/tonU5ISzFfrKmhHCOJZn6TlbQsEOYh0zi+M4KmfCz8gMnXccwBN3DqI3P7bpKG/sXE+zmdVjZaIzxs3RqgrdFA/7xDgVa32ZlTnnjDPxRGUBavn+evs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747939; c=relaxed/simple;
	bh=JjHW+4st9tJBXi/M7QCNdWxj4lQL42QsqaD5ksyGLTk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eXeqDAq5pn+Vdfhzob3zRaBQDtGEofBUZqOU+E9omh8mFyoIc3AGL9xqrvRSjCUOAE/xlgrjEvWOAZICS6IFq0GkEvRBYqjd3tVLB5pr09XXLSOf+SVKIVc7E1jCSHi6h8aHEObLSBSd5sDeBqDSA1qvJ+IhxfAqvPzpcq+6I7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EAIS0M2Y; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8oytPZcAIoZFTkYHRr1MjrD3zs6P7uePftfmcW/Qk0CjGuSuKHTeKkgAI2h7789jWmk1RZn1Gm45qvaCOS7efAVhWhK5uUMFRs+uWlHp3yswGcN1h1s5os0bkNDBerQPHtJ9LISpzIg+bbULz+s6PBFiFLxC46PbCKNgOMAVdI7v2Nxq4CPiXE7h9O86eBLVzS10j79NYG3Nbk9l5v6Ls02/XQOmMuuVZ67Kd11ARurMKu4b7Vf6YmKrPAyRYRIjVLSzM5SAVay4zpe3+TupN7d5o82yscWpAQGJtsOrJOUatWbeLOySpyxatWoLppAf62yl1uohd+TFu0hi9IETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlIEXLhelU1bU/VOL6sqcqPL6QDxgGM1kU0r6gfuTVs=;
 b=Q8bll1RK0Y9ppzC36CjA04uJ9WMkpd60d0cmJG2m6j2AtTmO4eteGeDM/8LrjGVe4stSRDiYQC/350j9JeU0Tu6cjqOJ/poIZtl06a89A7517lBQm1kFtYyweBiPKsuNisPOoap6G2Y25kpgncJqYEjb6mmJ38A0nha/o+STbV45NsMEOW7i+bCx3/hFp+TD/hhG0/zyhlZ409oQwhRPge8z+CsafIRBJo4OZIaGhlQpgXejwKAzcqKw/CIcLBLzp8Wi+PPJ9j6dRUF+mUhTGVoPvs/JuZqB6YwA+ltjRM8xoZ5zHaHvW6JGn6c8MAkMdhPY3xzZcxVUQ+5rJEi5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlIEXLhelU1bU/VOL6sqcqPL6QDxgGM1kU0r6gfuTVs=;
 b=EAIS0M2Yw/b98pRIDr+e8LK6LItZU8slRvND68vybCJd4jSs5c09RmoR+8f7cgg6VVXY1OST07Qa0l4LU2oP3lAtA0440/flCuY833MbkilX05f7yPDTMzw0McOaHlKtcd31qw5FzxPzTDfRgQO6ImusUfiUNBlw/Ybnul780RtL3fOywA+PL3SdNfYE6NfyfOplIy8I8qkkmmLXRZLCVcIK0doSq09jJa8FvnNn8RVnjEWQb+qXrGujB6JfLYpbMyHsfQyPahqElwAsh1Y5vO0OkIFnLwnyKowZY7dJvY2odaW3T/ZbepQVE7xfqaJHE4mo6kMix6R4Nu9xgeho3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9242.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 06:25:30 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 06:25:30 +0000
Message-ID: <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
Date: Fri, 4 Apr 2025 09:24:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
 <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::33) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: e6871bec-3741-4b9e-f461-08dd73417f59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFBZSlNiNUEzZDludDBkMjkwOWNkdStNS240dm4wblNlWXl2NGQ1K09FYkVC?=
 =?utf-8?B?U0FCaThKVW5KYTdVQjAvMDZBRGlMZ1NDVndObzlTcUJoSmxsSzRjb0MwVmVx?=
 =?utf-8?B?U2ZjN2NPdi85bUNWWU94WlAxVm5KRkZCT2hLVGlIVHBLZTBpcnRORnNYNk5C?=
 =?utf-8?B?YVlXT3RrTGx3MlpXVHVSQ2FVUnJmcnFJRHI4UW82ZkJqYWVMOTJRdng5bG80?=
 =?utf-8?B?Q3llMEl0Q0kvMEl4ZGFYQ1BxTlJwMFFRb3l3bWR5Vy9BakMxZlFwZG9vZzhF?=
 =?utf-8?B?Mmk0dnpFTWdpU2xxOTVhaWdXUzRrYWJmYzM4TWREMGswTHNkejhJTVdPd25U?=
 =?utf-8?B?RXZveXRQdHhhMHVXOE12YmRMYUFsQmpGZmdUTWJiRFFFYTE2aDlka1diNWEz?=
 =?utf-8?B?RURnK2V6VlYraHNtd0QvVHlvZXZIRGRzK0loanBLYmhGRU5JdGhDTTBYaHZw?=
 =?utf-8?B?NkpXSnA0RldrelEwaWtLY2NKNFRqL25GWGt5eUlaZ1RsMC9VNFdOYzNERjFr?=
 =?utf-8?B?ZlhmV0NHUUgyQVpqbi9HR2VFQU5ZSUZhakFKL0RSanYwUHNxM3hOVnhYSXg1?=
 =?utf-8?B?SzhkemFxZ2EreXRPZ1AyYmdrM01xYk14UTVmd09yb2RhUzg4WnptWEZ0aGVx?=
 =?utf-8?B?VkI4NEZWR0V0dld0ZUZ0aTI5K2FHVkNYeDlWNDNXTkx6MDFwUGc1WVFvTVpZ?=
 =?utf-8?B?bSt2WnZQVDJWNnFvNExQL1JWWjBNSGhXSHZGcnJlcmJvejRoeVczOGFNMkVL?=
 =?utf-8?B?NVU0SDJoUHBMSlBzS21XR0oxYi9wZkw4bGpSQTZuaVAvMEdHZEFNOTRXd3Ux?=
 =?utf-8?B?eWpPaWd6bnhCb3A5Ni8rWGhlTjJ4R25rbmU0RVhzbVBmSUNJemVYTDBSbGxD?=
 =?utf-8?B?eGpCUXh3M3c5bmhWU1hNTlUyK2xpZkFUVVZza3hXY3d2aGFUbmJsUEJUbFlz?=
 =?utf-8?B?MTROYlprazFscEQxTldweXVtZDZSUmUxaU4rRSt0QmpiUzY2Q1NkbEdyTmN4?=
 =?utf-8?B?cU5kK2JwNGVZZlNCcE1qU1hFVWhPM0FOakxhRHZPcWEvWkQwalJOcUVQcUJP?=
 =?utf-8?B?L3N4bzArOVZpQjhXcXdCYXBJbDJSM0kxUk9MakRqRzEzdVFvUC8yN0RVaGEw?=
 =?utf-8?B?c1ZaNEpsUmlLL3lsVzNpblMvTjN3bEJXd1FDRU9rZXZ4OUV2UmZDbnhOUE1l?=
 =?utf-8?B?RjJ4VHVxMnMrRWU5aWJWaEduYkpOcTU3eUJQNmZlVVBwR0NnS1RZTnlvcWlD?=
 =?utf-8?B?UlNreVAyeDBqUWpWNEhMUHE3M0dwM2NIWklCdmx4SlM1aHZsTVVzeVN2OXBL?=
 =?utf-8?B?a3VwS3AwN2lrNkQzVDFPS050Y0ZUdHVpcHBzMlQ3S3ptTVF5NkxHY3BUL01B?=
 =?utf-8?B?VkVXZnRTMFltZnBXYzdWYjBLNkFqV2JzTlNpbW9zditaRkI0WG5LRnBrTVNq?=
 =?utf-8?B?R0FXVmxHaXNRc0dYbUVyV04xUXhtMEp0MGZ6UHhWcEs1NXBmZXpsdDBteDVW?=
 =?utf-8?B?VERVV3BLbDlseFFyU2tnUUVtNnc0NkVjOEl1R0pJd3BHUFZ3ejg3YmxEZmJu?=
 =?utf-8?B?MXYrMkpRV1p4bk0zT09RVit1eklZV1ZOaExaMTlhVjIxS1pWa214eU9aV1JF?=
 =?utf-8?B?Mm5PcVUxbzZDMDVyZTUwaDYzVkIybDJ5bUFVb01GNFpUSG5uTUZ6bnF1MzR4?=
 =?utf-8?B?a2dGU2s5alAyKzN1c1A0Z0hDcnRhSnlwdXorc2pXNFdBY3hmMFVSbTNnOU1r?=
 =?utf-8?B?SW1LcVhGSzlMUTN0QjhFcDR4OFpKK0J4WGlvenBhNlhVL0s2TE1SdkFFZUJt?=
 =?utf-8?B?RzdVdWRkenE1MGE4Rk43NVZyckk2K0Z5SlZ4MlVsc0M0V096L1lNcURjRW1W?=
 =?utf-8?Q?yKa3nAVfByzVv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRvc1ZVTG5zbWdmK1ZhYjBVYXdMdHB2TldJNFBCNnhmUUl3WGZ3endHc1JG?=
 =?utf-8?B?R2Nxb0dxRXZtbFIrR01lbjYwM21yOVl6TUJENzRmTFBHSDMxRHIvampTdGRW?=
 =?utf-8?B?UTJnMk5HRDI2RWR3WkdwUE5BUkRXVkIvZHJKeW5UY0JpTC9PUDlsdWhKdlg5?=
 =?utf-8?B?cldoZVZmNDlhU3JtMjcxNHJGc0tpLzFaSE41Z05YZnhsWEl5WEphcERsUDAv?=
 =?utf-8?B?TlVqZndYUk16UkRFQVpxNUo1TExVRERxb2JyaG9pSXc0cXFETFhBOWZUZjUw?=
 =?utf-8?B?Sk4xL2c5Qmt0QWU0S2djcFZ2MkU4SS9nY2MzNjJOMm4ySElWV2thVk51Y0xr?=
 =?utf-8?B?TVQ0SkQ1bzJnMGNPaFRsZFlqdy90bnFQV2ovazM0K2Z2U01NZG5tUExZM2ZP?=
 =?utf-8?B?WlpNTGt1VjhQbTdiYkN4SXBQMWluMk9wODdXUmNrRDBTOVA0SlZBTCtDL1hN?=
 =?utf-8?B?NG9oM0N3WFJsblhMM0JQMmtpMVJvSWVkUExDSnZaazMzMmhKY2xHMFJwKzQ2?=
 =?utf-8?B?NGxML21BWXhPMjR5ck5lMVVUOE1vU1RCbkVuKzhBVDVaYkJ0Y1pCWUE2NzZ2?=
 =?utf-8?B?emxXWVJoZW83ODFxemZ3VXNTNzNJaVArUjRaLzJlZGRrMVdrbTBLQ0VQbFBj?=
 =?utf-8?B?aEVxSUYyOWVHYkRLUlhQMWJ5THJ3M1JWcW9TcXlPUWFPcWZTVzY4Uzdrc0hL?=
 =?utf-8?B?ZGY5bmZYek1aMVdWbnpNMDl3dHRQb2lVVjhvbG1pTHpEcWpicmVGdGVOVlAr?=
 =?utf-8?B?VWo1OXQ1VENrSlZIYmdKdXFvcSs5Wno5T0luUVp0L0l0c1kyalFwRE44V2p2?=
 =?utf-8?B?TjhXU3hNcS9oSzNmaVJsUnRBVXZKZ3R0RGNENzZaMU5nWFZXN0ttcGlhWjlN?=
 =?utf-8?B?NXp2N3FNZytGZ0YwREl6Vk9MOEVUWDBObldaZWNvdXFUcGh2RERPSFZZa1pu?=
 =?utf-8?B?eThkTjNmbDNaSmhQSlh4bkdYQ2lmMHpwT0x2TERGWlhsVkxZSTJGaXoxbDBw?=
 =?utf-8?B?amVnOERiRmpPTTRGTUNnU0FseWc4UEVMZ1BJT0lFNUtmYVVNUDY2di9HVnUz?=
 =?utf-8?B?eW95ZFQ4Unhsa0srUld1aWlTdVpCMXBRd1JqWEY5OE5aQXFndUxldGNrS0ZF?=
 =?utf-8?B?VzlueHRPcVdBQUFBMUNwTUovbmsxRTZ5ZGFVRlozR2NzeEh1VWZwc1M4cGJO?=
 =?utf-8?B?KzJMY01mMjc4TlVucUZpZHZabEtFeFBOcEhaeFR2NjNFNEhJSjJnaUVvS3hQ?=
 =?utf-8?B?RjltN1F0eUV3SU9sZlVkd3BvTWw5VjVkMzhpQmNJTmtHS3kyRHpDSlhHMnAx?=
 =?utf-8?B?Y1E4SFBwTUFITk05Tk0wRzJPeUxyU05Ra2xMalJGRVV4TU1kVDJ0N29icGVG?=
 =?utf-8?B?KzFCRUpEUG5FdGZhRWI5dEwxamNCYWtFMkxRRTRzUkV3VzNlMEhZcEkvME1F?=
 =?utf-8?B?OXZVL21ucHQ0ZVZVWHZjNGNUZjZrd3FkdjFZOXlqU2NXVXlBU29ycnFKOGZn?=
 =?utf-8?B?YStiRmhUdTVSTkRTYVhDaFB3ZWt0REQwNWNVSWF2SnJKdWwwV09mNmh5U2ly?=
 =?utf-8?B?ZG91dkFaaVhwbkhCREN6M1FGOXZZZk83Yld6RDVzcGMrZW9Fc1lTZUtHbFIz?=
 =?utf-8?B?czQ5R05RQTI0SlZnUWg3ZEtwYUo5VExrQVNrcmFtOWNuSENtcUVyUENDQURB?=
 =?utf-8?B?SzRwY3V1bTJ3Mk9Bbmp3eGhyNHBDOStrWjMrV2ZnMzNCbFMxR1dXME1MMFpZ?=
 =?utf-8?B?ZTh5Kzk4Qk43VElFa0RaL29IRjgzT1czZTIrZU5iaVUwWFJxd0JzemtwRHhz?=
 =?utf-8?B?djRiQllpNmhUQmtOREZrZkhoaEVRZVNPNThLb1VXNnpnQnl3aTBjZDJhaGty?=
 =?utf-8?B?dzVEUnpxMmJpT1BneWpJTmZCQ3IrMDBrZ3djbCswTktvNDFKZVRycC9QQ09o?=
 =?utf-8?B?VDVuNDZqNEg5WXpsbFgzN2FHSWI5amN4Rmwrb1BQelVBbFk5WlJwMlN3TFEx?=
 =?utf-8?B?VjBSUSs5QnlCbnorL041Z2N6ZGdLYllOeDVYOHZ3TmdIZ05kODBxcFhUYy80?=
 =?utf-8?B?TElPYTVvYVVBakZmNUhrYmo5T3ZneFY0YXdMUkltV2VlRnRQd0FhditDN256?=
 =?utf-8?B?Y0hTdWgwWXpYb2xNNkRnWjJnVm1PVm9ReFJ1WU1MNzcva1FTcG1tOFE1bzNR?=
 =?utf-8?Q?2Hx/UCGfuZsj8nj4CqlMWwA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6871bec-3741-4b9e-f461-08dd73417f59
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 06:25:30.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZSrd5iMskTmf+TYm67YIh0NDkhX+3PLvICAhChrE16BHi+9PDQV6zKcC8+OIANUdYGtPuCurRC/iYU8B+rv/mXPYKg7whd1qywJG2NvGSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9242

On 4/4/2025 9:17 AM, Krzysztof Kozlowski wrote:
> On 03/04/2025 12:33, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> The RTC hardware module present on S32G based SoCs tracks clock time
>> during system suspend and it is used as a wakeup source on S32G2/S32G3
>> architecture.
> Which boards are using it? I don't see any DTS (nowhere), so I do not
> see single reason for this patch.
> 
> Best regards,
> Krzysztof

The RTC module is used by all the currently supported S32G2/S32G3 
boards, so currently they are: S32G274A-EVB, S32G274A-RDB2, S32G399A-RDB3.
I do see your point in the fact that this driver should be enabled as 
module only after platforms are actually using it.

So, would it be better for me to send a V10 in this series with the DTS 
patch added ?

Best Regards,
Ciprian

