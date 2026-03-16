Return-Path: <linux-rtc+bounces-6207-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r64OO+0XuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6207-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:47:09 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BD29BA3A
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F3D930236AA
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0365D2EBB86;
	Mon, 16 Mar 2026 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XBqWxMLl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443F2EAB6F;
	Mon, 16 Mar 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672399; cv=fail; b=b4nn1SHRqow6o66UEvRpmXmrwwZeKyypN0SNI6CunVT0g0XmoSJsgyhBlOi1YGE0Ay4pQk3LbIhCHq+lVeyzGeYZLvyjq7r+y4Ps1K0P3Sdmj99C3ym5tVeBwp5qf96+lB7kyRhNurGKM688ejC3TWr+T6IaU9Yl00wg7jrEJaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672399; c=relaxed/simple;
	bh=fyOISH/KWaC7Yk/0D5RCkU3coxqaqWfhDoHjsbFmEws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d0ZWeBpJ+1I2TJE4pQVhe+8vZAQKgI+dbcqV39tiUe0KgElrfMR4Z4asjkmDwFlx0UBdpn5WMB0MyoFuFxY4/AlM17SUf6bQUN51qjxmZBrmbkoccoIc9YFerM03phBKtKUY2VysI7KQ7lFQs71PjVYLdxlEyNQM82bJkcNh+Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XBqWxMLl; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoK6ygo1IJTpccV32xuB53/layUwXoXP5Thoe8JAxVt8c9DdtkGOEKm+J7xO/2J4bAqIz7n9syUZofbbJX7o3T+gJcACAF+LYfisfbS3KR95caV50voSpoj9pxdjs4B4Jal6JCI+uMoeSbZ8IgAtk4sS4JvYuSUt2yuuhQiMWre1TrlMXK2nBUTyNA32/DArHdzYFd7wNuVwHru2M+phg3/i0DwcbJYLRfoGGWPBZAZ9XBt81S1EkL/GVii4qeF6Pq4lhIjfHBVyYLZKMAsLS6uRvOSg1q8h5BKr4asVnErQgrlRr78CvgbnT53yRvfu0D3uhLGtlU5QVLhEOZAsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ph5BRgsqToBZftmHsykBwW6Hn9XG4greOOHrns/c7k=;
 b=Ez9e7UxpNQ3+dGG6SNgBxb9lbLxDAhsR0Twb64Xqnog+mSTv++SnthJ/X3aGl1cgcjPXtsJlT6bf3ME1eOgkvP6iIumCIAz81CP9DXMcyEMoruUv1pl9tq4HXo7rJNY/92vpKwAktru9i8DoruOpUN9WtDQzijfCfY8/sA6ttHGyNPRU6t3IPa65OA6IENcv7dV7acOF9pp0g5MX5uVZl82Aa+k3u+jSb5sbPKDbEbvhBkU5buaQtawU/roOXh5a9RMr5tdlI2f5qg5qrN4SmCbfK8ZuZfoJs6c/rTZFcQNk6siJZaECaINPLtOhNwmsvxEOfPUCpMLPVnXXJASloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ph5BRgsqToBZftmHsykBwW6Hn9XG4greOOHrns/c7k=;
 b=XBqWxMLlOhykTjECYKicBGRLFI8YlMs5FWda8MlGjRK4daieWWVYsIg/oDSDA3lqxjATZlqhg+83IuCWkgFIxFVKs8/B66DPiMPaSL2GtnILKaI/JKCi4EcpbmuWiizJfDAQmeMV1hc/A2pwHjLK6Ie3ysmK4p8anRMwDz3WGVoAQastTEoA3bkaoYmmUCL8gv7U68rIgfE4vIXozG4DJG2px18CbFwS/PK+RSsqoiehhR8AHyOEHS8pJW4zC6hAk7lwHvhiUidQ7mnFcZ57ee3T/XutuqR0cmgQ90KZbpevjUPMd8aX3iUW4F7ksDy+yU3dR06hTBhKZP92gw9YNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:46:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:37 +0800
Subject: [PATCH 02/15] dt-bindings: soc: bcm2835-pm: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-2-92c80e5e1744@nxp.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
In-Reply-To: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Jerome Neanne <jerome.neanne@baylibre.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Osipenko <digetx@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
 Zhang Qing <zhangqing@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 361a4414-23b3-4a6a-98d8-08de836ad271
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	SGQsRQoQYy8sNWpQSrkOMNaZMXQHo2o9DatIR2bUSvf58FxiD58yK3Yt15PmFL4ZSOG8u66x3XmeMnN0BEobdsJVZUbbS1rhEJqm7ADySd9raon7a37PP1GmVLI8d4BxPfYXWG8zit0V24mCHuGJ37s+Y0UO6DNpKyxLO/w+v20fxZhu96vUzoRby/TwVz0MmDE2gd5gl+VMgCww1h4yLu+aDgzBR7lUDv7BvEvJ/DkD9Q98jwt7oSu2Qt5GHJlnKCwF8pBQl0FcUssczYPlCoHy4eV+hd/JsQBU9WFgMI5K7nEdqOUBCr2v4SlIYBsRXndE4ASHCa3m2t6vlral3uNJvnzxXLsGlRhxp1m8cEcBhDNfF+XHrRMkM9UvRCntvP2uGLP2dSXuAxf0iX8jxY3v01HLpGYiRIWpSKwvFzySVaY30mAEBAIMtXExK9TWAc33MitvvvxwS/n+wPAPaE72/hTjErHIK0dTNHSgOUTMcvvVDNk2bP1rOknRzQDKELl3NamjrLFEGwTD41i8pUaHJsVfPZfwHv3VrZ36lt2Y016MhA0Sf2bhLveAEJoRl2pK694DzV1zYQPR1d/IJdQmh7xs7fUhRqANjRT86E+0iLkpe5YVjvYb09K9b/vD5GhUJBSXAWpDPJMZGBwak1cd6bts+iTNa8vy4e3E5Ag7LXnMZLfuZVDlmmbh8HAK23DxBVaErCcFJgqZfUEUmEksgnIjlohfYRR/x3NvExk4sfgwla8KVoXvXtydx+u5y6ZOrk9kvL6Mq+ldZxJSpzLIQkQk1wbuGbVzA/r97EmVOg4FrqKf8yzRh630UROI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdvMUJjdk9SZVpkOVYycDhsMTRWNDUvNUtGcE52bm50blNGNTljb0I1YUtS?=
 =?utf-8?B?T0dscFpwVTFHdm1aZGdBNzVRWkZCL1JFSHZtMUJ4TjltTVpTZFVqcEE2dTVB?=
 =?utf-8?B?S21vQm4yc0wyN1JZam5FZjkrL0VPdEFiWG9HTHhRUTZXcUtNNFJrOW1PUXBr?=
 =?utf-8?B?WWxGY1pBSmtCdjNNOVlraEszQXZiU2lvRlYxWjRMcGJnYytJbjlNeWg4bWE1?=
 =?utf-8?B?d1BvVStNeFdXS2ppdUxEcENuVnJwR0wzY2ZiSWVESEJhSUJ4N2E4M0E5cklR?=
 =?utf-8?B?TEVDQUxQRmtiU2Y2Z1RLbG1MaHhDQ2R3QVlIaXlOY0tjcmdKUysvZVJsS1dV?=
 =?utf-8?B?RXNXR2FHN2l6NXlGNUJlenhiaHIza1EwNkRTYU8yRFUySDdFS3B6aUpwKy81?=
 =?utf-8?B?dVVsMVh4M2pvV3NlZXpoT3FyTnFqMGNDWERWTCtnSTVMU3RLOTJOVDNHUTBZ?=
 =?utf-8?B?ZXZjVnVISGtIYUlvTzRxeGE1QTNlb1ZVQjF3ZTVwZElyNGFOajRzeHVscUNo?=
 =?utf-8?B?eElvM21ieUM4L0hyaVNoRDVlb3hJQ3kvZFJlNzlKeCt0dGdDbEhNVDl3M1BC?=
 =?utf-8?B?bTRCQ0FRTEJQcjl5UXVIbmxFbWU0SUtOR05rWjRiQ3huZW5qRXR1MUdBcVFi?=
 =?utf-8?B?UVQ2V2VhS2ZuM0MzUmJIMEUrTWZSRGtlTll1Rmt0SFdkT2lDMU1IeW9YMlJW?=
 =?utf-8?B?bFcxS3k1UzFlSnp1RWhOYklDSnNZRU1ILzI1bTIwY0hFMkxqb0huTWIxWjZX?=
 =?utf-8?B?TzRITFQ0Y3ZtZEZ6ZE9TTUJDWTJxZUJldnRBekxQT1NZOXRVUFUreTN6bXZP?=
 =?utf-8?B?NDB3a0RZSEV4N0NMaVBHOUxUaXYwdzAvNlZ4T1JaSE9RS0JoQlp4WmNpemdY?=
 =?utf-8?B?cW9zcEZNTGdyTnZONUo3V2taVTJRS0Jub2oxelB5djl0ZWZGbW44MDRrVFJt?=
 =?utf-8?B?TFhYZU02UkJLUTZ3ZmVUK296SWRzdlRWcWF3YnpSMyt0R2NHcCtLbkdsdXI2?=
 =?utf-8?B?MER6NUYzN0Q5cEw3TkVLd3dpQXphdk1QZGs5ZTRDZGRvbzdObmorS2dVUnRy?=
 =?utf-8?B?Yy92ZzdMREpzZTBBeWRTZEJGbmVFbU1CcDdDWU1oWGZOeDNpZW52RmdDK2k5?=
 =?utf-8?B?amJuVENhT2crY05wQ25STHdCc05lMlFPUkszVUlHT295dGFEdVl2WjZxK1dt?=
 =?utf-8?B?WDNNWk9ITkV2VDVjcUhmTm51bXFsRE0zc1pYd3lsK1krWW9RcTgyUGRYczFM?=
 =?utf-8?B?WnlSNlNoUXdDUnUyTnFWem5ia1dzczhoOUxOSzJmejRhY0luaXBHYytGbHpm?=
 =?utf-8?B?U1l0bkR2aGlXem52Tit4LzRxc3NFRGxEUnRiMk1LaUpWUk9BcDZKQXBSbHdy?=
 =?utf-8?B?THVseGNwYlJqOExETmI1VWJNbnAvMVNRaDNvM3NHRUczdGtSdzhDd3BrWHNM?=
 =?utf-8?B?ZXRRdW11bk1nLy9NOFRwMFVxWnU5WkFIREQ2azlSOE5zK0IvelRtQXZIWkFp?=
 =?utf-8?B?VXQ0dHJPOGJxdXZKTUxMK1VzaFM5S1ljZVgzc0toY1Q0U092Q3AyODlkeS9G?=
 =?utf-8?B?ZWcvdHpMSk1rVHpCcWVPQndRRG95dzAvYmJpUlJhVGZUZHlUWjNSK1NvV1ZZ?=
 =?utf-8?B?WWJzNDRNZlJ5eC9jL1NsL1orTTZ5VjJjYTJmS1dxd1EvcGpLdnNjVzdJcmx3?=
 =?utf-8?B?VUEyZ0dPb3Jnd2dodEQyY09CSVA1MTRmSGJFQ2tCeFhsM3RseDJMcDNsMW84?=
 =?utf-8?B?QjM5STExdjV5ZUR1c2RNMXY3RHUyQ1RGNnBNSVh5K2dxVXkyeGNJUEZkWmVR?=
 =?utf-8?B?cVlpUkhhckE0TzB3cFVGbHZ6UUNYSjdxKzhyTG0wSDhhMlVGTWVLZXNINjBK?=
 =?utf-8?B?QzZISVRkTGFyaFRFTkNNTUt5d2hnVTBRRy9kcTRaU1FBb2JLcXFoVVRvdFMx?=
 =?utf-8?B?bmtWcDNCZkVZU1NiWXJQTUJ4enVzWU5KdE5SMnlyMnorNzl0RXJiYzAzelBy?=
 =?utf-8?B?UmV0ZUgvbjlFaTJ2NWhadDZ2MkVZREN6V0tlTGsrblZ3aGpwTmVhRVNOa0RJ?=
 =?utf-8?B?WWo5UjUxZjhZNFIrYW0wdkpZNHF0WGV5aU5aWHBFb3MzOVAxYUsyMXdkNjNH?=
 =?utf-8?B?KzAzdGJZbmdUTWp6bHpvdGdyVTBaa1EvZFhRbXlJcTZOdzArK09yZ2V5bGps?=
 =?utf-8?B?cFA3amJ2bGsvS1hRc3VpY2lIbkxUOHplVDVPNmFqZWxGYTAyUitGOXB1VFZp?=
 =?utf-8?B?L0pjbHFWZ1VOeTVxZjFWZVRRbkwzMS8wMUxLRG45VldGVlNEbUo4ZkMxS09v?=
 =?utf-8?B?dUlNOC8rb0Y3MkJ3SEZ1cnZpOStldW5pSlI5ZXZnbEhhVW9MVnE3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361a4414-23b3-4a6a-98d8-08de836ad271
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:46:35.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUn5y3wO5Jh0gamF9vGT+m0/7pKeiQxXIaeygBhdPEzCieBDbhvkhv1IR82MhTKf9iWU71DxnAzkggDw6uaBog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6207-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,crapouillou.net,bootlin.com,sntech.de,rock-chips.com,collabora.com,kemnade.info,gmx.net,v3.sk,blala.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: AE7BD29BA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema and drop the
local definition. Also replace `additionalProperties` with
`unevaluatedProperties`.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
index 039c8e4a4c51b3fc05a75d75509145419ceabd95..3420e1f1f6c4efcc5c91425f2486fccc4b00acf1 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
@@ -50,9 +50,6 @@ properties:
       - const: h264
       - const: isp
 
-  system-power-controller:
-    type: boolean
-
   timeout-sec: true
 
 required:
@@ -62,6 +59,7 @@ required:
   - "#reset-cells"
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - $ref: /schemas/watchdog/watchdog.yaml#
 
   - if:
@@ -90,7 +88,7 @@ allOf:
         reg-names:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


