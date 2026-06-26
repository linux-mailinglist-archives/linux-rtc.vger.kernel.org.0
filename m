Return-Path: <linux-rtc+bounces-6766-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 321aMNpzPmpwGQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6766-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jun 2026 14:43:06 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6D6CD172
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jun 2026 14:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=0DvQHZ8I;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6766-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6766-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AEB530221E3
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jun 2026 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6123A3F4DCC;
	Fri, 26 Jun 2026 12:42:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92317C220;
	Fri, 26 Jun 2026 12:42:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477779; cv=fail; b=B16P9VXEyvts3fOzOlhqYxsdFl+geM9X4yfjx3RutE2N90tw0lDEnlb24cJqPYWDyNW06WqChs4rZJp4tQ05LgZSyTsVCHYvMi87d3y3WuyOGjn652/bxzJHV14g4pt9hXmyc5jvDZHH+QKb0o0HR8Uc+o4cJnAM8GfFtYrn9ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477779; c=relaxed/simple;
	bh=PdqBEQVqy7ryz3MLNrfuhOa0xaMnjb8NWsvLqqLAi0c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z8vw5XJwTIP9EZTDy5mPvFVBoSo/UbR0CeTDYAvmxTgitD4/fR7b5puTVyQjvQJoUWGDbrLSAhQbvjOjePLJAvQIMWAFvf27dFC7+IROMlJxPhXKQsoD6cGJE6QLJal1X/3LOjR1ZVHSqZSJTqI3r0qTXgdm6xDpUtDfvNcafZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0DvQHZ8I; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u20YH9Y5MlbOvpFp1LBDmKp7ROrFRD+KRArQP9hGyU4UAM7QM/nzULXw+maxuUeOFTiIcD3FSaKRhIZ5eiU14a14pYMXmJGjp5LkZk0yEOKHtVnhVeXabjlOLfzqaMhjlJuhFZUq1HsSdVjWN1cwoo0jt99cbwJYMPYvNJYkc/y+pJSlCJBVuIXz+WhfzTlPJJGn/SOsKVA+t2bjZpMabj9qRvK+mWRjA2m+OS2kmBTnDxIJUOA9FWBsOQG2bXT1GleAR8oSXWip+7wjwZyO4yIIfm+XWpdoJj2MxmRrsIXGaOXMD5keVMiHztlSCVCZrQOKrNeXbJydiQD2VEB87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWJFgNME7dQQBnoPSKX1B2G2xv0S4e9tDudbDLxN9Bw=;
 b=UicDKxSC9WbQ4oa0Z8qks7xbPjssHqXCyUfhBmkrCQan+bdvX/v/c9uuIW1ZHZ/oe80vaVFk+/8BTQaBhrsFUxLj9jARwYKgC6cL5xltSJb3nyzoL0zN/kcA4TP6zlZNJnnGFOhy7Qo6TNXYcIa6gWoexso0QD0gmsnL1G+pV2GkxERO01gx2XvOZlZ8H4HtZ634EJ5kOqAAxNdZNGFo2Tnt2nUVMTKJNXo3O9H+pKcogsyVYWLYmnOTLF+RwTsFQdgP+zw3mDHxarJpre3aHuCLtXTps0DKyDb58Ds3jD6B88SEPbnV5xi3xruoU76uJBfoMcUPngMuRztcfgDUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWJFgNME7dQQBnoPSKX1B2G2xv0S4e9tDudbDLxN9Bw=;
 b=0DvQHZ8IAddDAQFEGyMKe+UfOqgBb21XsSayYM0Z7tnSJclaHjb4B9v5nqhnb3t1BoSJq3iAY8hto2h4dLd2SQelfoDR65LyhuscZA0dxAr6mGowmAEIcX8jJ2t400inXdMaGy/8Xa+if9yPkFcFc/+8VFuRawQrVkGOMFLO4U8=
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:42:52 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 12:42:52 +0000
Message-ID: <223a2650-0b93-4e0e-8418-1b9678667982@amd.com>
Date: Fri, 26 Jun 2026 14:42:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: zynqmp: Return optional clock lookup errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:332::7) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d148ce3-db9a-442e-bf26-08ded3806fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2FTIQU7b9VHIMbZtwGzfDp6sM2qCyYFwXnj8DBYPshYdA4kBQxPoLCXedYa23QSH+gclTIIaLsAiniUUFqKWZw8P160TzzpnMNFjzmbYtR7f3cVOaCruSsl+l+CX6YEUsRKEa1iWozlk1MtDeSPQYXARknHtXc1WkAel9LDmNo3Ik0+WFGPAKjLYenGbJRT3sZD/wZIAtOPXhEU1kT0oB0IP1QJTqdgzGC57w6jl3dXDP6NkMXTx4m6OWWTWjtFAc5StrtIziUHf98B1KnsYzQR3BvW+ArLoGxJ/hl+hjbrD3LApiJHm/pPI6cUMWLlN2fX4xw25ZWrDQzMvi6hmOhYRcjomGllpqzEBNHtooXCL/mK8IrUjfHyL7m7mMR28hmRoqSg2msll6z7c2dvEwh15NJ/j0LUcPvhMch355Wo6Kh3RBiEGutsyfTLwOgXZdgUHvL4cIREU17zLNyq+W4EKGFvAJtVugS49COTaRSYr2e1f7HtiVnNaksGSL3krJrWEQIyCW9hsRH7VpOU0rYk+Cc/OORJ2+QiddqOP7YLusiqvhJPLrFtjc1DzE+/32LJiPQg2G3wWmZYq0+eXpgJxWBOeinGvDnA2L3jUxrDBLeJ6FvQ9pATLTn90OXN8zWp/GJjigbTICnwCwBAWL16qxvqvWqVYxmOzmrvIfC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2lVcTBucFJSVEZuRnZtMnM5V2JrWGh4S2diWVhoYmR3ekFyUHB3N2N6Zzlt?=
 =?utf-8?B?QU1zeENGa1Y3R0hmN1BtZlZxc2RnNW9ydTRqVVBhdDFUNFM1YzJoRG54cTNi?=
 =?utf-8?B?N2ZlVS85MFl1emxVdlcyeHFsaVpuT2dKUXplY1N6anRoaEtmN3BhL3JKeERI?=
 =?utf-8?B?bTcxWGN6T0RhNnlBMUUyNlVlVXNuaGhaVVJOSm9EMjdrdmRJaHIrYmo1YUpB?=
 =?utf-8?B?SWFzNzMwTDdKRWROV1hVSzlKb1RiZzVyaFlJVUdORWhJcm1hQktDTnhhem5q?=
 =?utf-8?B?cCtWMTJEb1FaUDhMRVFhbWdqWFFCZTU4N0puUTBVY2pPQVBJb0RMN0RLbXBO?=
 =?utf-8?B?ZFkyYTRRNXFyejFDazVNVXlRcFZwRSs5a3NGaUppV05PZEM1bTF4UFBlbCtO?=
 =?utf-8?B?Mnpoc0ZMV1U3QmRtbURtSW1HRFM1WHN0TVZobHNUL2JpcThHWi9EWnV2cWQ2?=
 =?utf-8?B?dmxwbERqNXl0N3cyZStqbFgvaHJvajlXcjhxLy94dEJqNGhnV25PbUIra0VE?=
 =?utf-8?B?K0NOTktndG5XY0tNTjFoQUVlM1hRRnVIcVZPMnV6Wlh3dXVqNThaNnVsa2g4?=
 =?utf-8?B?Tnd3ZmIvUVRSUFdNTUJHeGlaZ3p1WlpvclIraVZJK285UWlRVzlRTk5HYVI2?=
 =?utf-8?B?RWFDN1JYL3RoK1JjaWtyYVU0ckVwL2dBR2JnTEQ1Nzg2eDVXOW9ZNm1xcDM3?=
 =?utf-8?B?elcyd3hhRmsyZWJId2xnOS9TTzZKSlVYdzVhSVVYVUNqTWNXMU5paW02VUVG?=
 =?utf-8?B?WnR5NHBXQ2VHQlBNNVNZY0YrZnhvaFVnMFQwSW5yKzlJclpiYmJ0bTYwa3Nj?=
 =?utf-8?B?bG9ra01rM0J2c0JIdnE0N09YVjdnODBUS1lSVEFDTlU0cjgrQnZQREkzS1hv?=
 =?utf-8?B?T08xNlRZZHNvOWhLMTBRRUxmSTR0ZE92MTloN1gvNjBVOFBJTXFIN01LaEZQ?=
 =?utf-8?B?bUFnT3BjblRsMVM3aTNtQUZNRzdOQzh0UjBYUThEUjhWUGF4aGlJZUMxOUR2?=
 =?utf-8?B?dlc2TWFtZnhYSmkxQ3BWMDJNUG9JWldXcGtNRnh6UFdodWFUNVRUOGlkaGRZ?=
 =?utf-8?B?YWFubFI4MFhKUElCSUllN3FMb0M5RXpMK2JKdTBOTXQ5byszYlZ5U3d2cmV5?=
 =?utf-8?B?VmNTRmJjQWNHc2dPY1dEUkdNZStpTHFxUnBKVEZiOEllOURWcTUxdjJ6WExJ?=
 =?utf-8?B?czVPdVhFckUrNnhEaFgvVHBpVzA5Uml0VVNRQW5tbkd0N0hnci9GTFpzMjJl?=
 =?utf-8?B?U0xNSVhtQ0VaWHNjYkN0YUZxMjBpcEk1d0hFb0trQWtzRlc3R2YxNGdMeWN3?=
 =?utf-8?B?M2pFckc1RjZvNzlyS0VPZDB4cTNBU1BJdEZsQm9uZGsxckZpVmNYcHVXV0Zm?=
 =?utf-8?B?Vy8zOE9WeUlDZU5IU1pEL05PODFJL2RMRUkxaXZoVDF0UnRxWHdJMngrVzFx?=
 =?utf-8?B?NXBCYzBMUWZwSVA4OHdmaHFFcE0xSFhISk1OdXBMMmdHbHlIUXhvNjRhRU4x?=
 =?utf-8?B?a0Y2N2VOVzdqaDdDM2dZWGtadzBSOGNHMlhpTzdicXVhcjRWMFk1RDFPdTgv?=
 =?utf-8?B?S2VrZFlBaGRLZG1aV0RMUWNoNEFqNjRYS2ZlVTMwOC9Od1FkOTZKd25NS0g4?=
 =?utf-8?B?KzZ1RGpvdUZOSnVUai93WTI3TzdrQ0tmaTVMNldoRmlEUTNuS1h3U2Q5bHpj?=
 =?utf-8?B?RDdOVUs5ZHU1QTlpWDFXWlJKSUZiQmJ4bytvQ1gwemoxTE1rS2FmTlBFQnlW?=
 =?utf-8?B?NUF1dTNaWWphRlR1azBoaEFkRTNhaWV1UGk3Ukl5a2kvUi8rZDVKS0ZDTG1y?=
 =?utf-8?B?MGkxQ2thSnBXNEpERFVySHFsN2psU2phaktLSGppV2dWdUllSHJhRi9nUkVC?=
 =?utf-8?B?NWJ0UlNRWHQ5bFIxVUErK3BlbDBPcjl0SGxUamE3K1h0T2VuUW9qRXNnWUlv?=
 =?utf-8?B?ZUZHWjB1R2d4NzE3cVRtOUZ6OXVRaWJJeUErdDRZcThyTjRCODBtRlNJOTZi?=
 =?utf-8?B?d0JXZnpiZXlCNnNENVdXdnFRcko1bmhJdUlnQTFSQ3NiTTV6bGw1emV5bzVK?=
 =?utf-8?B?OVZoR0Zwcy9DTzFFcnJwRS9TcVk0RXNMdnJ4NlJrSThsaGpLcmNhTTN1SXc1?=
 =?utf-8?B?a0lKMmU2YTY1VlF0ZE1Oa0NNcitEWjZLbFB5dE4zc29CQXdMMVVyWVlNWGlJ?=
 =?utf-8?B?TUs0UHYzaTBNNy9XeVRZUmU3N25sVkp3U21Mc1p4bkxtTWoxaG5uMXlLeFRD?=
 =?utf-8?B?Q2xyNThtcnRJZXY5cE9Xb09SOFloV1BoUnJ4b3g3NVE3MDVrZGQ3UTBFZ1V0?=
 =?utf-8?B?UnRvemJ2RTgrUzVPNG8vUk9aNGc4ak9zb2VWelVnWTRUaUFhS3FCZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d148ce3-db9a-442e-bf26-08ded3806fd3
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:42:51.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDa+VmdDKwQvuKi3djqpL812cXZR6syMzU0tnkS4RsFBj4extCb0O4F7jqlwYU7+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6766-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14A6D6CD172



On 6/24/26 07:55, Pengpeng Hou wrote:
> devm_clk_get_optional() returns NULL when the optional clock is absent,
> but returns an ERR_PTR when the clock provider lookup fails.  Probe
> currently keeps the ERR_PTR and then passes it to clk_get_rate().
> 
> Return the lookup error instead.  A truly absent optional clock still
> reaches the existing calibration fallback through clk_get_rate(NULL).
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/rtc/rtc-zynqmp.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 2ae54804b87a..5bcb7536e973 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -334,10 +334,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>   
>   	/* Getting the rtc info */
>   	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc");
> -	if (IS_ERR(xrtcdev->rtc_clk)) {
> -		if (PTR_ERR(xrtcdev->rtc_clk) != -EPROBE_DEFER)
> -			dev_warn(&pdev->dev, "Device clock not found.\n");
> -	}
> +	if (IS_ERR(xrtcdev->rtc_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(xrtcdev->rtc_clk),
> +				     "Failed to get rtc clock\n");
>   	xrtcdev->freq = clk_get_rate(xrtcdev->rtc_clk);
>   	if (!xrtcdev->freq) {
>   		ret = of_property_read_u32(pdev->dev.of_node, "calibration",


Fixes: 07dcc6f9c762 ("rtc: zynqmp: Add calibration set and get support")
cc: stable@kernel.org

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

