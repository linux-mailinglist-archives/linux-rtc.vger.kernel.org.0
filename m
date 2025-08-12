Return-Path: <linux-rtc+bounces-4670-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776AB22B2C
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 16:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89BE81883F62
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Aug 2025 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55C62ECE8F;
	Tue, 12 Aug 2025 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QKRykyKw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA820D4E9;
	Tue, 12 Aug 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755010234; cv=fail; b=UhhWetEy8Eqe0tE3XIrGsiIKLi0ctly1Cqc/jBUDzdZdWeE9O2G7JwYY6Fq01cRsfSLC48exdfM1tfbi4FLUK1675CgBD9UvDq7OfJ/phepCRkFO9QfOtLy2mEDMOHsW8fV8P7xD4NSNkghK9fauMy4VRnzRjdwM0ObvD75D3eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755010234; c=relaxed/simple;
	bh=OIV4exD1aHr+mx9Xh9chqyC/CYW/V1/MjG0EkkokNnY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=caregSJI+WyEzs6NcVDRFmPHpIpRFnEqnvDJI8S3K60eIYQK3QNNLUPOUTT90jOIW8d2EIduo291UYudtsbwNAVzbPC7rS0V2RKa6yyAdyN8ZlxDt/9U/vjsMNHq6vTMzwpESXzhFOBcGforRHVClKVxQkwny/n24pqDoWhipRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QKRykyKw; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKaxbdGOAkpwTqkt2iOiQ/nlvBnSFTNbn83IAlDzE+EhC4625z0pv1ztZ7p/FyXfYD+GiZSnE/mllDp5Asdclon0loefpLcEjIjYNWljMFD1d3V9LRLW+TeDYGse2J99t3jotg/2W0DbYE5uoy32S10o/ROj32RobOv6kV6EWqVCGOALjLniQfSfpYpsids1xzUl12lu6a9ZcMfHFtyoDkdhTZMEeR9z2Z0EWZZFdD+WI/uPaYs7hOEDmlYSM7VOpBejmDj+YuGhZypi0ijSXfMuoOg8Xej5fu2DfMjHI/B6jiKMtkl4+DBqXAEQnxYHfL6mvN9rmFtOWdvsQ81CSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qttzGTwSi0ofCXivoy5tJ/rHZQlu0GKQTb/Pt5HwJ+A=;
 b=hwL1OOnIpLDT1SnlwjoWsTPR5lMHi96pRFSaSBc8j1g6Tt2M/xX/9UKn25HLIv3boNGhW4bDYRB1gWx2CUfv012CKEqzRbQh7lXCtBCEZBY7qRY29C55//8NDtEPM42+zLu3nymQDGEGhKQkKsQ+tHZfHap/7ipyQmYwRCBjzMqwDg9JTWbdbF+OO3oil/WHtpD5ZAuAv8BT1PE5B+5XqAU4/YYdrcb4s/h2DkUAL7+85vjOYrPW7xntOgHa5TveDxHHJXd1RzigG3beoSlaPBJZT5AoE1KvS1ykZNvaLxI5o//qNfkqds8EIRgz1Ckb2QqJr1zIxcfJDcfa+o2cOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qttzGTwSi0ofCXivoy5tJ/rHZQlu0GKQTb/Pt5HwJ+A=;
 b=QKRykyKw7Ayymtcj5TJoi4CtdxstWKV/qsrqbtvWeriK/kz3qph30bDM6Wy4rJkPepQWDmnPFEWMNhjwPR5AG7vAcDVEnbUIM8oWih8WRkrFEZHoMSJBG5AJzZRRrFBYDLum0ZGnQGc75bbMW18CkXnKVJ4AZrMw43B7+5s4RJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20) by AS2PR02MB9439.eurprd02.prod.outlook.com
 (2603:10a6:20b:59c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:50:29 +0000
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40]) by AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40%7]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 14:50:29 +0000
Message-ID: <3185e271-2c0e-4a69-9070-46e53434e57d@axis.com>
Date: Tue, 12 Aug 2025 16:49:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: rx8111: Add NVMEM and timestamp functionality
From: Anders Sandahl <anders.sandahl@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
 <a15141d7-db98-457e-98ee-a978a4c875dc@axis.com>
Content-Language: en-US, sv-SE
In-Reply-To: <a15141d7-db98-457e-98ee-a978a4c875dc@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0065.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::19) To AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB10373:EE_|AS2PR02MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: 4040c6cc-0ca2-458d-e322-08ddd9af94b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlA4UzZEdk1ObUhleXZmRTB6WDVmMG10Mk1FOVdNL28zM3hoM1ZNdkF6eS9t?=
 =?utf-8?B?SE1rK0VQQVl6c09uUk5pTTRzZG8vWXBNVlV4aHZLTm8wY0o5bGM1NzV0L2pH?=
 =?utf-8?B?NzNzTGUxNGhlRmNHeXorT3NtUzg5aDZzaWhoaWNNTFNpanh6UERJc2s4bUp3?=
 =?utf-8?B?SlNiOW5UL0JvbG41MkN6cWRWSkhwRDQ2VDZSUk1JQ21xTmZMSGhIRFB0NzhX?=
 =?utf-8?B?NUg0ZUNmcnMrZzIrVEpxNm02T3dyY0IvTTNpTVpxbXdEYm40V1JDZk1yVFdE?=
 =?utf-8?B?ZTlneHlteUFSOG1IWG1NelczUGNQOU5hNGhjNUJrdGY5Z0lGb2xocFllZEZt?=
 =?utf-8?B?YVVJSVo2dW9iOFRCYjFSdnBoUU9MS2J3RVR2aVM1YXdhdzUwV3NjdEM1VTg3?=
 =?utf-8?B?NnZHTGZseTZ2aUtTNHZtNnY1MnBSRnJCWEJlajFrRlE2aUFkdm5vdFhPb3pB?=
 =?utf-8?B?eVprVHg4OXJyYlJHanEzMlprK2VRVFdwY0hRcUMwVTVabWxPQlBiWTdJS2Mx?=
 =?utf-8?B?SWJiV2FZSFVualhhU01qQ2xiMXVDNUVsTjd4Q1gyRkZyaGRib3ZjdExxYjh4?=
 =?utf-8?B?ZmlpcnN3QlA1M0M3eGVidWNDamJXU3RUZDNsSW5KMUxFRmlwM1pxQnlOQUVh?=
 =?utf-8?B?Vm9majMzWW9xM05uQ2JVMTg2NE84U3I4WVlnZkozQktKenhtQURoT3ltTERQ?=
 =?utf-8?B?S2xoV2ZzNHNIdy9lYXQvWld4WUh3akFYdTBzRWFaTE9hVlpSSENvZ3c3ek1r?=
 =?utf-8?B?bTZDZVRla0NKWnM0bVJybmtScGpHdVlVOEp1SmYzblZ4RGx6WnI0Und5bTZQ?=
 =?utf-8?B?Ni9WR0hxSTd1SHRvTUxaWE9lSjE1RG1ucnpIWm43MktsTkE2QWpUSUpXM3BI?=
 =?utf-8?B?ZW9vck1iWEMzYVRhcXgvOXVXNkhnMm5Tekw4MUFRY0JlMUE1VzE1ZUZHbkdo?=
 =?utf-8?B?TWxyRHYrVTExZ2JicFVHR2hGUjlIcUNyQ0dKWmNzWnJHczN6bEs2UjU1bGZS?=
 =?utf-8?B?VS9QMllwL2RhdU1Cd3Exc0xOVWJyeVludThrSHNwNlRrWlNSUTZnbE9LclYz?=
 =?utf-8?B?YVNOcEFyK1BZQnMxVmxDUUMzYjNYek1kc0s3dXEzUEl3TjZlYi9IYzBGbWJ2?=
 =?utf-8?B?ZHlGUUt5OW8rZlhBYStWZUlyNXQwcHEreUhuUlhCVENaM2RjTGtVdHR3WkNP?=
 =?utf-8?B?ZWFNc1B2VlEwdDZTVUtKaVlnWHJoN3FQWFF2dHdMMnFIaFVIUDMxUnNqMXJQ?=
 =?utf-8?B?R0FwUDVIWVhadXdpbVovalo4SUpxZ1oxQ3FHTjJYcWd0NnBYMEJGNXVrRlVM?=
 =?utf-8?B?bGRKWnVjQ1JiMGZqbXJnOUZhbDJwTzIvcFBOTFRhVEJlSlcwUWZ0ckdyd1NO?=
 =?utf-8?B?ODNmZGhZTExHTWQvTFNtVVdGcU9QcTd1MDZlQ29LK0lQUmZZRFE3M0FWNEJX?=
 =?utf-8?B?YXRnNjRhUEI1cDgvajhLYkxtOStXVkJMejkxNXdydnU2aEVaa3RiNjUwQUY5?=
 =?utf-8?B?ZG0zOHdibS9BeGVCM1RZYzFlbXIya1F3cit3SG5vb1JSTGszU2t5Nmx0WE1v?=
 =?utf-8?B?MXBWdUh4dkJsZjUzbWpwZ0xSdnJmT3ptZFEwWVJBSmNBUUJoUFIvUHpiWE91?=
 =?utf-8?B?aEduTVpUL1VSVWY5YUpicWRlWEdPVjlpcVFIV3o4dUtKTWp6WFpvOVQ3ckdn?=
 =?utf-8?B?eTErWGRNQjI3VFRIaDY5c1BEVCsxOE9pOG9wWjdXdnBBb1V0L0kwazlUMmc0?=
 =?utf-8?B?VHpQU3dvT0QrM2Eyd2FGaTYwTXk2MFVLZFNjbE9TVGgyc3B5Sm5lZkRDM3lO?=
 =?utf-8?B?SDhzOWplZE1WcjNSU29oSXpYRXJCSjFvOGlXRHlUc0ZuN1lValRVRFdzRDUw?=
 =?utf-8?Q?GZLHZ5MIAadb5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB10373.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFRlSjRvMm9vMC85cTlBTFVtMnFQTFhyeFdqWmNuOWZjaEU5d1Uzbno0RlF1?=
 =?utf-8?B?ZFZBNjFrR09oQWFmZzZVcTVvVUg0bGNtaml1elhIMXdOcFFMbkFZWTFHdk54?=
 =?utf-8?B?NklHUXYvYmtvaWZLQ1psbXd2c29iTU9GaklLUmVJTitwVlAyS0Z3TzJ2TEdW?=
 =?utf-8?B?SVN5SGFVaTR2ZDYwQW1FclNteVJ4MGlNNFY5NUdQNnZyc0dQYmVQbjY1Q240?=
 =?utf-8?B?MG1mKzhZbVJVSEthUTl1cUZjM1M1N3lFcDBxMVBCdDdEdHFnMVBTTHRyMEVV?=
 =?utf-8?B?UkZLZ0FsL1dJOEJoQy8wdGZCd3J2c1Y4T2x2WE5BTzdEdWsxYWdlWStQNlkv?=
 =?utf-8?B?MWU4TmdzaG11Vm1yYlBMdUMweGlwOE1WMlRlcE9HQ2ZxU0U4R0Qxck02YTlu?=
 =?utf-8?B?TUYxWFcxeTRIdHFuMmY2MzE4UStpbStyd2UrL0pEVTRqRWZIUVdxWFg0dGlh?=
 =?utf-8?B?K3RLYTVpckg5WWVwazBlT1FUS29VRm5WUUtNSFJJZW10dkc4a3N1Z2tZTVBh?=
 =?utf-8?B?WHJNNFNlZ21GbmthbkcvL0IyUFhsbXdzVDJ6Sy9GMU1NTU5YZGRuaWZFU3ZQ?=
 =?utf-8?B?YWk3d3ZPUzZMQ1FCMkFHQTEyUTY2NitFdmlrbWlLcHdPUEZ3aTk3Um50aXYr?=
 =?utf-8?B?WUZ3clVXdDdQVStlSnZCT2pGY2ZaT0krYkRNenZlblQzSURFSXZRcnZEaVI0?=
 =?utf-8?B?NU5KejExYUNyRjk3cTZ3VGx0OHQ4bzNPMFdXS09EdlA3ejdHdXVkcFhTSVlJ?=
 =?utf-8?B?Q0UxSWIzT3cydFFOVzU0QWF3S29jNWozYmpNL3ZXY1NZeXRIT0oyN3hSRWFm?=
 =?utf-8?B?NzNBdlNtcWdnaEoxb3lvblZBdzBCa1hYUnBwTlRZK3lFNCtIUVJFYlRjNzJT?=
 =?utf-8?B?K1l4MnhueVdoYmx6djNwSGIzSUpPQjRDZzhRVU00ODBNZ01uZFNLbFV1UWpr?=
 =?utf-8?B?Q0tpTlFmcXYxbWw0YkdONGduRzdtTENDWW9sZTlJYlFxS3RqUU8xWndiYVEz?=
 =?utf-8?B?a0p2Yk1jdmYwZWlXNWpiWDNVVjJLSEs1Rno4ZEJzMWl4a0JmTzRqQlZxK085?=
 =?utf-8?B?dGNNZkJKaW9XMzJQU3l5U2VWeGVKZ3VJK1NCL1BBWTIrQ1dsODVrb3pYaERm?=
 =?utf-8?B?UjYxR3dWYTBTQTdKM2d1L284QUtTNU91MmZ1cTY2ZmRzaTFTODRuclpTKy9X?=
 =?utf-8?B?d09QdU1hRXpSQitzdy9oYnUydEpGNTYxWkl4bEEyeVVSVVFuVWVNVFMwcnEr?=
 =?utf-8?B?TXcyNE1nd3p2dWNuV3d1SDkzVzNtQkdRTlExN2djYU1PSEJ6SUJSTXJGQUxi?=
 =?utf-8?B?WHp6UStGejl6SzJ2akx0YVZNaVhtWnlqSjA2blpXQ0ZqQWorVldmdTRWbHR6?=
 =?utf-8?B?S3NuaTk1SXpGaGh3Q1g0NzZiV3RFcEN4bnpsVU5JM2ZRVFZnWkxRVFg1YW1U?=
 =?utf-8?B?WnFmNXVmcjhoeUtreENQYXg4L0JGOUpPME5hbzd3dmhtYUhCbFVCYXVxeTNj?=
 =?utf-8?B?MXVWR0hEM1JtYUE4Um5GSVJKT2swMzQ2OFBoQ0pPYTBOZWFJS25NZHRjazg3?=
 =?utf-8?B?d0Z0Q3RIV1A5YUZPMjJOcWE0V1h3VVBLWVFUS1VQNjVUVUdXVTM4dG45Rm5N?=
 =?utf-8?B?VWZSVFRyZE9QVFF5dnRBWVRLNm4zWFZ5SFdUZVEwS2t3WnhlYXNWT2ZhaGhN?=
 =?utf-8?B?NnRVaktJKzFDWTZPTjdqcEdjbVN2R2xubXJmVFBkOU9VU1B2WS9wMTA1aWRm?=
 =?utf-8?B?UnFLMUlDb2d6OCtnZGZCamw5ZTZFMjZIdVFVaUIrMSttbFpCMlhYaHpMSG1M?=
 =?utf-8?B?RXIwcDZ1cUdVaUluQVhYS00xdUdZUE0wbC9zNTZsTHVSTDBaekh6Y2llbXB1?=
 =?utf-8?B?V0RTREFtV29PQ0o3bEwvV1Jja25QQndvQ29Cd05ENWJrWnMxMGh2V2lUV3JP?=
 =?utf-8?B?NFZ4dHlqRmpPclFSbHJGZjFvTFNZQWtXUWp0MjJ0ODl5cEZncVBteklISHcr?=
 =?utf-8?B?eG1HYjYzbFZ5ckJCZTAzeTgxdHNmTGpDaVVuRWZSTE85K0JhVzhDb2Jybnlr?=
 =?utf-8?B?ZHVFeWNEaDIvSU91ODBrckwyOHovOGpTUC9TM285bFBQbTN5eEQxbTMrQ05a?=
 =?utf-8?Q?Sf3alUgkAhSY3GxZ+mCSPNA9l?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4040c6cc-0ca2-458d-e322-08ddd9af94b5
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB10373.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:50:29.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAIgeZzX2wFhdrxvW2Fhthi5safTDMj+pdd//OZkoPVBuzxFizepO1X26h39j8yb8K4tIjCtlFmjuYE8s9Bj+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9439

Friendly PING!

On 6/16/25 16:29, Anders Sandahl wrote:
> Hello,
>
> Please let me know if I need to do something more?
>
> BR Anders
>
> On 4/29/25 15:59, Anders Sandahl wrote:
>> Introduce support for saving a timestamp triggered by an external
>> event via the EVIN pin. After an event detection, the timestamp can be
>> retrieved from timestamp0 in sysfs.
>>
>> Also add a sysfs control timestamp0_write_nvmem to enable the RX8111
>> feature that stores timestamps in NVMEM as a circular buffer.
>>
>> Signed-off-by: Anders Sandahl <anders.sandahl@axis.com>
>> ---
>> The Epson RX8111 device has support for saving a time stamp when a
>> hardware trigger occurs. It also has a register area that can be used
>> as non-volatile memory.
>>
>> Datasheet: https://download.epsondevice.com/td/pdf/app/RX8111CE_en.pdf
>>
>> Timestamp is made available in the same manner as in "rtc-rv3028.c"
>> through sys-fs. NVMEM is made available using the framework functions.
>> ---
>>   drivers/rtc/rtc-rx8111.c | 351 
>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 349 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-rx8111.c b/drivers/rtc/rtc-rx8111.c
>> index 
>> 8450d9f0b566c63bca04988d892ea4db585ac526..4f428eb98f4858b4c70b3a5709d8204a77d0a1ea 
>> 100644
>> --- a/drivers/rtc/rtc-rx8111.c
>> +++ b/drivers/rtc/rtc-rx8111.c
>> @@ -58,7 +58,14 @@
>>   #define RX8111_FLAG_XST_BIT BIT(0)
>>   #define RX8111_FLAG_VLF_BIT BIT(1)
>>   +#define RX8111_REG_TS_RAM_START        0x40    /* Timestamp RAM 
>> area start. */
>> +#define RX8111_REG_TS_RAM_END        0x7f    /* Timestamp RAM area 
>> end. */
>> +
>> +#define RX8111_BIT_EVIN_SETTING_OVW    BIT(1)    /* Enable overwrite 
>> timestamp RAM. */
>> +#define RX8111_BIT_EVIN_SETTING_PU1    BIT(3)    /* Pull up select 
>> 1. */
>> +
>>   #define RX8111_TIME_BUF_SZ (RX8111_REG_YEAR - RX8111_REG_SEC + 1)
>> +#define RX8111_TS_BUF_SZ (RX8111_REG_TS_YEAR - RX8111_REG_TS_SEC + 1)
>>     enum rx8111_regfield {
>>       /* RX8111_REG_EXT. */
>> @@ -98,6 +105,11 @@ enum rx8111_regfield {
>>       /* RX8111_REG_STATUS_MON. */
>>       RX8111_REGF_VLOW,
>>   +    /* RX8111_REG_TS_CTRL1. */
>> +    RX8111_REGF_TSRAM,
>> +    RX8111_REGF_TSCLR,
>> +    RX8111_REGF_EISEL,
>> +
>>       /* Sentinel value. */
>>       RX8111_REGF_MAX
>>   };
>> @@ -134,12 +146,16 @@ static const struct reg_field 
>> rx8111_regfields[] = {
>>       [RX8111_REGF_CHGEN]  = REG_FIELD(RX8111_REG_PWR_SWITCH_CTRL, 7, 
>> 7),
>>         [RX8111_REGF_VLOW]  = REG_FIELD(RX8111_REG_STATUS_MON, 1, 1),
>> +
>> +    [RX8111_REGF_TSRAM]  = REG_FIELD(RX8111_REG_TS_CTRL1, 0, 0),
>> +    [RX8111_REGF_TSCLR]  = REG_FIELD(RX8111_REG_TS_CTRL1, 1, 1),
>> +    [RX8111_REGF_EISEL]  = REG_FIELD(RX8111_REG_TS_CTRL1, 2, 2),
>>   };
>>     static const struct regmap_config rx8111_regmap_config = {
>>       .reg_bits = 8,
>>       .val_bits = 8,
>> -    .max_register = RX8111_REG_TS_CTRL3,
>> +    .max_register = RX8111_REG_TS_RAM_END,
>>   };
>>     struct rx8111_data {
>> @@ -147,8 +163,224 @@ struct rx8111_data {
>>       struct regmap_field *regfields[RX8111_REGF_MAX];
>>       struct device *dev;
>>       struct rtc_device *rtc;
>> +    spinlock_t ts_lock;    /* Don't allow poll of ETS bit when it's 
>> temporarily disabled. */
>>   };
>>   +static ssize_t timestamp0_store(struct device *dev,
>> +                struct device_attribute *attr, const char *buf,
>> +                size_t count)
>> +{
>> +    struct rx8111_data *data = dev_get_drvdata(dev);
>> +    int ret, etsval;
>> +
>> +    /*
>> +     * Clear event only if events are enabled. This is to protect
>> +     * us from losing events in the future if events have been disabled
>> +     * by mistake (error in read function).
>> +     */
>> +    spin_lock(&data->ts_lock);
>> +    ret = regmap_field_read(data->regfields[RX8111_REGF_ETS], &etsval);
>> +    spin_unlock(&data->ts_lock);
>> +
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not read ETS (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (!etsval)
>> +        return -EINVAL;
>> +
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_EVF], 0);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not write EVF bit (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_TSCLR], 1);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not write TSCLR bit (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t timestamp0_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct rx8111_data *data = dev_get_drvdata(dev);
>> +
>> +    struct rtc_time tm;
>> +    int ret, evfval;
>> +    u8 date[RX8111_TS_BUF_SZ];
>> +
>> +    /* Read out timestamp values only when an event has occurred. */
>> +    ret = regmap_field_read(data->regfields[RX8111_REGF_EVF], &evfval);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not read EVF (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (!evfval)
>> +        return 0;
>> +
>> +    spin_lock(&data->ts_lock);
>> +
>> +    /* Disable timestamp during readout to avoid unreliable data. */
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 0);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not disable timestamp function (%d)\n",
>> +            ret);
>> +        goto err_out;
>> +    }
>> +
>> +    ret = regmap_bulk_read(data->regmap, RX8111_REG_TS_SEC, date,
>> +                   sizeof(date));
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not read timestamp data (%d)\n", ret);
>> +        goto err_out;
>> +    }
>> +
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not enable timestamp function (%d)\n", 
>> ret);
>> +        goto err_out;
>> +    }
>> +
>> +    spin_unlock(&data->ts_lock);
>> +
>> +    tm.tm_sec = bcd2bin(date[0]);
>> +    tm.tm_min = bcd2bin(date[1]);
>> +    tm.tm_hour = bcd2bin(date[2]);
>> +    tm.tm_mday = bcd2bin(date[4]);
>> +    tm.tm_mon = bcd2bin(date[5]) - 1;
>> +    tm.tm_year = bcd2bin(date[6]) + 100;
>> +
>> +    ret = rtc_valid_tm(&tm);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return sprintf(buf, "%llu\n",
>> +               (unsigned long long)rtc_tm_to_time64(&tm));
>> +
>> +err_out:
>> +    spin_unlock(&data->ts_lock);
>> +    return ret;
>> +}
>> +
>> +static DEVICE_ATTR_RW(timestamp0);
>> +
>> +static ssize_t timestamp0_write_nvmem_store(struct device *dev,
>> +                        struct device_attribute *attr,
>> +                        const char *buf, size_t count)
>> +{
>> +    struct rx8111_data *data = dev_get_drvdata(dev);
>> +    bool enable;
>> +    int ret;
>> +
>> +    if (count < 1)
>> +        return -EINVAL;
>> +
>> +    ret = kstrtobool(buf, &enable);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_TSRAM],
>> +                 enable ? 1 : 0);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not set TSRAM bit (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t timestamp0_write_nvmem_show(struct device *dev,
>> +                       struct device_attribute *attr,
>> +                       char *buf)
>> +{
>> +    struct rx8111_data *data = dev_get_drvdata(dev);
>> +    int enable;
>> +    int ret;
>> +
>> +    ret = regmap_field_read(data->regfields[RX8111_REGF_TSRAM], 
>> &enable);
>> +    if (ret) {
>> +        dev_dbg(dev, "Could not read TSRAM bit (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return sprintf(buf, "%s\n", enable ? "1" : "0");
>> +}
>> +
>> +static DEVICE_ATTR_RW(timestamp0_write_nvmem);
>> +
>> +static int rx8111_sysfs_register(struct device *dev)
>> +{
>> +    int ret;
>> +
>> +    ret = device_create_file(dev, &dev_attr_timestamp0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = device_create_file(dev, &dev_attr_timestamp0_write_nvmem);
>> +    if (ret)
>> +        device_remove_file(dev, &dev_attr_timestamp0);
>> +
>> +    return ret;
>> +}
>> +
>> +static void rx8111_sysfs_unregister(void *data)
>> +{
>> +    struct device *dev = (struct device *)data;
>> +
>> +    device_remove_file(dev, &dev_attr_timestamp0);
>> +    device_remove_file(dev, &dev_attr_timestamp0_write_nvmem);
>> +}
>> +
>> +static int rx8111_setup(struct rx8111_data *data)
>> +{
>> +    int ret;
>> +
>> +    /* Disable multiple timestamps; area is used for nvmem as 
>> default. */
>> +    ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL2, 0);
>> +    if (ret) {
>> +        dev_dbg(data->dev, "Could not setup TS_CTRL2 (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL3, 0);
>> +    if (ret) {
>> +        dev_dbg(data->dev, "Could not setup TS_CTRL3 (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Configure EVIN pin, trigger on low level. PU = 1M Ohm. */
>> +    ret = regmap_write(data->regmap, RX8111_REG_EVIN_SETTING,
>> +               RX8111_BIT_EVIN_SETTING_PU1 |
>> +                   RX8111_BIT_EVIN_SETTING_OVW);
>> +    if (ret) {
>> +        dev_dbg(data->dev, "Could not setup EVIN (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Enable timestamp triggered by EVIN pin. */
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
>> +    if (ret) {
>> +        dev_dbg(data->dev, "Could not enable timestamp function 
>> (%d)\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Disable all interrupts. */
>> +    ret = regmap_write(data->regmap, RX8111_REG_CTRL, 0);
>> +    if (ret) {
>> +        dev_dbg(data->dev, "Could not disable interrupts (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned 
>> int *vlval)
>>   {
>>       int ret;
>> @@ -160,6 +392,17 @@ static int rx8111_read_vl_flag(struct 
>> rx8111_data *data, unsigned int *vlval)
>>       return ret;
>>   }
>>   +static int rx8111_clear_vl_flag(struct rx8111_data *data)
>> +{
>> +    int ret;
>> +
>> +    ret = regmap_field_write(data->regfields[RX8111_REGF_VLF], 0);
>> +    if (ret)
>> +        dev_dbg(data->dev, "Could not write VL flag (%d)", ret);
>> +
>> +    return ret;
>> +}
>> +
>>   static int rx8111_read_time(struct device *dev, struct rtc_time *tm)
>>   {
>>       struct rx8111_data *data = dev_get_drvdata(dev);
>> @@ -289,11 +532,69 @@ static int rx8111_ioctl(struct device *dev, 
>> unsigned int cmd, unsigned long arg)
>>           vlval |= regval ? RTC_VL_BACKUP_LOW : 0;
>>             return put_user(vlval, (typeof(vlval) __user *)arg);
>> +    case RTC_VL_CLR:
>> +        return rx8111_clear_vl_flag(data);
>>       default:
>>           return -ENOIOCTLCMD;
>>       }
>>   }
>>   +static int rx8111_nvram_write(void *priv, unsigned int offset, 
>> void *val,
>> +                  size_t bytes)
>> +{
>> +    struct rx8111_data *data = priv;
>> +    int ret, len;
>> +
>> +    /*
>> +     * The RX8111 device can only handle transfers with repeated start
>> +     * within the same 16 bytes aligned block.
>> +     */
>> +    while (bytes > 0) {
>> +        len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : 
>> bytes;
>> +        ret = regmap_bulk_write(data->regmap,
>> +                    RX8111_REG_TS_RAM_START + offset, val,
>> +                    len);
>> +        if (ret) {
>> +            dev_dbg(data->dev, "Could not write nvmem (%d)\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        val += len;
>> +        offset += len;
>> +        bytes -= len;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int rx8111_nvram_read(void *priv, unsigned int offset, void 
>> *val,
>> +                 size_t bytes)
>> +{
>> +    struct rx8111_data *data = priv;
>> +    int ret, len;
>> +
>> +    /*
>> +     * The RX8111 device can only handle transfers with repeated start
>> +     * within the same 16 bytes aligned block.
>> +     */
>> +    while (bytes > 0) {
>> +        len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : 
>> bytes;
>> +        ret = regmap_bulk_read(data->regmap,
>> +                       RX8111_REG_TS_RAM_START + offset, val,
>> +                       len);
>> +        if (ret) {
>> +            dev_dbg(data->dev, "Could not read nvmem (%d)\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        val += len;
>> +        offset += len;
>> +        bytes -= len;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct rtc_class_ops rx8111_rtc_ops = {
>>       .read_time = rx8111_read_time,
>>       .set_time = rx8111_set_time,
>> @@ -305,6 +606,16 @@ static int rx8111_probe(struct i2c_client *client)
>>       struct rx8111_data *data;
>>       struct rtc_device *rtc;
>>       size_t i;
>> +    int ret;
>> +    struct nvmem_config nvmem_cfg = {
>> +        .name = "rx8111_nvram",
>> +        .word_size = 1,
>> +        .stride = 1,
>> +        .size = RX8111_REG_TS_RAM_END - RX8111_REG_TS_RAM_START + 1,
>> +        .type = NVMEM_TYPE_BATTERY_BACKED,
>> +        .reg_read = rx8111_nvram_read,
>> +        .reg_write = rx8111_nvram_write,
>> +    };
>>         data = devm_kmalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>>       if (!data) {
>> @@ -312,6 +623,8 @@ static int rx8111_probe(struct i2c_client *client)
>>           return -ENOMEM;
>>       }
>>   +    spin_lock_init(&data->ts_lock);
>> +
>>       data->dev = &client->dev;
>>       dev_set_drvdata(data->dev, data);
>>   @@ -331,6 +644,10 @@ static int rx8111_probe(struct i2c_client 
>> *client)
>>           }
>>       }
>>   +    ret = rx8111_setup(data);
>> +    if (ret)
>> +        return ret;
>> +
>>       rtc = devm_rtc_allocate_device(data->dev);
>>       if (IS_ERR(rtc)) {
>>           dev_dbg(data->dev, "Could not allocate rtc device\n");
>> @@ -343,7 +660,37 @@ static int rx8111_probe(struct i2c_client *client)
>>         clear_bit(RTC_FEATURE_ALARM, rtc->features);
>>   -    return devm_rtc_register_device(rtc);
>> +    ret = devm_rtc_register_device(rtc);
>> +    if (ret) {
>> +        dev_dbg(data->dev,
>> +            "Could not register rtc device (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = rx8111_sysfs_register(data->dev);
>> +    if (ret) {
>> +        dev_dbg(data->dev,
>> +            "Could not create sysfs entry (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = devm_add_action_or_reset(data->dev, &rx8111_sysfs_unregister,
>> +                       data->dev);
>> +    if (ret) {
>> +        dev_dbg(data->dev,
>> +            "Could not add sysfs unregister devres action (%d)\n", 
>> ret);
>> +        return ret;
>> +    }
>> +
>> +    nvmem_cfg.priv = data;
>> +    ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
>> +    if (ret) {
>> +        dev_dbg(data->dev,
>> +            "Could not register rtc nvmem device (%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>>   }
>>     static const struct of_device_id rx8111_of_match[] = {
>>
>> ---
>> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
>> change-id: 20250424-rtc-rx8111-events-df9a35810a73
>>
>> Best regards,

