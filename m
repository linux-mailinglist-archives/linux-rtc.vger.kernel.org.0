Return-Path: <linux-rtc+bounces-1655-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81768943351
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 17:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A542F1C2195A
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB223179AA;
	Wed, 31 Jul 2024 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rf7ucBiR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F102171AA;
	Wed, 31 Jul 2024 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439742; cv=fail; b=Rk1A5shUIVpVHBaTa+60QAgXUqRMLFXtgI1ZTB/gOxnpwOtyDT3D8Cyy8n6cV1/wvNyeEJ9TuS18bcJ0pS0U+WPm1o3cyOY5T9rJFD+/bMsDmTQyVaFBzt3KsvaSNjLFTDB22ZEZIrgIJGq73TIKemE2HEP0Ra9tuCkS8JnYOfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439742; c=relaxed/simple;
	bh=e4ZmsG1l/mOXGThcooB/GhrnskYn1mOk4SE4A/KUAbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TPD1YcZaBmgiSgZ6JY4zu3o/SZd9yi9GPqd5vUorczZJ4suyPmPJn6RE/cxHgNZr3VwW3+QOePw2Q07JbwSeyQTEqLkYwyhe61fbm5fi/q61J/u7lwTN6/y2s0p9N/laIKfasPbFknW8KFvpti0ONc4WiMpXoVx7pNBzmJsmq8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rf7ucBiR; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLmOwY+Wl027IZ2eapcVUZwpDHH1b3QpyG1oijFaHgJ1eCS8kEJPHrB1ptuYbp0Tfq2XsfA1/5P6YGz3IeWxs9C7XRDWii7t/0o9CPEN+ehzdwR/qAqnDsgQ/PkO6Wg5tAcvRKJqRqaf3jjmqzLB0HCwXZ28mj5Q/ijwc+24k0bQZFm/FK8Iybm3GKgTeYLbFJTpHl/0JkmZUqLCH5SFprJ5Xe9RcYM+pGvxy6BFwGYjDgHi3c4tGRPH+jC0mVzH1U3HjOK+1rZwi/JH0FugJhpmayWvvtXhD7etqBVycZwSsYo1oD4mKLM4zFdBzmXBbHDFj6iaf2SKTqXXiICymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ZmsG1l/mOXGThcooB/GhrnskYn1mOk4SE4A/KUAbg=;
 b=gw9wiPsRQhnmg82RZfsOnwVb3G05HCfm6F7EDo0x18iXCYsMfd5IXtcwvUf73Z0EZO6gkVBLRGyOtG/2X6QQrMEeP0ejx0apnj5+juF4edGBLW4KwPiidikzMpTsv8RiMyI0wdCFOJmlxWrgAasqgNe3lxK2xRWC9BZUHe42PyCNWAGQDUtHznMmJTiUI5X936L9G2uBx0pNXDLs/WsDPH20wFSzUyB4XqHnsvkwxF2/Ub2oUc9jVqddcU6zCfEuHKgVxOXlDOTJGAs+zS8ViE4U1sKtNzA8cdAT7ipmUmzR/Dfb9Zp/5vzAf2smEgqC4UAS54yjs+865Th+iA/fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4ZmsG1l/mOXGThcooB/GhrnskYn1mOk4SE4A/KUAbg=;
 b=Rf7ucBiRPksdpSV5pTq6M7AJHY+y6k2EidL4leg+ON3Q/lpCI0L/4t4rzm71jqQJneWBHjGrH85+bGXue9cAmzEXHRMtKTsJS/w69S6fKIU85/63+OC3bfikGuli2pU9JCEVH+bh3+HOSjPpT7ou51sgUdD/esknEHmADoAJ1awL6CuvbMRwx97tBPzbpYHPUIEEdf9WRrpJs8rhESb6FlFh1WELoqS2eoF1CKl4GW3gYyDS8e8MNR+S3DZ8nfHwroTE3PMzfCk2HF316mu/QcNSr7JcG7qYDCEKtel2DNOSpvrQrGuaPB0AzoqBJAuwfpnNvX+fmNBnwgLKrdd6Lg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10302.eurprd04.prod.outlook.com (2603:10a6:150:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 15:28:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 15:28:56 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Topic: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Index: AQHa40fEPyVCotchkEOnFP0xvgvrn7IQyt6AgAAoAxA=
Date: Wed, 31 Jul 2024 15:28:56 +0000
Message-ID:
 <PAXPR04MB845929B61EF637D67BDEAB0088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <Zqoz6RVcvNLEh2UT@bogus>
In-Reply-To: <Zqoz6RVcvNLEh2UT@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10302:EE_
x-ms-office365-filtering-correlation-id: 26b22bf0-930a-4109-080d-08dcb1757e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHJ4aitRK0FVbjlXN2dJeGFDWDJvZ1pCa2dyWGtIODQxNWcwbUttdFpPdVJO?=
 =?utf-8?B?MElHbm1DN1RWVEJFSi8vQWpXK1cyNnFyZVVtSzgxdjdjd3VxNGVOYW1lVC9N?=
 =?utf-8?B?dEt4R0tkUmVKMWxsR0w5VWFjNmlWa1dqanIwRlBSOVhvSWJLWFNrdUxxbEVE?=
 =?utf-8?B?NzFDV1M5d0Vzdi83a3JVS2k5UXk0aW0rd2xUN0grSGF0ZGlwZ0tDLzdzVmVP?=
 =?utf-8?B?OTZjdUVJcFJkTUplZUlTVytXYlp3UnhTZWhuMEJkeG1mQTRDekVKUkd0akRQ?=
 =?utf-8?B?RVY5SkhubFpxUWV1WWkvcWFvd3lnQi8vN3ZaR3pPdndCeG1mTUFwODFuaXRM?=
 =?utf-8?B?Rm80NlZIVFFFOU5Oejk3QWV5dTZoSlVjZzE1L2cyZlQ4R0djai96WSt1ZTV3?=
 =?utf-8?B?Sjl3bkJzQWl0ZE9CNlNGcGQ0cGxyQWt3RkhNSmF1MzRSeERnczVNVkw3dWJl?=
 =?utf-8?B?Z0oyc3YxdXF2NFFwUFphRGNJc2kzbEdpY1V2Sm8xVWJKSXFrZHRmY29LLzRB?=
 =?utf-8?B?RnNDWms5UG5nYmZEVTZUQTNsdE0xdTltbXRYaTdWNVI4dmdpQW8vY0N4cTd0?=
 =?utf-8?B?NlhCc0pxQXJIR3Z0VGU2WmJ5UDMrNlRWYXdla3dFajMvSjMwenlMdWpTZVE2?=
 =?utf-8?B?eDRReTFTL1dLcjVIUkdwck1xb2F2ZVo2aXJJS3plZG5BTjBrUW0rTXBXNG5J?=
 =?utf-8?B?b2dRT2dCODJvZHpPd3VJQnBaRE9Ea2VseHlXOWEzNHM2Z29KaldTNE9tVzQ2?=
 =?utf-8?B?cytMRlJmWWF0dUpqR01QUEZzNTB3SDVGamFNR3F1bWI5SjhXb3VxK2JqdDk2?=
 =?utf-8?B?MG45Yzc2WlV1dWltcHpGaGo2TWRoV3RQQUFhR2t0L3VSWGNuNVE5UTJHcm1r?=
 =?utf-8?B?NjJGeFZXY3pMMjQvZEtFblduUjMrK2pFVXVibGplQlNDYldoajR2ZGdrQkJv?=
 =?utf-8?B?UitLVG5YLzd2NHRzYzN4a2VkQnpjRUZYMzRVRjA4dTNqTUZRbzNGbU9UQlB6?=
 =?utf-8?B?V0hYUDZ0ZjZvejh0T0FoQzNWYXNmaER2TXU5QjRnTEhTNHlpcmFTQUNnZHg0?=
 =?utf-8?B?NW9ybnE2b0tZcXhKMFRBWEEwWHNxWTI1VzlxUW9wRmpEQ2djb3dsd3J0OSt1?=
 =?utf-8?B?OG9LZi83Uk01cXRQTTgrd3h2MXRkVmlNMUJ5RW5jYlh3Rk5NN3BLZHp0TmVv?=
 =?utf-8?B?Y1Y3WVduQ0Z5RFdRU3laTWp0cDRLMkgrNVkvZWxTdW9rWXV0d2MvUEZ5RVRt?=
 =?utf-8?B?UkExbG4zWkt4TlA3M1FpSWl4U2FibGdwcHl0UHFGajF3VWQxVUlHaTBYaENn?=
 =?utf-8?B?MWkzR3gyRHZqNDRNaUh0MHd1NjlEQlVmdUp3MVdlNVMrSmhQVmhnRmJXRWox?=
 =?utf-8?B?eVRDOEJTcU13dk96Skx4bWpOM0E5V0czUlpkdlUzNDN4c0ZSS2ZRZnpPNWxy?=
 =?utf-8?B?dHVqYWYwamNCSmkwUzVFbEVNcXVBc1o3MDNJTWJLcThhVXYzTU0rVUZwZzZr?=
 =?utf-8?B?U1BqaUdFOUZKQ3VwYmNEZzVCU0xvNURTNStGT0xxeUtlcFhzOThqUmVOUHZ6?=
 =?utf-8?B?dmFRUUMyc2U3OWFDa3A3Wk0xMGNaZUVyMnNUajZoWW9Nc1NxMVVvTGt5a3hI?=
 =?utf-8?B?OGRlaGZGMk1sL2l6UC9sTDZpelJFNzkrVWxlTTNJaFRkbFIzaStQMUduMVV3?=
 =?utf-8?B?cDRwT2pyeXluVHRreSs3ZVJWR1Q4NmNEQy9SZ3dDU3F5SmtXb0c5RXdOL3U4?=
 =?utf-8?B?QWtLZ0dId2lNVk1ZWGlxTGkzRE1sZGM3cDZIcGxDOWp1S08rdmZ3NjJCZmRh?=
 =?utf-8?B?ZDZNY1BOT0F0VE82ZU5vSUlqL0lXcEVKOGZKbkczSTlZMVZ1Nm16R1dxQnBL?=
 =?utf-8?B?K0RUaWFwZVc5MCtUVk5mNjJWdzBPZkZEdHcyRTZDRUkxYVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXVhTDEva2RNUlFzZFQyNUUzZ3BMc0VZNU4rak1qcWVvWnRra1F1bXJxQ0Ns?=
 =?utf-8?B?YXFjL1lwRkM0ODRoaEQrSVI0L01WOWNXbjJFUTFtZnl6MWk5UG9XVXBuNy9B?=
 =?utf-8?B?K3lYbXk1cEdDbm50TDRhRkdVSjA4ZThSNG5zT3BuaHpvdEljakRJdDFpa3hC?=
 =?utf-8?B?MThGemJBV0tRUDI5UEJtU1lsRUpmM3pROGJZSmRDenJqNGpsd3o1SzFRNXhv?=
 =?utf-8?B?bDZBNzZjRHhJOXdINnFYNCtmODJEb3hHTmpCOFdmd0tRNWJpUWM3MzFpVjk0?=
 =?utf-8?B?d3ZQZXFkRWNpT0pmRVIrREttSTNtcng0Q0xJUzlhbUlvcUlHdk82VjhlbnZN?=
 =?utf-8?B?WEUva3VEVjkrbDd2MkhIVDBpak10N1d5UmpqK3hxT2t6U1RXbVkzQVV3YVZZ?=
 =?utf-8?B?MGdvSW5ZWVB0NXVoY1U5c3ZGUHRGWmNYWGhDQW0yQmNYNHQvYnVjR3lmcUEr?=
 =?utf-8?B?WGlvQ0U0czVjekQxTjVNMUFEc2J2Rm54SlN3c1RFVmpEaDh6akxHeHU0Wmcv?=
 =?utf-8?B?OG9tY2ZzOFZkVzhpZDYzMExWRkU4ZVdVYWdJcVRGeVlFUXEySGlHbjBwMDRn?=
 =?utf-8?B?Um5CaVVvYzVhWDBlOGZ0TVhXNnBvUGVpSzJhZ25RMVNJQzcxcElMbjhyTm8r?=
 =?utf-8?B?Q1lUM3p6MkhyMG1CQm9lZmVDYmd1MDdqalROSXdxYUFPTFpOVzdCSllOcUw0?=
 =?utf-8?B?WWdyTkI0dzJLMVJNQUZDdUZtejJxN1haNThLRDc4VkJncnh5K3JHOTh1eUIx?=
 =?utf-8?B?NWUyeDU5cGJUVnhjNlpyUC9zb3ljdzVIN0ZFYjFkeHorZVd4ekdUNkF6VzdU?=
 =?utf-8?B?Y2Z3NlE0aDB3dFBqZTc0QjNheE5FUVo2N0NHdEFoaWNXeVBLRHlQNFR5NFo0?=
 =?utf-8?B?TWxsbW43R1dlb3VGOENJb3liQVNZamVzdXlZVzR5R1NwZ2hyNDZvVTV4T3d4?=
 =?utf-8?B?T25ISGxqZTFNb2FucXZxUngzMEJMbEZWaC9vcU45M1Z0dTVENm5wY1RLY2ph?=
 =?utf-8?B?YnR2Y28wbGU3dnRCcG9reml6L3dNQjFMaEJRTkpwQzQ4Ylh3TG9CS2ZpcGlZ?=
 =?utf-8?B?VGhkT0t2SnJLelhCNXNGRXk5NlZ5b2RhZnVsR3dvODRpRi9pL2xoOXVyNHMy?=
 =?utf-8?B?akRmb1hpaE91SXh5d2pKZktNSVdHMGRiOTljRm5LUnJ5ZGh1cDB6cnRGUllH?=
 =?utf-8?B?U01Ocys0bGRzdnJuWkJLZXQ3MG1xazAyWDlUV0NRRldNZ2k3WHJSREFPZm9I?=
 =?utf-8?B?ZWRGL1gxWVEraFlYM0tVKzZjTUZIU2RMcGFGT1hBb3RvMWZGZVBNQ3JDRlZS?=
 =?utf-8?B?Q0hJOWdLdE4wSUVhSmVXN1d2Q0g0Q25NdE5NNDFKQ1FONVV4KzJGYTBRL2F0?=
 =?utf-8?B?VFpiL3FVUm84MU15Z2Y1WTlWbkJCcmU0bEpVTG45ZHZoRGdySWJQSUo0NXp5?=
 =?utf-8?B?VmNGTWRKOW1tQWpsYndGSm9HV2oydXdXL3ZSN3JQeGN1RElOVldtb3dSZFQ0?=
 =?utf-8?B?M3Z3WktpcjZ4bTlxbEo1ekpMRDh2YmlVemdXYzgvdmo0d2VxNGZDenpMUVpy?=
 =?utf-8?B?NnBPcUFNOE8vdElnY1NLN0RlWXd2OFg5Njd2QnpwNVlhK1pTVU13Q1Y5YWtG?=
 =?utf-8?B?UCtaS25WTmJycUdaTTl0WmcydmE5ZTVhU2dWbEtwUzBBUENZR2lQVkVTUG8v?=
 =?utf-8?B?R3J4dGZsZVozeGZ1bUZRTzVrMjR4R1RzNGhvSVhWSWdtd29PNFNyQWdaMUxp?=
 =?utf-8?B?c0I1dWxDQWh6K1NZdjJ4ejFGVzNnUkRKTEU4Q1d1ZnZSRkQ1Uk5hc2craHo4?=
 =?utf-8?B?a3d4VlE0WXdMU3oyQW0rL3ZmamNZN1BqY1cyaHVnNTBCNko5MUVsT2l0Z2wy?=
 =?utf-8?B?eW93NE9JUkNNWDI0Z0pUOVdXd2Z4STZlTmYwUW0rR1MyK1pVNGV1REd3WkJ2?=
 =?utf-8?B?enVZZjJnSjluWTZud0JFTm5KMEtGM0VpeTVhZlRmTUpTUitOb1JXV0d5TGVQ?=
 =?utf-8?B?cDBoaFJWaHJQSXJXOGdSN1A2dDZLc0lQemJtbjRpYWZGTTk5VzRPbmhiM3JT?=
 =?utf-8?B?eXZuR29ITnd3ZE51eVlIMjJnVTFOZTdwTnZXT2g3QVEwUDM4K3ZVUlQwc0lh?=
 =?utf-8?Q?iekU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b22bf0-930a-4109-080d-08dcb1757e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 15:28:56.6631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fibTnx9ICv6/mUA5ZN6p9HRBxEwbUX0xR/FOz16sq+2MseqyVn25rS64C/Q3Ibb5t9l9Nhsr9TJgoXx9SoQ36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10302

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDAvN10gZmlybXdhcmU6IHN1cHBvcnQgaS5NWDk1IFND
TUkgQkJNL01JU0MNCj4gRXh0ZW5zdGlvbg0KPiANCj4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQg
MDg6NTY6MDRQTSArMDgwMCwgUGVuZyBGYW4gKE9TUykgd3JvdGU6DQo+ID4gaS5NWDk1IFN5c3Rl
bSBNYW5hZ2VyIEZpcm13YXJlIHNvdXJjZToNCj4gPg0KPiANCj4gPiBUbyBnZW5lcmF0ZSBodG1s
IGZyb20gdGhlIHJlcG86IG1ha2UgaHRtbA0KPiA+DQo+ID4gaS5NWDk1IFN5c3RlbSBNYW5hZ2Vy
IEZpcm13YXJlIHN1cHBvcnQgdmVuZG9yIGV4dGVuc2lvbg0KPiBwcm90b2NvbDoNCj4gPiAtIEJh
dHRlcnkgQmFja2VkIE1vZHVsZShCQk0pIFByb3RvY29sDQo+ID4gICBUaGlzIHByb3RvY29sIGlz
IGludGVuZGVkIHByb3ZpZGUgYWNjZXNzIHRvIHRoZSBiYXR0ZXJ5LWJhY2tlZA0KPiBtb2R1bGUu
DQo+ID4gICBUaGlzIGNvbnRhaW5zIHBlcnNpc3RlbnQgc3RvcmFnZSAoR1BSKSwgYW4gUlRDLCBh
bmQgdGhlIE9OL09GRg0KPiBidXR0b24uDQo+ID4gICBUaGUgcHJvdG9jb2wgY2FuIGFsc28gcHJv
dmlkZSBhY2Nlc3MgdG8gc2ltaWxhciBmdW5jdGlvbnMNCj4gaW1wbGVtZW50ZWQgdmlhDQo+ID4g
ICBleHRlcm5hbCBib2FyZCBjb21wb25lbnRzLiBUaGUgQkJNIHByb3RvY29sIHByb3ZpZGVzIGZ1
bmN0aW9ucyB0bzoNCj4gPg0KPiA+ICAgLSBEZXNjcmliZSB0aGUgcHJvdG9jb2wgdmVyc2lvbi4N
Cj4gPiAgIC0gRGlzY292ZXIgaW1wbGVtZW50YXRpb24gYXR0cmlidXRlcy4NCj4gPiAgIC0gUmVh
ZC93cml0ZSBHUFINCj4gPiAgIC0gRGlzY292ZXIgdGhlIFJUQ3MgYXZhaWxhYmxlIGluIHRoZSBz
eXN0ZW0uDQo+ID4gICAtIFJlYWQvd3JpdGUgdGhlIFJUQyB0aW1lIGluIHNlY29uZHMgYW5kIHRp
Y2tzDQo+ID4gICAtIFNldCBhbiBhbGFybSAocGVyIExNKSBpbiBzZWNvbmRzDQo+ID4gICAtIEdl
dCBub3RpZmljYXRpb25zIG9uIFJUQyB1cGRhdGUsIGFsYXJtLCBvciByb2xsb3Zlci4NCj4gPiAg
IC0gR2V0IG5vdGlmaWNhdGlvbiBvbiBPTi9PRkYgYnV0dG9uIGFjdGl2aXR5Lg0KPiA+DQo+ID4g
LSBNSVNDIFByb3RvY29sIGZvciBtaXNjIHNldHRpbmdzDQo+ID4gICBUaGlzIGluY2x1ZGVzIGNv
bnRyb2xzIHRoYXQgYXJlIG1pc2Mgc2V0dGluZ3MvYWN0aW9ucyB0aGF0IG11c3QgYmUNCj4gPiAg
IGV4cG9zZWQgZnJvbSB0aGUgU00gdG8gYWdlbnRzLiBUaGV5IGFyZSBkZXZpY2Ugc3BlY2lmaWMg
YW5kIGFyZQ0KPiB1c3VhbGx5DQo+ID4gICBkZWZpbmUgdG8gYWNjZXNzIGJpdCBmaWVsZHMgaW4g
dmFyaW91cyBtaXggYmxvY2sgY29udHJvbCBtb2R1bGVzLA0KPiA+ICAgSU9NVVhfR1BSLCBhbmQg
b3RoZXIgR1BSL0NTUiBvd25lZCBieSB0aGUgU00uDQo+ID4gICBUaGlzIHByb3RvY29sIHN1cHBv
cnRzIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zOg0KPiA+DQo+ID4gICAtIERlc2NyaWJlIHRoZSBw
cm90b2NvbCB2ZXJzaW9uLg0KPiA+ICAgLSBEaXNjb3ZlciBpbXBsZW1lbnRhdGlvbiBhdHRyaWJ1
dGVzLg0KPiA+ICAgLSBTZXQvR2V0IGEgY29udHJvbC4NCj4gPiAgIC0gSW5pdGlhdGUgYW4gYWN0
aW9uIG9uIGEgY29udHJvbC4NCj4gPiAgIC0gT2J0YWluIHBsYXRmb3JtIChpLmUuIFNNKSBidWls
ZCBpbmZvcm1hdGlvbi4NCj4gPiAgIC0gT2J0YWluIFJPTSBwYXNzb3ZlciBkYXRhLg0KPiA+ICAg
LSBSZWFkIGJvb3Qvc2h1dGRvd24vcmVzZXQgaW5mb3JtYXRpb24gZm9yIHRoZSBMTSBvciB0aGUg
c3lzdGVtLg0KPiA+DQo+ID4gVGhpcyBwYXRjaHNldCBpcyB0byBzdXBwb3J0IHRoZSB0d28gcHJv
dG9jb2xzIGFuZCB1c2VycyB0aGF0IHVzZSB0aGUNCj4gPiBwcm90b2NvbHMuIFRoZSB1cHBlciBw
cm90b2NvbCBpbmZvbWF0aW9uIGlzIGFsc28gaW5jbHVkZWQgaW4gcGF0Y2ggMQ0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4NCj4gPiBDaGFu
Z2VzIGluIHY3Og0KPiA+IC0gSnVzdCBjb3JyZWN0IFItYiB0YWcgZnJvbSBSb2IgdG8gZHJvcCBx
dW90ZXMgIiIsIGFuZCByZWJhc2VkDQo+ID4gLSBMaW5rIHRvIHY2Og0KPiANCj4gSSBzcGVjaWZp
Y2FsbHkgYXNrZWQgeW91IHRvIGF2b2lkIHJlLXNwaW5uaW5nIGp1c3QgZm9yIHRoaXMgcmVhc29u
IHdpdGhpbg0KPiAyMCBtaW5zIGZyb20geW91ciByZXNwb25zZSwgeWV0IHlvdSBtYW5hZ2VkIHRv
IGNodXJuIGl0IHdpdGhpbiB0aGF0DQo+IHRpbWUg8J+ZgS4NCj4gSSBtdXN0IHJlc3BvbmQgYXQg
Zmxhc2ggc3BlZWQgdG8gYXZvaWQgc3VjaCB0aGluZ3MgaW4gdGhlIGZ1dHVyZSDwn5iiLg0KPiAN
Cg0KVGhlIFY2IHBhdGNoc2V0IHdhcyBwb3N0ZWQgYXQgMjAyNC0wNy0xOCwgYW5kIEtyenlzenRv
ZiByYWlzZWQgdGhhdA0KUi1iIHRhZyBjb21tZW50IGF0IDIwMjQtNy0yMSwgc28ganVzdCBhZnRl
ciBJIHBvc3RlZCB0aGUgcmVwbHkgYW5kDQpzdGFydGVkIGRvaW5nIHRoZSBuZXcgdmVyc2lvbiwg
c2luY2UgaXQgaXMgYSBzaW1wbGUgdXBkYXRlLCBpdCB0YWtlcw0Kc2hvcnQgdGltZSB0byBkbyB2
Ny4gU2luY2UgNi4xMS1yYzEgbWVyZ2Ugd2luZG93IGlzIGNsb3NlZCwgSSB0aGluaw0KYSBjbGVh
biBwYXRjaHNldCB3b3VsZCBiZSBnb29kIGZvciBtYWludGFpbmVycyB0byBhcHBseS4NCg0KQXMg
SSByZXBsaWVkIGluIHRoZSB2NiwgSSBub3QgaW50ZW5kIHRvIGJyaW5nIHRyb3VibGUgZm9yIHlv
dXINCnJldmlld2luZy4gSSB3aWxsIHdhaXQgbW9yZSB0aW1lIGJlZm9yZSBkb2luZyBhIG5ldyB2
ZXJzaW9uLg0KDQpTb3JyeSwgYWdhaW4hDQoNClRoYW5rcywNClBlbmcuDQoNCj4gLS0NCj4gUmVn
YXJkcywNCj4gU3VkZWVwDQo=

