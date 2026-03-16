Return-Path: <linux-rtc+bounces-6217-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGc1AeIZuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6217-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:55:30 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D429BD0B
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 541EC30EB25F
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D782ED154;
	Mon, 16 Mar 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jMhSdYCJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B792EB874;
	Mon, 16 Mar 2026 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672498; cv=fail; b=qPur1Xm5YNNNdKPyoV9x84QVOzl4Drf4dq0TzpYpG6fly9VljQLCnzX+WqbORudZMi6SHhXOmcDyHY1P0GDHF6LOm8dWQzbrPSKb93xPIKWhCJtrZoQxRTB2tVwOrwSWHi2IUGAbE7Hb+xyA5iASzZQLL8wROfvSkkS/z68QHNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672498; c=relaxed/simple;
	bh=ol0qZqcqWwVcDPazVlpm+6Q74G3dJzzGrcItu4rC0NA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fANduPi7j1WhTVjIDaBEqhXg7W4uKcNNvDz936KRJWkLM4zkG/1r/6lh43Cq44Rq3cDlVevW4JAUeboOEjsTsHje3GUmgY/dOaB6ABaO9WXftaxyR8ikpIrSgBtNfLOmj2XL2/G2MsPd/koZV4J0XR66rYtbpzgbDUOjeocLc7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jMhSdYCJ; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru3Svfek2l2T+bmur9A91BsJM7sQfidPgIyhUkwxxhOP/1jLhPiWZmPjj/tXb6veUezdq/ohWc37P14ifvE/5NIBxqSFHEWGuF6BMo9tX3aXyna83s9wD/xHcWKEAD2xMRU94QIXHufnDw3EeMR7WLCB5YyTMm7T4jQ+O6m7ysowC1CyzJJOxruQfGzculQTlH2MXiVw2/eLym/dEGsTccMRSz/OjQTpzFiop4c/SmgN//iMPFvKeKadQBHjPRH6OzcyRsO28DSpGMDB7H4qYoOZ0AO5Sq6m+N8wx5UCDGdr0jMdjpCCzQA2ouLb5eu+0oH8lXTlgvgemlrC1z6ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsNf52nuDip3uwjkXGnM9YlNJelN/GqyjeJNF6o3P44=;
 b=ACT4sqg+2GPLG4dKSdQ3OsNETdNKP13R0LSOWJxJ9RkModKOoR26wcLrOTjJzODsAB3LazFdaH4hbhDrmYZHPC5b4pgLvCqhzhKMar6fH97/4hanmCACFxJrqSIPJf8YHBYJBDrvQAlk6VM5vlYYlSN9rbe+kW2zk/soukxm1NnN6+NW6AJ25PaqKSnu1oj3M+EdEsa553tubCkN3rchwxbN2X2KTZFWcb7iWVspyrWVs/hJCt3QKU/T9i+jCJSKUIja+UyE8OLN8HmDLp+NOpVPYKWSKUzuMHUhl2vQtzjCaamw/IvTQf9SUC6vIwK1M+NWNbAlgID+cKRQ9q+6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsNf52nuDip3uwjkXGnM9YlNJelN/GqyjeJNF6o3P44=;
 b=jMhSdYCJKL0P8FDfTl08b6CKQBx2rLWGWCdfgUltO1H0q6wAUrYt6EuA8KJgjTTjgqEiuhveuStQgzNTDRliBIE8UkGN3LpQbGqyyJEXMLBc5iSg+ePR+vWRzkMni5adOObpiY+Z6kWdEuDoqlSbiGosu70KE+0T1/2yUwplrGK/n+IlYYnpPUGO9ZKIhdw4An47PeW4srEFqehDRdQrHip+qPvAfsSs7w2HjWlxD6f4SeTUFC2a7q25lOQQlSnhT7jOVqhXrKBd3dQNik3U87fhYRSy7PcO0+HNu/4gG2D9eWbplOc6kv7piJiMvwdDo+7CSV4N7JtdTmQ25QCn5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:48:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:48:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:47 +0800
Subject: [PATCH 12/15] dt-bindings: mfd: ti,tps6594: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-12-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 64a41ce0-449e-4bdf-377b-08de836b0c44
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Ss/aSbLu4uoohbTND0or4bbqk7LA9CamfXJCGndh/b1NIOKlsb5sU/WUhqcrePnPSJYcpEFsD1eFny2U1rv4xqSoVVGO0N5h3Ketj94d4jJIeJnlF9LuRCl1/mb74t5LQlrCWY+6hphlHnGRJWRRrBwx9bev6We9pMeYjGT4H5U5YCtGNSR0mzf39p98bv2VePtU5DMHxdvanzI7eISd5Ocb9o6QvVs0G0h3LmqoxpREWQBsOrDtaktA2eRMvNvHWAcemI8Rt6ZDw2rsGSn414e36yFgc7XRozPF99q3f+Z1mjMOvNSTPrGEQVGVXQHzaxaveESwe8d0Ng+2k6wxYZbQzmZTKFRSCAJBC9oCUUa/kL0ZmuiD7QU2K/M4Ah0RsM7lCEnpwyGhpSmqx+f/Uv1igAvkd3c2wtvrl+Lx2DaRdg+RgbdL+y4da+IMyLZA6gvuP9ffa5vYyWm8VhARMKww8UGidlKG+/dnUbWiSnYSsWM/74UPi/iPaWusqptiQxpZumiAVmmFo9iMz8GDsuREZShBTWtsvQ3dkNaHRgDNU3DQNt1St8+T94gRG4I0Mgo/qxibD1IIb+J1QWGYs8504nXog8KudKiwHWp8OoJf+/QhB23zAlAAyNF188IzV3tV98yjAb2p7mu99ssG3j8UNhvxOcJeKKfBvdYCHZL3WKTlUcoUHm29v/qtLHfHt4VPwJ+puDpX6RGvDb+OETi8tvaVr8jVybeZI6tC5nXYe+e/X3SxU6oQlNni/WmMAz25gLLkiNbnG8gZPkQ9g/PUVDgrDMnuRql9VwC+2VSJD1qpMNSbV+n7f5HwnTeg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2N6UFZYN2NTcEZzbEpaQ0p3ZkE2UUpiTkZDcFRFdUdNZHN3cWZFVGV1MExP?=
 =?utf-8?B?MEh2NzlHRHFpSGlwWDVncVRuUTQ3a1cvQTRFcE9oVkt1Wm5kam1pS0k1bjlP?=
 =?utf-8?B?azRNWjhvdEVmNXBBUUhNWngyNmJZOUlzdHpSUVJCd2MzcitBWXhSR2RzRmxY?=
 =?utf-8?B?c0xDUHRhd0I1Vy9Jb3NQNkVReEN5WXpIYWo4UVZnRUVmQTV5MmNSRUxOQ1Nj?=
 =?utf-8?B?VzZaSEdRR0VmZklKeWpSRjFiV3F2Uk9HS3pxRld3UEdCdHhrYS9FNkpLM2FJ?=
 =?utf-8?B?b1BYa1NHeHhUTGNNSEdUWlZQM2xOS1VMd0JSdHIxRnp1MlU0cVdqN2ZyZUJC?=
 =?utf-8?B?RkhWMlQwNkFaeGpPYzZXS2VOdkpCOURFMnJwVzYxMDNEelFHbUFXRnQ3cmFk?=
 =?utf-8?B?eEljemJGVXdOZ090bUxMQUVUZlB3WlM5NTNVazMwVzhEQTlRUnVjVmxOWUVu?=
 =?utf-8?B?VjRJbloxOVNrQmJGMlMvK3RlUTNsd2xZYVlLL0h3UUR1dXcwcHg1QTYzeVR4?=
 =?utf-8?B?VGpJMUh6V2xYYzNVSzlOZmNadUNZclVGVk1qNVBFNHpNL0p4c3lpc2NOWElU?=
 =?utf-8?B?ai8wY3ptVE15MCt4bE44QVFKc2pQQkwrNERML1Qzb3ovdHFRcFFkQVBXVmgv?=
 =?utf-8?B?VDc2bnR5K0t0a1FJOVhiazVMSjNVVWNyVUpPMUhIMGJyWHlwSTU3V3Y4T1Jl?=
 =?utf-8?B?V29UbW5RbTVTZXJxcEI3OFZBS0M1YlZaellzQlR5cWlVOVprVzd1anQrVmMy?=
 =?utf-8?B?MnZUZDQrN3R2cXlXOWFvWVZTbkU3UzE4YjVmZEJBN3c4djNUVGVBSTFUK0xM?=
 =?utf-8?B?U1Q2ZEloRGRiR05ZSWYwSzdUSnhCRGk1aTloQXFKaWVKcTBoTFQ4eVBKaVJ2?=
 =?utf-8?B?UmJTZnBiWWJoK29FZGN6eU9VczlFakREV2dybmw1STZsb0RJNzQzNUVkY1M4?=
 =?utf-8?B?M1NQbnA4K01NVEVjWEJPdWRoVTBoMG9rcjU1RVRQc1JQNkk5SEd0M2dnVmEv?=
 =?utf-8?B?TEhpVnpqVThiQzFJN1dBV0RCR2I1bjAvcHN3bk9KZHRSZFhwd3ZHSnRid0t6?=
 =?utf-8?B?MkZvR2R3SU1NdjlLM0tHUXMrNUg3bExJek1TR2oyQjBwdVVNYnZFYW01aDN4?=
 =?utf-8?B?UEs1R0h3MllRdlZjM1BDeDV4dkJ0eG8rSjdvMHVnYjBCTXhreXZ4OUt4UUNY?=
 =?utf-8?B?MHhmUXZ1MkNnN3hIMDBiQkY2TUtCZmVxK3VIejBEa0t6S0JsR2dQN3Q0WUFE?=
 =?utf-8?B?NGJhcGQybWh6a2dSN2FlNDk1aHFvUjFScmhEV3JuUGNLb2NkRlEvTk1MQ1dD?=
 =?utf-8?B?WEdtdW9PajJ4b0gwM25MUlVsSStWd2FUUXFXbDVnMlA0YjhSbUVDcjRHNyto?=
 =?utf-8?B?YzVhLzcyODVGbjdkb2tGQXU3cWxPRU9EZytTbnpaVFAvNWF6V3hyN3I5TEhw?=
 =?utf-8?B?cTA5d09QWDVFOG5jY0FmbU14UzRLK3QydEtzU2liMVppK1Y3WWtSQis4cmNr?=
 =?utf-8?B?Q0tzNkNERkxRQ0U3THZXSGpVdFZ3UDB4bVhNSjUxYkprRkpEWE9tSUZreFFM?=
 =?utf-8?B?a1BIQmw0cWtCb3NER2tOYUgwdVNRZzJCVDQxQ0FmSUo0UUFZZlo0b1BJeHdz?=
 =?utf-8?B?YzBMUWNVenNJY09IRnYxRmhBNjVYV0lDZGIwVnVRQ1MwWUxXSGFIQ0c2dE02?=
 =?utf-8?B?Lzc3ZG9QREU4TlNpVnRvNDh2a3FQZFdJTy9hL0dzTHZaNG9RU0swZE9lSUkz?=
 =?utf-8?B?UmtBZC9mdWtFVkk1ZzQyR0dZcFBHMEFvVXliaUl1dnA3ck8wSnNPeUQzY0Yx?=
 =?utf-8?B?WFF2anU5dnBUT01NUlAwVEZZRGtRV2QrRHdNUURMMVRQRDJ5bGRFQmRJVjQw?=
 =?utf-8?B?NVFDcUtPRVY0dkRia3hhb2FKeEcrQW9HVVhmK2F6Y0d4ano3TkhzdDl3ZEJE?=
 =?utf-8?B?ZTdWWXZZNUZRMUxNN05YSVFybmUyS2p1M3FiSmhQWE9CajdJVEdFRWZqOHRQ?=
 =?utf-8?B?UXRDWUpaT1FRd3QzNWZHUFBtVXZFQ1dpaEgvRVJTTk42dDAvSHVuZGhJRXhN?=
 =?utf-8?B?b0U4Zk1FVVFMdGRZUFJFNXEwQ1ppWS9LR1Uza1FuampXMWRlUzdJTlgyQW14?=
 =?utf-8?B?NDRyazQ4S01BNWhqU0diQTZYaDE0Z2tjT0NsclJUOEhRM09XbG1HRFk0ZWFi?=
 =?utf-8?B?Z0R1Y1h3aXdxRlptSVg3Y28xblZqYit5R2FFUjZNZGVvV1NJV0sxZXB6V1py?=
 =?utf-8?B?K1YzRFpreFNDYkJHZnQ0MDBiV1ZFQTR1MGg4eFZCS1ZEU3N4Tnl2SFJVeVZC?=
 =?utf-8?B?RGdxSVA5YzdkZmV2VXFnalE1eWhXc2w0OEpCbXpoN0F4amdnSThNZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a41ce0-449e-4bdf-377b-08de836b0c44
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:48:13.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slbGhSKRb+OA0+Na71LdYUdnAxLEn2tlVaW/IRoxJ4h/pgfdEKhBSxSotlI3vWGBshG764ABp4PglLDPfYqvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6217-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 5E9D429BD0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
index ca17fbdea691d46f53cc9a85f963767da733ee1f..6a35cd3585909075146ae69c4274521d51981727 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -15,6 +15,9 @@ description:
   PFSM (Pre-configurable Finite State Machine) managing the state of the device.
   TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -38,8 +41,6 @@ properties:
       device on the SPMI bus, and the secondary PMICs are the target devices
       on the SPMI bus.
 
-  system-power-controller: true
-
   gpio-controller: true
   gpio-line-names: true
 
@@ -104,7 +105,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


