Return-Path: <linux-rtc+bounces-1644-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BB942EFB
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0222882BD
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E608C1B29C2;
	Wed, 31 Jul 2024 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kiTz3pUj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013028.outbound.protection.outlook.com [52.101.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779501B1409;
	Wed, 31 Jul 2024 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430062; cv=fail; b=G73smblPZike1s1rluvdOqZRnDEkBrrDjXLEEt1HG+0a5NLAVm8uLnPrdrZRpjNDI2QrQsajETrSKtq6uAAtJyqfolBpPUqWU6Ha4LAD/yZoH0dPLpjlVEP4OXsJzD0903mWgPi4GGS4Hbk0Od+S2hqdWpwY6PMEARVNwn7demE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430062; c=relaxed/simple;
	bh=5R7x1rhj1TYPjKc6u9bHCeGcNZSKvIA3B92jHkks3vc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=goL8+GzQRVncXpV6fS5miTRY+PaFmYkrkObojPICGDVcgKvhNOBCM+LB6WGqci9Nc8z/NHzEfi/HySDQZ7OrpMtRMJr2an3kk3QahaSJoLjtiSY+15JoRRVgsGH1Y5NFbLDCB+jbhO+qyiRLeSG9Vjk5+mwNjtEE46eyBUP+Sno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kiTz3pUj; arc=fail smtp.client-ip=52.101.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC56I8gEfEbsdR2ZGVHI6KQe0Zlt02dTn71S6TXUahzRSYN1X794GfAuP36ZICX3HhdU2yycvzRkrZniRkTpS80759upTid/6U3BC+tfTqG7xtTVO9e5/ucCFxUQo1WjJ7O12OPV9j7Wo0sE0io+BPqVj79qzjgxahQnEy3nXiZHrBaG9mTRwk8+5zhnR0UI+LhNTtBh4ZuDuQY7jNyKMpWxSoVX0L9Nn7odoUEfj0OxzEi90eNrB1WwKPAkrx1w8XZJYn3nXBgTcibzD9NURshkWBZZDgffrwE3jr2M8Drh9yapuefQYSLxYNDN+Nrx2IObI+RDDREur6pmHrRsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKqRmRGJCU2bjse9FkKJJPqPuq+AJgTGg1aQq7hRCcE=;
 b=vAul+An5FvcL/5Kkeu2Cdhk/HY7rf08WLReKoeHuyPprs7s7QBRz+OVzZRSwjD7oU/QeKU7ds2rNVMcu6c7sWpCu0gkGLB91+quVLaG5EX/nz9ARBEAQzDSvTiSd/MzB+Z3dDzyK9xOqz2ZeGdUj+dp9xKrTIiZheShTL0rYNNnmAlFD5FXeJhZ3XXbw4dQhWZJZW4rxp1FI2bd3d3K19dTBec3NAM3OrrSpTZx15jgMmzNmJaeQOll1z5u402IAOnzVWjKVsvMyh2Us4ck9kph0wD5gbb+RnlDprL35YLhsomcytS5iZXCgnst9U8WNJ1k3BrqzUq5gMuP2R3V+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKqRmRGJCU2bjse9FkKJJPqPuq+AJgTGg1aQq7hRCcE=;
 b=kiTz3pUjhmvYLFQuqPhVnkAKYrep2tz+gL6qfp73E6/OYIJ2C0X97h7o+73bkhIt8acWFJGrcEkS75quemhX9s+AMedtC1sm/ng1ViFiCkOOHmxYrb5v7K48IbQxZT8g4xj/ksytShazF3iJguvPlG5Y8yQUsf22ed8dQyK/uucL/v10ar/cirxr/zLxWTVLwDHg/yO72ZMcnGkPOumANA+lNfqqkJ/uDbzFNAvE0fhQ6glBzDlbIZSTNalevD4kp1VVwL4sGFVweEpio+JAOEhTgOdF4Ks4KA6u1E8vple4ojohvVvkVh0Uq5MvyKDcLiYAmynW3259bFW77hwyQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:08 +0800
Subject: [PATCH v7 4/7] firmware: arm_scmi: add NXP i.MX95 SCMI
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-4-a41394365602@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=55298;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=awGI47uCRhda8RgNOE4cyUBLlzqkWBO1IIkfhQqujqA=;
 b=kWvPL8nSpqwCwK7judF9pnJqadBCYy+rs0fZpkY2MtSjBXl05EoLLtfNSBR2k6TdiIUVtFG0F
 /twmRmTAbwWDFP47tX+7J/sNlVayM6/SaMapsA7yxKZu2Iq7ZZu6KGc
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
X-MS-Office365-Filtering-Correlation-Id: 3a62a903-5cc2-4d8c-899f-08dcb15ef31d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEdJU1A4M3Zid2ZxSFVYaURmcWtubFBTWHM1RVYwNDBuWC9ZVllsVkJjTlpk?=
 =?utf-8?B?akovaTEvMU1OVDd5OHRocHVWV1FpcXh0RjV4QkpZMEJxSlhwaXA4eHF5VmZr?=
 =?utf-8?B?Y1c5K1pkcFhNQmhiRU9COWdoUWZWbWMwbFFvdUduSmdETFRTeE1lVm42dUVI?=
 =?utf-8?B?Szd0akJhZkNrUVdOaVg2dVUycUE1UEpKVVlsY0E2aXpNb3dWTnFQNmZXVGRy?=
 =?utf-8?B?dDh4TlkvbGFaOGhEdHJBdzdmMDBibWFLSzhUREptZWthYWxTSzlvMFIwMGxy?=
 =?utf-8?B?SzlLak85U2VYbjZxVjRyQUdpS1cxR3dZMEpsaXpPSDdFY29DcktTQS90NkR4?=
 =?utf-8?B?RkJlSHhQZlE2eWhSdWUrT0RLbFh5RG5DRDR0ekFrbnE3ZFFadUE2MzJsTEg5?=
 =?utf-8?B?MjQ5V1J5RWJUbFV1MkFVaEtubDFmUFhlbHcxak1qNWdTRit6MU5nM1pjNlov?=
 =?utf-8?B?RkJ3RnFWV2swZ1E1SGxnMy9tY1dMSlVNUmwzREVjRzdWNElEeFBRWkloOWVL?=
 =?utf-8?B?V1drdDJLd1JYcFQ3UjY3elczcDR4MkVNSUxJekoyd295eU1KQjBUbVNDcGNK?=
 =?utf-8?B?WUVYZWpIMElOdS9yN3N4VzJqSXluN1BaQ3NlalhxRW0wRllmeTZHZFVlOXJY?=
 =?utf-8?B?Y0FxaE9paXNTTWhQMlFacW50eDFWUEE5L1hMblU3OTI4Vmwzd2NNQlVQUW5j?=
 =?utf-8?B?ajZyZE5EeTd4OHJ1VEJlY01Cdkt0OW93SWI4OGJHVFE2UkRzTWRVMUNuRExH?=
 =?utf-8?B?TEJKNlJ1b3BTYWYyV29IKzNxa2VmbWJhNE1oRmJ5Rk8zYXhRU0lXdEFIQk9R?=
 =?utf-8?B?ZEl3QU9jeS9lVXZxdTRzTFlSbHBuUU9KdVgwVDRQbnprTHBMOVZOSVp5dS81?=
 =?utf-8?B?SWpYVzdBa3lkRUpMVW54clh6UGUrS3VZZnFCSzNOSkNaRXZIcFM3T0t5QUlt?=
 =?utf-8?B?ekZsOEIwWGR1aUgyNlVxYXNzTm5KWll4ZCtuWkQydDFDekNHdHVqZEFKT3ZY?=
 =?utf-8?B?Y1Q2eGpXRDE3b0QvaXFFMmhwMUhsOERzaGJUNnk2bHdMMW5hMjBOcTRkVjB1?=
 =?utf-8?B?YS9ScmZ4NHB1MWRhZGFqR0FPbW1VNFlVd2FIcWJkNTNmMVFuNGZIdWFzMWhQ?=
 =?utf-8?B?M2wvMG0vN3EzNUduL1l0UGJUM3k5bm5NWlhlUHJLTHk3NG45V084T1VqamNP?=
 =?utf-8?B?UzhRZHNJTndsMGtybzN5N05zZzV3VlBabGdSVGxOYzc4R0t4bmtRbGNFR0Jh?=
 =?utf-8?B?WGdOV2grSGpwTGdGOW9DRmNaRkNNRHpNMUJ1ZHNTaS9MMHNrYi91TC8yZ2xU?=
 =?utf-8?B?NHdxNnhPQTEveVBqd3VOL0tzNTJFQml5MFpscnZ1d1BiNzVlWlZOMWdpdHhK?=
 =?utf-8?B?ZVNkOXVUOTlFbWJ5ZSsyOE04TXdwVDYwYm5kZ0lEckdpRDluWGYxTGcvYWsv?=
 =?utf-8?B?UWkwRlhURjV3cm1ObE9tOURMMENxRHR2Um9ORlVaUFArbVZRdmk2UmNGSWRr?=
 =?utf-8?B?YlhpbFd4dmZuTDlIYUVPcVBvQ2ZqWnRqWXdpZ1o1MjBvalJJbDJNREtFSGxy?=
 =?utf-8?B?MEJGQmFtM21DRnpDazhqZXRWS2VpNHZZZWZKTWlBcEJiMS9aUmM3UElDNktz?=
 =?utf-8?B?Yzk5L0ZNU0pUVUhOMTFDSnJ0enJ3U28vYmRCRkJhYUpJOThXZmhpdjUwcS9k?=
 =?utf-8?B?bEY0b3A0d3NCeW0vc1BYVjB0N2tnY25OVExsS1J6UlB2cmxrSm5zZjZMY3Nn?=
 =?utf-8?B?MStudkFnS0wzcVEzcEhVMnRRMXQwSjhWT1o5cUVSL1JMZjBZK3lPVFgvOFRx?=
 =?utf-8?B?OGJ5cmZYVE44bGE1ZTlFMDdIcFhOYWNiZ0l5WXZIaFVSWlNLUlBmekgwOU14?=
 =?utf-8?B?Zlh3SzhGN3B0Z2hma0VsQzYyd1ZCb2lIYXFLOFgvNVoxU2Y1SVBzM05PUkdm?=
 =?utf-8?Q?AMnYIyp2WOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVQwTnZsbm4wMTlONW5OWU93OC9veVBmTlJQZ3VXT2F3c1YrdVZ0SzdQVEwr?=
 =?utf-8?B?MFBiZ1NrcnlJYktxeWZ6b3Y2RG1RSDdSYVBvYTdGeW42RW4wVTVZM1dKQTdx?=
 =?utf-8?B?VGw4QldjUG96TitOZndmOCtlTm5RdWJMWW00ZGJLVk5iZEhhNnhZVFdzTVl4?=
 =?utf-8?B?b1J4RTV5NGRiaE1YY2VmMzZleUVQRUQ2Tklnb3lyUi9aQ3hwM05vTzYzTEpO?=
 =?utf-8?B?bUxlaFA2YVdPT1huVFF4amJqb1JEOUJOUVovSmFGZTZrM0JJRlhSQm5YalVR?=
 =?utf-8?B?NUhCQktybklFOFlHamd6bUFNTnVCU04vdTVNSUdVRkxWM3l0WHp0WEs0d1Bj?=
 =?utf-8?B?WUVsaXlkQnlpc1k3THhKdHBROE1ER1diSU44V2ZubDJpZjdhOHg1NHdMbUZW?=
 =?utf-8?B?NThBbXJLQmY2bW9RVXp4cm81NjFFMGptbDQ0RFp2bFJSa3NFdGtQRkFzenpt?=
 =?utf-8?B?S2UweDhwUEcwbVNOOFRPK2VTMmx1VHo1VGFFc0FZdFFLRUc5QUs5ZU5lcStG?=
 =?utf-8?B?QTAyY1BpVnJwT1M4aXQrKy9wU0c5U0xldGoxRUNOM1dKSWZ0cmNzaHFPRzFj?=
 =?utf-8?B?bW9EOFdZRDJJb2x0Q2k3aDRSbzE1SVZTOVVadXVmck15bWdjRVlKTS9nMlM4?=
 =?utf-8?B?NnRGa1ZVdTZMSk5FUytvT01tVHBwdE51QmE0cFlOOGF5TERuMXBLRm9MVHQ3?=
 =?utf-8?B?U3YrdG9NTDdCbTUvaTFkT29Ca04xRnRXMU44OFo0TmdsYmRWOHNQaHk3ZHF1?=
 =?utf-8?B?SWp6ZS9rdUFuY202V2l1a2IweDNxWnJSK2JFS0l0K3VlTjRUUGxlbzNHRjEy?=
 =?utf-8?B?QkYyWTByT3B3NzNlTEtJZVpnWXhQNW9QNUVweG1BeWV5dmVscDUyK3h6b21H?=
 =?utf-8?B?ZDdQQVFHZjY4T05kOHRVNkNaVmdPRTNSRzBHNktpRXlJb3NhWDYrSWgxMkp0?=
 =?utf-8?B?clg2bWgyZnR4Y1lNK0lCZ3hiaUg3dFZFejd0bGsrbExOaUZZQWN4OUQ3T1FE?=
 =?utf-8?B?WFMwdDA0Ny9wTGEzOXZBcndxYU9Zc282RkgrSzJEQnpHTURDWlptWHZQRG9q?=
 =?utf-8?B?dkFveHVJUUVQQTV1cVhjM1hDRVhTbitGbElLeEtWc0ZkN3U3MUZlWFRXS253?=
 =?utf-8?B?QWRmWDFoZXBzbDcyM3orTG1abGJtcjEyU3BSdE9vTjRQQVlxRHR2NTNnTGlp?=
 =?utf-8?B?Y01ENzdKdlBUbUVzenFtWFR5SWltQkNydFJOcjJxRVhCY0FlRE9ielVEa2F1?=
 =?utf-8?B?Y2FEZWpOVTJYd2c0N0RTTEpyRXdSdzMwdTRpV3RvU3lBcGt3cy9rSUJaYjZT?=
 =?utf-8?B?dkxrRDhOVDlXYVV6OXJSVVB3b1NCMHNZQllHMmkzdzZqdVdKNkVTSnM2VjVv?=
 =?utf-8?B?UDVMcFFZYzJUcEl4VVNVam9UZmdLdzVQeHJpU3pzb1E3YUNyYTFuMHNPV21q?=
 =?utf-8?B?dzF2akw1a0FaZ0VLWkh3RFFyZU9LSHJwc250cDdpSTlHWGthSW1GNmEwM2NN?=
 =?utf-8?B?K1NtVlZYY09GL25ZUEpyd2o4V0huelZKOXlLT3ByT09nS0I4YjRSb01lUUNH?=
 =?utf-8?B?dXlLenF0UE9EUWRQMG1mc2R2a0RqbFRpZDh5Q0ZDOUd5ZUM5M05RRnY4VmdQ?=
 =?utf-8?B?d3hldEdUTkxwdDU3UDZWMnVNMHBpREE2YmxYMFhiS1AxRkJNNmQ0dDlPNlM5?=
 =?utf-8?B?eEpKRmcwVStnTnZjUkZvQnU1bE5hUDQ0eFdXNWFwU0xpdU02ekRkaEZkVisw?=
 =?utf-8?B?dEVqV0VLZU9zSUhITkZBdGFFY1lrRkNGY1pqWldzNWpkV3kwcTc5aHJtQloz?=
 =?utf-8?B?ZkpPQlJHVFZaSkJPTXprUjNOd2hTdnNKWVFrbkNXVkJyZHhjdlJrcUVDL1l6?=
 =?utf-8?B?cXJmVmxwRXJ5Qkljb2pPSStGWHpJYWZEMEU3VnpoRC9XTDhIMnFHUVhDU1M4?=
 =?utf-8?B?Zy9KUkdWQlZ6bU5iWjlXRjVRVkRZY1FkTmRGd1MvM3BjWFBWejh6YXNDeTI1?=
 =?utf-8?B?anhZemdUcENCVWNOMEl0bVJXaXJFWVB6RDBNYW9xN0VmSDM3eHNKbU5sdzd3?=
 =?utf-8?B?Sm5MTS8yK2ltaWZOTzJqZldQaVZOUkk5Ni9XS3MzYUJmSWtlYXBmdWRENjVh?=
 =?utf-8?Q?V37n4CFgepZ5XXhR2QoNKniPW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a62a903-5cc2-4d8c-899f-08dcb15ef31d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:34.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/jdPWkhgRZ4tdj8dJ3kBWjbbWhvymIdAYpwaMdZKaGKZbRKMawy5R7i1x5GxDY/0iJ9VA5HwYMOVfaNBD6YGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

Add NXP i.MX95 System Control Management Interface(SCMI) vendor
extensions protocol documentation.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/imx/imx95.rst | 886 ++++++++++++++++++++++++++++++++
 1 file changed, 886 insertions(+)

diff --git a/drivers/firmware/arm_scmi/imx/imx95.rst b/drivers/firmware/arm_scmi/imx/imx95.rst
new file mode 100644
index 000000000000..6a9e53c17df1
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx95.rst
@@ -0,0 +1,886 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| 2024 NXP
+
+:Author: Peng Fan <peng.fan@nxp.com>
+
+The System Manager (SM) is a low-level system function which runs on a System
+Control Processor (SCP) to support isolation and management of power domains,
+clocks, resets, sensors, pins, etc. on complex application processors. It often
+runs on a Cortex-M processor and provides an abstraction to many of the
+underlying features of the hardware. The primary purpose of the SM is to allow
+isolation between software running on different cores in the SoC. It does this
+by having exclusive access to critical resources such as those controlling
+power, clocks, reset, PMIC, etc. and then providing an RPC interface to those
+clients. This allows the SM to provide access control, arbitration, and
+aggregation policies for those shared critical resources.
+
+SM introduces a concept Logic Machine(LM) which is analogous to VM and each has
+its own instance of SCMI. All normal SCMI calls only apply to that LM. That
+includes boot, shutdown, reset, suspend, wake, etc. Each LM (e.g. A55 and M7)
+are completely isolated from the others and each LM has its own communication
+channels talking to the same SCMI server.
+
+This document covers all the information necessary to understand, maintain,
+port, and deploy the SM on supported processors.
+
+The SM implements an interface compliant with the Arm SCMI Specification
+with additional vendor specific extensions.
+
+SCMI_BBM: System Control and Management BBM Vendor Protocol
+==============================================================
+
+This protocol is intended provide access to the battery-backed module. This
+contains persistent storage (GPR), an RTC, and the ON/OFF button. The protocol
+can also provide access to similar functions implemented via external board
+components. The BBM protocol provides functions to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Read/write GPR
+- Discover the RTCs available in the system.
+- Read/write the RTC time in seconds and ticks
+- Set an alarm (per LM) in seconds
+- Get notifications on RTC update, alarm, or rollover.
+- Get notification on ON/OFF button activity.
+
+For most SoC, there is one on-chip RTC (e.g. in BBNSM) and this is RTC ID 0.
+Board code can add additional GPR and RTC.
+
+GPR are not aggregated. The RTC time is also not aggregated. Setting these
+sets for all so normally exclusive access would be granted to one agent for
+each. However, RTC alarms are maintained for each LM and the hardware is
+programmed with the next nearest alarm time. So only one agent in an LM should
+be given access rights to set an RTC alarm.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes | Bits[31:8] Number of RTCs.                                |
+|                  | Bits[15:0] Number of persistent storage (GPR) words.      |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_SET
+~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to write                                      |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value to write to the GPR                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully written.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to write     |
+|                  |the specified GPR                                          |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_GET
+~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to read                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully read.                 |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to read      |
+|                  |the specified GPR.                                         |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value read from the GPR                             |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: returned the attributes.                          |
+|                  |NOT_FOUND: Index is invalid.                               |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bit[31:24] Bit width of RTC seconds.                       |
+|                  |Bit[23:16] Bit width of RTC ticks.                         |
+|                  |Bits[15:0] RTC ticks per second                            |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the RTC name                                    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC. |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully get.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ALARM_SET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC enable flag:                                    |
+|                  |Set to 1 if the RTC alarm should be enabled.               |
+|                  |Set to 0 if the RTC alarm should be disabled               |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds.          |
+|                  |Upper word: Upper 32 bits of the time in seconds.          |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC  |
+|                  |alarm                                                      |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_GET
+~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the button status was read.                    |
+|                  |Other value: ARM SCMI Specification status code definitions|
++------------------+-----------------------------------------------------------+
+|uint32 state      |State of the ON/OFF button. 1: ON, 0: OFF                  |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_NOTIFY
+~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[2] Update enable:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[1] Rollover enable:                                    |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[0] Alarm enable:                                       |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |DENIED: the agent does not have permission to request RTC  |
+|                  |notifications.                                             |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_NOTIFY
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Enable button:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |DENIED: the agent does not have permission to request      |
+|                  |button notifications.                                      |
++------------------+-----------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x81
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+BBM_RTC_EVENT
+~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
+|                  |Bits[31:2] Reserved, must be zero.                         |
+|                  |Bit[1] RTC rollover notification:                          |
+|                  |1 RTC rollover detected.                                   |
+|                  |0 no RTC rollover detected.                                |
+|                  |Bit[0] RTC alarm notification:                             |
+|                  |1 RTC alarm generated.                                     |
+|                  |0 no RTC alarm generated.                                  |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_EVENT
+~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
++------------------+-----------------------------------------------------------+
+|                  |Button events:                                             |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Button notification:                                |
+|                  |1 button change detected.                                  |
+|                  |0 no button change detected.                               |
++------------------+-----------------------------------------------------------+
+
+SCMI_MISC: System Control and Management MISC Vendor Protocol
+================================================================
+
+Provides miscellaneous functions. This includes controls that are miscellaneous
+settings/actions that must be exposed from the SM to agents. They are device
+specific and are usually define to access bit fields in various mix block
+control modules, IOMUX_GPR, and other GPR/CSR owned by the SM. This protocol
+supports the following functions:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Set/Get a control.
+- Initiate an action on a control.
+- Obtain platform (i.e. SM) build information.
+- Obtain ROM passover data.
+- Read boot/shutdown/reset information for the LM or the system.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x84
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:24] Reserved, must be zero.                        |
+|                  |Bits[23:16] Number of reset reasons.                       |
+|                  |Bits[15:0] Number of controls                              |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the value data in words                            |
++------------------+-----------------------------------------------------------+
+|uint32 val[8]     |value data array                                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was set successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to set the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was get successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0, num - 1]   |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_ACTION
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 action	   |Action for the control                                     |
++------------------+-----------------------------------------------------------+
+|uint32 numarg	   |Size of the argument data, max 8                           |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|arg[0, numarg -1] |Argument data array                                        |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the action was set successfully.               |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0, num - 1]   |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_DISCOVER_BUILD_INFO
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+This function is used to obtain the build commit, data, time, number.
+
+message_id: 0x6
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the build info was got successfully.           |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 buildnum   |Build number                                               |
++------------------+-----------------------------------------------------------+
+|uint32 buildcommit|Most significant 32 bits of the git commit hash            |
++------------------+-----------------------------------------------------------+
+|uint8 date[16]    |Date of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+|uint8 time[16]    |Time of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+
+MISC_ROM_PASSOVER_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+ROM passover data is information exported by ROM and could be used by others.
+It includes boot device, instance, type, mode and etc. This function is used
+to obtain the ROM passover data. The returned block of words is structured as
+defined in the ROM passover section in the SoC RM.
+
+message_id: 0x7
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the data was got successfully.                 |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the passover data in words, max 13                 |
++------------------+-----------------------------------------------------------+
+|uint32_t          |                                                           |
+|data[0, num - 1]  |Passover data array                                        |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_NOTIFY
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of control                                           |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags, varies by control                      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: control id not exists.                          |
+|                  |INVALID_PARAMETERS: if the input attributes flag specifies |
+|                  |unsupported or invalid configurations..                    |
+|                  |DENIED: if the calling agent is not permitted to request   |
+|                  |the notification.                                          |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 reasonid   |Identifier for the reason                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid reason attributes are returned           |
+|                  |NOT_FOUND: if reasonId pertains to a non-existent reason.  |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Reason attributes. This parameter has the following        |
+|                  |format: Bits[31:0] Reserved, must be zero                  |
+|                  |Bits[15:0] Number of persistent storage (GPR) words.       |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the reason                                      |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Reason flags. This parameter has the following format:   |
+|                    |Bits[31:1] Reserved, must be zero.                       |
+|                    |Bit[0] System:                                           |
+|                    |Set to 1 to return the system reason.                    |
+|                    |Set to 0 to return the LM reason                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: reset reason return                             |
++--------------------+---------------------------------------------------------+
+|uint32 bootflags    |Boot reason flags. This parameter has the format:        |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Reserved, must be zero.                      |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 shutdownflags|Shutdown reason flags. This parameter has the format:    |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Number of valid extended info words.         |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 extinfo[8]   |Array of extended info words                             |
++--------------------+---------------------------------------------------------+
+
+MISC_SI_INFO_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: silicon info return                             |
++--------------------+---------------------------------------------------------+
+|uint32 deviceid     |Silicon specific device ID                               |
++--------------------+---------------------------------------------------------+
+|uint32 sirev        |Silicon specific revision                                |
++--------------------+---------------------------------------------------------+
+|uint32 partnum      |Silicon specific part number                             |
++--------------------+---------------------------------------------------------+
+|uint8 siname[16]    |Silicon name/revision. Null terminated ASCII string of up|
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_CFG_INFO_GET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xC
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: config name return                              |
+|                    |NOT_SUPPORTED: name not available                        |
++--------------------+---------------------------------------------------------+
+|uint32 msel         |Mode selector value                                      |
++--------------------+---------------------------------------------------------+
+|uint8 cfgname[16]   |config file basename. Null terminated ASCII string of up |
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_SYSLOG_GET
+~~~~~~~~~~~~~~~
+
+message_id: 0xD
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Device specific flags that might impact the data returned|
+|                    |or clearing of the data                                  |
++--------------------+---------------------------------------------------------+
+|uint32 logindex     |Index to the first log word. Will be the first element in|
+|                    |the return array                                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: system log return                               |
++--------------------+---------------------------------------------------------+
+|uint32 numLogflags  |Descriptor for the log data returned by this call.       |
+|                    |Bits[31:20] Number of remaining log words.               |
+|                    |Bits[15:12] Reserved, must be zero.                      |
+|                    |Bits[11:0] Number of log words that are returned by this |
+|                    |call                                                     |
++--------------------+---------------------------------------------------------+
+|uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
++--------------------+---------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+MISC_CONTROL_EVENT
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ctrlid     |Identifier for the control that caused the event.          |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Event flags, varies by control.                            |
++------------------+-----------------------------------------------------------+

-- 
2.37.1


