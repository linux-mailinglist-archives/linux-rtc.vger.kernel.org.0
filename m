Return-Path: <linux-rtc+bounces-1956-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A959766F5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 397591F22C88
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 10:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B73419CC18;
	Thu, 12 Sep 2024 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="slSB9f7b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013070.outbound.protection.outlook.com [52.101.67.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1115D5D9;
	Thu, 12 Sep 2024 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138280; cv=fail; b=uQ0hiQy/DtpqO7Ja7EihxrbAEUJGUJwtnozE9XBL3dTY/Cbf5N+oBnB6D72gx6KVFZk4sM7TUxmlCENPeVP47DaVfoRW5v0C31/48LYK79zjZI5BIV/ZnNVWeMgbSW63uMI3EMQ7dkxwIIE2J3iFarjSNENolcWswyfsAsdrDS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138280; c=relaxed/simple;
	bh=hfpPVT6fANFCpsSTVxhsldQZojPrlNoGylIL6b44pLA=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GqWsjvAuE2vDzWV2uLEP3KPVf6ICywKH6a6wvCtJLqDY8TkItgUnbq75jeSaCqpH6ydRfrlqy/s32B5p+bzG56qdT3MHyA//cMKItgofvLO5hhmT7F21DuHx9jCHLoT0Fe2oPD8Mn8trj4/FINT6K5mg2jU4KAJEbH6jLcD5i/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=slSB9f7b; arc=fail smtp.client-ip=52.101.67.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZseDdE9kJc30Odv/TqX8llyIwAHH4vpUBxydsIpCBQiiCx8wf2ggApN/+tmj9FpKY/GxPmRl2dlyfmyb4Jnt5UI3kokgzs5x/lWUe9ZquOw8s2Al4aNhGWlgCFqA4tIhhLhAirLKgAxbUq6AUDavZ5orudCpEBxJuw1D+CcVi49lDNsI3VMRStFk7t1OxPYxGuFRRgFQptmxFX/Uu+YmYYswCyshImrSb2oRuSUFbs2MkfoAGKslnquNjOCroryPDtY839kXjJABb1hzz/mCIfaABIokUwx8JGDlpSO/sGTOzEMnuIlAsA633BsvqGc3b9E7rPHDA5ACHrPk9DCGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS363IiQNSfhK/1gjrNVz20T2cNr2d70zUe/3eLQ7jI=;
 b=OXezjlsWjE+xM+3GztsNXF78EXgSfRpW+SJ7fhiT0r8mOEI6MdwqB9HRl+Xx+1MWXwJR74ghM3gLZ5/4iq3LEsPaX7Lg91ClH4e3lYgD+w7/RYzNC3FMhbr4Zb/RTAGkRmrM90oaZqORbzW9VPdoL1NA4EyXNkU8Kex0SJjLOz5NGeIIgi1ShsthzZ74GVIItOO0hyF4j5YT9IzMaIsvAuSqxZm3AG+L9EhWlymLn3DYCBpN4bO7GqxUvaGuI+MiuLszTcOMVJA7CCD8ivMAeoL9L6nAlOosXSNdqlmg1cc7HisHQC9YtAGXhdn98fra04+hgSSf4fnks51T0eqdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gS363IiQNSfhK/1gjrNVz20T2cNr2d70zUe/3eLQ7jI=;
 b=slSB9f7bXabWoyY0yrsGcK74R3ZxYrAew7huusOkmSdu5N6vELanr3AXALmQutkJIbECumgNsqWHz54mAFTYOG2hyBMTqi6335eh4BpU6tGIJDWaZYN+NfpqW1nD8SbpM3q+2WCVteufo3PsdU49RRrzuw9y4ge7o0GOHkFDSjNQ10IMEtVH236hVMhXpgHAWz+b8UY54qh0qeRCITBqYJSb0i5D3sIbRtmUwDrnP2F6dvgWNmQEEkrVzSJgfHu81QDFtZLRCGyjGcFREP095p72ZCs4ysgLj8Y9sbfycJaFx3fzWuzm7hd4E90CkgZyppKju86fgvZ/LmxPXohREg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBBPR04MB7961.eurprd04.prod.outlook.com (2603:10a6:10:1ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 10:51:07 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 10:51:07 +0000
Message-ID: <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
Date: Thu, 12 Sep 2024 13:50:25 +0300
User-Agent: Mozilla Thunderbird
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
Content-Language: en-US
In-Reply-To: <20240911-racism-playmaker-71cb87d1260f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::37) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBBPR04MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ace346b-cfaf-4025-4801-08dcd318ce05
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3lJTmRPLzU4Rk0yM2JOUG11TFNTL1J1RHpyMGloTjFHOU56K0ZYdk5YUmR2?=
 =?utf-8?B?ZEdPV2o0bDM2UDI1ZE9HeHZBRWZhVlpxZ1ZscUpQTmFNcTZYWWFFcXMyTE5Q?=
 =?utf-8?B?TE0vR09lTW5NUjgvR2h1VjBoNlNsTEgwMWp5ZlJ3TmNwTU1QMThOdWFHNFZJ?=
 =?utf-8?B?Wm9nNzl4RXNCTlNITm80Z2JpYWJVa0Y0ejdBaFAreVJNQVFjWlgxbzUraEdI?=
 =?utf-8?B?MjVjdlFFWWFTNEdxS3N3d2kwMjRQSEtqaEZNUENuYnk4Lzl2M0xyOUlWNksz?=
 =?utf-8?B?M0lIbmNET01FU0JMM05TSWFHRTk5d2dpcmwwWDFrOVZSN2JyZlkzRjAzbkFM?=
 =?utf-8?B?RTZVSmQwVzFWeXBaU043WHZjTkxnc3oyaUdtVnB3NFkxYmhmczNkV1VLMTQv?=
 =?utf-8?B?N0RFcS9SS2FOL29RMHZPeDByWHFTdldrR3NvOVdiQ3pONjNSWk1VNjBNT2FV?=
 =?utf-8?B?Rmgrd0lXaFlvVXd2dm9JVU0vNlVLYkN5WDZFN0x1OWIwY0owaXp1N054TUVv?=
 =?utf-8?B?ZEhYelJ1R0sweDZadUFLU2NjdkhWcDZ4SW9uenNwak9jMXlKOWt1b0s2cUVV?=
 =?utf-8?B?S1h0ZzFKQlZ0SldQU0k2cGc3dXB5YXNzOWVEcVIxaUg5TGpXaUd1dU1WTUdw?=
 =?utf-8?B?UTcwTnVDTkI1UnpucXdhbUdJNVUxWWpVUGZBbGt0T2l4aTdaYnpFQW9meEFk?=
 =?utf-8?B?Y0FNRkpIOGJ1RXZCYmJkeFEvcVJiMTNXVmphNjlsSFJza240Rmczdk1lV0Rv?=
 =?utf-8?B?cndiYWZSNUpkc1BKMkk0RTZUb2ZRMEdUNnBTOFFObFBsSzBxaHczWWdNWkhQ?=
 =?utf-8?B?ek8veGZxVmlYL3pSbDZhVDhLSzVVZ1N6TWxzdjJ5bzExeStodlJNcHZ4czBG?=
 =?utf-8?B?SDQyaFdtM1JEd3RsSjVrVi9WVkg1OG1MbTcwRXQ1R1BYcXJSL3Vtc3owOUdx?=
 =?utf-8?B?dUY2bjdnYzB0R21vNnJ1SVpDcnI5akZwTHl5S1lpb280OWFOcFlhTjVTaEFm?=
 =?utf-8?B?UlZyMTUyU09yUTdnTDdLcW9mQUh2Z3pqeGZDZ2dwTGFoSUY4anNzNGQrSGkv?=
 =?utf-8?B?bU5jRzZqdjRyeGdWY2laR2t0MG8xa1ZCdHdOK1ZEU2ZZSzh6cFRyajFJU2ZB?=
 =?utf-8?B?bSs4VHo0eTBiZy9KQkV5VjVDQi9PVi9hTDFpbWZwd3FvNnltTHdtelNYRUFn?=
 =?utf-8?B?YWpsVkNnM1kvZWJoZU1zVlhsK0QzZ215a0NnOVNLd29vbzMvbU9xclBra1ZL?=
 =?utf-8?B?QUZ1MDFQWE9hWjVGUUUvdDc5WTdtZHp4SElBV2Q1Mlk0TURRZng2YVRGQjdz?=
 =?utf-8?B?bzhRM0xHdXVqZ2NwdVNHTWg4bG1ic1V6TTN2TkVhb214bXZzMjRjWDRuT0Fw?=
 =?utf-8?B?dENzWEFPU2pQRkVsancxWFkxOUtsM3ljVEFzR0wxUFJHdHAzVDJ2ZTZKamNi?=
 =?utf-8?B?QUlEd2l6ekhzdjRSU0FvUU9FRlRqaFVwVU1JaDNZcWZ6bVRISjNrbk9xM1du?=
 =?utf-8?B?N09IUVlsMWQ4OVRhR1ZsaHcxR1JrKzhGam1kejNRRjNSSzlRV2IwUmR4b2RB?=
 =?utf-8?B?YWgvY1NXTENPYzNBM2dqbjBUMS9RTWs3b0pjcnhXSjR4bHFqYldKQmpZUUNQ?=
 =?utf-8?B?UC9BWEljME5oNlY3ZDA3clNUaXQ1d1k3QWRDRmV3RHY0bm9kbXJUMTJKOXF1?=
 =?utf-8?B?cWJIQU1uZFRhQzB6VjdlMUtEWlpFeGVST2hwYjZPVFRUcWQ2OU85bUt6T0p2?=
 =?utf-8?Q?kfDMNYaHIcOedhC+N4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXpybHl5b2RkQ1lZMGk4ZEVSWnp3MHV3MDNIa3ZHK1dKLzFKbHcwa1JacWhj?=
 =?utf-8?B?cGdTVGJ4MzA0SUtidEI5dTBxbHFrbzhwWTY4Uk41OWJMSjdjVlpSTVNMZ2Rq?=
 =?utf-8?B?TUY2Vk8zK3VHeFlPQUlacUZqaWU0a2kvQnhaWGdnWnpabVZra3pHZGdsb3ht?=
 =?utf-8?B?ZnpZRzBFbldROGNQNzl3S2tLdkJDQWdDMWpEZjdoclFqOUZ3TXFDOGFTbTJq?=
 =?utf-8?B?WVFOZzhjL3pISitQMm5WNVE0dzNvdzdzdjBkTEhjWWRXWUp6a1BpZUZjRDE1?=
 =?utf-8?B?T3c4N1hEdEZVZGtVVTcxSk42amJyOSsxNW5GYkppRUduQ0NNTzF3cHhtM1Jv?=
 =?utf-8?B?cmRpVDhoYlloTkJYdnlqbkZhVG1TZHZ4Q3BXS0RyTU9ZbG9JSUVhNDRnd2Yz?=
 =?utf-8?B?MWZSODRYRkthdGkxTmg2bFY5QS9yTTE5ZGlXbnpiU0xWdk81NWtHK0VuU0VV?=
 =?utf-8?B?b3lhQmh0S0VCQTJMeXBYTG5GZWhVV3FlWm1USUFwRFpmVU9Hcm93bUNxSm5t?=
 =?utf-8?B?Nng4UGdhMmdubGgxV1NTWEtvSDAxWnNsSUlCei83K0M1Sm1NaVUvYnprTC91?=
 =?utf-8?B?bGw1c2ROSFExTk01aytGU0ZTaWM1d3NqVm1JeE5QbTc2UHZrTjJrZVZ5clU2?=
 =?utf-8?B?aXFQZ2wySlovekNjaVhkM3RzcTB3WTFTK1ZpN0xsUFVaRUFIeXlscnJ6YXAz?=
 =?utf-8?B?U3RTVzlhZGVrNUg2SndUU1ZWZ2ZwcEgyTzU2bnJCeWRmNGxGcmE1Unl5ODRr?=
 =?utf-8?B?L1QxY2pISzNnRVp1aHVFdkZmZXJ0S3BFNGVyVk1jaG50b0xFL0g0ekF1Wnhj?=
 =?utf-8?B?by9JWDFWamNGNHo3b2lYWHlEUnh3cDVVK0JONVFlMVpoQkM1bERsKzJmSlNn?=
 =?utf-8?B?VWZiZGNBcndTdENrSHdEOHhYVXJBMytmY3pFdEtHQTVvdHlJOGpFMGVaUEps?=
 =?utf-8?B?aWV0L1Y1K3JFdDVWeWlKSlNpQ1AwbkxDM3FmTUlsdDFBMjBkK2o5YjFGYzR4?=
 =?utf-8?B?YTBSM0hjWndRcjFjRFh4UTBTMGNuajJzSlNINzY4My80T0RXNG82SkRmSTQ2?=
 =?utf-8?B?aFV5d055U2dXN2RUVml5UVowMzdlK2VRV2txRFRqRGRpNHk2VW43NHVsbUdS?=
 =?utf-8?B?TjYvYU95ME5XR1E0MVBVOStTS3I4MHB1QVZoeWtPYVhXVVc5em5YMnlCRnVU?=
 =?utf-8?B?UEVGbkRKdFJqaUMwU04weFBKUUwyVXhoZlJKTkFvTjFTYjNnSDAyclAyOTk4?=
 =?utf-8?B?bWhPWkRuY05tclJvZHMrc05mWUZ4a2xCRnBuSlNDcjBhOENISXQzRXJ1UUhZ?=
 =?utf-8?B?YmJqdi9Yang0ZlFRTEJXTndpTkd5RkN5TlpjYVloWE9TN1MwSFhGbDh5RkxW?=
 =?utf-8?B?VHBGbm1wUGtRWUM4ZzZ4Z3RoaE9ZbzlQQVM3NDdkSWNiYXk0V2wxVlh4MFR6?=
 =?utf-8?B?R2tXZVZKVDBZMlhCN1FBTWt2QUxTNWJxRVNVWU80U0R5WllIRGtkVGhpOTRB?=
 =?utf-8?B?UXA4Y1d4RG5oMnlPdjRoclBEU0Rxc1loVTd3VUV4VnIyT2lCdThtSXhwWDkx?=
 =?utf-8?B?NSsxVWt1OTNZa3FWQ0wwMjRxZkw2cEdFMW5INlZVTEhyZlJjUE9FQ1dTNGQ0?=
 =?utf-8?B?VEZPNnAzU2dBZ0lrTHB4WnZIUXM3WG80TVdrQVJBQVpDRWIvQkpyTVdxNjli?=
 =?utf-8?B?S0xGOWRpOEFFMG1IODZPWG01cTJqU3Zrem1pL1hycGw5VVQyRHUxTlBaWXVC?=
 =?utf-8?B?anM5cDY0dTA4RURnbHVMUlN4SEhxK0QvNVNqd1dnVk8yVDZVZVBiOWROZ2xs?=
 =?utf-8?B?ZjJBcWVQb0ZidGJYMFRXVENJN3k5aVRtOHFYUno5d1JVS09laFpKeml2YkU2?=
 =?utf-8?B?U1JQUDBRRTA4cExFaXdOdkFLOHgyRlhjZXZsZGJXa0hzMEwvWnpjRXloZmdC?=
 =?utf-8?B?NURjdXRxSEdVK2k3YmRKeWV4aU9xMWZVUURVWXROVzJkc3J4QW9ZNHMrNnlC?=
 =?utf-8?B?Uk9IZ3J0bTRLR2ZIZExISmhLbmt3cG9ROE1GVFh2c0pTTGNTVEp2d2hlU1Fm?=
 =?utf-8?B?Mkp6ditrYzhXOHZoZkh0QmdlWnFPMlVoQW5SRzVUc1piaWFjS2k4SXA0amN4?=
 =?utf-8?B?c3VkRjgxUHV6aWlkelFKbVhuVGNLM2kyMmtqdjV1ZVJTTEZ4b1prblZaNi9j?=
 =?utf-8?Q?GsUKOIM0XAXmRIBltk1ChWI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ace346b-cfaf-4025-4801-08dcd318ce05
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 10:51:07.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYxzsEJcbSBVNMYV38vqTZuKLUifCJFcImHB9dduWYGEB45Q1gKcyfYVdHTJKXz8ZDaXlCRhjGLvA+6v6bHPN7PE9upiQIljM/3bFKx3JAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7961

On 9/11/2024 9:21 PM, Conor Dooley wrote:
> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>
>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 79 +++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> new file mode 100644
>> index 000000000000..8f78bce6470a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>> +
>> +maintainers:
>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,s32g-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  nxp,clksel:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
>> +      The reason for these IDs not being consecutive is because
>> +      they are hardware coupled.
>> +    enum:
>> +      - 0  # SIRC
>> +      - 2  # FIRC
> 
> Could you please explain why, given both clocks must be provided by
> the hardware for there to be a choice, why choosing between them is a
> property of the hardware?
>

Hello Conor,

Thanks for your review.

According to RTC module's clocking scheme for S32G2/S32G3 SoCs, it has 
three potential clock sources to select between:
   1. FIRC:
     - fast clock - ~48 MHz output
     - chosen by default because it is proven to be more reliable (e.g: 
temperature drift).
   2. SIRC:
     - slow clock - ~32 kHz output
     - When in Standby mode, SIRC_CLK is the only available clock for 
RTC. This is important because RTC module is used as a wakeup source 
from Suspend to RAM on S32G2/S32G3 SoC. Therefore, a temporary switch to 
SIRC clock is performed when entering Suspend to RAM.

   3. EXT_CLK:
     - has not been tested/validated for those SoCs within NXP's 
downstream Linux. Therefore, I did not treat it, nor mention it, for the 
moment.

Now to answer your question, all above clocks are entering a 
RTCC[CLKSEL] (RTCC - RTC Control Register) mux. Therefore, a selection 
can be made, according to one's needs.

I will add a shorter version of above information in the bindings 
documentation in the V2 of this patchset.

>> +
>> +  nxp,dividers:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      An array of two u32 elements, the former encoding DIV512,
>> +      the latter encoding DIV32. These are dividers that can be enabled
>> +      individually, or cascaded. Use 0 to disable the respective divider,
>> +      and 1 to enable it.
> 
> Please explain to me what makes this a property of the hardware and how
> someone would go about choosing the divider settings for their hardware.
> 

As per hardware RTC module clocking scheme, the output of the clock mux 
can be optionally divided by a combination of 512 and 32 (via other two 
input cascaded muxes) to give various count periods for different clock 
sources.

With respect to choosing the divider settings for custom hardware, it 
depends on the clock source being selected and the desired rollover time.
For example, on S32G2 or S32G3 SoC based boards, using FIRC (~48-51 MHz) 
with DIV512 enabled results in a rollover time of aprox. 13 hours.

>> +    items:
>> +      - description: div512
>> +      - description: div32
>> +
>> +  clocks:
>> +    maxItems: 3
> 
> I'd rather you provided an explicit items list here, explaining what
> each of the tree clocks do.
> 
> Cheers,
> Conor.
>

I will add such information in the V2 of this patchset.

Regards,
Ciprian

>> +
>> +  clock-names:
>> +    items:
>> +      - const: ipg
>> +      - const: sirc
>> +      - const: firc
>> +
>> +required:
>> +  - clock-names
>> +  - clocks
>> +  - compatible
>> +  - interrupts
>> +  - nxp,clksel
>> +  - nxp,dividers
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    rtc0: rtc@40060000 {
>> +        compatible = "nxp,s32g-rtc";
>> +        reg = <0x40060000 0x1000>;
>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clks 54>,
>> +                 <&clks 55>,
>> +                 <&clks 56>;
>> +        clock-names = "ipg", "sirc", "firc";
>> +        nxp,clksel = <2>;
>> +        nxp,dividers = <1 0>;
>> +    };
>> -- 
>> 2.45.2
>>


