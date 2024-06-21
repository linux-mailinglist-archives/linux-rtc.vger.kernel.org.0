Return-Path: <linux-rtc+bounces-1376-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB5911C3E
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32D81C23B96
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5F216C858;
	Fri, 21 Jun 2024 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cG6m1w3+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5216B3A5;
	Fri, 21 Jun 2024 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952970; cv=fail; b=CkhH8hqEH635wRuWRvibNZbmTr9UB2WO3UHWvwPrAlRDo1Yk/PyFOQBbaBvq97/iox9ghCKbQ/BfT6oPMcLhW0neHyv5bW5l1nxMX7lV1rkaAHA/ss+ZwdIVVCuNxfYWsY2trkIPWNkzb1nzccdmTaim5Gd5UG5yUHPaZ9i+XR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952970; c=relaxed/simple;
	bh=6va5vkFBCgl5PL/a5ZQoCqeFFLZsb6k2yDH9hHDBRyY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CiBWO5Y94uXqLriOSxlezfZAV5r7s8/ZfywF8uL+1YI65ivFgseaTBZuXm2b1isQ2Tq1pCjv6kWDgCRQKqTxSehcmCXQ0a4KtTwrKdhOFNM+bcIOSSz3y9Snz4UmTGuN+a7R72B9Q8+C9wS1DyDytiFEA/uQiv5KN01v0PSoIVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cG6m1w3+; arc=fail smtp.client-ip=40.107.22.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb8Pwb7pjb/swvRNiMSCMoKVSBqKXqcmq7Xt6f5dfKAs/Ujn5a9DktmDLR9WlgIsAZm6PfjJ6CWp5ajYuUDeo3bzGMWYcJAM1NJy3H3duvhnxLRhI2bwgquNiRorp+cY2CjDbyPXHXxh9zP5/5kuHXVTyvawNajCbLg2vlielkxKXlDI3Evu8hRbkRPjGQayXRjb8FBhwcVw3FgSEEZPxtKYzqQwM+W5N3KzDXRLA2hXBh96Q14ami75/V88P+zVuWk81p02eWQzVEziJx1dldC23t+9qQxHwOC/vD57E35lFkc32bb4V48IceVKOCevz4TvGz/pW0H8QCfACgR7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6D2tsyHnxa1BpBzxQCLu8hcG+zpSWBn6jX61FKApko=;
 b=RD0m5OvJfro4sTzQDs/gYRZwQ/6mVzwmWeBhJFFipwh4y9TFKCee29lrPBY8T+IZWmMbxuhB3GqNNljtsvleaMDoNw8WdQ3TYE7eqm8qSmrNhC2se5eq0ML/VBL2Ko8EFTo7iVY45oTjMsF0ddXTYrLsmbjjf4aALnN0fP6j6AfgiK51wcJ89GkHs1zHg+AgEYvSSZio7b0pvQOIeTrA+mgn2+wiudwIT/73qkKgr4+fWst6fBjOA5NYuWyF5Q0zCLqXttKGiMEWliEjrBtHHP5iH8FsclxmTbJ9LTmn0bmcCZYIiAcVDWU0FwnpCRLzWD6U6Zn+taI4GojRoXjWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6D2tsyHnxa1BpBzxQCLu8hcG+zpSWBn6jX61FKApko=;
 b=cG6m1w3+8NOZ1y01enwYEamSqA3d9LL62RLIwGHxKFfJlMX4PRVlx4EQpGmjv2O+2nYuzk45vOfcDRCTT31EmHniJonLG9HWqg20Ftes3SGT+KOXL77SMkCUvbphF8QnrUsflRhKe6ODmDysfmWFUP5Ka+3pN21DKjapAze1D4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:56:05 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:56:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:39 +0800
Subject: [PATCH v5 4/7] firmware: arm_scmi: add initial support for i.MX
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-4-b85a6bf778cb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=11404;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=TUMkdIZMCjh7xQDIbhQnprsPSDQiIPMHfHmaWUsZEbE=;
 b=55Whg98PqDfS9bPemuxyJXZ+gJ0B4aCE3IDPPuQY5MxfAnNNA8jrmniQ0u6vZi9iuVlgrDPWg
 4y7zzwN2lZ1BdlsekonmpjTkE6bb+sc/LPMBlP0+YVTP6/7domIZXL8
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
X-MS-Office365-Filtering-Correlation-Id: 56570eb3-d838-4b48-0dac-08dc91bf3824
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SksvbWcyTm9VamFlQmVSemdUOGdGYnJpUjR0bGlPNGhIRURNdGV6ei9VYWZq?=
 =?utf-8?B?MldoRnFIL0hZWi9VUERoT1pmbXkwdElBdkRFNm91cS9nUGpHNFdPQ0hOdCs2?=
 =?utf-8?B?dm5hQmI5aXFxcTlENGhLbHdDVFlEQ3B4WkdlZVRyWFZCT2ljUC9HT3c3ZFJ1?=
 =?utf-8?B?Zjl4Y25OYmR1c1JOTWNIb3owNXdGTjhZTjNIbDQreEdLWWpZRjhRQ2hESkQw?=
 =?utf-8?B?QWNwamlqS2tJcHhwM0F4dnJacWJmT0xITFBCeWR3cXhiMnNtLzgxZDN4RjhE?=
 =?utf-8?B?OWpWUVZ6dzJFRkFHN2hYOXRCbFNkdkpVTWl0TGh0NTlNZXVlN0c4dWRGQ3hP?=
 =?utf-8?B?TENKNFZkZTZXNFB2a0VIRDBhbUY1aVZZTmhubHJwYlE4UG8zQUl1cVNBZ09j?=
 =?utf-8?B?d3c4a0hBNGhxSGJvSWJaeWd5dzV3QWVVYkE4WjhoMjNzZEwrcE1DZ2k1OWVl?=
 =?utf-8?B?OVRjempMNk1zcGFibm85S1BEYmdvQ1J4R3R5b0NBWnBKRVFyNXFZaVRCRW9E?=
 =?utf-8?B?cHNmdDU2ZlNZak8ycEwwNjUzdW0vOHlWTkR3cjRlZGNDTFZ2N2R1d1VaU3hI?=
 =?utf-8?B?MlJSQ293QkdjampkMFExcGtwcElLbWxOUXhsUnBpOUFpOFlSalZlcm1DeEJS?=
 =?utf-8?B?aU53ZDFmbjhMNk5weXhmRzZrb0t1Y1J2UFVSQ05KTGtwWjdXRmhobTBhaGpa?=
 =?utf-8?B?aUhsSVpORkhzcnpDSjBUSlVudTZ1L2hsZHdPMUNWV0Z1dHI5WVBGTDkwcUh2?=
 =?utf-8?B?YUNoTHZXM2ZFcWVObVAxRnV4YStDSGVkaVNKNHg5Q2VqWTkrSzZVZmhaYTY3?=
 =?utf-8?B?cmQxMG5va1dOZkpSNlI2T1BYTVBlMUwzME5xeUpMd3pGZXByTm5VWW1WUTFW?=
 =?utf-8?B?L0lleE5wQjAyTGxPRWY1K0NDTXBseERnYysvNDd3UzN3U3plV2drL2F1VU40?=
 =?utf-8?B?akFYZmwzOXdkcG5nMGdGN05HZjlOcjZNd1N4OGs1NTJ0Z1FCYjhEU0hjRzVl?=
 =?utf-8?B?Y0FWWDlsYVI3QTFoMzJ0ZkJaYkNYblNFcjU1aHF2Y1ppT3FlZmpucmlwRWlD?=
 =?utf-8?B?TDF2TTFUdkc1RCtDMldIMi9oQ3F4a0gzMHJqQ3hqQzRwbHo3ZVFWTmFWWmpU?=
 =?utf-8?B?K1huOTNxbVl6WnRMakhGMGhmUytEbG9lUXZxRHUyVmtWd2Nja0VEL1Y4emhp?=
 =?utf-8?B?VWFSYzBjRlFjQ1h1YlBRaVU5OEoySkdUMXo0MkhtN2ZQSlR1aEhJQW1udVh2?=
 =?utf-8?B?WWFVS1JEWW5YQW40VEFWeWY3M1docTR0QXFxb3VWTk5odTN3Q0lQV1lHOTZQ?=
 =?utf-8?B?Wkl2VisrejN5SkNLUHNMendRNU4xcFQrOUl4K2IwZzlzV3dYc1Rsd1Uxc09U?=
 =?utf-8?B?WXZXV1BVVkl5L21XSnptM1A4THc0V0FYVkZvTWo3VWYvNS9Qci94Y3loTkdW?=
 =?utf-8?B?YXJkVkVGSXlIVGxmSmVraW9MbG9PZUlLVW5CZVZ3TEpiRnB1ZXh3dW9DS2xj?=
 =?utf-8?B?MnMxdGI1cEkzOThsWnA3UlUxWGM0VFNEZzlDeWhtb3dOK3dZelZxTUl1OXVI?=
 =?utf-8?B?MFc1cDhVVmNtMGFVZ0ltaU95bE9CZWk3NnM5MllmK09taklEKzA5aXI1Sklz?=
 =?utf-8?B?UkQxM3JYTEc3SU9wZVN1c3M2WnpVK3pyelgwRHROTitiNkhZUVpyaTZUdTJT?=
 =?utf-8?B?cjNzMy8vb1lzQWEwd3ZqRHpkSk9QeVFvQkJTYU1IbFVjVnJlNjlNV045WVNa?=
 =?utf-8?B?czFyek0yeGpwN2lkSXVWMTdHeHRqVWEwTFp6d29lZkhYdFlRZE5mb00rUC92?=
 =?utf-8?B?L3lGcU85VERNK1IyVHJHVGhnN0Fxbks4NUxrTGVReWJWZVltU3RWNDBQaGVT?=
 =?utf-8?Q?ym5n19uR+FW6t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlkTUM4ajQ3Q1dyUXRNQzVWZlFTcFM3dldxTkhibC8rUjJhdWRaOWVJb00v?=
 =?utf-8?B?RG9SVGY1NkFTSE14VjF6M3ZrUTloSEtQSW84YzVLdG92R0V2a2h5OVNoTWlk?=
 =?utf-8?B?SnpHMVZ0dy83dzFNaFNNK0dWQXYxVU5kdWdPSGxhRmUvSHF4ZzdJbjZ2TXNv?=
 =?utf-8?B?OThoZ3ZINm93KytVQ2xpVkNaMDZ6OHFDd05oRHJIZXh3NG1UNm5mZVVGS1k3?=
 =?utf-8?B?cmQrd2pWOS8wMTd4M09jQTdsZ3dvUzI5dENoTWVsejlRalU1bTd1T0N5NnVh?=
 =?utf-8?B?a2FrQU92bm9ieW8xTFhhYUkyOS9hZWdsN2ZhREpITStRN1pUbUpPU25xL1NJ?=
 =?utf-8?B?R0Q3bFVNTGVWT0ZOclJSRGJuOGRFdFoxbWxHSjFsVlE5M01MMktZSWZ4UjdG?=
 =?utf-8?B?M20rZGlSRGFYM0hqdFNzYWxMLzhZMFd0MHpldXBXVklZTjdrOWd3S3B6SFRX?=
 =?utf-8?B?M1l0YnFrenJsT2hPaTRCcVNpTG83VE1kOHRFVG1kdElTYmIvRnpJaDJQRlhZ?=
 =?utf-8?B?S1NFOWFqOHhVOUVUUEhFT3UyM0xCTm9DeGpBVHIzMDUwODhGa2JqbzNSa0x2?=
 =?utf-8?B?enBSN0hqMlh1bm1KaEU4ZjMyaW9Nci95THBrQlp5UVhsTmlBanBMU0xXcXVv?=
 =?utf-8?B?MWR0Vk02VkhPVXRLT1VNRExhd0NKWXZLSnZ0VzVkbnpsSmxObjZCS0VnMFpS?=
 =?utf-8?B?Mkc4N1JLTVQ3bis2NW9maUk0SVlYNkdvSVVwNVh4TDNKR0k5L1U3MmxQdVU4?=
 =?utf-8?B?N3Q3Q2RpQnpCNmJkRXZFM001VTJBTXE2b3VxTnYyMExDRHNhazk4dXM3dVRv?=
 =?utf-8?B?R1cvT1piWFd0MWJScXFUYjdmaGVzeUtHU05FTkI1eHJRMUgrZjc3aVVpZEJM?=
 =?utf-8?B?SlU5cjJjZUFlTTVlWmhkYzhmYmkwU21WNWVGRDVvL0tXNHk1dDQ1SjFwd3BM?=
 =?utf-8?B?eEJrQkZpcDZpNlRxMVNjNmZ5K3c3NnpHTHRkVytMWHo2MU5HS0ZVbEZLOFh1?=
 =?utf-8?B?VUVtY0pMQS93d2xVY1k1T3RjUThaOGo2Mllsb1d0L2x1UkFrZjJKcElDMGNP?=
 =?utf-8?B?ZkdWT2x4eUYrclNENWlabCtHQVd5Zk9mUXRtaXVTcDhOdlRXMHp2cmFqV3Fw?=
 =?utf-8?B?WXlpV0RPQ01OTTczM0ZvVzYyUk1kR2ZCeUo2TkRFam1NU2orcm9FeUZjZ2o5?=
 =?utf-8?B?ekIycDZURDFVVmhMVU9TajNKS1FYd3RHbEdtenhMYk01Q3FNZDBHWkxDSit0?=
 =?utf-8?B?Y3VpVG9CZGtib2w0OU02MEk0RWt1SGdmSmhzU1lKNUhPYWd4Y0Ewd2k3em5S?=
 =?utf-8?B?RFBhQnV3Y3FmRlNBYUxwV0pyYmdFZklieDR2dEdITGlacXYxOWFZejlpYUdr?=
 =?utf-8?B?akw0Wk1Oc2ZabklqSzRtMG4wVU5KTkZ2VGNNd1JDaU44cURZTTJsNXZZd3Zk?=
 =?utf-8?B?eGV3SmlYYUZsLzVkL1JjL1dxem5XSVF5YkkwL3c1RW1xTld4dkg3ZkxpTDBo?=
 =?utf-8?B?N0R1amNhalFGWjRzYjVoNHgzV1NHRGZWZUMyemU3Z1hlaEVCNkd6cndBRFhj?=
 =?utf-8?B?U25vWTUzMEphNmp3aGZsYVlWb3o0OW9lVmNTNVYrcG5XM2k2MUJGZURZdTNI?=
 =?utf-8?B?NTh2YitQMnFwUmZSbXRLQ2ZmR3Uvd0ZmNGJRZDl4RGQwOVZudjBNUWNjeXpF?=
 =?utf-8?B?ZnQxZ0NFaERqNzhOQm5xQUxUUDJqWm56TGw0eStXMzNUUFhxYlRyaWNUbTJ4?=
 =?utf-8?B?R3l3NFFSNGJOYnBic2U3eFRRT0RKYW0vUGRuYUhwWEpZeU1uLzBhZGFNMVVn?=
 =?utf-8?B?VnE4aS9iTTVXRWJtN3NsY013OWtIMUhhMTAzV3R4T0xPNHRkdEhRMGF0WXZU?=
 =?utf-8?B?Slc5TnpRVEwwYlBXQTVzZm11ZEx2RHQ0aVpoWnpYMURKVFE1endOdHBSNUd3?=
 =?utf-8?B?UVUyTW9tV3hQVTJvR2xHRGlSRm1aZW14cmFGYnRlbzRpSFJkeVF6bElWbDc2?=
 =?utf-8?B?UHc1eHN3QTF2M2FEcm5vcUVIS2hmUTRWemw3TUY0aDUwR0xub0I5ay85bDdt?=
 =?utf-8?B?a01RZWJqWWtTTFRaeUVZZldzeDVkSkozZUxGQk92N0cyRDloK3lmMlBOUCs2?=
 =?utf-8?Q?qtEJxZn6JMcjiIXeAevRN4DEB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56570eb3-d838-4b48-0dac-08dc91bf3824
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:56:04.9892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MsZ0g1jhd2EwuHTZtzScdfSD8ZcPBZTmlvP6/I4kKsjE7sLrpXa0SG0T7FpXSgUrV6ppvxoccCnivmW/0sEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

From: Peng Fan <peng.fan@nxp.com>

i.MX95 System Manager(SM) firmware includes a SCMI vendor protocol, SCMI
MISC protocol which includes controls that are misc settings/actions that
must be exposed from the SM to agents. They are device specific and are
usually define to access bit fields in various mix block control modules,
IOMUX_GPR, and other General Purpose registers, Control Status Registers
owned by the SM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/imx/Kconfig       |   9 +
 drivers/firmware/arm_scmi/imx/Makefile      |   1 +
 drivers/firmware/arm_scmi/imx/imx-sm-misc.c | 315 ++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h           |  17 ++
 4 files changed, 342 insertions(+)

diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
index 4b6ac7febe8f..e9d015859eaa 100644
--- a/drivers/firmware/arm_scmi/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -11,4 +11,13 @@ config IMX_SCMI_BBM_EXT
 
 	  This driver can also be built as a module.
 
+config IMX_SCMI_MISC_EXT
+	tristate "i.MX SCMI MISC EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System MISC control logic such as gpio expander
+	  wakeup
+
+	  This driver can also be built as a module.
 endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
index a7dbdd20dbb9..d3ee6d544924 100644
--- a/drivers/firmware/arm_scmi/imx/Makefile
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
new file mode 100644
index 000000000000..ca79d86d542c
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP MISC Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications MISC - " fmt
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
+#define MAX_MISC_CTRL_SOURCES			GENMASK(15, 0)
+
+enum scmi_imx_misc_protocol_cmd {
+	SCMI_IMX_MISC_CTRL_SET	= 0x3,
+	SCMI_IMX_MISC_CTRL_GET	= 0x4,
+	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
+};
+
+struct scmi_imx_misc_info {
+	u32 version;
+	u32 nr_dev_ctrl;
+	u32 nr_brd_ctrl;
+	u32 nr_reason;
+};
+
+struct scmi_msg_imx_misc_protocol_attributes {
+	__le32 attributes;
+};
+
+#define GET_BRD_CTRLS_NR(x)	le32_get_bits((x), GENMASK(31, 24))
+#define GET_REASONS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_DEV_CTRLS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+#define BRD_CTRL_START_ID	BIT(15)
+
+struct scmi_imx_misc_ctrl_set_in {
+	__le32 id;
+	__le32 num;
+	__le32 value[];
+};
+
+struct scmi_imx_misc_ctrl_notify_in {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_notify_payld {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_get_out {
+	__le32 num;
+	__le32 val[];
+};
+
+static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
+					struct scmi_imx_misc_info *mi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_misc_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		mi->nr_dev_ctrl = GET_DEV_CTRLS_NR(attr->attributes);
+		mi->nr_brd_ctrl = GET_BRD_CTRLS_NR(attr->attributes);
+		mi->nr_reason = GET_REASONS_NR(attr->attributes);
+		dev_info(ph->dev, "i.MX MISC NUM DEV CTRL: %d, NUM BRD CTRL: %d,NUM Reason: %d\n",
+			 mi->nr_dev_ctrl, mi->nr_brd_ctrl, mi->nr_reason);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_validate_id(const struct scmi_protocol_handle *ph,
+					  u32 ctrl_id)
+{
+	struct scmi_imx_misc_info *mi = ph->get_priv(ph);
+
+	/*
+	 * [0,      BRD_CTRL_START_ID) is for Dev Ctrl which is SOC related
+	 * [BRD_CTRL_START_ID, 0xffff) is for Board Ctrl which is board related
+	 */
+	if ((ctrl_id < BRD_CTRL_START_ID) && (ctrl_id > mi->nr_dev_ctrl))
+		return -EINVAL;
+	if (ctrl_id >= BRD_CTRL_START_ID + mi->nr_brd_ctrl)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_misc_ctrl_notify(const struct scmi_protocol_handle *ph,
+				     u32 ctrl_id, u32 evt_id, u32 flags)
+{
+	struct scmi_imx_misc_ctrl_notify_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_NOTIFY,
+				      sizeof(*in), 0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->ctrl_id = cpu_to_le32(ctrl_id);
+	in->flags = cpu_to_le32(flags);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int
+scmi_imx_misc_ctrl_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, u32 src_id, bool enable)
+{
+	int ret;
+
+	/* misc_ctrl_req_notify is for enablement */
+	if (enable)
+		return 0;
+
+	ret = scmi_imx_misc_ctrl_notify(ph, src_id, evt_id, 0);
+	if (ret)
+		dev_err(ph->dev, "FAIL_ENABLED - evt[%X] src[%d] - ret:%d\n",
+			evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *
+scmi_imx_misc_ctrl_fill_custom_report(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, ktime_t timestamp,
+				      const void *payld, size_t payld_sz,
+				      void *report, u32 *src_id)
+{
+	const struct scmi_imx_misc_ctrl_notify_payld *p = payld;
+	struct scmi_imx_misc_ctrl_notify_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	r->timestamp = timestamp;
+	r->ctrl_id = p->ctrl_id;
+	r->flags = p->flags;
+	if (src_id)
+		*src_id = r->ctrl_id;
+	dev_dbg(ph->dev, "%s: ctrl_id: %d flags: %d\n", __func__,
+		r->ctrl_id, r->flags);
+
+	return r;
+}
+
+static const struct scmi_event_ops scmi_imx_misc_event_ops = {
+	.set_notify_enabled = scmi_imx_misc_ctrl_set_notify_enabled,
+	.fill_custom_report = scmi_imx_misc_ctrl_fill_custom_report,
+};
+
+static const struct scmi_event scmi_imx_misc_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_MISC_CONTROL,
+		.max_payld_sz = sizeof(struct scmi_imx_misc_ctrl_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_misc_ctrl_notify_report),
+	},
+};
+
+static struct scmi_protocol_events scmi_imx_misc_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_misc_event_ops,
+	.evts = scmi_imx_misc_events,
+	.num_events = ARRAY_SIZE(scmi_imx_misc_events),
+	.num_sources = MAX_MISC_CTRL_SOURCES,
+};
+
+static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 *num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_get_out *out;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_GET, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(ctrl_id, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		*num = le32_to_cpu(out->num);
+
+		if (*num >= max_num ||
+		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
+			ph->xops->xfer_put(ph, t);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < *num; i++)
+			val[i] = le32_to_cpu(out->val[i]);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_set_in *in;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*in)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	if (num > max_num)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->id = cpu_to_le32(ctrl_id);
+	in->num = cpu_to_le32(num);
+	for (i = 0; i < num; i++)
+		in->value[i] = cpu_to_le32(val[i]);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
+	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
+	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
+	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
+};
+
+static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_misc_info *minfo;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM MISC Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	minfo = devm_kzalloc(ph->dev, sizeof(*minfo), GFP_KERNEL);
+	if (!minfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_misc_attributes_get(ph, minfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, minfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_misc = {
+	.id = SCMI_PROTOCOL_IMX_MISC,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_misc_protocol_init,
+	.ops = &scmi_imx_misc_proto_ops,
+	.events = &scmi_imx_misc_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_misc);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index e59aedaa4aec..321064514778 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -15,6 +15,7 @@
 
 enum scmi_nxp_protocol {
 	SCMI_PROTOCOL_IMX_BBM = 0x81,
+	SCMI_PROTOCOL_IMX_MISC = 0x84,
 };
 
 struct scmi_imx_bbm_proto_ops {
@@ -30,6 +31,7 @@ struct scmi_imx_bbm_proto_ops {
 enum scmi_nxp_notification_events {
 	SCMI_EVENT_IMX_BBM_RTC = 0x0,
 	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+	SCMI_EVENT_IMX_MISC_CONTROL = 0x0,
 };
 
 struct scmi_imx_bbm_notif_report {
@@ -39,4 +41,19 @@ struct scmi_imx_bbm_notif_report {
 	unsigned int		rtc_id;
 	unsigned int		rtc_evt;
 };
+
+struct scmi_imx_misc_ctrl_notify_report {
+	ktime_t			timestamp;
+	unsigned int		ctrl_id;
+	unsigned int		flags;
+};
+
+struct scmi_imx_misc_proto_ops {
+	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 num, u32 *val);
+	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 *num, u32 *val);
+	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
+				    u32 ctrl_id, u32 evt_id, u32 flags);
+};
 #endif

-- 
2.37.1


