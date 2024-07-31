Return-Path: <linux-rtc+bounces-1646-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF954942F08
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DEC1C21C9A
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2DD1B3F09;
	Wed, 31 Jul 2024 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ESMrakXZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013052.outbound.protection.outlook.com [52.101.67.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622981B3750;
	Wed, 31 Jul 2024 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430073; cv=fail; b=N68UGi22egOYsA73RtvOtPafhjUmQb7hvUK6wouwuf92gQpbZdiIls78MClbAPD3TcGOMD8W8jUA6dSfBCxi/9N2KfDjX0m3hAkSGAJb7o3qBR0QnQuFCSaP3dpkrbqHXGwPqBVEQ2B8MM+ad0wzgBaLXiWs/pvZLRjqoOjZdgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430073; c=relaxed/simple;
	bh=lB0din7YUuASkUYMScY/zMN+DX9irTFze5qsm4nmRik=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bb/xvKdYrtPIvcN+sDR577Gzzdw2D8GoZWusV0TyCT7nE5fN9fSoGqEnwK1qAwq72yxfQEyetdZ0oBn2fO2JV4Li+8BsOJbGRCEup0KDvPf0pmDmHBgIM4nwMZmCXqbVl/dsEn4PIcVGAte8n0FN0en/t6330yRZGIa1EFywnG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ESMrakXZ; arc=fail smtp.client-ip=52.101.67.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5QN5FvDphkFViJ76j7p1RvoU6sDUGIu1t36VB2WvGeEoczJAqL4UeuWs8iyFplAgP+xGYnj2o53aSIJeEYcYyUfxbRKEuVNIy0onrc5cEaQqytcRVafoNI9+w04yXN6x1KsQdce0OxlNrbsyUAMQ19mbwaWtuT+6RmcxZegQi7SZNT/XfIXiooPDAMarpWhi37yQx3knJYuV9U/sH7zcEtJnapamCDXEZkKJsjEkvLbM/HXYitghVThWqzgsW8K8TbccMoKn9UHSKTx47/eJUCqd+SK3VE705iWIricXfXj3ZG1kFAs/9eR/xSQhhIq/RvweDN8I4zNhphe97Rz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y1quUvokU0Up4oQp8r3/9zDfWHRyol2aqI1a4ysBr4=;
 b=ZtrfqBw8kV/Wb8O6w+ggYnNNOGrKBd5gv5sw+kjmFNPAutAa0GMouQFks5I31ogSUQH9afMR9W6bs5XV0vtpqAbrVt3NXitNzjjySFyK9rmc3uNQ3TUjG2Wt15zQA6DNU2tk6JGO49C6IvCsFT1n0KB1FI/DhN1RY6k6MkYyN585abSl7uCd/NZjuH6zP7PayhmpwIHhjiGi9N/H0RPwwbr4XFZAjsG5HpDAc3qlYKK3tN+kEtyguwXY01mM5fGtAGKw7gy9iSqSvAxABKscuxEWNFtWP3arohQDDbzSvv6BtQ4bT2UPihkwomUefmNOs0I0SDVh1G59f2+R4EtN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y1quUvokU0Up4oQp8r3/9zDfWHRyol2aqI1a4ysBr4=;
 b=ESMrakXZr1HMAx/OnutmfG/mJQFnC6Ya2jVuk/3Vj5UPV5xGhZix1kw5bxlJgnapVs3GmHYM9n3HlXOg3NEfNCA7gmXST+BjMttnY/Iy4GV5JEblPgNi++YilgG5FSERfgCjE9oQbC8Sp1fReSuHxQyC4CXvUZqVPxofQTHd+7M+42ezECLV6mjYCxSj8vXTJ07B39vmJ3TGWnBjgVgwT1SW4DDMvcwibYP/pINeLoiwBLpiMYsUwP7O7MU/Be3bywbamXc3KafvX1mtnSTZI167uIBoRhD9F9tW5/xCtBdtoXGw0M1vbeUbE6XMdmOIj22idwjnfapM0tZ3JBx7wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:10 +0800
Subject: [PATCH v7 6/7] rtc: support i.MX95 BBM RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-6-a41394365602@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=6360;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Oy5Gyoso0Y/G/kwZwRlXVgA45ZaX4xes2SzW2BSybKo=;
 b=LAM7679d6oIlUq8nhpfhhaN+/2UB7pSIBfwX1XVyEmiMjnmrA75iZVe3tFMOCfbba8bn/4JjS
 JLxlgJxtBKuBi+pEHw/AnrTQ3wBIabcyOhX/HfFbUaJ/+65M8UxhmA2
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
X-MS-Office365-Filtering-Correlation-Id: ab3fe108-5eb1-4a65-17a0-08dcb15ef956
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkR4WkQzNGtqZllPRVUrbjVyVkt4NTFwbWRmRDB2dUpreFZBWHRNN3dneGNt?=
 =?utf-8?B?akJWV2o3ZHZIODZyRUJXaVIvTjVPcEM4Y0RiZ3JRNUZFQjduUm1YUURPZjBp?=
 =?utf-8?B?RDVpaWhud0ttSlg2SXJkWEU3bHU0Nk53dnZsSHdIVmtqN2lDckkyVCsvdkY3?=
 =?utf-8?B?a3o4YjJsVHZsQnFWQnJ2bmwvVjhqRkhzaVpDNG9kRFRWdlB5ZDRLNjFIK1ZM?=
 =?utf-8?B?d2JFcmJ3c1l2RTRINkRoWlVlajFOS0hFTFcxRmJRWEFpREZKRVVXYUJhY1lK?=
 =?utf-8?B?cHRVVFJxb2xCRE1GQ24vOWVsZzBaQytEdGhxQnlMbGh4UUh1MlZhY0pMOGwr?=
 =?utf-8?B?YUFuNlpyS1ZIcStqUUo3amR2MlF2V3NKbmtINHloV240RzRjUUNRdS9PK0dr?=
 =?utf-8?B?QkVpbjNGUitRRWRVQUR1Unk3aEQwZmY1MzRoQWw5UDY1eEV2LzJoOVQzSTE0?=
 =?utf-8?B?MTQyK00wRkRXSXZuWERraEZwbWpTOUptUjBMcUVQek44UDhKU1h4L01Ia091?=
 =?utf-8?B?ZTNCenV0RGl6UGRxbHJvVlhmYWs1aEx2Tyt4Y3pqTDdORmNFTXc4L0VJSVov?=
 =?utf-8?B?VlFlSWc4Y2dCbndTTG1JVGtGYTRzbEJCRHNpaGp4MFlCa3JNMkZqMEJqaE1G?=
 =?utf-8?B?Wk92TDFwdFZ3cEVpdmRudEMrL1oxMWl6RDRtZTJqSGM1am1lcTNUUDBvQnc2?=
 =?utf-8?B?aWk2NlZmMVY0cU5sWnpHaXpDTlhpeHBob0wyZGdGb2gwMEFqZkgwc3NsaEs4?=
 =?utf-8?B?TkMvMUpRSTRIcUJjWm94NVhLME1PVmt2TEZnelBqdGhuazF1MUZNUmh1ZFBh?=
 =?utf-8?B?TDRIUmhGVjl0UVN5VytpRHpKdEdIb0tJRjZRYVpWMm5McGR4VG5YZ0h2TjJs?=
 =?utf-8?B?eXdFU0ZUSUVXbXFvdC9JY1ExUWU4SDc3ekd4c0J4UEZoRWt2aFBkVm82S2Fl?=
 =?utf-8?B?SThZdW9jYkxlNmlYTURBSHJoMHQ4ODQ5Q2NKR2Vyb1NUSjY0MndzQThnT0hE?=
 =?utf-8?B?cGtER2dKQXlyQjRuOTdnMXdJTTlnY2Y3SENnYVJVV2g3ZVNQSmw1MUlTRnpH?=
 =?utf-8?B?UlNScEZ0YWxyK1RzcFpPaXFsQVJGVFc2aEJBVmdHdmx1ekc1TFhGdTYyWjFh?=
 =?utf-8?B?Z3Zzc0xQZlJzTE0ra01FQ1JLdHRxeVRkcEE5L0lJOTJtdlozZVU2aERWdnRF?=
 =?utf-8?B?ZmxqY29uOTUzYmkvdnA0Y2FiQmJUcmplMlJBLzFHVzZ5QllJSWdzR0c0TDNM?=
 =?utf-8?B?SUw5Vjlua2ZrT2tMVUFyTDB0cDVzLzYzM2c3Q3ZIR3lXVndYVEc1cVJPajkz?=
 =?utf-8?B?Zk9hRjNEUzNKS0Jud1VIMC82OTJqZlV4emRQci9FMDJ5Y0FuUHl5YStMWSt2?=
 =?utf-8?B?eWtvUTZQK2dHWVVGbFl2UXlpQnI1cmRWMmYvM2JmVkxVaVZqaTI4aFdoclcx?=
 =?utf-8?B?UVgybjU4VkhHNTJ4dTM5YTk0dXFSa2Y3YkQ5NWVkWkdGL0xrYlU2RU9MUlZK?=
 =?utf-8?B?MHV1bENoMUdSNGRzNEpyL0l1UU1PQkhJTGdYaU9wSzl5YWQ4TnpGdUt4TEdZ?=
 =?utf-8?B?cW9JaStUbnJDbmVhRlNkck5LNXVMRkNZd2ZaL1N0RVZPZ2xxVFlINDdRaXdm?=
 =?utf-8?B?cndVd3I3WWozM1AwWWJ5d2tPU01TZVJ1NUNkYTZBc21hb1FxemdFUFIxdkRv?=
 =?utf-8?B?UW43bC9obzdiK21BOEV0THBwclNDNkxuN2p1NGRTYU5PVmZKMXhVb3ZuYS9w?=
 =?utf-8?B?ZUJqWUV6cUNTaVVSVWQ5NXNxcXJKL3JGUzF3ZENSQk1aOU1Kc1FHNjNNL3BF?=
 =?utf-8?B?N2t6WW05V2VrV1A5OXhtQjlENDdDOGRZbytVRmxMaHMxRU5mS1lOTDZ1Vi9K?=
 =?utf-8?B?SUd3ZzZkRVpJeS82VjNwMFJOZXUzdHdybEl5ZDl0MzJFV3JhWEcvTmhJSzNO?=
 =?utf-8?Q?Edtm8php1sg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTR1cHBNOGl1WUlvVmM3SGh0cjliQitUaUk0aTFBajVvbG51K2V4cHpmTnFV?=
 =?utf-8?B?bUZibC9CZFd6OU9selAvaitNQ1phVWpjQlZ2MkNWa1BsNms0YTFIYk1hSkp5?=
 =?utf-8?B?VmNxbXRRejZjOGJtOU95dzA4cFc0blM3ejBvSTZYV1hPbXFheEgxQTlORWhO?=
 =?utf-8?B?N2wwTGdjbVN2VVU1emtnZnROQlBEVks2c2VaYytYVS9oUTZ2MFZVRzUwbEY4?=
 =?utf-8?B?WVhMOUVjT0I2bitTajNvZzR2TUVtd3lRTHBpd09uMklEckJNUWdlYmxFZCtY?=
 =?utf-8?B?RlZ1ZFVmKzRnMGg5bjdQNlVUb1hQOEZzbDVQSzVZSnBhOWpiMHdqK2R5T3FY?=
 =?utf-8?B?cHdGQWZ3WDFHTmhBSVRZVHV0UGVKRStoYm1PQ1R1SXZjelhXa0dlOW1XaDFt?=
 =?utf-8?B?L0U1VXR6TWcyaS8wa0pNMmlyRHdNNEovenkyRndwSXZodk9XMm1aRDd1V3FV?=
 =?utf-8?B?ZlhQd1o4STh5ZEZLTlRaS0VuamVkZnlpM2JGcHVic0VseW5kZmNSOHZqNGJC?=
 =?utf-8?B?SmJrVGhJcDFiN3NkcHR1YnJ5Q0pTQjF0aklpT3RwME5RV1RGVXM1c2twTWlZ?=
 =?utf-8?B?dmZ6TlpQUSs4K1FvVTh0TXVUOGw2bDlEeVA2MmJqRFBpSWxuRmpMVXFUWkQ2?=
 =?utf-8?B?UHIvOUYwNGZsTEcya2EwUWZZSVVCQm5tWDlQRHhGR0JJQ1BzY0xzQXI5RDdS?=
 =?utf-8?B?Zm1oU0UrRHMyZG9uUk5zekorUko2bGdaNWJJSThNY3Y5eEVkTE1OMENhcWlY?=
 =?utf-8?B?UVZqVWZiOUFRbm1IQlU0V1l0aVBRMys3b2JJbWlJS0VvazlmNTk3cnlFalVz?=
 =?utf-8?B?U0V0aWVIb2Z2L1Bveld3RWUwdnIvbVc0SS9uZ1FXZ1JHVEt0aGczS0N5WVd3?=
 =?utf-8?B?RTE3VzdFZ0ZLenVwU1VhNDBYSW1QWXdRWm80MnEyNmpVVnFyMkZrYzNaTHhk?=
 =?utf-8?B?WnVyOGs0Rm5RTWdVdWRnYmRXMzF4NTRVeGQveDRTK1Rzb1lyYmFyc1VOdXhh?=
 =?utf-8?B?eXdLU1dBSFZ2eFgxeWd5NzZxR0hYdWQwdkxqMWdzemQ2czkwMmhOdFRld3po?=
 =?utf-8?B?QzlSUUFsUnlSTm85VGNTK0VWOFdtQ25FQ2Q0aEdxdTNpT3VNRzVYVTEvWVpY?=
 =?utf-8?B?aXFOb09wUGJsNi9MY3BEeUtYOVhpTFJSMytDQndTbTUzcXM1VWxaM095c2ls?=
 =?utf-8?B?RXVOOXlQUWdLQUQydTljNUhraHRoK2RBaTFjbUovSndXUldtRnBOQmZ5MDFz?=
 =?utf-8?B?OWxpMVA0NEgzb0dRTGFnOXQ4OTM0Z0E1ZHBXUXpzaVc2cU11dThtMEpsT3Z6?=
 =?utf-8?B?OFc5Sjd4Mkw2aklmZ1RsQzN5NUNnZHhQVmk0Y2l4b2FGclkxaUxYWSszbDVF?=
 =?utf-8?B?elF3QjRjYlpLNDl3cFhWdTdYYW44OFNVTjRKbGJBSnZPY0dVUGd0TVpSY2xv?=
 =?utf-8?B?c3pmVWEyM05MNXkyd1dzVWNtZm5TVFhlVkdicmdURVJ1Q1VmSXQzaGV6V3lt?=
 =?utf-8?B?MjZCWi9MUERPZmhSOEQvSnI3bE4yK05NZlZBV2E3WFBjdk1DSEdJdjBiR1BU?=
 =?utf-8?B?VERoNWZXVWh2azYxOEt5eXYwcFZHdGJvdU9QVy9mbmlnVXBxWGFuUlRIUWxS?=
 =?utf-8?B?aWJoK0lCUDU0M25wR0VWUWRGVFVSZ090dng3Wm1UL0dNQzdoV3pUQlkzMTJ4?=
 =?utf-8?B?NEdTVTFxMS9rL012cklYNlNsODVCOVpvaG9yS04yZnBnQ0VRRFh3NjVORUE2?=
 =?utf-8?B?RCtrSmV6aXhtU2pHZjlJMG81WjZqaG04eEozc1FYM3BlZVd6cUJIZHB1bURW?=
 =?utf-8?B?M2dtR01aWVlsd055dGI3U3VGT0VzM3g1aklRQWRuT0orTmhjdk4zQnVLYVRN?=
 =?utf-8?B?OHV6eHptcXlONWtVQWVmS1A4M2ZDcnl0ZVkycHBrNFMyZHF6THRQdFRtcVNB?=
 =?utf-8?B?d2FVa1VXTGNJZk9MbGdKTUtXMVFIcElkbFZnZk9hNVFEL1FCTnUyRmRFYmY3?=
 =?utf-8?B?MjJkU0gvT2RXOGpjN1NrMVY3VmpIb0dmNmFVSTJiS2V1bVV1bDBLZlhWa1Vw?=
 =?utf-8?B?dkR0SDBoN3JEQTVmbVJieTB0WWp6ZHBQTksvdDdPdnNqeUM3SUl2emQrbWlG?=
 =?utf-8?Q?FNAgmMtC8sytcOFnFq2lWYBMH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3fe108-5eb1-4a65-17a0-08dcb15ef956
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:44.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMC2Lj8GM/REbjKjSZ5S8TwODRCZSPk/trjIr+IxTYLjr93WvGXw/afcj94CpVOgkhubjo7Cgl6qJ/UcPHDqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides RTC feature. To i.MX95, this module is managed by
System Manager and exported System Control Management Interface(SCMI).
Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.

This driver is to use SCMI interface to get/set RTC.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/Kconfig          |   8 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c | 162 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

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
index 000000000000..daa472be7c80
--- /dev/null
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -0,0 +1,162 @@
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
+	if (ret)
+		return ret;
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
+
+	val = rtc_tm_to_time64(tm);
+
+	return bbnsm->ops->rtc_time_set(ph, 0, val);
+}
+
+static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+
+	/* scmi_imx_bbm_set_alarm enables the irq, just handle disable here */
+	if (!enable)
+		return bbnsm->ops->rtc_alarm_set(ph, 0, false, 0);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct rtc_time *alrm_tm = &alrm->time;
+	u64 val;
+
+	val = rtc_tm_to_time64(alrm_tm);
+
+	return bbnsm->ops->rtc_alarm_set(ph, 0, true, val);
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
+	bbnsm->rtc_dev->range_max = U32_MAX;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_RTC,
+							       NULL, &bbnsm->nb);
+	if (ret)
+		return ret;
+
+	return devm_rtc_register_device(bbnsm->rtc_dev);
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


