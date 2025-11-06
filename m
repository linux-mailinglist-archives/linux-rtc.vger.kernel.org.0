Return-Path: <linux-rtc+bounces-5276-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299DC3A2DF
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 11:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 519244248CC
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD4A30F530;
	Thu,  6 Nov 2025 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kbHDPJkf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE162848A7;
	Thu,  6 Nov 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423490; cv=fail; b=myHGjdVkmPF+lvpClf0oM+NQYI8y/rTMbeVLfBXpe70099drAYRMjxy0VuPbZzdD2duq//ECT/ilmO+hoNt2UAPflyx82A2RGgqiW4abgl6ty0bhMOhJ0XeKe0btNWPliNm38VD+jfVvjSh1CkvPRrLZ2pN+7qWUet8G/W9u3BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423490; c=relaxed/simple;
	bh=LhvTA0CvwA2RpP7Y7JFF/t7+gcH63VHwbYYElStrBW8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b7KgVqNtxG32NI1WpIra6fRSnL9wrORx1gSNZAb+DUOSS4ZC8lyjkDpB0mwot/boACM1C4IVcBczdoIZbFNgRRFmyH28uDtVcGoQ+LvhwnG8E6XH1QpCuej8wME2zN/zsDaSQQSLt1BBZ1hlYdrUq+4C6jjuAUjrBG4QveqUABE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kbHDPJkf; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pupQ7Fl4Zzqtp40KMFNiQ6m786hbFhHEBk9IJXM2vA8Vf4mSeSh+XFDPOEhMjbvjeGOSDjXiFAWgDH7DU/b3JOGcpWYetIxeI5Hbh5paYcDEmOP78yAPOQ+YkY7uJdGCtBqcZGVsfzLzK9nD78cGq05gBg2Iqi1aiMmW9fyNmwDeAEJjfN/6TKcfo3Kp/juIFSa2B0CWvYbw54+do/mEjHsmaCIirg79QUJZwhbdK+cZUcXlJfbQGLzrkJriGP6m+0/kR/avL89yb+WgM62cyFuwpqYKnTTrGdMeTgEc+x6YLask+lB9cJ3u73kIQ0kulscQp+ZBR8oQX3E5+GhwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krlpna0Qn+4uminHHhzSyaip6TaOGfUlENv3MM1AYX8=;
 b=pSoP5bn5s+6HJ7oZ+RRToJHJyPDpbbctl/wFv3DoLF9LAjx8UCGfIZ4QwucLNrz1M3RxHjExhp4ce7/45bYnoOvXVren5uFijIyr2W4CChvFutW59fjxYh1qN6/AwfHYqwyQebqd17JeaIitoDN/MseZvYqJnxcsyXb3FZbr/Z8cCBjr+3jXQ25hVf8AazTiD3x8BVrPpOwxat1QHFwj38Dkf/NRlb9OtLJsomqLobcbN7ybJe06BtQCGH6Lxqy83vv3QFfhwa9qaR9Gv01k5XR6zThrNalkPvK4qxfZnHtcjruc8zYalQZuEqLWGdNDJzzgTetEFTFvskJO1m/Vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krlpna0Qn+4uminHHhzSyaip6TaOGfUlENv3MM1AYX8=;
 b=kbHDPJkf1BymYUykZwV4mvd4Yxim9xB8zaUV+UelLNvjGu6A1kN9NoYlcdyIv1/haFHxplITBOt2XjV9yjTOG+QgqgSKuw/6W+9JHrQkvvFJnd8DI5otO4N9zqUSIzLrZOYk881DDhNhMpbeRkN8ihUgmhT12mogQdGbRprEoYyPJrKRevYoZsWNwUqify9VMlJoKQ1rNeyPG225F91mTYqU3RfukDM2t8pi5Lm5ZUL39qwP1lDUUrzh7zKnuUrfE2cbWNqkUzJmTVLVxbAHjTpfwteiE7fPm21+rsreIzneYPBAH3+lfog0wr8/ChLJeYIPZBOCNIqYcymVdrZN1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Thu, 6 Nov 2025 10:04:44 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 10:04:44 +0000
Message-ID: <423cac10-849b-4fb3-a092-ef50cd9846f9@nvidia.com>
Date: Thu, 6 Nov 2025 10:04:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] Add NVIDIA VRS RTC support
From: Jon Hunter <jonathanh@nvidia.com>
To: Shubhi Garg <shgarg@nvidia.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251007135738.487694-1-shgarg@nvidia.com>
 <bd7d8771-e063-4f03-9b0f-bc6ad95adb3d@nvidia.com>
Content-Language: en-US
In-Reply-To: <bd7d8771-e063-4f03-9b0f-bc6ad95adb3d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0290.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::7) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d59333-df5a-4f95-46c7-08de1d1be8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTVXMDJiTjE2L0UrMVJPTnBtZlZkYjR4L1BON053L1dHRkJEdENNc1pGejhR?=
 =?utf-8?B?R042TkJoa1pJWENBTkFzZGhZbTB3dzBZaGViMjk4a3haUVpMbkZxald2V0ZE?=
 =?utf-8?B?MGV2U0RadzN3YVZTSmloK2xucWFKejdjVlVRNlF1T2Z0SlpJL0lISmdrQWRE?=
 =?utf-8?B?K24xWFlLZkpjdHpEWEo5aTgxd2pDTkhGb0pNbjlsQXlwSml6THRlTG5ucnVM?=
 =?utf-8?B?ZW9aOENSaXE4eEhnR25IRlNSYkU4RktqK0IrNlJVS1ZVbkJTeFc5SjJkdFFT?=
 =?utf-8?B?UDFUMmthNG9CVWRvOWVFQVNFRFdJZE5NUDFGYUdFQVZuWVR2dDY5S0VSemgx?=
 =?utf-8?B?enBTRTZqaGdwbkdmSWIyb0FtYzlHd2xCdlNXRnNSZnVFQ1NZVGFxMXBqNnV0?=
 =?utf-8?B?RlFCbFNHZmZXTEFKdGpFaDJtNXFoclFvRWV2TDRMRWE5cHIwSWdiVjU5OWhV?=
 =?utf-8?B?M3d6aTFuZmpOb1hpN0VIdHF1bnFLMzJtaVBvOUlnbG1yYWtYb2tudTlxVjNX?=
 =?utf-8?B?YjNWMGNIeTZUcDNkZU5hMk9FSlBuVmRWMzNWeWtQV3FJTVRuV1dUL3ZlZGJ2?=
 =?utf-8?B?eUU4bzNYZXVSZTBuUkRTcmNYbTI5OWdWMlJHeTd0REFRVCtvaWRlUmtTZDFi?=
 =?utf-8?B?eDhBb1NsREFJanR2dnhtLytOcEM4OVgrTFBWdU9idG5ETHhxak5Bdm12WkRT?=
 =?utf-8?B?MEZ4V0V4NmM2blpOUDU4QmN5VTA2Q2wwMHJ1SWlrSGkyZ2g0NTl3S25NMzkr?=
 =?utf-8?B?aUljc2wrdTNnQ0FNUjNUbjZMbGhvWXdZaXdqZXQ3QnJocEk2Qm51NGNKYXZv?=
 =?utf-8?B?WDNQT3VBc1RLOGp2Z1R2QjZ5Ky9nNUhPc3o2V1EzaEpvZ2orWGlXUzgrRFNy?=
 =?utf-8?B?bG1wazZQTmpwSjlVemxzMU5UK1J0VGVnUXloWGRLSEV6UmhESmhTQlY0R3Jp?=
 =?utf-8?B?bUNFSDJOR1FBS2tNN1owNlJkYklkNElEbjFmbmEvNFlDSUM5ejk4U3I2ZWFM?=
 =?utf-8?B?RVM3L1BaQTZpbitkck9qK0hZSG5wcG5WSmFnbGZETEpleFRlOTRyeFgzemY2?=
 =?utf-8?B?TVkrUDV3cjRNKytsaFBDNmpWOFV3ck80YnduV1FMMkVySmZCZVA3L0pNb3Fa?=
 =?utf-8?B?dG1xMVdCZ1U5VHZWalpTOURJVG1ueWdjQ3Q3dzdvejFvVWNKcGErUExuZGZK?=
 =?utf-8?B?R3FTSW5JenZacm1PYUExY24zbkFTRVcyYTRkbCtFU0J4ZVExNDZ3MWlHVzFX?=
 =?utf-8?B?SmJmYWlhK1F3UkttWUxaVkxCWGJpTDAzdllERlBsTmFReGRKejJnYjNKWDE3?=
 =?utf-8?B?UytTZlBFVGltTVFXR3JiVHYxb3F6S0t3Y080bGVxRDF1Ri9TekhMUDV5SUYx?=
 =?utf-8?B?dzRiN2dKdGJKOHJScTMrdlBRNEVBSGdvV3F1SjdVd2dxcUlHZ015dG5NNGpm?=
 =?utf-8?B?ZEJ2d2tQNTdOczNhQ2kyT1F2WDY4QmVRcGhDN2YvdElwMUZIVXQrWnoxSDlU?=
 =?utf-8?B?QUdBN1hlenJReGxGcjhYUi9CVkpNOXppQnk0VVB6TVhaZ29id3hHKzlwMXZ1?=
 =?utf-8?B?TEpkL1d5ekErdEs5VkdWZXEvUFcyZ0crYU1BSUF1SXhrS3poeEw1bnR2N2kr?=
 =?utf-8?B?am4vOUlDM1duRmh3U1BOOFBjbGo3bW11SDRGRXdFUEFoN0l1akxsYmcwMDcz?=
 =?utf-8?B?N2twcGwwRWxHRlBuRWZaM3ZVSVdHclMxbXEvMU1CaGNMNUF2YzdWQU9KcXZI?=
 =?utf-8?B?SnBhZ0JBcVNnRUxvWlBuRytJU1lwNndISW0zdWhSdzJBNzI1eEw1YXRDaDlY?=
 =?utf-8?B?Zzl0aHN0dHB4SGIrVVhjVnRjcDZaUi9lMU5FWmpYUzBrUHU1ZkExTHpiYVZp?=
 =?utf-8?B?T0hsNmQwNncvNm9wQzJSaHpJb2ZKS2hGcVFqTW9teUx0b3RYT1UwU3B0WjR3?=
 =?utf-8?Q?XIRiCiKoe908YPy1m4UPPuZPFOoZSwGQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29hSjhReXljaUYxcGpmZVBMZ25VdkpYWUkwNTQ2c2NDdTBiTGZPTUdCcDYv?=
 =?utf-8?B?a0dIazVlWWZvK2t5a0grS0RwY2RYbmpUK2l3aTJxL242eHZhY3VWeGtHcERs?=
 =?utf-8?B?RmVnNGNPTDBqc3FLZnV6Q3BrUUdlK0NuR3UrMFZuTnRsWnZKTW11S1U5dWQw?=
 =?utf-8?B?VmVsaG1iQUlaTXhwbU1aQ3ZGTVVlYkc5Y1B5NFk2TFdWbE9iMG00ZXY0dm1F?=
 =?utf-8?B?czQvYjBLcEtOOGtNTVhjbnNDdHQyU3FIWURxTVFXMVRmeU9aWjFjdnJ6cXlD?=
 =?utf-8?B?a1BpWkVWNE0wSm92MGsrY3BycFZTeE5Ta1NjNVV1eDk3Z2FHRHRDTm1qRGhr?=
 =?utf-8?B?MlpFbXcvSEkvcnIwSDdBU0FRbEsrcFNqKzBDQTgvUE0xSk9LZ3EvYmVWbGVq?=
 =?utf-8?B?c0tUeTB1N3gzUk11THMySmM0d2JiNGlKakhlRWpDN1hkR0w3eWFSbU0rUXVV?=
 =?utf-8?B?MEZIMmJEU1E3WkRzdlZuNFRySXhVZGN1WlE5REM5eU15UjVxT2h5ZGh3eFBT?=
 =?utf-8?B?anNXOXRiM3h5NWFIQkNQNG5FejJ4S2RPYWNCWmRMWnZXTU04cWt6aTFEWGtV?=
 =?utf-8?B?UHVWMkpRWEphTFQ3NHZRa2d2U1FwTGlTVVI1S0g0eDVadzNKV1pnMStZYUln?=
 =?utf-8?B?MVVtLzd1NVJuaUJuTG91Z29rcUlTNDRIOThYRnNla0llK3N0cDBZRDJjUnFo?=
 =?utf-8?B?UnRDbklCUk9XQVFQY0IyY3A5ZElVdjBoMUR4eFAwbmRhenZaZlhyZjZONTJ1?=
 =?utf-8?B?L0xzcWxmejJ4eVVRdHprTVpwT040R3FhUTZYWmJUaExMUjNxVEt2elFrTm9k?=
 =?utf-8?B?QnJqVDd4SGRQTCtGb0dFMkdKQndxclBHdW1vS1NGaklOTS83YUhDM2pYbUhD?=
 =?utf-8?B?SjA3M1dIS25SbERKNE1Kd0g5TldLVTBQS3pqZ0F0aGJOZEl4d0w0SGdyRDhp?=
 =?utf-8?B?K3lvZWtKWDV5aGRWaC9KZ3lOaVZDMlV6UkFsUGZPZFFqdlcyclZOS2p2eXlu?=
 =?utf-8?B?d0ZvZTFKdkdnN3c2QURTVHB5NmZqN0kvVGV3STQxMHI0Umd1endVYzFKTk5u?=
 =?utf-8?B?WE9Gc1hQV0JWOHNwdWFKTUtVUlNtUUd1bEE3R2dxY0dXblVObUVQcXhva2VE?=
 =?utf-8?B?N2hvTm9IZFJQRENSdGlXUUxLN3Bvd01ab0t1TWhBcmxIV1haRjB2NlVoaVpW?=
 =?utf-8?B?Nm10Mys1ZXRuU2ltT0pjUTN4ZDE4d1Nibnowb1BMaUNodThZaU9xNU5ycy9V?=
 =?utf-8?B?VER2Y2dQeVlsNllDeERWeWFJNHVua0grVCs0M05BRTNJbDkza1l2UEI2aTRD?=
 =?utf-8?B?OUxyRnpFQjgrM3pjbkpsYjFJNzJWL0xmaGVjQUFPOWVCOExCTHJ4YjN3OTAw?=
 =?utf-8?B?VGpMb2lEMVRlSkpNLzhIQWdhZXpBWHlmR0djOS91QVR1ampocjNUU3lZUnh2?=
 =?utf-8?B?dDVsMTZVbEdZMHpZeHZtVWdBaDNQaklnOWpCZlBUc0VYc2p1Yi9BOGg5M20z?=
 =?utf-8?B?OUV4QzV5NXUwaUpKQWNFMXNUU3EvWk9aYUFaTkxaUHI2U1VaZHQ0Sys1R1p4?=
 =?utf-8?B?L0xrMEJqY2NRN1ZiSCswWGVkVzd2czlJR2lHU0lpZHdLS0t3R0Q0VHZ2aE4y?=
 =?utf-8?B?VXdFcERHQ3R5TlRWSUw0cGxjQ1ZiY3BzNnJLd3pka3l0Yk9TZ2V6SGJrVVJt?=
 =?utf-8?B?VDVodnhlbU9RemZMODNWNi82WjlBeHZqSXphUnE3YVRET3F1Y0FVb0ZhUVk2?=
 =?utf-8?B?SGp2UmhWRTBteDdyWXdXK0ZTMEZ4ZlVZekRWQWtmekEvQU9NdHEveWJxTHlx?=
 =?utf-8?B?b2plMEpFbGdVRGdzdUUwQU9UcFVYNUQwcGVsWVRoUno1RWVXVTMyQm9DMVd2?=
 =?utf-8?B?aWc5ZlNPd3JabnZBVFZtSXppZnduRTNYZDh4T0ZFY2dSTmZBS1JnZG9FRUpt?=
 =?utf-8?B?cUIrK2krZkI1cDcxSWx3akVMTkFtUTNlRWNrRGlldHlhc3RMSk12RE8vdkJX?=
 =?utf-8?B?OFYwSFRDQWpCd0puUjlwRVQ5WHJ5TlYvMEt1Ykw4eGVlZXpKb0M5VS9IUHdz?=
 =?utf-8?B?RjRnN0paTGE0bVBlRjBYRUtBYUlwemNGQml2QXpheStlYmRCbElsNmZqdWNt?=
 =?utf-8?B?bTNnZ1k0ZG5VYVpaK3RTTlQrNEFtK01hb0VmL2hWR0JOcm9LSWY3ZUdFWlQ2?=
 =?utf-8?B?NHNzYXdHanZoUUZpclFnMkdnQkNDdjlIL3JxcFJOemF4TEtvTkJpMll3SjM2?=
 =?utf-8?B?UFlwS1Y2RmJMNkp1N1hNc1NXZGtRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d59333-df5a-4f95-46c7-08de1d1be8a7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:04:44.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KzJ2TZVHWm2e7g8xpkt/j5Hrmh/I77N4UBAlT1VqtiKx1hJuE/ws3duZuptxu233U/rZ/XaL/mynD5sgfup2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862

Hi Alexandre,

On 29/10/2025 12:49, Jon Hunter wrote:
> 
> On 07/10/2025 14:57, Shubhi Garg wrote:
>> This patch series adds support for NVIDIA's Voltage Regulator 
>> Specification
>> (VRS) RTC device. It provides following features:
>> - read/set system time
>> - 32kHz clock support with backup battery input to retain system time
>>    across boot
>> - alarm functionality to wake system from suspend and shutdown state
>>
>> The series includes:
>> - Device tree bindings for the VRS RTC
>> - VRS device tree nodes for NVIDIA platforms
>> - VRS RTC device driver
>> - Configuration updates to enable the driver
> 
> 
> For the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>


Are you OK to pick up the driver changes? We would like to get this into 
-next unless you have any objections.

Thanks
Jon

-- 
nvpublic


