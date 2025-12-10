Return-Path: <linux-rtc+bounces-5526-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9ECB2E22
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7C5430028BE
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 12:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07549319601;
	Wed, 10 Dec 2025 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="i1sH21xn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020114.outbound.protection.outlook.com [52.101.69.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681053016EB;
	Wed, 10 Dec 2025 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369552; cv=fail; b=uVMp6XNvjNbJ/eYLeRc/dQ2hVtVpwfMVmJ2Dg4OCfQW4KRoiwjIsuNuiXEgo3MTNozMSlICGmKmf2xK9wfvhVvF9+Z5R5WWXEjxzjqvcKUlrx9pP53oSBQmo+vBqSTosJB0mz2OL3i46hTFKSHfFsNe9KpiKlzOyLX3vclh1fUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369552; c=relaxed/simple;
	bh=W0G4RDb6mEG2bSlbf+hIY/8e0iY2DxVQ+X3to+uVX1A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h7086KlE5g27DwOTAK5dRohJwCZUGMtA6jpwleSXYfKlTpv0kBK4G+N/jRmIK8ZXc0LMWo8Ml9Wa1cUw8SnfqR+BqZSKuvjyB0kEKNeXS8CotX7OJARVdBQFAEjHYBU1MKX08ImoXIJ4PVyX+s7lBfJKmL1XjIUJ65ETw540KzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=i1sH21xn; arc=fail smtp.client-ip=52.101.69.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEBoRQyjK8Y6sFxHiBvwNU6BuxvbXXpueijFN6vNtXkclVUNY/K9jr0oes+2GCCiHpt6tn/Ydpnaa1XKmspHwopPB0iA7QxQF19t+dnCb8eE4Y+siEp9ypqd/HBNyhraz7P/zD7A8g8bVO4ZxZVroFo/7sBT8QQmEDQaaNG5dkLT8l3VaHxRfIF2//22b0lh8hTvGmnpiiG01eaBuvh3EonoN3Tm6PNXPfry+b2L6AtoYwTO1SC4nHneAbJFJpVa3xfwujEfDfTzy2wEyvuZfHb7SO20dOTjB3Po1ZYqtgOSJ+cUgTOMqCpGWpssOO93SM0/jDmSEjhrT6woQxXc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJswvvrXkqEyDqS1NGOJaUk+/zVHIkHOrvBQJ4R387Y=;
 b=vr8C8A7au81jD8agsvlTIEVd/qwz1sBa50HOxy18R9mSbml3fr1X5nwUJp0R500QA9zggHRU0wYTqFrLEdOtaLnt3gfcUllr6hMUSd2cdRDXDjCMqwX9rQ/fAZHWZNkuDSnEvazKyYjyuZWYyNi9E329YKnzIQWmoqNm+Lab3rIFa8NqO8ifXh4aoYMxT9OnVS/bjfELkAcsBXqkePS6qFTglaaaQAA/6DZ0ef22Gw0psKVLEiCiITy5aBeTaIUIMA537aGdf6t/oH19XDLjRIUvFEfK174shxWFoYaemCOR4qtny+1JADl2OXpZg/KOq51UlxWJ79lMUio9NTxx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJswvvrXkqEyDqS1NGOJaUk+/zVHIkHOrvBQJ4R387Y=;
 b=i1sH21xnjbqGpKBP6CoMVf7QbzUIrwQl31Kwx2MLX5AI3HD0QyyPtTablqEednkzq9tPIqnjVVx7lEHHmceZP2aT6CPKBQQrHJ4x6B3fTscpGoaEKT6FkrL52+W45MD/UGvVq+bp5cuRTOFab59rXEGHUi9HfzPnfbz4sIF+vWArg9Ucm6hpdp/DBifAuSZxHsFnUJ7eZ003ETPwkwSgs7ld0cRSAFiN+j3EbF/D/bqIatVGFmufNlI0HT7H1wxMl2RSHjC8K5KcsUjVX3nuGNh/D92y5Yozgf2VuvLhS8Jckzn0XqKt39WGMnFj0+U94O9Z1lwJR6vXdgnMc3fmNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DB9PR06MB7612.eurprd06.prod.outlook.com (2603:10a6:10:23d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 12:25:45 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 12:25:45 +0000
Message-ID: <ea85c8d6-ead8-4fda-905d-909968de5056@vaisala.com>
Date: Wed, 10 Dec 2025 14:25:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
To: "T, Harini" <Harini.T@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-4-33875c1e385b@vaisala.com>
 <LV5PR12MB98046A63E80D7A7FA299366E92A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <LV5PR12MB98046A63E80D7A7FA299366E92A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::14) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DB9PR06MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: b8dee26c-44a8-4f78-bb8f-08de37e73e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHFuVll6RHk0STBoY3IxcnBtZUdrMU1ObU8xS00xNVZveEFxcjBFU2tGdUNv?=
 =?utf-8?B?Vk4wUlduakMrS3lsL2dJQzhVM0pLV0ZqUGJXVmZNMDhSQUNHL1BjM2tETTBD?=
 =?utf-8?B?OU9ZTkJvdy9iN1BRcnhGVHRMcVBTU2dxNmc3dVlqbkhvL054Z3FWajN0UTM3?=
 =?utf-8?B?YjAwTHJnUjllaDFTNC9YVTk5N01QWnNQbloxeU5saGhZVmJQTFAzaGRlVnZs?=
 =?utf-8?B?cWpXU2RRaUdubHYra29BdjlSMzdRUUJZeXpyZ1VTbCt0TkdmV3VvajgzeW56?=
 =?utf-8?B?VHI2d2xJRVFYSWU3WUlWbEtZSXdyRmZpSjZoRUZmL05aYlo5YlFPVmpNNjNl?=
 =?utf-8?B?WlVpWlg1dVhNdGNCK3RpRk5RM21wYVpLWWg3a1JVY2NQNjhtK2I4TXE1SS9t?=
 =?utf-8?B?ejVYY1I0THhOa2FYazRSSjJJVjJsUVYzVFh0djhXalRFRkhIa0tZbzNGSUVQ?=
 =?utf-8?B?UGZYSlFrTTl0ekJQNFR0MTdON3lLSTMzZWlDeldiWjVJSkt4Rk9kNVV4TW1k?=
 =?utf-8?B?QmRVbDhCdzdUeCtiZGZyejF5SDNBNGI4YWI0UFdlUDF4WnRFNnM2V3l0OUFh?=
 =?utf-8?B?Mi9zNnBaTDVkSTdrN2RlRGNtSnhrcFdjdTIwbVlZZlR1ajlkaU5FSFlWVlBi?=
 =?utf-8?B?RlNFOFc2SkYyejlYbnlXb1dON203SjN6c05WbE16TjQxMFBXUGl3Q21nL1ht?=
 =?utf-8?B?b0ErM1BzcE9GWlBGSmpjanhGUEQwQ1c5bFV1QkJBZE0yWFFrUnFDNytnQ05p?=
 =?utf-8?B?VkpNdlR6UW1XNzkrWDRhUEtYNmpRVjQzbXFUKzZuOWJNdXJoOUs0Ti94TWN4?=
 =?utf-8?B?dDdQYm9hdWlHSzNVeUMvWjlwNUZSenUrbkptMmhaUkRYMUhkR3RrTnpUZyt6?=
 =?utf-8?B?WXVHbDBxdGJUZzZmZ24xeExyOWNLemFvZWJHQ2Y5KzcwVzJJZnhxNFo5amVr?=
 =?utf-8?B?YlA1bHZFNUJlaEpLNE9CVWgrcTRid3djaEJneVRGejZXdEJ5dmpMV2pSTjRP?=
 =?utf-8?B?M2h6MWIvUUtIaitmaGtBRFRKcVd3TkJvT0x2dEl5UU1lTlNPQTV3d3JZZlJJ?=
 =?utf-8?B?ODhjK01weDNqdllFdXg5N044ZE5FSUg3V21yM2NHaGtVc0gwMlBkRHFsWlB2?=
 =?utf-8?B?bXZaQlhDT0QrNWN2RWgvNTVubjQ3YmdJSWFlZ2xTMVBKSThua2htZzc5cnJl?=
 =?utf-8?B?bzI0cU5HQWFtQ1RWSExzR0JWd1V3ZUVTTk81SUpBU09VSkprRktkMEVRVDFs?=
 =?utf-8?B?bllReHZhalExSjV2aXRWczk5ajlSemErVzBVVFNMRysvMW5lVkF5eUtCdnFi?=
 =?utf-8?B?ZGlWd0ozVDJwYmlqUGxNN0E3cDRhZG5rQjhjVWV2SndPUGVhNGwzWW1XOGRN?=
 =?utf-8?B?bjZ3TXg0cmJSYVZwN0dUWU5zNVRPaG9oSHdPc015MDJRUG4wbExGTGxJbmhz?=
 =?utf-8?B?UlUyZ1pUNE1UdUZsdFljMnFlNWVIdjRCQ2xOOGE0RUxVMEtna0IzYUtuQzIz?=
 =?utf-8?B?dEF5WXVRcnBqZjNYelQvdVBBUTNRalFnRWxUdzFGNER1QlRabEZ6VWN5VnNu?=
 =?utf-8?B?RVcrWkZNVm9ZMzBGQ1Rxd3FjdS9nekVLeXU3c1ROVlZhUXVNK0JCZ0F6Zklk?=
 =?utf-8?B?RVpSOXdqVEg2bUtSdGk3RHhBbjNkcmdGUE1LZGEwT2dOcnJNQmtQY21wSUtt?=
 =?utf-8?B?UHVPWHdkVXozZlp1Rno3UXFCWk8rMTM0bUlyNWwxVU5zTStEb1UzQ2MwcFpY?=
 =?utf-8?B?Y3B0ZWJ6bG03b1psTHh5bVV4bzljTGh0VFZFYTJManVEKzJqY3hJUmZicUNY?=
 =?utf-8?B?SU94U2ZkQjBKbzR4M2FmeXE0QzUvaHl2M2dCRXhXM3plbzNINU5DMyszMWhX?=
 =?utf-8?B?TEtQa01uK2xEaGs3TTZUaG5yOVMvY1FZMG0vandQeHFGMEY2Qk5rb3FsUFFR?=
 =?utf-8?Q?axDzEGAaih10Z2TTy9WTM0xFrH0WgocE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RExxK0VlaktvczhhWDJUNHQ5SmZ1N0JYaWdjZmVvN0ZRWFIyNG1Nc05JYVB4?=
 =?utf-8?B?cmdYZTBDRlhzZkFZL00wYkQ2TTFaTWU0MmRNdUNwUmdvUkppNzFVdzlEbVpl?=
 =?utf-8?B?YkxnbDRERFloa1JXdjlQRi9DZ01YSXJZRkppVXVIVDBscFVZSGRqNTRScHVJ?=
 =?utf-8?B?VDNYRDRqWjVQOWUrRzhxOUpLUHN1clM3Vk01aGROVnNsYnJZRmQ5RnV4bmVs?=
 =?utf-8?B?RVhEUGd2S2FNdzhRTk5iWUVtU2ZjRWZvQ3g5SW1RYWhQeDZuSTh0V1FUZVp1?=
 =?utf-8?B?ck1oNmRTL2hFSUdpSDFoOEo3bmhiSE1RWFZEcjZ3TDlMS0NwWFpmY2tCb3hE?=
 =?utf-8?B?NE9xWXNaWHViekRBVVZyVDBRZlU1Ni84bUFRc3ZZd0FBczVCcUxFakFITzJU?=
 =?utf-8?B?b2lsLzZKZUNKcGZYNGF1ZXJpQzlCVUZUdk1HZHVNUTVJelE2U3B4Q3VXY24x?=
 =?utf-8?B?Sk9aOGpoNUN5Qi9XaHVNLzNOUUdUZUZwSmFjUUlQWHRaQVkxenFQYTJCVVR6?=
 =?utf-8?B?SWY4a1d2ZWZuZUtNeWhIMk00c0EzOERhRk9VaGFuS2prWW5aUnVmSUJ1T0hm?=
 =?utf-8?B?ZHV6Yk1wYU5QYXFwZDZpdDRPTVdvWHJ0aEtXbFRFVmk2eU42cDBpdUgzRGhJ?=
 =?utf-8?B?SlFlWmdQUkMrWmttcFFoYWlDSkVPZEFPaHpJanZqeWtXSFdnR2JSY0ZRUVht?=
 =?utf-8?B?R053RmM1bU1TNXVGRHp1T2M0SFZqUkhnb016MXhNOS9XZGp1WFZCQUtOekVl?=
 =?utf-8?B?cnV1NEcyZkFBeEQ5SHRrbmdTYWx5RUdJdmtibTBuNEFUVXVlUElVQVZMRVll?=
 =?utf-8?B?QlhMSHU5V0FFK0ZrTE54ZUF1eU1XL2Vsazl0RUpkRG9HdWtQZmwxR1pWWWRV?=
 =?utf-8?B?Y2hPWGlJUGJDbTd1bzhYVzVYdncwODJwcGdVbWV5dlJ2OTdQYkRlcUY0KzdB?=
 =?utf-8?B?WExlT2RHcHdxOUp4RHNKUVhnanBJZnIrMFhtSkZBeEVhdVYrejRCOUlBSUli?=
 =?utf-8?B?dXN0SkZtM1Rkdk4yUjVuNWlJcWRuenlrRWhZazBndnJxbWRvR0xsMGpLK3Ay?=
 =?utf-8?B?TFVtUXh3eHp1cEdMK3MzM3FZd3JkaWF2UDJ2TStzSFB5YXdwY1BqbDdNM2p6?=
 =?utf-8?B?dUNwZGduQitjVi9makJyU1RuZTJiZzRaUlVrTVhzOXhpS3cwL1BGMkpIV2RQ?=
 =?utf-8?B?WXMyRTNvWDJwdUt0RlF0SnNnSWYvV2hVWTMxR0ViL1U4MkxhL0o2bkdubE5B?=
 =?utf-8?B?aStOeXV3ZGRHNXcxM0ZESUlOSTdZTXUxbXdpN29HUG0wMThieUl0LzgrZ1N4?=
 =?utf-8?B?SEZGZUMrNHdzNEU1YmpkbTFiM1g1eWNLSDl1L0tucU1JS1JUTmFGVERkMm1i?=
 =?utf-8?B?Zy9JcEU1aDMwNVNjR3h0TzdaaE1pMURrS2dXVnZQRDVCdDRZQmlad1I2OS9X?=
 =?utf-8?B?Z282YStNUVphM2RkTDRsQnlUSTBmaFluS1gvTSs0ZFJmUGZQV3pjU1k1QkVX?=
 =?utf-8?B?Z05QR1NMNEcvR1ZTZE0rSGt0eWVZWDcwaHloSFpVdC9BNm5DVHp2QUkxdzVU?=
 =?utf-8?B?bWNMdnNrTnVqVktjSkhCY25jOVpib0RjaVFUVzJhSVFvT09xMlU0YWw1WmM2?=
 =?utf-8?B?MFFMQkdKK0hjMmJzS0tCRGE1TFQvaWFFMXkvWDExVE9KWTFSaWhvZXV4SnN5?=
 =?utf-8?B?djA0djJxaHBiUmxDb1dPQ05lbTZjUkc1RHZqM2hNczN4cHo4bG4rUWdXMk1J?=
 =?utf-8?B?NVNnTU5GQkNsVHROU0lsSHM4Y2VVYjBBVzE0ZEFSaVdkbWRkbUF4YWZySnAz?=
 =?utf-8?B?VElVcmpndmNrSE45ekwvSFhvckR3OGpGa29uMGhUNmIwTmpoNVVILzZWTEZJ?=
 =?utf-8?B?ZzJZamQzcC9qdGtYdncwbXZCdjJNYXd5RHhrc3B3TlZzYkNNNWtaN0dOb1Q5?=
 =?utf-8?B?akwrWENoNXozOUZFcjdZR0hjVjhFa2dxdGRzQlVVKzhsVGNXaDl3cTBDM04r?=
 =?utf-8?B?cldBQUZyOTI4dVRnUERSKzBIVzBJQUNKdk5JTTcxU3poaGJ5N3V1RjhVVGtq?=
 =?utf-8?B?eDVqNC8rZ2JkTUF5eUdQTldPdzVTQUtlZGw3U2dHQ0t5RDZGaTNEQStDYzVP?=
 =?utf-8?B?aXcrOCtZRFl2MjBKbTg4Y1d6MnNsdWFkT1JCbmlMK2Uxc0xOUmNUMTREbEg3?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dee26c-44a8-4f78-bb8f-08de37e73e18
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 12:25:45.2893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EouUHvvUVDIF+TDDFGpQtXUb3Vfhy63nL4hpoOm9zGmbobDwZ7omQnMtsABtz6EAeharlqoK0ZdymPuZPNaXxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7612

Hi,

On 09/12/2025 21:28, T, Harini wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Tomas Melin <tomas.melin@vaisala.com>
>> Sent: Monday, December 1, 2025 6:20 PM
>> To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Simek, Michal
>> <michal.simek@amd.com>
>> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Tomas Melin <tomas.melin@vaisala.com>
>> Subject: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Maximum and minimum offsets in ppb that can be handled are dependent
>> on the rtc clock frequency and what can fit in the 16-bit register field.
>>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>>  drivers/rtc/rtc-zynqmp.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
>> 3bc8831ba2c4c4c701a49506b67ae6174f3ade3d..0cebc99b15a6de2440a60afc
>> 2bd1769eccfa84b3 100644
>> --- a/drivers/rtc/rtc-zynqmp.c
>> +++ b/drivers/rtc/rtc-zynqmp.c
>> @@ -44,8 +44,6 @@
>>  #define RTC_FR_MASK            0xF0000
>>  #define RTC_FR_MAX_TICKS       16
>>  #define RTC_PPB                        1000000000LL
>> -#define RTC_MIN_OFFSET         -32768000
>> -#define RTC_MAX_OFFSET         32767000
>>
>>  struct xlnx_rtc_dev {
>>         struct rtc_device       *rtc;
>> @@ -215,12 +213,12 @@ static int xlnx_rtc_set_offset(struct device *dev,
>> long offset)
>>
>>         /* ticks to reach RTC_PPB */
>>         tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
>> -       if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
>> -               return -ERANGE;
>> -
>>         /* Number ticks for given offset */
>>         max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
>>
>> +       if (freq + max_tick > RTC_TICK_MASK || (freq + max_tick < 1))
> The check 'freq + max_tick < 1' should be '<2' to prevent writing 0 to the calibration register when fract_offset < 0 causes max_tick--.
> Example: freq=32767, max_tick=-32766 passes (sum=1), but after decrement becomes calibval=0.
calibval=0 is not documented as invalid calibration value. AFAIS it
would mean a frequency of 1Hz. Can You provide more info on this?

Thanks,
Tomas


>> +               return -ERANGE;
>> +
>>         /* Number fractional ticks for given offset */
>>         if (fract_offset) {
>>                 /* round up here so we stay below a full tick */
>>
>> --
>> 2.47.3
>>
> 
> Thanks,
> Harini T
> 


