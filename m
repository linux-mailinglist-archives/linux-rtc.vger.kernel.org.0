Return-Path: <linux-rtc+bounces-3408-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4AA50315
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 16:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B00DA163777
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 14:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDF3248863;
	Wed,  5 Mar 2025 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PvgaqO1z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762C24A067
	for <linux-rtc@vger.kernel.org>; Wed,  5 Mar 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186798; cv=fail; b=CsfkvrLRWoomTO6UJ7qHn2LH2zqrKFcBRQLXWIJQyHC8gGripkhKoT7NgOHJwFNn1qz29+2nvqcyrJ5rct8mNpjJHFo8u0EkQqHSRyp6k88csQiQdk2QKihvsoa350hIR8emIUMo7zoMrQ5sCgR0wka4fAQspcbu3aeHVGO+Eec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186798; c=relaxed/simple;
	bh=ZaoJK/cMJOkHq7tF18oKMGzi1KoDuqeIMAvevk8IoVc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BmeXE/S6in6hVCYzorx0iZeqAaSo73392ASHNiWkRZucMTPbcZJ/44AtMyGvVvx0aYin0myGxN5K8iEATz75F8MXoYq+KrzKXK6EYQrB6N8DyEkS0VLHFIlQYpekZ3ffoGcEwznWoX6DFBprkSokpu2GE5mhDojYXofjhYsNHCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PvgaqO1z; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFiuNacdruyj2Fb6MgIO7FkKrc3MszY8iMuHVAjclkKChnG/dlvLUMZ2/7StqAscWerKtyPJ6skB86bBGc8AQ7U89JchCbDOa5AOULH2DG8YMN56CEe2jMbTKJrVCsQxc+88ouncpVNHdwBdaSAuYQvikNIqLre6hfsKqrWgTzXZfYO/jSagmf29awRmH/X9Jn7qCjPUI+PiPY62UQhzrvqfriAom18eultnlgB5PDJUO+PdcLlYZ7TYAS2C8kg818WY2ycM0L0yt21WwDyk9KX7h2A7SqUUgsrXJ3ZnlUGxrSxwFBU3nJmn/j1yFofIsg6WkeDdl+ea5i37hElzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+2hozVkS2CkLm/aGUDxwc60drxVlPZJFCGLIDJPf74=;
 b=B3xSwIBPDllbpg8av5BEIXa3Braflw7Wsc2l+z/CIrSaWRMexqmJcW+ycy8SrYiEEfsYaDrlmQi/rABDMa8kZE4LLD9is0/c4FCfGY7E9UruBvSGAqkYd64qTFxZKim62jaQpG3fHNH4tDenI6c+rSarcBbgppz4CUsa6fiJv+TrHALgVXqJ9Yol6zxh1oFmwcsnImbQKKOILZkJ/3IYW0tYfEiiwaBNVX0x00BWtOFsqZd+xvl8HRfsRd5gglv21lGpT3K/LsfQdqmpH+u/Fq+GOeTGZGqvRzsjfFtUbjNIAMOInKGlFvi/l8F6UPHNhOTE4+0YZuLkbwR4ZONMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+2hozVkS2CkLm/aGUDxwc60drxVlPZJFCGLIDJPf74=;
 b=PvgaqO1z3w5NxobU9TAkke7GRIjmUutMOUtRa3kBx/iuhlyWDHQv4CQh786Xj3kENo+TjwuDpPQRQDzswZLIniX0eC/uUUIB+YjHy7KqaWs6qWCN74IXx1oZemxDje9h6QNZDDcE7ZLwnZxvUZe2Hxy6dbeWgmDNjnV8kl2VPW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 14:59:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 14:59:53 +0000
Message-ID: <b66f43d9-7e98-408b-9123-6689d48a642d@amd.com>
Date: Wed, 5 Mar 2025 08:59:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: LTP rtc01 RTC alarm test fails
To: samasth.norway.ananda@oracle.com, rafael.j.wysocki@intel.com,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
 <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
 <75a1d5d2-8ec7-4496-8c24-2815bb6414e5@oracle.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <75a1d5d2-8ec7-4496-8c24-2815bb6414e5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0180.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a1a193-5568-4207-c024-08dd5bf662e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjR6dnlkbUNTa092QnBwQjJ6Q0l2bWVSUGJ3NElYTUNZeWNMRjE0a05ZWFFN?=
 =?utf-8?B?Slh4Y3NXZ1RsaFNnL01yOGlmZlVMMXQ2UXZ3K2pJQjV6OE5nUFYycnJnOUMv?=
 =?utf-8?B?OHJaQjltTWJ0YzFWYmxWV1dxblUycUQ3eFlIMFp2bFpINExWczFoalhPejdJ?=
 =?utf-8?B?RHR3S0xDZkszVTduRm9UQW9WMDhob0lYTWNnZTlnanM2K3cxRHZtVU9Wa0lp?=
 =?utf-8?B?N2hlNGRaNU9XdThWRUoxZTZBMm1tM20yNm9LSFNRaXYyU21hdDBjMUJKcVhr?=
 =?utf-8?B?WWhtSUh2ZUtxbi83QkVRR1JaSHQvbDhjSVNQL1Q4b3Yva2JwNFlpb1BWVTc0?=
 =?utf-8?B?YzI3dkp5K25sL1dObjN6dkZXbW5jbFdPdW5vaFRLdDVsMnQrQmRCNmxLMTFj?=
 =?utf-8?B?NGZNcmRidURqMVpucVBOY29UakJaSHdPaE9uaEdFOUgrSFNQT3VDT2F5ZEFi?=
 =?utf-8?B?RTA0bys1M3ZKdTZiS2Zydk0vbXhxajBnSTBrR3lETmlxRlBtNC9xYWltb0Jk?=
 =?utf-8?B?RCtad0d0ZkVtMWtqc2NLU1UzeitCVlVLY2F3cHFGNWVzUDY2VEZkZEhaMWt4?=
 =?utf-8?B?dUZLT0NGTzhPT1ZiZTFyRGRxMkNTSnQrdURINW9oS0dHTCtON0xkMGwycHZZ?=
 =?utf-8?B?UUdwWERGRDF1alY5ZldyWUJvSkNhMmR1UzV6YVc4U0tkVDR0dmpmcldXTWFt?=
 =?utf-8?B?cGtrWUdMV2t6SHk5YTZ0SG13cGcxUjZIMFhSSjFZcmNvRWg1VTZSaU55b0kw?=
 =?utf-8?B?aEZqM1UrYkhBQWM1ZHUvMnlkZXFuUWJJUFhhYlJCVWRGMFdER2FpdXhrTW13?=
 =?utf-8?B?REhtejk5MlV2YmpOeUc0STJOaHJRbmJEZ0Y0azhzVTRsMld4ajQxRGUydFpN?=
 =?utf-8?B?aFF3eDdTdXlPZTZYL3RvVmFDYVpjT0NENThneVc4dkRYQzNIMjEweVpXVk14?=
 =?utf-8?B?UWNySXN2a29KZFo3d1FxMkdHNHFQS3Y2d0FiYmpEeWtJR2JPNXdWUzFBNmQ3?=
 =?utf-8?B?WWhVbThibWNoY0syTXFLdFYvVXNWYk1SVFNqcmNGQ2FUQzVjTlVYY3RubDZr?=
 =?utf-8?B?SmVEY2hZQlN4UlJrenI3cjRQTW55eURlTmpzeWNneHl5USsxNVA4TldSdnRT?=
 =?utf-8?B?RVNHVTI5TjJxTWd2eVJ5Wk1weFJNWUFtMEdkQ0YzVFB0Uk5kS3J0c1dQWjBz?=
 =?utf-8?B?UmttbUdrVlRvaEJTdCtsaUJCL1FvazZQYWVLZlNBODR3NkdXVGlrMWlhME84?=
 =?utf-8?B?SWJZa0VvZGxWWkc4UGNoYjEzdXZrMTJCM3VGRUJrSmdjc1RIb1pQZUNRYWhL?=
 =?utf-8?B?ZzRCSGo3ZnRJY2dXWExiLytac0pGajl3WFg5QlBLb2tJMVdmTDJVWHBVZnAr?=
 =?utf-8?B?OW8vZEd0WmxTR2FMeFpIK1BIUVVPcHJnUk14MzE5UmhZdThUOWRwTWVjc0dG?=
 =?utf-8?B?LzVNYklUWXcrR3o2SGlGbkdPVlZiR1pOREdGNFREZkFRTU5Iai9Jd2JCekNW?=
 =?utf-8?B?UGhDWDJoRGVwazdQemk2OGRjelJkNTFrWDZXRXV2d2w5dlRDUnlzWHc5Tm02?=
 =?utf-8?B?cDRQUUFEaW1CbnBneUhWLytuQ1dYSUVFRGJtTGRBcm4wd0FoQk9pbm00Z1J4?=
 =?utf-8?B?M3kvUHBYVzQva3hJLzFTb2xicEVSTENaOGgvOVpvMFhYejdkakdRbEIxUTI4?=
 =?utf-8?B?WHFYamdyK2lpUlBXQi9FY2dxZWtVdG5nYlFrb29McUsrcnAvbisybjhNTFVV?=
 =?utf-8?B?byt5M0JzdDlTUXpNd2VvM29WLzFXRVNOaUVnZGxLUG5QZnhyRWd0S2ZuYXp2?=
 =?utf-8?B?ZElHRW9PL0trNjV4RGgwRHNUZURHa0NPZXhTRG1yQ1NlQ2NxSDZhQWFJRXJq?=
 =?utf-8?Q?E27OKwlozNCg8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWNQajJ3NGZBQVF1UlAzUzdMT2NWbVl3aUcvNHZCRlRLbm5ESjl6SmpOYUds?=
 =?utf-8?B?L2EyOFNGWklCbHJpdkpFOTUyQnFMbDNoeGFYMDNvZ2twdzhWdEZhT3JqdWpw?=
 =?utf-8?B?eVRBRWh3aFVaYmRydVRBQUloRXc2OENnaFVPYVlNaFBvcHgzamorQnZFOStJ?=
 =?utf-8?B?allWVU9hK09ybTg1TnBhbGJrSVRadzEyL1EwN1I4STlsaUwzTk1naW9vTW4w?=
 =?utf-8?B?N0wrR2xaSW9wdnRYU1lNZUlPcTNRVXBZVTRzOEFGbkdXMTlQWVRZT0pwWStk?=
 =?utf-8?B?dlljckNwOG5DcGgrbkoxRHhTMUZiTlNTOG03UGt0aG12NGt4Q1VYTit6YnZM?=
 =?utf-8?B?SDJxT1pKWmZqOEpQRm0yeWFROXZRQnlyMStaYzBVMm10NDIxamFXWmZrTVJ5?=
 =?utf-8?B?WG4zQjFrdmFuMm5wWGpVZFpIQm5VVm0rOXczOTE3OEdjWFZ5eXg2MWh1KzlC?=
 =?utf-8?B?bjVQQm4yRmVoOHRFUEpBNTNCa2FxNm5HUTVIUVFDdk5mT1ZDaHhmT20rdExZ?=
 =?utf-8?B?SVp4NGVEak5BaGlGZkdwUzBmeDRLemZ4YkZnK2J6ZndRcW1yYWsvN3Y1azlZ?=
 =?utf-8?B?QTIyS2JDTXhlN3BLMXlmUStOMW1KeXNqd3FEMTZQRktJLzdDajZnV3B5cURz?=
 =?utf-8?B?YmQzYXZmaXp1YzdxajlYb2s1Q1VscGZKT3VsY2h3ajFoKzR3QXR4VUhhYi9M?=
 =?utf-8?B?Q1NpUDJLeDBEZHB3R0MxaTFpZWNSRmNHdVFTdkZFdW1mSk1RYXpPSnl6RVFO?=
 =?utf-8?B?QmwvTkhBK3NzL3lEK2J3cUY0Q0RQUCs2UnBzM0JyeXIzNVFFdUpTd1huUWJt?=
 =?utf-8?B?azdMZG0rNHd0UFFuSHo5MXhhQnlyNnR6V251SU40N0tJdWY1YTRMOG5qc29R?=
 =?utf-8?B?bFBtRGVJeUE2WlN4aTBDZzNodnJTN0p3RU15cWcxL3E4U2gwb2M0YTc0MGw4?=
 =?utf-8?B?YUVnMkF6SXdueXFTNHpLT2pJZ1F3RGRWb0EvT1k2VGVpc0tYZDFJUk9TY04y?=
 =?utf-8?B?U1BVM3VxYmtCY09ZMTl6Wmh3Z2Ywa0ZmTGQ1TFhLM3ZGUWhXT1NEOTZLRUVK?=
 =?utf-8?B?TUFmTHQ4ZWU1MkE4aVdXTlJRQ0lNZzNRcTJjUEEvVGR2eFdXSUdKRFpGWGYx?=
 =?utf-8?B?WlU0VEJ4NzlnL1JpVGhNRy9KWkpCd0RwcmkvMS90ZEpvYmlNQ2l6ZWNwN3NN?=
 =?utf-8?B?SWNZK3dwMHN2aC9leHF2dWpmaWJBUVE4UUZDM0o5a1Fhc3FQOFB1Mzd6Nk9x?=
 =?utf-8?B?TlBOeDR2WGN6TGsxN1BkRFpYZ3hFV3NiUkd5Z1ZvTEVPT1YwOXpVVy9CNm9o?=
 =?utf-8?B?RDB3LzZaZ3VOWnFTdUNLeW91dHZ3NU12Vkt5UnU3ci82NXdjTlh6VTgwaDRk?=
 =?utf-8?B?QXVpays4ZU5YNllXMHRtQ2hyVEZsb3dYZnk5dHcvV1BlYVc4S05Oc3pOODhJ?=
 =?utf-8?B?UlFyVW8zUGFhSDNaL0xHN2VuQjhlSkZFQzhWUzNac3haNEl0UzI3U1NvUUZ4?=
 =?utf-8?B?bHBwNm8wMHF4RHJCMmdjUTNHYTc3RGxZenEvYUl0ditEMDd0RUtSUzdoS2tJ?=
 =?utf-8?B?SXNRYm1uZDZreUt3b2lRWXUwaGg0R1FPaWZZb0tzNStrRFpqcnZFTVVIblZ4?=
 =?utf-8?B?eldhM3dLRXNqWW5XYTNVMnc3dUJxZGNNcXEzS2wzSnlsN2VVekI2ZHpIRWdu?=
 =?utf-8?B?TGRWL081SjVNZ0xxb0lmbEo1QWoxSWFlRmt4bHp1OW45OWpuaVU3eFNDQmp0?=
 =?utf-8?B?ZXRsVldpSW9xQmZjQUl3WWlEVWFxT09RQTFBUzgveGxUa2w1NDdiQlFOSndQ?=
 =?utf-8?B?VGNRM2I2cXhGalRNWFgvZXo0WEJ5Qi94cUQvT1ZyK01uZ29pdG5OUkpPR1U4?=
 =?utf-8?B?TVBUVHJuUFlpY0RyWm4xaGx4NldjMGtYNlN2TGpVdCtDb2IwMUlQMkxzd3JT?=
 =?utf-8?B?Y09EWWtNZVlFU0liazN6Rk50WU5hUFczYVMvcHNOWkllSHFNUEs5eDZhQjBW?=
 =?utf-8?B?anFZZHZ2Ny94MVZlSVpOYWdnME5rVHFHTjFZK3o2VUNtZ1pvaXdSUHpGaFpG?=
 =?utf-8?B?K040NHFYdHI3eGkxUCtvNWNWeE55SU5LNDlpQ2JXdUNFdk1RTjZaQWw2Uk5j?=
 =?utf-8?Q?su5LisTXQiesAf8hNsTUdCG6U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a1a193-5568-4207-c024-08dd5bf662e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:59:53.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt1aBsIDsyG3LKy2CpBJ2TpOlBIY8JTh/bDgAj7TbOqe6PMQdzK/FXK5HiLWcxMAc5JeH8sV2IsEE/aDjsd7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146

On 3/4/2025 23:24, samasth.norway.ananda@oracle.com wrote:
> 
> 
> On 3/4/25 7:00 AM, Mario Limonciello wrote:
>> On 3/3/2025 17:48, samasth.norway.ananda@oracle.com wrote:
>>> Hi,
>>>
>>>
>>> We recently observed that the LTP rtc01 RTC alarm test fails on intel 
>>> based VM's. This seems to be observed after the commit
>>> 6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not 
>>> check ACPI_FADT_LOW_POWER_S0")
>>>
>>> I noticed that the use_acpi_alarm was set to "N" before the commit, 
>>> now it is set as "Y"
>>>
>>> # cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
>>> Y
>>>
>>> #./runltp -d /tmpdir  -s rtc01
>>>
>>> <<<test_output>>>
>>> incrementing stop
>>> rtc01       0  TINFO  :  RTC READ TEST:
>>> rtc01       1  TPASS  :  RTC READ TEST Passed
>>> rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
>>> rtc01       0  TINFO  :  RTC ALARM TEST :
>>> rtc01       0  TINFO  :  Alarm time set to 21:02:25.
>>> rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
>>> rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
>>> rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
>>> rtc01       0  TINFO  :  Waiting for  5 update interrupts...
>>> rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the 
>>> update interrupt
>>> rtc01       0  TINFO  :  RTC Tests Done!
>>>
>>>
>>> I believe that the hypervisor may not fully support ACPI or may 
>>> implement it differently than physical hardware. ACPI wake-up events 
>>> may not be properly supported or may be emulated differently in the 
>>> VM, causing alarms to not trigger correctly or time out.
>>>
>>> On AMD all instances the use_acpi_alarm is set to "N" so no issue seen.
>>> On intel Bare metal instances the use_acpi_alarm is set to "Y" but no 
>>> issue seen.
>>> But, on intel VM's the use_acpi_alarm is set to "Y" and the issue is 
>>> seen.
>>>
>>> I even check with
>>> # acpidump > acpidump.txt
>>> # grep "FADT" acpidump.txt
>>>
>>> no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.
>>>
>>> Is it possible to know we can address this issue? Should we make 
>>> changes in the LTP test itself? or in the kernel?
>>
>> I'm a bit surprised it didn't also affect AMD; but maybe that's 
>> because of the specific date of the "BIOS" for the VM.
>>
>> To me this sounds like a hypervisor bug though.  Could you add a 
>> condition to detect this hypervisor and exclude it (and also report it 
>> to the vendor for the hypervisor "BIOS")?
> 
> It's not affecting AMD because of the first check as below in the 
> use_acpi_alarm_quirks() function.
> 
> if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
>      return;
> 
> In AMD systems we return control right here and the use_acpi_alarm is 
> never set to true. But for intel the above condition wont pass.
> 

What kernel are you working from?
Take a look at 6.14-rc5 and I see the AMD ones should apply as well.

https://github.com/torvalds/linux/blob/v6.14-rc5/drivers/rtc/rtc-cmos.c#L813

> I added a check to find the hypervisor
> 
> cpuid(1, &eax, &ebx, &ecx, &edx);
> 
> if (ebx == 0x756e6547 && ecx == 0x6c65746e && edx == 0x49656e69)
>      hypervisor_name = "KVM";
> 
> I was able to detect the Hypervisor to be KVM. Do you think that the 
> issue is due to KVM?
> 
> Thanks,
> Samasth.
> 
> 

What BIOS image is loaded by KVM?  I'd say it's more likely an issue 
with that BIOS image.


