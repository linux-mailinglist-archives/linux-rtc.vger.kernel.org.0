Return-Path: <linux-rtc+bounces-5011-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0BB932EF
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 22:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD37C3A5A8C
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Sep 2025 20:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F2D310777;
	Mon, 22 Sep 2025 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ekAwf4tz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57602262D14;
	Mon, 22 Sep 2025 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571699; cv=fail; b=YntWMxVpWeDzF5x2HQ3+wHi/sCNB7kOxWU9KlX3jbgg8gvHOwikmpu6mo1GiZ8Ng43stu0a+pwiKYJMCzKTFu/y4KNYy2kJL8/AvCrEVl2DH7zqongVyraNg/zYTBXm2AfkQ1qjnQSu0Ngg1kZQIiI74VwpzM/x4zoJmjWdppAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571699; c=relaxed/simple;
	bh=tqbnXw9iqaoaTJJ02alvpr7FfohnrqsJTdnNEMgiRyU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G0+T2lpXoMtMiSqngOZExz+oH7CeFdDmyNgwaegTDNNQ2q8Qvj042cUaqUd7bhp+SO2aIjRs/QSjTaYw4zDO86j0H9nNjIRfzQRw+OnLG6hs0l0A2mhevFjadhJTR0D6Tfr86uf6RjOMEjHJ4OPDrpyfAkB7RCDC3fbxud6LFyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ekAwf4tz; arc=fail smtp.client-ip=52.101.48.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIBiplgYN7obPHns3Fs9kuf84IZbSQlGnMMY34yoZ14MQ3ClEfIOiRuw186c31gfm9mQfdAabi+UEI2Fc5z/HPD5blbB9EipASt/Ao+3phUZgQRYBrDtW9g6lzQccq9emJVxqprKFh+8jwoAN5IRRH6JdB1Wl7txaAjiQ5XtL9pRJlD2sex1t0fQOm615/kGs8Ur80azLPgrH5/JEwzyBOKo/OWuIUgjJ3sfG5q70ZgpgbyFpUEFVMpgEcH7HH1R7Fg/EY/4mGP3wDE67q1D56U5DYgI/xp227+xXbLcbGG115HJEhr8CKmdCAnCwiRuOReadmM7AGeVQwkF/xWpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qmxzgK4V6jUUay+IWE+agZ+OImNz//rT+UFOpyQhkg=;
 b=N1KB6XlWS5vRyjlpn/5U58tfQx3QqoZhzjVuBNaooApus+ALJzGf4k4q1hYWn+Q22eomRG7D0OCMFzhPUrLpsHz8r7bXihdFDx1dNnPOncT8nON0EqeO/SUJDbNtx0C1UVIOnP0JnAazoaEM6v4xxuPhTt7ibn9Iw9UpAwJCZm4jqPdowoS/6ijB15tyXVR4/ChS346OcauPxarhyTshl6AkTSvIL+9k9Vd4Rawnv4YdgjlKeet2WHHEI4tlVqppEtupe6DnSnAV6jki3IMcCPcV7Y1jGuu+zne+bXlbSDIjAQI8Dtl9jCTlH+ysmOF0bS0fFCFYOoyzQQ/xU/EcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qmxzgK4V6jUUay+IWE+agZ+OImNz//rT+UFOpyQhkg=;
 b=ekAwf4tzORJZMure6QhLX82NjOu6qP/rtA6apz9OC/VEDIMa7EbsHZlGLHeEx3Po3lVAslTYVc/Pg8Axp7Rp04+uVri+n3ZFNIMqs6j7vaGt9S38WmRD2q4PspJaE7hWhuqkS6J9AEGahWfrm4iTzV5bPbGNkf/D6ZzufH+nmj/wmF3Gv5IXVtga49y2NtjjpobwwkE+JMBSYChuT+no3LrSfSd3LDQz1xEWt3PfkCYmZlQv6H12Ss7y74N69g4wFFvADL8iMLtkPgB4arnCbnPNEp7OKGs7r6CqdwKimjA5kxkBKtTfq9pw8laTspK3vyy60YaKcpJyPcoUtv0rxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 20:08:13 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 20:08:13 +0000
Message-ID: <a1d6955c-ac43-4cd3-bb7a-9b627aecc47c@nvidia.com>
Date: Mon, 22 Sep 2025 21:08:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
To: Rob Herring <robh@kernel.org>, Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250919135950.10403-1-shgarg@nvidia.com>
 <20250922195354.GA1065946-robh@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250922195354.GA1065946-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0023.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 42543a20-2a49-4a80-27dd-08ddfa13c267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEFHM2RpSk9lamY2a0JISTlQS0h5bjBoN25DblY3NTV4L1hub2t3WmVnWGxN?=
 =?utf-8?B?WVpYeFovYkwwWTkxN1F6RVJrbDZGOFduV2RnaXhRd0NnNHFiWW5jQkRyOERV?=
 =?utf-8?B?VU5CUUIwaXZPT1p0U3JrbE1ocmRxaVJiTTNaU2NuM2IxVy9Id0VLM2QvVU91?=
 =?utf-8?B?dDAxK1FibzhyM3E0SGIrR3BIU1FyVU1IZlhyMnNZR2J0T042UFl1cDhxUDR2?=
 =?utf-8?B?R0tGdm9iamhwVS9PKzZ2ZWdHcDFCNnJPRmF3TUNGZzZFVC96aGh4azlpU3Ey?=
 =?utf-8?B?L29jQkd0ZG9xRkhLWmcwaVJyWVg4TmdLVE9XUVRmV2hmL0FGR05EQ0NiU3ZG?=
 =?utf-8?B?TThJR0Y0bXp6NXJRaVRDekJHVnZxRTVYYmkrZ2ZlcG1uUm9NQWNBc1phdGpX?=
 =?utf-8?B?cDRHelphV0dWNDNsOGZhdnNsM0ZKYUd4dHVCRjY3d2poSjRxOCtQV1Z3cnFU?=
 =?utf-8?B?alMvRzlHaC85NzRQUzB2UklES1VvNTUra2h2c283MnZZd2l6ZndiSVpuMnA3?=
 =?utf-8?B?Zlh1ampEUHM5VWloOGhFdUpIWm9aYVA4blVoallwUHI2U1BuMzh1OGpMVm15?=
 =?utf-8?B?cEorR3JnVlNJVUVUT3ZTMTFiVVNtUHhWTk9DN2hyQXFqaXhtN004bTdIakdE?=
 =?utf-8?B?MWZNaTRycWpJa2RYMFhiSFE2WDRMdExkcXNWM0lPdmQ3SGdRWlBEQjRiZ2Uv?=
 =?utf-8?B?NVRyOXQxd2h0clNjV0lGNnRRU1NyQnpVbkllV3BWTWZUYnAvUndDUHJqcFV4?=
 =?utf-8?B?eWowQ29JamcyMlNCN05GV05ZcDhSTDEwVHFNUmxIV0JVMTBNN3paWmUwYzV1?=
 =?utf-8?B?NWtoWlFLMDBHRmVzWGprQ2x6OFZjSEkvQkN2MWRnYlpNZ3RMNXNiWVZUYjRs?=
 =?utf-8?B?QUNrdjNTMGFqd29vbnh0dW04d1VoOFd0N3NPTUw0a00xaXRxUVZvaUdBUDRw?=
 =?utf-8?B?RGswbndFeDhHMzV4b1loQjl4bjdsYStYRWMzSGFReFc3S2hoRjYwSzl5cHFW?=
 =?utf-8?B?Qm9XZ28xUnduTm5jVkR3K3JMQ1Y4OGdGc0VkZVJVaG56QkRPTWZLN0ptZjJY?=
 =?utf-8?B?MzFDRzVEUVd5cktHTXZYeS83dW51NXdsTjdYQ0IxMFBnT1AxRlFpcys4NlFq?=
 =?utf-8?B?Z09zcVFIV0Fqc0Fnb1V2MndGTEhNMS90QnRnc05qWDM1V2RkL05mZTV3cmpw?=
 =?utf-8?B?ZktpTWs2UWQrZUxHNGRhOUNHaCt1K2FlU3RQZWNkVXk4aUZPeGlLM0E2d1lF?=
 =?utf-8?B?L01ZMlVTblhBYS9vZkJETkpxK0Z4bHZ2U3pVQzhyMDBFRUF1VmRGckllNVFG?=
 =?utf-8?B?eGU1K0RwRi9ZVDhyWGZIeVo4WEZJNytwckE0ckJDWUNuR2xBcnVFSHFuWGZt?=
 =?utf-8?B?cm5PQ0tzcWxocnIrZ1R3ZWhEMEQ3eXN1c0YxSlowRzBWY2w2MWNmVVc1MExx?=
 =?utf-8?B?U2F0WXpuUWJZMUorWG9JenVlOEErblR0SExuUFgxNGRrcVVWd25BWmdRQUJK?=
 =?utf-8?B?S0dNODB2Vk0vUHllVzhqMTIwcCtLdlhKVUY5WVJ0WnJQNllhL1R5cmU5dUF6?=
 =?utf-8?B?Znc2VzA4NFJNdmgraDJ3OXZEVnNrN0FVcmEvQlVsMTIyRTZpZWVsaW9LQU1C?=
 =?utf-8?B?cVBjT3h1U0dlOVRDQ1ovWTdDbVA0Z1Y0OVRieWpxWEJSSGxJcS9vNTcwNEkv?=
 =?utf-8?B?R0dFeVlBQ0w4NTd0VkdmVURaWXU3VmVpR3dxSldqTzUySStKaVZzeHRaU2gz?=
 =?utf-8?B?d2ZpYm02TnlYNmJocGlwdjN6UWpsMkk2N3RnNlNBQ1BRQXFzQWlBQUFNeUFQ?=
 =?utf-8?B?RXRhNWg1eTl1d1dMdFBwL3JrQWtjL3dYZG0xN3pSYzZMbjlQNVEyT1M1ekwz?=
 =?utf-8?B?OTdKZTJzcWZSaHp3L3p0c1VaT2pWcStSTmJLdTdibmdrMDFDUTJaUzRHYlhF?=
 =?utf-8?Q?6M68i0dcrM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCtlQXk1S0ZNMyt6U2NPdTJXVytFdmtWUFNHWXhoK2tpS2R0RW83T0h2anRM?=
 =?utf-8?B?ZXdCRUhhUVhncXFpQ3pVSTBLSjczaUE2RGRJVElLOW1GR0o1anRsbU4zN1Fa?=
 =?utf-8?B?L1NYcms0Q1JhVGJkdjcrSlRRT1g4L0txM1pQd3dqT3FoVEtQK1BHK2xvd0xD?=
 =?utf-8?B?Wi8vbWxRNk4yZnNRUWxralZIeVgyOTRPM1pISzlpU3dkbUFzd2drdFBjTlhI?=
 =?utf-8?B?UE1VSWswR2paWGU3ZW01K2VRUWF3RlBicVZ0d3dPTkMzRUZyaG9NTVNwT3l1?=
 =?utf-8?B?dm9jYmREWWFsMmRXaFNpUUgrSHN4QitVRHI2NzZFMURUOUxkaG5nZnhxVmlj?=
 =?utf-8?B?NmVjV0ZzdUxsSlRUSFVGV3BNa3pJTS90WmQ3YU5WRmZkSXhVekVXaDUxa29z?=
 =?utf-8?B?R1BaazVpd1JTMTBXYnpmZFhPek5pRTBkYjczaHFmb1hpTTNQMnM4QTBxajJ5?=
 =?utf-8?B?T2ZMSk1NUGF4eS9VSUFieVlFclExdG9XMUEwYm9lN2pYY25lTEI3ZEYzQTFC?=
 =?utf-8?B?eUxkTWRVRW1hVGV3UkNZRlNUclVMMHZKb29rcmRvZ1pPckVWNklIZFQ3SGMz?=
 =?utf-8?B?TGN3MjJkRWlDUkhKWjBKbjRZYXcvRlA0SDBkK01mN3lMTkc5dkRkYjRnMktu?=
 =?utf-8?B?anRzTHFRSGhhRE5aNFBMQU1qd2MzZ2xxanFZZHRxQXFDQnI4a2o0ZlZYY3pq?=
 =?utf-8?B?UEUwMGs5aXh1ZDRnNGhKSUxPV0NBZC9vN1RSV1V6R0JEeVNhK0RzZXNuNEt6?=
 =?utf-8?B?OTcwTTY5SHZickZHZHFweUZyZ2NtQVVrdWdwYnc4eXh5QzNzK1V3SHVFdDdu?=
 =?utf-8?B?T2dEWFlMUjh1UGNpbXJra3lnV2VEcFZVa1R5c0hISFBFMkIycTRnVFpxL3pr?=
 =?utf-8?B?Q0dHRDN6dFgrMG1wcWczYjVRby9Qc3JOai8waGVUdVlEWU9sN291M0RQTVds?=
 =?utf-8?B?VFEwZThhR2lTMkx6L2t6NzVRek9WcmM3blFhN2xBWlAvWXcyYmM0MUhhUkp5?=
 =?utf-8?B?YnhRamR1ZXRidWFXZnVCdnFZOFpoY3Nrek1yVkpJQU9ZSFJGd3B4dWdZd3hU?=
 =?utf-8?B?OTVCQzFKVzRuVVhlTTV6bEJ1cEVVcnM2WkgxYmlQRWNUTWp6QUJQR3N4TkZ1?=
 =?utf-8?B?RlRnc09iVXdWWkQ5eDJmVXBpcEJFUHNIb2JQSTJETmxUQjY3dFB3ZnM1RnJC?=
 =?utf-8?B?V2IvZUJWVG1RTkJCaXRsQ09DckxqQUNOOWU0Z3NwVGIzODZFUUEycjJmbEVw?=
 =?utf-8?B?cHNmVFgvcS9HMFJyWFdpejU2SnkxYnVKQXpqdTh6b28rM0N6UjB6Sy9tYm5J?=
 =?utf-8?B?N044R1R6MGtUdHp3emlJams2Wjl5MFFKVm5Qb0xmZVN0dEo0Tk5USksyYXZi?=
 =?utf-8?B?UVBwMnVmNWs3S2E3Y0wrRHk5VHdEc2ZBRGNMZXlIRTUydFF1d0orNEs0a2Yv?=
 =?utf-8?B?L3pnaVVIb3ViWDZaY3B5NXhNbzVKd05leVgvd3FyK3J3WkZEMW4xQVVKWmRz?=
 =?utf-8?B?T3EyRTRqYjJWc0ttc0tYckMyV2tFYTE1bGI1VnpoTElyNUdOaTk5Q0pLRWdv?=
 =?utf-8?B?SEdoMG1Gb1NaV3k3Y2xBRkZrVzZHSnBSVGZaclJnUDFuSTkwTUQ5Z1RscDRV?=
 =?utf-8?B?WjEraGZ4ekRVWENuZE55TDJ1RDhzRkRtT2R2VHVGR21nZm5vWkU3KzVWTy9M?=
 =?utf-8?B?eUJSUnZBWklJQXFtRXdSQStjVElVcUpza1BHdXp2c2pQcWhxWlA4K2t3Z25T?=
 =?utf-8?B?OFI5cjh2TTJIMDVOUDBvd0JTNTY5Mk4yTnFTbXpiNTdOZ2FoUGdzYiszVkZ1?=
 =?utf-8?B?NStqanFDQmZrZmxSajJSbmswSUdRczkyL2VTOEZxSzc2QlBPejM5cnZSRjlK?=
 =?utf-8?B?a29GMU9lYlorNU1pN01zOE1TTTNPL203cG9tZGtTZTJYOE9ZaVF4dnQxMVpZ?=
 =?utf-8?B?R1FLU2hFNzBaWjJNdVRQRm1hb2Qzb2Q2cExSRUpNUmNmTnZ5UXY2RnZtUHVa?=
 =?utf-8?B?MmxEdUIrck0yQnR3K1JPOWxSbVdWU05NSG5MZm05OHE3ZzR6NXBiejVSUS9m?=
 =?utf-8?B?ZmlXcnUyNVFiaHpPclorYVNVT3NaNnRBQW1XWmUzS1VYRnpmc0phVW0wQlJ3?=
 =?utf-8?B?dGl4eTJ0RGI0WDNQMm5waXZ2TUtNbUgwemF5VzIxay9pQjg2Zy9oZEpiQWhI?=
 =?utf-8?Q?aOi0t8XFQgeEg4HG7wd/aMRkm6LtW7VF/eaTYoMkJrCo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42543a20-2a49-4a80-27dd-08ddfa13c267
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:08:13.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00OZBGqfdcjiU4CQbXq45IUo7GgC1t9h6A/QjVJ8UlBjxLZQXDmwY24hzSeu6dl+3fg85ALxkapAtCcBadWV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444


On 22/09/2025 20:53, Rob Herring wrote:
> On Fri, Sep 19, 2025 at 01:59:50PM +0000, Shubhi Garg wrote:
>> Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
>> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
>> power sequencing solution with I2C interface. The device includes RTC
>> which provides functionality to get/set system time, retain system
>> time across boot, wake system from suspend and shutdown state.
> 
> I only see this patch. The threading of this is broken.

Yep I see the same. I am not sure what happened here, but let me work 
with Shubhi to get this resent.

Jon

-- 
nvpublic


