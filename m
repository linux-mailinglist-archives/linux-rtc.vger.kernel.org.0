Return-Path: <linux-rtc+bounces-1701-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2595C895
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DAB11F24928
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBC61607AA;
	Fri, 23 Aug 2024 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OBs3h10f"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81DC14A08F;
	Fri, 23 Aug 2024 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403426; cv=fail; b=dyai5vluUCInFpQYZutaKJI6x6gVxcJCDZ5UkMGBfLNwHn0DCWpY9wZTP4c9dDFGCM9Gf5tnpYIxqywfy/6HwedyjR2Wv1OWxO7tg4HOlqEqMj+V3OOS0dvRv6hmjLW+O2bX0MWjaalmzgWpws5D/hjtYSlvmrDumlLUJcu94p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403426; c=relaxed/simple;
	bh=YzX+egaADaOvLdccNeRElzHXSKX3T40Ex3hk4ikMEtI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QfM5QXuqa3MASayWeG7/O4Bdp2zGMnBAbxti9dpSC4i2XUbw1hBLCHpecvEguHESvf7Kc9ruCf02iG3TzknS5edOrUBfqqH7zLxM38IvzF/APYtSPTJ4Ahzog7/lODvXgkj4F4Ic9Prcr+ntTpRuswRLLtv0M1wOWdM9JMQlHuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OBs3h10f; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2ODFO3Dz7gEtNdfi4cccNtwf2eCqIV5rbnMKj1DB1eDyyBzPC4F/eZSgHUmYkhtMrMHR0vqBt1d8oGFpJjuqVSqcEZOukhEqko5IAYdUS7HDf6F9A1xYSut/jRBNDasyy7OUdyA/h+OLQ2P/u+6+cg87VXrfnCMZKahAaiQPo2ArF6CmxMSjWUKxKJiMcKZ1+fUraNt5uZMgF6PA8V9Q3MHGvMl7Jyv5hDVL75eHRdjXapTnX7S2tRhbZrosTU2jv1POfHaGQXtyVWVYN6SedaiywQVJGmgFDlqN+l5fJfCGGu09O4pcOhSlGyQyAcmd5oWLXA9QsiF/e9fMKDK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKPhPaPubDMB7T0nU+qx5zkB3qjRgawlZplzI8gYwOE=;
 b=sytRDX4zcztZ1uyqQoouRM+pVOn8+cnrn6i8j6XeZWjSmBtgdxYWjldSvWObnVbZoamUM85zhuIHY6iLOz0Ts9NEZaxOcpisivrYkAkfiocY8sHnouT5XKma0q2QMmwwLbrd/09ZHkDUelVUGB3GD+iEJQqcyzKsxpFkqoU0otLX4Yk+6E9XX5rCOp00+7wzDKvhP0cX9TTFfOM4lvhSNAzunoQym+/Y60SNIeXZ/gKTRaqu0yHer1+/TkgbBEKFageIhNLVBKdHAk08eo1pYH2EVkA3Cca2HiaOYYovADwa/1wMrYVUX71CtDoLqPwLcCZ5KvVHhX5YapWAyl8p2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKPhPaPubDMB7T0nU+qx5zkB3qjRgawlZplzI8gYwOE=;
 b=OBs3h10f4Bm2pmFM3H9Fvmsp7tRhYj6mReJe8fNGNKebdTgcHr5P3GXJMUc+iPq7BJO1Ch0D7z9AjCthz7rDysTREFn4SBVz1XQv1dVbPa7lu+6Fh3+wQ0RyE4GPLpp75Ey0VELXRMTLucZ9Y0D/s6o+DX+OL5T0p42HjmgqK0EDpZGysVptFLNghXTx3y7vE/xCn/ym3OmP4nDSGjANp1/bf4C1pSR9RQXkauCWfl5CFdRduNTjF0A6zTCx2Q6F1PqPriK6eT7HPXRUQliH2gYe8gkY3QiU4XAG+qVTalUQPtAIryPn16YrVCa5dlOY6LaJ5iTste3UaLv4rUk5gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:57:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:57:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:19 +0800
Subject: [PATCH v8 3/7] firmware: arm_scmi: add initial support for i.MX
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-3-e600ed9e9271@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=11659;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=N3sn+AcOHmdt2ArwuyQeJTgG5UtWBpIYOiQIExKZQWY=;
 b=+bQv8asYhO7Fm7whDpt8aPxtyaIvZsRhrCgVf2JMVI4yIEd1YJxYMc3r2MOfRGtDbJeGGtiR2
 qMkfi2CA//eDXwMSmUxZpHuLP8Ylo3QPI/Ax2XG6PuJK09i2HCpSYgs
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
X-MS-Office365-Filtering-Correlation-Id: 53ae84dc-a6af-462e-0e50-08dcc3518d16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alEzUkxSa3JhcXdJRk5IdE4vLzEvVDhWakFWNkpER1dHOEltMWViMnBTMU9h?=
 =?utf-8?B?S3FMa21CcUN6bmJkM2VHMFZiNERmTU5IdHc5dElGUXFzQUw0RlY2cHVvTExM?=
 =?utf-8?B?QzQ3bDhBK2lXSkxvMUFUT1Z0UStEeUROQXBtT04yaHlxeks2ZWVrcjQzOGpL?=
 =?utf-8?B?SzJDUXNjb3d2RzNHR0J1V2tpQi9QeUloN0I2dFhxakhhbDA5T2g0TUZ1S09N?=
 =?utf-8?B?R1ZpU0E3ZmJwVE1td2hOMnRpQ29SNWVCRmk4RGE4ZHlDZE5iaGltMVJQWFVn?=
 =?utf-8?B?M29ObTVKTGhwMDZaNWxBV3Z3Nzg0NWVNWWVJR1JkMEl4dnl0ZXJreHdCK21o?=
 =?utf-8?B?VWFPUmRpNlVaWE9FYkhsekF6KzZONzVxMDF3NVJrRnlnbmdaNWZTb0htOUFi?=
 =?utf-8?B?NElyMGx4dm1zNk5SU2EwYTZaTWxObmYxNSt1Mkw4cEZ0aTVQaU1UUGJueUt4?=
 =?utf-8?B?WUFoT3VGUURxL2djc21HTjkydnhaV3YwRnl1WTZsSUJkcm15R2JobnhRN1I2?=
 =?utf-8?B?RjlwUWdiV3ExRUdndnRhb01Ram1kcHBreXc2M05yN3pzc2MzdTQvOElZYUor?=
 =?utf-8?B?Z0JweHZPMDN6MHF1ZVRpQXNvb0ZpQ2IraU9jMnZ1THB6WE5ReTlEcFRlOWJM?=
 =?utf-8?B?NkY0N0k3RHppWFcwdERObXpqR1djK0xWUXptUWVGbWJ4cWZzZXR0aXVnT1Fn?=
 =?utf-8?B?ZjVPanZIeUtMaWxxVks3eGhqRjNNZitiN2RPODFTN2JRaEphTTBGSjBDL0t4?=
 =?utf-8?B?cUU1U1pYbmdXV1hVWWNQa0NSMzFWYTNwM09Nb1VGYXpMamtjWmM4YWE2RlJR?=
 =?utf-8?B?VllENWo5YnlnVlBZNGdQdHpKa3BHY29RSW1UWmpJaXdxRjRiUTUyWGFqbTJt?=
 =?utf-8?B?Y3FURi9QZnM3OFd1T2VOQ3hpRG1GT0tIRzcveUhPdy9wSXZkYi9ZR01YSGhW?=
 =?utf-8?B?WVAyR3RJSUZqUjZhaVhTSVA5NWxjVG55UmlwYVBKK3pDZDNWSjNrRUtSbFdM?=
 =?utf-8?B?YmQ3aWdQZlVMMXhIUkJreEkzU0UyOC8vT2RMTGsxZml4NitsTmZCazRHNHU1?=
 =?utf-8?B?TUVRV1FvRVZkWDl4UTlJUXBQVk0wakc0anBObXgydTlZL1VzTTlPeit1bmNM?=
 =?utf-8?B?T084N2ZDalJZeUtPQ2lMdEF1MzZrSDFvNlpHYzBwd0lyY24vZGhqbUFIQm54?=
 =?utf-8?B?NWFtdXMxcisvWlFuc0d6RHBxTnUzdEszN2QyWElmamNaOVhjNlFoWDN2Lzhx?=
 =?utf-8?B?M2RSQ2l1TXZxZ05RdDQzU1g3VXR2UHQ1N2VyZld1Yzk5S0YyY0NRUGVsTGRv?=
 =?utf-8?B?a1oyc2swUXYydVA1TkhzalM3SHFuakFBRlhpSDYwTzBDMEJHRmp0RFgwNjVR?=
 =?utf-8?B?R29ZdCtMcGpEZ3pHOVJBb01iNlFINGxPVnU5WHU4RmpDenZTVFM4V25FZDIv?=
 =?utf-8?B?ZDhIR2Z2bFFHSFp3NmFYRGJwYXJ6eTFsVnZuMG9jQVlQK29zd1V5ZGV1b3Vh?=
 =?utf-8?B?TG1kMEFuM2dLd3pGdmEvRm5KZG83ZVJBUkxzekFRT2dwREJYUU5jT2hRR3ow?=
 =?utf-8?B?cTB3YUhDUWJZOFN4V2ZSdDdIMElBVkdzazR2QnV4NTZHWGJaNkJhTG54Sk5P?=
 =?utf-8?B?UE13TzFUV1hrZUpBWjlqT3cyNXdzVm9DRFhCQXdEYkJDd0psMmo5T3RlVUV6?=
 =?utf-8?B?clRjdlV2aGk0NmpNVDVYSlVWRnRqNXRXeTJuVUZzRk1UbDhtUFpzVzhRK2Zo?=
 =?utf-8?B?dGRxLzAvYzZQVEVHMjN6a1lidkl1Y1VDcW9RK1ppSXpYZmtXaUVwRzM4aDlN?=
 =?utf-8?B?dlJsc29pbERSSGJDS2ZRSy9QZE1aNWZOTmptYWN0bWErRUJNUmdseXpiVmZh?=
 =?utf-8?B?djFSRktLUTArSXprK3N6WnA3YTlxb05JZkhqUWxwUFlQRDZFQnEyQi9pa1ZD?=
 =?utf-8?Q?beOcD4W7tLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Slk5MjBlMTU5RXVPeklCaU1BbjFxSXhjMnFvLzFzOXFIcVExNTRLM2N4YUtt?=
 =?utf-8?B?VW02MUdpQlZRM2h6ME5wQW1yZVN3Zll5bW1EcWtIRU8wVEFUeDJUTGhKdUlR?=
 =?utf-8?B?WTlmTm9mb3cyd3dzbFJnTzJlYkEvR2Z2M213NnJROU5mZ2N3dWp3RmhyREEz?=
 =?utf-8?B?ZGZJTklVMTNodGJ2Z3FrTHprbVB1OFlZdTFvdDhNMGdoeEl0K3F5QkxldjZh?=
 =?utf-8?B?aWFmZlZTWWc0QURZY0ZLYWlMRVNKWHAxM2FqMnRKcGtOSlJHYkpnYnBuYkZt?=
 =?utf-8?B?UnFPNUZqRTREbERqU21RdXZ4M1k3WmUyVUg2OVhSVmN1ZUhTSnppelRoL09z?=
 =?utf-8?B?NlBjN1RuY3NVek5JandBWXZVdTNIb1I4eWp0MEVaYnk3MkxGQ1ZYVFk3QWM5?=
 =?utf-8?B?aWZlZXZUZXFQSUdOZFVqaHZQNzIzYm9IN3FVVDk3SVRXK2FjWm00WWhvQjIw?=
 =?utf-8?B?ZGpRemRIcHhCWUtMSmRmQ3RSVU9uOG42QUNVSUhWNXBWMkF0WGJoRFFhYXdG?=
 =?utf-8?B?SlJYc0lMNDZIS1RjckJLWlhHaW5ONmJOUkh5VTkxZ0RhNGNwdVZ2Q3FoWUlH?=
 =?utf-8?B?bmIvOFJZOXphVkwzYUE5L0tvV3Z2bElqTkZWQWV6SFlYdC9ONytkNk1PVW1t?=
 =?utf-8?B?dnQ5T0d6ZzZKS1ZIdWJxeWpDRlNwUzJRQjVIUCtvTDBaSEhrdFI1NnR6RkMr?=
 =?utf-8?B?UUZHNjZnelllb3dTTzJoSVpvRlgwbkNRc1FlMEQ5a0pub1V3L0k0dXlUQjZM?=
 =?utf-8?B?K3p3U05MdFVqNCtxZkdQU1RzUmlobmlISVBDOHFhMkpmVVNWUGpWK1F0cTkw?=
 =?utf-8?B?R0NMbVh4RDh4bW82WjQ3NG1VckIxWTAwR3piQzhZdk5HOTYvc1JVTG1IQVBt?=
 =?utf-8?B?N3hQVHRWSEVjZWlEem5WVGtDR3pPUW5PL25jVzJaamFpWnRhVnZQOGVMdVow?=
 =?utf-8?B?OUlSVTNkS0IwVjBhbVNyekZIOUNSeDRmMnFQMGl3cy90Q09FdTE1QU43dHRN?=
 =?utf-8?B?enFZNllyR21HaHJ0ajQxYVExbTIvOGpWcjExQkE5T3IybzllN0hSTzVneFRR?=
 =?utf-8?B?L3dwZWkvUG8weXAxMHcvTnpLNjBLdzlFM2NOaHVkM0huaEVLdndBMFlWMXRw?=
 =?utf-8?B?VGxCcG5EQWIweUFPUUNLVmpRNld1WEcyd3gyNGF6emxSK2RodVkzNmJmOHhH?=
 =?utf-8?B?MUNIM0pmZ3UyTW1oYjFWYkJhMjNxeklsSEdpaXVualIzaVBZOVBLdElxV1RS?=
 =?utf-8?B?UWpqbGxweUtPVVh6Zit0Ti92RFhqV0M0RGdlby9WSDJTRTN0cUs2amtZTkFi?=
 =?utf-8?B?MHV2VDRKRkZ5Zy9telZyRHQrdHVkemhEY0xtSEt4MHI5cjhHQXZudnhTQjlq?=
 =?utf-8?B?cnlTZ1R4QWROQ3dPbmZEYlhmZ2w3enBmeURhMDYwQlk0Qk85UExMK1RPcUEz?=
 =?utf-8?B?cjVDUWZ6ai94QlJYWi9qZlc4Y1BhcXJaVmdWVitvWG1vejR4K01GOUtuTmZs?=
 =?utf-8?B?eTJvdnpTMCtYb2pZdU15cFpqTHhzQVU1NjNTWDJBZStyeXB0M1JGaERBV1Rz?=
 =?utf-8?B?UVJtMEhmZWJScnVSMjlFUUZEeVFPdTJNVXhHcFBtdFpEdGFvdnU4RldCa2pX?=
 =?utf-8?B?OUdEVUxGbzJaODhOK3N5UVZYbkxBWHNHcUpTdlk4OEJQZFd6SEdWcFN4dnJp?=
 =?utf-8?B?OGpYbFBSY29tK2ttclUvUVpKOWE0bUxmK2Z3dFhlY2x2dlNoSUJWRGpzOHBS?=
 =?utf-8?B?Y3A1SDZuTjM5ZlpCeHNWU0ZRcGpKb3pyWWVCZVpRV0k1cllzczNuZ0NKazFr?=
 =?utf-8?B?SFdqc2owYmRVTTFhNDFPNEw5QjVaMVVLOVNoaVVBU3RjSTI2TnpDdGhRUjhB?=
 =?utf-8?B?TlNNQ0NCSHFad09qU3hCSUJkK0lyNjMxdDZtNk1wNmR3U2tsMGJxSFdyUEFR?=
 =?utf-8?B?cXZGbmlhYVhyVUlRcWtYa2ZXNDVEYjEvdlVNSFkvckVVTXpXODBiS3ZaTThK?=
 =?utf-8?B?czJ6V0ErNjRraGhNSDR0WkJVL1RIdzR1MTZJNDI4WVBndEhPSDA3c2dXTURG?=
 =?utf-8?B?SEt5VXhDUGU3eW4yYU5PVVpnM3BrMmVYMWhsRmZiYXVkNDBRcytKdEQ2TVJ2?=
 =?utf-8?Q?SnzA3YYSNu2DdgYEQSOyhuI/w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ae84dc-a6af-462e-0e50-08dcc3518d16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:57:00.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCkoyp6Ku8xu+vmUQ8I02vWTJfB+CJfMafTnGF/88fJKBF+a4GAr6XXdewe43rfwxujCYUbxUDPFTUPit9ZF8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

From: Peng Fan <peng.fan@nxp.com>

i.MX95 System Manager(SM) firmware includes a SCMI vendor protocol, SCMI
MISC protocol which includes controls that are misc settings/actions that
must be exposed from the SM to agents. They are device specific and are
usually define to access bit fields in various mix block control modules,
IOMUX_GPR, and other General Purpose registers, Control Status Registers
owned by the SM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  10 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 315 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  17 ++
 4 files changed, 343 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index 51ccbd038627..e9d015859eaa 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -9,5 +9,15 @@ config IMX_SCMI_BBM_EXT
 	  This enables i.MX System BBM control logic which supports RTC
 	  and BUTTON.
 
+	  This driver can also be built as a module.
+
+config IMX_SCMI_MISC_EXT
+	tristate "i.MX SCMI MISC EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System MISC control logic such as gpio expander
+	  wakeup
+
 	  This driver can also be built as a module.
 endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
index a7dbdd20dbb9..d3ee6d544924 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
new file mode 100644
index 000000000000..0e93a81e579a
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
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
+#include "../../protocols.h"
+#include "../../notify.h"
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
index 2df2ea0f1809..066216f1357a 100644
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


