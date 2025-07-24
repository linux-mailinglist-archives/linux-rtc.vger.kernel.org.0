Return-Path: <linux-rtc+bounces-4568-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8AB106A3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 11:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E1397B39C7
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 09:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E008C237186;
	Thu, 24 Jul 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hP8ezYym"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E12367A0;
	Thu, 24 Jul 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350090; cv=fail; b=Z8LJ7/imHy8UejN9A1YIQO+v/HZuJXeXPORLEtpNVRRP7shV3PgYKqT3074/XltlBzXRUYKpRVwva+vNLsPW//CYB8+Kl6A50mCOIaGUsDrHJJGIFXlD67ZDUhJFXi9oU27Vk8yKrLwNQ4m9VrJusRuKZleb+ybIgA/d0aAamPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350090; c=relaxed/simple;
	bh=SZxhAi76teprn1LjeS2cxC1zRt0FjQsnVDXd41Qyl7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XfIYvEx/jEent7LVoWU80wpl1OIowarqbd3G8idBgCpJt/mfu3LjOFy+XJwQX9X8UUawvtIcOlJCKBa8O0fpZhFyzKfQ9rkThqRz5Qgyo/qOB+9d2+8V0Fh0K2zHx++BdNntYU2n/vLDpkaJLiQBmcGPnAthe/1+gFt68maVz1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hP8ezYym; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu9UwacAJMRZhFVyoepcFYtiBAdBlyq61au9prGjUjGxQ9Q1FFRHk1a7BImgvVs2WG4vw+x2I5rsfHhULLtQQ678ruTfKV54HGSYmvnMwyM8Ks6FByH+CvnSeH8Ydhi4grnbz4Cd0Z34Nx1lnRlzW23KqtKvphlySAv1KyiDkPA/e32G3QbDAYXZJ963sAzUNppzcKbaPEdbtFVmGTqiRKVEbrmzYnjbFQXS0A83CxHXbOaAntrlrRJr614qqbm4LdKZNwctA/rF0zf6jDRwUki4wnLKMlR8F/XmI6A1QAPTNK9nrF7ZJ91u2/857CIBQKTfI7VrPBaouDDXPZlB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8rku9XutfUXSCo0h4d1Iht0TkjOUoF/Z7EXqgYuXSk=;
 b=r7JXUQ7qjo2ilQfTWyeXGyhByO6Yvx7burikHXqceWDmwAJABDJ2IwjGnXSEH6K7HNBWw7dji8/BysIKwJbB+JEWQsG+9EAZCChJCCsyUS5mgNIN29Mnb5xzjntrXASyJCHpcWpEQmIC8BFc/oO5clS9XQv8T+gjXba05p2ASU0s6X/0dBI+YcFKN0Y53jsvP6HNd1gU55fmsGRNcP+zc3F3l1UKScHmGt62rXnsJPBfqIozBmB/5kCL4qvVgYA9tW2Clo2At0guIEOlkf1PsTNFVFGkRwzLfXejIaTjR6V4912YLPZDI6C1vIP47jB7Yolix/5cLuDdKR9DUwaUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8rku9XutfUXSCo0h4d1Iht0TkjOUoF/Z7EXqgYuXSk=;
 b=hP8ezYymKeXw5FvZgueqM2buh9knXNVfOtTUYEuBd9NjjAlfxO051rAOqv/O9OZwS5rb++IfqmQCbvcKByeszuUYXbCIueEtj9c/RXtr0L2brwTm2QfQNs2dm1AegGI9fbwwm9i+armV/fHBOJSIOICjSY54/z1o5SNUmQnyj/w2CES66F0ajMwW/Vv5dEbx2Hs7mqa3/MwWpPgAG64UcwWjLVLU+Zjh5rtRKECCA5vtWM5B5t5LgzqZH+kPJqhaDvL3KZ4OekDt4fJpQzqPFgvk4Q2D4OHtSOscmHN+7nkS6LMbyXfekmeiyjoM3Taq420oJhgl0vGGufUMGKpJ2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 09:41:25 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:41:25 +0000
Message-ID: <2c59e665-6415-460b-8ff8-c06f8d94f9eb@nvidia.com>
Date: Thu, 24 Jul 2025 10:41:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
To: Krzysztof Kozlowski <krzk@kernel.org>, Shubhi Garg <shgarg@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250723130343.2861866-1-shgarg@nvidia.com>
 <20250723130343.2861866-2-shgarg@nvidia.com>
 <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 7915a8cc-8034-420d-0904-08ddca964168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkZZaUh4L2NFTEtLVHhIdjRsbXk5ZDc0Q1hPdmJwaU1QZkRLbkkyVmVMamlo?=
 =?utf-8?B?cFQraXRVVXJQR0tNMUFaaFp2dHMxVGJObTh0cGtlcUJoOFc1SE1IcUdWK3dq?=
 =?utf-8?B?di8rU201QzRVdkswYkNlRkhYbUlBSjZhRE5MWHBoUklPWGtnbkJicVRsZ056?=
 =?utf-8?B?STVlMS9mYWozeE9JUlQrRWpDZklLY21pOFlJSFdjUlFmSkszWXJSdjZhcFFz?=
 =?utf-8?B?KzZ6NGJ3NFExbVRad2pFdlk2dGR3NlNSVkJzbndYUER2bFpvWHh2cmJIRXNt?=
 =?utf-8?B?TzBJZVhPeEw5VVVaaTJIYkFPRm15NnNaYTNTUngxbnBSV1hYWjRiWVh5L0lw?=
 =?utf-8?B?S3RIcUZvbWFnRUM4YnhYekxFU2UzUVNFZHVic1Z3b082U0hkTUsyV1VxNmdw?=
 =?utf-8?B?QU9qZkd5SVFQN2RWRFgwRDF1QnNQZmV0UGE5WmpDUGVqU3FsZnpJUDdEWXVv?=
 =?utf-8?B?ZlU0ZnlaSGxPa3pJdElFOVhBK2MxSXV6dXpmM3Vnd2dCZVZhaHFENkttc2w0?=
 =?utf-8?B?aEIrMEJ5ZVI0cC9LU1BCZUxjaVIwemJxZXMrVWtuNURiZ2c0UDN2SnNhcERm?=
 =?utf-8?B?dS85RHpvcGN4SERSUnM2c0dSUVA4anlUUXVWczlMUGlWczE3TVd2emNRN21F?=
 =?utf-8?B?dC9RT05sUXNENVVXUnhjaCttM2tabzZLNUhaU0VFN0hYNUJtR2FIaXYwZXFF?=
 =?utf-8?B?TFI0Q3Y2YVZQZ2RDb2QyYThIeFJRR04vaC92ektMdldFVWNrcHFRZndsN2RT?=
 =?utf-8?B?dlcrMDdrQlF1SzFTYWxSREpEYnhEWWZLaTZVcXViYnhRcHNSZXloUEJIWkFU?=
 =?utf-8?B?ZzFXNk12SW1HWWxxMmZHUERnTnVod3Jib0lSTXZWMXZOcko0Y1RGbEVYL2JQ?=
 =?utf-8?B?RmYzNGlNbURhQnA4OGxPSkxNT3BjOWtCWUt6RlQyb3BDa2FmZXI3QzlhWDk5?=
 =?utf-8?B?OU9ienVUejhRalJJOSsrNFZ4LzVzNFBjUjl2aUxwK1JWKzBpTzFja1VDQ3Jl?=
 =?utf-8?B?aHVDS0FtYlozWFdSQjE2SmlPVGJPd0R4R3lBazZSVlVQbDJzR3JNOVFZeVQz?=
 =?utf-8?B?bHAwSnJlZTZpc09FaEF3NWtJSEFiQklUTFlTZTF3QUIwdUpJUkZGcllidEhi?=
 =?utf-8?B?WUdSS1I5dTZ5MEw4cSt6b2xCbVRxdWdYZ3J3UEl4YTgrSVNiS1MzUmcySkcx?=
 =?utf-8?B?aUVUbEJPeHZudCtkYTA3UXJBclcydTlsSXZDZTNOUWlXQmxYQ3F5SjBjVVho?=
 =?utf-8?B?KzdFeEl5NlZxc1htR1dreXllNjVzM0hIdXBmTU1sUzYwVmRJc2diMHlWdE5P?=
 =?utf-8?B?QU5hUzF4Ym5CdEhrUzUvZHFtclk3d3VNWU9Bb2dyTU1XU0RFdVRJNUNLalJL?=
 =?utf-8?B?NFhwZVV2TnBoY3g5aWdpd3FXaXdiS2lYTXlrWitMRmxnWlVoeGVkNy83cmVH?=
 =?utf-8?B?TVd1T3BLNGxmVTEvelhXaHE0RlNPeUk0eXh0SUlma0ZvRjhQRmdGOEU3Ti90?=
 =?utf-8?B?UWRDalVKZFFTd2wzWXZpWTE2Q2kyVkkrNVBFbDBad1FGbmJKeHJCR0FiUTJi?=
 =?utf-8?B?a3o1NDZSUE9Qc3hNRHpDY3pXOWtvZFMzOGxyRm1aT0tOa0QzQlVoQzhWOFM1?=
 =?utf-8?B?dkRHbXhiaEJJTFk0cDhzclVTVWJhN3oxSUJFZHpOQXJsZEwxZDcyV0djdmVZ?=
 =?utf-8?B?bGFCejQrcFprdjlnN0t1aGQ0eFNnL0MwOGV1RmlXcGhXbWw1V0JWWFI1aDg3?=
 =?utf-8?B?U3VMQnNLdmNNbnljVGJkcUpDank1NmVEOEZ1aG9KM2RLcmJXVC9lbXY4SHp3?=
 =?utf-8?B?Um8weFZiRk1YYjFha092ekxrTURITS9SK0tZNGxNeUpQc0tCQk9TUlFveTVM?=
 =?utf-8?B?VlNLdVMzNDYrZms4L2d5UW1DTmdxQmIwSjYvcGNCQjdVc0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWN4bEJwZGNoRlJZTFgvbTdEY3FNWGJkdE9WOXl4a01UZHcxK3g1TlljbU5v?=
 =?utf-8?B?d0xGczBud3JkNHQ1L2JaZEc5aHlwL2ZsVzR3eHlmblYvVXJkdzFvOWNaa3RL?=
 =?utf-8?B?eTBBOEtyUnlhT2w5bm5wTEZ3dmJyZS9YSUdBZXVOeWY2QjNsUFdvamNGRnJu?=
 =?utf-8?B?Tzh5YnFrVzhsZ3BNNGhvRVFmWWRIZkF5QkR4R1FJVmExc0RVbHEvdjBvTmpm?=
 =?utf-8?B?WkZ5ejBLOW03dkhVaXBSR2dyVEtMS2J5TVdqcFRIRkZsZG9COGxiY2h3QVo0?=
 =?utf-8?B?cEx1dXRSUXpjcFI4bFBLcHkzcDAzNVNrSGtjMk5ZZzFpZzZnVVZWRjZiZG1T?=
 =?utf-8?B?K0xPQTVhRkRRa0N6cyt2eUxsbTd2dS9LcmljTHB5WEtlV1BLTm5MSUthQStS?=
 =?utf-8?B?bm83Q2JXZmlaYkxuTFBuelIrY0hINWtGVW1DYTBtb0s3Z3luNXJWMk5JdDlJ?=
 =?utf-8?B?YVg0YmVwOHVuNDZ5c0pBekZiQUZKQVpsektTcXF6b09mTk5LcmJKYkRCemIr?=
 =?utf-8?B?MXJFVFE2c0RocFZ2c0lxVkkzeEIwc3Zpa0Vsc09kZXJlc0JQaE92MXdpRDBp?=
 =?utf-8?B?aDNQOXdIS1RMRXZmcUhPM3hyLzZneTluOWtDbVViZDc3NCtaa0lFRmZ2Snky?=
 =?utf-8?B?R0tvZHdPZFpFYXFDRHM5bUJWMjl0VFZjVFU4Zjhua2dYclVYTndZR1pjY1B0?=
 =?utf-8?B?N1pTSlh0dHdnRGxoTytQblVncS9xY2xlODdJNCszcjViUlhKNHNmSjlhQzdU?=
 =?utf-8?B?Q1BNTms5SFdKSjhKdmRXTGNIWHFjQ3R5YXFnaUlnbFlkMkVSdHk1b1dHZ0pq?=
 =?utf-8?B?L2F0UlVndmpKWTd5MWsxaWtZUm1qdklIQ0xNTDZ4cmhBTkd4WGQwU0o5NEdI?=
 =?utf-8?B?bGdteE1OSzY1VFJFSHRtL2g1MU92VWlwN1YxU2Z3VEwvbEc1Tkh6WjVIVmFz?=
 =?utf-8?B?R0tUZmJmMC9KVkxmOXYzNXlVamJoblFwMTNVRDlIS0V5dGlNZ0o2Q0Q3MG9Z?=
 =?utf-8?B?WCticDBINUpIZTJBUkVyZWE5MS9rdG56VFlGeDBjc0NvSjY3WWhDbjh0bGxl?=
 =?utf-8?B?QXJycGRubUVoNzViVUlBUnRpV2NVMStjN0hzeW9CQmkzUXNHdkUwK21Lak5W?=
 =?utf-8?B?MVo3NmZXdHY2SWlncEhjaVFqWDl6UFVaYmR4Q205bjdLWW9jQlM3UENIc0My?=
 =?utf-8?B?d3d2MUV4RDhjSXlMSFVyMU4rVWlDUTE1SGgyVEpHQkF1aUtjcWVvdWlzeWlP?=
 =?utf-8?B?MFhtdGxNeVYxWTM0L2ZFVFQwT09xM2ZSZVI5KzFUUXB5V3VWY0VWWjJjUE1x?=
 =?utf-8?B?UHpSYjhZMml3dlpiSFlMTHQyMXY5WXp1RkJCUzdlZVRmeG1wZlY3ZGtRTU1J?=
 =?utf-8?B?OGdlTHFPeTl0d2NrWHlNRVBDTUhNOUNlQ2wxUXNMRTZXZXJSb2tVREVMMCtI?=
 =?utf-8?B?NGRoem1yS0NQU1VsT3B6RmZQMlZObzZ1M0ExRDZiUDN0UGZGMzhTNTZwRTlD?=
 =?utf-8?B?K1h6dytieWtvdjVMbUNlZ3g5SkpkVHE1YjNVd0tHeTVSNUdSMjVXZzR1L2l2?=
 =?utf-8?B?eWV0U2VxMzNPblhrb2tuYWpaUzVVL3JXUXYrYjYzSE1PZlgvQnI0ejg2Qjds?=
 =?utf-8?B?dllESkVybVhXRHdpOHA5UjZveUg0L3lmL1BmcWtXcjFXL3JVOW93TUxkSnNB?=
 =?utf-8?B?VzBYNWNrSC9xem9LamFzaGNoanI5ZzBTcXhWaHkyOTdQOUs3RnZBQmU5dkZB?=
 =?utf-8?B?MS9oTExDVERhcklaY05NVWNTRXMvdmdDbmNoWTdKN3lpRVlRYWxPZGdWaUd4?=
 =?utf-8?B?djdZZG9LMkxBOXY0aXlPMG9ZTmpKYnM3Z2drQ2piZEs5Z1RpbmFNZU9uWTl5?=
 =?utf-8?B?YzZ5UTRKeXhpcVdiNVhJM3ZoWG9uSFNWZzZvOHI2YkZ5VjlXRE1rZnQ3S1hl?=
 =?utf-8?B?b3RyUnhDYnh4TVB4a0Z3NVd6ZmZlN2RlbWJpR2g2cVExZ1A2RUNLTmUvSjBt?=
 =?utf-8?B?cnRtTnR5SkxZbCswYkpzcXgyaVhrdlUyQldMU1gyeU9BclZhb3VFOWZ3aWlw?=
 =?utf-8?B?Z1FFMk12NGJqWDUxNDRpeUh0azF5bWpCbTRUbnN2VFExSXJPYWVtaXJpWng1?=
 =?utf-8?B?SmJiMk85L3RUZGs5aXl4VGwxYWpkS3dicnRQRE1nWHF4akpKbFczWDV2U1px?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7915a8cc-8034-420d-0904-08ddca964168
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:41:24.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBCFBSoJvOQi8psOv3F77dDyiyghtqfqGNKHSEifNu7skqybR9oeustVuqa3UTY+TA5c8D4XTIHjuj36P+bvRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922


On 24/07/2025 08:59, Krzysztof Kozlowski wrote:
> On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
>> +description:
>> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz RTC clock
>> +  support with backup battery for system timing. It provides alarm functionality
>> +  to wake system from suspend and shutdown state. The device also acts as an
>> +  interrupt controller for managing interrupts from the VRS.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,vrs10-rtc
> 
> Nothing improved. You never replied to comments and then replaced one
> redundant word into other redundant word.
> 
> Respond to review or implement it fully, not partially.
> 
> Or add COMPLETE bindings, not partial ones. See writing bindings doc.

OK, right so the DT binding should describe the overall PMIC device, 
even though the driver needs to support the RTC.

Shubhi, is vrs10 the version of the VRS spec for the PMIC device or just 
the RTC portion? If it is, the maybe 'nvidia,vrs10' is sufficient here.

Jon

-- 
nvpublic


