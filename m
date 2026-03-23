Return-Path: <linux-rtc+bounces-6241-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJCTCq7LwWlUWgQAu9opvQ
	(envelope-from <linux-rtc+bounces-6241-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 00:24:30 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEA2FEE84
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 00:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE3C33033FBB
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2026 23:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5AB38425A;
	Mon, 23 Mar 2026 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YRidMjfV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C32D5950;
	Mon, 23 Mar 2026 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307956; cv=fail; b=HMv/UWSGr1qgVvZBsMPmAOZz4iaCRjadDASrTy+JEICde2ekKBqzTk5X7v4D9tDD0zKB5/0nSdIE90iBJbtYBf3VafcWtWbhZSRFPdiGtZ5NbXaF/9dzfU+gBSLhJp/33ddwoA/aC/+7GV+8U/YTd+dzr2bGCgcdhLpoZSmT/30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307956; c=relaxed/simple;
	bh=Av4SoizyArC6/snQebbuc3SPi/2mF7rxKdurRf8aU/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e9URPARbNJ/EmjEqddmJwjfh3Vl0Ort1Mnp5ouhJQNqhFY7ww12lJSUYt3r8K2TJBzBFlStDFMQYWeNGDsXplMRp6aWbWi+IyGmkgkKyChScRqS5hjT1vDZE7GEQ9KSl775OTtD5UqIvZ7OQVl8ounsQP2z0w2pdStqYbb7eizo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YRidMjfV; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV1x08ejoQRWxhqZImJ19PquuvPF+wwVrjSDCAv1nAifqh5saxGdNMKVjaRwUIjaoA3F239E7tlCi0LCzhxVFt4Buc02nYyDveWjowERBnkGBJPLa2Ecq29zAEjP7GL/JB9MTV1osAGGt5vG3VoUpjm2D+nTZkZYqam47bCT5cwA1/2GpAWeBY4ezt+JUnSKzbQSR8NqActxyyFkA4UcAZrxLJX9jdelcuNnKApvj7IY1vNE0Lv/EBv/SHGp+GdO2JNNlQkIYYop2E5L+L4GMK+nNOOOPlGVzLpUvWmY2DahyU5+V3IYC6qeBE8pccOTAYliJ8qXT2MtZU9xi96Q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJlw6WcZoUZlPjAImVRLUqdMWnLBGiWYvvfJDFvlxw8=;
 b=GA+NxJ+edrTUDw+0Sj7Gg+pIj9XrRv15yU0AUudhXhSYxcuXSePY4yIjTHP9w1qWL7fwmqvEOm6RVr+6cigLZplHNZnvVPV0LToCCTlZcTQMW8h5WgFywH9QmuUkwt3zfv7nPGu/Yja3tk2PA5K2WHMUYYwiXM7jn94hcG9UGj84/t8nOISIQrH3pFPzHcjiJ3DpVjxP9fD7DaTP2CiVdtXBcB3E+lRFEpNmfuUCjUC2qjskAbEX4lZc6sXU2bgf/FYa9I2dCKLfvAcR9D7ppE++0N9IsQyrSE8d1ro/9clPkuj3V4nETO9EXeJg8EVxLsGH6iPmgxbfDNHg/nnm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJlw6WcZoUZlPjAImVRLUqdMWnLBGiWYvvfJDFvlxw8=;
 b=YRidMjfVm8WWVXgPNLR/9yIjRVi32IySNlnu24CEs0Cb4sMDeJKhRcv/RVEvLLbI4674yav+uTh0zGLGvWuF8bH4JaW0VlWg7cjh+yYtqHaIRiTQsfDQTORU+oCgyF7aLOyxsyjHhXYpMwIUmkgYYKlVUvnk+DSR1nzInWg7wsl8D4zGT8SWkymOZ2NebFQDyQxuRcxCLI+KC0hLmJ9ENnmq5sOECenzYmuy5REf74lqmRzxdhwLDrIfXptYFBRuPx+qHY8rvT+IFcpHpzMXkXwoFBBxLrRXf6KZV8jJxufCqceK2pPG3x+j3J84o8HeJrW/7xN9JPCmPakHOnXekA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10683.eurprd04.prod.outlook.com (2603:10a6:150:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 23:18:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 23:19:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: (subset) [PATCH v3 0/2] Kontron i.MX8MP OSM Devicetree Fixups
Date: Mon, 23 Mar 2026 19:18:51 -0400
Message-ID: <177430776065.1474337.5215108916844700211.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309085749.25747-1-frieder@fris.de>
References: <20260309085749.25747-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0095.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10683:EE_
X-MS-Office365-Filtering-Correlation-Id: d2079aa7-7a0c-4538-8d3a-08de89329234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zCkMC1sGYmAqZu7pzO6InihLFaONfbRMXso8nf29qwCQfxypXmUDi2I0npqkDjvSfCcMqQ3CuNRKnfQ4UuFV0Vc1F8IAD2+uJWHPCuvv8fDqH8rkWU21G2TVMVNoj38GEsg7iz5SNJnT3WmQ2zuQnFoZzmRo2Rn9SPv7AfM9Z5l/D+manuBjUB8Ffp2llkrfQ0KL0AC3OCqhNMzatwIy81npKqhInWVLHE4BRMhaA+KeIMBQDMQaBY9AstU+duELqPIl5bE9P3pgGuHIpXDHL93r31REVErKJArdbI+q3Bd9Vn0Wxvg6NdaVMQ5uLCazVymXuVprVnDJf+GfyM2tGDtB9WKFbYFpyc4OW5x0Bh4x/5oDPNHKq6k7h2tnrcavRBiCW4CLvxL0AxIgvT4vsfI5LptBeQoEfmQj8tTDa4G2PmRQBVzdfTTtJYu0pbfaZPGi35vXiYpM3kFUQVLM39Sd3pHds/D6f5n636LWJVDim/s5FHh3MbicEcTR0FsCvJfP6URvihtavHGqTNiXaeSKtYSKmj2WR4gA/qHb0JnxDqkByQuO1hcU0wErDg1nRwzl+hS3dOvXrbMl0rn+5hOz6AQ+r7xDwSFEX5R9MU02puefqDMveMETebDczrKYvtBdoVZh+CDPfeJ+SW5LRQI8CbiZOF8Tspbk6QYRMNGEkNbgxqQdUVzVJ/eYvmxWtPAp2tC5rgY0o+aDkHCUI/VOUAPuciYZ83jX16V8VbjdnxJ61FKQjgYjyfhF7aJDCr7p5cIU0hOQ8LK3mqO/lfd2TpOT2sN0LQ7zWEhW/+/nPsMSwwKSV62C4fY2NcqM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFZTnRIbUQ5VFY1Q0dRRkRCcUdVeWRzeUtBcC9haTg2QUEwMWs4eDl6WTNK?=
 =?utf-8?B?S2tHS1NITC8wZXdCSkFrbHFRM1k4aGNCSitxdkRGNzdCU1o2cjgrTU5Yck0w?=
 =?utf-8?B?WW1ubkVrdVBvWU5LQWc3dFhIdnVadzBZejhnbXhFbE5sUlY3eXV2Q2daWWNX?=
 =?utf-8?B?aWVNQng2QTBMVkpoZGZwYitjZ3lNd0N6bnRGaXlVTi8ybmVaS3V0Znp4ZEFJ?=
 =?utf-8?B?bXBSUVNKNnlDR3htaTRudTgvcVhma3VuMW1vamR4WXVYTHVSR1YvOWlvMGVV?=
 =?utf-8?B?SUtuUFB2a2c5aXRQNjViTEY3T2RlZ2pRN25RUjZ2Rkh4cHlydFNsSHhKeFBZ?=
 =?utf-8?B?MUJjU1BqK2RBV3M5UUtCdHZzUDhmZDdDRWVwcmorcUt2bXlqQTZkVE91a1N5?=
 =?utf-8?B?M0FNZ01NRUU4ZWdHOENjcjRtU0pTWkRuTXAwKy9PbzF5enVvUklSeDJkZ2hF?=
 =?utf-8?B?L1pCVFZIdWMwc0htNVh2NTNsKzZRU1B2cjg2ZGJYUTM0WWl5YUN2OTh3M1BB?=
 =?utf-8?B?TmYwWjJjU2gvT2F4QnZSTUdVUm5zYkJCdFd1MDZER2tDNVFEYk1mY2ZVc1VY?=
 =?utf-8?B?NWJQZ0hxaWlxMXlIUGtteVB5OHdWN1FYdzVPU2l3NklNY0xkYnNTblZRcEdX?=
 =?utf-8?B?VW82NENteHlSVVNQTitaWEsrY0ZWM3FHYXpnTUV5dVZlTGg3MXY3ZkRFTytu?=
 =?utf-8?B?OHozQXpteDFZYlcwdzNVRUFQN005bWNJYVJzd3h3dUdxWkEyeFVYcHRxZ3JD?=
 =?utf-8?B?NWZBbUY0Q1JRVUtkcHZGL0VtR2VSQU4xcjhTMktQcG9ndy9GZlpKbThQTzRk?=
 =?utf-8?B?QWhGQjM2MDRlOEYvS0UyNVdSVVhIZmhmdGJXclZPQ0VWbVZuM1NxM3J2YkpK?=
 =?utf-8?B?YWoxanFWZlh6OFBtd2ZPbldZVWJ4V2JFMThQVCt3SklXUTlIREJMUm93MnN1?=
 =?utf-8?B?V3QrQTNNWnNDM1NzZDU2RmQ1S2d5RHVjK0RVUkVWemZrQlVFUUxkM0l2bTQ4?=
 =?utf-8?B?QkJjQkpqZHVqR3NpZHl1NEpXT2dnVlBXMCs3TEp2MUo3dnROdzhKOTUrOTVk?=
 =?utf-8?B?QVNBdkQrb2hGNkdNK2pzWTE2VmxGcnhuYXJvdk5PT0E5cVJWam8vUGQvQmtX?=
 =?utf-8?B?TkxSQWsyQk1nVTgvOXQyT3hRUjhuRjhvcURpcVREWnJjdThhdUVPeUJ6enMy?=
 =?utf-8?B?MW9helJPNW40NnVSUGE1U3ViMU52MXNDdjN0MVYzQ2FwTEpUbWJ2WEFmQ0w1?=
 =?utf-8?B?ZXhQbkpLV3JYWlFneDFGNTZqZjhkWGlKbUZJTGhKbUdUY2NlckVJQnZ2Mk5K?=
 =?utf-8?B?bTdyTFNPSmkrbVEzNDNHZVNlMzlJSHNNMElCOHVxaFVRYWhab050aUtyOE5t?=
 =?utf-8?B?TjU3aU1HaDFSQWxORThoemM1NklPdFZIRlpGTE9kWkc2eXhZeGtwWU9Ua1Jh?=
 =?utf-8?B?V2JPRS92L0RMaXRQUTJpUU1vZTJBZEk2RVFmUHJMV1BNUE1iZUplVmtqcC83?=
 =?utf-8?B?ZVZCSUhzTEpHWk5taUdEMFN2TXdSN0wyZDdnQ2RxZUVSM0pjbU9qbU1vZUpB?=
 =?utf-8?B?MVYxY3FoOUZ4RmZERUE2emdpVW9IWXF2SVd1b2dSUWNVYVd4SFN5NXdERXcy?=
 =?utf-8?B?bTBycy9PVDhtaUJDWEM2MWJBOU9KRkRpeGVGNDVxazBtVUdqcXBtRnY0czJV?=
 =?utf-8?B?ZzJhNE9Hcng3b1UwMW15ZVZQdlMrNlpjNXNLVnBHT29NVE5IUkRvVW4yMytq?=
 =?utf-8?B?U3hVV0x0TldMMWdZQ1NxRVhuMXg1d2VSWC9vTytLVzlaUGVqVFB5bk9hcTU2?=
 =?utf-8?B?RVJjNWlKNGJONUpIQ01ROS83eG1PRE9YeGw2cFlNRXJERFJ1b1FvZlZjZ1RW?=
 =?utf-8?B?QWx1MDdyMXM2MlFON1ZlTS9iNkxhd0FIeUFHdWU2cUZXSUNPL0p0UW85S1Y3?=
 =?utf-8?B?MUV6WldSMDAweWxoZzhucVZUUXd5VmtyejR4N1FOakJON1RLaUJKUTBKQVFU?=
 =?utf-8?B?UjRjT0Zsak5Nd1NJcGVld0tYbVB0OWt4elQ3Vmk2NmhtSUtDc3RhVFlTUFhs?=
 =?utf-8?B?ODgzOUZ4T1IrQmxiYWh6U1hCT3hBYU5qTVpLbzEzZ3hMU1ZDcm1DVWFQZloy?=
 =?utf-8?B?aGtzTkFBdGJyWER4cml0ejZOZ1VtWmpFZlF5UDJJakFFMURQN2NEREZGSGNP?=
 =?utf-8?B?L2RZalVNOWJtUUNOUWRsTUlreFhSWS8vYThIZytEZ1ZxNHpVNTQxWExyU29D?=
 =?utf-8?B?Vjc1L0thejE4ZFpHVzR3RVFyUU9VbUZScUFweFNibXlybW1TV1g0VXpseVNP?=
 =?utf-8?B?K1Ixd1RWQklSemNJUHBkZndlK0xjM2ZXZlgrZG0wdys2aUJ3cUpIQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2079aa7-7a0c-4538-8d3a-08de89329234
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 23:19:03.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d22wnvQtFr6DxgV3J4VcqeCDzHGqerT1qP3xQIHT8xNLgt6Fhq8CXeYa+U5jOx5Hg8xpmoCDkFBW1DV6kLOJCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10683
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6241-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,kontron.de,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BAEA2FEE84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Mar 2026 09:57:41 +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> This contains three fixes and one cosmetic change for
> the Kontron i.MX8MP OSM devices.
>
> Changes for v3:
> * Drop applied patches
> * Add missing bindings patch for RV3028 RTC
>
> [...]

Applied, thanks!

[2/2] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
      commit: 0f02852af55591d6a8609347890cc348f86fdac9

Update commit messsage, adjust wrap at 75 char. Change "this fixes" to
avoid.  Remove "We can ..."

Best regards,
--
Frank Li <Frank.Li@nxp.com>

