Return-Path: <linux-rtc+bounces-1379-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F8911C50
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D65BBB24A15
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F254716D4D7;
	Fri, 21 Jun 2024 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e1C1w/sA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0716C436;
	Fri, 21 Jun 2024 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952991; cv=fail; b=iZg9UZnXXXJv7gYMiufwIkqgEiblxy0C8CVO7GZ0ZC28ofkEC2RmQbayAY+3JV+D/BAIA7p0C70xwPAZqCsrbvt29I1oJbeweCNsENjB+31VNKWB/oPHNeS0a14dm1hOpZgAn68xosRPifTPWFjo/aJGHSbt5Ht3TtSmpijrxsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952991; c=relaxed/simple;
	bh=BQjEWFs3tn1kJ3gHqry+33Y19uPuh+IDbf4sSa4/dBE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lwI5/nOhBG3BRjc8nPmaWRAuw383KV8IOBiT0/MhRfAGsYxR3ZJ+6V05nwx8tq9Ehs7r5e9QUMgRmLMrK7UTPuNAcjxdHFdCC4QFlESgNCKHE7k5UEa+BKCzlTUVP3RJzglNXVt02Lc2gKhMS6qVSj3PiTpVlpEqFZhK7+/mWus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e1C1w/sA; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU0/0mE/X+O4K5UjG1TcSkT5OUab5vVdoPOn3BlVWk9g/kPhXLx8dl5LsOqnRM2mG2OjsDWKvXWLethoWjc19u5igx32QDMculzwlfuGc8oArswDLdN9IcIM6TILFt2VDTWWIHOI4VaXdEnoN1p1Yy48slVb7qOuuiuYtE3PE7nYDqbMJdWALGnDXvd5qdSATBP3QNTFhECc4upGSsfF9v5pbgsIbgT9AXdDu5Ky/MateZQR0TyYlKQAqm+tfDjwhFJHP8TSFBBANzYvQ2vIJIuvFJHJVZAOGfbg6ZYzI6tYo2kKMuTZ5zpmFgN0UWBWhbmjvKSc/kW/1+vahp7wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0ggd5wKMv4U80GyDOSu2OoINrWdvdDCP012GJn8Wwo=;
 b=Y4F7JYzIlkNCS547gfRhNWOuWH5j9fnaIj7nNMFvGpshPO6+l/i/xT1ZQlMugO1DogCg7AJ2vy0ANvE9ev2wkc0WB26mn/CwRRI4GBwq9qD5ymkG8v+fPP/NyMHDSJEhkKl70bU3S5kyrDgrCZ25X3GX3EIFnhjML8HVa5ck2XAkay9ObNbflKt/HPfh7IR+oWng6rsZNuv1aE4TV1uJmcm7lbuZN0VIvGMhD008Wq6vvPXUp4c73Gi/udi8mVoawIb+H4/xQ98KOuWpA8Ai9r4MAV6Vb+zkreW+DoUknNDqFEwGigTbTzwSO8dtBsmBke0VMW+FzBMLX5yhcW1yWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0ggd5wKMv4U80GyDOSu2OoINrWdvdDCP012GJn8Wwo=;
 b=e1C1w/sAWUm7Ru2rMJ3VfPnkm/TC+thyHFIOqCYlHdbM/oPyjLdXxL6t8zxMQtAtLhM9aqHG0bhi0aakk0wdWMajxAQ9E+POMXKJNjyizW7YaQfPpWwzIR1idPpv+H+XZkWvQ4MUaQ004EoNT0riHQLxSiGHklkbcfZPchz0Vv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:56:26 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:56:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:42 +0800
Subject: [PATCH v5 7/7] input: keyboard: support i.MX95 BBM module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-7-b85a6bf778cb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=8179;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ChfkEJX/72hXEL9g1a8O55kYUMOihK4KW1T6yM6QP7s=;
 b=478Kz2I4jFt9FPxkAK98lmXfjQPwSEDRoU4ChGwdkT9MAJDo+jB1gg6nuORaR7bm8I4KVBzUT
 JqOZH3l/a+MBl6n63yUIcLj2DjBKNKzwAa0dT3pjhv+bJ+NRxUa3F+5
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
X-MS-Office365-Filtering-Correlation-Id: d4a72654-60e5-466f-3f9f-08dc91bf448f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUZ1WXpBOGRGT0dubW9OUzROSVJSOStLRnMvQ3A0SGFxWnlodXEzWE5LYUc4?=
 =?utf-8?B?S1ZVWWVkanFhejF2d2JkMXdWRGVaYWN5b2pHdjBESGFzNzVHY09mU3BtRXpm?=
 =?utf-8?B?bzBTYmk5N1FKdUhoNjVITWkzK2hwd1BiUmkzY2RXS0UzWE5ZZmNUcW1paWRF?=
 =?utf-8?B?OWZkbUxBWERPNXR0VkhueHZNbFBVVWlrYmdiNk5iMTFIb25mc2tKZCtuWkNp?=
 =?utf-8?B?aGM2cnE5MCtha2tOblNTSTFxWW5MR09Qc0dxRFlZNWtiVmFRVHMyRXJ4aW9V?=
 =?utf-8?B?UlZxbVVxSUVWNHFGSVBKRzl4Zkk2aXk2eTRkZ3RrVDVGNWtZcVNkeStwcHE5?=
 =?utf-8?B?M3EvRDNKZml0d0doMG1NVUd6dXJqNFFQb3RDcnhQK1lZMThTaU9TcmtwYzla?=
 =?utf-8?B?a3QrRWxlUE45SEg4Tk9yMkplQ1VwWm1hckRWdWE5ZkJZRjhBMURFMjg0aE1k?=
 =?utf-8?B?cll0ZDRWQkI4L0NvaXB5QVl2bWxPd3gyM0lETytOREtmcDZFUzNZbWNSVUxU?=
 =?utf-8?B?anJxdUpTM1Q4SXJyTzc2R0NKV2ZrZFQyMnFOcUtrbDYrM0grd3RzYjFMOUNJ?=
 =?utf-8?B?eHE3aE1uWVBxcHJxOHpWZW4xekxjZGVuejJGMDVZb1Q2ZFFnUGNScy9WajV6?=
 =?utf-8?B?QlBySGpuTGh6bXJpbEJHY3lpM1pITDZPSHIySGZaZ0Y0eURjQjdVc0xiTGpR?=
 =?utf-8?B?MmpQT0M1cG96MTI0R05VQ0JYcklXc2pSeGdscU5lL3RHRTZPdHM3Y0ZIR2Nz?=
 =?utf-8?B?V2JWdzdWb290ejlId0V0RmlHRUpUaFh5eFhXWVM0ZDB4ODN1YnlnVW5aZFhK?=
 =?utf-8?B?M2tWckE1QnBsUnpraDlRbVRiNitEMlg1RUFQaSswbDhJMFN1QkVpeFVjclJV?=
 =?utf-8?B?OENnai9oRlFJc001R0kzWHhWbTI3Zi9uUFZ2aUFjSDlGM0twZW1kOFArRWtK?=
 =?utf-8?B?akVhcHlQVmRvVEdXaUpIWGpJTkh1MHluYVFPVDROaGpEbW9uaG80c3I1R1pO?=
 =?utf-8?B?YkhQWEkzTEE3WkYzbkJFdjFzMldCWDhqc1AvU24yWXRacFN2dlhGWnF0MlIv?=
 =?utf-8?B?VUFvMWRTenpyMDlWWEt2M09aa0tnRHkyeDREVS9vT1ArQVppclkxNE5JTUhF?=
 =?utf-8?B?TGFDSHp3VnNWQW5va3NvOVIvQ3g3Mi9jdXF1U2w1NGgza3VYSmhHY1dudk1u?=
 =?utf-8?B?WVk3K3QwcS9iYWV5ZnBocmdGakNkNFR3TmJMNUF3aEM5MVJxNGxWaFo4a0JB?=
 =?utf-8?B?ZkQwa3ExcnRwV3paMEVNWkVwY3Vzd2t1ejI3TTk5RkdoZHhsc3hOZnZjaUZY?=
 =?utf-8?B?QThYVXdXbWo3dkZUVGVNaXhCZ0pWU1gyU3NCZTY2TWV6RXZjSStVdmZOQ2lM?=
 =?utf-8?B?KzZOZmdKcGlVelpFNHYrWTIvRGR6UnV3YmxCdUhLaEhqbGdvdWdyaHYyN1FQ?=
 =?utf-8?B?RjAxY052WERxaWdXV2UwMmZ1UzBDUy8zSkttOExKQVNmSFFCY1FEL2dJWFFO?=
 =?utf-8?B?dXJhRDZZenNDTk1CS21vMmsvWjhWa0FrY2YxRXlhSlcxbkhlTDd1ZEhEUDBF?=
 =?utf-8?B?NVZYaW5taXpyQ2g5WXdqUmFoMkhVNlFwcEJQanV6NTRna2d6cU1RNkw2VVNB?=
 =?utf-8?B?eTJTN3lHczZ1MW5DUGErZ29oSkRuK2w5eEEzT0EwdktOZnMrSjFkK2duOTFv?=
 =?utf-8?B?K2ZOVWlocVE0UGlHNFpGa1ZKNWx6U2dmWStsaXBzcGdHMzNZMmF6L21yNHVv?=
 =?utf-8?B?UjhnaHVlL3U1VXFiWWxLK1owU3VSem5zWTlUZDUxdTZJaE5EVm1CM0NhQ1Vw?=
 =?utf-8?B?c1U3MWg1TENIYXFRb210cE05WUJMSVlueWlFbVQxZXdRblV2OXdkSkpmbTNS?=
 =?utf-8?Q?SXC9Ucfurwpn1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0MyYXJ2N29QUERSdWs1UStJQlNQOTA0ZjRhUkxyTWcxTTBZUFBES1RXY2R4?=
 =?utf-8?B?UTRsSXpWbHhkdGtDMWZZWG1wMDdpVjZnN0dUYTQzUTIyNU9ZYU5VbE12K2w0?=
 =?utf-8?B?ZDN5UnlnWnRQdDFzNllCT1pRanVpTzQ2UDJhREMybExuZ25WTWFra3RyMjRF?=
 =?utf-8?B?Z3BsMDFsYUd3ODhBT0V2eFhudG5BMXVSVkhvQitHa3YxNEIxL01vc2R4MEZp?=
 =?utf-8?B?SnJBMkxycDl2a0dPbkdjV1FRT1d2aUNlWC96VVpldW9oMjNwaE9qOGR0VDRx?=
 =?utf-8?B?OFpQZ3FtbUVGYlQ0c1FHYmZMSDM5M3lNbnJlQjJqZmtwS1NNSFpnRXJkVHBQ?=
 =?utf-8?B?Qi9zTTBWUHBkRXd3WmNucFU0RHptUm9iVkl2NW1GWitvTEN4Njlxb0RyRkdr?=
 =?utf-8?B?MkpPa0wwR0dnVzJSbEFhNlBVTlZxR1NYTy9Rb2VTWEpNejFtMHFrVzZJT0Ex?=
 =?utf-8?B?amRZaVJhSG9nNkE1eWdrZC9LQms2WEhKYXl2NWlhNDVDNXF6ZXp1YkQ0ajVL?=
 =?utf-8?B?WGJralhCaXN6ODZLT0tObjZNdG1Wc2ZQTEtlM2hsRDc1ZXlzc202eXJCOWlB?=
 =?utf-8?B?T2RPN1E1WG5GL1FsT3BDVG83dDU4VWtoeStDdzV1ZmVrNTU5QzZ5YUdRNHh0?=
 =?utf-8?B?dStiTm1oZmpIK3pXelpYUHFMSE5KMFQ5WVR5ZElEN3BqMDdXZi9rc20zQkJW?=
 =?utf-8?B?cHErc2hWUHlDdlFIKzVoS24ydWE0ekxsaHI5dncxUEhtemYvbFoxeTYrWUR6?=
 =?utf-8?B?cEFUYW5YM3d3VElNOUZoeHZEQXZSVTlCS05XMEFLRFV6TXpZRWsvbUxvai9m?=
 =?utf-8?B?Njl0dmNDWjk1ZlYyaG95d1gxSEhyNEZNQmxneEFXZkJNTXJDUmxObVlBaWRa?=
 =?utf-8?B?QkpUNXQxTzRQS3VWbFN6djBSU2MrUjJxQUFqTWZZZkM2ZDhGSmM3NFlpYkty?=
 =?utf-8?B?anlsYmoxU3lqSDFuaENQK0JqU0RGVUoxeTVLK3dYS2doeXlua3VjR20vVExD?=
 =?utf-8?B?RUtMRDZkVVdCUXY1bFU3aXNzeklyZzhmeWZEb2tTdkJkYjJSMndmTkxicFNF?=
 =?utf-8?B?dGJYYzZNMnFSM2RUclEzeW5wdXdoUkRmWFAzbjRBOXNwNG1pQjZMQzVodlZO?=
 =?utf-8?B?bTQwR1pUMlQ4VG1iOGdDN0RCUzg0VlI3UElidVZ4S011Ujl5Tjd4ZVdHYkh5?=
 =?utf-8?B?M001bkpZRE54RTlrS2paZG51WDh6aEkrNjZMMFo1MGhqdWRqYmZndE5pMzVS?=
 =?utf-8?B?ZUFTZDFzR3oxZ0J5SmplZGE3TVdOamEwaWJ2NXdVY0FYTVQ1NXdQVndWYjE1?=
 =?utf-8?B?bnFFWGpmUVpKZUZVVmRyaHZmU05zNFlnK2o5d241YXBYdDd3bkpVM2tTTWs2?=
 =?utf-8?B?RXUyL0lsVzZRT1p6cVlIYUFXRlVMZFRsVzBZZGxsYmFhZnZ6bjJyWVVZYnM3?=
 =?utf-8?B?SGRyYkJHSnFVWjBpQ0dOUERHL0ZSeVVLUlNOMHJYYitZTlE4cCtpV0RoL0lS?=
 =?utf-8?B?YUZNdExTTlA2N1BzRkNzdEFFZHpOUDV1cFdKVXhVMVNaekpRTTdGNXdXbzVh?=
 =?utf-8?B?cWV1WmsvcjZrNE43T1RuMngxR2xhZDhyNGhJTVI5dEQ0bExOSzJFTDkrZTg0?=
 =?utf-8?B?YWJ1bDd4dlVDeE54Nk9Wbjk3ZnNrdFBPL0pFTzhjZGlxaFBicEtFc1ZNUVEx?=
 =?utf-8?B?d28yQnNLTTBPdmVCclFEUzZOU0lFeEpZYW52VFBMQ09lNmM5R1FESzFVTnJu?=
 =?utf-8?B?MGZ2MklRK21udFF5SVhVK3JLT1VPcGltZjlYdjdmSTVSVXQzemtsb2x1OUFZ?=
 =?utf-8?B?R2FtMUNjYlFULzBYazBwVHlwQWc3WnpiRGxBZ2x2bStjY1lmOEsveVQ1WnRk?=
 =?utf-8?B?NmFJS0JVajJkUFc1L2ZjbWhWbGdVdEZTSWNndlhoT1pmQk9FcGRQczZLVHpZ?=
 =?utf-8?B?TzFVQjNIbDY0ZlJEWjF2Y3UrYzJocmFvY0MvbmFCdTVoK1hqWEdkYi9PendD?=
 =?utf-8?B?c1h6a0pvdHVJY1lnZTM1bksxQXlVQTZOenlodVlNTldBTjJ2WTBMQnhvN1di?=
 =?utf-8?B?c3VqdWtERUcvL0FJdXQ2R2pNb0lRYlkwRnJKVm4ranF3VitTUEtnVWJ3MFMy?=
 =?utf-8?Q?Ztox0FzBeEDD48CEhJMEkk7PY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a72654-60e5-466f-3f9f-08dc91bf448f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:56:25.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmTeL7EWNsEbLfOuXKP+NFRvyoE5Stss07R2Nnwa9hzyawP3qzhdO7EGgjkCNJd6jsKUxVnvuNg7LInI1tyxcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

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
 drivers/input/keyboard/imx-sm-bbm-key.c | 225 ++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 1d0c5f4c0f99..1c3fef7d34af 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -466,6 +466,17 @@ config KEYBOARD_IMX
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
index aecef00c5d09..624c90adde89 100644
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
index 000000000000..907dad383b8f
--- /dev/null
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -0,0 +1,225 @@
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
+	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
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
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_key_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM Key driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


