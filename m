Return-Path: <linux-rtc+bounces-5527-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B08CB2E4F
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 13:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C399E301CB83
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 12:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8721E0AF;
	Wed, 10 Dec 2025 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="Ucr0Xxwy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021103.outbound.protection.outlook.com [52.101.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC851624D5;
	Wed, 10 Dec 2025 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369873; cv=fail; b=Oa+xnbpTedE8yX76Ajn4a5HmA2Xv5j1J8AIfolFblYCJqqxbTpc2ByDc49og0kW6Mb3Q9BQ8lDMKaYnJpPuS5B7WugEQdQx6tVxnJ7EUFjK/tdcWQm3ibhuH5l80F2tEiUGCinA9fwCsMcv1XuGkYD3NruIIh/iyLRu5uZHl02E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369873; c=relaxed/simple;
	bh=GxggmNGwot9cmdcy2te8X8Q3SVzbWGb17Gt79oXu85s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XjzaYzA5WNMXbPh3qGFt7LGfd3lLKra1RQeLtNLyXc7Fi7W/6qUYBNQPovkcPtWNvMaIf72yXqwKdUD+e82+Ml8Slf9E/J4ruYONkR7TW4/36GZZVWu3R9roLTfZfnHQDKc6zbXybF8fkioGQNos19q/7jMS0pu1lVIzQ4VKlcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=Ucr0Xxwy; arc=fail smtp.client-ip=52.101.70.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFkohlywoBXPwZ88zQJ0nHEb9VPiqkZ0BYNkS9jTJJ1Rixs/dzu770AVziQp2AKvzkqalLXbWZkUl3QFEp28dOsLbog7WGqUJadN47MFqNkvtUHyMEZe5gPksmccB4vsIe760CtJ6I6H40qjLSK3mFL+JE+Ycunb6QYY/qOkwbqS1fFg1t1nggaF0Qu6ELXP/UFO6G+FxR8oU3p78BhsXaR4SCTRgn+pEZaGheN60wAHqpjOoCCB4OFBk380IaEnyQD5FynIQ3OtAtBCI8veZMIDryKO7vSEtgDK/3BrFuihs8JS5+FBO6k3F73KeQV/Kb/YtHJCvoocYaaE2uO8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9qqFK1yp4r6FswU8eFNtJQ2ryDPgqXeuNcYqaiyHgU=;
 b=UxF4uK1IpKDNcps6Xr6msKHUT4i07mkNfHGcoRXwFeAt8zIsynBoOvaMKLuaCjaSzi+5AqPWod1Hw4lspOvMIe4H8Lxjaj8vOXM7BMl2hzU2Y+5oj2JnC1wTKGpVO7mcStVagFMto80nZ8kYRoxmxHQEih28NsBk3LLe0lE1U+KtE/mjloYkbUeG/VkDfbkfKThkOLZLk8ceLvST/ukrcllSVRMyfuttVGIS+ReuhN48eG0/MSYeBVaMZBVgHYqJwncq6j7Vtcs3KxAtX4Kt2tiOoNwt4nVfrxxOa8l+0RYcX4DMpdPWVs/Mv/E+Bx73JXYSp4PNIuMh0Asdnck0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9qqFK1yp4r6FswU8eFNtJQ2ryDPgqXeuNcYqaiyHgU=;
 b=Ucr0XxwyilRrFAbfgLF3ykFzidh9ufBDsqND8AH/K9wELVijERTkaldyYMRW+8xIs7Fb+6EhOhyAFWF9CRBPzrrV4Qi+8HDGOKsokkofGUcEC+7VJXIFV7QDQ5i9wuJ+LkWCeTu3zi58u6iuQMc0Ayu0XferQlWkjbRVoj4br+9QQ10a8/DxOXcH3m5XvII6LIB4E3QXq8cRq+kL18Wg7asRnfz8d+nmLhFCfmB7GXwVHBSSx/ZYVrH0F956hT+i+yNBLSzk2TjVMxf/q0gXMsEG/X27+jCXlg4rFBqzcER4Z/r07s29d53ic9aRBm5uvtZsXjXDjXxI3UzvKNFucA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by OSKPR06MB10122.eurprd06.prod.outlook.com (2603:10a6:e10:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 12:31:04 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 12:31:04 +0000
Message-ID: <d3087d78-31e6-4a29-8939-d6adae8a4307@vaisala.com>
Date: Wed, 10 Dec 2025 14:29:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] rtc: zynqmp: correct frequency value
To: "T, Harini" <Harini.T@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-1-33875c1e385b@vaisala.com>
 <LV5PR12MB980479009955E816E72E6EA892A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <LV5PR12MB980479009955E816E72E6EA892A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|OSKPR06MB10122:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e5caeb-0d73-443c-1893-08de37e7fc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTRRZnEwLzdZR1RSdFdFY2hYc0dpOGJvMDRlVHNKbTJUcFl4Zi9waXZha2ZY?=
 =?utf-8?B?NktUL0RBRnhmZDF5bUpmZWNGeSt2NDdnaTNxbVZDcFNiOXYwQVZNazJZZDRQ?=
 =?utf-8?B?eHZOM1luV3REZ0VIa2VJdTFhYUE2LzYxMUpzM3EyQVA1T1QvOHhRaDFURmI5?=
 =?utf-8?B?YlBzSU1mNHNqYVliUG5QaHE1U2ZidDFtYzEzZzJWaDVpbkVFMlcyamxZWGgy?=
 =?utf-8?B?S2lyR0E2QUtQREl6YTlzQzhDVEx4QkRvb3ZsaURvR1VuckhwME1UMFlmMW81?=
 =?utf-8?B?VFpOR2xMeEtJcTBTWUl4d21WY25tVWVmWDZUTFhKZnJKVlNGeXpPM2VMM3Q3?=
 =?utf-8?B?VnZTS2ViTno2V2wvUkZNakVHTlN2elZuK1ErTXcxMnRVTXM4K0JJaUFBVnl1?=
 =?utf-8?B?bVprRkFYajV3V0NNRVNkZVFIQjE4VzNlemQ4N2lLNkF3L1pjTnJ5RjM1Y05D?=
 =?utf-8?B?U0tYQUlHdmwzTEZYS3FRUmhnOTF2TEZuU0xRQzA0QW9KSnhkM3BNM2xlRWNE?=
 =?utf-8?B?MDF1UmdMSGhuRXQzS0xpMHJyKzZWSEtvSUpzenlmZWlZa0kwZUhGSVRuQy9h?=
 =?utf-8?B?WklacHVlYVhDRDI5TExDNUI1TSs5NDg3cld0MGQrMkZYNzBBVWlyUExhbUxR?=
 =?utf-8?B?eXF0L2RndHhJSlpjTjlHVmNpQUhzdnp4dVZ3MU9BVXFRT0ZMN1pxQ2RDMUpE?=
 =?utf-8?B?UCs3RWF2RDNhNEIvajM0SDc1UVoyemNSZUNrbXFMZEU1aTlaSHhpZng5SEpx?=
 =?utf-8?B?STYzQ3Q5M0dTSEIya3dPZ1Vod0hYS3VlcEQzd2dISjBvU2VQQUtqbTNEQ2lS?=
 =?utf-8?B?TllMWGVyUm1Lb000Z0VoSWoreDFJcHNZbE5qYmNnWEVrWEhVSEk2NS9hTSto?=
 =?utf-8?B?bXA4V3R5ZVdGS0lFY1c3L1pXeWs0Y0lXZ0MyOE12cDFkVmYwVnFRWWJGcy8v?=
 =?utf-8?B?VnpIalBqQ1V3ME80RDNPb2p3aWQ5cko2MVlTcWlvYytkM0gvN2oxTjBGTFFE?=
 =?utf-8?B?c3d3Rzkwb0VuR1RjbzBBRE1oZ3QvU1FIeFFhUWZlUU9FQ0tjZEtBQ21jT01T?=
 =?utf-8?B?YzFoSVkrTVRPZGxqVGw3QjRsTlRiVVo0cWp0WUt5bnZmSmN0amU0OGRod0xU?=
 =?utf-8?B?WGJybitTeXIydEw5VEFENUVlTzBoYjljeC95Rk9MRFNFUkw2VWlhZzd4RDkz?=
 =?utf-8?B?Y1VzS3dHeTBnOVFMRXMxRFpHdzA5MlJQUi9LdlRMc04vdjY2Z2dob25IN2Jl?=
 =?utf-8?B?QWcxZUtiUTlXVTQxeXREK3ZEeW9QMVJKaGdKM0pGUWtNT2JWbW9tWXNxUWw1?=
 =?utf-8?B?NWNpRmtjbnNhZ2dFUHljMGpKeWt3NGN6Y3U3RmUwODJNREF6bDR4Z0V0UmR1?=
 =?utf-8?B?WGlsWFVrcE9jVloybFh0aFJpY3JWTnRzYVVNVThqd3QvUGVZdUVkUy9HQ2lC?=
 =?utf-8?B?VHJqb3ZaTTVmc3hMVHBiNVRQWUVHVGloN3pNYllHc3ZJa3pPUVN0VFJJNHE2?=
 =?utf-8?B?TEtGK0phUkFWQ2xOd2ord0JCcXhhWm9oK2FQeVhQSUNQdktVYXpoTmJ5YWV5?=
 =?utf-8?B?eEhPODVxejZtN2JNRXZ5cStJdmxvTmJ3NzY4dFEwK0RSWHJmaHlSYWdWd2tl?=
 =?utf-8?B?ZEhKMHhlRTkzeHhuUGduc09RNmZKSmswV3VTK3lZckVTL1ROWnpyaHNUM0hD?=
 =?utf-8?B?clVQQ1RCMWcvbTh3WldPZm4xb0tlUWJzdjlhVjRvTWVOQjE0azQwdlZmZ0M1?=
 =?utf-8?B?clZtYnZHYnZwcUFuK29nZ2g5b0UwYnVSemhoRXgxa29lVTNoNWVPOGRXS3RI?=
 =?utf-8?B?ZWVMa0tkWGp0V3pqM1EyOUl5S0tBeXNrakFwdkhNb2Vhb1U4MTRMTWNiSHNx?=
 =?utf-8?B?cHRrZ3RaZUdGNmJzRFhoeVpWUE5LY20xQ2pmZjdpb25XdG11UG90cFFQbmZs?=
 =?utf-8?Q?ufJuMCk4Ky0YWxlvo7t67NFByLmJ0t9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlR3V2Vxdkd2UEFVei9KWmJldzBCS1AwbTRyMnB5SlNUb1c4MkNzY1Q0K0Y3?=
 =?utf-8?B?ZUZ4WFM4Y2FkN3dsUU42WktpWitMRk01NGZ3ZTEyQlZZRUNMRVlmSi9RRlkv?=
 =?utf-8?B?QkhQT290elkvdkNSRVg4R0lJZTREam1rdDN1Y3JOWUhtY0JjUEJqZnovVEIz?=
 =?utf-8?B?TjBBL0h6dGFmejZBUTV1Q3Mzd0trZWZCSzlnbFJ5RC9BSU5nYWJFZzZsZ3Vr?=
 =?utf-8?B?MEZQZzIvV20yY2V4U2hianhjM2xMUmo4ZEVPMnpaWUVoOUxMTFduZjJYem5u?=
 =?utf-8?B?anB2cXQwVkxQN0JLdTlpdnlwWFZyOEQrMnBWSzRjTjFLVHRRZzgxb1VCQ09W?=
 =?utf-8?B?cit3NW9rY3Q1UHNKZzY0WS9NOWlkNnNwUnBzQnJXMzczazgrdGVBSS9ZM0Ro?=
 =?utf-8?B?cGpKdWhQSTF4Q2lyY1JMM1htRHBnck1TLzc2SlhKNk03NUtIS1lrZXRFcW5p?=
 =?utf-8?B?TUhJd2x4YU1STEhydjBBdlBqMnQ5ZU5BUGNCQ00vRXVBMkVGSHJSQnlTZTg3?=
 =?utf-8?B?U00rTzJuZHBVNS9oZWR2c2JIa25xamJGMHZBNlBvS3N0Qm5Ua2JQNXJPZklu?=
 =?utf-8?B?MTJZbXkwQW9tbkd4S2IxVVl5RkU1Tjg3ampiNDZCdlJsb3IzWkFoREY0QXFK?=
 =?utf-8?B?SUxTU3hkZzFpUWZEQWNaRFZkMnAvL1N6TEptdEJnODA2YldsanNuQjQ0RTN4?=
 =?utf-8?B?blZIN2w1RmRuUkoyMUJzOXFsZFAwbkxXOVpNRCtXRXFHK1ZpeUZlVUk5dHJO?=
 =?utf-8?B?QU1nSzVoWmpBdzFtVU4xYkp0SkxzcVVkS2l6S20wRjRtNWMreTJMWTJmQVF6?=
 =?utf-8?B?cElwOHBCZ1BTc2ZvenBTODJTL0R4QlcwUUhua3BvU0hSVXVGcExBa1dRTUp0?=
 =?utf-8?B?L1pjQ3hmU3gvcmtJK3NJY0dRRlhQd2ZHSTdzZ1ZLOE52UGtWQzlVL1VJZ0Zr?=
 =?utf-8?B?bGI5QVJ2YUowL2VxL3A1OEVRaE4yRzcxeFMxci9iVWw4YTlVMHZ3by9lZ2M4?=
 =?utf-8?B?MHhPc3A5Qk1ySUtIRXJPaTIxZ1dYaUNPSFRDZHZndEQzM1VJdTZDQzJRQXdY?=
 =?utf-8?B?QnBwTm1PZWU3Q1krelc0aGpWZVRLc2xROUlQRVRFNzdldFVhVWlOaklXVHJS?=
 =?utf-8?B?K1JuMllGQ0hFMHdUZHNYejJIcVpENGZjbHU1dmlMd1dyTWtGemVuMnUya20x?=
 =?utf-8?B?b05WT1Y5SE5jcElPMlh3VEt1aE5XZEVwK3MyYXJDWHF2Z0MrbUt5UFhjeGY5?=
 =?utf-8?B?MThGdldTelpMNjJjNEcrYVhtQldZdmlqSktkMmFoUkZtZlZMd25xWlVTTUt2?=
 =?utf-8?B?VzRsbi80MWJOZ0NIZFY1NXMwc3hBQkU5MjNpa250bEF5N3I2TjZzVXh1YVcy?=
 =?utf-8?B?QUpyakk2NXdBR25tN0pLamJEYkRqME40VlhpU0xManc4ellWcGJyVW9YME5B?=
 =?utf-8?B?MDhDYU04M2dtQitHU0ROamlyV1crbFhpKytwRHZFWERPd3NXOUgyeWdnQUVK?=
 =?utf-8?B?TkVPcVRpVmdEMDB1eGxUdTBhT2p3WUNQVTlsd1dFNGVTRHBsWTRIdWMrRndX?=
 =?utf-8?B?N2RXVlJnMVhHd1lXYmVGdDVZK2tEQzlSY0hQeDIwZ0swdTJUbm1jbEZQVFh3?=
 =?utf-8?B?NXlpSWJzenRGMkVOclg2Rzc2N2FEZTZlc1FIRzNIQTdzSXNtM01JTHljYXR5?=
 =?utf-8?B?bmg1a29nYXBOVVVLV1dZbGNDUXFGUU5TWFg4RXpKakxyL2VhSFBLOWJqZXpo?=
 =?utf-8?B?d2cxMUFHRTRtd05Xa0p1U0dMbGhEaHRBM1psU3F2V1ZwcmczQ0s0dE9qQ25N?=
 =?utf-8?B?MmFmT0tZa2pwQVJOanFkeWx3OVhtRmE0VnM1QnVtWjdLZFpMTzMvRUdYRXFw?=
 =?utf-8?B?cFQ2RjhKem5ld29IakpWQ2RJdXRyRWVjcUR5M2ZjOGhCa0M4M3doTXFKRTZS?=
 =?utf-8?B?NU5aWUhvekdJbE9MUnVYcCtkMlZRL2NwaTROdE5iZE91V1d6UUxRalZKaWpp?=
 =?utf-8?B?KzRPb2VCeXJ0RUVXb3g5SzdrSkhsRGJyZEFoRlpkN0h1dUVIVHpTOGNTRnM2?=
 =?utf-8?B?VnlRdUl3QW9lTE45R1F0WE9qc2pVUC95NENUV05Zc0hiUTA3Q2lWNTZ1blZX?=
 =?utf-8?B?ODZ2WmYwN2NOTERsNjJ6Tjlhck1sSW5qazN2bm5KOStFV1Qxek15djE1TWli?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e5caeb-0d73-443c-1893-08de37e7fc77
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 12:31:04.6739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNw5roi/Ml5Ncf9hBrLo5B/Rav86Or6rBytrqsWC/K9Kp3snpBTC548EmZakghNAPWCo9zDikVSqUEXf2ck3KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR06MB10122

Hi,

On 09/12/2025 18:51, T, Harini wrote:
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
>> Subject: [PATCH 1/4] rtc: zynqmp: correct frequency value
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Fix calibration value in case a clock reference is provided.
>> The actual calibration value written into register is
>> frequency - 1.
>>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>>  drivers/rtc/rtc-zynqmp.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
>> index
>> 3baa2b481d9f2008750046005283b98a0d546c5c..856bc1678e7d31144f320ae
>> 9f75fc58c742a2a64 100644
>> --- a/drivers/rtc/rtc-zynqmp.c
>> +++ b/drivers/rtc/rtc-zynqmp.c
>> @@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device
>> *pdev)
>>                                            &xrtcdev->freq);
>>                 if (ret)
>>                         xrtcdev->freq = RTC_CALIB_DEF;
>> +       } else {
>> +               xrtcdev->freq--;
> If freq > 65536, the 16-bit register silently truncates.
> Please add some checks for above mentioned scenario.
That is indeed a scenario that is not accounted for in the current
driver. I can add a separate patch for that as part of this series.

Thanks,
Tomas


>>         }
>> +
>>         ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
>>         if (!ret)
>>                 writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
>>
>> --
>> 2.47.3
>>
> Thanks,
> Harini T


