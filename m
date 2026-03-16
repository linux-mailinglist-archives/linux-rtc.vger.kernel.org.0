Return-Path: <linux-rtc+bounces-6211-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJobJaYYuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6211-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425429BB15
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EAFC3038BAF
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF2D2EE611;
	Mon, 16 Mar 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wFW9kliw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B292EA16A;
	Mon, 16 Mar 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672441; cv=fail; b=b0SeKqGeTcMgeyUeFfFExqO1m513Z7ls8dQqSSK7InrNHz/JSC2jXw/O7kuQY4mgdvnY42syr1oR72bdyHb6l7z+sIooRwy8mK9Hipi/y9M42ptMrPVy6wt77N4RcPKcRkuqO44zHJBAYnptSu7cuzXnXJEw5n2waff/hAEBihg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672441; c=relaxed/simple;
	bh=es/TfWf6oXKh6LSgsk6GmaTEfGTEVtecMxDonGyVV7Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LG+xXeF8vjqbNcrSPcgcAouU7UUiAmgzIx9f3+inR00gVyI3a7F2CsVfmyB3TTST10e0svBE2rfgjuHJIs3pu47/YkEziFZZoWM8dDGJMLhUhF0zOhxquRDtMvMFn65FygiaUdiR0vF0UVZ00kouHKne/jma1HW2Cm1EkNDOBLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wFW9kliw; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w68hxx3SU2c46u+hsvWRmvA7ZOkOhs/HQh2BGpNTAvQ5H59YRVerW6cfsHDpMwRl+KiFAUklQQRJZz+qM+gXv2+vPb6VuF+RtdZybXmTmuzhgsMlrRcZN8GSxbruwSZsHHzmI6WUAXbbe2hEY/3Bu/J7JyqY9fMmgTUJ3PY5S/khZs26ybUpdBzzxgyOhZq1w2uFMSEA62T9n6F6nMYZtu33Oit2ZF7GZREP4iRbntV34l0WhsWAtLXbgVTkY9rmMAoKaA+eHQxnmUzvx9FKCDJTqW4RJgVjcbRLHyP2jaOsBaBWwmImL41KFbzzyX+B2Dlx0r8C9IVXjJ4A9EVGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7fHnNKN+qHwVNnDBbGLv+sd2JZD3z1Xn1tVhXyGS8k=;
 b=BgqMbEXkKmC23ZnLsh5/hpHp0KmKujL3gb8SEQpfSYyFQGf7CbCqGSjrcbKv/k2Fu5swT4/xZ4OhlBP34Xq58sY6qAEVG7afa3phvcit6d5pa0W/quydnjuo9ANnYwB1YETdgTWmQ3DxQC28kFGnSWRZQLLsjjd8ZcjW9imJFdjCKxCu7EKg+kUpLslMlyUvkJhijMicxxWsneeCuXGbEFya1fFH/Zmyj1Tkqkv1/A4Pb0XpaQ8T79vyKJiYfNuRisSVX2P1B1DKXhI6rYU9s2xq8jz5vjI9WV0cv275ffYW/JI2Jq6zMaznzTFqUk7Zjy/dJ7G8SVzxJTbeE1Mz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7fHnNKN+qHwVNnDBbGLv+sd2JZD3z1Xn1tVhXyGS8k=;
 b=wFW9kliw4Umt9shUi8b4J79JGkfh+LrQmbgV5+vDkF5ypL94WVWvICzmkAe9PsGZwBziJuVtDmaiTXVsgN8FHzkET2mvT+Vjinf9j21thRiVcMnHW6fRHKnP+hqWntkzAVWn4IYV4A9yA6zXB0uYp/6695qezAo9wPoGjA/YDjlJ1FRnmleOcIRhjqosA99wPGVjulsLSiJbjdceCI4DYkQP+h7IRFpkCAg7aGT4IDfaROOXJ/gY2NzoYoByGJZVstltpQYqKEjkb8TzAjyGhwrbNeWG+pYkA1RURMk+8CicgyNAlhtCRRYatd74+fGcaP4zoh5XVkKZ/CTugxF+3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:41 +0800
Subject: [PATCH 06/15] dt-bindings: mfd: ene-kb[3]930: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-6-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b281143-b1ae-4523-c1e7-08de836ae9b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	N0P3EvRuLY3DOsznZ416ksNWgCLChoe8fxMKhgpOQNJD+xFxehS9JPLVZqjSVJJxoM8huoqlXbwOTvr8n/gGpbpX5BZI6eNPkUFEMLjYQSlWjH39MvYAR2flFgPAhXv3lZkWfHo5o8MooeZknWPoLHLGIV5Qf5EF+AJRff3NLqYJIVIfz+ZyJGk8PBiUkRXWQn7bSv1bTObLd6Gu7JWSXiPZbpoMIiXLRdI5b/kbVrcfBYfsaYISYbmJNTQVJOisztr/nReTmlDq6Eb/mJTGb7RnGrZEvQZIEvT0suJggc1kWtT81JZ1jmA/057o+vbNtP2nM1mGkexLuHEDWwfEA0J0FvZUbw+4YF7UYECtZLQ/vKJegapJ8OgMZNmTLORR5czOOT9KU8Zw3oYQhWczKNsGa7RS41WMJsbI4FmCtVAf+vNm6olkTyH+5k28xTiUb6fPWkye/L7h9ht2B83XzB0tqF9CxfWHRK0/UzN7LjuxvqF8FZkyb4Qal7GUA1BTP2IzE74DYWa8JiXV98vBEKZ2q7D7+aNknlXvwfK5j1BJpudqcUza/tlQJDFqMfYPewG4Fbj/j57/6wxceZzr4IpNTy1gpC0O847kyUh/wAboO7Sjl1jXAhSdIvKXZiCbeUCAzjQvyH+Hpe3fytLjIAQOTHtssmRJLGL61Vwl2LpIazg1iRkKMiOuqkaiJceShgDOHaNN2A9brKlV7biuRkgBfzCSG3MZrY5Nkfu/PdDtDcoX6PFKtJiv6G397/PUL8YkjkflsJsFknIDbZhT0eWFSI9VwyI3gtJPDmcBrJX0zEOweL3/R45SYBXNs9ER
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHhZTzNPNUxEM3lKdU56aW9XZVJQMVdrSy9GWm11bmhZM1RIcjViVUFWcnVs?=
 =?utf-8?B?UDlKWGpjTytubUh2ZTB1c2p2VjFoZmJSOHZ1bFJqUWZoZllPanJadFpBb1Vs?=
 =?utf-8?B?MUdsUmFUSkZvRUZuTFVueHlwUVpZR0c0RjNYT2tDUmNoYnpYSTVaSllCdzZD?=
 =?utf-8?B?R29TZnYwaHJnc211NUVRU1VhQmJtZVM4bmluRjJYNENtQnc2VTd1d1lmMnFC?=
 =?utf-8?B?MWM0T1ZHK2ZoeVdnOUlNbVJmN0NrS203UEVUMTFWNm5mRmpzWXQ4a09yOVVi?=
 =?utf-8?B?QlUyYXZscHdKd0hWZjRQcmdSUml0VFpNcm10VThyRWhYZmJ2MVpyRWwxOURp?=
 =?utf-8?B?TGViYlhYcldzekgrY2lXY2paNTN6b3pTblZFRjFwZE0ycWg2M2N0ZmVLbXBX?=
 =?utf-8?B?ZDg3RE9ZTjJYVlVWUzBvTkExQ3pYNjZDaGxuMzJCcDEvZ3VJR2FrZHNKMVJM?=
 =?utf-8?B?Rlh6eTYvcmhkT0JiL2pkSnRNcXNPRGFtTmdUTEpudXNTeDhmaUk3K0NFSTVV?=
 =?utf-8?B?L1kzMWt2OXA0djR2NGhEemFaWlFtZHdxTVBobWF0MUxmMUlXS2FzTVQwbUZR?=
 =?utf-8?B?alNhMUpLU1ZnUDR3cDlhMUtkVmE0TGE1azl4K21MeWtKL1NqR1hEaWNjOGRl?=
 =?utf-8?B?MGtSMmFwT1lyTjlLV3FvLzRwQnE4bk9jK3JJMWx5cW5PWXJQblRRVWVQUmRI?=
 =?utf-8?B?TnppREFYL3FzenlNNUxJSHhtRXk4TnlnNW9uV0xNU21rdXFPL29OdWFTTzV6?=
 =?utf-8?B?ZnZQbzVEMkZEbTJQTzlnV216SXZUcTFzQmdiMFlFT0RwRHNYeS9Tcktsd25k?=
 =?utf-8?B?Sm1NNkV2bk9yMWpGSEhrcUNXQk1qa0hHVC9vSW5SelRUN2FRalExamtnMlE3?=
 =?utf-8?B?MFJkcVlBc2NNN0k4ZmJ2SCtjbSs0MWhLSWpSNlU2cFJLOWpMaEJFVXBFVGpr?=
 =?utf-8?B?MWdObi94MEF6WjRHaXNEWVhoRlJpRzI3MlgwYnlaMUg3Qkd5ZEFSMkpBNWZa?=
 =?utf-8?B?RDlLTlZaQWNodnlqNkpLS0hiS2VHQzYxSkhIM1dSWmEzci9qTS96cnY5ZkJw?=
 =?utf-8?B?YUhjdXl5ZmJpU0JEKzhhMExZVC9oNC8vY0cycE1lS0trTGYzMEdrUS94NC85?=
 =?utf-8?B?Tlo0VUp4eWV6d1Y3WHNOSFZCbS9vQVdZdEZjay91NE9RY0hkZUJPZVlKUy81?=
 =?utf-8?B?S0JTRDArUWt1ZWR6bzRndWtOQ2QwcGNoOHAxQkdwWDErVGp2cVp0elhhTFRl?=
 =?utf-8?B?cVR3TjUyNnN2WXRvd0FIT081VXIvcmlTN3Rkb2txR2EyTGNiRWtMRUZ3c2JT?=
 =?utf-8?B?TTVSSHZuU1Y5NWJaK3BJKzUyRS95b3JXSEM0MklCM290SjFRWGVLWUozTnZF?=
 =?utf-8?B?dEE1aUtOSWRIYklEa0E4UkJleDd6OGQ5UHl3KzY0NXkzTGdjS3ZxYyt2U0Y4?=
 =?utf-8?B?NWlveWlUWk1GWi9qczc4bGJUQmYyemV0ZWtxR093cUovOTNyZVg0UzZQOHZa?=
 =?utf-8?B?Y1p3NmNzRjlsRmJld1ZESVFKSVZPallIVENPRzY1NktSdGlGa1h6MW4xOE5B?=
 =?utf-8?B?d0wvQTk2VDJRUGloQllpK1BEcGtZSVNOMjZpcFVXWHpMR1RzVFcwS3hpQTRl?=
 =?utf-8?B?dmszVGs4TUsySW55bzBiemcveVZ1NUJEL09vNWNUWDV1b3ZzazBvZVRsQVlh?=
 =?utf-8?B?OXpFdmxYdVpvUkxIckUrTXU1K2kzRm1pM0cyY01KSkVkWWRuZHhCQ21tRFlY?=
 =?utf-8?B?VjJwNVBtTjhqbXppdnBGeFFSSUxHRk04Q2RFcDFuRTdCU2xkbitrSVBiczdX?=
 =?utf-8?B?cGVjTTdWQnpCZGsvdyt0ZWZhTmFiTDB2ZkRmMXY4eWROU1oybFg3ckhlanR3?=
 =?utf-8?B?SWRRdmtURWlHZlkrOEl5ZDZscnN0ektpUEhzc1dMMU5ibnc5ZDg3SEI1cS9x?=
 =?utf-8?B?ZEs5QzE2L3BXSHJlT2sxVFpUWFRocXdSQTlFbEhVQTkyZ2hZQnpWdkJ1bllV?=
 =?utf-8?B?bDcwSmJabUp4Z0Zld0RKNUlKUjJ1YU1tL1RhMGZKVUh1ZFpyeHNoNG9IRWVP?=
 =?utf-8?B?MW5QVSthaVBZem96YmZHNUJIMklPQ3lHNjJLU1dWT2JDaWlOdCs0WU9ZUnpT?=
 =?utf-8?B?WmloOWE1d091WXlieUF4T3VRdEpzRzgrMjFvUXduMk1jaVpOb3pBeDAzd2Z4?=
 =?utf-8?B?MjY5UXAxeEpoU216VFBRejhtUXZDdG1oT1lUTEZsZlFwRm9IdjJPUmlyUmIv?=
 =?utf-8?B?bnlRSFVVa0ZDOTE0K0hKU0VEMUdXZXozL1JuK2FKMmZETk9mTEdIU1lXcGRW?=
 =?utf-8?B?TEg2WHdyUGwzdDBKTmJOcEZnUHQ1SHlzSTFwK1g0Z3ZCSWNObVJuZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b281143-b1ae-4523-c1e7-08de836ae9b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:14.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 873sqr6jnGjD9+ARvSVZ8WagCvtNFLUDOMzELWBnF5OOkipUJY06KgSWffY0DjOrxz50ZDidj4JaXuMIubgCTQ==
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
	TAGGED_FROM(0.00)[bounces-6211-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[v3.sk:email,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 9425429BB15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ene-kb3930.yaml | 7 ++++---
 Documentation/devicetree/bindings/mfd/ene-kb930.yaml  | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
index 9b11b6e2bbf746f46406db268bf49b6775939fb3..1847a6d5b22e8ded8638424cfdc6605005d20846 100644
--- a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
+++ b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
@@ -13,6 +13,9 @@ description: |
 maintainers:
   - Lubomir Rintel <lkundrak@v3.sk>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -26,13 +29,11 @@ properties:
     description: GPIO used with the shutdown protocol on Ariel
     maxItems: 2
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
index 02c111def5de5fa480c59e70518e1de89b2aff08..e0c8abf95bd92f6aa463e3347c101a1c1589161e 100644
--- a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
+++ b/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
@@ -13,7 +13,9 @@ description: |
 maintainers:
   - Dmitry Osipenko <digetx@gmail.com>
 
-$ref: /schemas/power/supply/power-supply.yaml
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - $ref: /schemas/power/power-controller.yaml#
 
 properties:
   compatible:
@@ -24,8 +26,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg

-- 
2.37.1


