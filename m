Return-Path: <linux-rtc+bounces-5495-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A8C964CE
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 10:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC9964E10A3
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EFD2FBE01;
	Mon,  1 Dec 2025 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A+e8lQmX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353412F6908;
	Mon,  1 Dec 2025 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764579652; cv=fail; b=oI3sab9waFSMtsXqnXPMZwyL8dRfkINZJhEAEuwWTgV/N16JqExczYtu+7wkYCRpKo5jjx1UvMQVugIMbU9vhMWsoLqe7U8IOFRkJMiGfAUC4em0KYkBJV4gvRHdBItDHeufV+JldbCTrBeSFnQAUl8zCGla6grIWlzR0N96B0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764579652; c=relaxed/simple;
	bh=sD6TZlsgF3x16Q1XQLZEdftW32agfQ9Jp1a35JbckBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sgn+U7ookJ5vEkykgkM2H57G91xJZN+IfXuzAbyzXuoI6CNCls7x/ql25fYnRgopfvzu4Jqp6UaWd8ygc1fI354ysHT710tFIFpX+5oPPDRn8ET/pDBmJKW++TnXZzUnJPO4uiMhMudjoUSeYrRhE4Z3qBzxBnoN4RWnzjaapyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A+e8lQmX; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4GouFNheC+0GmjpPSS2mt52YRbdfggp/t7SQ3ZxxGvumpfFmV3GEvhPBNqYU1p/rmQfPfmsLaPJeM5IiOUdhbuHuywAgM5AQsIqOqfYne5DCOeoaLPviqaRrfgNnodM1gcYMvrl4bFjg5fu2Su+vRruLTHhRuzC+/27Xb5T9TTE1XvpSHJKGw4vqWIA2hXL7cq/kksJNhG3SJxP8pfZB9sKAaY19ZZ1GIfoNEtHc8M5LUlu7Of5aRsDLxN4QrUbPVXs+l//YDjTmWqcEu6Yvwr3gRRahygvhaSmnE5IkXBmV+Px/i6e0hiQ98b7qBg4+pKKZGYHyAswIUaCAW8t9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+VKTBjb/ssO664NTYm5hIrB5mKf8gtbVKrWDTUGbnQ=;
 b=UmLrkysz8FhkfteYAYlUhbxXF1GociKxtlb7DhRwSJWl4w15N2iW+O4iJVNO9Ki/AcITp+A4HaW8lxbviRUfUohYlgTwl3X7aN66Y/979yGTo8fiqjTEDSNa513HUykQbtbpKGul6LxY/7uJsatReVpBfgdfirQjb6y0Ats9DYDkZRFUZqIyHOtGVvonWHqyjPrbHMHQ5AjKXS09rT5ZMeAiFtRXoI+xbjqjckpbo3dx8U3S9cBJNPjf7mUHN5SstShSWXXFJ1Lpc2s/aOw/nGspgMeg0sZbAqKJyEt4bxkB+/IWB2kwc9uBL+08IA0Vdj8RxDRje6XQPMsKYe925w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+VKTBjb/ssO664NTYm5hIrB5mKf8gtbVKrWDTUGbnQ=;
 b=A+e8lQmX+JmYhYt3ZMMJqBIHYN67DdFEu0ntjI4Sge8PkbGdWB/wO2iEO3HjgElUuCXJTkZq8uyW0Khw/wN3WUx57KT+3uQlbmtkfJ4v2TXX7rAffioI8ELNarA2AkXGWUutEECFDdorE95W++EM49L1JpGKyaz2GbMeV1K1aLXu6umBUiYP4H6bd6wOSYblq4cbdkCz9C3F2j9l2sHJTKoSGDoSDa444N7SNG6P/SEqiDKtUlN5+d7cN6/2tfTGOAsOv+jEV7m6ctJrasr/53fM8J7vZR0inQT80siFpU/BE0xkbpLODKhCxG9bPlQNfidz+OOf1z6Kif8C5IR4nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Mon, 1 Dec
 2025 09:00:46 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:00:46 +0000
Message-ID: <ba0d1782-68e1-4211-bfe2-f8d63f95deb5@nvidia.com>
Date: Mon, 1 Dec 2025 14:30:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
To: Jon Hunter <jonathanh@nvidia.com>, Lukas Bulwahn <lbulwahn@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
 <42ce1ab1-8334-4dd4-8301-1ae84a7786b6@nvidia.com>
Content-Language: en-US
From: Shubhi Garg <shgarg@nvidia.com>
In-Reply-To: <42ce1ab1-8334-4dd4-8301-1ae84a7786b6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6e0347-345d-4b1d-d0ce-08de30b81dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1d6dEdCRHMyUXpVTS9rbWE5aFhFa3EvRUljVDNkTmlWc0hLWWxBQnI4R2pt?=
 =?utf-8?B?VUhXR0U2TmVlQUtEZTI2M0o5QU9STGdpQUJ2UUQya2t5THlkaGI4dlVqREto?=
 =?utf-8?B?OUg4TVptcTZJa05xSDZUZnJQaEVYV0xkWE5HeUFzbE5mK0VCN2NVcjVuS29C?=
 =?utf-8?B?eEIrQkRtcUZFRDZ6NnpGN2FaN3haYUd4ckR6TytWeitSWmw2anJ4NERLQlNL?=
 =?utf-8?B?d05aWWFVUExualh5Q0JkNHNPQ2w4bDByRStkNCt1SzJGQlZjeWV2bFhZNXI2?=
 =?utf-8?B?YWdWVGdjOCt0QzFCYmxEeVVzY2IvUlVDTFk1Njl4V2ZINlZ4WlB4bC9hU2Fx?=
 =?utf-8?B?aDgycGFLTjdVaWZNYTVGMjFQVkNoTDNSYTZUVlphZ0lJVS81aFRSUjA1bGdV?=
 =?utf-8?B?Q0ZOSVJDcjJaTysvTFJ1QkFrMmZOTXRjcDBMcU8rODFHdnUrY1pVMkNOUWox?=
 =?utf-8?B?RERJNjlidFo5TkZiditHK1hNR2lkdEFIZWY4Y2w1bkNiL3IyOVFvWGwvK090?=
 =?utf-8?B?RnhFU0p0dWU2NGZFMS9aNi93Mjduclo1enBTT0FLVVpFbTBFd2M0bXdJNnB2?=
 =?utf-8?B?cVdqS043WGZVd0RvUGdHNlQva084TTFzM3Q1V0RweUpRYVZxc3o5S1Nqa1Fm?=
 =?utf-8?B?N2ZlVUNSVk9mY1R4Qkp2YTRaU3BPUGtYUEJTbTFzUFBYRnZpQmhqZSthbXZO?=
 =?utf-8?B?eUpRM2ZJME1jNkRqaGZZYVMwZTVaZTVKdmI1eFZCWkE4akRSWXN1UXVyekxx?=
 =?utf-8?B?bE9XRnlvMU1YL3F1dWxZa3VpSjJ2TEo2RHZIRXh1Z2w4RWlhOWhQdnRCSjJL?=
 =?utf-8?B?NHB1dVdLSlZ1YkVtWDdCZnVZU3ZCZUd5SHVOWm40YzFxTkZkL0d0djloQnhB?=
 =?utf-8?B?Z3BMYlVneVNrZGtuL1YwT1hLVmcwUFdBYVpPZmJsTmxmQy9YTE9BV25ydEMz?=
 =?utf-8?B?QnNYZE9ZWndqRlJrYU42cTVKcGxGRDVuYUNCeEJnL1dDSEk3ZngvcjVjSG1D?=
 =?utf-8?B?b25FVXl4OFJhcFdIeUk1eGt6ckpESExDNHZzdFBwZmE2bGtOa2VBZmZ5c0Nl?=
 =?utf-8?B?aDJ4TUxuSFBrdy8xWTR1dUVINFNZUzFnSDg1em10S243ZlR3eTZKc2poYnZK?=
 =?utf-8?B?cGFXRG92ZTZXVHhQaFpMWEFwRjluZjV5KzYwSVU4Q1lWeDMzS05RQ1pGUnhB?=
 =?utf-8?B?RzFFWW9FWi9MNEM3ZDlhZEZHUlRqNzNzOEJrZnZHaHYyMkxnUjcybjlNV2h0?=
 =?utf-8?B?Y1RsS2QvODZvYUswU25HRmxEamxXVWF5ZEd1UFNIQ0pQVko2UURrRHRIUC9R?=
 =?utf-8?B?Z1BYSk1kK2dJZFFrZUo3Z0k1bUNsVHFyRDBtcVljdzYwMktLbG1kV3FsQktV?=
 =?utf-8?B?RktCbjVQa3FQVCtqcTUxV0hLUFNIemtPaWZaQzJoVTVrd3BTT3VhMUt0bGR3?=
 =?utf-8?B?UEpSVHZIZEdwZHZLb2N0MVc5TytMdkphdTZYNHo5NEt3c01GUGx1dXRlL3Z0?=
 =?utf-8?B?YitZRm5jZVVyK2FNMzA2YWNCczMrdmkyWktMVUJBRHozOVArZFpoenJTQUhH?=
 =?utf-8?B?T2dGYzB2aVJiWXZUeXgyeW5CcWZsOGFwMW9PbDcxbW9rYUdYd0xPeW8vN3VT?=
 =?utf-8?B?a2xOTi9EMCtlTlVaNmJMWDlza0VhdlRqSDg0K0RpUXNkSllTMTk3MFBFcWJW?=
 =?utf-8?B?b0tDSll5OXlBK2tZajI3VlJZaWRCaVhldlFRUDhWWlM2YUFzZG4rcU5sc2pI?=
 =?utf-8?B?UGQwQTVUSTZuZ2hoeHJURnIrREpPNzhNQ09BamJOMDZpU1B2STZaM2N4eExT?=
 =?utf-8?B?a09pcFUvd0E2TFRkK3IzOEFMMk82RmQzSkVwSUZvTmlxZVVhRlhpQk9yV3U1?=
 =?utf-8?B?ME1Od2phUGozRjJyeDVOL1pEQ2xWOGlyQW54NjRoMHRtU25lTGhaOXh1NUxy?=
 =?utf-8?Q?kqbCGXSCrJICCrDn4/R2swlI9B5tCJif?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkdvaDFYTUVpUk9xVXlZc1ZPb25mWGh2K1Z5SGxKM3RSRUZjSTh4b0VhYnpZ?=
 =?utf-8?B?UjRQUTFGd0ExVGR1WFp2TVg2c0R1OEFJai91NGVsd2VXTEN4NHBObVNTV2xr?=
 =?utf-8?B?cmdoMVU2MldtNzkxY080aDI2UDR6Z2JISXcxNkQxZVptU054V25qaTBidEk3?=
 =?utf-8?B?T2taMkJ2cE5zT3cyWnRCWll4dCsxekZ3MTV1VlhISER4M1pPL1JlZXZ0Wmps?=
 =?utf-8?B?c2JMS29jNWdxTWN3Q1duaklSMTVkdktOYWpIOUtqQkg5dkUxY3pDRUsvdDlt?=
 =?utf-8?B?OWttZElSdm5seTgySitHcUVLTHY5TVRmeHFnTVBpYVpoNWlnaUFhUXFRVGox?=
 =?utf-8?B?RlJhVVgzclpVRkR5WTNueS85RW9XTGsvTnhDU0NKRkNrUUYyN1RwWHE3RHZZ?=
 =?utf-8?B?K2NnUXZpeC9rdkJjSTkxcWpOMldUdHFpUVNJbEtYdkdJTHJ4Y1VIM3lLV3FJ?=
 =?utf-8?B?bVo3cHZMNnFQYUl2SkJDOW5Qc2VZS2pxbVFLdDN2SDhvU3l0dUR3bXFBMDRt?=
 =?utf-8?B?MGhRSjJLSkRNNFRqTnRadmZ3ZGVGUTFYMCtnZU40NUl4R2NxYVkwMEt3aDEw?=
 =?utf-8?B?TE5TWWFkWXF1a0cxTGMxL0dmZjA2MDE5a1cvd0hMS1RxZ1JVZDZlYTVLZXFz?=
 =?utf-8?B?ZUpQUWJoN0xhOUhrdGFCM1c4V0JOZEMzbkZ0NW1pVk1xSTJzckM0ZXNNaFpx?=
 =?utf-8?B?enVuY1Y5dFlWU3lRbGNLL0hoMUZHdHJrSDJmSTR4UHZnTWUzZ1B0WXdzYlov?=
 =?utf-8?B?QXFCZnRqUS9FdE1TUXJML054VUlFdHFCUlZwSkcxTFBLK1hYVWFrQkswdVk3?=
 =?utf-8?B?YmQ2cU9oNjg3VEhVMThtcCtsUTJZZHpmSHN0S1RWMmxhRWNRMXREblVweUlT?=
 =?utf-8?B?MWlYT2RWWSt6QUhYZXNhUUF6ekhTK3lSVTBnWlNYYStVVXAydStKSCtTZlND?=
 =?utf-8?B?a2VTWHJlOFBKNjVrYko1V3NmY3hKWXRzZ0UzWUhScDFoTE9qaEplVWVXRUFn?=
 =?utf-8?B?QVBubUlmUmMxb2RjSVhoVFNxbkF1cHByOWdVMTJxMG11T2lxeWZ0UWZjUllU?=
 =?utf-8?B?T2gwd3cwcVlQOUMxazRWU2w0NGZHM1QxbGJaZVVINnlOM295UWFrNXd3cnJa?=
 =?utf-8?B?SUcwOTc1NkY4dEl3UCtiWTI1MUZPMXcybjVPVmRoM1NZSVkwenRmTm9obnNU?=
 =?utf-8?B?cjFhYlcxYkg4VzVsUnA4N1BKL1ZZTGNqV3RvOFR5ODlzdDZyTlRKQnpyMnpE?=
 =?utf-8?B?cjd4ZWZsWkkwbnplQlF3UEt5UUUvWm42bVBxTXBhU09jUTFZaFR0eC9ZQlUr?=
 =?utf-8?B?NWY1QmlqU0k2Q1NBQWl2ZS9mVG5IZUJ6RngydTBFL3BlMFhkWjQ3ZkJ2bEFL?=
 =?utf-8?B?emxNcFZwMFBnMXhpRHFIMjJ2TW45NHEvUHZoNEJLVk9pSDF2dEtBWk5kR1FL?=
 =?utf-8?B?RFNDWTVIVUNVQ0NVWDBEbTZTRU05UDlBZVNiWitHSUhVODRjakkyTWZjaXU1?=
 =?utf-8?B?Tk5pRVRhTGRlblVIQW5LanNJOVhFemtvNHRGc2tpUHk2d3BjRTdaK01GVGVu?=
 =?utf-8?B?a0V3c2k3T0lEbFJkT0tpY00wa2tLekZ2ZkExdzF0MitsY1NRTEYrc0F2YjFz?=
 =?utf-8?B?N1lWdjlvMFBCVXk0RUZRM0RjVDh6dEFGb0FlL3hkL1c2NEhmOXJDejhxZWUw?=
 =?utf-8?B?YWtWbWRUQkQwL1RmOGxQdHNrUXBEWFBIL1ViQWIrbG1MdVV6cjQvR2lKUHlZ?=
 =?utf-8?B?TVBMQUJ1S3VCWjdqdmlHWlVWZlg2VStScHFQNVJkaExBUzRBQ01TQmFnNU95?=
 =?utf-8?B?RmVZNnlIU01hamtTL21jZWdralE5bHRVSllNNUVRRXZVdjRWcmhyb1hvQm1G?=
 =?utf-8?B?NEdpZ2pmTnN6VXNhUlA2VlFNcUl1ZDRxM1ZpVFI1MmNPSFc5Q3NrNWxOQ3Qy?=
 =?utf-8?B?VkdzQ1RLV2puRDRia3lwVkxvenZ6QzUxc0VtMWJQQmZwNTNYTTIxeVBjRy8r?=
 =?utf-8?B?RUc0MWJxaG1xeXlTRWJmQnQ2Rzh2MzR4YkgyZFNkdkRTVTFRRzUrdXFTQTJy?=
 =?utf-8?B?dVhDYXJlQUR5NnNvZWZ3eFJvaEN0TmhRNnpybHRjdkZOWVpVRUR1ckRlVGVo?=
 =?utf-8?Q?jXqvp4lJeCqYayO1raTD0sPIA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6e0347-345d-4b1d-d0ce-08de30b81dbb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:00:46.5221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZTbmzQoEuecttcJ91xy1/3EDSpQcl+TUKJDuTWoaXY7PMxE967GaYVbjpr1K7uZaqG5/xGmzoQQbFrmLgPu5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792



On 10/11/25 5:17 pm, Jon Hunter wrote:
> 
> On 10/11/2025 07:35, Lukas Bulwahn wrote:
>> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>>
>> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
>> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
>> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
>>
>> Note, with the changes of v6 to v7 of the patch series adding the driver,
>> the content of this include file was moved into the driver file, and the
>> include file was dropped from that patch. It was simply missed to adjust
>> the section in MAINTAINERS that was newly added with that patch.
>>
>> Drop the file entry to this non-existing file accordingly now.
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>> ---
>>   MAINTAINERS | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2a881629003c..b2b55947efef 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18586,7 +18586,6 @@ L:    linux-tegra@vger.kernel.org
>>   S:    Maintained
>>   F:    Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
>>   F:    drivers/rtc/rtc-nvidia-vrs10.c
>> -F:    include/linux/rtc/rtc-nvidia-vrs10.h
>>   NVIDIA WMI EC BACKLIGHT DRIVER
>>   M:    Daniel Dadap <ddadap@nvidia.com>
> 
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Thanks!
> Jon
> 

Reviewed-by: Shubhi Garg <shgarg@nvidia.com>

-- 
Regards,
Shubhi


