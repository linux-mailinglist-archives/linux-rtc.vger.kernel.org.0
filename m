Return-Path: <linux-rtc+bounces-1545-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A23809348D7
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3197A1F22763
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A337B770E8;
	Thu, 18 Jul 2024 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YiGrX7e4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013039.outbound.protection.outlook.com [52.101.67.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3DD7580D;
	Thu, 18 Jul 2024 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287987; cv=fail; b=tTSTysA4NF1bOyVVwrTWox8UjQ+BEeVcA7Bhndem+xO65KB1nmbQ85oUXuJqkdd229KNt77AFW/Vm8iZPtGNj8nyA3Sa7GUivKJDP6eM404pE9ogiB+mSm7MR3EcvgO54vXcZv4T4Qv1fVtzEZ2Mrznd1700vwHl/n+uFtMhuP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287987; c=relaxed/simple;
	bh=TBvUdxaRTtJ2rOfLPbjcDLhDMxXC0SgBr+8qJdLV/dc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Yvf3EcSXBCKBfKHdQVCKDWTEvMvq0LAxzOyNLREHl5l38oOC/K3r53DIEaemQu6uVxQ0LU3+ofdPZ06qGXuPysEc4hpY36HlpnWrD29WTbhsYyyaN01ET1NMMk/a6D2nd/x5DB6/LqI/qTcwHGQ7dSzXxk61B0CcyfFZKOS05Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YiGrX7e4; arc=fail smtp.client-ip=52.101.67.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDFeuD8N1HYLu2UnVbNCASnMCdldnvOlWmsgpnFkl+/D09099J8aAR3LnASYsXWuJyg/80IwqMZvh+Q5CLwIPlf8Ny4rOaWpmJZ1T3XFCOveV7UOZIZAfUrpimHNgha+yCnfgma0C9ZWbMDcfoDWiSSsMKQduxN6likMq/1dNpDkzfqHVcQHjmG1ExJMRljFUcbtBOBV1FNFatLVBNAKtlWQK8+E1cu100k59I3wQ9cGhni2K6ScosxPkHS3hH6ZhI5MuA6n97fvivApdsw4RzdMfi3XF2dBkyvbUyvkmnNH3Ik6hWKZsAVkRT95SjoUbuR75cdyvOsDBZARIOLStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXnfSwcrwDhoap1UnpJx/z48qhgP9KGiN/lXB8//RtY=;
 b=GfHW00S0gNzkAwkFaTK0OrmXZ1kKvJhbI9ShplA5OzTTWxfde1lb1/wFPU2JFL17SJl9AoLLMYLw14XSZor9sUkBKHMkkU2GEoOLqOWeUVCvepinHq03SKSO0epwhmHsrhB5HhF/ymhkbfrMn4XyMgO42TtihW6b8Mz6e+BsP0N8uMwEoFMNf9YtdSww+qJXwK+RTCu+Tkn32uxIeXE9AX78I43gr5sa5jVdEb8GCk/CHh978wzNFK1NIMf4ujs6sH9ypKlf7Cn3/QCKqroWAVp/kOo1m8XD01CdiwuAbpPDaQZM7CfXrh23PKbQsHZiJzhImX3PwDd5DICA4PmwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXnfSwcrwDhoap1UnpJx/z48qhgP9KGiN/lXB8//RtY=;
 b=YiGrX7e4+zxQcVB6yhgaotVnOr3vQMgXlF5+ut11MJarhnPxH5eEnaVMfzF1HtjHpJDSUO1XUvoIKC4Dez5lMMZ4oMWZiyD6WZQBkajEFYuHqOodVDTEPWlIo/uruMDm8eLMUuMeY4F6IGN2yVTD3Sjgv0WEpf9FfcDu1WMl4DA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Date: Thu, 18 Jul 2024 15:41:52 +0800
Message-Id: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDHmGYC/33PwQ6CMAwG4FcxOzszSjs2T76H8cDG0B0AwwzBG
 N7dwgU1xKSXv8n3N32JFPoYkjjuXqIPQ0yxazno/U74W9leg4wVZwEKUKEiGZvRknSukU1MXg4
 gHQVbAZaVRxDs7n2o47h0ni+cbzE9uv65nBhg3v5r41HS1t5mRhvSHk7teD/4rhFz15B/+Ay2f
 M4ec6NKVIWyRn17XD0Bbnlkz6+QtpYqsj+eVq8h2/LE3hkqtauLwni3+mma3pqjfJFwAQAA
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=7466;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=TBvUdxaRTtJ2rOfLPbjcDLhDMxXC0SgBr+8qJdLV/dc=;
 b=zZLWEBfzCbPNuzwzAQaTL9xtCktj2BYmyClmX41XxR6VvbbcKz+byu3tjs/qjmP9wFm75Krn4
 QqgejhtHT1ODbPp5R+U828j8x2/CCFrAIeBjhfZ9XaXPveU6PmAdwI6
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: 18efbe6d-db57-4e08-b64d-08dca6fbda6a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmVmUXdaVUhVY1d5aC9uSGV3b1NMYzlkVEkrdHhmcHlEeFVmVVlMd1g4c1JK?=
 =?utf-8?B?NWhLb2dYRWN4OGQvYzNPZ2hLU0NpcUZCMnN3MlcrOEo5UndzS2xPMzEzQlA3?=
 =?utf-8?B?a3BZcWNGRHBsR1RQQ29WbzZQZ1h0NHluMzFzY1R6TERrN0t5YVZnZU93VHRq?=
 =?utf-8?B?K3hvaWgzSFE5UWw0RzM2VW1JWGp6UG9yZDJGbm0rR0hIWHFoSTFyMmFsWlBN?=
 =?utf-8?B?RC9PS1hRVEVqNEdDb2hYVHVCa0ZKME5VRHloWFl6QkJZWDh1aFQ3MmZwcEY0?=
 =?utf-8?B?d1FNRkpIM1ZpNDAzbGl3MFVkM2JRckQwWFg0RTRsOVJlME9COGlmNjhJSUZS?=
 =?utf-8?B?L1NQYWFhVmVtdElRcXRGREk4L2QwOXFWTGdNYW9PV2oyUC9ucE8yNGZqdzNy?=
 =?utf-8?B?bloyYzNIMjNSaWJqeGpxNlpWVTlQcXRJRDlkUnd1L2VXbXVGNUYxK2xFYmdF?=
 =?utf-8?B?aEpoUEQzOVFhMmVDemo2TEdaSUk0dmcwQlFnL2kyQlYrYjUwVnFpWHFhZ3Fr?=
 =?utf-8?B?YkhYZWhteXBlalJLVXpPb01OL1JKcVZTUkY0R2Yyc1NHVzdPWWRGb0c0NklS?=
 =?utf-8?B?amVLRENhWlZKSW5HNjI1alpCNS90R2FOdWVLL3NQYnB0K3JpMjJEU29GOVhQ?=
 =?utf-8?B?RDA0NUtiKytiWndjYzBEQUJ6TmFnN050UnlPZjV6M0lCR0Mvd0lyR0lvcGRO?=
 =?utf-8?B?VEpzTnBDL0RBbDJMenl5YzZrTXRpOUJsRjF4R0lLOG1vN3NTdnhWbmZrRnFQ?=
 =?utf-8?B?OTZSakRtdWNkNWJWYkE4Ny8wcXczaXpWVS9rYXU1MlhVTjNuMUljZVBqK2NB?=
 =?utf-8?B?UlFjVXN4cU1mYkRPanV0U3o2cldGaktJMm5GMWUvYXQrUWV5Y3ZieWtRbUlT?=
 =?utf-8?B?SnVzckZGMUR3RzdCQnBKZVBUVFFIWlYvdFZxY3AvSUJUVkpXR24yd3VOc21X?=
 =?utf-8?B?VUlFbHRvdFZKTEthRll5N1JHTjQxR1p1WGNkZXB5bTBKaVdXR1N0WGhveHRS?=
 =?utf-8?B?aDBFOWVhWE5mVUtiVGhvR28xc21rR2ZoUDcrZTZaa0xVQXQwejQ5WmJLd1p2?=
 =?utf-8?B?ZjZxUkJsWGx3NGMyOEMwWWZuR3VaZjlvTy90T0lCclZRdmw5MGtrVmdKUHhJ?=
 =?utf-8?B?RlAweWJQbmxhdlhkWThBMUxmM1JvRlUzV09Jck5qSDZ2R01WazFoSWREU3hS?=
 =?utf-8?B?ODBuM3Jld2pybDVJZEx0ZjZnQWRZalhRR25SQVl5ZnVDQzJOTXZNZEIzMTM1?=
 =?utf-8?B?NXVHbk5RV2xLTVdtOWlWb3lhRFZ2SHREeVpLRWVSdjNZeVM1VFFWRUlQL0dH?=
 =?utf-8?B?eHNyN3VZRHQzdFZxZXZTczV2dWxZN08xczBiTFBOVlVqSCs0OWtZa3hudkpZ?=
 =?utf-8?B?emM3UkkxY3pRWllkVzVjd2UvSEExMU0vYzUrUmw1N0J2MDNCb3pUVStWRHBu?=
 =?utf-8?B?YzZtVDhwV2l2QzJjZFVieTZNT2wvLzllNWE5aktmT0FUSnJFdTRlVjd1NFJt?=
 =?utf-8?B?RzFlZVZWVWZKdFRucHpZVzVXb2NMWExNSjg1Q1ZnMkZEMkZFaFQzcWhFQmxZ?=
 =?utf-8?B?WklPZ1VDN2x3SU1QZ3BJb2hDbyszWGpuekxPNlFTZDUzZ0o3eGFNeDBteDc2?=
 =?utf-8?B?WWg1eVFZZlpGRjd6bjNxajh4eEN0bGlFWk1jc2srdEU3MjBEbEV3d3M1MHlp?=
 =?utf-8?B?dmhhNTlNQ25CNXBJUkVCUEhweEZxdXphY3BDZnpvTUg2WUt5MWVESEpsSytp?=
 =?utf-8?B?TktJZTZHS3lPUGRxOG9FTXcwSUpKNElQeUNMSlNxSUJKdS8rblFBbkwrS3pM?=
 =?utf-8?B?Q1R1RlVoME5LQmVNaEl4S0xHeUdtK3FCK0VNbnhwNmc1eS92dDliVTFtc3dP?=
 =?utf-8?Q?i5f9WlwO2QHce?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUlTWWYwWlA3ZVNEOE84eTNnK0ROS1dnVkk0dHVrY0NSOUwwYkFhM21SVzVM?=
 =?utf-8?B?cmZSaStLaEFWbUdHSWVlM1F3U3NYNXpYdnAyc2hieGZxTmYwbHlGTHZHSE1j?=
 =?utf-8?B?dWw0ZTFNOUVPOFlsTW5yTTU0dC9RWFFwdjE0YzluRmFHMUxXbXJsZFhVWitK?=
 =?utf-8?B?ckMrbVlBSnFmQWZ5VkFsZjhiYUpROC9ZdUVxQjB0RGwydEhadWhLTXFRMXAy?=
 =?utf-8?B?dzAxTXR4Wjh1enN1OU1JbUt3RFpYOW9Ocno2R3dWL2VsTVVaTjN0THorelBx?=
 =?utf-8?B?ZnBHemgzeXkrRWVEQTNPaTRZWk5qY2JUOW9JdzhpRkhHK1JkVXB0TlZtSlpW?=
 =?utf-8?B?S1FhbUVMQ1ZDYjUzMTdWMDdrZTE5VjlyWHNtdkQwM2l0YTFIMHNMU2NJVnBH?=
 =?utf-8?B?OWpBb0Vhc3JRK3BtMGI0R3p4VmNoeGd5aHBKNFVFQWpQWDNTR0hXQ1Nnb3JZ?=
 =?utf-8?B?RmY2a29Eb1RFS2kwckJ1MER6SmY2YTBhS2FlSWMxS0xEK3VRRVBkSFVidHNz?=
 =?utf-8?B?K252TzFHcS9rb0VqU0x0a01vTlEzKzVnTFlGdGYxL3NidmVqcVQxU2JXMFM4?=
 =?utf-8?B?RUZJRXJ5Z09TaDUxYzJEYTZ6Z3U1VTE2UzN4NXFSUDl6Z1pxMFpjVTJQY1A3?=
 =?utf-8?B?dHRYTFNsMmNMT1ZLcmM1cU5EcUxRLzRLRUhBSkFjejJBMTdrUXRIS2xpQ0U4?=
 =?utf-8?B?UWV1aE1KVjRWQ3ZDeGNDMmZtUXlUbEJSMlp2dFpIbFg4UUhzZUNIVStqNTYr?=
 =?utf-8?B?SDNiK0dmd2Y0OXdlb1VEK2JIclhWbWZwaGdQLytDMlQrcExJQnl1WHdteVpI?=
 =?utf-8?B?MGVTSjZhaEdITjFxWlhGV0Z6UDNOQUN5a1o0cWtVcmZXRmtoNitkK2Rad281?=
 =?utf-8?B?clJSKzlxL2dmMVE0NFFndGtrUEl5R1ZKcVZyUTNOQi9BdjBJQS80ci96MFpZ?=
 =?utf-8?B?Q1dEU1NlbTVEM2VuOFoxR0pyODBJZnFYaUFCUUg2V0hwZ0FEeGVBTWVCMnFv?=
 =?utf-8?B?VmtkemRYS0p4OE5RMkRwRXE4a1JVNllnckNwOTZFdk1xQ1hQRnFmTngyd2w4?=
 =?utf-8?B?Z1pTUGNQT2ZOMVBxbEJVTzRDKzEzMmNQdDV5eEYycitiM1RQdUNZOForbHJk?=
 =?utf-8?B?ZU5KdFpYayt0NWdwOTN0ZWxLdGh3MWxlR2xIaTJPUE9sT3BteHRpYjQ0NmtC?=
 =?utf-8?B?RmZvS0RyN2MwdVZwL0xocFIrR3ZkOW0xQnNFcFkxbnlROWI1UU1kQU9RUVJW?=
 =?utf-8?B?MjJIMFc3andBMVp2SXAwd2srMFRJYm1aSWVhWStVS1BSakxoS1NQaXg5emZw?=
 =?utf-8?B?Z1NnMEsxUlpYM0xHUklkTlF4MS9NZUxpNEdVc0FBcjZaalJKeTg1VnFlbnNw?=
 =?utf-8?B?ZTBzaEJieUVkR0lmQjVLdW9sRFhnK0ZZRXRYNmJGKzdXL2NtRU9nYjJyNjJz?=
 =?utf-8?B?YmVKNWhrMWszOEVrOU5ISUVQTys2SDdFaDZPd1lJd0NIQnpTbVVnM3RjQlVX?=
 =?utf-8?B?Z0pEalVEcklsTjAvTGNHNmNTb1FzcDZ4Sm5sRmtLT0QxRVRSSHREREVES3BI?=
 =?utf-8?B?d2dlRXZ5cDhuK2grQkRyYVp0VzhGNzJELzZ2S2RnMjNPR3NCL1I5WUFMUVdk?=
 =?utf-8?B?dXRneE1DdXh2RlZxV1Robjl6Unl1MWx5OU1GeW9acm9HZmZGMDQzVUJRckJ1?=
 =?utf-8?B?a1NJWGRiWTZLa0duc29haW9OKzI4WU1iK1AyNDBUaHFWYWlrMFlGekcwNGU5?=
 =?utf-8?B?SEJlRExzSmRQRXpBMHN0NW5WM1VPRER6WTh1WTFWM3d2WUpmZU45aGFQV21p?=
 =?utf-8?B?a3FEeEpaRzJDRWtIdWVSZnl6Q1I4blA4NEFEL2UrWkRpc1RwUzRSNWluQTR4?=
 =?utf-8?B?VGEwU2g1a2sxc1dzS1FuRlNpUytsYmFFNi9IR2NiQnlIanJPZGZsS1ZtYlZL?=
 =?utf-8?B?UWtCZHNWWjVVQXd0b2tXMEZ0Z1NYUzBETUt1OVE5d1JRa09oaCtXQkd4bnNj?=
 =?utf-8?B?SjZLUWR1eXFwc25DSzcvU2h1RlQyMnF0OXJWSFduRHczLzNnOWUvU2tWT2Fz?=
 =?utf-8?B?OXpiN0JHdU42NlcyWm8rVGw3N1R4Vm5VdEo2QnREOHkrSzU3YS9Ga2Yrd2Ju?=
 =?utf-8?Q?7rcFfBhtlCXRKovfATp0acmd6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18efbe6d-db57-4e08-b64d-08dca6fbda6a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:01.3326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibL1Mhilr4rII6ifK4JgBUAZguM9x5dgBPLPxBlaUBgr+LIXJPGFT4zZJXXmsEndae7017nq2wHIOzefoY+wcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
To generate html from the repo: make html

i.MX95 System Manager Firmware support vendor extension protocol:
- Battery Backed Module(BBM) Protocol
  This protocol is intended provide access to the battery-backed module.
  This contains persistent storage (GPR), an RTC, and the ON/OFF button.
  The protocol can also provide access to similar functions implemented via
  external board components. The BBM protocol provides functions to:

  - Describe the protocol version.
  - Discover implementation attributes.
  - Read/write GPR
  - Discover the RTCs available in the system.
  - Read/write the RTC time in seconds and ticks
  - Set an alarm (per LM) in seconds
  - Get notifications on RTC update, alarm, or rollover.
  - Get notification on ON/OFF button activity.

- MISC Protocol for misc settings
  This includes controls that are misc settings/actions that must be
  exposed from the SM to agents. They are device specific and are usually
  define to access bit fields in various mix block control modules,
  IOMUX_GPR, and other GPR/CSR owned by the SM.
  This protocol supports the following functions:

  - Describe the protocol version.
  - Discover implementation attributes.
  - Set/Get a control.
  - Initiate an action on a control.
  - Obtain platform (i.e. SM) build information.
  - Obtain ROM passover data.
  - Read boot/shutdown/reset information for the LM or the system.

This patchset is to support the two protocols and users that use the
protocols. The upper protocol infomation is also included in patch 1

Signed-off-by: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-rtc@vger.kernel.org
Cc: linux-input@vger.kernel.org

Changes in v6:
- Add R-b from Cristian for patch 2,3,4,5,6
- Add a new function parameter 'bool enable' to rtc_alarm_set in patch 2
- Drop dev_err per RTC maintainer, move devm_rtc_register to function
  end in patch 6
- Address Cristian's comment to documentation. Also moved the
  documentation to patch 3, which adds the imx.rst under
  drivers/firmware/arm_scmi/imx
- Add remove hook to cancel_delayed_work_sync in patch 7
- Link to v5: https://lore.kernel.org/r/20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com

Changes in v5:
- Collected missing comments in v1, I not intend to miss any, and sorry
  if I make something wrong.
- Update the documentation per Cristian's comments. Not sure we need a
 new directory for firmware stuff, not firmware-guide direcotyr.
- Added R-b for patch 3 "firmware: arm_scmi: add initial support for i.MX BBM protocol"
- For patch 4, added comments in scmi_imx_misc_ctrl_validate_id, use
  num_sources in scmi_protocol_events, move scmi_imx_misc_protocol_init
  near init, use get_max_msg_size and drop MISC_MAX_VAL.
- Separate the sm-bbm.c into rtc and key drivers with
  each has its own notifiy callback, put the driver in rtc and input
  directory, handle error return, add kconfig for each driver, use
  to_delayed_work, use READ/WRITE_ONCE, still keep ops as private,
  device_init_wakeup set false if failure.
- For patch 5, Add kconfig for sm-misc.c. Only support one instance, so add a check
  ops in probe.
- Link to v4: https://lore.kernel.org/r/20240524-imx95-bbm-misc-v2-v4-0-dc456995d590@nxp.com

Changes in v4:
- Rebased to next-20240520
- Added vendor/sub-vendor, currently the sub-vendor is "i.MX95 EVK",
  this may not be proper, I will check with firmware owner on this to
  seen any update. please still help review other parts of the patchset.
- Added constrain value in binding doc, change the property name from
  nxp,wakeup-sources to nxp,ctrl-ids to match firmware definition.
- Put i.MX code under new directory imx/
- Change the misc event from three to one, the code in previous patchset
  was wrong.
- Link to v3: https://lore.kernel.org/r/20240412-imx95-bbm-misc-v2-v3-0-4380a4070980@nxp.com

Changes in v3:
- Update cover letter and patch commit log to include more information.
- Add documentation for BBM and MISC protocols under
  Documentation/firmware-guide/nxp. Not sure if this is a good place.
- Fix the bindings, hope I have addressed the issues.
  Drop imx,scmi.yaml.
  Add nxp,imx95-scmi.yaml for NXP vendor protocol properties.
  Add constraints, add nxp prefix for NXP vendor properties.
  Use anyOf in arm,scmi.yaml to ref vendor yaml.
- Use cpu_to_le32 per Cristian
- Link to v2: https://lore.kernel.org/r/20240405-imx95-bbm-misc-v2-v2-0-9fc9186856c2@nxp.com

Changes in v2:
- Sorry for late update since v1.
- Add a new patch 1
- Address imx,scmi.yaml issues
- Address comments for imx-sm-bbm.c and imx-sm-misc.c
- I not add vendor id since related patches not landed in linux-next.
- Link to v1: https://lore.kernel.org/r/20240202-imx95-bbm-misc-v1-0-3cb743020933@nxp.com

---
Peng Fan (7):
      dt-bindings: firmware: add i.MX95 SCMI Extension protocol
      firmware: arm_scmi: add initial support for i.MX BBM protocol
      firmware: arm_scmi: add initial support for i.MX MISC protocol
      firmware: arm_scmi: add NXP i.MX95 SCMI documentation
      firmware: imx: add i.MX95 MISC driver
      rtc: support i.MX95 BBM RTC
      input: keyboard: support i.MX95 BBM module

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   5 +-
 .../bindings/firmware/nxp,imx95-scmi.yaml          |  43 +
 drivers/firmware/arm_scmi/Kconfig                  |   2 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/imx/Kconfig              |  23 +
 drivers/firmware/arm_scmi/imx/Makefile             |   3 +
 drivers/firmware/arm_scmi/imx/imx-sm-bbm.c         | 379 +++++++++
 drivers/firmware/arm_scmi/imx/imx-sm-misc.c        | 315 ++++++++
 drivers/firmware/arm_scmi/imx/imx95.rst            | 886 +++++++++++++++++++++
 drivers/firmware/imx/Kconfig                       |  11 +
 drivers/firmware/imx/Makefile                      |   1 +
 drivers/firmware/imx/sm-misc.c                     | 119 +++
 drivers/input/keyboard/Kconfig                     |  11 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c            | 236 ++++++
 drivers/rtc/Kconfig                                |   8 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c                       | 162 ++++
 include/linux/firmware/imx/sm.h                    |  33 +
 include/linux/scmi_imx_protocol.h                  |  59 ++
 20 files changed, 2298 insertions(+), 1 deletion(-)
---
base-commit: 6f051fea82cb6d99f0dc4db6cbe44d64eb066adf
change-id: 20240405-imx95-bbm-misc-v2-b5e9d24adc42

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


