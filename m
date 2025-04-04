Return-Path: <linux-rtc+bounces-3775-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A5A7B832
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA5D189D446
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 07:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5C518E750;
	Fri,  4 Apr 2025 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RRlYeGtZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2069.outbound.protection.outlook.com [40.107.247.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388F186E40;
	Fri,  4 Apr 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751205; cv=fail; b=lda6Pcen2xPVaUhjKL4QZLl1YtdV6CbL6s+MBPZOHPWPoKZTP2uIYaDYHAm87Nk4WcHsR8MHZRS3BgwGmAe7nQEl2ZjImNdH6Zd20zWw5K8Hk42KyAPO2tirFD4ZAA9EOhWQCKoCN5sH1Kq6IohRK8A5jA/AS2Z2Vr5oT6vFZ80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751205; c=relaxed/simple;
	bh=MZDCrkfglUmyE1h9UrofJ5uRP+HtQRHIZwKxUaGvJQ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dF8kwkD0LkKc2bO+efovhLn0pP98xW50muGRPUXx9Gascn9gq7YZWV3Fz+5qcB29T6MH8LkpcZzH0wqjOtIhWxmoSwDXFF02I4nbqjlMD0UF0bOefFd+rHZrNgdZfnh2Pky2VJkB0amLf1rbAGRryhG64mcjy5VgmWZliT23N9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RRlYeGtZ; arc=fail smtp.client-ip=40.107.247.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtCO85aI6QkB1QW5I4kb3kYlePzrw54Eurf3sGbOwsW4aRXHT6MQDD43pcNOxdlS1v/d8Hsd9hfhw8MrFRryRpjvLUYgDSG3TP7sxB/rgCum87VgMVtAh40ddWNtjDwSjZ8R6oXlaSP8pG1crT+mLbqokwhCNeNlryAyJK7rKSFx0CjTRJRTjoFyBkI7Vk9fwv2S7VAVDfxxUj9NrVAw3QjTAkelJ8HDRctywxhgIYNCzKfXzVZfGjdGM2RqYGcsvr5NU/w3f5tWNk0zj4Woz4FszwMSIGyFTenhCTaUIdhSo+uVuD4m2lhpIvHdpm2h8dFtnkMsFMq2Sl22ZkvFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOAQ2V1aR8FkqeaPstzSNgPVtaAX0IbC5cqhfSvEnAA=;
 b=jldUPnFElJCI97h/K+nfidfWOAcShYSyyso29VID/GLIc0X6UpDzgrfw8q3djOq1kOA7Zvqgq8iqjVqzU18Pb+U4Z9CGSbyBNhP+WLwy4vJuWb8nNgfbxBO8ljBBzmjU9uTeGC5thK3fga98CClQ+hVyHrtjq92qNLx2BKND/dMfPhk0jMmw7ILVU7DcPtTK3EUdKig2y1IXBBseY1NMsYDszHGKkMnNpwI3QILuWbcuO7K8pxL/TUQvgSRKbfSegRuPxGOfs9Kf7cKijXaKkftUASX/R3mOZm0nlPIeQz8LmyiTtejhFuH+m3nqLQDFgyZWf/ySYJcETzbA8LbfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOAQ2V1aR8FkqeaPstzSNgPVtaAX0IbC5cqhfSvEnAA=;
 b=RRlYeGtZiy7vxKJXvaNqwuddMC9lrkddyKfnm/Fw5rZlonLRk8Urieyv1/56YH4DDwQbsoW18lwrLZfyt6zXNv2phhDIGCHNKWioMgsXeiWCYBUNeH7GztmzJT7pRzhLeB24BJjz2H8+5CpsXzjgO5UVlvBJQcIwLBHrCGjOuicfORd/Of8l5SLkMX4kwWx3wbuvz0EBzsc4SbhoLjZwYN31tXwY3du+NDUD90iL4dq+akd/UQecRIs/QgzPSLAGFWnAdrF5CdyIEGdntHRq93qfLyIk4auI/4NbGvG0z2y3T5w0i0Te64NfL4WA8XgQdcXy7IgP5sTTPUeCXXU+bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM8PR04MB7794.eurprd04.prod.outlook.com (2603:10a6:20b:247::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Fri, 4 Apr
 2025 07:20:00 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 07:20:00 +0000
Message-ID: <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
Date: Fri, 4 Apr 2025 10:19:56 +0300
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
 <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
 <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36)
 To DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM8PR04MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: f7dfdcb7-f852-44bd-49a3-08dd73491c00
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHdDTVdHZWhnV2luYTBqbkdaU1hiVzF5K3MwMmt6cnM2azUvWG5MUmZ5Mk9O?=
 =?utf-8?B?dU1nY0RhcGpXYXZHbGxRemV2K3JnbHhtZlhvU0JoRy9Fem1qUXJWVTZweURk?=
 =?utf-8?B?cHFaOUZKYS9ZYkdHdWRENFVHdFlEeTdvNEJxeDlrWkMvYWt6clNCaGtVeS9P?=
 =?utf-8?B?MkpRSk5vZjlJb2sxYkxBUVk3clR0YkNDN2lHR1FiVEk2YkNnMUpXbWdYSXdW?=
 =?utf-8?B?WDczTm83WXRwTXpSVmhyM0UyaFpPUVo5SkJ1bWttZmNkUVh0R20wWVBjRFds?=
 =?utf-8?B?bGhTOWoxcGZjRVhuMGVsbVBQSjUyYXBDc1FaVFJQQUR6TE9Bd0diNDFmelkx?=
 =?utf-8?B?SWtvL2FHaE1FTEV3U1pWT3BFSGJVMi9XWVcveWdpUThBa2FDaE5URzRtMmJx?=
 =?utf-8?B?QVIxMlNET1pCa3VheWlLM2lJR2ZIamwrSXlBeVJJbkJZZmN4QmFXSGdlV0FB?=
 =?utf-8?B?QkNzMnVXbTFQV3JVSUNRQzNNMUZDYllnK3JmS0dMRnpTSmFSSEZoT3hoSmkr?=
 =?utf-8?B?dysxTFV2WXhXNi9IQTBscU4wOTcwVWFiRFBVMmxsdVdpSS9wMmFvZGpLL09M?=
 =?utf-8?B?azRSdDNkSWE5SksveEJvQlpFaXMvblhnVjRUemYxckw5Q0xIM3Mrb3E2b1lr?=
 =?utf-8?B?V05SYkdnamhYb2tjbnB6VTY4T1hKa2ttOHdiZFRCQk0zdGQ2UkI3K24wZEtT?=
 =?utf-8?B?RWszWU9xYmt4aitLZlFBUTROcGN2QjZmSDcvdXNPUytRcnpKRUNEUERpcGVD?=
 =?utf-8?B?TnJDb0dxVEo4MStpV0xqd1BTUGhac1JzYnp4cDAyQzc1TE1NQ2RKR0E4UXgv?=
 =?utf-8?B?aUwwc0hRWVg4Wk41TXRxcldncEg2WVRPd1kwYWZsY256M2M1VG9zd2JHV3Vr?=
 =?utf-8?B?M3hxZHVqQUJHUW43alNjNER6QUdkTW5CVlYycWNDcmcvS0p1Rk95N0UvL0ln?=
 =?utf-8?B?bk9QczhsaHFjek41SDJFb1l6UXJlOWt5QXo0Mm11QmpJejJ3SmpFRWFpQ1hL?=
 =?utf-8?B?eVJYci9VU2htNndGNU12elBGUDY1SThlZk1ybWx5bXJxZ2hpVi8xRnJhLzZa?=
 =?utf-8?B?ZXFwUFJzNEpFQURUbzZuaEk3VmhzT2VRQS9SMVdCSVZvdVRtRzEwUWRRcGdm?=
 =?utf-8?B?eU9IakJpTCsyUHA5YzlldWlwM1ZtU1RPdU5TVGNvcWRSS1g0UFBZK0IwaFdL?=
 =?utf-8?B?RExlWG5mOGJHMmw4WGM2R0YzSFhUa3cwd2ljZHMvd3E5K3MwSGFsMVI0YkxC?=
 =?utf-8?B?K2xFenBQVW9TVVZqbGdpek5KZzV1RHNwZ2N4UmMwVzZtc1FLZmxoZjRLbksv?=
 =?utf-8?B?M0lZNVh1SkZ0NE1FU2VLRUlWREJ0YVVmVkNoaG1EclpnUmVkQVhZSGtnM0JY?=
 =?utf-8?B?VDBEMExHSzFtZ1F3WFpyWEIyZjVNcHBLZE5xRkE5YVlKV2FxWktCYWM0U0FJ?=
 =?utf-8?B?S2ZPVE51VExzUlpnWVJLVm5iYWRyeTZQcmNUQkpSVlpBdXE1bGxNaDZONlhR?=
 =?utf-8?B?aTl1NDhtek1zUkJVYkZSUkNKY0RDVXd1MVBZWGEwLy9tNy9TRm5hVURZcDhl?=
 =?utf-8?B?MXdmR1YvU0QwNnlEbU5DMHVaQnlKTjhCS3NYdjhxQThRKzBaTTByU0krRUU3?=
 =?utf-8?B?aVhzVjdIRTdrNkYwREVJaFFDSzE4RUJ2ZjV4VUdLamN5RXh6UmlKd3Bkdk0y?=
 =?utf-8?B?WUVnMTFsdjBxaTluWUtGb0lVSmZVbmNpdHE3eGJMeEJhTjlYV0JaUXQ2WjBX?=
 =?utf-8?B?RVdVc0RHOXZ2bDVucG5yd2FGWGRGT0JYL2pFczBlTWZ2b0VFRXMxY2lDU0x3?=
 =?utf-8?B?QkxkcHZSZjJjZ2d5SkR2MFhBL2FnUkNrK0IwZHg3YUlVdjV6YWVJUkV4N2lM?=
 =?utf-8?Q?B3YFldrHiIw+x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3paS1JxWGRVVnRhNE5aeDRCMytPOXJzVk1WV01tUW9aeWFQUWtaWjhNdGJm?=
 =?utf-8?B?enNXcnh4VU9ERWk5bnhkcjkzOFJQb2o5OVBPN1E2U010TWZhVnhLOWwzSDll?=
 =?utf-8?B?THlnckIzdnBLYjREdC8vUWVrNzhKVDNyMCt2NWozcG9Fa051VkhKKzRmdWtB?=
 =?utf-8?B?dk8vZEZDSkhKeWZTdUhnWVJNK29DQkl0Q2l0WFRmL2R6ZGpneExOQmRJSTBi?=
 =?utf-8?B?L0VpeXdaM0lVS3RyZEJ6UXlhZDY5bmdodTQ2VzlqRGE0a25SVklONzRoNjQ4?=
 =?utf-8?B?a1lDUFNlQzc4WHY4cWh2N1g2Ry9EcllRTDJIazBLOCtUbVZxUmpWZXNFbHhB?=
 =?utf-8?B?S1NrVmV4REk0akNiRmxta294T0UxQWJnaGZBWWJyR1dIeGZBMkpVZnVNNmJC?=
 =?utf-8?B?NFNsRDFoWThQWDFpbC9Rd05yWWZXT3dLc1lBNW1uWms3bUxlcTJPa0pXV0xQ?=
 =?utf-8?B?N0xzdXRBdmNtc3JIaUJNUjlLaGlsTTJ2OC9IVWxEVHQvRnZ1cit1V0VIOTM3?=
 =?utf-8?B?MmlobkR6aU5XVFdReklaSHQ2Z3o1RS9rUGlSRStmOWdPN0hhQ0wwOEIvTSsx?=
 =?utf-8?B?OEFFQVVWVUhBZUI4UGxRWkplZ0JyL01jUHd6Y01ERmJiMjVuek85ODd6ZXhD?=
 =?utf-8?B?b2U0Tmp6akorRVBmcXVmdk5DR2dQMGEzVTBaVjVsU1ovRTFlNTJNT2tIenRo?=
 =?utf-8?B?Y0p3cVhyKzFXS1pzUjlqYlROMWdwOWtvd2JNRlpxdkFqMkZCa1IxdHk0eWRY?=
 =?utf-8?B?OFI1VTYzWGNRalhHc25xOHVhL1ZZSXQ4c0d2Zzlvb0V1aUFtckxSaGdwK3A0?=
 =?utf-8?B?TWtCaEJIZVFYcFF2WVVkMHFhak8vWU1rOXRpN3FzNWJHSGtrMnJxQkQvR3dF?=
 =?utf-8?B?bW1GVzgyd2FuNmpHT01HMGxRbXNubk9UZ01YOXdQaFhkT0JzOHUrVk1yY1FO?=
 =?utf-8?B?MFN0K2ZhZEtYckwxcytNQVlIRk5obE5xcStPZ2wvbHJFbTR2aDF3bzlqSWV3?=
 =?utf-8?B?YjFvZVR3bHFPTndJSXFoV0pZVmZZKzhtSFBTVERtKzlhbFVHN3N4L0dNUDRJ?=
 =?utf-8?B?UHArcm5GankwQTVCbkphNWtwZlRoejJmTFI1UUh4VGxPQ0NPYzR1a1RjdzU1?=
 =?utf-8?B?azdGam14OUV2ZUlDcFJrZVZJdGU3TXkvM1V3Z3EzckpLWS9HYklZeHVzYTQ4?=
 =?utf-8?B?RWpZZFcxdkQ0c09WUHhmNGtZSERTdzU5K0NiNkpVVWZzMjlldHRDbm9haXBG?=
 =?utf-8?B?S2dpZFpPL3pJZk9zS2FrMkQwQ1lmc0FBQm5mUnZSMmUwTEpEMnp0bncxckI1?=
 =?utf-8?B?Zjg5elQ2Vjd6SXA2bTYvQlRhVUlrK1Y2cE4yajU2amlqQ0ltSUYyK2ZnY1ls?=
 =?utf-8?B?R2lVOU10ZDlPd2pMcUlVODZMY1NZenNSNXhUWCtSWkdVTHhyb1BNMXViWjM2?=
 =?utf-8?B?NTcySEZSWkNmemhNQUhEYkNLbER2ZFdveFRlMXU0ai93WFk2Ym5lbVZYMU9t?=
 =?utf-8?B?bW5OVjZrbDRpSDdQcDJsdEsra0xQS3R3SFBlcVlPUS9GQXNucGR1T3pFMFZD?=
 =?utf-8?B?NWFrMEZmREY2dE95SVVuVW1nNUtDZC9WYTZOa3hXSFRDMmxYTzZ3dHpIZXR0?=
 =?utf-8?B?T2VnQy8vQ1FoQW9iaUxMOUkzckptcUhHMHJsVlAzdmQ2TitzRmdTdURscndn?=
 =?utf-8?B?OUtXWCsyVUtIc211ZGJCYXh2ZE1jS3h5OVN2WHJpTDlPWThGa3A4RHhGdWdP?=
 =?utf-8?B?LytId0NFN1JYdEF3RVlGc3JkaGFSaWtuYVNhNFdDT2ppT2plaEZQcERadW5L?=
 =?utf-8?B?OStmd21GbnlNL1d1bmtBTjJsTWo5TDdHSlZWWnFXOGxmR2VkVS9EcGRMVGcw?=
 =?utf-8?B?cDQ4VEFtMUhUQkRlaklCMGU5RWRQUkxmL1pIYXZDUGxudkRaV3Z4QzR3Q2JE?=
 =?utf-8?B?NUNPVXJueVh4SWpQeURndU8vWitidlVhT0Y5ZTR0WmZMc1dTZTFraC9kQjBz?=
 =?utf-8?B?ZG5FRmJCei9UL3ZvVjlJS2tJclNnR294bkxQYzQ2M0l4Zk90REdlVS96d1Ny?=
 =?utf-8?B?Zm12OXp0eDRMUjBpNEQ3MEZyeWZRQmpNbkxrRjNUclVjL3k3VjVDWCs1T2Zi?=
 =?utf-8?B?NUlzaGFQdnBwMzQxY09EWiswbG9zSzh6SGhpWGJVVHpCOEM4MTd3eFNaSFpp?=
 =?utf-8?Q?QfZcC3fcqaRMzV051mVr6Ao=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dfdcb7-f852-44bd-49a3-08dd73491c00
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 07:20:00.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0C9ZF3wE6RaYb0oCjVOWwHR29rzqxEKzdQJFmFLVJ2WmJQwbLrkboalyaThP2NSzn5wnYQ5I/fFyZ1IYhCcFpodCCzQwRTP/vbFtU10Wjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794

On 4/4/2025 10:15 AM, Krzysztof Kozlowski wrote:
> On 04/04/2025 08:24, Ciprian Marian Costea wrote:
>> On 4/4/2025 9:17 AM, Krzysztof Kozlowski wrote:
>>> On 03/04/2025 12:33, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> The RTC hardware module present on S32G based SoCs tracks clock time
>>>> during system suspend and it is used as a wakeup source on S32G2/S32G3
>>>> architecture.
>>> Which boards are using it? I don't see any DTS (nowhere), so I do not
>>> see single reason for this patch.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> The RTC module is used by all the currently supported S32G2/S32G3
>> boards, so currently they are: S32G274A-EVB, S32G274A-RDB2, S32G399A-RDB3.
> 
> I don't think so. I looked at these DTS and there is no RTC.
> 
>> I do see your point in the fact that this driver should be enabled as
>> module only after platforms are actually using it.
> 
> No, post the user. I don't see the point of sending defconfig patch with
> RTC patchset anyway. That's different subsystem.
> 
>>
>> So, would it be better for me to send a V10 in this series with the DTS
>> patch added ?
> 
> No, separate patchsets.

Ok. I will send out a V10 in which I will drop this current patch from 
the patchset. Also, I will send the DTS patch which adds S32G274A-EVB, 
S32G274-RDB2 and S32G399A-RDB3 usage of the RTC after this patchset gets 
accepted.

Best Regards,
Ciprian

> 
> Best regards,
> Krzysztof


