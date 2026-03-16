Return-Path: <linux-rtc+bounces-6216-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEHjNqUYuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6216-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8063A29BB14
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AA8A3037065
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D895A2FFDCC;
	Mon, 16 Mar 2026 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Acsic3Kx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923D2F8BC3;
	Mon, 16 Mar 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672489; cv=fail; b=kPou0DHWmYKSSYBx3WZoNRjb0GmjM9txWeiQxA3iJUganNtwquVZFSE8uwviY9+ywO+Wk7kxhorZAOnirmGW/YMpi0s1lUFMFcjDFFZ0Zx+/9u24low1l3+/RfEOWVi23AbxyG1jcLYC4XkSrkXxw7AeJtPwOl76jf2plnX7CSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672489; c=relaxed/simple;
	bh=CP1YUftHVfW60d6GvmJiRHCDQfrbCLlMckwQGUXNxOI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jS9JedZzErrzo/t1/6BpgFPTJAxU/okDpPEecZ0Ze7XpRSEPZoAXTu1RIQCG+JnI5j5yyOgk8KKSHNmj6OzhDOCjNII125RyJZJ6XzzLMk7cDe9DvvRRRSeVVIBBv62/9JeNO2ixeBIhYIeInItmr/qvracEWzEDFxKtqLaOCzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Acsic3Kx; arc=fail smtp.client-ip=52.101.72.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkN1otYJf2SZo/cABci850y+4RcYtNcmpmj1siNVrGKVsoLm5VMJnezI7K6mQED+TyEDAg3dow3RsWO1vMlOXo4Z0nwtKjPEwAShdDygDzdw6AyPYVL4hzrpQAFteOfEE0US398CdmSJSkMc0XwfMkoKJuOX8h5ybve2iIuZKHAldSHv3B4r71VKKgmlOarJt1+hJ0MjsNqBuIcsM2UBtHD0jEjiH8+5wehgKZdEokj2otHUt2KG2EBdAZXxdlBHpj4NEjs0Snj95tCEbkJuTrZoCv2a39y3oPYBqybrSdWfSHWvaauwIYWfhD4kS59WJZtJ5ZXqysnIEFxuTZe+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB9yWa7NHYwvI5LWVgCNjPLfn2NOCkbtvXHS+EZSk6A=;
 b=grluf7KGJddR0arAY8xHNS0i7f2LLVhfz2TQnghQGSPaFrDMtXtpY7xouP2xteilrrL0KPjgedXhpzpm3AQIruFcntO+AYszCSQHtgphe4Wp3EAR+bSfrxi2TGmfnHtsTgbu6uZMISOGNB7UIlhVA0MreJ2ypOFr2oCJMLfXbrU+oUYGSyQ+bAQwnr7xS9ntuCjtkl4N+8MuTcSWQCvha/+/zVSNofeFNKmlWwoPxkOd0AVqBYdgJSCODa4+MwV0pr9Y8VlRTiBtpV+d3BCZL5yHubmPGvHgyvw+wgshdS10fKEpvNE1kxxP0XMtQVhFFyeg2qW8NTo5H2DfmF6QAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB9yWa7NHYwvI5LWVgCNjPLfn2NOCkbtvXHS+EZSk6A=;
 b=Acsic3Kxxk2mWTAlDabBzkb/EO7NSxTC3GNEHErjoUGgDyvTCbZDgUu/na3gP5LMbyh6AaMC7PTicOADKdQXs/DmdshyPDWpm8j6iHTyrzWtCsWqFTcB8inGrXsdvreWVSpph+/GCXuxyPZjXfteXFsye6VB4zJEk3QjdGU53lEMwcVCewK9Ucs6Tbz+qpRcyWtMW7aAIIuI2POPrCq1AItvIlB9dmdOZVSSk7/cmyb2ncfinl6BC4BCb29GhEQcrNHKvMic97VDHl4dskg0gpLie1+d3uZGMz15GCsEehE/ZxFfzsO72vRkRhii42vgmt7Zykz/mQXo0d+u3xbD0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:48:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:46 +0800
Subject: [PATCH 11/15] dt-bindings: mfd: ti,twl: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-11-92c80e5e1744@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: f178d59a-6404-45d2-572d-08de836b068c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	8G4HeVR5KysMKRp0zST9VqedhcKJS/vNQ83SypCTstMaFgWEQfPcsJv/FZrM64KYtyPZzyNhleTT81b2JBWsltbW1K4BGzaHa2+M8QNzSh4gJOO99uGYvOjwPFoYe+k5w1e7jLfQafzkv2PkZbzjBI2ZMZTqdXzFgLoCD6JU3JwR9X1A28nB0yeIujAaE/DGTBWdVIrExLncFm5t79gjYMpKrvWe5O70u2PoZVt7qy2O/BNc/DeUC71kFC92jkSmQO2FKIgckfhFoHOjTkShBC6FLgupxWiHWYV7C14MYfVOInIEJ3T7EOtsAgCseRJJHYQroXGHcIkpfZemaOonawzVZT3MC9R+U5e/piK0HXFM2fSZHhAGS5wB4L7jDWUUnt2YFNGubzoTmhjqrJweia9rjKdT6boYtEkdeU6t6rhNuQwERqDS3UJok9e5yW22Mz21Nt6lWa7Kie24AjGHWxrFSNfOeJ4iVbmUZa0A1UHfvdjJi+XZquRxeFR0mmKK0db54QnXKitD6Jwe6oEZAcO52xzx72QiMZ6UuVBItFWy8ftdt86MkG/ZbDM7/KeftckYftBA4YsLcaRA26Sal4OopFSwmVxkOgAREerazp4d7vwkY8pcRVDWm2/RE/8Xe10lcXKprVsAxN2CUnjHEWSRxauXtui01RTUhcvqv2t6Dew86Ms+6Xum88jukithhoreTMrJO6zd71oShJKhWpfw6Wy9EKgA9tqoMMM/yy5GO7RIXNMyaJMcqLB6Nub7KPMAmHklJ8sjPkUYZxvwxvS9YO9lYoPQjNakNZ6e0ibCY/puxs2pKgzAM3sF5SeF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpITTU0UVFPZUdXS3Mrb21tRDYxSDl6b0lGV3JvMFZRdDJyVjNyNlhvcXM1?=
 =?utf-8?B?ZHJYak9PSHZXRGwxTC9yYi9yamROMk5IM1BjRjR6cFE0bW9SaXhyWTFKOFQ4?=
 =?utf-8?B?MWpNQ3BYcXM0K3JJK0M3REZRNXViVm9jWnJBd3dBZklGdTg4d3lwMmxCRThG?=
 =?utf-8?B?RUFONXYrbTIxVnB0WktIWktDZDNjSVYwMFN5RGRxOWdyZU54UVdoZHMwWGlv?=
 =?utf-8?B?dEhWRjVDVGFFYlk3VTJ1dmNOOEMyNU1EaHpMT1BHQ2hBSGxRTGtMKzg1Nnh2?=
 =?utf-8?B?M3padG4zNU9oZFRRdDJYYW9JMmZnWCttY0JFdGlzcUpMVnVhUWJ0cXp2a042?=
 =?utf-8?B?TElRSDlLQTROQXpNNjZUVjVUR2NwQkt2Qk0vOXRzMFBKUkdNbGZJNEl2bEpw?=
 =?utf-8?B?VHZGSlFHSVZtYmwvdDFFdnNzZHEzZ1IwNXdsNGg3TU0xVDFZSk9VWVV2UUpt?=
 =?utf-8?B?dDVBb1h0c1NUMVM1Mlo4bU13TG9GT2Y4dFZKVWFDU2tUeS9Vd3NKTXdkVkNw?=
 =?utf-8?B?dHhqY1ZWMkxXcWRrMVBUUURuWUFnT0VLR2pOQ2VVQU9WREN2VzZCSCtVak5L?=
 =?utf-8?B?NEtzMCtycGN4ekk3WUxjZzRLVUEvYm9lTDJyK2FmZnhLN3JwdEJLMTZnVXhB?=
 =?utf-8?B?ZGl2c09WQlAreGRwdVpNTVdzVnFRQlp5S0UzYTBHdE04ODcxSEJKN1A1VWdq?=
 =?utf-8?B?cTBBZEN6eDhPZDdmR01XQ000L1hFQnhtcFRjd0t6SHUvNWFOSnk2QXBVWVJC?=
 =?utf-8?B?ampjamZoQjZjOU9MUk8wVlFYSDFCeEdSazd5Vk5kR2l6bFlreXBiRjZtVWZs?=
 =?utf-8?B?WUVIRDZaWFQ5NlEweFRQTUJmcUpRMXZUMmdPUVlJeUFUWG9uMjY3RnhjN3l1?=
 =?utf-8?B?MElEM2s2N2psWXZ1VlZzdW9Od3RKWnBGdTBuT1kvUHF2Y3o3WUFhQXUxbXFt?=
 =?utf-8?B?VndSSENLSlNGTGF5VFp0SHFzTkNlV2pqS21XR09hWkd6cXZhV2k2ZHpmQ01W?=
 =?utf-8?B?eWdwNWlIWkxxWnYyYzF0MGxlblRSWTYrTmNrcGxPWEdXZTVXUXc4L3pLaTc0?=
 =?utf-8?B?S2pYNlgveWdsQ2N5TXFuenNTenhBTHltNnJjWS9yallzU2tvZXFrTDdma20y?=
 =?utf-8?B?WXUyd25lMExqczFtWHdmNldDakJOR0o4VWl6d2FhcDJjczhrOU0zaGhkZExs?=
 =?utf-8?B?WTFMN0MzK3pWbVlHY2JmL2psWmZ1U1hUM1BRRUhMWk9Md1VlTTNxSjVrK1Jv?=
 =?utf-8?B?eSt5SlpRTThvRzFBdGVQNUlnenc5eDNIYk5CdG42dm5aLzdYR3N1RkhZZHpQ?=
 =?utf-8?B?MGdMYWplQ0dndm96UGQ0K29IV1JZYVVuK3VuVWpwUm1CNXZURTZ4L0s3VXhL?=
 =?utf-8?B?QmZ0dkxaczR3VE5NZyszOUEvQXBjZFdTNXNLZmptcGFqTDg5b3VtMTRuSzR5?=
 =?utf-8?B?YU0wRkhYQmRCSzh5YzBQSEFwOGRKVi9MYVFNS2FUS216UENRSGk3Ri9ON0dv?=
 =?utf-8?B?ejYwSDZja1hHTHA2OHFkdkpWYWJUTk5VZEIrd1dJajR2T1lCUnpPRzBZaHFq?=
 =?utf-8?B?a3YvbjRIS1NQWHd5ZndFMTh0YzFIdzg4OVJHUS94WTY3Q2ZLbGJjc2drVnFa?=
 =?utf-8?B?dFMvMElTemFENXppbjB0aUdyU284U1pTQWZiNjJQaXhLdGd4U0FHYThPYnhH?=
 =?utf-8?B?MWFoOTNMYkFUNmsrQmxiMFJKS2IydGpCN3JJckpIQVF1RWlPREJnQnYwckR3?=
 =?utf-8?B?Lys4VVZiS0NUcUR4cW5rWW9CQUkyK203VlpyK0xLZHJ0QjNoc0V2bkNpUHo5?=
 =?utf-8?B?VjhqTEZXRzE0WkVPL2Q5TjBabHdWcEpZV2dMOGtpS3NKRWpJdHAwWWQvOTds?=
 =?utf-8?B?MEp1UURwajdHVFRZVFd6NFQ4ZndVZDdKaXRZVzFLczZtQmM3Q2l0clB0ekVC?=
 =?utf-8?B?bEFvOGdyQlNBZy90MllKcDN5UkpVbU5mdS9lM3RwMGwzSmtramdWeGVKU3Zk?=
 =?utf-8?B?dk0zUlU5RENsN0syMUo0QmZEZ1NEV1V3MmROZkViMDJ6MFhvaVZNMHJ4S3d6?=
 =?utf-8?B?alJveWVNb0VyYU5wcWNYbWd1VG9vT2xIQUJiMEphRFlwQk9mbjJHRWNGek1J?=
 =?utf-8?B?SzhibXFQWWtvSWx0TUp4cVBtK2wyUEpwSlczMnVtemt6OWY5SFFITjBYTkJu?=
 =?utf-8?B?M1hKY0E2c1BZMStJeHZqUXZMby9MbjU0Nkl2ajM1UXdUbUFSVDliVXo5ME9J?=
 =?utf-8?B?Rlo5dDJQWi9vQXlsQyt1eTl0YVZGQmVZQXI0RHIvZlczKy9tS1dYNlNrdFUw?=
 =?utf-8?B?ckVQME9TS3dFTTE2TEovUVNnZ2lGVXF4bXl2RTZCckZ4Mm1ac0hyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f178d59a-6404-45d2-572d-08de836b068c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:48:02.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u9fc67jIgP6sNdNvK+NczkzkUn4m5iD+I4sRh/pwGkCahqTxO9yOpmOZ9p/qND94gd7kAL2f93GA/gXfYcfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6216-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 8063A29BB14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 9cc3e4721612e9e9f9b2c950d35871c4d0154e24..4b6b68aaee766be15b5cfe5a32aacfbf0aad5044 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -16,6 +16,7 @@ description: |
   These chips are connected to an I2C bus.
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -205,8 +206,6 @@ properties:
 
   interrupt-controller: true
 
-  system-power-controller: true
-
   "#interrupt-cells":
     const: 1
 

-- 
2.37.1


