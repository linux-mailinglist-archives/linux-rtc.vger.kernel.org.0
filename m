Return-Path: <linux-rtc+bounces-4300-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D3ADAAE0
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 10:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4A5169BB4
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 08:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E7622A7E0;
	Mon, 16 Jun 2025 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RDQC4baZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F034189F56;
	Mon, 16 Jun 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062961; cv=fail; b=T2hBytTXyKPtiK3yFr1hTJBGcIfbqntQkQtrXEynocVyXLGxBFjb6VBtj0F+TuSWrtJ/sK9YL7AuKSyhbMhHXuNOIYzJUKCPYZDyVecodMDcWij98rUlp0y9bbhfMGyxPSVqgGdcIFYN78qJi4rBbUtDNIOgpcXWjMuzp73kNcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062961; c=relaxed/simple;
	bh=6LMPlMHSS0NtkLAOlivchoFBsYDUSSdcsjjshCfQVGE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SQ7fJUN0cgrYefZZrTWWga7MRA9GklNbg1/HUxZ26DJlHu0XWNLXokJhVinoBFWKEXKMb+6WPKqsN545srb9AhRWZCIGGl6ggmatZJikYoTXBq+gf9InYitx31Ot8iXhkFa8Islq9r6gsxbPNN8XibYdX/FfOSulEZ4uJkcKUz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RDQC4baZ; arc=fail smtp.client-ip=40.107.102.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7aX6EdKKyrvhgrwYu3jC57QsZwV7SfNJ8zBJEheBLy41bFmEmtDG8ACa5DxAF4QFAFtNVbXX5tG9SaOvAsxtNiRZEJrQ3/DrwqkqiwAIZd7iG4qGHHyFlBGOSRSNw+hPllbuuAOZx7jluHUx/0NEJ2wqn7fqXIh+e+xyFrjbk7JX8JBewG5s8RrS/wbwLTSLtQSW+g+/wEc/RWiEtOVk3kCK5mSWAH/OV5n4K0S6I9c2M14VjbdWQmMho0AhuaI7jqI9k589dJWgVPo76WeAeptzb48zXsSQvOccE8mTyMZRbYAeSlNfeLoaHfacP5/dDPkcEFiZJfsofM/MO0Lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaynemIRt7eN6pkyvZ6deuhhy3+qT3s2ltIh+lukvPU=;
 b=O2J/bar0HlYb5zO7Y5lOWPJ5aoybJrde+EXmsPYBeAIH8JoVCa/KQOVWlGpB5cSsUndXowdXcYKsb2Hxk5DfpLfbNhgkHGTs5W/iSuAurTGpEHAzi4OwI44QdWTWsN2O5+sxjGYG65m6uNHVF70Y2H8Jc9gx++QYxXnSnGl2m8jQYchwoQ0w/dUJsqgrUqYEmSKcwvztA0zhHbEECv2KOF+HpHA88+eCsA/650adjxzcSJTcIBIh9q4+tkhmP4Vzvk/xcx8VaO4T4Of7w6MpcWU7Dnw0Bf6hhCy5t7msAB3KsiNZ1eAcVwmkjBKkmiQC6OX+YDdg9hVhA2XGEH4bLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaynemIRt7eN6pkyvZ6deuhhy3+qT3s2ltIh+lukvPU=;
 b=RDQC4baZpOvhY952E30GKZwvg+y4NwzXCgWqh6y0ms8ayVTNjPV/p4XdAfKc1aFNdOgm4DzAsfbXEp48b0fB1IQQ0pR4NBTZYuoR4SUiMr2hZLoopzpk4kwOvATw5P1xix1Tp1ZW89eOEt59uQcZQSPvetdQG8aWg4cP5iP5Y1+7GXGtFEzEHxYLiJ53Gjr2EIfSPUfgBCxixJguFdtTNYpZxYC2QlXZfc3onRWinAewEkvriodCTjCOH5Jq9dlyeoy0NMxFWbCO8QCMQshv6cIlrAfdaFdB8Qnw3iO5tXLB4YfxQp7fX1nWX66QtGAY2D5nbSDnP8Gveq0l8RZz0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 08:35:56 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:35:56 +0000
Message-ID: <45de7e81-f5cc-4966-8757-677bae29e298@nvidia.com>
Date: Mon, 16 Jun 2025 09:35:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
To: Shubhi Garg <shgarg@nvidia.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, --to=jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250611073454.978859-1-shgarg@nvidia.com>
 <20250611073454.978859-3-shgarg@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250611073454.978859-3-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fec651-f1d0-42e2-7ad4-08ddacb0d044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djRXMGZEZGU4ZTBhTHVNUHUxWlBmcnM3UkErRkFtL2JPckJKTUFCNThYRXB3?=
 =?utf-8?B?ZHZCaVN5QXc2NVo2RG1naTU0bEdlSDQ1cFRsd3NtSUlhclk5Yi83bURwUS9s?=
 =?utf-8?B?T0FSRVVtakFiRDJBajBoVm9pekJYNzB6V0RBb0dETVJVSzlodFB1MjcvYU9x?=
 =?utf-8?B?YVlHWm45eEJjd0I5WEErRHFRemQvTjZvY2wzM0RaMU1LNHFUY2YrRitLU1pX?=
 =?utf-8?B?NkVLRk9HYzE5Q3UzYnY1bjRhWkFhVEg3a3o5UGhYQlBTZC8wMkhpQmJnR2ZE?=
 =?utf-8?B?akpQWng5MS9sdHpGMGxpRnFRTlpINXVXcG50OGlpWHQ3RUMrMWVvOGNDMlBv?=
 =?utf-8?B?TjRJUmRrd3E2aWV5QWJpNDN6WXIwUFJ0SS94S3QxR1J0cTBsbmlQYTFvdG1U?=
 =?utf-8?B?TWd3UmFBZHQvVWdUWU90V1cxVjVZNTZkV3BvaGdGU3JlNnF5b0x4Q0Uxa1ZE?=
 =?utf-8?B?T1FiZE5zWE5WY2hUR0hJWUFYNHBHN3UySkcxbmsvWFcwU0dYK3M0ZVlSazZn?=
 =?utf-8?B?bWNRNnAvQTBRUGM0RkpoVERVTHI0VTRYdUhBVE1KWktCWktsSGo3dHlqU2VU?=
 =?utf-8?B?S0dsSjVERWRvU09kSCtQK2kySFpiRmFSMHU2a0xGbS9LQndwNjdjS0JzbkQv?=
 =?utf-8?B?SHU5V3ErUU1TK1ZsNVY3UmMzM29xZ205eWRxZDlJd1l0RGVraUJDb0szdVlN?=
 =?utf-8?B?eWIyNjBwemxPS0lhRDlvQ2RwYnp3Z3E2VVNjZm50QngvZHgyZEt3VklnTGkz?=
 =?utf-8?B?VWlLK2llNDhLZStuYUxmblV2dWN2NDZkNW02cnR3bXVFMGViRmFndGNBSGpR?=
 =?utf-8?B?Y2VIRmc2bG9udndZME1uc2krYXRRTU1RU1RjSytic0IrOHFkMDJsYy80ODlq?=
 =?utf-8?B?VlIxNnlJeGh2YWY0WWdTQ2t2WVAwK3JvY1JOZlJFNXpwbkppMWZQTU1hUjZs?=
 =?utf-8?B?SUNSNkVPWm1xUlFKYVZoQTR4UUMxSUk3TkJoeGhBc0FmdmcxNXk1Q0NZQXlt?=
 =?utf-8?B?YzlYTEN2SkJVTHZEU2J4M0k4dmNFUUxPanhWQ2ZzdjRVS21ocjhzYVFIRjJw?=
 =?utf-8?B?MThCTHpPakFJWWVreHRFVjBTSHQ3Tm5sMEhpWk5CS0tDdURXMXJoUUhoVitC?=
 =?utf-8?B?Y3VLbTlmbC9HSngyZ1BLM2ZVVE5ENU94UFJUb0tOYXZyZkRwUCsxRmF0UHZU?=
 =?utf-8?B?cnh4c1pZVk9Xc2xKMEpYdWVEdlNRRFdGaEJBbHVoeWxrQUV0eEhUUHR0eEhk?=
 =?utf-8?B?Z3hWbEIxbzUySXo5UStnVHRSdUpYck9uRUZkeXVIZUtqaGtNMEhCb2g2UFpV?=
 =?utf-8?B?OGs0UDJhVUxLbjlmQ0xybzhreUhpbnRJZ3pCNVFUdmhHWEF5bDRRVldTbXhj?=
 =?utf-8?B?a2tVUGlkb1lVa29pNDBZeitBUGtaUnd2VFFtRWZGRUkxWW1Sb1dzNE1Rc05M?=
 =?utf-8?B?WlVidHVIRCtYMGlZN1dtTjM0QlMwTFZVWkdEY2lJY09DalR3KzNucUVQZFNu?=
 =?utf-8?B?T0oreWFJRWtDSTNhcEc4cWIzQ2prSmhZbllmSnNSall1Tmc3NGpraStOdmJl?=
 =?utf-8?B?c3ZxTHp5d1oxejZzRnkvb0Nkb0VJYjZhYnFuOGFRUEJ0NFBhYklGT0s2RmVS?=
 =?utf-8?B?OExFSEhIQ2JSbHZiNWJYeDNMT1NuMkZJcnVmc0NYKytiVURWMVU2UXFsNzBG?=
 =?utf-8?B?SHpTMXErTndiQXlzeXZRUGhwTlhkeW0wcG5DUUdJZEQ1UldwS1pOeEw1eHVN?=
 =?utf-8?B?ZkpZMjR2UGdEeVJXczkxZ2VoTTVJcjFTQkVYUHBHNDAyZEt3VXgrMHhpUU13?=
 =?utf-8?B?WWNCWXpWZVZZODNuQ0trNVgrckkwY1dEWTA1UjR1MjIwMzhKcjJvQWdFa1JS?=
 =?utf-8?B?cTR5aHl3bmUxcDVYeFN2UHJySFVvbmtXa3FqZlViMm5CMHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0xIVkpzTDNPZy9XendMOG91VkZmSUJ2UXFuRWtmUUJUMks4Ri9Fb1R5NTd6?=
 =?utf-8?B?YjhhL0xJeC9uc0xZV3U1Y3FOMnNjaXQ1anVzY0E4YldDTUxsWTNOMjhja1VE?=
 =?utf-8?B?bGNxQStSMkNmNllQYkx3c1FmMm0xRVBrdVErVUpidFlWUjF5OUFVNVl6NDNT?=
 =?utf-8?B?RnArTGlWa3VncldicCtBR283amlTUWlqSE0xdW1wQ0xHdWhtRGQzcGcvQjho?=
 =?utf-8?B?eXNqUDFYQnNhdlFNeGpEWFIzQjZsbUtMaHJ2UTRuc041eS9TVUZLUldtQ1E5?=
 =?utf-8?B?eFNGem1RbW81NEdpb0JaQkw2RHRFTjUrU0pyMjhDTWw2eVZBZFNLUlJXV0Vq?=
 =?utf-8?B?d0x3OVg3d1JnU1UxcUpzdmFxZTFrdnVsSnhTZjdpL0dwbjdBR3FHbzd5SW0r?=
 =?utf-8?B?dGhGMHZoWWlWNGRTcWdFMTY2dWhQTEJTUENwalNPeWxobWwxa3ZZM1lOeFl5?=
 =?utf-8?B?YzlnZ0dnQW5VSzJNSmhCSWNyTlAyNmVKdFZJTFBqNk5DK0ZmSWZJS29sSHVC?=
 =?utf-8?B?M2xQcUhYUmEvRzVVSVc3NnRoRHIyOVZFYlVlSitESWt1RE9uY1NKalpteG12?=
 =?utf-8?B?eG9rcTljUW80akN0TlhPRVhTQWNiNjZ1M1FqcDlJdWdvQVA2d0pZNkNKV05L?=
 =?utf-8?B?a1RNMnlUOTdCOG83SU1rVW5kd3Zvb3FLTXVlbnJ3NEJnVzVxQ0d5ZzJ4ck1r?=
 =?utf-8?B?WjEwNEhZQk9aTmJGSndHQ1FmbXJRQjZGNjVTQzhFK3J1b2ZCNGdpTlhPZEhU?=
 =?utf-8?B?Y2V0WTkydDFncEV4bkJDSGIyUGJiNTExU3JlN2plOHNtbkh6eUZqV0ZhTXpY?=
 =?utf-8?B?Vjl5TlBCdU05NUkraWVWWmdZL25aT0V2Tk9rS3ZRNm5pMDczLzFiUnMyUlhk?=
 =?utf-8?B?S0V0RHo5Wk01cG0zU1VqaUZyYnpadWdQclYyOXE0bUxtWFN2cm5pY1FwOFlt?=
 =?utf-8?B?MUgyblJIWVZhbUNucHFOQ2hTM1Q0ZWhKNHBYM09GR0N5U21Ud1cxMFJRTXVq?=
 =?utf-8?B?OWppclZ2UjJVdnRiSlE1UXJPRi9PcXJyNFhxZURVYlozSTN3RkdDUXRIY2Jl?=
 =?utf-8?B?M01DcTBIOUFHYndIZjhpaVM0Z2dOY3ZJQkxIK3cvWTBPVjFCOEdISitOc29Q?=
 =?utf-8?B?RjZjVGp1eFUvRzFnM0cyOHB5dEtlZUMvMWV1UUNzdnIvOVhxVmNXU1pkV1Q4?=
 =?utf-8?B?R1JHTlBNWUd0TkxoMzk3SWVVK1d5Vm9IV1RPc1ZCUUNKRHY1NE1seVNSNklB?=
 =?utf-8?B?TllJMFIwZUdWQWtpdVc0R1dwajg0eHZSUHhwWHpOYXdiWDFWWno1RUdzYmYx?=
 =?utf-8?B?UkR6YmJxZi8xdllkT3hHajl5NTVGekJySkxTTnljalhLYkpQakkwNWV2cmJl?=
 =?utf-8?B?ZG5LeFcrQzBnT1JZZEVoT0xpcFA0OVdZeUNXbHl5aDAxZTdKVnNTRzZOQjVh?=
 =?utf-8?B?S016LzZZV01lQmxXTC80Vkc3MHY2TmwrQmlKQTl3cFROM0Q1NEdldXloR2Vp?=
 =?utf-8?B?T0IzbmY4UURLNmVDdUV5UW9kM1FYS0dKTmhLMGZ5dTdsK2FVMjNmU2FscDRq?=
 =?utf-8?B?VDhTSzhWSm1US3BEQnBEcU5oM1R0MmdMYUtoUmZtQmZ3Z2loOVRmQVJnTEdF?=
 =?utf-8?B?c1VYVUQybkRCdk5uTEo4YmdMci84U2NlNm02bGgvSEVTZXZFSXN2K1Ixc1JI?=
 =?utf-8?B?ZU53bjZ1WGFDYTdXMnVBeUZPSmN1R3VWeFUwV3lrWHQvak1kT3FGN0FyKzg1?=
 =?utf-8?B?a0JWL08vM2NTVnRZYjgwVUQ2Mmc5N29oSVh4L3lZMWprZ1JSeTlsRmRIUGZo?=
 =?utf-8?B?b3Q4aFZrVE1jTDAxRG5PNTE5SW5adEdlZzJiMjBYR051czJvZGRYVTZGRDRG?=
 =?utf-8?B?K1JUV2pnV0JsVlJhUGNqRVpUTks5ZVBDRVRtUkZaYy8xWFNhL3E4STRJN3Vr?=
 =?utf-8?B?WHFPM016R0x1enRCQ1REV0p6TmVLZmtTTXFGWnIvQi9WbWxMa29Pcm1KNHFT?=
 =?utf-8?B?emNYa2RHRE8rd1lpcU4yNlZNNXFsZi81cTZkYk5VdjhpRCtIWG5aVDdOZ3Az?=
 =?utf-8?B?WnJMYXVBS2ErdWx5TnA2d1RIZ0VkbDE1a1pxdmxCek83SkpDUnMvSTdDc0RV?=
 =?utf-8?B?ZElDd2p6TzI5TTlFbDRaQXJGMHJYbVlxcU9FcWJKMzE0WkMwZkMxbnpmdU5y?=
 =?utf-8?Q?9E7H5BE1MPs3t99OXF/n4R3aUUkOcmW3T25wo0pE+Y/7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fec651-f1d0-42e2-7ad4-08ddacb0d044
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:35:56.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF9OFha+nziH9E/yb9uvuSSynyHtkgkgUS69myPyng28scaY0nxN32LuK/WK394eDAVcvAQVO+djG3/iFbjV0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393


On 11/06/2025 08:34, Shubhi Garg wrote:
> Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
> P3767 platforms. Assign VRS RTC as primary RTC (rtc0).
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> 
> v2:
> - added alias to assign VRS RTC to rtc0
> - removed status node from VRS DTB node
> 
>   arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
>   arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> index 9086a0d010e5..f03785cd23bb 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
> @@ -8,6 +8,7 @@ / {
>   	aliases {
>   		mmc0 = "/bus@0/mmc@3460000";
>   		mmc1 = "/bus@0/mmc@3400000";
> +		rtc0 = "/bpmp/i2c/vrs@3c";

The above should be ...

  rtc0 = "/bpmp/i2c/pmic@3c";

>   	};
>   
>   	bus@0 {
> @@ -170,6 +171,16 @@ bpmp {
>   		i2c {
>   			status = "okay";
>   
> +			pmic@3c {
> +				compatible = "nvidia,vrs-pseq";
> +				reg = <0x3c>;
> +				interrupt-parent = <&pmc>;
> +				/* VRS Wake ID is 24 */
> +				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +
>   			thermal-sensor@4c {
>   				compatible = "ti,tmp451";
>   				status = "okay";
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> index 84db7132e8fc..877c5c1bf9f2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> @@ -7,6 +7,7 @@ / {
>   
>   	aliases {
>   		mmc0 = "/bus@0/mmc@3400000";
> +		rtc0 = "/bpmp/i2c/vrs@3c";

Same here.

Thanks!
Jon

-- 
nvpublic


