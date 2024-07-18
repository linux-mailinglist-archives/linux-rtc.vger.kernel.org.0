Return-Path: <linux-rtc+bounces-1547-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7679348E1
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 475B81C21665
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C878C88;
	Thu, 18 Jul 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oi5CCZvh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE578B50;
	Thu, 18 Jul 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287999; cv=fail; b=IRnoJrwgrWLM8LOMmpEcmJ13g0n7HPwkFgeE0Ie+5QWnW/1M1+ZxXb8hXZ0u5DES56NHsA6H6Va74OPWGuz9at4hPBceuqCdubEsIbuMiufo32gfjyZbE4Ah+XqYfWbjZ/uVlUwWKtUxaPAcnhAHZd2L7XJF4v//8DmlQPSsYts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287999; c=relaxed/simple;
	bh=E5LpsSI+IBisa2obdH4gzsQzu8srJbB8PmQjInA7uFI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pt0unNsT9zjIE1Tk+uTgOZCLMS8zFbIe8Jp37jGKtvvUo+a7ABzYOdbap7f0SalSbLlAvNCcRw4Npk4iy0tRKpBg3n5CsOhMX78hoM1uPCQ4D0g98oe4L8vOOrXJFBWUXRslJvAJshJ4f+CU+q6i95n5n1EimEvjgd4IL37Vlo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oi5CCZvh; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH9N2dcvKVta1IgFEz6rVv4/1dNMMg3YjAFHI75GxLJr0kq+60DNtfnAGW5JMHGOdqOoKzq5NFHz6lsqS7oviYaW+S2a8XChEHR+PuARCh2zi/2bI6WRI5xMa6NlvKcpyDrSSg1eNaHv2zWAuJKPUe5n2HaJ+rsvKUKl12GTIhEUDvLa1wUkUXxukYT8sd7xa7Ayw0gI8P19F87l1hgg6GGiL81KyLlsUKPgdKAOY7qTOEOt9wmSQAWcUacs/bPcqh+HkVIxftQ0CRZzGKOW5uD/VbfJ/fOYfC1J0RVWt0fPLZZG6gSUWTYY+QmCLWUB+9kWGAczuYsYjw+vFMPL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xkagEKIddeT9VSxKdk2VEbIxtLknUAa+k5fp4B5DyM=;
 b=HRpuXqn/Wor06ycy3fUFBmve1JyE9Yvw0dShNtqbALts3+iTVuAVtjLtecpxUn6q6RPWIVs58ZGeTAymSNe3jN5VACwBx+D+CAweOj85D+Zs4a+ZjdGkS3SJOwDOGpge662TTZLi+sWFrLgdnrqUlGngYJ3O1TK8b5bS45/ELzx+jQP5sgmc8fWevziUYnSaXt73hk5Xb52p31ulqx4wqIkwa3fmHdfMa4OHFsQzA4K/UFH0ueRSeR4PtlL4GGOhk8YZckTBnhAa9/GxsdHFuGOt/FYI5hAGZkesiE4g0ImfK/kVgMIsAKhki3PyWAvDJTRh1wUj4Y2pOwpZNpq3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xkagEKIddeT9VSxKdk2VEbIxtLknUAa+k5fp4B5DyM=;
 b=Oi5CCZvhKJxpVdcx2q1UKiex+veXn3zq0W7rA8R0s1mi/e205mEb9oUGEAalk0EJj7GJq263exURHjC2ST45I2+ZbESSloLN2OcpL64j6vEGYTpdBt84btSskqe6ZfcBgN6OUrzdy7LIwFp+imv28yzJpXlICmPhpVoUml/3eXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:54 +0800
Subject: [PATCH v6 2/7] firmware: arm_scmi: add initial support for i.MX
 BBM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-2-18f008e16e9d@nxp.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
In-Reply-To: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=13923;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=m4/zUnBHrvUCml6LwbVFtKf2AEb1qkvpVEohGFcAPm0=;
 b=egMFvfpmIl9jECaizNKqWYP7F4mMKqfzSeHZPbApLHRLsGrqfXUvWqi6Ps2KU8bsASE4YtHZI
 Q1PZV9EYFvjAEqJZsXiwwLNQqmCzFWxAN2iKUqqXkQl7lvZOpZMZ8+s
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: ead6aa7a-3191-4d16-205c-08dca6fbe1a6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlpKZFhpQktvTjNGajZHdy94OEs4UFo4Tzkyd2ZrWmd3N3NPVFJLbklBbXhk?=
 =?utf-8?B?KzhZemV5ZXU1MGs3KzNMSGVNREQwUjVIMHNTSjdUdlhETVJ0bENuQ2JXTVZ3?=
 =?utf-8?B?UzZITi9vdXQyMjcwVHgrbUUvRVBzNWJmQkhVWS9sMGU1VjZoZ0hUODBsSDlT?=
 =?utf-8?B?SnhMb3BhNnM4dWdJSWdGeDFQS1FDU1crTVRrem1DdW1XUFZhZ0IrZGhHL0ZF?=
 =?utf-8?B?bDBHeFdWQW1KOXRWOURVT3VaTXJiWS9xZkpienVaUWxXN3pxMENVZmJtU0xm?=
 =?utf-8?B?OW1uL0F1Wm15bERlRkExWTMzWGZCcStxQzdScDBPWDVFU2E4b3g5c2ZmMktS?=
 =?utf-8?B?TS9nbjdJdmVvdWZoczVnSGdUcGNlZlBmaE5xUnhoMHprbkh6bEluempzdkpD?=
 =?utf-8?B?dEUxUjlKVmtmbGZpaGROYUhaMGxGQ09nV0J0bEhSYnI1RTBkbFBVZ1ZaRW9X?=
 =?utf-8?B?YytVb21Xcm1KZys0VEZrVzJHRkwyQXFpTnRrb0hvMEhGbmpob1pCMkozOWcv?=
 =?utf-8?B?cm1VakFUR0IxZVVrdXBQeWx3bmlUMnVtT0ZLTnR1NXRNcDRPNm4vUnRFMEd1?=
 =?utf-8?B?YmtOR21mTkFHR01veEFibE5xcVVPdVE2Nm1sRWxONkl3VEE2R0RBNnI1UTB1?=
 =?utf-8?B?bFlvMjFJdDZ6RndCZmM5bHRQci9ZZ05ZdzdFclR4OC92MFZ6QUc2b3pYV2R2?=
 =?utf-8?B?VmJ4VW1VNHpPOTJLVjdNVTc0RGRZbGxweDh1L3pJczZkSWJVeTZXdDFmbDFY?=
 =?utf-8?B?bHRXNlJHeSsvNTY3UmRmV0pGZXpYWEZPSEN5cDFpTUtjUWQ0QkRxb2h2elQv?=
 =?utf-8?B?c0NjTFE5ZG1uRTVqRzlhSFV3aDZIeGFYcUhxZ1B0amxUT3JNZVdFZC9OK29t?=
 =?utf-8?B?K2FWTitDY3JwVTdabHc1V01CMDJoeVFrbHhZNjJpbFEvaWRvR0xqWkk2VGVi?=
 =?utf-8?B?Nm9haFBtemtPU0NKM01OU3hIbDYzQzUwYXdCSWZJVkFkR2R5TVN4c25rL1lW?=
 =?utf-8?B?R2ZPN2hoNjFORHNaYXFHR09PM2lVdXdseTJRVHlyVnc4WUs0cFZkUUg3Nitl?=
 =?utf-8?B?WWV5aGtobXFORXl0aXJuVEw1TTQwWnhvYUFKd0Q0a2ltTjZZSDJGWlFNZ045?=
 =?utf-8?B?aDJuK2FML0cwNmxQdHY0aHlnRkF0K3A2MFZkYkEzd3RVakxDWFc3bHk5SURE?=
 =?utf-8?B?cDUwUEtBbXVmaWRQa3J3Z3pBWTB1bi9jQzd3KzAzSk12YitVUmJ0elVSeWJn?=
 =?utf-8?B?RnNHMHU4M2dKVEw2ZXBibGI4OXAxVVFDdlVjcnNqYnYvMk5NU3VObTZRQWpY?=
 =?utf-8?B?bVU3WjFIaXlIU2tiV2EySkJ3UGp6b3FLa2xQS3loMlc3UzBzQzhmeityRkNI?=
 =?utf-8?B?UC90YlA2YWY4QVBBS0NhWXJ4REdiWDkxdW9nL1ZNbXhGT3NiQ2s0Wm9lR3Bt?=
 =?utf-8?B?WFMvK0IyNEQyeUJJV3lzNlFncWN4UEN0RTR2ZWNWejBheTJ1MVYwbWxCZjRs?=
 =?utf-8?B?WEFtcXVIRFNxVTRrNlRuT1ZDTnR1YmR0ZmR6WGJJRFA1djNidVUwaWorbVdi?=
 =?utf-8?B?WHI3TG1SaG9rL1YyKzFkNWdJbGZMWHRNMENGeHJ4OC9sZ3NnTE45R1Q5VVpw?=
 =?utf-8?B?bFhkM1VKdm9xSFlIK2JIdW1nOUFNbTBEeTlSeHA4TFNOd0h4ZGJXRmRzS3pF?=
 =?utf-8?B?QlU1WlhBUXVkeWRSYnhBVEF4Um9kbjhjVHZRQWlqL0ZlWnJ1dnBsZDhVVWQ4?=
 =?utf-8?B?TG1BUHQ4bzhyaVlJdDJSUnFEZStkLzBpY25HQWtSeU9VaDNxaHpoWDlOeHJu?=
 =?utf-8?B?eDFkeVE0UEFmcXFTS3VOYWpLNUVKUkxwY0tVZVBtb0FVbEFMN3l2QlpGOFdV?=
 =?utf-8?B?Ym5XK1VWMWJySEJnTWV0OEJHUm5HVEdMQXh2azVZaDhuZjczMWdRelNaTmhW?=
 =?utf-8?Q?57gWUGZiAlA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFArSWpLS2VSUStGelF4eGRjazVVYmJOSndlcncvUzJXYjQxQlBSTmNuejcr?=
 =?utf-8?B?TzFlWkFxWW1WVEJ4cVdUdEdRZWRjSmJuVGUyaVFkQU1HRzJxWGNlL1NXOWNX?=
 =?utf-8?B?V3B2M1pESnVmU2Y4UWsvZFd3aHdma1Frc090eGprMjgxRHlENGEwWFd4WFho?=
 =?utf-8?B?Y2hlTThjMm5jWStOT3RtTW5XSGJkOFpyM3hFY0JpbUY2b1ZJTXFzOXBHWXRv?=
 =?utf-8?B?alQ3K0Nod1U2UkY0ak5jL3JRUkw2clVzRGRJSXpDQVNQRStGbkpoL3lpWmxz?=
 =?utf-8?B?aFlEQzR0V2pCN09BeGpBdGZXV0FHZllJTlpVMlZlVjZMem9SbFBWTW1JQUtJ?=
 =?utf-8?B?dmR2cm85MllVYkdtcW02WkwrdVZTaEVhVjlIck5abzFCUUpmN094VTVaQXds?=
 =?utf-8?B?NDVnMWpRQzV1ZlBrYTl1RUg3dks1YkxuS0J5aEhLMjZTSjFIZ3RUSXcrMG1Y?=
 =?utf-8?B?cCtPUC9WTGxIUHI5VUlNTFVlY1JsZWNQY3IxS3hYZXprM294RjdSTzRSUEFO?=
 =?utf-8?B?bTdkcnpHdkVzV1VxVlhLRXkrRnNISzZTTzNnYWJqODQ4SWplcmIvYVptTjR6?=
 =?utf-8?B?bElmZzkxd3FNOTRXajh2TUl6S2lrYVYxai9UaFZCcXlhYlFoTUNMZUxsYWV2?=
 =?utf-8?B?R0JNaExYOGJIVlhWS1dSVndoZFNSb2tCekU0VUFtc2dqS3lWdGlzTE5pOGQv?=
 =?utf-8?B?WmEzWFNZZTR5aHAzRFJ4MUVZUzVUai9SUjVoU3gvOEFCQUhhOCsxTjhOYk9u?=
 =?utf-8?B?NWtjNHA3TVFiL2FQTmRyZzJnUjcyQXFsLzBGUk5hSXdlM1BQcEluREtXNUhi?=
 =?utf-8?B?dURWeUlsQ3JnY2FFemVTZWdTK08zTnpGalNrSXFmWDlPK045QzFCUml1RWtX?=
 =?utf-8?B?NThBUDlMeVIvSjM0WDkySzI4dkJPNDI5RlFEK2FWL1MvNm40N1Y1VFBZb2dH?=
 =?utf-8?B?aTU0aXBFVVhoRjc1eVh1c21UaS9ITFhGcWdhOG1rWGF0UVphZENWY1JKS1No?=
 =?utf-8?B?eW9odmZHOGJwNnNza1k1d3hEZEdpVGh0LzRXQVhnQ2JkeUpRNmZuUW9xUm1N?=
 =?utf-8?B?dlcrMEFobnRadW91L3JleldZMyt3aGxvWW5mcVJJUHFkeFVpbTM3bFlFSWR6?=
 =?utf-8?B?WWY2RGZwWTBTZytUV2xRRitQRVR5a1RjUWxpMi80RmpBbWk2aVpqYzZkNDhZ?=
 =?utf-8?B?b2JENW5hWTBuSCsrMGRmdzBndGVTRVdCSVMyRjRjT0hzamtCWVpGWTR3bllY?=
 =?utf-8?B?LzhGQzJuaG8xVFMxZGcyTEMrUnp4VU5ObzNDdUM1YUJ2QkRXR1REcC9rU1Az?=
 =?utf-8?B?cWNlZThmWlFUM25uOWl5WGgzM3RFMkRjMS96dFczT3dydGoyK3ptdmo3YWhT?=
 =?utf-8?B?UUxKdjhNMVBFN29xd09NRUxlajNxbnk0aXUwMVlRekEwSzNGQlJJdU9xbjZ4?=
 =?utf-8?B?RVlQNUtjNmlpbmVWQzhyUVl6S3cvTno2aWFHRlNjZk5LdTVwN25lYUFxQXJa?=
 =?utf-8?B?cFljM2FlS1AzdlBBSDJycUpzMjYvVjFtTUlaZVJsMVdEaEw3NkNoMkdnYnFZ?=
 =?utf-8?B?c2VzU1Y3dE85cGk0cW5RUHRZWGRWQVBaT0pOTWJaaHQwWjlBN0FxTnQwZ1lz?=
 =?utf-8?B?aGRpbVVNTXlnTnBOMGY3OXRZK1VKV0NCOHlqQzgxWHU0aWZXU0tHcS9iQTc0?=
 =?utf-8?B?UTJiUGVURkhjSzBmTDY2UWZEb01iU1hVbCs5d0RBTkZZOG9RbmpLM1Z2N0J1?=
 =?utf-8?B?WDdwcGNkbXZFcHhaM3pQVTJXNjZ2bWJyTThTVjN0TTR6SE1qK2JZU09GZTlZ?=
 =?utf-8?B?c2l0b2JUK1ZiQkVvdGtDQXNqeitLR1VuUkpBSmxQdVZuSms4aERiNlF1Zytu?=
 =?utf-8?B?bFFjRTN4ZDI2Yk9yVVpwNmJ5bFZHTFoxWEZ2ekkreEU3Si9JSk9kc1F4YWxJ?=
 =?utf-8?B?S2NPNXJETWIzdlFLUHJjSE1wNFpkWHgwUHRtR2Y3bFdRYzNHbm5RVnF1b0tr?=
 =?utf-8?B?bzN5SWlDb1BtWnY3M3RlZVV6eUJ2TjNBZXhiZUtjUHJYcUpZQTh4dzdNMW1L?=
 =?utf-8?B?Vm1PL2dJWGVNd3N2VFpPdnorSnhjTjhMcTdFdlVrUG5YMElTTWo0UXB1aGl6?=
 =?utf-8?Q?ViD6w3g6SGcGczzNDv6nQdjWA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead6aa7a-3191-4d16-205c-08dca6fbe1a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:13.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJZlkMWJD1AC5ZiRpfDheaDiBODQiMtrcvx2wxZ4mzE6PTcQU8Z/Q16s/6pUfNh6ph1fuQgeT0YytnJ8b3BuSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

i.MX95 has a battery-backed module(BBM), which has persistent storage
(GPR), an RTC, and the ON/OFF button. The System Manager(SM) firmware
use SCMI vendor protocol(SCMI BBM) to let agent be able to use GPR, RTC
and ON/OFF button.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/Kconfig          |   2 +
 drivers/firmware/arm_scmi/Makefile         |   1 +
 drivers/firmware/arm_scmi/imx/Kconfig      |  14 ++
 drivers/firmware/arm_scmi/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/imx/imx-sm-bbm.c | 379 +++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h          |  42 ++++
 6 files changed, 440 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index aa5842be19b2..79846cbaf71b 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -180,4 +180,6 @@ config ARM_SCMI_POWER_CONTROL
 	  called scmi_power_control. Note this may needed early in boot to catch
 	  early shutdown/reboot SCMI requests.
 
+source "drivers/firmware/arm_scmi/imx/Kconfig"
+
 endmenu
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index fd59f58ce8a2..fb9407fef60c 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -16,6 +16,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += imx/
 
 obj-$(CONFIG_ARM_SCMI_POWER_CONTROL) += scmi_power_control.o
 
diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
new file mode 100644
index 000000000000..4b6ac7febe8f
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI NXP i.MX Vendor Protocols"
+
+config IMX_SCMI_BBM_EXT
+	tristate "i.MX SCMI BBM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System BBM control logic which supports RTC
+	  and BUTTON.
+
+	  This driver can also be built as a module.
+
+endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
new file mode 100644
index 000000000000..a7dbdd20dbb9
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
new file mode 100644
index 000000000000..017183caaadb
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) NXP BBM Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications BBM - " fmt
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
+enum scmi_imx_bbm_protocol_cmd {
+	IMX_BBM_GPR_SET = 0x3,
+	IMX_BBM_GPR_GET = 0x4,
+	IMX_BBM_RTC_ATTRIBUTES = 0x5,
+	IMX_BBM_RTC_TIME_SET = 0x6,
+	IMX_BBM_RTC_TIME_GET = 0x7,
+	IMX_BBM_RTC_ALARM_SET = 0x8,
+	IMX_BBM_BUTTON_GET = 0x9,
+	IMX_BBM_RTC_NOTIFY = 0xA,
+	IMX_BBM_BUTTON_NOTIFY = 0xB,
+};
+
+#define GET_RTCS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_GPRS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_UPDATED		BIT(2)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER	BIT(1)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ALARM		BIT(0)
+
+#define SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG	BIT(0)
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_FLAG	\
+	(SCMI_IMX_BBM_NOTIFY_RTC_UPDATED | SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER | \
+	 SCMI_IMX_BBM_NOTIFY_RTC_ALARM)
+
+#define SCMI_IMX_BBM_EVENT_RTC_MASK		GENMASK(31, 24)
+
+struct scmi_imx_bbm_info {
+	u32 version;
+	int nr_rtc;
+	int nr_gpr;
+};
+
+struct scmi_msg_imx_bbm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_imx_bbm_set_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_imx_bbm_get_time {
+	__le32 id;
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_alarm_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_msg_imx_bbm_rtc_notify {
+	__le32 rtc_id;
+	__le32 flags;
+};
+
+struct scmi_msg_imx_bbm_button_notify {
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_notify_payld {
+	__le32 flags;
+};
+
+static int scmi_imx_bbm_attributes_get(const struct scmi_protocol_handle *ph,
+				       struct scmi_imx_bbm_info *pi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_bbm_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		pi->nr_rtc = GET_RTCS_NR(attr->attributes);
+		pi->nr_gpr = GET_GPRS_NR(attr->attributes);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_notify(const struct scmi_protocol_handle *ph,
+			       u32 src_id, int message_id, bool enable)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	if (message_id == IMX_BBM_RTC_NOTIFY) {
+		struct scmi_msg_imx_bbm_rtc_notify *rtc_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*rtc_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		rtc_notify = t->tx.buf;
+		rtc_notify->rtc_id = cpu_to_le32(0);
+		rtc_notify->flags =
+			cpu_to_le32(enable ? SCMI_IMX_BBM_NOTIFY_RTC_FLAG : 0);
+	} else if (message_id == IMX_BBM_BUTTON_NOTIFY) {
+		struct scmi_msg_imx_bbm_button_notify *button_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*button_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		button_notify = t->tx.buf;
+		button_notify->flags = cpu_to_le32(enable ? 1 : 0);
+	} else {
+		return -EINVAL;
+	}
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static enum scmi_imx_bbm_protocol_cmd evt_2_cmd[] = {
+	IMX_BBM_RTC_NOTIFY,
+	IMX_BBM_BUTTON_NOTIFY
+};
+
+static int scmi_imx_bbm_set_notify_enabled(const struct scmi_protocol_handle *ph,
+					   u8 evt_id, u32 src_id, bool enable)
+{
+	int ret, cmd_id;
+
+	if (evt_id >= ARRAY_SIZE(evt_2_cmd))
+		return -EINVAL;
+
+	cmd_id = evt_2_cmd[evt_id];
+	ret = scmi_imx_bbm_notify(ph, src_id, cmd_id, enable);
+	if (ret)
+		pr_debug("FAIL_ENABLED - evt[%X] dom[%d] - ret:%d\n",
+			 evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *scmi_imx_bbm_fill_custom_report(const struct scmi_protocol_handle *ph,
+					     u8 evt_id, ktime_t timestamp,
+					     const void *payld, size_t payld_sz,
+					     void *report, u32 *src_id)
+{
+	const struct scmi_imx_bbm_notify_payld *p = payld;
+	struct scmi_imx_bbm_notif_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	if (evt_id == SCMI_EVENT_IMX_BBM_RTC) {
+		r->is_rtc = true;
+		r->is_button = false;
+		r->timestamp = timestamp;
+		r->rtc_id = le32_get_bits(p->flags, SCMI_IMX_BBM_EVENT_RTC_MASK);
+		r->rtc_evt = le32_get_bits(p->flags, SCMI_IMX_BBM_NOTIFY_RTC_FLAG);
+		dev_dbg(ph->dev, "RTC: %d evt: %x\n", r->rtc_id, r->rtc_evt);
+		*src_id = r->rtc_evt;
+	} else if (evt_id == SCMI_EVENT_IMX_BBM_BUTTON) {
+		r->is_rtc = false;
+		r->is_button = true;
+		r->timestamp = timestamp;
+		dev_dbg(ph->dev, "BBM Button\n");
+		*src_id = 0;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	return r;
+}
+
+static const struct scmi_event scmi_imx_bbm_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_BBM_RTC,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+	{
+		.id = SCMI_EVENT_IMX_BBM_BUTTON,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+};
+
+static const struct scmi_event_ops scmi_imx_bbm_event_ops = {
+	.set_notify_enabled = scmi_imx_bbm_set_notify_enabled,
+	.fill_custom_report = scmi_imx_bbm_fill_custom_report,
+};
+
+static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_bbm_event_ops,
+	.evts = scmi_imx_bbm_events,
+	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
+	.num_sources = 1,
+};
+
+static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_set_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_time_get(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 *value)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_get_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_GET, sizeof(*cfg),
+				      sizeof(u64), &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*value = get_unaligned_le64(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_alarm_set(const struct scmi_protocol_handle *ph,
+				      u32 rtc_id, bool enable, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_alarm_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_ALARM_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = enable ? SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG : 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_button_get(const struct scmi_protocol_handle *ph, u32 *state)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_BUTTON_GET, 0, sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*state = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
+	.rtc_time_get = scmi_imx_bbm_rtc_time_get,
+	.rtc_time_set = scmi_imx_bbm_rtc_time_set,
+	.rtc_alarm_set = scmi_imx_bbm_rtc_alarm_set,
+	.button_get = scmi_imx_bbm_button_get,
+};
+
+static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	u32 version;
+	int ret;
+	struct scmi_imx_bbm_info *binfo;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM BBM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	binfo = devm_kzalloc(ph->dev, sizeof(*binfo), GFP_KERNEL);
+	if (!binfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_bbm_attributes_get(ph, binfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, binfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_bbm = {
+	.id = SCMI_PROTOCOL_IMX_BBM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_bbm_protocol_init,
+	.ops = &scmi_imx_bbm_proto_ops,
+	.events = &scmi_imx_bbm_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_bbm);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
new file mode 100644
index 000000000000..2df2ea0f1809
--- /dev/null
+++ b/include/linux/scmi_imx_protocol.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver NXP extension header
+ *
+ * Copyright 2024 NXP.
+ */
+
+#ifndef _LINUX_SCMI_NXP_PROTOCOL_H
+#define _LINUX_SCMI_NXP_PROTOCOL_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+enum scmi_nxp_protocol {
+	SCMI_PROTOCOL_IMX_BBM = 0x81,
+};
+
+struct scmi_imx_bbm_proto_ops {
+	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
+			    uint64_t sec);
+	int (*rtc_time_get)(const struct scmi_protocol_handle *ph, u32 id,
+			    u64 *val);
+	int (*rtc_alarm_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     bool enable, u64 sec);
+	int (*button_get)(const struct scmi_protocol_handle *ph, u32 *state);
+};
+
+enum scmi_nxp_notification_events {
+	SCMI_EVENT_IMX_BBM_RTC = 0x0,
+	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+};
+
+struct scmi_imx_bbm_notif_report {
+	bool			is_rtc;
+	bool			is_button;
+	ktime_t			timestamp;
+	unsigned int		rtc_id;
+	unsigned int		rtc_evt;
+};
+#endif

-- 
2.37.1


