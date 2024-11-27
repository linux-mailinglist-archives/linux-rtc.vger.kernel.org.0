Return-Path: <linux-rtc+bounces-2636-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E79DA826
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 13:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85082B211CA
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 12:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2111FCD04;
	Wed, 27 Nov 2024 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="C4+zW4yF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2091.outbound.protection.outlook.com [40.107.21.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AE4315D;
	Wed, 27 Nov 2024 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712293; cv=fail; b=tmmIi1o0MIK2ZclrjXriI9f5z2vfrxq4aUb4kUiNi9isyWmX5tvUH0NYTwgrcnW37DykYGXwc1woR+GUrsWXaxIaXPC6S/kLr3dRmC7xdt/f+17pwEJT9tDgnsutjjmdbn4p5jP9NG51t52kiPjBQwi9B6MEauPpB3UCyn8oN2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712293; c=relaxed/simple;
	bh=Csyub6NFECGEV9C0z7QDU8CaOlcL/3wmzb3UWQfMm+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XDFz4tUHviMRYdXEUOmwGvnpOwfVSJfQKObtP8PUw3eJAuf/y1XjsCct1val8HvkY9hzdQgKI3o/zXFP4XMnq4w19HNaoZHwvfUr5ZxrrsMv4MExLBQVH0uF6KZnSRgeHcayCGsMa3BgnGYWJLn2MQOkV5g/2Fy8II2yIpccWSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=C4+zW4yF; arc=fail smtp.client-ip=40.107.21.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5sZsURHDgdjVzgKLqk4vt6dFa1SGIQ2qtb4EybWouFa1vZuYSXzZFpzrIiGB5zFxz+x5pdFbVgCzvsEuO3SpT5yzgy1yLbITD/AgOji3bsdFYk3/2gy5Bq6F7c7cjPdw+G4vbiyeX/xwtrRghl9jRAaOrwtNDkIlw4Mnp/CVtbWsjm1OGwo15EdxcF8AgSsguXF0LkXUa9DPUwS1A3ZMgIkyWKcushYsevdD32ue/qDq8hUS+mDWZO+V85ppYnvr1Rm9ktTwryebFhMFBEGHbvLYSRB2RLV5mENiNOGF+/B23WshqcFkx3OHAijTrJMvW0BB4MBtOe6qoRi7CGyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ignPMACOq9scZ5QOhBDbso7PUV/n/d7FjRLlzhmyUNw=;
 b=xR+mjNjF+GtG98sCSiTXSDaf0nyPQd6GSf9rwGzWPD8nHskJ6e/COZhpFR7+9WYQLCgII+xkykXxwkdDdfVC1xes5tDxJ6E+3cbp2TuvZ2iXuyZtFL/FNs8s2K6pmbPjviooBB6DHXcxyOA2ayvtPxCAjs0LLK1VQelapEUkdy7hElgpBU5+g8U0zHLZzZdMFhuOpGOsM8AIxsVQgLiSB1tdykIgK+9nfayXYIX7yQ76udJXA8PNtsMtIdkv79JWuslHu8d+0GasGNcTz7tIjOGrN+6nORQ1tA2RDjPm2aoni79kOPmA8AzYBUdaxQ0I/m3dFa0zqvRaH/qIklTa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ignPMACOq9scZ5QOhBDbso7PUV/n/d7FjRLlzhmyUNw=;
 b=C4+zW4yFd+12UqBPQJR4/yhMeCIO8jLNbAbeFaJytNqCFtKxI8lLBaYtap2K2JscDtkjVpBM1mLzGK3EAseJoJjBLOsqsF4ksA1SCl2npXtDRxhd+gXQyYJIu/1wFCjMnCnXytVQO8KxS+bHWvZ2Dcm3LmcNncGU/v7+au6kwYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by PAXP193MB2361.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:22f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 12:58:07 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%2]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 12:58:07 +0000
Message-ID: <b1271a91-a2f6-4f06-9b3d-c8b32bd6bf2c@kunbus.com>
Date: Wed, 27 Nov 2024 13:58:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] rtc: pcf2127: make battery switch-over
 configurable
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <t.boehler@kunbus.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
 <20241114085153e4e23a7f@mail.local>
Content-Language: en-US
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
In-Reply-To: <20241114085153e4e23a7f@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|PAXP193MB2361:EE_
X-MS-Office365-Filtering-Correlation-Id: a8874814-565c-4480-3c5c-08dd0ee32367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0JlSG5JSVFXOHcxaDNURkxUdnJrYkxDNGxMcUxqbzhuUTJ1Z2tUNjdLeGNp?=
 =?utf-8?B?YUFPSERJVkhRVXo4VHRvbnZvck1ZZWpkaFFvRG1iMGNpdlZxeWxRYTZrU1pS?=
 =?utf-8?B?OXVieFBmTW1XODE3ZGhmZ2UwRVI5MnNaZVpvOUd1UTQ1bHkzQ0FXdXh4Wk1W?=
 =?utf-8?B?UGgwbXVvMmNYT0pMNXFzYUd5SGoyeXhtNkdCbzFUMkNIQ1NLQ3FBTUoydnJZ?=
 =?utf-8?B?TmxQY1FDM1NhWmU1UkZuUU5UL054ZTBSZXNVZVUyUUQ1djZsV294SXZmYnpv?=
 =?utf-8?B?eElrOGFnMjN4dTI2b0FIODBsWmc3bGhFOHkyQVhiZmNQeHVpV1JFTFA0a1ls?=
 =?utf-8?B?TlJTMGZkSGh5MHNKT1d5eXlubjBXV3BxUTd4S1plV1BuZnFqczBHeDZick9y?=
 =?utf-8?B?bFQvczVTajRQTTltUlAzRzZ6Y0svUlNKekR4WWlnbnZ1WTRPYy8vQitEOG1Z?=
 =?utf-8?B?T0daU3B6MDBvclFsZjlkUXNSV2pkOFJWSkFpRmxJRnNlV0lyRC9oWmVUQ2J6?=
 =?utf-8?B?YW5sZmZiTWFUWEpkK0pEQkNoM0dXVnRVRkN4V0dlVDQ2ekNKbXRZYk0vb1hi?=
 =?utf-8?B?NmV1VmJjSEkvYW43OXZaSjZLdlFlZXRNQi9XSnlUanNUVDhyaDZpL3BFSTdk?=
 =?utf-8?B?V0FnbzhHNG5RVzFwV3FrM2NKcGJDbE5oemt0WEo1eUF6MzNFaGVqZisrM2g5?=
 =?utf-8?B?UDRVVENqY00rU1U3TWx4MWl6NXR1cGNid1JwcmNkd0NXbUVuMHZkMkJFL3dr?=
 =?utf-8?B?WmNFWEJrcmxkNXlNWDVBTHBRWm45TzF5WGN4bE96L3U4eGdXcHA0YXRVd0Qv?=
 =?utf-8?B?cklROC9JZC9qQTZnQ3pyT2lWZ3pvNUxmcmJrdjRSTEdpeVhPWUMvaXJpSEJj?=
 =?utf-8?B?bGh6c1h4L1FTU0xyUEsyV2NwQ09neU5oTlFGcmsxa21JUmpZbnF3QkFtenpI?=
 =?utf-8?B?MElOOG1teDR5MUpxWUVDUDQxSldTTkZ0WkFJN0VjbERZUEg2RnVEdExNODJx?=
 =?utf-8?B?czIzVUJTMjZFcSt4NTBKaVMvdDQ4Tzd3UThycGxsMXVDdU85Syt3eWJhakkr?=
 =?utf-8?B?S1ZFei8zNVl0TTNhTTVpWWlycTI1YkxFQTJ3aWM0TDR2ZFowckp2Zy9xLzdS?=
 =?utf-8?B?ZjlDTGUxME1sRDlaRzJITkxrWUg1RU5XZWczWGNzd2VUZEdhSGJsTTViZTZ0?=
 =?utf-8?B?V0dwRkdzNmhmdW56SnBIeHdna1lmbWVUUi9VbitrL2dwZXBMbkVZNFE2WHFU?=
 =?utf-8?B?OTlGeHVIb2RZcnV4elpJZmw0d0JPUjByRUNEMi9xNFd4cWZSdkQzbkFDdFBH?=
 =?utf-8?B?QXFKdUsxYlNqTHpOVjhTaDIzdFYvYWJ0ak9WYTRuVHZ6aWZMQkl2aDJGUGhj?=
 =?utf-8?B?NW9jZlp2R3pSazk5OUJrZ3JCODVqSWxvUGx2NTdRUmNGcHZFUXpreG1BcG5w?=
 =?utf-8?B?eHNtZmNTMUluUVJiUjhBRW42dXhKanl1WE9wQzh6UENiQkNUU3ZFMGROd0JY?=
 =?utf-8?B?UXBFK1FRWWs2dVF4bXVURWdCMExmMHlCRDJ4bVdjSGFkM2RSUXBHdlRKdzVU?=
 =?utf-8?B?cTBaRXdGSjlHQ1lYQkQrNFB3Yi9rem4zblZ1c00vRUZHeVlEekxkaHNWNy9J?=
 =?utf-8?B?VldkY28vVmNBQzd0RUVjM2xIakw4UmVHbm5CdDFsRW1mcnVtaEdlTmlwQW8w?=
 =?utf-8?B?azRuQUpkM3M3OUFoM3J5QUtncC8rMm5VVUl3ZEFwTHhPRXE2MlFPSFZETStT?=
 =?utf-8?Q?aJVlp0eWhgGI1o1Sws=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0wrNk03cGxqakgvWVhYWXJSRGQrTW9HRUorSE82THVRbm5KUlM1TnJkbVVS?=
 =?utf-8?B?VVIyMjJEblFiOUlYS25RVjFTRmRCS2Y0ZllWeUhQNmY2RFB0TDYyVzY3c0Fa?=
 =?utf-8?B?a3NITHR2WXMzWHVlZXhoNTVhemhNVW1tOUt1dCtVOEMwMU83TTJ3VHk0d25N?=
 =?utf-8?B?Nm1lMElqNzd5ZFFIV1l2eElSNHp1dFZZVHkyWDUwUUVuQkpYRncyRUxTY1N5?=
 =?utf-8?B?RUJQWFZCYWc1c0dVOXZhcHRwVHROS3pIb3IxUDA3aElJSFZjcUhsTzZ4VDFE?=
 =?utf-8?B?Y1FkM1VRMldFeEFOd045SmVoZjlyTjZQL3J2Nm5kY1dmcDhLdG0xVm51TW0x?=
 =?utf-8?B?eDhXZWRsTWJodTFGblhNaWpjZFpRaFh1MkxaRTBjMWpkZm1nRnlVbFVHL0po?=
 =?utf-8?B?SERlUHZRc2tZcXNaUCthRG9wbFg3UmFOdi93a2J6M01zUzFseC95NFJQQlhJ?=
 =?utf-8?B?WkhMamlmZGZOeTBBcEFETEdNWXFLa09rN2N4QTdOeFlneXk5dEpRMUpQSkta?=
 =?utf-8?B?cjk5T1Q3T3l6U0RIOHdMNTFiMm1nTXc4aHlGRXhyV05Bc1B3WWoyelQ3aDNw?=
 =?utf-8?B?VXl1RGpxSXhRN1h0dDVLVTc5T3lWRlErVDdkeTE4SWRkeEpvYVRGR2hxeEkr?=
 =?utf-8?B?dk5IVk9IVll2eGZJbzMrV3crZm5wZUlkaGdZUUIyY0lhcUZYbTdnQ2hRcWN6?=
 =?utf-8?B?dkdDTGhMM1FBaHZ0aEFUQnlmWUNUOEE3L29oaXE1amJnVFNleDJ1T2JKcmhT?=
 =?utf-8?B?d010eDNoYVdYMjVkRHZyZFBMTEd4OWd6VTRCOUlYRGVkYXVmUloxVnJnQVI3?=
 =?utf-8?B?WTVSS0p2RTFFN1dObEpqTlB4WThuUE5wWkNUMGF4bHdFYmVLMGZhekZlb0VT?=
 =?utf-8?B?eU1oNzJKT3dtWkJ4M1FjejNJbzVCWWE4aUlrQXhjTDlsdElmbGhUcFFPb2d1?=
 =?utf-8?B?bTFQY2dNZXZIVXdoc25DOUNna1dqemY1aCtGaEJIdnlLQjZaTnEzNE5UWE5P?=
 =?utf-8?B?YzZWRGY3UFphZTB2ekVpVGVzcmR0M0Y3NVpHSkIrclVaSGcySWlvU2g4eUVx?=
 =?utf-8?B?SDBhMkd2eCtNbzJ2OTEveU8yWXFvV1ZCY0pqc09GaDhLMlJCVnQ4c3FxREo5?=
 =?utf-8?B?YmczcWhWTW1TeCttU1o1YU1Ccm9kRnM0OExab1hycWJ3cWxaVXpGQ0JsclNR?=
 =?utf-8?B?aER0enZiZnphSVB1anZoOGtaV3pvRm1ObGdhNnFSUFN0WVZmZXczV2x0ZGl4?=
 =?utf-8?B?TTBncWdJbXdIK3BHMnorNkhIK040ZkxIMlBNeWNHV1ZoQTRMWmdaaHNsbGxU?=
 =?utf-8?B?TmhzRHZJaVF4TzRtQ0gvZnFvcVpuUncwdnNFNWozajVIaGF3NHZvREErSnN4?=
 =?utf-8?B?Z1Q4cFRWNnROMUVYTlNING01US9KUmx0SzAwK2RkRW9CSFNVMGE5aXFNQTZ4?=
 =?utf-8?B?YVZhWTZsN0NncVR1ZTFPblRSYkVWTTllb1JYVVJCaG55VlFVR2dEVzlxNnBN?=
 =?utf-8?B?S3FjbXh6Z3VSajJ4RTFNNnVmRXlKamRYQVBWN0JjSkM1b1FGMWZGcldoZVV2?=
 =?utf-8?B?VWZVdG44ays0U3VXdzNOVnN1MzNXUFdCRElEYmIvYnM1VHJDTW5Ra3Y3SE5Z?=
 =?utf-8?B?Z2tkNG9tNXRyT25TNTJOa1d6a29pNk51eTUzajNZK0JJNUdPaEZJcllHNTYx?=
 =?utf-8?B?eDhzamlidXBIWkRkQ1lxUWY4M25PR0hnYnFiei91ZmhwNnl0S3llRVRpTXVl?=
 =?utf-8?B?TU96MkdDMlhhT0tHZndPVzBHSUNBbVdzN05GRTY2TDBBZmtmYUkyQU1sVmNs?=
 =?utf-8?B?YWF3N2lRalpEcDJCcDFXUm1RNTFrQXFtZ0xhZFg0dkJabitKVjJjV1lka2dq?=
 =?utf-8?B?eER4OEVYOXU3akNoazlkU2c5aVIwU3Awb3Rwcm1nbUozbWR2MTcvcytCc2w4?=
 =?utf-8?B?bXdDb3paUE5DMmxDajRYd1VRcENReE8zRm1lNk1OZ2E1MlpxUWFjbXR5TXc1?=
 =?utf-8?B?dUVLSDVMVHFDV04xUDBZaUJYL2RIb0dGRWRaSEVDS0d3OWVIZGlPSnpzUkE4?=
 =?utf-8?B?Qi9XZ2tEbXZSVjYvdkZkbncxZXNuYTkyWnVaMDN3WW53N3BTU2ZtZjkybis5?=
 =?utf-8?B?SW1NMWEvU0dMREVhblU5M2F4T2dscXNOUGdHTWs3alNOckxZUGR5MnJtUkpo?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8874814-565c-4480-3c5c-08dd0ee32367
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:58:07.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW/XALK6VWhIPUM6GkjQzNYJ/TzVOeE8NZHB7gVOqvwDI6JhXaPBILsdl7kCqkbgdBPalvfzluzaOvlCLAPhWpLs+YgCZPJamaNQs6Qoivc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2361

Hi,

On 14.11.24 09:51, Alexandre Belloni wrote:
> Hello,
> 
> This has been discussed multiple times in the past, we can't have a DT
> property for this as we need to be able to change it at runtime. There
> is already a userspace interface to do this.
> 
> Below is my current patch for this that has been tested on pcf2127. I
> didn't send it yet because we are losing information when switching from
> standard or direct mode to disabled because when BSM is disabled, there
> is no configuration where battery low detection function is enabled so
> going from disabled to standard or direct will keep BLD disabled.

Sorry for my late response. I've tested the patch on our hardware. and 
this would solve our problem. I understand, that it is not ideal, that 
information is lost when switching modes. But I can't figure a way how 
to avoid this.

Thank you and best regards,
Philipp

> 
> 8<--------------------------------------------------------------------
> 
>  From 7db70b33c3939a0ebe147c32f406b34a2f5f1be8 Mon Sep 17 00:00:00 2001
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Date: Sat, 24 Feb 2024 19:58:20 +0100
> Subject: [PATCH] rtc: pcf2127: add BSM support
> 
> The pcf2127 encodes BSM, BLD and power fail detection in the same set of
> bits so it is necessary to do some calculation when changing BSM to keep
> the rest of the configuration as-is. However, when BSM is disabled, there
> is no configuration with BLD enabled so this will be lost when coming back
> to a mode with BSM enabled.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-pcf2127.c | 81 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 9c04c4e1a49c..a7f73192d53d 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -48,6 +48,7 @@
>   #define PCF2127_BIT_CTRL3_BLF                  BIT(2)
>   #define PCF2127_BIT_CTRL3_BF                   BIT(3)
>   #define PCF2127_BIT_CTRL3_BTSE                 BIT(4)
> +#define PCF2127_CTRL3_PM                       GENMASK(7, 5)
>   /* Time and date registers */
>   #define PCF2127_REG_TIME_BASE          0x03
>   #define PCF2127_BIT_SC_OSF                     BIT(7)
> @@ -331,6 +332,84 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
>          return 0;
>   }
> 
> +static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       u32 value;
> +       int ret;
> +
> +       switch (param->param) {
> +       case RTC_PARAM_BACKUP_SWITCH_MODE:
> +               ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
> +               if (ret < 0)
> +                       return ret;
> +
> +               value = FIELD_GET(PCF2127_CTRL3_PM, value);
> +
> +               if (value < 0x3)
> +                       param->uvalue = RTC_BSM_LEVEL;
> +               else if (value < 0x6)
> +                       param->uvalue = RTC_BSM_DIRECT;
> +               else
> +                       param->uvalue = RTC_BSM_DISABLED;
> +
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
> +{
> +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +       u8 mode = 0;
> +       u32 value;
> +       int ret;
> +
> +       switch (param->param) {
> +       case RTC_PARAM_BACKUP_SWITCH_MODE:
> +               ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
> +               if (ret < 0)
> +                       return ret;
> +
> +               value = FIELD_GET(PCF2127_CTRL3_PM, value);
> +
> +               if (value > 5)
> +                       value -= 5;
> +               else if (value > 2)
> +                       value -= 3;
> +
> +               switch (param->uvalue) {
> +               case RTC_BSM_LEVEL:
> +                       break;
> +               case RTC_BSM_DIRECT:
> +                       mode = 3;
> +                       break;
> +               case RTC_BSM_DISABLED:
> +                       if (value == 0)
> +                               value = 1;
> +                       mode = 5;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +
> +               return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> +                                         PCF2127_CTRL3_PM,
> +                                         FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
> +
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>   static int pcf2127_rtc_ioctl(struct device *dev,
>                                  unsigned int cmd, unsigned long arg)
>   {
> @@ -741,6 +820,8 @@ static const struct rtc_class_ops pcf2127_rtc_ops = {
>          .read_alarm       = pcf2127_rtc_read_alarm,
>          .set_alarm        = pcf2127_rtc_set_alarm,
>          .alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
> +       .param_get        = pcf2127_param_get,
> +       .param_set        = pcf2127_param_set,
>   };
> 
>   /* sysfs interface */
> --
> 2.47.0
> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


