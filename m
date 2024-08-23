Return-Path: <linux-rtc+bounces-1699-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09495C88A
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC621F244E4
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505E014A633;
	Fri, 23 Aug 2024 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QbPyaluo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4784C14A4C9;
	Fri, 23 Aug 2024 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403415; cv=fail; b=A4D8wUKsh+yW51d+1ubSOLp7fKzQw7VJWF6ZoXyowF+IojcFByfJ0A0nGuWvzIhtlgJXSYoLXUvSqEtcZNnH/tXpXj0Ze+ajNlrcbbrY2ILNE5rLEAEfvySPvPAuj6Uec8HWfgqwFufB8fmxtpWT5t4CsPgSjacxsIsEVKOtCo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403415; c=relaxed/simple;
	bh=sHQpXEC+RqscEGcLpCkLkqyKaQ0yyOcczWbB6WcuzCs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i7NUAb9HgtmPWuOhRo9bfu2sYbYIB7BNBycQOcaxWFyiDFN0bzOcn5AtT3TjgyHKwWWwX/kin5qxFVKtTQ0k6gZcUN7J1g0c6fPCHqLDMCHEpGZHNPDvu9GGRfoH4brQrmrcq3Lnqya6J8r9OerB1ACCWPjDgfKTkxYhbjpGzrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QbPyaluo; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHgxRtyYJcAErnGORUGzgFqOf6Vv8gp9NC8BX432exKQJvxD7TXBQJoBc0i3G1ycnIS5WtcZdLTNFyq93UsWiIFuZZ5HDWFbL/ZhnNgIFeCWPMvcqbnCXikgmtuG4rarVT2M9hVnEDVkHA5k/sFGwqQDRG+SWv6IHW5NV1cm6KolYE2TU6cGf37kg1YbrUj9GrUDSJVaGORXQ7MvEMkpIOxYS9VQUJh9euT1ZlvfBLZrbzGeFHJC3ZRbvS/8GW+XVw/RuSvzKzRfS05z1O12OSoOEydQbeCMdhLow7t8Of0ORwEUzPJkX5SZKlBk7Ki32EsKGd6yWWViK0gJ+M18VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfP3fyHgZ67LxyuKCIpPfKfchfag5OlWpJDtUSQOpoY=;
 b=bfdx0/am60u6N+1ukuiZocfeqcwn1GNBeeetmoF/i4N97RS93nVcfkW8wVG+URVUF7262/+bQccfs4NhZEj+cF5sIgtmQL9NJPk/xjiMaV1UV4XmqwwJkNS5cgYWD8kEM9LBlovBWdRywrwTkP0lbkDTcEGWUXVk6kuRI9VpkSiy81r+2ZddfMo2jf7PDEBZX4ZkMWyIawNLpMG97gP2fDCUdrzQ5LLapVwZy6R0vSnlMuIQV0WgNd9U14B1V+drLtnNcHUUcgqT0wgBbFYHFuAULfii4T0j4I8q7cJgoQCGGqmlBp/7KMeVc/HSuVZ0RBXsiJEoMBNy1S2TmXEJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfP3fyHgZ67LxyuKCIpPfKfchfag5OlWpJDtUSQOpoY=;
 b=QbPyaluo/E1iEEGbERzsrxd78n2eJiTpt6sJR/CtkkkCKEUh1y0iexbrqMmMYyPILGDb3T2mh18xHOJi9h786aUOKnDXzLcuZY1wrZ0q+yyDqe3JjiSL5IOekMNTJAxSLkiUfalGgtVL0DtiRJ0gJl8kz4FPFMwDmWhL4dwj3aHPsmOmKxXoO56d/eYFiBR1tQ7DkzfBs7eKUIKNBAYMGGeh6NJryWqBMzYksSpNHpvRoJjlNswUWiyAyC3UeHqDPflKMTYn6Z3W2Z56FcHiniQZT6cL6in8t+ROyDYpvorfN+IEJ01HJoEsSF7DV7n5D1MvmvOOS670qbniIK6oYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:56:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:56:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:17 +0800
Subject: [PATCH v8 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-1-e600ed9e9271@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=3176;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1UJH5hjLqh4YN/4gw/b+EmkX5IO48u961dXp/hGkojY=;
 b=M/iZih/4IO5TrsyNqqsq+Nowydss4EhYcCxJbyZs8v/5TAyXw0xtHmppqT7ICwZGq7flX19Dq
 cx8sNs6NcV8ASzprMEvjusOWVRhPI0RZEUQw3pbH82aILNpxFCxViAS
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
X-MS-Office365-Filtering-Correlation-Id: c7a7253e-7cef-4807-213b-08dcc3518708
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnlUVGlGck9WbHVjSjNJQ1Jramk5NzFDaWtYUTdMQXVSbmZlYjRRWm1VRndC?=
 =?utf-8?B?TlVXblNxeENhN1pJVWdTRk4ySXRIOWVwMEpsM29qTGNreDEyanRpbW1ad0lD?=
 =?utf-8?B?SDd4ZE5ORkdqUkQwQnovMjU3SXoxbFJwVVV4bEgxQlpVVGs5VjVTYUpQUUsx?=
 =?utf-8?B?NkxOZ25RdElaeE5FclBSanVpcXI0T0prMTNzOWxqYUxxdUFlMG85R3I5eXN3?=
 =?utf-8?B?ZDlMZFVGeDhBNzhGaHYzYUJXaFRnVEd0ZzlscStyS2tncDU3TlNjQ25mdnk5?=
 =?utf-8?B?UENYc0RYVE5sMFRqQVlNNmxUUStGd2JhdjArYVF5MG5yZFFQVmxmME1CZE5x?=
 =?utf-8?B?RndhRUNWYmh5MElNWEpWUmc3WXE2dUdVUFNwUGlIWUJ5SUFod1F0OUNDdmhp?=
 =?utf-8?B?L2kwcTJOTmhOVDFleGlkSGtQTE44SGw3cHVUNDRtNUxZdWNuSXU1L1lnNUVv?=
 =?utf-8?B?K01renRZYWpSeWVidjJTaUJBVm1Wa1g3QVdXakowamZUWHFIQmwxeVEzZThl?=
 =?utf-8?B?MVZJNTV6TWN0Qmh3NFBmcVlrdHBZOXQwWHJMNnBoNHpZZDFiRjJtZkRnV2o3?=
 =?utf-8?B?b0lURlVjM3dQcVBBRnBtb0ZySUFNWDc4RFprSWJhSjl1emg5WHZBRXBKd2F1?=
 =?utf-8?B?aE5mbUhnOCtFQ3ltdzJhS3NoUVNWbkx6Snl1RFFpUVIwb0R6L1JwZ2VsdThS?=
 =?utf-8?B?TnB0Y0F5bWlUeGNVc1lhSWdmdHAxVDA5NDFJVXhtN0p4eGpQK21FTFMzY2Vt?=
 =?utf-8?B?TXZWd2twcDFLalpuaXpsMHIzUkNlYkZCb1RFaWNLZHRUWDkwUFdCaldPTXBL?=
 =?utf-8?B?TFFRODJUZHJQQ1paaFBwMUcvV3A1NG1MZzVZUitWVWJNRngrVUpaZHFEWWpl?=
 =?utf-8?B?aEVzRDl3b2xMUFEzUHhSUVJrd05uY0hwVEltMVBUNXptZ3lXNEVHNkdDTWFp?=
 =?utf-8?B?ZXF2MWUvT0xhaHpDeDg2dTJIS2ZlMEEzTjRZaU9kbDlSRzQyT29kZHU4T2x3?=
 =?utf-8?B?ZVExZE5iWXBaVFkrRTNKN1BSRGkydit5MHBjWGsrdGxud1lXd0tRRlJiUHdn?=
 =?utf-8?B?YUphNGtzV2F5OTFHb2hUc0treVBZOEtEQUpGLzdUZ3M1MFRDNkxWWk9nVGpW?=
 =?utf-8?B?dnFvb0NnZ1lwdEpLWVRyeElyN1FkcFJvUEMvUjNIL20yd0w4bWwxRkV3N2xH?=
 =?utf-8?B?alg5aFBLZ1FjTUtSaFpTYlBvZ3hCOUFDK2x4RTVta3liUzdEaFljVGQzeEZh?=
 =?utf-8?B?VUZ0T3plQWNTcEVkVHNNbk5KUC9maDZBaDZ0c29QVVdZaWJUSFRTNHh0RFpJ?=
 =?utf-8?B?STVoS1FRSncyajg3cjMwSzVWVVVZUS8zaUs3cWg5SVBkRUI2Z2ExK2lwaXla?=
 =?utf-8?B?dzhHNG1kMEcwUHRJNVg1emlkMHJCY3M2b0UyYUhiaVdmYnkrQk0wbTV2Q0pH?=
 =?utf-8?B?SkVvbGpWemdsc3c4aDc2QU1FNlBzQUtsZ1ZEZlV5Q1huTzQwd3JiT3grT3Za?=
 =?utf-8?B?b3huMnlaWDExdEpmNktTNDhFc0hXdFh3TS9YZ1Y4SVUzR1BCUlhkRGc4UWtz?=
 =?utf-8?B?aDVpeGV3TnFxZzlqYzcwTUYrc2Q5ejdUWnVxMFF1cjh3Tzdjc1BqbFYwbzR4?=
 =?utf-8?B?OXYvb1dRT1dRMGh0WSt0byszaVlSU2VSL08vYnR6bHJFRnhDY1gzSXNpa2RU?=
 =?utf-8?B?OGpzNUFwTXVzSEN4aFp1b0xQbk56VW9lYVBGRkhVcnRDRjQ5Ni9EY0xDWXZ5?=
 =?utf-8?B?TlBnc0ZSRFozYzE0bDhrUWdmQ3BTRDIxL2VNWWZRbU5QeHVsMnBHTWJxa1B3?=
 =?utf-8?B?SnJjeEVQeFdjU1lWZjE0aVU2UnJhcFU0WVVrcW5PT0VCL0dSVFJRN0FtakhR?=
 =?utf-8?Q?Wg9ZfNkmEhLwf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0x1MUhoblNjRkxpNDhOdm93eGpKVERLSUw2S3JJR2J1eUpWRElPU1NESk1K?=
 =?utf-8?B?Uk5sZXVoMmRUSFlka0w0cG9NMTdlY2xRREhvMGt4NGt2bWNiS2ZDcE9wTkdz?=
 =?utf-8?B?R0wrZndjdUJLeXppeStTQXkxMysyUUZ5TWNsUXp4S0FURFZOcERMUlcyQmFN?=
 =?utf-8?B?aG1lRmhPYXdIbkNHZkdCMThzZUIwVGtNdGc5NENSMUIrbUhFZS83bFcwWktr?=
 =?utf-8?B?M1BxUUdpc0dKVW5ycS9tY0cyLzRDZjgzamwwOGt1ZHR3S25oWXBOT3VqLzZN?=
 =?utf-8?B?eWxQTVFXcXVteUNmZ1RiRExnaG11TFF0NkhiUmRJOHBNYmNWNFpYRUlBT0lh?=
 =?utf-8?B?MkRtQnRGTFhObTJYK2JyK0tYaEE5UldONjk3cDZkOGREcnNuTWpxRUtseVMr?=
 =?utf-8?B?K2xCai9EZHlvNjVDMFdTMzBzQ2hobnc3dC9xSEwyKzlmajc0V1V3M2Y5UXg3?=
 =?utf-8?B?Z1U3YzdKRHRhTGRhK0lCcTZHZVE2S0xORlRXK0FXVkE4REdwWEJOM0lIMGo1?=
 =?utf-8?B?TzdEd0JtY3RSbGhPemZCWTk2RnpiZENSQTdXTzJlK3hXOVFjcm5xRWw5SExD?=
 =?utf-8?B?b2sxaHNzMTcxZndUTnNhMHJBRmpNL0FJYmdYL0dVYVVud3k4K3ZzQUlOT2dv?=
 =?utf-8?B?TGZKRkhKWExtUkRuZnN4U3F2b3dTWENGVkpZZVNnQUFaVkdTdjhLV0hhNlpL?=
 =?utf-8?B?QlR4eGRHK1oxWFZCaXJ3aE9ISmRFNytQWEsyV2h4TTdMTmZLYW40WXVVK2Ju?=
 =?utf-8?B?VDNHcVRzUUJ4bkpja295cmhwbXczK29ydnR1a1c3OEVpUkg5N0d6N3FDY09Z?=
 =?utf-8?B?Z0xWV0NGTGxiMG9WRWVJWnhpZUM3dno5cW8rSmUzdnJaRHN4Y0dUcFJvUERX?=
 =?utf-8?B?dDFtU0JuVFlGOXY5RHNyUnlCcVd5TmVDdnREMXV1MUI4Rm9uNk9BSitGalpK?=
 =?utf-8?B?M1B2Wm45YUF5WWFRM0hibEwzUmdycDNMWDc4cmFEK3pFUjJqRzRGWGgzU2t6?=
 =?utf-8?B?bEw0ZW9YOUVwK0dhUTRKS29ENE9sYnhGQjdZbVlUM241dXc2WVJwUmtIS0lV?=
 =?utf-8?B?Y0U2SFRFalhTSTN3S0hybCt0MzZsODlzQ0hIU1YzWU8zQTExRWtBSFplc29J?=
 =?utf-8?B?ZEkwd3VGcW9LcGdhemhEdk14RGtYWEJwbHNIUTNhRENjeWxJRjFlYnhsTEUr?=
 =?utf-8?B?VkpOZVVaUzg5SEJoREVkRmZqd1FycDR3ck1ZbEcrR0hGREVuT2t3Vk1WNlZT?=
 =?utf-8?B?ck5oSDFkcjd5QmJ6ZitEd2Z4c3lrdUN4QU1iU2RnbGlmR3NPZmhrU1cwRkFV?=
 =?utf-8?B?RCtkZFBaeDlIOE93UlEvSWNqUVVEaCs4UGVkQ3NLZ3pHME5kMmFseG54L2Yx?=
 =?utf-8?B?Y2RHd05WSlJJblpOZFc4QlcwSmRDQnAzZ2tFNzdmM05EZkpMT3o5bGNlVjJz?=
 =?utf-8?B?WW45T1BEUUN6YjM1Q1M3d1VoV1QyUTJob09veXRYZFZtTHg1ckdTSDJySkVG?=
 =?utf-8?B?VmNZQ2R6VWhZWmpaT2RwZGhUamZzZGV2bEdQQTJ2U0t1QWlsYldoQnptMHVi?=
 =?utf-8?B?KzJ6d01ia0FiZnAwcldTdnlWZERENjk3dS9UdWxySEc0eVA4K2oyLzVGUzR1?=
 =?utf-8?B?UjNhUmxOREcvcUthMzZZYTEyMndpMkF1cXgvVy9zb1JVVGtLdGhJQ3JnNnI3?=
 =?utf-8?B?L3d0bVF3UnNiMFlBU1czbkpVdDhrcU9Rc3ppNXlRU0dETStYVXk5Nk4zcWR4?=
 =?utf-8?B?dkRZaldaZ2xSTExwRkNiZUlhT0JjWVhVT214SWE1U1I3Mno0QlhCZUFEUXB2?=
 =?utf-8?B?YjVuZ0drbi9BRjQyQUw0VE5aQnROZUJVRHp1Z1JpQTN0WmVVNDduendOT29U?=
 =?utf-8?B?Uk9TdkFNWU9JTXBnVGtlSUNNcnlyTUZCbUFYSkFPUDY0Z2daNnFIUnZVRVgz?=
 =?utf-8?B?TXNnZlE0MVRybkErQ1gycjU1SWdSNVp5RVd1aUJHOWRTMlVoQlk3cG5wTjhF?=
 =?utf-8?B?NGxUMjJ4bEFZWmpZYVBmeCs4OFpmaUlNYU41b1dTbDZiRW9sRUFWTTdDeU55?=
 =?utf-8?B?NlorbUFNUkxYdjJiTmN5bGFWREM0UW0yeTlrbW1NN2IzMGZQR005d0tpOUc3?=
 =?utf-8?Q?W8KddwqNYeaYUIvzzNPh7qqAa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a7253e-7cef-4807-213b-08dcc3518708
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:56:50.6027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhjlgTBe2y3ASzjlW+gkYHD6vKbHdAE3+LTpLmZTHy/fqvuS9ZPu3aY5/rMto3+N3z21YQMDsXZfN6CMdZ5Qag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

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
index 211f5254adf2..54d7d11bfed4 100644
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
@@ -299,7 +302,7 @@ properties:
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


