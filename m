Return-Path: <linux-rtc+bounces-1442-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D70925787
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Jul 2024 11:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A559B1F26E1B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Jul 2024 09:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F067D143758;
	Wed,  3 Jul 2024 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="q6nM4tXf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B0141987;
	Wed,  3 Jul 2024 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000616; cv=fail; b=GWafN5V7R5RuZa58saYAEQgFHgBIm8D1v/IXu0rb24TOg5gCfR+hLAg3qxBZbHZwsowm1vvdGab38e6RgFiOan98P/tBTrMkQpoIL8X8ugHgsp1ZQnZH0iaoBfsgAW4UR8ct1+9LVbEyzhBQYX4iPCdev2XfhkzCa516LBggnu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000616; c=relaxed/simple;
	bh=i5LM2Y0j9ZIhruzyLfU49FuEg5ofUP4csaUTnVCtIIc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=afqREFsHuTXYDFkOx4U8RCnVh8pSLAvQkgJYlemg/3HxDKQlNL6+ORwBCAOAlO3TiaUs8FjrfoF4+v7P57oEDJfwLSqZKN5/YtDu9Zai9t+DNQHhbgH81pIjD5bDQq5br10Flcm6YCqCzVl1bmbL3lENMK62+vo+ex5JgKvR/OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=q6nM4tXf; arc=fail smtp.client-ip=18.185.115.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.48_.trendmicro.com (unknown [172.21.180.199])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1CA3E10001346;
	Wed,  3 Jul 2024 09:56:47 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720000606.247000
X-TM-MAIL-UUID: 30908a56-2528-4d84-b15a-e9235cffd78a
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.48])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 3C6FB10005E3C;
	Wed,  3 Jul 2024 09:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqY3+d77I+AiQTut+xljKcZMfhyOETsTAPHtN4bUzMAvVNFnbBaEBXCOUeXQOY7ZFCiwAs6PSaU6Px5eiaDvigGPViOBaHgCln/klzBRBcCi+B/Dikv3b4wrcz5ryEm1jVu4HxcOezvn3cD9nsyt6+s1KIFHDpgKq0eHwlWeg3b560PwHbHM6JSW6fMNZOQr8nRJKtxR8T+ebCOpWN1liGfApxEK+xjolrs3DoLk8svMhXS/sGbeVvR59hhe2iT/r4BVEIEYWYLVHl8WdtngIek3rTtuqsCryefvmZR7gR8RnmPyTf600ZkoqGKJoY+rYClAujuUbQo2MEGzMc5QIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imgGI6W3lvIaRYXUwbojO5pUFEwKtq+N1Y1hPltfa9o=;
 b=eOLikFFfm5XefiwFVgo8kRuMx5QWk+u0mV+E3B216HIGSDj6p6+XiMQTH4juRDl/taZPIpPxxCZfv6pjPtblNco4kqQAc8OVOlCe73MTCxKsRY2CrpcIn8nMEida7KcXBKM962KYvjaxJ6IcCnfLuYGARfJ1jxMcKbU8ExfJybRZzKlZyblhBtPmzqCouMea0QXtt1yJoLcjWhn0ypjvElv5xa3y8/RyNT1VqYUrZWW8N5eFSUWrAYwze9vRQ14lpY9lQFzWzVH4YkPrbyT1Ckdx2sYlWnfGEirBawpOADo9Li25K4dBA1+5H7vCz63ytx0c4wfQ45tdBQcfwYumXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <02077acb-7f26-4cfb-90be-cf085a048334@opensynergy.com>
Date: Wed, 3 Jul 2024 11:56:43 +0200
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
 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
 <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
 <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
 <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
 <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
 <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
 <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
 <02E9F187-A38C-4D14-A287-AFD7503B6B0F@infradead.org>
Content-Language: en-US
In-Reply-To: <02E9F187-A38C-4D14-A287-AFD7503B6B0F@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0335.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::15) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR2P281MB1525:EE_
X-MS-Office365-Filtering-Correlation-Id: 83443932-4dfd-499b-9ac2-08dc9b46725b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFEvQkpKSzREK2gyeDJxcGtRbHllcEN1WmpuUkswOVZhc2ttVHdyRmduMlJt?=
 =?utf-8?B?eXhBTWV0aHQ3dDhjWlpwbXFRR21ONUdjRDFEeVVkc1lMcEcyakVUbHltWnp5?=
 =?utf-8?B?MDlpVHQybDhqeDVDYkEycWt3SWg2UkQ4dTg2dUxPN1JBMjV0eVNScXNLcWVM?=
 =?utf-8?B?dVNGRC9JRHBySm84SHI1bnJ6OXNjSktHRzlTRUljN21xM3cyVWtlVkNTaW83?=
 =?utf-8?B?bXg5YVBVcW5XM0VSYU5sZTViSmdNdUU2cWJZQUxMTDg0bGgzKytsOE4zMUU5?=
 =?utf-8?B?SFR3WUc3MG9EMjAySyt4REFKdG5lZFprakZVVDZxeXdkTUVKWDRLYVNHWU9K?=
 =?utf-8?B?MFk0TUMrWmllMjg5ZnNxaXNJaTR3K3FCeFE4YUxSeDdCbmhreitzUGNqY0xF?=
 =?utf-8?B?QVE1bWw2bURnd2t3SC91UVpJSFpDUHZhQjc4UUREQTF5TTNMemMrcGUzaTR3?=
 =?utf-8?B?UytXcExlTWZhR0hCZE5HbkJOK0ZadEtMSEJWV0RwOXBxZmhodnJZZEh6WVdZ?=
 =?utf-8?B?SC9RTjZMY3pLWllwdUZNSnhuRGpTMzVhb2cvWUNEMTlZb05BdHh3RENNRDFn?=
 =?utf-8?B?cUVNaXg0dTg1L1RIbVZ0WGFVYklmemJHeU8vb3M2OU1tOUFhOFdIYk5WV2Jy?=
 =?utf-8?B?WEFvZGV4eVdhdERYanhFVGNNL3h4cEh4NTA5NVduZ2tkVlNUZFV0aFVUS042?=
 =?utf-8?B?TDdrQno1eEp3N1FaQk5GOWZMRVBpdHZ0b1BGYVlBM1JZWktWbGdlai9ia1Zw?=
 =?utf-8?B?eVdkdTBNcXg5NkxtNVp4K0ZLN28xd1VPTHo2NThWMWIvejFyQTJ0c1Y4NFE4?=
 =?utf-8?B?cGhRcFlzcGhNNFUwMWxibUNQM2JEUDdxK3ZKU3pHNUROK3JJS0JVQ0JhOWds?=
 =?utf-8?B?U0FqVFVHbC9qZ0tIV2gxNFdaNHZyMmVaSGkxdWhSV0RYT1o0VFdHbEFFaCt5?=
 =?utf-8?B?MzQ4MUNsbDBLMEt3dkJ3Z21uc085M3BFWGtVWThiT2VkU1NYb3NPNjcrVlcr?=
 =?utf-8?B?YXY4N1F0bGFNUEFvanV3eng0eFc3Y3RLajI2ZXV3dkVoVUJIdHduUTh0cUFF?=
 =?utf-8?B?Y2pPYWZYYWdVazFSR0lmWnlnY2xqVmNmdm4xWDk4T0hNMlNoblVkTUM0Kzho?=
 =?utf-8?B?YTVxTE1yQ2ErZkJvZHRkS0tLQzRjZlc5VzRBQlhjNVJqeU94REtURnhDSjI5?=
 =?utf-8?B?Tm5od0R0Y05lOUxZR0hsTWNaM1o1UkhNN3grOW42M3cvS0M3WFZsM053R2ZD?=
 =?utf-8?B?a0VZaWlZSzd6TXNPTmZjVlJNaWh0K3hVVXVDb2VVdzllNGJYeXNxcDJsZE8y?=
 =?utf-8?B?d3VLWG9YS3pzQUgwR2xqRGMzSUZwNXJ1aE00T0x0ZWhldkd2SGZqdFNIZ3Fn?=
 =?utf-8?B?NEdkNjF6NWt4SENwejMyVTJIZHgwREZiOUpPZ2x5czg3OU5nTCsvNmt0R2Qv?=
 =?utf-8?B?S3hvUkxYZ1p1SENoWk5hSDBGdFREWGNPUllFVVkydE92SWxpZ1BBcmJrbXpW?=
 =?utf-8?B?SjFONU1Qd2xFSWFlTCt6VGdMRlVoUlNBVTdSd2JNT1JUMjFVWXdBTEdpWFph?=
 =?utf-8?B?SXNqMVZ3Rkp6WGRaRWg4VkJyNlNCOXdiM0hBenBmS2VNWklaR1BIYTc2Y0dz?=
 =?utf-8?B?K2Z5QXdGQkFtTHhOZEFCa2xPaldKRnpMRk9XdE9WZkFnS1dkM3J0OWc4NzRL?=
 =?utf-8?B?bXdiM003eVMrcG1wa3hKVnBmTjFINFhrRkk1VGlEaGJsU2lrMGFlTk5LazB0?=
 =?utf-8?B?UzJUR00vaEU5dDRtbFI2MGJKc3AwV3RNQ2xQeEFSN2IrOUZ2OUljVGtGRGsy?=
 =?utf-8?B?Q01ydFQzYjNmWVU4VlpveFI4enljS3ptQ3VleFh4cHkwajE5amFWWkl1S2xK?=
 =?utf-8?Q?obkMd4tiUsuwE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFHVXQxdGxaMzNIS052d0JvMlZ3R0t1S3BhU0VIaUF0cTdNVDVkZ0RwcnVE?=
 =?utf-8?B?Z0psUm43TmNLaHB1NnorMTFJUnNaVVo0NGhSMkZkTWV5TlZOK1BGNng3TGVX?=
 =?utf-8?B?ZkVwVGVMSTJ3L3NBRWhXZDZZRm5rck4wQ2l1ZGlXODNUczJtcnI0NWZxMjRE?=
 =?utf-8?B?WitvTUpUZWJZUzhvdDFsQ0tGSm1YUFJKS1lIZnk1SDBuN2NhUXZYdkZkdjJw?=
 =?utf-8?B?alY0c3N2ZU1XNzJ2VzJsdDZuZkEvL0pXdDVteFIvMU01OE5Yc1FkeWVjUzdi?=
 =?utf-8?B?S2RnRUFzTGhUWGdRT1pXL1ljK2FneTl1NDJ2SUViSmVFdC9rMk11SHp5czNQ?=
 =?utf-8?B?bnlldmJOWE5rejhOeWJ3c1lNb1lER3Era3o4TE45VFZKTmZlRHdNNUlxZlpX?=
 =?utf-8?B?MlVxd05INEVlSEtrNW1Ta0NEL2VleDdwNEJMV2E2SnRhaDJtUWhJQnVjYmli?=
 =?utf-8?B?U1J5NitDbWJUb3phOW9xS0I2UmJTWGlYRnp2MThwMS91cXMybjB2VndUa0s0?=
 =?utf-8?B?ZnU2VVl1Uy9hVldqaUlKRjRVVWhJQXZZSW1PT1Q4MDIyVWVKVFhBblBPazBN?=
 =?utf-8?B?U3c3N2gvUWRDYS8zUnN2aEsvN0xQSUJYV0w5SkxYNXN5eUJSaThZUkJmZm9p?=
 =?utf-8?B?N0szY3pZdWdMWXN1YnRVTmY0cWFxNndSczRNZ0xZaE1GSkkvalZjNzcrL1E4?=
 =?utf-8?B?RkxwWXh4NGZtMjdFVVk4ekhBTFlyVmVhU0V0YTdOYWNhR3pGZ2s4NjBRZXBj?=
 =?utf-8?B?UXhRZms1d0FQMGR6UmZrZG9IT3ZYQng0dm1UQ3gvdUdWaFVnK3Y2Q3BOUlND?=
 =?utf-8?B?SjZ4TXZ4cmh4ZmYvejdHVFVJZDhuL0ZiOGZvUjZvK1lhMmRtV0JtTGk1OG5v?=
 =?utf-8?B?aGcvSi94NWk1czk0U0Rxc0FnbFMzUDZ5aHJOc2U2OWNhYjFtRytJR3RyMXl3?=
 =?utf-8?B?VmVvTGZmZVFXaG5qTTZzeDdyNG9RbGs1NURzdFBZVStEcGUyTVhJaENVSTFh?=
 =?utf-8?B?dVF0YjR1ckQ0NDFCdG9QMis4VERtc0NXM25TNE5tZkx1ZVF2U044WEZwQThD?=
 =?utf-8?B?Y3Fld0I1RVpNM0Nia1RQMWIrVzRSSktSZ0k5WlVpbDlhSC9jRy9PSW5HVHhO?=
 =?utf-8?B?NFNKdTUvbE9GcElQUzBQQ0IyamN1VGZxdjdYdHFKdkN5TkhlTUxmUCtpd0NE?=
 =?utf-8?B?TmdXWWFZQ0JoT282dGlvTFY5UWRMZGZzM0Ixa2YrcW1tMjFXQWgzL1p1R1px?=
 =?utf-8?B?OEJQVzc5QlgyQ0pjcmdFSkR5djdOL0s2UFV6MjFsQWdGcUhyM0hwZ04rOW9l?=
 =?utf-8?B?WkhSNGJIeGxZVmdkR3R5UWp5Qmo2MlNqcFhFd2Q5NHlRUXdNZU92Q3ZHaTZV?=
 =?utf-8?B?YzBuNlVhMkd3bnJsRmtiTDc1cTgzRHpvUVFISERmdW1oWjcyVkhLMC9tZENX?=
 =?utf-8?B?R3Y2NnQ2SXE5MmJaekhJTElOQVRxd2RvNDRHR2tVSnJFQk5BNXplcUgvVUVF?=
 =?utf-8?B?aWJoSDNaelVTbVJ4N090cktVU3p0TGdBQlJ0WUx3SWZhRyt2S3hFd1U3bWdW?=
 =?utf-8?B?aFoyQXhlaXpwdFdoejl2OWJ5T0RiTlpiSHlQdWJybS9jYUNkd3RwNitSUG5w?=
 =?utf-8?B?MmVndVZOTEtqNmk2T3ArQzhRZER0d2dVaGdWNW0zd2xPOCtRQ05vU3pwRitO?=
 =?utf-8?B?QW5PckpVdm9lTHB5WSs1WExOcGhGcGFrcUtsU3ZraFJvM0xKZEZmSWJGOFFO?=
 =?utf-8?B?MkpmZlVoaTNHZGFBamo0S0RtQ3NpbC93YmRkWDhDeGhweUlZZXBHVHlNbjZn?=
 =?utf-8?B?TXpjMTE1TFZNMFdGbWJ4SVZEUXZTOVlzdS9xY2hLdmNPaG9HcEErc1FudHRV?=
 =?utf-8?B?ajl6eXllb2k0TDlUTWM3NWtXU2hzRldnUGUwZS9IUSs5VnJmeFFKazRzOUd4?=
 =?utf-8?B?cGlvZ05tdFJRMEFjeWxJZkd3UGxmaE92N0locVlobWFIRXNiZ2dkN1h5SjNX?=
 =?utf-8?B?SEFMYVdjdHIzcWUwREN1b2szT2JDMzFUaFJ5UUoyMzVhMkhLaDJIbS9wSm5Y?=
 =?utf-8?B?Z0tQazQ2TkZ0bXR6MUQ0aEFPeXdTZk4zcFRYR3F4TW9rT292RU9jMDhITFdH?=
 =?utf-8?Q?OeDCU/yqReRWf397P5RgCxEf8?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83443932-4dfd-499b-9ac2-08dc9b46725b
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 09:56:45.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LesOG/TDeZjaPZAvZT1DDamZkxzVE6zQAfZsvUsG9lvhwKWA90emaWCxt+V0HAn1XipLDgNknn7c2WlW3vub/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1525
X-TM-AS-ERS: 40.93.78.48-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28504.003
X-TMASE-Result: 10--12.994100-4.000000
X-TMASE-MatchedRID: QfHZjzml1E/5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIPvjVAoQHFWeSz
	UwBoAAxDNdD1HRidxM9bQk5meS4UfDHPZAMhJ4v33Zys1HyaJNTriyrp6RgprSGQvSAIyHoOTk2
	V3UI2EjauLjhsOBsllb720qx8L+B43vSz6lY+8BJ+RtIOyYSgjBKUUHDK9JoulWAHAqMK1E3RVa
	CKvzOY2+Sazff4fhF1SO5SKxwRGEFcOnqpgy+bqxEuOqgkm3/1mVEKSAFs7pdrU/wiTXMFxQrUe
	r57J3SJjeD+F5LMZVc7+YHb7Xac1Vo7GmCOJYd1D12T7q2dIUsJ/CZPKk7gRlN1QzFvIUMS2rLz
	ED6thE7pbfL4zvO/Dw==
X-TMASE-XGENCLOUD: 37dc9621-213d-4e3a-9a37-affde8aa32dd-0-0-200-0
X-TM-Deliver-Signature: B6C66F74CD5A936FBDF546E52441CDA8
X-TM-Addin-Auth: QXC/0Gg2raNPUFT2ENbu3SvFuJpfih+Bx8kDdKMxR6/8RVXdwgSuEeE97s5
	Kx/cUlL/g7u7cB/JNPo608ZO3/8XT3Xr7SxRcVpUPvasLyl+IRlLDk5CydmDKAzG1xqcjSmMapH
	XM4RfkoSZRQH50+RE0YPcO1A3nKJXGcIf+Dk9tx3+5710SBIiM11/hT73CcyCWi+IHV0T7x1oq0
	1s6Udr343etNegm3zF7/EqvHM7tgtxy184pNuRlXvjpLZbVbktvryQvBaRSmt9Yigq54CL5sgQH
	bvJFMnWtkS4/bC4=.vheWl0ZaC0BrUJ3tDbKoFWlMwrn2Rf7FqCo3HUUyeDsp4Qgp23XilKAs40
	cRTtwswkla9C2yySkfDbxdtBb+hqgwq+PVpvlvNBxaFf1yI3un/SGPnwb2kokE9KH7WnrjhPzz4
	LJ4B5NNEQZluGkqxOqREqGUjmIZrxBJlfogrQvFW3jzAvnYqFx7BYV39grJqH6vEIJxU5l9RASW
	wdEtcXf9oTZDhHox0ID+wz8ZmIMcW5qpBQ7lbBHQJyuULHUGw9ncioxQjfX63RNzKgm3g1hMsfI
	y/Mqu5hUffeE6CS7pGkEML4HDreEkl+G3074RDRIf0fSLcwpwMDauK0L2Mw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720000606;
	bh=i5LM2Y0j9ZIhruzyLfU49FuEg5ofUP4csaUTnVCtIIc=; l=1749;
	h=Date:From:To;
	b=q6nM4tXfyhPG0JKAOvTtnjgMHmNy2uVtFvT2237Az9TtrvTCd+hUHdpF8NqaJBC8X
	 Kc2Edz1tKwXS7gUoCXCSQeV4VvI1+RD2U512SKsWdt3mzpMoetCIAO4LS2dZolOwa0
	 M2ZHJOC7w+lujk/7T22eWF2jSNYOC56PIVNxgd6Rl4mFkPRPQql6hWbRR0s9+NyjQm
	 BdRvWd0SHGhbnfU/vTBEC8Av/sM9f87qc/pyPTb0SF9IsIY2vUSIqMEw0pDYHkqQxt
	 cgPIsjwjdERBoqKWEUGHKkHqtg8z+LN+aBHpY+koLuwBIAf/d1QvqVmP1VjHtBU2pK
	 8D7AjL0zqDQZg==

On 02.07.24 20:40, David Woodhouse wrote:
> On 2 July 2024 19:12:00 BST, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>> On 02.07.24 18:39, David Woodhouse wrote:
>>> To clarify then, the main types are
>>>
>>>  VIRTIO_RTC_CLOCK_UTC == 0
>>>  VIRTIO_RTC_CLOCK_TAI == 1
>>>  VIRTIO_RTC_CLOCK_MONOTONIC == 2
>>>  VIRTIO_RTC_CLOCK_SMEARED_UTC == 3
>>>
>>> And the subtypes are *only* for the case of
>>> VIRTIO_RTC_CLOCK_SMEARED_UTC. They include
>>>
>>>  VIRTIO_RTC_SUBTYPE_STRICT
>>>  VIRTIO_RTC_SUBTYPE_UNDEFINED /* or whatever you want to call it */
>>>  VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 
>>>  VIRTIO_RTC_SUBTYPE_UTC_SLS /* if it's worth doing this one */
>>>
>>> Is that what we just agreed on?
>>>
>>>
>>
>> This is a misunderstanding. My idea was that the main types are
>>
>>>  VIRTIO_RTC_CLOCK_UTC == 0
>>>  VIRTIO_RTC_CLOCK_TAI == 1
>>>  VIRTIO_RTC_CLOCK_MONOTONIC == 2
>>>  VIRTIO_RTC_CLOCK_SMEARED_UTC == 3
>>
>> VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC == 4
>>
>> The subtypes would be (1st for clocks other than
>> VIRTIO_RTC_CLOCK_SMEARED_UTC, 2nd to last for
>> VIRTIO_RTC_CLOCK_SMEARED_UTC):
>>
>> #define VIRTIO_RTC_SUBTYPE_STRICT 0
>> #define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 1
>> #define VIRTIO_RTC_SUBTYPE_SMEAR_UTC_SLS 2
>>
> 
> Thanks. I really do think that from the guest point of view there's really no distinction between "maybe smeared" and "undefined smearing", and have a preference for using the latter form, which is the key difference there?
> 
> Again though, not a hill for me to die on.

I have no issue with staying with "undefined smearing", so would you agree
to something like

VIRTIO_RTC_CLOCK_SMEAR_UNDEFINED_UTC == 4

(or another name if you prefer)?

