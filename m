Return-Path: <linux-rtc+bounces-2943-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEDA1655C
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 03:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587611884468
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 02:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D1A8172A;
	Mon, 20 Jan 2025 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uluGuIkF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D107E0FF;
	Mon, 20 Jan 2025 02:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737339998; cv=fail; b=Y08vyOlVTGLjcC9EOXFbIlMTQ+GAkx9cIWzDQvMkFEI2ZNOR4LyH4q3LajlkAZt0yuSbYocX5c/oaREIzeDwBtyfOw647Ls9UcqNjvWE3UB9efIgf7LehKoHNb/duEK3+NhLKAEWyQ5SK0VzuCpAyHeICArHG9erBT22Fp2OpiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737339998; c=relaxed/simple;
	bh=ejvXjbREx6jsDYMwviDEBcgjeNY8Ej7gDUFVvLnZ2UY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TmJkwPrIoE0X0+S3fljt/Nm+s61Mejmyc8K7dR8HJgWBhutABVs2YQY2+ZfFZ7vJI+6m9cr6n7BHRXMhFnUsFP36g8cvE/8jdD3wGSEbZ7K1XtZPCtvFNVJ3LUdZvIpAdeTFxLMLZGCBWuhCNd8MsZx3zE2VP92RRksQIdqL+fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uluGuIkF; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHOgH65Shon93aVQXNbAd/g2t/8+bwYhm0sBINgIACczvbkzr4UqidSUnpcTbgRH0ezbVFhCtifF4mFWu3kw11mCDGQH9VLc3M/+hEjhBxDPhwbqx89rhDo9y3+iIs/hVGP2gPHZ2sQkCc232gPoJXd/KIAlipC9rHH6+dYKmVRfSf39WkB/19n5t0ZPywMNj6SM/6vCcW3a1sMe85XOHKqjdxiHZ8KC8thEGBu6xQvuhW7T1hDEt3hUaOFCL00lMkrHVtCGZva4IZIkA2giEqvY44o7b1nz7K2GDhIoiDUbozk12nMKa6doXv/gLLjWNjlLKZJ2FgMgJ2ZaKdSkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68sNTPGQCgbbRgyuRWHPeD3AapuURVy2WR1PynHpbgI=;
 b=Q/G0naYNIJKj3+LesrPThWL9RaR3SJ5G9fr+bnGXWETFz3/nrpu+QWX2N4Tc8c8zfY+3huizqdv38a8xCZtWq4GNIqL1gdM5Czt5KXWsO52h6CxKi23LYrpt0vwOPn/UmNkaRtKkUZQgOmKQmIHukMauxAyL57yGOfi3xjujAWNHu0QfHxjQkeOVWDXarV6qJUrf0EJxvP8pkwCJ+2F42zAin8Dtdu3b09/sQH9tCf5WATHLZC7LyE4GLB2Imqr15bdl9ROxeJBotG+tzscrQwN3woH2h/tvvPkvy5nLVVQWdyvanL0FmAQToYT0X3s+zj9lGpfD79JmvBkT/pJdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68sNTPGQCgbbRgyuRWHPeD3AapuURVy2WR1PynHpbgI=;
 b=uluGuIkFnskBdQMJn6yWhnBTLl462RJXskZWSM5caN+Nh6SSXm4Sq2GMhyTv2Zah6OrqNZRsIzM6eKOpCzawiSjWMAjJm9Qf59rUMHzCdoYxKPtknAQW5DGX1PgRd3RAVgU8Ydyx+rE3yOP/Jg5BSLMMBcRTU6hzHPR2Eijs57yUAcckis9FW12gunICDQOSB+KVE4Ml47Wp0MzVHYhRnbv0bGO21Y/IlI+g7rkiw+z5QknzQGl1QVHBCAYeSYvLmcQcBZBcIzPlsW0iRvaHloP7EsUDJNfUvK9jTE+VRDsVk56tsyEmu+eCLKSBIu18GAPDvKKATUY/i6IU8mOqbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 02:26:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 02:26:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 10:25:33 +0800
Subject: [PATCH 1/4] firmware: arm_scmi: imx: Support more event sources
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rtc-v1-1-08c50830bac9@nxp.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737339953; l=2331;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tqpvycmCUkKZkyc9Cyg3oUuQKAchfg07LHtaTpoAfgw=;
 b=cZyiewEjAmB1rjpHMTQgKi+1YAmewsz7J4uTr65YE4idYJ7iZNowzIsUkETz9iGboewI8NNQt
 rC9Cs4pddSMBaoEpkdP75XhPUFqLttJYPeetXe7XcK/3V0w2X6XyaaA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8c5149-07b0-43ef-d69f-08dd38f9d91b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmNST2RCaFFtUDZCMmcwMEpOdTNIUDFBdXZza0hzcXVwZHYxSlpBRjBOeGlM?=
 =?utf-8?B?a1FIR2xicnFmVUZ0eGhLUXFWK3ZRUXE3Q2ZaWVI3d0QxZzFCN3dYNzN3dkZ5?=
 =?utf-8?B?YnZPZVRoaDY2bWQ4Qjhod3pjOEUzREpBanlTVG9NUVgxcitIYUt4UTdJSEly?=
 =?utf-8?B?c08yaUxyNnRMOFBNa1RUVENVallvWXNSeDVOaVJwVmxReElYWVAya3JVWWlh?=
 =?utf-8?B?TkpGbk1TVGFTWmkwNzBudEhDZ04rV0c1SXVDaDZieERlWCs5NUhKdHdhTXIw?=
 =?utf-8?B?amlUeTVXQ2NrbjI1cUM3WjlJTjJNTHJWRXhvMTNTbXB0ckdFOFdvTWI1NmhB?=
 =?utf-8?B?c3VoeS9IUXBwUG05alRBVFhYWG1QSHlUUlpKWmJKNXBhaFRLaTJPMFBJUE5W?=
 =?utf-8?B?aG9xVy9iNXZqaHZscTdjWWJFbkNKQUt6MHhVN0l3d2xSVWFpUElzTmxhQVQz?=
 =?utf-8?B?THdvREd4WHlheHRYQWZxdXBCWW55cUVXVC8yYjYySzAzZ3IwSEhXN0RIbS96?=
 =?utf-8?B?Y21iZlJidGR4Q0hqWXNqT0ZvUzc4dHFCUmpQZnpTbGJRNXRaR3llMlJLOWlI?=
 =?utf-8?B?cURPQzJESkpiczVpUDlhcFJzZnZzVjB2em83SURBOW1HVGU2dXFsd0s1MWda?=
 =?utf-8?B?MFJjd3c2SkEvR1hBWmcyMkl6NlJ5d1FFclQwZjNReHJHM2pIdHp4djl4UmdN?=
 =?utf-8?B?dXNTNXNFNlRGeDJVWVJKaGxxT0lOR0UvRVh1enBrd0tnMU10RVRsanU1Q1Mz?=
 =?utf-8?B?bEhEaVIzQ0x1NDU5aGFwMitBUzhOdDd5bW1OSldVR3VFdTJwTGxacTY0UnJ4?=
 =?utf-8?B?RDc2enVkOHZ6d0tiZC9GK2lVQWlWNHJMTC9lQ2Z1YmlQZjhmcnZVOFJ3a2ht?=
 =?utf-8?B?VURyVVNyK0lwNWhnaTFmc0pPTlhqR2NweVFsdVV4RGdPS3QrT3B4OGZOSVQ0?=
 =?utf-8?B?dEc1SDZiSGszdEh5eFlOdkVQRTl6bThDYVIzT3NtLzEzR1pMTWluZ2NYZEpj?=
 =?utf-8?B?SFBlNERCcDlrNW4rOW14NjdLbG8xSHhqWEp0OVpTTHI5WGg5aER1bU5Pd1do?=
 =?utf-8?B?SXZ2N01XQU5MaFdzOGhJT3l4ZGUvb0RNMFc1ZllxTE9raEhtQXdNYVBIdk5H?=
 =?utf-8?B?RFpQTnRxRSt1dER0WkhUVitYT2ZSaldRMTVPRjhZTjZraUM3UEFpWnlzQ25v?=
 =?utf-8?B?cndjcTlxOTh3UVFqRUpBbGROZWxxeG45U1p2bndZUlR5NzhyUG9Vb0NHUnZV?=
 =?utf-8?B?YUhwSWFjeGlRN2hNa0IxdVg0VEJkSVFNaUp0OEpJeWdQdUxNOURNdDVyY3lx?=
 =?utf-8?B?d1UzSU9hU0l5cTNqRjdsVEtHMUI2bHc5QUlySmhKKy9GYlZ2Tm52NG9SdHow?=
 =?utf-8?B?VFU4QmxkRytKN0sxOE5mUk1VSkZmZ3ZOY0F2Qi9DOEdxdWEvWmdrMXEvbTIz?=
 =?utf-8?B?RXI3c25TeGtqeW5TS2V6WWpRSm9BLzBseTVVcUl6dk9OSWNOaGhNMWN0RkN2?=
 =?utf-8?B?a0pQK0s0eEdzd1JtR01IVzA5VU5VZmpuMzl0dlJKM1dpeGVkeTl4cDE0VDBO?=
 =?utf-8?B?WTBvR2hZOU1oM0JXdm9hUC9KS3g2R1pybUdJWW1FSFZNRjdDa1NMYnF4M0NR?=
 =?utf-8?B?TXpzVDFiVHNzMzZOWWRlVTRjRHR0ZzFXZVFwb3lMSkU3UG5hUWpqZzFWMXNh?=
 =?utf-8?B?V3U1S25iRi9tc0prWHR4bnlDUGpCd091eU0yU2MvV1hIUG9oVzYwSk5FSUFZ?=
 =?utf-8?B?RTFqL1A3VkhLZTFmUG1KWlB1WEw0MnkyMGwyMDNDTFpVa2owRm5xakZqYzQr?=
 =?utf-8?B?QmhtWkdZRnpRUDFLY3BFYmxYWi9ONnp4R2dlUUQ3ZkhQNU8zTXB6aEZ5WVZq?=
 =?utf-8?B?UVhSTzJaUnphOUR1Uno0Y1lNSDBSYmNjMVNZcTlYS0g4TW1pVmdlR0lZQ2Ew?=
 =?utf-8?Q?jE7N+trtA/u9HRxA0HujUSWszZt2nIdJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDVoay9PQkN0Wk1ZOFFyMHJkSERFNTJWUGl0YnZ0QjU5VEluOTIwTTBmOE5H?=
 =?utf-8?B?dUQyaGtQQjNKZjZlK04vWEFpWFJaVlIzZEVZUkljcnpseXlxV3VkMGpGNXIx?=
 =?utf-8?B?dEk4WVNTQVR3RTlCck9mV2ZKOHlYQUFpSlpIUlBzdFJyZk5mazRzbnR5NUFw?=
 =?utf-8?B?aGkrcDNzWkkrMkNYTjRXVEFtTHVBSlpMMmFZUDUvMURlcWhqaUZNVEF4R2lL?=
 =?utf-8?B?ZzVDd0tqakd6OHRXOWhhN2V6dW5xZERETUpzdVBGVjFpNU9zcUZQWlR2bmpI?=
 =?utf-8?B?UVRlRlJnSXFtRzZRZ1FQRmFrT0hGeGFJaEFNM2hEVDZ6cVQ0c0dJU3R1V2J1?=
 =?utf-8?B?UUhtVEhrZm5YcDc4S1RsUUlrbjlIdnVkYlVKNEFwUGJ1S25uTmZzYzNISnht?=
 =?utf-8?B?R1VhMWs0cXNZVDllL1ZkQWZEcHJwbUlKeFV2eTI1RmV4cStFWEdhTHpMMjBN?=
 =?utf-8?B?MlhIS1ptQnhjejlLQUxkb3NMYmxnWUtwRFhjTHRpckw3STlCcWFoeU9iN1Ba?=
 =?utf-8?B?am5oQnhjbzlyVGZVMDAyTUNZS1V1RUxsTEZzQ09YQlYwZDZRNWpZMmZwZVJh?=
 =?utf-8?B?SEpSQU9taVliVVFnbjhDKzVHdEVZM2plcHFVRllEdUhXaThBdUpEdDdiZXp4?=
 =?utf-8?B?TkoxTlhyL2VHT2QrVFhoUGtubStNWmhUa042WFA2NjRUYlh0U0Z0Q2N3Mk9H?=
 =?utf-8?B?Y3NPZC9KZXFaeHYxc0VjLzk1QUxlZ3d2Zjl5cEFtVXlmOTZmamZZMTZ6ZjNw?=
 =?utf-8?B?bXdZT0hLK0FvT01lbCsxbVF2Y0RHbnRMMmx3SGJPTnVvSHRYRVQxSVB1U2Rn?=
 =?utf-8?B?WkMreDlXRUlKQ3N0UWkyZWFrai9Qb1pXVXBTR2FIMjM4N1lObE5YTXBNbUx3?=
 =?utf-8?B?WEFJbkZ5WEE4N21yWGNKSyt5dGM4MWVScXFMOGdrS1Fna3ZhTVBaK25RYXVh?=
 =?utf-8?B?TTJaUERHZ3FhcFBhWjh4eCtLdEtsTmRZMDlxbzVxYzRiZTJBVkc2SHpPWk1I?=
 =?utf-8?B?SWNEdWhwSnFrazVzYnFtcEhZMGRXa1Z2QVlxZUQyanpaSkhWTUpBQW12ei9B?=
 =?utf-8?B?NUJoZkozWGNJQmtnV2lWN0tRQ2VhakJlVnhoZkxmZTNSN0VOVHplWEcybGlF?=
 =?utf-8?B?SEc4cld1cVQrSUUxVThrNFNyWTdvSDRwdXRndHRPaXh0aEt0ZmIzb25PellW?=
 =?utf-8?B?Y2h0L25CeldTQkd0UlcxQUlXSFdLYU5SaVRlNFBNdWc5V2NJdkxKa1JGZURr?=
 =?utf-8?B?dWp1Mk1uR2h3cm1mNTdwVzZLdVJ0TkNDaXIwM0VuQkV1TmRjWlJPV0UzdUdN?=
 =?utf-8?B?N1J4THdrMDVUems0K0ZQUkpJQjlzT1VkOHVzS05YQUg0Q0tNQTRKSk9Ra0NP?=
 =?utf-8?B?elk1MGhZemh4a1NJL3pSWnA2dEFNNFYxVnJaVzdnRkpVTWRPb1NmRnZrSUEw?=
 =?utf-8?B?MjlMSmNGQXJReHQxZTNwSDIzTFZud3g0WC9aMWZ5d2ZQby9md1ZXZFFWYzA4?=
 =?utf-8?B?dVJSbG9pbDlJVzk0QUp2ZlU3Wlh4SytVY1lwemlxL3ZCYUxySkpDak4zdFRT?=
 =?utf-8?B?VnJSM0x2QXU4WlhpZlhZNXk0eDkvblhZNHJhWXRIQjhxUW5nVjZJOTlTUURq?=
 =?utf-8?B?UWhqTGZYbkNsa1NsU0VvZTFVNDIzYUp3NVBPUW5wUWRkQ1BrU0NyTGlBdFBw?=
 =?utf-8?B?emRVRlZzbm9OaklSNndFeG5XZHNwdzBhZE1NbkFETXp5a2ozbkRLSTFBOTFs?=
 =?utf-8?B?eElSdWpDaTNRT2d1ajV1MFhaTXRYT1ljVTBUckErTXFJT1NQZmdvRG1HRWVE?=
 =?utf-8?B?b3VDeGhaNFVVUmJDOU5tcXdIWFRmK0RHRzRDeGJ5dmFqdjR6MlU2K09hUUlE?=
 =?utf-8?B?N1d3RU5NVjM3RE41U0J4TnFVMm42dlRsYjQwUW9laHpOSnN4UExYL29mQ3VR?=
 =?utf-8?B?Tks5c2NZV0pnbGEvSWNGOUtlaEdpYUVFMnA1WXZBMFpHQXJzbk85end6TXNQ?=
 =?utf-8?B?VWp1cGE5bW50bDFsOHFncThCa3JzSHhyb3dpVHdnbFQ2WlY5ZkZSZHJUYjdk?=
 =?utf-8?B?NUw3L3dFaktzOWQvT09BZTVPTFdWTlJvKzY2NFhDZGhPZlNldHR4WW5qendh?=
 =?utf-8?Q?WeIfPtBK8ZvBwpHJ5LtGzIUGx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8c5149-07b0-43ef-d69f-08dd38f9d91b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 02:26:29.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFjijZmvwVhi1s2TgjZhZsDqtFTIQ93LpK2y4iNJHZFqMWAPDzYasxz3GZSrgG4HHf6IggwWngQrxoE4xxjmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

From: Peng Fan <peng.fan@nxp.com>

The i.MX System Manager BBM protocol has the capability to support
more than one RTCs. Add scmi_imx_bbm_get_num_sources to replace
num_sources which was fixed to 1. Then the 2nd RTC event could be
configured.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index aa176c1a5eefe4220e54e366cf3a267de639fa9b..86fadfe8e3560b1cab5876a1029e38d91d938e2f 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -128,7 +128,7 @@ static int scmi_imx_bbm_notify(const struct scmi_protocol_handle *ph,
 			return ret;
 
 		rtc_notify = t->tx.buf;
-		rtc_notify->rtc_id = cpu_to_le32(0);
+		rtc_notify->rtc_id = cpu_to_le32(src_id);
 		rtc_notify->flags =
 			cpu_to_le32(enable ? SCMI_IMX_BBM_NOTIFY_RTC_FLAG : 0);
 	} else if (message_id == IMX_BBM_BUTTON_NOTIFY) {
@@ -156,6 +156,20 @@ static enum scmi_imx_bbm_protocol_cmd evt_2_cmd[] = {
 	IMX_BBM_BUTTON_NOTIFY
 };
 
+static int scmi_imx_bbm_get_num_sources(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+
+	if (!pi)
+		return -EINVAL;
+
+	/*
+	 * There is RTC and Button, but there is only one BBM button, and
+	 * at least one RTC, so use nr_rtc as sources number
+	 */
+	return pi->nr_rtc;
+}
+
 static int scmi_imx_bbm_set_notify_enabled(const struct scmi_protocol_handle *ph,
 					   u8 evt_id, u32 src_id, bool enable)
 {
@@ -220,6 +234,7 @@ static const struct scmi_event scmi_imx_bbm_events[] = {
 };
 
 static const struct scmi_event_ops scmi_imx_bbm_event_ops = {
+	.get_num_sources = scmi_imx_bbm_get_num_sources,
 	.set_notify_enabled = scmi_imx_bbm_set_notify_enabled,
 	.fill_custom_report = scmi_imx_bbm_fill_custom_report,
 };
@@ -229,7 +244,6 @@ static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
 	.ops = &scmi_imx_bbm_event_ops,
 	.evts = scmi_imx_bbm_events,
 	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
-	.num_sources = 1,
 };
 
 static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,

-- 
2.37.1


