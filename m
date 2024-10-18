Return-Path: <linux-rtc+bounces-2232-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7729A38F5
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 10:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1531C22156
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Oct 2024 08:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD6D18EFF1;
	Fri, 18 Oct 2024 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z1b7STDq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9E1865E6;
	Fri, 18 Oct 2024 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241112; cv=fail; b=CpTxJrIKDxMaBdfAsfob4oEOPtn8b6Pd+r3a8m3C9X37TWJrVUK1sfAUB3EmH08fqePCpYnvM/cd6IG6pN3WeryxRHqDjlw2HzFB8Ogh2QJZw/AJxnKp3wqf7GqmAZomklnvCz3YoxuIR93swv84bkByPOncwtmF9cvvZMDv0uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241112; c=relaxed/simple;
	bh=DS5QssoW+ObvRrm9R/tTixbGZvVKa+8A5JNbb0PBbK0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hplzEfKUZsp7iR32wpbeJJSbTb5Kz3LYG8kRzhFkdsbJXzPd9gWyNfCEZ8/y47cDLWx3+2pwSq8BWiTu+HMRN1uhzvd+1Yq5KXqlpf+wKq1cHHnBFF8pvHucezivdG1EpQRjDwrfV3NF7KV23SX92QUMxh0R3ZimatWf9MKsDwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z1b7STDq; arc=fail smtp.client-ip=40.107.241.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8k//KrQ2H4CO8Jil+vjaogJo2LyZN2bmjw7Eozrku1EC8GnrUYdByeE/3jkVQb7Bsq/dTkfrmP57h1S9FsiCilN5ZnNHB1p/GUFQPO+x6O3jgRirNRwkh/xYfyH3U1gzBiVLB/P96YJs9FJBgE23rO4kuRGn2xnGVUwTpYD5Fj+496RTEpfXhFKMqOxeDfagKywbv4SapiGqGF79TvyULIqDGjCtiOYCZe2Ww4KMP5ZQG8J8NoEyG13qdwpycLl/3VGmohNVPJ7sCOmJQoJOlTTP0Fah5sfoRwCtaqTsz61oTWk5gXaRguHDi+MWg44QQGQ4KZZiqVXN8PRVlqWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm1p97j+VQnHkmwAgUeJrcJjZACw1h18RnSV0Rqvf9I=;
 b=hMpp8USA1zNVsXwSdOLNBFR69+qpYtXv50v7YI+ildi8XevJ9HlKCbwDwBBHPs9+4ZXT3NrtjP/qr5U5XPpM7xVcDxnYng2z0YwpfBL3F5eOi35zKHCNQFtgMR5sboPZJSFhIn+7VQEwy4w8dCam+PiWyCPC92mXZ2VkGfIVD8sLDnvocB300hJ0nkyHG+Q66mbQeOzWyZNxnJOrYFLPpGOPX3NOUeMbIugx2hBjyxVpTINsirzpZTpLOrP4LC+4WIZdcXuLzE1B95GqlKKUdvjQDziFyo3+DV3L0Fmvg7XR1nW+PTBtqBKEcSsDQJ+1Umg+ReNmEb35NQ4cSl/xzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wm1p97j+VQnHkmwAgUeJrcJjZACw1h18RnSV0Rqvf9I=;
 b=Z1b7STDqMN2htcXwEom8ehzL/P3cb5LFW7iZpZWNdWYHIlywVoVSF0TjbRgCMF3G2LZPxuB2GLtY1NLYJq/zx9aTfcXXPweEfX49G+hRhqUuXX19mhGK52WD+sEowdAHi5uV2lOeqvgzMyHGnil670xesvnZJF+t4IpxiqgQsjTC1njPtks4jOBLL6qdBJch/tDELiJM+Z1aK7bAHAUODbxX96LfsdAybtjLsAgM70uwsIVSA4HzvatQuUQb2fQ8eN+jhuqMuLbcx+HysM0E1xZ3nu+omn4HXiBzmjCQEqgO0WeUocccW1MsWZtA80fiXZUckdP997UpSsPNB+EVPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB8PR04MB6826.eurprd04.prod.outlook.com (2603:10a6:10:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 08:45:05 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 08:45:05 +0000
Message-ID: <638262ae-0324-40a4-ae34-6b7962958600@oss.nxp.com>
Date: Fri, 18 Oct 2024 11:45:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
 <20241015210452.GA1942395-robh@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241015210452.GA1942395-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB8PR04MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 8279419e-a28c-498a-3c3c-08dcef512996
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVJOZzBHTXJwc0dFRmxYQVVNOUtHcDVxVHVza2ExRTRjTDhtRUZpM3lIOVNk?=
 =?utf-8?B?U29MRUlVbG5kQVh5b3p6dnBuQWQ1OGRPRC9YSEhhQ3pZS1hMdTdwS2YvK3Vl?=
 =?utf-8?B?RkdKRDFZaWRNVlRnT2c5Z1NBb21YNlRNMXU3KzNBQmtFNEwyeW54OSs2b25t?=
 =?utf-8?B?cENmaDN6T05DL3NuMDhaZXl1YzFDMEhYQ1dtOTh2Z2h4SVZvdHo5REEyQU55?=
 =?utf-8?B?WHBZczBlMEhvbU9SZEl1R1Jpa2VXZ2dvcms1dU10WlRzUmxQWnNrY1pJUGlE?=
 =?utf-8?B?bkhNM3J0L2xCS1VuRk5vUXJNQVNpaHFtendIakFNNW5LQW43dzdDMDBPR2tU?=
 =?utf-8?B?RW45dStkMFZCbk96b25tY29GU01FWFhNL0pQeE1oNlVVdE1NZ1pWREtMY0ds?=
 =?utf-8?B?WGQ1OXAwM1EyUmllWGo2ck00cmpHb2V0cU5ESzY4RzhHYjhKQnNHL1VPYXVB?=
 =?utf-8?B?L0hOdVU3L2NSV1pNZExiSnYwZjNaUEtCTjFlRkVLWW8vYzFURmFyRzNUZmFQ?=
 =?utf-8?B?R2tSZHNHa3R4VHpkalNwd3FUanI1YWhJSTFjcGZFSDJjdTVWT1NCOG4xeHFj?=
 =?utf-8?B?OVJYWHhjVnJqNnpBbFR1RlhNNUVRNW9jSXZoeW81Z0VzbkI3MHUvM28yMTYw?=
 =?utf-8?B?OE5iQ1cwREtpaWUvWDNTdW9zdi91Y0lrMzhFK1lrR1hOaDEvUHYxU3V6eUJs?=
 =?utf-8?B?RG16aEVKZm42L2FaTlVicFhaQTBoOG9YWGY0S0lMVk9wbFNabzJ2K3NFenFJ?=
 =?utf-8?B?YThLUERmdEJsTFdTVXF0Z3JZZGc4WWFpdlJ5bnZSSVE5SkY3VFBqUEU1bFg3?=
 =?utf-8?B?QUVRbmJyOG1ESEtDcWpqWEFVc0ZpTjNPbGpUeSsra3VZeGJpbWtkQW9BZVN0?=
 =?utf-8?B?WTNXR01IN2htb1laMFpBNTd0VkRINnRIa21icmYxcm5MKzN6YmJNVUM3a2tr?=
 =?utf-8?B?ZitOVS91VENpOXZFcGVEYlFmSjdCRXRJVVowbHFLWUhvMHRDQWdsU2l0bmZz?=
 =?utf-8?B?NW91QkNwQVJyc1dNM3JaMmMxcnJORE1TdDErWS8xNW1vbmRJQk8xN0ZqOFdr?=
 =?utf-8?B?aDBjNVE0dVNST3JnR1VjRThuWTZYZTFESndFeFdBTlk0dklNWjFCTDB1WE8r?=
 =?utf-8?B?UXZSZGorM0ZQc2FVamFZNjUraUJmeW50cW84YWFTVG5rWFRlVEVsY3pqT2JW?=
 =?utf-8?B?UWNDdHp6aDhTY0ZuVDNrS1d6Rk0vd3UvODB6aXJ4VHY4YVNKajZIRm9IaTBi?=
 =?utf-8?B?dEMreWkrR1RBZWZqdjlhUm1LOFdNTlFuMThYdUkrSVJiejV0OWFyd3NGYnRt?=
 =?utf-8?B?anRXTHVkcGZtbEFaS2VZeFlNRDZQbHZXNTlqVVlJQkhWMmhQTGdyQTUrMUVL?=
 =?utf-8?B?Y3RDSTZhN1VtSmpUWEJ2K3haK25PTGNBU0Z6WVR2amZGYlgxc2RLM2Z3N01P?=
 =?utf-8?B?MFRMeFFmT0N5bUVCa2NoZjl2NEY4R2FDdlpDaHBxanJPV0NtM005UzFMemx6?=
 =?utf-8?B?TmRiYkszNDdzWXV3Snc3Uy9uaUZueDVVd1YwK3NHVFFWK0RrSHl2dnBIN3pK?=
 =?utf-8?B?aGx5V05xWWdpeEIySjFvZlJ1VHF3NE1MTWxKOU9YSHpxYm90YTZwMEFLSzhG?=
 =?utf-8?B?ZVJMSHpUcUxDelljMzJ1eldBWGVpZ3FUbjVEWlNacVpxQk55dW03Y1RSbFow?=
 =?utf-8?B?VmUvTDBqbDNXVldYZDBNN3pTSWQ2cVREOTdjV3MybU1nVWxnclBzVWU2WGt0?=
 =?utf-8?Q?1Scns0dxLxtjWgeQd3FbFvnU7zjyl5m3kc1lI3X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9rNzU3Q0Rnd01VZVpGdE9ERXprOWQ5SHBZVXhCcGdNbHQ1RGhQMW1lazhN?=
 =?utf-8?B?d0RoZmEvSHV1Q3UrM09BWGpldk91VFNVNlk5Z05wYTFWSEJKdmlMRnF3czRi?=
 =?utf-8?B?V3NxbkgzdFU5MGMyNXJmMHFYN08xdzhSVEsyZm5rM3Y0Y1h4RzQxK1NnUTAr?=
 =?utf-8?B?VTlGWlF5MzVGTHZXTm5CR1pWYUtpTGh6bVVQU2pkaWlDMENLam1oS05sUVJ1?=
 =?utf-8?B?cWNCZ2NEN0dXV1hKT0h1a1NMdTh1cEF6bGVXQmI4bjZNbXFQNTlnaVNMSkhU?=
 =?utf-8?B?MWJZL2hWbHIvWEdBVEwzcHlDR0RhUm5nTm9ydHBVUXpnWFluaEJwQ0x0RVJx?=
 =?utf-8?B?N1cyUitvRzMwdkd0TzF5d0g1MUZSWU41RGFmc3puV3JpOEVUVXU2eUtCYUdH?=
 =?utf-8?B?VUt6N3AvQ1V5emtBQnR1UlJJV3k5Si9XNjg3bFpoMFFJNE4zdW5EaWVMeDJK?=
 =?utf-8?B?SkMyQlFDdjBjMEtqMUVyY3JOMklQcmdkL21iV1ZqSVhlTkdPUnNUc0FRc2Qy?=
 =?utf-8?B?dTZSVGtuVVBWUGhBQzlIYmdxclAvWHczRXI3UUNzcVJkeGFqR09TUExONDBq?=
 =?utf-8?B?VktYbko5RllxT3lTb01lNFNoZ21FTGw2dm0xa1pzVnFjczlENnlyWVB2Z0Vn?=
 =?utf-8?B?UFdNWkZXRllZbUxqM3NQMWlXcm1zU1ZrYUlMR2VXU3AvRmd1eGNYaUJEcGVj?=
 =?utf-8?B?bzAxbUpmUjdyN3hnWmpRcVJhS09vK0VGWUlmTWhpRE5jd0VxWGYzM0dLU05v?=
 =?utf-8?B?bHV3MHlmWkdLL0xCSUQ0NjVRRUtPZHFCU2RLcnRZS3VDT01MQWVqV052N3Vi?=
 =?utf-8?B?TTdNdFAxNkVHVE1WL285ZVVMVnlaUElNNlV1RmFOVFBPUlU4TlBMdU1kQzdr?=
 =?utf-8?B?M3RpOUZCdHJKUkY5a2ZCRWNvUUlwUnRvRHVObGM5MVVxeWlIU2htSFA4YTJV?=
 =?utf-8?B?VjRTSTF6SW1PNi8weHZPbTBXMHR2b0FCTW5jdkMzMGN0cUVoYWpja2Vmd2ZM?=
 =?utf-8?B?RUxRYThHRUZTMjkzeEtEbjhlUk5kZ2tEbzNoYTROdGRTTExkZnNYWUdieXpQ?=
 =?utf-8?B?bGRVZDAyOXE5RFFyOXpzUGJUVTNJMGpTdUtKV00vWFNLVSthYkdRSThuMTlj?=
 =?utf-8?B?ZDJtU0RpRGRKNlQzZVpnVGZEdTVQbWJSQUswWjFMQzY4MURkTE4yQ0ozQjVX?=
 =?utf-8?B?RlhrTld3NWVHcklpMGdURTV0UkN2ODludHdXOThMaDF3VDh0ZWRKMkNhTjBw?=
 =?utf-8?B?R0N1ZkdhSFcvNTd6S0hsN3V3MnRLQVp4UmIrY2RJY0ZNd0xNbDJIenE2WUxI?=
 =?utf-8?B?QjdseGZiYTNTSUJleCt1VnJoQWRSamNnY1FrVlFieTk3bFh1SGtVMWZ3Ni9X?=
 =?utf-8?B?MnhEVkFYQ3F1OWRMVDIvcnNnamFQamY0OHZzTkNNWlRJVTNsRWhvdWxpRWx4?=
 =?utf-8?B?QjBvZWpqT2NIVU5TMG1XQkg5V2RZR2JuSkkvMkRZYlFabEhoWjlzL0d5a2sw?=
 =?utf-8?B?VDd5RGh3QU5nblRhMGRXRXpUbzNMU1A2c21JeGlJNm14KzFyNXZiS0toTTli?=
 =?utf-8?B?VFdtVnMrU2FMVzNTQzd5YXJhcm96YlZ4aitkTUZUR1ArNkhEbHBtYklETHh1?=
 =?utf-8?B?ZEZaeEk4V1BSVjdBVHhxWDdBQjlmK004Y1RjRTdHNFpLYnNLR0I4dHVCeU1a?=
 =?utf-8?B?Nzl6VXVHV0x1cC82NFNqc0VMSzBiVmVsUzUreStPMklxUTQxay9razBSdzVy?=
 =?utf-8?B?UnpPZ1VUajVIT3BOSzd3SU81aGloZ2lOUDV2ZGsyTzJpQkVaZ1pxSnJhSlZS?=
 =?utf-8?B?Vk1TTmFma2VBcHVyeXlsN3loaUZqRWozcU5RckNxa3FKLzVXQU5HVnpDd0xY?=
 =?utf-8?B?ZzRNUjRUVDduQXY3ZWxQY1Z0SkFFVGRKV0Z5WFFBZTJoODJqZmdkaHQ2cjlX?=
 =?utf-8?B?b2Q2c1NkbXVQT3l0Zy9wUDArVlAzd0tXY1hUSTBjcGFkcWltY3JwVHg3WnUx?=
 =?utf-8?B?eS9zUzhCWmNGVDV0TElRcStGdWVBSmlEUnpNdVpqbGFmOFJOYnkvSXFuRFJH?=
 =?utf-8?B?SXJHV2g2dFAxUS9yL1F0dGZwTitLZmZXcFAzYW9sMjRuR0FtdlhIWXhzN0d1?=
 =?utf-8?B?ak9TdVBMdHk1T1ZYZ21qZ3ZsZ09BN2xZQ1JBNnRIOGJ5bWgyWG1OcERGY1pp?=
 =?utf-8?Q?LGMsexwAH1BxS/EYfK1t5ao=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8279419e-a28c-498a-3c3c-08dcef512996
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:45:05.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rqY0tW1sy6jqTp8XZ5rmkAGJXI52a6UjMFZylTXcwQkU+C530Le5aF9NGL6JoZEw5XgpUOdoUC7nheKL/4bLNyT1Zz3g5T57XEDfPej6eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6826

On 10/16/2024 12:04 AM, Rob Herring wrote:

Hello Rob,

Thanks for your careful review!

> On Tue, Oct 15, 2024 at 01:51:31PM +0300, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> The RTC module is used to enable Suspend to RAM (STR) support
>> on NXP S32G2/S32G3 SoC based boards.
>> RTC tracks clock time during system suspend.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not
>> kept alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 778 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 790 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
> 
> 
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 8ee79cb18322..a63d010a753c 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>>   obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..d6502d8bf616
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
> 
> 
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ .compatible = "nxp,s32g3-rtc", .data = &rtc_s32g2_data},
> 
> Considering the data is the same and g3 has a fallback to g2 in the
> binding, you can drop this line.

Correct, I will update in V2.

> 
> And really you don't need rtc_s32g2_data because there is only 1
> possible value. But maybe you know some differences which are coming
> soon? Then it's probably okay. Up to the RTC maintainer though.
> 

I understand your point. I've considered adding 'rtc_s32g2_data' because 
for both S32G2 and S32G3 SoCs, one entry in the clock source mux is 
reserved.
Since this is IMHO a SoC limiation, and future SoCs which may use this 
driver may not have this limitation I've considered adding this 
limitation as a quirk.

> Rob



Best Regards,
Ciprian


