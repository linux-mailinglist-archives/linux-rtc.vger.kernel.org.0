Return-Path: <linux-rtc+bounces-1522-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79C9325F7
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 13:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A741F2288A
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 11:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9A519A298;
	Tue, 16 Jul 2024 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="CKambLYg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F20D199E8A
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721130897; cv=fail; b=Y/tRtL69w+nHpCO6kOR8OVmCytB3HwCx23XRmD7EpbAxICieXh7gNlCb9ii4IpoLTQ8u1uRDqdAEEqeLNon8e84+Z1I3BOBnnqOrWnrJc/+atI7ml7RVR8wBQ48cq6NWGJpQHo6pDqhTWO3QC+3+eCeDUhlj0+3sJPIYmId163w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721130897; c=relaxed/simple;
	bh=NBUnKggH2eN8Xxe9CsqKHNMLJTF1hB7t8r1yElnZknk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SnxI6Lv1ugx+smF5TzH2eEAz25+FwPyBOfHqw+JiNScydUBYYg1TKwWmA66aSwvCy/AOC7HwVwwlCPTM0WVH3W6V7CqpgI5nbWaGz6C1TkEQGlNVReUrh4FyPFpoVeQDio1/HLc9tLQ6dpkiRmM3G54BKkOjPF8Qn8ORM++w6SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=CKambLYg; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 40.93.78.51_.trendmicro.com (unknown [172.21.10.81])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 80B38100765A4;
	Tue, 16 Jul 2024 11:54:47 +0000 (UTC)
Received: from 40.93.78.51_.trendmicro.com (unknown [172.21.193.255])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 4506F10000F67;
	Tue, 16 Jul 2024 11:54:40 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721130879.059000
X-TM-MAIL-UUID: 07f8d397-e31e-491a-8391-53e46d32ddfb
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.51])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 0E8BD100058F1;
	Tue, 16 Jul 2024 11:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMJ9888jVmLWxtmZh9PBv+TUyNpkLebU379TlpOgcZIrLzuvT13pwSDt6Ad+QXrdavkek5WMRsOtjSWpARPsqKVn2jtbuXZ92tsBG/QrIC8RMW23qfmmVj1iDxsxaJU6iyZf2JxT5ldQ3bM8VcBWP+N8VwQu6UkTuuW6o45dnQv44HydZcYspudAzBlDQ2zZAhQ3UTYu5Y8N8iHuHu8hdJyv3BGTiGye9njlOjFXrgYejgywIdfRq6aB0I4OY9NYahB2xj1F29Sfmowwlz7WJgT8V8BD6TGuOZnFrwvBTIk4eoCcfeTgapLwlIICMen0NgHzhjLGoywi3vs8RGgsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLOO5tFGuCicnglknhsanGILZD+I6faSsGVhzkfgeM8=;
 b=W3XG5t9UZgakNgEZiBfMsFnpn18SHESkpn2LC0S+SblPp5tJTFRzEJRAdkO1cCfGkMGIR6DwZNmcHcHcyM+yH6dJL+idSfVHdqh9MIDb3Htr0R9NJ/nGY0LET+fUZ9W7Y1wcVKDy8T1qPodnq8WdPEhAlJWVv/W1wKO1oxTBwmuNPWgJAd7oQYGAqRjtvJKALZmhtZ1U3A0VV8hbGZWt0OXGYYsKyT6TKB1bu8rtoCPB31f2N1JUMuVHG+re79nC9/a4tZblUafaa4F7pNMESYhu4B0CvuDf/bz/JFa00RtaS3/DVbCmNVyjbQ3DLETz83STHFxuhQHxFoTqs6m82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <2e875592-f6e7-4694-8f51-655d0b9a2988@opensynergy.com>
Date: Tue, 16 Jul 2024 13:54:36 +0200
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::7) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE1P281MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8a8bc9-004c-429f-2567-08dca58e110e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDJIT3Fwc3FIWEg4VlZ6Q05TN1ZjcGNsVHJvZEozcUVuRTlHZmcwb0hyclJp?=
 =?utf-8?B?T2tIUTVuMDgzZWhzZUpWbWhXRHFhUCs4aDI4RUJ6VXV6VkF1STFHcHRMTlJy?=
 =?utf-8?B?QjRGWFRPcEtSamdxT0lhQiszK1YxcG9BZGsxbHNVQWhmNnR3OEhmZ0NSRHhr?=
 =?utf-8?B?dS9XL1VURk9tS1ozVy9LMjVLSEowaXBDWmlzOW10SUlIS05zQ0FhRDMxWUow?=
 =?utf-8?B?a3ZwNWpYUXJISVN1eCs0WDdNcjkrNldGR2JoWjRmQWFZZ1hZRWVCeitnOERZ?=
 =?utf-8?B?WjVWVitySUxZT042bU5iQXZkdW1EWDNxaFpNYkxocWdldThTMjFyRDdVbmNT?=
 =?utf-8?B?eFJ1bExjaTcxemE3REVUalVKQnNRVG5QcDNqVTZLZnlOTWllQy9jdVNPSmhu?=
 =?utf-8?B?WnlNVnhNSVFNNVpXRVZmOE4vTEducURmZ3VYV2NmNXRULzBGTGo4cUR2c3VZ?=
 =?utf-8?B?bTl2ZGFvcml0cTZPK1RNdFFmbzVJMXp6cEwvUVM3SThNUElKanRaL0d2NlJX?=
 =?utf-8?B?R1RoTUJBS21Xb2xTQWY2NHlTNzU5T0pFWTFRa3FuUnV5RnlvNjdZNmViNXdz?=
 =?utf-8?B?SGV1NE0xUnZYcXRHK1UvS24zRFBTOEtJNDYzbjNVOFA4aVJ2UjRkbkM0cSta?=
 =?utf-8?B?V0VmYjBmLzVzMjFvYXlXNnZsaVVlUE5weHlTb0ZZaHZDaFU5Nk1mdXM0N0NJ?=
 =?utf-8?B?bVdrS0F1M3FRNFpBYUpsMERxWmNCc2xZZktqYTY1V0dZUVZzaUxDSzZKb2t2?=
 =?utf-8?B?YVRpb3NndDNFZG82TmlablhYVkJ4ai9GaFYyWjFQdmJXUGdBVnh4ckdsVFhT?=
 =?utf-8?B?NXFiRkU1UE1wMlpHOVovU0xOY1l0am5rTVZ4MWpyK2pXOUROYVhkMXJWaEhT?=
 =?utf-8?B?MGxzZWtaTnRvdnJudWZjdENYQXFieTVTbmtmeXJ2eGFpQlpDYmJSUG9EV0Rp?=
 =?utf-8?B?ZXdCSjhSUFNUVEpZV3hoSWNCdnpTN3RwOU1WWlBGaEc3djM3dlNjTVZxeU1w?=
 =?utf-8?B?T1BJYlhnS04zWWR0c3l1U05lQXdRZkxtbTIvMjRFdlI4SFoxUDNVN2Z1NDFt?=
 =?utf-8?B?MnpvM0lGUEEreVRzazdvWjNXdVRxb0k4aDMyc0R6MTJWUGIzU3F2UmsxUDVT?=
 =?utf-8?B?eEE4cGcxRXJaY1NzYk9XSWhLSEZMK3ZlMXlwaHVpazZ1QitIRG1VSm5LaVM3?=
 =?utf-8?B?eWFUdjMrOGlqM0VSWStzbGJraVB0a2lXbmRwTkFKOW5qRk81OGxleStDNk9o?=
 =?utf-8?B?dVd5OGJpZmMwd3UvS2FXQ0Y2SVlKUnhMTFF6Y3F4T2F1cGxzNFUrMW5NaE9k?=
 =?utf-8?B?bmZTUWpqNEszcGhWZS9XeHlXaUNSdEdFelhVdVJ4My9kNDNUemVORzlZOStz?=
 =?utf-8?B?b3NSLzlzN1o3a2ozYSswL1RGWEFXVkRrVitoMGlrUjE1SlhTdWFac2VkYnBk?=
 =?utf-8?B?TUFVVS9kdkZsNGo4bFVCd0E3WTd2UUM2WjdOYnVtRStQL3FLZTh5NzdneldV?=
 =?utf-8?B?am1CVVdmelpvWE53THJocW9IWStyaEtKMUhGWGZ2d05oK0FOZUJjeGEvYVI2?=
 =?utf-8?B?dURuaXlMcHpFdm1NcE0yeVorUWVDNDE5VXVkcjRDT09zN1RyM1M4NVRMNHoy?=
 =?utf-8?B?Zm4wQ3dPTXBQOXNhQmxic3pXeDRYRzBoUWVSK0t3ZkIyY0x2YUZwd3Erb0Z1?=
 =?utf-8?B?UG1Ua1BhZXdkSE9NZUY3QzIxYXhqaDdHSHRPMDZOL2dvTkpXNE5FUXlsVVRI?=
 =?utf-8?B?U0hKZ05aNWp4WUhyMGRRRTVLcHA0MVJ5MTM3MTRjTE5ycEtXdnh5ZkJxVml0?=
 =?utf-8?B?dFlJL2hXVFl6V3J4cVlnZlpuNUhKVUMvdlpUWlMyTU9nbjZwM1RvSmI1QVdq?=
 =?utf-8?Q?D91KTkVFbyhnk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnpaem01VWlLaXVLd3dTYnFSc0VJYTdndXJoZm93Smpmb0d2VVkrWnBEVmdo?=
 =?utf-8?B?TkxuYms5MWo4cmg1d041RHVZYzU5Rm5KRkFzdFlMNWhaVU11WHhETkkxL01Z?=
 =?utf-8?B?UkhVeEJjalJwRWlzNDRZRlRLd1pJdFpUZ1ZpN01tTGU2ZGtlNzVOZ1YrcUI4?=
 =?utf-8?B?WW91UUVnd3F2YmUySUZnbFUvbFdLZXA4ZkIrbk1CUFo1cXR1czZmR3BGbmQy?=
 =?utf-8?B?cUprNnk0ZmVrR0pyUVpQWXBDWWhyWDdJTWFwOHovaHJQY0F1ZnBKTUQyNE05?=
 =?utf-8?B?ZE1QUndKOEgxRVRWUlVCd21WdTRkcHJLMnY0U281Vml2LzkybFd1dWxUeXQr?=
 =?utf-8?B?d2UveW4wS0FxM1JxNUNDcmd3R0R5Z0pLOGN5ZkNucm95bnNXNEllRFE1d1FW?=
 =?utf-8?B?bXNKdkFDYjBzQlQveFh2MEtNN2VrT2RJQ1o1QVRqWGpBOUV4TVcxSEJJc2M0?=
 =?utf-8?B?N29tNDJyZG1UTTFPdTFYeXdESldHZEZ0SWNobEJnS0VJKy9wRTlCVXJ0N2Jp?=
 =?utf-8?B?TDgxYXhYOXU3cTAraXZOUEdOMnJZOXFTZHFXeExhSDNGRHcxVmgwZk0yNXpN?=
 =?utf-8?B?Wkh2dWtSMk14QmpseXVLeHZ2d2djZGYzSWNhc28zNVgwNUJKV2UyWVFIVXdl?=
 =?utf-8?B?d2RjcUxXZjY1d0pkQ3lmVitmSm1pYUJ5ZEVxS2VlYlNCdEtwWmRRWGNPUkhR?=
 =?utf-8?B?RjNUUml3MjRlNHhHbXdENHZvV2NSdnpGc0hqUWRvYTdCTS84eExhUk0wOGhj?=
 =?utf-8?B?dERYR1JQYzA0dHplbXVnOTRqWlVRc1Uzd3F0aU9xNWZySnlvYks4VUJITEVD?=
 =?utf-8?B?UFVVb1REbWkrUGhnM0xPWWZNeDNOdkNibkV0VEJOVFlidU5ibkRNSUc2M2Iy?=
 =?utf-8?B?cWZqZXljTVc3cjUraDMzYW4yakI2aG90ajl3Kyt1bElCejdNcDkzbWFnenky?=
 =?utf-8?B?VnVvQXdnWUZCcW4zNTRGRm5Mc3RqK3E4cHZKZlRNUUs5K0VwTTVLdWJBSW9Y?=
 =?utf-8?B?UTZkQytjcDYrV0JMTHFNSHRSWWFLLzVoNkpLV2s1elg5S2FiaTFZYUl2RHVR?=
 =?utf-8?B?b2FOaVZ0eTZ5d3Q0dmlpc1YzbFlveklIdEFjSFpacFVoeG1wdjZjeHFuSUJx?=
 =?utf-8?B?NVNUR254eXZtb05oSW5tcUNrZmg1OGpnMUxhSDd3V1BYeG1LaURlb0Z2Wjd6?=
 =?utf-8?B?TDNaeHFIU1RaSHMrNlJHYkxKaGdCNlJCTkw4SG90emdXTGNzVHZQRzVxK05o?=
 =?utf-8?B?ODA3eTU3T2tEcU5KWFJDSWRlKzFvTlRrM1Y1MkVicVBvUW9TNFRoSUd6UGZ6?=
 =?utf-8?B?U2hLRzBnT3RYNlRSaFNzNVF5ZmpPS2hJYnVqVk5QWUtBVVRQMmxpZUVBNmFB?=
 =?utf-8?B?UENWLzI2TFZPc0Q2RW5OUXVhZS9QN29YQjVIZjEwaERSSWRLQ0w4anBzNis2?=
 =?utf-8?B?bXMrcUpJRFVHWnd6aGMrd0RXbTJxZHVRS0g4TmdTTVR2aUE1eTl5UyttOThy?=
 =?utf-8?B?Q3BuL0kyR2ZkOERqNjN4RWNtZlZpZ0NkaEIveTJYd2lxMTFydTQzVWlkS1pG?=
 =?utf-8?B?Y3UyQW93YWh3UkNOcC8wRUh6cFFZb1dYRWw2dWRpZWJKa2dOSTc0RlNoZ0Jm?=
 =?utf-8?B?dHhiMVEyejQvcHRiVEtTYnYrdHVFOUtpMWZFZE4rU1cxM3NlazRVdWY2VDBN?=
 =?utf-8?B?ajBEUnFDTjh0YUFsa01hbkdFcHFDeFBwT1FCck5wWThsVHVqSWdZdGpncytw?=
 =?utf-8?B?WUx1RytQKzFTbXBmSVpkS1dxdXF2aE5LRHV4MHJnNjVLR0N0dStrS2xycTBM?=
 =?utf-8?B?Q1UrdDdHWFVJMW45TFBqVW1CTXN6WitrcjN4THNyTFUvQS9WUG4zU1JBYXpJ?=
 =?utf-8?B?Z3NEcTNBQU04a1QvRU45dGs1T3pVODIzbnY5L3Y3UzltM3dVMWdoampxcTJV?=
 =?utf-8?B?WUZKSGVaaG9YUXVIc2hHYlVGdXQwajVycHpXZnJONWNadUJpcHExckFjaUE5?=
 =?utf-8?B?TjY0SksyN2laWUE5N1daSG0vOStHSE5BVkVhZ1lWVHNHanJoWG1jN2kxa2hF?=
 =?utf-8?B?Rm5ad1JlaFZEWmhUc0dwdi9qdjRqaDZRSWVQS2N6TkpOMHhBZDh2dXFvcEZI?=
 =?utf-8?B?K3czRE9NOGl1NGtJaDBDQVZjSEFuaVRmZis4MDQ1K2tTZWpGbWxTWFhrV1BH?=
 =?utf-8?Q?vluIYIlcS1OZZ5kgRVacAlbjo/3fUWA/nfmsvoJXlp5+?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8a8bc9-004c-429f-2567-08dca58e110e
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 11:54:37.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuRYGgWWHsaF0Ejt8+Rxl2yF09Qkr6p+8sWfIs4Prf0gF+fFC79EMPW6Re5h3VO9vlBT+Zb0G/TuMt6o8TV8HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2579
X-TM-AS-ERS: 40.93.78.51-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28532.005
X-TMASE-Result: 10--3.262000-4.000000
X-TMASE-MatchedRID: +c13yJDs9035ETspAEX/ngw4DIWv1jSVbU+XbFYs1xL+teBvtXSx+MN0
	ttU53zjBnL8fU/fu1hTxEXPBUZeoEui1lkUvOtVfawJUqbmGPB3aPuPIIqmcJ/p4OuSy0UFxr54
	JIx46I6RsGRtqiNjgbNWDK+ZtBYu5J3n9e/k5m875IMfcfKKBtPxcvA3b4B4wOwBXM346/+zno9
	6w7u5Z9S3CfmATSj/USUiCGruO9KvzKEA3aTy2ixhuNHkFvYwX
X-TMASE-XGENCLOUD: c4dd0b7a-6166-480e-9140-bbba4e759555-0-0-200-0
X-TM-Deliver-Signature: 689296F135A6F3DFCE2FF4DC86D46286
X-TM-Addin-Auth: CctZJ005x7gWrbPs7hK8I9s9/Ac8KgX7OpCaIyE1d9ogMOhFRldcd1V6Iia
	s1v9aAoLKnXmyjDYqLUD624/rUBf+dBvg+GHYLz2umoGfsy8eN3EH1Je9tD8pfxM/cXaKtGxT/l
	7Nyxh/CLi+T3Jn6dwbLF5LTw7n412EZU482GmQYgoQwZ9JqyDD5jIdEMvPhiTtGdQzu92fvvhCk
	d7XLI+90qgwFhysELxktHdNYhgKkuVrTt9ti2kAzpPDE2HZTSl7ZL9FiJKbBVG9Cx8J3151bZus
	6hOsT9h/btrTQjI=.GRvUgDOFl0+jM12lvosh7xmt6J8QxSgzPyNkavxE3Uvlu1/SVQ1k/nuQlq
	mCF+blR9A4EE2JQwLXXHQwIIJlAstmVK/WmBg566Mp4aDK7GylY/rnYOHJhv5c2rHCT3yLWmzV1
	o7KPPoXXCdt7+3hlFOrbntX8hmhFW6tf1gRpOrXI5YvtAjwKxhwSFH3ogxu+X2PzTwKC6OahX4x
	oZExG3dO+oQqqkAzIux5oJssLtkW8BhWzGXz4D6XkhZ/sz1JD/N3PhfclvusZCC7pJlKDLFRK5Z
	vRssKwyxgknOUYxJ8f/KPEb2tTIeqYzt3KouH1kV+2IY+d+Nll1j/t3hQcg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721130880;
	bh=NBUnKggH2eN8Xxe9CsqKHNMLJTF1hB7t8r1yElnZknk=; l=378;
	h=Date:From:To;
	b=CKambLYg0UNpIxULNVEAfraPqC/ETAkhRf3617fKsAa+JeLdcFKF2KkELVWxel3MN
	 RHTBFByJpf+F1fu4H/xEtTURUK7rd9j28VX74xqq9VXRFs6QlCsB2rV+t83R70G0ex
	 hSDUq2mYaunhx+0CKNZW9ez6Prq8Tjp+05P7ooe/Oo3lrbgM4j9zBsna1xjwG/tddU
	 lApHyEBCcHGdpkPomv4JQHUvQYszEQ5OdKLXrr8ZRoAXkZUjmHinFvDkD3ZeOHG7oc
	 A+jzxAxdPHNv5eUlU3/03rPP+24LifIZKfSjwj9CCbFFm3wmuUkaSWuqLxZX/iQz9u
	 7l3lSRCD90jHg==

On 08.07.24 11:27, David Woodhouse wrote:
> +
> +	/*
> +	 * Time according to time_type field above.
> +	 */
> +	uint64_t time_sec;		/* Seconds since time_type epoch */
> +	uint64_t time_frac_sec;		/* (seconds >> 64) */
> +	uint64_t time_esterror_picosec;	/* (± picoseconds) */
> +	uint64_t time_maxerror_picosec;	/* (± picoseconds) */

Is this unsigned or signed?

