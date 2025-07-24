Return-Path: <linux-rtc+bounces-4571-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C8B1081F
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 12:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8C3189CDA4
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 10:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475B326A1B6;
	Thu, 24 Jul 2025 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mf+TdxT0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545326A0D0;
	Thu, 24 Jul 2025 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354237; cv=fail; b=Qclp2pDYUCZqBC04GFmNMiQsimhvSkipbEF4jZ+6R8YGGsvye2V53HfPBTV8v5Gvro65aFRi767+e43rLTjgq83BCsS5k01ff1inlPR3NG1+ve2Ob+mgF5943qbzgx11m1gKh5/kQMNA5rYCZpnQtpSsZgfXzbBjfAxWLwBE3QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354237; c=relaxed/simple;
	bh=s818L9tYwNkCikGSmW1z1eWCfwcl0Xss60ineBSA7fA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ksmsuMAsEmpNElYHdV52HfbpJtvTK/PoYSb9oPHUdRlxybWKwsVKTLiJO8t/dlp2WTyZt/5y8+L4j2GNSBELK+fZeTNFxBQZx9jGTX/6g5rEpPuR7i+N8115J2exRB4OwEt3k5X1ffQ9b2eJ3GUBorE6wIsOCT6To90QNH+jZlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mf+TdxT0; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5owIV4Ensecevc4c9J9scRuvMDuc63xMHlE+XUBBfcVpbdM4/AEzA9uicRt/g0AMYojEogy3yDz8tkKvRStYwOgIF3tebANfY6SLSAR9o8W07lrwtKZRfx6V4hRO4Of52w/zX5brnrU7+tyghFXiMzYFQulQ1feBxVjYzGw+UDGJa4OuoaBIaS8ER/SElVCQ2cMkvTXhVW8H2qTKFYTUvDZSztjX+0goprFnJCZtuX2NiprRLeahQUA3EwRFM0DWJwEQIAeVw7mQqUqWDAqnUsSL8WoJ8lqMdpOudM3l0XUeY72G/OKeXCvrYhQvpCftWzUBorSPgRErgFjEE9NCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H/epcX8butSZrT2L6UNhNtSMz4YffDRhmk84jlpjgE=;
 b=Mh8A1U+iC8YrcC+9h2b0e616Ej217mCN+3bE1sLENqHdYD8/a/4H35WXhnfy9crx5eywooMD30SA9KAjgt9ffUHBi/Z2agYgtrqJAWE03JTwjxd79Xz+eQqAYvDcF8wSbxl92S2LHslDC9jRrMEGrfzFOYLwEP2GpojtDhI+z6N4L1XB2jhXgA0crKiDXyDaTScLE/+Gzsp+jQ6WbyP51ESI+64eMea5q2WbmLFCaPtLU3hf9yVc4YVrX3m5LGDreD54jwKmC4DM8w6gqaqv2N/LUAiF+A2kdPVSM0s+rUgKX6x7BvNf11T3cD17miswJcIf0dzb9Hc43HCC8V/txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H/epcX8butSZrT2L6UNhNtSMz4YffDRhmk84jlpjgE=;
 b=Mf+TdxT0McKiWH31P89i8F0AsG8Ar/CoHkYKb70rdXfaNM+DzBbXMGtbXthSc/WrJRkXEHZL9dg3senxg0WJNITSzDeXb8pS8OaAmYuYKUOB0qVxrgD/HfbGvmXyFyLEf0DoWjriezXu+phZ0hIFfl2+5mhz1MycQow0+Mm1SWesRHVEc+AYhjjCbJOQrsZgk3q8I1Hd6GIzdpPPM8cdjXeGXy6sFuZPNW+3KbmoxAnPLjNVw8VyvMg4NXRCRdWpSpNX10csEkLGq6dgaJdgYWXfh2hXHHqf3Ual6EDSq19Xr/v//nUeuWJUb08tWWJtfDwDgsoB+kKsAIqvqWkHLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 10:50:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 10:50:31 +0000
Message-ID: <0d70270e-2290-47f4-87d1-9a11019fa169@nvidia.com>
Date: Thu, 24 Jul 2025 11:50:25 +0100
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
 <2c59e665-6415-460b-8ff8-c06f8d94f9eb@nvidia.com>
 <f69a76c5-157d-4cb4-bf46-1acdb6a87319@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <f69a76c5-157d-4cb4-bf46-1acdb6a87319@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb2dbd3-e329-4a13-c713-08ddca9fe90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S05sYllxL0xzRitSVTBETndIZ0lUZmUzTEk0N2Ivc2ZTNzdaSERONmZSWVcx?=
 =?utf-8?B?LzJFd0VEYkxjQ1FWWitoclp2UGRycFFnYnpJa1JVVUNoNjdGTUVGdjU1bWpq?=
 =?utf-8?B?cE0xd3BOMXBpc0ZVYk90cFNsZjZYMHVjV0dZK1doaUhHczd4c2NEaHNSSlRk?=
 =?utf-8?B?d1pBci9FODBEQmhRK1BIMG52eTNhOWhJbnlBeXlTZlJlRU5TY3B6RXlGT3J4?=
 =?utf-8?B?YzNnSmpjSHI1QWgyT3NqWmYwM0hsaXVYMVBKOS9YdnIxZUxnSXJBd0dxZHFV?=
 =?utf-8?B?aFpZZzZxZTVIblhZV1BwdUYyYkliQUtBWFkwOGpMakt6MVpuZHY2c3lyTlZZ?=
 =?utf-8?B?N2l6NTljTHdnMjRuMjZCb0FGc3F0UzZ6UkRHekRaUEUzdG9mS1V4LzRQTGk3?=
 =?utf-8?B?T2ZrZEZTbWlVVE5TeEhmbW1YeGtWYTF2dzVZZk1DSXVaNkwvNklSZk9ZWW9l?=
 =?utf-8?B?MFpRS0J6OE94T05nQUp1dUp2QkJBNW1rNVJaOGhtaEIxUUl2QTRYSTgwdS9P?=
 =?utf-8?B?cUZyMEcyMXpFcDcwaUd0ZzkxUFVHektLRFdteitTSkFJaVhrN2pja2hDU09U?=
 =?utf-8?B?WkpLUlI3Q0R5STFkK0p1V3NGdWRQcUtpL2thZGlqN1hJOGRDK3hhZEFxc1BP?=
 =?utf-8?B?ZVhMWm9DVlRQcXhvdXNlUVE5RkNWQnpBUUxBSmZpOW9qK0VMc3llRmFWWDhj?=
 =?utf-8?B?WnlPaWhyaFduVXVCZVlMMVhra3NhSjcySGF4ZUNEZy9JYjVHSEtRT05BdEV2?=
 =?utf-8?B?dEZvbDhIZkJiV0w5ejVVa0ptSTU1OVIyVjEwYXJsanZzVCs3NUhkY1Jab21N?=
 =?utf-8?B?R01CRTFyZDBFVXZzTHdCMFZjNU1DWU5JWkYwOFhlQXZIRjVkTHlHSVJmNUc4?=
 =?utf-8?B?dmhGQnllZ1ZDcC95RWtFY0N6Y0VqRjBhb2daTXFSZTltUnR5Mk1Nd3dmL0w1?=
 =?utf-8?B?MGdIN3oyeEVyS2JGZG9HT29wMW5WdXlGQm5xdm5EMnV5SVBBUXRCRC9QK1ZB?=
 =?utf-8?B?Tk1VcUNmcU1MUUZlTEtHRTAyQVZmSVlPbVh0djlKb3U4TmNOTHV0S2Vzdzla?=
 =?utf-8?B?WllNMUpnWXE0Qk8wejJZVzIyMTJqZThVaWRERnFxQmplTGlHa1Vlb2IvZ3d6?=
 =?utf-8?B?OU42dVQ4SEhqTklhaFVndUNqR2ovWjQwZWtrcmdmWmtzSTAwYnFGOHNtSzBs?=
 =?utf-8?B?K2pta1BNT2pPUnRaWjIvL3dDRHlsNVdDVnF1RVBSUUcwSzZtbk16RFhwZnUr?=
 =?utf-8?B?djVuRlpHczczcDAwdTJtWEwvR1ltWVlHdDdvbGlWdmlCcVZXYzFDT1g3S0xM?=
 =?utf-8?B?ZFE2aUJ2R1RPNVF0S3hWSmc3TklOa2J2MjVPYzROM2xUSVh3VXE0YVQ2Nys1?=
 =?utf-8?B?SUN3MmVxVW5FbXpNcTIzYllhdld6RTl0ZFRhWmg5L1BINnBhdXJYa09yeVp4?=
 =?utf-8?B?VWpNY2tWUEtYR3lNbjROdFhaaDVKRGxrNFJqdzlRL3RkODZyRVBNK0EzaDF6?=
 =?utf-8?B?M1JtR3pzWDVTV3ArQ1p6cENITkpYakVoclBMNm1tNGlXakFHK1owWkl1RnBX?=
 =?utf-8?B?WW9GY1VoejhGY3hqQTZxRWJZQzhzbU44SXlmNXdxU1hxRXlhbEkrNkNuRjQ2?=
 =?utf-8?B?KzNPTmhLUTQ5NmhtYkRzVks2TSs1RkRpZ1VHUU1JM25rWVpJbVovSWtHVXpY?=
 =?utf-8?B?a2crN0Q5eUwweWp2QVM5SStxNU1DY2R4Um5MaDlmWFlRL2pIRDdBNVJJc2Jp?=
 =?utf-8?B?RUt5MWw5bTR3Rjl0amMvRlVSdWdET3pmOHF0dGVGSGlNejgxYzl4eHg1N1pi?=
 =?utf-8?B?VTliWkwyenkzN0Ryb2JVaFh1S1RKZlVPRGV3VzJIaEd2Tk12OE51azZibWZk?=
 =?utf-8?B?NjdoYjFQQjR1Nnk2VjAxLzEybUsvZlUxb2swYVh4ZmNQNUdBTnlkMFpUR3Fy?=
 =?utf-8?Q?iYL63LpObBM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHVFYktoTmNwMjJtUC9wc0ttbTZsUWhvcG0rYzVxckpFcmp2SFJTYzE3eVpY?=
 =?utf-8?B?U0kzVUJScW8rSVlGSnlQNm44dXVBcHNpYzVjdG1MMUFqcUdSOHlVMU04OEgy?=
 =?utf-8?B?akt0K2lNN0JvRjZkSUoraExkNllBVkxnTFVWYTVwOENyanFSNjl2MUcwbmo4?=
 =?utf-8?B?cVFtVG1vblVaZC9lK1VEMzNRcTJFbG1jaStHL2wwZGVqUTM1a21sa2VBZFQ0?=
 =?utf-8?B?N0pGY0J1WkhzdzJTcGZCUktLVWtoNkVVOTFhdE84YjVBWTBTV0ZVSk13Ukhh?=
 =?utf-8?B?cVhLSlBRSDZQVnQvYU9heFl0aENUWUlNOWlCZkd0UVVaVmVGZmx6SHB6a0Vz?=
 =?utf-8?B?VEkvU2M2NytvTTRMWWJ3NGpseWdQd0pJaGd1aU9wcUJDMjIwT1AvelpMTGpN?=
 =?utf-8?B?NS8vMDRZYzN3UndXeTZWY0pWd3NUcm5nbE4vWmVCTis0bHJQVjN2Sjl5OGhj?=
 =?utf-8?B?VEdVNXl4TWFIaUZIK3NscUIyMnU0NWpRQ2FvajJmVmsxSUxCS3gwWDRFZDRi?=
 =?utf-8?B?Y2xNVE5RZnpFTVVvRnNGbmRnVm5iZ1o2SGxoMDJjcUYrd2p5bVp6TFRlajMr?=
 =?utf-8?B?RHoxRTUzeFVuQWpLYSs5bWQvOUdJSFdnWFVuWTEzWjVjK2luUXdzWG9KbU43?=
 =?utf-8?B?U0lzejF2MEJySU1mcERIcTVjZXZEZFVKd2owQ0JrTVdmM3pCSitwVHJmZUc0?=
 =?utf-8?B?U21lMGNVdEcrNk9Nb2JPWmlVMHdCRVlsOEVtYXBmMHNEdzBKRXIrNmdDREtD?=
 =?utf-8?B?RElqU0NCUjQzNzg2ZUFXenZPZDNkYWFKN3lJRGw4L0hyOCtVQ3JVcENYZGg0?=
 =?utf-8?B?MnhOdGFhWWsyOGdRR0pRRUZUOTBraHVSVThNMS9YdUhOSzBXUHpEdTB5c1U5?=
 =?utf-8?B?cWdPVEl0elJNNHo0ZUVUOXdxOVZHbWlubG5GM2pkaXV0cnBhL1gzRnd4M3pv?=
 =?utf-8?B?aUZVdGVpTE1WNERNMTlNMklscEJGMWZFNkFmVEhYUVUvZ0JpYnc3eForcFEx?=
 =?utf-8?B?WWVSaTJCb1pFUUJTUjNIcit5dVpXZkFUYlR3YTlZcWpHb2sxQUpSaGo4YldL?=
 =?utf-8?B?cTRPYkZvYU9jN1pVMGdrbXNJMmdzOXA0NlJjV2hFUjNWUnRVSGFCMVo4eUFa?=
 =?utf-8?B?WHcraEN4a2ZTVGpJTFAzY3hHWUZHdnlVYmJZbFBxbWUxMzN1a0tFZHEyTW1Z?=
 =?utf-8?B?SEUzUzZLNFNDWUVCTk5ramRUV1JUNVo2Z01IZzVpK0trQ2krYzdkNkQrZkEv?=
 =?utf-8?B?TW9uWVJXTG1xcWdEZm1DYlhoSlFlcG1tQWJManJXbkxWamppZmQrU2tHNWtE?=
 =?utf-8?B?YXIvZC9kVzVUQTFiQkl4NTRjbGZXWnVFcHVRNXRSS25ZcXVGV3VvZzZJc3Yz?=
 =?utf-8?B?Rm10U2ovVVJvTlZRa3Y0N29iYlptQUpaakxGTnJZaCszd25lYkVnRDJyTis5?=
 =?utf-8?B?bnUwcmFhRkpYRUJVbjJBT3VNQVdkMUR6TzZPUXJOMDZ4TGhFSE5ZTVBMbUVN?=
 =?utf-8?B?Z01PUWVWdXdqNG1uL1VXc1hoTStDdlc0b3g5c3JFbFYva3lQcUo1eTZ3K3hM?=
 =?utf-8?B?S3NnejZDOEpnNUNncXh0V0VmUmNTOEZUL1A1ZU5SNjVDS3g1UjI5SUxqMUtk?=
 =?utf-8?B?MDMvekpiVkN3QkoyWVFqTzh0czFmV0FybnphM3VqYU5HeWxxRXpCUmlOWlhK?=
 =?utf-8?B?amJsRGtBR09Rb2tJK0kvRnpwVGltVUlsNmZoQUU0RkgrVUVpcDMydDlWQjdR?=
 =?utf-8?B?Y0ZNWkQrUU5hMUMvamNJSUVDVEVBSVhXSjJqeWZ6cHk2cHIvcDJkbThGeTN1?=
 =?utf-8?B?ayswRE1IeXpERnJTa2xQWXFEaDlkc3ZZb3dlcTA0VTE1WmJtUGUySkpXNzZ5?=
 =?utf-8?B?cEZWd1I2amN5eG4wNzZVYTNNaHlhMzRjUE44Z2NTVWdySDV4MjVvZTRnWEp1?=
 =?utf-8?B?aXRGdWVkcFBPWERQdWhuOS9MUFliL2dMWWpaUDFxbGpnR2lJcFRRVnhtZzVL?=
 =?utf-8?B?RWtOQi9YK0g4MXV2Zm5nQnViQU10UmlxNTlGWXZhUlRyMDEvaFVVOGQ5Z0Z5?=
 =?utf-8?B?RDBIWGFTa0xkc0lFV3V5TVRFWlNtU3E2cldtaCt0MnJlMHJ2TDJ3RUpYcTBt?=
 =?utf-8?B?aVNtdkFEcGpBdTFZSkFzK3RQbUVaVVFkRWIxZFh4VlJrUnRzOGlPcUhsYSti?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb2dbd3-e329-4a13-c713-08ddca9fe90b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:50:31.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kiu30sjtAT4wMCkdkAlhWKZ9j15ALoA4JfotOE77B0+hjSXMmDCh4sViVadsLvlEvPSg7Gn0O+81jV7iAOHuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483


On 24/07/2025 11:06, Krzysztof Kozlowski wrote:
> On 24/07/2025 11:41, Jon Hunter wrote:
>>
>> On 24/07/2025 08:59, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
>>>> +description:
>>>> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz RTC clock
>>>> +  support with backup battery for system timing. It provides alarm functionality
>>>> +  to wake system from suspend and shutdown state. The device also acts as an
>>>> +  interrupt controller for managing interrupts from the VRS.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: nvidia,vrs10-rtc
>>>
>>> Nothing improved. You never replied to comments and then replaced one
>>> redundant word into other redundant word.
>>>
>>> Respond to review or implement it fully, not partially.
>>>
>>> Or add COMPLETE bindings, not partial ones. See writing bindings doc.
>>
>> OK, right so the DT binding should describe the overall PMIC device,
>> even though the driver needs to support the RTC.
> 
> 
> This is not a driver patch. This is patch for hardware. Sending
> incomplete pieces of a device, without complete picture is really not
> the right way. Knowing this is part of PMIC this should be rejected, but
> how can we decide on that if contributor never tells us this is a part
> of PMIC?

Yes I understand that this is not a driver patch and must describe the 
hardware. It is a simple misunderstanding because it was rejected as an 
MFD, but we should not have then made the DT look like only a RTC 
device. This is a mistake on our side and we will fix.

Jon

-- 
nvpublic


