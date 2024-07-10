Return-Path: <linux-rtc+bounces-1465-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061D92D251
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 15:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33AA01C23412
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11A4192488;
	Wed, 10 Jul 2024 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="i/YWP2dI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859E19246B
	for <linux-rtc@vger.kernel.org>; Wed, 10 Jul 2024 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616889; cv=fail; b=h6S7dbAetK+mb/Wiq7EIU6qid1LAaL/gcsh0qLXC1KD+UpK7sWh2HM0ohr7N1JmxLuoHqn7FQTXKY+rwmr+bGoVSRvgp70WnYu0orsBEF94sWfxtMXQGENbnebmG84iumQCqhJjPeBC7QzCbxHoO2nbbuMggKIM8G6NCoXgJgjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616889; c=relaxed/simple;
	bh=2LmZfy6AdnUPeBAFvNLv5gk2YKhaO7WPdjpuBNAphGE=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rFYu8Y2TTFpUY27jyIC0xfwtCzfHszMoyzQfS5HATEq9YpNvE+l6ezQHtsPmtsxq73vUBn04yNZ4NYJ3MGeeV3mGpJ6QcI/TOrmu55BDi2untoFtmeFdWYpcB5WBFBpf7vuugdzA4utwY6pJr+06Xc9cF0nhe06JctpZi2T5d/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=i/YWP2dI; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.5_.trendmicro.com (unknown [172.21.19.34])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 77619101FF163
	for <linux-rtc@vger.kernel.org>; Wed, 10 Jul 2024 13:07:59 +0000 (UTC)
Received: from 40.93.78.5_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id E1FA3100004DF;
	Wed, 10 Jul 2024 13:07:46 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720616864.113000
X-TM-MAIL-UUID: bd038ec8-7d32-4c07-bb82-f9337933f04f
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.5])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 1BFBB100014CC;
	Wed, 10 Jul 2024 13:07:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IohlWkx3uxxinldXEVk6jgWXbV/uAADH+4eFCWzJY3BSQwcTShqsvByXNsIhY5WGy1OhlHLDXGbKIXpLz/0xsFkZWqNukVW98qIsZoBEUafj0yovGSu29+Tf3Nx0+1OzY36SfVfliV+oREqwViklw45SP2BTEmVxbuB0xsR82+F9G8WfG2xlpmXwrFUGOoHVi52spL5MF+ThULUAXHBNNVoFc5fntAVlhSrh4ZBkFCcGv42yDOUCN0x/aagzPSarhR7pFD6oxh9U/xYDdI2fzMrFhSo8t1nHYTPjASiyyrzICsZJMlyWbLvqJ+xKe5bNsoCwmbVxpipWVjPyuGmtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usDZOkm3KvOLTfskzYNfwt5v7YYwfq3or7jcN0ucjWo=;
 b=emh0DnGVDGU5dktbM2nWW4MeUqeOxsUp3gbTY59KODOKIp1wo4omE2FLz9coYk+6yyWH7SlKtQS7vdQlOmoI2fLU8xRqAgYnFFO7a5oQQVbu2NOgDMd2ZTw1nlCQQpjmS9QbF6hO1yZLxosLdRRcJAXF+Zv7i8IV0ebJs2Pdd44mDnqQwMlRUYy9WZp2ZDRkjEKplxmKhNPms16AZD6xH3Z6t8D0y6DNZqIg5E88xwys3Mwylq98o4zuVtllotrg5PikRu7edXaV+y2g1rTf85R2rJrXJLwOWxTYGI9/lutt/DI6gUr1m2xc8yjfEY1z/0QF3nnk1McVnanBSOfIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <060f392c-7ba9-4ff6-be82-c64f542abaa1@opensynergy.com>
Date: Wed, 10 Jul 2024 15:07:40 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>
Cc: "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
References: <20240708092924.1473461-1-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20240708092924.1473461-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE2P281MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3ae4bb-f756-4325-a2c7-08dca0e1487e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEUvblpJZXJZbmpSeGJWS3BCSS83ejNpRmlZK3ppcEJnM3R3TDFJbWxDQ1Jy?=
 =?utf-8?B?UnU4V0JpdVo5QjNNWnJQTGNTdlpsRUh1UG52VUUvc1Rtc0ppd2dSdXp2NkJP?=
 =?utf-8?B?ZVI3NlJGcUUySU9ISWQxN3RyTytBRHhpN0UrcDgrckFsQUZpREE3U0FVeUlv?=
 =?utf-8?B?RWZtb0NuNzB5dm1rK2FSd0xkZXp0TTBWQWZFc2FldXFuME54SGdmMHlLeDhv?=
 =?utf-8?B?Z0huMHB6b1VYTXdxYkl2N1FSREtPVytnWHhXY1hMb0JkOFRyaGFQZ1ZGVEsy?=
 =?utf-8?B?cDVJdDR6bXFnSlB6M1Uvd0hEbVMrQ2krcjVXUlp4dXVBcmRqOFpyOUNjOWNU?=
 =?utf-8?B?bnQ2MVlnRWpyeGZ4QmVmbm03UWRMSHBiRnoySTBnOHNvb3ZVN3JwRzFiMDVI?=
 =?utf-8?B?eTFjNVhXZlRRSVdQYXBTY20rOWJ3Nm1NUlNDM2diUWg3ZUpLNFhzNGczSndv?=
 =?utf-8?B?Z2o1K0lqN1g5MkIvMUVYZ3d1ckZONGh5MFl1NC9acGlWZXdYTGFhUXVsMzVB?=
 =?utf-8?B?RW1kektCb1ZRdlBzdE9aeXl2Szh1ZWgrVmJiZ29EYXE4QlZMcE44STFhWS9C?=
 =?utf-8?B?WFpzV2RyNFF1NjZaSE1sbXZyT0hGcldqSE1nUmY5T3Y5Z0tyZ0VJRk5TaDFS?=
 =?utf-8?B?K0dZWnhaMGJ2V0duTmVnaVBnSUxNMWJaNEt2czYxT2Jzc090b0ZpT2NJRTRJ?=
 =?utf-8?B?cngwLzYxVWM0SFQ0bDV1d1llODlKUUd4UlUvblZscGl1VXcrTzZQUVM0R3pW?=
 =?utf-8?B?c1NWZlovdjVmZW05VTlIYUJWVkVEVm1CQThXMzIxNnd3aHRBMk5KNjhSVmNH?=
 =?utf-8?B?SEwwVmpwWGF3U0pWWWppd1hBNXpuYTJ1eGNscS9EUXR4aytJaWtaNHNUMzNn?=
 =?utf-8?B?MDY0ODhWdjFaN25rampla0lHaEJ3UXc5NnJCeHB2TGNic3BFMW5NK1NGQ0xH?=
 =?utf-8?B?b0dIcWNIRXNHMnNaWVBFRGlrV2FBeDN3TlU0T2NiZTlNQkp6TnZKTGEyaG14?=
 =?utf-8?B?TlkxbG91T05EMUVOakdMRmU1MGhYNnU4UnZEYlN4Qks5eUh4NWQ5RWo2QXl2?=
 =?utf-8?B?VGJQT21CdU03SUF4d0w2RHZaNzUrYnpKNnEwWTFVZHNnalA4YzJ6TnBaa1Ju?=
 =?utf-8?B?NWVQbHBLTWhGOGdCZFhWRVJpdE8xcGNnQ2tVTGR5by8yNEZZZ01pRXJJMyt0?=
 =?utf-8?B?SGFDMHA4V2NJRXlwUzVuT2JtMldxOThvWHNKN2lzc1Z1NDVvUUhwYThUcHht?=
 =?utf-8?B?S1lDdGZRcmxaZEhTTy8vbE9IUGs2TENhZ20vSGpkTkhvUGdjS1YzMTJ4bjRk?=
 =?utf-8?B?R1NhUi9JVWVSMC8wTFprTDIrcnJiRGxVbnIzUmpNdFBmaC9iN3BhWndlSzc1?=
 =?utf-8?B?anFia1VUaGphYS9YZVBUUFRyTnJXRmVJV3JpRU04MDJhUnpMQWtxdmVYN013?=
 =?utf-8?B?cWlyblo0UlNmbnF1R1NTRk40T3hIdW9BQnVtMWsxeGh5ZnBqVkFFTGl3Z2Fk?=
 =?utf-8?B?eUVRWkgrRm1YYTBSa054TVE5NkNjbmJLNVRaY3ZFRjJzTmpRVVhxVXFhNStO?=
 =?utf-8?B?Mk5vM2txUGk1SDBKN3pRam1yeUNNWE5sUzBQdjdhdWFsNkNvK1NKUkFSR1hV?=
 =?utf-8?B?SytucTdoa3d3YUo0NkxjV25zWHJJb3NjcG93Q0huZDA5V1U3TXNKYTFpVGY2?=
 =?utf-8?B?SXhXNkVwSmFuQjlWb1ZneGMrRXZZcWJiV05Pa09iYk80YTQxNGowd2hBWW1O?=
 =?utf-8?B?YkpqWVR1cW11NDJ1MUVvVFdIdU1ydW5ZTTJHZFJUcnhPSDBzSG1oMnlIcXh4?=
 =?utf-8?B?bWE5THdjYWV1VmMyRlViQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0w3ak4zZm8vQ2RmdmlXQWlQY3VURElHODllcVlyQm1UMUxqQmVVUE5iSmtv?=
 =?utf-8?B?YzkxU1c1Q2lWZlVVNDIwYUtBbmNkdkZBTzZPYUxIQ2lWSlJuRFUxSXd4VUlO?=
 =?utf-8?B?cjFzZmEwU2l0ZXY0QjM4MEFNaWtRY05GN0xwTlZvczdGTVBYVVdFT3ZMTGVu?=
 =?utf-8?B?WGNZT08wbTVVWEF0Um5MMEIrZFh5QXJGUUY3bFhrclFQLzFya3FkTjlzMnRX?=
 =?utf-8?B?b1ZVSEEwcWVoeVBBYk5lQ05oNHB3dG05RzJuRnRLNEp4UlNzSjM0Q1pPU25n?=
 =?utf-8?B?eDVQQlVpV2VWblhDYzQ2bHd5bnFxQy9wRUJGeDlMaE9OekdFaWIzV1NrcVZG?=
 =?utf-8?B?endBOGRDSXE4RTE4TWR2NXB1bU1UUkMreHpFUFVoQzltSTlXMDY5bmJtTURI?=
 =?utf-8?B?aEEwUWEvcUNSTGtaZ1J6L1VxQm9sT2pEd214UzRwb25jSnpOZ0FHR3h6V3A4?=
 =?utf-8?B?SThhNGVaNXlhSmZoUjFRc0lmVktwSUsvL3RMQjduT3FNTEd4bk5uQ0dWMmFI?=
 =?utf-8?B?bHFNZ25NUUVaU29JZDBCZFRtRlhqNGRpTXJlQklQZnJxWmR1TENiN25DQ1dS?=
 =?utf-8?B?em53K3pvaXVjWlJGUmlObWdrZm1WVHpqRHZ4SVMrd1dqM3NHaXh5VVp2eStm?=
 =?utf-8?B?UnN4UVdEY05wSitrV2RtQW5nQ0psd2I4K2lnN3piVVJrSy9DMGhkMmFyNHVC?=
 =?utf-8?B?WWdGWC8xVmNSUnA5M0VROTRJaGEwcnNyWVpQcmNlcitMeVp5cGVjRXNsTjFO?=
 =?utf-8?B?L0wyODIrczY0RiswbEdUTTVHUHVJTEgxOHZob3llcGhSbjNhalJkOFJYYVA4?=
 =?utf-8?B?UXAyZGhndkc0ZnRnUTFhOWFZRnJQVzQxMm94ZlowVWMxRW5RNW5ValNrNXAz?=
 =?utf-8?B?ckJ0ajJHajhZdnBaYWhKQjNQU21TMkY1MXNLVUl6cTFabmZkT3paQlNvOWFh?=
 =?utf-8?B?Rm5lOWNDb1JnWld1bWczaTBpdUNuZjhFQmhOa04ydEM3Q1FoaWZqVGN3MVRM?=
 =?utf-8?B?K2gwYmFSTWFnNGJxWGM3N3hVdWdTR0dnazlOVU9HNi9wcUxyV1RrTkpNcjZH?=
 =?utf-8?B?MWRwekczRElZS21RUVVLeldtU1VPa05GYWpUS1Q5bHRyajVqckY5U0FleFps?=
 =?utf-8?B?RjF4ZGZjT3BQTEh1aHVKMmlISStnYUpicy80UmRZSGlBY01KelhPb3Mzd21a?=
 =?utf-8?B?am1leFg2YWd0c3B1Mk13a2lTTHZ2ck1qc0JBcXh6Z0ZPZVZDUXVMSklYb0Rm?=
 =?utf-8?B?VThzanBvOXNVYmw4SXRmZWZwd0RnZ09Ebm1wQ3lscVovR3R6Qm5OS1dkaTdP?=
 =?utf-8?B?QVBkTk41a1FhU0pjOUl3bzdEZmo5V2dVTzRtNDhzVVZsekYzZ2NlZFM5cC9k?=
 =?utf-8?B?bER5bHVjWWtycWdGN2QzYW1sdFVYUTF0YTYrUFZKa25ERlIyZmZqekZ0ZHpl?=
 =?utf-8?B?SEZuNDhZZ3F4Q29TNFZab0RuWWdnYXRjcEpaem05SHlKdWMxcnNBaWlJbGtP?=
 =?utf-8?B?cGhiWkpvVkVYR1UzaWNGbURQa1h3aGdOcEtMRjc5WTZjYzRFeXMrQ0hDMGFk?=
 =?utf-8?B?N3dGYjlaNDZER05lM2UzN3ZQT01JTWVva1JmQnhNcDZPYjF5ZFR3R3V0V01V?=
 =?utf-8?B?OFkxYjBQQ1JtekdyRUtXWXRhcXRjaUcxcnZzZ0xVS3Juam0yT2JIUUVYaVNm?=
 =?utf-8?B?aWZjamxJdldPTGZNMS9lMWY2Umdzdk9rZ0tHZ2VyNG41VUpuaFlIMXd2dnBa?=
 =?utf-8?B?QW5hRlcrcFdFL1VWMzN2MnBhSXpzdjErSjdPYW5ISG0rS0NGRFhuekcvZWJD?=
 =?utf-8?B?cWJubmgrNHozUWhhOGhSUm85RUQwS2poNlI1dUxyenMxdWorWWtnOEtKUnU3?=
 =?utf-8?B?NTBpN3RzN0sxNGJZQzNSWTFkNTlOcU80b05hRVBJOTRnZkU4eTY0STVaWUYx?=
 =?utf-8?B?bERRUTh3UW1rSXFOcXR5NnZqOFVKT3libmJZVG9kUUVNSTMrMDJXenJ2TnRG?=
 =?utf-8?B?bTZ5dEFOUWlqVzNlV0RvLzhBSGtqRDZRc1dYdVBycTl2Und5S01HWWNaUmlN?=
 =?utf-8?B?RlJyM2hJMm9XSEIwb0wzQTFFcWovM0NlL2lmbjl6ZzBDclVXMmJ6TDArNFd0?=
 =?utf-8?B?TnloekpPSEJxWlBveUQwc00rRlkvR2JjVW8xS1ErdWwway9jTVZGZm5MeVlJ?=
 =?utf-8?Q?fdb+lWziTcR5JNNe184pT3ZNTLigVsD+sh00qzghHr/c?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3ae4bb-f756-4325-a2c7-08dca0e1487e
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 13:07:42.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7bZI5EkmdZ/yp29HQhQ8RlLTUMXw0EgSE0FU1eqZO3zDPWm0rVuPmL+xIxUu1NjX0npe99NnvuiqumGwYPtlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE2P281MB4804
X-TM-AS-ERS: 40.93.78.5-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28520.007
X-TMASE-Result: 10--21.189900-4.000000
X-TMASE-MatchedRID: u6ojmU07PKz5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK3UJJ8+n/4RdDF
	H3Wq0Hei8/CUaSFEolDtIrpZrVLcYZ5mTKF4TLatoSymbNaqh690oFi/bzvqqGHCsfOTI0iVFIB
	UXk42ekvZFrPm8SKYrjMfis/0rGfSRebobsPZHKY5z9yWarHTmlxF+wAaDLINWQMS6lqffg/KAK
	ZFbhJUT6hlHCU6UdV8e4+4YeTdG8lv9tn1n4xOAwtA/CxcpPQhEuR84e9GA+J2QL/KCo6K9CdNK
	8X5KGCDMyz8KcxrQzE8zCPEDFRZmrO8hCGjfYuCCffN9El9NwP9jl71CJrVKfVG52rL0ActKRIb
	qmytiUjGkRdfu4ZhYRYZpj/SC0BbR7Y+O/RwUmnLDwjBUT3qPiGWu3tLGgHRw36vBjEESACnOaM
	BWSqGEjr1hhcccj1BGD/UaR452kcTevXTasglgSTufEFUWmNnoJ9fUBwJTsy9LHBqtd453Of9ry
	7KXO1jH2xok6cGGNDfkeDeqjcUMrQXAzqRhcjW5enkh7Jrzn7uB3lKociGMr2L79/20sYbwRa8Z
	S5VxQvVrcffp4Ytrftv/hUiBMyU6LWWRS861V9rAlSpuYY8Hdo+48giqZwn+ng65LLRQXGvngkj
	HjojpK5VxRkWDMVwEA4s0Z67fd0qIw/OY3zSGZx7TrJxMWvN0K2S3XHNPUe/2tJ3foSBQj4yqD4
	LKu3A
X-TMASE-XGENCLOUD: 418d8773-f408-429f-848f-aad0f85e976f-0-0-200-0
X-TM-Deliver-Signature: F3C1C06C21DA97FBE6BD18D7EB79DC94
X-TM-Addin-Auth: ueep1XE1kbXbQ5j/37MYk69tDcYlkkLO7FHKAHd6pwDSgAxLqzflKXh7ZwI
	07bQjNacelv6eEjt3NKxX10TA8cD34LzJjY2S6+QgpwEfvwPJl+E3J96X5M+Dhrqb+43PaCA/HZ
	UGi8aTX2fNrZi1T2BG8Q3+efsx4YazTkVR5qIyQPXV2SalrF+aD2W6j2yRETL3GUfSQtulX7NPr
	BBeevw1XR5P9Cjb9eaoxf/ifm55+Wan5a1xlTBIRHsScoGdlcwhq8HNlzXvAR8eqs+gkxd8GpmN
	gXOFqv7WyUx/xwY=.p+ttgUtEAigtavdDJVrcQZlX1cpeAxVt8pvCglrcbhvSG+s6c6rvvtSRj4
	tOjXzXJW3ohx8rxY8N42J6vPzlL3BTuaEKcmvrT5fu23SUclnqG0amqhriXAnFvZ3jDP0NAssWB
	gCDMWFdC/dIDDZHFgFJwsPAPKIptTXvFOxqqaj17gSVv/oUpp+UZ59bzOBarflcb04jVA6UKwcH
	KfK7lUnqf53okSjJjCSN737gx2/V+AXZNgQTrFYBE7Qq8CvJgs/w1fphognFSuLaBmln3wMbSn3
	278vn7wA6YjVKXOGJioCmiEQqg218/JHqZ4navQkbmCRqsbCC+QCSXBxPJQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720616866;
	bh=2LmZfy6AdnUPeBAFvNLv5gk2YKhaO7WPdjpuBNAphGE=; l=6919;
	h=Date:From:To;
	b=i/YWP2dIj1bLrbIW+8bM+chdQYeCAxNS8dYX+aLNR3f5WdHT2acqd/8WqkMevetUK
	 vYIl1H1tWImbgcuI3d9cNMWq4/5c96OUNc4CE0mE8Dc6F92ysagy/GaT2a35ocIHo0
	 tZiM3W58CDWHXn3HuNQEzVPOyt0rObjfYaZ4YC/MhBRFTICI2/yzQe6uZigzceK+6e
	 P60s7+R2hiGG7jRTc7yO3FD4jZTlHdVx2W0foDJJi/8N1XxzB0HNZ9+WsMSv5E5IzK
	 UwUKpKPg/JYOjj5oMMoTlWfYuAECoN37i5qwS2PyHh1v40D0e3z+6Gto1MOGUOmRf+
	 VHkdSrs/ktK6Q==

On 08.07.24 11:27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The vmclock "device" provides a shared memory region with precision clock
> information. By using shared memory, it is safe across Live Migration.
> 
> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
> actually helpful.
> 
> The memory region of the device is also exposed to userspace so it can be
> read or memory mapped by application which need reliable notification of
> clock disruptions.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

[...]

> +
> +struct vmclock_abi {
> +	/* CONSTANT FIELDS */
> +	uint32_t magic;
> +#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
> +	uint32_t size;		/* Size of region containing this structure */
> +	uint16_t version;	/* 1 */
> +	uint8_t counter_id; /* Matches VIRTIO_RTC_COUNTER_xxx except INVALID */
> +#define VMCLOCK_COUNTER_ARM_VCNT	0
> +#define VMCLOCK_COUNTER_X86_TSC		1
> +#define VMCLOCK_COUNTER_INVALID		0xff
> +	uint8_t time_type; /* Matches VIRTIO_RTC_TYPE_xxx */
> +#define VMCLOCK_TIME_UTC			0	/* Since 1970-01-01 00:00:00z */
> +#define VMCLOCK_TIME_TAI			1	/* Since 1970-01-01 00:00:00z */
> +#define VMCLOCK_TIME_MONOTONIC			2	/* Since undefined epoch */
> +#define VMCLOCK_TIME_INVALID_SMEARED		3	/* Not supported */
> +#define VMCLOCK_TIME_INVALID_MAYBE_SMEARED	4	/* Not supported */
> +
> +	/* NON-CONSTANT FIELDS PROTECTED BY SEQCOUNT LOCK */
> +	uint32_t seq_count;	/* Low bit means an update is in progress */
> +	/*
> +	 * This field changes to another non-repeating value when the CPU
> +	 * counter is disrupted, for example on live migration. This lets
> +	 * the guest know that it should discard any calibration it has
> +	 * performed of the counter against external sources (NTP/PTP/etc.).
> +	 */
> +	uint64_t disruption_marker;
> +	uint64_t flags;
> +	/* Indicates that the tai_offset_sec field is valid */
> +#define VMCLOCK_FLAG_TAI_OFFSET_VALID		(1 << 0)
> +	/*
> +	 * Optionally used to notify guests of pending maintenance events.
> +	 * A guest which provides latency-sensitive services may wish to
> +	 * remove itself from service if an event is coming up. Two flags
> +	 * indicate the approximate imminence of the event.
> +	 */
> +#define VMCLOCK_FLAG_DISRUPTION_SOON		(1 << 1) /* About a day */
> +#define VMCLOCK_FLAG_DISRUPTION_IMMINENT	(1 << 2) /* About an hour */
> +#define VMCLOCK_FLAG_PERIOD_ESTERROR_VALID	(1 << 3)
> +#define VMCLOCK_FLAG_PERIOD_MAXERROR_VALID	(1 << 4)
> +#define VMCLOCK_FLAG_TIME_ESTERROR_VALID	(1 << 5)
> +#define VMCLOCK_FLAG_TIME_MAXERROR_VALID	(1 << 6)
> +	/*
> +	 * Even regardless of leap seconds, the time presented through this
> +	 * mechanism may not be strictly monotonic. If the counter slows down
> +	 * and the host adapts to this discovery, the time calculated from
> +	 * the value of the counter immediately after an update to this
> +	 * structure, may appear to be *earlier* than a calculation just
> +	 * before the update (while the counter was believed to be running
> +	 * faster than it now is). A guest operating system will typically
> +	 * *skew* its own system clock back towards the reference clock
> +	 * exposed here, rather than following this clock directly. If,
> +	 * however, this structure is being populated from such a system
> +	 * clock which is already handled in such a fashion and the results
> +	 * *are* guaranteed to be monotonic, such monotonicity can be
> +	 * advertised by setting this bit.
> +	 */

I wonder if this might be difficult to define in a standard.

Is there a need to define device and driver behavior in more detail? What
would happen if e.g. the device first decides how to update the clock, but
is then slow to update the SHM?

> +#define VMCLOCK_FLAG_TIME_MONOTONIC		(1 << 7)
> +
> +	uint8_t pad[2];
> +	uint8_t clock_status;
> +#define VMCLOCK_STATUS_UNKNOWN		0
> +#define VMCLOCK_STATUS_INITIALIZING	1
> +#define VMCLOCK_STATUS_SYNCHRONIZED	2
> +#define VMCLOCK_STATUS_FREERUNNING	3
> +#define VMCLOCK_STATUS_UNRELIABLE	4
> +
> +	/*
> +	 * The time exposed through this device is never smeared. This field
> +	 * corresponds to the 'subtype' field in virtio-rtc, which indicates
> +	 * the smearing method. However in this case it provides a *hint* to
> +	 * the guest operating system, such that *if* the guest OS wants to
> +	 * provide its users with an alternative clock which does not follow
> +	 * the POSIX CLOCK_REALTIME standard, it may do so in a fashion
> +	 * consistent with the other systems in the nearby environment.

AFAIU the POSIX.1-2017 standard does not mandate UTC, esp. not w.r.t.
leap seconds [1, A.4.16 Seconds Since the Epoch]:

> Those applications which do care about leap seconds can determine how to
> handle them in whatever way those applications feel is best. This was
> particularly emphasized because there was disagreement about what the best
> way of handling leap seconds might be. It is a practical impossibility to
> mandate that a conforming implementation must have a fixed relationship to
> any particular official clock (consider isolated systems, or systems
> performing "reruns" by setting the clock to some arbitrary time).

So the above comment should probably refer to UTC instead of POSIX
CLOCK_REALTIME.

> +	 */
> +	uint8_t leap_second_smearing_hint; /* Matches VIRTIO_RTC_SUBTYPE_xxx */
> +#define VMCLOCK_SMEARING_STRICT		0
> +#define VMCLOCK_SMEARING_NOON_LINEAR	1
> +#define VMCLOCK_SMEARING_UTC_SLS	2
> +	int16_t tai_offset_sec;
> +	uint8_t leap_indicator; /* Based on VIRTIO_RTC_LEAP_xxx */
> +#define VMCLOCK_LEAP_NONE	0	/* No known nearby leap second */
> +#define VMCLOCK_LEAP_PRE_POS	1	/* Leap second + at end of month */

A positive leap second usually means stepping the clock backwards, so 
`Leap second +` is somewhat confusing.

> +#define VMCLOCK_LEAP_PRE_NEG	2	/* Leap second - at end of month */
> +#define VMCLOCK_LEAP_POS	3	/* Set during 23:59:60 second */
> +#define VMCLOCK_LEAP_NEG	4	/* Not used in VMCLOCK */
> +	/*
> +	 * These values are not (yet) in virtio-rtc. They indicate that a
> +	 * leap second *has* occurred at the start of the month. This allows
> +	 * a guest to generate a smeared clock from the accurate clock which
> +	 * this device provides, as smearing may need to continue for up to a
> +	 * period of time *after* the point of the leap second itself. Must
> +	 * be cleared by the 15th day of the month.
> +	 */
> +#define VMCLOCK_LEAP_POST_POS	5
> +#define VMCLOCK_LEAP_POST_NEG	6

I think it can still be discussed in the context of virtio-rtc whether we
should add dedicated identifiers for message-based smeared clock readouts.


[1] https://pubs.opengroup.org/onlinepubs/9699919799/

