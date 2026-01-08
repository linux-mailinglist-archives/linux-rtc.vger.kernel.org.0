Return-Path: <linux-rtc+bounces-5697-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45CBD03221
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 14:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF298302FA08
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2510C471460;
	Thu,  8 Jan 2026 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="F05BpVp7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020078.outbound.protection.outlook.com [52.101.84.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E129470F2A;
	Thu,  8 Jan 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876713; cv=fail; b=BYidb2G//Zv41caFthl5rG8AjbT/mtruOC2OE1GsXv4q35zTorKB6djPZ6j8czIyT07fNEvbF3QYttCUpmXkoPslxgq0RW1JCMqUtHrPueLwbtHz1UOOPktBrK0U798Cmlc8RnIXC/nH+0+nZGpneKwoiTs0+TxNugwUzH7tiYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876713; c=relaxed/simple;
	bh=oEUOU2sYyoKk4nt9iFwl2WKa5Zo5PQStc9bApXKp3mE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GLKp+f/9ATCSO5c6NedwLXuUkskAzbmyNUtt+tJ4ICQOwfXyEA2/+k3AwyG969jSpCqN0tP9DclWxpGB17nVvPSkVmncVND44mSmQXYi+G8i22oBKcDsXNB8aKTc6dAL7wDW/cdJF6Aq7DwwU8v3JySej9+vbaJt6kNCYsncyzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=F05BpVp7; arc=fail smtp.client-ip=52.101.84.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHsClUtx79MKMFF1J6CaSwYGnlDhxxk+KGucn8k6lbUY8dqVzr5rK2VXJg5J85R/OccOMNzaCaIdl207rrBmOUMAvAI23qzCZ04d/RfU9kxi63bkPYQ0Kjjwit8ilzyQ+v/XfpUT84cPtQulHWGjzFWV29/jTJj1hs79VX/LOYow4KHZFQo9e91d/zCKFKeYA9MJ8g0v1ZbizoFCQNUNydf91EH5VGEce0pJPZPXZfK9Cyl+zFUuMAKo1ND/SpwvvTgqcR7zhqx0pfZhgUVNoigyzh4+hnp4xxx3eQOS42YWR6kpgCneUO9HYrhKjEOUi69wkx7Rw2ihlWuzZ/8Ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzG0bwU+LT4PnpjR2b6zXeg45quwJ45Gu5XDVuUSGLM=;
 b=ZnWADmsMCNyFwa4CwVxuTfM7SjIajZg16POt4xtdrXk8wndNIia4Mm8z87UJJ9+ODSfV+0b6DZIcxGcc4c73vqP9aZt4qbpWq55SroyVT19JPycd49aXJSAQEtb6wd0albFqEw/gTorY+kiypTuVAQzGpOa4A7wax8xG/smrrZifufv2cDoFQf7U+sI0BTiEc/btFdBvskSYF1QB73wesayvTdkcwXGUpnAU2pd/0k8XUXmow4tFK2FjHJUqvL2xuRxU4ICEv09AhZxlWMJvSTN/9icOrYxiO8pkRYu4X3ax24zzKxWWkHc2ZFo8PTLu9Ma1mZsKDgjNry2ONkvKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzG0bwU+LT4PnpjR2b6zXeg45quwJ45Gu5XDVuUSGLM=;
 b=F05BpVp7UZAFfC0AxujibAI3mjjyb3df6gW6o4fHGDwcY/gU/OpwWuHxccr4XtfEr5X8HOTMUMOMhRfCdWifN9t30XzsQEphQmtQ2585Hdc3bWItnKKGqzkpmjug8grmfvXtBSMzdbBO5RXTuYc7UuC543XrG5QuCSm/UnwMgHhI2NM4FEgvlpZRADEgppLuKYCWZMzCHvY0qtpYLgvEA/pp2CAzPL2IZprxJxHsXHY3p+j4o9q6CxHDNAsmIwpNNDrZaqyRkaJcAUqNca2yhXeEp3fGmSzCeHdTsJxaoB1NMKZuVZhcTceRBfPTj3moU0e4K2SKKiB0o3w6eHY/tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB7456.eurprd06.prod.outlook.com (2603:10a6:102:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:27 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:27 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 08 Jan 2026 12:51:12 +0000
Subject: [PATCH v2 1/5] rtc: zynqmp: correct frequency value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-zynqmp-rtc-updates-v2-1-864c161fa83d@vaisala.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=828;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=oEUOU2sYyoKk4nt9iFwl2WKa5Zo5PQStc9bApXKp3mE=;
 b=vuJgVIhEyjzfN5b6NUiBrIGBrzwYbrVflIElf/sE5vs4C9LLUnyfChKEXYQsHYVLi9FgSj0J1
 1sf1G3fKoDWBC/5eHwqIhR8uXkD2yifxCuz4c2yub3oWXT/L7XGUIO/
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: d78008b0-7110-4a11-c583-08de4eb4a316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3FVU1FHeXdwQnRqWS9KT0lkNHVwdzBCN09Kam51OFNMWmlaMUc0dlNmL1lY?=
 =?utf-8?B?Ny90Rm9UMEgwMXY4dDJZUHJGdzhiZ1dVUWJuV1k2Vm1hTVhDZ3NwNkVQYWZq?=
 =?utf-8?B?UW9GSlR4NWdZWWY3U004OFBxTnJsb2hSaVdRRVowcThJSUtieDgrU3NQZ2dJ?=
 =?utf-8?B?YVB4WWJQUFJaK2MrU3dLeWwyS0xwdVhkSUtqMk9xNFVBKzhDd20zMlBoL0NX?=
 =?utf-8?B?K01yd29kNDltdDUvMm4yeWhGaFQ4RTFYUG9uUDZIbENUdjEwZk9IbXhOQmdu?=
 =?utf-8?B?MHkxNnRIekZLank3MVdYWHJoVTZmU2tWWVFSeHVXRGY5YUlNWHBocitEcDNB?=
 =?utf-8?B?QVowcjR2bmVUN2NkaVBqSXMvVnBTSlNWWnlFdEhsNHYxMnNvM3V1WjczRHhG?=
 =?utf-8?B?TCtwSDNWWkEzK29MNmNINFR5V0VHR3pZRy83VzloOC9MNEkyZ2dDWlBWbXpi?=
 =?utf-8?B?QWRZSy81S3F5akYrMHNJK3ZNTUNzcFZ0R3lscUEvYU9QMnA2YkRsOHBqWlhr?=
 =?utf-8?B?YnVzcUE0M3VWcmVpazVpbytJbHF0L3pscHFQSmdkZmg3bVV4SlhuNmxhQWxV?=
 =?utf-8?B?d1R3cDVLRFF0OW5jU2dUK1BvYVhQVk1DMXYwdmZjcDc5WjY0WkNHNGdlTGlH?=
 =?utf-8?B?ZDk4dXZQUFl3NmdJUUtpd2xPaGxEVlh0V2xvK1RFMFZHZ05FSnJqYmgwcnk1?=
 =?utf-8?B?Q0c3T1l0am0rc2FxZGdOL2NvWTJIakJRalVjWGNOdUZBSVh5ZWwySU9waGNz?=
 =?utf-8?B?ZVhWQWpjazlNbFpSazR0VG5lRGZuSzR1NGQyY1BhUitkbVNzcFRvZHh3bEZQ?=
 =?utf-8?B?d1BVK2FLQ2xTV3JDbmpjVnY0b2Y1dmNOdnptbThScFNKd2Q1bC9Yc3FpeG9W?=
 =?utf-8?B?aEhFWURxQzM0dTZ0VEVjb0d0Y1ozZG1mQW40alVUTnNRQmNiUHMvbTk3Y2Ry?=
 =?utf-8?B?TEZxSFRzTkpnSHNKeXluQkZHYzViSDljRHR5aXpERkRLTEtVLzlnR0pmQ0dE?=
 =?utf-8?B?RlRxMFUyTjBEMVdTd2VSUHRCY3NMa0s2NkFYdFV1VzJHLy9jangwQ1JLUTky?=
 =?utf-8?B?SjkyZHhSL2k3clI5YzBCNFBMcnhiY3pGMkIxejlDUENwWXlNVzF2SWFZdFZD?=
 =?utf-8?B?M3J4a0w4MzRyaGFoY080KzRVaDNFUVpKMUllcmdQYjc4WW5GSFpzMXpqZU1U?=
 =?utf-8?B?N1lrTURyZnIzSXhrVGxwMzZuMVBLb2ZQYnJvbDAydGVad1pIRW1qV1g0aU9H?=
 =?utf-8?B?RGZ4M2hIWHVvaGp1YjErdzBSaWVRT3kwajdFZ2psRGJFSXRQMWQ4Y3R5TkNj?=
 =?utf-8?B?NEF5Y0psZHpRaC9TbkZKak9MbEFuUGdRYkhWbTdHdUNDbThZMWgrb2tTRzMz?=
 =?utf-8?B?a2N1eVZUd0p1dDNHMEdOcUplQWhCQTZONWRWOHFweTQzazlxeGh3SGM4UFFl?=
 =?utf-8?B?ZzM3MmJBUC9JQXZLR3phbEV4VXV6dGo1MlJsd2I1dzlvRTFOcTdpaG84TlRi?=
 =?utf-8?B?RHJ2TGtEdFYvQlJmL1FYUzFBQU1hTDVrS0RmZzlPTmJpUTBGRDZDTkNpTk1z?=
 =?utf-8?B?d3NScHZjV0Rob3hGM2xGWkFTWWVpQks3S1kyci9KUnVGT3Q5b3ozNW9oOWw0?=
 =?utf-8?B?NGZSbldHS1h4Vzc4YUNETER4Qk4wdUs0OEF2akR4U3RCVExwZ0w3cnRQSjJ1?=
 =?utf-8?B?MzdhWWdXVmtERTVaQlp1ZHRYZGgzbndpcWZIc1VFaG5DZTdjQlV2MGw5ZDZJ?=
 =?utf-8?B?RzNaZmdUb0JtRzBKR1FTS0JvbHVoM0l5c0xnNDZtVlFVQ1ZSYUU3YWdtVWVQ?=
 =?utf-8?B?LzhTampXdFFPNER4cE4wVzRPZ3VFUzA0ZmVGVW5QZk1pQmd1dW44QlhCOWpQ?=
 =?utf-8?B?d1VQaWtxVERXVnM4V1F0aDRsTmNydmlBYXhUM2xTZFlLdGNqOUNRSTZQZnB0?=
 =?utf-8?B?aTJmYWY5emVuQmVkWDRnYnYrWHZSdVpxdmF3WDFZSm1qTFdCK0VDVTkwVExR?=
 =?utf-8?B?OEl6ZUxPUExoZkJkNUJMQTB1MFNyb0VwUmJiLy9pdHNlZ3pCQlI3a0g1ckZK?=
 =?utf-8?Q?jdyNvA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDVIY0xDTElTVXYyQ1dETEpBQWNqRC8zUE5qZm9LOE94OHdwenlCMkV2ZGRX?=
 =?utf-8?B?WFBqR2hWQ3k1QUFHTzJwRUJQWUJkMHhlYXRqZ0g5TEtjOTJMaVRuYW5RQ2Er?=
 =?utf-8?B?dXJhUzhsVTNJT29ZVzVWZGRFTGR4NU02NTNUNTZnVmJFelpkVjJzeC9VbzUr?=
 =?utf-8?B?d2xUMS9nT2dpMk91K3FSOHZyWjZOVjMxbmtRY2dmSFllQXVNV0d1VERqa3p4?=
 =?utf-8?B?bnRpTlpseWpOVHZTdlRtTDJ2VkZPeUZGeUlJYTVSS1pQS1I2cWwwVzBiYjJK?=
 =?utf-8?B?REFqQ1duYjFMcXhCV3ZTdVZPNWQ2TDI0UnhDTld3dkVmRU1EcERpajlVSGZX?=
 =?utf-8?B?T04rbk1GeWRiZHlnV0taQ3N4TFVTMlJHdUJVSjJibzdlNDAvaDJlbGpWR3lk?=
 =?utf-8?B?SStxQXBYaWMvWi82ZG1OOXFnNFhOb2Z6cWVXZGNmc3g1Zy9LeS9RVVYzVzdy?=
 =?utf-8?B?cGF0djcwRVJTWFduMzdSY1pscU5sUmd3Wi9QK09yc28wcWRadFU1ZzJYcXFB?=
 =?utf-8?B?bUc5emFlM2Z3ellXaWJRdlhlV1pJcnp5UUY2WHlYRHIrWWdhTHdFaEJhWE4z?=
 =?utf-8?B?WmduWUsxTloySStqZURxMFJFM2JSYWN4NjYzdU5KSlllejNYU05rMXZFNFZi?=
 =?utf-8?B?RGxBMUNqRjN2V1p1SjNMb1RJMDA2NjV6bHNyT1NyeWpTc053MkNCVTZUS3dj?=
 =?utf-8?B?QjU5YW16OHlGTzB4MXVMT2RHRmlueFljWUIzQzhRTVc2RnpMTlU5ZWRDd0d3?=
 =?utf-8?B?U0FVSXZNVmc5R0JZeDJqOEZlR2J4OUUrZk5TRy9Zb1crdHh0eUt0VmRZV3Vk?=
 =?utf-8?B?dDVLWTZ5cnUzWnZSUHpUaytlNjFiLytlZ0MxMFJqKzBUTzd0ZmpyajRjKzFI?=
 =?utf-8?B?b3pjODRUdEQzNlA0d1R2c2FPTDdDZFdSTzhsQVR0bkpCZE9uanBtSjE0ZmVB?=
 =?utf-8?B?Mm9xVkpyaE9Tbzk2Sm9ZOUlPQnVHVituakRQNGtzcmdNdk1nNlZlT2RxVm45?=
 =?utf-8?B?b0tJQ3Y0T1c0L1E2L2g0K05HS043cjYzZjcvcitNNWpWM1ZhZHNCcTFPMnFG?=
 =?utf-8?B?eFRsZ0xVdjB5cDY3RndQY3NwT0RydU9pcUNGVmFmUU1NZmJVYVBPeTZ0dVJT?=
 =?utf-8?B?RWNHeWZUYVpOQXRzTURwRjlrblJCdjI1Um9jU0FZQkxZNEZKY2V5d1RrOHpy?=
 =?utf-8?B?Z0Vvb3d2UHFEeG4yMWNIaElDWG9vSHE2ejV6aUYra1crKzZQOWNSd1k3KzEr?=
 =?utf-8?B?bEtOVnRwMmJYakVJVS8vNjRPVU1nUnJwOVkxYUl5MnloSWt0aVU1ZlZvc2ZB?=
 =?utf-8?B?ZkdKcmlkM2w2R3FQUitBM0NaRFdLdm90TmJvaFBSa0lMU2lmL3BmdGl6Zjc5?=
 =?utf-8?B?Wlg2MUhCWDZGbjBZNVBjRzlwNGpiRUlUN1E4Mmhwb3NkUUN0VndmbndzN0k2?=
 =?utf-8?B?TmdBWmE5b0htN3hDRlV4OTR0U3ZPeGNOVDZ1R1htVnVIWXczMCtwUFYzcGsv?=
 =?utf-8?B?QzFpZ1d1YlBPOHQ3dkNOQ3VQajNnQXpGMGZoNnVsMXlmdmdzOUpCKzBYMlkv?=
 =?utf-8?B?L2tXd1hDLyt2ZFZCUS9ZeHFxdDFoQjFPOFF1MDZJQTJEaC8wZWpzT2ZXZnVH?=
 =?utf-8?B?MVJRY3EreVFtaDhyeWk0ZWFsTzNPVGJ6T3dIV2kzYzJnRG4remZLM0hOS05J?=
 =?utf-8?B?akUyV1doVVljeXFnOTVEaGRVZGMvR01RcGVqWVk4QXVlcmdvZ1pHSlhIa3Fp?=
 =?utf-8?B?VEp2YjQ1ZTduRWRzdHlYTG5QekNDNGdZejhyMmVFNmNEclNDNkt1NXZKRzFu?=
 =?utf-8?B?NVVJQmVQaVdac2FYYUxhbU44ZTkyYTlySjU2bnV1Y2pISkNraXJZa2hDeDl2?=
 =?utf-8?B?OUJkOWxNam4vdmkvL29IcnJsY0s1ZXR0Qmh1eGI4RmRndkdnQVNxVU5MNzRQ?=
 =?utf-8?B?VCtwUTdVWVVRcDAzcVI4ZXEzT083K0p3aEc0d0xjVEtBNFhVNlVkNFRLcER6?=
 =?utf-8?B?YmNuTXNiaFpOVlgzcFI2Qi9Pb1psR09RVEswTWVIYUl1bWx0NmxHQkllcU10?=
 =?utf-8?B?ZHBLTGs1NXBPTXA3KytpQzNRSHNYQlBqcWl0REtKYjJhNGNPc2RGTmxwR2xi?=
 =?utf-8?B?WndHaURwcHRBSWRaSkQvUzQyZWxIdWU0SFYwZThtcUNYM0VoQngzb3lWdmVu?=
 =?utf-8?B?d0VtMFdOSmp0YmdmMFg4cWVxOXJJRGpjaFJSNlpHVTlVbStISStGcXlzOG5k?=
 =?utf-8?B?MTluZGRqRGw4YmgwUnBhTTc5ek9aeCtKblRGVWdXUVB4cW5NUzhPaW1TbFhY?=
 =?utf-8?B?L3A1MVJWMXM0ZFAyOEd3U3NrSUZBZ3VMN2RMVmlsNUhZRk1DZzdHZitlVVBM?=
 =?utf-8?Q?RO2My20CdoJXm/9A=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78008b0-7110-4a11-c583-08de4eb4a316
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:27.1566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v4yz7FdceGcBhBNIggKlEmEsfvpSq/4UxDnASDJLPZFtvzMnBfS7YwoKGRePhoK5O8JV0omInBScq0wqYsMqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7456

Fix calibration value in case a clock reference is provided.
The actual calibration value written into register is
frequency - 1.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3baa2b481d9f2008750046005283b98a0d546c5c..856bc1678e7d31144f320ae9f75fc58c742a2a64 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 					   &xrtcdev->freq);
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
+	} else {
+		xrtcdev->freq--;
 	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


