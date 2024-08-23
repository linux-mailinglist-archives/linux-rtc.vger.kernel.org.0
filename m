Return-Path: <linux-rtc+bounces-1702-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4FE95C898
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640FB1C2164A
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05272149C46;
	Fri, 23 Aug 2024 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qnZ0SecC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B190142E9D;
	Fri, 23 Aug 2024 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403432; cv=fail; b=NdhfoTqa7Do3a5Cb9F6mHU5uGjPqH/HMsLX4uPelM+EGuJ4B1wczWPwcEHKDOuz2aT9zcmjvmVkXdqvYSLZfy7+aN1rQdsw5J+Vi/ISnYnjkXZhg41y7+sXlhjaBA0szHYLNEvFXsImeYl8CROpQfEMzc7Arj7UazaoqdcNx61I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403432; c=relaxed/simple;
	bh=Mxtx727GKtDC5qb+9YKPTWtjdLgYtIaycaq2wKxGAeM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d6LJBgKDRuour3zOMYaFpnKXFFnWian/j0BNETpNCHFFCagGffwyCFZg1n9/E396BkBHx0Grea1j1yySmWtrKuhWz+q7B9oSBFPM5GL27G3zcu1qYdjiJXLicWCfE89Ekg97uNJ1fwmPhV7SGCyz+K1UTlq8lx9NlO7V54CiVB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qnZ0SecC; arc=fail smtp.client-ip=40.107.105.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYrFD05xuGYCcvgmLYQBU8vLNt6wfD1ywRugyTv7lMjUW636KAGohXQfWRluldMXPxy7nmQ7aSgiEO3bIqA80wsq2l0YRNB9r+n211ur47LoQ3QqK20Kaijh61bQHfddxjxMVylZEcl/GFLDofUOp/WOmTkmXwy5oj38iXcq3rjTGMXksX2mAQESxcw0oKYQiE3nOPuOfnUEu0RPfIis1kkvLIDxMimr34OSZNb9rdP1BmzslhbWckfqVrUvXpqMYX6W2IQYNrhTIyT6gz0qGMDOCvZR2kQKk65S5bUfh8WznGc7hF3IMwwHAayJBS9UxkgjJaDwmbQKMGOptfyinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF/4FrWG/WUGQlZcVFSjAzcI1cZT51tO78QpKTkfC6M=;
 b=KsnUCoyTbhG9TzQ6oC1aL8kN/7FZzWJYJoWxw5XSAmwkyQSQ+jmZhm1TRqYt6C++8jEA0UI/ce34NxKzl8a5Tj0CFP1f/+KxrhnuHNoE4PYNLnlCAT19UxQxVgmP0D37NSFtxqB8zKJJJ3ZVeYI/Gw8UwWkBNidHg11iUylj6zjqmggygVjxWqA4qOx5CgUb8k2XeZIV21NGPqJlxivHQ2olcSd/tqiNMUba1+0V1SxcDVeU+l+pc4ErgQLd+gZme59SVxsWrhjaa0TJcHx+iTGLLK4wUuzHwiw0bLIpaE6h0emPhfS+2CgaqKe5afQv3u7yeO9rlVwlUn/7WqMM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF/4FrWG/WUGQlZcVFSjAzcI1cZT51tO78QpKTkfC6M=;
 b=qnZ0SecCjcrW2lRbnnymtUD7Z79xWVkgWl8c+zuJY8dfrtJF/tUdL13AZOTu4rBPuZI9cTZC7xkLXF/PDiUMORJSPWUeWWfgx82FmpYEtgZusonVJr+Y4pa2XkJ3VMgHMlbXgFR0IjyCBbxfqc/6T04Q57OlWnv/vEJFJZ0pk5Y/Be6jTAR0aZdgB5waFrcwHVeDCb8056LdMHt6qd0REvPFxRix8ETgw1oucYzdPe8toJ7zePpV9XPShLhpLQwqjMxqu4//GfQoao9JEyALO5DZilvqEHXDpIq4EYriTYU71MVWmLKiuY5jojRlDIljIJg8CB+YaiGMkK9cAcQUzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:57:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:57:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:20 +0800
Subject: [PATCH v8 4/7] firmware: arm_scmi: add NXP i.MX95 SCMI
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-4-e600ed9e9271@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=55322;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VyVgCny3AZ1ua8GlLQg3N6wgSuj0JGI0PHtl0IL+rkc=;
 b=0tMyMeDsdO4IQ07HcEAOzlWIIVlCm/fK8IiUnOL5J9zV9enNP7i4/nCGKcP+JzEzDwyAwKVoK
 V0Vg5XzZIq0DCwvfIp/sAGqS8mXK24rPE6fckloPhPWYCuPAEs4eOy8
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
X-MS-Office365-Filtering-Correlation-Id: ad8d4069-e529-44a3-af25-08dcc351901a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUJ5b3VacVF2SlBMN20xMkhzY2dVTS9YbkZDdTkzZnBnSlRPamJ6bGFiR21N?=
 =?utf-8?B?WmhUeXNBTmdkSndpUmxnb3Z4a1Z1REwraXRWU1Fhb0YzWVg0OGV0YU9WbUw4?=
 =?utf-8?B?TE5zTHpoaUJYbjRoTlBsQWFhVTlFaXI3S0duZURQdFEvNGNrOXZEZzR6SUZx?=
 =?utf-8?B?YzdKM2JwMUhCZXVPajg5cktnbXR2dUc5RW5nU3cyRFRsZHY1Rno2VHJXL056?=
 =?utf-8?B?aENGc09FUUpncVpoRm9aaTc0bUJnOFpndXo3L213Z2FRNS92SmloU1l4ZDJx?=
 =?utf-8?B?N2NPRHhNRmIrYWwzSXpHKytzRldLb01UcXRITWFMSDVjS2lpUXhTQk5sS21T?=
 =?utf-8?B?ZFQ0VTJibXlzUTNqd1d2WWJraFNBYXFYYWNCQ2ovNmYwSkVZanZMQlpNUmE0?=
 =?utf-8?B?MDkwNXN5L1cxUzZQTzBDUld6bFFHVmZSOU9MY2JzbEI2dkl0NzQ5UUZsRGJE?=
 =?utf-8?B?VU1RWU1TR1lvZmV1NnlPZ1pNZ08ya1RsaDJyRWFUeWFFZnIrd1BYdmFxMm5t?=
 =?utf-8?B?eFMyMm83cDl2NlVSL1NKVVhXZ1NKSFh2SEpsV0JqNGJKTHQ2aDQ4N0diZjZO?=
 =?utf-8?B?SndCVFFVVVZOc0JrdWFPSCtKcjZtUVN0UWJnTTRLWXRyVEtVcnBhTUdYSTVx?=
 =?utf-8?B?L2kybmUzOEo5YU01NmdpdndqUDVFSzNaUnNFeVoreCtRL0tWYkY5NlFXWXlZ?=
 =?utf-8?B?KzNDVWV3RmNDNWZCYUxiRUNncm9SOGRYWWIybnltd3kzMXNoVTdRQzFQNkpB?=
 =?utf-8?B?QXFZUFErY1FtRjlnRmhjNy9qQjdVQ01QcmJUd0hiRDlBV01Pdkx3eU40OTJF?=
 =?utf-8?B?UFl3dVNxTHNJcUpidXBnMVlKRjk1ZHJUZTJmUHloWVdXSXIxWFpzQ1NQdlJs?=
 =?utf-8?B?NjY3UXNyZWtsQ3Q0a1hzYXJRbXVpc21pS052OU1YbDZURk1qOGl5dVkwdWJB?=
 =?utf-8?B?SnEwQXN5WWZOc3RURGNBNGVldEpjVnNCZFRCZ0hBN0tZaXd3a3VnNHR5MThu?=
 =?utf-8?B?MSt0aDFwREhta0x0U2h3S0s0YUs1ZXF1dTI3QVNPbmhEQXZLc2dEQ3huOEF6?=
 =?utf-8?B?L2x1NjVvSWk1MW1mTVU5TkY1cWNHNElQRUdqTFREYlUxN1p6V3Z0VnRJaVZL?=
 =?utf-8?B?V21iTEZkMTFKemV4Q2k2YkRWd0tzL29Wd2w4NVhLNnV0NmV6ZXp0N3c4Z2xL?=
 =?utf-8?B?d3dXZnNjZmQvT1pXNm4xU2U4MUhTYzVFNXB4QXEwR2VuZHF3aEp2MnRXM0Rk?=
 =?utf-8?B?MHI2YlpIQi8zSExzQmcvZVdnbTJQazgwenRkaTBFc0ZGOUd5eE9FT0tBUk1D?=
 =?utf-8?B?dmU4UjMrVjBaZ1ZzMTJnTGVTdkJPQ3RsL0t0c1RFVG9FSUVPNWJrUGh4ZVFP?=
 =?utf-8?B?MU0wRnQwdmNJSzBTOFBBa0JiR1BCRW8yK0ZGRmRyd3duWFBTNGVGUXQvTDhn?=
 =?utf-8?B?WFhtMVhtMklLVEY4S1djb2NyZkU0djVTc0dDUzFFZHJnS1BuY2E4MUgyN2dn?=
 =?utf-8?B?SUFDbTM0dHhiNDhKOXlud2RPUzZhQ1psdno3Zm5qc1pkT0xxbWVIbDM4NGht?=
 =?utf-8?B?TnpQR0dhcng0aXZKWmc1SHpuTUozUXpaWU9HRlEzcVNaNFh6eDN1M3Z1NUJU?=
 =?utf-8?B?M1RNV05RaFpqUjBCSEhtcnhXMUNKMlNKdUpGUVRZYkVldGd1RnlQbS96bVB6?=
 =?utf-8?B?eVYyenBia0RqcndZZlkxbi91bEdhZUt5U1pQYVRTcE9HMXFDNDhPVHZXeDN3?=
 =?utf-8?B?a2lRbVNWU2U3WVZRSkhZQnJTNy8xRDlkUDRMKzU2RVFTVSsydjNJWHo2Zzd5?=
 =?utf-8?B?bDFXb1VQZlU1RXhBcU5JVE5aRlpjY0ZXS1lKSkZRVmx6ZGZSbXNTZVBEQkFv?=
 =?utf-8?B?UnpvSlZtVmtYcEF0aU01RW1lUnFrK3UrL251eXZ1VnZrUE9oekxxYkoyRktI?=
 =?utf-8?Q?FwYRq3V1XMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0FqNGF2bldnUEtodk9tUHdHazZNRzB2OXo4VFA2WTdUdXJTWE52OWpNTjNW?=
 =?utf-8?B?Yys4OXhJSXZ1VnJkelVsdVJZRm9scEx6ZGFFUGh3dWhTbndUL1kzWlBmUkdy?=
 =?utf-8?B?bkl6TU9nODUrTnp5cDFzYkRMS2xGSzNsZUpmVDR6ZGdWTkZwV1EzZkJnVVlp?=
 =?utf-8?B?QmRUQ2ZkbzJvSHdhQ1k2UGtqMEZBZXhEaVNyREpqTWViNytsQkd3OThRQ0dG?=
 =?utf-8?B?MEdmdDIza3VJQmRQSmIxRDNOallFQXVHaTdXZGFKUThEQWdqdGVMS3l1bFlJ?=
 =?utf-8?B?VVB6TXZLUG5COGw5bEcyN2FTMW5hMkxVS2FUTlU0S0RVNUxNSE03bEEvdnJX?=
 =?utf-8?B?ZEZyd2YvcUg2czlEaTF5TXVBN09Ock5La0R1M2QrWndyYVk5NGc1RlVtOUN5?=
 =?utf-8?B?amM2d2pEc2xVdlh5OEd4RmpaUHlPZ0xVNHFzOTQ3WTArdS9lSlhWUlh0NlhR?=
 =?utf-8?B?Smk5REFqSmpjTHZWNHNiVFhSY2QxQUJSOWV0Nk1RVG9yZHJjUll1ZUFqc2Mz?=
 =?utf-8?B?MG9QU1ZxTWxMTG9yWGlUWWZsQjAxZ25UdGZDNVVMSWRIckJBVWcxeDZ1U21C?=
 =?utf-8?B?MlloejRHZE44TWhxTERiOS9aNVRSMkwrNU1tY0g5K0hCTkJyZzhYUHBjenAv?=
 =?utf-8?B?OElXejg1SFJpdm96MnZ4dEFGa2tzTER2RTYyY0xWSHg1T0UwWUU5KzEreEhC?=
 =?utf-8?B?Qmx5cjhmRUN2K1c5U21NemVmZFV6ZEtqVGxpbUxwWUhlc29qb1NxSUkweDYv?=
 =?utf-8?B?QldVQVUrd3VOa0xvOUlsMHpIQk1CbEJNN0tUOWJKelNLbTJOVytVcTVhRElE?=
 =?utf-8?B?Y1Y3azA3b1BGdmtXYVJhTzZaQWZtTFhYTGM1RHJFc0xWaUtscHF1eUxieWhv?=
 =?utf-8?B?WlhQT3JoUTJvS1Y3R05iVURuZXhJQnMxVUJSQTBPM2hySUw4azAxZkREbWt6?=
 =?utf-8?B?M1JEN1FUY2tiTit2MG5tcjIyNDZsOWcrQUcwcHgyZlIwZFhUV1Qyc3ZWZnpv?=
 =?utf-8?B?blpPYmRtb2tyQXB5OHIwMEN0djRzd2NvcmJ0MnVLaU0yOENoQWxZQnlkSlBI?=
 =?utf-8?B?OGxZTFA3a3VYalo1bmJTalNpVHNzemxMM0x5MlB3Y2pOUktOTnZ4cjB0azFF?=
 =?utf-8?B?M2lrL2JrdWVJRTdXc0w5Vm1pa1ViekFNMkJQVDFBdk8xUTFLU2pibC9Wa1BW?=
 =?utf-8?B?THZZT0llMVBISi9HQjdHOEh5Y2lXaVlSU2JKcXBzbTMzNDBndlN5Z1pEem1M?=
 =?utf-8?B?ODlnTEtuSks0aWJEVm9rZGVuR3YwbkcxRm1raC9sTEhOUmdRbmZaUDR0ZUFU?=
 =?utf-8?B?dDZway9nQlhEOU1Ua3RmNjZna2Yvb0IydEpvb3hkMnA1NjNaWkNBaGFQdCtB?=
 =?utf-8?B?MzVzTXBrQWhHQ2NzWEtQWkw1YXE4MXFoOGFpK25td1NmSFZZTmV2WlhCNjY1?=
 =?utf-8?B?eGRvSlg5Uk9IRVFNaTRBUGRQZHM3NXFMK2Fta2RuakM5NDRNUTEvTHlPNi85?=
 =?utf-8?B?UVk4UzZyMmV0RUZlMXVKNndwNzliOXR6RytWUTA3VGVlOS85YktuMnI2VWpG?=
 =?utf-8?B?Q1d1bDRCaFNQMWdVcmp5eDFRQWlkTGpuSm5MdFIzb1UzWXZ5cVo3WXlveEQr?=
 =?utf-8?B?VkFsa3BKTlhncGtNL2c1YittL3MwRkkzeDlPZjBOZS9BbFdsemFDODQraTFQ?=
 =?utf-8?B?R0loSGlsalAvZjVTVDUzUTlhMWh0V2xBSjdEdjRsSWVycnEwOHA5UkZLdTF4?=
 =?utf-8?B?ZVVINkxaVitEU2hPTGdrMHJMREs5elI3RzhVWkVHYXlIcmRUem5XYnA4U1lu?=
 =?utf-8?B?ci9laVJadXlWR0svSE1mNG9SaHUwYlBBQVNlUXB0bFd0MzFCaUd4RHc0Q1pB?=
 =?utf-8?B?T2JUL1NZWGFPeWdhcjNURmlGYlY5SEJudVhqempBOUFtYzZkclJCMVRsM2ww?=
 =?utf-8?B?WHJlOHhZSElqeGY3TzFhbGhLRUVWY0ppVW9VeXoyRGl2a1E2VDlNVnU2dU1O?=
 =?utf-8?B?ME5jNzBBUEYrRU9WR0hOWEJJTUw4WnpidE11MU1Ed3NqQ1pCekdzV1hhMEpG?=
 =?utf-8?B?U0FHMm8xTE1kZnNScEJmcmhYRnlRajNDNzdMY1VNVWRuYzlDVWJJZDF4RU9k?=
 =?utf-8?Q?psbztQIB/dt80cOCdZ10CyXAn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d4069-e529-44a3-af25-08dcc351901a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:57:05.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9q3O0h/cC9iEoHxNgEJjTqIAnY88Lyqttw+CWce8W7KTNshEbGxzZD6aeIKlEMw4NZbraP0b1JBYyCMN5KClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

From: Peng Fan <peng.fan@nxp.com>

Add NXP i.MX95 System Control Management Interface(SCMI) vendor
extensions protocol documentation.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 886 ++++++++++++++++++++++++
 1 file changed, 886 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
new file mode 100644
index 000000000000..6a9e53c17df1
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
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


