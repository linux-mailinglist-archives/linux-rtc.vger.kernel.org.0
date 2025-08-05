Return-Path: <linux-rtc+bounces-4643-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD1B1AE18
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Aug 2025 08:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED686203F8
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Aug 2025 06:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA5021639B;
	Tue,  5 Aug 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MDO42yHc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA2216605;
	Tue,  5 Aug 2025 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754374714; cv=fail; b=QPiYuiAjnK14mNkSdpSmaGoq44C+Q1+bTnAXz90vYefH4H79/X+5NVu7OaBKf/b3wGlk2uqLhQR8CscW9ebI0ACSW7JpNjVLn8vFMOvnKijD/5CJIdir3IfCdv02a1bpnG6kyvBHwwjN7jYOvVxrfO/kMU6otOrfeZ944IDiSF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754374714; c=relaxed/simple;
	bh=NkVRGbMbp3b1jTXwCm1k6W8AejBSxTjpUULaGQFSBzI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bdnzUJR/Cq5V8QElCq3r8SZ27knyYpO0r8VphU0gRqop0cRFqRXt8qVn1CaT8vPC2OmtO5qq5CETLC7BUecQgf6OKZPdFrR4C4JrAxfKPJ4L5cbgUzRIK6eSbm75G9d/etPXgMDml6fO0yoO1doxmz10PJMj8inIiF6EnupASdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MDO42yHc; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3NN7XbE+iiCIYSkj77Idk9fjKKuTTdOVZb46Nyoj72g2rtuphwea4aID8Rl4cscB8q21gcpS9B5ZS8gcKse7MGJoDTukof9eRzVzAMl3ztvaK3vPEFUg5DPzrLXmOZG5oN05tbQ8MNUFupNeu0HsXKdTmG0QHVPTjbfKdwdj459pCa4lPs32cVyjYLFMoL0nnwNyT3QsBR6f08N+Wb95OOhJjQxjXgFTKuaXSX/59ImWrvmEPn1NsaJBf2Y7Zt4cZhVxQs9fzq86tlpcV5C3hVyZPTq5ERvzTZfqguQMhKvpmXld5hUMdZ5WWtg1rl3tvAtBqWxAwU1Gm3AOIeUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbryJup1Lzxm/mD7AgAaUhKSNilLJD3sngJ9sFwlpPg=;
 b=kewXm61k7byqKCmq+F+EcvNjPzbQIeEEHabdYEqNL+Z8JVUwsJX040m+KgyEVsG2o1mqodxIoG7EcguNk2QOaafGEbVDURMFoP2q23TrfwZz092mkDkDbBdx5/S9DGVPYMSj0A9mZApNEUdKQ2ZuAMvtl9WadsjCitwO79lDwjGH6dIporRSqyJ7IFqpGRrCNwJ2Dt3H6sQZAwdoWiztC/nWzIV+SFpdx7jY2lGB9s9EUneG3F0ABKFlEt/bBBNrA8EE1Axe7Kwi6Wq3PESBio7WTA2asQ3JJ+y4pGWDkn8hgRkOKq3+HJcwBIWDO+bpn+iTZJvDjjuJ40TlGxp4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbryJup1Lzxm/mD7AgAaUhKSNilLJD3sngJ9sFwlpPg=;
 b=MDO42yHc4PTkkupYIe/0fu4rXC88cmeh1a/EDRDrT+VFPvx2JTplG7415R1lWDirFJ2hFSqZsN0jj1vxmWzglzpqeAy65tmowBE7ovVHEIKdmsTQkbxuuuJFbrAvutQlLFLp2rstX7s8RdY0K/kvMudT2/PWk0cspARTHZZvBS04S4gF8ARsx5SQWIUjuVvPCVjaYZ8RzpwL0C93rJGbkkC08OpS0Ii0zCaI2yt9G1KmrnREGzVdj84dQ32jWqVMXNZcVb09+jQxlwtQGybdqv0+3QpVslJ3el0w077APUCq3gRD8nVoyAnEvoSNeHumL0D+attTEunqqt714bRm1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Tue, 5 Aug
 2025 06:18:29 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 06:18:28 +0000
Message-ID: <5ccb15d2-0e9f-438d-9243-6f237b8a1918@nvidia.com>
Date: Tue, 5 Aug 2025 11:48:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
From: Shubhi Garg <shgarg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
Content-Language: en-US
In-Reply-To: <424cd602-412f-4981-9b7f-9d04d769b3c7@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: aca163a8-bc3b-47c9-e82c-08ddd3e7e477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTNWcnBoL3NCYVhWMFVjaEhZTW5QV3NkWXdQSGQ5N2FSNm8yZ0JUVFNKWVpw?=
 =?utf-8?B?aWh5eWVRWkVQY0ZqaXRSNDhoV0lsZUc2aUFXaFMreTE1Z2hWM1ZXUlJJUFk5?=
 =?utf-8?B?YW9RZVcxVTVPVThQTjU5LzVTUGsrUUV2aGUvcERVeWZ4ZTA1c3R6ditPYWhG?=
 =?utf-8?B?d2t3bkFvUGg0WVl4R3Jjd1MvNG55WC8ySGtMbm44UzhOWEV0ZnZUM2V5SDR2?=
 =?utf-8?B?aHMwczV4M0JvZG40dmxPZG9RV3VYTWY1QlFzaFN6dEFyQTJvRnZ4bFhyZ2Rt?=
 =?utf-8?B?dG1PVXkxZnV2U2d1QTdhbW43YTUyWXB5ak1RTm5zR21CbTJxOUZZRDkvdWVO?=
 =?utf-8?B?RjJsMUF5ZkQ2Z0t3N0swVCtKOVQxamxaQUsvZFduQmJneDRnZG5wZTBYMTBQ?=
 =?utf-8?B?ZE9CaDlidThPcFdJZzRyZHBmUDViSENKQzUwNU9UWGppVTArSFRRc0lReTVw?=
 =?utf-8?B?cTB6TlRrZFkxRXFmQ3lDSklMOHBhbHAzVWl2Tlk1RHUvYWhKZTRORWNMcGN6?=
 =?utf-8?B?M1dnRzBNSzdiM3d1TEcyS0RzOUhQZExJQ3NKVlhEU1hSUjh3bHowM0t4alcr?=
 =?utf-8?B?VmFkRytOc0FxTTJUZGxYSUp5ajZZazU3YlE3L1FFU2xFejM0ZGUxODl3T3Fn?=
 =?utf-8?B?WlBWZnlBcDhmRFViY1h4dXRNSklnaGxsL2ZNb1ZnM3dYRlhHM1hzc1owNDds?=
 =?utf-8?B?ZytIcmJOVS9WUm4wRGxJMVBwYVpmYU03M0l2WGlzbjRjRGoxMjdSWmJvdHVJ?=
 =?utf-8?B?Qjc3d1FsV2djd1RLVTY5VENObWVoZnpVcTdxalpERWQ0enZmUmdJdG10MWNX?=
 =?utf-8?B?MmlTb0xnSkdIZGZsdVJycU1pYWtzMFZvL3lndW8ydENKUGRSTk0rdVE2VnRN?=
 =?utf-8?B?TzVWUTFyLzBRcTRoYjE5N3ZwUHhNWXZqSWswOXlqQjRRT2tuYm50bmFZeWFU?=
 =?utf-8?B?MzdoZHRpQXhjMFA0b1pMOHhkaFpKNUtPK0RmWnQ2SjNvOVQ1eE9qa04xM3hk?=
 =?utf-8?B?MGtRR2JSWElnT2tvYy9LSHhxRk4xRHJWQlowdjFPRUJNVE5CSjVFSnRyN3Iz?=
 =?utf-8?B?RWZwdlQwbGhaNW5ZUzgyTGo1SG1zSGlyMlpmbzZ2bElHMWw0TE9NMkxCWU9l?=
 =?utf-8?B?WDFEOWJ5bTg4V0E3cVN6UVdNZTZaMlJkYzczemsyVG9CUkdCSnVkNzY1NWRL?=
 =?utf-8?B?VndwMGNrVXpCeUZaMDhKbVYzNGJWUkl5RW5EeFJGcGtNSlhtQ2N2WGc5c1lq?=
 =?utf-8?B?MVo4RHRadVlId1RScEdIVUtlcTMweDNIYS9CQ1lyZTFRMXcyNUVZM3RyZlNy?=
 =?utf-8?B?OGdZaldEbStmajJUQWRFT2QxRWp1TFZCYTlMbmNRRExKUlVmNldldmhvckZR?=
 =?utf-8?B?NmVzUkptK0JSVDBkK29CMmV6MlR1bnA5VktJMEpZejV4Q0hNSmhuclh4RTJ5?=
 =?utf-8?B?S2llQUFxMFBnS1BFZk51dVRpYXFhL2IyWk9rbUI5YVZJVmZpanNDYVhYVCtl?=
 =?utf-8?B?Y0ZIQXVEYlkrM3lRWW9qVTRrT1lPY08yZE5YR2F1dWRnTzhTREwyNFV2SHgz?=
 =?utf-8?B?V3NGV3hvMm9EdnF5V2NnRzJtbGhKRGFuWDh2TWxXTitXRHg2dWhwL0oyb1l2?=
 =?utf-8?B?WGY0alZldldUZVVtb28rczRHclp4dUpmTFErR3hJM2JnMW02SmZ5UEp1S1ZR?=
 =?utf-8?B?T2FaN0pSSCs4TlkyZng2YTFNZXpVRVFZUkFzTms4RUhjYU1jSForRmxXNjdB?=
 =?utf-8?B?aUJ0ZURGanN3aTBuVW9SUktwYU9xcDhReEdWY25XUlNzYWVjWCtDTzU5VHVs?=
 =?utf-8?B?MWVvRjJVMWdBSVFYV2FkZDg2RjFyU2V3S0JPZjMzSjVTNlI0cUtDK2NwQ3po?=
 =?utf-8?B?eXI4Q1RSc2crUk1aSkExL3l5WEswemMrZVNybzJydDRYL21jdU9vNVJJcG8x?=
 =?utf-8?Q?o3t7OsnU6Ls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmhiNCtIRnVTY1BNcklZVDhuZk1DVUtrUVNPZFJOdlIwWENvMm1qRCt1c3Mw?=
 =?utf-8?B?SllraXRvcGVQN3Nab29PT28wdXZOY1QxV20vdkw4TWtzYWdObUY0dFJqZEts?=
 =?utf-8?B?Vmt4VkkvTzFIdVBmRTVoUnRHM3ovUlJWSk5zZy8xZG0zRFphaGhKU21mNDNR?=
 =?utf-8?B?cmJNN1B3bjhvYVNucTdwOTdNMEJtMmF1TEJZcndHZm9zS1MxWmUxenFtYloz?=
 =?utf-8?B?TklxUk5kYUN6TkxUZitSbzBwZllCQzV3c1JyQUlhSHlsYm5NN1B1em9LK0Rq?=
 =?utf-8?B?OFNzY01pc0FFVFpkMkthbjk5MVVCUUs3TzhIWmNER09BNlRpcW9JZ3RDbEJm?=
 =?utf-8?B?YTRHeHpqOTliL0U1bkxIVENQcjJ2MGUwdHIxaTRXeWNQMlJaSThHNXdvV2ZO?=
 =?utf-8?B?c1ZjNFVYY2JabXVFOUcwTzdSb0tnMDZRMyt3ZTdOTERzSUtvRHE1QS81N0V6?=
 =?utf-8?B?S1Zoc3hvRHhXL0RjdG9zdHI2d2FqZVY1MlVrcDcxOHpjbnhMSG1PMUo3UnZ3?=
 =?utf-8?B?WlNFYlVqK3ZVeXdGQVpXU2V4U0swNWVGdytnSzN4Vis0b1J1U296RllqNkhn?=
 =?utf-8?B?STVnQTVLektRamhsWmJIbXk2bm9vb2ZMZ0RGRk9yL3hSTDNxb1B4b3plemgz?=
 =?utf-8?B?QWs5Q1A3Yk1IN1l1ZXdwRWhEVkFYSm1GdDAyRkZqb1dEdit5ek1lcElLS1dw?=
 =?utf-8?B?dHBTSEFpVVZ6YytUa0U0dFl5VXNzQUZWUUNocWlMQUE1UURZa3BVVVlXUkpv?=
 =?utf-8?B?aTRHMm5YZG1QN3RKS2s2RG9oYmNnM3RuSmNiZHo2OE1HMWl5UFJ1NHJHT1NN?=
 =?utf-8?B?OTEwVkZLUFFYT3hraTFyK3oxSHpad2F1cWovWkJRRitvVDNKZGQvRlRmV2cw?=
 =?utf-8?B?QTlHeWEwTkpyTllSSDRKNEg0UHhndi9xY3NjN0pPZVFHYktCbTFVRUovMWpL?=
 =?utf-8?B?TVRSRG9tUjE5RTY1ZzRJdjJrMlBpSzlOOUFTR2lRTnhydEFjOEpuQzRnWGFy?=
 =?utf-8?B?T05LNVIvNkIreFM3bU5jc1pGWnkxcEdoWDdUODgzeDdxd1k5MFE4SWpvMFJ4?=
 =?utf-8?B?T0ErSFo4WGMwWTR4azhkZldLZ3JRakdYa050VU1Sd2FxZjJYZll6TTVkSW8x?=
 =?utf-8?B?OE13am9VN1NXdDkxVk1Yc1NVYUNIdG1CSjVWdjNBdWwxZGMxVkgya2duQ05v?=
 =?utf-8?B?VW43UTNyTXBkZEhkZnhLSnh3YUcvM3Q5QW1ZTi9HVmhxL2ZOZ3locC9KcXJM?=
 =?utf-8?B?U1k2MDBBQUszUWNBNmhDSjRGWTlQazlBRERqWWNKK2JZRGU4WVhiVXVGUXgv?=
 =?utf-8?B?cHNWM0Y3SWlKQmhIMmQxQUgya2lDZVRPejdnVTgvRmNrZ2ROY1UzcFlSZFpr?=
 =?utf-8?B?U29CeFM4ZkpYYUtHRzQ2T2NJK2U1M2d5UjlDSGM0SHE2TkJDTDBwaEpEVmYx?=
 =?utf-8?B?cUVLQytWUXNSTy9mcWhDcElNNkZFMlZ4MUJWcldGREY2eGZwMS9kV2JPdGZz?=
 =?utf-8?B?dkxqbHdrZVFOTHFDR25ZWXZTV1pkMnNVNEFoT25PWTd0a0oyRE5IS1FpenN2?=
 =?utf-8?B?VTBvcGtWRnFDUTZ4M0NNOXdPWU0zeFlpRzMrUEhZbXdEZU8wck40STdXYmdC?=
 =?utf-8?B?dU1vYllYOVgwU2RJbzFqQ1k2MnNxZlB2VnorNGw2cXBxcTVVZTAxWDc4RnJp?=
 =?utf-8?B?Y1dmbUVUZzNqUlVNeFVZY0ZGQ1NDUU1lMVg1eVh6emFtUFByOWc0SDFGcWY2?=
 =?utf-8?B?Z2x1dDg0WkR5YjA1TnFTNkpjcjluU0JncVlabHg3TFprYjVzOVZRS05Ua3N0?=
 =?utf-8?B?QTgwNG1rYXphV1I3Y2tnbUFocjE3Vmlla1R3YVY5M1J4UzFzMm10NnljREth?=
 =?utf-8?B?TitHNDR3L1p4RndFVm5sbkZSdFRCZkJiUnZVMHljNDRVQjJ1LzRwU285NE5i?=
 =?utf-8?B?NFkvdSsyMWEwK29tN3lIdzliK3V4Qnlpdi9xNmU2aWNDeGYyUWRRRUM3ZUsw?=
 =?utf-8?B?T0ZEUE9mY1RPeDltb1FwUUh0UUl2SEcxUk16K2RVMDNHMi91STJBK04zamUy?=
 =?utf-8?B?MGUrS09QbHd6VkplRTlSQXdqMGoyL0REMS9CaDNsOU5VTHl1ak9pYTY2d05s?=
 =?utf-8?Q?xPW2uH4pVvFdhSrEIYmh+CKHf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca163a8-bc3b-47c9-e82c-08ddd3e7e477
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:18:28.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6whRT8ynQVZGoz4mqIxbUPk9X8nl2d7Jv8iKpXm/Y/uogD8OgyXA5tt2rbZJUb8XrZEYm5EVZ0zPeMETTGOFzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157



On 25/07/25 7:09 pm, Shubhi Garg wrote:
> 
> On 24/07/25 4:20 pm, Jon Hunter wrote:
>>
>> On 24/07/2025 11:06, Krzysztof Kozlowski wrote:
>>> On 24/07/2025 11:41, Jon Hunter wrote:
>>>>
>>>> On 24/07/2025 08:59, Krzysztof Kozlowski wrote:
>>>>> On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
>>>>>> +description:
>>>>>> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz 
>>>>>> RTC clock
>>>>>> +  support with backup battery for system timing. It provides 
>>>>>> alarm functionality
>>>>>> +  to wake system from suspend and shutdown state. The device also 
>>>>>> acts as an
>>>>>> +  interrupt controller for managing interrupts from the VRS.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: nvidia,vrs10-rtc
>>>>>
>>>>> Nothing improved. You never replied to comments and then replaced one
>>>>> redundant word into other redundant word.
>>>>>
>>>>> Respond to review or implement it fully, not partially.
>>>>>
>>>>> Or add COMPLETE bindings, not partial ones. See writing bindings doc.
>>>>
>>>> OK, right so the DT binding should describe the overall PMIC device,
>>>> even though the driver needs to support the RTC.
> VRS-10 is the device name. VRS-10 has an I2C interface and implements a 
> Power Sequencer,
> RTC , 32kHZ clock output. From software perspective, we are handling 
> VRS-10 interrupts and
> providing RTC driver support. I will add complete VRS-10 information in 
> bindings.

VRS-10 hardware specifications are completely designed by NVIDIA.
NVIDIA is getting chip manufactured by multiple vendors.
Therefore, part number and vendor ID varies on each NVIDIA platform 
revisions.
But, our software is independent of vendor details.
So, is it okay to keep compatible string as "nvidia, vrs-10" in VRS-10 
RTC driver ?


-- 
Regards,
Shubhi


