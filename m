Return-Path: <linux-rtc+bounces-5212-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67265C1A798
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 14:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB40B358F9B
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 13:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617CB29AB11;
	Wed, 29 Oct 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B25VngXb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1128A731;
	Wed, 29 Oct 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742176; cv=fail; b=AEIQDNnmZo9whv5E+ozcZ9wrRvtn/2LF5XKUGkGoSYNMiTy2U5XA+QRQhgcT9/mA9OYqgc/Uhw0nx+Pg6nt4sULsaREI1fA409XJ+nrOFOHVYT0MiN1sGJiD4BbR6x/QG2JaKLrawOjF6pRHRPg7jP3vVe+j2V9QivCOBSGXCOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742176; c=relaxed/simple;
	bh=JCPECLE47e+JyuvTINJHvsdCs5fWX1ukQSTaY1d6VEE=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NiYKfR6kei8mV1jEwXA0X7LjocXaQVthT9LlSaQP5k1Zrzq397HjXPqCN+fw4VNE3fhoCtbrX1SP0WLsZaHpf/RVOSUzRuQkQMHJAQI8EJk8UyleRqh0Q9mkh/f7o+Zgtd8Kmz3g0PP1xJWd+bSgsdCkG48UKPArknDy6V1NHpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B25VngXb; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4zPMcH2/MIjc3M0HBGUBaB1BcJ/TUW9UTKk+5FKq344ieZOHmr0HZu5GcvWVfsdLOxJW65cQ3mqyMPdkaaExSlNbBsWCKns75Fu6+69Zlh0UbYrWcL7CoO0or8EJpGfTo7qvOVl0UWXFxUfxwtQlvY+kb+sqsZbbsJsScN+9yDh08vWuUuNXedSYmaojzLW7Yro+mN4SbqXHdB62rM5Oawk/O2qZHnVdi2uUaZf3stnKBOA3nAnehn4q8lg2WytXrfO2rsJS375Kv/kgv4K8jC0cIwHxhE6yqn9MqrPYsrcVQEDqKB9q3wB3Dg4qveVjji5WvLhMSzeJJAq1GRGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/gQxULquOOkkVS8IvaXWAF91vstEUih6k38ohcuiM8=;
 b=aWVp2wPClmh/3ODTKDerloVsa63bbwak2TcREv7rR37TFVsfa1dMSiKFheO10pE/QP3K67gjcAPUesrDaALmJueBDMqBCMG3IN5FzQ4E7Wb3Rme8LNoEv1ZdBqkMFV0UElSR7EWLj+ha3wLwh24o+mURDFuEn6RxmwK0474a/kxYRNYgxqg9i4PQjSglnhO54HV88vAovNQFN3a2FxVLvG8PlFCFl1pnac8PbvSADf6HwPQzsSyJkCVn1iSj9aAx/xNiOzg3GZ6NnJQQGPnYKYu7QqRU2vMTcFaCsm04TGUCRF4Dzz+sRCOwH95kAEEfY1+5ZERw1MEIoN3Oe3STqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/gQxULquOOkkVS8IvaXWAF91vstEUih6k38ohcuiM8=;
 b=B25VngXb4+bdvPnkHk/aeWGYElJUBBpeRwAttO4+nthrRLhuJmoW4e+qitwyerhU2kz4KeW51wx4JoFl9xtHnrX346x2H107O8w4swoep453STK6LnrUExd7+qZjzrrqaeHJHv9xQhkwpDwC6tFfIc1a2O82kAVilnIO8ZR6aK2x+zgSxbgTTTfz0FkvrmJ6CmFKjOvHky2tmwQBbtVCGWHEaZlv1Bd/eu6GQNHODhw6AwivwNp/U5zyjmf4O5SFltOS128S+nQkI0wvt9rB8jYotNS2WyjnpmQhNWcIMU4MboAqrrdAz3jGCdg0DQC8+a5QSzRW/MrlTMXzhZKwKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 29 Oct
 2025 12:49:29 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 12:49:29 +0000
Message-ID: <bd7d8771-e063-4f03-9b0f-bc6ad95adb3d@nvidia.com>
Date: Wed, 29 Oct 2025 12:49:24 +0000
User-Agent: Mozilla Thunderbird
From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v7 0/4] Add NVIDIA VRS RTC support
To: Shubhi Garg <shgarg@nvidia.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251007135738.487694-1-shgarg@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::30) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d2fec2-1c3c-4618-6bed-08de16e99982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXF2TWdxTHo3U2NkYW45ejlLYUNYNUNsSFdiWjlUYlBWR21xWlhxQ09CUkZu?=
 =?utf-8?B?VGdXdjBZcVQ0VVhxbTlHR3Jxc0h1YXVROVVYaXBqOTVWcWxpVjkxc2JRcjRW?=
 =?utf-8?B?NzRJQWlwTzg4YnN1UkJhSHdHRUdTTkNaUmoxb0ovRmQyS21sNHYxTUNWMWxR?=
 =?utf-8?B?bnlaS081Y1J6V0VNc3RmNVhlaVIyTExrZ3lhdk5NZVFSdHdZUEdMckc1ZWVm?=
 =?utf-8?B?QkowUUFJNVY4TzRCbTlUcHR1aTA1WEZhb1pwOEt5YUVWRS80Yk1CNmRWV0pu?=
 =?utf-8?B?WFcvaDc2MG5ZU2lsTExadWUyOTlMRlNxbFdrWkdsdU44eStwNksvaHRoeEt6?=
 =?utf-8?B?TkowaGVvTXorY2tmcVgxa2x1Q2lDKzVnUnEvdytobjBFYThPR1pYSkpxMFFp?=
 =?utf-8?B?RUwvaXM2TS9Hci9PZC9BcmpKZ0d6bXRnd1pGelpQM05pWEFuTHEvYS81TjFr?=
 =?utf-8?B?TEhoMWM4VVJtcnVLV3U0RUdEN0ljVDcwUVZyNFYxMUdXYjMzSGJuM2VZY0xs?=
 =?utf-8?B?SHpTOVdiRitFRk5oZmNFQWFyYlliZmpGYXVBNUZZYVVtc0hDa3BMZ2tpa2FB?=
 =?utf-8?B?SkRXUDFLbUp3Tk9FL3hRRHU5ME1SUldLbS9La3FadDBESk10RmZaZW5YSU5X?=
 =?utf-8?B?ZGE5VGlEU25SbjRsNWJxajh3WFNHWjRZY25iYnJTS051cUprL1ZFYm5sWWVl?=
 =?utf-8?B?T1JRVGFKZFBYRHFlSW5MWjNaTi9nRXNNaWtmR1dUT0NlZXVNbityUVU1S0pW?=
 =?utf-8?B?Nk9vRGFUZHRlUnQ5SzRPL1pDMW41M2F0NzRPRElnQVV6OTBBSk5jcGI2WXlW?=
 =?utf-8?B?QWNheVViR0haREZESFlUc2pNSzRqOGI5V0lVZDVSOTFXeTlNcGFVWldSeEJs?=
 =?utf-8?B?d3F1NGc0b1B5Ui9JQlp0QlZRZHpoTUdCS1cveXN5c1dSTW5uVXd0UHZORkFW?=
 =?utf-8?B?NUlpcEdmZGh5V0pMTm9uaUM4aTBOaTdHclNHTzlJZDlWY3d5SWQ4bWNNVVZp?=
 =?utf-8?B?RnZ0ZVp3MmdiWGhaQ3dGU1Z5R3hha0d4VlI4eWNNbnhFcWhGNkh5aGNoSS82?=
 =?utf-8?B?eXc1ZE5zRlhLbGdwOFJqZXVCcnBTK21DNERYSVVpWUFybTRqZVJjT0NwOFhz?=
 =?utf-8?B?T2NaOGx4TEF3aldrTmJYMnJ0ZVlEaWlTNjZORkhlS1VtRXlTVWhmN1hFdHRE?=
 =?utf-8?B?NjUwNnZsS3J1Tis5RjVGWStGUC9BNU8ybExlV1NydnRlaGNoV09pdVBUK3Jh?=
 =?utf-8?B?K3JUSnVOYXhUaXdOQ1FGVTZ4MldpRllyRklXOVJ6b3cram9SdURDZWJRR1VO?=
 =?utf-8?B?bnl0VEh4VnU3dGZ5Q0NnVVJibHRZTmk2dTh3alQxNjJ6RkRqYnd6VUNWNFZ4?=
 =?utf-8?B?U2tzVXRXR3docjZGSlg5UmFyNHRESDhCWE9XeTJwa2hwbERXNXdGTWhWZEFG?=
 =?utf-8?B?QlBVd05SQ1R6WEU0SjltWWlyZDJnUWRIckFCVUJBR2I3OHJ6L0hUcEZNZ0Vj?=
 =?utf-8?B?T2N2dElIWHdlalRPNWc5am5QYUZLNnQ4dnNOaE9SNS9URzBPaWNvZnNWa1cr?=
 =?utf-8?B?YTRxbHhvdG1tc2NjTzRzUVdSQjBWNjNYcThCRkp2WjM0eUczMDlmQSt2OXlo?=
 =?utf-8?B?a2tPUE9IQi81Z3RFamhtdnlyRVRTeGdHclRSaWdFQjIwUVBJdFBoOWsweWNN?=
 =?utf-8?B?RmF6U2t1ZTRVUFdEYUNwMEtIdGpiQkNTWEJnWGJjZDdQbmx5SjhvZkVNV2VP?=
 =?utf-8?B?MlNKQi9GOHhDenhFZ094QVd5amh5b05SZ3B5QTgxaTRRaVMwaDduSWtyeEYw?=
 =?utf-8?B?SGZGUktYRzV0N05oamVPNUVsUm5pVTh6NHRQTnk5U3htVi8wa1BnNzVVTitt?=
 =?utf-8?B?b1BOZVBEcjl5Tm5VRTRtd2x5cVlkL1FmZlVQSTdIQTIvcXdiZkJkcjNkVTFD?=
 =?utf-8?Q?26BvOvprMzQ3Z70Q0Rtdl18YrEqoALOs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxEMGhLQytBc00xVXRkd1l0dVF1dmNBRmRFazQ0WXRPN1pxS2VXK0VZTVRl?=
 =?utf-8?B?bTgrOGlWOGdQMVJsWDRaanQ5UHMxZHYwUC9UT29kZ2tQZzYzK2hOUUJXWUtF?=
 =?utf-8?B?ajBwUDdkdkZmdXhxNDJjSFhnSmt3dVovZ0lBc2U2Vk9tMHo4S2FtOG9OWEs3?=
 =?utf-8?B?cFZhT0YxYU9pNFZ3dlRvbHFjdVFsUm9paE9mWGoyZ1dmTHZOZlhxWnFNdEdQ?=
 =?utf-8?B?c1l3UkdOWUNpR3A5a0I0UU9JUWp3SUNQbm1Udlh3cHcrb3U4b1MybnFmNGQ0?=
 =?utf-8?B?d05VdEZRNFkyZlhZcGc0bCt3L3lxaHBvNUZvZUhXczNyZDJsRm51ZWFmK2VZ?=
 =?utf-8?B?QXdwcCt2SDJFclZKZGN0SEtBUTVSNnJHOEpJNWVuTlRmVThNZ2dzZ0NzYUxX?=
 =?utf-8?B?YUJnSVV6b2FPdThjY3NZYWNmQlNGT1dQbVFZalBIRWZwM2xEakJLeUlYeUxR?=
 =?utf-8?B?OCszK3RRUTBIaXhtQk9vY0k2K01kYk9jWUVhbXViVDJ1YktyVHEwYWpqeUlF?=
 =?utf-8?B?Mmg0cTdlTHRxcW12TlF4VG9MaDFOcXBjNFBvamo1WERnbzZkbTllSEIyUVRT?=
 =?utf-8?B?SnNYSjRHVS92dkF2RUthbHEyYnN3ZkdFMWpVNjZmczdwS2RKWTZLQ05DdlYx?=
 =?utf-8?B?dXAxMEc0S3RxVXBZTEJNcVVyWHNNN1FXUDNnVnJvUklvcm5FdzQxNmwzTzJn?=
 =?utf-8?B?Tm04d3FXV0FabTlVazJ0VDh5NzUvSHJUODBlZXBrYTRGbk1DZmYzdkVjY2xv?=
 =?utf-8?B?ZjROK1ppZjg5K1RQbWpqSGVHSDBMMWhVay9TNm5RMHExSzNhbm5ZMXg0NXhH?=
 =?utf-8?B?d0c5Uzh4dVFsN2NnRHpzYWsybHdrOTFIQS9jTmU0NFpWcDlLZmhWbkxsSHM4?=
 =?utf-8?B?SlhTUXpSM2pPbWFjVzBjSGI1eUs2KzRJUFBaTWxkM0xlNWRvWHJZQ1FuNVlM?=
 =?utf-8?B?V1pJYWttWUNITmhGbzJadDIvRW5MU1lUaVNIV281L3hLblBpZ2dMZ3MyS3pF?=
 =?utf-8?B?UDBsdTh4TzdSMnhPUEpOOGJxR29vcDZ2cUZ6YnpDTWlja1F4QnVFQXBNVG1p?=
 =?utf-8?B?WEZBTlVqenRjT3J3c1YwRWVPQy9Zam1PNGJwaEU0Z0x0YjhGVGFiT3kvblov?=
 =?utf-8?B?K3gzbGZKOG1RekE4TlJtTlFxN2JqUW5CVzF4MGRzRnlmR3Y5eWNVbHlWWm5s?=
 =?utf-8?B?OWgxT1lFWFJxSFBjelhMRzVrSm9QREtEMWJFNktwZXMxVURuNWVDRVEydG91?=
 =?utf-8?B?WlhPSWdmeHJRY1EyTlIzcmZ6clN3Y1NKTVBXYWY5UkhIZjF5SFRhNjh4c1VZ?=
 =?utf-8?B?M2RGMENpY2NTNmYvUWhpNlZMM2JXSWxLWGl4NXlGWFpPYzJ4VFN4bVJVOEtn?=
 =?utf-8?B?ZGh2SW42Qm9QOFFpb0J6Vm9FRmtrSUtJdHRqMkJmUlR3T0FnS2ZUcUowblNR?=
 =?utf-8?B?Uy9aei9ndWpISDNEaU55YUs0SUtWMW52Uyt0dUw0akdYSmdqbUNNL0Y0akox?=
 =?utf-8?B?eThyYnFYd2s3VWpWdEhXMlJXL2UzRXlHMVYydkQ5U2lMOUZzNFVwVjFFZDJi?=
 =?utf-8?B?ZHdwbXNjbDNjUy9FNE9kU3VBQkVvYW5xWUEzc0pVU2VQSEtkbkhZOXpKWFNO?=
 =?utf-8?B?UlFYbVlVdnQ1UDZPVmlFS3VLcmtnY0tBRXZWakpUNFRFYkNMc0ZONTltQ3BJ?=
 =?utf-8?B?UkJZNW9lU3BnUTFDTTZVTXdhdHI4SjlhMFlYbXVKLzc1VVJvczhnY1VWckxL?=
 =?utf-8?B?UzMrRjVETitPZDUvWlJ4RTBkVlEwWUxKaVJxWmpyZFpsWUdKdTBMdmc2ZTZD?=
 =?utf-8?B?QnFVMWdKdGczT05pVEFxWENOZksxTllBUHQ0dm1uc3R0d212cFBDMEtNSWNJ?=
 =?utf-8?B?UWs2OFdxWjA0cTI1Y3p1MTRwNisySlhwS2Zxc1ozZm91cjRJVWsrNVgwQVdO?=
 =?utf-8?B?NDBLMXJRamhYTlM0RjNaaGg0dHV1TjgzWFc1bElLMi9ndWo3MjlUV0xLcDBj?=
 =?utf-8?B?ODJHRVVpcXN1RU95dEx6Z1FyMlBLc2p1Z2Y3K2tyanpiRk1lb1Vpa25BMGIr?=
 =?utf-8?B?ZFNOSUdhYURxd3BMOUhHZ0tBNGljZEJnY0dqN2JqZnF0R0FyTS9WYUJ5TGUz?=
 =?utf-8?B?MUc1YXhoY00rcmpLUVQwU1o4MVJvRVFHbnA3bXBQTnRZQVJaUXRLOGU4TGFO?=
 =?utf-8?Q?r+WykdmrwLJ5+Fy0gzORboNoYjpJRrPEcW97ekDx3CQu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d2fec2-1c3c-4618-6bed-08de16e99982
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 12:49:29.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg+cOpZVDk0N6H2RgirwEeAk/tYScC0SADSY0p6NSRE70fv5H58jOkSOp63Q+mnPuDlL1D1/TOL6pkA+MGAznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666


On 07/10/2025 14:57, Shubhi Garg wrote:
> This patch series adds support for NVIDIA's Voltage Regulator Specification
> (VRS) RTC device. It provides following features:
> - read/set system time
> - 32kHz clock support with backup battery input to retain system time
>    across boot
> - alarm functionality to wake system from suspend and shutdown state
> 
> The series includes:
> - Device tree bindings for the VRS RTC
> - VRS device tree nodes for NVIDIA platforms
> - VRS RTC device driver
> - Configuration updates to enable the driver


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


