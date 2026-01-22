Return-Path: <linux-rtc+bounces-5841-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IpnNPQ4cmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5841-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:49:24 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36968200
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48B107AB027
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB356344024;
	Thu, 22 Jan 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="OSTXXXxK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021093.outbound.protection.outlook.com [52.101.65.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94A34676F;
	Thu, 22 Jan 2026 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090052; cv=fail; b=iHWwuTlPFznq+N3zS45hiXZENexfnPAZ+PCeDwzURKaVKfrgHIVX+C5m8wNfNkoAL1jlxjRwFoprwHsNnehZhWWDMvu3mS1hjOiBkbwBEF3ftgsS5kNH0SnxPyJAlhRD/awSz55pTDpiNuYM6uvRJl3hwu9SrcFMsgaxBn/2Fpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090052; c=relaxed/simple;
	bh=+7UxDfV4ES/9VFjxL/cIcZKdjtGA80EZrWk71p3SUcs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TmbfVijI4lNF9L7o+0a281dYEoHsWkkzoytoJDxnBf/X41ZltglLP8jcaGRvi/YS3pVUTusRY3iQwNSlskle/hGIceCD/z6dWXYX5SuQq0l/Z52Mxyi6ywTh5MWhsVCuE4mA8dux55lP1AGo/IrTiulhKucq6amxXWE1cJhqS08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=OSTXXXxK; arc=fail smtp.client-ip=52.101.65.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIG+O6igfpcDdxrGd+dbO/170fSbYmc17J6abX97gJ1dYcoKM6O/gBrWp/mxztkpTh634pGhoyU5YGAX3bmTIyA6fdxu+7/TFMLtL0KEXEiRJB0yOaokawtWAjkt+n+4HGphxL98yM4JRlr4jEyp/39QF4ltihsQyrO7eExUnU3ydIcpjdIMwPDCrBLPkIYB0U6RRMNSbUlX/2b0ODY8lrvYP+sUzLwiiEkl/A+dMnbR3SvZ1yIAMRCFLwqzPq0CDfYzNIUemUJdQxmuJl9BZVlV/wl5asg2S/Y/RcZyUi4i3HIlEQki0UOJJUCIHyBMQ+k7JSgGkZ/6K+q9qq5Cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZqgPAK3qCRahA8i4sg+g4mjrkMXV0k64hT6sbLeLv0=;
 b=MrjrscACkqT5AaH/R7X3MQDBM8bwzjAkAUtZpjb0/9wOVtKJcgwjMKGqDsYE5lkYXxzDU8Nqp92lRh5XoVkIbpV8Cn0IB1q3mckFz9VIoFrCrubAzvL4MegSdBTyyaSerJcYNRTau+J1JkpV9qovUczJNxuDKQp/j9wTjGjCOlJCVVYf8Wctehq3wOUZb1oViBKo42JnJ2EsxaixBE7UJ0ZF7ORJPceBukv/bgSQjpjptao2T3OsrliGPps7WK1jU+j6fGFKryTm9R3mDHooSc//o+OUc7G5ftsvrYGmMFeF+vDnL/Oq3smrNjmMcp8qI017iWMuB+R7gQpjPn8++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZqgPAK3qCRahA8i4sg+g4mjrkMXV0k64hT6sbLeLv0=;
 b=OSTXXXxKR92s0yDEHDVay7LyUG6NujEDLpYEjcFCnHMhEPQaj35yVmWdUVevusyzZFJVsya19beYXQlJZIbs0F1SBpTmDFUD3AV3mQNdqfo2/vgsDqYX0fAwCgwDiOt8k36SUVTCFj6o+3vEzIwtr4MCCrlxYSjxvo/lyfuRzvynrezRTkWGDh+VQr7yHz1ppF+Kc6MhrnXLNx6uey9TMX+gf0jWVJLe/fG/BT9Re72F6rUC2Hi6bFQOSP0xVUON1kAZSF60xaP4QxG2xtm334WxjluqBHUhlE90riSidnQcTCKR01KjWTxt60TJRu8GQaXg0nHqf9tL8ms14OksVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS8PR06MB7413.eurprd06.prod.outlook.com (2603:10a6:20b:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:53:54 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:53:54 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 22 Jan 2026 13:53:46 +0000
Subject: [PATCH v4 2/5] rtc: zynqmp: check calibration max value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-zynqmp-rtc-updates-v4-2-d4edb966b499@vaisala.com>
References: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
In-Reply-To: <20260122-zynqmp-rtc-updates-v4-0-d4edb966b499@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769090031; l=877;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=+7UxDfV4ES/9VFjxL/cIcZKdjtGA80EZrWk71p3SUcs=;
 b=rI/4QYykZAYlK7H7yEW4A6tQvIyiDN9El1b3zSaYdFT7kDcbwjiCYD5fvg76PWU2QqhHnTMIB
 +YSAtwV9Kj0CR/bJ+7sKjwgGWkGlRBe9p/supLwDz6B9Y9qBGkHAOxR
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF0000384C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:e) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS8PR06MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: ad050cca-29ce-4b31-dc0c-08de59bdaddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3hwMkFwT3dkK3p4amZlNXJIYkVSeVFsVFNocEVGYkdqYXlTK1Fmd25SeW5W?=
 =?utf-8?B?azNOOWtNbmd4TCs4aWtrWDhRWStuc2FMR1BxZUNHYW5xNzQ1elZ3Yi9KZHVR?=
 =?utf-8?B?K3FObkNIcTdpUkdjTTNlaTJ2NkJOS24zUVNleCswVjlqK1MwUXZRYW9zdG1O?=
 =?utf-8?B?TE1mbGppUG8zM0ZybTdDbnRReVAyRElVWlRUOURkMDRVUG0wcnA3WlNGc3dL?=
 =?utf-8?B?YmdlMk1USUdWeTBiTFJpMUVGbnlXODFwRTFXQllodW1CL2UrRW9tV1VCdEhJ?=
 =?utf-8?B?ZlpoVHlFZFdSRW9SWkhBYnpCZXNTUVJrU1JxaGhlL01sN25RbkFJd3JjSENk?=
 =?utf-8?B?RWdCOUlWYlduV1krVURhdU9mTkFmNjZ2Qi9zY1c3Q2Q0YWNqWVZTcG1QQzVI?=
 =?utf-8?B?c0xqMUdZQzJRVUo2V1dubkx4bjQyUUJYU0IycXhwR1haWWpUb1U2UXlEdmxK?=
 =?utf-8?B?SVJTNGtUbVMzc05qUlZPQUxUR1V1Y1cxNTBkdmhETlBaMStoT01DdjVFbXB5?=
 =?utf-8?B?eVpRMEtWaGtrMnJCaUFrempzUlZwVEt6MTl2OHE2c2NKSlpFSEpNZzdTeCs4?=
 =?utf-8?B?VUh5T1ltb3RUOUJrQ2ZIOFoyV3FuN0dpVDZYa2xDd1B3ckU1TFBVczg0d0JE?=
 =?utf-8?B?VGxrdXM4VER5a3JlczNFZnVBZE5sbDZBZWxUa2QyTlJKTFdIUHJ5VWdoaVBF?=
 =?utf-8?B?RTM2dkxzZDVSa21yd2RiOVE4SUxieW95OE8zMnNmdmZqRm51WkhqK0RJYXJN?=
 =?utf-8?B?S2ljMVJGUmh5dUdXeC9Wb2lxeXN2YVpMeFdScythTmNpS2dHVlZIdzZ1MHpP?=
 =?utf-8?B?NFhlWlJGVzlRWm9WVi9UaGFueFFZYTRWWUFiT3VLUy8yTjRlRlVUWURTbENS?=
 =?utf-8?B?bm1leDlGMmU4UHpoWHd4RXlZSVMybEZaS3RRRGlUR0p3b2JZd0t0NlNWeHlX?=
 =?utf-8?B?cW9CUmFvUE12b1plbmkvOUZVbXY5Wm9jTU0yTkdEYkdBRzFHY2VReTdBYmd2?=
 =?utf-8?B?SDFXK2dTb2VVK25xL3lsenF2S0VmMFcrb1M0K1NlVk5zV01ISjRVc1VYandr?=
 =?utf-8?B?WXpISFJ4UVVDdG0vUVZHTkNrUitiV0ZRSm10TEEwL2xHb2xBM2h1RlIvMFB0?=
 =?utf-8?B?TlhZaGxpR25rekRtQlBwZU5DMDY2d0VHeU1TaXBOUDdVUVcvUU5uRjJDaS9o?=
 =?utf-8?B?K3RLR0dLM1lTVFF6R1F2QW5vK0tPWTQ3UFVqQ1BPMERPWFVMM1R1TXNVUE5Q?=
 =?utf-8?B?RG8xSVBXV05wcWRqUTA1U0NZOUlvclgzTXExbTY3REFtanFHSUJVZzllN3dQ?=
 =?utf-8?B?djZ0a2E0Sk1yanZzR3ZiUE1ZUTFqL1ZwMS95YXRNY015ZkdPVHpDYlNHSGdk?=
 =?utf-8?B?SU90RW5IdUtVQ0tFMVdYVS90K0tqYlVJbmJXVkh2bjJXWHp0eHhrMVByU0xo?=
 =?utf-8?B?VXEzeVZyVThmbW9aR3VIcThweG91YzhONStGVU03MGxxdHozOUhUanVPcXo5?=
 =?utf-8?B?V1FqODhYSC9teE5pWWxsbGxjQXZqQWEyWndzK1pwWGFYUEhPM2NSeWNERHNK?=
 =?utf-8?B?bnMyWUNGck5tS0R6YUVVVGRUU2cwcG5xZjRac3BmUkxCdUcxZ2NJdXh6Yndx?=
 =?utf-8?B?U0V1eTUrZkthQS9YRGRIZTBIakViS2tQc0syMno0QW5CU2dQc0VTTm1WeFZ6?=
 =?utf-8?B?RHJLMlZkdlloK3dlTVFXakc2Q3hNeWtkU0ZlZGd3UXZZU3JTcXVKZDNPMlRT?=
 =?utf-8?B?SE92OU5sTmptMXhCcUxPZTNCTG9QMDlSYm1FQVNKYWw4Y1FxQ3V1bkdCeE5m?=
 =?utf-8?B?bzVnTTlsWC9McHRJWUgrcTFXZzRFZ1hSVHl6R3NKdTN0cjNWVEE3cWlLQWRs?=
 =?utf-8?B?a0FCTmVSeXBOVk1pd0ZMYXZtS3lnMmhPd1pDSk5pd2xyM2tMSyt4ZkVoTkhn?=
 =?utf-8?B?VW1QVDY0bHFzTEFubml4MEZ0YzVRS2o5YXkzMEVYcVh3TVpwMUFJMFJ6bkZO?=
 =?utf-8?B?YTZiczJwOElwcitPY09DTktyUTlHNDN6UCtNdytTUmdiQTdqSGoxb0FUeEhu?=
 =?utf-8?B?SktEUjI3a2lvWnNwN0RhSVFNbWNONkEzTUlCei93U0FrQTFBSlhQVTZjZjZz?=
 =?utf-8?B?UExLODFhSE1qOVlhUnl6WXNDL1k2SkIySWlSMjA1cTBRVFZueGNwRmRzcTJo?=
 =?utf-8?Q?JZccuWCM4XCw8EkLgSQ2tt8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXA5YWRtRDYvcy9yQWM4bW5WV0xEOHY3S3N3aUZkZ3A1Q2wwNlBJa2ZGYncy?=
 =?utf-8?B?NURsUTdRZDVwRXNKZUFqMHhNQ3VZcFhlOUNkSThrcWNUaWRJSDVwc0tyd2Jx?=
 =?utf-8?B?dTlnL0JGM0RUMjVnSzNaaDdCdFBRV0dmODhjaVpNK3k2eHMwMmdGUnZHU3lW?=
 =?utf-8?B?WFFUVUM4TllUNExxOVlUa3BRaWJmbGlCdWl2V1NkMGE4Y1k3VWRMRmMveHE4?=
 =?utf-8?B?RnhHRkFUZzZwemhsY1VSUTJYMmlFUVF0ais3bkdOVHdjN2lXS2JITGRxWFpG?=
 =?utf-8?B?MXlRVU1FNi9ja0hZWVR0Z0FXY2tOYTRML3JlVXZLaDR2Tzc1RUJQNlR5K2Ew?=
 =?utf-8?B?dDhLeEhBR3JJeEN3SWVnREQvRmRBYWgxSGhjZlluWlA2RmQ1OTZhTExGNlJx?=
 =?utf-8?B?Nm54VWdudFBlOHh3TFFSZ3V0bUlRTnk5Z2tSUTc1Q3NnNmNBZVRWdzROVlVU?=
 =?utf-8?B?a2U4dUlob21ZTThaeXVrNlRzclB2M0lLUW9oWFhkRGp4NFo2SEJUSWFGMjAv?=
 =?utf-8?B?R0k4eVFwYmlVMWZCUXAzSWNSci83MUYyUDhDOVMzLzRMaDM3QlB6ZlkrK3pi?=
 =?utf-8?B?NDY3d2FlNUg0UkhkM1NzbjJhalBEUEdaYjB3Qm9ab0QvY2J4bkViaGxEbTVw?=
 =?utf-8?B?STFkZTRmNG12bDdhSm5objJKUjVITDhPNWVSZUlLanJNVzZ0RGVpL0VpbTAw?=
 =?utf-8?B?VTBJQjNia2R5dmlqRU51ZEptakRJc1NKNDMzanJMeDNiUlJ2SFI2WW93d0lX?=
 =?utf-8?B?aHZCMG1NbitwWExpSklIcHVaSW1nZXJZZTNRQ0VSTEVwclFXK3c5dy8rRTlt?=
 =?utf-8?B?QWVQTlFqd0huZ2sweEdGM1Qya012aWxteVVXbXZTS205NTJJaU1xZGlza1VQ?=
 =?utf-8?B?ZFhPMUpKdjZHMVpWVllNSGJBZS9td1k5ampiNUtLci9mbXpFUURBb0s4aXFW?=
 =?utf-8?B?OS9GNGFMaURrOWxhZituc1dyb0lWMnZiUzZER2NQalFzK1FqMGJBYzk5bHF1?=
 =?utf-8?B?MjFvYmxTNkpCN2t2bHpJMjVEcCtwbWt5YlR1eXh4SHlia3gzeVY2c2RkNmFp?=
 =?utf-8?B?QXJQeHdtYm10N0NCd1FoZW1ReFVKemtQdlM0T1dGNnRSelpURmRjeFlzcVZu?=
 =?utf-8?B?K0cyTE8xL01xMEN6S2V2QkhQVmVGb3F2N0lBYWhoTXlkMzBrV2J3WjRJQkt6?=
 =?utf-8?B?ZnlWSnVDaVJhVUIwb2dOSm1WbGRDa0cwdU8xTk1TZlRyS0pHWjRDQVZJM2ZQ?=
 =?utf-8?B?V2IzVFRscm1wK1puaXdHU2VIenVLRXdkckcrNVh5Q3dtTi9IWXpoWHBYTnVw?=
 =?utf-8?B?b2ptRVg3ekQ5YWdnT0tiNEwxNW0rOHhWaWl2QzlOT0sxeG9BVkJ3Q2F5cWVL?=
 =?utf-8?B?US9sVFNqMXJuVlZ3YTQyUEl0SURYOXBKRDFtUlRRYUl3bXJJRDExMVR5dGp6?=
 =?utf-8?B?TUkyMk5XMWhvazZkTUJlQjZZRnJzRUJUVWlZR3dDTG1mTE82RzgvWDkwRE9B?=
 =?utf-8?B?RnIxRzA4dGhsclpmSnltdEhjcjhCdXQ2MWlpdjZiVTRCU21XbTVXL0VZY2xj?=
 =?utf-8?B?cXJicWNiZm5kSWhiQk4vZ1k3aVdqOFlrS1BCUEI4WHhCc1N3NGI2a0I2T01q?=
 =?utf-8?B?WGJFNEVMb3ppaEJoUkhxUVg0aXNrVXM5a29XTWsrNkxlMkdPeVgyKzRnMFJO?=
 =?utf-8?B?eHBKNjZ3MEkrbVlxS25qQkN4NEdjVkNjamI4TUVUaFZoVUwvUFkxbjl1VTNW?=
 =?utf-8?B?eVR6cVlSTUVqSjVCLzNvZFIrNmZiL2JoL0pCUVU2TmRXYXlpVW9ZeTU1blpF?=
 =?utf-8?B?bXJicUxwOWFNbnREd3JkNVZaSk9jTVU2bExRNHNoeXJpUTdHWWQ2ME92Rlhq?=
 =?utf-8?B?bmJrZDhrS0xQR3NpbEd3Z1UwV0NLNk1JdTFyR0lVeVZGUHQzVHRwbzNOVmJN?=
 =?utf-8?B?YXNhaS9YaDNkNEpjMXRXMnJCY1Q0dTB5aDVWNHd0SlJqREhMb2g1RHh1TStG?=
 =?utf-8?B?YlRrWklOeUhTZTU4RVdZQ1I1cjFVZzFZcjFiZGVSWlc5aktHb0NsdW9Wb2M0?=
 =?utf-8?B?bVVjZEtXU0dYRUNyNTBVamdub1ZlSEx2bkRQZnpZUkhSaXo4eWtGaTY4MEJo?=
 =?utf-8?B?bERncGVCMjRaSUdLd0MyNVZsQjlMUVZNWGtXWXlkdDFyY3g2RjRKcVNUd004?=
 =?utf-8?B?bWM4UGhiUlFZY0NZWG82RUJIK2djdEdULzFlSUpSK1dySFV1cHFsT1BjQnNu?=
 =?utf-8?B?ZmdlRTJ5V2cyVmZnQ0xSQkF1cENYYUxVUFR1a1pxbFJ3OEFFaDBoZndZQ1dY?=
 =?utf-8?B?dXZVcXZPS21rMkZaRkVTcWk3Yml5a3IwcGhraGJkWlNqdGl4NS9EaHdQSUs4?=
 =?utf-8?Q?NJg7Too2+4RNksq4=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad050cca-29ce-4b31-dc0c-08de59bdaddc
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:53:53.4587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHfIS4smKE+S2qGdUahJEFo7D4k9S+ybS1BYL9dt7wXO7QJFEpmyadBwOE1R/H4XRwFCcTVWnsWKLmx05+9pPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[vaisala.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[vaisala.com,reject];
	DKIM_TRACE(0.00)[vaisala.com:+];
	TAGGED_FROM(0.00)[bounces-5841-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-rtc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomas.melin@vaisala.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,vaisala.com:email,vaisala.com:dkim,vaisala.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 7C36968200
X-Rspamd-Action: no action

Enable check to not overflow the calibration
max value.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 856bc1678e7d31144f320ae9f75fc58c742a2a64..caacce3725e2ef3803ea42d40e77ceaeb7d7b914 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -349,6 +349,11 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		xrtcdev->freq--;
 	}
 
+	if (xrtcdev->freq > RTC_TICK_MASK) {
+		dev_err(&pdev->dev, "Invalid RTC calibration value\n");
+		return -EINVAL;
+	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


