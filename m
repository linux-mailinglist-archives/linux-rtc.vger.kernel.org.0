Return-Path: <linux-rtc+bounces-4838-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5BB44E09
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 08:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB9C171A92
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 06:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9D52BEC53;
	Fri,  5 Sep 2025 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ikedSMYI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C542AD2F;
	Fri,  5 Sep 2025 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757054434; cv=fail; b=QcyZdZrWQLHDnLbZfEVGndienQ0im8dUxBvEpgJGlZxRf+aJZPlMDrGAhBKnXXTDBEUTPPJFMLDCpJ1USxGUMKuMFS3Y5/B5oOCDps7a1Abd1C4xa3CpVNl5rua71pgo5nUKI/FD2BlyU18qykYghMnJwbE3h1DivqFDihwgfjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757054434; c=relaxed/simple;
	bh=akcnCJXAoMhpX4kh/ue4rJVh3TkKnlnb2RsruNB+JEM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EwB6LRjqbTCCipfJjgG3BiUC035rtDl/MQBXnMnd4yZzqR2x+1/KrqIwTJNzdrCiVoY2h0tIwadxmTCOQK7qrufk1cfH65cBIPy55tM3IH1weLqpVmaHYEb99pM+MqxVXH9cjtVJ31AEZf/mj74+gEy1BY1+g+Y4KhG37ENKCF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ikedSMYI; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHJ98+u3jLnERBkH88GEGKyJH5DztVFlomicKc+tlbApB4xwB1/iq+c2yPXSUw6eFEqtXtcrbC55e8JZb21hzvnYEWQPe4Sr4IWgugKkCvUaqLEAnGsNVOOPfmoC2T4Dl/JOip/hBLDCFW1CPzF9NzlaWt2oQ0mwVB7jQKeubCGXgapxuXKYK64hv6orTyXQGemLtFf4rxWn2E6HhJOk4a7Tc4KvVl82WJcNX/inbQqiYV2un4skKaNqZaRalGjxiFsrgTq7uJTIwCoG8btBVD9NbC0YCvJWu/BrD5J3thu69M9GMWmc9R5rYtKyQ0HdRJB9Pgqc6NNwrVPMuE9H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm+ya+5qRm6FDwMyNSBfmZvx9Xxyqaducj6C8aah0AQ=;
 b=RviMUXJfHkrw0+7pJhnCtQ0hShq1I4pYA0Dlaq3Y1B8ddjp8gMODb3KyMzhHSb+7VNzcmRdgxoxsP6IFtQxOquCT62+2qmd8Ow6d841P0mcJb44WSc4EShpEOGIHlyFYU4awH9/9jCbwtPRKJm77pDeQYF4cZgV4LnUSK0dar7Twg3jIz0C/BBA4YUi/vdXiZw2v+LNu6ehHcaZqR69ecEsQIanTQEFXrELguUCDbFqNgjpQ04I5710mgbYR7H+PVtFO6QsgCP0HE7Ruphw4rQ2NHUQuAfQsiKXBaq0AKwXLTxElaseWk3OzwKA3OKUcsKeKJVuGPNiD4eqKDk4MHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm+ya+5qRm6FDwMyNSBfmZvx9Xxyqaducj6C8aah0AQ=;
 b=ikedSMYIlIv0KE07eCnPQynT+maIl+bC8cWe6mKbRcKmNNhHcW+3QsPEwDu1/p7z7aPlyjMkguzqPu67ITHPNOV91LIBNKATbgPHCWqsYlxoeM/s9OhDcz1vfYQJKXbGHnTDN6UTaNa7d3GnnG9tDWpLSzTMTSgsJg4ZtS0VOm/CdI5F1W2wJnzeUSMSigEtqivfr10U3uml2bRnQ/VJHEB9y5xraCMB2646XC3dsKWPPBuoOfbqsXWahHDfIEZJiuvbPMvScHQTDPO2Wtfm3bm1l/s/SlHO3tzCdAhATGbcvkuAvZxq5eX4C3ElMaG4/I7sWD3U31mdpAoiStriYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 06:40:28 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%7]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 06:40:22 +0000
Message-ID: <6a8e717c-b8db-4d0e-af97-4a355af177f9@nvidia.com>
Date: Fri, 5 Sep 2025 12:10:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
From: Shubhi Garg <shgarg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250723130343.2861866-1-shgarg@nvidia.com>
 <20250723130343.2861866-2-shgarg@nvidia.com>
 <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
 <2c59e665-6415-460b-8ff8-c06f8d94f9eb@nvidia.com>
 <f69a76c5-157d-4cb4-bf46-1acdb6a87319@kernel.org>
 <0d70270e-2290-47f4-87d1-9a11019fa169@nvidia.com>
 <424cd602-412f-4981-9b7f-9d04d769b3c7@nvidia.com>
 <5ccb15d2-0e9f-438d-9243-6f237b8a1918@nvidia.com>
Content-Language: en-US
In-Reply-To: <5ccb15d2-0e9f-438d-9243-6f237b8a1918@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da4878d-413f-49a9-2a30-08ddec471630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlArNmlnelUvUnNuYnhyNjNiUllKSEpZekRjNDJEUkhuWWE3VGw5RTlUbWtQ?=
 =?utf-8?B?Mk9nTWNtVlEzbWRtRTFMeFgzRndLdHVsZTB0K05BalR2enQ0U1hISFlXcmxD?=
 =?utf-8?B?My9rWlg3T0MxTVRxdGJGamdMV3ZDNzU4ZWZwb0JJYkQ3YjZVTm04MW5IZWdp?=
 =?utf-8?B?ZkYrUWFUSldUbmU0SWRvZnZZNFQ3cGtCMUQvbjRmVlFVcUpIc1Nmdkg4Nklo?=
 =?utf-8?B?Vi92aXptOHU0ajN1NWl3bW93SnNmZmUxeGJac3FnTUxxSkNCR1kyejlkcXhm?=
 =?utf-8?B?TFMvK3lzZWxGL1p1dWVmQlZ0T295OFB1NlBqa2VTRDFNNHp4STJ5MENjZFdk?=
 =?utf-8?B?R3dLUVhBekRPZDdZc2k4NUV5RFp2SEpFaGlmMjVQWm5TY05tdG0vYjZKN1Ns?=
 =?utf-8?B?VStDWWNiZmVvSlpZL2w4bUtUWk1PV2dlOHN2R0pzbmhvY1hQZytHcWdiWG4y?=
 =?utf-8?B?TW80b0hpbEVqUU5VTnBDUEdMS3FXVkMvWDhhc0p4VTVsc1laeGVLUWlNdEp0?=
 =?utf-8?B?YjlVdURmd3JzYmwybjRvS2pKdW5YbDRZWFlsUmREK2Q0Qmxla3prTWREb241?=
 =?utf-8?B?bml4aEViZEx2dm1GMVJuK0kyL0FlOWxYRE4rbEU1RFVxcEx2eG9NU0pRUVhq?=
 =?utf-8?B?eHgxZGxaMVhqa29jUzZqSE9CS0VsL285MEdMSFFrWHFPdEVXM3ZKc1dqdTFl?=
 =?utf-8?B?TTJOUUhQT3pWYlhTaDB5SENtbzVOYVNqS0xrNkI0WEYvRVN3ZGp2S2VHcmdI?=
 =?utf-8?B?UE1VWTNNbnRsVjRwZHY5N2JRemxsZXRQc2xlaFRsWFRmQUdPUkdWSXhmc0Nl?=
 =?utf-8?B?RDNwZnhLTzRzS25qWjJMSjZFTTNXbDBSY3NKeHowcHIrVVRvM0E5S1JtQ2Fu?=
 =?utf-8?B?RkpkdXJlakFYWnZWOG5IY3lZSE1qK0I3VHVYMG1YZ1ZId0xYMWFsRVlIL1RG?=
 =?utf-8?B?K2tDblZGeGd1SXJSWXlnS054Zy92TUMzUTk5KzFIeXhES3hLMmF1a2dYS0Mx?=
 =?utf-8?B?U1p4NkxyOStpNHRxVmtGenlKSTFZS2JGQVhHYXZZQ1hoNG5EY3hzSW9jc21R?=
 =?utf-8?B?bHJmcTdtR09GSXRLa1BpWVdnZkhjZlFuMU9kUG43dFNvbGFWTmloSm5ISTRh?=
 =?utf-8?B?c2R3bnE3Z0Z1R09hSnRHWmJKTU5BUVJFakFEbzVXVmV0TDVBcDBxWWFOOUl2?=
 =?utf-8?B?NnB1Nmd3OVhNenpJNnE4U0NmTVQwV2xjbFZMQmhqSEtrV2QzMm1FSVh6MzZp?=
 =?utf-8?B?YVQzWFEzNEtEMU91S1pjZGR3RUFuQWxTV2RmWlQ5N2NweUtuTzM1cml6eEpm?=
 =?utf-8?B?M0s0dUszd2dvQzIzOXZwTFUvMytQQS9RNFZEZmVJME4xL0kyeGV6Qm5JaERK?=
 =?utf-8?B?WXhJVmdlc1BoR3cxcDRqL3F2d3hkM21OUXRIVU8ySWZPaDNEQmh1SVRSVXZU?=
 =?utf-8?B?TmxEZkZ5R21TUERmT2FxMnZpNFZPWWRBekFyTTBBWWNRa0srUVc5Q29tN2w1?=
 =?utf-8?B?QzRqQWlXSmgranJxWkQ4VU8vVUwrK2RKb1JXbnFFS1ZET2VScG0wZVExN2Rq?=
 =?utf-8?B?MFFIMk55ZVgxVmhja2p3eVhLTkpraGdJM1o3TlFlV3RhNXUxWVp3ZlVzYUNH?=
 =?utf-8?B?aC92YjdRK1F3ZmJxQi9FQ2V3NzNyb3h1ZzVXdkYwVzFFSXNSTjRTMWM0UmI4?=
 =?utf-8?B?ZTZYV1BQNSt3bGgxd0VORDNlbzRkNlh3OWhYZ0NKWUtCVzJDcUlSNlVlQ1Qv?=
 =?utf-8?B?Z2xuU1hRWWZld0lSanczWVBMV0wxdU1vQjZKcXdwMlZydmhZL0tTQ0NNTDBh?=
 =?utf-8?B?aWs1SDdDY1U0MDZiRjFUclR2amkzOWROMUE4ZUYxRlllclBoWm1BMVl3Yktt?=
 =?utf-8?B?aWs1NG9HeGVnaGJRb05rakFJUVFkdmEyYVJvcjBoWG9IeEVnY1dnV28zbkw1?=
 =?utf-8?Q?vlP1sgZAlGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNqOURUWWR0bXlKL1BWc3hPRnNvZXo1VlZ0UTE4T2J3OXlqbUZhblVIV2Np?=
 =?utf-8?B?WlRwWE9PSGVLZVZhYUQvSk1aQ2hSb1doR0NFU1BQUU81bnVtamZQTjVEN1hM?=
 =?utf-8?B?TDJIa0Y4VTBObEVwMG5yellxdW9QK2NWcTNCNWpJMjgwOTVxRDNoU2h3cG9V?=
 =?utf-8?B?TS9WbTFuOEwvRFgwbzc0dEJVYm5yS3d3Sk9yMGtLNGRJWEhNeWc2YWhWVjAz?=
 =?utf-8?B?NlNKYzNQRnVreVo0MVZ1ZzU5WmczV3RPRE5DWnlNOHVqZ0lNU2ZPdU1PblV0?=
 =?utf-8?B?azVvSVJOQk45Uk9mTDhRK0IyRmUzb0h2dWZwbGhldlN2VVRXKzdkdk1RZWww?=
 =?utf-8?B?ME1ybnV2MmFsSEgxSXhBRnU0cG5scyttM0E5SFNoaUNYeUNvakJZSmVGVG1v?=
 =?utf-8?B?TUlybnpRYk0xTlNqejdsTWVoUlVXWmhQdmZUYzAvR3drZ3N3L0NvTXBWWVlX?=
 =?utf-8?B?QzBpNE5JUjBXaU4wODUvTGlQcXRJUzVjeUNraVprb29ZSzF2WGQybVVLVGNj?=
 =?utf-8?B?cmcvZzIyekxINDhxQXB1UHZvVy9WSFdMWVlKR3RXVUpqVnkyaTgwSGpPdGM4?=
 =?utf-8?B?RkhYZGI3YTFCTlhiTUVrWDJYRVIzdGRIUHJ5bFNHZFdYQ1lwQVVxcmlNcENB?=
 =?utf-8?B?cjRYR1JwYnJMRFpxcnJNK3lLVkk3WjJBampWSlp0dU00RzNnQkJFb2NnenhC?=
 =?utf-8?B?cTFEVk5EMmR4NGlHcE5maDZ5a29TQW9UL0szTnFtbzZ6eWF0ekc2TG50U3Bm?=
 =?utf-8?B?Rysvc2piVDVYMHYzQjAwd2NzcUkrcXZOMXdHcU1zYm5yaDZOVlF0cVc1eW83?=
 =?utf-8?B?RmIybi9OMFZDWFpXcjN4bnk1bFM4bWlPbGtya1h1QnlHeWJIZmhhYWNoZnJt?=
 =?utf-8?B?NCswNlphdlFMZFFkQmFjdWxGeGxZQmZ0dUF4a3hEelJKczMvRmFiSHpWbU5i?=
 =?utf-8?B?U21Cd3JPUy9DZkYyQnBJZXhJVG9vVFRreFROMi8yRHNKY3QzTnF6VW1JYlpp?=
 =?utf-8?B?akdTU2ZvUyt5VTdaNEtKWTJ4bjdwcFI4Qlo2RFNLMGZCODhFVHpIQ2RwZmhi?=
 =?utf-8?B?Unk4MEtjWXNRSjl0U3pHUTJWM1N1NkNGOWppbndRYVNNY3ErSFdJSlA2Mkht?=
 =?utf-8?B?Ym0yZ0JzcVJBUWphNmloS0MrSjBqSXdnR1lyL0xQR0pNaFdBSW1sSS8zTTg4?=
 =?utf-8?B?c1JHaGRKTG9xWHl3K3Q2U0JRSmxLVnZ0TDZManB3aHRZN2QzWTQ1YWFENEdh?=
 =?utf-8?B?V1hzV09nODFNMDEzTWZJQk9iTzRhQTBLNUZhcE5RTmN1OE8zN3FOMjdJMTQz?=
 =?utf-8?B?cFF2d2xsV2pwcW42Z1diRFI4US8ycVdvU0dWcG0rd2toRkdSWUoyRld1K20y?=
 =?utf-8?B?K1p3ckMvakRNSmhiRjVBU3BXYlg2Ti8vZEx1RjViMVNaaWlSNmZhNllpMmhT?=
 =?utf-8?B?ajN4QTc0ekFsZ25nUk9URzJMM2d0WTdnM1lPeUQrRm43bllLeWwwWmJCMTFK?=
 =?utf-8?B?MXp4UmJ4YlBETHRSdk83RllwenpvNkpVOExxNnZuZHA0ZUpmRGZLTmpkMmQ2?=
 =?utf-8?B?SE5mSDRBNEhnOGlJYkZPaDMvUTUyNU9GRHFMenE2V0xGeVVjRzZwYXpSNlFy?=
 =?utf-8?B?b3lSWjRnMktCTktqeUgrcTdDaGNMUjYyNGdIU2N2U0ZJNm5PcS9xdEJVZnN4?=
 =?utf-8?B?V3dLZzlxZmkrV1RQb05FNi9QREIrbWJERFcrWFpaeXR0VlZKRTkwUTNiNjd2?=
 =?utf-8?B?eTRHdjIxbWZoNll3R3Y2Y0lSbnhjUTNwRFdLMWs3RlhQeCtidnpGc0Z4VHlu?=
 =?utf-8?B?ZGRJRjlPL0puZTJsQ2RSOUhicWVLQ3V3aW5RcFZpWWJLMWhyMGFTc0N3MW5u?=
 =?utf-8?B?TkdWNTlKZHpQMk5zbDNGZiszRjhBTitxSWZLeGtSY2VGTmloT2hZWGtOVkVh?=
 =?utf-8?B?OFBxbFFKL1hkRkN2VGt2bFpwTEc5Y3pCYU1FQjM4bHhFQW4vYis4dnJTSG1z?=
 =?utf-8?B?Qnc5cHdEWVNnMXVKOEtQMGtrVnlCdGhWMXpUWFo5am1PbmY4U3AwNWwxcnhD?=
 =?utf-8?B?MGVwZzdqQXB5N2psdVd4M2d4MkdnRWdKUzI1THZINGFMZUFvT1RUZUtoSSt2?=
 =?utf-8?Q?KWqZ43CUqi9jgiXLmE9Upe7lt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4878d-413f-49a9-2a30-08ddec471630
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:40:21.9112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/KXrpY/j64PzQoyB3xmILgMt1HTrSLmDXt5b8RVORWjS42dMnFgHwrt4d/B5j310p+9Nkika7VY9lBhz0bEEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102



On 05/08/25 11:48 am, Shubhi Garg wrote:
> 
> 
> On 25/07/25 7:09 pm, Shubhi Garg wrote:
>>
>> On 24/07/25 4:20 pm, Jon Hunter wrote:
>>>
>>> On 24/07/2025 11:06, Krzysztof Kozlowski wrote:
>>>> On 24/07/2025 11:41, Jon Hunter wrote:
>>>>>
>>>>> On 24/07/2025 08:59, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
>>>>>>> +description:
>>>>>>> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 
>>>>>>> 32kHz RTC clock
>>>>>>> +  support with backup battery for system timing. It provides 
>>>>>>> alarm functionality
>>>>>>> +  to wake system from suspend and shutdown state. The device 
>>>>>>> also acts as an
>>>>>>> +  interrupt controller for managing interrupts from the VRS.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: nvidia,vrs10-rtc
>>>>>>
>>>>>> Nothing improved. You never replied to comments and then replaced one
>>>>>> redundant word into other redundant word.
>>>>>>
>>>>>> Respond to review or implement it fully, not partially.
>>>>>>
>>>>>> Or add COMPLETE bindings, not partial ones. See writing bindings doc.
>>>>>
>>>>> OK, right so the DT binding should describe the overall PMIC device,
>>>>> even though the driver needs to support the RTC.
>> VRS-10 is the device name. VRS-10 has an I2C interface and implements 
>> a Power Sequencer,
>> RTC , 32kHZ clock output. From software perspective, we are handling 
>> VRS-10 interrupts and
>> providing RTC driver support. I will add complete VRS-10 information 
>> in bindings.
> 
> VRS-10 hardware specifications are completely designed by NVIDIA.
> NVIDIA is getting chip manufactured by multiple vendors.
> Therefore, part number and vendor ID varies on each NVIDIA platform 
> revisions.
> But, our software is independent of vendor details.
> So, is it okay to keep compatible string as "nvidia, vrs-10" in VRS-10 
> RTC driver ?
> 
> 

I plan to use the compatible string "nvidia,vrs-10" for this device as 
there has been no further feedback.

-- 
Regards,
Shubhi


