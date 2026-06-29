Return-Path: <linux-rtc+bounces-6780-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qZs3OnqPQmoX9wkAu9opvQ
	(envelope-from <linux-rtc+bounces-6780-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 17:30:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18F6DCAFE
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 17:30:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=axis.com header.s=selector1 header.b=khNWKzuO;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6780-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6780-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=axis.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F3432A99A1
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16B421886;
	Mon, 29 Jun 2026 15:07:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84A3BFAE0;
	Mon, 29 Jun 2026 15:07:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745663; cv=fail; b=PGPYdU5jehGLA5IBO/53qM8VtGmZUn6ZrfiBGnJka/dOBYwh30KZjLWylE9YpKE2ZXfoOGfaPxRNvJ0EKuiXZ7zEqBDTdrqClTcHAQJ5llvWwVYEYB+X8I48BbqEee2UWQrQ/ehKeSvqdNaTHIrEm8sDl8fpiPhEoz4UzGpzmzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745663; c=relaxed/simple;
	bh=nBVhkVWu8ECGEFKjY1i0C/o9b+522MiDg8b/vfXjzeI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=knYcRPix3qGKRvtxhZ69WaKUnHcZVHpn0IYhXBdzHNF9MhoyLrKVzdSaBLnhmH302myO+g1v5ol0/RxJopreSmkLQlugtm2e1l0XnwdJM95gOyBrxPrUkf52LqMQPGIsqlu4zNQj94pfkZcGFRk7oj20wdT4/dIBQUIQE9Aq54Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=khNWKzuO; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxCNWfqgjlLz3MVIPsLIMwEv8QllywQW3SogP/BIiUvDjbPcq20yLhhVV1KJqBnof/e79amZKMVGrYCLH8Adhka8xm07dR8k4HyMqEHhGyXs0R2Uxn5rNJ4ZS17VSalKRH8u2Ai5sGbl3hS66u54GhCjmzJYRB9xGww3ltmgysF+m0yoOLYDXPTl+fRC3qYGyK72sr7r04l2Q+UjcyPrIRc7YASwgvMc0slyiaCygLVEk8O0ohCdM2nJygiVSMYkDcm+hJO4eAZ6fJYgbNrscS/abUAymQqCzJDf/iXgFYqN8J7Pq9DA1tHdVK7FLQU8W7d0ELMmRd7TgGj50by6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4DgZZkb7g74X1boMWwpi7veSJNV65kz+nXXgB9BNGQ=;
 b=kmu4fJ5+wpWlkpU+NjFTixs5z7uHco4Xom5q4RvcXWj42EXsYXWsNemmIPNy7miM7RqXBsU9AbpzSgtseFxs3Me62NaHps8CSJyZlDG8x7p/ozDK0MXv/tg2Uo2a1v2l3NikXpilq11h1xf0ylZPoqnEMADYgqDbaMdjfvbb6W7vmzEzyNl8P8CQh9lL0G56cW18hisg9SMOEVHEvCrOAOOP09Gu3Q96UOVoBZ7+gH7eXQHX5b5MbFjWXHOwOqqdg+YEvFZkyhGRr42ZAqPxs7LFxksvmt9eCeA2prgWYvM7CTEo0Hm90VfGwNw3Iw7edhd9O5mn1SLpB4cFoGE7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4DgZZkb7g74X1boMWwpi7veSJNV65kz+nXXgB9BNGQ=;
 b=khNWKzuOOYB+tB/ofqnXrlq5Aw60y4OYl2xxWj9v10Zs6ucb56e5nZpChTmqO+nIGFDWnV/HavQqCXJEALufXxVbSD+nfXnp6LyS12X9mxIbj+f4BDDSfrylQWrlh7uilsY9AaC6J9KACNFqHaHrW+pBLuhBfEALXF3glR66dLM=
Received: from PAXPR02MB7344.eurprd02.prod.outlook.com (2603:10a6:102:1c7::8)
 by DU4PR02MB11667.eurprd02.prod.outlook.com (2603:10a6:10:646::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 15:07:38 +0000
Received: from PAXPR02MB7344.eurprd02.prod.outlook.com
 ([fe80::f0f2:8c3c:c869:c51d]) by PAXPR02MB7344.eurprd02.prod.outlook.com
 ([fe80::f0f2:8c3c:c869:c51d%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:07:38 +0000
Message-ID: <15a69d23-02e1-4f10-84cc-a7888fa555c4@axis.com>
Date: Mon, 29 Jun 2026 17:07:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rtc: ds1307: Add driver for Epson RX8901CE
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com
References: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
 <20260520-ds1307-rx8901-add-v2-3-e069ea32e1db@axis.com>
 <20260624213847b0e6c315@mail.local>
Content-Language: en-US
From: Fredrik M Olsson <fredriol@axis.com>
In-Reply-To: <20260624213847b0e6c315@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0034.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::15) To PAXPR02MB7344.eurprd02.prod.outlook.com
 (2603:10a6:102:1c7::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR02MB7344:EE_|DU4PR02MB11667:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe90ec7-bda3-4dec-3735-08ded5f02893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	q7yo/1mRx6dKd+2Z9OII7ZQ0Rgukb9bqBZvDdfOqtELKJhIVeK11JYXRbUdIxg79m+A17QXDhxnlg+bC2JZm5yaso681W26LyYiEvbqhknD9WgZYgxrL9f3CsUaS77jkjcGPrRTuFy8eoV6kMnfihll7+M4tzRyW+AEvbr1la6HrnjvZcCj7nKNJhe+UI47KCE8yTXooLa4Om/emuhax5Zvt96KIsNeeozvFVCGdS87q38k2t3iQYA5FseBTjq2ZoVVKf8TDN51dne2iZ5UXZY/n7G+I7WG5+8CO0Vyyq2iZv3R9OL/wqjfgQ4As8czl1X2T3XyoRYMEi2ZcH0p8bA9JF6SuLffW1695Bk1ZeYCKHtqzwmsE9U5KjFhAV/QBu4F1aYONlwiEvPzgpPTKqrrOvOBvVoukBOy/Sx3UutxWx6aoyschTTLOZGRJ0nNer6HUF7d6erjYe3KepphuZDuQ1pJ+GF1IyiXGqs6vyhdveYWKbqgebXpJCRLSm3uo5iq8cqJu/MJzNQZ5fTsXPs5le3h2IqylCb0pM9zL9UCWAIH8WyyTa4Cy2S+dtlahdiJuHviFOF6uYrW9N58O0Qx/hPnqt/bDR3t76mon0iq14XUlpfe5Pv0BRAIGut8nik/eqAqhlobC5DodOVBJcBZcSJZowuQ4bWZ83nrqpQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7344.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRnYytTQ2R2aHRwYnhMRk5rdXFsRkovZFUwODR2RnJGQk1NaW9BS3o3QS9u?=
 =?utf-8?B?ODh5endWU0s0aFIvOU5qQzZncGdHYmlvUCtRV281bGNkYUovR09uN09CZ2dx?=
 =?utf-8?B?UGJtMnRtMWM1OERWUGZSY0pDdzNLZU5hemdmSUovenNZalB3dzRTK1Fjc0x6?=
 =?utf-8?B?QmZ1aU1UUzNwOUNISWxFNnpqWS95eDR4Vkk0enY4bUJUZ0drZnZkN1k5WUJi?=
 =?utf-8?B?dmZGclpqWEkwYTJ0RjE3NGxTbjU4YTNIYkZWalVsdThoQm9GVWVTRWJiR25T?=
 =?utf-8?B?YjV1MFN3MUZ4Wm9PTXpwM0Nxd2pVTW5XVXMzV3o1L2lKbHhzTXhkVzhaYnhm?=
 =?utf-8?B?OTRKRnNCaWZIaEpBeUplOUhJejRsWFg3akFFRW5OQ3R4K09WUi9xSGMyRkVO?=
 =?utf-8?B?azF4bHF2VWRFaG5MWUhOaTF2eFlMcno4eEY0c1lrd1BzQnBmQXBFMjFtL3hM?=
 =?utf-8?B?dzljRHRXT2g3QWQ0MXY4ejdKUi9Fc0NpSzdiWjAxQU52RjROUjJxQTFVSWkx?=
 =?utf-8?B?RC82ZGlMRVViaHc5MXArRW1zb05lUWlaUWlMc3lWU09UUllHWkdXUWVkZ3RF?=
 =?utf-8?B?S2ppV2pURFFzNC9adWx3WW94dXI3NW5LY0xkKy9mR2FlWkRISlJITERiNXp1?=
 =?utf-8?B?K3d4UGFtWnBIZnR0bzRUT05vMkszcTZDdWRYNjQ5UUsrS1V3YkdTcm0wRVIr?=
 =?utf-8?B?WFJvYnA4eWF6eUd5dWl1dHNndi9yVU5Rak1SMEovQWg4RzF1eHV4eDVuaHNK?=
 =?utf-8?B?NFlhdlpLWlhyb2hSYmYyVWFHc0d5b2ZDcTVGUmcxM0xmTFVZbUhPeTJpdStp?=
 =?utf-8?B?MnRBYk1Fd24ydXdSeEtnVkx1WmN6djVMM3hEekxIQnYyQnZJTVdCRGtVM1dm?=
 =?utf-8?B?bEM3MEZJbjhDRXdGUWJ4WHVlL0NsVUVnRUhDYlNGVEQ2Q2h2WHdJbHpTTU9y?=
 =?utf-8?B?cjcvS2wvTU5wamVaVEtyeEFoWVhKaEpKcFQ0MklMai9UcWVRdUZoMURTUWlD?=
 =?utf-8?B?TTRMQkYwK3JPNXNYWEpqR3krZHpSWkc4ZmU3eHVMQi9OdmtxY0lZMWl1NnZN?=
 =?utf-8?B?MnNWSEFDRmhPOWlKTGNnM01ZZjFzQmpEWTJ2N2xDdzIrWW55dko2U0F5RHJi?=
 =?utf-8?B?MFZzR1lKWExoejRoaDNpNW5TR0lWRWMyQWxVM0VqcVZ6eWxETCtiWjRjdXB0?=
 =?utf-8?B?NGJWOUZvdmhlZmdJdzJjY0RXdzZJa200WVhocG9XRkNyaFEvUWswVFN6NnQ5?=
 =?utf-8?B?Nm5ONUhQMmZFRGtzcDM5cHFNUEdoRk5lQjVZenFQNWlKcVpHdkR6TkphNnJ2?=
 =?utf-8?B?Sk5xR211cXFzdXRvaVozQWQzMCtLS0tZNXRFazVJeHVlcGlkSlA2dzE2eGhm?=
 =?utf-8?B?STljUUZ1UnhCZ0t6UnJBOEdVVzBRTXQ5SUNNUlg2MW00VTBDNkZMQ1ZpVWhh?=
 =?utf-8?B?RU8rdmFvYjBrb1JoWUVYTEpLN0tQTno5N29zOXF0eDVEa0xGUzcxZXdSZlZE?=
 =?utf-8?B?OFMzTUh1bEZHVTRILzRMV25sOXZOcFR1bVZzOWNoRFJhNUVoYjd5K21NM09z?=
 =?utf-8?B?QndHamwzV2VQdU85NTZkM3JYOGhCWnNJVDJyWGJFUmhuUnR2UVl2U2JhVXZv?=
 =?utf-8?B?eFdXdTRacjFJYzQ5S09pR0FVcEQ3d0xEbnFQbVl1RzBZcHV0d2N6NTYzYTRB?=
 =?utf-8?B?MkIvU3NnSllucTIxUGV1eVJ4aTkwNDYzWWpManZSMWVYdS9PM2JGSXVDL2hB?=
 =?utf-8?B?cTNzWTZ1WmpMR0FlL0tBUnlBRmIrRFVMa2NHU3dBRUlLYXpKbDFSTUUwaGdu?=
 =?utf-8?B?QU1IVDhLa0wyQ1F5eXRVUUwwbjY1dk1zTGhsNnNZVDlhOGczVjh0cG5uUlN5?=
 =?utf-8?B?Zjl2YUQ2SmlJSml1TEp1cnNjdEpaREE0M040UElHV2NaQXlCNFp5Z1BiRDdt?=
 =?utf-8?B?RjBaMWtxTnVILytobDdTNC92QXdGaVJQRzlsVGYzeldJYzY1K2QvMlE2eXRv?=
 =?utf-8?B?RHpQQnBnazc5dDlMWmZ3N1JMVVFHNVlxMGNWWmlJNGtaSEJRSStBKzl3MXFx?=
 =?utf-8?B?ODhiYnpISW1BeGdQOXJRcjE4UWpUaFBkZXJKZm0vU0xUSWZkYWI4YngyT3hH?=
 =?utf-8?B?dVdyZkM2bndKeHo1YWp2eVVBWktaYWd5ZGdRc1pTSGNXREd4RTB2Zm9yQ2Zx?=
 =?utf-8?B?ME9MUTN6UElWT1IwTG52K3c4UG9qelYrUWZlRzB3czI5ZHZrSDNUY0tjeWwr?=
 =?utf-8?B?Mi83ZllPcnF3M3UxV3FYZmVZeElNZlR6WllHVTMzU2Q1OU8vdUFUeWNnZmhB?=
 =?utf-8?Q?Q9D4PSSNgJ1UWO2Wk1?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe90ec7-bda3-4dec-3735-08ded5f02893
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7344.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:07:38.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLY5IYP+jAb52OTdyp3aIxeu/bip9oKiWk+9fP4ajOA2QHtzr3vc83YJitrDwSJLzhuMdXcx65HEEONBDqRbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11667
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6780-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fredriol@axis.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:fredrik.m.olsson@axis.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@axis.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[axis.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredriol@axis.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axis.com:dkim,axis.com:mid,axis.com:from_mime,aka.ms:url,bootlin.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D18F6DCAFE

On 6/24/26 23:38, Alexandre Belloni wrote:
> [Some people who received this message don't often get email from alexandre.belloni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 20/05/2026 16:48:55+0200, Fredrik M Olsson wrote:
>> +static int do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __always_unused, bool diode)
>> +{
>> +     int ret;
>> +     unsigned int setup;
>> +
>> +     ret = regmap_read(ds1307->regmap, RX8901_REG_PWSW_CFG, &setup);
>> +     if (ret) {
>> +             dev_err(ds1307->dev, "Failed to read PWSW_CFG register\n");
>> +             return ret;
>> +     }
>> +
>> +     /* Enable low battery voltage detection */
>> +     setup |= RX8901_REG_PWSW_CFG_VBATLDETEN;
>> +
>> +     if (diode)
>> +             setup |= RX8901_REG_PWSW_CFG_CHGEN;
> 
> When diode is false, you need to explicitly clear
> RX8901_REG_PWSW_CFG_CHGEN so it is possible to actually disable trickle
> charging once it has been enabled has the register is battery backed.

Okay thanks I will update that in v3.


-- 
/Fredrik

