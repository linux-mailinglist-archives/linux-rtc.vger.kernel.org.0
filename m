Return-Path: <linux-rtc+bounces-3501-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECCAA6298D
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 10:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29E6417A923
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 09:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7BD1EDA3F;
	Sat, 15 Mar 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fpHr1OJd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF601D63C2;
	Sat, 15 Mar 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742029643; cv=fail; b=g4v7QLlFj/obTMp9HQ+T6xeAhekAh37V4wm1TEpxxGONzKsD99pbVW607ij/t6m5GBih5hd9QeDtOj0KoVOVrZAyoux1UujzokVXTtvpbhcgRXuFC8EUpVdnYHUwlHMWPI6EC+k4tmKJhnMnkTlam+mOSIpVGMnmo1yTXXDE+dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742029643; c=relaxed/simple;
	bh=DGxQl9rIS8jpNKTtIrgGjO6n8vHOIVh/KUrQf5g+RbI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bXo36uJkL8jXRzQ3dbqA12ltOOmIcr2bZtLNjkxPtyDQhc93lCzsWJXkTs5KLF1FktCBZHDHJWFbImF01iAE5bjCkzAA1l3ngEVAi1EL7pBr5EPxphKfYGaV8tpBo50Mr4vI7ClcufOwTqHiA8NQdagdpuycaTq7R4vpAOYV4JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fpHr1OJd; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqowRrnRlY8nlckXbxEEiEjRqO6qAJFHjCG7sYG10OIYRSXuh8HPsmCLoO3jVCNcAcbtojyXekbMy6WkLaX7aO0b+mfbSLCiz9GmCrHQYf5fUDqSZvMYk911lFe5hUsmN8bL7dWGDBCDB+bPpMkg97OJcFoUFpWyfND1glewrxJS24oWt1KD8ctWrUtA5x7SRzTlhR4hxQe0oWdGONl/yZ4jrhfdzCGmGUoWQK85lWwMcpVsPF9i3R5jZ7FrY7gvg/ncoZ0biJgSjmqlA/JkpMfbHmAyOndxpqSt/ALDIhdrVXJrWNk5ybzlS04jSPECeTgLicL9DiAfd/WazAzbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsCoyro/TgZZ9H20x3vLB0BxjFs9395vp8+1SKPC/TM=;
 b=m5fOwk+sDhnrWRQslWaug0zBvaeMaPs+TQlyAAnAUOKYzW/sF0wR7+0gIbez6syhx6i8N/iF43PNqIUr3T6fWblgXZpw9VZ8nwKDjRNAe09yaLa3TS2HYplYSl90xGi8MjV9jedK7p9XQ0LuuaRkRvpLRqCbcjwqQZY94RPyy9pzJ1nypK8JWrFmDokMxEJ0SIrmPxqDsl7i9ym5KOuD7s4KbJqfH+CnBQEDoJcsscbbEWMRNTtR8jQuNqvVFZ3MNcI2CMvyeIUMBfekLgBrgYzUx+iwL7DBjgrlWu2htOiLYl4vGUTzalFVCPbsZcL5DPFjVuHoESrtHBOgmA6w5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsCoyro/TgZZ9H20x3vLB0BxjFs9395vp8+1SKPC/TM=;
 b=fpHr1OJdzdmfj8yWEcl+eFy9QFa2PsIPoWv2PEf8U+Ai/0V7KWQ2rPBEOV8y3JMhkgMBQ66hCF32HWWB1vK3+LgiorrEJOiJmm1UODO2Ic43yscCoWPmPapPaoK659NKjONftSwEzmzWHpjfI8gKR2wJwVYagWLJlATUn7yaGfSzgXZbgYubQOFcanVfp+DBLg0SEJiPkWxiEmX7tt5QvCg8scgaJgWgOE9zC9z2T6zct5mX+e05G2NXmhByoYCZCymEau4uCRMR7Kk/XPbYxo4l99AYznCl8JCf8S/Ge6DbUSlRXjUg7Yq0XPbPcQL6pYaz8S7JQJznMTNeYv8U8g==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by MAZPR01MB6831.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:51::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Sat, 15 Mar
 2025 09:07:15 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.031; Sat, 15 Mar 2025
 09:07:15 +0000
Message-ID:
 <PN0PR01MB103934D89866B6BDC6C2940BAFEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 15 Mar 2025 17:07:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling
 RTC only)
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <fa218150facca3f1756b7df055f6e0e67130ebe2.camel@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <fa218150facca3f1756b7df055f6e0e67130ebe2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0211.apcprd06.prod.outlook.com
 (2603:1096:4:68::19) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <3673e26d-a889-4ee7-852a-364b07c3ed16@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|MAZPR01MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec0b95c-3578-4856-f76a-08dd63a0c7c7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|10035399004|440099028|4302099013|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHNCZEpiNmxvdjl3ZDZhdjRpTUFGVXRSUWFzT1R6V001dW54Qk03ZWFyN2wy?=
 =?utf-8?B?Umc0QUhXcXVhWkN4ZW5BOWt2aGNOc2FuYjRIM010bS9ndWF4OHF2ak15RlU5?=
 =?utf-8?B?bTVBZklIL3NWZnhHcTR5Z2xRTVBYeHNZbXpxT0dNOEVXckttZlI0WlE2cTA0?=
 =?utf-8?B?WjByQjZyZzh2THBqMkJRVEI5SDJhY2Y2RWxMYkpuakdwMDI0QzNTMFc1TEll?=
 =?utf-8?B?MThWcEpLU1VIRTVFQWl6TU05NG8ybEEwcFVMbm5LbEJpWGExTi9QZW1VVTJo?=
 =?utf-8?B?Vk9YVjZXTzZxQ0pCdUQ3YnFPVFc2WGE2N29NMmRNekhhYTBzL05oTHgxYWVC?=
 =?utf-8?B?M0ZzWlVVU1RHTlMzdUIxSjV3dWZPNjVQS3JBRnN4YStLWE9GMi94WXZIb0Vk?=
 =?utf-8?B?ZHBHYnBBTjhIZTNqQ2kvRnpXNlppTXkxRTB4Y3lCTGhpbUVaNGhyb3JJUTNZ?=
 =?utf-8?B?UElMUzlKVFJDRDN6aGE2ZjZrRjNBb21UemZ3TVQxWGkwc0ZyekEvc0dCcXJj?=
 =?utf-8?B?RmxhOEl3WWVNamxmcEluVFVjaVRhem9rT29jRVh6UllORkpNbThGaDlCOXZC?=
 =?utf-8?B?YjdYYXNlZlR2S1pCUTV5N1V5Zmh6OGNTSlFCM2g4OXZPZ0JNZmplMG9MSlE1?=
 =?utf-8?B?Z1hnWXJhc2FFOTcrSHgzd28weXF3R2oxTU5sMm85MjBhdk00UmRvMGhHZGVw?=
 =?utf-8?B?dUdNSmVGdjYxWEM1Qm5pUVkzclIySUFQSHRUcURpczlVZXBwR3JnNy96bVB0?=
 =?utf-8?B?ejlKZUZZN0t0Q3RobGFmVEJILzRwQzNPSEx6ZXNJdU43bXdhdGhwUmdOVkVX?=
 =?utf-8?B?Z2RZL3czcXZiL05UMVBGRTRqT3I4MGg2N2hkdkI4NU8vZk5PdSttQkU1Qkd6?=
 =?utf-8?B?MUFtd29sbHlEVGRhakRjeXU4MUhBdlFrVlh3UlhuUFQwcXBzdlpuZ0FJZVNt?=
 =?utf-8?B?M1ZuUG1mWSs0eFNZQ1RmN2FHWUpvajhRVGlGZy9TUE94R1h2aFJCUmFJQ0sw?=
 =?utf-8?B?c0FRMXBIM2FmdVlrODdibHc1aHhaZ0lEUXhVb05xVE40Ui9TUlVMZ0hTekRJ?=
 =?utf-8?B?cWdlUkwxUGMzTm90bWY5cUU5bGt2T25DbXR2U0xDMCt6Zk9CeDkvem11L2Zn?=
 =?utf-8?B?UE5YcHRWZXJaSnRmdnVkVm1LTzc3cVZia1hWaXhrNzZjS01FOUNycFNBaElh?=
 =?utf-8?B?UHRUTE83WlNVVW43aU50Q0Q4OE5CZm9Xa1ZtQ0ZZZ0gvUTZETW9wbWJPVEIr?=
 =?utf-8?B?czNkSHFvWkZiZXhmMnpmTSs3MlA0RHdRUERPblhBczcyVkVGN0JXSnQ5Rzk2?=
 =?utf-8?B?VkwweGZYQnRGc2tYWm5yMm5NRUtaYjhaVTdlajVtOFFheDlDNkkrU2hrQitr?=
 =?utf-8?B?a1VrZ29Wckhib08yWTlUQmxtd282QjF5eDg4dTl6RnRQc2lxZnBMZUhySlVK?=
 =?utf-8?B?SXM5S3FDT0RXaUd4V1pnYnRkV2tuQURMSGFGTmFJSGJtOHExMGU1YTY1UDQz?=
 =?utf-8?B?N2YwMWdrZ2pCZmwwcEJ6d1F5VGpGd3hnbi9KclRIcW1nei82dktFZHl5c2Zl?=
 =?utf-8?B?QXlWdDhHVVgrU2srZUlGcjEwempaM0NUUnoxb0gxZ2tsWHpwZndYbjN3WUww?=
 =?utf-8?B?cHYxSldOV2hsU1ptdVFQVUdhUEFPR2ZBaUNPd1JHNzFuajMydzh2Q3BLT2Zo?=
 =?utf-8?B?TU1LTEVrSzB3cjNmbE9PTWM1cEdVZDFvcHlidkFnNURlVmd4VHk4UHl1Tnpw?=
 =?utf-8?Q?wxUR3bSqyC7xoJPNRR+8gB/MGXVgD2Kbf/oXGB/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVVScGdlQXFCM04yRTNsUkF4bkxIR1JNeE1NL3hHTGNKOXNFR2l4T0V0VW1V?=
 =?utf-8?B?dzRJTUx2OUpNaWd0YjJMREtNT3IxcXBFSDFROVU2bFQzc3RkdG5VTzl6aC8v?=
 =?utf-8?B?bEswRmdLWXVrUlpRbDNSNmMwbjZPalo4TmlpK1Z3TnQwenNadmszeXpMbEVN?=
 =?utf-8?B?UytHTGZvR1hQWHp5Q1dUeDU5M1JLYUsveHZkZVRvNDlybG5DdkJuZFFYSEF1?=
 =?utf-8?B?L2F4TjZXV0wwSGpBVmMzQXVJcFlTTGd2UEVXMTJEYUd4RWo2UnAyYWlEaGtY?=
 =?utf-8?B?anlPSitURXRaWHRaUFJxb2VmdUp1cjhacnBkVWpWMy94WTBmWTBEb1VPcW5q?=
 =?utf-8?B?NC82ZnFxZGZHMHFod1FQM0pwcWRpc1BIeERMcUVNcHZIalAvQVVSRjNsYVZN?=
 =?utf-8?B?NDJwL0dsVDdYWnIvMmdRSGZ4djhXZDZHVVVDSldLOENoSENHbzZUVkY4TnFx?=
 =?utf-8?B?ZEpMT3k0bGc3dkhpcGNFR3VFUDFEVDR3dkVqQzUvK0ovVHF5QUVvRldFZ2F4?=
 =?utf-8?B?TDhuVkd3UGUwVzJ3RnVkbml1VVhETlI0ZmUrdnp4TWF5UjZtZmFRczhoR29H?=
 =?utf-8?B?c0NjK3BRcGt4MzhnRE8xLzlaeUg2YklJeE1GTERyaDY1bkJOREpnT0U0S0Nu?=
 =?utf-8?B?aGlPMXR5eE8yWDVjYnQ5dTdjaEJqbW9RSEFJdFpybzd3c2NoSXlvZXg5YUky?=
 =?utf-8?B?L0dHcHpoNUpzQ0l1VGFiVnlEUUlsQ1N2UlBQd3Q1enY1bjRRb0p5bmlhcU0r?=
 =?utf-8?B?NXlwN3hJZDN0Vm5iYjRIU1UxWTJibkZrUWVNaUtjSmNTYmpKR29DNXRSSTZn?=
 =?utf-8?B?V05WNFhLQTNqVCtRMUl6ak85S0duMmFGZnBpZDhub0o4VktFUURZa3FkSFB5?=
 =?utf-8?B?QVZHdVBGN1g2bVRwYUlkMXBPamhNLy92SDd3cW9XVEQyVERBK1RuS0dyWk5i?=
 =?utf-8?B?dXVNTmlyanRzc2ZDNUlTbFJQQjB4aFFaeUVLTFpLaWMyU3FWRWhSemNtR2Yv?=
 =?utf-8?B?QU1NN25GVzYrQUJ2QjVpWXhJd0dGRVN0Qjh4VHlJNTdycGtxbDl4c203OVFP?=
 =?utf-8?B?dk5pNHpOMXNJVWFETm5TeXluRmhuRjljUzZqckZyZzJraDRIK1YzL3lBRVJm?=
 =?utf-8?B?Q1NwVFpkVEh2WitheEZRUEtuSmtjTWEwSnd1aWZudzN1QzhWTW1SRmQ2Z05U?=
 =?utf-8?B?Vk44YXJoQzljTW9ZMi9nRlB4OWQ0OEFFQm8vdEtnc3dZMzFJc1M3aFVXRHor?=
 =?utf-8?B?bTQyYVZra2hRVDZiMjFFM01md2p1TTdHUlZ1cjBSTERmZm9yb2ZJd3M0SmhC?=
 =?utf-8?B?SjMxTXhyY3ZmUGUxSVVsOUtCUkJ4ZTgzaXpKZFljK0pWSFl5YTQ4WFh4OVAr?=
 =?utf-8?B?blJ0bk9aVTd2TEJDSHhtYlpablZoZTlvWkZReml5K0oxMUZZelZWVEc0bExI?=
 =?utf-8?B?ODJURk4wOTBmUEczVmdSM2lkZ2VXeHBsd1JKMXdWbUhXODRLR1hscjE5clY1?=
 =?utf-8?B?aDZBeUJEZThVNU9DdmUvWm9Ha3pkb2hia21FTE15d1h5bjFucGpSamw2b3d2?=
 =?utf-8?B?Wk4wUXIvV0x1QUx3THJucDBCbDVMOVg3TUQ4UjNBVWRuTWJXbVllUHZtZHJ6?=
 =?utf-8?B?a1FwUjdxWStDMkxia1ROK1h6S3lhVkhYY2JmamlrOWFoNmhNeEg3NkxoT3dS?=
 =?utf-8?B?TVNiUXAwMVpGNjhHYVZ1Sk1aMDFiUEpac2U3WnVJd1huVzVZTXpkamI1SzhX?=
 =?utf-8?Q?Rq5R6Lwa/CCLXkjqzWT/Z7PkZzqlgH/YQgsi2mK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec0b95c-3578-4856-f76a-08dd63a0c7c7
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 09:07:15.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6831


On 2025/3/15 16:48, Alexander Sverdlin wrote:
> Hi Chen!
>
> On Sat, 2025-03-15 at 09:11 +0800, Chen Wang wrote:
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
>>>>     W:	https://github.com/sophgo/linux/wiki
>>>>     T:	git https://github.com/sophgo/linux.git
>>>>     S:	Maintained
>>>> +F:	drivers/soc/sophgo/cv1800-rtcsys.c
>>> Please change to the drivers/soc/sophgo/.
>>> We should maintain all files under this.
>> In addition to what Inochi mentioned, please add the following line:
>>
>> F:    Documentation/devicetree/bindings/soc/sophgo/
> Isn't it already covered by the existing "N:	sophgo" entry?

Ok,  just ignore my comment.

Thanks,

Chen

>

