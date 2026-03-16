Return-Path: <linux-rtc+bounces-6213-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFj2AkIauGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6213-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:57:06 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6C29BDAB
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD431318B6BD
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C4C2F5313;
	Mon, 16 Mar 2026 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S2cuGSS8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2A2EBDFA;
	Mon, 16 Mar 2026 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672459; cv=fail; b=TD6lkZtMt3xIFlhyQaJZUS9ZcmcUcI7S99uavW+1Dh1bZ0QduN2d2Qnfczz/q1hJNjuEoRelXZMf0IInnYLHgatgBVS0agm4PLBIST7m1hd/f1RRXnoxPfyQZ1j8WV8VeTM8OWH4e0UIr8nK8knk41nGO68lq010/xVIH7BqD9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672459; c=relaxed/simple;
	bh=av8AY2hhZfpfdQRQ2lRCYN6tBKhrXzGLaS2GGyO8NfE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DRU6alK4lXpQkyesfgf9Ok/95kA9yjY3r9+If5wOr1sZ8cJJWz/XcpVY7p4c90qpvqLR4qO0VV0fwKbBIgKzuenZ4EbPP/n70GtSP9kP1IAd4KjnNJAS8wGr+kGj6LpbdnTVte7v1TqG3torCHMlu6I7pYcTmcwCMcjhbaDZdRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S2cuGSS8; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFOggH52LMHx8RxNhBnfzC/PK4L7sXpUE8L/q6GigbiTb+5cbaW8AZQ+U4TA7odTr5AuaYsxqzyEqLX5oxOhD/wFYHbv6qFNzpsKt8NHfesrpvMH+zj4KC1kFib970I8DXZXdtn3pg4WcyH4X4AZnPrnM47CJQDc53Q04siySujbXqzB8CTVDSoKGyi9NXdruyKGweb3gX654HLnDDiSGJbCs8UcU9nWrKxEvGWwIvU2Zlr4m/2DFH4kxtpGjah9nLVIwEwVrJEImLGgUsk6O+NjCwdxsbRgrqteXqy0IfHdfgm/M5YyxjzVXH2Qp0SKaMwxb3zBK69fcKpUuX2aRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAMeO+8YviSITizvPy9oPa9q5wrx3QRaYDnheMxS6ko=;
 b=LImaba4B24pwvZcP87w/Ci21XDjEX+jhUEYGqvVtI7VCOEG8boJusAZI4mvwPmKWoxko+cw1P7y57g9JeNbL+d3banevNspJJoJYohB4oLooYKWIY5YzFua6+dq3SQxKdStiuW2ObUO9nq4/SCiIFep4XvNw8sCJQ0Ifi6yHPRJv9UdNlFhGEnRm0nfCnvSnlIOSMyUR6j6wo86HsRZIqYRnJpTZVd5TWBdYSm1+RJGxU9IonpBRalk+ZS7kzwJMmUnNNzK28QyY89lUVduhg7ltjzd9+iZDbL/m6DvWT3hJ+r98GG6CpKBlIjJolL3F9lVnLzUvrLWwVNBtLXOpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAMeO+8YviSITizvPy9oPa9q5wrx3QRaYDnheMxS6ko=;
 b=S2cuGSS8wNv1Upx4GFOIWgp/HjB/Q8jmo3/B3cXpsg8d9Io0nqAiljIhNKzEHNDz7AsEkTjqGHS+8UcegSSaVyBZIyWX0F5zMQApGOTD1tySp/YZyu7P0qOfXJI0WgOUGXJpo4WSaDnBlR6T+npNXK9uEIzRtxbvJe/D5pS4H5GiNp6TMVr4a2Kb6+dNjh6Adjk8X3ndEjoeXAp6gvao2T+5mIruan1lKArJC1L0T72mv7rhAliXs0h3vdfX5hJNRSaNIF/BNloRLTi3cwO1Dshe7XT+E8Z84gGpvJgaMsEPhlUgqdEO0ArN3/yrT+QstWQTezjGvMNZp1LUxP3NMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:43 +0800
Subject: [PATCH 08/15] dt-bindings: mfd: rockchip,rk8x: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-8-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b52f3f13-408f-4ad7-fcd4-08de836af54f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	TFVd5vXx2BC56kaEEbxrrXDzcRdWIrVd8XTdoYh3/lbGROVoek7byPouR7+HVKw2NWyJ/lcnXbS/+OI5//SNNNeeA0FRTmNL8jeqrMcMH8+0LXI5ufA1QZT+3FXsLWetryHcpXK84V7N2fEPtWfYh5SF+up+kRWic3VA+3vHp6Bsc3ihrjpvSgSGWMd2X72/CbuUl7/MnKPJEV5QuOkZ86Ywav39xOJvPEywXgYfnRp5tURRpoDqqf1erBBGUvij9LE2l0aZB/SmrLwEy33BC4P77H0MI3tYP9rYDbcYMBGAoR+LPEGo3euZlHrRDFKBuB0bO4U6FKrs4robjpmzynPeZWN+gaXBx1Pa2IHPR8kaz82aIMfpOXc48fsxMP4mXY3/EkR5LWOZU94xQ3GE2X9Gg0mwWA8mFTeYzsc+8L1pSGuNnkw+MtMOMs+q2n5zv6lRFxpBrUiA7QtA+RRzfe/+g++2qPEulB2nwIX6A+qZLvm6UztHHTTDSoN5pByUQjwqM4KV+l16CFTII2Y+2gpovgDk1mwmsRkMEaTBspw85BcOL3jFh3SzccrbZVyHY1QRf3kt3pk2xrmwOJT1MqqGrU9q8uHBuNfAuV7CbpviZs2Upn39RlWw6Ou82U26snIrp2Z6YAl06sMAJt7FoLfPyc8GkzYIUaRXtHekuNJiwg06rP+1kBjw9L9rytcaCUAqcRj3ElZWtzcSAcFCcoOQyTXqNFuR4It9yvU+ZcbPHA5so0ZknQFH1N3W3AVzKtBZRsdqY+mi4h7LCrlm6b5G81BPVb61VTWLnPRgjGX5sHOHFu4FXTQ16fGGEKZE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0F3RmNoY0lHUFBwU0x6ZFVOcDlaNkdTc296WHhlNkNaeDBzb2VRZDJCMTZU?=
 =?utf-8?B?cWUwWEFXeWprbGh5bHpqNmgwQWczTEl1Wk1ZOHpGNFBaNG82ZW8wdWx3eWFS?=
 =?utf-8?B?bFN3NkdzQ2xWNDV2ZjVLR0JHc0kvYXVNUHkrbDE1RUpPZCtQMWMrYUE2dEdo?=
 =?utf-8?B?RGVKRnpXdXZEbjlvb1lCbVFDVkZMd3lGUTlMamJvbURub3ZiZ3ZlM2ZYQUp2?=
 =?utf-8?B?eDRWeTlqWHNFUGFrK1hVQVlBOVN5ZVBiellGN2RoQWZvV1pmTllNV2FmeDZ6?=
 =?utf-8?B?ek03Lzhmb2xPbWdxSlJIYUlEa293WUpGNXFDeEVuQWpNMlNJZVZCYTJnNVFB?=
 =?utf-8?B?ZXRSOUdzbk93RlVmUnlrdzB4SmhnbXNnNzF5ajc3MWE5Q0tMQm9rMHlEeExG?=
 =?utf-8?B?bXBlRTVsTTFnZE5qMWVyTnd5OXNSUjgxa25nbGVsS0dCckVDRlJDRytWeXhj?=
 =?utf-8?B?bmdZZEs0cmlaWUhNL3dWa1U0TFZSb3FrRHhhWjB6VGZVLzhhbUoremVGWnF6?=
 =?utf-8?B?TjVoMXVJZnRud2dLWFI2RWNybldtWlpZWEc5YXpSYkVvU3pHTnNKRmZMM3pB?=
 =?utf-8?B?V0pYNDNTcXhlYkdCNkptQm5UYW5rOVcvNU9RdjZiVXNSTEZSWXZ3Rm9tQ1kw?=
 =?utf-8?B?VUhVMkhTRE9vR2JodWRHdnFZOXRhZHRNRDkrbGYyMzRRM2lGVEhkMUIwZFdw?=
 =?utf-8?B?Y3EydXZUVEJBY2dvNzM4VzB5akh1dWV0RGxLYkUxQUtacWNpcmlYdG91UG16?=
 =?utf-8?B?U1Q0dUlxV0ZtcXRLY2lwWTgyODJ3SWxnYUhyNHh5RUNoUlRucXdTeEsya2dw?=
 =?utf-8?B?bDl4RmpHb0ZnSlQ2RTNFU0hSNUUrMEdmb1kySjdrRjVkR0k2WW5pZWZZaU0w?=
 =?utf-8?B?Q1V4bzBXYXBUNzZWdlB2eTk1dDJEQjhBOEp4VC9RNVk2cUd5TEUyblNrU1B2?=
 =?utf-8?B?UHhSbE5pckZ3dGVNWlp6U0dzWVBiQVFiS0dKbDRZSVBQZ2R5dklKdE9xSTJ4?=
 =?utf-8?B?dFFxSE94alh5alh5SlBsS0xlQXRuMnZvRFZyV29yRU9BSCtyRlNtMHdyVmVX?=
 =?utf-8?B?QUJSYi80c0xqR293dzF5RWYvbW9VTitJakgzT3dmUzE5TDd5NDN4SW5tVzcx?=
 =?utf-8?B?djQvOXhJYXN0WGlFY2N3TE9TbWxqL1ZHbDBOME1kSDNZMHRRWlZESzJmc2NR?=
 =?utf-8?B?SmVrZHJDWXV3MHN2aHNad3ZWWXltT1gvemxSN2lFOHpxZWhrMW1mVThIL1dC?=
 =?utf-8?B?WFNUdE5nMGFURGdaS21yNXpXRmdreDR0aWUxREN1TC9RNEwrb3ZTelNoZEQ3?=
 =?utf-8?B?SURtcHZ2OW1wNEFwYkwxNzRXTTYzeFBNWXgxNFlQWXBScTZGYVJqUVhaTXB0?=
 =?utf-8?B?dE9UUDhsQ1dTL0p2dFhweGxZbHcrWFBMeHd4Z2hHWG1ndkRTL1JkcUJkVm5W?=
 =?utf-8?B?b1ZvN2J6UVREK01GZitIZURiRXkrMjRpVXBPS2ZSTXRGT0xEZldkcUlJUHNl?=
 =?utf-8?B?QWhEOXZ0S0FDN1N5SGxiYVFxZFJlNzVJR0NtTGRyQnZNbEMzcWVoRzh1cGxs?=
 =?utf-8?B?TG9iNVIvak52a2NDd0ovTGw2VmNUZnNWNkRCTXVlRUdHV0ZKWFB3ZGw0ZW1I?=
 =?utf-8?B?OS9kMG1CZG9RLzVZYTV5azVqWk9YS0Q2N1NPd1g1OVUxK1ZZNmZxczcveEtu?=
 =?utf-8?B?MmVPTE1Jd2kyL0l3MCt0NzViL0huTUJlTXdBNjV2cjYvelZ1WVNxOWdxUFo0?=
 =?utf-8?B?bldCeCtLM09xU043VWR6QWdzRENFcStsSTFjTm03aUhobTBoZUxtRSt6ZEpI?=
 =?utf-8?B?ZlFWTkdkOVhseGREZDhleG1wQVc1NFBycHNqQXViaE9CbGtLbnl2VTgvSHUz?=
 =?utf-8?B?eFNnVDExdU9aYUxrMDdET1k5SXhqM0t4WnRvQ1M4bDRyUmg1MW94Q2g4MVNJ?=
 =?utf-8?B?aXBxMFhwTHpXM095UDg0cjZZN2xuRUYzZUpCZEFQRndtQXV6NWMwcllyNUlP?=
 =?utf-8?B?b1BZVk1Pb1NTbXBUWWd1ZWVrSndJeXM0OUp6Y29qNnNJVkZvLzdBK3dHTy9E?=
 =?utf-8?B?NklnSW1nUCtIYThlclhqTWF5YVprbk9BQTRpaHZWOXVXT1dDTW1BNHhXSlNL?=
 =?utf-8?B?TDJFNUFJNUFsUkRIMENHUlNKRFVZcEU1V1pKL095QUROUXZML013Q2l1RFBE?=
 =?utf-8?B?bjUzNE5lcTI2eEdScDVIV2ptVTA3TVBXMjJteitZY3pXRHo0R0RINlBQRXha?=
 =?utf-8?B?NVVwMitXQ21kcUtFcVVqOEhBd2k4dy9wK2N0NE5mdnp3YlJ5c3UwY2JkWW1n?=
 =?utf-8?B?YzVKNXhHQXE3T3J5WHpTY0h1enFKRldONTVQYjRJZGdpTFVvZStFUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52f3f13-408f-4ad7-fcd4-08de836af54f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:34.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkuTYJak8+BC076ImKAagEtuqyJtzF9HYVsF1Z8MJYsjQvnL7uTmdaqz8bwS7P3x7JJvHjSZOoo2/8OAnbAuFA==
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
	TAGGED_FROM(0.00)[bounces-6213-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: 9DE6C29BDAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml |  7 +++----
 Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml |  3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml |  9 +++++----
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml |  5 ++---
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml |  9 +++++----
 7 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447200ba4c131b67f94c11913f70be625980..5d644f3fbe1bf734efb6a49b4f7284b7397b33d7 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -13,6 +13,9 @@ description: |
   Rockchip RK801 series PMIC. This device consists of an i2c controlled MFD
   that includes multiple switchable regulators.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -24,11 +27,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description:
-      Telling whether or not this PMIC is controlling the system power.
-
   wakeup-source:
     type: boolean
     description:
@@ -76,7 +74,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16c0aa5067128cd6f76e99f1f0f8fe..7a123bcd4320f10a85178ad23609147586fddb20 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -46,8 +46,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -87,6 +85,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +107,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -126,7 +125,7 @@ examples:
             interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
             pinctrl-0 = <&pmic_int_l>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca31948ef0d39c46025d0cca65b8b4105a50..e441c648969915137f73e4222dde2446d43765ba 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -29,8 +29,6 @@ properties:
   '#gpio-cells':
     const: 2
 
-  system-power-controller: true
-
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -136,6 +134,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffac8fbf53034df8b0c88eb43c7675749311..9bb1467bf5ffe923275589c6817db9d4710043bd 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -14,6 +14,9 @@ description: |
   Rockchip RK808 series PMIC. This device consists of an i2c controlled MFD
   that includes regulators, an RTC, and a power button.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -41,8 +44,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -119,7 +120,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -140,7 +141,7 @@ examples:
             dvs-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>,
                 <&gpio7 15 GPIO_ACTIVE_HIGH>;
             reg = <0x1b>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index 0676890f101e5481a7466b26de5544a829c29101..853ad270a827fd0b40c50e69fb48a2e23d16c51d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -15,6 +15,9 @@ description:
   that includes regulators, a RTC, a GPIO controller, a power button, and a
   battery charger manager with fuel gauge.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -39,11 +42,6 @@ properties:
   '#gpio-cells':
     const: 2
 
-  system-power-controller:
-    type: boolean
-    description:
-      Telling whether or not this PMIC is controlling the system power.
-
   wakeup-source:
     type: boolean
 
@@ -108,7 +106,7 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84cfb4c07a17b6390470b0ddb95bea1..4c5d2f43a6f182ff2bb0fe26869a1c56120146cf 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -53,8 +53,6 @@ properties:
   '#sound-dai-cells':
     const: 0
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +155,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
@@ -195,7 +194,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c27ba147aa83ff86fdacb546d08272fe1e..d1ca8b447034f2d0d1d3474932f3dedef6dff0de 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -14,6 +14,9 @@ description: |
   Rockchip RK818 series PMIC. This device consists of an i2c controlled MFD
   that includes regulators, an RTC, and a power button.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -41,8 +44,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -111,7 +112,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -130,7 +131,7 @@ examples:
             interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
             pinctrl-0 = <&pmic_int>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <1>;
 

-- 
2.37.1


