Return-Path: <linux-rtc+bounces-1698-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC295C887
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DB11F24632
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548B414A090;
	Fri, 23 Aug 2024 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XMtt+t2y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BB142E9D;
	Fri, 23 Aug 2024 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403411; cv=fail; b=iQEjs96jOSSq2WqpZd6Yf6/IJvfjFYgjT5XEUTKbXjGf+06Nq9zfHAk1MqcpF2jLT5WJEH50dQ4XFmGv4VOowvn9Qci5j/1JsDqlpVPB3EbmTU/goTdFpcR7xmL3zaoBQDdA/xERDtIgvIGiFxUkqaYVj6tNS9k+peDGNb+kdEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403411; c=relaxed/simple;
	bh=WB+BNbVE1m3CHeI9JrX6Grss+Ej2vNZ3FOpXMFlfjQQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SGXyHT4+shejX1CoDI2EcggyyJO5KOJUN+m41VDFrP34msTwg0EH/wzzgI79Be84mwjaHyH3DO90/I+l4aig2vfvpSisj31mlOweDtpPliQqng4INqZAKJ6pmA91NJg9/wOqjuaGjyHwxwIs6B+OzLVyM+aEqkn3505acBrTKTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XMtt+t2y; arc=fail smtp.client-ip=40.107.105.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cObT+/DLCDuJ9If8f71au86txkGL8g98EAQeaauUXJ0LUiP4U+iQgiN3KK1pbvrcYNKV7hoJedzkJjLHxWAONqh8R1C2GlTmFppKoLU5IIta5jl2oeEhriUEDkFnj3inN85voJxULjOzSflopwNmKWVnv0gScHSK466AMMDXVHT/m3KNagRsTPkuxOadb5UBJaEnNStPz5thIPGDoxgPR11ulMahWoiJUGwdDzKMn/+zzig26OTgDw/IjvICxMX3OcAGJbqbOZJ0zq56kmoDQUY/2nQzBJxy4VsLx85ssD+04M4dZWNopvaz5B5py+/R/oXgrm35yhdY7IwJFwyVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+V10xMLx+TaHeoiETnGwqe7zHLX0pJSrGDnPWaGALY=;
 b=YhexHpmSyVcke6LH67BU+sc78i2nFapO7ErQYTSfSX3lf4w2OlzVIO3riaIHRT8WESBRgHpVwK/kKfgQhIokZH0KCjjXcJZCyGt/BCumNriIJIplIzuS66RD55yepYAc+JULJnU6lakGRC8AsaflaOOaV3AZmIkDk3ccuxjx+6DaS6BwLytIvQ8mHhRakxU+PyMnmBbG+wUtCjUT8fXbAmUUrsxgbGa7i/TqKw6Rl68QHI3sMc1kJc0M8/x6q0eQsQPYwlLE2+l8vV7s0w3kiGIZ/6nTnUj4mYPJu1hX8NLuQGoB92RFPJG1eyKa7S0j8YJEZWADTmwmduEBgj7+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+V10xMLx+TaHeoiETnGwqe7zHLX0pJSrGDnPWaGALY=;
 b=XMtt+t2yy7wSVLwcJ/wJqPcIWpllgXnWV5u9nSWDnimoJPHE0NQFfqmPIah3vAhOtNxh4amDUGG8tkqki1gOJh87tYctYTO/e/CoskNzUb0zXYQhmD1i5XS+pAFOLlbbNA7Et6F7GMs2/d8vaPLqFsdyBOMnJKHw7ETzpf9Pd/Blct3iwmEM5v+61pJeVDBu3wUfup85ngdcRUMHysKjafVcrCLRht4+5qImqXpFfvLYROpToqer1rDubN5k/Oxvda6HCA+5ZKkZe8muumyk+NhSR/vA/WvPiAKywNmZ9aJ/Qkf9n/VCgJig5MpVzz2QXScbeq3gr0JNSi+x1/zXwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:56:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:56:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v8 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Date: Fri, 23 Aug 2024 17:05:16 +0800
Message-Id: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxQyGYC/33QTWrEMAwF4KsMXtdFtiX/dNV7lC5ix+l4kWSIS
 0gZcvdqZpOkhII3z/A9Id1FzVPJVbxd7mLKc6llHDj4l4tI12b4yrK0nIUGjYBAsvRLIBljL/t
 Sk5y1jJRDq7FpE2rB7jblrizPzo9PztdSv8fp5zli1o/f/9r4gQxdCspbTzbp92G5vaaxF4+u2
 ey80mfesEfjoUFwEDwcPW6eNJ55ZM+rkA2BWgp/PG3eanXmiX301NjYOedTPHq7eaf8mbfsle8
 AfFaWL3v0bufN6XzHvkFlAhpLFnb3W9f1F1HMy9zwAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=7300;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=WB+BNbVE1m3CHeI9JrX6Grss+Ej2vNZ3FOpXMFlfjQQ=;
 b=DJkEKETpgjgjk1xEkqab4fvhTU8HoAsMyZvL0GHX/wS2DegqBPBei+mUtNMaxqbOfQ/zxVmDr
 H/dZENo2dPQBGE1b/EDv6+p985EqfEelrsjBj9xC85p42cEJEFdS3T5
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1198388b-5715-4868-2c26-08dcc35183bf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGlrMDlpZjdBQ2RZVTRjYnRwNTBxQ08zUW1IN1Q4ZGxRN2Y5OWsraW1oSGR5?=
 =?utf-8?B?NUF6MXNaOGdjd21yTzZiM1hSNjVUTnV5cHVSQkxZSjVhY2d5SjJnaitqd1lq?=
 =?utf-8?B?WFVDODEyb3dYMnRpZHZ3a0h4anlUc1F0TTZaUVhjcXpvSllmMmFkTDdQN2NZ?=
 =?utf-8?B?TGpxVUtMb2JVdnhpbmE1WElwMU5vY3BKMlJsZk5KRkNKZEl2Y2szRjNZRHJ6?=
 =?utf-8?B?L1VnMEhlQi9LMkFyZFFtTU52aVZNWlpTR2VFdWtCSG9ITThiQlVPMFRRZk1Q?=
 =?utf-8?B?T0gvbVZBZkFuUjZLL3JheDhPM3ExZDlGSjZmL084cWZtTDNtNFF3K2RZTWJZ?=
 =?utf-8?B?QnhVeTVCK0hObEFjTUVGQmRwYTRsaTlua0o1L3ZWc2RPN3JrWGd0Y2ZMbmZC?=
 =?utf-8?B?Qysra3JRR2FpV05lK1B1UEp6ZGoxb29sV2ZZMTJwcFRESStOOUszdXZnbGlQ?=
 =?utf-8?B?Nk5XeWxCY0VHMjA2a1VsSXpKbHhpdWNpU3VrT1pQekpPQkpvOUIvMFVVdUYw?=
 =?utf-8?B?cWF3emdhbEIwRVBwMW9JUWZ0TlBvSVNMeW1qWE5ZY0xVOUdxZWlQQVVmU2hM?=
 =?utf-8?B?VEY0RlQ1ZFVvMHZCeE5BK3JVMWtMcDhXbWNSUWsydnB2NlcxN0UxWlNsRkhq?=
 =?utf-8?B?cFpscjdEbW9FNE5zd0lrcmlNVmNVNC9SeXd1TUl3R1pCZmNDMW80MjNvYXRS?=
 =?utf-8?B?Q2pWTG4vRnpabU15Y0JZMGhGTnV1SEVGOGcvb3QreTZkQ1dFaTAyK3V2S0lY?=
 =?utf-8?B?STRXZ2lJUnU4QWkwV1MvNFhaeHFZRzJ1Q1Y2R2xLQ0Z1Qko0YldRYjd5Nis3?=
 =?utf-8?B?Y3M1Y2djaHNBbFcySExiZkloaTZoTG5QOFVEektBd2FmeHQvNjlFa1Z0NnVj?=
 =?utf-8?B?bFE1V09KSkE3SVU0S0ZaeGpBSE8zaVR6REl3TVEyMS9ZUUdwd0t3cTk1OHpk?=
 =?utf-8?B?YTBiSEkzaDFSbVdkK0Z2b3FpR2JETnZaaWtJYWs5TStlTkQvVkg4aHFhSkJh?=
 =?utf-8?B?K1FSR2wyM0ZObG5VV0ZtSlJuTy9xWnY5UUU4c3laY1lNNUZ0RXI1N1pIOXhq?=
 =?utf-8?B?bE1hOE1OWi9uNGVHc3ByL1BheTk4TE5wNm40ZU1yTmZEZSszRVJhOGRIRXg4?=
 =?utf-8?B?OGZXUlJ1YVhYNjN3OHJZVDlOaGR4Rlc1UUNiQlhuekRNZXNWVnFPMVgzdUo2?=
 =?utf-8?B?QlcyaEFMa2I2YXBXTHlSWlg4MzFFVjJXYUNRKzZoMFl0N3JhbDREa0JwZmtu?=
 =?utf-8?B?dHVmNzhQNEpIbGVJSHd0bjg4eVR5MTdnV1FDRytUaDJ0THZkYktISzV6bTNo?=
 =?utf-8?B?S2dBTzZCTW40NXFrU0xPUWVSN2xFaEQvWk5ZbWJ0QnhCQ1JLdGVrUGxRd1pp?=
 =?utf-8?B?ZitFbGc4Z2ZvS1hWYVhvWE1NWVRabkU5alo1aEY0Y1hSU2R1ZlJMbXRrdWdk?=
 =?utf-8?B?bDd0TkpvdDg3K2NwcUVLSHU4YWEwK09nNy9DT2FjVWMvK0JUR09HWHBSMm00?=
 =?utf-8?B?UTFSSlhaWTFBTHozaGxlSk84a3QwMG10Z2tRVVFSSDZSMTZjbC8yVjZlRzdL?=
 =?utf-8?B?NTJiRUw3V1AxOUZrQjB4MWtTS3RpWVlwTU41U0NJY1dHNkxZMHpZNmhKNlNZ?=
 =?utf-8?B?ZXgvbkFLNFVwcnBISUZHNC9rTEZmVC9aRXZsb3RMR2xnanZyRUJibXZjNHF2?=
 =?utf-8?B?VmM5Z1pZK0tTVk1uTkZ1WVR4VTlCSE56enFaVGE5cUVDTlNkVkdSSjc4MFl3?=
 =?utf-8?B?bFppN0Z5U0ZBU2xESEYyNjVVMnlqSGVlNWQzb0liZUk3dDcvYXBOdXVOMTBu?=
 =?utf-8?B?RVV6c2ZCVkFLYXVhZHJJcExJWDdIbGNSN0EzMUdjbjYyemY0a3NzRGNmTXR3?=
 =?utf-8?Q?6TrP89w15P1Wh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0swc3lKeWIyVjlQN0NYOWsweDVHcTJSN0dtVk9jVkVJUGlFVTU0eUNpNjY2?=
 =?utf-8?B?aWQzOFU2ajR6VVNpOGNPQnJETHU4a3ZiVlVNWFo2eCt2YlR5MTgvVDJIUExW?=
 =?utf-8?B?VmRMYzd0MGJLZkRnWWRNYXAzdEpxbS9ucTJ3cTljRlZZWHFrZ3lhdm5hQUVn?=
 =?utf-8?B?L2hDTUk0NERUQ2lySXBqZE5MR2t3NUpiQnlMeXNidjNzMXBhT2x3S2VleVV3?=
 =?utf-8?B?Y0tqaHRQWk4vL3c3dTZPRGozaHNFdHVIUHl4S21JZEQ0K3RZUmlLTi9qcG0x?=
 =?utf-8?B?b0xRTFVWbnNEdTBTeE9vOU41M2tUcktQbmJCSzNMSU02SFVkQ2ZDQkQ3WlhV?=
 =?utf-8?B?MEpFeXZ5ZmtISFZxaVErNEE0U2k1QWxSeXpKaXB6dkdrYkhaQzNvdmwxZytO?=
 =?utf-8?B?L0ZFcFBPalQvVkUzUjFrMDY0ZHh5dnM4c1Y5Q2EvZkVkNUo3SEkyTlJQWmE3?=
 =?utf-8?B?TE5lY3JqWThQQmZSZ2dFMDdVaEtITmlZcGc2Q1ZuRXpSenB5ckNGaGkvYmYw?=
 =?utf-8?B?R3ZzelV1N3REaHQ4aTN6TStpSjVHdWZzSG1FNUh3Mm5TRmFvc1hmMUgycmFC?=
 =?utf-8?B?d1piNFMxaVFteFpWc0l3OWR3eHB4ZFZxVHNxbE5iWjZMaXlmcUxGUTdCdmQr?=
 =?utf-8?B?REpnelozcmlSQ3hkQW5URU9vb3FyWDNsaDFwWkpqaWR5dGd6WjNDN2FndHJV?=
 =?utf-8?B?bTZoa2s1TStiTzdhVjhpUFhQcG9mbXBiQS9PbDVLS1BNZnNQUzlOQkpYOVY3?=
 =?utf-8?B?M2hsaktHM0ljZkRQcXpGcnBmZlhqanNBRVZyRTl1STc1b2tpeE9aVzFyeGRi?=
 =?utf-8?B?WWFneWhXbzRkNUU5ckU5ak04L2ZhYXQyV095UHVFRzBNV1hLclRGU2R4S001?=
 =?utf-8?B?dVFBWWpmZnY0VmY1d1hIM05IZ25wVmsxNU9BUFNpSzNtMGlFb1dzTGtFK1dy?=
 =?utf-8?B?K3BVUzhsSndBdWxWY1AzYUowbFozY1d3MmQ3dnRSZ1E2d0ZvZXI1dkhtb2Iy?=
 =?utf-8?B?OUlmNTR5Y1FZck5VNkVsMVBubEFLaDJwZ3hoYjMvNWRoOFlUbTZpY3RweE43?=
 =?utf-8?B?UXJIbWNXUTNQaWROTlZmSWFuaVNNNEQxVXEvRTNZaTZZUzlSNXVpQXU2KzZn?=
 =?utf-8?B?K3RZTXJIOVQvQVR4MkVlc0E0WHdiNFAxS05nMHhmbzdRVkdFQ3J4eG9NRnAw?=
 =?utf-8?B?bEZrclR2NGNqODY4VjV6VHRyQ1BCSC9YVVVFd04weGNocFZrREdzc21iWG14?=
 =?utf-8?B?Y2F1cUVwRTNOM2VxaXZwNjgrVDNkVVQyc2tpOTJaMGxqMW5LdllpcVdndDhI?=
 =?utf-8?B?eDQrQWpySWJlRUw3M21TWW0zbFdDVzB1T2lkOXVpcHRkeVQ2YWx3THRHQk5n?=
 =?utf-8?B?RWg5a01nK3JiVGNSOFZiUE1YbkdCWVlUSWFmdjhxWW40a0ZOZ0crOGJlcC9W?=
 =?utf-8?B?bXhPdkVHajV0TlpPTnF0bWtQOW41ZmRRVVI3MmEwZkV0LzYzeGhEeTVVR2VG?=
 =?utf-8?B?UERFTlVuMGQ0SGY5WlNzazQ1emF2d0hoRUVCYXNneVk3K1BHMllPOUgzZFRF?=
 =?utf-8?B?NkpFVFg1REIxUkZNazI4QmNaUFB3MnBoMGhZQzBQNGhUU25rL0xnemdSam1h?=
 =?utf-8?B?bXYvdDJnT2x1K28vNDVTTWxGTlhETGdvS2JrZHVqdzIyajF1WTlBNVU3aVE5?=
 =?utf-8?B?T0ZXRndyNnJQRThVY1pyb3FXRW9vTVZIWThBS2FHMG43SzFPbE1VMTdVTDR3?=
 =?utf-8?B?R2VxRlhuQ2pseEYvT2hLY3NxOWpsMXR1T2hCSUxvNUV3MWFCMEp6QW1uRFBo?=
 =?utf-8?B?aEhaR0VsSXpUSVI4TUpCTmhVRG9SaWdrNnI5dysrelhGUHpxTExhT1oyY0pk?=
 =?utf-8?B?THNYM0RWcU1Ra2pXbFNwRHZwN0RUeXoySnVQWjE3UWpLWEx0bjQyTGRvcERo?=
 =?utf-8?B?bjk3dWMvcUl3d3hDcWxoaWYzQW41N0c5SmhCZWJCL1hLVHkvSDlLSGY1NTJJ?=
 =?utf-8?B?U05TNDhyN3RLRWIvQVBvRXZRQVRqV08zTUdueVFEdUxzMFpHOGs0ZGNFdStH?=
 =?utf-8?B?a3VjK2lFcHhiZjhVSjM3UUxhWEF6UC9NaG82Znh6TWdXNVQ4WFJKa1RGcUt5?=
 =?utf-8?Q?mRQvZuRcIwItXHDmIVcJA7dNV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1198388b-5715-4868-2c26-08dcc35183bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:56:45.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+5ZQp1v6XslB179HWcPCH/ZBqQIOdLzt25b52X4/QhVVn9DbZTy0q18oTbYpytUytVLOPsuYQlQ4UKmnuAJJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

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

Changes in v8:
- Rebased to next-20240823 with resolving the conflicts in
  drivers/firmware/arm_scmi/Makefile
- Moved the i.MX protocols under drivers/firmware/arm_scmi/vendors/imx/
  Since no code changes, I still keep the R-b in patch [2,3,4].
- Add A-b in patch 7 with dropping uneeded code (Dmitry)
- Link to v7: https://lore.kernel.org/r/20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com

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
 drivers/firmware/arm_scmi/Kconfig                  |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  23 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   3 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 379 +++++++++
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 315 ++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 886 +++++++++++++++++++++
 drivers/firmware/imx/Kconfig                       |  11 +
 drivers/firmware/imx/Makefile                      |   1 +
 drivers/firmware/imx/sm-misc.c                     | 119 +++
 drivers/input/keyboard/Kconfig                     |  11 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c            | 225 ++++++
 drivers/rtc/Kconfig                                |   8 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c                       | 162 ++++
 include/linux/firmware/imx/sm.h                    |  33 +
 include/linux/scmi_imx_protocol.h                  |  59 ++
 20 files changed, 2286 insertions(+), 1 deletion(-)
---
base-commit: 657343ca601320308bfaea5dffbb6dc566e3b017
change-id: 20240405-imx95-bbm-misc-v2-b5e9d24adc42

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


