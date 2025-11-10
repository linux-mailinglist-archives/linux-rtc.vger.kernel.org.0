Return-Path: <linux-rtc+bounces-5306-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E739C465D6
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 12:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274CD3BAA33
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2A7309EF7;
	Mon, 10 Nov 2025 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VDk2jgjt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AA1A317D;
	Mon, 10 Nov 2025 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775279; cv=fail; b=iKyA9zMhvE2PJreB/7k4x3ac/pVl3WSeNU17W+N7BvjFqE0v1IpacK3wC4Vz9809fbm2L54y/0IVsx2Lm8Kp+gplSu88LD017V9pRaaR7Ruf8vzsPXBRQ1f4GyPFFK6+QrNFRIXZqMepZC52d8ZdYxGf+Res2Wx7nydbzJDNfCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775279; c=relaxed/simple;
	bh=tE1cw4j7RyqZ35Yx2sVfez1+aa26lm7culPCfdMnrqY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hJYsqlUWfqQ+mbzrx3q3s9JOVT9nVGoC0itJ/cPD8VzYlQdsSRiqGjBGRDz4dBliSA4aieZPRg3+oZ9QDrl6+iDKRLPcSAZ0XzDGXtU9EsHU+AAav8968gzvlvfS9+STldAPrnjBQ8bCaMGtyPCPHKK+70nVFfx/2vsFxfvzSJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VDk2jgjt; arc=fail smtp.client-ip=40.93.198.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQQinsQoghPLoUurruK8mASWhrPVzgJQI4LNJ//QuEzaD62YTj1TWxVwKCFFidESRGOt3Am1cfX1Nak2/JwKjLbCENHXnBRQ1xL/oQqiiScFOAqcBGE8JD86FZoTJv0jlwPYCILjtDNcoaMX75xjeWL0NSPKdYvqSI4Ow7rdyq9zTUGP1j5gcAjzhGAmhJibX2Ol9EYDYiHS4B1oVJPr/VZQpqJ2mfOArU6oy1mffESSccwvlLLh8Ui4l5qcKB6Oz6s7Y2qMXpsZKiCRwIsxN5Zxh+MVxV8FjgRVhqsgzWwlHL/5Q5HxIFP+lr0BQrcfMlS5pt5EpqOSFv+j3irb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99hZQ/6fPirh8aEpnhwYGwg0C7CfoyAMJ13ybCNvBBQ=;
 b=rmF9+YC8pcEl0Nzo7EOpQqPDTYXekn15xNR5cywwuF3rzBzHok+BFumtXQDjqZghiPl1mxUbD05Y5XvLpAGszeiMImpdQBkE1EcSgrdJFT4LUCHNqX1dud421k6xgN5ntpxDeX7O4tKqH+CAvg45NqzofI0DmUTzHih97A+C0LFpCOWxGginnSK28HI7AR9SWHk6A0L3NtXf0pLMIQIJBXmT4Ckts3LsvjFlOKZEht4/B0IM9tGQa43gAyfxqrP7ziFGSUSVygvLTb6MT9FwYJ/OGWvF66tVpnhLVWdNvnilvnJSYev8BZxM0MCCWpK0R9YMQAKoMPo6fbZ1fXN5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99hZQ/6fPirh8aEpnhwYGwg0C7CfoyAMJ13ybCNvBBQ=;
 b=VDk2jgjt1TWMuc3B1Rg2o3DL22fv39swc0GbJQX7exLhpfs/Yeqegfo0W8WnExMGAIjaPRLxk6WfPwmrw1v5VWD8f3gwiQwaa7MgETlVadMNPyt/uYMKfzAoSvOtZsS950vJ6kBaWibZCGR3HXyoZV3vZrR6ZOWla5KnRUKSsFQyHpcST/cxfYfWJRkA/EJ4Oy24GTBu3sr8+BinCoVm7zVSYwMmnPKSoeKhdYP5nEcDPoC4a4l8idPGux0VEqOOgLhmldT+62LXiL4YIWrOe0BpWFU4ByIDBQPfXb4ybd7A8gH+MqSRCygGa4l5YG6Xpde1buAzide/y0tFolhRaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8212.namprd12.prod.outlook.com (2603:10b6:610:120::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 11:47:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 11:47:54 +0000
Message-ID: <42ce1ab1-8334-4dd4-8301-1ae84a7786b6@nvidia.com>
Date: Mon, 10 Nov 2025 11:47:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>, Shubhi Garg <shgarg@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bbb759-7e87-4e96-9d86-08de204efc2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFJrSFMza3Z4ZFlyblpVQmxZeWtrbnBDV1lCTmxVNjRZenFtRnc4MHJGb1RP?=
 =?utf-8?B?MVJkb1gxTDQ3aFU3V1lvUmx0Zkk4L3l0alFLeGxNVEowUklpRHpZNzBTUlpv?=
 =?utf-8?B?UEI3VzhPUVZtSEZoU3J6Tmpwa2FqSHUvV2RQSmlVRXFNMm1mWGdsdWxRanVv?=
 =?utf-8?B?dUROUWRMRVFpbE8xR2J2Y0pPNmZ4QjNSRTVRa00vNWQzODVibmdvelcwOExW?=
 =?utf-8?B?ZXBJVGhnYlZQRnhmK3RUbmIybHNPajdUN1JwQ2R4M1NqOVNpNHFveDQwWVU2?=
 =?utf-8?B?ODlpUDFUOGhGckliV0dMM0ZLcU05cGxsTkcwRWhEMU9adXUzeC9XOXZZSVRJ?=
 =?utf-8?B?dkVBV0d0QjkwK1Z2V2cwQkJvb2xCdkVPUzVxUXVraXQ4V2VXQkQzYm1pSkhD?=
 =?utf-8?B?b3g0OWlSNGZTRUFPbTZkUGlTc1F2TThGb2RRajVINms0OUp5OEZXYlhpK3Ji?=
 =?utf-8?B?K0hXWjk3UFRhZ2hxTnBCZ3U5bnU3b0lIM0h2RThRL2NGY1RHLzFRckZjcTlV?=
 =?utf-8?B?S0orcE11aCs2U3JhOEVYcVVlU2wwL1A1bVNZcFRGaGdwU1ZKN1VGNWpPYkRT?=
 =?utf-8?B?enF4SUFXUER1R1A3My9nSzNFREVPMmc0U2ZoSWRRSGJhazM5M1NTTXJOTjJh?=
 =?utf-8?B?UFJ3YWlaUU1rcnExNVFzVW9XRkFGdUZRczM4S2IxWkhLTTdjaVdEQk96NzBs?=
 =?utf-8?B?eE94WW56VUZJQVcya0NMZGtVOHJFN251ODRGbHR2VDJpTFFzVnVIRm9EMm1L?=
 =?utf-8?B?YTVUenZRblROemJqQmRJSjBvYlVrYTdCMFVGQlB6dnRhT0ErTWhJelBtVGlK?=
 =?utf-8?B?WERzV1EyZHFQelo1UjlxSWsvRUcyMGZCR1hmbVR2b29OUzFhVSt0S3hKRUlI?=
 =?utf-8?B?VHRzZDRkWDJRMmZSNkVGdmxQYTc2djZ4YTRaeGtOSjJnTkZERjBnaXZweWFm?=
 =?utf-8?B?N2ErQmRjUVl0QlF6SUxDZmpoRVgzM3BGR2RSK1dEbmxtanBJQ2ZoVUNBSTFo?=
 =?utf-8?B?TXJHMmlyNXFtdFIzUzVyaTdoN2xxUXNYMlhJcmJKVWlhOGI2MVBhL2JNTXQ2?=
 =?utf-8?B?MUVScXoxVHhPWDl2bUluMjdKWTQ2Nm5pYkpSZzF6QlBYb0tlOVFRU25SS2Yw?=
 =?utf-8?B?NVV2UjRBNm5VYlBwamYzVStaUjU4eDJ4MzEzUHNkeHVDNWowZFBwZE5ZcTZv?=
 =?utf-8?B?RzliQ3l4TEdPeTMwbVZEWTIzRUtYdEMvQ0VFM2dhQUJ2UVhjMlJhclhCK25P?=
 =?utf-8?B?TVhLdnZmNWJab0wzTUtBQUl0KzdqaytoU0ZGTVhzMTU4dGl3Um1JYzF6ZFRu?=
 =?utf-8?B?NDdBYU5OcUNCWjVXMGlieW9iQWR6TE1GT2VGdmE5end0OElPbHJQTlZvZFp4?=
 =?utf-8?B?Y21GeUtJK05jUFRHZkpaR3RRRThGOGZRUk9tZkZ2a2o1dXVsUmJid0pEQjYw?=
 =?utf-8?B?QXh6a1BQMm9hUmFaOFRrVWVEMXdqeHdnUFVNZGdtWFpOMmt0bWJka0xycHAz?=
 =?utf-8?B?RmN1aXpyQkpwK2NvMGNwa3JFM250YmNId1JzT1lFbjVZamtEMndBNWNST3BI?=
 =?utf-8?B?YlNBdnEyKzRxdVdRMUJUYU1sNlFJakFvK0YrdDlxcHI3WTU4N3BKL0FtamRG?=
 =?utf-8?B?bGhzbzFSdVVHczNUTXl6Mi94TEpjamVyTVVHeXlFTkRCNVpqWU5WWmJuUFVl?=
 =?utf-8?B?UUJnQlNGeEtEVGp6a0g1a2JPWjVNMmpQblpWZmJwSUJNWGEwVTFnNlRYYzdp?=
 =?utf-8?B?NU5HZGZZbTEzeW9uSmt1aWk4eWxNWldTcjN2RlpyQTE5bFpSOW5IRjVOblI3?=
 =?utf-8?B?Rjd5MkpyaTdCcVFBdDNkS013ZUl0aExtcnplWnFDdi93SVhRN0c4aG43aDVk?=
 =?utf-8?B?VWJYOUxTZVEyUXFMUmdnajZFRk9CZ0phSGg2aEhRQ3I0STkrODZtVHNqRFJR?=
 =?utf-8?Q?GAVgQQBURcb0223fEZ3gjnKBX03Xkurf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnA2c0I1TnIxaDBzVGlCUGpEdFQwazM1UXFmTjZkcDFJdFh6NG04a0NqWDkv?=
 =?utf-8?B?MFhYWFdFaTNDZmk1ajJadUYxbDY3VDArTUNESkI4Rkc4d1o0VGd4YTRzZ0xa?=
 =?utf-8?B?VVMxMXorWXFZR3psL0hldGM3WElwREdKcEdpM05xYW5wMVhvVzdNa1Y0WnN6?=
 =?utf-8?B?QnlnNXZoc1FzMmxzNnBnYUV3bitERHZzeklGMWpRcktRQmhpL3JLSHZYckJN?=
 =?utf-8?B?bFRoa2N2TnpzT2ZnR0dqNEhFTXZjQ3pnY1o4ZmhTYmFnUHdIMVdQUmZQak4y?=
 =?utf-8?B?cDEyTmRpN0JMMzFSSmZQWi84eGRVSmxFRUJiaktTSTllN28vTUNIUGQ1YUlz?=
 =?utf-8?B?b2hHVm41dHoyMFd3WmVXMmFISVA4Tm1pTmI5c2l6cThsQ2hibFAvSExGc1R5?=
 =?utf-8?B?YXdvU0RZZFdNUGV6U0JGcGorczNtMm83SkZTR2c3VlFqdGNXVGFSSDR4UWQ1?=
 =?utf-8?B?aEJtdmUvU0JaSTJycFRQYlk1K0hJdGVZa2FFYTBmMDJxTk1OdjNvcFlBYkxk?=
 =?utf-8?B?QzJVUG1UUHp5cHlMRkRMdkMrZktycHFZTklUZVJmSHZPbW9nSlVSUzN2RkVr?=
 =?utf-8?B?SnpCWDBYVzdQeUVoYXQ4RHJ1dVkzZ1BSRlRkQWd3Ymlsa2s2ZXB6czRHbHZz?=
 =?utf-8?B?ek5KREtJUm9pbTJYN01leFFveFFENDdNTGt0U01HSnlQVUJacURhaWtLUE1C?=
 =?utf-8?B?RlBMWmVaV2V1MDg2NXdnMEZmMkNXaFpocmYxWEJkVDNZeEhpdjh0bEhBd2NS?=
 =?utf-8?B?a2hhdjdvK1ZvOGNaZngzTjk1Z1NaTXB6ZjhLSlNFdlpDWk9OSjRqTSt5Qlo2?=
 =?utf-8?B?Ync2MEJiRVdBQWZNOURRY1JsY1dIQUZGUDlwYmRGOFpxQWFjZ3R5T2hLb01T?=
 =?utf-8?B?VStYOHFKODdaWGtXeERaOFEwODVNaldZRVZmWDc0NmpJNlpvSjNudm0vMUhB?=
 =?utf-8?B?aitDWkJGVzBwWDdSdGJ5cFEyM0diYzlGRFFCOGlic2kzejBzM0hQZENRaXVO?=
 =?utf-8?B?SCtCUDdXblFYSHl5M0VBcDhqQlNWaURjYUJzZmQzWVNRZktDQUdqQmU5bmJ6?=
 =?utf-8?B?YlRWS1pqN1NXWUdyTGZZdzZURjNDMFBpN2JYZHdnWjBHaHg5NjkyUGkxUGlK?=
 =?utf-8?B?SlN5cTFxVWUxSHNvVnp1MDJvenlBQk8yZUJjQktHbWpwSXEvYnZ4d1V1MEov?=
 =?utf-8?B?N0ZmMUFsRWhIa0RCYkVhT2x3MEc3Z3U2RStkSG45Z0YyekIwZHIrSi9GdzFD?=
 =?utf-8?B?eGlOTSt5Z3F5Q0E1L0wzY2lnR1haTHJFaFNON3ZtUjZXbTdiYzQwcW5aK1ZK?=
 =?utf-8?B?Q1FGQ29uOHAweVE4TFNXVndUZUVNaWlIVDg1VkF6RE84VlJSR1VmYUtEd0Jp?=
 =?utf-8?B?UzdZbDNNelFUTm1kV1BFT2phQnNvckxLQlRQTE9sNU5rT0VoVHZrcUhBeURI?=
 =?utf-8?B?VDRFWmZzUVdvMjQ2U240QXFmZi9oS3ZlU2dKbEF1NHJOZ1pNdDVnTTN6RlJm?=
 =?utf-8?B?YzYvQXB4ZGd4ZWxoZXY0a2VXUzFSVkkwUk5iRm10dGdWQ3F3cUhZdDhCa2V1?=
 =?utf-8?B?UkFHV3VBMFkzUngyTy9EN1FkaC9nZVVwVFJZYUYyaEMydlNlTTYwdVlnN1RX?=
 =?utf-8?B?aTJ2QmZBQzV0QlJZT2I1dFZxMWlyNnFub25ZalBnYkVHVU8zR3hGclYzVzdk?=
 =?utf-8?B?Tzl4UklRZ3Bhcjc5UmNDaXRjSEpaVVMwZDBpU1JybGI5QThFMTluOFBDTFlC?=
 =?utf-8?B?RHV6c3dxM082NCtHbWxUcHBmRnV4OTFGMXVSMm5QNHBsQ0VrdXhLbkJ2ZWtu?=
 =?utf-8?B?SU40MUNNSFQyU2UyNWZuZVc2RWgrM2Y2RU9udS9pSjRvVFdhYkhKT0VEbXlw?=
 =?utf-8?B?OTc0Sk13TWU2cWk3K0NKYkU1T2o0LzFtZXNnK29kaDYyRUpEWGREOFRXbHA2?=
 =?utf-8?B?d3ArelgvM3NOK2pFVUticFpjWE5zcEdlRkJMS3RNK3ozSUdiRnlPQXRORnJl?=
 =?utf-8?B?L3JhcEg1WXhKKzVtN3ptZHVzSGRZUkViSVBBczhDY0g1eVRRem5URTdBc3Qr?=
 =?utf-8?B?N0w5OWh2d2YwUi9wcGg1b0gwYmtqRVA3MVZMYlBCTkdmYlNVQVpqczdGazM5?=
 =?utf-8?B?YVZHNDZFVU01d21BZ3dRakQxRENORXpBNStoK2swazNJdEVBVlM5allWZ2VB?=
 =?utf-8?B?czdOUTN6U3AxNDNYRDVtRVBjVmVuVktSVHRvM0lJc0k4VWdrRld6QzhzTGc5?=
 =?utf-8?B?Zjc2aWVLejZQb3VrY2hBTWNCeHFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bbb759-7e87-4e96-9d86-08de204efc2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:47:54.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMokYA82OcKS3o7TDhcJ0pkK0t+de/PLXphU4DGnitr6zjR6wDbtHM+q/tpaJeRBCmuS7KsncUwVqvzVP59F6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8212


On 10/11/2025 07:35, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
> 
> Note, with the changes of v6 to v7 of the patch series adding the driver,
> the content of this include file was moved into the driver file, and the
> include file was dropped from that patch. It was simply missed to adjust
> the section in MAINTAINERS that was newly added with that patch.
> 
> Drop the file entry to this non-existing file accordingly now.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a881629003c..b2b55947efef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18586,7 +18586,6 @@ L:	linux-tegra@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
>   F:	drivers/rtc/rtc-nvidia-vrs10.c
> -F:	include/linux/rtc/rtc-nvidia-vrs10.h
>   
>   NVIDIA WMI EC BACKLIGHT DRIVER
>   M:	Daniel Dadap <ddadap@nvidia.com>


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


