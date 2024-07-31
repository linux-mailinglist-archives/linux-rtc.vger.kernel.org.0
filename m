Return-Path: <linux-rtc+bounces-1641-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF8942EEF
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F1D1F221E8
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9061B1410;
	Wed, 31 Jul 2024 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tqm8RpeL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013040.outbound.protection.outlook.com [52.101.67.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FA1B013A;
	Wed, 31 Jul 2024 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430045; cv=fail; b=WWhGasFEaDWtX+H1NKxaAkobQdMnFfmyMRVFkYevD/IzH/hv+uek/XjK/gly/L0QK+/XvX7AmNCawN4qvXVg5YaJEUCdsl6JMjBE2IjF/zS+UD4I/B2N6arb0ay1ppYBOtCPBKqGBcOO/VsLkIXoj1FJ1QxqSzsqSmMRd14SfFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430045; c=relaxed/simple;
	bh=KhpB9ReK0bVZQnmq4pC7qBj4R8zobrOyUbLDD18i0i0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WE4KjV8AiMoNYpMC9PZ8ESe8H6EZe8fB4OE8cVlTUQtCR8FMYFzqwqBZpIGPr6biODP/1Wm+jE+6Eh3L/cFXrl5f2QwAMGpQ9odHHFOjXNvWKISteOeDPQsZhclTqDFKVyp21pS5/RDSy8d39jrd/TOkaHQ4OtsV4L7hD0kcbi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tqm8RpeL; arc=fail smtp.client-ip=52.101.67.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGpqUk6FQri2AzuMnSEHjC2qTz7JBRzNQgM4Q70Fz8PUv+o2j8C7WtfXYc1DJrqSXWWCaj8hPVHiyj6N1aUaTFZqukXaEy7Ael98Zpd5F1DU62pmXKHrn9kIeEr0qYvKqFhTigbmzDMAS1ozt3+191ylAO+pxa1CZ2rcqTvLv1qf4hMlbdKNJ4QZ1sqi+MSq62C+PNvV81iv+HtlPytHp9G0+oE+PGXQRvXIKg1kTNxBy4f70KMJlTuBaTSSoIfMSS4jP6BwOL1rBEfo5pmPcSkfVHDbzZfBkgmaeaUWOpZs/Vn+Br66J3lvtuQlJ1Rd5FOGQDcoRlNbKPcx/emMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+tO2+VL5fu6DdwN7aFFl6k9EQ18co6ixAtEaYPutII=;
 b=UwofCp/PLxjsyZ6D8ilHkZBMg8XLeLel16rsBj5FGLKhmrKGa8tcQPmm1tzLXxEjdNhEREONGAnqHeV6S1bUU62ZlRRRMGGv6zHxfgTAJt+GLtxIWCDQXfKQpP0+mg03sqcihQQl4tLuHLSsGzDXvyceT+gOEDTfkNhdXnW7gbUubrLvslsMHT8XuVavkiEYi0TE/sJ+wSOm+SuWErDfDUtb9pfm4BnlNXBLO8O1p6RYm1O+8All14noFh46a2XgrdoSRw6dbv30gNhMyyulSwI7m4eeUe2+vueYwpopxS0Q5S//vAkIL8a4Ybo6+YsPms3m6NdYSe/JWn5bGwRfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+tO2+VL5fu6DdwN7aFFl6k9EQ18co6ixAtEaYPutII=;
 b=tqm8RpeLwrXhkSYB83y81bRCSXUCGB/tcAQTYDPnOQgxx9yxTA+L7z39dRGZrD4+fcZefJMyg0D9ZASRRPBQUyQVB7HLC2Kx9272uGcMEJxIzrh34s6IYhvvNgJVconxLhvjy6/FsdlcuHbGkiEP5aEIvtK11pHm4RxkJqoKoFn025fMmmUp+JFmCybegbWL4D5NBmu1hyaMDqWTR3Hw+YkuFTTwOQonGUTWalAdt1RPnoSl5kU6vWzgmvEUg25b91UkVvJQom3fmu0FtjNfMDV1y86a6oRBIIE4zWvzQUb5fWw94ovNs2bmlaGUn2yPTIRpJoUWg2y6n138/8sS7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:05 +0800
Subject: [PATCH v7 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-1-a41394365602@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=3176;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Y5m+1jHoUYHFvUZ453wlcI8fTxHAzlyTtxk0HQ4iV94=;
 b=lxa+GKjf2BU781f9P/39Fn4TPZWHN38m29UCZYsNDEy0O6awbjUrdS7iOo9SlXZ7mrRTWD9y2
 gUnRetALHFeCmSMNrMAF62/XYI5cEGY4i0/MJSf1P6WHEibCoXTyDvN
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
X-MS-Office365-Filtering-Correlation-Id: ae637409-0e2d-45a9-e869-08dcb15ee9da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFsZERUNEdBMzhRcHhjMEdkYWRzeTVNSi84OXpia0FxTVNnSjFrTTMxSzk5?=
 =?utf-8?B?MjU1RVZjeXdKemJUVVRrVGFHaERjcHk0MlFIdUhGNWxoaEVPMUJGN05CUllz?=
 =?utf-8?B?MlRXUU5aRVdDVHZqL1c0TDFXREdNYytOd2tIK0RpMElSV0xZMzlpd0hpby9T?=
 =?utf-8?B?L0ZKenExUENwTHdJZzZhdFVRQ3R6WXh1aS9DRnpZQ2sxMG5oKzB4aEFOSFo1?=
 =?utf-8?B?UUtISUFGZWY0TDVTRXlSNEQwei9aVU1NdnhWMEN5ZVdQMWZqZXdaN3JZUXpQ?=
 =?utf-8?B?eEtWU0wrZC9VRWFXdlpwdE00T0R2VVpXOHVlVXNJcWYwV2JGRElxNjBrUVgx?=
 =?utf-8?B?cEFYLzR2WkUwMDQ5N2JSMERybGxhOFdqVllvWGV5TlRiQm90QlFKdDdIQkI1?=
 =?utf-8?B?N1dwZzlQNU9OM2o1cFh4REpoTERDYlBla2RXTlBQcU9iZVlxWi9ZS3ljcjBk?=
 =?utf-8?B?TkFXdDErOEdBQzE5SUpsVmllMDV2a3MxMlVlNTJBZUdrYzR5TS9BaGJBekV2?=
 =?utf-8?B?K1JUNktHc2xOQkY3WTNBZnRyN0NXZDFpWVlKMjV0M2dJTWZaaW5HYm9pNCsz?=
 =?utf-8?B?ZE1QMzRnQm42QjVkYmRUODBnNjVwdTlBRWFXdHRMVHl0YWhLK3Q4VmVSQThm?=
 =?utf-8?B?RElhTmt2MStxU2RaNUkyejE1bkx4N3g0SWVnMWRTZkRLMnVSN3FHSFZCZWRv?=
 =?utf-8?B?ZEh3MmhPRkdCQmFDWmhrUUJ6WWpFbVRuNno2M2VKMTZZUlVqUUpqTWNhb2d6?=
 =?utf-8?B?RWh3SEp6bnIwMnFZdDg0UUh2dEErTllVc3NXUEYveGw1b1ZjS1YvdmdhdnBC?=
 =?utf-8?B?QkZZRFlncE9tK2ZITFEyUkN0Q2ZOMWVsSjc0U2p4L1lMRHhBOUlPQTVSakJJ?=
 =?utf-8?B?Y2xoNno3SWNVSmtoQXBlRnlvZXJ5RGI2RmM0eERXaCtoeVFaaDZzODgvUWN0?=
 =?utf-8?B?L091cERqUFNLWlMrUHZWbVZJcW5pQkVNaU1JVk5vUituWjg2d3poQzA2Z0ZN?=
 =?utf-8?B?U2F6T1R3TWo4ZklJSDJqUi9zOStaeGFVbXZJMTYzNmc0N0VrK096bks0WEZL?=
 =?utf-8?B?ZDlYeU5xMWJQbTZiblJZVm5ZTmsyUURLT2x5RUU2TG5reVBzbU9UNkxld2Ir?=
 =?utf-8?B?SC9PVDY3Y2RQWjZPbGIzUXlQV2dBTHpBMXRmelcrVnZFOXpJRC82cHZka0U4?=
 =?utf-8?B?RGsxb3hhR2pVbG1xTVgzTnBYY0hqUGFhbjNqekNxVldMTjVFR3J6TUNsRjBS?=
 =?utf-8?B?ckJvYjFrSG5QeFZaOHNQS3BrZFBIRllPNDVBUTlMRE0xbjNkNDI4blJKT3FB?=
 =?utf-8?B?bWdxemczUUFNQ2NZNytHd1FMZ0h0dVBsa1lobm52M2piTVQwTlNOMGlmNkRM?=
 =?utf-8?B?VHJ2ZkpVRlZpS0tjYVNlZGdvdDVYVEF3bk00ZDVmM0dzMXFISDMveDloRlBC?=
 =?utf-8?B?QW16WS9RS1NScU5sRFFyRlQwQkszRWhiVjVrbGFDVWpWZGFmMWFaRlZNbG5F?=
 =?utf-8?B?ZURzQ2U4SjVrY3NNWDdrQ3JLUFhmbXM2dlZGb1FZdGc4SXAvQjBpRDZiQkZ4?=
 =?utf-8?B?SGhDZFRoeUVjeEtOZ1FGeG01aG44OWNpMUplVzJra3hsc1NOUUNXNWQ4QXRR?=
 =?utf-8?B?YlRPTWhPbU1Sbm41ME5rSTJXTzhSdHZtYXlpcnhYNlZmYzVFR1JXdjg1ZTB1?=
 =?utf-8?B?U3RGVXFEbEFpZVNkc3d5Z0V2eXlHcDBMSUdBK3hlME90SFNYc01nSU5GZk9s?=
 =?utf-8?B?aXMydUVySTZCUHp1bmliMWxsVVBIT0hzd1ZRUldWUFlGSFVvUXpXQU10QUx4?=
 =?utf-8?B?cDZxOEJINk1LbzBZQ3hxQlBXMldDQmxkSnhhMmpsVFk0dk9IR0FNSWRpekR3?=
 =?utf-8?Q?uFcVjeolpKYRH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlpQU2NkMXV1UG12OE1LcFZnb29hbURBaU5UeDFra1BiNlF1YVRLdkNRY1Fq?=
 =?utf-8?B?YjRybE1saTMyd1p3dzM2LzFXTVVrWDBjcVYwT0MvTjEwZWJZTmgyR1dMdlpp?=
 =?utf-8?B?K1dNZUQwSm9GT3BzL0ZhOHJDM1dhTFJPVEFtb3kzYUVLTVdFK0hWalBZMWpx?=
 =?utf-8?B?ek5ZTGlRUW1zVjg2RW55QkpDZFlZSVpIalNXOG9DcGMzazREcnpTTEcwNFNy?=
 =?utf-8?B?QnJOci9YNkxPVUE0TFZrWDcrckYyenBSVzFMVVZQVW41bjdVRFpRaHdZOHA4?=
 =?utf-8?B?bC9Qb3FSL0NHTHE1b1BzdDNCMXVWcEN0dUo5cHZUNERDMllBcEtPbndhK2pt?=
 =?utf-8?B?Q2xMQ0pFMEUvbmxQbTdHRGxRL1dLaWhONm81OHUvT3dMTFg4T2p3WGdlQ2tC?=
 =?utf-8?B?U2R6bXFtc0VuNHNlZ1VoekRIR2Q5K0hXaHdDa1dKSXRyVHlPeVI4V0ErTWJo?=
 =?utf-8?B?VlU2Qk5UMkFmM2kyZTdiUzVRdHlsV24rSWc5UW94anFEVmFFV3RBRXJVemlx?=
 =?utf-8?B?UXFtN29ETFdra0s2WTZYTHFiOEd2d2g2cVRFT1FHWGp2ejM5TG9PQWI1SDRC?=
 =?utf-8?B?eU02QlU2L3MxekM3UkxjdE4vNXdPVjBpVlBMZmFIVWVUVU9EYURUV0ZOMXF0?=
 =?utf-8?B?OWhHM29lWTdYVFgyTXFkYVBDK0s0MEQ5WFQweUpBK1owZkFnT25YZmdmQUVr?=
 =?utf-8?B?eUZSK2RGb0t6VjFDMEI5dzdpWmdwOUtHNU5yZ0piZ3BDQm1ob3kxNGUrdTZI?=
 =?utf-8?B?WmZxbk9PS3VSQ3IzckRTSllXUEF3ODVRUTI5ZVQrOUZXZUR0M05idXpOZ25v?=
 =?utf-8?B?dXlJckRYQVZINFMvcTBVK2RQMkFWeG9MMVZLUVRRQ3piYjIyaU1YMDdMOWlC?=
 =?utf-8?B?TGpPaERIdktNaHBpUEIrbjh6cy94Z2hLclRhOTJwNmxOY09kNXpDUElIb0E5?=
 =?utf-8?B?ODlBVWpFOGRYL3hwVkJoUE1iKzBuKzlzUzhGaFNyZTh0NXE0UnQ1RDlkVk5I?=
 =?utf-8?B?cGJ0b05HQzlCMWxkT0RhQXBhRmNGb011R3FRSTNCbnpuYXl2eUpWUEhRU2tL?=
 =?utf-8?B?eS9udU4rb3E3alp2K3NIVWdCMGlBblpqRzFPd3R1V3ovOFFaL1Fta3JHa0Ry?=
 =?utf-8?B?ZFJZOTVHY2crM05kNlhjMVdObjZMc2VNVkw5QndOUjhYUkR0N2VyUXJjcDR5?=
 =?utf-8?B?WVgzTm93b21OYmdnTGtrOVFlSkR0MVYxZXBta0Z5L2dJay9GUmtZUGFWOFRZ?=
 =?utf-8?B?VkdUdkdHeG94WTJ6YTlkUWVyeTVEeWxURDFkcndrZ0dWbjJPemhXUnh4aXl5?=
 =?utf-8?B?MHBkd1NhL3VxemQ0SllaZThpdzRBd2RXMC9SU0tuZTZpZko1djhoK0RzTFNH?=
 =?utf-8?B?VTd3USs3MDJHM2lwaDlXaDBrajZXU1NBU0JqczhqdW1UREthdzRhQm53Y1Zr?=
 =?utf-8?B?SXNuS3AxTTNMMjBrUFhHVmlmSXZBL000ZVpGbWR1Q3RjU2QvVkRWUDlPa0RK?=
 =?utf-8?B?QlYxRnB2Qkk0Zk9DQVl4clBvOHk1SXRXNkFBbDZQMUNJNDFXcytBdWc4cTNa?=
 =?utf-8?B?VDFrc1JUU0pRM1pnbWdnRVNLLy9EdTIvbStJcVExbmhOaW50L0JCaTREanZw?=
 =?utf-8?B?VjhrcTVlR1RxeUx4YnBqVGk0OTJEeDI2VWVhckY4anQxbFpQN200ajR6RjdN?=
 =?utf-8?B?Mmo4bHpDdDh3dVZFM1FucHlNd1pCWXVCdElXQWZiZk9WcTRwRm9FUWdGZzNr?=
 =?utf-8?B?U2F5azl1YWhyNkxxTlZHMGkwMHgzVGVDaGwwWlgvdUNqanBYQkg1b3FMSHRw?=
 =?utf-8?B?MHk3RFluRXUySkh4THFPa1FFbGZKc2J1WFE3TVA2NmpYalZLNW93V05nL3Ft?=
 =?utf-8?B?Q21KS1RLY2VZWWQxRHQ5M212eGdmL2lLcDBRdDdqd0MyMnMwelNHN1lOZ3Bu?=
 =?utf-8?B?R2tHcmdUZmFDU2J5cUdZUk1wOGZRYzN4c3dNa1h0N3FYZ2JXZG44ZWdYSHIv?=
 =?utf-8?B?MU9tL1p4WXd3NHp5ZENkSVJQalNUWG5iNXh4UzFJUk9RcFpoWS9QTTdTUWkv?=
 =?utf-8?B?bzJwM0pQZUpwT0hkdHFHRjZpeXZsV29sZlBtZk9DaHo5SzJaUURVUnJiYm83?=
 =?utf-8?Q?/xKMX0XQkAQ5S/HA9LjNL9SBr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae637409-0e2d-45a9-e869-08dcb15ee9da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:19.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znHOyPUZSAY3vCLELQypiBZ7ev/3Qn3I3plPcHrXYpbHtKUe8WCvpNlkTiGFeCCiDDYLKjp16Aqlk1WU5OC/Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

Add i.MX SCMI Extension protocols bindings for:
- Battery Backed Module(BBM) Protocol
  This contains persistent storage (GPR), an RTC, and the ON/OFF button.
  The protocol can also provide access to similar functions implemented via
  external board components.
- MISC Protocol.
  This includes controls that are misc settings/actions that must be
  exposed from the SM to agents. They are device specific and are usually
  define to access bit fields in various mix block control modules,
  IOMUX_GPR, and other GPR/CSR owned by the SM.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  5 ++-
 .../bindings/firmware/nxp,imx95-scmi.yaml          | 43 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 4d823f3b1f0e..47f0487e35de 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -22,6 +22,9 @@ description: |
 
   [0] https://developer.arm.com/documentation/den0056/latest
 
+anyOf:
+  - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+
 properties:
   $nodename:
     const: scmi
@@ -284,7 +287,7 @@ properties:
     required:
       - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 $defs:
   protocol-node:
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
new file mode 100644
index 000000000000..1a95010a546b
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  protocol@81:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x81
+
+  protocol@84:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x84
+
+      nxp,ctrl-ids:
+        description:
+          Each entry consists of 2 integers, represents the ctrl id and the value
+        items:
+          items:
+            - description: the ctrl id index
+              enum: [0, 1, 2, 3, 4, 5, 6, 7, 0x8000, 0x8001, 0x8002, 0x8003,
+                     0x8004, 0x8005, 0x8006, 0x8007]
+            - description: the value assigned to the ctrl id
+        minItems: 1
+        maxItems: 16
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+additionalProperties: true

-- 
2.37.1


