Return-Path: <linux-rtc+bounces-6210-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC+sFi4YuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6210-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:14 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5229BA7E
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08193303409F
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B562EBB8C;
	Mon, 16 Mar 2026 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EcQ6mW1V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E39460;
	Mon, 16 Mar 2026 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672430; cv=fail; b=OUgazr8cJdUMDpmOGqxxXv6q/EmB61PnPQtnqaXVXf10jfVouyk8mBxYZriE2BbRsy8L2MKt0iYkXi0EhylfvDAVH6sCC9SIXD15F4cPjtF3MCVvZkDY+wgyyKIkzn3TUNhkT3k5L5wz596Z7aCrMmYB/MWB5FeJS78KGawM6Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672430; c=relaxed/simple;
	bh=dbBZjtyFPNA0uUf+Dia3ksLtx2srqqJ4TT5ib9++14g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LYU2VrcbryteR7B8/PS0KIzDYPqQl/IVEYpF1/I9qikfCnORw947zvjBM+8FBBmr3YaqTx4OhGN+bO1JUPR57OK3zmsfvPerUSn1nN3Cu45jM+zQP7KOOD9ASdqhI4sXMOSfXFL3dq22fqXyaLbKiDAQwq2uqFC9wAwnLaR04ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EcQ6mW1V; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYNban180ZQC9FNWPQX9VMDMI6wxWMHN+3di5bCA49VsPI/596FVUh1SRcAnipO2/l2q9jmeXnRXfBi0LTT5JWCAoJhLfLdHRO2Tom86wAGfeo97ERPiJxpzY6BzB5bPMWg0dccHPlIElphM4f1cVxIRwDlSVyCifXkFssVpBd1LViBIFquDrz4HqLq2XXJ/HTYxBXvZfNEBdvHW+c3Etwm1V27ZnXr4Xc+sPyeajSvG9NZv1GejKcYsSU35ifIf1l3KnXrxRJiYpeavsQstNxlx3n0xxYJUcHZl+K8CqtEa6ND7w4/kY3N69vremHokdo2frfkiaBMeN2GtMybGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx3jrue966p8T5vHPSaJGU3Dcg3Rm445bbTGvk8erMY=;
 b=e86Kt5rH5oIlHp42lzrYet/g9XxU/KD0eVi0fuq20RYy86YSAIGIZDBVR5rz4godTK//zOFYB/iY4murLZ6R1Emmn1BGjhDXYpQYnsVEaiG2xDbWxOB0iAoCkf+O6hooOIfYngTgnlYzUZ+gIg6VScDomIlzWX5/mv7xtmp6pT5tDGCe6aC/euBc/X/7RWo+Oc0C9BFpBUwqiqvVmBjgTSmd9u1gfvhjQysua8FJOcsbqmLKAnLZGg78ouQlltEnUfUfG9gP+5x2k1qk7WnqPE8FFMGqJnB1fQWKQ1scDydfivO7FIPGvktJZestnqJ/FGFPACXjGYGyvIV3hkxhjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx3jrue966p8T5vHPSaJGU3Dcg3Rm445bbTGvk8erMY=;
 b=EcQ6mW1VEK5AZnoTAC63eOhH1NSzgVCXc4DQo2mjsDKKriiVtf2DEqRtqnMl2BHbciTSqa5Dn94VJozKxIJYEMtJb7smxr4hNmqied59bHZBCOAS+y80ZwBZN3FyzjZRIo6QX1wdzdWB7F9kQqkH/yMC7uWW4sWSyp+I7c6mvq/rBU0C+IBGEZZHS7NK0fx+mJo8QLVBJG7tgkhhH/xWrHrxPchKq41rxAuQZwIK/m1MfFxtP583QY5xVQbPhxdDIVVR/Wm/jxOaMQYW/UTLRpZOjYpvbQDgNgdPoDJ05r7lfdlIYR1TBs+MRBfy7e/UuwiwpPUSZ8o8AYo2fM2jJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:40 +0800
Subject: [PATCH 05/15] dt-bindings: rtc: ingenic,rtc: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e13178-1b01-43c8-a4be-08de836ae3fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	DiKc6G16oCWqXePFjDwXo6mIXyjWiNvPh7K2CfAn1cYcDczP3qGoaigICSaH+yZc7zEupUxglauL2YiwNXj6G8upkOCR0kCgpZ34fRTcXfE36ULFVbLcb4xifHDrhoBBh0MZ7MP8kE0i7wShxx9MgooKa6PafRKr0tT3slJOG5ZgOZz8pNHGbg76uDvfQWPSpxqUKVItBpbKN3FA7xuJdrebykmLq26LwU7mi/DtI0FlbDbkXvvdbDiNzdnw5mjx1ZPsnw11LfVavNr1jmycHuHki9R/HJXKTV7+8EtDDSZcRoyzJGeiaDBc5CN4sZI111GmAtIqd7vzGhkAlVeJJhJKPeRSxdfYiqhf34/T8rCoCz3JIr5rs4CwBw+WMTsLoIIoghImmVPl5Jh/Xhy/FIx5OhySKCQmk0hsT++tbbaOuI7CK+yFN0xzwS6FEOrU22CBb2A/T9xLjVhaMVtq6BUpvD2HlC3aKflZsIrJV2/WPXAjWGQ1svtn8GNFDRLSWssfdaQNr7iZX3uqlGzZUXJxatiwDJHS9S1eNfMw2esQUwxltCNx4U7W3a6OmP+8CUxqSqrNFBQEhyz0tB1xBGagTk7NhKidDmzQz9j3jenZo7udLsf8CbYvNqOBA+FhykxxzMnase+SpjoW5TGiQJK60mAk9oyuy++xWqQ2ZIKwLjSgb/JvT56XWWyRQWAXQteyQzwYSID7EWW3iqhnOg3N3g+htS7zCVxmtwKX3G/YtAqT6nWi/76TtFfnWD2UXqWDxjLvpXd3ifeT35CADbboNzwe7VYLxN0CJ/gS91P0+i8C7RVn0I/XWsGzYcUw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1ozV1p3VFpKcDZ4RkxMckZMdzU4MDVVd1JhR3pZcDc5R3ZXUW5oYUJOcmc3?=
 =?utf-8?B?aXNoYzYrYzdEUHpZQ1BOYkJhMjBVMWRxcnV4OWFTRnJOV2tsbmZlbVpGOStF?=
 =?utf-8?B?ZC94bXVNNDlnNGllVUFRTDFCNUJyY0p2UWNrM1VmbDFabWMwa2JRUkFSTnlB?=
 =?utf-8?B?eGE5cU55QlpUb0k2U3dwdGtEYThBQ2lyVWVCVDI5djY5aFIrYlhUaCtWbjBp?=
 =?utf-8?B?VGdPamgwTEZJaU5pZDNhZE14N1RnN3N2R3BhTTdMbjhMS1QrRmh1R09GZW5H?=
 =?utf-8?B?L3M3SnNrWUFCb3VFci91WitNSkIrUGs3ZzEzRmJVWGRBaGNjS3FFWGoyVU14?=
 =?utf-8?B?bUdydTllVXRicXVWWk1oU0JQQkhJRHRleXhsNGFXRklYK2dHUDJMUy85dmpF?=
 =?utf-8?B?Z1RqTDBqTE9hQm1RalUzRmRWa2Y2UmxsUC9VakhNNzEwaXZGT0V5VjJsNVds?=
 =?utf-8?B?WmVob2RpVUM3Nzdybzd6QTRvQnU5RWFmaE8yWGtEdzhoVGhBNHdoWDVLcmti?=
 =?utf-8?B?RUlKcjk2Z05VQnRwV3RTZWpjdzhMeUIwSjFDbFBwQ0Iybmk5b3NFMVYxenNh?=
 =?utf-8?B?NGZuVFAySUQxbklEVUlZbjRoVEd1Q3VJMWUxWTY3U2NNdEtJOWxTai9iL1lW?=
 =?utf-8?B?Z2trdVlrc1BkaW9tYnoxeE9Ua1FRRFdXYkhXTGY3WFoxMGQ5amRSRmlLeGMy?=
 =?utf-8?B?YjFGY0hkTTlZbmxxbjdPeDkvNUMzZWhBVTBUaHFmb09vNnVCTnNwZmRaQkFN?=
 =?utf-8?B?WG4zYkJ2Z0pRMTNjbTROQklWMCt4d0t1K01zbXFiZ0pPbURBRVdxOFJsV2Fn?=
 =?utf-8?B?bnVvbllCNW1LMzkrZ2xUYlhvL05RcGJhS1U3dEFkNFJ0bVJua3UyRkFOb1Ay?=
 =?utf-8?B?ZGRwYVBzek5NV3hYcFUwcW9KT3k1N1lBWUpOOCtmaDRWY3pvdmI5M25KWlRr?=
 =?utf-8?B?RjFHdDZEK2ZPS0lHTWxtekdyS1h1ZVFzbFpXM2xCWDBtTmlqNjB1QzFJOWNq?=
 =?utf-8?B?cE1jc1ZzZzVDT3JJZFMzQy9FVXJHNFRObVplUEhNYzRTcm9qb2xqSnE1TVVI?=
 =?utf-8?B?b0lWMm9DdzNVODRUNjAveDJ0VVZHUGJ5L2sxR1JHSUhPcm1sSGd4V2lUQjht?=
 =?utf-8?B?N2xYSGw5blEycjZScXlPOG5nOG1iRkR4VmtKNGV2M0thMnMvdlNUUjkwWFZX?=
 =?utf-8?B?Q240aUVzM0NBczlEblBOaWhzd0FTbTZ2cWJVSmxpOTByditWVVE5eWNvSUxq?=
 =?utf-8?B?VmREZTllMEhlODhVMC9XeTEzS05IOERmbjBCYUpvMzF5Z3RIKzh1TS9XV0FP?=
 =?utf-8?B?UE5KMTU1NkxoWWJuZXE0dXdjcVBFajQxWVdqczR5SjZCbFF2cDlpWEgwMlQw?=
 =?utf-8?B?bWxycWw2M0lFbVdHYzZuWk0xcy96Z1A3TmptOXVoUGd4OW5jN1hodXRScWF5?=
 =?utf-8?B?dzc2cWxBb0hPRlY3SmJLenM2TmF2OEt0SzQ3N3NxVU9FMXBYUVZXTkcvbjZ2?=
 =?utf-8?B?MFlXRXgwZ1h3NDhaU0NmcFBRdTZiOERPRk9yWm5Uc0hNQnRSc09wZk5aemls?=
 =?utf-8?B?MHVrQUVyekpTQzVCbmtCa0Y3SkpSak9VOHk4Mnh6RVdjSDFibGt0Si9rdm9v?=
 =?utf-8?B?VldSaWVFQ2ZZUTJ0ZmNWcEdhWld6MkpwL1ovY0pHTXRSWVRzb3NVQUtOV0Yx?=
 =?utf-8?B?dXlZMGJmT3VndnlKcFR2Y3dnQ0VzcnlzcTlqMHBXaWR0V3dKWjZPdU9IcTZP?=
 =?utf-8?B?dG5FQW5BK1VtdzJwdWZqSFNyRUFiMUJvbnhSa3laTUxSSTYvZDd0ajZHUWNM?=
 =?utf-8?B?NDRFcjlZVzVDMVV3NGVUTURJdFpreCthM2prMXN2SS9pdXpUSGE5UkI3cmhC?=
 =?utf-8?B?VnNQaWU3MXBFall4aGtUdVZ4alZvTldvZTJDU1pnYW9tODFtaU8vTXNNYm9S?=
 =?utf-8?B?TzQ0dWpCREU4UDRYRFB0QVd0VFJzdGRoWUhTOG1LZXE4eURWakZ4TDZiZ3Bl?=
 =?utf-8?B?VHZadFp2dUdOQ05MREVKSDRlVi94OVYxUGJMcTdieWtWdkFiS0l6Y3RydElh?=
 =?utf-8?B?S2lYd09Oc3hzMEN2SUQ5OW5TSmNpZHJIeGxwL2hESDVyNzlWZ1hnczlybzZM?=
 =?utf-8?B?ZUJxRndxYTFjRFFaUUNXeDF1MTkvLzNYakRMMlo1czkvclVyK2RhM3FxaHpP?=
 =?utf-8?B?NGtxaWRvTDVHbTFWS0VsU3NCZEs1SDV5Y0RvYU93eXYzV0hVRkp4QnhsZXc1?=
 =?utf-8?B?T2VXVU9YQjJEbWF2cmRVdU8vZEtuV2xja3Y3VTZoTFp2SmpYa0Q1OXBkc05Z?=
 =?utf-8?B?Tzl5YzlPZ2VMRTlSRmJPTVRjMlZlOXIvcmp4bUluZlRRU2NYODFtUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e13178-1b01-43c8-a4be-08de836ae3fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:05.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjX9HOO9zF+ABo+Wpdc6YjJcIi3+5O718Gg8DJo4QRlcFrNCG8sVk8yX325cLGNTB06ic0MlhZ8JObMD2wzwcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6210-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: F1A5229BA7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
index de9879bdb3175a7e0f24304b5a084a8faa233c46..415566d8dba564ebad976689596bbcd699ed6021 100644
--- a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: rtc.yaml#
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       not:
         properties:
@@ -53,12 +54,6 @@ properties:
   "#clock-cells":
     const: 0
 
-  system-power-controller:
-    description: |
-      Indicates that the RTC is responsible for powering OFF
-      the system.
-    type: boolean
-
   ingenic,reset-pin-assert-time-ms:
     minimum: 0
     maximum: 125

-- 
2.37.1


