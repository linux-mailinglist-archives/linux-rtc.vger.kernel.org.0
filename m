Return-Path: <linux-rtc+bounces-1552-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55A9348F6
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC341F23729
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7E682495;
	Thu, 18 Jul 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DG0hbsbj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC078C7F;
	Thu, 18 Jul 2024 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288025; cv=fail; b=oXroBv4QbPb4ccNrBxQ4cvLS/fnyAQ97/QuKF5jFjVoD8WHver2PAZkZpF2q7CdshgHMVJPQl+Cb2QwDnhgDd3Lzkvl6y9g4OCAw6BZdHZRjKAtiGkVOXC7YF2fbh/Z1XUIWt7ESv8jg+NqA+ph+g5MIvV8afg4rDyKhFnU0seo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288025; c=relaxed/simple;
	bh=QQUxD+WrZ1BoCEejLUiFnTZSyCOU5Rftc8RYqexva2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EaKvY+oXsW99A73HV1uZefB3ZMXJlGvfpjS14Hlr//5tbiM2hA9+tQk1ghI961RmqIxvHnTnCys4pxo8gkhTHeOJIKO67HqPc8cqrMywkbbFzs4Cpq9ttLOUNDeBywdT9orfz4XsVn3tRoca8PDGz4szY05xCcMdzmYEbZhDlxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DG0hbsbj; arc=fail smtp.client-ip=52.101.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiwiWVLkC7dwXmJ/adWmM0Y5GJmhq3HJCpc4nhkm1UGyM5fFMqpHN4nji+Sd4F3SBoQtULPKCJh7bvzDzPw2F2/T2rUQj8b6qX7rVmCFlQx7351+j8UyBeQUsGsUb++0vjR/VY15ED6zaUDFh5ryQ5JINC31CjZS1FKUuhWQ/ge/vZWbfYys/lc+hKRZhBTTcQZHQD8sZ8/kwnUFtdx1ZXjzujqB5fbIknOoz9HAQZFXNL6a5gYB+nrKURp31MuLQ04ynVM+5w1oGhL96oWB6P/qb27fWPaPTp5q3wPX7EHL3jzwtrdZZH/hiKkfx3yimVoRicD+EM31uzbAYqk9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WPWBl+UNIF8UJOX1QJA+qTKK8dUxDTksPWRgdZNkUI=;
 b=aS+BdSN3NqLADKNj1nlmWVrgegNOsTP8HGqb/PTXwg/GO59dYTLzUwAd8xLoaPRl1NjW189gQOOJjxZ6hxam3es5+zNcbCLL7c/X3+Ft6P0dU5VBjS3060onAcqDOHN5YzDoHomquQJpUq2sDU8lL3GWzKryw8cwLyoE3gLYTjQv35SssKg560PUhndHBnFabG1BNLx87ue1zWFV+OLgE2YsQNLiw2xZflYhLGg18Bcc64hBsRUqYqLNfxG/9JIDSbYImuLihOj8x+qj1XcMrwEozHMWqJHDOZKL4NBEnrcw1G6xwrRp2e9uk2gTImmoxN/get7y69F9AacY4vgb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WPWBl+UNIF8UJOX1QJA+qTKK8dUxDTksPWRgdZNkUI=;
 b=DG0hbsbjchVgWlJv49SQOCRhEUXWHckJP0bCt9HnA/5O5x6diZtfNybVxbb+0PM1m9bakVTxhYBgJU9MiyowvAdytMCEFj6WIYv58Tu16269pe+BTCNOGelFuiZratVEl2T6Mc+/9vY/3Fibj7CrQfNHB8NssvXlObyCEMYPUdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:59 +0800
Subject: [PATCH v6 7/7] input: keyboard: support i.MX95 BBM module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-7-18f008e16e9d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=8472;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=nWz3HeeWJlo8Xe0FnLKszmcU0B0giCY0FEpvD/2NDGs=;
 b=2LwFJyfPwkShGF6fAE7m8kv76JyQbnZ9LjRRuVpVoHPTCyrD0KHGdQZkeZAOVFX5GNRDkCMME
 lBejm0vpv6fCVbMqseqIXsLXc3bpnC04W22h2XXTZ35Fffiut2vminC
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
X-MS-Office365-Filtering-Correlation-Id: ffd4a4cf-0137-479a-73c1-08dca6fbf195
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0l2TFdIblEzMEs3OUxiL3JZMG1JVEdPa0dYckthREExU1NjZ2pwTGlybzNx?=
 =?utf-8?B?aGp6UFdNdVRvM3ZBQkQ4c0hmaHlLaHJaZVAwY1FNNUJodzRDRmoydFRxNXlo?=
 =?utf-8?B?cEdWdUNmb2xTcjh2ZzNtTHE2TGVhOFZtdnljeUVreGs5Y2MyWTc2QVA1L1E4?=
 =?utf-8?B?NDRqdU5LNEMwOTZTWEtqVVhyT0F2NExCdU1Wa1E0TFdueEVad2I0UUl2QlhU?=
 =?utf-8?B?L0xHNW5DdkNUTG1UeWU4eXREaHlGUmRpM0FvbEZ5YXFPQnZ6VWp2VUFhQWNO?=
 =?utf-8?B?RDNjZ3AvMWpUN3Rwb1BqR3Bja3JoYnA2dU4wQ2UrRGpxWmRkQkx2YTJJVjNO?=
 =?utf-8?B?OEhGdDZGTjMzVU5GRUNFMUh1cjlQanhRblRneUwycWVKYnNyZWREbUNUVWQz?=
 =?utf-8?B?aDVia0tGbUxCOTFacjRWWHdzNU1HVFN3cnZKSnB4MGRycVVFZit3ZVFxMkpF?=
 =?utf-8?B?YkNubHRHYTFzWWlXN3RsdWVtMzgzcXhnSDJ6SVc2c1FFY1ljbWlubEZVMC8r?=
 =?utf-8?B?eEhObGdEVEV6QTBmRmpBZU9tdzRZRkhQaktFVitsT1ZzY0FmeG9GK1ZGM1VE?=
 =?utf-8?B?QzR2OGxLd0lBS1JPSFZjSDNpY1BZUG9RdTZ6QVJXcUdvdUpSMGYrRlQrajEr?=
 =?utf-8?B?QW8yS3NRMzdzMFFQcmJoTlNJSVpCVi9ITERoUTh3MW85Y3Z1TGdrejFJaEQ0?=
 =?utf-8?B?ZmdnV1ZRWHlYRjk2aVJRMEVuYmN4V2NhNkQ5bEwzbjVlbzh0bkZLSkxFNjNV?=
 =?utf-8?B?N1RmV29BVnpNVFpLVzVwL2ljYUxyMGNRTk5pcEQ4TlVRN2cxZEZNakxRWmhW?=
 =?utf-8?B?Y0JYTnZheU1kRVhSdGY1Mno3NDR0OThJbEhTT09NY2pzdndZSStvZ3JIallE?=
 =?utf-8?B?cjFtVkYxZmc1K3UyVUlMbDg4VEFCbGppYTEwZFYzdVpiZmpCRklxdUlQTk1T?=
 =?utf-8?B?ekpnL0hRaDhRQkJVTnBIbXJwblZVUjhub3NtNllBZDcwUW1md1RseHV6NmlY?=
 =?utf-8?B?UmRWRGFHelBXOHBzbW5zYVIrMjhkZk54VzdzZ3pUcUsvVlprNzNFWFg2RlBr?=
 =?utf-8?B?SGtZdEFGRzNNbStiaHZ2b0pRaGNIQnRwT2g5Y2pzK3p6UzVBdnVzYmV0bVpR?=
 =?utf-8?B?ZFVoZUVkajZyOHMyRmUvNE14YmJZb3ZZbDl2Tmhwcm1Cc1lsYjVwdzBnWUdp?=
 =?utf-8?B?KzhhanB5TjlkODlsb3UvU1hQc25iZm1WYjI0TUtrNzBrTk5TNTNXVlN1aWNH?=
 =?utf-8?B?ZEJ5THI3alF6VjhSU3lFQjVFdi8yemNrWE9EbzNSSi9wRlFnM3dpMWxUdGZW?=
 =?utf-8?B?dGdaa2F5Zlk5Z29KMzNQODhyVEtpOEpuNG5ybUEwUkNneExIN0VKOHNYRjNH?=
 =?utf-8?B?S0IwTmxWKzZLK0pRRUE5aWFFTnlKZ2pqd0M4ajgveWFDaVkvSlM0V3g3dllr?=
 =?utf-8?B?MFNaZTVMRnVicTBKTnUvQURQaG1hVGhVaGhOdlF5SVF4Njl6NjBZS25FRUNs?=
 =?utf-8?B?L0JyMUlNbFdLR1hZOWh0c3lPNFJ4NlNXQ1NaWGE4c3RwY2tIODVsL002SDVM?=
 =?utf-8?B?aGxGWCtlaHBFM1JlaVY5S1dBT1Y2Tms3TFdiYWZHdjdjTmpFNVcrRzJCTnd5?=
 =?utf-8?B?aEltUzVuRS9icURxYnNJUEZRNjRNNUxiZ0xBdmJmSFFrSHZyMFRjWWRkbDRU?=
 =?utf-8?B?RmFtVFFCUjYvdGhWemRReUR2YkJ2M0libXQ5ZG9SR3ljMXJqdFkxWE5wSWph?=
 =?utf-8?B?YWNtcnRXdFh5RGNOUFRRaTBlamZ2UXNESnMzRFZhU0RrcGY2aXJRTm5kYXRh?=
 =?utf-8?B?VGZhaHlnRHhpQktSRFRCMmk1ektsUmg0REUwcmVsZ1ZXWHIwK25Vc3M2cGdJ?=
 =?utf-8?B?VzE4T0ZhYng5OXpFdkdyZC9rWStSOTZvTFoxZTRiZUdGUkpuRWYrUUtpblJV?=
 =?utf-8?Q?ZHViVFF3nLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjBaMUtHQm15dU1xMDlRTUpCOFE1Rm1lQzdMMTJqWDBKZ3VLeUZsVENYYnZ2?=
 =?utf-8?B?dWYvcldMS1IxdzZSTzlkeWRneC85MENHTk9RdzNtSGlQVmp1a2xjTUZ6ek9G?=
 =?utf-8?B?ZTZQSENXb3J0Tk1RbjBBS1JadVJSakwyaSszbm01WHBYdGZMdmFRVnF3bHFs?=
 =?utf-8?B?cWFacUsrZm01aDZnNGVHSG5XZzlvamVSOTl6ZW5BdXdpZzcyaVhOR2Jtc0hS?=
 =?utf-8?B?ZzZEUThscFlFb1MvVlNPcWtFdzg4c3ZOdk9Fajg3WkxWK3dvV1NUZzVuMTJa?=
 =?utf-8?B?cDgvZFc5azBveHk4d1hJS2xsYWdycDZ1NVdhR3N1em9FZ2NyM0k0cFUwc1hS?=
 =?utf-8?B?WEp2WjlkdjdkWFVPVTlsTnU5Qy9uUHlFYXlFcU9jWDFuSllxM09sTHNRSHFC?=
 =?utf-8?B?YTRCaEhzRzFHRTdPRWQrSnNOazNjbGFnRFcrTHBBVDNaU01sZkE4dEVJbnF5?=
 =?utf-8?B?NGdMTnNtdWhUZVA2ejNPVDRPTzdSZ29NeHMwMWlLUk04OS8yWHgvNHhTb1V0?=
 =?utf-8?B?UkNGLzhCR21PN0hHdlNNZ2NRV1piL1h0ZTErd01rZ0svUUx2UmdDK2I3UlYz?=
 =?utf-8?B?eWVwOXJYczViOWRMTHBIZnJPNE1NcWZDallUKyszY2xBYk9ud3ZQaWVNWnRr?=
 =?utf-8?B?RFBzdHV2a2k0b1JSWEZ6ZEhueDRKeTAvUjU0T0lFZXhOWEpoZ09uVmR3Tlh3?=
 =?utf-8?B?bkZ1UEhQRXdENXhpaDNzQWtOV0R4QVErVmtQWU5aQS82UUhBUGJ3dWhDM0Jy?=
 =?utf-8?B?RTE2SkptMzRBQXN0U1JCZmtjSEdBQ20yVVRjWSsvejZJKzJUYmtlY1hYVGF6?=
 =?utf-8?B?R29BZE1NcEpUNXR4WnVybzEzQ2ZGLzY0YUh1WVdZdC95N1p5TUZJYWY5Wmpr?=
 =?utf-8?B?b3ZLZkJmRVFsS2lPNG8vcEJmNDl2UEVrVFZvc3FmL0haS0pJamxUL1FNRHNU?=
 =?utf-8?B?ck5BamZDaEw2b2Q5L1AxRklBMGxCQ2xndkgyWFZ0ZGtNSC9Wek0rT0Era3Bv?=
 =?utf-8?B?NVhxN09Nbk1rOVdsdXplYzdyK09IWThIRFdIVzJqM25PWmxZWFo1dWtFbklG?=
 =?utf-8?B?dUovSkgwekRDTWJ5Vm5LYklPQTJuYXd5WnBEQjZ6SEQvU2d6NjA5RnprTHpZ?=
 =?utf-8?B?TWdxd0syWUR1VW5PT0hCUDBzYlVLdGdUNG1HT0h2ZFNDUTk3MU9Lc2swa3pt?=
 =?utf-8?B?VFROMjBMNi9ud1VoS2lsVVZZc0dTY043WTlNZzdSUnB4c0pQcUFvemlYRkVa?=
 =?utf-8?B?YisraFdoWVgzNU1waEVoakY3ZGc1V0t4V3pLYmxqSVphTHdRRkM5cWpiaWRP?=
 =?utf-8?B?c083Tk1qNSsybEJSdEJYSzJSZlR3bUUrYWtaK3NhdlN6QVVXbmRST0ZFM2Y0?=
 =?utf-8?B?YUN6a0dUbTVFSVhKTjI4NWphTWpJemRZM3RML2d2ODdyYUJHa0dFT3BDNHo0?=
 =?utf-8?B?ZzVYdWl0SmRXU2VWY2xEcGRtSmRlVHZ3d0ZlMHkySmlodk1Yd0duR1Bwc0lO?=
 =?utf-8?B?MXVpVUZwc0hkeXlSL3VnNnFGbHNPOUNqZE1KSldrUFlnQndXa3ZmTHVTcEha?=
 =?utf-8?B?NE9ad2E0aDdRTHErSWdnMWlidVFMVHZPY2ZrRkJpbkNxSWo1RUpFZ0pzNWFn?=
 =?utf-8?B?N3k0MU5VQmxhV3dXSFRRYWdFRnNFTVFXNGFsMjZGcmhGYS9GcEYwMWQyWDZV?=
 =?utf-8?B?WkluQW9GQ1lPU2JkMlN2dXk0bXFjMjlBOVVXRGVmWC9XTEI3NG9zT2Y0REVH?=
 =?utf-8?B?Rk16ZW1ReWZjM1puR2hwSzFMU3V6dkhyQUh2ZlZoWisrZ2pROVBuTS92MUky?=
 =?utf-8?B?QkxtUWZuN1ZWVjJQV0x1WDJ3eUZYUy9qblI5bm5IM29UNmZRaStjc2hoTHJH?=
 =?utf-8?B?R21VK1VuWDNQRm90eEF2REJ0QXFnUE41M1M3L3FxT25oOEtNSGpoeGt6TytV?=
 =?utf-8?B?TnlPM1NSRGZBWkdmNDBOYng0L0t5T2wxT3k3V1ZrZzM1MlpsOTNFejJ0MjNV?=
 =?utf-8?B?VzZidWxuMkVHaUVLZ01mZDRhYWZyNjM1MHRyWTFocGFrdVg5YmhzNGZMSmpq?=
 =?utf-8?B?VzlTZUJoN3NoTGtyWjA4bW1nRmRVdThZYU1aRm05ZU5tbVJ5Y3I1cmN0dDZC?=
 =?utf-8?Q?22Hugj3KM9vvxMSZMtJyVVDZl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd4a4cf-0137-479a-73c1-08dca6fbf195
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:40.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWdzkB4hZSegQuDweBotwSZqJK0aYUA2ADUHv7EJnR6FWIsGnqG8vj/foNvGryqVX8zHaEAtLYfV12j9LnIl9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides BUTTON feature. To i.MX95, this module
is managed by System Manager and exported using System Management
Control Interface(SCMI). Linux could use i.MX SCMI BBM Extension
protocol to use BUTTON feature.

This driver is to use SCMI interface to enable pwrkey.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/keyboard/Kconfig          |  11 ++
 drivers/input/keyboard/Makefile         |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c | 236 ++++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 72f9552cb571..a3301239b9a6 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -454,6 +454,17 @@ config KEYBOARD_IMX
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx_keypad.
 
+config KEYBOARD_IMX_BBM_SCMI
+	tristate "IMX BBM SCMI Key Driver"
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  This is the BBM key driver for NXP i.MX SoCs managed through
+	  SCMI protocol.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called scmi-imx-bbm-key.
+
 config KEYBOARD_IMX_SC_KEY
 	tristate "IMX SCU Key Driver"
 	depends on IMX_SCU
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index b8d12a0524e0..5915e52eac28 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
 obj-$(CONFIG_KEYBOARD_IQS62X)		+= iqs62x-keys.o
 obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
 obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
+obj-$(CONFIG_KEYBOARD_IMX_BBM_SCMI)	+= imx-sm-bbm-key.o
 obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
 obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
 obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
new file mode 100644
index 000000000000..ca430dbb61d0
--- /dev/null
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/input.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/suspend.h>
+
+#define DEBOUNCE_TIME		30
+#define REPEAT_INTERVAL		60
+
+struct scmi_imx_bbm {
+	struct scmi_protocol_handle *ph;
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct notifier_block nb;
+	int keycode;
+	int keystate;  /* 1:pressed */
+	bool suspended;
+	struct delayed_work check_work;
+	struct input_dev *input;
+};
+
+static void scmi_imx_bbm_pwrkey_check_for_events(struct work_struct *work)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(to_delayed_work(work),
+						  struct scmi_imx_bbm, check_work);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct input_dev *input = bbnsm->input;
+	u32 state = 0;
+	int ret;
+
+	ret = bbnsm->ops->button_get(ph, &state);
+	if (ret) {
+		pr_err("%s: %d\n", __func__, ret);
+		return;
+	}
+
+	pr_debug("%s: state: %d, keystate %d\n", __func__, state, bbnsm->keystate);
+
+	/* only report new event if status changed */
+	if (state ^ bbnsm->keystate) {
+		bbnsm->keystate = state;
+		input_event(input, EV_KEY, bbnsm->keycode, state);
+		input_sync(input);
+		pm_relax(bbnsm->input->dev.parent);
+		pr_debug("EV_KEY: %x\n", bbnsm->keycode);
+	}
+
+	/* repeat check if pressed long */
+	if (state)
+		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(REPEAT_INTERVAL));
+}
+
+static int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
+{
+	struct input_dev *input = bbnsm->input;
+
+	pm_wakeup_event(input->dev.parent, 0);
+
+	/*
+	 * Directly report key event after resume to make no key press
+	 * event is missed.
+	 */
+	if (READ_ONCE(bbnsm->suspended)) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+		WRITE_ONCE(bbnsm->suspended, false);
+	}
+
+	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
+
+	return 0;
+}
+
+static void scmi_imx_bbm_pwrkey_act(void *pdata)
+{
+	struct scmi_imx_bbm *bbnsm = pdata;
+
+	cancel_delayed_work_sync(&bbnsm->check_work);
+}
+
+static int scmi_imx_bbm_key_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_button) {
+		pr_debug("BBM Button Power key pressed\n");
+		scmi_imx_bbm_pwrkey_event(bbnsm);
+	} else {
+		/* Should never reach here */
+		pr_err("Unexpected BBM event: %s\n", __func__);
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_pwrkey_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct input_dev *input;
+	int ret;
+
+	if (device_property_read_u32(dev, "linux,code", &bbnsm->keycode)) {
+		bbnsm->keycode = KEY_POWER;
+		dev_warn(dev, "key code is not specified, using default KEY_POWER\n");
+	}
+
+	INIT_DELAYED_WORK(&bbnsm->check_work, scmi_imx_bbm_pwrkey_check_for_events);
+
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_err(dev, "failed to allocate the input device for SCMI IMX BBM\n");
+		return -ENOMEM;
+	}
+
+	input->name = dev_name(dev);
+	input->phys = "bbnsm-pwrkey/input0";
+	input->id.bustype = BUS_HOST;
+
+	input_set_capability(input, EV_KEY, bbnsm->keycode);
+
+	ret = devm_add_action_or_reset(dev, scmi_imx_bbm_pwrkey_act, bbnsm);
+	if (ret) {
+		dev_err(dev, "failed to register remove action\n");
+		return ret;
+	}
+
+	bbnsm->input = input;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_key_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_BUTTON,
+							       NULL, &bbnsm->nb);
+
+	if (ret)
+		dev_err(dev, "Failed to register BBM Button Events %d:", ret);
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(dev, "failed to register input device\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
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
+	ret = scmi_imx_bbm_pwrkey_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static void scmi_imx_bbm_key_remove(struct scmi_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+
+	device_init_wakeup(dev, false);
+
+	cancel_delayed_work_sync(&bbnsm->check_work);
+}
+
+static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+
+	WRITE_ONCE(bbnsm->suspended, true);
+
+	return 0;
+}
+
+static int __maybe_unused scmi_imx_bbm_key_resume(struct device *dev)
+{
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
+			 scmi_imx_bbm_key_resume);
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_key_driver = {
+	.driver = {
+		.pm = &scmi_imx_bbm_pm_key_ops,
+	},
+	.name = "scmi-imx-bbm-key",
+	.probe = scmi_imx_bbm_key_probe,
+	.remove = scmi_imx_bbm_key_remove,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_key_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM Key driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


