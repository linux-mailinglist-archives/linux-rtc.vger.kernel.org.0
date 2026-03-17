Return-Path: <linux-rtc+bounces-6229-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMIGCRfquGmMlgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6229-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 06:43:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A42A40F4
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 06:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21B7630175C8
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 05:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9530C366828;
	Tue, 17 Mar 2026 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nDYSDtlz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4441F29D287;
	Tue, 17 Mar 2026 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726227; cv=fail; b=idHNNQwS7D+yGHfovRpHwNF6vuiCEBYOWP03fZqTIK7jIS+Ch98W2eTAELbEEQykboqASP7H1IRNZxXLO1w4n9ePxgv4ORN3ZxR2EGgTwuF5WG9Jy8LXAG7mQZ2rtwW+MEt0TrSUi64bGdrKdx9HEZ4s+XxVEoT7qLk1hpyMmOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726227; c=relaxed/simple;
	bh=xfkkpwRXPY2606ZJIjYOHluTAEQRTV92ck0tjoI5ia8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KztS6RerM8tOmcVQtUw7yj85WRPPIAhDPfR1tc4CsKJuy1r0fpMaKte+BTgx2tFfN1K6n3cAHJZXdhmXeeiWPfFGA8SEYt098oRUHvzkd0XZd+Yus5w1LSilVhY6LAP7fzE9jgLWIrni53GukbXI+Jh2QN8cLzYSmYeQUYw42k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nDYSDtlz; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAJMDkqjp7aq1VIpnaqx6B1LdgJwm2vs3t6k+9jHU8SWh/V3kco0CERQzqUOhFAssUxjyAY1lLV+WA+DDo2wFIt7ILDUYmm2PxJosymDVTF64hBAUzx9XpY996KlN5TNe+QOaX3tQeW6ByYAQAFsI13wgftgbf5XA+/Jx5mKqA3UZUxGHTHst2zPod2K8XUp1h1zaShS7wh8F1b8MEVeBOPNN5B96MBUfEbOBHH2wDhuOKeX9MxPaKZ0qJ5eIDQdwrI8fBFC93077nkF0ZX/FjIQhzLDJSdz0A9rxK5zbkqpQmbojqVNZVbKf2p+gNzQBqcwK+ucxZMc960HaBtbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3wW+mEIbWLg2+crk/OQdVurPAquWFO4CgtUPerFlBQ=;
 b=fRl257c8QZr4qmOYnlzRGAsq31Pqaj3BFuyQhNLHoXLbRnVnNBhFk2H/bd2jM3rpxvcgi0Akzz0LdSat5F5wtQ0TesVFC/UWRzEasft0N9jqIlN4tDcNzT9ULEs4GDx39/JbhuilXYTnxFar4mZFE4u/jSA4je2cEW+eHU64Q1xUMuK23SiCj+dOEDTcnePSL9YFAjBNBZgv5QRrZx8Iv7rhaREKQrTB0IvjE8DEZioyAu0f9gyb5zWUdfyuOMEy0WgayWWj+Gf2KV4eo47ZzzmUkazEMG80PlRzYiEIonH/HFXI7/vJUZ+WKKdOvUT5/AZ6A4k4EDgdiR3V74VqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3wW+mEIbWLg2+crk/OQdVurPAquWFO4CgtUPerFlBQ=;
 b=nDYSDtlzjc5F1iiq4O65zsZaegmx+778M/ww0HYpCB7qmP9jbGifaetQXP7xCKSxqEPC+Egqwb4SkF+MvhanWCvuL0RikVq4gYegx+ta24A+T8VNKETvmqs9IlAPyzF62EnxCFh2AONZT9P2ppB7aQmXWV+nYI71qjWyU5HPGVhagfAALdeqgcUmro2rJIk4xGNy3bc8VMi3qB8kFP/Yz0HtRGutWZ+rQBAbERx/M0E6nV8HC/EuAgM11XUufmratYnn4YBWAZNgQUmBqR42vAk7c3YxNUXAgVtDQLSo3VXE7tlWlWAqZDZjLoD8pEe29xl+nhFTxUQfhQlCn5Ra2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 05:43:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 05:43:40 +0000
Date: Tue, 17 Mar 2026 13:45:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/15] Convert power-controller to dt-schema and update
 various yaml file to referencing it
Message-ID: <abjqhZh0CpVTNGsW@shlinux89>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <f329f1b4-787e-4c8c-ba26-e419a047023b@sirena.org.uk>
 <20260316170034.31bee485@kemnade.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316170034.31bee485@kemnade.info>
X-ClientProxiedBy: SG2PR03CA0088.apcprd03.prod.outlook.com
 (2603:1096:4:7c::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae5dc1f-0f8c-405d-6896-08de83e824b6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	nyLNM6JUwC0ro5BuRcdQjPVQuHeWqx5MhPNFmoic3tAGMEB242JerUCuMqRF6iDieZEAU2EQcAJrh3EnkYzIvpEmppzDFpdu34q4qsKqssmy6twE0iHdtI6wIrj7PdQ3zKZcF4oxt4nCkIGxNqdKp63U53VGH2IgMmfona88JB5pdlWcDjJNiKmAyznoH1IC1Ks2hD8UqPfYdIG/0i/qOQWD8QD8NP5but1kMNWkJHoNhXXcGgmCPWUkx46cPdP2dzqwsD3WStq+C3Hezgpazjy6FtBpESEzLUqdYPiI+QkhtamqQ+6robn9t5eEf4yyscKPm9eCqaUeVgmOBt2ampPZhIRbXfaAd+NueXOVkzdhL5qjyObDml8XkbIuytMpBw/l3YNQzY/nWq0UPHSKuGIIhbCyjClpbIkleJeaJ7OAcVhGtN9ukFb9nCThgjBkRbn7BE+yPkAVdJClsgtGdBgwxc/l8n6+ms8tK4YuUQ/e6BLUJU39RYDSTWdilIGIgQ2gRYjRXCFqtJlqJ3yQbCraxOB9PffIhVkaVbLiLyo7o1sKCcBIdOqsVcmINFsgt0sVsjaYvJO1SN8JiyXr5KoT43gO/JiYDhbIBEQI8rRiJNl0hQuHSsKsRSXQ9cAuCe5+Jah/QaAFYqtl9Z0CtB1c1lNsR0piWDm0ylhKzKEsbHo8k/konGkvbBDlOUmCpz8Jnv5BWjhJjXR5fsrZTcTA4T/wCZneBXo8RGW2vvFcbPWeGnZTSblkMOhNolLYLs/WzkiNccVwjbXslcZ4idspG2EZ57Bf8v81APrIEOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fx/UgCKEUsXgr806srW/Vi2lra8ymUV2G24bH+igwJvUNYy3DHmHus4hevD0?=
 =?us-ascii?Q?m21e/lLGjslo1a0R/vU1jT0nzgjZ2e2YhOW4vjYN77RR2H00xpztV/R9yUPa?=
 =?us-ascii?Q?NhAsH+EogQ+VcpzPlOrTvjDHDYLcsi/idtgQAVsNb4pvzTA/AhPHSCMXORy6?=
 =?us-ascii?Q?NZkEn5y5gmBiTyqzllVHAi0t1IpghuCUtM8F0ovk1dHAH0IdBDc1pDVqjj8r?=
 =?us-ascii?Q?d+JVuTqqaBmxREbE7oQVO9KUEAGOrlElhjA+W5ZL0jEqGF+rMIGDC6aG2eON?=
 =?us-ascii?Q?Z9JYAi2PeXq9FbC+hC1OcfPWcLO/Nnyjp9PUzeqdWyTrLmErlOWkMZdRjneC?=
 =?us-ascii?Q?bFWJc+bxocojOyTKtOyFBQBTrNPNhKrfm9z55OkxOu8k4MOWTuYdK/TR1KuV?=
 =?us-ascii?Q?L8mwpQtTorQNaRY1aflE3yFXUJMJHTizYu6jiB3R6h/0+v/2YCJrUwBB4lGm?=
 =?us-ascii?Q?b58azCGeZPR+xt2QlBdO0+tyc2Zm8AJN1atTkVy/g6bW4lzHyAHXjONM53GL?=
 =?us-ascii?Q?eXtDu2Kp06bG9QgfMnddTdHiU8uO8SRM03InVbeNk4k0TSQcBgNXx4qrZa7I?=
 =?us-ascii?Q?NN22MR658K6O4OkQNI9eI45mjafI4WOcJ1s4bW8MnornNcVI19XjdNY+gNBa?=
 =?us-ascii?Q?b702gDDQc5e6P30aDCgF2wEUofJpEKNJHhi1BKmhHFvEGU5+IKk1DPuqCkTV?=
 =?us-ascii?Q?cmLHdq7HDln6E4GIcxMLoSrh5DGom9yoyXsS4Vb2Yju8NcMDDBDTbcvF0GM2?=
 =?us-ascii?Q?Cj/0yqCrBmlW/N6ylse9kRZKDb8Z1egAYGxk9AhGrTNbM4I9HXSdtobm94di?=
 =?us-ascii?Q?8UbtOvZ9Wus7rwUB2EGVBtOuu5dh9N1x/lxMCXotoJDqSnbO5Jzkj7AKuXLj?=
 =?us-ascii?Q?GZ3hbwjb9R8oTE+i9m0p20ENyCG3TAeSULuYM92Za3misjlQAPiOO9cIn6N8?=
 =?us-ascii?Q?Qqy6TG9R6GaRaRWrx/V/0h6d3VTiMp+xyEvY3ehLY1QWPcqk1+On7OEqiftN?=
 =?us-ascii?Q?D0BiESWsLxCT6LiVKgWqM2v15Dja8cCdO4Os1qEj0G9azSY90Iu2pRL+dhVJ?=
 =?us-ascii?Q?1XN97YelhQYlx6BrpqxfLR6ISdpPIXrgMONmQ+sd8xjMbokxsv39QqKzzd1V?=
 =?us-ascii?Q?p+iHC2pStDVPjFKEYr24lYc+M0AQpmcJFh7CnhXnP8EwStscnJeO7hNluJXc?=
 =?us-ascii?Q?4SOwZlwMElx07nO4FrjwnZwH+xo2d6no4HZI02eo3HTXzOLEe8c/KCFxRCVJ?=
 =?us-ascii?Q?u9CvgPBNQe+8xlRCCqZ2SE0+c2LY+gRLya4eeTNw/V1GmOpI7DQlT4k5fu1i?=
 =?us-ascii?Q?kSETtD/16HYQflaOIfmnjmVQXEb4nj+ivkad2BUBwL6EzM2yTxSd9oNZzukG?=
 =?us-ascii?Q?Bb3HU+H6kHwClqlD4HT2EmpYFYyK/MbpnGviYTgMqPlYyBny5+ONV07f3+qy?=
 =?us-ascii?Q?JT9+7nLER3ShI+++QiL+xuocIVhYgymSb8dbe9DbPHcGqEw7uAFPjGwAgG8O?=
 =?us-ascii?Q?Z6arFZ29ARPTDjkDw5LRn3dE5qNr1OFt4u8RjCUvVfzAZCcFhowiXw56Uv7x?=
 =?us-ascii?Q?Krt5WZ3PhM/mx3sT/l7MZHh7uvDC6HMEUpmxl7Z9q7QwuOzpt8QNpvlZGU79?=
 =?us-ascii?Q?az7KKpXLaMK3qYgNiA4z7nVadRtasQ4QIcbT0r13fOc7gEIL6tvz+g1L57aO?=
 =?us-ascii?Q?fKyNbjfNUI8nD7Qpp21GGelwyuwaGFHRDvOfjGBOUymKPuzTc31/pnhuSbz1?=
 =?us-ascii?Q?DH17AhYi7A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae5dc1f-0f8c-405d-6896-08de83e824b6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:43:40.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjdJ7IWLYUrVWSLxmx0LEdQDScUDEjGHYivKTqdhretQK63QPfq2omPzlVNHa8CAkQnA2GVhMXFqmZ4Ad3GsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6229-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,broadcom.com,gmail.com,ti.com,baylibre.com,crapouillou.net,bootlin.com,sntech.de,rock-chips.com,collabora.com,gmx.net,v3.sk,blala.de,vger.kernel.org,lists.infradead.org,nxp.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: BC3A42A40F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:00:34PM +0100, Andreas Kemnade wrote:
>On Mon, 16 Mar 2026 14:55:21 +0000
>Mark Brown <broonie@kernel.org> wrote:
>
>> On Mon, Mar 16, 2026 at 10:47:35PM +0800, Peng Fan (OSS) wrote:
>> > Convert power-controller.txt to dt-schema
>> > Update various dt-bindings to use generic power-controller.yaml without
>> > defining local property.  
>> 
>> Are there any dependencies here?  It doesn't look like it.  In general
>> please don't send a single series covering multiple subsystems unless
>> there are actual dependencies, it just makes it harder to figure out how
>> to handle things.  Send a separate series to each subsystem instead.
>
>It seems that everything depends on Patch 1.

Krzysztof had similar comments. I reply here.

Yes, depends on patch 1, sorry for not being clear in cover-letter. I just
created a PR to dt-schema in github.
https://github.com/devicetree-org/dt-schema/pull/187

After that PR is merged, I will separate this patchset for each subsystem.

Thanks,
Peng

>
>Regards,
>Andreas
>

