Return-Path: <linux-rtc+bounces-3207-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A2A35A93
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 10:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F72216EB61
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFEF24C692;
	Fri, 14 Feb 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="M/WkcE4x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C524A061;
	Fri, 14 Feb 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526218; cv=fail; b=c1WjRoR8QTl+A1CAxy8mIR9ZIAsg4AGnpnle8SSenPSNgp0L9JJ4GFLrnqd6C3cmcyVB7arYxZcm+m9Whjs66kA7jklVL/hrfFKt38KC+wckdALuZ/930a4FMOKg+HxzIaLNN3DJATXDHmt9KMrY7PayIwghO25x67Aao12e/Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526218; c=relaxed/simple;
	bh=1pN3UgjFDmEaBxI1joZiQaYSaxs9nWurD/lv0GOFSY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gWEUqK6VyFuGCJwy0KOeAP4cmjcIpEU36x5GUFvX7ZlrPSNIlAtSBUxlatlxKe17bSWClpjXIEzuREy79vYYXNLlRgGrptJjvXoQEZAoFxBVA85JAv6qjKbBjtl0thIVx6+RYPXrEnsjDqvEdDjHF8Y7h1323A2VA8priVWA+cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=M/WkcE4x; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUjBZiNjMriHGW+V5scq5GDKV7EwAy83hZ7gG/doEv/tmaDCHWunr1MXG22rtCi/+XxjAh65oRLTDp4SYogZi3mvthRAkF+/72xkpvMcfr1uzvf7OydesltiMLryl97tFzgh1J7byNdd8t1xPDxXjwn0OxAF3108wXFYBITQJbdjRURmpXsSLgBPKfXTEnvkZ8be54bqs3yI4n87ZOGrox59o6d38ptOmSDpQGgeuZzlUX5+BpriSeNQi5bS74ovXPzQ/OcC8Sfhcu/iC9eHotIm6a5IeBlzKS16bR1sJtu5uTBwzkJPGv5ncym2N8Z/cc6ZlI9ScmC3W8m2d7MfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWCXH88oO9B0BOyMpcNzFiXv7ZMQHj1V4lQNuJqFqJM=;
 b=F20Y+OiA7omCZOjJU19qgVkjTMewTnNIr9i0X231p90cF4bkDUw65UUm5gefGcT2RGp1sRo9umrkW2jSqqvf11vrzP+zQafXDC1H9H1cgVuFMSYfem60kmqnei38cpnGol/AzkapzVYObsD2kfzRBVn3CmU7aDnkY/zFMktBA0J4YYBDjCnsgEb4XrRy/4SxL6QHhRRY2tnOjatNRWM6WWvdwjvfNtXy1Li0cz7eXUKbaid2vo0akVJogKUI6TqZ0NrAbEnxh2qYRKGjz2scgfcXfGZhqmGt5+kUMw33KVolP/VeobHZbTQWOpT51E0VL4bZLV+1zZe3v/HRlpN0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWCXH88oO9B0BOyMpcNzFiXv7ZMQHj1V4lQNuJqFqJM=;
 b=M/WkcE4xRgC8s1scJmcQFXvqfnTmfhNLcx336WmJsjSYFUrXsFNgnzdhiJHaJNxFb2zbJBlbA4hr9nqy42uPsbzaNmzpys/Y4Kl6t5038D6QOFGFbY0nw9qUaT8H7Jx82OEDvmm50hw+BXHX40zkCrbiaOHqPrOY5ZGUv32WcChkSwRHMBrVRhjDU2oE4j33qYfxvZ/9XHAmNVml9JkGHyX1llDITR6EAVHWOMqiu5fLNcX1aANvek78I1EiXAar8PuO6tGKelsVN1WK+Xs0uWGLoLhPbFi3scUl+iSxLCTNLzJNuVtxr+EhzuHfL7r0Ho3SLaqijWlEtZidxPpqwg==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MAZPR01MB8860.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 09:43:31 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:43:31 +0000
Message-ID:
 <BMXPR01MB244055B503A1AA57B613EBFDFEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 14 Feb 2025 17:43:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, inochiama@outlook.com,
 linux-kernel@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
 <40a548db804c6c8eb72494de17bee6210b8a7a85.camel@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <40a548db804c6c8eb72494de17bee6210b8a7a85.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:405:2::15) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <53d76119-9703-4148-a7d8-dd6d6eaa1953@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MAZPR01MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 4097189a-da6b-4e0b-a86b-08dd4cdc0a4e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|8060799006|5072599009|7092599003|461199028|15080799006|4302099013|3412199025|440099028|10035399004|41001999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFI1d2dXTjNraVRtR012aitWOVlGZ1V5dVpXZjh4bm9MRU1JL3lGVXpSV1BH?=
 =?utf-8?B?eFZOdS9nUG9VdDljTFVjVFlJWVdjVFV4WEpLUVlYaHN1VDFDR3d4OElINHdw?=
 =?utf-8?B?Q3MydDBHL1E5Z0x3U2pPUWwyN0x3bTRETDl4REV5K0JrSURNdjJtL29ET2Jx?=
 =?utf-8?B?TDhXL0VkMTJ2TlF4NkNydTJ2ZDF4ZnR6OHNKVUxpWXZ4aElVNUV6Z1BhaC9a?=
 =?utf-8?B?L3hsTE5BdithSDBORWJaNm9SUURLRFJOejVncldLWC9xYUVDOVJObVpUZTlv?=
 =?utf-8?B?ams1R1M4dENBODRkWllGazlQOUtaeFlOVWc3bHhKWXNMVDZuRkc4aUZlUWtT?=
 =?utf-8?B?bEd6aW53K0VwSStjTTlham4wTWVCVkd6M0wrZFUxVU1XWWpKU0NxQXJOc2t5?=
 =?utf-8?B?YUdpcjNlVHA3K0lDNTZZSjBYeWRGd0ZJNXo2bWhYV1ZLeTdJYUExdXRuQVVU?=
 =?utf-8?B?NXp5Mm1Wdm9OdWtWUzIrTFpDQndEVEpOOFJ5SHR5RkhkM2xqQW5lTml5b2gr?=
 =?utf-8?B?YkNzODEyWGJ3SldlajRsU01wcER3VVBlMHlUUXVXV1EyVURyY1VOaldVU2hl?=
 =?utf-8?B?L0kyQjlkYVlUYnY3R09iWFRtdlNwL3ZJOXZFREZ3UE9HazU2THUxVUQrVzV5?=
 =?utf-8?B?ZFVOK2ZhUlZrL2ozYW01QjhLV0U4RUI5VFk2S1VaU0F5UzVJSVBKaEVLTFFQ?=
 =?utf-8?B?YW42eStBQjhqM2pQTmlwNFAvQUJyUkFHODQ4Yk1kK0swWUxaWlJaSFJVWHhk?=
 =?utf-8?B?Sks1UmhHbnpXcG9nZXJ1aGZBWTRCa3NGS2h2cXpZODJPVWtMek52bkdRNFFE?=
 =?utf-8?B?Q1Z3T2hOUFdHVmN6YjRWdkN0Snh0T2toeUJJWlBTTCtXYUMwYUJXWFRHQlpC?=
 =?utf-8?B?aktmV1RSNk9ETldoNWVDVVI0ajVYV3NTTjVTTWJsNzNVcWR2L2ZPbExMRlFG?=
 =?utf-8?B?ZXJYVlZsOEMxeGVkMW1DOHE0cFVUTEpxMTdvTkIvSDlNellmUVBBSW05QmNK?=
 =?utf-8?B?MWJsaXlMbHpDVWo5L05sSGdJZG5kS1JIWHBrcTRNOE5hZ2ZpOXBQN0F4YmJp?=
 =?utf-8?B?cWsrM2V6YmtINThHcVNNRS9VbWIyR1hLVTJwbk9IN0VBTjFhTWhDUUI1Z2M0?=
 =?utf-8?B?aENIOFlBT0doL3dxZkNFWVFzZE43SXFuakhiT1VBejRWS29nc2tISjRFRUNw?=
 =?utf-8?B?d1FyS3FXZnRpczcrQURMQ3JQQWtDVWRrUmp1WDJDQ00wSC9ZWWhGVWl6MzA0?=
 =?utf-8?B?MGtXMU82SFhmT1ltWEZMWC9JMkZlcFUwQkd1aHJpRUhuQ3ltL2xxNlpwb1J0?=
 =?utf-8?B?aDlyRU9QaUNqNTJCL1BYbWV3VGhLVHE1UHd3d1B4eWhwaHY3V05lYzhJdGFj?=
 =?utf-8?B?WGMwdmM5TmI5dXFPUkhoa3BtdXZ1VlVGdk9jWkxxbWFEZ2lrekxwNHBJenBw?=
 =?utf-8?B?STc3QVRxL3IxRDZDbzBtektsSU0xZ0xIalFCbGgwU0ZOMndyTXUzOHZiaGZr?=
 =?utf-8?B?eUc2dWxLMk1yWUhWTmI2QjB2TlErWjcrM2JvY1p3NGw0NGV6b3htbmFYblc2?=
 =?utf-8?B?QXV6bXZRMWxwSUVXODViZ1I0eFM4bnJhNnlxUCttQ2t5YkJ1S3RXQUZaRUF5?=
 =?utf-8?B?WkNNUDVRSzBDdmtwTyswbVJYOWgzcmZmYTc2SnB0YVFNbjdZSERtQ3R4ZlpU?=
 =?utf-8?B?Ym0rWExTL3lqUjhsTjBsNGtYK2VkREl6bnFoR1liM1NscjU0MmJzb3JRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVNNZndEYm1YSXVhOEIvSFdmZWNONFc2NEdKOWdYWnhUSHRzQmc3ajNZNDcx?=
 =?utf-8?B?OWREeFFueCt6NjAyK3RNV1o3RWZyWTF0Wk5tSDVHWnVhaURUcmoyRXBCMTJX?=
 =?utf-8?B?TlJXOS9LaHNucXR2NFc3dHA2ajRTcEgveGRyQm4xVjgzZVVEWFA0MnN3d29F?=
 =?utf-8?B?RXNyU3pjNU1uQnlGTXE4eC9wMEQ0VEJ0K3hGRUtRSEI3OS9WYWdRem1zeXFz?=
 =?utf-8?B?WkZXM1FQRXlnMVdiNnBCWGE4RkJCQWxUVHVRTExXcXEvdmlvbGtaYk5EYUlW?=
 =?utf-8?B?cmVWZWdKR0VsWHpzcnBmNnRmM2xlMURiajlKWmk3OTJmQ0xwYm8xRmxPMzFC?=
 =?utf-8?B?bVAvdGtzQ05xMUJtaGlJYWw5bCtpZnVrdjhyb3gySmJmcVJiaDhzNWVyTThJ?=
 =?utf-8?B?WHhLNEMxdElkdENvdDhlaFhjZW5DdmdpcjB6Z0psdEtZTnhLd3RhT1JldU14?=
 =?utf-8?B?QTI1VWpUSXF6RDZsZ2pjcEkrYStGQVlienc5U2FUMHovbkR6SkRmSlgzdFVE?=
 =?utf-8?B?d2pnak0vVXhrVWFuYVhaREpNOWpubG5TSDJsSHFZTlhkTkdaaDcrSlhPNHJi?=
 =?utf-8?B?OVBYR2E0TTJROXdRMDVjWWZreXF4UC84Vk5oSG1jUm5EZWxOS1NCMWxBdTVC?=
 =?utf-8?B?ay9GaWlMb213cCtEV3BzQWFIelg5UDh3REdzc2tCeUluMVU5QUZKbktJRlU1?=
 =?utf-8?B?OGlxTURQbDVMaDl6UmdET2wwTWJsbmZYMHY2UWV5OHlWUFVXSXpXNHkyYnpU?=
 =?utf-8?B?R3VUNTdDYm9JcjUzZWd5RU5VaWFnVjV2KzdPY3pXQkU4OHM2WnlVOGR2OHdp?=
 =?utf-8?B?WEU1a0RaUzBKMXdQclBBSEEwTGR5ditLMERvZU9QZWRGSzlYNXBQMW5DemUw?=
 =?utf-8?B?TUNUbHpIb0EvRUVVTFd1RVFQZ2RleGJyRldHSFI4UUdxVm5CbXVNdjd5YzJV?=
 =?utf-8?B?eFovbHJMMzcwQkhDaE1EblBQWjYyd24wMGxvYkN3UzNneUREaWFHR1NnZG02?=
 =?utf-8?B?SGV6RUoxUFY2c3RndUxzYzBPWCtYdE9tL0tTdUJNbFU1UnU0eFFoU29JS1Yy?=
 =?utf-8?B?N0lieDdaVDlVcmNqNmlvb1IyakttZkZ4Y0FqOGFzL0FvcytpelJBK285MU5y?=
 =?utf-8?B?S2dTMzMwd2g4Ti8wRm5leWViVkFHK1cyd3psOFZXbS8ydEFlNy9aVlgzUHpj?=
 =?utf-8?B?akFhQ0hPS1ZuYldrNVUzVkdZa3VBUVFqMDdnNUFOS2FrNDZJMVdBbE9oUmky?=
 =?utf-8?B?VWloOGFvajVvbHcvZFNlNTFvSCs3aDJKMVlMZnA0bUVEQzNrVkZrV0JDVGJn?=
 =?utf-8?B?QzgxYjRLengzVmk2am9NVXBKVFRKV3daenRDVFRSR2NIUlNLb3BLb1pma3Fh?=
 =?utf-8?B?NUdrY0NQaktJK0VrSFhjMUtBVy80Y3RRRWREeFI0RWMzdm5SOWp0SVF3Wk5G?=
 =?utf-8?B?V3JLK3ZMUFFET296OG1KWlgyTklndFB5NWU1WTZ0eWEvNmU2b1IxdUs2UWND?=
 =?utf-8?B?NUJZOFhhUVFsNWs2WlZPNXB1ci95cWxFNWl4a3FrLytJQncrVU5uT3lQNU02?=
 =?utf-8?B?TDcrN3lFYjk4RjV2YkY0Nk0zdHZjQ2pscmRHRVFVMDBGNk55REpDUFY0YzNN?=
 =?utf-8?B?M1JMeTM3d2ZET0o3RjVKS28vOUh2SW02N2VLVHNLbE5obDdiMHRaMXdrNHFk?=
 =?utf-8?B?eEpxNVNBVFAyZnNoRTNod3cxajJoL3RvUjNVNWtoNEJueEVmdHBCTmREVTUy?=
 =?utf-8?Q?LrUT+6cmVkU/Rw7XhsaD372XGEJ2iY0Ib9eoZWn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4097189a-da6b-4e0b-a86b-08dd4cdc0a4e
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 09:43:30.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8860


On 2025/2/14 16:56, Alexander Sverdlin wrote:
> Hi Chen!
>
> On Fri, 2025-02-14 at 08:31 +0800, Chen Wang wrote:
>> First of all, thank you for re-picking up this orphan patchset.
>>
>> We recently created a mailing list for sophgo (sophgo@lists.linux.dev),
>> and we would appreciate it if you send a copy of any sophgo-related
>> patches to the mailist in the future.
> Does it make sense to add the address to the MAINTAINERS file?
> Or has a corresponding patch been already posted?

Yes, see 
https://lore.kernel.org/linux-kernel/20250212022831.244143-1-inochiama@gmail.com/


>> You can see https://github.com/sophgo/linux/wiki for more details about
>> this mailist, and we are keeping track of the status of upstreaming
>> sophgo products through this wiki. We have updated the status of some of
>> the patches you are working on, please help double check.
> Looks good to me, thanks!
>

