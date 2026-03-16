Return-Path: <linux-rtc+bounces-6215-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GayNFkZuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6215-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:53:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D984C29BC06
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 033D2304FE8A
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4504A2F362B;
	Mon, 16 Mar 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l1UQq/nN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F052F3614;
	Mon, 16 Mar 2026 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672480; cv=fail; b=fLi6EmaVzOL6t3X21OCY68+LFmTGlgfuK+gVKReBBS+g0W+LI2Wf7+Uv5t67BOyECwfcArE3heatb2wEm7jX68GIYRc+hf9xvCMUaddgLtw3674+ageYOGZL8ZXBEVeEKfSRgFvhRvv618ygF/W8QsU8gcE6GMgFNhMD+HUb9XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672480; c=relaxed/simple;
	bh=gY0LB54hpcNGvTccIoD76u5n2YD6Ny4WBUD4zL+bXYY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PwB2MZJZLz3n9i8XyaferUr/0UpY6wYxrhv4Ylp7+YCGE8fH+dAsbv/5Qy0+n3NGXlkDE6lnRArUw9vdDYmcvVqMYJyb2m2bHHJi/NLg6/BW639n+JvFgSmYeaJcSPHNzbPz/at1w9HaCcMxDumj9HdPS5+tPUHnxhOVNnU1Vyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l1UQq/nN; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+TkIiFzEZ3vnoPlaioQkWtYeM4ci8rqV+uR0Z83JznddO8NgtBc80HYPpHpP5J5I/j/V5iRg5imbjDVHdyrFsBOxIpylwiCTTNpoQ+f6jK685nGATXjrt1+9B2jBEc5E1WrG6FHLvFaL+Ke9LXFC6RDB61HybDE0eDBMbN8MndCQm4ecY3/GdFgMl/Eq3Ruc4jz2gzeQgmivTTSv/AA1LdC8YfQ3GwOe09WgvrCz7xY9GjXQ7s7BIianiYSZOQtRc8EeK3hAmd/6bRSGTbeibEjawR9p7nN5Cet446So+L75Samtyzdn7KcpzwJa+c9VuGH34hZhUJuppwGP3PPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXE/9LagIHLcekhdm6exlY4V5PcccXUkRY7GyPBaud8=;
 b=P6SyIgfFa9HMlBOGuSo1u/fawvTA0OjKIFv6cNKA4i1pbDLeC+G+XJGtJFC0nRzx5JD0KmYLPJ4b6ZVDkg/0bXeXYqI5UXKd9OF+oOuaQg6uD6wSs7Zimrzc+RxpJeESyrudUyNYKa5vK4neox1n3hwA9AlTqZfSlxwusVx412LW86nl2lP07dF0qfzE70UqgOZ32IDJpvykoXu2OK4/3YNP+9fsz4Tpk7NayrWGGNBkbyv6/ks5rF1nXnqWzUrGm6EPkMGXa/S7t4oMCTTToOTjWmTwgFNhtVSEb6BShijHYP8hSyH/M8BYq9Yb6ywQw8PQaKJb0wRSvfGZFo97Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXE/9LagIHLcekhdm6exlY4V5PcccXUkRY7GyPBaud8=;
 b=l1UQq/nNc3DL17FnKVjn/584lGYJPOutoNXy940nN1RzM32ZBXrexR881m1I2oK+59ENVG0u0XlbuRafZuD16XNqlMi4KF88iOHiKrjhWp8UtgxWh+r4XJq4sRDqNoDmNq6OL+h9BHlSOR8uXLkGOhmKaFn4Asy9f1YWZP1E384fSBn6h1F5FGiaJXIWsg1LIYa098E6E0hR2xXwstPiPaHu3+pblbPLegy5Bo0UU3Rg2C8XY5LwavLrMd39XFfO3t0dwKdy0FlVxBzRkKjAI1kaQzMtf/Q1B9IbW89G7HysU4+5lSXGL4LiKxtqjjWB9MEkhevs/vWVYUjNdt8UGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:45 +0800
Subject: [PATCH 10/15] dt-bindings: mfd: netronix,ntxec: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-10-92c80e5e1744@nxp.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
In-Reply-To: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Jerome Neanne <jerome.neanne@baylibre.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Osipenko <digetx@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
 Zhang Qing <zhangqing@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: 93956af7-8ad0-4edb-d90c-08de836b00d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	s+7eK6/wjZZJw2oXlBV32XEOhPul6kyQKYM8QwG2t58vqBivWI+8At7Y//uDKDagrjXMmTFZ3KjrFyXr+sBDUrqY1wO7Yt9FNQJkw4DZotSbMnRcpjCU+v9M5pMq3zbOyAcHfhGXJj9vdF0bmOD2H2ZRRm+kVHo0AdHjm4YB49uFXNdpcwDNg3nXIHbwXKkmnV1LWMxD9w6mN19VCi4q3jYXGuH8bfqv04Lq/+/TGiUNsKxqWNit4ya9ehMtHBh0zjREmNJkNYl6bPG4w7wTgqCOd9S2SA61PgSQ4rx+CN42Pr0xknLhryCne31iqFi7PWF4j5Qlc1wXxLrUKUWc8Fh3apmQ4q10nfkHcbIlrHSpFPGOId9LtAZ/zHvrAk/ZfVuefEeBmeUW/6IaROUCf4rI1GDHCOTzLdjTamqu6Fc0ZdYuEQI4R9WEaVpXCatW55ZKhbgUWV9X5664iuZDiDDlhcubqBb4XAZBJHPfRsU2bf8zVkCYCen70xvxbznVlWijgo4xz7jpDZQm1bhMQ7E8VtScw6YBkYIs9q+Ra98lghNzWZraPWlG2qptJJ/18F1Ca6vYfji+VpV8ukKTSJBpdEx3sA9UtpGM0f44wm4INxnwPeHEnoRie3+sMPHMZosvqYVkPrWQ5c2Hti+B89zg/fqVREkbDe1sVl8BceNaAPYAve9UyAmAKxnR/JWqnNRf9ky6HmE6PrSBQLZK7CItkL2jcNDQXK3KHSo3gCtstBbapiLLin0tpFf+1thAY7zLEh1WaaGLQRdvqy1o/E+MuvKl+MvCj/xZgFIAnvTV9MAXZuovObNxonc0zQFT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2RLa3AxYUg4YkpJNkszbkgzazZGb1hxY3E4YlJqV0dEUnUzRXk3eHREcXMv?=
 =?utf-8?B?aGlOWm4wa3hKa1h6NmZXT1NGa2ExWWVXOVU2OWJrQm1BMGZXRU95YUNtSWlG?=
 =?utf-8?B?NmlqbWtaTW5waGdybWZSY1lyQ2dNekFSV2RyOW9oUHpzNlVGcjlJV0RsMnBq?=
 =?utf-8?B?NjBvTDdKSWtjaWZPVTkyV1Joa2kwUm5YRWNWc0Y2Z2o3dkR2MDBYbnNNelph?=
 =?utf-8?B?WWJLYjE1NzlzUlU0ZElHT2tVeUY4K0JIYnNJRUhxSlI2NkloQ3p1cDFrTGlO?=
 =?utf-8?B?QnBLUHdWYkRPYW8wb1RzVnNGMUVXd0o5c2VKNm54S3NZdlZwNUNOK2p1Qm9O?=
 =?utf-8?B?Z1UrcVRkM3BOQWdGdm1oZWNMSUw3VDE4SUk1N0VUY2dmQ1MwMWh4ZnZqQ2hC?=
 =?utf-8?B?SThWREZJOUUvbzlaTFEzS05ydzVpUDF3MzloNVdtVEMyRnE2OTJDMHVFaHc1?=
 =?utf-8?B?SUYzTmY3clpmSk9JUWcxZFBkbjdPaXljeC9yMmVTa3NHS1ROZUFFbXgzaXYw?=
 =?utf-8?B?T3ZaNjR6NlZ2cDErTml5WU04bEwrTTB3bHVLcmlwTVRxdVErUCtKVnFEL2Vo?=
 =?utf-8?B?eFp0cGlOU3oxbGRVYXE0WkFUZmh1STdDbEhKdk5qZjB1dWJDYWQyYXZKb2ZG?=
 =?utf-8?B?TnZwa2JqYUgrS0Y2N29FMUVCT0xOaHdkOVdFTHVyR0dDRUx5d3RmT09vdXQ4?=
 =?utf-8?B?azdxTmdUWTRHK0lwdUlDSGtiSDZJdFNBOFVTd04xUVhFQlhpb0E2bVpRUzJM?=
 =?utf-8?B?QTg5Z1U2K2V2ZEJBYlIrT21LekNtWEtYNTR0VWFZd0MvRUJnb1BnZm5UdGdy?=
 =?utf-8?B?MkpGTDRzRXVkNU9XS3ZEOTdNTHJ6OFlpd2lwWmwxcWpuQmU1NkY3VUVxcXRk?=
 =?utf-8?B?a05pSkNUQjFkdWNJRDVkcERHU1hqdUZiZWd2MkR6bnpyNGY3cWI0WTBHWEYx?=
 =?utf-8?B?SFA1OEZYTHd0K1R3NEFqNURLN1dFa1ZqSVIrV2lSaHp1ZnRYMGtpa3V4VlpY?=
 =?utf-8?B?bE9PWTI5VldrdGp1MXozS2pldjJmQjJPVGJjVHZ2cUNoWjQ5V04vRmxOY1Ew?=
 =?utf-8?B?TWEvMDJiQnNNZXRsb3BWdVlsdUJNQ1dNU1hwVXNyN3E1alkwMnc5YWFRbVJL?=
 =?utf-8?B?VHVZanBPQkl5dHRSNFFaOW85ZTFQcS9VVmE1UXRPRTY3aVg3YTVyMmdablNx?=
 =?utf-8?B?bWZtendOUTBzMy9WaXR4WWlsWFBnUFRpQkx1RXdyUDNPblBMTzJFeXI1TStt?=
 =?utf-8?B?UDFyd2UwK2lNSzkrU2wxTWVjMGtHaU5vNVhkb2t5SUZiQi9IVUVrWitxUmdH?=
 =?utf-8?B?R0dTQ01GNnR4RytzM1d2RkNKdzhIck5jTUdDZGVmTFg1bmlnVGtkMHo5R29M?=
 =?utf-8?B?MzZVeTNIQnp0eWR2aG1OYkh2R1Ezak1DbUxDQVkyVmJNS1RuZHBTTEt4a3lv?=
 =?utf-8?B?SW5EYS9LUENZeHc1TjN1aGdPWjRsbnVmQkU4MmR6OEZMRncxMXdwbEtvZTc5?=
 =?utf-8?B?VmIwMGIzVHlrK1NhcVhmOEpCOU02NU5GenpZSHdlWXcvcjBHQ0lSbE5Jelor?=
 =?utf-8?B?bUFlQnVqM213L1J1aFVabUhsSXhsa3FMZE1FZlphVEdZOGIyYll5WTN6dTcy?=
 =?utf-8?B?RVQxak1XN1ZNd2pycnEyNkV5YVJJZS93VEJtM1gvRGlZOExRUFZOaExjZlJj?=
 =?utf-8?B?TktnZTNLZklubEFKRlBYWUxpR2t5QXIySFFPSHZLODNWSCtKWlQxRGVzb2Zi?=
 =?utf-8?B?QzhFa09hOWlzME9zNjlyV1FUaVVjYkVBVVQ5NGhHRE1LSTVuWWhzZ0xOWFQy?=
 =?utf-8?B?RlZvZ2Znc0VHOHFEYkNaRldmNFdIM0VxckNvNkE3bUJhSzVnZVo2eTJMcXV5?=
 =?utf-8?B?MTZBeXJ6QjlNdUlxNXVkaklPaytvQklWY1lnemF3S2g1ekl0M2M5V3VIQU80?=
 =?utf-8?B?L0ViaWYvWlJRNEdubkhzYVBUT3NIeDVVcnl6V3pNQmhDRXJ6U1NFRlBPcDEw?=
 =?utf-8?B?RDd3TFdEUUsya240N2UybUN6NGpFQUVhcXNSQU0zdUpYeVdveUJPeGx1SzNv?=
 =?utf-8?B?R0toQ2NaWkdUWnhzcC9iamlxSkhjTm95ZkNxTzN1SXRZaWtEdS9yWEFaWmZq?=
 =?utf-8?B?Y1VIU1E3S3VKcTNEYmhWTXNOdlBET3grRHFPSHQwZ3VIdDNKZHl3czltRUhY?=
 =?utf-8?B?L2dUTTAza3J0SVJXeFI5OVFIaUlPTFFzT1FNWHJld3RCM2VrMUk1T1pFdWZZ?=
 =?utf-8?B?STBCTlY2NE95ZjROOVZKQTVRTDNsVmNLdEVHbnFWRUpQNjFvb25FbE8rdHJL?=
 =?utf-8?B?eCtSRGJ5b0lRdHBpOUppWnZFbDJXQ3J5bW00T01WeWpxbi84N2pRQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93956af7-8ad0-4edb-d90c-08de836b00d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:53.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sXZnpTT8OmnVCnUU57AmWix+4388HoKd5X63Rgo8/tEo6zvy2TlAeSDmCVCr/ylizy0Bql7EBAq/1160yLQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6215-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,crapouillou.net,bootlin.com,sntech.de,rock-chips.com,collabora.com,kemnade.info,gmx.net,v3.sk,blala.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: D984C29BC06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 37fbb953ea12e7e2718c169991d1a9dbcc8b6c11..2fa8b797c0dcf379e9e61a7e9bbd9f1f8c59a0c2 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -13,6 +13,9 @@ description: |
   This EC is found in e-book readers of multiple brands (e.g. Kobo, Tolino), and
   is typically implemented as a TI MSP430 microcontroller.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: netronix,ntxec
@@ -21,10 +24,6 @@ properties:
     items:
       - description: The I2C address of the EC
 
-  system-power-controller:
-    type: boolean
-    description: See Documentation/devicetree/bindings/power/power-controller.txt
-
   interrupts:
     minItems: 1
     description:
@@ -42,7 +41,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


