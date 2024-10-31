Return-Path: <linux-rtc+bounces-2403-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 127639B809D
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 17:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F731F22156
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 16:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2071BCA01;
	Thu, 31 Oct 2024 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a8m1SAVA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA691A0B00;
	Thu, 31 Oct 2024 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393552; cv=fail; b=uFIXtFQf10qZv22s8c9RR7bG1Ev+rjH78vpwTj7WFCeNYk804NATr4qxzDMgFaDAwQxjSfwBbLwzJUkuzL0i70Pn44En7MzVK+/s6NmNXqEREzCnCgE4+F8NGAYM6WexYJJ//1qVASvaOHH62iqoqTH/Rp56F3kukG5GNTsCIG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393552; c=relaxed/simple;
	bh=HMXCGR8nyNsx6pqxPCH9Kg2d+cVpNeXDfDy0DtHtjGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fT2DA91p3q6xtjX90le0f+JuVPRoLGTFmQGS/P41ymVzC1Y+bJ6W3eRuwfhQu3Ap2J0gK2NyndkW92Ak1q9SVl6GgdKTQj4RdeEevneHRvqUUh1p0Oam+VzDt32626EVtNemKN8jaLyLB/wxxloro4Yu3Qix1F6JHGUYZqVq1eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a8m1SAVA; arc=fail smtp.client-ip=52.101.67.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUGP/NJDXjigjSRf/khi/uc159UIqSdyv7V0C1kALxyd4MtGwM0bIR4+KqX/3/NtzoI8gvtWRY+ohWsJcFlIlTPiri0aTt9CHbb0dYxj/8YDiV6LNCfj9q9c1llathbIJJhu5qUBL0R/mfa8vJUqb97I0K6SFy9YhKQ40OLI8ikY8v+3tuyrWXMP5QO/soOmOBwcFHhIBagrPPxBupr1sjw0LUrWb4m/Vwgoke8R4NjYH/cxvxN4aa/N6eiKrYyHfpRF8/oJ7uUq1o0SWRSSkPmmnb1k6cMeKB59Kz18LnJsPzeoKsDuRBJECyTC4gI5YihyeMX0ChVmorYMzAhnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nzHsMhSjDv8J9JFj5TA3gvgvUKJTcI43A/sk9rLZrQ=;
 b=jk/Tv+KOwis0kcfMc7+oNQKf8VWERQuhFi/0nIElBDS6jjugpF884mkNN7M9qn/BBvjkASZARZlEfzmSRIdt5k0sagZ74xKmvmdg2KgY8/+av/3uSndueQCBCXjyL5e8+vhUryxHUDMOOHWpeNvaHsha/B6VyFF5PmMnfIT7bEs61jCIL/8GeBD9hXQ6oXU+8Zj9tX/MVFv4kNOkpdnnzYk6lFIaksbbzVaQXqZawGVsdWS+I4AnkVhDJrDmtnNtQGu0K5PKCJYoaG/d3lFhEj4aUmbnmYcwgdPkQbpqPGk7rizm5KNDPzeNISNMR6mmOBh/6xyYKKR2wx+TmMrVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nzHsMhSjDv8J9JFj5TA3gvgvUKJTcI43A/sk9rLZrQ=;
 b=a8m1SAVAydi3u0zGDHL9OHTfp5oGrHGGVF//R8+5eOC0OEoTvvOgp6mDYTegsBgUSs0IbkwWxGNGBTvfBZz0koYtuROqTZAqe00kaU12ZrrtQGX5ebYCwm+oqbCiVHMYP4zmZnV31uyLEepsEKSU+t2JGyjDahaWdYwnpdWL/T52BT6HLRh/1/mkZ91GFKfQVBEGZooV0H8Gt7N7VGaBcmBDCHelGxELZbnnix5K+tHxOZLB9pZ5TqW6QcM1UO/6pmTUCVk2C0CLonVJOnlEqGUeTHnodGRQJvcUNLqQTiGIj4MeHvmi1zunNQHBPTevYCsoudWKDxf5+E2j8TJuOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:52:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:52:23 +0000
Date: Thu, 31 Oct 2024 12:52:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v3 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <ZyO1vju0l522+oSB@lizhi-Precision-Tower-5810>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce9b9a4-fbc9-42b5-b16f-08dcf9cc6429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EDL6Wh+OJiSPu83wjjEVb9ufpsAa3QH4X6/VKCycEo2uSk5JM++TTO5mgotN?=
 =?us-ascii?Q?XWY3t8IBHZtXwiAEHBBfm7O6EnL/fXYx5BD5memaiU6GmxiONDgj31fI9Io6?=
 =?us-ascii?Q?e7WYywHT+p+/qqcnuUaggBOOUVxkBYuHHNBKaTRcWGk6MCNMg6yQ7kGntlrN?=
 =?us-ascii?Q?pKxx5TXkabfvSdQ99caoKp38Xow256DeGNBuLSbUpBR2VJjfyQObtFSD+Jyr?=
 =?us-ascii?Q?+jyotgqifByeRbm4VnTc/gzw2/unTiNUyIJd/MP8ELZlm+R06KkDaIbN9W+4?=
 =?us-ascii?Q?EbACjElhxfTIkJbnoB9hqI4PFCE9nvmAyC5H7JfsGfGiGBtgwFAKCtHgrrGF?=
 =?us-ascii?Q?zjr/NEOnG/XzOPQjogYNsM0RjXL1/UhSM+H0lvSbGLFC/l0P9ozcZxlu2cjd?=
 =?us-ascii?Q?TZPDYZzv16WmqySgVySCip3aYop9v57gJFPF5JIBetUt3taPL3HZLOQ1N3bm?=
 =?us-ascii?Q?EJ1lIJxPoL6GU1olsGbtkqXnr6GdH7ieJ1wLb5Zi5VxzJ/MhlvWkSAI4RNAg?=
 =?us-ascii?Q?ieF9DN/hfcVPyiSFJRqzjae4K25PrKVoCmOkqFR0cOCP4w0GpwGuykXicPnY?=
 =?us-ascii?Q?fZSSQX/2mzhq6WkZydaD2kswyTZBu1neYLy/TlksP6I0dlm4uW9nqoQLAUh/?=
 =?us-ascii?Q?ESeZ7Ew7ydoeVow4Vi54l8978u8hg0+QGZ0LdlZjy24/ylfVJyZ1o5zGU4L3?=
 =?us-ascii?Q?a/KkdbCqAK7xV+6W3ay2fRb6YK3ImJ+aSxWUWKzpK1UAyzlkjOsPrekRF0xC?=
 =?us-ascii?Q?icIJ1hmZvF6cvFgZFnRKW0J9+cfI+hfgSIoi0CT9+ihmNJqyuK0PNRdcA7PS?=
 =?us-ascii?Q?Iv7zGNUtz9bIhuae9nboxRpjwpFtXc3sklx68xPXAtjCdkXFb2HE0YKuWAHd?=
 =?us-ascii?Q?jm/ZYHWm8z74z7RITKIwfVHe79UllfrXWVoUjJB66WPZd7ARuZd7xNv2v4S+?=
 =?us-ascii?Q?jCwaDCUVeScvxhgJztUaTlUjMmNa6z07g/LHypnMW8sbRzYObg2KCc5myCT3?=
 =?us-ascii?Q?QG01r/aD01Afz5nnrlIfQ/xa7gd/SIxqJP4hVpThlZ2tKnjk1N+4evSEamq/?=
 =?us-ascii?Q?3zuk60itAqk48ICYDG/a8+qtmGrOzs2B8srJM4fbx4NA5yg1CTLbR1tAyzdx?=
 =?us-ascii?Q?LhRZSwOEgQg6c9lVBHEguDv7bTogJkqHhFVE8EtrltKkuQuWCUDLSRIHSchg?=
 =?us-ascii?Q?k1eKx9dWtYbPm+uV+k4gO130pOyvOVE422T6+yHIL50O2i/N5cVPi8Gq1VyC?=
 =?us-ascii?Q?xu6PxEEyU+WXLt4TnY2RaEh4H1exuxpilRq1nRZfjIUiyoGJnGExFmi66E8B?=
 =?us-ascii?Q?PXVoDW/xXqovDK9Y5mauVkouCiOtyVEM5rxLat1nBuRLlzrlX3l4HgGUQ2DO?=
 =?us-ascii?Q?s/VQfeM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KU0qiI9gxbUsnTEhgIYko2B7t6gcwdxhMWk2klrTjPG5d2cfT5+qhR02+1la?=
 =?us-ascii?Q?LHwQh8FgAfThiZXXu+0eb1xFClmLDfYH7eaijp/0ztVQ2hOjxe/tUA/+sDJG?=
 =?us-ascii?Q?ARF8+jO31YXJRBhrYbuw3zw6aPG34BuU0PkuOjPSSBsix3hjxFbPPF3IgaXA?=
 =?us-ascii?Q?lnGh8d4jWIfBkaPp31Wwh7XmdnPe/8GhaaoE0LZMGiibwBR5UXfXecy5M8eC?=
 =?us-ascii?Q?y4b1uFRY1GCptZaklsG8lClUZydDysj2oB0yim3H+X7Lc4zzf90O5xqDvlid?=
 =?us-ascii?Q?DR1bu/70oXVPqaDjXO1jgqq0VNTlKckmNbMbMioCCLMhaV4xyvMiS6Ofpng+?=
 =?us-ascii?Q?gThGd9GwvTk0eNbOsej2lvjDpZYOD0iisq+tN92iC80PdMKQzxmZfRP2U2ES?=
 =?us-ascii?Q?HH+w3fNPQoNcxCUgMQBJ5Ye0UcJ9w4kbQz+gwvyXJzayiF4ce3RrnISSZfzU?=
 =?us-ascii?Q?I/7fgPibEMy9JCEB7yCdQlGvOadabBQbKohD6IPZ6/Dy5qpR4/zTlqvqUQub?=
 =?us-ascii?Q?R2uQMqlCK87YCL+HFi51zTUjaNPSSFvBroEkc9zZvIIW1oMofllATIWn9UEv?=
 =?us-ascii?Q?b7hCbA8eO5grOkTglgmqkgIEuwCNdnw/7csI/pBNv7TV+SnvzMab/RCz8Pu0?=
 =?us-ascii?Q?1feVYLbmMDkemyJJK9UqsQ1mNABfx3cwGPtK0PdUfA5u/NlAvUvhmcpvKmoR?=
 =?us-ascii?Q?0mCln1HBLLbyIVqisROipnXZ5rr5AwZUaQw80F+qwhDx/ELdidxseoZQ/MUX?=
 =?us-ascii?Q?GgtjSX+z1YKBzSdrQmHsLzC/UENXuxLYN0b/teQ1wtVvEmIIKtg3rRTjcZSX?=
 =?us-ascii?Q?rsf6awYVYcjpjipYWqtiTy9vvCyS0bUdNESzCUKJdjgYkrBNTQwvf5SOanch?=
 =?us-ascii?Q?YhiTtKdvCMCs0GutvhEvAbx1/zpxftzoyMcPswOFOFDVRvS9J6AegkvFKJly?=
 =?us-ascii?Q?TY0HkOT6yjg8iXgMfdAs/Hgtntm+F8efGLx2o5wKxb4lslCTKU+GElnxWCoe?=
 =?us-ascii?Q?pQzp15lm8+EYqZWC5lT4xW6gZ9FJBdvvjrXe9YKTi1P/Jrzig83VJKJOx2r3?=
 =?us-ascii?Q?Yn5h4BDewLlL1X+isVnrgZB5uelvA01ASoRJZrCFroQPiPBnB7C2abA+9mSv?=
 =?us-ascii?Q?hE2QydKJ0fjZoY925B6C0kBqMXU4diEO1DJFMNtfBqjhddBeCH6A62nsNaUO?=
 =?us-ascii?Q?o1OoTepAEPyhtUtMpxWHOvIfsHA1jTl8JNqBKYeq6ISp+ZugT1gayuZhpZdy?=
 =?us-ascii?Q?5skoGVpDvO2Gw+P2XBwpOHNH2LLIMGz++moPVdnrEmQsQEf/jTyMLHQAFb78?=
 =?us-ascii?Q?ujdJ5xolKOXPimW5zo2fG8wTVYxv/c3ooWFGLd7hV/BQyB73sBo8W68ITHwN?=
 =?us-ascii?Q?GkTQbPers6v7TsU9TFbEyaxeg3u9Cy6KZdYf3rhplfO04JluKUw40vM3/7xe?=
 =?us-ascii?Q?L2AyBFTvoMqrzNBvXmGzp+Be0J6Rs9wh7C4P4pt8yoi0L1vacnjg3cNP4LGc?=
 =?us-ascii?Q?SHvWcA5Yp1wpz02tj+JbsEs0TgOWcaGotuY8RfaUx6w4fPQa6asyMdUYP/Mf?=
 =?us-ascii?Q?AjDbnaPk6H7kpOznUVPEZyjOtQkMw+las3GuVJmX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce9b9a4-fbc9-42b5-b16f-08dcf9cc6429
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:52:23.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZJ2SHhiqc19le6M/4jCHIS++EeaNGdvcvwJSrxb3c5cdE2SA4nNUsy0qgzV0EaSoMUyv9WJbH15Q0IQSIiKiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

On Thu, Oct 31, 2024 at 10:35:55AM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> The RTC module is used to enable Suspend to RAM (STR) support
> on NXP S32G2/S32G3 SoC based boards.
> RTC tracks clock time during system suspend.
>
> RTC from S32G2/S32G3 is not battery-powered and it is not
> kept alive during system reset.

wrap at 75 chars.

>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 803 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 815 insertions(+)
>  create mode 100644 drivers/rtc/rtc-s32g.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e87c3d74565c..18fc3577f6cd 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>  	  This driver can also be built as a module, if so, the module
>  	  will be called "rtc-ssd20xd".
>
> +config RTC_DRV_S32G
> +	tristate "RTC driver for S32G2/S32G3 SoCs"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	help
> +	  Say yes to enable RTC driver for platforms based on the
> +	  S32G2/S32G3 SoC family.
> +
> +	  This RTC module can be used as a wakeup source.
> +	  Please note that it is not battery-powered.
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 8ee79cb18322..a63d010a753c 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>  obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>  obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> new file mode 100644
> index 000000000000..a05e23ece72a
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -0,0 +1,803 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_irq.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>

order by alphabetical

> +
> +#define RTCC_OFFSET	0x4ul
> +#define RTCS_OFFSET	0x8ul
> +#define RTCCNT_OFFSET	0xCul
> +#define APIVAL_OFFSET	0x10ul
> +#define RTCVAL_OFFSET	0x14ul
> +
> +/* RTCC fields */
> +#define RTCC_CNTEN				BIT(31)
> +#define RTCC_RTCIE_SHIFT		30
> +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
> +#define RTCC_ROVREN				BIT(28)
> +#define RTCC_APIEN				BIT(15)
> +#define RTCC_APIIE				BIT(14)
> +#define RTCC_CLKSEL_OFFSET		12
> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
> +#define RTCC_DIV512EN			BIT(11)
> +#define RTCC_DIV32EN			BIT(10)
> +
> +/* RTCS fields */
> +#define RTCS_RTCF		BIT(29)
> +#define RTCS_INV_RTC		BIT(18)
> +#define RTCS_APIF		BIT(13)
> +#define RTCS_ROVRF		BIT(10)
> +
> +#define ROLLOVER_VAL		GENMASK(31, 0)
> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
> +
> +#define RTC_CLK_MUX_SIZE	4
> +
> +/*
> + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
> + * should not be used.
> + */
> +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
> +
> +#define to_rtcpriv(_hw)	container_of(_hw, struct rtc_priv, clk)
> +
> +enum {
> +	RTC_CLK_SRC0 = 0,

needn't set to 0 here.

> +	RTC_CLK_SRC1,
> +	RTC_CLK_SRC2,
> +	RTC_CLK_SRC3
> +};
> +
> +enum {
> +	DIV1 = 1,
> +	DIV32 = 32,
> +	DIV512 = 512,
> +	DIV512_32 = 16384
> +};
> +
> +struct rtc_time_base {
> +	s64 sec;
> +	u64 cycles;
> +	u64 rollovers;
> +	struct rtc_time tm;
> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	u8 __iomem *rtc_base;

generally it void, not u8

> +	struct clk_hw clk;
> +	struct clk *ipg;
> +	const struct rtc_soc_data *rtc_data;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	u64 rollovers;
> +	int dt_irq_id;
> +	int runtime_src_idx;
> +	int suspend_src_idx;
> +	u32 runtime_div;
> +	u32 suspend_div;
> +};
> +
> +struct rtc_soc_data {
> +	int default_runtime_src_idx;
> +	int default_suspend_src_idx;
> +	u32 default_runtime_div;
> +	u32 default_suspend_div;
> +	u32 quirks;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.default_runtime_src_idx = RTC_CLK_SRC2,
> +	.default_suspend_src_idx = RTC_CLK_MUX_SIZE + RTC_CLK_SRC0,
> +	.default_runtime_div = DIV512,
> +	.default_suspend_div = DIV512,
> +	.quirks = RTC_QUIRK_SRC1_RESERVED,
> +};
> +
> +static int is_src1_reserved(struct rtc_priv *priv)
> +{
> +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
> +}
> +
> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return div_u64(cycles, hz);
> +}
> +
> +/*
> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
> + * current configuration.
> + * @rtcval: The value to go into RTCVAL[RTCVAL]
> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
> + *          twice the rollover interval
> + */

If you want to use kernel doc, comment is /** at first line.

> +static int sec_to_rtcval(const struct rtc_priv *priv,
> +			 unsigned long seconds, u32 *rtcval)
> +{
> +	u32 rtccnt, delta_cnt;
> +	u32 target_cnt = 0;
> +
> +	/* For now, support at most one rollover of the counter */
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
> +		return -EINVAL;
> +
> +	/*
> +	 * RTCCNT is read-only; we must return a value relative to the
> +	 * current value of the counter (and hope we don't linger around
> +	 * too much before we get to enable the interrupt)
> +	 */
> +	delta_cnt = seconds * priv->rtc_hz;
> +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +
> +	if (~rtccnt < delta_cnt)
> +		target_cnt = (delta_cnt - ~rtccnt);
> +	else
> +		target_cnt = rtccnt + delta_cnt;
> +
> +	/*
> +	 * According to RTCVAL register description,
> +	 * its minimum value should be 4.
> +	 */
> +	if (unlikely(target_cnt < 4))
> +		target_cnt = 4;
> +
> +	*rtcval = target_cnt;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t rtc_handler(int irq, void *dev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(dev);
> +	u32 status;
> +
> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
> +	if (status & RTCS_ROVRF) {
> +		if (priv->rollovers == ULONG_MAX)
> +			priv->rollovers = 0;
> +		else
> +			priv->rollovers++;
> +	}
> +
> +	if (status & RTCS_RTCF) {
> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
> +	}
> +
> +	if (status & RTCS_APIF)
> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
> +
> +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int get_time_left(struct device *dev, struct rtc_priv *priv,
> +			 u32 *sec)
> +{
> +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
> +
> +	if (rtcval < rtccnt) {
> +		dev_err(dev, "RTC timer expired before entering suspend\n");
> +		return -EIO;
> +	}
> +
> +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
> +
> +	return 0;
> +}
> +
> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u64 cycles, base_cycles;
> +	u32 counter;
> +	s64 sec;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
> +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
> +
> +	if (cycles < base_cycles)
> +		return -EINVAL;
> +
> +	cycles -= base_cycles;
> +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
> +
> +	return sec;
> +}
> +
> +static int s32g_rtc_read_time(struct device *dev,
> +			      struct rtc_time *tm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	s64 sec;
> +
> +	if (!tm)
> +		return -EINVAL;
> +
> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
> +	if (sec < 0)
> +		return -EINVAL;
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc, sec_left;
> +	s64 sec;
> +
> +	if (!alrm)
> +		return -EINVAL;
> +
> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
> +	if (sec < 0)
> +		return -EINVAL;
> +
> +	rtc_time64_to_tm(sec, &alrm->time);
> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
> +
> +	alrm->pending = 0;
> +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
> +		alrm->pending = !!sec_left;
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 rtcc;
> +
> +	if (!priv->dt_irq_id)
> +		return -EIO;
> +
> +	/*
> +	 * RTCIE cannot be deasserted because it will also disable the
> +	 * rollover interrupt.
> +	 */
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	if (enabled)
> +		rtcc |= RTCC_RTCIE;
> +
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	struct rtc_time time_crt;
> +	long long t_crt, t_alrm;
> +	u32 rtcval, rtcs;
> +	int ret = 0;
> +
> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> +
> +	t_alrm = rtc_tm_to_time64(&alrm->time);
> +
> +	/*
> +	 * Assuming the alarm is being set relative to the same time
> +	 * returned by our s32g_rtc_read_time callback
> +	 */
> +	ret = s32g_rtc_read_time(dev, &time_crt);
> +	if (ret)
> +		return ret;
> +
> +	t_crt = rtc_tm_to_time64(&time_crt);
> +	if (t_alrm <= t_crt) {
> +		dev_warn(dev, "Alarm is set in the past\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> +	if (ret) {
> +		/*
> +		 * Rollover support enables RTC alarm
> +		 * for a maximum timespan of ~3 months.
> +		 */
> +		dev_warn(dev, "Alarm is set too far in the future\n");
> +		return ret;
> +	}
> +
> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret) {
> +		dev_err(dev, "Synchronization failed\n");
> +		return ret;
> +	}
> +
> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_set_time(struct device *dev,
> +			     struct rtc_time *time)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	if (!time)
> +		return -EINVAL;
> +
> +	priv->base.rollovers = priv->rollovers;
> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +	priv->base.sec = rtc_tm_to_time64(time);
> +
> +	return 0;
> +}
> +
> +/*
> + * Disable the 32-bit free running counter.
> + * This allows Clock Source and Divisors selection
> + * to be performed without causing synchronization issues.
> + */
> +static void s32g_rtc_disable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc &= ~RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static void s32g_rtc_enable(struct rtc_priv *priv)
> +{
> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +
> +	rtcc |= RTCC_CNTEN;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int get_div_config(unsigned long req_rate,
> +			  unsigned long prate)
> +{
> +	if (req_rate == prate)
> +		return DIV1;
> +	else if (req_rate == prate / (DIV512 * DIV32))
> +		return DIV512_32;
> +	else if (req_rate == prate / DIV512)
> +		return DIV512;
> +	else if (req_rate == prate / DIV32)
> +		return DIV32;
> +
> +	return 0;
> +}
> +
> +static void adjust_dividers(struct rtc_priv *priv,
> +			    u32 div_val, u32 *reg)
> +{
> +	switch (div_val) {
> +	case DIV512_32:
> +		*reg |= RTCC_DIV512EN;
> +		*reg |= RTCC_DIV32EN;
> +		break;
> +	case DIV512:
> +		*reg |= RTCC_DIV512EN;
> +		break;
> +	case DIV32:
> +		*reg |= RTCC_DIV32EN;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	priv->rtc_hz /= div_val;
> +}
> +
> +static unsigned long get_prate_by_index(struct clk_hw *hw,
> +					u8 index)
> +{
> +	struct clk_hw *parent;
> +
> +	parent = clk_hw_get_parent_by_index(hw, index);
> +	if (!parent)
> +		return -EINVAL;
> +
> +	return clk_hw_get_rate(parent);
> +}
> +
> +static int rtc_clk_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct rtc_priv *priv = to_rtcpriv(hw);
> +	struct device *dev = priv->rdev->dev.parent;
> +	int i, num_parents = clk_hw_get_num_parents(hw);
> +	u32 config;
> +
> +	for (i = 0; i < num_parents; i++) {
> +		config = get_div_config(req->rate, get_prate_by_index(hw, i));
> +		if (config) {
> +			if (i < RTC_CLK_MUX_SIZE)
> +				/* Runtime clk source divisors */
> +				priv->runtime_div = config;
> +			else
> +				/* Suspend clk source divisors */
> +				priv->suspend_div = config;
> +
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(dev, "Failed to determine RTC clock rate\n");
> +	return -EINVAL;
> +}
> +
> +static u8 rtc_clk_get_parent(struct clk_hw *hw)
> +{
> +	struct rtc_priv *priv = to_rtcpriv(hw);
> +
> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
> +		RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
> +}
> +
> +static int rtc_clk_src_switch(struct clk_hw *hw, u8 src)
> +{
> +	struct rtc_priv *priv = to_rtcpriv(hw);
> +	struct device *dev = priv->rdev->dev.parent;
> +	u32 rtcc = 0;
> +
> +	switch (src % RTC_CLK_MUX_SIZE) {
> +	case RTC_CLK_SRC0:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
> +		break;
> +	case RTC_CLK_SRC1:
> +		if (is_src1_reserved(priv))
> +			return -EOPNOTSUPP;
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
> +		break;
> +	case RTC_CLK_SRC2:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
> +		break;
> +	case RTC_CLK_SRC3:
> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
> +		break;
> +	default:
> +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
> +		return -EINVAL;
> +	}
> +
> +	priv->rtc_hz = get_prate_by_index(hw, src);
> +	if (!priv->rtc_hz) {
> +		dev_err(dev, "Failed to get RTC frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	if (src < RTC_CLK_MUX_SIZE)
> +		adjust_dividers(priv, priv->runtime_div, &rtcc);
> +	else
> +		adjust_dividers(priv, priv->suspend_div, &rtcc);
> +
> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
> +	/*
> +	 * Make sure the CNTEN is 0 before we configure
> +	 * the clock source and dividers.
> +	 */
> +	s32g_rtc_disable(priv);
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +	s32g_rtc_enable(priv);
> +
> +	return 0;
> +}
> +
> +static int rtc_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct rtc_priv *priv = to_rtcpriv(hw);
> +
> +	/*
> +	 * 0-3 IDs are Runtime clk sources
> +	 * 4-7 IDs are Suspend clk sources
> +	 */
> +	if (index < RTC_CLK_MUX_SIZE) {
> +		/* Runtime clk source */
> +		priv->runtime_src_idx = index;
> +		return 0;
> +	} else if (index < RTC_CLK_MUX_SIZE * 2) {
> +		/* Suspend clk source */
> +		priv->suspend_src_idx = index;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct rtc_class_ops rtc_ops = {
> +	.read_time = s32g_rtc_read_time,
> +	.set_time = s32g_rtc_set_time,
> +	.read_alarm = s32g_rtc_read_alarm,
> +	.set_alarm = s32g_rtc_set_alarm,
> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
> +};
> +
> +static const struct clk_ops rtc_clk_ops = {
> +	.determine_rate = rtc_clk_determine_rate,
> +	.get_parent = rtc_clk_get_parent,
> +	.set_parent = rtc_clk_set_parent,
> +};
> +
> +static int priv_dts_init(struct rtc_priv *priv, struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	priv->ipg = devm_clk_get(dev, "ipg");
> +	if (IS_ERR(priv->ipg)) {
> +		dev_err(dev, "Failed to get 'ipg' clock\n");
> +		return PTR_ERR(priv->ipg);
> +	}
> +
> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> +	if (priv->dt_irq_id < 0) {
> +		dev_err(dev, "Error reading interrupt # from dts\n");
> +		return priv->dt_irq_id;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_priv *priv;
> +	static const char *parents[RTC_CLK_MUX_SIZE * 2] = {
> +		"rtc_runtime_s0",
> +		"rtc_runtime_s1",
> +		"rtc_runtime_s2",
> +		"rtc_runtime_s3",
> +		"rtc_standby_s0",
> +		"rtc_standby_s1",
> +		"rtc_standby_s2",
> +		"rtc_standby_s3"
> +	};
> +	struct clk_init_data clk_init = {
> +		.name = "rtc_clk",
> +		.ops = &rtc_clk_ops,
> +		.flags = 0,
> +		.parent_names = parents,
> +		.num_parents = ARRAY_SIZE(parents),
> +	};
> +	int ret = 0;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_data = of_device_get_match_data(dev);
> +	if (!priv->rtc_data)
> +		return -ENODEV;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base))
> +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
> +				"Failed to map registers\n");
> +
> +	device_init_wakeup(dev, true);
> +
> +	ret = priv_dts_init(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(priv->ipg);

use devm_clk_* function

> +	if (ret) {
> +		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
> +		return ret;

return dev_err_probe()

> +	}
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev)) {
> +		dev_err(dev, "Failed to allocate RTC device\n");
> +		ret = PTR_ERR(priv->rdev);
> +		goto disable_rtc;

after use devm_clk*

return dev_err_probe()

Frank

> +	}
> +
> +	if (!of_property_present(dev->of_node,
> +				 "assigned-clock-parents")) {
> +		/*
> +		 * If parent clocks are not specified via DT
> +		 * use SoC specific defaults for clock source mux
> +		 * and divisors.
> +		 */
> +		priv->runtime_src_idx = priv->rtc_data->default_runtime_src_idx;
> +		priv->suspend_src_idx = priv->rtc_data->default_suspend_src_idx;
> +		priv->runtime_div = priv->rtc_data->default_runtime_div;
> +		priv->suspend_div = priv->rtc_data->default_suspend_div;
> +	} else {
> +		priv->runtime_src_idx = -EINVAL;
> +		priv->suspend_src_idx = -EINVAL;
> +	}
> +
> +	priv->clk.init = &clk_init;
> +	ret = devm_clk_hw_register(dev, &priv->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to register rtc_clk clk\n");
> +		goto disable_ipg_clk;
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node,
> +				     of_clk_hw_simple_get, priv->clk.clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to add rtc_clk clk provider\n");
> +		goto disable_ipg_clk;
> +	}

why rtc is the clock provider?


> +
> +	if (priv->runtime_src_idx < 0) {
> +		ret = priv->runtime_src_idx;
> +		dev_err(dev, "RTC runtime clock source is not specified\n");
> +		goto disable_ipg_clk;
> +	}
> +
> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
> +	if (ret) {
> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> +		goto disable_ipg_clk;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->rdev->ops = &rtc_ops;
> +
> +	ret = devm_rtc_register_device(priv->rdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register RTC device\n");
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_request_irq(dev, priv->dt_irq_id,
> +			       rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> +			priv->dt_irq_id, ret);
> +		goto disable_rtc;
> +	}
> +
> +	return 0;
> +
> +disable_ipg_clk:
> +	clk_disable_unprepare(priv->ipg);
> +disable_rtc:
> +	s32g_rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void rtc_remove(struct platform_device *pdev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
> +
> +	s32g_rtc_disable(priv);
> +}
> +
> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
> +	u32 rtcc;
> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	if (enabled)
> +		rtcc |= api_irq;
> +	else
> +		rtcc &= ~api_irq;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int __maybe_unused rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> +	struct rtc_priv priv;
> +	long long base_sec;
> +	int ret = 0;
> +	u32 rtcval;
> +	u32 sec;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	if (init_priv->suspend_src_idx < 0)
> +		return 0;
> +
> +	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
> +		return 0;
> +
> +	/* Save last known timestamp before we switch clocks and reinit RTC */
> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Use a local copy of the RTC control block to
> +	 * avoid restoring it on resume path.
> +	 */
> +	memcpy(&priv, init_priv, sizeof(priv));
> +
> +	ret = get_time_left(dev, init_priv, &sec);
> +	if (ret)
> +		return ret;
> +
> +	/* Adjust for the number of seconds we'll be asleep */
> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> +	base_sec += sec;
> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> +
> +	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
> +	if (ret) {
> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return ret;
> +	}
> +
> +	s32g_rtc_alarm_irq_enable(dev, 0);
> +	enable_api_irq(dev, 1);
> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
> +	if (ret) {
> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
> +			 rtc_suspend, rtc_resume);
> +
> +static struct platform_driver rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= &rtc_pm_ops,
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= rtc_probe,
> +	.remove	= rtc_remove,
> +};
> +module_platform_driver(rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>

