Return-Path: <linux-rtc+bounces-6219-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAC1CXUauGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6219-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:57:57 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493229BDF3
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BD331C2CB2
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA542F3C22;
	Mon, 16 Mar 2026 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v7wdoW2F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBD2EA48F;
	Mon, 16 Mar 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672520; cv=fail; b=NhzE4BAZqfjPkESmvm9OurVfejCe52Cjb0dAsugwXhNN5d+FB9say2RtWHRkS/iIbhJJZ5vM9K6rwJGHHi0V1tKX/uauy8N/7lkvYWfAHOin8TuapORD/wUoeLQmQ2zGnY7YfOyWMn6Ow9E29GiMsE0/r9kJDfdSirJ5Fx1LFUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672520; c=relaxed/simple;
	bh=zn1aI5ryXKde7EVrud68zkSmefqdhSPiP0vpZh8kXFQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DJy5tZPrnAwoA1Bdj5Xytgdm2lDvvdfAHESm/sHXJG+3DMkvl/RHSEeuwqTwjLW27WJKYca0bDLls7HkdWVMzXXx930dBLJZV8LmvSG4NkA6Swn65+5eZc/dts86sNflRo7Vy09rGt2i7EvYps6dIX6EVyjpznL1eXalYwOi3jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v7wdoW2F; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlA3/32FXcyUs21Dxj5t7zxy0ErHhNvn1dsZO2XzoVaH4XQ9FIBao3ByyUxI0EUTzOe2l5hw2/oBYTea6xbLJNqlxfWzwTLjAj6Ss08CzktanVAJ8VVLyw8wnRQWTklcGIAim5UZSZQPYtdnHPXP38NbBpFAmx0JF5zPyEUIDRyHjxkXgTZ6JBmCAP3sF6g93CiDoYBqoIHJbzrrkU+oIO1wlgz+b4o7B0NZ7NAdn0a4BTujw7W+4LEQ9yYBNcZJZPm8QH23Zq6fIXfpBKIZp5WgMbBjq32fQqkXqHb88ESzmsRzn391Aka9z76iIhndBeWD12hz3v8zQ1EcJNcd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03/TAUPxN6RGne7Tz+vGoLEWnlLqBuXEbqlMtCftEdA=;
 b=LxcMvOJLitu8jlKjDIxpD1WH13wlLCOI3ih9HSTuhfbjJ13ZAnabbgoG96dP/mq1RoC72iMlSjW9SO9kvp+PJQp6l52buJs0xwfv8CeuvTx5qCTg0mD8UwgTktewxM5a4MyXbj0M+Wyok7GM24S7Q2ZtmOBAysHh111hIJsOFByyBEDYugyiRPmO1xYfhZGlfkmcorlFjkDBaLR/QlKhbwh2DKnDxn3Inh7UMyxrURRQLHyO9pWz1f0g6zpv36yLGAT2HDlgwsOSDuI2NZ9Uq3/kitqZ4IG8HAbwzHAWuDU8ig6yObx/DFTe116Kqy8wEvx2kiyjzKmnr49NhEB8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03/TAUPxN6RGne7Tz+vGoLEWnlLqBuXEbqlMtCftEdA=;
 b=v7wdoW2FazsHP5HCQxWR94q8EmzxWbQmBKNGnW6d2r+UOkiy2Z6jNmYnJkKdXJrFvpQKwB25H+E6Akmx7eOjG5avsOkfEPrDqM84BAsma3/Xii3a0GVszJBLFKwfP7dt8eiy/BPq2Po5WO75KXbATEjcS0hL8dom1WDBfqnfJA32aAfT7ND7kaE2MncYer9gsfigFq7WbJFtu2VxDgGN3q+q4Arm9M03o1I8ZQIaP2KBsB1uACPFWSKHJXVZCOswAKPrfZWBZmxKRdUEpeCFYhMxLCNMdV5KtAoACEoJ1/YQijJOlwVg53fZrsm4eKr+YLAOmFH4sPUsQ4aQdy6LBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:48:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:48:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:49 +0800
Subject: [PATCH 14/15] dt-bindings: mfd: fsl,mc13xxx: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-14-92c80e5e1744@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da41710-8c78-4910-4888-08de836b18c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GJHWVuBQNXpTG4Q7UJr3K8bRU6rpowhmtFLyMz7nr2VGBGlq8eZB+x0osCcRGuPs7oGi0UxWLP8emriTBN9hkvrc0wTOoAd68P4+6/ELLkKxDNJzNm4FsuMnVCqJnr2or2ExMEd6Q2xSw70Hr4mEaxDMYVeWmjfRzeovoGNFHEnaIgI8UfUb9Ap62wmOFF4AP98BACITgknWbZJLnDLMgoxaTjOisFQfff8f2hJosBSatTV2m78ZihQBf9es0z7oYT/S3dklT1LDfUC8s6E//6pJb9Bl45r84DmTQcFVp3fwXZFkjY/lCIHJtzy8EcIz3Xn6VMocwaVicAvDxmnoOdqfEl+pwUQr0nvud1jxhnAiFg9u3J9a5RyFUqzrMCijA3fJWo9ikQ3JVzpbSmwvIzOJrUFP5046XAJTMSKQp/GdpU4gB374GyPkwLaHd70Adnzw6/cxTHf5vF1DG1clMw3DOgpibhfqgOky46eouVs70GlTFBsuVcXlGWJE3YDhRj62mutOAeVP7tq406pIZrLfJ9Jt+htPMvvtS8LCsFNUxkvieNEWd7M2R1rZQ1NYGLIWIMxsvedkTJqZ3uitN56JVBf885w1PuwYVIveqja3jXx+gxehchF+dZzsW1j2kWUD3xQpCc5pBNvrx5u4xcgbHGp/HR6KkSDv3mP9gSx+VD/Fi0hQ7UpdP1qJGPKZIklZpeC/pgZto/hapPSsgk83CCCDB09CbtYFkaxFmIh6R7+KgTLYEYNYNX6VtDzqzGWj2U3MAd5hN/u2K/YDQ/RDef6hXJJt2+Sr0VGlU+VasODK+0RGlAot6lNgLpqg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0dIakJxd2ZaSEtpTWx4TnFSZW1JQ3dpVTNIekVCeC9pUkp4MVU5bjY3K0Fz?=
 =?utf-8?B?SWh6dy9UK3Zrd0o0c2xNUExwOXJ6cFRRVEV1cmhrd3QxNlgrV3RKcEJVenNu?=
 =?utf-8?B?U2p3RDRBMko4SUlNdlZWa284Q2ZsOUhzMHl1MDZYQXk1ajlCYW5CNk12UEow?=
 =?utf-8?B?eWhGQ2dSTlloMzdGeGxCQkFNR21YTVd1OUx6My9KN2czMjNLVXhESm15Mkox?=
 =?utf-8?B?OEEzd3AvS3BRSW9ZbUJ4WG9mb2xWdnJwUkZnSFJrYVhQL1BvNmZNT0xSSXpN?=
 =?utf-8?B?YUlpeXh2OHl0Wm1CajJwc0FWZitPaThNcyt6dFpmcC94ZTJyM1c1cDZIanZo?=
 =?utf-8?B?dVFFNDVJUnViT1YwMXRnMVJvcUh5ZEVtQW1HbWYyaGM1RTU5ZFM1NmZCUWF6?=
 =?utf-8?B?ZDBLSEZuRnowR1I2Vi8yakpsYVNMZEFjZ2VVT1dQVktUTUp0N1h6L3lUTzZx?=
 =?utf-8?B?NUk4cHVhY2l1dVp3L2VxQnNnNHVCVGcvUDVGVHQxek5JTFZhTGxqaWk5T3Bz?=
 =?utf-8?B?dzVxSm9KUmhZNjBnSDJBdmRpcncvSzJTTkNZazA1ZzI5R29qcjg2ZVJycnRS?=
 =?utf-8?B?RVI5bWJFOXBNNHJRTkFVaVJQRnZoek5ObUlMTDBPT3FmS3duSURuNE43R2Uz?=
 =?utf-8?B?Wmd6SXdTQVhpOXpPdDZNN0JLRmdTYVVyekVEN0NxbktuMmhWNXRSczQxVklO?=
 =?utf-8?B?dVh5TndTZ1V5djlSQXZ4Y01tWGQwbzVkNzdIU1IrUXNVcWlOejNRQjc1cG82?=
 =?utf-8?B?RDM1SHIxdTBLQVRxZlNHMFlTMytyaE5qSVIwZENOeDcvaTJFVjlYN3pxVTNl?=
 =?utf-8?B?STQyMC9jT0gxMTg5OEx0YWp4cDZKdzhkOWtuc0hDNFU4bW9ZZDMwbkFock9q?=
 =?utf-8?B?Vm52YzZ2WmJDZS9DRU9RU01ZcTYzSFpMNXRyRnVKK05VRTYxN2RxeUdPMzZv?=
 =?utf-8?B?NnRDeFYzRDVheXA0SmxObllqdWdNcU90OENLVXdESU40ZFBSTDMrWmUyazBH?=
 =?utf-8?B?U3hiZ1lpaUV5NXUrQzRoRkRpR3Y0Ti9PM284ckR0YUV4RkYvdHRJL0hTcG00?=
 =?utf-8?B?QXkxU0RxL2JoSFJqZm5vZm1pTVhGUjFMOFJhTXFjNlZJaWdmQVNla2JEcGlz?=
 =?utf-8?B?NHZ5akR0Q0hMaEtBWWMvdWdKR1NUZFNsYXdKbndnVzI1WnRYcmVSV010Q256?=
 =?utf-8?B?ZEZGSmpDN3Y3aTUxVUk2NGVyOVlHMmpiZGRudmh0aTRnN0NpeU9QczlsVTdD?=
 =?utf-8?B?NU5LbmgyNWRaZ0x3ZkV0d0xKcFBnVm9RcS9EWkdWOHJqbFFORERjQzlUOVln?=
 =?utf-8?B?MXhuNmNPb2VlUkZzOEZTazYzRDFpc0plcDcvRFQ5anVhVlpFNEdYeXRRVElV?=
 =?utf-8?B?QTlOUlduS01NYnMzalVicHQwSFpkZ09qM3BLeUdXdmQ4VFNpcTJUODBOUFhw?=
 =?utf-8?B?d2lIQ1dVSlVKOHdmU0JxaXl6Ym9jeGdUbWM5K2c2VjFyL0Y2bjNjTHQ2N1F5?=
 =?utf-8?B?OUhIYnYxWEY1VWJKSUJLa3AvSkRaZ2NoUDkwRjFJdmR3aVA3cHpBcDZzZWJY?=
 =?utf-8?B?b3V1TXhiNzRuWEttaW5TOXgwOXdEcVdOZ0pVVVV3RkxnWkVzN2pscWRveFJx?=
 =?utf-8?B?SEhybGpxaTBIbllpNmZCSGM4V2ZrUFljMHJ3YitOQ1pRQVpIRXRLOTNmWlZV?=
 =?utf-8?B?QkJhc1ZKOWx1YkVtcE1PelpYUHJWWjJoSzhIaWFBQjBpOTZwVzZQbVh2K3Ro?=
 =?utf-8?B?a2trbFZYcVVDUzh0Y3FRcnM1QUltYm9RVW9FaGw1VlJtYnVKb3h1MDQzaERh?=
 =?utf-8?B?VnJuYXpQMGkwUHlORUh0NUdPQVp1QytHSEwvcnp0UFhIMnFqWnd1K2FVTU1V?=
 =?utf-8?B?Q0FUVXhUekZKK280MDk0OGF2WDVaWEUrWm42ZGp1RFplL29CRGdBRXI5Q1FD?=
 =?utf-8?B?bGJ3Q1d5SFBXSzNLUXBtc3E1KzlCUWo5TlFJd3ZmVkV6Z0V5TTdDT040YlZR?=
 =?utf-8?B?dnIwM0xUMkFucDNVZ0pnRTA1QndEVXBJaGM4bGxieWNqcXNaTzQ0ajRuaHQz?=
 =?utf-8?B?NXZkMUdBZzNTNzZNdXhhYTRJYkpwdE5oeWRrU2tJREVsc1U3VVFLWSttakx2?=
 =?utf-8?B?amE1WEJ0ZVhlY0xIWGg2QWE0aXNyM0lycld0ME1MRldIQlIyeFV6TlF0QUFN?=
 =?utf-8?B?VG5zanEvUENlajltQldJbWswTnV0VHZmNG9jS3pQYkdSdUdFK3JVVUZoMlpv?=
 =?utf-8?B?MlNGa3Y1UytvdmI5YUYzTEdUN0IybEFjaVc5QlZtdXJHbzJIOTQrS1lIeDNv?=
 =?utf-8?B?VEErak1kV3hIbEtubGlYZ09YbXZodmdtekVJNllPQkFFNURhTFpkQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da41710-8c78-4910-4888-08de836b18c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:48:33.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhooW3WzdegogyQI93c5F3ZWW2Q9AZsmtteU/YtF4U3UK2YRXvx7UJloqIGSJoyLEE3FRAAyla3jKFPQ4cNDzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6219-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 8493229BDF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
index cfa69f1f380adb21937d60da7c28b7ca246d28e1..c43dde9e6c339a540f1503886cee58b2cb287104 100644
--- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -34,8 +34,6 @@ properties:
 
   spi-cs-high: true
 
-  system-power-controller: true
-
   interrupts:
     maxItems: 1
 
@@ -176,6 +174,7 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -235,7 +234,7 @@ allOf:
               minItems: 1
               maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.37.1


