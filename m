Return-Path: <linux-rtc+bounces-2352-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D59B3413
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 15:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4FB81F2273B
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE1F1DE2B1;
	Mon, 28 Oct 2024 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="TMNjdtQ2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DD61DDA1B;
	Mon, 28 Oct 2024 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127293; cv=fail; b=iaaTK+ePwWkfEeDLB5U/mly+Zp2iCBdnkIinji1FRYAXMq/z+dztvg0AXJENIgwuLWU3s7cbTFcGiA4JUGAa2QItKG0EUbwU5j2BYHiU/2irTuYWjGQ4dJBeLqHxgON6kvtADYGn6QG1D3PZnrtp/OllD4TTWhN1dr+wa68L1tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127293; c=relaxed/simple;
	bh=+tqpwiIu5qjdc8gQnBCY3PEUcf7rUA9+E3VS/z9dzIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZIKskl9hXTjfnhrzyMZhqC4RJnuWy+isaa79554OnX4FThkqTAo3PTdwiAdA40W3abHAt/aBK+uGbXOUb6NYivNlUR1uxCs5/Tr9GIUVo/yEr1xT/rOni2uR74ctHvnJtdWDYFVMfae4PaKuxHY8GrMB5srK1n4tJWGHBtREK+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=TMNjdtQ2; arc=fail smtp.client-ip=40.107.20.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylOvvg2bAHsHp20zWuLzkV5lhf646M5PYR5gc1CPPMaeVQp4HviOvH+syT46xkReOuz424Y/NmkM3inVQOWtTP93YmH9nbxOwF9UgghSwxnlUS2SZZMKNvFfPjAMVxFGmZLLB1FrUO2TWTf0m7/TNJgpcV2pVF7iqcbDH3MwrS7qys2y8OgrRCYujYeQaM6NLjNOGsmCklpsu+Sh+n93+IB2vanuUnO6H7KReTd1+iQhp8fp9ZOQtViiwEtehOs6qOVraWSDsJEkNGT0RDnrA3+eHVD+BJk5HbRm505sDcbm6DNeqAjmzacYw1E0SSqT+00B/VNzpRLQX3Mo2DyrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmcCMJT6yLxVPwe1FvDRJ9vm8Yhc2Qfa5iILgBiv7go=;
 b=Nu7N2FFSVfC92UcLqfufXBTbCd+/KZq4jPVrUi1ZixMMeHYkyetjk9CkekNIgL95pBSxrXRDhFMcKt5fEUMgLSgbR08nt5a2SQ5B1KcFufTevDm2FU/O3EZUM7kDOTE3jTm0TwcAOo4SNJD5SN9SFA5sxiQiJhqw2/LynPs5KW4VanQdtPHTdoYO1p2IFF8rUuuo8/LFKeLX6qc8IhAcfzStOskru3jx/v5j0xQ1mic6GGXXfpHEja/QH+H7PdKbgrkmpF/sPNPsVZhAZH08vp01ivwfVEl5+ldE+LFDS9C5dabfOqfiZ++TRPyaZXTNHzg3r3fv92+K5RGRKrQG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmcCMJT6yLxVPwe1FvDRJ9vm8Yhc2Qfa5iILgBiv7go=;
 b=TMNjdtQ27xAJ9Gh2dIRRYKPfYGBB39jdIY7w4ZUAylU95fesWlsz3SvSUyG5N3qCN1ON0yoXzu7P0aBoly1eV+ci6irfj8zib2pi9FjcRFxzDFCY5EFqsw+x/AY90uSK+WfmXyBmMjLFngvhGxP2XMTFvem3Oeu9VpckZUGKD0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by DBAP193MB0970.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:54:45 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 14:54:45 +0000
Message-ID: <b8c28db1-11b2-498d-a2d8-0302c7081251@kunbus.com>
Date: Mon, 28 Oct 2024 15:54:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
 <20241022-radiator-blemish-3819dd4d94e0@spud>
 <36f46d44-8852-4988-9ff9-5b8bf49e2aa8@kunbus.com>
 <pj3tgtsdsjsqqznxgzzmxrcozibqie6ubtythou7t23tfgde5w@t6nwxob4rjah>
Content-Language: en-US
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
In-Reply-To: <pj3tgtsdsjsqqznxgzzmxrcozibqie6ubtythou7t23tfgde5w@t6nwxob4rjah>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|DBAP193MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: ce604c3a-e02d-4706-81fa-08dcf7607627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVlwMjJlU1VPV1NBWmtZdGpPUWFZaUlSeExCSFczSEdsNUE0a1hKMVNtN0wv?=
 =?utf-8?B?ZG9JNzZ4N2lTMlZMMFhCaU5GdkhqYjdENjBLME54TTdOc3ZCcUtKREFocXRH?=
 =?utf-8?B?QUFYSUgrNGJEZy8wVXJ3NFNJdXQ2ckR3MW8rTC9QZzVrVXIxUWhIOXAwTmZO?=
 =?utf-8?B?RGZHS09lY0owVVJTSGcrU05Tci9kN1RldWhWcGh4RzNBTlFDRm1uMm5ERERE?=
 =?utf-8?B?WjBCaTBFYWF3T0dVMTRoUTgxUzlTejZNc0lxYXVRV1B2dVFXRG1YSENmU0ZS?=
 =?utf-8?B?QmFxVDFSUkNzNTR6R0gxc2VxRG9BTE5QRWdXbk05WFZXUXdZa2hTdmFPanN5?=
 =?utf-8?B?YkpxQTdvTnh2REZHblR3RlJobEpwTEgzMWowQzdoMnBuZmhMazg4TzNDMTNm?=
 =?utf-8?B?YkRpWS96WUFjUm0rMnR4MlFPdlZOUFdycEdubExReWx5VUk5eUlUYUo2Z0NQ?=
 =?utf-8?B?ODExa0tWL29aYUVCQitHZFNCa0dLLzFLbitkUm9IUTV2ZXI5aXpVbVBHeDgr?=
 =?utf-8?B?UkxDemZEVEpYbk1tZEphVGhxUDByL1RoSEY3Ry85VnpQUEpxeEVsd2JobGdo?=
 =?utf-8?B?dHQ0ajEwTmgzV21KTlA1RFJYQmZNUGtrbyt6c3Y3eTNaSjdMZFFEYXRJUVlm?=
 =?utf-8?B?WWN2L3FRdjJqUHk3TXdRZFlsQ0d0TmdjZU0vbGNFdTNGTjcySWl4ckRVVTh4?=
 =?utf-8?B?aEMxanA4WjU3ditNMzBTUVQ0YmFaUk8vcndrQURKV1dwU1hxV0x4RHJxZ21t?=
 =?utf-8?B?RlEvUzU4SnpXenZFclprcll0em05YlhHZTF5Z2NKUTRGTk9RMjFQYS9LM253?=
 =?utf-8?B?UFBBQUVMNk5WZGQyWGFUVHM3dUgybVdoRkdRSUlZNHU0bVhyYlBka3dDM0l0?=
 =?utf-8?B?QVA0SFU0bUQxSDBTdHFUbDlZLzh0a1BGeUlybmd3VGhzM3ZIekJKVnp5N2ll?=
 =?utf-8?B?SnZnR3VZWWJOblBNUm1QT00wTnlyWFVDbGZTZzE4Q0Rtd2dsVnFsa2hiY1pW?=
 =?utf-8?B?aVVQcEtBNTlXY3RZcmQ2UnBacXg5VVRxdTBWVFN3ZE5rQ3k0VDBOMGxMeW9i?=
 =?utf-8?B?Vk4vTy9IMXVrc1owbVZtc3dQbTNqU3pFc0FxOHNDNVY3Qms2ankrNTFnSmZX?=
 =?utf-8?B?OGJyK3FRUG9ORFpSM2g1V2VHRHBwdHRrZkp3K0xaY1lZSW56SE1TRFJaVzlT?=
 =?utf-8?B?VFk1T1d5bmx5MDJ1enpjVC9sU3RPVmZtVVJFNHQzUFY2VFFUSDdmeXFEZEZm?=
 =?utf-8?B?Z0hGRVNRNkZWOGo0VVhSejVvQTlmUHIzbDVtakJpL255NjA3anZZVmhsSG9F?=
 =?utf-8?B?VU9sK0p3dm90YXFBMFdlcWI0ZjEwdmR5UERLVXJxT0N3THRmdWlab21aU2NO?=
 =?utf-8?B?aVkvU3NXYXQrLy84dzdINnRLS2RhdFFvRXdSdkg3b0ptYnNJTmo1UjQyc0lI?=
 =?utf-8?B?M3c1T2NCc0JVNG1UUFNaTFNoZUtrdnpMbS9IM1g2UGdHOXN1eG1WUFNBQzdC?=
 =?utf-8?B?UTZGYWFaL2UzR0JzdS9RYldLRGJTeVRnVk5VcS9XczFqTXVUTElpVHhlcVZQ?=
 =?utf-8?B?TWI5eUp4TGY5K2NsUHE2ckxNaVQ0eHZOeW1xMkxBSE54RTNvTG95MEpJamRj?=
 =?utf-8?B?OVBaZUJraDVrdStiZ0JRSVlZWnlmS1RseHRqVC82RDNQZnNmWU9GakJMQ3ZE?=
 =?utf-8?B?R3BqaFRNR25mYXpJZ3AwZnhoZzZzeGhzdk1ycktYbGhsYXhTc0p0OWpjRGZN?=
 =?utf-8?Q?RP41BPLdoNQ1R3qyaOSf7gyZN8DNbLTFD9xA/5w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5vMXk2UlBrdlBncy9kMTJ4V2dvNUpmVjdTQzR6WUNHTDYyKy9xK1lnT1Vr?=
 =?utf-8?B?NitRRGJ6bmZqVWVTVWhZTnNaNVlnQWVqY2VrL3dFYUlQSHdub1N5dkpzY3E5?=
 =?utf-8?B?aFljTWFKZUxNRm9DVHpMS1ZpdS9BQ3JrMndGeEMvL3UybEN6aVllN2xURWFG?=
 =?utf-8?B?Qy9jdVY5ZHhtNkY3dDJES3N1WHhqTllnTlpndVVPYlBmQ0Q2NjgwMWRuVDJm?=
 =?utf-8?B?VkNNY1ZHOS9jNjFqKzNaWXJtT0NLRnBBb0pUMVk1SHVUbFRyOFhsVldNM1VC?=
 =?utf-8?B?QTZhVzd3cFhpYlFOZmJKc2dWMFlVVm0zYjJHWUF5VS9vWlRva2NSVEhlSDU0?=
 =?utf-8?B?VngxTVRJSTg5OWJKU2V3Yk5QMk9hRWdWV2h0c0tZbzBNb0VHZGE5eHBoRko4?=
 =?utf-8?B?RGVNMFBwdmpCL2xveEExTVBrcE1KbER3T2FqMjNlLzVoWEF5aUVoN0NWNk01?=
 =?utf-8?B?czR3V2s4MnhIemE3aUk2MFpZQTdpdHFVWlBDT1NvOTFUeitsVUpjOGkvbUlU?=
 =?utf-8?B?dkR1MDlLY0laazlJMzNHRzZESFloNG1qaXpDbVp3Y2pDRUtEQ014dWM5QSs4?=
 =?utf-8?B?TG41ejlxb3Y3Q3h4VG1qczVlOXZEV2RQZ3hlS2lOVlpra2dlcVdYUDlyTWUz?=
 =?utf-8?B?a1ZxNHhva2JDZVUwZlBGMlNPM2hFUzEyTDRZZFQwK3FFRDV6c3hBdkV3cmFJ?=
 =?utf-8?B?aHpWZ3RzSFExSHN4Lzl6WHNzZ3F3N1EwRGZjdUFHakNqWll6d2ZZUWw3Q21w?=
 =?utf-8?B?L2ZZemw5cjc3UFBDeHRPMkN5NjVyYTBxRUdCVWkvYUtTZWZGRUxWaFhCSWFq?=
 =?utf-8?B?WWx1Q2gwYWtFbldpM3haTnVhWUs2RVJHYk1lcXEzY1loODFWRmFtc2VIZHI0?=
 =?utf-8?B?bXE5TndVMzZGSXM3bW8vUEwrcHVGL05aMGhTbW1sbjNqRjZldWpML3FtWHNK?=
 =?utf-8?B?NzBxVU51T1QyTHZpNGthWHN5UTl2aTQrOHZGNWdCeExudURTaEJJVExURmdx?=
 =?utf-8?B?TEtQeEF2ZWFWc1paNUFOUFprYXFCbHVzczdSMGJ2QXhOUnF5Tm1FUFBrYW9I?=
 =?utf-8?B?KzZXQTloaDBCdTRieXhRY1VUazZmL3NzZnNtNlAyYk9MMzJqNWJZWVFCRng3?=
 =?utf-8?B?MVNiV3NpZFI0cEUrR3dkSWxYU3JCSVgxamFsMjNDbG9EMHNEOXE0anNLdWtL?=
 =?utf-8?B?c2tGcHZNcEUvVTBlMjVmeGlOcHk5NVRuejYzRlpIa0VlOEhYVDBsRnZ1VFZ6?=
 =?utf-8?B?ZTI4dlkyWjVBQm9HUnpoZkgvenI2Z09ReHB1YjJaQWgzNEdYcFp0amNWSUZu?=
 =?utf-8?B?QVF4WlBTNjdoRGxVU3MzR0luS25tczczNG5MRDVNVXlkV0tFMnIyelRuQXNW?=
 =?utf-8?B?NHFWR1IwZUF4dE5jaGVKZWFmUDhORFd4RG9lRVhJTFdlaUpmVERCV2xtNkJw?=
 =?utf-8?B?NEw3ZWltamlyR25Dd0hya3pDck80Q0FWaGdMNlM2b0lFZDAwVTRaM3hjaFVr?=
 =?utf-8?B?S21hQk04dlFYN1grL0FNV3ZiQ0VPT2V6SlpSaVNLUkx6K09neVpJZmRSTFVa?=
 =?utf-8?B?L2Y2dE1SNGlrckFlN1lHM1JoN1dZL3ZSNjd4eUlER3RRbTljV0NQVk9nT0hW?=
 =?utf-8?B?U2VNZUxvUGg1NUh2RjFOOTIvWXZPdkZXWTU4OStxODBVWWRITUV3MlJkdDBX?=
 =?utf-8?B?WDdpbStvRmZDYkMxeDFpcWQzOTd1QUI4a2ZueTVVaXdIdno0VVRqOVp0Z0ZZ?=
 =?utf-8?B?b1YrODAzYnZvdlZhazQ4QkpidTdTUVMrU2tRNmtyNFJ5dUo1azVBMDI3LzA4?=
 =?utf-8?B?dU84eGtIcllLWjRBUndXak90MHBHWUc5SVhEaDNKbWdBMGo3YzdjUkJPUnY5?=
 =?utf-8?B?TEFDZkRiUURNbmpTdFVJVUNyek5Qa1M3Nzg3K2pHVTM1czJNUmIxN2ZTVkxk?=
 =?utf-8?B?K0dQODJsUFdVMjhuelRRU2lISGM5U0tVRVVnRDZGSXhWbXZGMlVNeTlIbnNm?=
 =?utf-8?B?ZS9nL3pkSDdwdXE2ZVZSMmdTOXpzM3krN3lvcmwvNTRKZC96Ny81V3Q5amdq?=
 =?utf-8?B?c0NQZVpCVGFQUWZoZ1NJSXJwRHJpbkxmQWw4VnA5bkxtNWFueTNtbjVLS3NB?=
 =?utf-8?B?ei9mZUJId2dPWEt5ZTQxOHF3d2hXUG05QjR1RHZLY2FTdWRLaWtLMjEvTkpI?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce604c3a-e02d-4706-81fa-08dcf7607627
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:54:45.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnnCjoqQkGBB8leYiVhj6ghyvjErlFNv6pvwhCoMGbr68SW1lU7Tj+pSQYmfk3SZ0KbtRHU+RF3bnH0lrdHutn9FBxRuLsBKVsbjMJaFxCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0970

On 24.10.24 09:25, Krzysztof Kozlowski wrote:
> On Thu, Oct 24, 2024 at 09:11:04AM +0200, Philipp Rosenberger wrote:
>> On 22.10.24 18:35, Conor Dooley wrote:
>>> On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
>>>> The nxp,battery-switch-over property is used to control the switch-over,
>>>> battery low detection and extra power fail detection functions.
>>>>
>>>> The PCF2131 has a different default value for the PWRMNG bits. It is set
>>>> to 0x7: battery switch-over function is disabled, only one power supply
>>>> (VDD); battery low detection function is disabled.
>>>> This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
>>>> With the nxp,battery-switch-over the behavior can be controlled through
>>>> the device tree.
>>>>
>>>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>> index 2d9fe5a75b06..5739c3e371e7 100644
>>>> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>> @@ -30,6 +30,16 @@ properties:
>>>>      reset-source: true
>>>> +  nxp,battery-switch-over:
>>>> +    description:
>>>> +      Battery and power related configuration. This property is used to set the
>>>> +      PWRMNG bits of the Control_3 register to control the battery switch-over,
>>>> +      battery low detection and extra power fail detection functions.
>>>> +      The actual supported functions depend on the device capabilities.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>> +    minimum: 0
>>>> +    maximum: 7
>>>
>>> Beyond the fact that I dislike register-content properties like this, where
>>> it is not possible to grok the meaning by reading the property, what
>>
>> Yes, I'm not satisfied with this solution myself.
>> There are three different functions, which can be configured in the
>> register:
>> - battery switch-over mode: standard; direct; disabled
>> - battery low detection: enabled; disabled
>> - extra power fail detection: enabled; disabled
>>
>> I'm not sure what a proper way is to implement this in the devicetree.
>>
>>> even makes this suitable for DT in the first place? Reading the commit
>>> message this sounds like software policy, and that different users of
>>> the same board might want to configure these register bits in different
>>> ways.
>>
>> It is less a software policy, but a configuration how the hardware is
>> implemented. If the device has no battery, it is possible to disable the
>> battery switch-over function. In this case the V_BAT must be connected to
>> ground.
> 
> monitored-battery property already tells you this.

If I understand this correctly, the monitored-battery property is meant 
for rechargeable batteries, not for a simple button cell to back up an RTC.

> 
>> If a battery is connected, the battery switchover will only work if the
>> battery switch-over function is in standard mode or direct switching mode.
>> Until now the driver has just ignored the PWRMNG bits. As the default was
>> battery switching in standard mode. Thus all use cases worked good enough.
>> Battery switching was working if a battery was connected. If no battery was
>> connected it did no real harm (the rtc may have used a tiny bit more power
>> then needed, I guess).
> 
> Why driver cannot use standard mode always? Or other way?

This would overwrite any configuration set by a bootloader/firmware. For 
the older chips (pre PCF2131) this was no problem. As the reset default, 
was "battery switch-over in standard mode". The driver just left the 
whole battery switch-over configuration untouched.
If we decide to change the battery switch-over configuration 
unconditionally, this could overwrite any third-party configuration.

>> With the new PCF2131 the default has changed to battery switch-over
>> disabled. Now even with a battery attached, the rtc will lose time after a
>> power cycle.
>> I guess I should describe this better in the commit message.
> 
> In any case this is pcf2131 related, right? So compatible implies it.

The reason, why this property is necessary for our devices is the new 
PCF2131. But the function is not limited to this device.

I’m considering simplifying this to just a property that informs the 
driver that a backup battery is available. If the property is available, 
the driver will enable the battery switch-over function; otherwise, it 
will not touch the configuration.

Best regards,
Philipp

