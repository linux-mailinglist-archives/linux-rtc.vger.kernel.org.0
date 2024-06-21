Return-Path: <linux-rtc+bounces-1378-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC571911C48
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF1541C23CDC
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA7E16D337;
	Fri, 21 Jun 2024 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UI/3inGG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16716D334;
	Fri, 21 Jun 2024 06:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952984; cv=fail; b=hYNzpVLDBgVAZK4r67UAHI4C+P5Th6gspBrAzMvfd1ZZFLGGQE10RJ06NHFgsX9BZWBN2weS2PLlDXN+EKoNNYV8RMfjnz75X3orfMpFArfuAELoxAFL9l7LSTzk0eJpIO1ytB0oIGAs+264TgOcTK/B/DtQdRO/Vf/7dxmT5v0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952984; c=relaxed/simple;
	bh=CqMGW21wLzQwHCQSMNma+Vvw2YS/kHx8/LptB3z0aIg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NXqkQIvofFZkVNajR+eCirrBmErOQ4eyJyPSuCFaaslBzmMupehhvWUSWPoUeXw2GUAdUIkegH2CZ5al8myWTA0S2mkEsTks0k7nkxrDMVnd6bpbgwmkKqrApNN21RMcvaZ3kOB3SwZv6Tab3xGc0TgtLZznMqUzAiF9YrVBdCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UI/3inGG; arc=fail smtp.client-ip=40.107.22.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFg9s5Dp1r8m7WtLpXbg9/Rim8aWoLZbOEzJ2uhPhMjlSBD/QA1F86i+OZzmhduAsKI8EPVtEP/I72N2/s1g5lMeccdSNUDVQlrkkENw4jtiC2ACAFgRiuYicM5Qq6ROUor5zwOD6wi2NmPuKsorGlwpq2NgMShV+OZN518lccVa1NqJYRk06lOwhb6vXn7oJIuHauL8yN8MScggP8ueddQJMjdiwREPjodrcAaq2ni31UIxlIH1kP1t5g/lsbcTnr7oRJ8sglFB97zb+kDU/MGVzmEBDZ/OB8bzzMsVMa0Gn1q9qnxwIVIkqdPUVjyKnnzkTvoloQyvpLVqt1W1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWJNKk3jgwCNHoMe46PPOkniwkqxONFBhlGDDTjK5QU=;
 b=BHMCPHjApc9HKIE4tM9BJcdo5wiTBDH3hr1uaHXJmIE4jxRyPNscBltfFgsBzctvatE7Y7tGFTa/2bR3JRtidK7s00Yjs4vvuMBiUiwk0xgMmwSai5MW4nCrDXDAv5sK3j9T1Pk4EckYDtoPE0QjoWUZmkA3/3XcLkDuGIEZNlkAswPs8JLliG75EW3tPZGDqXw85OiNWhC5OSmOIrvG/bImm9mI4aaL4aSTdfcc9kjqGA8MW9U6tXPRZn2VMq0m7wJ6FzhiIkHf9VlqW997ZpxoVlj9q8Nd5v5miTFpBTL7OVH7SXEvWl/GSIKLaT2JipchUuM3Thwu0sb9s09cFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWJNKk3jgwCNHoMe46PPOkniwkqxONFBhlGDDTjK5QU=;
 b=UI/3inGGSJJVA5PAgngl0YDhFRixMCY1Nxm3d56QQoKSxAA8vP3EpRmliYeQaW4rV59uKieBjtNT6jV9plXC+HQn6kJuw5/frvliVLXZs8PSnXOCRk+e+TTQMORwQPpzLxsSPax5Ss84LByqgfqQi9UpzoJJAeY+Xkw1yshD/4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:56:18 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:56:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:41 +0800
Subject: [PATCH v5 6/7] rtc: support i.MX95 BBM RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-6-b85a6bf778cb@nxp.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=6289;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=3stfAX6GDrY2yBI8qtkGNlp9Yy53JQgBChIeJkCcYsU=;
 b=lpdaEaKWf70vtixuRA2/MHtFiMqlaDNTv4mxP597gAdLj+D7yFjG77tszgA3/F0QA6nT8PB4L
 RVmgTlu91HDCIpJ6UHizg/MMCKLbUR/YE+VmrIpFO0sknoivOiK2t2S
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e00da9-c5ad-49c4-f526-08dc91bf4082
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnYxY2VaSEN4enAzeG84dEhCZUN4TlpJUDBsWmFRTjRVaFh4bFlNaUZWNjlU?=
 =?utf-8?B?eGJnUFNubWI4dGlkeGdlZXdzTHlmeloreHFDYy9ucFltM0NHOXpWeE1KVkZy?=
 =?utf-8?B?WjNMS1hSVVVVMTdTS2FlcHM3WUdEckkrSnlMTFVEa1gyQjg3QkZJamk5MG13?=
 =?utf-8?B?RkMvY2xNRVBPUlR2Y1ZQb3ozRUtZR0lHbUdLZmtMdE9MZW5mM3lkNEY5OHRW?=
 =?utf-8?B?YVE0cE5YbUFLazNpbklhR0tDQW9mSkd6NkprQmVDNEVmMGZqWjNCUTNJblJj?=
 =?utf-8?B?Q1A4MXo0aTlYTkhhL0Y1QTZTV3g2VzhTbk1ub1lWcVA5RjUrK1FmbzBhVWVS?=
 =?utf-8?B?OFJwalppN2s1QS92eUZEQlRma2FYajFFRmVpOW9kRWV0dG9TaXJSam9GNERz?=
 =?utf-8?B?K0hOaTZMZCt2Nk9NbHJIMkUxU2xqbHhxdkZOUS9QeTV2UG1RODZxMFhReWdl?=
 =?utf-8?B?L0psZTFWYlFQRzN3T3Ivd3dvdU9ja2NxTzZMY3FhY25rOEQzMldLY3gvcElP?=
 =?utf-8?B?VU4xT2Q4ZnhCaHc4em9hWGFpa3VyZjVaeFFvUGJoQ3dUY0FxR1lXZTIwZ2t6?=
 =?utf-8?B?MnJTOE1wRjlQcHdodEgxUk1FN3pWSk9ucHhXNG8wK0xKWUpZanRmUk9NV2xq?=
 =?utf-8?B?NzlPMzRRYjV1YzlHOXJoeTNRUWg3Vi9jbmcwRVRlMlBOTUpPNWQyVVJmY3JD?=
 =?utf-8?B?VDBNbjVScmQzS0p2QjJUVlAvUzJvbHpEeVpTZFhWdGliUnk2MFZ4a0tLRG01?=
 =?utf-8?B?YjUvMXBGRktKSWlMeUFLcTNSZ3ZRaEpiU2ZWYTlLazdpbVZQUEdkOUlkbnRP?=
 =?utf-8?B?T2VSaDRWYjRFR3Bsb2ZSa2JaQjZ5OGx3QmhuMUdEYzd5NFRiOVorN3ExZUpy?=
 =?utf-8?B?dVFISnJvL0NvSElQTGhFVEJQYURJRDcrTmZSWkprc1ZqcVBRN2NNcmFwOU4v?=
 =?utf-8?B?bE5UZWJYS0E3WmEvNDh0c3FLNzdSa2ZtTUVjMkU5NS96V1NTdWZvUEszZDBr?=
 =?utf-8?B?MUFNUkkwSTg1M2ZRbnFHWkFxR3dXeGcwVkFEUjg1VzhXd1FIZlZiQU9YZEdz?=
 =?utf-8?B?ZG84SEdENlRzYUNkcDAxcTAvTEsxdFdNb01VN1JNNElWVE9pdDB2QWJqL1Ux?=
 =?utf-8?B?c3Yxb0NhTFFpZU1DSlZBYnNIWjk5cXJocUEwWkhORkVSdkZXRTRzcENXbEdo?=
 =?utf-8?B?LzZodHkveTIyeGNlVTFqREJoczNzeXJ1KzFLdmp4NjEzZGJzY011QUZlYmlT?=
 =?utf-8?B?U0o3R1RsUHpzRGRObjZWYjZGb2tldVk2NlNpNWtucGtuRU9vcWxSUnpUTitC?=
 =?utf-8?B?TSt5a2k5LzdtbEdQYThCTlNyU2ZSQmhwL0tDVFUyRFJWZEtLa2t6Vm9aYWRP?=
 =?utf-8?B?WnEvM2FTbkIwbHA5cWovSVdWZkNkZlpjdERqM3dZSm9ZdGhDRVd3MDlGMVNn?=
 =?utf-8?B?MmRKMmV0Z0NNR3VrSHBKcXVGck9jaUFmb0FmNTBXMTR5NWUxOVBZQ0c3ckxK?=
 =?utf-8?B?aFh3RkNGajNWMUYyN1BTdTh0em5BMDdVT3B5NzRmbDBBM1NuMzVVNGlTbnRJ?=
 =?utf-8?B?R3ZtOFlqOHJ5c2FVN2Y3VGw0WisxRmtFbW9RTWNLWFJmRXZMTlQyT1dnSUlx?=
 =?utf-8?B?TGxkZjNBNlM4SDBaaFh1ZVp4MTJoUE1Nam5QYnM4eUxKaFBrUVJadlNlRGpk?=
 =?utf-8?B?dXJoOFFhaFJFU2xyY2x5ZGhLc3krcEd1aEZGclEzaUVFdzlZUjRxOTVmZHFS?=
 =?utf-8?B?Z0gweTBnTTROeHI3VVJhcGh6NGhFRVNVaS9zZ1NDUjNDek1xbWZOdWlpcjg2?=
 =?utf-8?B?MnhLMU1veG9oVVdBZ2F3TGgxckYyV3RQeWxTdlBOaEhtVk9iVG45T0hHTFRw?=
 =?utf-8?Q?BSdPvjGWecvX+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFXZFdvRmw2UTQxbGRvOGJadW82ZnZtREtFcFNGSDlxTEpjQnJGQWQvY2Nx?=
 =?utf-8?B?RUd4clJnK09vVytrR3owUGFJaG90bFZ5MzF6QzlnUWxLTmZ0c3ZxQlI1ZWIy?=
 =?utf-8?B?WXhkTGx4bG9lMXlmenNmemFVcE9KRTI2T1RqeTUyUDJ1c243TDBvQXZ0UTQ3?=
 =?utf-8?B?R0czc0JBcVZmckRpT1NZdlg0WVh4VW5Pekl5cjFsRmMvYTB2K0dSWVZzZUJu?=
 =?utf-8?B?c1VJa2E1K0orWXhlWDR1b05nU3hVNHBxcVBQZWdiWHY1R1ZKMlFBR20ra2Yw?=
 =?utf-8?B?RnIzeXNrSXZER2VxcmlPWGRKcGswZzUzZmg5MFNiT29UcG9zalczSVdPb2lw?=
 =?utf-8?B?dWhWems5V2xpK0pUbXNkc1N6M1JzWXkrVmxlOWJmb21PQlNHRnRVN1c3eTJx?=
 =?utf-8?B?akE4aG5TczdTcWJWVjBaYmhIUUZTNndIWHhWSjNEMllvVkN1cEY5UVlwdXcr?=
 =?utf-8?B?cjhvZWJDUm5zUmxpL3hRZG5iUUp4TUhvQUhIUFRVdU5DOVM4R25aK2NLMXVs?=
 =?utf-8?B?all3VW9HMGo5ZXdwVVpRVEROdDlzS2hrclM0a3lDUHVFSE93RXZiNDFhK21s?=
 =?utf-8?B?dWd3QXVXM1pQTWRaa01Ha2daamRkRnBTZXpiOUVYMHh6UEE3b2tFcUJTTTQy?=
 =?utf-8?B?SldhM0I5bUUyNUEyYmFUT0FScmIzSTQrY0VSZVN0RklRaitYRGVmSkxHaFdT?=
 =?utf-8?B?NnJ2MXlVdWd5M09XK01mbzh1MlNQcXZrYzRQZE5ZWEo1OTljZDVORGFsTU5p?=
 =?utf-8?B?Z1oyUGtPMHI5VGVqSG1YVkpHbmlCeU9ZSjFQZWxOazRGV1VyWkRNeG00R3V2?=
 =?utf-8?B?cndNeE5TdG1mMzJUbDNMd1UwVXRIZHUrYk5QY2JiUEx0MmcybXpLb0ZaSGJT?=
 =?utf-8?B?TURLZjhHWHBEbW9tSGIveDh1MEdSRTNLdjBxRlZqeEpEcWJJWklpZ0oyMUxP?=
 =?utf-8?B?K0d4R3ZVNDgzckRJRzRSZXlGditDWHAzRnpKVjh3UE1hSWhKVGxCL0Y4dEZJ?=
 =?utf-8?B?OHhmbHRlYlhnMzcxeHlnNVQrUzRsUXNPQTF0cm9Da0JPdDZRQjFMMGNYR0I3?=
 =?utf-8?B?ejllSi9SQnNlcXFuSWdxVlpGQzQzNVlacWw0Z0pFcWFOd0NzaEVjTU5lOEZP?=
 =?utf-8?B?VFZmRDhPTmRSUVpwVFd2VkdldmdVUDhzZ2hWZ3QxTXQ5UEo1amtlaGovQ2NH?=
 =?utf-8?B?dlRWZDlXTkhQK1B2eHVOYWVVaGVtLzUzYmp6L1VPS3VZMENJOHoyQ0U2cVBl?=
 =?utf-8?B?TStWT2prekNSSEEzMGdHdGNQMk11U2s1VExRLzhuNWw1dnBkYXBPdUo3M0dy?=
 =?utf-8?B?MDBXSGNjUkhJODJ0RTB4d1ZhcFYxV1luVEtXMlhaaUFXc3FyMEl6NWJHaEhN?=
 =?utf-8?B?ZjFxdGhmSVpNUEhCUERVT1Z5VzRyNjhJRnVaSFhTV01DeHpSQmgvTTlkNHNH?=
 =?utf-8?B?ZEM4aVNieC9KeWRmaXJEYnU4elhna3R6bGlEWkpIeFhTZ2FOTHd0R2JFa0RB?=
 =?utf-8?B?TEVNNjJVUVpBNjhpckdZYWJGU1JTVkhLdERLa0JsTmUwa1h0U014YWxiZ1F6?=
 =?utf-8?B?ODF4M25yM0VvNDFKci9vd0FCS3pHY01HUGNBaHJnWU1JNEExcVFQbDFMVDJq?=
 =?utf-8?B?alFiaFJnWDA4ZjkwQjFRdUhnTGpMTVNnR0xzeEdLK0xWVERXWFZyY2lYNkZV?=
 =?utf-8?B?MGZXWkswZG9rYTJyeDVFYTVhSllFNXlERld0cXNJRXU4SE9mMldSQWJneHZC?=
 =?utf-8?B?QmkzUHRZT2RjTHA0cTMzL1RDWHgyUkRmUjkzcktWbVpPcE55SVNXTlJleFBM?=
 =?utf-8?B?UkRDL1VycTVaVWM2amtvNzlETHlaMm40QzFtZGRkZFFSRWdHdUM1QWE5dm03?=
 =?utf-8?B?aFdQQmJvNWZBMEtWeERTeTUzOVI3eU91UXpqOXFrNFdiUXlFWlVZK2E3dUpk?=
 =?utf-8?B?ZjJjdFA5eFc5ZVJhdlBBRVFkTkVIR1RiZ3RqeGlNU29PRXJ4Q2NqZnp0MXJY?=
 =?utf-8?B?VkV2ME9xcTRpT00yU1pIZ3R1eDZ4S1JUYkRpRlJZaUptRGlMS0hobWJwWnVP?=
 =?utf-8?B?bStNSkNPMnFweXU4TFQ4c09wbzQ5bE9oSmpzakZiRFJUelhteGNtNkRmZko1?=
 =?utf-8?Q?VAzwUUmDUqI5/pOY509uTPJV4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e00da9-c5ad-49c4-f526-08dc91bf4082
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:56:18.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+2tW1uSKcaq430a3oHeOaKlc/rrJ2Rcc1D7+ZmCt8X26sCMVAHg+V4MVJHU80mlftxHa7LrCUKA5HwRIKihZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides RTC feature. To i.MX95, this module is managed by
System Manager and exported System Control Management Interface(SCMI).
Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.

This driver is to use SCMI interface to get/set RTC.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/Kconfig          |   8 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c | 168 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..8122bfeba8c0 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1827,6 +1827,14 @@ config RTC_DRV_BBNSM
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-bbnsm".
 
+config RTC_DRV_IMX_BBM_SCMI
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	tristate "NXP i.MX BBM SCMI RTC support"
+	help
+	   If you say yes here you get support for the NXP i.MX BBSM SCMI
+	   RTC module.
+
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..8ee79cb18322 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
+obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
new file mode 100644
index 000000000000..a634e5915d2b
--- /dev/null
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+struct scmi_imx_bbm {
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct rtc_device *rtc_dev;
+	struct scmi_protocol_handle *ph;
+	struct notifier_block nb;
+};
+
+static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+	int ret;
+
+	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
+	if (ret) {
+		dev_err(dev, "%s: %d\n", __func__, ret);
+		return ret;
+	}
+
+	rtc_time64_to_tm(val, tm);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+	int ret;
+
+	val = rtc_tm_to_time64(tm);
+
+	ret = bbnsm->ops->rtc_time_set(ph, 0, val);
+	if (ret)
+		dev_err(dev, "%s: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	return 0;
+}
+
+static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct rtc_time *alrm_tm = &alrm->time;
+	u64 val;
+	int ret;
+
+	val = rtc_tm_to_time64(alrm_tm);
+
+	ret = bbnsm->ops->rtc_alarm_set(ph, 0, val);
+	if (ret)
+		dev_err(dev, "%s: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
+	.read_time = scmi_imx_bbm_read_time,
+	.set_time = scmi_imx_bbm_set_time,
+	.set_alarm = scmi_imx_bbm_set_alarm,
+	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
+};
+
+static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_rtc)
+		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
+	else
+		pr_err("Unexpected bbm event: %s\n", __func__);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	int ret;
+
+	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(bbnsm->rtc_dev))
+		return PTR_ERR(bbnsm->rtc_dev);
+
+	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
+	bbnsm->rtc_dev->range_min = 0;
+	bbnsm->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_rtc_register_device(bbnsm->rtc_dev);
+	if (ret)
+		return ret;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
+	return handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+								SCMI_EVENT_IMX_BBM_RTC,
+								NULL, &bbnsm->nb);
+}
+
+static int scmi_imx_bbm_rtc_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_protocol_handle *ph;
+	struct scmi_imx_bbm *bbnsm;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
+	if (IS_ERR(bbnsm->ops))
+		return PTR_ERR(bbnsm->ops);
+
+	bbnsm->ph = ph;
+
+	device_init_wakeup(dev, true);
+
+	dev_set_drvdata(dev, bbnsm);
+
+	ret = scmi_imx_bbm_rtc_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_rtc_driver = {
+	.name = "scmi-imx-bbm-rtc",
+	.probe = scmi_imx_bbm_rtc_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_rtc_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM RTC driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


