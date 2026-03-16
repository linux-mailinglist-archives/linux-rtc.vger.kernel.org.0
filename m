Return-Path: <linux-rtc+bounces-6209-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEq/FUMYuGl/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6209-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994F29BA9C
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD7730298BA
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBC42EBB89;
	Mon, 16 Mar 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TPluU5eM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAE2E2DDD;
	Mon, 16 Mar 2026 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672420; cv=fail; b=bpm538MpxN+VTyT6YrvNvdOPzbV7691S45yadxYR8IFY6nHFAABx0VYwbBSGm94/GwamH1Pia+YLyGuUbFJPHGQubfqhzPf9LxrCfeGpm+JW0mUOAtx0KGYcyMRk1tqolulQg0HEprY1MhWNc+Ce7YZz6I+faprwlCcUCDGJ1Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672420; c=relaxed/simple;
	bh=zy1uIwrkx9a4UblOY1I3i/DVL2YtPXKJYKEz9P8jrUY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kPhbP87pg8zeCE9jCduTCw30spUSYm5QASDGWL0s8SdRXTdnsL+T7PAMj1DZttlqSp6RwqP81fvV0eJWk7AWHAw5F3/XDKe0HidRwZVQ21uhUVjKs8OYkhryXGpQAYo2xyyGOCXjD47+jYiY08BfHwYeGkgjKTSlCFBH6zkvgGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TPluU5eM; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3VDFQDpdsY7B+Ke8x4PdFsgXd7n17yGLoVQ+uGiD4Z5j31hh8TO94FToNz+LbHZEXx5J+xVTxE4g4Wzk6pv2tbBzAyq1C0Aya1V/Udi93dINWsrxENCbClFyyr+SdL6Tn/0qEEFCVusg5lYIXGkly+TIXzlkxMo8RXlozixH9inOuLhfjLE8XXdiG8HUVS0bXjJSBDPyVFZrBCYK/6mwSBqdKteN7BdGqTpuHZrar2ChB8kogvw3YDcT0QaFhgyf0pBbnZlBCNkNesshW1puT2rA/73SzTgx6OVGAIsoL0LAF+m2EsvnVy0E3rnLqwDbX/e9fTRxdH6hAUwY+HrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+zQYDf82HzCZqmU1ueRkGB3rrU74PbBli3SvcM6NJU=;
 b=CUDxYTvyBSUdJBOmOXRBYWgCT4eIK4kGpnBdN6jiPBwkWUjqHQQxxdwIiNW3Cw+hjy3BBB/5vTV478OdqjUEIgzzEoJcQf8n9LpzmH68rbC8P0fI8j0XyAHD1wxJwmc3AlH28jNrRGfQ3ab6nF0wVpbQVe5ZFpEgJz5kYcDnnt9qJOUtGE3F9dT6LH6aD6tUXfsOYPxUuU1FMyP/0iM8wSJDXW1vPboQt8bJ67UHmVt0Fpqh2d9N7mcvupDoZLKpFSmfKtjXoP2NztauS/9KTkVVzkj18n6TNURIpEYcDak/gtqn5sBFrVtWo89JwBktFGdkvbYAg+qPCfSaZsRtkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+zQYDf82HzCZqmU1ueRkGB3rrU74PbBli3SvcM6NJU=;
 b=TPluU5eMcx+dfUGQqJ8RfzhdhzzrM7f4UedmO71SMznlMLEkuL6X6fLBiSqEWPDMYfj/dHi82Ck1DW+LnxW8HpxPdkPmnuS3Kmc+ssQ98iCyTSXXh13tnrccvHjdaPsWkwx6eiDnaobk+Y4Vy3phe40wmCLdmmkr5aQzsRC6dQ1EZEGdLJX5RKwQiAbHzqQzIpOfj99PpLjMNcNL/FajO3anY8vEKg1jRETdUIH0aYSvU6q9QmLu5+bNbiRpZ27/IMdqoW7n5FZ3CbpRhji2oRFjsgmGy0zd4waGeswU7eIXjbx0IUncEC0wF91RXewzHfXGHftzXBRCJT5JAZa5bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:46:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Mar 2026 22:47:39 +0800
Subject: [PATCH 04/15] dt-bindings: regulator: act8x: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-power-controller-v1-4-92c80e5e1744@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d96c1bba-2e0e-4b4b-2849-08de836ade1f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	tUqUoA0emCfKgRmm4GQO7SRmJ/TfNZB0BYiDJy3sU6YjcgxqHSHxpGK5V8OJHSY+CDF9brFAxd/0iRiV25NGbq9QdYL9m4pkRud+v1JAWrnKPqprANjBgTPL9AvdYXqs0iTzuMlIQDFpF0PTN/aiU1zBxlFSGGZa00sMU3S1TAbmg1i30iNIA8b71mF308N6OF953xSb7kkYETtcwhUEpECBI1k/OdYd9h0Yp7JmuNynGb5H4goBKgvboOwzJdIRYRq3rvhWn6X0rC8oRU5iiwgViF3hQT/vc6Y65j4Vu61d76CfLsxLPYxz4NSRjp0KIvGVxIkIuy2K4hF1sRUne7UmtbPJRiFnVAoV5iDqiJXkjFY5rM+4jve8mFLKUOrNuZVP9CayTRqRTpMYHlc9G9WfEX6dMl9Hv0kuaHg5T5MLBSNG/Y6luPed67Qs5j3hYg9zwCyd8UUH714hvKhNOBH8tqkNNY3dNyQ8s1dBLFIrUU6RYcOrSgW2ySKbLNnTYdvjIFH8//lR3P2sfxdaza3Ev+BCzkOlLrwXaVh7XEeIqK+UdJhKaWpbrG0CjO2YIjbwZIMOVgjhNQyry+ZX2CzwhINuaR4y5kgKgMp1ZbTvLPN6IeuTYwLzDUGqkmuG3qG7Y5UkEw8x6WwDQmepYmFjSEjoi7dAcjIUKqZPRf/BDUWjY89hMrEjC+1uH9fq5r13WgN5zE7uOoCix35Gz5ixweEGIGJ3vJRVvo68gKD/ISofq7PYkeEvIrVTGRKyDXUeZw/RMNritTsKSaU0Oi6OMR56tQrM5owBSgLih7LkDE8aHMXeodPpQ+rHxU3e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDY5RjlsN0RZMkxoU3ZCcytzZVhMWStwZWNHditLVXI0RlY0M1IwenpxM2FW?=
 =?utf-8?B?ejhIUkpHOXFzMlNPNTlJTTBFTWpnRENjcVljbHBuVWJtcG9yMWMxZEZ1NFlP?=
 =?utf-8?B?djZqZVJabmNJTTF6SFQwTEV1L1RQSVA3UzA3Uys4RlUxOW1QMXFrRXBUaWFK?=
 =?utf-8?B?d0NQdE9yNEdMdlhvbTJhTzhOdXExblBCYWFvOWx5cFNGSE1KdVprUXpDclFC?=
 =?utf-8?B?SEo4a3hDYUMwVVpJOUw4THFjMDdZQUpQWWh3NWxZT0Ryb3JOSUhzLzJCNENE?=
 =?utf-8?B?Q1d3SE1qYndvTlh6eEl4UXJRai9Vc3B3aTFLekFFaFRDNnNGTDBGdXlmVGJG?=
 =?utf-8?B?MG1US0hrSXhLQ2tqK21QYjJ4dXVhTjAyWnR2WHF1RnVzRGhzOFhSYjJOTk5Y?=
 =?utf-8?B?VEVGT01YRVQ5Skg4MGNwVUNmUmVUN0hJdXRpZ1dZRTVDdjM2OWU1YUNNNzhU?=
 =?utf-8?B?Y2tLWVQyMkNMbERPK1Bzd1B0YlVzM05UaERUbTRDQkE4Z0hLWDM1SStIYzI5?=
 =?utf-8?B?OHZuQWdzU2tIcEZpajZRM1k0Y1NJL0VSM01Pczh1OHVrZFhGQncveE9Ycng4?=
 =?utf-8?B?bjh0cGtZc3l6NWtTWW1WVzBqTEpGbCtkZDkvdmxuMEhJQkFxcXlZYVMzR3hj?=
 =?utf-8?B?NFRMdHFUUTVyWmh3aUJIM0hZaWRnNVA4cGJxYTRXVnZTWUhnUGpBbUUrUDIx?=
 =?utf-8?B?WlhER3VVRXhRMWEzZENGclEzaTdtM0F5Qy9ka1d1M3BoQ3BJcWduMTFBb2Zy?=
 =?utf-8?B?Tks0NGJqeUc5OTdqL3J6dWhiK1pZVktjVktQbG1vMDZISkQydEhjSUR4ckdZ?=
 =?utf-8?B?RG5rYUVLZCtrd3NEQ1pmQjVJNUtlbXVBcDljdW53QVRvZkgyM205VWU4RE9z?=
 =?utf-8?B?MzdnMWEyY2JWdTlIZnFBOTJBelRKQkpkUUJ0M1RxRnN3QnlxcGluVTB4Zmcr?=
 =?utf-8?B?aGhzZmN1SjRjb3hkcFVxd3JWNDlMd2x1MGQvbUJYYyt2UEV6UmhRVWZNeXdt?=
 =?utf-8?B?Y3ovQXpYaS9FcEZiR0k3TlJEUTltcjRsUVcyR203ZnVIekJhVGwzNnFXK1Zi?=
 =?utf-8?B?eHNmNTBueUdZTVlSZVdWdUI4MlRnTWFTanhOYXpoTUF4OFNKMUxDMjVHMnhM?=
 =?utf-8?B?UlVnRGxIM0FFcXQ1cFM2c0NEZkdaT1lhRUV5citMUW1CWCtEdXdFQW1ZVUR5?=
 =?utf-8?B?T0R1eWZ6bkhtSFZEanlzNjdsRGx4V2tOUEtPUit0UTlSdkpDRllpb1VKNzY3?=
 =?utf-8?B?SkZCSUJwUnI5cHBUTytNdWpzWC9ORkZtOW5mYVVnclEzUGo2ckl1T0c0Zmlp?=
 =?utf-8?B?SGhRcTAvVGtoVmlhUSsxOEc3ZHJkUG1ta21oNDV2UVVpNXFmYlYxY0VmVHpO?=
 =?utf-8?B?QVE5SndkYVAvZVJKeDVLSVdETmxsVEZqUkRJZHZPdmVCalBYdWNBK0FJNHlS?=
 =?utf-8?B?RW44eVJKUjRCemwyaE0zZVFiTTNySHZvUnBBTjlEV3hMck1ka0lTdm13SGJC?=
 =?utf-8?B?akhTZ3lwSUNjMStZUS85UkVpbmt4VUlrVHAwNHJnTjd1aDBFUGc1V2Ixcyti?=
 =?utf-8?B?NHRPZGx0M3NURktqM2dOdjh5eG5LSE9KMDBadWRFcFNKaWEwV2phNk04VDBX?=
 =?utf-8?B?Y2VpREtxRGhBSkNsNFN5MVM4UnBVbXEyQjhlQ0hJcTBsVndicERiTTVHNVdM?=
 =?utf-8?B?NmtsR2hGenhHNUhScjJzSlRWTnFMakdLakJmR0NPaFJGS0ZRdzBUVkROQzdl?=
 =?utf-8?B?KzVLb1pIRVNtNVFCUWo1OGhJcTBiTnB6VjB0Vm41aGh0NUs4MWtoQTYzL2VI?=
 =?utf-8?B?ODd6bVRWRGc3cDlCMVdhcDA4TWE1cFVJc3ZITTNxWWdCLzZJK3hPTE1GVXJD?=
 =?utf-8?B?NGhGSUpMK2lQNGJ1L0tpWDZjL05wS2Rab0Y3UXdpUTM1RTJETWI5eDFOOVpj?=
 =?utf-8?B?TUNHWVZVZ25pY0gxaFNBZ0tOZkdYdEZ4bW1HRjNpN3prZm5Jcy9WT25IOXpx?=
 =?utf-8?B?NVlCMExlVmxtMVI1VGJoUHJBdGNsMG5xY2c2N2paazQ1WGhBRVZUUlVKS1Bw?=
 =?utf-8?B?UWFnVkxDdVVsSXJKbXhKMTN2QjV3RUMvTGF2WXZiN2ljdkZOZVdMdkFTUm9Y?=
 =?utf-8?B?eUVsaDJDUlEzYTdmVXdWblltZ2hCYlptTzdPUjFINEpZamI3ZnNWUTBPZzdi?=
 =?utf-8?B?WWQ0WVRFRXh1TVhacVlPdDcyWml5S3diSzc1czR2UVdBRDJnU2xoSG0rZHYx?=
 =?utf-8?B?UmhGSk1oNEthNjczUGI3ZGJUbGpxdDMyNDI3T2g2TzY1QllzSDVUZGdYSzND?=
 =?utf-8?B?OG01eVFyMzVibmw3REJVQ0NsSzV4ZGVJdVRMTkZhMGFPZWZMenFRUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96c1bba-2e0e-4b4b-2849-08de836ade1f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:46:55.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRRe1NDbuzLPrwnjtTSzwgMThmPMvN2jIFOlvExaqOu8yT3vpy4KltVBAYPPT2/cXYDScZuKgKgG+OyLNTDPKA==
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
	TAGGED_FROM(0.00)[bounces-6209-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,nxp.com:mid,crapouillou.net:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9994F29BA9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/regulator/active-semi,act8600.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8846.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8865.yaml    | 11 ++++-------
 .../devicetree/bindings/regulator/active-semi,act8945a.yaml   | 11 ++++-------
 4 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
index b8ca967bc83d1ddff40679427da9d2d9cd3b13b8..49f74a9b1eaab19ff6d1c4e633b916a51c6a2f86 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8600.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8600 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8600
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8600 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -75,7 +72,7 @@ properties:
           inl-supply:
             description: Handle to the INL input supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
index 02f45b5834d008e8e21cafb692e829d4046c1b92..29ec8ab1b642635b8a1452a5d4b515e88445c63b 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8846.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8846 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8846
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8846 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -59,7 +56,7 @@ properties:
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
index afe1abc2d727b37b3652634edd6cbcb8132e5f76..2423d9b65192e984de4d9bd83b1a25846bc12361 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8865.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8865 regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8865
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8865 is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -79,7 +76,7 @@ properties:
           inl67-supply:
             description: Handle to the INL67 input supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml b/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
index a8d579844dc7bcf634bb1e84dccb8cd5d31b96f9..f19d3f0e0784d5efbd2bf06dc0c2a25e45dbac70 100644
--- a/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
+++ b/Documentation/devicetree/bindings/regulator/active-semi,act8945a.yaml
@@ -9,6 +9,9 @@ title: Active-semi ACT8945a regulator
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: active-semi,act8945a
@@ -16,12 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller:
-    description:
-      Indicates that the ACT8945a is responsible for powering OFF
-      the system.
-    type: boolean
-
   active-semi,vsel-high:
     description:
       Indicates the VSEL pin is high. If this property is missing,
@@ -127,7 +124,7 @@ properties:
       - active-semi,chglev-gpios
       - active-semi,lbo-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - reg

-- 
2.37.1


