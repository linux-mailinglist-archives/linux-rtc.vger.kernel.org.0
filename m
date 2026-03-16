Return-Path: <linux-rtc+bounces-6214-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ+PHjAZuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6214-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:52:32 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641F29BBC2
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58DCD302805D
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA0D2EC0AE;
	Mon, 16 Mar 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uxFy6a+B"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4D2EB87B;
	Mon, 16 Mar 2026 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672469; cv=fail; b=m/phRzbFzOo1r6xnA0VU5MHiMnPPoFHD8eOI6W6wSvrv8d6hVmJaN38XC3PpTfrHUjG+aN//YrPGfPuhnwjQ1Ek3DSNC/zAncgfkC2WWZwW4AEUzoxpiCtkh+29i263krAzPTjFflW8GbtH4wfqM6ixs2LMTPjV9DKngymmn860=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672469; c=relaxed/simple;
	bh=gLRmwTrl59yRHJKqQ51Ya99vmYDrrlDSYT+V4icr52k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LsQxI+p/w4puhtji+/sr1UnZmk2Xm351zGm6Fo44BRrIdD075GPK02E5bLP7g3r31IyfpFl2de/3TQA0q4LEK+5pmvVv9dCqdta0VyG+IQWFO1tiLpl/xGk7fiQj4Bo7HldmW2vNjdyCGAcK0uIztP8dvBNhdsvmgm+h/tiZOdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uxFy6a+B; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itz1SwSmhrxHYK0JUvsYqi2uMfwexd97Ok2pTQd2Wwb1QRhsakJTZx4XbJEuhCgggHYk360De7jZ0ilGbOL+sZP3iN69JRNyI/GP9BFVRk6X/ldrT8Kn6sXPma9V/yTEb5U1fu2nXdCH37dIZSd+k0EZPqdoQuohZXRe7mLghzLQajmxJnubyNrVEe+T9bW3FofZ5YpdSYGqV1N9WIHuZIw40umFCEa1KTut2yqc9Xi9cEvNiucYno8aWd8e9EW2KvK/SJr/PpMHtPjA5fZ/oMTMW+uJACH3Mc9VIlT5ztH3qfuCD6gKd4QuUAOx8KPAvtL7UK7on1pD/HL5qViuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOTtWY4mpRm6kWo+wD3ePiOtrtLbryPLSx3CLjnTuM8=;
 b=Cd3qCGpPg2gYH9PGDv9SX8mtUVu7/N6nb4v60rjSR7UwOUXNp6SkaaaHYHj1yzLZl/fNpEDf0hAyXRJc+xTZ+6jjP39G2d3GSZ/GS9SXfWu5zQpnaPdF4/11b+KuZhQm/enZQfXiCIx3XkxirPVDHyWmsLNoKb71Z2JrjmMr4Qvnd+ls2BO9kzMApCbXD200aIXkbXkLOwkx6hOkEagShg4tH99ihH+QMopbw8eJSNKH9cFtlkI7xxLh+bDeP3j0rK4utZTv3xtE/No+OS03MBr72APATSNt14ideqqTeO9X5HcvuyD3/kOkFU8lG7amNhWY7+EG4Bk6tOEPOa4z1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTtWY4mpRm6kWo+wD3ePiOtrtLbryPLSx3CLjnTuM8=;
 b=uxFy6a+BhvFX0CeFn6zpGEOuPizqpLM0dWoIJk2BhZdeE5wlPpg8lYI5AtsBFfJC0K6UhjSb7DOzy28lqbkhqSNIExkVb3RZ3LrtL9dm84PwHUWQow7VOtn+nPTsR6nojn/2z+fgFdGM6pSwYy/WjeidulDibRcXwD9AlUWfm9GggNKCIQ+OJT6vPwvHEPanmN2iKPlZtjGl+EIX9PvHOYB88WykqukEm/OujakZhj5huA76nkn8gqXtwTB4wt/DHxFtZ+P2Xbe7H7QfWiQj30Yj84J59XeB6lM7jNPR44uAfwl22pKWh82IB/0zNyNxUJilY6S3JFvBCuKPvl68zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:47:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:47:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:44 +0800
Subject: [PATCH 09/15] dt-bindings: mfd: ricoh,rn5t618: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-9-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb37d572-67b3-4341-d7a0-08de836afb08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	7hyR7aGEnMf31JI3lv7v1szKCgFvthCGrzzAEogDIKE87cRT71RMFJPLV4mqH8SvDRWTT620Epv+teomt2aHTed9V9cBTYph0wpOlUvygPLOTu20NUfazBNMP7kxAro6eTBbf6fxsrP1zvQNqeip7yrvl/WFLTtQJJ/yoo0XFN/0oQk0OrgnRQz5IND/wpVONamw+iparDJ7Szo5tPb12d53iJUW3eZCF7w2BfvY//XOfT1Id/42EXIBHN7mjr4XTTC5+BPuKGMSOzPQGWHVnxtNj/aV1vjeJRkSNDU5keEA20twB9uFVQOC/Ij7dTNdyyfeGZh6r6k1mpbIb+dBZiQy+GDgrt6PPlyZKkh4foKzvKU4sC6x08I93I12vAzROwMrZ4I+FHeYPp0IQSolrgxqTw2gPuODtUUbq/n5aQMq8I1IA6RptOLymdZGzHnRsb6xqOstq21SqzqdfRlfbZzfO+khT6ab4y834/AJfDWwJ/7nA9/IJfeuJ7yHvOBbgPpmW3cIIhGHa4fnYDviR/+0jO3pRlUJV3+BmPFvQ+nytMZoYiGjJyaKLJ5L+F5GfLO7+wuuio1eeb8XI9JCmQ8GVBFd4iA4HoCA/Td8g5ncv9FLAPO/dnb4G4NBbxqV7HiUzIxIjnd/bVwhSyNuyfPS9hqDhOBBF+RZKV6b4dxOnm7kOKEh4cMQQu6de7Xb+AB7vIgL3Ks4JXV+uXuM4hgxwCE44DRK7vTRNn2mJexSMHfJ2w6uFyFE79yfDJFqJWf8vEr0NefEDX8LumJb7Q37+PA/kK2xgOIjcGIX1mZL9qBA9z+oi/RUcfbOTrgk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlQrVmFmbkhWeU12ZW5hTHg1MmhkbDFzSW1SSnhrbFdscjllOVptWVJENlJO?=
 =?utf-8?B?ZFRhYmozLzJqamZLZCsxN0x3cWNZeFlPZi9keHl1UitzOVBLcmhkQkt6a2VO?=
 =?utf-8?B?VW9Fb0dwZmdLaS9pWS9YZVVob2duRG1vUnlJbjJrSWNQeHFSZDk3MVF3MW95?=
 =?utf-8?B?cTJaelFkVSszd2ExUkZyclFScStncTUycUVvRkZ5SkZIWGdqZlp6U2JqUVlY?=
 =?utf-8?B?S1B0blRPenpGUHVuMWtRdGliYmRKSEttaEtYR2k4Ly9RUlF6VUhoVHFPYjdL?=
 =?utf-8?B?VXlhYVF3b0pnNDFSRWhlTmRiL3FqWVBOc1BKWU5HeUNlRDZ6WmF5cU1CUW4w?=
 =?utf-8?B?K1MxZEJkV1IwMmRUaERaQVRPRXJpR29VN1BFUHJ3dnN1YmRXTFRJeitXNHF3?=
 =?utf-8?B?MitkT1NnZ0Z6N1hUSDJyVEdSZkVFSDdUQ0pRRmp4aHRFblR6cWpRNzVoTjFG?=
 =?utf-8?B?dEc4cVZiL0VFNTB2UXZGZ2RId2ZlbWNCdzdwWWJTOEpNcEk0WXRSSnN4U3FZ?=
 =?utf-8?B?ekFKK1NKMHBXSGEzS3pvc2lla0k2WmcrWmJ6anIzZC9QMEFPcmNJdko1ekUy?=
 =?utf-8?B?a1FwQnIzL2tQQS91T2dtamo3TmhhbytXREFMVE1TTkdIQ2dNOEVoMmxBcmhH?=
 =?utf-8?B?ZXJnR0dYQ3Q0MnU1eUFYMTMwNFo1Ym1hUTc2SW1NZ0x0SjFVMVB6dnN4OFJ6?=
 =?utf-8?B?dmFTcVdjU1lXVWx3c2NaelBTSGZ5VWU4U2dramM2Z2ZxNXRmR3oyY2g4VHh4?=
 =?utf-8?B?S08wMmlKMzhNM25zYjFPYmdONXJKVk5lTjEzcXVWOXFudWhFelNRb01JMmNw?=
 =?utf-8?B?VHBmUjRwMWRZL3YwNEE0TU5pSTEvejlJK0xtSHU5SytpRDI3L3BrUXBoMDVp?=
 =?utf-8?B?Z0VJL1B1RkE5Sm5IYmRjRVhreVlleSsvMlphN2ZJOGpZbUdMVWJvaGNuYmM4?=
 =?utf-8?B?TlpoYVlWR1MzeHhwNzFHTHNKam4vWGwwVnVHQ0JHbjVyaUZUcFpQdUh0OU1X?=
 =?utf-8?B?R2MyUHFqR1NnSHRUL2JYenBOQk4xdDNOdHg0enh5YkFRTUpQY2cxMmE3YWFS?=
 =?utf-8?B?ZmJ1aVEydE5xaGhQbjIvdnBuWTVFQVZVN1AwYzNhL20xdzcrTTF3NFRKUFZK?=
 =?utf-8?B?NkJERFMxbUxKQ1VDSU1rdHkwaW9hMXh5cnRCcHpzd1Fid1pqeEdHQlFpakw0?=
 =?utf-8?B?S21DREZobDM4L0JQZk12Tm5rNFNaeUJyREY0eTR1Q2JsaS9ZNmVwMXk3THZr?=
 =?utf-8?B?WUd5M2d2QWU2bHBuYTJBREpkbDZNY2NBeHN3TEZiVlI0Z2RXdEN0QTFXb2Fk?=
 =?utf-8?B?MUxJVko1MFNWZUExcDN5VkErNE92VjkrWGZSaDhQUUJIcC9oaWxOOUNqZS91?=
 =?utf-8?B?cEJZeldROUJwRDU3V3BpWVFoaHRheHRrcStGV0c5OVB2ZTNwNkV4WmR6U0NV?=
 =?utf-8?B?ckd4cXAxS1M2UnpQQXU0NEpBaVFjbHhBWVNhOTRYVWEybWRaaC9JWnRTT0tv?=
 =?utf-8?B?d29zbWcvUkFPRWtOblFPcTFZUSsxYmRiODNMRVV1TjdtS21HQkZId2JZaUJ4?=
 =?utf-8?B?UXRyWlJWK0VqamRVd2ZES2ZRUXpGZURNZTl6OTlNeHJ3Zzhod1VzY3NUb0Ni?=
 =?utf-8?B?Tk9jb0IrbXJEdk14K3VmUlFwakVUb3ZEZ1RWbko2a2QrS0NjaEFzK0JMNjA1?=
 =?utf-8?B?TkJ6USt5M0RnZnYvbzBGK1pVTEF3N2pvdEhKdlVQOUNsLzRpQ3VuTlpQUDBI?=
 =?utf-8?B?cXdkRy9kN3NJZ3BSbVp2YTV5c0dTcURFd2VlN2VPOTNpZUMvMmp0TEt2V1lx?=
 =?utf-8?B?SEhsemFuMy9RNy9NMDN4c2ZhK0NFUkd2NEQ5b1ZkNGx3L2U4ZFlBSUpuK2ll?=
 =?utf-8?B?T21hTzFEbWVoTWVmSWpNbVdTT3daL3lqNXFqT0lEN3FITWttWUFrZHJNbGRw?=
 =?utf-8?B?OHQyUTRzYnAvcTFxNTVpeDBlVVFmQzE0ZjdISUdUK1F1RTN3WWUvM2RITEdn?=
 =?utf-8?B?NTgvTXE2eURWYXF0N1JHVTlBZzdUU1NmaUpvOGRBaGVpNGphRlo2NXJqTWlB?=
 =?utf-8?B?QWZKS3JZOG5PWmNFWFhCaGxReW1TKzluWlFGMWJPVVhmUlUxemhmSkYvRGVj?=
 =?utf-8?B?dDhzdnNIVVlLMXpRYlBRS2tGOGhyRFhOc09QTy8vNVl2RkYwM0pHWHRpKzFV?=
 =?utf-8?B?Vm9EMzBsYzJGeGs0VWZORjhCV2tGVG5WbFJHdmo2ZW5Jbm1majBWSElRNEtD?=
 =?utf-8?B?OXRPeFBRenZ4aGFpNitXWTJDQ2xRTmVMYmJkZmhxTWt0VFFCMWg0V0N4M3V6?=
 =?utf-8?B?WlZyV2d0NHZqam5VN01kNG5xMnBhR01mSjhuQXc3ZlFyYWpFV1dCdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb37d572-67b3-4341-d7a0-08de836afb08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:47:43.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCkJfDi7JwdSzOyUO9xHLgGfF/kFQ8K7RcXKKb7NkU9GEqkdPMaFAv26Erud6tOMA0R6KFBurKA5OUUNtk9KBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6214-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 8641F29BBC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml b/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
index e3d64307b5315730e8374e863203a15abb9f83e3..d81691f4d5742f46bb6cf37be4270fc4a38f21f9 100644
--- a/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
+++ b/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
@@ -18,6 +18,7 @@ description: |
   The RC5T619 additionally includes USB charger detection and an RTC.
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -68,15 +69,10 @@ properties:
   interrupts:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description: |
-      See Documentation/devicetree/bindings/power/power-controller.txt
-
   regulators:
     type: object
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.37.1


