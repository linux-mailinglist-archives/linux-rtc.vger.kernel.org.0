Return-Path: <linux-rtc+bounces-3944-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AFA87B9E
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 11:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F6E3AD4FA
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 09:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A589D25DCEF;
	Mon, 14 Apr 2025 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G6NA5rbe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8031A83E8;
	Mon, 14 Apr 2025 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622085; cv=fail; b=BaY75nGe4ZKEckzmpZvbDyJMLX6Y6O8CBoJgmP0LVxUHbksm9W5Yog/VMHXWAx8WHhboF79nO2hL/eS1bpM+ybo7S0c2ZYQuecrT+060ByZtwYtZ466UpvdT0oqtOsTDo+glF8sCszjRKuQE5ydcWmxH5gvNm8ZfLZGfBiKrPcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622085; c=relaxed/simple;
	bh=4FWuM+jzKQpc1rQQsQ6C2elv7KqH99ISVdLubDT36xg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yo3XI1ajYyf8+S9sFAaJpgyr+8NYKnxjgCZGXRdovjpOZwMxhTQ5NcPg9koLbHrx6cdrgjDt8f3FaLYJteYiab4Bn74WPXYMv1Fxd9VJCJt2/rT41tQbF8GlRo7AOdWz/Q7TdNkgghKWZi84OnNwV0OrssdCoPUACqenTtbAnqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G6NA5rbe; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiHjrlaqisnLJYMwmsKJ62FRwhwcAHC2OXhwVic4nmf8zitfUEaIrik6F6wqw0d+aHX2i9cPXadB2TqdylNcIa+M+Bgf2l9osMcr2gxnDvR6UYL0dveOWE5jUz1lFl5jjY/tdNYo0/JNdqlta8rMujQ2BjkcfasLKboA9lfsgM5zJTNKHAiy8FEYIcAQJ+YZtKuEo8cWezPDnO5UMb5F1TWxcc5aEbujeAaJKdc1zxmv/5u+CIrOu7ZFxqNw4tKMXKNq7XLvVj5yIZacrSLJ6jAgsAFylHdm1IbSMDALxE1fve+gF1S3QbKoQ8l8a+Arx3abDKKf8iWLNjckmCpRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCqe590WnLijPuhofzHvkr/57N/rrcC1w/Do6TTqr9U=;
 b=oarj5T1clxuOHfp/0N7Z2H7R3cwKSUfdK5D5sN0EekQYJf71lPPnqeSddh9D7GOLDZPgEXxjUXc66s8xSjehmnRRCe0psooinm62kcS3gWtrbyPIGWlg2RG3rIVdL1+1l+dFirapit3jTOXiJwAvTdpsfkosV8tszhVkAZ9ckNnGm8Fwl3ISnICzrUJB+KEVotDxC7OPWOUskJgyr4RAjcLbrtmXz3/q6rHmeRUwvUzuOSfzPU5A98Rwu4NE8rb/e0J6MHI6S7jIg4E7aVQTBBlYy//QWymQU6oCVMwAXBh4f0OTI0Mx9JJbV6FY9pgiXCtaV1m1205fEX4THQ0XzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCqe590WnLijPuhofzHvkr/57N/rrcC1w/Do6TTqr9U=;
 b=G6NA5rbeSmNfqtqPtDGu/2OOVZfyvGOxXR4pkN4WJD6XUMZS80sFB3ypsTHagCNaEGlN2lS3txTaVmpllDXXq2cauSIDMJGSwAAxt3uPR1S4Yh4kOJiZEO7BwsJcKTuJNLpEUads4xvtEG1Yvx9tbaz9EyhAFMsFv8waPsNR0PyboOl77jWWKe+1Kpf1AwiaNnHtW6E9Q7kPwyda9xhjFSyz388I9zckWz34JKStFhAdSRVxGPLuUV6lO2bO5KyPWLr3ipAxbnMPoymnC7YiZmtTzkZOoAg7OjE39xsHiy7lC8/DeKqdmiLxDvlhgZep9laSDXjqHKs4lTCXKpB2vg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1158.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 09:14:34 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:14:34 +0000
Message-ID:
 <MA0P287MB22628A1AF7C3B2DAAE837CE3FEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 14 Apr 2025 17:14:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
From: Chen Wang <unicorn_wang@outlook.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org,
 sophgo@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <c1ccca7b-e8b5-4529-ad94-339f38f5bc3e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1158:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3f6693-0471-40ea-eb71-08dd7b34c4d6
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwU46ctkesNAQSdI89rGQphJ+gc8QXuxDDJtfUwNAKIwPDADJyjBrIR3BB/pjsODJjE5U0ttIKLQbBOjIQV8JADDiy++SIogqIXJaZC5AOlSWbwDACRw9Xpe8nZqqWJKDMUBZWnoisMF4rmNsRxMBxa96BzZbIAys+O8KmlQitHQAw4yweLOss0Vsro3Os/kxgOwlIn9jzYK2oV3CGhBalHENKjzySFJH6twqDPsgT2BDkEwnBJFnqYwY5VC7VuQyEAHiEKT+oHhO9x7JDp01xd2LsH9X95Jj5wJe17v+yXn9T2cMBxtNwBdglMUB1IW0YbSSsSa737ceAMejQaZDAzM0mz46yjZVzmqCW0S0tJQMci8ZxkHwRwDbURlpRRiEpqhNKwY/FUCIVad+/bjhklH8RDLoQ/KTF3mmIeQy1vcVn16EkT2P9Flxi90uFauJK76GG6lIk5VxZICsVum7sq8UeM4uVjkLkr+sWxuaJgmOJEA4yrJSs5NaGF3uAGFaJNmV51Sq22A911fV4LAq4dLGjk4v1IY/6VG0sGRCVtIPtW/svy/VUWHd6P2oXbKwnJV4i1CQyTvv5jokJDkGSVQr8XWiLqMLhXxRyWp1EklKNM/4YIsiXYd5Nc0FF8TRWLHPLAnRniauM+7TV4GXKG2mIvQ3I/WERHgbHqDUDHzKa3UaxKTCQKO5gkbwe5YGFxAqRkpJwL6OX+cHCeNUM6SjC/gTLJlxE2bblNTQ/ufMdSz0p016Wo0r+P4fKm7owM=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|6090799003|19110799003|8060799006|15080799006|7092599003|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEkyWkRHUlB6bkUyZmt2aTV6eFMwUll0TWt5Q0FLb0llU2FGWTZLWElHUFJz?=
 =?utf-8?B?QUpTaW5RSjk3TElWR2tkL1hGS0lCcE91NmU5U1lHUWl6VXNKbjdpQ09nbkNw?=
 =?utf-8?B?ZzdmdGY1UkNoWkZ6V0NUbDJGTUE0Y2NXdnUwVnlWdklNaEk0S3BuV1dPNUwr?=
 =?utf-8?B?T1MyWVhtc2duelJwbGM4RjRndDNJVTRUTm5ab2hWUHVyRzh3Z3A2cjFnbXpV?=
 =?utf-8?B?Y3dmcXM2TUpaVnRYVW5sMEpDWExOeXd0Rm8xUzlLdTlONXV2Z0hiZTYwVTRv?=
 =?utf-8?B?aEh6eS9EUTVHa1NUNmx0YXBCSjJRYzcyZGg4M25uUnRqNGhtcXFoZDRHczFj?=
 =?utf-8?B?cjdNamg1ZGQ5cnc2RXNpdFNoMjVsZ09YbWNDdTE1ZWRJYXhMWVFVRTkwU28z?=
 =?utf-8?B?UTdPSkl1cSt0Rzc1d0MrNXB6THh1clFhRlRZSUgvazdtaWdxYm84TS9saFZQ?=
 =?utf-8?B?UUpZQ3NjWUs2bSsrSG85ZnV2N1hHUy9tZW85Q2IxeFNBWmZaVkFWSnE1VUg5?=
 =?utf-8?B?ODZQQWIzRnNpR2MwT2x3RWwwT1kwVHR1Z1VOdUMxYTVVWXBXWU9JZ1pBUzda?=
 =?utf-8?B?aDdZb05xajVEQVB2VnVOZ2hmZ0xwSUE1M29hMzRETlcrdlRxanByVUVNUHRz?=
 =?utf-8?B?YWxEMHdFZjhURVU3cGhoN3hUOFFsS3Y2MXBXQmVMS2ZIekxLZnpZMkhpUFp3?=
 =?utf-8?B?dldsY28wbGFlS1hXWmVPOHAycnFvVmwrSzc0M2lhR3UzTTQwQ3duV2g3dE5L?=
 =?utf-8?B?dFFyY28wN3JiSHRpbFRqMVlUcDArbEovZG9GdmRjbjBWQ3NxYkRHRVI0U0xT?=
 =?utf-8?B?b05weXpYYWRIckk2eWxybWtrcTRVN3NJbU1TdE85UjdYU1VWMDRhelNKcGg5?=
 =?utf-8?B?azNRajR5QytjdWZmOGpkc2NWTU1yQXlaN0l1TFpHQ1YyME5BcEFMMGxaVDZ4?=
 =?utf-8?B?VVo5c3Y4MDdsdDI2OU5rbjBvVEpQWTBDQlFWSnpTTGxPUVpnNXlSNnlhSjdo?=
 =?utf-8?B?SFhBclUzYlBYQm5pejFCcUVweDJ6ZkY4b0pvNTNFYTV5K1BGdUlvU0FqNGpT?=
 =?utf-8?B?SU5wSHNDRkhsSEdFKzkyUjlFN3RrZFZUTE5qZENzNVh5WDJ6MEdFZWEyUVFD?=
 =?utf-8?B?RFQvZE40Vk5EMHVTRzJtSUFlRWxrNnhoUmhnUE5oajJ0MWdFbm0yUzJudmIw?=
 =?utf-8?B?ZnhuU0ZmbUFVemJlamNTblFxOHdhSW5JNlZQSC82a3Arek1pd2VIMGk3NnU1?=
 =?utf-8?B?ZW9VQ25sUlpxUCs0S0lHYSt5eU4vWnZoS0lzZDhOSWhvQkVIbEV0L2tpNTFa?=
 =?utf-8?B?VFZlMHUvcUVHcXVYSFhFUVVzbVM2QnpidDVTTXErY0p6Um85UzZ1NkZCamVR?=
 =?utf-8?B?eTJlcEZDbVdFQW1wZkJmMkJPNEQ0QWFhSHRiUGwvU2VsdEhzdTRIRktPUEh6?=
 =?utf-8?B?OEhPZVhRUGFTbTZWTEU3a0czeGd5VUVRLzlvNGV6YVlwZ0FiaEdXVHNSL3Ns?=
 =?utf-8?B?RFJBS041c1VRTExqT2d2b0Z3UFZHb1BtQzhCcHFJRjZjUGhhMlB4ckxSbXZx?=
 =?utf-8?B?OHFNallGS0I3WlBzM04xK1ZuSEpxbUxsQ05JOUtQWmNySUNCVnR5N2JiaU82?=
 =?utf-8?B?TktUenh3QkxYRFczTnVJRUwyL0F2V3NWcncxTUtVRDhCb1Z2VTJHRnRHVmZM?=
 =?utf-8?Q?jNCfYPQ4H6upihZOrTlf?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1kSllnU2gzRDRSSnRvTHllRDI0aVBkYkxucnNLYmJLVG1OYml4UWZ0Z1JB?=
 =?utf-8?B?VHEvc2d6MlZ4VktZTG1WUEM5OEF0U0c4TTM2dTRUQkFtSVZjdjBza2VMRHo0?=
 =?utf-8?B?cFI3ZHdEbUl1Ni84dm81Wi9paHhySU5Ib2Q3bVBLYTBrVHVmTEZKSnE0Q1Ry?=
 =?utf-8?B?VThQclJYY2J1cjcrTWhmbElKRjBxODdSby9DOFd0UHIzdGJ0MVg4VXdMOTJJ?=
 =?utf-8?B?SzNRaXpWMEdDU1ZzTHFmTFlSZnBZVUhDZ05XWkJleWFxS1Zuckl4dE85SUpr?=
 =?utf-8?B?VVhxWDdwUFljdWxGY2huZEFKU0dXQk9IbTVXRXhrQklKOXhzQm9wL21BejZa?=
 =?utf-8?B?dXBtNUw5TlltMmhpa1NSV1FubmM0QWRFVjJQL244aVZoa0QvTmZWUUFoRlIy?=
 =?utf-8?B?MlpuZG9iVlNDUkNRajdxNk1TSmVWVGdjam10a1B6blR0WFZ6RW5KYUpENEVP?=
 =?utf-8?B?bDNkeFVSbVNIVUVKN2RkbGdWdndvbVB4N3YzSndzSks4c2JNVEtUQmpQbjdu?=
 =?utf-8?B?NnRsK2Y1cW45OWNjMitWVDlCRnJabTFlb21lZDFpWHRlTmwvOUtqU0tRenNP?=
 =?utf-8?B?ZnZWV0QyNnBURnpOZCtYZ29jTUFjK3VObnRxSUJ4QzZjc254bWFmbWJGdlk5?=
 =?utf-8?B?WFQ4WDl0Sm5jSzNPYzFrYjl2MGtzaW1MVld3dlFNbCtqRVoxblI3YW5iZG82?=
 =?utf-8?B?K2JyNmFzcUFmeGIweXc5UjRSNlFsQzI0RTcyN2lmR250WDRTQ1dVZ0FwSXdS?=
 =?utf-8?B?N1k1MUpUTHFKb0V4RWJKRmlweXFJb2lqcVNReWQyT3oxRnJCZ2JSMHFVdzhp?=
 =?utf-8?B?Tjk3SUEyMiswRm90STlwNEZ0eEVKWUlJdmlnVnRwRzdUbHdLbkRYaW0rUU9E?=
 =?utf-8?B?ZTNKODhtUjhhd1M4d3hHbkg2MklEVitzNWMydlFOcWpMNDYvY2dMUkFJZHo4?=
 =?utf-8?B?U3UyckhFWGtIYVZYNHRKZHdmRXY0VU42SHVkdjhEaktUM2xXWmlDMDAxTGVV?=
 =?utf-8?B?VFZLZnBsb3FxU1J5ZEpTTDdqcTlicmJObFpraHZueHY1bkFoSi9iV1dYcG9n?=
 =?utf-8?B?WlIyTUt0Tjl1UE95WTZTUkZ1VlRya25WYSt3L0V4c0JJR2VKY21XbVpRZExW?=
 =?utf-8?B?M0RMTUpBcFBoQldQMnNENjlRa3NUczJEdU5LRWUwN1dBTVFHY29kNzVOc0JG?=
 =?utf-8?B?SUF2ZjBGSDBJKzFkTzJmVlJKNXdvUXAzUzhzSnV5ckV4SnNHeTZWR2dRQ2Yx?=
 =?utf-8?B?bmJ3MTluVFhpc3RVbTJWY3ZtOG9rdE1hakYrbUYyV2NyWmFwc2wvSzFRd2Ev?=
 =?utf-8?B?b0l4MTM1TmdldnJMSktYdlFqems5OUJ5R1FIRVhhcXk2VDRoMEgzVFhNTyts?=
 =?utf-8?B?SXRhdWN0cGpKVFV5akwzbmVvZWNkVXpld3BRZEFWVVk2NHcxQ3lZNUhBRmZB?=
 =?utf-8?B?eGNRS0FJTlJxTktIS1BoVXNmUVpMQ0pVZEpxcGw5VHd1bWxnR0g4L2wxUnIr?=
 =?utf-8?B?akFpcVdZTGZhMm1BYTJLektKWTdxeGp6cTB0Rld1cHBDdjByd0M4bW1KaWc0?=
 =?utf-8?B?amdhTSt1dlJVdUVSMFBuekYwTHdoc0h0eGY3dzVWMkFzVG50VHcxUCtlN2xa?=
 =?utf-8?B?cDNFYkZrQWtiLytUQnhvYjBmKzBHamdFNXUzQ1YvUzRqOFJvczcvNXZuRzhZ?=
 =?utf-8?B?Q1UvekRtUnRISDcrZTkzYTBiZXVhUklzTSs5a3dzcnRJTStpM1J3bERabXF0?=
 =?utf-8?Q?QjwxN7ZSDNJU4IhQ/bMaEMxBvTchRB14DDOQKHz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3f6693-0471-40ea-eb71-08dd7b34c4d6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:14:33.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1158

Hi, Alexander Sverdlin,

I just find there is an exiting "REAL TIME CLOCK (RTC) SUBSYSTEM" 
section in MAINTAINERS, seems we should not pick the rtc file in "SOPHGO 
DEVICETREES and DRIVERS".

Chen

On 2025/3/19 8:31, Chen Wang wrote:
> Hi, Inochi,
>
> I see Alexander add "drivers/rtc/rtc-cv1800.c" in "SOPHGO DEVICETREES 
> and DRIVERS" of MAINTAINERS, would you like to take this?
>
> Regards,
>
> Chen
>
> On 2025/3/16 6:49, Alexander Sverdlin wrote:
>> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
>>
>> Implement the RTC driver for CV1800, which able to provide time alarm.
>>
>> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>> ---
>> Changelog:
>> v14:
>> - platform device name "cv1800-rtc" -> "cv1800b-rtc"
>> v13:
>> - Change in the Kconfig dependency caused by the move of the previous
>>    patch from MFD into SOC
>> v12:
>> - added MAINTAINERS entry
>> - depends on cv1800-rtcsys MFD driver
>> - use syscon for regmap
>> - get named clock from parent MFD
>> - corresponding platform device is expected to be instantiated by MFD 
>> stub
>> Changes since v10:
>> - only start RTC on set_time;
>> Changes since v9:
>> - further simplified bitmask macros;
>> - unconditional RTC start (rtc_enable_sec_counter()), otherwise
>> didn't start on SG2000;
>> - dropped ANA_CALIB modification (has been forgotten in v8 with
>> the drop of SW calibration to switch to HW calibration);
>> - successfully tested on SG2000;
>>
>>
>>   MAINTAINERS              |   1 +
>>   drivers/rtc/Kconfig      |  12 +++
>>   drivers/rtc/Makefile     |   1 +
>>   drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 232 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-cv1800.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ac15e448fffb..be8fee50a49c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22354,6 +22354,7 @@ L:    sophgo@lists.linux.dev
>>   W:    https://github.com/sophgo/linux/wiki
>>   T:    git https://github.com/sophgo/linux.git
>>   S:    Maintained
>> +F:    drivers/rtc/rtc-cv1800.c
>>   N:    sophgo
>>   K:    sophgo
>
> [......]
>
>
>

