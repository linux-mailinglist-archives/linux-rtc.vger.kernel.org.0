Return-Path: <linux-rtc+bounces-5833-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G83KZ4dcmmPdQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5833-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:52:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539966E27
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8331D8E8B6A
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 12:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE953ED114;
	Thu, 22 Jan 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="IHPM8/IW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021127.outbound.protection.outlook.com [52.101.65.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAC32FA3F;
	Thu, 22 Jan 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084851; cv=fail; b=as4IUY9zyY+wk93XFoaA+o6I2JfxY+z39lP1dw7PRrGCTtPiySey6HaDDJhCU1TMduXF+KXBuwJZaEwGc9hfAkUkW7Q5dTFI4RgyGryszhy+TRSfp8zVN6df9Wvp9ty56A2ZpgGV0PVS3hyJNiVjZTj8qxJTcF+myBLiAchpFOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084851; c=relaxed/simple;
	bh=+XeAlhyVrYot1sQOpmkkJELIQJ5wQ4gTz7FLGY3qCpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RKZXjri5w0smE3zpZoKt0Q3vH5CyZD+dV76dBsFvnFwAcFN4eXrybrePQGlOgowmDrchnjkYluGQuS39BZp7BgPWoSjdIT1z32kVUtCyjA/JVYmzEbJJYxQTagUh+/Ur1CwY1TDpAL1Igh0Awgoyj/L1xKoCyXvzvdqz6nHxL6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=IHPM8/IW; arc=fail smtp.client-ip=52.101.65.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnfAoqcOXYHLn1nw95AG/x+BxaLCTVRdhC4Zfp2mHc+i4Xjj/PGxuR/b2zMqDy3Od5ME6Uxxm8z9cVo+iMyPQlWF25mXCRPk6F0I5NbWo0Yla9R/oy0Yn/ioWOo/7YbSJ4v43JSjB+KLApyPiGbiDAHjN79cWli1EfBD/yUvez731XbTH05egfVl5njZR2rzzasVA72kAImg585QO3VbaU2WjndnRyJkdzaPCtMD4qdni6klEVzTgE7Ilc65qRuuq1Trv/OS5lV9jnZJ5HaHuFm7TIjteQ8t7YlWFhx/2bPjqb8MDpmJsp4fAbNzmn0qrc/16ebaH8H7p5dsda9thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ROLlOCt65cMpBz0B7uUxjDaHBo0D05YKIJBfPCz16s=;
 b=k2nuDITCFzwqHlK5sKL8BS0WLU2RAbsa0MmaOIxyFaI4RP8Y95oS1HeiFfTk50hS+olwgX62wk0gwMIl9ZAHII9S5GcLEYAGgIugKEgkNFbq4K5LyQf72XdHOigfgiekBaFFmR3deNhooSAJhU3exRZbwsxFUdPaET7l8BEcdrsnz9dkoVWxfWUcIFLfCA/SF95iL/CcIeUJawEhyG2/OshfWLhNKxmjXFUl/+kx/gZMl+8gGBebyvzEYn4K6nLsWv30VMqVGsVGflJ1Hy70z63kuFBcK4g42GGRWiRTLGbNbzF2vcch1lnh8gAXgLeXQlm7/YtTV0s6FdSjOExfkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ROLlOCt65cMpBz0B7uUxjDaHBo0D05YKIJBfPCz16s=;
 b=IHPM8/IW6Ue5n7m4CMGb5OSdOZdvyHgFvgWKkc+GbtT54aAEC8BD2aCR1g6Usu26W9iVRUK3SVPiAwEdi/0P8HIIvY/56jYYvsxRsndDOPXPEqtIaT61SRJa15EE6eMy8tGQJDId2AqzV2KRzAcVUp7pEBElppDpL1o1cwA1hmllBDPsqxb0UvQTTgQ38eBkTWLEr/aCOyZOewQ969dsPuzusGjQ3ZSDl+94w1suYFO4FWdTWkQcgfeK8eag4GFFdpDZq+xtgUmJN8NIfAlZHiXeggXMlhxmfoaA1iaE2FsA2SVYx0XPCRF/m5w8CFRvrctGZTtTV5c1uvxQPxl3vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by VI1PR06MB8997.eurprd06.prod.outlook.com (2603:10a6:800:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:27:19 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:27:19 +0000
Message-ID: <d63d7f6f-0ff3-4f2d-8326-96b29d7fe57c@vaisala.com>
Date: Thu, 22 Jan 2026 14:25:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] rtc: zynqmp: declare dependency on arch
To: Michal Simek <michal.simek@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
 <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
 <a373e247-3936-4c16-993b-ca8fb732fb18@amd.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <a373e247-3936-4c16-993b-ca8fb732fb18@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0046.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::17) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|VI1PR06MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e481e63-b6ff-41f4-8ae0-08de59b19606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGxUaTVXbnNSNVkzZmdZQlNTa1h3OWo1b2VhVFhxRGNlT2lwY2ZJME5iREsz?=
 =?utf-8?B?cDk5T0JZSTBrbW9BaXNCaVdIY1lXclV3TSs0RmpQZU85dFluWVkvK3F1V0Nl?=
 =?utf-8?B?S3A3RUQ4Q1ZIWlJMb2dsOHY4SWVtU2hYMFg2SnJnTEp4ZTVGMmRWckxtcEtw?=
 =?utf-8?B?SHJNTDUvYkhncnBXaE1WeEJ3Q21RSjlmdUJwallrY1E3b2lMK1U4R3JUdDhB?=
 =?utf-8?B?ZGR0SjkxdlVFZWc3dTVmYzNqUk12WVpyZnJrbm51RjduNEdPNzJvNjhaM1BZ?=
 =?utf-8?B?V0QrVjZGbGdiYytSSzVUbFRlaFdHQmVHby9JVVhLM1hNQzFRTjNpWTVCKzJY?=
 =?utf-8?B?bHFyZUJWWGhqdS9ZdVBJQy9BZURId21ITCtEQ3FSajAvSmpDOFk0QTFaZ1Y4?=
 =?utf-8?B?Mk92K1VaalNpWVhNNTEydWFqUnRNS1hFSk94ZGRQcXZFRmx6b3JoUVVQS3BT?=
 =?utf-8?B?bzQrZUpOWm9KMzhTck9FU1pYeEs5bUNPblRtQzRwT3ptN3RVd3A0VldTTjNj?=
 =?utf-8?B?a2xucTNkM1ZlVDZFWkJmR253eFZHeGMvSEpxelNhcm9FekREN2R2Y21HLzhM?=
 =?utf-8?B?eXFwUU5Wakx4MzA0K3ZTNXhJT25pcSs5dVdMQXdPZzQ4UFdXVEo3cFJjSlUy?=
 =?utf-8?B?dU5yWDhZdThGYm9pd2NUR1RXY3VTUTNZWUpGaUZQbkNSQXhDdmQ0N1UyUkpK?=
 =?utf-8?B?OFFTVnFpQzJhMHdNYzlJUTEwSi9zM3RqVmpzZ2hpR0NTdm4rb01TNlZ3WmM5?=
 =?utf-8?B?OFBYOGR4UGNaOVE3K09oS2lyUU4zRTlaV0YrUWtqSjllQzh3MmJSV09vS3pC?=
 =?utf-8?B?S3RLVE9SdWVMVTJWbEtOVnd1SFQyTUQ4MmRxS0VNTitXMDdYSklkSWoyaThH?=
 =?utf-8?B?b0IvcHhJS252SnUxM1VhWnZ4cGlyOFl4M1RaRmw3cTNud2cxUFNWbjNCeG9C?=
 =?utf-8?B?M1lYZzlDTGh5UHdoZWx6REppWE5UekJGQldKUHk0d3R1VHIrMlkyaTd4VVlz?=
 =?utf-8?B?b1dFV0tmT1VjcllwNGtlb0IvbHhtejlWdFNhdEIweHlFTUg1WldOdldQMWI0?=
 =?utf-8?B?WldrWDMwWjlmZmxPY0VuU1lXb2ZNaTRZRTc3NWttbG1KM3Qvd2xGQkxVdVY5?=
 =?utf-8?B?aVZqT0R4YVpveFoyK0pFK1RDZzU0VzNKZzl6Tzljc2VHKy9FT0QwSVI4SHV6?=
 =?utf-8?B?Tks1MGxFcm53Zkt6UUpERkp2Yk9HNXRNVS9pT0hMQk5kM0Z4amwvTGI2NFFi?=
 =?utf-8?B?K212SWFJb3p3RGt4Rm1aQXMrS0F5RGxVeTdkbVN4TTB0dnB3L0Q1eEJ2eFhH?=
 =?utf-8?B?ZnZZdXFRdEVpUW5RTzQ5bzhoMU44MXBPTEhzSmxLV0Iwdkd3azEvWk82VTRs?=
 =?utf-8?B?L3E5Q2pjSDdBRjIrRmVXSWpwSnFYakJZZ2crcEl3MlBVNGNid1FKcjBZbTBt?=
 =?utf-8?B?SFQrajNiZXJKOXNWRkZ6eXVCaDRBYXh4dzUxblhIZVQ2RVA2NzFnOTR2OUli?=
 =?utf-8?B?Y28rQkVVNmZjd29LWmVwOXdySUtmeW1ZbmhhL3RVcVo4aGtLNlVwNFM5Qk1w?=
 =?utf-8?B?bTc2Tm1xL2czVTJkMFFHRFBaeDdxMVQzUlNZNEROazB0VUZ4UnE2Tm9mNGJv?=
 =?utf-8?B?T1pwZ1pVekZ2akszVzFkUkhFbVpRUFRBVVpuS1NzV25nSWQ3L29BTlNmQkJL?=
 =?utf-8?B?MytsTjZKVWNVVCt6MURJQSsraG5TbWEzM0N2NUFycEtIaTFEN2M1Rml0MmVC?=
 =?utf-8?B?MFlVUmVoeWh2bGN6b2liZjFodHl3TG9UMjdqbUlhZ0JlUmV2YWZxWGJKQVZU?=
 =?utf-8?B?TjJnL0tGRUh2Vm1NOTFuRmlGUytzcHdZOVIzOWgwMnNuckN2Z3N6ZE1yZyt0?=
 =?utf-8?B?a29BdnR0dU9jT2NENHFIQUlsYStlZ0NUVFBlM0lUOFJtUFloaGIxdzRBTFJ2?=
 =?utf-8?B?TG9RbC9qVWMvOGMrbDRqakxlV2o2S3FicW5FL3p3ZjZ1V2dIUUVKNzBUZTRB?=
 =?utf-8?B?eThjb3h2N3Erb0lvdStINE1BMnpUSWkxeUNqcGlvbHMxQUdRbjRtNi8weG9w?=
 =?utf-8?B?VEpxSzZkTktIZzEyNFV2TDgra0k2Q1B2YU5xc2lLWXB3WFZaRnIrZGtIbUVY?=
 =?utf-8?Q?Ya68=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxaVVFLRTZTbWY2LzR5R1VyNk1LRFlGUXN2eTd4b2hlYjJISDhNbVlGREdE?=
 =?utf-8?B?bFpiNklWeU4yOHRQYW40OWRFM21IbWgvV1dMRTU0eldQOGFNLzlOOGhjOXN6?=
 =?utf-8?B?Qm1TcEsyZTRtdzUvdkwxMkptVnNlU1lUWncrOWh2TkpEYW9DOUlyS3NaOVZj?=
 =?utf-8?B?aXJ2VWJza3pvTGVSa1NwQ001L3NPYktSU3l1RXUrc05zOFN3bDRvNE5PcG1R?=
 =?utf-8?B?VVN1VGIvcnV3akgrYmNHM2V2ejJyUW1UWXFkQUVIYUcxajRQenRpV0dWWlVZ?=
 =?utf-8?B?VUNIakpmNWRrVS9BQU4rR2pQdGQ0TUkxQjBNaUJCN2xlM1RUVlFuWktJU05X?=
 =?utf-8?B?YVJQbllQZnliN0x4RnVTUVNzSFRwK05Ma3pvL29URUNoeGlxS1I0U3dYMFdl?=
 =?utf-8?B?TVJ2ZW14L1UyaWdvSE1DUUZ0bmRJK2tJbE1WOHdwNnAya0xIZ3FCZUJRaHBB?=
 =?utf-8?B?ditpbVk0dUY3QnZRYXh2NkJDZzEwSHFBcFNaSmlXWlVCNTQ2QXBQcks0c2tI?=
 =?utf-8?B?Y3YwSWZET3ltNVVtSnFueGRhK2xWdEtvb2tSam9CWnFZU1BzVHJTT3ZuK2Jh?=
 =?utf-8?B?M090b3htT3NySGdvczBwQjFlT1doZkNMRW4zUGllM3hGQ2Q5QndBZ2FvcUxI?=
 =?utf-8?B?YlM2VTIrZnFZSzFpczFUek5haXYvU2tIZjExTWFiN2c5RWZ2b0N2RXh5UFVB?=
 =?utf-8?B?NGIyZHpmUWRhV214UTllQ3dUSUJHekdrQTBFcWxiWXl6MFVhYU15WGRrYStH?=
 =?utf-8?B?SGtFbVpTajBUYU1OeDBDeWtmMWkzWU1hTnJFbTRoQ3Fvc2d6RGp6NGVVUEpG?=
 =?utf-8?B?TFY2SlNzY0M2dDA2MmREekprVHZVUFF0bE1nM1U1Ryt3eWhVWXZQcEM5ZFpl?=
 =?utf-8?B?ZXFvS1lWN1ZqM3lJNEg0NkcxdURyM1NkbGp0aWdPNUp3WGl3M3E3RWFvYURn?=
 =?utf-8?B?cU9WaUJuc1hydGVTY0Z0UjZ4cFZOTEJxcFpya29EdTg4NmxYZHNlaEN5bkNM?=
 =?utf-8?B?dHAvRTNXQ3JQQXhWSnk5WmV2VkxNekZ1WFNobENzVEtzaVdLY3VhaHNzNXZX?=
 =?utf-8?B?YXpvczNiN3ZUQk1IVENDWkwwWUllclJwRlJEd0x3ZEZsNnY3SDcyTERSc3BF?=
 =?utf-8?B?M1BvS3lDZnFraFR6ZDRmeUk2MzJ0NmJSb3lyKzZYS1pmMW9hVzgvQmorTDND?=
 =?utf-8?B?dkJmZ1lZL28rcUhnVWVSeGJSSCtjT3k3aGw3RVFSRG5ya3RqanlwYXNtNVRk?=
 =?utf-8?B?MzZjdmo5OFBKeHpUY2ZvUXhMaE4xdnVmN3M4dFNUZk9FdkQ4NjRXc3ZyZjZs?=
 =?utf-8?B?aFZxR3RHejNNOG5xTTMwQi90MlExNzROcVZadjdGT0Z4elpWKzBTSS9vR1Rv?=
 =?utf-8?B?TklMeFdhQnlUYXFFWGE5eUlOcnpMNWo3NFdvdmUyY2FKN05DdHBNMzRFRVlx?=
 =?utf-8?B?S0gwTW9KcjI4ZktSNng3WFlKTFlwVDdhb2pLY2c4WER2bTJ3bjFMVTJFcytI?=
 =?utf-8?B?b3Q5V08yT3Nxb053NW9UQXZhbXNRYmg4d1BpdVMrQTBpaloxMWVUTEFWY29M?=
 =?utf-8?B?MTBjcHNwcythU1JDeWdQUDZ4VGdNK1IwQTk1Q2h0WXlTUjlweUVtQWVxenQ0?=
 =?utf-8?B?c0JFRmVGUkNjZmVtbVRKZnFyd2N6cHpCZUd6R0xPTHJRQWFjR1ErNDliZkhY?=
 =?utf-8?B?S3poaWZwNy9OZVJ6cWdUWnNjVDJYVGUvU2VKeU5nUEFvMndyL3VvQWgwQ3FH?=
 =?utf-8?B?aS9XbjMyNTNkQUdndG9FWVNBT2ZhWEtCZTR6bUhWeWxmSHcycGxsRndmNGhy?=
 =?utf-8?B?UTREYWpITDErYnlCekZWdUZMY1RqOEVVcUNtVzlJVGFCM3pzQ1JISUlCenNP?=
 =?utf-8?B?b24zbG1TNjdabCtiOGJ6N0JZS1Nacm9zVDM5andsWndMUVpVdnRUMnRnMUpJ?=
 =?utf-8?B?VHpER05aM2U4QTRRZmZqMVpQNzhabGVjM25KSm80cmxrbU5rVTkyZXVHODJ0?=
 =?utf-8?B?dGJnREFYYnNRek15Q2QwVmVRNWJQQVpxQ05QRWNJWXpOQ3hSUmNCMkZ1Q1RP?=
 =?utf-8?B?S0pCUkQzL3BzNlFpV1d3ZVcrb3k4M1h6QXkrc2I3VkNJcHNRNkRicE9EL1Jk?=
 =?utf-8?B?ckNRZjFqWDFYY0F5U1VOeEo0ekpNT0Nxdk5VcXUwZmNjMFNwN05qdWY5aXl3?=
 =?utf-8?B?YUVVSDd1UFVaQUJ1MjhaUm9RSUEyYjJ3eEpCOURjTVVEanhRazlIMEVVOFpp?=
 =?utf-8?B?TXFpeUN0QTBwSkpHcXczVjNkTUpleldZeTJNaG0wSy94dm5jdWxXbzNmODNU?=
 =?utf-8?B?VnVJR2VDNFY4TTB2QWRKTFRjWnB4bzlIekhZOGJJK0pBZ0ZJMStKZElpZEdx?=
 =?utf-8?Q?3zC1dKADjr4pyEw8=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e481e63-b6ff-41f4-8ae0-08de59b19606
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:27:19.5229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJvZMur+m7cvkzIamh6/eoL4VW0Ke2uou2ct+KzeMC9OeLp/E+Cen7SwoaFqwpA3MyusMVHkcO2JPPLw5crhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8997
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5833-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vaisala.com,reject];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[vaisala.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vaisala.com:email,vaisala.com:dkim,vaisala.com:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 1539966E27
X-Rspamd-Action: no action

Hi,

On 21/01/2026 14:16, Michal Simek wrote:
> 
> 
> On 1/19/26 10:51, Tomas Melin wrote:
>> Driver is compatible with RTC controller found on zynqmp.
>> Configure dependency to enable building only when zynqmp architecture
>> is enabled.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>>   drivers/rtc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..46b497524cbfb5d0c1662dcaddbb6d28b4ae2abe 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -1376,7 +1376,7 @@ config RTC_DRV_OPTEE
>>   
>>   config RTC_DRV_ZYNQMP
>>   	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
>> -	depends on OF && HAS_IOMEM
>> +	depends on OF && HAS_IOMEM && ARCH_ZYNQMP
> 
> 
>     arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function 
> `xlnx_rtc_read_offset':
>  >> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to 
> `__aeabi_ldivmod'
> 
> You should use macros like div_u64() to fix it instead of have driver enabled 
> only for ZynqMP.
I can do it that way if you prefer such approach.

Thanks,
Tomas


> 
> M
> 


