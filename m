Return-Path: <linux-rtc+bounces-5525-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D078CB2DF5
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 13:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4FA530BAFE8
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 12:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFE730C368;
	Wed, 10 Dec 2025 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="oIUOzlmh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023129.outbound.protection.outlook.com [40.107.162.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663422301;
	Wed, 10 Dec 2025 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369116; cv=fail; b=LuCy2rbJpskggbLh7xmcCWFx5CbriEfrXtXYSKM6h+u2HfAXFylM50U1mI4My37L0XziCDFcg9s2vDnCkxoNPi/wwIx1f383L2snfE+D8LWQwmfGiRYHvNxfOrxItOBg7Xt+lt0rmIOSl5I5fuOm4K/ZU4Zsq3p3/ZWhVos9miA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369116; c=relaxed/simple;
	bh=FAfFoT4uL83Zmmr5zn5Kh+K+uAUnm30/O+xoQtEZubE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X1dOtSTjv11TTBeEmvC7M+iOHzr2aXqjkHUR3+MM3wgcwpb7+INeyHqqFDKhqH3nD5QHaVwjz2fJBb7dk4oB9gRd/ZuJp+GIzS1PtNfkr3U+siKX8V6u9lxL9vX44ymAwzFbuBBgEfWrcJQfaz6cCZ7RTChsr+5RopF0Sc5UIqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=oIUOzlmh; arc=fail smtp.client-ip=40.107.162.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR1fKv0TpDkpg3rXAGauWcRhpgAFMGw2lIfB9vXfGgJT0kiYweL68d4l0eO1BWoceoeFQLe3Y26MApcaeEwVeqlZMaHMgLX+gl92tgdGtQmvYJ2jQnqd3vEu5J0AgsDn7PmC+4rDrs7zKQbbbJqWZp3v6eHeN7jK5yISvwhbYKzgQQ8l2Vx3Sh+92whVd4VRB0+Z8ZKKoHkTFHwFUSj8Tkl1PgpKvbTDKEjGtIELqmsNwcKNVqx6W+XWUiJ8xfCeONZqvehPv16ls13CUnwEyolWjFJxeInRwadyanCRPyrynggbTuXe4Kn7MwkZE59nOqqR02ClU23DT4ZFffEGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnbCSy0M1Lla7fF2wRnWNoNKEYFhOXlIB6fmBnHuVP8=;
 b=GGamvv140880reZB9VsBtHOjHr8BwRrRbhheuur57PIaz3jDsQQioZMBsQ7HNvAvJZXyS/gPsGEBWgI82FIIjazxyYjAbGdaLpp2nlGks1WFxRBtSzmgA+KyqsXqCBbXAZCMiqDChEx2fEEXa6CLHiEuOtNsFnZDtSFOGnQmrBWESmpn9Aqs4Oenw7Ff8qYpASHv0ae4aw5cp85QagHGv33BmOiuRhuPlSCY0RBD42XnfmTdowU/P34xhYeflksV7HQLLB6MZa7MPyetCHqD1q1CGwSWCu2oTKSf2QDN9Avj8qk5TAaG7g84EGqEwiItEe0ne05Tdr32Yrkb0DmQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnbCSy0M1Lla7fF2wRnWNoNKEYFhOXlIB6fmBnHuVP8=;
 b=oIUOzlmhWjn4930pt1CDBXBdqv0GuqAQjdDcu1FSJtEkWoz1T1C+qJwdjzHJHzcEe015HIGBh5snygi+yYo6IYIyF0igEElnNAJ3bhjMwNBH1ZHgDtUNE/izohK0hGj7eqsF2fdsJCJu9IWDBYlT/nrLu3K/sEFv+FokSP7GZygVcSVou53dMZwyDok1OSu2PvhWkU5PsVkm08n1TSLhU209isrpixtnSzLSDO9sLhpI0bpfHGW8w0DD2ZlQ/IPnXqofQnqfWAsTEGgdgfxJDoXVPKNfG8bvjSjLdho9G+66Nz7DmIELfG/K5Kr+j+uX9OSm/TY5TLhKGtdaG/eJKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PA4PR06MB8450.eurprd06.prod.outlook.com (2603:10a6:102:2a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 12:18:25 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 12:18:24 +0000
Message-ID: <d02fda5e-47d4-4613-9a21-ed81bc957146@vaisala.com>
Date: Wed, 10 Dec 2025 14:18:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] rtc: zynqmp: rework set_offset
To: "T, Harini" <Harini.T@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-3-33875c1e385b@vaisala.com>
 <LV5PR12MB98045BF8A85640F924BCFD4492A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <LV5PR12MB98045BF8A85640F924BCFD4492A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0075.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:274::9) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PA4PR06MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4c412f-84d2-4ded-9dbb-08de37e63792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V093ajd0ZVdoSHAzTkZNQXlpTnRrWm1uRXA2U0ZxWURqbmx0Y3IvQmMwT093?=
 =?utf-8?B?K3VsQ2lqaWNGQVltZzNuL2xLYWJNWVVPSEluMGd1a2wranl3NmxBd0pZK3Fh?=
 =?utf-8?B?KytKbi9ZRTViL0E0RFJBM1hnRWxOa090ZjNHc3VJTFFFR2NhYytlUlMraTNG?=
 =?utf-8?B?Wjd6My9BV1IxZW9yNnVUUWxLRy9YR2ltSUFkdzkwamUyWExXd0E1ZDZQYUpG?=
 =?utf-8?B?dU9WMDVEU2xHQVN0MW5hVllzMytmdnVxaThoanJoc2JDRGROSVpDLzRDSFFj?=
 =?utf-8?B?dHR4ek1WMFkrbGxnRG8zOE9jS080Y0NTelM4T1d6M2R6OEY4V0x1RitkK1Yr?=
 =?utf-8?B?TjlwOHpCaWtZYUtwbzZkQXpEdXpoa0RqemdhcW1xTUNWb3dtU3lucWhoc0tp?=
 =?utf-8?B?TUl0cSt0Z1c1MU5CemJqejVtL003eWFDWEFydlBjMUdZWnRJd2JKS2FMUHRy?=
 =?utf-8?B?c0hDcVZlSG9tZ3JZSk5hWTQ5d0tZSlVqdUdCcmxmVjg4KzRhcno5eW5mRDdY?=
 =?utf-8?B?MFVTUHZMZFdibEVSK05KYW4wU0dFYmJ2MTliK2p5cW9xcHVJUmFNbmVRUU10?=
 =?utf-8?B?YW81eWZ4cVlOcGtDbmVPRmZ4T1A1elVzYmtrV3BmcEM1NnpuUi92N05yN3Rr?=
 =?utf-8?B?dVBqbitzWVQrazhwaFA2czJDOWl4M29tdW9ReWs0YzJ0aDhKUkxvdklXL0dH?=
 =?utf-8?B?Z3ZuY0hDc1dZOWhsby9DcWowcmsyY08wdWtneEx1Ri9iakdYaU1YdVNNNkpa?=
 =?utf-8?B?NysxaU5Gd2hUT0cveGJQelZ1R0dqZENQaHdBdmtMemoxcFh1S0tvbUlxMzFu?=
 =?utf-8?B?UE9rVGR3cS9TbUc3aWFJZm9yaUl5NE5xMnBtS0RZVEtMLzhrYnFEQXQzM2tW?=
 =?utf-8?B?bmduUzBSRUtDMDQyNUpjeXZ1eTZPa050VFQrZ3BkcmpuVjN2Q0FFYnpHN1hJ?=
 =?utf-8?B?WnpJSDJ5MUMreGh2T3oraEtrdVYzNW5xaERQcUlTK1ozeFVHV2Q3RkNCc2JW?=
 =?utf-8?B?R2pBTTNxTTBqZUVvc3ZTelhDYk03K3hiTGl4d1BOUjR3WUhsb3JEV3dTWU5Z?=
 =?utf-8?B?dlhwdmRYTkVkN3RsMzlvSVNLNVpjL2F2T2FpSUo5cXA5RXU5Ty95V3BITS9z?=
 =?utf-8?B?N200TnhwS3BSVTcxWnlORXBnT3oycGp5bEcxdCtRMHpEYWVoNWZ0cHYxeWJX?=
 =?utf-8?B?TmNWQm9qZTZadGJQTnI4UkppTFo2VFNZaTRJM0FuNTFjRHFpTzZxbG5zV1U0?=
 =?utf-8?B?ZHVGRjQ0UmhDbVpqTW9STCtHSkgxQlJQMEo4MEtCVjRRaDlpbit0Z25rQ2dT?=
 =?utf-8?B?bUxudmVHR1cyUEJDWnZwTGFZKzV4UkpOL2dCZGVMemg3cjdabmtrWHVSeXNJ?=
 =?utf-8?B?bW0vUTVFajRjTDVNY0d6NWNtb1lodGRXY3hrb2ZEQk45RXdDSm9Db2ErS2FQ?=
 =?utf-8?B?Qm8rR0ZGcmZWODVZbWxGYVliTFpXRnpYVVJsS3Q1VDIxSnBSdGVIc09NcVVJ?=
 =?utf-8?B?RW45SVJveUZ1NkFzaitKMENIR2pkVVdDOXhiejErN3ZPQUlCVDhtYUhveXlM?=
 =?utf-8?B?VFZEaUNyb3VlZm9lVXBQZHZsa3kxcTRmZ0J6N1hyeDhVYmFDMFZHSjJwSjls?=
 =?utf-8?B?djZaWTZ0NytWMTM2cnI1V01XR1JVQWVkQ0thQitPNXI5QTFBOUExWlhOa2Zz?=
 =?utf-8?B?aWFLbDFMRENOWFBscXU3WFVKVmpQbXBnSmU5YVVJUkVhVDVZZlhZb1orZDlw?=
 =?utf-8?B?QTBkZUp5SzhZeTI5VDJNbDhyM0g1SUFUMVd1N3M2eDVrN0hpUXdmYUNkUzZt?=
 =?utf-8?B?blhHek52aTJ2M2dQa0dFUnZ2OWlyTGhSZDQ2QjFHV0xlK0txdmpvaElaTG5x?=
 =?utf-8?B?a1pOYS9xUE9FR0NydDNuangweDQzTnBBdFowNk1HWXliT1BUcTA5R3pkRXVw?=
 =?utf-8?Q?YahhXpfL+ZKoXlog+Is3Th+9lFYLaFrP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZkTFFWTlY5WWVjL2lab2tvUFBUN2JqM3JXRFdna1laVTFnZGVrUW11Y2g3?=
 =?utf-8?B?eHBvS0FaSlA4NlVTQ0NtNTBZQWNvWjE2bE9FM2phRFZUQUtWdGhJdTR4WXdM?=
 =?utf-8?B?RGhtdkg5dGU1bGZyMytwRnUxWXhSVFQxdkdTUytCUUdDVDdrKzFqckFRYkFn?=
 =?utf-8?B?eHdiSXBiL1UwemY0a3A4ZHZzUm1sbUFUMS9QUTN1Y01rMjhaL0RRTi9SU2Jk?=
 =?utf-8?B?Ry9QUUc1T1JwZFF4RGdlcGcrQmM5VVc4aER6dUErRTU0aTlFcDJpQ2lMVWZm?=
 =?utf-8?B?ZDZmV3dkdW1GdDQyZVN6MnB0c2k2c0VXeVV0OUxXaWNDZXIrSE9HZzBqQ3BI?=
 =?utf-8?B?ei80bStPSjRaLzFxUW9rWnVhckJoZWs2akhpN1hyYlpES2VKTGk2UVRmYWg3?=
 =?utf-8?B?VkpNMFhiRm90L0YrN2R1TEthd1psbkRTek43dDNpb1ViZHpLWkVpR3ZaU0hN?=
 =?utf-8?B?TitqRFQwTEZzd0lKK2o3aXYwUktHODl1YVNEMU9rSTlzaUhRWjFqenJvZUtw?=
 =?utf-8?B?T0x0NjZOU3Q4RlR1REh2ak9hN3FyeFdOUUk2MnRtSDhGQ0RaN21ybVNORlV3?=
 =?utf-8?B?RDllUkJaZkhvOHpUY1U1clRHMmU5cVZEWWdxcXhDZUtQK1FHVVdHb3pTaHk0?=
 =?utf-8?B?eDJIdi9jcTJoeVZMRUZQaGtkR1hJdDljOWVSTUE4dXVaaWpyM3RGUlV1RHls?=
 =?utf-8?B?WTdyYmlyb0FUVFlRQ2ZRN0UvelJhWUQ2U0xLaGVGRUpQTFNodVJaYUNMb0JB?=
 =?utf-8?B?V1FTK0s4dXQvYXVJcm4zNzNPN3R2ZEdpTnRSckhaREtBUWZQVXlSQnYxdzdn?=
 =?utf-8?B?N2RKWTg3NW9nazZGYm1VUWtxbDNjM3ZuMHlGNkFVU1piVjNGNUs4SlRCc1Yv?=
 =?utf-8?B?Z2RQcVhOQ2FjeDZNMGhSUTh4QVpZUUYyVkZYN2t5Z21JQk1OdGkxY1ZQVnNT?=
 =?utf-8?B?eDhQQmQyT2dzejE5VlZSekJXbEtNMVB2NXdXQUZDelBKUS9PWnRsa3licGhE?=
 =?utf-8?B?MXFmRXNvU1lWeGtTcmdjOVhzWFU2aWRLN1FwN0tEQ3J1ZmV4cU9uMFJ3aHRY?=
 =?utf-8?B?UXIzbzgxYTd0TFpJUWdJY3J0N2dKSjIwaVhjYlQvbE95YVQzZ3o4aGRDaGdJ?=
 =?utf-8?B?QVVVMFQzS3ZQcWtMeThnL0ZiRlZRMzNkZytxazV4ZEM4R0l5UzdqTERYY0Uw?=
 =?utf-8?B?V1pJUVR2RmVneW9lbUpnMWhEbFlDazBPc08yMFpxU1ZHenpMZG4xOGVPcXl4?=
 =?utf-8?B?d2JRalRkczhMWWQwWENzNHRQV3RIKzg3QXZQSXpxOWlZRTdySmgyKzBtNk5a?=
 =?utf-8?B?QldEbkFTRUlrbGFIS0ZVZm5mVmo5NHpzT0FtVnQwU0lRSjJibExKSlZkKy9q?=
 =?utf-8?B?MmIzWi9OZGhPMFBDVUZleGFLWHlvbEJGaWhtZ0M3a3FJQVFKcU44cG5hS1ZL?=
 =?utf-8?B?SHJmWXNFZWNSTVFZVHFtYjZJZTd0OU9GK2NUb2U5UVNpZDdSU1BWUjRCMGNY?=
 =?utf-8?B?ckdOTlgxcEcxT0pTNVhuUmJsWkVRSy8wZCtQTVRvQ3gvUXJONDMxNHQweWhs?=
 =?utf-8?B?aDlyaHRRM1BTVG1lR2Jkb0FJUkRiaHZ4TTVIKy9lejRiYmJkVmdyZkFVcXMr?=
 =?utf-8?B?NUMxOFYxamV1YWpmd0dsRTNRZW15dVVCdmpKMkhDZU1zcnpVL0JMT0FaZWdx?=
 =?utf-8?B?T2Jja1poaUh0RGVmWW5GTzdKMCtRZzJUZUdERG1ObzAzRThDdmhkTG1aWGIx?=
 =?utf-8?B?ZmFUZXdjMnIzRkhGV1VLOTJ4a1BQcHlaY2MrZ3JCTjFGakFYZjJVWkcrK0R3?=
 =?utf-8?B?aUNjT09UNWx3NHlUN1JCOGV1emtBRFVGdkdHUFNRaW1adk8xZXBVakNIQjBN?=
 =?utf-8?B?dHZFUmJ5MXV6NnRna1RQOUpoLzdka1NaT1hhcERPa2xPWE5ZWEJRNHFjZ2ZW?=
 =?utf-8?B?WnBnYUlBeFV1Z0xhVkJiLzRCc1dPOEQxS1BmWDZzdUNGbi9Uc0RtRno2K040?=
 =?utf-8?B?QndUZk1iMDE0UStMcHVSK3gzZkgwNlYvTWpsWnZESWl6dWxwZ3VlS21kd2Jk?=
 =?utf-8?B?dmdtYmRQYzFJMlRHWnBqaU1GK1gwR29ZeVl2MFFkTVVuU1QzVVJQNGc5T3Rl?=
 =?utf-8?B?VStJWUNxQnBvMnorOHh4a203U20rNHJBSkc3UXlQQ1BBaTBqOC83aGpxL1Ez?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4c412f-84d2-4ded-9dbb-08de37e63792
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 12:18:24.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAr8ljHAFG4+Y2+Hq/GIu1NnCS7pkuX2TSGmaBtkDYXqAEstVIChojoPLV3GtLFr1Fth7TQBZ/V2IdV3e0kozg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8450

Hi,

On 09/12/2025 21:03, T, Harini wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Tomas Melin <tomas.melin@vaisala.com>
>> Sent: Monday, December 1, 2025 6:20 PM
>> To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Simek, Michal
>> <michal.simek@amd.com>
>> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Tomas Melin <tomas.melin@vaisala.com>
>> Subject: [PATCH 3/4] rtc: zynqmp: rework set_offset
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> set_offset was using remainder of do_div as tick_mult which resulted in
>> wrong offset. Calibration value also assumed builtin calibration default.
>> Update fract_offset to correctly calculate the value for negative offset and
>> replace the for loop with division.
>>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>>  drivers/rtc/rtc-zynqmp.c | 29 +++++++++++------------------
>>  1 file changed, 11 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
>> 7af5f6f99538f961a53ff56bfc656c907611b900..3bc8831ba2c4c4c701a49506b6
>> 7ae6174f3ade3d 100644
>> --- a/drivers/rtc/rtc-zynqmp.c
>> +++ b/drivers/rtc/rtc-zynqmp.c
>> @@ -208,13 +208,13 @@ static int xlnx_rtc_read_offset(struct device *dev,
>> long *offset)  static int xlnx_rtc_set_offset(struct device *dev, long offset)  {
>>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
>> -       unsigned long long rtc_ppb = RTC_PPB;
>> -       unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
>> +       unsigned int calibval, tick_mult, fract_part;
> tick_mult is mentioned as int in previous patch and unsigned here. Justify the type in commit description.
>>         unsigned char fract_tick = 0;
>> -       unsigned int calibval;
>> -       short int  max_tick;
>> -       int fract_offset;
>> +       int freq = xrtcdev->freq;
>> +       int max_tick, fract_offset;
> Please follow reverse xmas tree variable ordering.
> Also keep the frac_* variables uniform in both set and read offset functions.
Agreed, I will use same name of variables and types in next version.

>>
>> +       /* ticks to reach RTC_PPB */
> The comment is misleading. Its tick_mult is nanoseconds per tick, not a tick count.
Answered in patch 2/4.
>> +       tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
> We can first validate offset and then calculate tick_mult to reduce CPU instructions incase of invalid inputs
In this patch it would in theory apply, but when looking at patch 4/4
You will notice that we need to first calculate the helpers so offset is
then performed as soon as possible.

>>         if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
>>                 return -ERANGE;
>>
>> @@ -223,29 +223,22 @@ static int xlnx_rtc_set_offset(struct device *dev,
>> long offset)
>>
>>         /* Number fractional ticks for given offset */
>>         if (fract_offset) {
>> +               /* round up here so we stay below a full tick */
>> +               fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
>>                 if (fract_offset < 0) {
>> -                       fract_offset = fract_offset + tick_mult;
>> +                       fract_offset += (fract_part * RTC_FR_MAX_TICKS);
> It would be better to add comment to explain on the negative offset borrowing logic
I will add comment about this.


>>                         max_tick--;
>>                 }
>> -               if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
>> -                       for (fract_tick = 1; fract_tick < 16; fract_tick++) {
>> -                               if (fract_offset <=
>> -                                   (fract_tick *
>> -                                    (tick_mult / RTC_FR_MAX_TICKS)))
>> -                                       break;
>> -                       }
>> -               }
>> +               fract_tick = fract_offset / fract_part;
> Its better to use DIV_ROUND_UP()
Please explain why, that would change the end result from what is is now.

Thanks,
Tomas

>>         }
>>
>>         /* Zynqmp RTC uses second and fractional tick
>>          * counters for compensation
>>          */
>> -       calibval = max_tick + RTC_CALIB_DEF;
>> +       calibval = max_tick + freq;
>>
>>         if (fract_tick)
>> -               calibval |= RTC_FR_EN;
>> -
>> -       calibval |= (fract_tick << RTC_FR_DATSHIFT);
>> +               calibval |= (RTC_FR_EN | (fract_tick <<
>> + RTC_FR_DATSHIFT));
>>
>>         writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>>
>>
>> --
>> 2.47.3
>>
> 
> Regards,
> Harini T


