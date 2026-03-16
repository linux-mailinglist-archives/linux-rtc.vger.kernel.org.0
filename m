Return-Path: <linux-rtc+bounces-6208-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G5sCCgYuGl/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6208-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:08 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2A29BA66
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D022301BD67
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A342E9ED6;
	Mon, 16 Mar 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GrwOzw63"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA02E888A;
	Mon, 16 Mar 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672409; cv=fail; b=lgqcemI5ig41EbzuDUnd0CjO2VxMLYDHqQ6TXPelJG++m82kMbykGQp0NFTIQRyfsGytBoYPZjhLqWfi2LNXfIi3B6tQr+nnlBlN+CVQT0Qdnz5KUrU4pI5EQicWbXni+cteZy/434gW7UpEEVJHdAVMGSxLg6Ho09EcyeXoDfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672409; c=relaxed/simple;
	bh=B8swhClIdMVRGplQmgZ/bR7ShlC77LTr9iYSj+K3it8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VqqKZb3HQCBs4asn6iu9h4Dz7FtQK6I4K/QmXQmNY99YRNgQvmqbLH7bgzIq0ZVpCFLu73hHETEiHKPyD8f7PkH3gBH+i6TnkXcbhpOkmpRSx/YXsEx8mo2WdzK/tMf43go6fM5xpOkc41zHWqlynXs6D3gAZNX95fSPHx+xn/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GrwOzw63; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiLUK4jbqZ4BdloSV/p32IndH4BDxUg26hNsPO5Z6/u8VN1OGRnAwQiIH3rlLSd3Wp1dT/g2+f4UFvC+bYKq/4Y5szSkoF4kKnaP2YDDqkesVbeCGE8wMfdtZmahI70ES2gCHiTtpySYYJoVilpy8TvqXime2oLePqrBk5TM/jbKStztGmr5GkkhNmFp2JRfbM1adL1kc6RkCb0tvC8+Ui0O4456BNMPoWcsn4Dm5qxJJJVqCYW/RA7s6bO/fFA2mF52XNgKdsp2bH+AnvAKC4D9vtb3bok+o+mTvguee1AtjHGfkY+fZrUIV7dz3wa4qjRw3VeXSXe9XuwjWsXiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fh4IFW9iZzroupVWepJCaefE8GX516AXo0P//lWuY0I=;
 b=ISTWQ/8+w2E3NsquKNoyjtmXSJv6um+Gag4UckWgir8q1nhHvpGp2Ak82AYn+5JNSMCmi7hy/Lk2MSAZ0gY+0uLJqDKzGSHQZQTagLj6IZUpcz2HHfRJq6KzSZlS7bMUMrOQrgMIogxB0+UWK420r+2I1rxkpqaIvz/dPu5xXQz6mjqUXo8OtOWhjUtJY5EJTbqzMuwCo0cK5f8gSJh+rLZjck3sp0iX3PtqhWRzZp+lqjyMLULhuHxCIPWr+CNLXnW3wXeDV88MlD4tx/MNKw5AwyZ7XOVgmN6p8xETzGrU1NyoLiwXuYBDMwPMd/MQQFun3LAKAISj45DbKewN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh4IFW9iZzroupVWepJCaefE8GX516AXo0P//lWuY0I=;
 b=GrwOzw639rBY3pDX2CCbodipILxtZslWzmje6Fy7RwAFfJaSBZdz6MUqBbAGpnHfIoWg0GFPmEyA38wXYD7xnmwf3ukZS+0LPGHZZ99Ha+ulsUeIwTh/pxlQUNaXbb/Mu8vT2GbLYHlNdEjTyC3X4CoHOaHMtTCCbVJyzkZiCp+M9Nx556NUjQXlJlnDuhUw8haw9wPC7y//2tEZ9/Jq+AKmmPzCfiAS4ytQFRn/sTDnW5K8so/JRPDSOHluiBuw/jQbd0ydcrlKegxHDzJxBPmK9rKYpsuhuPMn0NfCd/gzwIdoWYH9uwmmy3M+y3DoQ/r+wNZmwSbUsYafEPpL7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:46:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:38 +0800
Subject: [PATCH 03/15] dt-bindings: regulator: ti,tps65219: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-3-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c5e482e-498f-43a7-bbdc-08de836ad84f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZU0mWeA240bFIr5FjfqUsAFwKcCB6/gRS7H8WzRtuZoHmB2DDtcIdN1Pta9ONAfbUv2+bTtjbtdnnWNKp7GEO3ZLoux5Js+sj1Bgn3Jgasm1GdRJtJ6cC8ItIGp8LeQLeZtdDaiEWUqUTiPy2s4u6CMp07oiw60F86uH1jIvw6/4lPXUxH3SByy4M2ela3N1Mts7O/MFZPS7KWtJgQKeexk8x/r2VIgdT2d+W3BCElXrqhtoGbGRsi9PG1muyfcg/CtMv966GugL6E2LvRYJwsx6Tg3CLh82JLYEuUNVXEdDtjMIzm0z7pOj1PS2VsW+QPLivtOYIK2+DJeSg/XMYmIPV48gBABqf94P/a2HgbAU7En9dZHM26J5D2Ph3Dozh7mnry8hJkhlRBSKFvZbHwIzYw9mg+u+00+0leEILfpB2wYcKB4XgNEiEZHqREsGv4EnHhRfcE08V2tNOK716HmO0YGqWq8A3ssxsDSPeEkuMIaVzSiSB7mot77++0qKXIOACK/+9KklsSQTx63JPoUDWCyFktU9SmSxWlNnbn4pY096+XRjLZ0X6uCQF9D3aTXM+5gVJAwfZUg4bWNM+ZxORQ6TS0MEYynu2aoxz2MUXT4kfz4pfIf6Jo4yL165TJCAcfMnm2CMPI/sCEac6tYmo2ab+iX7iVkcFAPoW3QEOJlU00zAat2MbD4QknVs9eMVE4HFt4rDwlYeVqvNKSiiJhHObKbkKhwTPwFC2Jve8gQGZtnnRXx41eQzBeEtvzD3UpUC01iNw9QS28UtpkjyIwpAllQpgFQSbggRWRjgcf8Wbji+/DFZijjklseY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dEblpXckEwSGtFV1dHK0RkRDdrVnFySU01aklKY0RZWFFpMmZ5TVZZZXdP?=
 =?utf-8?B?WnAwckdqYkxVbEU1Z0s2RnVVL2dVOHZOYUdXTFg3MU5NNnpmZHo2dUsva3Y4?=
 =?utf-8?B?bEdabDJ3RWRrTnhRaXZKSFpTdWNubVhvdVl3Q1RJRGg3Z0FzYnlIdHBxT0l3?=
 =?utf-8?B?amE2R2NhODdURjhGSU1Jc3Q3Q2pOUHBiUGNlL0xTUXNCRmQ4Z2V4SUt5MXFW?=
 =?utf-8?B?TFM1SmU2UnRKQnNRblR2NTlyUkxSZGVKWFlMNXhMajRJeW9qQUhLbUkyUzF2?=
 =?utf-8?B?U1VnMGsyeDM4MUlIZnFDem1UVDJwWHp5Q2wxMlRreUtwRGVzSkZnRFNndDU0?=
 =?utf-8?B?L0FzN3V1dlErVVVlbnY3UXJmQTZWTEhNWXpyVW1LVHZRNTErZkVHdHJUaWFW?=
 =?utf-8?B?Ym1CK0I1aDdEZHB5dFZOaXJ0a0FXZnE1cndmeWJHSkhIVTl0SHJuTlJqbHVJ?=
 =?utf-8?B?K3QyWHRPS20rSzhZcWRkMEZ2alI0OHlSMVU5NHlIVUFDUkFoVmdMaTlheXJZ?=
 =?utf-8?B?dDhpWGJoaDhIUzZ1Z2NlK3JjOVZ4MnRlc3pkYkV2YjNXOVROcGh4ajVYOUZX?=
 =?utf-8?B?elhTc0tLNm1XTjhtWGUvcklwZEZyWXVPeCtmTUpabEFRVnZjcEVnYnRXdGRI?=
 =?utf-8?B?aEtwc0dFMzRIdWZGWjIrTFBTZURYcmxYc2dxVlZUTHU5b1Zlb3pLVGQxNkNS?=
 =?utf-8?B?QUd5K3ZEOURYbU5ja09DTSszVUZpb0s5Q3I0QVRiOHdnTXZ3OVRLSXVoUnNQ?=
 =?utf-8?B?YVJ1S0RoQ1JJT3E5T21RZStmaTlBdmZyVE8xMG1GQmhySWhLbVhWL1RwSVhm?=
 =?utf-8?B?Z2t4bFh0RVRuWHd5VnNoTXEwWldYei9vVStRT25nNlVhc2lYQ0xta0R5dE5K?=
 =?utf-8?B?T1NJUkwyTmlOaTNZRWFtaGN5K1BZTUgyNTBWdVYzbm5QN2Z4TTMzektVMUtv?=
 =?utf-8?B?cXhnS1hqY2VZek9kUGMxZGRKKzgwbk9aOWl6c1FidU5zZU96UmMrQ3c4VEhY?=
 =?utf-8?B?N1l0bmVjbHVnSlFlWVdEbS9oMDVjU0lkdFJxdmFJckJvNE0vNy9NZitpR04y?=
 =?utf-8?B?T3RZUVJXc1JQWVdUMEhpWnFpUFE2Z0RmcStzeFJIOXNUdkhPQXdqbDAvRzBp?=
 =?utf-8?B?TW9mTjAyZWE0cmxIdUxwMGFReUpaZ091a2dGWkNSRUcrWUZ6RlZibkV5VnVB?=
 =?utf-8?B?dG1vTVBReVpVY3dVbWVUeUJXNnNMOFJvZDN4ZzBWaDhlYUN4N2IxNTVIQ2Fn?=
 =?utf-8?B?TDYzSHZSRDdjdkpNaUdianptaUxqaXE1eGdHd3JETnBhTXVjcVBqVENMN0xO?=
 =?utf-8?B?c2hqMGpoZ3g3bDVyWDZBcWZEeGdRMFhCN2cxd2ova2NPSUY0RjY2bktMTUFO?=
 =?utf-8?B?SXdYWDVHNGlLa3U0QVVkZFlYaWdwZnZkWXNQeDhKaDR3TVBXOE9NQzVGRkta?=
 =?utf-8?B?bTF6K2M4MnNrYy9SRWZ3bXFyWDlLeGFoekFtZ1dPVHhrenhoNzdPUlNBVEwy?=
 =?utf-8?B?MTl1NDNmdktHdUlWcVdCQWE3MWtDcWRSZm4rK1orcG5CbENqaEVKMTNRR2Jv?=
 =?utf-8?B?MDd2SjJTcjB6ZG5ZNlptZlRYVTRBS0grUE5wcUFuVzlnN3drdVpPRzBmQmdt?=
 =?utf-8?B?cFM5SE1Cd0FEUkc5YUlkMTRRaW52Y2pYMnpJNXorWnRIc3dmdlJFZE9acWdt?=
 =?utf-8?B?STl0MFp0L0YvM3RvUFlJOEU2VlluR0FueSszWEIzMXZHTW1pVlVoSmZ6QzRS?=
 =?utf-8?B?Y016VDZoaVpLRTVIblBJMEloa09tYXRUdlFmUHNzRyt5N0U2WlZ5bkhEcENN?=
 =?utf-8?B?Slh1YVdGUVVRM09XKy9WT3ZhaDJBRWxvc2hvMXVOR1FJRy9zbHJMU3lVRStu?=
 =?utf-8?B?cllIdUtxakZiU3o0T2JsVU1kOXgxT0RYUC9CelpGMFVwOWV6NkJKOW5WeWtK?=
 =?utf-8?B?Ym9wdnA1Q1o4ajY1N21iRnlLTHcxS1oxcGVIcTBYVzhnei8ySEl0d1AxakJ6?=
 =?utf-8?B?dlZQOElMQnJTbE9DcU41Z2l0VURGVE0vVDkvbnpIQUJNWkVSUWtwUnpoeDBi?=
 =?utf-8?B?NThEczI4enpOeGF3NEorUnlDRFkxWjdtRVhCbW56SGtpTXNTUDc3VmUrY3hm?=
 =?utf-8?B?K0VONVFJTE5JWE5jS1o0TSt2eER6THN1V095blN0S00zMlhVeXNGcElidE0y?=
 =?utf-8?B?NVZsWWxtcEovZGc3S3NkU2l5ZHBMM3FyQUtTYzhweEFIUjNIWkh2S24zM3E0?=
 =?utf-8?B?d1EwVDhScG12NUw2VTRrMU1CTzNUbzROTFIvOGVIMnBDOVJqTHhpUWU2YkFk?=
 =?utf-8?B?YWtRazk2Nk83ZGtISFJub0FVdGJjakExekM3dzFuN0hyUlV2aUdwQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5e482e-498f-43a7-bbdc-08de836ad84f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:46:45.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtCSMxwb6jgx9tloMDzLQUKG14Zb89yRyf92UNMf82b30xmeQ+LEhwDcntMrWAlQXTGhnxiAJNo6tWUcY/yCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6208-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 22A2A29BA66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/regulator/ti,tps65219.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 7c64e588a8b54d90ee10c4c155f9db62b5a72c32..d3a82aa7319f0096d8c98bae450190f946a85a9a 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -31,11 +31,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description: Optional property that indicates that this device is
-      controlling system power.
-
   interrupts:
     description: Short-circuit, over-current, under-voltage for regulators, PB interrupts.
     maxItems: 1
@@ -99,9 +94,10 @@ required:
   - interrupts
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:

-- 
2.37.1


