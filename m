Return-Path: <linux-rtc+bounces-6220-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGn4L3oauGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6220-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:58:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0E29BE03
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4AF130A3051
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0092ED866;
	Mon, 16 Mar 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mkMAaR1w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA52EA48F;
	Mon, 16 Mar 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672528; cv=fail; b=LUWXd3yBXZ+kqNdADxyHF3jsxg2pTdNd6Po0UZn/LY2w3OB8EaUSskOVepVtmte2NgdqqC17a9udc2uFQHODd4k6fIWB3tXMmhCFV/JGPB7d57ds+JDlbhfiLHG+t6BQFpKu3QM0ll7pjzq3p53APSa/1quZLynWwJzzg/JA2Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672528; c=relaxed/simple;
	bh=QB3d3kJsAzWLBVVl756lfgrdoKvk9qiBBeJcBQXRLXs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZVs883kzsEhy9Ca24DBbnyuPzq/YksYWaYjO/NsoKQimT8XOzMBwhJueb31gF2X3osslmNJhMbVJzbnbkYRE2v1lI6aNnO+wAVMLMfxvWlYasVr7LR9gNPnuE9LIg8qRc4kOT+euT9/J7pWWdlprPxUOvZkiuipBQPA5XI97Hac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mkMAaR1w; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0Ih4om/VA+z2/ZuBJPcTdu+1HzKFT96kxhMIoOpvMWY4km8/CHd2u6QV1GFXySlfI/qC0LxgF6ey4BB5C6GnSt2j+8EmAQ9ohdcZS30XrRW2GCBOGwOhDmih3bTfXSg/pKPYX4bbSH1w+v1wQtQjohB7k/TOpvRrLKiDf2jZGhr7vMXFdIGEe0JzMC3IaJRiv4bhrR1aetYGZo5/KJRjOgnSPHDx0lA5ud2EGyPQM1pMp04J4SvX/m6Kocx3folHMn2vpe+L8fP+9+DC+ZZuKKZ35U5reAcRt30TsIR0PT+rmCL5bL0073z/svM8cuuebuIQPLhrH0Awr7RCkVMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG+RVGn27WpT50XWvB3WaDFqlEe0yGldxQ9LMYLMjcc=;
 b=vCoz4U0qIjTLZTyXkXs2phgPcFqxCia4OxA/tppN+AACridmG/OvMQUJzQkPmDJ7Y6pucBYzF+KJnwpKsIGgNOwiSp7/qlm6I5LCS1qeW5KQMv/1D95JLp3YclGEca/GtXHqhMOoj9e8LcSWban3W4q31vuuOolkdzNWFBRxiK01gBTZ4K7UZjlpz7dXbN95qTSpyvDo9kNs/7NdtkVYHdmjNJ1Tfmo6Yv4NOr6tq84msertjwKBDOeR5MT5ChFGC1Oi7ms2qLq51R04W2AB/iFhpzXJxuaUCFsk7DXaDAwSG8qfWeIOOU2DxIE0gc6xsfib89WFhLf4itIOKlsOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG+RVGn27WpT50XWvB3WaDFqlEe0yGldxQ9LMYLMjcc=;
 b=mkMAaR1wKPqIaSItT8vjXul59PxN+arI2KC959BasDq8Ni4QwH8ROyAO0ixxm6oEiBq2Q5ZS2CbGmjzWZlukexo1sEFL+zgY7ORfylpKPR81jjtaBoPCM4erb3tKwJPkxiCncHHxPTDat4ptmPS2ZESyIOcCBZsTM94W2BJ2VVT++7Zz/yK/lTBtZLfapKA8ACwxhCasoMPU8BnrZ7v7Du7OByCCdXTqf9SRS7QUAPGtV1p2i99feCLD90oUTBLNiBQ3AI6sp45FcZ2bFqARw1VMnDniOQiSUvZo4rb8JGCYKMEMLi97lYQpKcXRUJ7qbKM2+QO0nHmkzps+rsQHug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:48:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:48:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:50 +0800
Subject: [PATCH 15/15] dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-15-92c80e5e1744@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c87971-9a54-4004-0656-08de836b1e90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HPZgjL/SlQCIa2afi4/PbD/nh2c23LIZK9ylh7Re7W3B1+dhjmpdcnHHtvyrcy3Af9oqHh6SzJy1S9+YxP2HGApj8oPUcehzkDsQl00P82wX9R0MsFgfUT0L6sFG/WQWchUOmvjUaqiieLLEsPG6MiX6FdNx2y7f7iwX+onN6tdYDsw5FG4Ac2tcusrGIHFYcU0zt3a4/q+cWYhx8Tj2d/IWR/5VgPaLvRUM9GQMiVfFoqG2dfe+qR+UwJn33Gq+IdOEM4dCo11uPTpQKFmHKdctx1iixu7ezJNjPY4oUcMKHmRWfxtubgEzdMb9CjS5O3XuiSy1Ccog0+2yg6spwh/HtIs2QIkG0oKdZXadyo1tJIRQxeVBBFjNK5h671ANZxEdIgUtpB99GMcALVVGha3QlSKtGAMdthDe4ngLDnNbJ+7JHP3lXoJcLrjHr+8yXZoTh7AZv7hWj43Gm0XOrQsJP7PmMoibnVOWDQZWJZywmU5gWumLgisfldOtlr3M8hHvWdnUSuaGUkgzTFP3YVb500mlwuJU+ihdshr3ux8upAZgEHeEJ6J2EnktvByOgcEgHkz09mRCCZu1dyO74nZFQsEQ2WRcFJXjRryhq8WSpdy/bGgELlphiljRzKXuhSDIiIVXBrKZQ52oLGb8plZ3DrzPlk888E/4P/L1PiAMwmSGkZj6Cieq8rGMLTNroBeM5SOzofbTCRb//H4OD4/DeTBjPUX/p4UY5LXuRoqxN+YCJ23zjtfI7gzpeAkCzvRA4zBqIAG6Q4Cy262PCyEaPmiJLakONJPUPZE/FseAF2D0OVY475qIhPSuSF+e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFV0dGdCMVF6YjhicjFpTDdoYlZvcHRqZUZ0VGVNMk9EM1RDb245N1RPTkEw?=
 =?utf-8?B?QUREeDVwblhJOEtZVktqZ2c3SjVaZHNpdTRhcmlmRHdoSktpMXE5WUpsTndG?=
 =?utf-8?B?cDdwQklXNUVEZTk3SVdtV2VrMy9qRGZiK3JyZFcySDNJQS9lVGdsRzkwcE50?=
 =?utf-8?B?UXQ0ZUgvYjNURmZ4SmtZZjZCRmZNelk3eXFVNURSbnp5eG1xR2RkTHZxYkVk?=
 =?utf-8?B?QUlXT296b2hMcGh2ZWdjT002V3dxVnRUUHdaaHFMdDhYQ1RYSWRpS2E4SGVV?=
 =?utf-8?B?V2dSRkNMT2hGankraC9aU3lrdklKNmFjZEExMi9zMjN5ek5QQ1hZQzBZLzBV?=
 =?utf-8?B?Tit0RlMxYjBjTmdFZExuRGNYcXZuVE8vdSszVFFiaGRqa2JIMXVXb0c0MDBr?=
 =?utf-8?B?SEtyUGxQalFLQnFUY1F5WjFDZ2JnM3FsbHY4K1pqclIycVV3by9RK0FBNmVS?=
 =?utf-8?B?eWJUMDY5UXozNEpvSXFjcWxKYmhacHFMalRLOFBwK3ZNTUFBSDBPWjA4U3dN?=
 =?utf-8?B?VFZTd0FhaXRuUitCVSthT1R0NXFXcTZXcUcxWjZtc1REaWN3bnVmbDRWb2Vy?=
 =?utf-8?B?cy9OSS8yMklCUHl1c0tEL21oTHRKOTJHOUxjaC85MWw4SGNTdkg2bG1hS2N3?=
 =?utf-8?B?NmhmTnN2RVRvRTZOYis4YUxxUWh3NkZDVU9HakE3Q2tXcUVEOE14TVBuNDZU?=
 =?utf-8?B?UjNQb0t1TW1HSVlYOUYzVXc0TXVxZ2hDU0ltRWtJM1hJN0ZxSU9vamtkVzhp?=
 =?utf-8?B?YlR3dUFnNzFma2tPSmlpL3lENkNHSjJIKzlmeW56MXVaTU5KempyL09CditE?=
 =?utf-8?B?N21BVnp5dzdWRSs0bEhJeU1CVVI4RCszRUpBWk1nTytmUGpYMk5RMXdOZFJG?=
 =?utf-8?B?QnZTUmpWa25vczBKbGJTV29XNm9YTHpSYlJtWlJpQmw3WHc0aVBoNlBsUUNV?=
 =?utf-8?B?cWo4aE44QnFoeHZSaG04dmFDVEpEUVVHTFNRODQ1dGJXaU5kWHhyZXAvVk1w?=
 =?utf-8?B?VFVWKzVRaFhGMmwvZXN4eDR4RVB0QVYra21MZ1N5Zlp1aFZpYmN5ekRScE1I?=
 =?utf-8?B?QlBJTUY4VlZzQ3U1UHIwOW1jazF6RU1ZaUs0OWhmK2tITWdqN2lHV1Q5R3JF?=
 =?utf-8?B?VjBuQkFBWEIzaXFlSTlNT3BnaTJNL0dCQW1NenUzZ2tldURLTTNxK0hEakN4?=
 =?utf-8?B?UTNTdDg4di9uYndFaGNhOFhXMjd0ekk2aWpNUVY5d3ZHOWFSUWVqdk9POXpa?=
 =?utf-8?B?UGp4RkUxSnFsZUdHSXptc0tIRlhhTUc5LzUxTitoZW9nRTBVdjdRRTRCWWVM?=
 =?utf-8?B?SzViUkZROWlpenNmbGxMRWVkU0ltUnVBWVJIV0V4K3JIamx4ejRPWVplMWRw?=
 =?utf-8?B?Zjk2UnBieGp4YUxJQ1p5VVhsNTdSVXAzQmh3eHQ0UVFkcE91Nk9lOThLeXBn?=
 =?utf-8?B?eG9KNjJjREFFT2xCUitvWUEvd3NGcVV2cGVCQmNhRDNiUTZ3MFRuWGhrS3h0?=
 =?utf-8?B?ek1EdHM4V3JhK0tYcmNSSVc3dGlydEVCOFZlSFFvcUt6UnFnWVNJOG1KdEM2?=
 =?utf-8?B?c0xTNDVaUVFVVDNnSGw1SElBeWE5WXppaFI1QUU1Z3g2eGJVN0h5a1NRNGg5?=
 =?utf-8?B?UkpNNEo5QzhTeCsvT041aEtIRUpCeHR1N3VldW11aVNubzlkbDBQNm5oL05k?=
 =?utf-8?B?OEJZQ3NKSnp2Y2Q4dkU0U3h3RU1YMHpLbDlLVjdTWWlJM0l3L3BFNWR2a2ZV?=
 =?utf-8?B?L1VzajRPbkVEUk9LanU2MHQzMmlnN2c4NWxuUUVnTXpUMFFxYm1DMmYzY3dq?=
 =?utf-8?B?UzdTRWJPVlJnWDhCRjVVTmpBT2J6RFBtWWhVVmhsRy9kMjQ0d1doTi9pS0NZ?=
 =?utf-8?B?Wnd2bC9vUDFzeXU5Z0c5dWY4NFp4Q3pyQUVRT3dES1ZpSUJWVThTTkNOeW9k?=
 =?utf-8?B?UU9XMGRTek8yVXFhWmFyaVFWTU0yamxkYXB4Uy84ekpmYlVwVWtWWUhvckRP?=
 =?utf-8?B?WXNBdlp1Q3pNeGtJdUI3cUl0UWhlTnp2NE1tbU8xLzZYRlB2SHBTWUJtS2RJ?=
 =?utf-8?B?NHRDWGlwKy95Vk5QUmFFaGlCdlJKU1pBTGNDU24yQmxBMkpvWHpjVkJvY29n?=
 =?utf-8?B?OXV5bnp5OGJIWDIxR2VWWGJpaTJRaG4zVnBzdmtRa1pqZTVtS2RoQTF0UDBI?=
 =?utf-8?B?Q1ZrdHI1TFVVMGZQSEUyNW5SK1dnTEtIN25zeUEzL1BZNEs0MnNkZXlxRm5w?=
 =?utf-8?B?WHFSTWV2N1pkV0NnYTJjbDRPOUVBWFpoaUJqT2pqZW1wb24ydjNJdzZLSUxK?=
 =?utf-8?B?cjI5TEV0YlVWU2NiTlpZcnJqcWZnMWNmM2JBb1MwSmRCVTFiZlZFdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c87971-9a54-4004-0656-08de836b1e90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:48:43.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ELo0JhKrmoqWWloHHgl5LWi/toaLRUXHRuIip83R+n/v3rLOGIFLtRSd0WgA7dMmDPfP2+DYvmpCQqHrZD3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6220-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 2AA0E29BE03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
index 0ea1a440b983a47a55fc86d6251b89056ba51172..47418077b153d932e46a26b14024698ee6c50011 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -18,6 +18,9 @@ description: |
   GPIO interfaces and is typically complemented by S2MPG10 PMIC in a main/sub
   configuration as the main PMIC.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: samsung,s2mpg10-pmic
@@ -36,8 +39,6 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
-  system-power-controller: true
-
   wakeup-source: true
 
 patternProperties:
@@ -71,7 +72,7 @@ required:
   - interrupts
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


