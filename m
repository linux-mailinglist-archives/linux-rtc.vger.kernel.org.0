Return-Path: <linux-rtc+bounces-5912-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP08JXsye2kVCQIAu9opvQ
	(envelope-from <linux-rtc+bounces-5912-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 11:12:11 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C944AE6BA
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 11:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 002F13005983
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jan 2026 10:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF683806B6;
	Thu, 29 Jan 2026 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hsW6YJ8L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4FC3806A7;
	Thu, 29 Jan 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681527; cv=fail; b=N4kWy+IBzEJCzg4lk2L9ynQtdKXEUEDC1AFi7JWd3uBF0OwnXu7Y6sgryVesb0UScq27KVq28DFEzECTOq9z0o8Cj+W0+agqACp4c/2isOh5frVuz1DDPToNgphim5J8aE2wOEUpt7XJzfVKaPMOnPYv0aGgRx/CMw3MExGfhsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681527; c=relaxed/simple;
	bh=E5IIQNWhfrp3agQNd+/JzLugfwvg5meK/JOIjtxHieg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FQhQxYQgB/vhuz48BxAugShJZ8paFW+eeFMn6MHSK5A0ixdQD7ItAk2kULDqUycdnCZtFra78EFtJZTsJPCoGMJGcoAgnFHmuZADKLS9+XP00fn4GvxWFcQ4+r4/kbe9WtWeZzYfkpJ1N6mSN5m43gUfgpeUSwPxX9BUxRIUOGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hsW6YJ8L; arc=fail smtp.client-ip=52.101.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrLBKwMm/lqySFOdr8O5ysYFyyP9yFEk8jfg0A7N5TyLv/sI5CHbDEOmre/F29JBny0tHlkUhrvAda3PGVIQPuy03jOO8HYOa48XQxsI+cxw+V6rL9N1gGwPnGkYT0WqJkoSJ+j5XW5USwpxgkf81UGOEM1y/hToa0YHtnO48fppfZusuzrQP3NROWiEFC5Xafsfkm8Nmuaklbclc9ehI6+ZqVAknvexqsDq/32NWzfh/cNY+QYvHpNEX4n6zQdeK+buSQD5Gghu26OumoSyVSGzHXD7nH21fA55siv1/I9Wb5PklIDYPOQrOgqDCmAALwPMh1I5bt/y/Gbl1JmUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xv2fKMmQbCvesGH3u2qaEBCLS8qz2IgJEc8Z5Xk710=;
 b=OZrYWz+jbE6MFA+Uyd0WQ8sgUT0R2dBSHMhVCt2oR0fSLhqP9FX5v9j3FESRsoR4zgCaCL17gCxJtX1KmuEy16ZoSpSOc77V/1xfFYQcWHkwkc/lpR8l5jS5peQs04n5ssjiKl3jnkzkQBlYDhomfxA+xFm1EkfRAhyKFlrxnxs6Cf8Q9IX+IufslxAMq5tI7S5Uxq6Byozb5pALLRPIN7o3SOp0I8jKhUTLgFTr5CmggCndL0lYk4CtE9NlDZC3Dt8QZer9ceiOMT/fUIWeK/QDygOUXYA1OxNtFFPcTSb1ALSOHRu5ZpV4hnMyOGrAn3FUpE6VSj7TxwjPW+HEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xv2fKMmQbCvesGH3u2qaEBCLS8qz2IgJEc8Z5Xk710=;
 b=hsW6YJ8LhO4JycVrVYLamks4G6JGYHNvVgMTbSnkAg+1XXb0ZOw9bVXl6SX5g7LEwmpyXEGOme+B88aDtXwxnRJ2C1KgWFuPzz0u3+haWfm+dD7q654orWAfQpLSSY7dWphd0kOYDZg7HJo6kLOEjrX96xCeiUpp3cffV+MA7LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Thu, 29 Jan
 2026 10:12:02 +0000
Received: from PH8PR12MB6939.namprd12.prod.outlook.com
 ([fe80::d84:b1d8:bca1:7c3d]) by PH8PR12MB6939.namprd12.prod.outlook.com
 ([fe80::d84:b1d8:bca1:7c3d%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 10:12:01 +0000
Message-ID: <739e70b2-b4d1-457a-9f00-d19766f0ef76@amd.com>
Date: Thu, 29 Jan 2026 11:11:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] rtc: zynqmp: fixes for read and set offset
To: Tomas Melin <tomas.melin@vaisala.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Harini T <harini.t@amd.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0025.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::15) To PH8PR12MB6939.namprd12.prod.outlook.com
 (2603:10b6:510:1be::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6939:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: ce73065d-5606-4d53-fbd6-08de5f1ed83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWg5UmdzcmpwVHhhQ3ZhcXJZdkpVWk8rQnFpVkszbHM1MTFlTStqSm00R3Zr?=
 =?utf-8?B?U1F1SjZrR3FDazdOWVl1MUd3KzBIQThaOXhFWHRFd2k3Tmt0SWgvVGFRVGYy?=
 =?utf-8?B?WXhUYkd5TnIwR1U1eHZhMGl5K3A5eS9WNGhHTklkQ0RpVFRJalU1ZUVZREpR?=
 =?utf-8?B?ZVRYdHB5K1IzdTdPYk5mblZhWXMrc0pIZXZjQVVScVFVcEM5Y2VXQmVjVDc5?=
 =?utf-8?B?U0JDcG1leFRTMzJVYXlMbmRxVWZma3hKdFhEMXZ6VGdJdlNxTnBGR0RrVnBY?=
 =?utf-8?B?UGZXb3YvbGtiem9JVVIremdSUVFWYUhVM0xNZnFNM3puZUlja1ZTZ1Z4VEhD?=
 =?utf-8?B?cTFaMVh2aHNXdHM2UUVwZGZkU0wrekp1dGxXb01nZ0pkK1RoVTBWLzZPcEV5?=
 =?utf-8?B?R1hLd0R4b0kraklNaS9NVUMzZGFPMWUzK2NRTFVJT0ZsZThvSnFqYnVvUklH?=
 =?utf-8?B?ODJpSHp5enlQSFoyRG4wS3hWNEZLRGdSdWpWaDVmRTBZSVdreGw3Rm5QbG5V?=
 =?utf-8?B?TC9CYzZrb1BwVVg2Ymc4QjB5OW5EMGlpcFJlQTNFSDh6aGZRYkhFdzhweFlk?=
 =?utf-8?B?NVRZR1l0M2NFOUJ2ZzZ6ak1vK3g1WXRRYlFvM1ArQzgrTHdFYUovMGdPU3I1?=
 =?utf-8?B?V29TNTFqVkU3ZXFSVDlid2RzeEwycnV3RlpqdFd4WnBMT2tabjlMK1kzeWo0?=
 =?utf-8?B?ZXFKMmxYTzEzWXA3ZkdqbU1xdUtFM2YyRTM2YnlKaHBHNWpaa0E4cWl2WURx?=
 =?utf-8?B?WU1XYmJEcHdoOGVHdVQwdTErK2tNWFg1VGRqa1BPM2lJV3lONlZzaEh5amJM?=
 =?utf-8?B?bDdIZjVyWnZRRW8zWENKZnByNmQvY1Q2c1Noa251cHBWSEw5THFnNVkvdFNo?=
 =?utf-8?B?VHlNSjRGdkR1WEkzeEM3YUhEWDdqVGZSalA0MjBwV2RLMjAwUHg4RWtZeE94?=
 =?utf-8?B?bWpkTTJIVk9lUUNncHRnZDBxRTBGcytCR1hMZC9MSmc3R3hFL3JFNWNtS1pt?=
 =?utf-8?B?M0pMZGpjSEZob1lYcWxYTEV3aGtqb1V6UGlOMW52M0dZT2pVUGFxZXNhMmhF?=
 =?utf-8?B?Zk1ycm9iNHVGaWgveVlOTWZDRS9ScVZKTTI1aXltYmlFdjJicVVQUlFUSkpk?=
 =?utf-8?B?OFVUSTlsZkxIR3F2MktHZ2pYZXpYcE1Fa3BTRUsrS2FSUU5tZTRVdnZBUE1h?=
 =?utf-8?B?R0N2UjNaVHo2ZHhGN1d5WkRpdmg3UXhROU9TNVZmTG5xVW9JT25TbGJnZ01h?=
 =?utf-8?B?YUh4VEU5NTBEL0Z4SGJHd1BtSzlLNTVDL2w1ME9UMnozQTIxWnpDWFhjVnRm?=
 =?utf-8?B?S1hRVzlMSXA0TVdQcXFrR0k5VmM4ZExNZWFZZ0wvRHh2UHJ0bUY0ZS9HZG1q?=
 =?utf-8?B?T2NhcnB2b29OaS9seEhWWVo2QTVWMUtzWXNUTFZZZi9qOU1QYkwrMWNDZlNv?=
 =?utf-8?B?STdBMTNlSWN6WUFzT2ZSbkIwMnBzSllUMXczUmdUd1kwMlAwZ0R4dkpKWmxt?=
 =?utf-8?B?c3lOUkppQTBrdFpVKzRPUmNWYWwvemNZMVUyVElpMDF3NG5HQmFxcXIzcXJE?=
 =?utf-8?B?UGR3WjFLUmtKK0E5S3FqUkcyYlkvN09nMWNlWFA5VUEvSTFNYjhPZ1JNYkNL?=
 =?utf-8?B?bHlUbVVZa2o0MXJPRjhOVzRlOUVKKzFhbEc3NUpobC9OYnZYeEdvY0xvYjNw?=
 =?utf-8?B?alNDMTc1ZmJjY2NnQW40TGduYndVdlJtaThxcWszNS9hRHJRT3h5VXh1L1hI?=
 =?utf-8?B?QkNtSkFTbDVSYVBIb0FSQnZhRUsyaklYSU1mTDVkZWQ4NmhVVitKVVgxNGZC?=
 =?utf-8?B?RWhqWCt2WHY5MGNvTlN3b0p4U0pya0tiTHc2UHRscHZBazZlcW96UjhpaXNu?=
 =?utf-8?B?Ri9VeTkvRVdNSGI3Qmx2STFZMXFwSGlQaGtWMUJPVG80TElNdWFHc1EyOFhL?=
 =?utf-8?B?Q3BNMlA5TFdGRkVZS2NJTFdodCsyVDBsKy8vbEFCZHluYlhlNXF2dEttamQ4?=
 =?utf-8?B?RENpMzdOY2FUVkUvWlhoOElnT2NEK25ReGpGYjVmU0MxWlNmVW9xQjQ2NnhH?=
 =?utf-8?B?N0pnS2w3azlsdndLSCtMM3FjMzdPNDhDWjl1SGphMFF0aDVMZ3Bpd2NyeVVK?=
 =?utf-8?Q?TlDd5B4901IFbGibqM3j7ZdAY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6939.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEY2TDE3TFJGWVc4VUdxcUhEeTg1NVdkdUF3WldzUkhHN3duZ245OG9pcE1j?=
 =?utf-8?B?QXJvWE5hZ2puZUpLbnJSdGRpWHZ6VjNCWE5wa3h4VjQzL01XOEhrcFpuMEdQ?=
 =?utf-8?B?S2VuQ1RUY1dHNmFwbEpBbkMrK3FZcWM1R2FJd1hESmZtYXVLdDVoMGtmODdI?=
 =?utf-8?B?YmZQUW9JQzRUeEJCYVRseDYwQjE0VS9zUFZJYU1MV3FTNGNOZHVzNU94dXN5?=
 =?utf-8?B?QnJHa0N6cjZyMStXU3dNL0Y2d01FbE1IYlIwb3lxUWphUzRqcDk4WVhZVGNt?=
 =?utf-8?B?N2dCWUt4ejNEWlE1NEdHMWNrbDc1TzFBeThIUmZudWQ3bDlzZDRNOFF0aFp2?=
 =?utf-8?B?Y1VER3U3OFlSMDJnemhDQW9QekZpQ0JqcllsaW1PSHcxN1MyMUxZbEFjM1hx?=
 =?utf-8?B?bE5EYWdVNnIxZXFoY1NVQys4VkRFdXdGOURLMDI4bEEyaUtWejNYYVFYLzRZ?=
 =?utf-8?B?clM1ckNVbGhYQ2d0SnF5WUJlRkRKUlRFOVMrTUI3SVFNUjNQMWJyakhvdnVF?=
 =?utf-8?B?ZjNEOUd0K0Z5enFsUmVwZUo2aEhuTjZLZ1pMakIxanBKdnhJeWdKenkvTDRV?=
 =?utf-8?B?a3FuOHcyZCtuWjFQMTJnRTBIY3lqN00rMWxrQU41djVsdmFYdHR0dndUZXBC?=
 =?utf-8?B?Y1dSMGMrRUZFNVpaYjBHVGNCQ3l5aS9yNCtxT3oycE5pVURCNlVlWVB3WWR2?=
 =?utf-8?B?U24xM0NVWTFldmcxMk4wTmtobGJSY1B2ZmZBS05oVUxPNlNQazNFTkdyYUQr?=
 =?utf-8?B?TVF1Rjc0Y2I0V2VFWmk3bGtVTkNjWldOS1I0QzhIUTdVcXJZVlRwM0xTd25X?=
 =?utf-8?B?VkhiY3hpTlAxS2psSjVvN0o0eWVlLzNMdDgzU2RXNFJWcGpSVFNPckNkdHRO?=
 =?utf-8?B?TW1PTkZIeThUcTF5NlAxWXNrNHFXSEdib2dPTFNlckZ6K1pmc25RSW9DTkwy?=
 =?utf-8?B?VVlCUklSaGhlQS9xQXg5ZW1aaTdQT2pqd3liWHBYc1d3N0UrVnFKZ3VCWk1O?=
 =?utf-8?B?bkFEWTRZRlIxWUg4d0ZsOWozb3IvL3k3bWlWTVNhc0YvcWdOWWgyRXlDRjJi?=
 =?utf-8?B?VytKMGorUDEvOXJYYVdhNmdmM2t4L3VIejZMNEdUbmFGYTVZRmF5c0pVWjF1?=
 =?utf-8?B?a0xzTzZHcVFpbEs0aG04RFZNb3N2bUY1NWtXcFBQQldxcDVuTE1JbHZFcDVv?=
 =?utf-8?B?ZHBLdDUwREFVVzFYTnFDUnF1MFdJTjZCR0N0TTRWVEZDS3Y1ZDJycXN6dmt3?=
 =?utf-8?B?eGFFL09ySU1QUm9XdDlnTHNBU3VXc1VZM2FZZmVtY2UzUmcvYkFDN1lFQVo5?=
 =?utf-8?B?M3NuY1VPV1dkbTdaRXdIb2N5T2c1c0YrSE5NM1JJUnFmV1NFOVNxN3ZobHRs?=
 =?utf-8?B?Y2ZuY01lZGx5VnU4cDVSclBWMXNYVzBmS1BxRDVGKzhXUjdOcXhzMWlxQWs5?=
 =?utf-8?B?dTVxdTFyNmlkNnVMWXQ5cmhjUG9KRXNVaUlDZXRRbVlzU1M4WGtMdnJSWFQy?=
 =?utf-8?B?YW1aM2xCcURzUlFDVTRaSSt4N0liUWgxdHo3cmo5M29weGVxN0txaXRRMVRn?=
 =?utf-8?B?c2c2NWlLamJBVkNWZXZKbXhFTkh6V0RTZ2cvUVJpV0F0dEZoUmM3SUtVNVRP?=
 =?utf-8?B?ZEJGUzNWZk5EMm9RVTJPWWpBQUFYU2IvaFpHMVNIdEtuVnRRQWlsaTJDVWN5?=
 =?utf-8?B?QnYwdmZ6OWNKOXIxMmZjTHBFMDZsZC84cVdrMDlBR2E2bUlaMEFhQUtrVmtE?=
 =?utf-8?B?NFFIalRRWHhGRE10OU1uVjZxa1VCYWZPSWdvSHhtdEFieFhlOHI2aXFndk4r?=
 =?utf-8?B?VGVCMVk3aUZ6Uk9IRndvbWJ5ckNhMld6c2JaWHp1R1cvTnJGN0thRTJyMXo2?=
 =?utf-8?B?TlRWSnRJRG4yV290c05RczB5N1g0ZTJOQ2Y0YWFxaGYrQ0tzNVFLZ0orVktr?=
 =?utf-8?B?eGQvVWNLeHk0Y2h5VXdRWCtLbEJXT1RnOUdyNmorNTNtdFZKTDdZTlJ1clJm?=
 =?utf-8?B?b0hSRGhZeDBCbCs2dFlzckxWdzhEaVI2KzFUQWszRU80L2pGQ0ZpUUtyYi9m?=
 =?utf-8?B?NS8vc2h1bWI4U2M5dkVZYllxL2tQa1pnWHRMaVM4Q0ZaekNlQ2VLc3ZSYk9Y?=
 =?utf-8?B?Sk5IS1dsQnVDeitWeTJqdXRRRXBIUnMrR1psRFZtYVlZU1pUaGZzV2Y5SXBt?=
 =?utf-8?B?VXlBT1ozWlg2Yk0rZjFwc1dFREhZdXpXQjUrbU9xcXkzeVQ0elZzSnR3bk91?=
 =?utf-8?B?N2ZFTDNObzFOTWlGMW5Vcy96VUVxN1l0MEdvQUhWV2V6V3hIdHBTazJhcXBu?=
 =?utf-8?B?WHNZQzFYNmQzYUI1cDJyRlQ0SEhEVFd5eW9ja2tNbWdvRGpISWpUdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce73065d-5606-4d53-fbd6-08de5f1ed83a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:12:01.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVs44xmOBDyE4USBtDnBXuH2Bdt8RQDxQqeHH7lrl/whGdl2s2noEuA7BMXRt4lX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5912-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:url,amd.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C944AE6BA
X-Rspamd-Action: no action



On 1/22/26 14:53, Tomas Melin wrote:
> Add improvements for read and set offset functions.
> The basic functionality is still the same, but offset correction values
> are now updated to match with expected.
> 
> The RTC calibration value operates with full ticks,
> and fractional ticks which are a 1/16 of a full tick.
> The 16 lowest bits in the calibration registers are for the full ticks
> and value matches the external oscillator in Hz. Through that,
> the maximum and minimum offset values can be calculated dynamically,
> as they depend on the input frequency used.
> 
> For docs on the calibration register, see
> https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/CALIB_READ-RTC-Register
> 
> Due to rounding errors (different number of fract ticks),
> offset readback will differ slightly depending on
> if the offset is negative or positive. This is however well below the granularity
> provided by the hardware.
> 
> For example
> $ echo 34335 > offset
> $ cat offset
> 34335
> $ echo -34335 > offset
> $ cat offset
> -34326
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
> Changes in v4:
> - Do not limit building to zynqmp arch as building on other platforms
>    might be needed. Implies dropping commit.
> - No need for RTC_PPB to be 64 bit value, use 32 bit instead
> - Link to v3: https://lore.kernel.org/r/20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com
> 
> Changes in v3:
> - Add commit for limiting building of driver to zynqmp arch.
> - Reorder variable declarations in set_offset
> - Link to v2: https://lore.kernel.org/r/20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com
> 
> Changes in v2:
> - Add commit introducing check for calibration value overflow
> - Update comments
> - Align data types across set and read
> - Rename fract_tick as fract_data conforming to data sheet
> - Further improve on set offset calculation logic
> - Link to v1: https://lore.kernel.org/r/20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com
> 
> ---
> Tomas Melin (5):
>        rtc: zynqmp: correct frequency value
>        rtc: zynqmp: check calibration max value
>        rtc: zynqmp: rework read_offset
>        rtc: zynqmp: rework set_offset
>        rtc: zynqmp: use dynamic max and min offset ranges
> 
>   drivers/rtc/rtc-zynqmp.c | 75 ++++++++++++++++++++++++++----------------------
>   1 file changed, 41 insertions(+), 34 deletions(-)
> ---
> base-commit: cd635e33b0113287c94021be53d2a7c61a1614e9
> change-id: 20251201-zynqmp-rtc-updates-d260364cc01b
> 
> Best regards,

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

