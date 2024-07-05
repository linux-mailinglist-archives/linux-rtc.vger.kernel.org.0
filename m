Return-Path: <linux-rtc+bounces-1444-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C248692836E
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Jul 2024 10:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D36BB21CD9
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Jul 2024 08:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2D213C904;
	Fri,  5 Jul 2024 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="Bt1YHZFd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766D481AB
	for <linux-rtc@vger.kernel.org>; Fri,  5 Jul 2024 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167163; cv=fail; b=RrO7+XPgRJYjeXTDa4w06j+cApIw0YV0EFUxkZYw3Y2WGpvULR+BJPxgAYRnn2YMiDCpNsDHz02+yyPLZXsJEyotdxDoCR9qVsd5U92ZZJMXThtMCgLK8/q/JO7uvG69vk8irlsFCWkybls9IbBfgWC8vwZU9MbmJuxDA7HU78Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167163; c=relaxed/simple;
	bh=FTSaQRcC9DZjMRjgPVWtEYegaKkLhYdM9iT3kqJjVJ8=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T7fOdaePnv1LGVmZ/G85cGjrIvJVDf/W7EnwZZh6IGQIqqjzVdchBR2+WfEpG3dmpQwHVoTbdzIy9PF5ik6RxUwj7mhKAEyZPFvReS+kkOya6gS4riYFwBO9gQDUODs9mYEX0FxaMzhWHFZb1dSDxdLON/4IgkwJpSfR1NYHUhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=Bt1YHZFd; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.50_.trendmicro.com (unknown [172.21.10.52])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 90CD910235A98;
	Fri,  5 Jul 2024 08:12:33 +0000 (UTC)
Received: from 40.93.78.50_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1C22610002185;
	Fri,  5 Jul 2024 08:12:26 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720167145.457000
X-TM-MAIL-UUID: 9f3ead84-4713-48ee-a842-7c5c79604994
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.50])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 6FC5A100058F5;
	Fri,  5 Jul 2024 08:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpVHBXq2MTAGxCW5Ppnk3qGMPh/rUcIIZ/cXqHW0lGc17wVHOMsUpDrwU0MdlVRsj0TOBmmxx+yvQjWO5xK3nyoSxK54QCn5pEdFIalcIn6f8wK+O5iMuaysa12Lh/FUbj1iCCcarGqZhW++XBRj/FxPgih0oZylnas38dcOM/zqb/fNKIQrMYUqGJLLUfonlhNfklrXRDDHMjrWxj2HDTnPzaGeLjcjdg7DQg7SIUORdzoDlQZpKuc8ECN6LQ/xw6uLGaFJUBakwU54lPj+bbKlHHVu63Gk8JjnaooOyC9p19Y85YZalA49liopWvitb9YrFqeCnaeCzyGzjLqZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W080npF9wrMbmTITroFaT/+oCMtBc4qLTtdH0WRrHqw=;
 b=il2qOmLLNoTluxjjLV8uAzKqWQ/x5p39FG72Gi6uCgKJLD6uD1oAELR/WCz4w7kYVB1n7igqImy2HayKTcRs0v0CkzmOL+Y2Zke3oxp6Y6bKPhaR6GHv+la7EoNtMPee7S9d84ScCa9wtXFPXucFy/A+mMbqQhUGJy7qybuOvS/CnNrGvGHjP1dOVxhWeVdXG1kiP1BS51mFExEYRPeBRgH2CMOrM9g3yAKe27k/r4bJHZiEAqZsb9dgEzmYa2jFlwvJfFx/bbwcWXdDBSRJkTi3cGTnFi3PNTzihYzYzGd1e/bW3Axdu4vVi3vAt/ZrAUi9x+/X2q9QSee5Xx0ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <9b33c44f-3855-4c7e-925e-2f4af3b0567a@opensynergy.com>
Date: Fri, 5 Jul 2024 10:12:21 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>
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
 <02077acb-7f26-4cfb-90be-cf085a048334@opensynergy.com>
 <352a7f910269daf1a7ff57ea4a41a306d6981b21.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <352a7f910269daf1a7ff57ea4a41a306d6981b21.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b4714a-e2fe-40f3-023a-08dc9cca331c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0NVR0ZxWXRMeUlqVnhvU1M0L1lZa1NMUldPY0V4cU5ZaEZqcjVmbUh1Q0Rn?=
 =?utf-8?B?dHNrajhSc28vdjI3NHc2bVJKWkt5K1hSVnkxVWRZanRsK3hpZEY5Y1dMQzlv?=
 =?utf-8?B?ZndIVWh2UW1rVDZPZ2FES3ovcVZEOHI0SVVxdXdhaUxoYS9meW9YUEdPUDBa?=
 =?utf-8?B?QlFuL0htNE8wZDFabVZmRFNGa0M4THp5ZzNROFkyb09RSTE2UUR3ZFp4MW9H?=
 =?utf-8?B?emNXb3NzaWszOTE3aTJCNEpDMzBLb2Z2c09XWWQ4cGRjZWZzNXlGdnkrTS8r?=
 =?utf-8?B?U3hKZHdmb1VNdHNjblQ0djVWMVR6YnRNaEVDVzI5U3JpQnlZQ0lTNWc0V1Ur?=
 =?utf-8?B?U3FYT3pxVmNGV3Jubm93MUlxeEJQRzNpc3JZNnVCMnVCbk83YlROVm5TUzlq?=
 =?utf-8?B?cVNVdDVjZlB6Z0taWWpVbmFLZXN4K3JZMkVEUWR3SS9NZ0VybElCWXVhMzlx?=
 =?utf-8?B?VGFFYUZPM1BPU1BiaUdlSmhuMVVWVWVMbzNuQTF1a2JMNE12Z3V2UTJKUG9k?=
 =?utf-8?B?SFBZVTlnZVFNSm1hRUF4dWNKRlY3bXBMbk00YzlqWWlSSmlCdWVnTFJmTG9Y?=
 =?utf-8?B?OVF5S3gwWmxvaXBkN3pMNEZRalZOVnVYRUc4NytUSi9IdXplWDFMbTJ3bDBP?=
 =?utf-8?B?YVBKZGd4dk95eU1TMVV0UDhMWEZaMVRPZ3ZVeGlLS2ZKNWl4Ry9hSmxVdUsy?=
 =?utf-8?B?NU9iUEkwVGZ0TkFtMldhZHFjT08vT2hsaVVXamhTY1FHRGpRdXpNRXNqOFI4?=
 =?utf-8?B?RWFzQi9YRVZzZjVwZ3JoMXpsTkVvZUhoR0FnbGdlZGI5YWNJN0h6S003Wkhm?=
 =?utf-8?B?MmVHYlFEcXBzWnp6bWFOUXhmWjhOZE9wYmdBM3ljNzgvTFJyb3JOL3FQbmQw?=
 =?utf-8?B?WEk0ZU9BT3crdzdsajYxdnQ2cy9tcHFNZTNnM2l1MFA1NXAyMndFY29hN0Jt?=
 =?utf-8?B?REdaMnQyVGVEbDZGcnNXTDFBMCsxbis1S040UytaYkVRMTlpb1NGYXFHRVdG?=
 =?utf-8?B?SEtUS0dVdmk0ajlmd0FJd2UveHFrTEdwNVEvd0pxMlBVVG13ZEUvRE1nY0c2?=
 =?utf-8?B?NzkzWDRINXREU3lVNWNXUU40YkdYL0loQXE5SWZRZEVCdGxuVC83Mk0wZUcr?=
 =?utf-8?B?OE5vdTBUM1JoY2pRbUszR0YwZDN5Q2RCcUcwMitDQmdqQWZhdnJ5aWxOVFB3?=
 =?utf-8?B?aVIxTWl2RXF2aEp5MWdCSFEvUHkyV3dYN0ZWVStTa3BwZWowcmg5NWEySVRi?=
 =?utf-8?B?VXcxME5JV09WVlEvVTR5VDh5M2sxVER1WjBTb0xUTS9jMWRsTCs4Mm9YaThV?=
 =?utf-8?B?ZEk4dkdMY3o0b0pvWkQzVDczRzIwTk5mWVE4Nk15emR3WThNUWYxQmxhWFhB?=
 =?utf-8?B?Mkx4TGRNczUwUWVWSjJ2cDlQUCtVOWpqa3NKK2g0MksxMzROemJ1TUpWSXpw?=
 =?utf-8?B?OEpHNGRKa1pVd25HSHdMWHZoa3hrMWpHR25Qak1IcjVqTHdmcTZqWVFRSXM0?=
 =?utf-8?B?R3Z0cHdiSnBqNUlDZ2lTdkpXcjlaSlRGdDV3MlNFSUZ4a1ZKVnE0eGdvRkdi?=
 =?utf-8?B?V3FKZ2RTUUxCbE9CNFFoSWhKQzk0a3lGMFBmR0ZhWlZUWFpMbjVJcjFrVWcz?=
 =?utf-8?B?RUtFbytPMjNpeitxV3duc295dlVUdktqNFlSOVVqdTRMT3luSDRZUE9xWmpm?=
 =?utf-8?B?ZkQxYVNrZGZlUDhKU0tTOFpOVDJtNW9tdHpOY2trRXBzYk1rd25OMnZHVzFX?=
 =?utf-8?B?K24zWUtLV2psUE5kOFNCbHN5UkEzSXFjd1Q5Y2h3end2UkRmOXcvZnljNE9a?=
 =?utf-8?B?RThxL2JSVSs5T2paaU95UE1icitoK2pwNTNKNmVUWnpaajRESnN0ZEhGTlgx?=
 =?utf-8?Q?ywdyRJ5eGNgOK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d01Tb1Y2eVozTmhiVm9sY1dsL3YzN1EzV1BwdXJHWWRuVHFBY3Q3bnllTlNi?=
 =?utf-8?B?Tlp2enAyNFBjVUd1bWxDWWIySEFlaXJsekhHSnpUak5jU3FZYmkxVC9jeDN6?=
 =?utf-8?B?eWo0UG1sbWRWUDNpbUtmUlBuYjI2eElzMmlqSGtZejFpbDFGd1BmYmE0Snht?=
 =?utf-8?B?NllvRWZlNFRKNVBrSm42U1Z1QWpuUml1eVdqQmlXaVpGUS94dHdTcWVYeVZu?=
 =?utf-8?B?eEV5YTI2YW9sUklIVUhZOEhmK1QwMEtPWnVzZ1ZaTEU2eUt0VS9LZVM0S00w?=
 =?utf-8?B?L2s4akY4S3orS05INitUSGpmSjExQTM3eDJGY2ZsMElxbTdtaGUva093a1Nm?=
 =?utf-8?B?N1dVZjQzb2NBbGtKUlRQZTZBSHMzZ3c4bUYwb3dBZmZjL3Q3eWJQeHJFcDBn?=
 =?utf-8?B?Y2JyTXZvejNWVzMyR3pKRHh1aXRReGVIRkI1NTZVQVRSeDA2cnlETjd5WlZa?=
 =?utf-8?B?R055c3poNlVEN05OelhGQTU1RE9ZWXo1MjJKL1NwK0hBY0tuMlExWVMyQk94?=
 =?utf-8?B?Ti9oOGNPWXQvNmJNNG11TkpYSUpUN2NBbGJzazV5TUJsUzlUUlUzQWtQTStO?=
 =?utf-8?B?ZjB5b1g2QzlWQVFjZ1o0MldTVGpncEw4OHpVd2d5YXJLalcvWWVTL0R4Yk1l?=
 =?utf-8?B?d3QxNEVoU3M1YzN6Q0FxUy92Wm1ObndzZXFYRFBOVFU3emlEcVE1WS90ZVBE?=
 =?utf-8?B?Z29oVnRQUW9qajhINjBHUjZvQTFBTG5wU1pNSjBUUDczckJhek1ZYTRmZFA1?=
 =?utf-8?B?clZreUZtYTlaL3ZNZUt6NklraHg0ODdKaHpZNWQ5cVVDc2ppWFZMOG5CNHlm?=
 =?utf-8?B?VEsxWWJuU0V0Rkt0TXdJeUl5eWtmenYyRkVMcktBdWJwVnJiaHI1N2t1V3Nj?=
 =?utf-8?B?RW5IanNyTmpydnhiT1VCUU9tUXBWY2swdC9lWE1rM0FKWHArV3kyaGorY2po?=
 =?utf-8?B?dmZDcjZhSmpaMStRYWdDK09GeVpLUFV0Z2I4MTF4SzVIc29YWTNFNGU4RGFx?=
 =?utf-8?B?eTk1bUMxbFIzRHhsU0NrL3F2OVBjM3J5UWZINDNxMFcyRkRYZy8vdFNTV0xr?=
 =?utf-8?B?Q2ZjUXVOQ2FTcUtEcXp1N3IzWkpWTFF2TDY4QkhHdnl6Z1d6YWluYld4cE5K?=
 =?utf-8?B?d3ZEckowUFpiMUJZbDVkRkFVMlZXZWVJRTExajhUQWxjaFBmeGpkVXk0bkh5?=
 =?utf-8?B?eXlzaUVXcURHMHpwTFQ5eTg4NkUyNzFWVlpLb0VpMkNQZGlXY0hRTXZ5UWFj?=
 =?utf-8?B?TXUwYmY5cWdiZTI1czViTGNaVXNOS3BPaDFvWDlTTU0rQVhoYUYvNDFPYldv?=
 =?utf-8?B?bC9HY2UyTFRuaUNNbEQwYll6SXNxaXJBTm1CWDVhZ2FIMHlJUnNXWlZqbUFI?=
 =?utf-8?B?V2VVZVBETS9mZXpLcnU1bGcraEp1QVJpSlk4R0dDRWNHdTBqMWtSUVRQdG53?=
 =?utf-8?B?ajZRbjY5a0lBMWx2RXYvZVRhU3JhNGhpUC9LS29sME4wd2VCUi8xVUFtaFlY?=
 =?utf-8?B?OVJ5cngrczNhVUJtUzZnNFhvWThMZVJUK3UrdnM2MWdkZG1Ma0JQUU80R3JI?=
 =?utf-8?B?VkJ6dHpXRDU0aTh5WE9yODRMbW9mVitjaUtNa21QdUsrbzlLOG4rVjVtdHlq?=
 =?utf-8?B?SDVMM01FeGx5TnRwU0hLUGU0SC9TR0lTSnNrMm1lTHN5SzZINTRoc1NFN01F?=
 =?utf-8?B?UEx0T0JpZjV2YTVPYkZKOCtJWUxrK1hBZ3VlTGY1eTU1c25DNWdMU3d0SS9u?=
 =?utf-8?B?MEJ4NlRFUW5lZ1ZVTmhtR1VQRENXTkZrMXgxcEIyajZ5SEFWL25CN1NOUWln?=
 =?utf-8?B?Q09yN0x6YVlmcWk0Nm5VNHRwMmo4TUlzZWxqTHV2UGlsOW9BQ1FQRXNBWkFz?=
 =?utf-8?B?cVlVS08zVlliTTRWVDZFeEh6cjlLQmIxajhuWitNRklaN3JJTU1EZ1dDWW9t?=
 =?utf-8?B?Q2o0K2VCTmtveU9GeEE4Nzc0eU5aeU9yTHROcUhSR3UzRkJ1cjZVZ0FtbTBS?=
 =?utf-8?B?VmFwWGpDSk1pN05YRFJEODQ2N3NuOGhYUHpQa1E4QnN6TFh0QnRyZURDT2xI?=
 =?utf-8?B?QnpDTEwxZGVrcENKaEVTZjB6Q3c3Skl3bzlHUGNjZGtlTkJWQldsTGVDZ1pQ?=
 =?utf-8?B?N3BDQVRyS0QyekpVRFVCWlBVRTVkQzlXTENESjRjTm40ZXN0M3g3eWJYZFlV?=
 =?utf-8?Q?lAzv5H6HYZAe4IHV+pBvXGGoGHbme/zvrJeCu67vNi97?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b4714a-e2fe-40f3-023a-08dc9cca331c
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 08:12:23.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqQkgozmhEfQDUUWT7mRz2NQKVH7St0zf9VuXkMSphH55/7wjczJz3OX0KRhdKkpsWB1SzQKzvgbc0GZRcOa+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2245
X-TM-AS-ERS: 40.93.78.50-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28510.006
X-TMASE-Result: 10--3.853100-4.000000
X-TMASE-MatchedRID: scwq2vQP8OH5ETspAEX/ngw4DIWv1jSVWmXbLJb9DRtjIOKZDN+g+z+K
	HGbsC8OPewUKQ7cT03tU60xTm7KR6mV5JEdzxR3yYdhOdiv4miYtMW9M51EEXwXN4LNfYru8S/d
	g2O/aWsyaZL2eZhAVKv8C3uRHSHZ9Ap4CqYccFq85qDAZK5rn/5gmDODGqBVPe8ED0L/V6IVIlq
	ldglC+k9D6xLvX4M4IO3lIxn2HRqkqIw/OY3zSGZx7TrJxMWvNVxHvEGsKrsW/2tJ3foSBQiPzR
	lrdFGDwBv6s2HT+SFBo7QBuLxIwXzVGtQnsdz92hsTHbtukvy5hPhLr6FkJ2A==
X-TMASE-XGENCLOUD: b962de24-1d88-4ff0-92c2-8039bae0c2c8-0-0-200-0
X-TM-Deliver-Signature: 8D2EDDDB228B36409A115C5CA8AD3DD3
X-TM-Addin-Auth: BquRn+QlMXRQFBVjKFsiVrjXQn0RgWv9fc2oceI+Cx6K2ukuyhnc0ZEYaXi
	ne+dxHF8LTSk7oAdHJ8HvPkn7j5iPk5xWFNMDwTPUWAjlA5RoWAFnYMyJZPLT3kTnm6C0vtaScC
	c5Xkc3GYN6wtilOC4red03XXmy2rHXK3bEjfeWz7CxkfG9lp9xUODg99w15iujS27s7xms9usBV
	6GGBzhjyrXrCIVjh8pocqL9FJVMA660UNFv2PRaU0IDC0x/UIvPw3FDkVZ/1TqvNHWHeJxDXoeN
	gFdUIrrGOuCPmtc=.MAvURxNzZkR9Zyckham1GOaf/wwb8WbVRh32Ff9bIYVjLdFXimif3BkWLI
	KGmNKOB7KtCXWSFVEkMcp2xzgi5vW2vf8B2wDogIQv4t81hpAbgPiOaKKXMRPIUKYC8rQbA3oJm
	X1ECzZ0ZbuP8pGPGkunlTiI7XnIOkk85Dt5nqUubNvj3efup/e29C0E+BOjxJ6B2v3DdiCOEEPS
	Bd1XRm0wp9SwMU7ssk3Han3oVJKlSwmi4hbVW2hlv60cUIdJTwmRibRHwtAh5JghnGJSOY+1eFf
	6FTDiPCwv8FK6KaPdXbUBzW0rGIfQDC36Y1JVJbQl2eqEPbEEAqy1y0kj1A==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720167146;
	bh=FTSaQRcC9DZjMRjgPVWtEYegaKkLhYdM9iT3kqJjVJ8=; l=790;
	h=Date:From:To;
	b=Bt1YHZFdDVLk1PXQ5hSO3Dvaj1BM4MoM9VIwsfn3rwVVB1Yth2tZ+erG5BGsFbNVQ
	 8oZr1CBEM6UqdF/DpGctCcJ84T16gj/rHGHheECJnzHZaT4wE1DEp7OO9nrEmJCypE
	 G4ERVfMQELZ5oLX0H5fZywCjf6o92GuCGP7tkA5IHTphkFJYlGweV9MDKTEdVQXjkH
	 O8lJ5O7BpNX/t1sFIOuBmjTV81gPmCi2O3B/8450IuRBaSMavQGJcywjTSOPwdod51
	 Nb9B7ASy1YftbxpnUhKuaUksRjccmEjr7Rnq6BS48mKXm3EqGCtlMi6e4Hxe/Sivhe
	 UjlT/DhPzCGNw==

On 03.07.24 12:40, David Woodhouse wrote:

[...]

> 
> 
> This is what I currently have for 'struct vmclock_abi' that I'd like to
> persuade you to adopt. I need to tweak it some more, for at least the
> following reasons, as well as any more you can see:
> 
>  • size isn't big enough for 64KiB pages
>  • Should be explicitly little-endian
>  • Does it need esterror as well as maxerror?

I have no opinion about this. I can drop esterror if unwanted.

>  • Why is maxerror in picoseconds? It's the only use of that unit
>  • Where do the clock_status values come from? Do they make sense?
>  • Are signed integers OK? (I think so!).

Signed integers would need to be introduced to Virtio, which so far only
uses explicitly unsigned types: u8, le16 etc.

