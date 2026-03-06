Return-Path: <linux-rtc+bounces-6136-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bx/FfunqmmzVAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6136-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 11:10:03 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFC21E796
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 11:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DF0430000B2
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 10:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB9535C1BE;
	Fri,  6 Mar 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="eZfmcj9d"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021098.outbound.protection.outlook.com [52.101.65.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD351F4174
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791797; cv=fail; b=aJG+iPGgq+KMM0G++XmVRe4zDFAlCSJFybolBtdUGoHOnFkZaU7RhN4x8zQqNJckO5livEGyLCGAxMmTzM9aWi/cPLy342VlLST2LhigrZoyD4Wfy1eq8fR1WsDZqy7PxFPeQKUTwhILfWBCQzDL1jzxqfu2jv++V99e4nrCjow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791797; c=relaxed/simple;
	bh=/uwXvzvFB+GSshU8tmKaDfiof0dfCEmqpJjXfWivBjM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VAFMQlb2VJlwDUA56Z9N+R8zakhT/yLOMgT234Hz6kD6aoWx+BYyz6+zYNynYjoHJ9IYcx6Z4IS1LqBwusrGPNPFitGg4NEv9uC84hfxwBSime33YP9w9p4mm6y4Us0YuWDFI0F21sVSEWJXb7ZDzBWOnqCneHcO0xLQ1OG9DNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=eZfmcj9d; arc=fail smtp.client-ip=52.101.65.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh9f1aG84Qx/suNuDdUscScCrP/21lLIxzaoUGEDu3wrgiqC0lguuktAhA0he68MFiltCgZcPvZku8ImtaPPf+5RcDQliJNyUlPcCIxB7nzRG8D23WLo7OII+ZhqVmH6Oe6TLK0+W6YZXdNCZBfEY7oMfj0JgPdctQUIVaTgj3Uf8tGuN8WHbuhBX81EmD+ymnd4jMdcE8jLSFPK1VJThvOveg0qrg4yLsS7HuTjjMgFy2Gq+5iS7VntyHsjJX2Ud9z9c9ChJEMbIxdrRRIOU473dTIdwJrAp0DBIZ9oyHEYMaH82v9gRAnTFqk39b+qS1d71r2LFnM0LyPY/TYhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgnIm/P99x5A5H87SkUlJj6b/zg8Pge3wxdA8vPmHU4=;
 b=J5ReExPvgJeS75Y29CTnxAOs90WUo+kQc748TqlhVhZqe6Hf+KF283ZvoCSzW3vJi0JPqkhtST4hWjK16DulROHvzw4TyZQQnRO4jJm5hWeC5MZPXj4/gwnwUiVODhdllg8XNvX7/e36XN8UEf7fLsdAQLeB6shSkdM/PPAxTVE+CCbI+oa2THK5jxs0M9PbsiO6RAcaAOElBCj8vhcYs/3pjUOkOg90q/KLk6T2Oh9qA1qaqVTza+REBx3ClaSUK3FryZCTWQ87iTuZHm1J/8RTzevTvJCBdpsjbeY89LDZxgNl0rIDAm7IhFmmZ1ekX6raeVyNHlGI78RyD25WlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgnIm/P99x5A5H87SkUlJj6b/zg8Pge3wxdA8vPmHU4=;
 b=eZfmcj9dbPRhakyEgihZgZTHw3LswcfB3DEzRJQ+g9O/E4bNJo3FAQDturR1GZs9ujWwIRVMi3PrVotY77QhVWlUL6coAJFRdFg351o6BRsWY5fgb43Hqr4Pq865LJudhlmR/ZvCG7XukoKUoCRMLaJ/eXfaYp5sqhgZ4At8/QO8cSBL6ZnHbu0xe1QTP4MB3aaC4+FL7xchRXeuEYU/Fq0EiyIym9F0+YdtbhgYtTph+Ln++bRmzuBR8bSQ0j6AtJHU1i27b8NOxn1xmf60ssqSV1ys4ledb4LxLL7gvTKAlIkxcctEN2pX41+mGb+mfTXX6920IbCSJ1JtlbynVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by VI0PR06MB9184.eurprd06.prod.outlook.com
 (2603:10a6:800:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:09:45 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:09:42 +0000
Message-ID: <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
Date: Fri, 6 Mar 2026 12:09:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: Takumi Ando <takumi@spacecubics.com>, linux-rtc@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, michal.simek@amd.com,
 Yasushi SHOJI <yashi@spacecubics.com>, kanta tamura <kanta@spacecubics.com>
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GV3PEPF0001DBB4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6f7) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|VI0PR06MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a17b2f8-3d37-4bab-216f-08de7b687bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	tNQMBX3Q6bqQYgjzV/LmLGYJGrQs2RfSwrajtcRgTGbmTLaFd8NtQYhG6K54VTB/3TzBVsB3I9h1+sij/YDeHygYmmYiV9QK/e7yGRSow7KUwbOsdFWfhzFizioa1OrVYEugNCM2CGQHaaC4Ote14+211BsKe3WqIhDP0Vj9pHd+/Ne9RVXDXZqToDGkgIvb0TgmG70AoRXf3SwIAa8YvpPnxjaWMx5DZJdybYgqbNJ9R0F537zFILKSbaxpG4/ZluxgX15rKOZVC24n2Ey9EaEszKxMxBUrrwcrGgC6Ca1tEBFtUsRZ8carU43NFZtqgVWFgfsSrCC26rHksuc07w6hUzY4KOEPNKbHJJTA7hGo7gc/Oq63PLevdktgF5hiBkxj0KLoWFt9oS1LWHK0lUse6N93n2OVI+0qLEaNxacEq/iNlJsLDG0GwEIUqkdwKWYtLj4557a+vRKdmVFDID2q/wNZR1tM8LTCiqQfTo4XgdmLK84QBKlfjQwAwPE4128r6Mnj3Fi/vxUkwNH3dvK0od6dEDVkt6FIKCpQnr5BicsmeWolg/gj7yZjxuHg2p2DQfAI5Zrhr0WEWMr5q0zp8Y7G4oX6fXiTs4TmtQFb8dCikQQk0Af2XljDFMMQ5m7+Rft9DnNMcfs3OoVSE6gWO2AEk5ayXZNW9+sWA+VEFK23ZVHyHJkvelECIkqRmCKNb2rsMMWtipJQldqG1ymYbWjj5CEqgmvib8C3F7WwkCfeNdsjgegCXN/pN2Z7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlyTHI4VkZYaG04VGwrUWRXOEpOcXkyTHpXY3AyUWF1ZWhvYzVreUVYWGNP?=
 =?utf-8?B?TkhYWnBFZWdxZkxDOXRyNXdaZ2tCME1yb0tBb01peitxMTVheXYySytIaThD?=
 =?utf-8?B?UHJuQ1B1eTZPL2d5L1RlV1dOZnVlRHFYWUJnRE1hY1E1UHpRQjVLOW9jZVlt?=
 =?utf-8?B?d1lCUEJqejNSVWVxS09ZU0NIRTVsS09mUW40dGZtZ2dLZlFOZ0xRNVZOTmJD?=
 =?utf-8?B?QVRoSGN1MkN2QUJ2WG5VbkhtL3NyVmdUUk1KNytiMmR6L05tVVJ3K1ZhQXV6?=
 =?utf-8?B?bVVrdWhMdXFxTXZpRkVMMGFBd2Rqd1JOa1lZeC8rekl2emM5VzN4UmFRVGIx?=
 =?utf-8?B?VDFXOUlhNWJCd3lPc3VJSGNBVUxHSGtzMmQ0QlpXNFowMUNYc1doKzB0R0cz?=
 =?utf-8?B?d0RpREg2cmFSb1hPOFRUSlhQeWpabElUenM2ZjBoWXBCSWVxUXd2NC9QVkl0?=
 =?utf-8?B?bXlEbFZVLzd4d210ZG9IVWZlRXRLNUdhbFNJUG9SRGlTNEQzdVQzWGI4U3Y1?=
 =?utf-8?B?RkdIWUkvTERWbEs0REM1WElHMWVYSkNxZ0tPUmJTczZmWWxFV01QSURkbTVw?=
 =?utf-8?B?b0pVU0FPdGVhSjl1YThiZ2dadHJyUVd0SmEyNFJKclJCMFhaRlZUNngzbE1v?=
 =?utf-8?B?UjJ4SWovWVhYWVpBM056SExUUW50dFdtMURqNHJqRGt0SXgvYUdQZ1kvem1s?=
 =?utf-8?B?TWdnY04rZ2pMUDFranR2MDFLcTR6WmxaWVJTV25MWmE0TVJGbXFzVkNzb1Bx?=
 =?utf-8?B?REFLZHlWb2s2WEhLRnJKRmhBRGx4VGIzWHN2NytJNGJWR3VlektvRDJINDFP?=
 =?utf-8?B?Y3gxclFLU2M1cUl3MnFMVVFyUGJvY0pPbnZBSVhiYUpjS0RncnZmbWhIU1RB?=
 =?utf-8?B?NVQzcnlQbzRxOHJoMlNtaFpQMGU1RHhVeFRnNnVTL2tzNzJxZzJwMU9OTHZZ?=
 =?utf-8?B?akFiZTZVZ3A4ZDJvYTVvcGRqNm0xVGpVTGhxLzlkdDVobkQ4QmtTeXRzc24y?=
 =?utf-8?B?YzdBNEpnTGJyK0djU0NrbjE5SjExSjU3dWF4YmczTldaWEZyc2lUekxUaDRz?=
 =?utf-8?B?cmdiQ0ZXbXQxMHJWcm1ydTVJNjFsbFJJck4rbjh1OG1ObS9QcnpNWFYydjFs?=
 =?utf-8?B?YmhzN3FWbGlhL1d2VzBIZHJtd0g3SVB4a0s1OUU2TVZDMWFKRk1pNUFuQ0xR?=
 =?utf-8?B?MEg1ZmhpZXYySVc5dlUwbVFUZ0hGdGxNRmtJa29yT0VNamhIWFVLZzlCVzJh?=
 =?utf-8?B?L1ZNU0o1aGVpZHNlOFR0Sm1MYWs1TUpRZ3BXdmtZVHFHMW5MRGxJMXFpMmIv?=
 =?utf-8?B?Uk9Ea2phM3Z5Zk45VHNiMjJtdlV4UFhqWC9UWkdVbHMxZnBXNG5tT2hBTUNo?=
 =?utf-8?B?bHJJbit4aEpISzhvc2o1YU9oVmZvR2s1ZnNTVzIzRXJVSDRhUG82MmRYZGE2?=
 =?utf-8?B?dVVNaGx5RjYva1FQYis1VE8vZ1Z5NHZ3cDh3Zy9KTm5zRGV1QXQrWWx1dklL?=
 =?utf-8?B?QkRGcXpkQVJSSitzZ1Q1WFcvcE1UVzA4REFPZEZNU2JQem50L0JBVFgwcDRQ?=
 =?utf-8?B?RFhKV24yenFDTWRTR0d4dzZvMUhURVk5WDVYdUZnS1dra3RaSTFad3RmQ25Z?=
 =?utf-8?B?KzdIRzh6aTNHUFdtVEduUlFhNEhMcHU4UVdQT29jMjJtUzA1Yk9WeXc2UHdH?=
 =?utf-8?B?YmIyRitZNkQrbTF2T1pPYUt0WjMzNEFuKytySjdPVy9aeDI5K0tDc2JpQ0pj?=
 =?utf-8?B?TE9wVHV4NStncUdkbDdsL2huOWdOTzZJbHNEa1h5RURtSG9jK1JwNkxUenoy?=
 =?utf-8?B?VFR4dVlOSkpmbXRpcndPZ0VuZjNiSjNDNnRldDdib3NONCtML1pPQ2xIYjY1?=
 =?utf-8?B?REJPcGMzRVJUaXEvb2NEelhOYjM1MFBuenNxSCtuemlHeGVzcDZBNWVZMjN3?=
 =?utf-8?B?YnIrZnN6M1JsVkhZcW9pK3gwa0hyeW52ODFXdVYramNHSmtZd0lsNU5yeWMw?=
 =?utf-8?B?UUljVUNJVzg5dVc2RmdZc0pVRlRkbHJQL0d1eTB1NWRkR3o5TnNoSHJzMUVD?=
 =?utf-8?B?SzlrQ2VDNUV6TUNqazFtRGlXTlA2V1p6MDQ2VGZJckNwaGhIRTg0WVI4OE9a?=
 =?utf-8?B?Skd0QmNKT2t2bExpb0FHdCtrdzdLUERqWmdNNmNld292bTk3dDZLT1lKVTBB?=
 =?utf-8?B?b0pIRGgzV2hBZDVuRnBjMVc2YlJMcjlRajlYbi9DUnNXMkFLN0Rxc0JrUXVM?=
 =?utf-8?B?alp0TGRzZUhtM0R3S2l6ZlB5OEloSXlOUVZMWG1mazd6bml3QUtack8rMy9w?=
 =?utf-8?B?THRjdzQ3TFZYZGpUaWE1eFFCOXVmWFBOTnJDbFJjVHdDY2pDTXFXRlY0RE5U?=
 =?utf-8?Q?jfUYgvMLgLBCveaA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a17b2f8-3d37-4bab-216f-08de7b687bff
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:09:42.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95nY//FZkq0QcA912fpRARvMwxhHQFvk2T6W57CJ+zATHybnncId0aPcCPFoY+MDS1MBQCkwkKDexMqujkutdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9184
X-Rspamd-Queue-Id: 9AAFC21E796
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vaisala.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6136-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[vaisala.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hi,

On 05/03/2026 11:24, Takumi Ando wrote:
> [You don't often get email from takumi@spacecubics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi,
>
> I have a question about the initialization logic in the zynqmp RTC
> driver(drivers/rtc/rtc-zynqmp.c).
>
> Currently the driver programs CALIB_WRITE only when CALIB_READ returns 0:
>
> ret = readl(... + RTC_CALIB_RD);
> if (!ret)
>      writel(freq, ... + RTC_CALIB_WR);
>
> My understanding is that this was designed to avoid overwriting an
> existing calibration value. Since the RTC may continue running from the
> battery domain even when Linux is not running, the calibration value may
> have been configured previously and should be preserved.
>
> However, according to the Versal Adaptive SoC Register Reference (AM012) [1],
> the value returned by CALIB_RD after reset can be undefined.
> In practice, on Versal hardware we observe non-zero values even before
> any calibration has been programmed. Because of this, the current logic
> may skip programming CALIB_WR and leave the Max_Tick field uninitialized.
>
> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> CALIB_RD resets to 0, so the current logic works correctly there.
> However, this assumption does not appear to hold for Versal.

For Ultrascale+ the calibration register also gives random values after 
reset, perhaps you have noticed this: 
https://adaptivesupport.amd.com/s/article/000036886?language=en_US. 
Maybe the same can occur also on Versal.

AFAIK there is no way of knowing if the value is correct or not after 
reset, so user space helpers might be needed to maintain the calibration 
value at a desired value.

thanks,

Tomas


>
> If there is a register or mechanism that indicates whether the RTC has
> already been calibrated, the driver could use that instead. However,
> I could not find such an indicator in the documentation.
>
> Am I missing something here? Is there a recommended way to detect whether
> RTC calibration has already been configured?
>
> Alternatively, would it be acceptable for the driver to always program
> Max_Tick while preserving the fractional calibration bits already stored
> in hardware?
>
> Best regards,
>
> [1] https://docs.amd.com/r/en-US/am012-versal-register-reference/CALIB_READ-PMC_RTC-Register
> [2] https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/CALIB_READ-RTC-Register
>
> --
> Takumi Ando
> Space Cubics Inc.
>

