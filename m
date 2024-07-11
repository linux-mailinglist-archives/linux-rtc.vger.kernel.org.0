Return-Path: <linux-rtc+bounces-1471-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7392E0C7
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 09:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB1B28368C
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 07:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AA213D8B0;
	Thu, 11 Jul 2024 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="AxSJP+Ac"
X-Original-To: linux-rtc@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBD13A406
	for <linux-rtc@vger.kernel.org>; Thu, 11 Jul 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720682759; cv=fail; b=e29b82Y09+SLv54ZNSVbT2xQX6OwIZbIHUn7kBEdqIF2kVmwJX0KTLAB5hxiuSBmW3+5s7UVUyBGOXc8yUZs75YiaFu3p8N6r93m3riWYy8Qg/1RppPX79Dfxqv3kk4UdhCU5RkGQ8aipcajA2/WtNv5ruH2aAw8574zOR4l3jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720682759; c=relaxed/simple;
	bh=zbmImxgUZ0LJmJ/XyUrazhM7nbRh0HxwPmPWkqp9ZHU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oNhuH9EKVCE787tigxIv62sD3JZWEpM6AK+xepWI2USBLVwMn1R0idAIEibmPPNo1U+sjv0cOgzIJBpMgn30vqD8C3eCVcUEwvscYAuRQhws0RUJnokw2WFutsu2MajxNHoolm/VHqMoE7RCbL/et9+XeHM7xYwOJzpx9dnDDPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=AxSJP+Ac; arc=fail smtp.client-ip=18.185.115.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.50_.trendmicro.com (unknown [172.21.180.199])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 4BC7310001751;
	Thu, 11 Jul 2024 07:25:49 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720682748.411000
X-TM-MAIL-UUID: 6a2b3d6a-043c-43b2-9700-1ddb7ab0db27
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.50])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 64A7210008265;
	Thu, 11 Jul 2024 07:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPfZdFr1f6mLfrjQ9ealaljzvJHsRzlHCOTDV4iQjFA4jWoE1gTYrg/UFsBS6vxWj9JT6g2/XyY/Xw/Bzd+wksKbmDu9tN2eAceywB3XbcrlyTGKIFDfyjHdqV3XWGKVuyZrwE7SOPTfMXPFez8H3mAv3lxl9kefXhPhZtsfOeJQbFZyuS1xwDRq0UKISjCeferVRvb5eOmVWmjkvdcHSexK15jGK7yHjvxB6oSFAUdvuwUV4o6jACdy06QLCQwZyidVXSZQMUEgIylOORFhLTXbgnif7sEf8IUgymR9qqZoLh8+dsCjNr5kczju5B54xIkv1PrAqZHyINaS6iwL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uXR6oS2Sa3wlJZ0xTufWy+ouLhv0xpgcEZZSwyryTk=;
 b=jlazlh2t7YQnug7ycaD0ktQv3qI7OrsZFI/7JwShE07m96v2IUWUxyo4z5itvF1rFM6ZCZJ0BJNxklHFa6LP1xw7Wd1ooRHRAVThHPccruxCsfgO2hfH5yHyWj6Yv+59lLVlSpSaO7CNL+Y7NBPPUa20bMr/ACtkhzBXoYebpfd0N7BMfNMPgeVhkUZK6XL4xrtne5U1NEZzQOj9PTg9ofIomsfLqgYbIFwMRC+X00DtztfDCq4EONmuwnmtEng/cSg7i4MdA7kfEcvyyFoD+Jy1dnY+Sz1zjvJS+EcEApxI+m0nwoj+tsrziPE2VEL7ow/9H9M3GkyFmAU7VghPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <1c24e450-5180-46c2-8892-b10709a881e5@opensynergy.com>
Date: Thu, 11 Jul 2024 09:25:45 +0200
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
Content-Language: en-US
In-Reply-To: <98b20feebf4e7a11870dca725c03ee4e411b1aa3.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR6P281MB3984:EE_
X-MS-Office365-Filtering-Correlation-Id: fff80ffb-e1aa-41f1-9bdc-08dca17aaea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R01kT3NzMlE5ZGk4UE80eEJzaTBZZHpuZlRUbFVtL3FtWms2eHU2Ny9rRVZH?=
 =?utf-8?B?cjVkdU9LT256L1dJeDJMTVZKR21rSDZkeWZkbFVGY1BocWpPOFV6UnVXV2d0?=
 =?utf-8?B?dkNWcjlGcFkzNUxmQTJUOGJFYU5ZSjBCNnlIdTJVL1Z6MTFWYXBHY3o2MUVY?=
 =?utf-8?B?YnRmRWVxbVpCeDh3SjB3UTFHTFh3dDVuWHN1akhJMTRqa1FsenR2RVJvSkEr?=
 =?utf-8?B?YVhwUWNwUmhWVytXbFRKZCtkWlp2ZlEzcWgzZVFoeGRrdngyRVZPWm5oYnRx?=
 =?utf-8?B?Vk1aTW5PaDY3d0NLNDE0UTg4NGVGdHI2WEo3eDkwZnVhOWJBR21lM3hyRGZB?=
 =?utf-8?B?ZzZ2OCszU0NHTEJzeitWWFRkRDdIbStUN0cvVE4rTGtTN1JXMjBlN0kzaVZF?=
 =?utf-8?B?ZzM0SGZOeHBwSUgza3B2OGkxN2o3NjZmVWVXOGhoSlNJZXBYdGlLVEhmcXdu?=
 =?utf-8?B?dzBWRHVoRnBWV2RhbndqVEdreEVCa0thUXd2eWJZNjFTckJEWVZpdVFEUy9y?=
 =?utf-8?B?VTJ2TTV0RjlaOVZTREZhWmt5cFlIU2Q2bm1VV2hNcTZ2c1ZNUmpSYXMvNGQw?=
 =?utf-8?B?TE5oTU5hQzFFOUpSNjMxQjdOS1VGTGh5cVpTU1NFNzhqcWhQbjR4dC9LRzAv?=
 =?utf-8?B?OXJZNnYvTDQyN2E3aEF1MVhYY056WTFHT1dodHhCVHREcUZIZGtxUFdiYlJy?=
 =?utf-8?B?MUJPMGw4UGFwV3lqeVZBUHphelcxdER6TWh4dnppWURUNGtVeFMrdktnbWUw?=
 =?utf-8?B?NTNqdDY4K0xLTStVZStFQVUxM0JoQm11OFB6Wmk3T3NmbnBkdkEybHpEcDVF?=
 =?utf-8?B?MERFZUY1cmdkN05KalhCSlJMcGkycmFWMUxmMlVobVZxM3UyeG1WUnRINm1T?=
 =?utf-8?B?OWxDNGhvSGlxQS8rTk10c1FEcVBnM0JqVEJ6dnVzZW5HUWp2WC9JRzR0NTVP?=
 =?utf-8?B?QjhweW84Y3VoTDdWdnJmbC9xU0JRTEdTbzNDQmowcm10OWNLSEpORFhxNTZ1?=
 =?utf-8?B?TWpqVm16UWE2eGNnRUpBeVpDT0VIYWhXNEZEYWJaVXpJRktNcmVMdmc0bFFT?=
 =?utf-8?B?YzlEVFVKV1V4M1dpZWIzU0lPRWFDOXZsVzNieEQxUlYxOWZFbTJGVzU1WjVx?=
 =?utf-8?B?UDJtWElDcW5vT0NBQ2xEdHg0aTVEb09sTXNtdnd4MnIxT1poaHJCbldxMzZG?=
 =?utf-8?B?blNSY0RlY3dJa25pY1UrM2VwS1A3RDBJTmhlekI4OFp0TThWUkxXanRkc3po?=
 =?utf-8?B?b3E0dGl4Y0lJdFlSc3ZGbWlTVnVPWlhtTUs0UERBU0t5TndpUFlvVUVDdFo4?=
 =?utf-8?B?c0lNTkMvUUF4MmdMTVg5cVVEMXFjZUlNM2VRSXVIMXhOL25UK2xBSUtCYUto?=
 =?utf-8?B?RHJXYXkrb1IxYkIvYitpbTNhV0J3ZktJQVZOSUVnU2tGam1sVkovbWhIdkE2?=
 =?utf-8?B?WU5aN2UrcitqQjdyOXdBNzB2VTV5RnIyd0ZKVTZQVmNpUTlRdDZNOVFZbmFs?=
 =?utf-8?B?b1M0SkI3RXlJTEY0dUN0RUpucTk0aTBaWkF4K21vRjJSN3piWTA3blAvNzRZ?=
 =?utf-8?B?aG9IeXNuL0k4Nm4zRXc5MVVhSTVxekdvNVNLaGYyRnZjMFVjK2dlUDVhZEdS?=
 =?utf-8?B?L2gzRXFGUkNtWmlITTZaMVY2dHZyS202SnBUcm9lbXZ3dWNIQkVBdFpwSGw4?=
 =?utf-8?B?QWI3b01WSitldEpEODlmdjlONnJtQUJTUEZkQXZPZzZZYXRIZjVSb0hkbk5s?=
 =?utf-8?B?OVhOcnFOQ3N6M3plRmwva242SG5oMUJyMTRGb25YU2RoS0s2Q2t5L2JKaUp3?=
 =?utf-8?B?VEtqOEpKVjJLMlhEV1FLc1Y3dzU4THZpRFdNSG9BL0tFc1daNUZEbDVkME0x?=
 =?utf-8?Q?LaG/2XV5rizYS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm00T3VEUThRTGo3ZTNUZHFvM1p3b2lMZjBKcHlRZkcwSmhhR3BpZHhWRloz?=
 =?utf-8?B?aUpveksvS1kxbUhpdElXVWdlSk9oeFlDSGcvUFpOQ1hUcHI2TUFXTVRWU1JG?=
 =?utf-8?B?ZG0rWWV1SGtPUVd6RGkzL0E4MnhDUlNxKzg0bzdURUo3TEE4RERYN3lIZjR2?=
 =?utf-8?B?NnFSY25LdkdkS2ZNVVJHVUpNMi9CTnB4aVdGaGRxaUhiMHR5OWVOSkpVaUJF?=
 =?utf-8?B?ek5DNVE1Qkc5aVYxSDB0T2tNbFQwMUNsMThwVytGbUpWbWVoK0JFYmZEOUx1?=
 =?utf-8?B?QkpHejh1eTk1UU9TemN1RTM0cHpLTFRyek91NHNjZEJNaXZzVkhUUkxONnZE?=
 =?utf-8?B?aHZscUZsbGxVVGFzb1huRjdNNWZ0RUtadTcxNGU0V1pFcmEzTzhseDZ1UmVY?=
 =?utf-8?B?em43Wit1dCsxOGdSd0lYWXB3YmV1NURuT3Bja3N3c1hrc2VUbHNUZnR4c2Fp?=
 =?utf-8?B?WTdES1FDSXYyV2lQVGY4N21oUkVnaDVtaCsyWThEb0p6TXBuMHFwdHdDSkZs?=
 =?utf-8?B?eVNMSmR2TTlObXNicXYvUjIwOHExUUkzRWowQjRJY3hSVlNIeFRUeDF6Smww?=
 =?utf-8?B?a3gzcG5GNEVTTFo4ZVZyRU4ycC8vbmpRbC80aWxscTZpL3JQWEwzNWI1N0Zl?=
 =?utf-8?B?VTdyZWI3WXo0MWdhRnVoUFpDUFh0TnhzRXZtejdOUFV5L0M5dTRzUUR3bmo5?=
 =?utf-8?B?VEFEMzhGeEprTVdpR2lVT2ZtMFdDd2VXWXBzc0J6bVpNb0hGLzRIUFloL1NO?=
 =?utf-8?B?b3hZaDJiOWVrQWRkNkhSYk83SHdJelRpc2FwZUpGZ2RKT29XVmFvYWhjYjh1?=
 =?utf-8?B?RkY4aG1nYVVVY0xKaFhIalJxMHIrV0VhVFVXeEVOK3k1M2M2dDBvTHpPNTlM?=
 =?utf-8?B?ZGdhMFhST2cvWXl2SCtGT1hCa0ZkTmFBbUlKSFhsUFZlVzBMQzFhVEhOZFh4?=
 =?utf-8?B?UWtRek4zL09hL0VZbnpYV296VVZ3Y2dRb1dqU3JKSmEzelBEZkV1Y3NIaitD?=
 =?utf-8?B?alpJTXpTVTFpRGc0czF1R1E0YWRFSWVFZTRGSWRGSkZ3WkdCL0JKQVAzN0p3?=
 =?utf-8?B?aVRmNWVvcDNjWDlocHgza215dVR3U1FQRHJHT0k1K3JQUXpqK2JneWNpdjMv?=
 =?utf-8?B?WW1oZVphZzV1Z0dxcG03WkpWUDRuVkdhN1lNaTQ5UjNXcE54T1dFbk9qTGZz?=
 =?utf-8?B?M1ZwVG5XZENhQUprNDdIT1N1LzRkcXo0OUFKQ3pocjU1QWZzZCtXTnl3dGY1?=
 =?utf-8?B?Rnl1VDArQXhwcnVSTlBMVk10WmIrcjFFelI5SEQ3bWh0Z1VNUy9SbFZBcGZW?=
 =?utf-8?B?WXNoS0VuRkRtM2VZdmFsTm5KKytoTlFBSmo2V3lrWmxUeUNscmx5SHlRNlJx?=
 =?utf-8?B?aTZJTFNObXhRMEVGaFBXcmxzMmliOGpZZ3dEWmZyM3BCM0R4TWgwVjZpWGVU?=
 =?utf-8?B?U01JSHdDVlgzaEptYU03a2JIdE5yU09XbUc1MHVSWmRreXBURWIxSVpQdkFo?=
 =?utf-8?B?WDdxWHY3SWUxSXUyTFd3U1lWcE90dHlrQVVoaStralJlejlFOHdadG53a0du?=
 =?utf-8?B?S3VYZFVhalBXakVBeXAwSVk5Ymp4NVdDU3FCeXZFeC9ZSlhqSzc2UCtSR1ox?=
 =?utf-8?B?c0RIQk0zcisyMm1hbGRBMlVBTUZZeC9KQlhqRmhXZEF2Tk5GYmVqVDB6Y3ln?=
 =?utf-8?B?OU9pMzl3dnY4ZG1RRVJYNWRVYUFBWmVJK2FXSVpzTWlWUkpPMStVOWNOaHR0?=
 =?utf-8?B?cnhpeVV3OXlRLzBsbUN4SDRhbEN0dzFuR1JhYVZqNkt6M1dzR3owV0FWNEhJ?=
 =?utf-8?B?NzFqZVozLzlQN3d4ditLK0lxNFVyTUtnaTFHSGRWS2pYQjQxZm5uOVV6NUdK?=
 =?utf-8?B?ajQzTmNJZ3l0dmtQNnBVNFF2L2FSb294LzdqTzN2NzJKK3U0b0Y5R3JjRVZK?=
 =?utf-8?B?L1RNUnVzR0Vhd0kvbmM5M2MxcVFiUzFMMElqS3BtdTJxNmgwcE51WUo3N2dZ?=
 =?utf-8?B?ejNFYWlBeTd4ZU9YMTJ2SUdiT0FtTVpWakt2OGduWHV5bjRRRFZlQVFQR2Zu?=
 =?utf-8?B?V1NKOCtmNlJIOFRjVXRPVWo4QlB3RW9ibnRuMG1HMXNaT1JLQVFaTUp0SzV2?=
 =?utf-8?B?WHljaTUxK0ZCczRqYUZKczlQQVg3WVlWa0dwNmhOKzBxR0FuZC9zVU85YVdT?=
 =?utf-8?Q?JafD5HHhvDoHGlOmZw/RKaBV9WW+JU2H7JT7j6uP7ohk?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff80ffb-e1aa-41f1-9bdc-08dca17aaea8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:25:46.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs2zIPi/ywGRBMmG0geAqPgeWw4yPKCwYvtdAuAgWjbCC6jdHGSoVrFN3P7TvDFzB2NnFdKcZFGS2hwoHm0kxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB3984
X-TM-AS-ERS: 40.93.78.50-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28522.005
X-TMASE-Result: 10--24.057900-4.000000
X-TMASE-MatchedRID: dL10VBB8yof5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK3UJJ8+n/4RdDF
	H3Wq0Hei8/CUaSFEolDtIrpZrVLcYZ5mTKF4TLatoSymbNaqh690oFi/bzvqqGHCsfOTI0iVFIB
	UXk42ekvZFrPm8SKYrjMfis/0rGfSRebobsPZHKY5z9yWarHTmlxF+wAaDLINWQMS6lqffg/KAK
	ZFbhJUT6hlHCU6UdV8e4+4YeTdG8lv9tn1n4xOAwtA/CxcpPQhEuR84e9GA+J2QL/KCo6K9CdNK
	8X5KGCDMyz8KcxrQzE8zCPEDFRZmrO8hCGjfYuCCffN9El9NwP9jl71CJrVKZAzrN62v5yEURHZ
	M9kNnPr4lO2TCbf7qJdz67j1qxArdcJtojMW+Ox+RtIOyYSgjEIp2pwQ814LHgLEfDuL+k7Wm0M
	k0zTdJP2n/hBAlGYBvZVm/dUG4wEfp1jT+VsjAzznYrbwoJETR5ivKnLt9Es1qJ78XlPpRtFVoI
	q/M5jb5JrN9/h+EXVI7lIrHBEYQVw6eqmDL5urES46qCSbf/X6wx6weWCky0ubBoDSEJ57Z20BG
	DQhwv0uQ8HrojkxeXv6mnCD41mXcYO7LzLWqS4D/dHyT/Xh7Q==
X-TMASE-XGENCLOUD: 32156b37-aeb9-4078-becb-6a10f1620522-0-0-200-0
X-TM-Deliver-Signature: ED528BF3C4C86A1AE3A7751836A4731C
X-TM-Addin-Auth: 1hwEaIAf7iphFUsHC95C6beNp9VTn7uhFAT7PtevEal2uNgZUuxohRaU6oY
	8bjpa9VYaQR8RxXIjeAZRKWFXp1K687Px7u2yrzKTFCf/rhrm3NbZZg3vx7/0ODUnNi3nkJzlcD
	Ok5Xt9/7f85Ty3TnoxQgZMulSJ44SMxKBxusH3CneFxJ/tKLuTrgOOMxgvV1iaZXvkKXwJi5lGW
	w9VPwN/fmarXi2Eyzfgv9NplXsh2grpsH/8t2Vi5rI06ZuybD9uzUt04uKf2Wam7lOabaH8nv8V
	4px6UGvW2GWZt6s=.hmCdBS7LWRGfBq8GuEQQc3Tjuv2khtvsETVNiGlC710XAY71goS+zLHRuH
	nguKT97yY5ZLUb/5u015Y3TcoXuGq7HSTspZTS2QGPNSTx1EuR1cdcB33rK70VqM2XWSLMZOD6E
	W7Jny8SKS9dsUtdtxGNsNiEURJ02Dg32UU+n2aqgTs1+OECSfu4U5hR8yBX4uThIUXUoKArGFnC
	00Sb3Z7ddmgVyt8HwpfCiDAPHahNFK+YR/5yFsZy9rUxcQz6M/ZHmxJ5nhKIyl9BD5rCQKJl++v
	zPvAJ5QK1FNqxgCRJSqktm4wtSwpwBoI4U3Aq9cB78OipHEPPyYhhMmPq9w==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720682749;
	bh=zbmImxgUZ0LJmJ/XyUrazhM7nbRh0HxwPmPWkqp9ZHU=; l=5982;
	h=Date:From:To;
	b=AxSJP+AcIVHfFECowvbgHvFpaXU1HEQQqz4hu6gczXWoQPcZv/BOfVsiaQdYnZu8n
	 enXHkkPqQvWAUB8O7nNP/GCdih78x1NfVbOmcxTuF8nuXLLchADIWh+sb41b5xe9aI
	 Tmy0mlGjcubfS95Y7jaxrLz/AnZqjg1vDLQgdx4KCwG9izrd3EDhwgQ5rDlQhHaAsj
	 oyU/9IbDr/MphitwjCVTtAZMBeLZOuVSwqy55aZq3y1hYaq0+CTbRHLDhqjgesUr38
	 VWwXrJvRc60sqdZ18tZFr4fCcv94PFe37VjK/Fx59LKaNJJowsSKx96jGPh9LNGzQk
	 eFIfWvxpqQA3A==

On 10.07.24 18:01, David Woodhouse wrote:
> On Wed, 2024-07-10 at 15:07 +0200, Peter Hilber wrote:
>> On 08.07.24 11:27, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The vmclock "device" provides a shared memory region with precision clock
>>> information. By using shared memory, it is safe across Live Migration.
>>>
>>> Like the KVM PTP clock, this can convert TSC-based cross timestamps into
>>> KVM clock values. Unlike the KVM PTP clock, it does so only when such is
>>> actually helpful.
>>>
>>> The memory region of the device is also exposed to userspace so it can be
>>> read or memory mapped by application which need reliable notification of
>>> clock disruptions.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>
>> [...]
>>
>>> +
>>> +struct vmclock_abi {
>>> +       /* CONSTANT FIELDS */
>>> +       uint32_t magic;
>>> +#define VMCLOCK_MAGIC  0x4b4c4356 /* "VCLK" */
>>> +       uint32_t size;          /* Size of region containing this structure */
>>> +       uint16_t version;       /* 1 */
>>> +       uint8_t counter_id; /* Matches VIRTIO_RTC_COUNTER_xxx except INVALID */
>>> +#define VMCLOCK_COUNTER_ARM_VCNT       0
>>> +#define VMCLOCK_COUNTER_X86_TSC                1
>>> +#define VMCLOCK_COUNTER_INVALID                0xff
>>> +       uint8_t time_type; /* Matches VIRTIO_RTC_TYPE_xxx */
>>> +#define VMCLOCK_TIME_UTC                       0       /* Since 1970-01-01 00:00:00z */
>>> +#define VMCLOCK_TIME_TAI                       1       /* Since 1970-01-01 00:00:00z */
>>> +#define VMCLOCK_TIME_MONOTONIC                 2       /* Since undefined epoch */
>>> +#define VMCLOCK_TIME_INVALID_SMEARED           3       /* Not supported */
>>> +#define VMCLOCK_TIME_INVALID_MAYBE_SMEARED     4       /* Not supported */
>>> +
>>> +       /* NON-CONSTANT FIELDS PROTECTED BY SEQCOUNT LOCK */
>>> +       uint32_t seq_count;     /* Low bit means an update is in progress */
>>> +       /*
>>> +        * This field changes to another non-repeating value when the CPU
>>> +        * counter is disrupted, for example on live migration. This lets
>>> +        * the guest know that it should discard any calibration it has
>>> +        * performed of the counter against external sources (NTP/PTP/etc.).
>>> +        */
>>> +       uint64_t disruption_marker;
>>> +       uint64_t flags;
>>> +       /* Indicates that the tai_offset_sec field is valid */
>>> +#define VMCLOCK_FLAG_TAI_OFFSET_VALID          (1 << 0)
>>> +       /*
>>> +        * Optionally used to notify guests of pending maintenance events.
>>> +        * A guest which provides latency-sensitive services may wish to
>>> +        * remove itself from service if an event is coming up. Two flags
>>> +        * indicate the approximate imminence of the event.
>>> +        */
>>> +#define VMCLOCK_FLAG_DISRUPTION_SOON           (1 << 1) /* About a day */
>>> +#define VMCLOCK_FLAG_DISRUPTION_IMMINENT       (1 << 2) /* About an hour */
>>> +#define VMCLOCK_FLAG_PERIOD_ESTERROR_VALID     (1 << 3)
>>> +#define VMCLOCK_FLAG_PERIOD_MAXERROR_VALID     (1 << 4)
>>> +#define VMCLOCK_FLAG_TIME_ESTERROR_VALID       (1 << 5)
>>> +#define VMCLOCK_FLAG_TIME_MAXERROR_VALID       (1 << 6)
>>> +       /*
>>> +        * Even regardless of leap seconds, the time presented through this
>>> +        * mechanism may not be strictly monotonic. If the counter slows down
>>> +        * and the host adapts to this discovery, the time calculated from
>>> +        * the value of the counter immediately after an update to this
>>> +        * structure, may appear to be *earlier* than a calculation just
>>> +        * before the update (while the counter was believed to be running
>>> +        * faster than it now is). A guest operating system will typically
>>> +        * *skew* its own system clock back towards the reference clock
>>> +        * exposed here, rather than following this clock directly. If,
>>> +        * however, this structure is being populated from such a system
>>> +        * clock which is already handled in such a fashion and the results
>>> +        * *are* guaranteed to be monotonic, such monotonicity can be
>>> +        * advertised by setting this bit.
>>> +        */
>>
>> I wonder if this might be difficult to define in a standard.
> 
> I'm sure we could do better than my attempt above, but surely it isn't
> *so* hard to define monotonicity?
> 
>> Is there a need to define device and driver behavior in more detail? What
>> would happen if e.g. the device first decides how to update the clock, but
>> is then slow to update the SHM?
> 
> That's OK, isn't it?
> 
> The key in the VMCLOCK_FLAG_TIME_MONOTONIC flag is that by setting it,
> the host guarantees that the time calculated according to this
> structure at any given moment, shall not appear to be later than the
> time calculated via the structure at any *later* moment.

IMHO this phrasing is better, since it directly refers to the state of the
structure.

AFAIU if there would be abnormal delays in store buffers, causing some
driver to still see the old clock for some time, the monotonicity could be
violated:

1. device writes new, much slower clock to store buffer
2. some time passes
3. driver reads old, much faster clock
4. device writes store buffer to cache
5. driver reads new, much slower clock

But I hope such delays do not occur.

