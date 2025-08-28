Return-Path: <linux-rtc+bounces-4783-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE6B39C3D
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 14:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31817200961
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Aug 2025 12:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F9D30FC1B;
	Thu, 28 Aug 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ACipRFGV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C5C30F80A;
	Thu, 28 Aug 2025 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382873; cv=fail; b=hxeBPqkd6LdfIjsK9bq4/0AuyqkXgLlNGNYQBpOa9ySubIoLuW7V59AWpmXsCDQSAcwPey0njlMZTpYmqQ8IFMJUiYSN3YQwF3zZhfL6fM3u1TK0KVqCsU/ydy53qto3so/LUcIsKC/NFKpyYnawUtZzgNjTVtmHaCD7clzUfok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382873; c=relaxed/simple;
	bh=L4pmXUOosLEu/UEVFnTsGGxqlbacca0qFwDVe3OdhaA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UrwXs8hUE1hUPfwJMoAAF3N4rzolMThQsrYAy59fcEOdfTYre5b68ezh3U/InVeLaO0/rPlbNEjnTfpapqqURElS0sHBZW9Ua2i0JlHcAfEK+sIS2chQK9KD3/+eGP/JTGW+f/TMu9q9qpf2CbuM0iCiofWvaGX1SYMcliWz3Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ACipRFGV; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhRetRqZb1ZAv/nWYqrBCGlirrxj06sIShWiODUDAefBs6+nqO5FGbLnOf7VYwjlzU+ntF34lZUw1IQiebAkAbUKLJO9rDL5R88ZwFnyRtGqPxkZN7Tzm5xcbPjaKYod9P1OL8Pymhia+LgDcRCzswCQ7duszPUOBtL0NZXZJ1ToFbSIfbX2i1B016D+G2Vu9tzyRBr1Vma4d5Lyvjs1XWe/B2hx4KaMrJnDXmcSqHllg72YJiaXqvQ1cyz/YWBl1U418XnXO6nlJ5KNNUBCMb8Oc/6zGlS10HUXl9E/S64rzbBo3J4la+nanwnRSoo90X12VxgFANjiais6HQfHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIDNqlsaI12OQksROcN9CQwwpCNhBZzz3a3a0duiDFk=;
 b=CAvN19Amvnl4/RHIcumehdCzRfDlmYFsyuE1JuXpl35/RTSaXDL8bRNWBvzRzeeZXo3mJnG4sjYaOSFSx4QG3CEirUaq44e77Yq84CEzBYjb8WUIWjZyHURUOvuwwSnjJtcQ2hkvb4P8s2kGIUts/znOzO7kzI3nGCIwaUOADWiejGTHIUgXQuSe65PrjxNFnU91Nb3te1i9YNqnFUxeTTQasn+s0NT75uHMVg4ps6u0R3JtF3u9FKuHREVR23Ec65H9+Z8apQ3T2mDuFMIbkYPOJuWwIoEodEvDBpdO8JrI/awTgpcrn/YbO9bxO7IycXSObu95YKFGCGncHa6gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIDNqlsaI12OQksROcN9CQwwpCNhBZzz3a3a0duiDFk=;
 b=ACipRFGVTFkORKYBR3wyfbqy/UDga5mtaB39+vrsn0fKsOo8eQ8Vd8CzxUn4XoVqrkZvUejHvP1NeVVTVh40wlMZGJNgxoSFmPwdb69bmW/panANpNsJaIi92/utzFuX+lkUcrMS/GOQ3b1BwzMrVZNi7nxO2d3TX6m4I8yLa8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20) by AS8PR02MB9234.eurprd02.prod.outlook.com
 (2603:10a6:20b:5b0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 12:07:47 +0000
Received: from AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40]) by AS2PR02MB10373.eurprd02.prod.outlook.com
 ([fe80::59a4:74af:158:bc40%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 12:07:47 +0000
Message-ID: <75015218-dbd9-488a-bee8-866b771fb110@axis.com>
Date: Thu, 28 Aug 2025 14:07:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: rx8111: Add NVMEM and timestamp functionality
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
 <2025081620535601a84107@mail.local>
Content-Language: en-US, sv-SE
From: Anders Sandahl <anders.sandahl@axis.com>
In-Reply-To: <2025081620535601a84107@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0079.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::12) To AS2PR02MB10373.eurprd02.prod.outlook.com
 (2603:10a6:20b:544::20)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB10373:EE_|AS8PR02MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3f77da-4df8-4d66-5041-08dde62b8085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUhqNTAwVTgzeU5uQmZpelNvdWFUdk9Cd3dTWllHUEkyQUVtN1M3c3BhOHhU?=
 =?utf-8?B?dXp5dWh0QzVYa1lNbUJJaEg1QnRqdnkrT3ZSbTFwS3ExM3hpQXNsNlJlcUkz?=
 =?utf-8?B?LzZ4YnpzeWhYY1FJYlovM2xZUFlGamlMS1g1dTZFVnNYTzN3N3BxWThLUS9y?=
 =?utf-8?B?WnM3K0ZVK3ZUQ1FpYzNRSGpYaU84R0o4N29pbTZzOHNTMTBVakRQeFZHdGk5?=
 =?utf-8?B?dXVidmJPZmdWalJzWXM3SnpIOUVueEhCQTRpaWhYeUttT1JiczBMWDNJdk9w?=
 =?utf-8?B?a0NseE11enQ2UCtjVXNLUVZjYWdHOHhsa0M5K3ZLTTEzQmUzR2hzc0JKRDB1?=
 =?utf-8?B?SVBQZUU2Mkc0Wkx2V3dlcVRRcDc2ODZ4R0NyMUFMbjJiTWlmRVZNS2ZTSUND?=
 =?utf-8?B?dGt3Z0ZRUzl1c25WTUsvRThOUHNFVFlQZ09BS1djRUwwRjdqcms3dUYyZVNT?=
 =?utf-8?B?MTFFcXpaN2FxenM3NXdjK0taaWpVYTcxZjVMcjhpazlYcmIxR3ZQcEE0MEdF?=
 =?utf-8?B?d2lnczRjSUtlbW9Rc1NQZGY4dkZwT2tBZU90R2pmWW5UM24ybG1yT0p2ejIw?=
 =?utf-8?B?dktRcGQ2MFZKTnMvUGJPbGJZUFNSZHV5bDV6YjVDeFhNSlhRaGlLUHY3dmQ4?=
 =?utf-8?B?ekk2ZTJWbzdmbDJpVlA0UFNydWxkbmh6bTlGRUFXYXRSWDlwdjVMbUZvb1oz?=
 =?utf-8?B?M2IxRm1KNE5zNE1wOTBRbjFXcmZSSVpScnk2M1F6SWN5MmJ2QXdOeVBGU3VZ?=
 =?utf-8?B?djZzMGRZZm95U0MrZUhOeVNZTmtlSy8zd3hGNmRpSVA5MUdHVEJLaUR2K1Rs?=
 =?utf-8?B?aU9OcVhVODRsOVlFQ1NkWkZzRDV4Vko4UFlNSlhoWkVkUWtJTG1HMG5FYUow?=
 =?utf-8?B?SDVraDBJRWVKRUdqcW9CK2tldHQ2cVhFeFp2T2NtNTBuYjBXT0s0dmJvS3cv?=
 =?utf-8?B?MFJzRUJUUHhwOVIxdHVUME51b09mdzlpZml1MDZBMml0RnNGQi81Y25ubFZr?=
 =?utf-8?B?OUtBYXhuTmd3TzlRUmtwbS84cGhXdDh5czE5V0J3dzRqaTBhZmtpcXZNWDE5?=
 =?utf-8?B?cXE1RUZlR0ZqZkFNeHh6VTVaamh2ZFFqWXpIVzR2Ym5KcXN6N28xcUlIcTZw?=
 =?utf-8?B?Y2NMcktCV3VIY2NHZWw5SllBa2lEWml5L2hVem53UEdzczVjdENLREpML2hm?=
 =?utf-8?B?NkhROElXdlFWdlpRaGpMT2N1RElhWGVSdy96Vi9xTjdNbTJLTXZKTkxucXpp?=
 =?utf-8?B?VDB1ZS9MTGpSNXdJS05mY1I5L000WWF0QkdEQ3FhOUJCeThKaXRVOXNVVm9J?=
 =?utf-8?B?clpHME9rMTh4YWlMcTNIbFRON21SQ2FCTG01cG5KWC9SUTJoMWVNVjdGakJv?=
 =?utf-8?B?ZklyNHgrSFZnQ29ndU4vRWFjalloL01uZVhEbXczYXhnZGgzMGlXV29uQmpI?=
 =?utf-8?B?eFdLTU1FMEJMbWRYYzRweG5HQ2ZPUE1LTklQdlE5NXd0Ly9Hak5MRlljWmlR?=
 =?utf-8?B?OWdxTURRWUhmcStOTU81MWUyd3MrRy9uQVpYUHlhNTV2WFJFOE5GVFlFbmFP?=
 =?utf-8?B?YUxBdEVlMW5XRkxGcm81N3g1ZHlKM3o5VTA2OThndW5TUk85RlB4ZmllcTJY?=
 =?utf-8?B?cFNWOERWYTk1S3p6N3lodzY1VEYzMnlMVGJXUHBpb1hJZmFiYjNxYUgyRGIz?=
 =?utf-8?B?MTRrY1dyWkQ1Z0o3T3MrWEhMVk9SVkhsSTVic1Q3VHhIbElwUG1uYk9PemNZ?=
 =?utf-8?B?Wk9vekNTdjZWWnBBRE85Nk5BTHAyc2IybnhmazdZZVBFS2ErUllESkVESWtL?=
 =?utf-8?Q?qvzT9kR+ab0jEUI2UNWOFZEfs0bEFhoPMK1aI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB10373.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1psbGV6UkxnbkZCWXR4UkFtQU9vSzI4Y1ExSitWSDBmWnZkbTBRZStCTlRF?=
 =?utf-8?B?Qlp6cm4rOExOMERFSU90dUEvWGFDWDlBL2RtcFdXSVFZTXE2VEY4U1FVZ0N1?=
 =?utf-8?B?Y3IwVFZXRHpya1dYTmRPUEtkUUNPZDI5dFpXdStoKzAxdnVWcXI0aXFhU0dr?=
 =?utf-8?B?K3AvTjlzNFpUZ1ZiVXg4L1BQVXYxWjZ0SFlaWlRpS2dKN2VtU0V5UEhicU5Q?=
 =?utf-8?B?TzFyZ1h1Tmd5VGpScjBpbmdUbFBnT0NCM2hNZjJuYTFQcWQzanRQVDYyT3Fk?=
 =?utf-8?B?cUMxZFdoQklKNlJyUWlKQTFLU2hEK28zcTNCQjNzeFcycGhrS25SUllhKzFx?=
 =?utf-8?B?dDh4eXk1VC96VFJHRDVmWkVaZG1NeHE3d25GTG13OXVJclE0dWdmTElMMHZx?=
 =?utf-8?B?QzJXNmdxZE84U0RXOFNFSmIreVRjdXN2ZnFtQzhRWFdObDlabDdpNWlaa1FX?=
 =?utf-8?B?ekFONmhydDhrM0N6Uko5YitYcDVkYXdPS1RnWXNRRE9PcGNPQnE3d3lHeEFs?=
 =?utf-8?B?dmVQeW9DV3JPZkxHdlQrY3dYYjFkSFBwaFlHL293ZHZuUm9sWnNzaVcvTm5K?=
 =?utf-8?B?dktkWFNCa29pcEQxQnNHTnYvNTBRVlNiZ3c3Q3d6a21UenhRQUM0ZE1TOEd4?=
 =?utf-8?B?QUxKU3RuOWlzamVMZ3B3MFRLVEJtRUhtcjRmRnFrMUNmSDFPRVlneU9NOVlp?=
 =?utf-8?B?RWtTSmwxQWJkbnM4bjlaNjBKTmR6Y1NLWXU5czdqd0VNWHdWTnNWNU5LT3BT?=
 =?utf-8?B?c1RDKzRKcXpvNmZEbWRPbGx4MUhiTk92QW9NRGdHRTlESzdmQXk0TDFUTk5I?=
 =?utf-8?B?eDIzbGJVMzlkNHhhaGZ5OVdyZ0pvWDliSGcrTUNBNS9zQXZqOVF1QnpZM1ZG?=
 =?utf-8?B?K0p3U0Npb2dycTA0eitmclUvOEdQb2J4bUNXMldtWFFONHRPZXFkWmwxbmMz?=
 =?utf-8?B?c1Z1Z0tGazg4QmxrZnpHdGF3YVFqdlI1MVNoTGI2T0xxRlZRZmVRUWdCZE9x?=
 =?utf-8?B?OS8yOTZwTm1tZTNVMEJYUVFNMGNHYXRHWlZwMWZXc1VtMUI1WW9STERsM3lk?=
 =?utf-8?B?MTA4RkI2Y0ZSbWthU0VtdUVWdjlFVzBKMTAzRGE1S1RZVmJwSkZGM3VHTlpx?=
 =?utf-8?B?eWRJNzlaQ1VWZ2NvUDR6d3E2QXhZMG1MZktVM29aOUEwakpkTG1VTXBYcFdk?=
 =?utf-8?B?b0FwL3o3STY0Z2gzek5md3YwcS96ZXB2ckhlNmpLRW04VFEraVN1KytJUGdo?=
 =?utf-8?B?a2EreCtyNVpoeEx4QndOZ2pRSC9TVitYVWp6b1g3TzR4MmN1NDFZcGJ3R1Fk?=
 =?utf-8?B?VUtHOGV6em80c1I2MjV4SEpKMkc3aXJWYnltL0doTlp4UjdtdUtlOGpHNHhq?=
 =?utf-8?B?U1BnUFFWSE5NS29sNW1hSFg3cWNqZVRRREQyTVBpZTF2K2ZBVThyODM1YlBt?=
 =?utf-8?B?SGt4UFV2UnZuZEhRR1dIZ05aKzV4WldPS0JUdDRoRVRNaVd6azdab2ZTcExI?=
 =?utf-8?B?ekpWSmR1Z0VPQ3c5NCttOTNqWDVLRVNYTWIxL0YvNTBObG9PNUM1amgzeU1P?=
 =?utf-8?B?TlpZUXpQWXVKcndxajZ3RVJPNXViNFg3UVFSMk9iU3ZYS0QvNk9MNnI2WTAw?=
 =?utf-8?B?VmxFWHdDdTdNV0w1UVZVaUd1TjJYQ0FlVmlpSG5lK2ZxTm96d2F6bko2V25C?=
 =?utf-8?B?NGtXblhha2U5OXNMQVRmWWxNVWNvakhOblU2SWQrTHFhNHZJSXc3V2xmOTlC?=
 =?utf-8?B?LzhqSVpxRVZaUjNZMG5FaWdsVnFHQTYveHhEdDZFV3UyZ2swUWlyVDQ0OEdz?=
 =?utf-8?B?eXVrYjcvY2R3OWxuZE1tTzNmOXB5VUpKaFJzYzBSN2JpeG9ER1MzeGVOdXJq?=
 =?utf-8?B?QzhaRVAzOFBVUnhPWjVkYlNERGJ6VE1LSXFNODBITGN4bGM2OGdJMlQzcnlm?=
 =?utf-8?B?NllFU21WelJDV1hLUElOM254T1ZWTmt1U3Z2cXhQbFk5ak90cHJzQlNoRmZm?=
 =?utf-8?B?UWtnRmRDSE9YK29kZnY5RFYyRkNvZVlMYnhOU053Yk1rZElmbFczMGJFVVU3?=
 =?utf-8?B?MVROcXh1RDdtVUs2TXhKaXR4bXV3dG9sc29JYXp3dzUwUGIxKzN3TWdWZlRK?=
 =?utf-8?Q?17MMwK2Kop75gvx4UUcl95E00?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3f77da-4df8-4d66-5041-08dde62b8085
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB10373.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:07:47.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SZE9JBDhW78tlhVtxvCzILqc6ibbn3wZBWwMqtYfKcsONUfHuASCDKt20BIFvBEIJVB7tjRhojtrQdvs0tQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9234


On 8/16/25 22:53, Alexandre Belloni wrote:
> [Some people who received this message don't often get email from alexandre.belloni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Hi,

Sorry if I missed some information in the commit message. I will update 
the commit message in next patch set.

> Hello,
>
> I'm sorry for the delay I was planning to take this during the previous
> cycle based on the commit message but after review, the patch does more
> than what the commit says.
>
> On 29/04/2025 15:59:21+0200, Anders Sandahl wrote:
>> Introduce support for saving a timestamp triggered by an external
>> event via the EVIN pin. After an event detection, the timestamp can be
>> retrieved from timestamp0 in sysfs.
>>
>> Also add a sysfs control timestamp0_write_nvmem to enable the RX8111
>> feature that stores timestamps in NVMEM as a circular buffer.
>>
>> Signed-off-by: Anders Sandahl <anders.sandahl@axis.com>
>> ---
>> The Epson RX8111 device has support for saving a time stamp when a
>> hardware trigger occurs. It also has a register area that can be used
>> as non-volatile memory.
>>
>> Datasheet: https://download.epsondevice.com/td/pdf/app/RX8111CE_en.pdf
>>
>> Timestamp is made available in the same manner as in "rtc-rv3028.c"
>> through sys-fs. NVMEM is made available using the framework functions.
>> ---
>>   drivers/rtc/rtc-rx8111.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 349 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-rx8111.c b/drivers/rtc/rtc-rx8111.c
>> index 8450d9f0b566c63bca04988d892ea4db585ac526..4f428eb98f4858b4c70b3a5709d8204a77d0a1ea 100644
>> --- a/drivers/rtc/rtc-rx8111.c
>> +++ b/drivers/rtc/rtc-rx8111.c
>> @@ -58,7 +58,14 @@
>>   #define RX8111_FLAG_XST_BIT BIT(0)
>>   #define RX8111_FLAG_VLF_BIT BIT(1)
>>
>> +#define RX8111_REG_TS_RAM_START              0x40    /* Timestamp RAM area start. */
>> +#define RX8111_REG_TS_RAM_END                0x7f    /* Timestamp RAM area end. */
>> +
>> +#define RX8111_BIT_EVIN_SETTING_OVW  BIT(1)  /* Enable overwrite timestamp RAM. */
>> +#define RX8111_BIT_EVIN_SETTING_PU1  BIT(3)  /* Pull up select 1. */
>> +
>>   #define RX8111_TIME_BUF_SZ (RX8111_REG_YEAR - RX8111_REG_SEC + 1)
>> +#define RX8111_TS_BUF_SZ (RX8111_REG_TS_YEAR - RX8111_REG_TS_SEC + 1)
>>
>>   enum rx8111_regfield {
>>        /* RX8111_REG_EXT. */
>> @@ -98,6 +105,11 @@ enum rx8111_regfield {
>>        /* RX8111_REG_STATUS_MON. */
>>        RX8111_REGF_VLOW,
>>
>> +     /* RX8111_REG_TS_CTRL1. */
>> +     RX8111_REGF_TSRAM,
>> +     RX8111_REGF_TSCLR,
>> +     RX8111_REGF_EISEL,
>> +
>>        /* Sentinel value. */
>>        RX8111_REGF_MAX
>>   };
>> @@ -134,12 +146,16 @@ static const struct reg_field rx8111_regfields[] = {
>>        [RX8111_REGF_CHGEN]  = REG_FIELD(RX8111_REG_PWR_SWITCH_CTRL, 7, 7),
>>
>>        [RX8111_REGF_VLOW]  = REG_FIELD(RX8111_REG_STATUS_MON, 1, 1),
>> +
>> +     [RX8111_REGF_TSRAM]  = REG_FIELD(RX8111_REG_TS_CTRL1, 0, 0),
>> +     [RX8111_REGF_TSCLR]  = REG_FIELD(RX8111_REG_TS_CTRL1, 1, 1),
>> +     [RX8111_REGF_EISEL]  = REG_FIELD(RX8111_REG_TS_CTRL1, 2, 2),
>>   };
>>
>>   static const struct regmap_config rx8111_regmap_config = {
>>        .reg_bits = 8,
>>        .val_bits = 8,
>> -     .max_register = RX8111_REG_TS_CTRL3,
>> +     .max_register = RX8111_REG_TS_RAM_END,
>>   };
>>
>>   struct rx8111_data {
>> @@ -147,8 +163,224 @@ struct rx8111_data {
>>        struct regmap_field *regfields[RX8111_REGF_MAX];
>>        struct device *dev;
>>        struct rtc_device *rtc;
>> +     spinlock_t ts_lock;     /* Don't allow poll of ETS bit when it's temporarily disabled. */
>>   };
>>
>> +static ssize_t timestamp0_store(struct device *dev,
>> +                             struct device_attribute *attr, const char *buf,
>> +                             size_t count)
>> +{
>> +     struct rx8111_data *data = dev_get_drvdata(dev);
>> +     int ret, etsval;
>> +
>> +     /*
>> +      * Clear event only if events are enabled. This is to protect
>> +      * us from losing events in the future if events have been disabled
>> +      * by mistake (error in read function).
>> +      */
>> +     spin_lock(&data->ts_lock);
>> +     ret = regmap_field_read(data->regfields[RX8111_REGF_ETS], &etsval);
>> +     spin_unlock(&data->ts_lock);
>> +
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not read ETS (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     if (!etsval)
>> +             return -EINVAL;
>> +
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_EVF], 0);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not write EVF bit (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_TSCLR], 1);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not write TSCLR bit (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return count;
>> +}
>> +
>> +static ssize_t timestamp0_show(struct device *dev,
>> +                            struct device_attribute *attr, char *buf)
>> +{
>> +     struct rx8111_data *data = dev_get_drvdata(dev);
>> +
>> +     struct rtc_time tm;
>> +     int ret, evfval;
>> +     u8 date[RX8111_TS_BUF_SZ];
>> +
>> +     /* Read out timestamp values only when an event has occurred. */
>> +     ret = regmap_field_read(data->regfields[RX8111_REGF_EVF], &evfval);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not read EVF (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     if (!evfval)
>> +             return 0;
>> +
>> +     spin_lock(&data->ts_lock);
>> +
>> +     /* Disable timestamp during readout to avoid unreliable data. */
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 0);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not disable timestamp function (%d)\n",
>> +                     ret);
>> +             goto err_out;
>> +     }
>> +
>> +     ret = regmap_bulk_read(data->regmap, RX8111_REG_TS_SEC, date,
>> +                            sizeof(date));
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not read timestamp data (%d)\n", ret);
>> +             goto err_out;
>> +     }
>> +
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not enable timestamp function (%d)\n", ret);
>> +             goto err_out;
>> +     }
>> +
>> +     spin_unlock(&data->ts_lock);
>> +
>> +     tm.tm_sec = bcd2bin(date[0]);
>> +     tm.tm_min = bcd2bin(date[1]);
>> +     tm.tm_hour = bcd2bin(date[2]);
>> +     tm.tm_mday = bcd2bin(date[4]);
>> +     tm.tm_mon = bcd2bin(date[5]) - 1;
>> +     tm.tm_year = bcd2bin(date[6]) + 100;
>> +
>> +     ret = rtc_valid_tm(&tm);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sprintf(buf, "%llu\n",
>> +                    (unsigned long long)rtc_tm_to_time64(&tm));
>> +
>> +err_out:
>> +     spin_unlock(&data->ts_lock);
>> +     return ret;
>> +}
>> +
>> +static DEVICE_ATTR_RW(timestamp0);
>> +
>> +static ssize_t timestamp0_write_nvmem_store(struct device *dev,
>> +                                         struct device_attribute *attr,
>> +                                         const char *buf, size_t count)
>> +{
>> +     struct rx8111_data *data = dev_get_drvdata(dev);
>> +     bool enable;
>> +     int ret;
>> +
>> +     if (count < 1)
>> +             return -EINVAL;
>> +
>> +     ret = kstrtobool(buf, &enable);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_TSRAM],
>> +                              enable ? 1 : 0);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not set TSRAM bit (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return count;
>> +}
>> +
>> +static ssize_t timestamp0_write_nvmem_show(struct device *dev,
>> +                                        struct device_attribute *attr,
>> +                                        char *buf)
>> +{
>> +     struct rx8111_data *data = dev_get_drvdata(dev);
>> +     int enable;
>> +     int ret;
>> +
>> +     ret = regmap_field_read(data->regfields[RX8111_REGF_TSRAM], &enable);
>> +     if (ret) {
>> +             dev_dbg(dev, "Could not read TSRAM bit (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return sprintf(buf, "%s\n", enable ? "1" : "0");
>> +}
>> +
>> +static DEVICE_ATTR_RW(timestamp0_write_nvmem);
> Any new ABI has to be documented. Also, sysfs is probably not the
> correct interface for this, I've been planning to come up with an
> architecture document for a while, I'll try to do so soon after ELCE.

Is it better to put this as a devicetree property and document the 
bindings?

>
>> +
>> +static int rx8111_sysfs_register(struct device *dev)
>> +{
>> +     int ret;
>> +
>> +     ret = device_create_file(dev, &dev_attr_timestamp0);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = device_create_file(dev, &dev_attr_timestamp0_write_nvmem);
>> +     if (ret)
>> +             device_remove_file(dev, &dev_attr_timestamp0);
>> +
>> +     return ret;
>> +}
> Please use rtc_add_groups, the probability of one succeeding and the
> other one failing is super low.
I will fix this in next patch set.
>
>> +
>> +static void rx8111_sysfs_unregister(void *data)
>> +{
>> +     struct device *dev = (struct device *)data;
>> +
>> +     device_remove_file(dev, &dev_attr_timestamp0);
>> +     device_remove_file(dev, &dev_attr_timestamp0_write_nvmem);
>> +}
>> +
>> +static int rx8111_setup(struct rx8111_data *data)
>> +{
>> +     int ret;
>> +
>> +     /* Disable multiple timestamps; area is used for nvmem as default. */
>> +     ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL2, 0);
>> +     if (ret) {
>> +             dev_dbg(data->dev, "Could not setup TS_CTRL2 (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL3, 0);
>> +     if (ret) {
>> +             dev_dbg(data->dev, "Could not setup TS_CTRL3 (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     /* Configure EVIN pin, trigger on low level. PU = 1M Ohm. */
>> +     ret = regmap_write(data->regmap, RX8111_REG_EVIN_SETTING,
>> +                        RX8111_BIT_EVIN_SETTING_PU1 |
>> +                                RX8111_BIT_EVIN_SETTING_OVW);
>> +     if (ret) {
>> +             dev_dbg(data->dev, "Could not setup EVIN (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     /* Enable timestamp triggered by EVIN pin. */
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
>> +     if (ret) {
>> +             dev_dbg(data->dev, "Could not enable timestamp function (%d)\n",
>> +                     ret);
>> +             return ret;
>> +     }
>> +
> This is where lies the difficulty of getting the interface right. We
> can't hardcode any configuration in the driver as this means that we
> deviate from the defaults without providing a userspace interface.
> However, we need that interface to be generic enough for all RTCs. As
> aid, I have a draft that I need to refine.

Can this also be in devicetree? Or should I wait for your documentation?

>
>> +     /* Disable all interrupts. */
>> +     ret = regmap_write(data->regmap, RX8111_REG_CTRL, 0);
>> +     if (ret) {
>> +             dev_dbg(data->dev, "Could not disable interrupts (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
> This can't be done in probe as this is disabling all alarms in probe.
> Alarms have to survive across reboots. It also clears the STOP bit which
> must only be done after setting the time.
Ok, I'll update this in next patch set.
>
>> +     return 0;
>> +}
>> +
>>   static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>>   {
>>        int ret;
>> @@ -160,6 +392,17 @@ static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
>>        return ret;
>>   }
>>
>> +static int rx8111_clear_vl_flag(struct rx8111_data *data)
>> +{
>> +     int ret;
>> +
>> +     ret = regmap_field_write(data->regfields[RX8111_REGF_VLF], 0);
>> +     if (ret)
>> +             dev_dbg(data->dev, "Could not write VL flag (%d)", ret);
>> +
> This was not in your commit message and this was left out because this
> can only be done after setting the time. After reading the datasheet
> closer, we should even set all the registers again after this event. Why
> would you simply clear the bit?

I have seen both clearing of the bit in the set function and by the 
ioctl. It seams like different drivers does this differently, I don't 
know why and I have not studied the datasheet for all other RTC's that 
there are support for in those drivers. I will keep it in the set time 
function and drop the ioctl. I will add this to the commit message in 
next patch set.

>
>> +     return ret;
>> +}
>> +
>>   static int rx8111_read_time(struct device *dev, struct rtc_time *tm)
>>   {
>>        struct rx8111_data *data = dev_get_drvdata(dev);
>> @@ -289,11 +532,69 @@ static int rx8111_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>>                vlval |= regval ? RTC_VL_BACKUP_LOW : 0;
>>
>>                return put_user(vlval, (typeof(vlval) __user *)arg);
>> +     case RTC_VL_CLR:
>> +             return rx8111_clear_vl_flag(data);
>>        default:
>>                return -ENOIOCTLCMD;
>>        }
>>   }
>>
>> +static int rx8111_nvram_write(void *priv, unsigned int offset, void *val,
>> +                           size_t bytes)
>> +{
>> +     struct rx8111_data *data = priv;
>> +     int ret, len;
>> +
>> +     /*
>> +      * The RX8111 device can only handle transfers with repeated start
>> +      * within the same 16 bytes aligned block.
>> +      */
>> +     while (bytes > 0) {
>> +             len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
>> +             ret = regmap_bulk_write(data->regmap,
>> +                                     RX8111_REG_TS_RAM_START + offset, val,
>> +                                     len);
>> +             if (ret) {
>> +                     dev_dbg(data->dev, "Could not write nvmem (%d)\n", ret);
>> +                     return ret;
>> +             }
>> +
>> +             val += len;
>> +             offset += len;
>> +             bytes -= len;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int rx8111_nvram_read(void *priv, unsigned int offset, void *val,
>> +                          size_t bytes)
>> +{
>> +     struct rx8111_data *data = priv;
>> +     int ret, len;
>> +
>> +     /*
>> +      * The RX8111 device can only handle transfers with repeated start
>> +      * within the same 16 bytes aligned block.
>> +      */
>> +     while (bytes > 0) {
>> +             len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
>> +             ret = regmap_bulk_read(data->regmap,
>> +                                    RX8111_REG_TS_RAM_START + offset, val,
>> +                                    len);
>> +             if (ret) {
>> +                     dev_dbg(data->dev, "Could not read nvmem (%d)\n", ret);
>> +                     return ret;
>> +             }
>> +
>> +             val += len;
>> +             offset += len;
>> +             bytes -= len;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>>   static const struct rtc_class_ops rx8111_rtc_ops = {
>>        .read_time = rx8111_read_time,
>>        .set_time = rx8111_set_time,
>> @@ -305,6 +606,16 @@ static int rx8111_probe(struct i2c_client *client)
>>        struct rx8111_data *data;
>>        struct rtc_device *rtc;
>>        size_t i;
>> +     int ret;
>> +     struct nvmem_config nvmem_cfg = {
>> +             .name = "rx8111_nvram",
>> +             .word_size = 1,
>> +             .stride = 1,
>> +             .size = RX8111_REG_TS_RAM_END - RX8111_REG_TS_RAM_START + 1,
>> +             .type = NVMEM_TYPE_BATTERY_BACKED,
>> +             .reg_read = rx8111_nvram_read,
>> +             .reg_write = rx8111_nvram_write,
>> +     };
>>
>>        data = devm_kmalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>>        if (!data) {
>> @@ -312,6 +623,8 @@ static int rx8111_probe(struct i2c_client *client)
>>                return -ENOMEM;
>>        }
>>
>> +     spin_lock_init(&data->ts_lock);
>> +
>>        data->dev = &client->dev;
>>        dev_set_drvdata(data->dev, data);
>>
>> @@ -331,6 +644,10 @@ static int rx8111_probe(struct i2c_client *client)
>>                }
>>        }
>>
>> +     ret = rx8111_setup(data);
>> +     if (ret)
>> +             return ret;
>> +
>>        rtc = devm_rtc_allocate_device(data->dev);
>>        if (IS_ERR(rtc)) {
>>                dev_dbg(data->dev, "Could not allocate rtc device\n");
>> @@ -343,7 +660,37 @@ static int rx8111_probe(struct i2c_client *client)
>>
>>        clear_bit(RTC_FEATURE_ALARM, rtc->features);
>>
>> -     return devm_rtc_register_device(rtc);
>> +     ret = devm_rtc_register_device(rtc);
>> +     if (ret) {
>> +             dev_dbg(data->dev,
>> +                     "Could not register rtc device (%d)\n", ret);
>> +             return ret;
>> +     }
> devm_rtc_register_device has to come last, you must not fail after a
> successful call.
I will fix this in nest patch set.
>
>> +
>> +     ret = rx8111_sysfs_register(data->dev);
>> +     if (ret) {
>> +             dev_dbg(data->dev,
>> +                     "Could not create sysfs entry (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = devm_add_action_or_reset(data->dev, &rx8111_sysfs_unregister,
>> +                                    data->dev);
>> +     if (ret) {
>> +             dev_dbg(data->dev,
>> +                     "Could not add sysfs unregister devres action (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     nvmem_cfg.priv = data;
>> +     ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
>> +     if (ret) {
>> +             dev_dbg(data->dev,
>> +                     "Could not register rtc nvmem device (%d)\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>>   }
>>
>>   static const struct of_device_id rx8111_of_match[] = {
>>
>> ---
>> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
>> change-id: 20250424-rtc-rx8111-events-df9a35810a73
>>
>> Best regards,
>> --
>> Anders Sandahl <anders.sandahl@axis.com>
>>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

BR Anders Sandahl


