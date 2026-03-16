Return-Path: <linux-rtc+bounces-6205-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HapF/wYuGn/YwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6205-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:51:40 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A329BB76
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 311B0304A6FF
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 14:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE702E7185;
	Mon, 16 Mar 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SGJINcix"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BD09460;
	Mon, 16 Mar 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672382; cv=fail; b=E+YUWdJbUtUNWzoVgDg6de5S06AhdPStRiSU2m26GFIJZx+1nlkmKPWWbUwVPEeKijj/mdAfkPjQhbkx9EsYDg4+80ZjYT44ejV3nbdsFhGfNGAeY1nyxL4T/jTJoXxsQWzk4oC6Wn4+YwXSdWbM3dzHL60TJDQx01To+5kv4t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672382; c=relaxed/simple;
	bh=MqHAD5JkWhUKxNthXWukd5yK2hMf58GP8lwufSkyEu8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HXh2LK7NcPFJMIwvvsMeKu5rbNxDI6IHDyI/l4sRlkcUQbOn844jI6QhlpYyZ4qdHtOr6y1anEENgBZjBC1i3tnLP3g+Jas31J8jYz+nhWjoSCi8CnXT7lvpkqYVJNPMDxd8FAivhdqsYNVwzbjshVPzADquyx8XaAM1QVL+FVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SGJINcix; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5ngDvKApDHJTa+2G0ghSna2JY9KIbYn+y2rIhGfwCO85rigQZ4v2ztIpQpkC8vXcYOgWthLcTophN44OHjSvJKa/q3Yv50IMxWUzQ+OYFgQszp20cKZvRrr8oHYhzQB8XH7q60X3P4e62V2kF4B5uCJryuvME7aiLbEhsT+oobEGig3i75WytVKYwHOjdu/0O3HQ542KI0yB9Mn6XzmzmR4wzJ0UmuXys5E+bawwJpL59L+1Z5Wj8YIZNAjDsu2Pi8nmP9OKVBnRunoeLOvTFGoClEge6fDysY2RGNJrJbtME76qhE+Zp/kJA8dzD9LDcbWp4c5RyekoJQJp+Z8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDLQt1VrjLnwWeruoLBjmJG1S8OATSfvQJp6P6yNuEI=;
 b=TzmyUaE+QqA/OmNG1hgYyg0bTiu5RU/JBkem9O4MqBq0octiEgaPST1YMb/K8APN/0JJ4FSdFKVOyXPvpguhMNEMW7PzrlJASA/B6loRKxY86k1dBpQpZJf/nvU8FskFbN2vJ3b5iBpkf9G/cFOcUijfXM9b3PTxZUIpYsM6KexYtx5O2ZjqKesxL0QZYCGR+D0sUUP/DZM2nyiq9rSo7CClK/mVwQPxAfBLdJn+vWQj815u9LqNylHhp+HWKQtrGeZ2SMxIaOY4VQMSiUY3FKoSxNSfwxnYA75Sq+Qw+7imXdlQ/AAYMjMyfNxVyZNc5zJqPv011kNx93SRV4wRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDLQt1VrjLnwWeruoLBjmJG1S8OATSfvQJp6P6yNuEI=;
 b=SGJINcixF/GsBLaJpAEaYI9CBR85Zjvwj9P4dtsI/XHY5LHWdi4bewb2GB+h2AkR5ECXsVQVptQ89lk907efd5HKDRK76frcY0OOPurNLNeShnWJmkWkmQZ4csYs3SxGjfqe6UbyzU82jCjjrJv126k+tEaoHf7LyEUSoTWI7VFUZt3wzCfKDNceEDwyjJc0ICW9Uw/F91B57hd9oTb6DVgA5PsBTVRFXM8Pko3gIM0qt3ZHnjpkPRR1koBaTCC9+/h4FBtjJk6R0CLLy5baz4YGDVBEc6zNWW3yI0aEaQYVTz0eaM9vlk7EjwBPMLiouRdGLE5u5ScGswbRjZX7uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9909.eurprd04.prod.outlook.com (2603:10a6:102:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:46:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 14:46:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 00/15] Convert power-controller to dt-schema and update
 various yaml file to referencing it
Date: Mon, 16 Mar 2026 22:47:35 +0800
Message-Id: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcYuGkC/x2MywqAIBAAfyX2nKBmBv1KdOix1YJorFGB+O9Jt
 5nDTIKITBihrxIw3hQp+CKqrmA5Jr+joLU4aKmtbJQRZ3iQxRL8xcG5gq1d7Ww6bZSxULKTcaP
 3Xw5jzh/JHU/NYgAAAA==
X-Change-ID: 20260314-power-controller-56d6b4724146
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9909:EE_
X-MS-Office365-Filtering-Correlation-Id: 525c7252-aaf1-4afe-1295-08de836ac6f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|52116014|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hPItXkQULlzlYLfRRe+0pOoo9RQR3pB/sAJDLi57LokgggTxVZcHHYumc1FWfAfbyZKRG3NW3tfJpB5T97+bC0BRgrYCwB65FRhShnohZAEHKFTN1IdfMPgqCB8OmEsjYVYrjt/7huaGvpVlG2gRkTuuazEmvLlYpJOlHSDjvtMfIpln81yhEmO0GVNGz1CBo8rozIz8A7YzfNmj19JIWvGjO7E+bb814t+TKC9w2vCHVLwg5i5svidH7V5EboL3dxjKUh2ciaPYHvf+u4BoxwkesmGORBRMSZDTHLLQfxK8C/pxQV/Ym9hNi77MxoYWQ62d9y5mDq1CXFU+IFJfdN3dgJocVzelGwEC+kfTni8Y8X/NmxK1/8tIrSbhnlglShHs00tGyCIGo7kPXE4ckF6xfi+QWPG4mVmJ4z6G7K0zrAMQg1TYXqZ/HvMd0X4SuYnJtqlESAekax9GIXrk4dU3eL650I0hqu5OYZZTFLa6Aa9kFRbuuqkKa7zyFIj89xmHAZSPkSNVxq354bdPB8XNIRSLdvigR7pF0fO7ADLwRyMqm4Qk/LRDCW9YjtGlevfd4Ns0HAY9FeUIYrz/1pSnaLQoR8JlyKy+OXeUhyG7L6nzh91ic22TRw+sVTeNZW90fW8l0ZslLnF9tpCVYMM2A/jCs2z9XrDAQ6lZYcOdZFIwjj3VU8l3YbmCUxV4/qUHtXTDRaqLZyFMVLL78k5eh4H3v44PlCdPJFSpP5epQ+WXMyW2zuJ43XB2yuFaygygMhhjaMSJ3bsnofAIPQqcDsVp74ikUZub9YJXbe+GoleaekbtSSMJEDAwMlyz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(52116014)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1N6ZXBYK054d014VmIrZXkxMldRMURTV2F2T05rUlJqNUUyNDF6b1FLTDVD?=
 =?utf-8?B?dkdSRHdhZmJKVCt3dmFsQVJYTzNVOTFhTzFJc3BKcEw4Q2lsT0tYTUxEdjdt?=
 =?utf-8?B?dlAzNitnejk2bFRDM2hQOEVuSmxCVm9wSFNVOHZOckF1NVN2L3F2MllwSlJZ?=
 =?utf-8?B?dXZlbnNTUWVmNW1jbEg2M1hhQmZKcU4vQ09aeDVJUWZ6Yno3TkJPdnhRcjcy?=
 =?utf-8?B?UXdocVB6Q0xiWUl6RngzKytHSEN3N1d2cXMvR1EvT1ppUWZsNHR6cnFzRS9T?=
 =?utf-8?B?c3RnL0c2eFRsQm9LZWNPeUVuOE9oY3hhK1VvdzBmbEZuaGJUNldjRHJDZEtY?=
 =?utf-8?B?R3pCYWtLaFNZcXFiUTB3bHFPdDByMldXa0tRMVRkWVllc091MDZIMHJkM2lO?=
 =?utf-8?B?ZnBySnBpc3F5a2k4Z3ljcEh0MjNxekFwam1uKzFVaE1EZjRWV2t6NFoxNGdX?=
 =?utf-8?B?UGluOVJ0ZXlaRnNyVng0UEtPb1dQR3lBSm5rMG9pSlkvNHdhTG8vVGk5UVh3?=
 =?utf-8?B?ZUlMNkI0Zkk0T0NNczVidnFQNE1yQ2xMSnJiaVRISE5BMkp3WGkxbkxVc2hF?=
 =?utf-8?B?bVZxQTA1c3lEaVUrNGFweC9nbU82ZlBibDB1N1o4V0hKOTNiUVpNYlgzb2lo?=
 =?utf-8?B?blNnbjJHV3BnU1dxalh0TlJZTG9hSElWaGRsOUlKdlk3dXNHdDEvYlRjRXdE?=
 =?utf-8?B?a3pkaUxnNGU1blk0SFU3QTVTTEd2RitET2RQY3pUa01mUncrdzhPcUxpdmJm?=
 =?utf-8?B?U2M5RGtGMHhGVkRLSkV6TVNraXAzZllGV3prRjFWekpDdTJnalRzVXV5aU4z?=
 =?utf-8?B?R2lJdmV6enAwbjhCNFpNM251TjhpL2NSdERnRm1QWmdrV3pXcFZLOTZOYmNZ?=
 =?utf-8?B?elVGSllDalFhUWVRRmJWSE1lY2JtNlQrcWtPSHJXSHpKNklhL05DZlZaQVRB?=
 =?utf-8?B?cHFwMXhGandDQ2owWHVoN0pNemhuTjkzSVZmTzliQlQxelBYU3VqQjdsZU1h?=
 =?utf-8?B?ejZYbWo2WXJUdE14WTJUbldwOGk0QlcwNmJvY0JaYU11dG95NUxmNFVWVGR2?=
 =?utf-8?B?SWQ4Q01UVWlESll4QkJ0RGpBOTdLZ3hTWkJXZUkyQk9HYmdKLzVxLzlyT3Yv?=
 =?utf-8?B?Qmt5Yy9QblhIYW5hM1BBU0RSY091dVE1VHkwcGRaL09YZGJBYXVValhTQ3Jj?=
 =?utf-8?B?SmNGTWxPRTdpZHo2S1V3RjhQVFBXejRyZFhTRzc4SVp2ZHYvS2tlRkQ4MTNT?=
 =?utf-8?B?bEU5ZEZxcWdiV1BZSFQ3VVkzVU9COWRGeFlKL2tobTFkTTFHaHJRVExWbkRO?=
 =?utf-8?B?YXFGZWlBZXJLOVRqOWRIbVhwKzlTTkdLVzBZbElNVWN6SzlJZVM2eU9UbTdG?=
 =?utf-8?B?eEUvZlBUalhML1VLWWVTa3RyOUM4Y0NJK2h1dTBOZ3VmQlFmSVlJcjg3c0lB?=
 =?utf-8?B?Q2FTb0FYS2h5UWJ3UXdaQWMwYVFHT3NlNU5FblMwUklZUk8yYXFtNFNYc1Rh?=
 =?utf-8?B?N2JUZE1zYk9hbjh0NDIyWEZxaDdRdk4zS0l1K2FWaXlUeTlkaTd2aEk1UkFN?=
 =?utf-8?B?MURNM2pEU0t2bys1ZkpVRU1wbGNjdmwvZnJpNnp1OTZibzhKWkc5cDdHQmJ3?=
 =?utf-8?B?UFFaNXdtSEdnSDJHREJzWnFvNHl1dm5sQlQwM3J1WlJXYWc3NEF2NFhYdFJk?=
 =?utf-8?B?M0pUbVQ1WjhPOW8yaGNSM20wQytOSTVmWkQ2aS9nSmJoWitTTEM5Y2FHa3o2?=
 =?utf-8?B?cXdEN21MOXkvcGRidlREY1p4em5Zb0I3aEwwSDlwNVVReUFheHhjdE1yWnVR?=
 =?utf-8?B?clBjWlFZWnBhTFRhNStsTmZBMUZ5M21SRm5vc3Vmb2gwOGp5UGpFL0sveFVC?=
 =?utf-8?B?T2JkaTlIZllLMjA3cm04T3dxNmFaY0dZSkVoaExUaVozdHFzUjlkTmx0K25X?=
 =?utf-8?B?NFNvWGtGSmVDM1lKV0VPWWg1TmV1bHJoMWFKczd0NUhlV1h3VWFBKysrVEZz?=
 =?utf-8?B?ZFRINFVCcGgzOURleVZuY0xJbGVnTUtBMURLcnlPVEVNWmpUUmhRRFpFYnhJ?=
 =?utf-8?B?UXhyWFJtWkNXejhqMHRmbllPelg5SmtmMXAxN203OExwU3pIZVN4Y285YWhG?=
 =?utf-8?B?QTF4TUxBUEg2VHBQajZZNldyUERpOTgyaStGYzRpNS9DdnVXanVFTWNHVFJm?=
 =?utf-8?B?QzN4dmR3SWo5cTBHMDkrNURidTUwcjhvYkM4b0NrZmtYYmthWmJzMEtwdkRI?=
 =?utf-8?B?ejljRUR5LzdDZmYra2MvR1N5OXNLdnloa2ZiSC9WczVpcUx5QXRIT2Zod2tU?=
 =?utf-8?B?VmVSdW92dUEvVEEwWDZBYlFuY0tCdWs2Ykt1cGRqTTl2TzgxanRkdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525c7252-aaf1-4afe-1295-08de836ac6f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:46:16.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l03xJAY92FLOqEbD0dwuxr4ubGYYZt83V7t8ixDU+ODL6K61uUk6viu+oggv1Kx/KUbvJT/Y9nJ7TLD7yr4svw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9909
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
	TAGGED_FROM(0.00)[bounces-6205-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: BC8A329BB76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert power-controller.txt to dt-schema
Update various dt-bindings to use generic power-controller.yaml without
defining local property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (15):
      dt-bindings: power: power-controller: Convert to yaml format
      dt-bindings: soc: bcm2835-pm: Use generic power-controller schema
      dt-bindings: regulator: ti,tps65219: Use generic power-controller schema
      dt-bindings: regulator: act8x: Use generic power-controller schema
      dt-bindings: rtc: ingenic,rtc: Use generic power-controller schema
      dt-bindings: mfd: ene-kb[3]930: Use generic power-controller schema
      dt-bindings: mfd: ti,tps65910: Use generic power-controller schema
      dt-bindings: mfd: rockchip,rk8x: Use generic power-controller schema
      dt-bindings: mfd: ricoh,rn5t618: Use generic power-controller schema
      dt-bindings: mfd: netronix,ntxec: Use generic power-controller schema
      dt-bindings: mfd: ti,twl: Use generic power-controller schema
      dt-bindings: mfd: ti,tps6594: Use generic power-controller schema
      dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-controller schema
      dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller schema
      dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic power-controller schema

 .../devicetree/bindings/mfd/ene-kb3930.yaml        |  7 ++---
 .../devicetree/bindings/mfd/ene-kb930.yaml         |  6 ++---
 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml       |  5 ++--
 .../devicetree/bindings/mfd/netronix,ntxec.yaml    |  9 +++----
 .../devicetree/bindings/mfd/ricoh,rn5t618.yaml     |  8 ++----
 .../devicetree/bindings/mfd/rockchip,rk801.yaml    | 10 +++-----
 .../devicetree/bindings/mfd/rockchip,rk805.yaml    |  7 +++--
 .../devicetree/bindings/mfd/rockchip,rk806.yaml    |  3 +--
 .../devicetree/bindings/mfd/rockchip,rk808.yaml    |  9 ++++---
 .../devicetree/bindings/mfd/rockchip,rk816.yaml    | 10 +++-----
 .../devicetree/bindings/mfd/rockchip,rk817.yaml    |  5 ++--
 .../devicetree/bindings/mfd/rockchip,rk818.yaml    |  9 ++++---
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml |  7 ++---
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         |  7 ++---
 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  6 +++--
 .../devicetree/bindings/mfd/ti,tps6594.yaml        |  7 ++---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml  |  3 +--
 .../devicetree/bindings/power/power-controller.txt | 17 ------------
 .../bindings/power/power-controller.yaml           | 30 ++++++++++++++++++++++
 .../bindings/regulator/active-semi,act8600.yaml    | 11 +++-----
 .../bindings/regulator/active-semi,act8846.yaml    | 11 +++-----
 .../bindings/regulator/active-semi,act8865.yaml    | 11 +++-----
 .../bindings/regulator/active-semi,act8945a.yaml   | 11 +++-----
 .../devicetree/bindings/regulator/ti,tps65219.yaml |  8 ++----
 .../devicetree/bindings/rtc/ingenic,rtc.yaml       |  7 +----
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml          |  6 ++---
 26 files changed, 107 insertions(+), 123 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260314-power-controller-56d6b4724146

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


