Return-Path: <linux-rtc+bounces-6206-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KAyJU8ZuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6206-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:53:03 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC529BBEF
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AE2730DDFAE
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081E2EA16A;
	Mon, 16 Mar 2026 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sSvmY0R3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DF2E9733;
	Mon, 16 Mar 2026 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672390; cv=fail; b=DPlaoT0ZCh6z02/s0+t+9mucVdUJxHrNb7Pk5/qmAaLpSlfcT+4X/aLps1h78kEUgVWeMDXJhg8XUyjxFu2Q8Nz3bk1D311oqa1PcHFCA/xdvUXG2wb3pUhD6aQLOVutk71F4IoFpCm/Wh8QRTNIyVGPBWL0d4KinSJyMRrzXis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672390; c=relaxed/simple;
	bh=ptUkBjAu4sHQWrJoLfDM6qIpuLA0/iMFBzvd5xpAY/c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=onvO0X3OoapqHHN2LRtA5Vrmq93iLcS1OrCQHna6zDhJ3fKLPmUhpnZ0/JvzrrPsYudjEPUf1CWbqUT111XAU6kZDGDbLVJ+dIcw09V3AuRWedSGxUFafNCaoX7H2e6afAjuJNJa5eOAwtu3waJB0iApQv7pyhJpNyou1LVJy7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sSvmY0R3; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh6s+7mpcxn/DP4tU3Hrj0QP+Rw+aB9joyCH4zdsBJo2cpEKHtCoK7LDDhwxR43FV6ddOrxFrseSPRhB0Y1mD9Ck7EyvW/yauc9hDDqqt6qeycYK/bvoKSlQcXfiTS8J0pMZFOHGWVmh9/SnsMncqfVK1wQhomBxPGDll29L+NZXuPOmRhRxQIRji0CDP7Dg8xggCZjgOaKuSh1tQYaG94c+8Kj2F10qb6y8un3LveFINI1uGSrIrz0O+sNhKFasuqJGQikgtFSrIOA+fCj06Aae/Zf92Mx5SozewFgi860iPN87rjpOe9trk5VttW1leKGqR64AoESuRC43gyoNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBE2Z/5s4aVLYCWMBpblSYI3nY8FhnFEtJFeSHQHm6s=;
 b=sk4wHsgD7yv80GxKfLy+5DOI4MoQ+CEtHbPCiLMiPg5oXE93XOGTsTbl912t3dLFbAtLTtxWvAyYXs7Vbperkzi6xI6BVpwUhrSnIuh6SouIuMR3cMxLFWbGp5tPd6rUncEC5GuS/uy+xVNP+ePUY3ue52K3MRh+w6fqJrTpiUDA3oTy8yktZGGpYn8oRDP+TW++FE1ymNVWEfWit0YuLKl9NpgKnOe1xuN4Z85zngcPby4hqiLd3+LXDFaeC7vwkL972qNKWkOAAh0AmWf2LrKfaTd1ehNLVbSNPPn4ElM0QHiBAwRyQ6LMlOhdckUX+4qmDfoJjGZbxwysIdjQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBE2Z/5s4aVLYCWMBpblSYI3nY8FhnFEtJFeSHQHm6s=;
 b=sSvmY0R3GIaVuYDKCJ/nZyzwNd8Ua84RooP8NXV8Zl/v/UlvFBqwtnk2elY8cjct5lABo5tiQp49ll8zJggG0wR47mS1knamly2Qx67GYOV6lNs3oh0ui75eGX2V4Gsl7yrmHKHk4XxuZkhip43pCSAziEkWnt0xSBKmBzRY7DG2w7/pn/V+KxbAgFShUmABBhksxLrOhsuTUDVqYyiD2USMaxKifZXeEvVExStogVFFd9uQKCpXVo4YY97j+Kzfdoy3cCv7KydnThh9HI5hUTOO43jAJi6QEz5kU0nVncJsyAbs+78wiJeDL5dlUYV4NxcYeKfDREXTu0f+AqcDEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:46:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:36 +0800
Subject: [PATCH 01/15] dt-bindings: power: power-controller: Convert to
 yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2a005ef9-c71f-45ae-8196-08de836accc2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	GfzQ50u43LEOR1AYqb0QCYenkHNJgtgK2DJsvMbLX7IxX9HaWFO4mXVeNJFknIgp5Lg9H4JCHF3Fvrq7fzAr8UbLHUsMMsR71j6WspfX/Zu4/GXGNzuRalZrBIkzzynz3kkR3kpGqvDI2k+aFd+3zX9nDkMm9HvDdvRkfE7mMHxjMFhtfQUUVD/0hTxAMmkW9ooKSECJi1z8bqRVfPgvz6H6U4NImD1BCsI/r5eaX1IztLGIZ1jf+ycF5/yg4sFwTKdSKOvfXMIBPsyMFgDeWIVQd7rsNwHjrouM19dOj9G8OEytS18SHHiq2ygXZEtJrJ/2fAR3Kv0G82BZoC9M44j/G6ROHnYuI+sOexgccB62/BF3Eq8Rkdz7Gy5lAxCUrvKjZR+mlAGQql3OQZtzvffJNqt6etiE6qjH4o/6q3LkFkW1TKpuKBYmKPaTkYzVCwFP8I/dKLbiWJ9N2wMVLodiCl5BBZ+b06cCJozm52J/DHUUMNMfD9ulbxcCfXpy6B/fcsLHi+rtJQfujgRlKeOVa1in2ts3Ll1J3sgJckKn4VAWU9esKCpUMoEoOBfW8ptc6Vg1KtyZfzkJ5B7B2uNby3cUGAj0giC3ORcdnfEv4qjoMFfqs+NNXP0JezB0gyKL5oehKM+lePDb8OL88IZjzdmukBeoqGnz4fe6Kim0Gg3//XOeqKC0inXNSHk4XX5MeTbZNbHU976wUgSmRv1fPDxJpnDz6G4ASzQiRdjpmSaEiipoahWnTsb3awKgwiwQRm0jhh+ThWP5UjXkDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW16Y3hPMG9rZy9kc3hMUEQ5bFVnNXdSdUlWc3BYZSs4WjlVZ3F0K2VOdzdS?=
 =?utf-8?B?V0pyS1k5UDRCSVpnaHh0YWNXdHZERWdhUUVYNFh3cng5bGI1OGF1SXFrMlha?=
 =?utf-8?B?K0RSdnJCTlB3MWRQK1VrZ2tOSnJhT0hwUzB2a2RkVlBlK3pPWktmVitEWFdO?=
 =?utf-8?B?TlJmUERiMjBYMHIxQk52OStEOXZ0VlBZamp3YWpOeUYwQ0I4Wms0a1Q2VHph?=
 =?utf-8?B?VnkvK3lUdGUvaG5jd2VtTlFIWkZxeWQycjZtdWRrVmY3Rkhvc1haOGxXN1ow?=
 =?utf-8?B?VkVOaTc1NU50QjJDS3M4Nzk1aXpFZmhNNm51ZjhxTTIybGZvRG9kWUZXem00?=
 =?utf-8?B?Mm0rVnNBR0tXS2pjVEFZTWd1TTQ4Q1Y3MkFNOU1uRnpSK2dOdFNqRXZPamxR?=
 =?utf-8?B?RWluMXF0dzl0S3BhOEE4c3QvSThSUmZNeE5jRWZFRGxDN0ZlUXhabmFVQVlk?=
 =?utf-8?B?cDgxU3dReDZySXQ0b0VjNG5mejFON0NEck1kVm04Qis0MGg1RXR6eWxSZzg0?=
 =?utf-8?B?enpNVlZ3UlJHRWIwRWV1WS9RbDZyNEttbm9NeUJ6bWxFc3F6RC90RWlNSFQr?=
 =?utf-8?B?dkpYZ3U0bU5GRzRYUXN3cCt6YUkrQmhVMmZSc1owbmpZeC9SbXdCSHFCakhH?=
 =?utf-8?B?Zlo3cmJHZloxTmcvM010dXgvTHNVZFJvdW9CNFlNRTM3SlZsa2Fkd0lyRzhQ?=
 =?utf-8?B?dGljTHYzaDk1U1lCWjREcDRwQXgxNmpoSWdWZ3g4NzR2TXFxT1NqQnhKVVFO?=
 =?utf-8?B?T3IvR05VMnJDSE1PT0xTRkF1VVNsT0l2QUF4amZlOTR0Tjg3SU9OSnlPbXYx?=
 =?utf-8?B?SVd5OGpKWmVpaEgwczdOZE1wZnU0a0ZMVERvbCt2R0RCdjhSdU0xbUdMeWRW?=
 =?utf-8?B?ZUg2bUhNSkV5YTdyYTJVdkN3eUR3TVZMR2Jud0NzUFUyNUhJVDhFNDlucWNB?=
 =?utf-8?B?SjRkTGwzOFlIMEp1czVvdnJKTCthdnpVUDJjK2dpanlDZTBKc0o1czg5SkZ3?=
 =?utf-8?B?NzFEZG5HVGt5WWdGMFh1SlZYOXY3WVFYb29GV280ZVpobUo3a0RxNTNnZURT?=
 =?utf-8?B?TktpQnVEWVNGOTVwU2JzU0F6elYxbzZ6cGc3S3J2bEhTbWlaeFZFYXVEbGhS?=
 =?utf-8?B?NjY2TGxERjMyYVVzNW9PQW1lalZPclk4RjJvWlZrMXBZWElwZFZlT0U4dDZX?=
 =?utf-8?B?ai9WdWdEMDhEZkwxNWExaTR5WUUzRjNyOGxuczloZWNjZUhNNldlOVN0Rnlk?=
 =?utf-8?B?NGxzWGpJR3F5WERBT2svRS91SVZXeFZDV1l0aEtCRWo2WURoMG9OZVpBcUY4?=
 =?utf-8?B?aTE4aHRKaG5QTVQ5eDdxNC9tazUwaGdJV1ZKVUdwZ2w4ZUx5T1gwV3N1NTdE?=
 =?utf-8?B?c1dJS3FsRk9oS05kazN4UDRjUDYvR29rVHE1OUhOWXFjWGljWFpQaGJxdkZm?=
 =?utf-8?B?Z1A3aDlrQ1hkcDBsVnZ1Tnl3clo4K2JkcmtHeDdsWDUyNmNzR2N6SU5CZG5Z?=
 =?utf-8?B?OEk0K1NWRGNHZ3RFUCtoamNyZVk0ZW1Fb0ZRS20xdThFZEdOZU9YMmhHZWo5?=
 =?utf-8?B?eUw1REdTWXo5Wis2eitjakV3SUhybXlLK0hYR2NZN0lkYkduUnVqT003a0dM?=
 =?utf-8?B?N2NGdEh6Q3JBU29MK1VidHh3TDZ5dnNXenB2bEp3NG8yN0ovWUtuekhzYnY4?=
 =?utf-8?B?ZEd5SzhGcUJjZXdlQlRKZC9nYllwRVhYcTBkUDlyeGMwbWVoZkpzZ2NoUG40?=
 =?utf-8?B?VkxFY0MybERoRFRaV3FOU1ExZWxvRnhycDVsWTk5U1N5OTJoeTdxdUNveVZV?=
 =?utf-8?B?R1VvTlZJZlE4eWNpdkNmVEdRMHVWY3RQVStsNUlzV0x0QXpSWm8zZVFTWllo?=
 =?utf-8?B?eTczcUw0WFo0T0E2WGFvQTJqcUxBSjBlS28yeFl3NEZJdmRqWmJuWjFGSUR2?=
 =?utf-8?B?LzlSN3hlQzBTY3p2a1NicitmMFY3WXNCV2wvQ210MnA3ejlRUHNFUzdpMHhN?=
 =?utf-8?B?K3JkOTR4K2VnY0NqMUNMWFhHZy9FTDI1RDJjckU5VEp2S3prVWM1VDVyMlNv?=
 =?utf-8?B?RWJZR1dIK2kyc0swd3l6TGgwNGlyeUZDcUhWdld0YjJSTWNHa2dNR1hkVDZ6?=
 =?utf-8?B?ZXByRTBKZWtHTTJhRW5yRno0QkV3bVpxNGYycERTN0J6MWNyR0hVOFJpeDFD?=
 =?utf-8?B?amV0dWZmdVdDbkQ0N2JYV05NZmxLd2lJZGE2ZWVxYWd2Tml6Rnl1ZDlCY2l6?=
 =?utf-8?B?VHJNa0gvdmp0b1hjSkdjS1JqSGE4VTEyU3MzaGpKWGIvWmMwejZGbDg4MURK?=
 =?utf-8?B?dWtQRlloSHl3OEdvd1h1MzVra1VicUpsRXZsT3FrTUkwcmdJK2xUQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a005ef9-c71f-45ae-8196-08de836accc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:46:25.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+KJTmU3I+/tSjd79Ws5Soh8RAtXAaSWPNDZy+HxQfzPlLqMq8DIlwrMPf21hQxwuLd1bZ9Ej1SAGQBXw6LNdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
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
	TAGGED_FROM(0.00)[bounces-6206-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,0.0.0.5:email,devicetree.org:url,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: EFFC529BBEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert power-controller.txt to yaml format. Drop the example because
there is already one in regulator/active-semi,act8846.yaml.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/power/power-controller.txt | 17 ------------
 .../bindings/power/power-controller.yaml           | 30 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/power-controller.txt b/Documentation/devicetree/bindings/power/power-controller.txt
deleted file mode 100644
index e45affea80781292316c75ed387ba38402501c5b..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/power/power-controller.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Generic system power control capability
-
-Power-management integrated circuits or miscellaneous hardware components are
-sometimes able to control the system power. The device driver associated with these
-components might need to define this capability, which tells the kernel that
-it can be used to switch off the system. The corresponding device must have the
-standard property "system-power-controller" in its device node. This property
-marks the device as able to control the system power. In order to test if this
-property is found programmatically, use the helper function
-"of_device_is_system_power_controller" from of.h .
-
-Example:
-
-act8846: act8846@5 {
-	 compatible = "active-semi,act8846";
-	 system-power-controller;
-}
diff --git a/Documentation/devicetree/bindings/power/power-controller.yaml b/Documentation/devicetree/bindings/power/power-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ff698365d778446c08ceeb5f3ef144d5e97d2f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/power-controller.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic System Power Control Capability
+
+maintainers:
+  - Rafael J. Wysocki <rafael@kernel.org>
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+description: |
+  Power-management integrated circuits or miscellaneous hardware components
+  are sometimes able to control the system power. The device driver associated
+  with these components might need to define this capability, which tells the
+  kernel that it can be used to switch off the system. The corresponding device
+  must have the standard property "system-power-controller" in its device node. This
+  property marks the device as able to control the system power.
+
+  In order to test if this property is found programmatically, use the helper
+  function "of_device_is_system_power_controller" from of.h.
+
+properties:
+  system-power-controller:
+    type: boolean
+    description:
+      Indicates that this device can be used to control the system power.
+
+additionalProperties: true

-- 
2.37.1


