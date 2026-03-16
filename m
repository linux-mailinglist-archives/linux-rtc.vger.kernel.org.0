Return-Path: <linux-rtc+bounces-6218-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLBzNMYYuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6218-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CB529BB50
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D00B63039368
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7E2F1FEF;
	Mon, 16 Mar 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QcITW519"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C682EDD6B;
	Mon, 16 Mar 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672509; cv=fail; b=Yf06TVrtvPLl9Okd90ozxGZzewKekkwyLsaw4AL3YgBp+kZ8V+/K+6uSkN2D0M1akb0Qy6KvaPOILv1danxDeRNtZod6oTFsJig1TTwgg9eSuwx3kF2K+A13ZB73DpyQkDI/nOBHHoIeXMJVfTtEwtPggf+sfu5DV73HcgvFpXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672509; c=relaxed/simple;
	bh=QBaUApES8tQou+nlrFxzruVYQDObufU5Q12L4DSMZX8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=I6H4bj2rM36FkSrfO5RvKD9JmIHxXtqZrfPGPmcuj9ZcJGI+ihIEKGcEjMZ0ePN42Z37RI7c/Goox0dOy9McsBSP3HUEQ8gtVgTGEX1aK+hC4gSM/NO5zSt5PQzONH3aWY3l7h+IE42cxJtoxSY/CL8wUE+I0bVf95W9LMJ8l44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QcITW519; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjHp8co7NZiLJan7WYLjnOcQSW5MgUCxMYyJV6TEsQ23yW6AV2nsNVNg+q4h5tnR9ppBetj/fVP+3crJSKjXs2+t4bloiaqRrznJHwNc+SQirL1dJJXdrPGWJmqtn+RGuzyD9V03kPO5LqTrBba0VDv3uOYHqIzU/f7v6UWSixgNVNmjvX+5uXLWghuUoDHJCcMKWMef3x5Uulopf0XtCWw1C09Q4byqZ1jPHuCPZwpks2efroW3sBy+eM/UhrmMRSaxR/ltJelYt/tlAN8ZkWq5T8GCSoO0XaXYgOog8tAxj3t462wWQMwYGH8SGbdgk1vbsSX5hxdhaFkZRYKT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWGV9u4WTqtSOoJec9lnEUb5iFnWkjg8ekAqSrCKhww=;
 b=xPsR9aI9yZCUoJq/hUjaXm3+SGLyiDNSDBfK7Ahytz2EK+d0v6OwN9qwxgtX6gJPG40HxgY1HE62ez5tME57ExRFG/I70haPbmqSrh5m9/OABEpV3nqiE2bkrkokF2fgb9BRVdt6yoxZ1uX+dsz74SRxQWdM5mqJLiIGAYNPtcuRNkw2aNHvIdMo5M5i3nn/Ckvlw/IlYYehftDUKcjeAipeJrKFvkuHEF9hSq0DcJEUAgoX6ydN4AwNm/RsATANMO4ZH89CbxmAQRtgnu/rH3Lv9++Sv4y+d0dMW0eqaV6ZlBJxg96djUmRWIL9AzpbWaFZwWVtqqyNzmCmS895Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWGV9u4WTqtSOoJec9lnEUb5iFnWkjg8ekAqSrCKhww=;
 b=QcITW519Re40gLbBNQdEUQIydm+r4Pi3ajLjDgLZGFALf3lZ0tR1n0xGwRT9zYSkbZ2hU8Gp+ZzRP/dGW20sBU7UofeqCn5967z/75UK785x/XUAhvPCD/4kN3vle9vc87fTKiubEfWNVP9KEv7GsBkS/Qd55ahtp4mpXWtmWZCHLc6QoRmmRp6OOkVC0YsAp1zG2RHkH44JjqDZ0TuxqvYSissSwDR5UvUpQmAZmh0w4RsgLEe15je5n+InzSmGUX8wMPheLsNrK7tmCTHIsvy1JpJtzCPmwLWYFxbA/SqVz3Vw59sab0J6oTFRRFC/9p5FJc3L9hlCc3RL4wHI2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:48:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:48:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:48 +0800
Subject: [PATCH 13/15] dt-bindings: mfd: rohm,bd71828-pmic: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-13-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: db85ac70-973d-4410-1815-08de836b12f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	bcpQWyF0aGgKZ7JhlC4orM/3j7CvPFkQZdkZbnw0gtjkyou6gOdZ7WCHlcFV1QN0JUplHYH5gqIgY5fMfs1luxIUtJILJo/BTPGoliFSXEC3q1fj2GCtmJwCfdND2pk2E03CbXRgPI5404CcMSZIV5nYW6k4+agqk2ptrdPb3jWm3jxiN6zsJkVSohleoT6RmFmfKLmsWpkuxnBW9Fuy8NlxNaglHX1NLiKbWZ0OV74Swg15+IdtqwuKvZ/i/G6M5DQU2Cu+FPVo4iEFNlrwjUCnBM+GEwkCz6jWp2uMVwyTyCj99Ix3UaYW5DooEhdGIUkpkP04YcRyzMJI91makG3mQs8e/lciGiuSboQrdjHQrNuiVhIe7uvu3IUHCuGidotqwIzUQ4zjymkAIzNpvIqwgT0iY0Ck2fzEgqJTQvhGDTnWvNRZe660jcwM3T0qSdPxv5fA9DhXAAGhiC2ije3EV5xlPQi0H0k6NHerse4z6oWigAY5dho28vZcMtQ9UZGE6dCmQbZnvEsStFT3UDXMyGIKK20MszS5A7hy0Xm1ekDR/X24B/GmppVSQiHgvUQOeyYF5X1tXQFwxGY/Iae+U5EuBVOd1g5DgEs95jVniCgaVQFz4Q0WoMCz7UbuUKXGpThyhFTqnRTy39f+325qiIOC1fXgsQ9PQTRNnUZrM0PlIO9dIKz9gdpbPsbL3zAkcpvM++glQJhsXkcgMaVmcoEuAPvenL891Uud5uMa4bHYI5DXhoekAWyF0lYSRfTG89l4kGGsUImzbk6iAvOxU7j1YhuZ4tZFYz2plDMjM6lVVxYyYrWDdc2swvrO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdtaVorM2FHL0JxdWN1MVBDSlJZV2trRFVmVTk5Rk1TQ2NyWlBCT0oyc011?=
 =?utf-8?B?aXZNME9iM1Z1RDZmOGNnV0lKZm1QbjBSSzFlVGt3NXc3azhzREJTaDQ0dkVi?=
 =?utf-8?B?S3pTTkVvSm9VYlRQZ3FGMjZxWlFFcWxWbWFROWVCQXNTeTBlVjFPREU5QkJh?=
 =?utf-8?B?ZGFUN2I2RWRWRjhjTHh2ZUw4Q00xazJoV3RLa2V6Rmo0U2hVVHQyNXN3RnFX?=
 =?utf-8?B?eGdYcXJYTFZmcVNnOVBVdXcrT1ZzenF5UDFUV2tCWTZLQytGdjVBUUxIc2l4?=
 =?utf-8?B?Znc0TUpVUmEzbm9rdDlwR3lPZkZPcG5URkVZbHkxTFdVUWFmRHlBaHZ1R1V0?=
 =?utf-8?B?QnhKRFhVZVFtTTQvdWdMQ0VmSHBtQXEvY1pQNDd3ckQzUXRQN0d5ZFdnSm4v?=
 =?utf-8?B?UFJRZ1pqaVA5UWdYOFFXY2txZHprVXgvWUNqUkhnbTZQcEEraXpwYm52QjM4?=
 =?utf-8?B?akNWSHZmNFJzcldoZjZzWTdvd2NwZk5iRjQvYjFhbHB1THZ2MjhTSnVlcGJo?=
 =?utf-8?B?SEREa0RBY21QU3dPUVBOTlVYSmJWRlJPejcyMzlydmhpRWp3NUg4T3QyYlNG?=
 =?utf-8?B?VkYzMUpyaXVhWHBKUWc4L0Q3WFFhZElyR3pub2U3YnhlczRDUjZZbHR0ekxN?=
 =?utf-8?B?ZmZIWDRUT2FmQ2t2ckhRaEpRYUppTTN0aWpRMjhqczZhNk04NWZIYTc1b2RU?=
 =?utf-8?B?RmpmVWphbUlSWko2ZjY4aFpRR3IzNW03V2I1a3VQRXNxQUFMVVQxeHRweVll?=
 =?utf-8?B?V0EyWFNnNHkrK0JSNVJVTmlsaDZ2SG5ndEZ4bUtNd1pETENkeUExMW9LRFhO?=
 =?utf-8?B?Rk0vSEZQVk9tOXp6MWhXMThvbnZrZURlNEl1eWVPczZNenJpTlZCTVpod1N1?=
 =?utf-8?B?L29WcUpxQzFzSnQyeEpUelFvSHcxdTBZY0FzMEJZZE95cFZiVmRTOUFmYjdq?=
 =?utf-8?B?c09jNGtLYklTMnM5cFpPWHlWZ2VwWG1tRGpmSGIxS2VPVmpsNHl6SnhjdjZn?=
 =?utf-8?B?dmZyQkxod1pGc3J4Z2kxVFRuT2dMMnpGajE0bEJhNXJYVjJnb3ZBN2RvTDFj?=
 =?utf-8?B?RFovM1ErakN6aTBTMjNmNENiYkJTQmNNVVdDWjBld2RvUXR1UUxnVmorTXJP?=
 =?utf-8?B?d0YrZHFRcDJXZnZPWFpXTDVXOHhzUDJxTnBpelpjVWVPT1pvcnZQZW4wR004?=
 =?utf-8?B?elVtY01tUC9qOFBYbjdTNGpleWJxRTF3bDhKRXhXKzRnM2J5aXhLcnc1cFE3?=
 =?utf-8?B?ZXp3REhXSjVzVWFaYjF2cVpBVWRxQVlZZG82VEFNeUJBRXJQVGsrTzhoUk10?=
 =?utf-8?B?SW1mbzhia3RneEZtUStPVy9IUUppaTZhMXBnUng5WkFzckU5TnExcXhJYjA1?=
 =?utf-8?B?SUhWNUU5aW9nU3l4QjRnU05wbGNIRkk2UWx2b0FJeGQ0WC9jQm52YzQzUGpp?=
 =?utf-8?B?YlZ6T3lDU2FxZ0xuMlZyckl3eTk3QWdsRWt4dGRFanVna3pzYit5TStKYUxW?=
 =?utf-8?B?Vmx0QU05c2IvajlKT3JNRXNpQW1vdzFxZ2lWc1JZdy8xZ1dVUTBneWJkMmky?=
 =?utf-8?B?T3ZubWgyR3FmVVNHRmRNb0d0OHRPOWRBNFFiQ0owVVV0WlR2WHRRRjF0WGJu?=
 =?utf-8?B?QWJsNUlsWlBDZTlPa3VTUlNUU2ozNmRhM3FaWWtaTGFCQzBjS21QOURTbVc3?=
 =?utf-8?B?Z3J1Tm9MQnlRMTdUdnFpMHFkcE9rYnMrRnA2TjkwWG1Odm11UWtEdzkzSWRo?=
 =?utf-8?B?NFFZT29iV1pnQk5jTGxxb0ZnUnBnNDEzbENBTDArUFNYV2Z2bWt0OTg0RnJE?=
 =?utf-8?B?ZkxWNUpCTlIrelJsRE5WWXZlRlFVRWJkN2lpMGQ0S3BreDljaUcyZjNNbFRH?=
 =?utf-8?B?VVh1N1J1UGd5S1Q3N2VyR1NVTzQyKy9vMXRoVm4xSXp4TEdSN2dBdVFITHg5?=
 =?utf-8?B?aUVRNk9vekhuT1VadEdLK0JuV2lwWDNTL3F4Mmo5YklOakhJd3BPSkh6TXQ1?=
 =?utf-8?B?WHV2SCtvYks1SFJqa2dWZkhBNEJxWjFBbnJpS1VwaisrZjZBNDlYNnpjdUwz?=
 =?utf-8?B?c3hrbS9FVUY5K1BSbFdTTWtRZ3Z4MlpSenJFNHI5bkhUeExaelppUkllM0pB?=
 =?utf-8?B?Q1FxMVArMys1eHIwMC9nYmNWaHhGVVNsRTdMRWtaalJIOWFMRUdUMWZpdWl2?=
 =?utf-8?B?MkZ5T1hMeVFjZjB3dTYrZ21hTkk2WkNYNStqTFEvV01FRnNnLytVbHNncGRH?=
 =?utf-8?B?UWNSUEsyZ1J3eU04RDZ5c3BOdTNmM2NKVVFDZ1RzMklyNVpLL2tQc0RTcktm?=
 =?utf-8?B?WkFibW1uRS9xWHJMT0hRUnZ1M0l1MGZQbDNvRWhmNmJCWlF2QXk4dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db85ac70-973d-4410-1815-08de836b12f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:48:23.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt3efNzMm5/HMn7ORki64sulmTbtY/DcZLB4MYI3tO/xafQbTlWQlcH42nA90d/p6qZIDhuwus7yPqB/gNGiuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6218-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 74CB529BB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 09e7d68e92bf3d91bbbdf2e1b6a942e87b5fe7a1..9818102e02c75a46f7c56de8776ecb9b91a77cdf 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -15,6 +15,9 @@ description: |
   single-cell linear charger. Also included is a Coulomb counter, a real-time
   clock (RTC), and a 32.768 kHz clock gate.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -79,8 +82,6 @@ properties:
       used to mark the pins which should not be configured for GPIO. Please see
       the ../gpio/gpio.txt for more information.
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg
@@ -91,7 +92,7 @@ required:
   - gpio-controller
   - "#gpio-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


