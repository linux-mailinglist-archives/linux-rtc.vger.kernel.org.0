Return-Path: <linux-rtc+bounces-1640-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914E942EEB
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA8C91F216A5
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409161AED41;
	Wed, 31 Jul 2024 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DhMdW3yD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8718C91D;
	Wed, 31 Jul 2024 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430040; cv=fail; b=W3JVtGS8pms2WY8xHYOiP1EU3Y4O5RwTOSZndms3wn3SGKUTcfpfNV2QdTcLVXjwg3Hm9J3YcunXGLV9gay4ShPL5KBD9tyThNnIbRqVACPenjxdoOJhwc5WfcwNYJojPrSiqSSYzy1Tyh1d5tCbwNiwgZV1VKeLDanD329GflI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430040; c=relaxed/simple;
	bh=U1Pvyil0Rz4WgPWCY+cBir6YSDAQlor0vSEiRmM0I84=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bEjQHtfsX/ulohR3/Oi7EF5Cp8L22kvKsXsguTwLmHGrA7/mTGB5HHFFyRAb0BpLfkUE4m+9brwCR1zaQ8YdjFVII/6oIJtJ76hFpH2cle4tokDsoBYJHVJtpPMPOPCuQjmlI0KTYVBSUN2W2fUm9YhxH600MfHJfNz+EZxsSqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DhMdW3yD; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYLEgwoxROXI19uPM11i+aU/KEka0oYN45qHH95H6Sjw7I9X3HiKqTuRSNC8bTi/a1mpf2hmYVLo4iuRW+sWJwSjaYBMcov8uF3D4sqesMGXuVD2y4Kr9Lei3nm61EcRSVr9SkueTDVTqtfVdc/QjaQgbiJ0/7/GtFMveV7HrOw3E5X/oBTtMi1pQ+1w2nvQZ5ZhbPjGWFaJSng+Qymvl1L8Uf/rVT7EBTTwLD3jt8wCbeg4oxVJkb6ZqX/JL/OPNSFxdGWJvW5s6TjzfM0ik4C9J4zfvqSu5iv7dkFiRPH/P8ycaphDPuqnKnOBEbAMgt5iEkppEdx+9fLLWqMlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRQeRLABaq/sRZYeE4tsRGYN5DSuwYxrVjdjmU/oY7Y=;
 b=Zn5cxbabMyOPufLQp2YtXpdXD4YG1P6Sb1avLp2qvDKZRcpD+dlfRba150+gI9I7Ae/53X5qx/xKWqSl1veoFc12ID+9vd0C0WmZKrp7qYsRrsfVHytpuszujnlNRex1SazR4mIhkP9x4BpcqEBD0GWQj5Txu+rgvSI5hgc5mMkQ+HbXO/xDd7PGQ5zfBkZNAoqB6B/1zj1ZElGJVtY5u8QvgoNerIsHQZQRXKssdZ+Ta9c/m/6RQO+Qq3Ymy8gPF+m8LAuOOBMrTnJifCRuRPzOKYjBOCjeFDJ0ZmS1owJJ8CSfAA3esiq9QVND0Z9ZaCsMaRrt9i2KAYrvQsLWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRQeRLABaq/sRZYeE4tsRGYN5DSuwYxrVjdjmU/oY7Y=;
 b=DhMdW3yDUll+lzh/9g2WBbup1c54VPffjuWyGwzr05IqFtFzvxyIxXenD+tzDisUjHPrXGFfpkKPWsGClPTafHuvhKvRpkYM4hkJi6QVHY5EML4qx1M2P9BeqgLVARFLMSJkFcxHtwqFt37R8PUXRVf5xrpTHxWS8Z9MDKVndPWzzgXfCTlKDzvToJA+3LDCabA/Ul50aurq499vyybul+smZFTIVGwR8OSM02Eu07ZQxw4WI3iN86zEsQJnppw9GUE4bqYX1reBwNaXfJ+L4+pn7sdZsUwYcj8jpCy/kCvQqtc1cUdtPFkcP9qMwnl4DAX55217rlvzdm10dbcIWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Date: Wed, 31 Jul 2024 20:56:04 +0800
Message-Id: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQ0qmYC/33Qz2rDMAwG8FcpPs9DViT/6WnvMXaIHWf1IUmJR
 8goefepvWQdYeDLZ/h9QrqpmueSqzqfbmrOS6llGiW4l5NKl3b8zLp0khUCEhCwLsMaWMc46KH
 UpBfUkXPokNouESpx1zn3ZX10vn9IvpT6Nc3fjxEL3n//a5MHOvQpGG8924Rv43p9TdOg7l1L8
 8sbPPKNeGo8tAQOgodnT7tnpCNP4mUVtiFwx+GP591bNEeexUfPrY29cz7FZ29374w/8la88T2
 Az8bKZXe/bdsP4clo9bABAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=6894;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=U1Pvyil0Rz4WgPWCY+cBir6YSDAQlor0vSEiRmM0I84=;
 b=y8wdsZ6GY8ah9iIs43EWgbS36OliYX7L5KyRfaXBBmq7Egluz69jbRi4WyaAZ4HADWOYfdTs4
 oRneea6SDzjBqO7rYz/d5V6VMATFQy0RBr2Br+4r+jBbqjr5NldtP76
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
X-MS-Office365-Filtering-Correlation-Id: 5e2b8b14-8b9e-4c14-b89a-08dcb15ee694
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3p1WGNLZ0hKQmxLblpVVDlVY2t6OHFpYzV6Mzd2Njk5ck5ieEE1UmZ6YkIz?=
 =?utf-8?B?cGRNbW41cE82UnhpcGo0cXF2U05ERUQ3YUJnSnRTMmJTWExTczE1blBlK0Ro?=
 =?utf-8?B?clB0QzFnL3loaXNVZThDWkg4SmVncGFYL0lLOHVmcVMxRW93RUJHenBsdVBG?=
 =?utf-8?B?VmU3MW9NdUhscjhwdEtrcEFZWVJMVTdoZExCdFUyY3E1Q00yM0dxdm9NU3RT?=
 =?utf-8?B?YUQyaGV5bFVOdHlmTmErcGgzeHM5elBlc3hsbkc1WWNPS1piSllqTXBnYjF5?=
 =?utf-8?B?bDRJbklTSTZDRTNDbEw2cStSNVJjemFFQWlsb1pJQXo2dm1aeXBQalRHSkJu?=
 =?utf-8?B?VmxwajUwNy8wUTFtQlJnN0RaWmhtYlllTTIxZFk5QWV4Qk9OcXVmeDFNVThS?=
 =?utf-8?B?SkdwbXFVUFptNUY2Mkh6ZHVhY2NuZFBoVWJnQXdKNmljK2RjbTNNbUR3ZE8r?=
 =?utf-8?B?ZWs0UTBkelFTcHhJUVpYMTJoZnNHOTB2cXVlVnlMb1lrc210elpZdllEamo4?=
 =?utf-8?B?cnltdXhyVmcxejdONmg2d0l6bW1oOW1zdUJhTzNPS09IdnZrWHd3MEMwWGIv?=
 =?utf-8?B?N1E5NCtjMWN4bU1vMmNBK3l2NDRaNzRud3EzYXRwS01ibUxvWkkxajZhUFFh?=
 =?utf-8?B?R0djUFIxMW9oNXlwMW5NdHJCM0pZY0JSMHRrM1BZRG8yOXB4TGpBc1NMd2x6?=
 =?utf-8?B?VytnUmp1bmFJRHJEcjJDNHF3UGF4NUREOE1aK213dWlxQ1MzQUdndVRiNWlB?=
 =?utf-8?B?TTltZ1VJQndxS205R2wyWWZyVkNWTDRxSUtrV3dyblZwS04rZFFiTEZHZU4v?=
 =?utf-8?B?T00yeDVXQ2FZMXpWVnd4Y0dESjVFcVhUbmJBTWJ1VlVDbTBFVEFKdmdNNEV3?=
 =?utf-8?B?S3FyWWIzc1o1a1dIdi9KL1Vad3ZZWWxBRkNsSmx0VHRnOHNhTFlCdHR5UkVE?=
 =?utf-8?B?UjMzQlUwK0RBVlFaYTl5dVVvZTVIb3poYksxRU1DdXB6OFNTZkUvZnlmTjZJ?=
 =?utf-8?B?c0RGaGgzM0tXTTFZbVJPUWtuNnVLWFA3eDJJcjM0VHlDOW16UElvS1dHcThk?=
 =?utf-8?B?SDBubmhEZXpwS2lUMGZ2VERiMjNYWjVGTGNNSFRBYjJOUFdhS3JBaHRlWGlF?=
 =?utf-8?B?dnJWQ003Y0EwekVHN0RWRVBVKyt4Mjg2SDkwbTdaTmlkSjhCeWhWOTc3cjRu?=
 =?utf-8?B?bUZwVnUxcGxKMFlwNW52UUNPTmdDdW5PU244cmlmLzZUZHpFL00rcExHYk5J?=
 =?utf-8?B?RUZBU0VPWGpQaTE1Q2RQblFuamZuS2FkV3QybjJrb3pxcFNnZWplM3A1MThj?=
 =?utf-8?B?cnJxQmM0ZzRyOEh2b0tOWjA3aTZPOGRKZy9CbmY2akRuaDhkM3FXY0l1UjZR?=
 =?utf-8?B?c2hWcFhZZVdMR2tCNkZhcTB3RUNvOURmcDUzaXBvcmIwQStNZ1JIV0RDcTRD?=
 =?utf-8?B?UXZrL0pWR3RqbHFMbXJmZG5HdTgvamZ3UFg4N2dEcDE0YjNsVW5nNE53dGZO?=
 =?utf-8?B?MW1JeTdZWkJZTjNEZVp3M1g5RDVHMnhkOGVIRmtTUGtvazl6SG9mcVhKeEpR?=
 =?utf-8?B?QTRtZ04vNkJPRXdaNVRFc2ZoRUtMekJTZnBBY1Nlc0FLYWtwajhaQjh3Wk4v?=
 =?utf-8?B?d0x5Q210SHgvSG9SZm9WY3dGUi9POFdKZUFjUDFhbmM3Q3VDaHZDT1gydjMv?=
 =?utf-8?B?Q2liY1dPNzBIL3dQeHlmb1NCbUc3Y2JETituelJ4QXIyQmtTa1lwd2hkaTU0?=
 =?utf-8?B?WUN0QU16SHZqa3o0b0ZQaDd4Y0tPQzJrR0ZWVXVBcEZvUTU1M3ZCbDMrMzQ5?=
 =?utf-8?B?bFlCU2Q3Si9hbUI5R1ZrYkxNNDVkS2UxaVBpTzNnU3lLUFJ2aDZOcXg0MWQx?=
 =?utf-8?Q?a4Ey9VHWd1h1p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xhRVlkQ1pidFFzT0FxVEFNTDh6dDkxS1dhQ0ZCbC9lc0J6a1J2dWluWWVs?=
 =?utf-8?B?NkJxcCswYzZmMWZzcDRZbzVSTERBZGlCc21uelZ0UDk1NFI2bUQyMDhBeU5z?=
 =?utf-8?B?UGhxNGV5QXVOd2pGWHUzSWNtMURaSUxETHZldUc5TjBXY0o3ajJqZkw4V254?=
 =?utf-8?B?SDdXVmZLVzBrbWl6WEtnZit2UlJPQVNlempyTGpqUDZPbXJTaDRPaVRaVEtj?=
 =?utf-8?B?SitKZWEra2VGN2JHMUtDdkZFQmU2SVNkWTJhRjNDZjAvN3VVTzY1MWFwVzVz?=
 =?utf-8?B?N29KNnBRNkJQd2ZoZGd6dWhxMHVTcVZ6Q2NpSTFTUGJZL0hqSnlHZ3d3OHYr?=
 =?utf-8?B?MFA2andCdnEvSUtiTGxXTXV0TEhtVGdwemE2K1VmdHNZNllWaFdjMTBQRFFJ?=
 =?utf-8?B?T0dVTVFkT09RdGcvNEZCNkdZV3dCZkRGMHhvaGV0Z0hhRUR2T05IQ1FudXNP?=
 =?utf-8?B?MHVTRy9SdmlqRVdtVFZ0em9TaHRQUTdZbE9iWDJFL3NhSDdTd0F2bERDaWls?=
 =?utf-8?B?bzZHc3hkYkIvTmNQWENuMGhta1JRNkFwWE5hbFd5NHQ3d0FmekgwUGNTZHpV?=
 =?utf-8?B?VUFsYTUxcnpISDJtbFpmMExJZ2pGL1dHWXNwWU04RzRTVStpUEJwUHZ6KzEx?=
 =?utf-8?B?UU1GRmFrck94ekJjR2hMdkduU2dKS2ZSOGRqeklIeHRrVGh4QmhxaDltWGxU?=
 =?utf-8?B?UmJLRGVPdndhL1ZhcExtVHF2R1F6ajk1NTNSWVVCTWQzbVp1UDNiZVhmNkJ5?=
 =?utf-8?B?Vkk0azBUbEtudmlkVkxaRWdGcTV5Y0dMMm13VXhOWGo1Tk9kVmdpR3VLSHQx?=
 =?utf-8?B?eDF6TTVpdEs1L3ZBb2taU3NoMDROUjZzb0tvODh2dndCb0MyVGJHMzBvbjUy?=
 =?utf-8?B?ZURhYXllclBvV0hKM2pFbkI2bmRGUG9tcHl3MnRaM29ockpXY3N3NG5TdHln?=
 =?utf-8?B?SlRaWG1BaFBaa2E4WXFqeGZFZmxTQTcyVXU3cWRYWlhxeEtuUEJMYXF3cEVx?=
 =?utf-8?B?enVXaldNZnBYdTAzTnRvd2tNUlQ5cXNCM2FzM1VhL1BQSEVJbVdxTlRXQkl0?=
 =?utf-8?B?WldsOFRoaW5TK3hxLzZiVjRCQS95VFpCV2ZWb1ZMYjlTTXl3K0M0OHVybFRx?=
 =?utf-8?B?ck16K1AvRFJ6K2N3Uno3dGVxZ1h1UU1wZlV4QnZxZ0YwWGZTYTBESmNSOHZZ?=
 =?utf-8?B?eFg4OFhoNTdHUzZoUTQvaEM3ZlVqRFh4SWtnNTB1bjVhejJ2cjRuaTZ2QUpP?=
 =?utf-8?B?dGZ4L29tdGhaWUdDWmovaXVaSm11ODFRRTVjckh0S0NKTkh0ZzN2Y1pFVUlm?=
 =?utf-8?B?cGZVRCtmSVIvblIwVmVYZmRadzl5REQrUnN3aWtPSS9UYm1Cc2xmak5TYTY5?=
 =?utf-8?B?ckp5MUVWcHpSVDBWY1FJcktoVlk4RFZJbC9KL2tGeUFURDBEWHRoYVRuU1Zv?=
 =?utf-8?B?U0g2RVRWb3NuTWdqblhFaVZGVVo3VGRUaGQ5SG83MGRlcXdTdkR0Mm5mYmVt?=
 =?utf-8?B?UmlJeW9kZStYelpiNktwWGdOZUxaRWRTQmcwY1RZa2xwWFNwYWZrR1dSUGdu?=
 =?utf-8?B?cnVkQWd5SlAvdEwyazRUang1RTlWQWJNZklSai9qYW9PUHA5MndiTTFheWhy?=
 =?utf-8?B?Zmt5SThVeEdXZlczZGF2UEFXbys4VlJzclcwcUxoT1laTisxbXpma2RhYjdt?=
 =?utf-8?B?aE1EckVYdDFGUnVheW5VbDlJdUxncWsxNW51OXdkOEJQR05jTmM4WU1PZVRj?=
 =?utf-8?B?VmVYZ1BybWczcFdtYS9sdnN2TlhNVXFURFZwdDJ1RTlkbDY3K1c5ZWY0em9B?=
 =?utf-8?B?SlIrUk10TVd1OCthVjhEbUI3MlZzbzA2d0pmc1BmT2ZhQmFHVnZ6Nk14Nm1D?=
 =?utf-8?B?T0QvRC81NWRjRlpwZkNRQldyOUdxWnFLdldHSC9QUnAxaUNBTHpXMFJWV2Jr?=
 =?utf-8?B?clA2S0QxTS9sOUZNOW1md21NWk9hZVFSZDdFNldWNGN6c09vTC9jVGVKa2Zj?=
 =?utf-8?B?MUdRQkpkZUdwNlN1QVM0Sk0zMzByODAwT0VxbGN1Si9KcmI2Q2puZG9lUTRy?=
 =?utf-8?B?cHZiUU0zT25GUmRNU2hEeVlTZWcwWVNKOUJORTBxNHhaUTBEdEJJNDRKM2RV?=
 =?utf-8?Q?9TbMTlDfDvV5rZhKh/jwA1x8G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b8b14-8b9e-4c14-b89a-08dcb15ee694
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:13.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lcs/c4WnZJRpx8yDZZO9TFoN7m5tOqvyRq+BjEfiwl60MEWmaCOvxMUtou2uBB1D8WIQiW9KkLV0wUvC4H/dpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

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

Changes in v7:
- Just correct R-b tag from Rob to drop quotes "", and rebased
- Link to v6: https://lore.kernel.org/r/20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com

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
base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
change-id: 20240405-imx95-bbm-misc-v2-b5e9d24adc42

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


