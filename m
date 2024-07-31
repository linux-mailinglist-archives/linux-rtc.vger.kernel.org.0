Return-Path: <linux-rtc+bounces-1642-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3C942EF2
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9E62840BC
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B31B143B;
	Wed, 31 Jul 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W0Lw/TTj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013004.outbound.protection.outlook.com [52.101.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE61AED3D;
	Wed, 31 Jul 2024 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430050; cv=fail; b=IbhL1O7xTEJw5/I6KEHYJRXIEVHFH1QDv9fz348wmIs762lCuw84YV76P1ZEPb5KaWsLrWUB4XuZ0CklCv5zn+lFFoN/pTCrN6AIOLSNk0iTHN0dqgH+X5mtXvlKPOLHOvh/atgI9YYxpe7YtoU3qla4NkWs6D7aUCzxirZebh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430050; c=relaxed/simple;
	bh=E5LpsSI+IBisa2obdH4gzsQzu8srJbB8PmQjInA7uFI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lCQtG49lDxO4mD/0ld1zCpW5QwIDPXF6BPc6HgZ6gf3q5f/lBMnNvXF09kn10Q1DwBIgLqrayO0FtFuypBu1AD3nZQw8juKYISSn+t2fdMWSEYrit7YP4+7coq1JzRa0Cje5nX4cWw0lLuiBspVcDLFcJ8MLIaoqT6VppntXEn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W0Lw/TTj; arc=fail smtp.client-ip=52.101.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1jkbrTbq3KLXZ4GgdjvTJ42ZVoiVtnHnFxItlhvtIjrL4rwTxGJ8JFsBD9jSSIfUFrMgL5p8vR6wZzvVmLger9W+1i83ZquC+D1bOQaLjjT/i7AxrKg9ftThGpuvksmAbZgIaC0fz/wDJWGxcaCGT2qptbfTmc5uNgRuWhFo8uXkqHupsRjo3YEnG89+F0r0cyGwrgtxevd8zPMsl6lHuF/ha0GOM/gvg+SHrnex0MPek0C8na2VcSNQCC4Vl3IhQSJKv4C/pa+sQ/ixkwQA8Zq4MX/61hhyUJP5N4TkNSHZRtXNIuDTeDzdFHsID6AkvyRtBVZBNdUTN9OR9Y+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xkagEKIddeT9VSxKdk2VEbIxtLknUAa+k5fp4B5DyM=;
 b=xYyPSkMS5EU6CAxGOzkZ5DFkV7AF21Pa3lieYjjw0XFDR1N4iXRoV921A17RwmRXN2nFxCtxhx89mIW89yE9RI/An/FAYnsPpY7u8I/bf5azZ3g1gOEmVNaceoNv6TMouX/s+NiG+KCmJXWhIPJaKCT/dMXMAmhy1LH4DQKmtIaMeCZe465tyLMy/aVs+h243yNRkkYHMt/Q1uXwmzuzePEcHXi6MngjVc3tpck3GPzJbM2KIfL64DwsG6okSbi8zyKcyfGLk7RozeOsjIgH/CXL+/8Gi3mK5ExsfhBnyG9s7N7kgjT8/k4ql4YI+j3yR521DND8nN7tNW3Qnia5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xkagEKIddeT9VSxKdk2VEbIxtLknUAa+k5fp4B5DyM=;
 b=W0Lw/TTjnlmhj1OD/fizwd/BSxYqDI0EsdQYU00p1YlBb2nffqHD0TxaVCmMmtpmJBtceBpimKYTmFcm5JMZ7kU242/+Zu1uxgFBs+bmauPd8veW0njvhJJV2Dcc94xIp/Pk543gc13S1j2Hhpj/ZziKpBfnsjkqDGYZSuWxqqi3vMG1L0HDOzExsWbs5ujBFYcG3MxUXx3z3OgmOoaPwkK4M9HRi9T+EguoiZ7F54/xnb0ZMxvAXRmuF+5HaGwiLwtflT7fHxOBHTPOBWlf8PxaSCDxG1RvB46IPnGwys5wG0iKXFqhxfgPmUjfcuOnD2iy/r7/gWwRYxACKsmtaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:06 +0800
Subject: [PATCH v7 2/7] firmware: arm_scmi: add initial support for i.MX
 BBM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-2-a41394365602@nxp.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=13923;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=m4/zUnBHrvUCml6LwbVFtKf2AEb1qkvpVEohGFcAPm0=;
 b=BfJ8kjWn3QOVxvHg2rJ68KRkDhN8OZZ539n29TBN+P6c81qHLN7IbyOZJEiwQdIB+q1sQ/YDR
 tdPcy22W0UNCoYCy72h9mAAjgGOzpBDVeVkz7WCqinYrMo2+lOL2LCa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 87039bba-ce72-4db5-6bc2-08dcb15eecf7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFkza09vT1BocTJ5NGdielNlYTZqMURxUnUwOEE0Q25UVU1KalBxRzVBNFFO?=
 =?utf-8?B?c09LUThrWUFpRmM3K3BOQ3AxNDBNTENXUkE0bklUdXJrMmM2MkhIVzZTV1FK?=
 =?utf-8?B?ZjhySm9RQnBNMVV4OERmTFY2OHU5SWh5ZTg1WHo0cktUdEI0dVZiVzVHZ3JC?=
 =?utf-8?B?SzdBVXdqMFlVS2hGSS9MVDRPOFhEbXY2dHJYVFhEVlI5alZFM0VxSEdSTldG?=
 =?utf-8?B?ckFWR0lsSnZNNWNoUzJldlJaZ1hnVHBNaUxmdmtWbGEvOXA5U2ZJR1Z6bGp6?=
 =?utf-8?B?eTAyb2ttTE54cVA3cG5qNGpqc0JyNVFVcFJqdElJM2xZT3RNR1FlOE1KSFdK?=
 =?utf-8?B?bTA1cGtkblZSRjd3aHNoNE1tT2o0V3VEZWZPZmNKQjFDeTRQbmo2Ujd5Zkk5?=
 =?utf-8?B?RjhiRythM08vT3MrblMrNnpxRTBHVlV3anRkS3pudWNVQ2twUHpSN1VqOERM?=
 =?utf-8?B?Vi92VzlkTEZLNWszVjBReFJTeXRpZ1pya2VDMko3M0lFOUpNWDBtVUdESjZG?=
 =?utf-8?B?WHZHbTVwa0lacHRoMWp6N3dPTHdlMTY1MXVLMTBNVXVOWFB1VnY3Q1JnTkRm?=
 =?utf-8?B?RWpiZTdVc3BGRmJ1Zm5TT216alNLcW9Tc2N1b2QzZGdBdXlNTCtzVmUwS3po?=
 =?utf-8?B?SkY0QWx0cFQ5dzA3dlFFWGlCdE51Y3JxbkF2R1hPUndxd0FIMFN4U2ozMGlq?=
 =?utf-8?B?enlxNVI5bEl0UE1IR2poZzJmSW0xM1VwS3lFMTNvYmEreWh1b25pS3owYTZy?=
 =?utf-8?B?Mm9JN3N0dVE0d0c2bGwwU25ISjRjcHNJRkp6Qm1Xb3NZRjFLZDBTWUJaR3d2?=
 =?utf-8?B?cFBTb0E4L3oya2FyUVFvWEhYNU4wZHo4bTVFd1hnQ09XblhDQVcyMlJ3UzZm?=
 =?utf-8?B?RjJKRjBXbFZCa3h3QUZNL0ZRWlp5c1g1aE5FV0ZYbDI0UjJ2b1FHYWZsa2l1?=
 =?utf-8?B?U24xbEVqK1ZrWTVDZEN6RldRMG9tUEIwYkJBL1cwYmJFUy9UWStWVFZKNGlR?=
 =?utf-8?B?anhiaTFQeE5hOEcvbTIvaHpVZEFmK1RScVhpN0R1QnZJbWtoVzRvZlFycU1t?=
 =?utf-8?B?dm1tbm95N2hKZ2ZGUlVFR3VuOUttUmJ6WmlCSU5kY1JpWEZsT2Zkc1JkcU5K?=
 =?utf-8?B?aHNlTlJYQ201NWRaYTRHc3IzVStMSzhGd1BOWlpscFA0NGVPYTZ1QzlIYWJ1?=
 =?utf-8?B?bUVzeWNSUGpjS0djUnhCUDN0R2IrVkZKcE56RWxkVk9abUdoMHNVd0FpRzNj?=
 =?utf-8?B?YzJSWi90VGZSSUluVWhaQVFiOE0wN1dMVUwyaXNvQWZTcXQwQ2pubDdJZ1FP?=
 =?utf-8?B?cU4wdGErdXlsWEU4WElZdWthSjFONjN1NkZVMEh4enRDbFgvVm5NYVBVSWZG?=
 =?utf-8?B?YU4xaTZXNWJHYzRyaGluelhVbFVwMGFldExncC9hM3A3aHZTSjRBR0VNc05C?=
 =?utf-8?B?ajBNSlpuMTVEejdsK254N2tTU2pjckZINGI2b3ZsSWxHWGZxUU00bG00MytC?=
 =?utf-8?B?OGpwU0p2dWhsdzlzZlVtNzFTR0tVTFpnaG1zTFBCM3ozV2JjNGJGQ2owVnV3?=
 =?utf-8?B?RnhjRXljQ3BLYk1MbUh4ak5MSkNFTnFlWWtpREJvTkR5Z0k4Z1JUL1MrZUhI?=
 =?utf-8?B?SFNpTUdWRVo1Q041Uk0xNTl2UEloT3NUNjhBSnV0OWl0djFKNTVYclJLbTU5?=
 =?utf-8?B?YTdDTDZBQThxNnU4UGtLeitKa1E0elNUL2R4ZXc0eHZWaEh5b28rQVFuZ2pI?=
 =?utf-8?B?dXIwTjFlKzcyYU9XeDNmYVkydVFUVytWMml2TnBSNnFVanc1YTljNG94UFBp?=
 =?utf-8?B?SENNSTZzZXJRQ2pUMW9QZS9NM2g5QTQ5QjlzcWlXR3pmdTg1UUpFTzVmdThS?=
 =?utf-8?B?bUl2VkZnMVgyUy9VbUFGVXBNa1Q1TEo5WHFSL3g1dDMyRDNLazNXRWhzSVFZ?=
 =?utf-8?Q?Mxt7n5pAjXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WndETmxCZkF3eUw3SStUZWlNNm44aWtYb0tsMDM5TlpoWG44aWZ4RkVrTE5o?=
 =?utf-8?B?bE1zTnQ1b1BEZUFON25RWFZyZ0ZsdldLb3lvV0ZWVy9pNjRRRmx2WTA4c2ls?=
 =?utf-8?B?b3NPczlpWUNQS1M2aTEzYktkTzg4YUEyL1B6OXRseDNHbTRZbEs1VkE1Tjhq?=
 =?utf-8?B?aXkrbHFoa29iQnFXYzI2cnQycTYzV203T3EvcFBENmFWMHh1WldydWxRaXRP?=
 =?utf-8?B?T0ZWWWt2Skx1VGRUb3FaSHV6aXhaTyszZit1eUpwVTRmYWQ0c3A3dWVRbGtt?=
 =?utf-8?B?UmtFcGV2Zlg4bzRzZUlGaEV0dXoyaWVPaVczMGpzaVJKamFuVDBacHlBZkln?=
 =?utf-8?B?MGpFT3lYdXBCYmcyaGVwL2VxNDRmZjRUZFI1TWUrbEUwMENSRVBKVGxPWi8x?=
 =?utf-8?B?OWZNbmxqTzl6MkcwZnc1QTNDSm40S0Mrc0NpdkdiNkVRTWtOZWxWbUxPSTha?=
 =?utf-8?B?SkhScytNQVphSXc1aEsrT2xtZ0R4K2VDeGd6UnJ1cFIzd0NEVFVkUlFTWlFh?=
 =?utf-8?B?dnF1V2FnREY0R3BORFd2SlhHTzRrQ3VncFlQZGxPRExNanlBMHZZbUtWZmhu?=
 =?utf-8?B?R1hFUlptWnErQWp6cFNWRUNpcmlSTUF5RVJTWk5PN21GWGJSeGtTNEVUNzIz?=
 =?utf-8?B?Q3pnZUpEYkFlSUZIbisvRDZORVhiT3Jhb0pzNlNSaFVLMURhRU9GN3B2ZnFm?=
 =?utf-8?B?RE54K25naFdXN2p1cFBXemQ0cmJPMnNyWU1KZDRZZmszMkNzVCtCeUxLTUE1?=
 =?utf-8?B?MWdvdSt3MzEwZzhodWloR251bkNTRW44d2V4ZlYrYmx5SHlMS0RmZk9wVXI2?=
 =?utf-8?B?MTRyc3pPVElnL2IybldpYjVGSW5HWFh2WklxQXZsL3BpbnNxWms3WTVhSG9Y?=
 =?utf-8?B?WmFKckhpUXFnbUorVmNsTkhkdHR0eFdaQ1FydmN6Uy9BbWJKMXYzQUptKzE3?=
 =?utf-8?B?Vk11bE5JWkkwVy9tY3Bzc1JmY0p5akNybzhHZnplUzc2bXRzTVhweFdJS0dL?=
 =?utf-8?B?UjRDQXJmQnJPT1grTFRaMmZNUFVZcERJalo3bVFtamFxaXM2Q0syaXpOQU5i?=
 =?utf-8?B?Z2ZWMDBlWnNteEFNeVd6OVMxMjdhUHVMVCtUSGJCL2RpdDVsTGRwWStSTncx?=
 =?utf-8?B?QnlHek4xeGxzTUdrWncrcmNOSVFINmZ1NlJOL0FteDU2TDBoaTJnWGRzM2R2?=
 =?utf-8?B?dGVadGdWa29NcjZNM3plcFduVGtleXQzd0xheVI2N280TXo1cFYrWmI5UzlU?=
 =?utf-8?B?elFHV1VkTDdXeFJtN1dlYkVESmRld0x0aCtRcGRpMjR5VkI3SEh3ZmIvMm1L?=
 =?utf-8?B?ZWtERGVGd3EwYkZrNEFxQkU3VTVJQWo3OXc2VHNMdkRUcnM3UkdhS3VaN0Uw?=
 =?utf-8?B?S0hCaUJrN3JmMSt4RFpLQjluSmk0bTNiZkFSaGp2RE93NmVmZ1ZrK0xuUEpP?=
 =?utf-8?B?YUozUXo4TFVxNTkxYU9HY05YdFI5RitPZUtPUzRwOXlMclFOZEM1SGpKOHFR?=
 =?utf-8?B?Z01DMnRadTJwUm9WQjZuVkk5UmtaRWM0Z0p1ME5uN0VoUnNBZFUzS3FwZi9S?=
 =?utf-8?B?aGYybjJZNDJnb25NSm1HangxTGhFVTFKcDZFaFJBNksydjBQREcwRGZpTG4z?=
 =?utf-8?B?Z3cwdVFKQlZLYnBSdnhWTEQ5Ti83cWpwY2JtNDJuUW5Bcmw2dm43bHNSazhl?=
 =?utf-8?B?UXcyM2tnSHNwTnFob3AxSTMzN3QxejlKS29HYkNQR0dlNXo4VjlwNk91RStN?=
 =?utf-8?B?aXllUlFlMkNYTXFKdmwzaEJQaVFPSVdQZFExQnM4L1dEbUtvdG1IRnZNdVhB?=
 =?utf-8?B?OHZ2Z0hkQmY3eXlEV256QkRVcUorMTZmRUdqYmxQenRKZlp1T25MSU8yNXk2?=
 =?utf-8?B?d2RIU0lra1hTUDB3c1lyR0FMalRLRkJ6dC9ZUFEvWjhjQ0tuWGRYTnNzT0dp?=
 =?utf-8?B?blR2Z2kyOGVIL0hoYW84SVRGTFR0dEh3MWxBSmp1SmdhMXJTUWhwdTIwZUpG?=
 =?utf-8?B?VE5EMjRyS1ZwR2N4Z0dLWHhVa0ZrZEZ3OVZ1MXB6SVBJZFNQc2FIZmkvcTZt?=
 =?utf-8?B?ajlsYWs3VTRyaFhwaFZBWFRzU0ZZb0lTK2FydkdMSVRlVFpIRTFaS2s0a2pa?=
 =?utf-8?Q?lipM5Fuz3d/GCIqg74DNoe+yf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87039bba-ce72-4db5-6bc2-08dcb15eecf7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:24.1358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x54bkAuEILarcbgb5rabctjKJLDm5dLpCNDXp9bNK8OXZR+fVabA8l4WFVcViX8phrkiR+FNOL1bUXAWHZvD4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

i.MX95 has a battery-backed module(BBM), which has persistent storage
(GPR), an RTC, and the ON/OFF button. The System Manager(SM) firmware
use SCMI vendor protocol(SCMI BBM) to let agent be able to use GPR, RTC
and ON/OFF button.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/Kconfig          |   2 +
 drivers/firmware/arm_scmi/Makefile         |   1 +
 drivers/firmware/arm_scmi/imx/Kconfig      |  14 ++
 drivers/firmware/arm_scmi/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/imx/imx-sm-bbm.c | 379 +++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h          |  42 ++++
 6 files changed, 440 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index aa5842be19b2..79846cbaf71b 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -180,4 +180,6 @@ config ARM_SCMI_POWER_CONTROL
 	  called scmi_power_control. Note this may needed early in boot to catch
 	  early shutdown/reboot SCMI requests.
 
+source "drivers/firmware/arm_scmi/imx/Kconfig"
+
 endmenu
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index fd59f58ce8a2..fb9407fef60c 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -16,6 +16,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += imx/
 
 obj-$(CONFIG_ARM_SCMI_POWER_CONTROL) += scmi_power_control.o
 
diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
new file mode 100644
index 000000000000..4b6ac7febe8f
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI NXP i.MX Vendor Protocols"
+
+config IMX_SCMI_BBM_EXT
+	tristate "i.MX SCMI BBM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System BBM control logic which supports RTC
+	  and BUTTON.
+
+	  This driver can also be built as a module.
+
+endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
new file mode 100644
index 000000000000..a7dbdd20dbb9
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
new file mode 100644
index 000000000000..017183caaadb
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) NXP BBM Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications BBM - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../protocols.h"
+#include "../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_bbm_protocol_cmd {
+	IMX_BBM_GPR_SET = 0x3,
+	IMX_BBM_GPR_GET = 0x4,
+	IMX_BBM_RTC_ATTRIBUTES = 0x5,
+	IMX_BBM_RTC_TIME_SET = 0x6,
+	IMX_BBM_RTC_TIME_GET = 0x7,
+	IMX_BBM_RTC_ALARM_SET = 0x8,
+	IMX_BBM_BUTTON_GET = 0x9,
+	IMX_BBM_RTC_NOTIFY = 0xA,
+	IMX_BBM_BUTTON_NOTIFY = 0xB,
+};
+
+#define GET_RTCS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_GPRS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_UPDATED		BIT(2)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER	BIT(1)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ALARM		BIT(0)
+
+#define SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG	BIT(0)
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_FLAG	\
+	(SCMI_IMX_BBM_NOTIFY_RTC_UPDATED | SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER | \
+	 SCMI_IMX_BBM_NOTIFY_RTC_ALARM)
+
+#define SCMI_IMX_BBM_EVENT_RTC_MASK		GENMASK(31, 24)
+
+struct scmi_imx_bbm_info {
+	u32 version;
+	int nr_rtc;
+	int nr_gpr;
+};
+
+struct scmi_msg_imx_bbm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_imx_bbm_set_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_imx_bbm_get_time {
+	__le32 id;
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_alarm_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_msg_imx_bbm_rtc_notify {
+	__le32 rtc_id;
+	__le32 flags;
+};
+
+struct scmi_msg_imx_bbm_button_notify {
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_notify_payld {
+	__le32 flags;
+};
+
+static int scmi_imx_bbm_attributes_get(const struct scmi_protocol_handle *ph,
+				       struct scmi_imx_bbm_info *pi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_bbm_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		pi->nr_rtc = GET_RTCS_NR(attr->attributes);
+		pi->nr_gpr = GET_GPRS_NR(attr->attributes);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_notify(const struct scmi_protocol_handle *ph,
+			       u32 src_id, int message_id, bool enable)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	if (message_id == IMX_BBM_RTC_NOTIFY) {
+		struct scmi_msg_imx_bbm_rtc_notify *rtc_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*rtc_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		rtc_notify = t->tx.buf;
+		rtc_notify->rtc_id = cpu_to_le32(0);
+		rtc_notify->flags =
+			cpu_to_le32(enable ? SCMI_IMX_BBM_NOTIFY_RTC_FLAG : 0);
+	} else if (message_id == IMX_BBM_BUTTON_NOTIFY) {
+		struct scmi_msg_imx_bbm_button_notify *button_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*button_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		button_notify = t->tx.buf;
+		button_notify->flags = cpu_to_le32(enable ? 1 : 0);
+	} else {
+		return -EINVAL;
+	}
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static enum scmi_imx_bbm_protocol_cmd evt_2_cmd[] = {
+	IMX_BBM_RTC_NOTIFY,
+	IMX_BBM_BUTTON_NOTIFY
+};
+
+static int scmi_imx_bbm_set_notify_enabled(const struct scmi_protocol_handle *ph,
+					   u8 evt_id, u32 src_id, bool enable)
+{
+	int ret, cmd_id;
+
+	if (evt_id >= ARRAY_SIZE(evt_2_cmd))
+		return -EINVAL;
+
+	cmd_id = evt_2_cmd[evt_id];
+	ret = scmi_imx_bbm_notify(ph, src_id, cmd_id, enable);
+	if (ret)
+		pr_debug("FAIL_ENABLED - evt[%X] dom[%d] - ret:%d\n",
+			 evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *scmi_imx_bbm_fill_custom_report(const struct scmi_protocol_handle *ph,
+					     u8 evt_id, ktime_t timestamp,
+					     const void *payld, size_t payld_sz,
+					     void *report, u32 *src_id)
+{
+	const struct scmi_imx_bbm_notify_payld *p = payld;
+	struct scmi_imx_bbm_notif_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	if (evt_id == SCMI_EVENT_IMX_BBM_RTC) {
+		r->is_rtc = true;
+		r->is_button = false;
+		r->timestamp = timestamp;
+		r->rtc_id = le32_get_bits(p->flags, SCMI_IMX_BBM_EVENT_RTC_MASK);
+		r->rtc_evt = le32_get_bits(p->flags, SCMI_IMX_BBM_NOTIFY_RTC_FLAG);
+		dev_dbg(ph->dev, "RTC: %d evt: %x\n", r->rtc_id, r->rtc_evt);
+		*src_id = r->rtc_evt;
+	} else if (evt_id == SCMI_EVENT_IMX_BBM_BUTTON) {
+		r->is_rtc = false;
+		r->is_button = true;
+		r->timestamp = timestamp;
+		dev_dbg(ph->dev, "BBM Button\n");
+		*src_id = 0;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	return r;
+}
+
+static const struct scmi_event scmi_imx_bbm_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_BBM_RTC,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+	{
+		.id = SCMI_EVENT_IMX_BBM_BUTTON,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+};
+
+static const struct scmi_event_ops scmi_imx_bbm_event_ops = {
+	.set_notify_enabled = scmi_imx_bbm_set_notify_enabled,
+	.fill_custom_report = scmi_imx_bbm_fill_custom_report,
+};
+
+static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_bbm_event_ops,
+	.evts = scmi_imx_bbm_events,
+	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
+	.num_sources = 1,
+};
+
+static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_set_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_time_get(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 *value)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_get_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_GET, sizeof(*cfg),
+				      sizeof(u64), &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*value = get_unaligned_le64(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_alarm_set(const struct scmi_protocol_handle *ph,
+				      u32 rtc_id, bool enable, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_alarm_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_ALARM_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = enable ? SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG : 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_button_get(const struct scmi_protocol_handle *ph, u32 *state)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_BUTTON_GET, 0, sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*state = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
+	.rtc_time_get = scmi_imx_bbm_rtc_time_get,
+	.rtc_time_set = scmi_imx_bbm_rtc_time_set,
+	.rtc_alarm_set = scmi_imx_bbm_rtc_alarm_set,
+	.button_get = scmi_imx_bbm_button_get,
+};
+
+static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	u32 version;
+	int ret;
+	struct scmi_imx_bbm_info *binfo;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM BBM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	binfo = devm_kzalloc(ph->dev, sizeof(*binfo), GFP_KERNEL);
+	if (!binfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_bbm_attributes_get(ph, binfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, binfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_bbm = {
+	.id = SCMI_PROTOCOL_IMX_BBM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_bbm_protocol_init,
+	.ops = &scmi_imx_bbm_proto_ops,
+	.events = &scmi_imx_bbm_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_bbm);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
new file mode 100644
index 000000000000..2df2ea0f1809
--- /dev/null
+++ b/include/linux/scmi_imx_protocol.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver NXP extension header
+ *
+ * Copyright 2024 NXP.
+ */
+
+#ifndef _LINUX_SCMI_NXP_PROTOCOL_H
+#define _LINUX_SCMI_NXP_PROTOCOL_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+enum scmi_nxp_protocol {
+	SCMI_PROTOCOL_IMX_BBM = 0x81,
+};
+
+struct scmi_imx_bbm_proto_ops {
+	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
+			    uint64_t sec);
+	int (*rtc_time_get)(const struct scmi_protocol_handle *ph, u32 id,
+			    u64 *val);
+	int (*rtc_alarm_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     bool enable, u64 sec);
+	int (*button_get)(const struct scmi_protocol_handle *ph, u32 *state);
+};
+
+enum scmi_nxp_notification_events {
+	SCMI_EVENT_IMX_BBM_RTC = 0x0,
+	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+};
+
+struct scmi_imx_bbm_notif_report {
+	bool			is_rtc;
+	bool			is_button;
+	ktime_t			timestamp;
+	unsigned int		rtc_id;
+	unsigned int		rtc_evt;
+};
+#endif

-- 
2.37.1


