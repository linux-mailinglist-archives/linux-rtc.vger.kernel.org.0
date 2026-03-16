Return-Path: <linux-rtc+bounces-6212-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALIKKp4ZuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6212-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:54:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B729BC6F
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A5C30B914A
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A802ECD34;
	Mon, 16 Mar 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DSMgUdT9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF32EA16A;
	Mon, 16 Mar 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672449; cv=fail; b=ImweJq0jWwPMF5f4tk/hjRhO88XUxfGzgcUO4Gytfr+eAdpvs+8jGUhicELR4EKIRlMRaCi9gfWL0GgErg3sLyhDC/tj2klMjy7k1+eyJ8GyvjSUkTPNRODbfFBvQ2X/x/ubfivF5VINEUk8juqEAq9y4w29kFbdMAzQNc7dxzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672449; c=relaxed/simple;
	bh=m8RsxTDmCEpCvttVCSEZFqNdESLixlrye2HI+K9i31E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MYji0Jrh7KjltnlpJbnC65yxXEn06bFqbeeHTX9bTPY8GAtXR2NUAPWbM7Civ+7IhQNZcFeRpMUTIR926O6Y2YRTQc85m/0BQU2tuYPNt2BmYR68w6sJCDJeAbr8FEcO3p1s0td1/bmurbVpQvF8utG4wXjylyld/ZS84ps6/p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DSMgUdT9; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPgjxEdXuGS4EuZiafwvQVJ0psbDor81polB04vNaZc5T6k9qEF/sSV0MVWe2WKGjL1bq1a5hpGYld4gCdDsg9QaJkroNCuBVSX+YEqidW1IfTR7/9V77+FNwa4MQ176rbxbmG5sUmvmtd1x9AdbVLvhpI7lER8TDefSJ+i7Qd/offEvq7J2+hBJ79GE6f0806YCjQL0VXF1rIqzi44gdReVt3gO4xiRSoX0HtZcuhrJbVqipAuw9banvpv8tmCXOnzZaeOVbk6fhAy/otRyaoD8YPk0HvtRM32MyfbjwKc4S9PzFkr+ZxyzlKI8wHJzwwxdW5yJU/nAavqky01JTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWgqE5BhAHoTHpQuvz6cptliA2SJ2SmW3u8skMAZps8=;
 b=XObR0R0/kMJHKsj18jYfbKaKO4Z4zGlXYv0C5//qXjA8Vz24UbcZ03TAeWtJ0Z+dbHKmLIaNGIPnINCS1AtOWs9XKWS6KtB89Hw8PhEhl3z3rMjmFRBx5UF1SgGuXp1glSUb/MBqOeeMKum3UB0CfwR5yUW87ZwJ18sqCcvKM1O8UDm+JZQelqtvSM0OJTUnodA98YYzeYiG9I1u0ztCOzyeUkGP4otEgyCOIE8IvNxCeRH6G0nwvV6jWJZ7y7yjjsqcYxqEJFgbqQ/cSlUHPX2qvon9nd6Lem/R7i0rN9jgk6Lo5/rQQp4tdlJ8Ra5AtpC3VAOhKib5JOQsm3YLYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWgqE5BhAHoTHpQuvz6cptliA2SJ2SmW3u8skMAZps8=;
 b=DSMgUdT9pAznNhknZEmN4gyXPNFXSi9oAWTxq2J/Z+S3a44/cRmcTlq5PM6PeeCyCk5Q8xIbkowbz6xF10z9KD5+ghvr+wfdIpKz74K3skumI11G2G//ijWryVCm0witY5y1LNxkp83tnybfbheqkJJLTrqUp05vVV1I1yHkwu4Qq79gPquHywdmWcjxcWqd91OeFFaXX09HOak/c9f5kUXLJktKuJsYQwNxyFXunEEUsAPdd39VASBLBogS8vLEcP2u93fryo4MTY7is6vlOJHg0cOEhwcdRzPgMgH92TzzKoajbiSIU2DW0Wnt4Nx9kyKvGdj7HrWGCeSTjxokmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:42 +0800
Subject: [PATCH 07/15] dt-bindings: mfd: ti,tps65910: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-7-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 09bd3171-6d11-4209-ac93-08de836aefa2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	w9QTzE0hKbFQdS8UuVWIm8Hclg+LFLGSq928s9Sgxc95sGIGBCJKeS6jFv4dBeE68a0HEdd5kYuepFUgebpRNvMuTuGze0vdemzvd7ZiPGl58F2XeChHnnCaWZEvIjkTqM08+R9Z+vMmjYrTRhggu3RAYxpF0ppckbxncqGZ0VaOuasVNfsCnS/2DbISvkIJuSYmmZmvXPcq4flg/lkMoe/N0jdNn4xvGvPnYYlV+b/DFZ8uqcsl7DUisF4DFXu/TXlkLGKt3HQFXYlQR2XQvUiaUzK/fUB/P6EvXGEFxNNV/qYUEVeuRI5u1bXYkrN8SIDQ6CjOCodXl1MpoPJq3MtDpbNciUA+2K0O86QHvi2WzQ1eeii2j8IqMyghNdNuZ3epl/50tHwBKAsE6XHVqXRe+pyTgUntJAZBEQMstDCZwXSsnTEvphvUc+SaiOle83lFimd/KYLBzpCHcIj7eUcJ0Ve+UFk1XskS/A9ZO5Ozf0jDxuF1oJZrGrsm6JEtSdTSbs2HUVJFWLg/O6/r/0fpkmZeJEuzW9hjPoWbajPWLi2+tXO0ZdBJI8QcXsY33voGPnOmiK54h3BkPrNvK9rXR/np9xKJD0l9iuKTzSfkadRAhCG7VLOLntjXSrEYBuLpuI6b4pOEDrGeRWa9hMuXPvxBH6u/fMIwqnWYHXkGJxJwsIH82mO88pvyypd5smgrB6llDIwfmvcF6nalEGbgfEvUJEYbfXg0F9diUUmph6/0zMR4N7ITe7bm7uRKj8CmIea/1YBFqNmeQfanwF3PFjFQMe7mYUcnqeHRee13g9HCx/nY3QjURf8iMVqo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXpDOUE3SW1rbTQ2YnovNWNGWmNydGpNT2RxUjdFRkRhNlErWG8yQUNRY085?=
 =?utf-8?B?K3IydzBSeVE4elc0S3NTdTVlaXd6bE95cTZ2aG9uOC9Jc21MMVBPZURvQy9p?=
 =?utf-8?B?Q00xYmZySllXUFhuRUhtSm5EcitFSmp5Y3FyL2FXU01ZRTlBdUNQeHFENEtF?=
 =?utf-8?B?cW9NL0NvcGl1V2sxUnJINjVuSm5FTnVkMXhBanRIUDdIOVR2aktLV3FtQWZh?=
 =?utf-8?B?NTU2eVRnVExyTFRTeE1iM1FZQUpMOGVFSFRmVVkyKy9DcjhOVGQydEp5eURu?=
 =?utf-8?B?NkJoWkJGbHl0Nm5Hc1FIc3g4SU1zVzAzZUF0VS8waXV6dmhYTnRReTc4aith?=
 =?utf-8?B?MG9WSTdpSlozN2I4RS85ZkpXWm50QnIxVlR2c1gwSEtDMjQyaFNBRDF0RHVp?=
 =?utf-8?B?UmN2SEZrVUQ1d083YWlIeVNsYWM1TUxhcnlWN2tEQWluc1RIcmRpQnQranpF?=
 =?utf-8?B?TVhjRDdzMDdaZkNLUXZERFpxYW9OeFdjQW1ab0dlU253dzVPMXhrUTM2ZjVk?=
 =?utf-8?B?c0FHbW1ycGdRNk1BOHlrV25XQ0grbi82by9qVitjQzlsZU5jMU9CNUNOUG04?=
 =?utf-8?B?b1NVVVFtT1JiSzZhbktja09IZHF6dnB0ajZVNndjSVI0dGpxV1RpQ09pdGlU?=
 =?utf-8?B?ZjdMLytZMWdPcFdxbXFhNkVyNCtreXNCS2o3TmI0MVIvbHoyNnFHVS9RRWlE?=
 =?utf-8?B?ZHVhbHNtV045Z05sL2UrMGRIUnFxaURURHo3c3d3QnBxNWFmdTBLb2ROTVlV?=
 =?utf-8?B?Rjlibi9Kbis0Zkp6UnlFUURJa1plWjlBRWplaVdXUFVXTWE2S0FUMGdLT0xW?=
 =?utf-8?B?MFRzNVlEQzJhWldVV2RGdzVEOU5hZlFZNzhVN1ZKSTd6SG40ek5PclMrUUcx?=
 =?utf-8?B?MCsvZk54eDBoYTFldTVaM1RPTitsWUFnUHVVbFpPMjZPWjAvUGVtcnYxZkFl?=
 =?utf-8?B?TVR5MjBBaWVQNTBWWHQxUEpoNmx3Zjl0aXN1czVNY0UrOFVMTnI1ZkJkTFVx?=
 =?utf-8?B?bFdEdStZNG5ENFd6Slo3SHNTcENvM1UrOXZwb1ZBREYwNUpPd2djR3Z5aDhy?=
 =?utf-8?B?STBNT1o4QjU2Yk00Z0dibjZQUmg3OS80cGJGeVcwbFdjQkluQWVJOGpBamha?=
 =?utf-8?B?d0JMMWhtbjJVeTBLK3lBR1VzQjNCNS9xUjdJZEc1ZmdSMk14aWMyUC9Xa2Vs?=
 =?utf-8?B?ZytRdkdrMjVZS3BZL0k0NkJaTVhrdVVzcFhSRjJISXZ0clRIdUI3dUVJVW5W?=
 =?utf-8?B?V3FLbUduQzJVckZmbTR5eXFMWEgzb0k4NzRvVWlNVnBZbWNHU05XSzlmMFFi?=
 =?utf-8?B?dURuUWpxb3p0ZVJJci9TeTdZRXBJd2RrOGxEeDJwWS82OU5HUkprVTVtaTFk?=
 =?utf-8?B?cE9IVGpXbEEyL3JQYURaQTNIYTZwNHhDWW1ubCtyQ2s0RTN6S3JaMFAxQ3p2?=
 =?utf-8?B?UVpDVlpVUFd2cm9lMkxuMEZuS2ZDTkdGWUpzeDRBaGpWb2xqS3liVnh4dnNt?=
 =?utf-8?B?RU0vMCtES2lqYW55bTd2aWUrUklkU3dHZ2h5NWtSUHF6b0s4OVBkb2pGUzBI?=
 =?utf-8?B?UlREMjhDS0JTOFBpZjlzcVFac29vcWZUWGdmUVJQMWpXcGE4dWdUU0RFMFJC?=
 =?utf-8?B?T1cyUUYrRCt3WXY3YmRKa1c5cG8zRERJNE10Y29od1d3M25XdzRMa2tibmQ5?=
 =?utf-8?B?WTBNb0lrWUZwUXN4SVJCR2xueUNldlZnYS9aUzJJTjBHSUU0OTZ2YnlXT0FJ?=
 =?utf-8?B?MWZBQnR2anhhVXRESWNyR211NkxLYytxc1VoY2tBaDVZOHgyRUdZdERqWEIr?=
 =?utf-8?B?eWc0VXhiM2liVFQ3RktOUTNPUHBuU09BN1F1dHVrTGhwRlB5cFhiM09pckpJ?=
 =?utf-8?B?MWtBQXNKQXMrcTgyajRxWUNwNmxML2t0ZUpXbUlZaU1QYWUzNUlkK1pqNzdE?=
 =?utf-8?B?RVVTakxOWG9EQzhBR25NZXNpbXYxNlE3alRON1laZnZRWkY3Y2xnM1V3Qmh2?=
 =?utf-8?B?ckEwTkcxcXVqd0pSYnhaZHAwMFZodFFCd2U2bVRLV1hOVGRJTVBWVjJ5L3hh?=
 =?utf-8?B?KzhxS0g3UjdOZ3p1OERVNEFxNjhSUjBQeWc0TzhuMUl0dFh5RzZBd20waE8v?=
 =?utf-8?B?dnlaNGV1VE1uWmpSdlNKRnVsS09NbFNpUjRqT2pXbmI3QkZSNUhzOWIxWDZP?=
 =?utf-8?B?YmxXYmpqRWRiK3p0N2Joa01SODdDbHF5T0pBZVMvblV1Uk9XWCtZcG8wT214?=
 =?utf-8?B?NVlQczlaZDl1bmgwT2hpeVRhZjBINDNpT2hEa0YrMzVlbzNxZmdQaThCaG9Y?=
 =?utf-8?B?cVNid2RDVHdzUlpTalptWU0vTXVsRTJuMDQyV3RMQzVRb2U0NFRkUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bd3171-6d11-4209-ac93-08de836aefa2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:24.4785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40fkb23uyBNetOq+l8AQVu7rpd/UV6+4Rpga53rySF9pwIHqaZxyzKB/VNqkgtpGhj4MiXUzZL5db216uwxkfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6212-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 496B729BC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Mark the "ti,system-power-controller" as deprecated and include a reference
to power-controller.yaml to uses the common definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0cdd60d8ba8f7153db7701e82fa183..3939e8518a8e72351e62ac07365a34dc1145e824 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -72,6 +72,7 @@ properties:
   ti,system-power-controller:
     type: boolean
     description: Identify whether or not this pmic controls the system power
+    deprecated: true
 
   ti,sleep-enable:
     type: boolean
@@ -170,9 +171,10 @@ required:
   - '#gpio-cells'
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -216,7 +218,7 @@ examples:
             #interrupt-cells = <2>;
             interrupt-controller;
 
-            ti,system-power-controller;
+            system-power-controller;
 
             ti,vmbch-threshold = <0>;
             ti,vmbch2-threshold = <0>;

-- 
2.37.1


