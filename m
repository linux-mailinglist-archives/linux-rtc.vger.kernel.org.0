Return-Path: <linux-rtc+bounces-1426-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2891C3DA
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 18:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6977A284E95
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 16:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F561C9EDA;
	Fri, 28 Jun 2024 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="gyHfbwOy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F591C9EA9
	for <linux-rtc@vger.kernel.org>; Fri, 28 Jun 2024 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719592717; cv=fail; b=mawiXL7WMuP/beWwFGowsOHf3BNpq9ks5sehCjb4q+bFeEzSgXX2k8/h8O1sYZhYSOo/+FtG3nvVW4b5IiHBT/JV5rKN7XxN/WZDNUwYo/LLwEM5EjnUwHC5pNVmWoPIOVEi84zRFzhZFopCzmTexiMX9evGt3fYGdiqJ0VCbLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719592717; c=relaxed/simple;
	bh=kFy7fsKpiMXjKfLHn4w6dCBlJ90VXkBN0x6kUgIPpb4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GkjZdjwEQj5ZkXLuqrwZqeTBWWhLN8RdOgHBczFjOEyC/B5hnbXxi48VFoEOwawgX1t4kc2SKJKDymC10uHxh8zXTtD8FAnmkfGhK3BceShqZBdAw1p/WnSZmBTW+SlGpVs6odtzB+orIlScPvRAojQ+4JpQ9z78v1cDgfjldhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=gyHfbwOy; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.54_.trendmicro.com (unknown [172.21.9.50])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 617E310005984;
	Fri, 28 Jun 2024 16:38:27 +0000 (UTC)
Received: from 40.93.78.54_.trendmicro.com (unknown [172.21.180.199])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id D68C8100004F3;
	Fri, 28 Jun 2024 16:38:19 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719592699.115000
X-TM-MAIL-UUID: f65466d0-aff9-4cf5-93f6-f00289456a17
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.54])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 1C4B9100003B4;
	Fri, 28 Jun 2024 16:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td3KsWYRpsCDclzag7dHLMOlcka4mLeVJgNOblnuf1G2Ki8pbGMaYvv9QfgH6GowPMD2HcW6iOEr8bJqFQXW2IJ1CIoI4VFHkw3ZeTMOdZsumv4Zu2i55lfE1me9D1smRo0xw8f9WPt7n9C29EjhAQgVfDS/3Vn7ZRKt9jFv/kXM2CHCjd2JKFzAsFLduIJw6GfYtvEP/oqB9R2irLTmAx1hJaf1SuZs7FA3rxnmrY1fMq3kFd5cJ4uWtW/dF1TXtHfJr4psJUyZNzEQ8YWTvFtR82wpTydckYT+P/c0Mr6l9fL96oQnN6Cfswo/0oUDcYpGkFCXmE4lmBjqTGsIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2tG57cqf3q+OSdjAYiwuE36T7LTUqA3CFZMJsLBb74=;
 b=KugNyf6ZN52A5kKWbQZW3qZ0z16nUA2yVyPO33Gm3gABp9N/0dyAnWnM+ybtgK/NtMjJc4beoBbHVaELk9/FfbVHpLr8k7qqK128OPpj7m7dOeZn1Ey8OZam7L3wksIb30aH5jJRM0sZlEVYY4VKbAv2h25MhhrF5/JIgkT/7G+CQGce9IHtxTvSusM4tTW2xRu24ULJ92if/e2AyLJxiQ/TSwVXPyWIhhsuXuOctT4xMI9MUoJBumEFeb3YtXzTAVCevOwG26LFNqkhiekcmmYpfGgXTdhPuTSKcRTqCfUdwt6srlP9QFwO/X4t2RLZA3HgKxBWJOKSOkLw0G8vRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
Date: Fri, 28 Jun 2024 18:38:15 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::9) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR4P281MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d4b130-0bca-4797-d9dd-08dc9790b648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWZWWlNUdElKQkZ2c21EWTVnVVA4YngxL3B2eXd3UnpJRjBtb0sxRDQ4cDlF?=
 =?utf-8?B?bVBOUHgwRkhYU1JRWEhCSWIveVZqQzhtbTB3c1FiNStwSEYzUFFjSkpXQVdM?=
 =?utf-8?B?d2FQQTBndHhBSlpjWERtN2FUcnBCSE5ZMkM5bVlPRjBGSkJLMjBQY3F5U3dE?=
 =?utf-8?B?TXdIR3VXcDBaNG9sMHZRZlpXdExrV2RYRDUrc3IrYmJzSmo0YkdiWlRpUEd0?=
 =?utf-8?B?M2RjdWZwMGhqWWxhb0lvcVBNT3ZEZWFuUjBtSU5Eam91OGlWVjRRK1FVRjE4?=
 =?utf-8?B?dEFvM202WktpdlRXM201ZHliNEZxMmxsOWFabi8ydFcyYUlqelhiN1o5V3pW?=
 =?utf-8?B?ZGRndHA3UGtKZTZ1NWdrai9BeW9BR1NtNUNPcldMRTl0QTM1UjJCY2dJdjVn?=
 =?utf-8?B?TzRWYmpiSWI3a1ZoUEJHRVJjSHpyVjhxVlIxZGt4dDhQdVlsdlNIbklVOWtw?=
 =?utf-8?B?NmZFcFltTnZHR3hjT1g0WmU4L3JiT2dMQzNxaThwZ3FZUHRwUzBIekF1SE43?=
 =?utf-8?B?bndyTkY2U1NSRTJ4cGpLeVBlVk1adktxOExNdi9WZENGTTZsNGdIbnhHWGov?=
 =?utf-8?B?Qlowc3g5ZWdXWVdicmpCYWhheDYzVDdRdSs2eUE2UUtFaHE2dFJtbGNrbkc0?=
 =?utf-8?B?UVdnRjNaS3BQRUZwMEhIcWdiY2lnbjc3aDlqR0RXWnNjSGhuY2N3TXo1Y25n?=
 =?utf-8?B?WFUrSkl6N3BlbEYwOW9jSXhUVkpNSlIzOFY2b0F4RDM0cTA1bUFjR3ZWR0Er?=
 =?utf-8?B?YjNNL2R5WEw2aTEvYkxOQWVVaXg4eVVoYkZaTGU1TUVseXV3STRhS3kyaDdk?=
 =?utf-8?B?L2JsTlhXM3dKZFRlVlhRVEVQa3laL0JCd040RG9ENVEraVFwY1VzcFhvbjll?=
 =?utf-8?B?d0Yrd0hrYUZCVTRpWWN4QkdYU0xXL2ZmRFNlZUNhanlyNXFXSU0yRVFySGQ0?=
 =?utf-8?B?Qk9reG1Ddm5wa2ZuRzNJUFNXNUZYZEV3eW5XTFYvWjArWS9pZWlmcTc5SWEr?=
 =?utf-8?B?eUhvNEo0SEFIWEM5S1I3TmFDb1ZrZjcyMXcrVTdSYnFPNzNIY08xaUplNjFI?=
 =?utf-8?B?MWlYcUVwL29Ia2VaaVV3dkhkQ3BBMjBpVWxrQXVVUEZEMHI2bkFMNldnTUpF?=
 =?utf-8?B?U3VDb2tjNzQzNVNwbThWUVRxNjhMcnFsMUtoM240azlWcVJYTm5SRmtaY1A2?=
 =?utf-8?B?WWpFdGg4VUZ2YXpZbStDYjZYRksvb0crU2hCbDJHcDNMQW9yWnZwRmJ1cnor?=
 =?utf-8?B?Y0lwMWxxdHdDNGl4a0sxSzkvQmV2UFZWa1ZHd0JqU1JhZVBCN1p1amEvRThq?=
 =?utf-8?B?MVVXVm1CcEsraGxqZDRZdVhpUUVUcXB1eklNaEtaaU1PTi9CZ3pDN3ZsNDcr?=
 =?utf-8?B?Z0JhOUR1ZCtMR0VZZ1lIaFFYcHJqeHBTRkFYbVdaaUZnblNZaUoxSGcrSTJF?=
 =?utf-8?B?NzIzaStBTGZmTUp4dGlsZktzc3RSeENJT3p0TXhPMzFKUkFadjBOTXpXNHVw?=
 =?utf-8?B?RTM3VEdmb1JBRzMyVjBjNm9Ja1JVRkM2RWt4NHVzN0pubE51NmhQRVcrc28r?=
 =?utf-8?B?bjhjd2xCRDF6VGlJY3duMkJCa2VHeFZwN09yakFnbmQ4VW5QYUJjZjdobjZD?=
 =?utf-8?B?a2s3KzQ3SXdVMnJGeGlLNUQ5cjVRdW5POVVzZG1aRFZaUHBvK1UwamVBMW5U?=
 =?utf-8?B?TjB2YUFOakNmdyswUW1adVpEMDdBeUZpM1JjRDlSTS9IL2NLK2NFUEoyUCtj?=
 =?utf-8?B?YW9SUXArQzIxR29xQmZ1N0JMNXhMTHREZHFQUEhuMUhhZTFaM3BZdjZscURK?=
 =?utf-8?B?QkYwbTR4eXdPTnFuVDEySFFMMDRiSEorTHVtemdXQ25NSlhock9CT2lLNTM3?=
 =?utf-8?Q?2bemhgvfnlJ6z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWh6cEoxaDNTNnFLNlpjLzRWdC8waXRVZEZBL0w3R1l6TWJ1MjRDVXlnMysy?=
 =?utf-8?B?d3h1VzNQWmFZTyt5WnlzaWJSblRoZ2srOWljOHA5U0J2QVJ3SVR2YXhWK3hv?=
 =?utf-8?B?N1lQbHg0Mk9yRjIyYWFnK2wrVTR2QUwzVHhCOUt4Z2VLRmNpU2FBWGh3RW9B?=
 =?utf-8?B?dE10dkNrNzgveGNvemFkREFvMUpvUkNZTU53cWpBaHJTczh6UExlSGpXbUlM?=
 =?utf-8?B?MmJqSEJYTVh5N3pybHlOVU1ZamFPUkJONGFkaFpmNGUrVEQ3WWJsRnJ6TWlT?=
 =?utf-8?B?OVFMVTBOdlpxaitzak9VVGcwa2V1c0QvQnE5UVozYUIvTkcxemZyTFpGSEIz?=
 =?utf-8?B?VDQ0K2dpWEJEeHNINTd2Uzg5YXhacHF4L3RVTmxTRGxMWHQrTmlQK0lmL2pD?=
 =?utf-8?B?NENxTjJzbjdEYkNXRWRSc0lPTElVdXZYQ3RnaHlSL08zZzZvSElMRVExNnVo?=
 =?utf-8?B?aDhETlNENGl4UG91WW9QMGFxUzFiR2Ivd3Q5NWF5QzlkMG5yOVQ2RlJnNDVP?=
 =?utf-8?B?RytIRUpyNndpZkZNdmVaUVlpVURpRHlVVkV1UUFYSG1yaHFZaXV3aU5td1BL?=
 =?utf-8?B?K3VMWlhvanpac1V2R3NMaDFPZG5RTVM1M2UzUDZzcndsVHI2NWRpRzZCQno1?=
 =?utf-8?B?YXlkdkZBWUc1ZWtVVVVBdkt0NEpNSG5mSWVSK0drcXFjQ1NCNEFqcHc5bjhn?=
 =?utf-8?B?WHlDYVhhNzVnOTJ0RnVEdnRXT3hCTDNrdTgvVUEwd3c1b2pQTC93bnRNZUpx?=
 =?utf-8?B?Snl6S215aWhzSk9WYThML2JpUlBWNXZmZWRrSXFwTjZaT1lZMUV6d0ZEVTl0?=
 =?utf-8?B?MjZPYmkwalpoT1NQZ2JnVGlINmtUa2tNYStoNEU5M2dqbWIwVFc0MGtTckpo?=
 =?utf-8?B?WjlGRC8rUStRbCs5Ly9UMlp5M01ZbmM0Z2xqMHhMSDgwK0JUa0pmWERDQ0Zw?=
 =?utf-8?B?amdGSWdJVnQvdjZURHkzSTdhNS9KRE0rWUc1a1djVW83eEtSTEY0YVgrdzFa?=
 =?utf-8?B?VXNjQSs0REJZaWYrS09KUTd3aVM5Y3ZPaWxuWkdMS0FxYWxoK01RK3BHRTlQ?=
 =?utf-8?B?MThncFhSUGZKaG5wN2syVGF0Yi9pWkdwbkpCdWs0UEFMOXV3aEFLdElIMlhE?=
 =?utf-8?B?dnkyUG5UNFRodzR1MGVyLzNGYXpBYVlIbXVXR2s5TFJWMjZPUVZSOHFGSUlZ?=
 =?utf-8?B?eWVNZU5nMkJnOTN6QzJnVWlBaGJXN3MxL0kvRFJwU1h1bVRIN0sraUt2T3dp?=
 =?utf-8?B?TVpRMDg2Ym9kQklSYU5ySkpRMGF0TUVHdDBlVmhob1crOUtjTnBQQy9IV2VC?=
 =?utf-8?B?Q0JzUkhkc2FUSlprRXl5Uzd1MFNLaXE3QjA3Q2R0QkdZMVV0MkY5VGVZcTcv?=
 =?utf-8?B?aER5bHQ0SHFiS0cwcElWb01Db0JydTVLcE9tVXhkNnhkZk5Va3VJRzROT2FB?=
 =?utf-8?B?RHk3WFlIT2UzS2Q2K2NJYUc2L3d0UDBpRFE0WThHdnZ4SXI0SjFMeUY1MzJ2?=
 =?utf-8?B?bythdzB0U2ZDd1dUVDNRS0JVdGlZSEV4Znh5ZFhTQ1FDZDM0ZDJ1WnpxN1hG?=
 =?utf-8?B?Vmd0a0JxWFFxVk9hL3JMUVpVTUt3Tkh0bUNjcExrTFVjT3dwNDE0NHN2VTNo?=
 =?utf-8?B?a3drSitoeWRwc1hzQWNRZ0dOSGhwMHczYmYxMUc5S3poNXNLb3ZkbEFmaUxB?=
 =?utf-8?B?WnJCODJkUzRXN0FHMGlFcHE3ZkoxVy81elNpeFNNWjY5MFdSNVFFNndMZFEx?=
 =?utf-8?B?YldGV1JiZW5VajQ5UVFVRExJSUw5UDdMSVRxZXpNSjFuZHBueGUxT1RHZXI4?=
 =?utf-8?B?TlNsYXlKOTNpMGlNTjRrNDRvTXRKUTNyV1FUYkE4ZElLOHBpUFBQNnFYeWhk?=
 =?utf-8?B?UzJCeUp5VHFNUGZmSnhuRlgzdnlNYkx5QlZwU2M5RUpROEVnZjVGMmI1d2JT?=
 =?utf-8?B?RisvaTloNjUrRFRiR1dLS2tiRElFakd1Q3doSjdXNkhucUJPajFkU0RmV29X?=
 =?utf-8?B?Y1hpdlB2QUkya1FDa1AyMnVNVWZobXg0YmMxVHVCNmJyMkdTZTNab2ZJRGJ4?=
 =?utf-8?B?bXVobWNoUWllTTlTaHpEcTFQSldyMTFMTWd6THhoWDF1VWw3ZHpNTDBhUnBm?=
 =?utf-8?B?dlo3OTBtTXJadmFkTFBnTDhhK1BSTHFpR0hONGt1NzNHNCtwaG1vMkh6WEdo?=
 =?utf-8?Q?ke2/4BW4xVoSj9Ibsc0GfRXAaeV+dhLikijtAdxEDioN?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d4b130-0bca-4797-d9dd-08dc9790b648
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 16:38:17.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5jihwzToQQuPvSPg8aZRp4+5HVATxcXuTgc43lJz6sGrCzFnF5uT3DF3D1Q7zdtYtAqzm7wqcIZU8bYyWOx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4778
X-TM-AS-ERS: 40.93.78.54-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28490.000
X-TMASE-Result: 10--13.670500-4.000000
X-TMASE-MatchedRID: Rp71wniPtoP5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xKOGg51f50an7Iw
	v5gCU8doFV5P7J6vD8V42Z4B+7Pl3FD34UJ1p+WwPIAEWj78ztZNMNY2L2K/D/yOIGI0xdiWoMT
	B0w5kCEmmX/tHe8XUp+Tvok5Eppmxqu6mMiHAZanHwJYnpo0L6RWhK9n3L3nuTlSOM+BNiL4ywA
	9RKGrQyzWVB0HE7lH/5MleMRAioZKfZHPhoNvhZiE8raaf46xMm8lEjXZMqs78kcj4obJOBl0cU
	l/5Axjr08q4PMUbAPj6EfBXMJMt1Ov4GREAjUnLeJchdZcr1K1wWiaCFb12m5rRt2Cq27mEhzk2
	DIpkHbGJK1MKlwDGJTJi9YjnFax7TwCDgAEmLcZLviwaHYb1sQeATH6uEs3iMLjTaDguNi9Ckoy
	MKSAVIB2LNcSljPyb4gWmJ0JN/OIeBppE5rkbjAIXDe2zrK2CUhFprUs3xJE4TC8mD5QZb6Wziw
	q5Fbcv5ZlECJutqsa4dNw31q1abb8Q98A4ClQsx38MG44f3TfY2awIDlDmutbojhKG7WOq6KEJO
	7SR6XgkvJFrsDh0h5XWHqKOxvV4rQDJT+IEXRYk+VN5SeE/CqWtxA0qDTb0iZHHs5XulrPcIfZk
	2P1epRa07LN/AvzGWjsaYI4lh3U7nRP0DvgcK02MbmLFQJnSBux83z2pMKjub4GSHocga9bxFfs
	NJ2JtbyhSX8EXmlfphTB4rAIgTw==
X-TMASE-XGENCLOUD: 13c7490c-a22b-4c5d-8182-57e4f15e8e75-0-0-200-0
X-TM-Deliver-Signature: B39707837ED2CB127293914FE90F100A
X-TM-Addin-Auth: Af3zDa3H/dp72/HR396BskSAEtoIJaIWzTS4L904kiVyMv9pdBMI4OuLmkI
	iFdfUKIuvouKhWhNxkknIR+tPAdqWzxERZOsE2l0Av7PNC0eYE+JfQQMqnE6t+rrqrpQjnrN+7P
	wI3DaeU8D/0xN2wwexYovRACJD3scshGKFc6oIs75FJeA9B08xj5NHByu0mhJvvpPvZ0OirP/qg
	3N/+6CBPBQs5cl2tAzBzaGM/EsjgW+z8mqQQH/fJeP868wNxxGfiNXueGn9YIXgt0qMi0U1UIZr
	i+V9egwSN8anKH8=.2hahpG1f8R7TX0fovyl62FtlZKgBvTtFzDVYkdFq+on+VCniKw9uoZDtXI
	U1LopUWwLOk7gxoeGw/KrNiN09VVkdSa0x3Cd7YkTNVEdxAmj0jVsxrmhKTvC5LIxiAcQnyafrr
	haF6adv0MWckSLE1tbnjVpPWIRq3TQsQ+FzO+eFgv+w8Byq/ZpArIbzRcWd9pblmPVRP6W4fkow
	DflkTqIZcuiuNbyGH3PhvFzhedYJKckQdDowG+6oWI5zWZNf4lx9P/c97mE/xj5c5ulir1TG+qX
	v3nbcamRBoJeF/WDKlmrYyDIwcJk9MCRTL55aiJ9CMI95HJUanNS+htbTuw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719592699;
	bh=kFy7fsKpiMXjKfLHn4w6dCBlJ90VXkBN0x6kUgIPpb4=; l=5559;
	h=Date:From:To;
	b=gyHfbwOyoZVlzDi/V9OlNfPSySM2ydRMc4Qr8h+5mVQFnuU6Wj7+aSXJUqSQ0K9/b
	 iVEfjtXuyQfKUQS8JBt1YbO1d92fPvywAl4mPCWAaY3QcXsMQadZwLWrFWCiz0F1Ni
	 xZAVErHKQdfHoSUfc2RQMcAV2OhOTrosv6xetTDBWlhvx62wOja1wZeDOedi1QFUqS
	 XWRnapO+WJiPbQpaKzeGvA0M8oiBoe04OE6vOUGe09MkJUfeFlXipvDalJ+asksICO
	 7hkbl2td3je9QhKpSlmkVg74W73QKX+mWrD7uC3I0hoIcblafjg7aMsRq12KgkhHQJ
	 KijsKshWX9MjA==

On 28.06.24 14:15, David Woodhouse wrote:
> On Fri, 2024-06-28 at 13:33 +0200, Peter Hilber wrote:
>> On 27.06.24 16:52, David Woodhouse wrote:
>>> I already added a flags field, so this might look something like:
>>>
>>>         /*
>>>          * Smearing flags. The UTC clock exposed through this structure
>>>          * is only ever true UTC, but a guest operating system may
>>>          * choose to offer a monotonic smeared clock to its users. This
>>>          * merely offers a hint about what kind of smearing to perform,
>>>          * for consistency with systems in the nearby environment.
>>>          */
>>> #define VMCLOCK_FLAGS_SMEAR_UTC_SLS (1<<5) /* draft-kuhn-leapsecond-00.txt */
>>>
>>> (UTC-SLS is probably a bad example but are there formal definitions for
>>> anything else?)
>>
>> I think it could also be more generic, like flags for linear smearing,
>> cosine smearing(?), and smear_start_sec and smear_end_sec fields (relative
>> to the leap second start). That could also represent UTC-SLS, and
>> noon-to-noon, and it would be well-defined.
>>
>> This should reduce the likelihood that the guest doesn't know the smearing
>> variant.
> 
> I'm wary of making it too generic. That would seem to encourage a
> *proliferation* of false "UTC-like" clocks.
> 
> It's bad enough that we do smearing at all, let alone that we don't
> have a single definition of how to do it.
> 
> I made the smearing hint a full uint8_t instead of using bits in flags,
> in the end. That gives us a full 255 ways of lying to users about what
> the time is, so we're unlikely to run out. And it's easy enough to add
> a new VMCLOCK_SMEARING_XXX type to the 'registry' for any new methods
> that get invented.
> 
> 

My concern is that the registry update may come after a driver has already
been implemented, so that it may be hard to ensure that the smearing which
has been chosen is actually implemented.

>>>>> +       /*
>>>>> +        * This field changes to another non-repeating value when the CPU
>>>>> +        * counter is disrupted, for example on live migration.
>>>>> +        */
>>>>> +       uint64_t disruption_marker;
>>>>
>>>> The field could also change when the clock is stepped (leap seconds
>>>> excepted), or when the clock frequency is slewed.
>>>
>>> I'm not sure. The concept of the disruption marker is that it tells the
>>> guest to throw away any calibration of the counter that the guest has
>>> done for *itself* (with NTP, other PTP devices, etc.).
>>>
>>> One mode for this device would be not to populate the clock fields at
>>> all, but *only* to signal disruption when it occurs. So the guest can
>>> abort transactions until it's resynced its clocks (to avoid incurring
>>> fines if breaking databases, etc.).
>>>
>>> Exposing the host timekeeping through the structure means that the
>>> migrated guest can keep working because it can trust the timekeeping
>>> performed by the (new) host and exposed to it.
>>>
>>> If the counter is actually varying in frequency over time, and the host
>>> is slewing the clock frequency that it reports, that *isn't* a step
>>> change and doesn't mean that the guest should throw away any
>>> calibration that it's been doing for itself. One hopes that the guest
>>> would have detected the *same* frequency change, and be adapting for
>>> itself. So I don't think that should indicate a disruption.
>>>
>>> I think the same is even true if the clock is stepped by the host. The
>>> actual *counter* hasn't changed, so the guest is better off ignoring
>>> the vacillating host and continuing to derive its idea of time from the
>>> hardware counter itself, as calibrated against some external NTP/PTP
>>> sources. Surely we actively *don't* to tell the guest to throw its own
>>> calibrations away, in this case?
>>
>> In case the guest is also considering other time sources, it might indeed
>> not be a good idea to mix host clock changes into the hardware counter
>> disruption marker.
>>
>> But if the vmclock is the authoritative source of time, it can still be
>> helpful to know about such changes, maybe through another marker.
> 
> Could that be the existing seq_count field?
> 
> Skewing the counter_period_frac_sec as the underlying oscillator speeds
> up and slows down is perfectly normal and expected, and we already
> expect the seq_count to change when that happens.
> 
> Maybe step changes are different, but arguably if the time advertised
> by the host steps *outside* the error bounds previously advertised,
> that's just broken?

But the error bounds could be large or missing. I am trying to address use
cases where the host steps or slews the clock as well.

> 
> Depending on how the clock information is fed, a change in seq_count
> may even result in non-monotonicity. If the underlying oscillator has
> sped up and the structure is updated accordingly, the time calculated
> the moment *before* that update may appear later than the time
> calculated immediately after it.
> 
> It's up to the guest operating system to feed that information into its
> own timekeeping system and skew towards correctness instead of stepping
> the time it reports to its users.
> 

The guest can anyway infer from the other information that the clock
changed, so my proposal might not be that useful. Maybe it can be added in
a future version if there is any need.

