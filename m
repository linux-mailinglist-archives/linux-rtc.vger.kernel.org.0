Return-Path: <linux-rtc+bounces-1703-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D03995C89B
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529331C21F4C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9243117C9FC;
	Fri, 23 Aug 2024 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rgn8nF0X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013025.outbound.protection.outlook.com [52.101.67.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93E14A08F;
	Fri, 23 Aug 2024 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403436; cv=fail; b=kIZFe8p4PL5QluIgtvsPK9X87VBezd2cUgdgMAn2gbGkGRC87Ov7TK3nBNcsGlXS/ZU33W/qSmAB5Nk7nptnV/10gqcTVH/X0q0R5A/39IEe5OT16f1x1rBaHvNJonxPAv3T6W8jz0/E57MJH42eMKT7UFoJS4YLCpGp3fj+YC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403436; c=relaxed/simple;
	bh=LQvxg4wjhO9FWV8ybDeg50raOjfc2rJ4N3Rx1dkcBxg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hM2u7ZUX2KMK+Rp4FC3pBJM/IpglJbrUmt/po8pRNgWyDPIzJhPjciW09dgRhdaRK+r1CNBDQzCS2GG8WieStBmWCcR5yx8Lt7HO90Rh/ZUZxXfRAOuZJ+4O+HCsA8Gd9NwSMqNUgucgGsJQinpkj+RqpVfe6KCG3z33cwu1DeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rgn8nF0X; arc=fail smtp.client-ip=52.101.67.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxDUnTMMhuQ6TJDo52aw5Znk4LAvsWLaiNnYYRPOH/X3J8SOy9GzfS0y5XT0mkHyJpY28k6sYi+Oi5T5QdxwepYn0UfIfzXSp3k+n7veotmfcBHmrUGvLiDyl9dpMuuYQaoZPJxrrqcWikOEsBN5W0NIaaGEf9KJwHIQV9aHvrM9Bu01/FBP8D+XPhpVN6PzbB9QTLxhTjvKKHMkORWOiSvgVUNkprP/aVIDUFb7vRXvObqH5R4GTI2WQ3wuxNe2KkQQaXpyH/Wi6xcX6TZZ095Avoys+sLm1iiFYvjo9+cDkjBODN6mPJdSkQQjD+CpDVk6K7J86XCjxv+2F5MiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=qJsRfSZDtJ9Lx5PSdmV0+ijop3SJ3YvrXrNpKd/tEo3A8eoOXzY0Ep7oRpe95QFjPFMhQK84tOBlYQ3tiaIzVkl01mV7sWhRt3e3AuS3ZaZhizx76BIWGXUjs1EaJzqvSostCh0ppEjqkZJXVDlpkWt+oOC0Gpb8rePB9M94HXwwAdEmHRWX+8E66AI4RvAmL0yjkOTLneW1/SIaoKLzUvUxhjCZPjRqLLgp7ApIO6zODXUZGyzqGxZgrN54l51GOVsStwpMNL/bz139vXNiUS9djm5E/QatHfMqYLF3Mnb4KRO33lIxkngYiadGnY/Whk2vC3pLFzzQzb14S/mUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=rgn8nF0Xyo7gromGBl00/pGQTktfHKHPsCMowwbNflJBxL8DoOFn287PqdhvJ/cVeVCaeQMSWavIUxDK1V5bhPMJ6JlbJnvLbVfrp9uFBR7pOEfpv3elnmpZ+Dxu5BJ4nfyX7jhz1f2aJQii1A/3gSl/Gu1Cg2ZB79iGCdwxk2I6Z/F5kFC8V3ib7ngue9yzYt/28alWk4RwHnv1xjoFAc3CazS5LKUBGgJlk58NVJDkPxeVVVtFzV9ffpw8AL24zhL2ijDE+QZIu+I/hPa7MqRfesnr9HRbtA5mMSYoTzdNbhuY6Bg1gwv/LWJ8FQFC4Zy2aMkZOgCjr66BHpAF7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 08:57:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:57:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:21 +0800
Subject: [PATCH v8 5/7] firmware: imx: add i.MX95 MISC driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-5-e600ed9e9271@nxp.com>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=6495;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=D48dI8TueQeMQCWqqGsKwb9eBu8K4dfQ0em7IUIjo5A=;
 b=RaROcmSbo0BoZ2se9ht7oYUj31+I7UHCjbskbV7cgDWJXtzEhHxQOHG/7vVB/0iMOLFcLWTwn
 cbdy+sz3X2RBdp0FaMvfShXIMF8L5rXAr4hd4MmF7ioIjFcKkgIPjmZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5c36d6-f949-47c4-930f-08dcc3519323
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGc2SW5QcXVVZ09yTDVmOEkwcmZQbmwxYWVEMlZ0a1VBRUh2RWFuNm9iUUdL?=
 =?utf-8?B?Q1hjMFNYczdaY2w1UzQxNllzK3VzS0VaRFM1bFBxTTlzNHNTMGs3MGw5WkJG?=
 =?utf-8?B?NSsxcklXdjFxTHREK0JhS1c4UUVwWVhUREdnRUx2K1g2YWlTdWFGY24rd1I1?=
 =?utf-8?B?bXhKazRabDBLMUdQZmxQT2Y0VWJQWWN2aE1Gb1NTYkN4c0Y1QkxGTngxT0Jq?=
 =?utf-8?B?ejZSOC9LRFk5TDlZT2ZqcVhSbGkyWlhPQ2hxRGhxQys1UXJHSXBFWmpud1Jl?=
 =?utf-8?B?dXFLTVhJOFhmSXBNKzR4RkY0YnpqeWF1Mmh3clNmWWE4VVkxYllremJhVDU4?=
 =?utf-8?B?Mk1zcTNyT1BNR0hTMlo5TjFPQ2tPZWs5VzUraHJGaGpicitZYkp6cGM3WDVR?=
 =?utf-8?B?R3FLQjM2d04zOUk2bVd5MldzdldWWXY5MEx6MHhFbWNkajI1T1BPZEtUVG5J?=
 =?utf-8?B?ckdQcHVoTlhmMGw1VFZjWUd4L3ZCUnBxSThpSy90WXo3KzN3c1pGc3lrdTlT?=
 =?utf-8?B?Z095cXVpVm9sWXBOSkJ2WGRZNnB3ZHBScTQ3K1oyRnNVdnFqdEd2Rjljand3?=
 =?utf-8?B?NUFkdGFFZ2xuL3Vkblpsc3pFR2RQcXVUYUZiRnVtMUZyeTM1OXFGcE9Fb2x5?=
 =?utf-8?B?dHJqemdzVThjUll4Smc2aFY4eit6dlF4ek1OS3htZ1NxSHBUb3hNQjllV0NY?=
 =?utf-8?B?ZklwbkxCb042OXpwM1lNOUpPTFRQQ0puVXpxWmVNNGhWK0ZEaW1CWHJNdFAv?=
 =?utf-8?B?VWs1RGNqNFpYbHBRcGlOeUJQTEZ1NXNnYmRGbnBQdXNmUk54bGhlcmxLWi9D?=
 =?utf-8?B?SlFON2pJaG1mYTJFd3l4T2xuVHJDRnVaQ1BPMHNMV0MveTY5WWNGMUY4V1pC?=
 =?utf-8?B?SERtUUpVYkcwUm5UM0NzbHJmekZnbU54NEFWb0EzS1ZSaElXdmIxM3JJRTFX?=
 =?utf-8?B?NEhIQktIYWZFYzUvMEhSNWNsSVhtSng1ajlyQm5WZ0hELyt2czEyOHRhMEFu?=
 =?utf-8?B?REcrWFlmOFA1T3hOUFBYM0tKUXY3L20yY2Q5OHU3eEs4SjYyb3Vzc2NtZndo?=
 =?utf-8?B?aGVFWFlGZzRYUUtWTHJhcElJcmUyMXJiTlFqWXVsYlVBeWloZG0vWkcvYTV4?=
 =?utf-8?B?R3B2VCtrRXFaQ25qWmhiQkRJak9rYlVlMzdJenRVYXlUd0JCS05rMStLRnhy?=
 =?utf-8?B?dGFWTnlLakhkakQ0Y2dGUEVTTGtFVXh2Yk1ZakNrMDNHVGlMbzhLWVFPR1RN?=
 =?utf-8?B?TzlLSWtWazlFZTBWUHhSaTQrN3V0REZZbU9zRTFMZk8wdVRvSGlNekUrZGx2?=
 =?utf-8?B?QWZaWERiSC94QnR4OHpjcFdpU09vWWFySHlnNDRuSE1XUUN0ZzYrVG9CNDFZ?=
 =?utf-8?B?bFRBTldRbVRFdk5LOTJrWk8wUTdvbUQ5SkhUT1U5Y3ljdjJ6dEgwNEphVTc2?=
 =?utf-8?B?WFdGczdqSHA5NTBSSlJ2cTk3dnlOSEhsTjVpK3IxSEwzblJyQ2ZTQ1dKRTdv?=
 =?utf-8?B?clFrWW1nY01jQzhoNnRnMU5YaWUrbUtER0pybEtkVHpiL084b21rL1dWYWtk?=
 =?utf-8?B?U0JpRnFETWFIWDltNGNCRURLcW5UenFtZmlmdlFzaHljL280TTlhODEzUVFj?=
 =?utf-8?B?YmR1RW1KUlJFVHBtSjRqeFEvL2kzOHV2bVVKeTVuM043UWNFamIycDBCaFVI?=
 =?utf-8?B?T1hPVGp2UnZmeGVTN25XYVFyMTluUC9jRjNqbjRqVHpYcnNhRzQ2MWRDQzZx?=
 =?utf-8?B?cEdwbWd4ZzA3M3lKbVZheHo2dFI2cStzdmtneVg1MWlhbjFqRUZ4dEFhMjli?=
 =?utf-8?B?TjBaL2NLRzN3VjMzM0JBcG5xbXpwY0ZtSmp4TVhjdkprbnNlY25zV2ZKY01M?=
 =?utf-8?B?OGpHNUxkbmt5Y1lLbmZrNTBGVEdMTDdoazUwOEZMMHlFK2h4SXZRSzU2Y2FS?=
 =?utf-8?Q?1dKjQbGQSkw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TncyaUNuWkhCZHBKK3ExaWxIV2tzQ2dmRE4yaCtvc1hyMW1Oc1VpK0FUcjFI?=
 =?utf-8?B?cDNhU3RSdVJkMXVTY3plcG8vQWx1SjBRRENrMWVqUW1nQXRMWC8wR1hrVjQ2?=
 =?utf-8?B?VXlFdzFveUNjYkpwQkZMcm1yNnkrUDhGcVc4V3ZJYlBEUXdWaUttRU1CUTla?=
 =?utf-8?B?ajJZblVqUmIrN1IzOGQwSTVLSzJBU1pNNVBHTXkzV3hmZDh1RWhFVU5KNG9m?=
 =?utf-8?B?RHpEVTRmODBJODluSHF6NkozTWpveVJ4Ni8vTHIzN3hFcVM0SzBFMENNS3Z5?=
 =?utf-8?B?eEgwKzc2cWF2eHlCdktHMWUrQ0RVdWZ3OHJXMUNSSVAraU1mWGJycFE0ay9D?=
 =?utf-8?B?QkVGVnJLUlFvdkhZWlJIbDRZdHh6bzcyOEZGa0pjTEx5dTVNZFhSQ0c2NXBj?=
 =?utf-8?B?QTcwbE0yY2g3S2EybDlCT09FWHB6byt6RWU4Q0VxdlcvaUw3R3VVZkc1VHo4?=
 =?utf-8?B?YU9BR3RWWnQ1TTU4N25kTS94cDJFZGcxZ3dUbmNCa0sxYlNCT2wzSG9vbHJl?=
 =?utf-8?B?dGZBeDJoYmh2M3NJbHFrUWZRRXFGUWRrcEM3RER6ZVFQcHg2U3hZVGh1OXJY?=
 =?utf-8?B?QlR3dUpmS21VdVJ0SGk1Uzd6eUdWdmVONUczVm1uaWR4Q0VlOFBocEEyL0gy?=
 =?utf-8?B?ZXlySkVadkZHd045ZGErQ2JtOWhTWlNadlEycWw2c3diRzRaUkpYUjRlMUg3?=
 =?utf-8?B?Z2U2V3ZTUUY1YXRiT1pST2VFLzh5Nmp0b2hyV2JTVXBVWUh1MndFSnZaZ3d0?=
 =?utf-8?B?amRJTTFIUDhPcVc3SDRJWHRNd2hoNVZuSnFFdld4QzhZN1Z0QW1Pb3ovajRD?=
 =?utf-8?B?cTVMUnZvOTcvVHNhSkFxZXJMQ24zRnhqdjFQL0crK3hBR041S3djaDVOckFS?=
 =?utf-8?B?bHl2OFVReWNoakNLM2tidzAzTUNUamhRMnEzVUJjcWMrK3lKVllVaFY4MHY2?=
 =?utf-8?B?RzNtR3ZiMHovYXF5dDkvOWxhTmg4NFd5bVRxZDhBWFBnNy9BN0x1bEpLZldY?=
 =?utf-8?B?WnRVejdteE1XT3p1OWdmdWhCY0plSVBkcjRHSmIvOXRSMWxXN0MrOW9GaGE5?=
 =?utf-8?B?eGhGanJ3MzVvWldqbE1LeHFQYmRSR0I4UzRjWDZhWm9lK3d0YnpxNElRYXZn?=
 =?utf-8?B?MjRPTDFSNnpkSHEya05CQU1GNWMxQmJ1ZWNCL2pqdFBqTFdMZTNML3ZpQzNh?=
 =?utf-8?B?d3prbWdtbDRXWXdOMVk3ZDU0VGlJRWxQNUZaWGhjK0QrV3dKQlhYNVlZNkdL?=
 =?utf-8?B?eWd0MjZlazduUFA2a1FBdzJkb0hzVTkycnVjTEdxMUUwVzhZMmVwTUVQcHZz?=
 =?utf-8?B?OUFNTnFRZU5pSCtGMmtjYlBOQmFkOTVZeGdERU5SWXlWdDVaWi9yK1FsWUNY?=
 =?utf-8?B?VGJjT3dlQlRROWwrSDFqQWR6ZkRMQWNmZjYxTUNiVkFuY3hMalRZdENLK3d0?=
 =?utf-8?B?NmgxSTljUFhKYlhqSFBBajFOemcxWW1CV3NhSW5Md0xkWVVoVVJIbGkrcy84?=
 =?utf-8?B?UFVEQzFla3NLeWFvOTE5TDBDVktWK3BJU2ljQlRidXpOcVJJTDQwUW4wT3VR?=
 =?utf-8?B?M2lPV0RscTFMM3lmaU9xMXNuWTVaVTdQbERMeURpb2lodEZWMWcwSG5sZkZw?=
 =?utf-8?B?eDIzUnBBMUdkR0VKakViTXJEZGplMW53U2NMZndmbjJxS3BVVnU1Q29LSmxQ?=
 =?utf-8?B?bmVybUsrcm1kWkJoeXQwQ2VCS0dORUx3TWZyYkM4VnVMbFRuTVE2RlM4K3o3?=
 =?utf-8?B?b2hYVXkxSk5SU2hqeDI4Zlp6ZWtIQjE4dzB4QTRuMnBtK0JmVkN6KzNyamZo?=
 =?utf-8?B?b1hjc1BaQ1h3ejYzVjI3eGU2d2sxc0dqNXU5Z1pqeHVwV1dMeEdzNDQ2a2w4?=
 =?utf-8?B?dTE2V29LZ2lXZlh3VWdNNy9OLzlSZkxoTXhSTExtUTkrU0oyK3RDT0o3VEw1?=
 =?utf-8?B?aGN3TndNcUxHY05DOHZFQ0ovTFdydncyVXZNbGZqbHdsaHZ2Ti9kcUM2NWlr?=
 =?utf-8?B?dmFTT1FYVTB0a0dhVWtQN3c1WjdmdkpyZjkyZE9iemwvQnBaTTRDMlZDcGV3?=
 =?utf-8?B?UXA1aHB3T3pYVWdMVXpmRFdlSnMxM01TeU12NDNPSEhPdEZac29KQVFBL3FO?=
 =?utf-8?Q?hYKgrb3w2egnAzEIdhM3GJ6vm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5c36d6-f949-47c4-930f-08dcc3519323
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:57:10.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M62CmeufP7/d7BVpv6s1EpfgE6+arUlkFC+hbFWpop8QhlLZZ9CemTfpdgrIL10G6WVqvyOBYdJlTzpVMSm2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI MISC protocol for linux to do
various settings, such as set board gpio expander as wakeup source.

The driver is to add the support.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/Kconfig    |  11 ++++
 drivers/firmware/imx/Makefile   |   1 +
 drivers/firmware/imx/sm-misc.c  | 119 ++++++++++++++++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h |  33 +++++++++++
 4 files changed, 164 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 183613f82a11..477d3f32d99a 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -22,3 +22,14 @@ config IMX_SCU
 
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
+
+config IMX_SCMI_MISC_DRV
+	tristate "IMX SCMI MISC Protocol driver"
+	depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide misc functions such as board control.
+
+	  This driver can also be built as a module.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8f9f04a513a8..8d046c341be8 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
new file mode 100644
index 000000000000..fc3ee12c2be8
--- /dev/null
+++ b/drivers/firmware/imx/sm-misc.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/firmware/imx/sm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
+static struct scmi_protocol_handle *ph;
+struct notifier_block scmi_imx_misc_ctrl_nb;
+
+int scmi_imx_misc_ctrl_set(u32 id, u32 val)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);
+};
+EXPORT_SYMBOL(scmi_imx_misc_ctrl_set);
+
+int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);
+}
+EXPORT_SYMBOL(scmi_imx_misc_ctrl_get);
+
+static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
+				       unsigned long event, void *data)
+{
+	/*
+	 * notifier_chain_register requires a valid notifier_block and
+	 * valid notifier_call. SCMI_EVENT_IMX_MISC_CONTROL is needed
+	 * to let SCMI firmware enable control events, but the hook here
+	 * is just a dummy function to avoid kernel panic as of now.
+	 */
+	return 0;
+}
+
+static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device_node *np = sdev->dev.of_node;
+	u32 src_id, flags;
+	int ret, i, num;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_misc_ctrl_ops) {
+		dev_err(&sdev->dev, "misc ctrl already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_misc_ctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_MISC, &ph);
+	if (IS_ERR(imx_misc_ctrl_ops))
+		return PTR_ERR(imx_misc_ctrl_ops);
+
+	num = of_property_count_u32_elems(np, "nxp,ctrl-ids");
+	if (num % 2) {
+		dev_err(&sdev->dev, "Invalid wakeup-sources\n");
+		return -EINVAL;
+	}
+
+	scmi_imx_misc_ctrl_nb.notifier_call = &scmi_imx_misc_ctrl_notifier;
+	for (i = 0; i < num; i += 2) {
+		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i, &src_id);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to read ctrl-id: %i\n", i);
+			continue;
+		}
+
+		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i + 1, &flags);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to read ctrl-id value: %d\n", i + 1);
+			continue;
+		}
+
+		ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_MISC,
+								       SCMI_EVENT_IMX_MISC_CONTROL,
+								       &src_id,
+								       &scmi_imx_misc_ctrl_nb);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to register scmi misc event: %d\n", src_id);
+		} else {
+			ret = imx_misc_ctrl_ops->misc_ctrl_req_notify(ph, src_id,
+								      SCMI_EVENT_IMX_MISC_CONTROL,
+								      flags);
+			if (ret)
+				dev_err(&sdev->dev, "Failed to req notify: %d\n", src_id);
+		}
+	}
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_misc_ctrl_driver = {
+	.name = "scmi-imx-misc-ctrl",
+	.probe = scmi_imx_misc_ctrl_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_misc_ctrl_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM MISC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
new file mode 100644
index 000000000000..daad4bdf7d1c
--- /dev/null
+++ b/include/linux/firmware/imx/sm.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef _SCMI_IMX_H
+#define _SCMI_IMX_H
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#define SCMI_IMX_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
+#define SCMI_IMX_CTRL_MQS1_SETTINGS	1	/* AON MQS settings */
+#define SCMI_IMX_CTRL_SAI1_MCLK		2	/* AON SAI1 MCLK */
+#define SCMI_IMX_CTRL_SAI3_MCLK		3	/* WAKE SAI3 MCLK */
+#define SCMI_IMX_CTRL_SAI4_MCLK		4	/* WAKE SAI4 MCLK */
+#define SCMI_IMX_CTRL_SAI5_MCLK		5	/* WAKE SAI5 MCLK */
+
+#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_EXT)
+int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
+int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+#else
+static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+{
+	return -EOPNOTSUPP;
+}
+#endif
+#endif

-- 
2.37.1


