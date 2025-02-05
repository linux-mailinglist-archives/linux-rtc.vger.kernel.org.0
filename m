Return-Path: <linux-rtc+bounces-3094-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36694A2807B
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F193018887CF
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 00:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D006E2288C9;
	Wed,  5 Feb 2025 00:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="reSMyPCT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227B228393;
	Wed,  5 Feb 2025 00:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717162; cv=fail; b=ePSEMXqJJHWTYijjR6UXB1aB7NeN46iDX8t37FBov2g5gPCuQwiUF2/GAhGXJomAcsT5NUxDPFK8dPzRwetdNjFAceK5az5xWoBEz+6bUjDuOClOupB2sk/kOC2xRyEKnxI2qCAmckYabyw0ba2tlU9ukldbbal3F5UHWGLicYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717162; c=relaxed/simple;
	bh=bGv4dF3gwaQ8/rybE3qOHzdzrW8kBSYtqBarBhutlJE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WOGo9t1mV8bjOJ6fINJCTT6t/jRe9FKyUw9zw0LpTqe4fKYubirgMOg9iouYWnZNZtIekiM91iyfh6iZ4QekpI6RSTRTcZIVcjmixnxB0fboOpuxTu9IPNc5hOKiiH2Zyw0YztKlAbi6og7+KOkt4c428Akb2Rd/eCDmesuE2ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=reSMyPCT; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8L4dTNQF6PB+2/V2rnCUUxlCPNbDxDGdJKaqqcC2CHW62cmQhbz2rMj1ZsIs6PicomqCVOLmt5zMDD9kYJPabiww1iufXVRy+UJtBr1hZkb6iTzVIXkulIWIE6EvNow8/d3ddiL+UO9WOm8dPAwbG4I+rkWDgag/nVi0AkRw0oLSPJakmlYszUW2bcWpb/1CJGwmFkeZAASpVvxnE2XAbU6b3xDUdG1vBpBRXl/Gsla0Z4FedhBbnTFt+vVkovBaRa3YHd89f+HN+cC30mYSRmMs+i8nVXCRje6MGS/XXzMmnUeYAL2vUK+ZoBEJl20h5BpSfjEN+7mIRa7fHZscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFg5y3TrIOn9VH/jNSFVTNtUnnNsK5iZCxLymVMVirI=;
 b=d8KEGfsBO+a/yMYt/8MeYmgHuHZrP8QIwEToVnW2SWnNsGhocloxslRHZurofmc70z60y+dhpw43WSbrr9Leu3f6J7XY5uVMrwee1m8STDuw9aFY5wHHmpeUXNQc/Dg+4kb2WhOKEDhq79hyv13udt+++xNHZ6igOe8P8Dri1AWviLsCeZUC+ExGWWguT51hNX6wh8MVkNY0Oryj5E1kWqtYPiUt+WvTRrc0BZHel0rNks0QSdDxx0RxF9jLZkYGP7Lv1Qd94jWqn8DHKfI13NZW94HTK8ecr4xdeUGTw3Jsm4X3BHB1yKYQNQ1o9o/8RUZWUzFR/4sRZEqYdHZx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFg5y3TrIOn9VH/jNSFVTNtUnnNsK5iZCxLymVMVirI=;
 b=reSMyPCT8VEPMYbX7GR6+couZPM6zsOs50mP9UrYUzI3Vv21jIraGrIZjG4Ph9DbvZ6lJYrZT+0U3JB9XIw39GRlybNSDG8xEMqUia7X57e0NiwzPQmVy96rS1bPCfFsoK97ToHm8hVLmdOdlGElEmRdQejeBV7S/+MDe/kWKifo5iD0nPvv9HKnFXz6yiNcCcvcTJPD+j6Jot4RSt5wGZ2Ba3hs5oKsmeWE5LfWgnzBnE2lno07pLJB4mbvnErVhVQ9u7rX+Ha3JHR52wLT2DAPNMzRbVjgqhjc4QEHCmT2v7fb6lf4uNpEtwnxFAVNkVuN+9FwOBOgO1txtj45XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:20 +0800
Subject: [PATCH 2/7] rtc: nxp-bbnsm: Use resource managed API to simplify
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-2-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=2071;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VAulaoWVPhHtzgpO1nG1u9VR+bogAGzfLBxhdt2/l0I=;
 b=ENdfDOGh0YGiORqM8nju1hwNzBEhXGkPtvmLmmrZH3kthYHpqDEz/bK2nIQJZOLHJyLNZiEJl
 KkNPuJQtFo7D3ncM4rUNGcWCBY7luJ/myGCOqhWy0nl6JsNPHZZfAKy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 752ceb67-d20d-4efc-4cee-08dd45805124
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnpUamthVzJFV1JPbzFIK1lGd28rdks2RVVxeVJZUXozc0Yrc3VuZXhXMERF?=
 =?utf-8?B?emIxK25JV0JmbGFURVZ1SFIvMmo5M0xkSmtvaXZkRWZpeS9Rd1RYWVF0LzAr?=
 =?utf-8?B?SCs0ZmYyUkpDMkZGMFYzcW4xdE9JVGlDM3EzTlE1NUtIYnI0WGdmUk00cVh0?=
 =?utf-8?B?U0RVRmRhc2xMWWM4bDJodmI1RHc5WGxoTlFreTRiaDA2WnZzYUliNDR0MWhL?=
 =?utf-8?B?MkpPdHJDdnZ0VVZVbEdyU05MaUtKK2JoRXBvRmtKTWEzaU9XYTVxOUJtTHpa?=
 =?utf-8?B?WDR4MTBVTEhKMzNFYVM2d0M4cTNKS2puWElxb0pDb2U2dTJNSEEzNWhxQ3BP?=
 =?utf-8?B?OGNycjM4clY1WVpoTWN3QTlDeld4ZTRLSk5PQUVjTm5QdkxnaVVRbTVVQ09n?=
 =?utf-8?B?QWpSSVBualArd29kNytRcllUVVJCVVkrQzRpYXBhM1ZqVmxDV2NtcXJ5dFNN?=
 =?utf-8?B?eDdTcjhIaitsa0UxU05UdkVqZWR2L1czOXZqN2VZR0lKdXhSQjRwSng5Z0ZO?=
 =?utf-8?B?djJ0VHhGZTJnNUhZSHBRdnRMeVFGZ1RmalJxYWhyN1YrcXRReHQ2bXlWYmp3?=
 =?utf-8?B?RmhMRGZBSE80NjcyMER4R0tyUC9TamFMUG9xK3pOaytLMGNDY0k4VVhaKzFG?=
 =?utf-8?B?L216MFluZXJjalFQZXB6eWRFZUZyNlpsNUNOVmdFZEtGWlZsVUJ0ZUdPOVdt?=
 =?utf-8?B?RE52d0dacFREZ2lZZFZzTk5hbExoYUdiL1RGSmtzWG1Hb0RUNGtXNlY5WTFM?=
 =?utf-8?B?dlp3REpWV3FTenJNWWlCeUlHR2lyNUZLZXkxWkozSE9WUDNSVFVnUHhoMW15?=
 =?utf-8?B?MEpKeTFPNUNudDdTZ2FCNUtZcnhVOGU5SDdBVGk1TnBJRitOeXdoOFNRVktt?=
 =?utf-8?B?Q3M1NnptZlhZaDIvSXM1U2o2eDhtQW0wNXpwc3c0WFdFN1huUnhYdEdKZUp5?=
 =?utf-8?B?Ui9WTURIbERiY0ZJZEc3akc2SjlTaDBCLy9EMlZ2Sk5BRUM5TjlwQURoUjho?=
 =?utf-8?B?ckdKSmpJbEVZOFFkY1lmd2dFOGRnend5Vk5HaGhyOExOOGlsVGZBQUptbTJJ?=
 =?utf-8?B?MDFLREo5SUQyZVJFZCtpeDY4QkIrb3N0ZStjWUgwM21qTWdub2xHSXVmK2cv?=
 =?utf-8?B?S3Zrc3N0ditqMmlRTVc0bjVHNFY1TFVCTDJ5WFBWM3NiRjZ5T1U0bndOdHk0?=
 =?utf-8?B?R1lZdGJnMmg1cExrWWkrc253aDRhelFxckN2OFlnZnVheW84MkMrTlBYYTZB?=
 =?utf-8?B?ODBzREphTnc5VHlxVFJnSmxtMEdwVTBhZ1d6dWRlYmFvaVFGZUtFaWs3LzAy?=
 =?utf-8?B?ekZDQ01Rb0RUSGNmZllUcERJY3A5LzZBSXBuZ2Y2c2RKaEVaRTc2SEdFN2M5?=
 =?utf-8?B?WFFhdmtTc2JTWDhnQ3pZUVdRSXlOU1U3OFhnWVNaeldGYkJ6NmQ1QUtLTEdq?=
 =?utf-8?B?NmI4cTg0cHZtNFlJVC9wbjlnYkxBZ2RXaFFRb1owOVFzWTNNZUJXRzQ0QXd0?=
 =?utf-8?B?MFBhT1ljalBxQkI5NTdZcy9Rd1hIcjdmQVczbWZndTkwZXg4R2RoYlN5TmFS?=
 =?utf-8?B?dnA2djNaak1KbmJSbGptb2tHQ0dRNTdlWkI0Mmp0dWsxTlpqMVBjbDJXT21r?=
 =?utf-8?B?cVNMNDNBVUFHazZ2bHZ0QWtocldJSDFzREVhR1hWdHB1d0Z0NGtsOUhTSDM1?=
 =?utf-8?B?di9QY2ZDYytkYzlueVd4WjN1SWl4d2c5b1NVQlQvRzc1YnRVcy90UXorZjZL?=
 =?utf-8?B?M05xVEdneUxNejdHaHVUWXNXYkQvRXZ5SHc5T3NjdmxBYXRyVjRXdStvdVdT?=
 =?utf-8?B?THJjYm8yS2wzS1FweHpGbTN2SFZVNGZwbm5vVWtoaWZ2K2dCdGNNdnF4WjJK?=
 =?utf-8?B?ZDhnVkdtWkVnVFg4d2FSTWxUUUNsSjYvRTFBUk04UmM1U3VmeWVyOFdPYXh2?=
 =?utf-8?Q?QO65M6vEU1Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JGNU5GOWlTRnR6OVJYR2VBUXVNdmF0SmQyL0krdkk0aDlQVjhqR1U3SGFE?=
 =?utf-8?B?cXNuYitDUXphOWc1cnJNQWEzbTFVSGk4L3p2bG1rUjV5ZFF5RDBHb2RCVHFp?=
 =?utf-8?B?bXkwaXhwNVpNajNXZkUwOTl4YVpQb2lCVUpmOU56ak91MUtuNVd1Q1F2bkxp?=
 =?utf-8?B?NzVYTXZoNEZHUGFoZUNxcVQwZEl3TDBTSW9vZmMwMFphTEI5VzNHdFhYUmpN?=
 =?utf-8?B?ejhscnFxZmJ0VU9QczJoa1d2dUpwN1k1R2xFcTlRUGxDcDlhd2lWUit6aHV3?=
 =?utf-8?B?Y0QvTEZTRnJzK29PSGkwZkptWEN0RG1PVzZRYVRsTXhRdzBSbTdIQ0Z1Q09v?=
 =?utf-8?B?SmZDaDhmM2dEZ0Zzc280cTFhdm9Fc2IvZXd5cjZwZDFaMEhlcUJNYVloaHJE?=
 =?utf-8?B?NXpiUnVRbi9pYzlhdzhpQ01HWDFzNGE1aERBOHBYOEpkbUhaOCsvUDEwODlK?=
 =?utf-8?B?OS9UOGVyKzRWK0k2dWVvZFY4dnk0SktpM2lWQzJBbnovTG9RU2ZzdDNoUjdC?=
 =?utf-8?B?T3crRC91SG9adXdleWJ0YzBvRThwd0RWTDZGQ0hQRi9MaVJ3VTJDZUF1TlNy?=
 =?utf-8?B?V3o1QllKT3d3U005UmlqSjhwWGM4Y2plQWs5OEhTTDlBaVh2bWNFVWJ0N2Fm?=
 =?utf-8?B?N3BXYVMyM2JjcWhJdHRtNEtkQmdxd1Q4WDhBMGZvNFJvRzRGaTBkblZOTjFv?=
 =?utf-8?B?dGtvZGhsdEE5aEJvb0dQWkJPRWova2pBQzkzN2RobVJHY0tUemxoTVhGQmlP?=
 =?utf-8?B?aWtvbmJyZ3ZxWXlMQUxnZStkOW5rUTBNOStNdVN0VXdDY3Bqb3BjT0owWlZI?=
 =?utf-8?B?MkNBZmQyMks3Wm1iWXFURFpHNkUrNTBROGxISWUvSXNwZ0l3R0FNZE5ia29t?=
 =?utf-8?B?QWZQa0Y3cTdlVWN6Q2VCek4wamh2NC8ycGF5QS83M0wrb3VLQm56NTBEdjVP?=
 =?utf-8?B?enkxMGJqdll1b1hlYm1wN2cyL254azhPdmp3aTdJb3NSeHdoelYrb3Zzcy9x?=
 =?utf-8?B?UXFaTlZNUTZDay9kaUlicVdRK0dQV1QzZUVXbWpKM3NFVzV2Q0JhQ1JqUDRF?=
 =?utf-8?B?Y1kvbkJnSVFBUDJUcDJkZkdES3QrM1RkV0FJblFsYU13R1Y1a3V5eDNSZFQ4?=
 =?utf-8?B?UGNpZjBkMmhWRjFtTytPN1hoeFB5YzFZbVpaMGdtK3RXT0RXcEEveE94NDhK?=
 =?utf-8?B?elBScmJBYm5zeXpRNmtDdWY4eDVqU2pPd1QrM0diM3hOVXhZK2F3YlFwRDhL?=
 =?utf-8?B?WW5GdTlYcUErYnl6RWdaTTJ6RzNGS1FZSzhDdWEyeGZodXRRdUhYRytNYVhD?=
 =?utf-8?B?VjYrWk1UQko3L3VjNnFuWG1tT2pGanlsUEd2UnZaSHJ5MEsxc3dzaEwwWnEy?=
 =?utf-8?B?TktwSlRReTh0SGRkVnFoNldBaHdLNUIxWXZRL1ZtUTVvdVNrVkpSeS9iSTZk?=
 =?utf-8?B?UWpQMGtQYisvVkp6NUMrSlJHV3BQcWduVGtIaVN2V2ZwZmxCcitRMnJUVTRE?=
 =?utf-8?B?RWg0c1ppSHdSSDVvREJQZy9yemxsbzUxSzNuRGxKTTlKYndmMVFkSExqRVZJ?=
 =?utf-8?B?S0VsUE5tMXJtYTQ4MXc1M0w5QU1YSlJtTGRvQm5HTEY4TW1QRzM3TVBIV1Bi?=
 =?utf-8?B?WFBGOG0vUWtaeG13RjYvWjNVZHQrQ2ZMVDR6R1J4WG03S280VzZNZlRxOG9z?=
 =?utf-8?B?b1AxdG9zcTJuRGFJSkY2cVM5R2pqd1BscEJqZXpiM2hocDdlZ1lkbGpVNVMw?=
 =?utf-8?B?emZjclphQVA3RE0yZStVYkcxeDIrS2xrZXNWOUZTTlB0TDBEbGhTMnIxRDA3?=
 =?utf-8?B?aWROTlRjT2lOcy9oalB1U000ck0rMUNyWGNTanJlaExBMUFlNnB6QUxmdjBJ?=
 =?utf-8?B?bVdHOXZTQzJibm94Wkgwb0NqdlpOdjNVQUVLOHZCTEk4OU1TWnlJbklzQWZK?=
 =?utf-8?B?VmdJTWZhZ1RBZGkyaXdHRFJEdnIrWGV4Q3ZZT0RHQTloTVI4MFBHbHBla0Y3?=
 =?utf-8?B?RlNZNXhzdEdscU1ydnhQVC9zVFdkdjhNYWV4U29KeDM3NW9IUE9UeU5SOWk2?=
 =?utf-8?B?bnJXdDUvS3QvdkRFUVdWT1hzdVVhZXVIMWNuRUw3NXM4N3pzQTh0UGJJRDVG?=
 =?utf-8?Q?ML58PUlBW5XV+GcDKJfRWjDlE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752ceb67-d20d-4efc-4cee-08dd45805124
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:17.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zL6WspjqJXPS6S8IFRWl7g5LKLR+YmIKSG/ACkxKGdgE4A9yANxSIhX0yGmJzJLXrRg6ocm2PQPxDADRJnNYwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
error handling code and 'driver.remove()' hook.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-nxp-bbnsm.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index fa3b0328c7a255ff8a902a58d61a4b0e59eac493..d4fc9dc583d317d4852b7d897a6c45cfff6961a2 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -189,36 +189,26 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	/* clear all the pending events */
 	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
+
+	ret = devm_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	if (ret)
+		dev_err(&pdev->dev, "failed to set wake irq, %d\n", ret);
 
 	ret = devm_request_irq(&pdev->dev, bbnsm->irq, bbnsm_rtc_irq_handler,
 			       IRQF_SHARED, "rtc alarm", &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
 			bbnsm->irq, ret);
-		goto err;
+		return ret;
 	}
 
 	bbnsm->rtc->ops = &bbnsm_rtc_ops;
 	bbnsm->rtc->range_max = U32_MAX;
 
-	ret = devm_rtc_register_device(bbnsm->rtc);
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-	return ret;
-}
-
-static void bbnsm_rtc_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
+	return devm_rtc_register_device(bbnsm->rtc);
 }
 
 static const struct of_device_id bbnsm_dt_ids[] = {
@@ -233,7 +223,6 @@ static struct platform_driver bbnsm_rtc_driver = {
 		.of_match_table = bbnsm_dt_ids,
 	},
 	.probe = bbnsm_rtc_probe,
-	.remove = bbnsm_rtc_remove,
 };
 module_platform_driver(bbnsm_rtc_driver);
 

-- 
2.37.1


