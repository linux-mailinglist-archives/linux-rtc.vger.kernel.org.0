Return-Path: <linux-rtc+bounces-1523-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE59325FA
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 13:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A6C283B21
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 11:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F01199E98;
	Tue, 16 Jul 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="yQmSMhY7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF5199E92
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721130908; cv=fail; b=n8xrLtxQ34I0EEPYKtTnjBLKlbud31Ds+pNlwktnwWGKhyZqU8kiXDW02k8F7TtQaLIsx2Fp7wdewfYDYrrtI2jlNnf7xvQhox+tiQvKVP9aLv0SvtHPrKpoCmWy63aneD2tYSQgRFYsSG3rz+sBJoCtSVMwTzVrOIzyukqhKFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721130908; c=relaxed/simple;
	bh=1fQH/3vFd0sRG1gMvFxh0e4yHHbzBggt/nFSsGKGMKk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E8qgpNRhonVhyKL4uT8/dSfCtz13EU7/bemVGBe+hRlSP+ZWu0h2kqIP3oQMBl2qVbamS43EVnqq7bdI9wqSpJV+LfxZAC+THveEQhGZZpCSxYCVNt20zeicOsrjn5Cs89MkXPAv5mAJzJp9yP1x954s0VxYRZlYT/SsTYTVEfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=yQmSMhY7; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.2_.trendmicro.com (unknown [172.21.19.58])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 52074100765A4
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 11:55:04 +0000 (UTC)
Received: from 40.93.78.2_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id DCEAD100017AA;
	Tue, 16 Jul 2024 11:54:56 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721130895.276000
X-TM-MAIL-UUID: b51a0162-f02b-4cb5-bf19-47d4c8e41638
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.2])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 43CE3100003D0;
	Tue, 16 Jul 2024 11:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJMV4/cNKAmuX4IzrAM9/o9xb9x4M+t8kBvwsPX7bgYFjDrd5O+zjMKgGJDcLpVO5lQwbmhWHyrKuR3eB2mI4GTsLBJpguiJaIuvgO+soWzvYEBRe+S01yNUf3ZxR1ze4OgUw2sZ6NNHf91H1Ii5/Znaeg3o4t9gS4JCrsRcTkf6rxLT1kBSnSiccmLdsni0FdjXTc0I9Vwz1losImYmdq2Bvrc6M+b6zLTWa5JwCH7QBZI+BvWBxyyndGVY9n0KQvDE+w3wqF/ak6ZDRn99tlOTyn0Ylf7v4Qs0JtDgLRTHzvYNSYzkz1NWd5NH0pXS/9sUydN4cP74S90UTWMhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac7MSWlsyFi4wAXtnjl99Q3XPkvEjZbENRNM2SUfbds=;
 b=fFtBJatjA8yyYFTBN+yARvSQlxi+qiFBUzi3hTpfJqJiMdPNYC9odpJOa1EYgJGvasgH9rhm01//7RsFIQBxMl57+aq837lHIRyzo6NHJpYr6KFlOrLlCBVPYiR5Y9vZXnWrsl3fgRJ3HHRQ10Eoo1T1DfDEgSNfvEjfCP1h6PLSOXj2HKYZB1B42aPs0nNCCJ3dCe8vpwZmm6QqQlO3nMQ74Svh04qmjy4XxPmySEIYr0lgAo7DKFhpeW0rwqoD7vbRT/YLoxxNOUPI33zn7rb5nMbdymXjeW4gdIDjWj3G0YEGFkCl2dErkQAgj5vAMyLcN00nBmuK9xNBHwimAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <9f132922-2bf7-4749-b8c7-4c57445f9cde@opensynergy.com>
Date: Tue, 16 Jul 2024 13:54:52 +0200
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
 <060f392c-7ba9-4ff6-be82-c64f542abaa1@opensynergy.com>
 <98b20feebf4e7a11870dca725c03ee4e411b1aa3.camel@infradead.org>
 <1c24e450-5180-46c2-8892-b10709a881e5@opensynergy.com>
 <1ca48fb47723ed16f860611ac230ded7a1ca07f1.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <1ca48fb47723ed16f860611ac230ded7a1ca07f1.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::6) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB1925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6803af80-67a5-4c2f-509d-08dca58e1adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3l1R0tDQ1VlVUE5WTRqRVNJd2srQ29BWGhTMHNIbUk0YU5CKzA5aHpFSHZU?=
 =?utf-8?B?Vk9hbU50MUNLMlkveTl2UjdzWWhwN0FzR1UwVzZYZVNORTQ1OHZyME1ta2Rp?=
 =?utf-8?B?QWJwMUVsdis0SFhLb0NYNUdQNFQ2OFAyN2M4RG1lb3BpNXRxQ3laa1Rvc3VD?=
 =?utf-8?B?OThMVWEvMEttTkFUZEo0dzQxdE1VSENXOUNCbTM0Q0Q3SEhCTFE1TWNLYzdZ?=
 =?utf-8?B?ZmMrYkdMYnk2VEpCZ3dsSVkrcDZ3TlhURWppZWlWVkZwWW1WaTVUTkdIeTBx?=
 =?utf-8?B?MzJnQUR5cDVxdGFweEhyMGVEMWhDV0ZPUGRJUUF0UTR4MTJjN1N5aGYrL0c1?=
 =?utf-8?B?S0NUYVdOMHJUb0k5SmFVQXdKbDdLaUVjdExPc3lmNHNsK0hENkxKNDZSK1Z5?=
 =?utf-8?B?N1RmMlJlQjYxTEhKQ3Zpbzgxc1pzOTN0MzVDcTJFemx3aHhpdkdmSW51ekl2?=
 =?utf-8?B?SHpvOENuNThBTGxLWDRoeE13WnR4SUxXd3pDZllGcCtZa3F1NWE0UU12bnRw?=
 =?utf-8?B?WFNEZW1iNlFLdFFFOWNjd2hVV2FZMUNpVDMwSWFqTERuaVQwN1VzSzVhaXhS?=
 =?utf-8?B?RC9VL2Z2TC9pUWtjb2ZaTEttNHpUVkJxazFPYU1ZRjYweFRuTUtjaWRZRkp6?=
 =?utf-8?B?OVJ5MkdVZ0hvZ2t0ZWhPUmt0Z3AxZ1lxV2NLNFE0dFZwbHdRSmMrZE1WV3hX?=
 =?utf-8?B?ckdFRnJleTIvcGJ4SEl4a2dnV3VaTy9xRkN0WVlqdlJoRzFtbVE2RnhZLzdX?=
 =?utf-8?B?ZnpDQk1FVFJhWCs1cVNtNExZeEVRc2Urdy9HWkxiZi81bUFTQXBWT1VuOXJY?=
 =?utf-8?B?UWdyOHh2OG4rRW03azl1NEYxbzAwbmczRG9WNllFVlhyRStRL2FhVHI5MWd2?=
 =?utf-8?B?alljVDAvT1pFbG1NVHA1NHd5dndvV0RWUENqeS9iaE1XT3U5YjEySXc5Q28z?=
 =?utf-8?B?L01tRm9UWTRnck51YnN3OGVLWDBaZHNDc2RBS04vREFMbTJOeFVYUWNiNTF1?=
 =?utf-8?B?V0o5c2o2Slozc2VkQUxiRUs4cDYvcXgvcVBERlErUFp1TDBNN3kvMTZHNXUz?=
 =?utf-8?B?WHhPMWwzNGUyaEg5UGordnpIaGZFNFQvOFA3YlVNZ1RYQzlJcG5QdXpOT3Bk?=
 =?utf-8?B?OWlMcVRvbGdsblJBQ2N2YTRCdHgrZlRmQWhENi9TSVAzcCtNeHEwM3NRRE82?=
 =?utf-8?B?bVhoVG5NczU1bm1FRWUxTXlhbXBPTFBrNTZZVDdzVDgwQk1WZjdKRzhBb2Zj?=
 =?utf-8?B?V0VERlZrODQ4WUdHa1lEUTJ3bUNRT1FiNkdzR1Z3ZEFhL25aK2w1TElXSkEx?=
 =?utf-8?B?clA0ZE8rY08zYzUzdGlERHpoMzlvQzhXRmQwUUFQeGZXN0krZVVrdG9nMW9Y?=
 =?utf-8?B?dUdvMmJna0Q4WHBQRWZkUnRjSG45Vzd6aWVyUEh5Z0hkQVpORzNFWmFxclE4?=
 =?utf-8?B?ekoxZ3JFTS9UNkVvalArVFM4L1pQcWliNDhpZUw1NDRWNC9lMzN4ams5RExB?=
 =?utf-8?B?anFRaE5JNWNrODk5dzZmMUp1SThQUEQ3RDRPVk9SNFI2T0JxeWlGSDRBc0FP?=
 =?utf-8?B?ME5USlA3RnlBb0d3QmlUeVdJZmlKV1ArUm04eENWMy9WQXVFL3J5ZnF1Q3hr?=
 =?utf-8?B?c2JIOWo2SlM5TjdBRzZzeDV3UHl2bW9DT2pXd3IwTmdUZjB5R1FQbktkZ2hw?=
 =?utf-8?B?WE1IckJtRGNMNHVLUWxZc3BZMmFEQlVmb005NFkxOVpadmxZT2dPQ0NLdDE0?=
 =?utf-8?B?VXhjLzZJckU5UjZyTWsvRFMrSktGUEk2S2N0d21HWHhCUlovQmlPSmZTWlNk?=
 =?utf-8?B?eFVnS2J3amNWQnV1YTNGQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5kanVKeXVvaldhanRCR2Jybkd0ZHpsNUNjMTZyNHJFNitubFlhTnVRbFEv?=
 =?utf-8?B?OTBQUFZBR2RnRktiaUg2MTFFWDlBa0V2Zmp3dEUvVnlSS2UwbjBFZy9GRWN1?=
 =?utf-8?B?Z0VmOHMraDlSQmV5R0gxMFR0aC9kQldUWWkvSWRtc2tlS1lDK2M4UUxyYncz?=
 =?utf-8?B?bTBpM2pOZmd6cVl5aWdpM21DY2FhSTQ5ekE5bGZXTFdQdXIzQU5HZzFPQ09q?=
 =?utf-8?B?ZVZOK3hRU2c0Rm9VVzVCK1daQWU2L0hwNWJGR1JGaTRtY3lET3kvdjg5SHY4?=
 =?utf-8?B?Q0RwdFR2YnJHaHpCOUxkcGkvOFgrUXA1U1pOZHM2WG9BeUI2TjNMSTlUVjVQ?=
 =?utf-8?B?UXI1UlllaHhZRUhKdlc0NHRkL3JqTmNvRHcwcUI1a2EwSlZ4dU1mRjNMdnlF?=
 =?utf-8?B?WnpWZ0pQVy91ZEtQaFVzZm85Uk5LYVI1QmhuY2xjZVJpdXdrL3BkL0hlQnJE?=
 =?utf-8?B?Kytzd3F2WkkrK3FNQ2liUm5acXgzYWcxcmtEQzdtR09uVm9ab3ppb2pXcjhY?=
 =?utf-8?B?YUVJZ3Blam1QSGplUWFTNHpuY0FQUWhYWEs5Ynpld0Q2VWpwemxyZktoYUsy?=
 =?utf-8?B?dHNydlBvQzNIMXYzV1pFc2w1aUhpNENzc3V5M1BLc1hUd2FXTXRwbnh4QzRh?=
 =?utf-8?B?dlRxUHZvMkdEaDlOdjRVaTlLdGJ2OVZLa1hLaUdGb0YvVjVxbG10dEdadHU1?=
 =?utf-8?B?NVlrRDNIRi85eFBnd3crMTJkTHRvcVB0L2hHblgxM0plWGh0bFNuSnEzV0pH?=
 =?utf-8?B?S0kvMThreEJxTjZrNGY0aGZ5bVRRSjJoRCsrMGhKMWVwYTZOeUE0WDFQOXpP?=
 =?utf-8?B?NjVaWURKYmpieE9rZ01BTE92bUl6STAvcE04cUtpMUpPM05HZmY2RHllWjI1?=
 =?utf-8?B?N2IvblAxWnFpdmF5b3VRYlVSV1BtUGlQRTk5YktyK1ZwYkMvL2w2Yk85c0NV?=
 =?utf-8?B?SzZsVG1sV3IxUGJhamtGbktIU1FRM0xxU2FJdXNRa2l2bnhQVlg0KzBZWFdo?=
 =?utf-8?B?eFBwakcrVStrdHJRakpDMGZiSGV3V0k3QmFwUFZnNVBCRW03b1pySVVRbW9j?=
 =?utf-8?B?QkRkU1M2QXpLckZQeEN5SHdJSUlIWENrUUJOL3F4ZUdodDFZR1FJMTdUa2ZX?=
 =?utf-8?B?bis4eTFlNFpXbjBqZ29UWCtQRGp5MW1FSkJlSVJ1Q1JZbklzWEtvT2JYb1U3?=
 =?utf-8?B?K3FvZUZyckRWMkJjY3g2ZnJScER5QXZBZHZZdkNlYjh0QlR6QVROMmxVNEMw?=
 =?utf-8?B?Q01BTk5ueW92VzVjd3Zza1dSL3NNS1JuNGptNXhEMjRwaXFDeWFkRktXSzFU?=
 =?utf-8?B?blpmajY1QjJNQ3ZjUG9weEhaVnF6dDgwakJnZTkxTUdQUlV6eFM5UG5hRmQr?=
 =?utf-8?B?a1RCWElaam1MK0JvTUhNK2VJY2xINGtLNTlUTHZhVU0yVWUyZFcyR3FTM0lT?=
 =?utf-8?B?QmdNd1NGL2g1dDJReHZybHBUUy84ejVnVE43RGE0Rzdncmh2MXFXWXBjVDlI?=
 =?utf-8?B?bjRmTi9KYjRxSXI1MFdGc0V4QVBsdG1RaGpQc2VCSmZlZ2ZnUTZZRjhWMURX?=
 =?utf-8?B?bEUzODdrdFQ3T3pxNXExRlNkd1E0Z0JjTEJDb3lwY2RJN1ZZY2xiQVhrM051?=
 =?utf-8?B?b2hjNFFQblIxMjZKRzJVZ3pFY0JPMERsYlVSZzVoSVlBM0xvclFPY1ZWUnZJ?=
 =?utf-8?B?OUcrR1Vsb2hZQkdoNk9rOTlpNXgrcjZrb0QwRmw5MndiWHVoZlFiKzNIUC91?=
 =?utf-8?B?OWwwbjZvS3M4cVVWK0VkVldPK3Azb3hQNnlFOGlUTVFaQWVYVXptcWhobUdl?=
 =?utf-8?B?TUJFSkU2UWdZMmJ5bVZ4alJsU0tueEV2bHRaQXBubmpLV3hQckVCQldva0N4?=
 =?utf-8?B?NHYrWDZnKy95ZTBnd2Q5bGxVMUNCTGVhRzcwUzFlalg0K3dsek5WL0M0NnMy?=
 =?utf-8?B?Y3FRY2RiV3NkYlV2elNPY0ZseWhENFVFOUx3MnBzUWdtd2dUNUpBczZqUlph?=
 =?utf-8?B?Yi9uWTVmcnRWYkxXUmp5eEFnbm9uRjFBeEdPM3lWeVBodFRaTmxHYnY3aWhx?=
 =?utf-8?B?MnlOenFRdy9WSEtuVkw4QkY4dUszb2pWRENqQm9ZeC8zaDZ1QkoxdG93cWxX?=
 =?utf-8?B?ai9rMTd6ZzJBclBJbkJMMW4xQkZTNWxzWSs2eGhpclZnWUhoWWlraGFYRXVM?=
 =?utf-8?Q?af3fxcfQLvvZuTKd7Q+ooSQMt58ocReey2I8e10LWIGf?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6803af80-67a5-4c2f-509d-08dca58e1adc
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 11:54:53.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsFRJAJ4TaL5IxJVd0F4bejvFmkB2R9By2zABSeBxsqII4HcjwSlgy0j1jijRMPF/qB/TiZtD6U7m/HE+mY1LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1925
X-TM-AS-ERS: 40.93.78.2-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28532.005
X-TMASE-Result: 10--14.670800-4.000000
X-TMASE-MatchedRID: vbSD0OnL8/L5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIhkL0gCMh6Dsig
	HKaC3ZDJADKNkHTrGGc4AS+kYyrrEcd2HSheDtk3eJchdZcr1K2vfe6AKVPc3pGeN+9dVIq3YXc
	dG5rihMXLjprZcXPZwOFsZGt1Klu61geCRZ1F9LQKonRFsndtvUb3ed6yowduRLCxdbGDxWrErb
	l4/evtZNGuZq+LiOD3p+fNEmMhWtjYT6uZOaIN0x+1m4xl+bZJIyQ2IZ1g8yYzgRR/MnDxnrQqX
	oHfpvVYLZf7Z55p3b568Eh/PU+qT4OyyIyLwUdQBzUoVrWHSOlvJQwByUH6ONbojhKG7WOq6KEJ
	O7SR6XgkvJFrsDh0h5XWHqKOxvV4rQDJT+IEXRYk+VN5SeE/CqWtxA0qDTb0iZHHs5XulrPcIfZ
	k2P1epTnxJqun3snzF+p38MndnJqjKQvOf6lrpFQObiqbBx+2qetiLv/n8ZHqVS7EiiBtgkSZbc
	3X/ik3Y+G1usO1tXE=
X-TMASE-XGENCLOUD: b57483a2-da9f-469e-9069-5cb3536ad12c-0-0-200-0
X-TM-Deliver-Signature: 02828996AE9CDD989F9EF659C4F6B321
X-TM-Addin-Auth: ziujh+lWOHN6nUvrZZuZWgVGLXcx//J9AyRquUAU1/9t8M6KnZDkJHSecpS
	lm+HP619yEBymzpZfiQmDo4K4LhZ0fLDA8vMbQfIHuypuAA/5EBt4GuQDGhD5ecCviFJTEcRnGp
	8ec7Akt1uecWP+qi4jyfQhozVsOEpImaZp07y5XMTZnKOVDX3Rh3yBf+PNhpwwmdGddtvI20I82
	NFuSzIDzc+EIwRen2J7B30Qazd6CKjoaNKUOodCAnWJNxNgD4TVMNw31CkAOKcBawS0l8FUC27j
	yDY9ZO+Rm02oWzI=.TIOEKUMClcCoZjloBB5tywTtQFKK2E1HGhrx37XBA7i4yeCw4++2Clh9lv
	AFhmELeqA2B8qqsX4aMsteu9pl3/pBumJTchGx5CsJKmtb8YmeTn+7w2oIIyCjTT2zgjMbr9AH6
	ZhGNBPgC9MwnYnXHhAc9PSJ4PBdu8g/zBkXaIoD5RBtvS0PnqxOgcrSMaWYeHA5INy4nr14U2m8
	/dCDVx73ORSFC5EP0x0Fc7mCAnL62pA6nWfEwa2s56sRT/c+tawmW4KCnpCjF/tH+PXsoHW2cuU
	AUdhR98pCBErAdCAEx3dco+9dPlBG0swgTKYEFjh1J0zQr+N2oVk/pp7K0Q==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721130896;
	bh=1fQH/3vFd0sRG1gMvFxh0e4yHHbzBggt/nFSsGKGMKk=; l=2078;
	h=Date:From:To;
	b=yQmSMhY7TlU5FvYHRueMGzsNT+H8+TKtEuWwxKAyjNLIlVi1tKR+26mDNeWPl6uT9
	 EMuUtcItTj//9jd9FvnlGOjCxoiGBZcT7BDTj32E5XP+Z7IYQHrgWRclI4Yt/9OYPv
	 xz1zuwXykOf7CNTkJ+vexLjs0K8Dts+1prGrhnC3WUFUko6rg/ucm7BcS0T1ZYu3Mo
	 lNWvpq+qwEwH2dPoakUUvhzXDlnUKXTeBIWPKcr+Q9HwSRczl2FmfTTF7jU0H4c8C9
	 +49sZSBLGOUDaRelSvZDo5QaI7eXNZnhqRgbKZGekBu0LLME75815fxhVrnbweoFAc
	 RuDwiiQqncRhw==

On 11.07.24 09:50, David Woodhouse wrote:
> On Thu, 2024-07-11 at 09:25 +0200, Peter Hilber wrote:
>>
>> IMHO this phrasing is better, since it directly refers to the state of the
>> structure.
> 
> Thanks. I'll update it.
> 
>> AFAIU if there would be abnormal delays in store buffers, causing some
>> driver to still see the old clock for some time, the monotonicity could be
>> violated:
>>
>> 1. device writes new, much slower clock to store buffer
>> 2. some time passes
>> 3. driver reads old, much faster clock
>> 4. device writes store buffer to cache
>> 5. driver reads new, much slower clock
>>
>> But I hope such delays do not occur.
> 
> For the case of the hypervisor←→guest interface this should be handled
> by the use of memory barriers and the seqcount lock.
> 
> The guest driver reads the seqcount, performs a read memory barrier,
> then reads the contents of the structure. Then performs *another* read
> memory barrier, and checks the seqcount hasn't changed:
> https://git.infradead.org/?p=users/dwmw2/linux.git;a=blob;f=drivers/ptp/ptp_vmclock.c;hb=vmclock#l351
> 
> The converse happens with write barriers on the hypervisor side:
> https://git.infradead.org/?p=users/dwmw2/qemu.git;a=blob;f=hw/acpi/vmclock.c;hb=vmclock#l68

My point is that, looking at the above steps 1. - 5.:

3. read HW counter, smp_rmb, read seqcount
4. store seqcount, smp_wmb, stores, smp_wmb, store seqcount become effective
5. read seqcount, smp_rmb, read HW counter

AFAIU this would still be a theoretical problem suggesting the use of
stronger barriers.

> 
> Do we need to think harder about the ordering across a real PCI bus? It
> isn't entirely unreasonable for this to be implemented in hardware if
> we eventually add a counter_id value for a bus-visible counter like the
> Intel Always Running Timer (ART). I'm also OK with saying that device
> implementations may only provide the shared memory structure if they
> can ensure memory ordering.

Sounds good to me. This statement would then also address the above.

