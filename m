Return-Path: <linux-rtc+bounces-2504-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1B9C4257
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 17:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDC52842F5
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8623C19D084;
	Mon, 11 Nov 2024 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eeNcM907"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062.outbound.protection.outlook.com [40.107.247.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03E4C66;
	Mon, 11 Nov 2024 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731341259; cv=fail; b=B5pJVsCCTxReNm19ty6kunT8i1Ft+Znjn6THH6238Mx2C1hnX3yJA5OvNs2hFpjdS3tFw+JjGUZMhcL5FS8/jvvlXrtBnrppjhq1XGUwG6bQ8BtitYxRUyVY3CC7hj0wvIjRzkEiFskYwmnnD2S1bXXBkRGZSraSkukySCAONJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731341259; c=relaxed/simple;
	bh=YKLuRDYsrLe9/Q5UmVpzR5vqU84LJtpBydRrfUEA5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MO99YNjQ6Eqe6DqL3lSLh5znJNjsJUXJMFPnJIDieMHFEhxXYXthjuXngbpPnjW6at5TnCJJZApvjMMlkHGusbmjmjRSpgZm5xlL8nlWhylRKOU9xvQzXcKU9wEJxgT0FBRYFuM3dOyJKwGSY683G3uTwole6IkcsAA3dt7I28s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eeNcM907; arc=fail smtp.client-ip=40.107.247.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcKSVMsF4Frp0LtEr3ShKDxLKrZQM4zFiK3OZm2NyDGIBkkPTGOf/bYFVn4b1bxPiTcCREvLVlsH3t0v6iDFd+i1IQgpG5Xkrl6zRLKXEvywRDDC5Ca+jC5d5HBox2SL7QDa7RXrfNDhnWStvXqx/jot2EzPo30ZZgO066svywAA4mYafxjmC3VYLoYc9NZqnqX5UNDQoIPI3hmgY3bVoldygAliXTbOVl+2soYTHOTBoZeL9Upw2kwhnyxCRoqRJPK//orP8acqgmqIDiF1p8nfute1iskhBoLzGm6kTnBcyNqNQQzpw/VapcMmx6tGxdbSp0FvDH25NXpmBwNmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdDkdo2fFEO52Yt7WxrriDV6zIoTp87yla1qZByly/o=;
 b=l5qe/+wvl/jT67nTD38xWUBgUyhfDVJVUd8fRjsq4PepZY3l2CydGkV1UJhSDP88W/iMKs+C0DjGTI9sGNBK2WK9ZovNEkne8/YUCV9zIkc8ELwBKAUnmHYpXaV5bxHbqP5ut/HDGb5XfNx4rcMXxH+SE6WnO4OMt1Yzr12BjRujJwapSviFk4BziCoGsyUwUpbb/UGuaIvHAcVOe3xjcr8ymMyQQgf4PliDAKFh7nm23IFNOdnPCJA+aHG+S1ujexYpgr7ApTV+HPEab1T3JTb9mnHxt3GOgoAzvqJKpZP/Q8Z8cr55YnfcmaaeVC1rKOb32Jljcwv0RJLimj8Mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdDkdo2fFEO52Yt7WxrriDV6zIoTp87yla1qZByly/o=;
 b=eeNcM907cmQaUCE19VH8QactDG3uj4iv17+D5EmUawpDTicgigJlLjRY2a9CJ9yFP8Am8sw3LHjbdmhlnhca/3IWtuPdv++ZCBUBUzs9S6lxHkeMgEcl1nTZbpxplCu+tTsWnA9Toashh/gDMzn1J+lQda0jTqCNvg5jZttvA302alR569huntTQIJqxKuKpCGI3xF5kGlZV2Jmdv+mVcjuRx34MMptj1WFGAYgqkRQIC5Zeb8ZlRNAHqU0Uwa2twO6th+7Nbs+1zViBOuhcmwzMrQUlFrRoxueJ4gmhtQQ1rGRaZsHmSnj75IuPcxZi+CiCMkJOZ4q19R7WgaFewA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Mon, 11 Nov
 2024 16:07:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 16:07:31 +0000
Date: Mon, 11 Nov 2024 11:07:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v4 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <ZzIruvZcLqWTWwJ2@lizhi-Precision-Tower-5810>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 46332166-097f-4c31-e701-08dd026af21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uQvzjHaN314i3kapIU2QYsZbJvKXWvZ2LzF494vGYvhyH6QLCVUtgSnBfKpI?=
 =?us-ascii?Q?OXIPX7xQg3Dp+ww65nBoxj+KKFlbdcPSaJv8WbYNlTna0jrkU8Xg4EF+OCNK?=
 =?us-ascii?Q?fph8EUEt6ZsMF2bWxiSCSFIIdE+3zDPjLioT2bbzydk7s8jiU/8Ijb9MrHqD?=
 =?us-ascii?Q?vbc3cmjflwqlH3Lr5VD5gwcRMaaJWhktzWLOljjNUkeMOifw+O+mWS6g/39S?=
 =?us-ascii?Q?R3q6FNMRMYWwUsp+iJ/+csglS5ji1LIbhI9MZZfXher17vOh80OmyZD8DyHX?=
 =?us-ascii?Q?IebeT08BbIxbgqG2G6BAXTe+XOoIk6OXRId6AUK70iH0sAdKsp8KTQtG0q3z?=
 =?us-ascii?Q?HndzOcYU0O8JvG8epXvYQX3ZKrJ96/ZcG3IitP3+u7KnOlU7OZv4qElRpQXX?=
 =?us-ascii?Q?4HZJLgGUxM782nt50x9KZbJdCp1F3jM1MVM2UMaRN5JcLhiEfEELjhDGCPNJ?=
 =?us-ascii?Q?+ZPsGW93riGPskmuV9R7hg+Tfb2A5MC4jhCLKAn2DwUVKUohOeUFj9mVLsJM?=
 =?us-ascii?Q?lgz2nTLn0IMBFh5EEcwB7rtwqBYr1qifIwbVypa8xRS6wdGGZschOSHVjwa7?=
 =?us-ascii?Q?e4rxTQHSQEP7up0pxTbmDenVF41ZGWTUmcc7kxxhxYiljWgXQVIcsJ1feO0s?=
 =?us-ascii?Q?An/uXyN6BQk2YvG18aV+0e0RrDmZRs44QXDCTy0FZa++PRZOzPST6VGPnfVi?=
 =?us-ascii?Q?bji8AKwaPHUF4U+bZGL50151VGbKKrjhxMIJfvHzQ++P/9OPnC9p3owcYdEX?=
 =?us-ascii?Q?vGryZAexRoOFydYW5Lgh9eLwnFAk3EQbrvbqAwj2maxCC3qCugp3JsTkNTR7?=
 =?us-ascii?Q?YashAxLnwxKZE6pdugBIv4mUHFbi77Nit+VS4/MipeEYdRvfIF1mbEtQ5sjn?=
 =?us-ascii?Q?NUVDXPHWwOPZk1wsWPuL114BJsSG8EnmqsF2mtdFiNLvmmKMYfbgbweAYULi?=
 =?us-ascii?Q?HiTCsfIcFFn12LBAQ36T7xhdGOqitloY8YNIM6b28rj5nWSflPD1KecFG+uM?=
 =?us-ascii?Q?G5Y/+xnPQ4SOSsFglWPeJQfOR4dVvlcwxMCpwpX/mfxT6iTq84bbLZR4hbbs?=
 =?us-ascii?Q?pAO/ZQXVGG2S7g+exy60eWNa//v2ekcUZZVC5S6EIQWjE+Ij0yvpWInYfESG?=
 =?us-ascii?Q?H6F40/5l4TxehWUJ8MW5nkbscXsGh8kFkQbmzkRaZt5lSab+o5NZk1irmkcD?=
 =?us-ascii?Q?hvmwWtEnDNiN1fS6sjBvF1rD/zaOgWkNUawPntbNQWWj2pBpmwXKmayUnvxm?=
 =?us-ascii?Q?1ZdS5DtBk+Yh9YvOtZMisN80GQ7FJ1PK6+WlkO/vW/e6Mhzcug8t+4xt79rj?=
 =?us-ascii?Q?0DlASlPuIPi0uzb3moEiPOpUGr0QmhvC2cPtuz706jtvNAh2b3+yz6Fna4NL?=
 =?us-ascii?Q?hcjUpsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c00I1UM4xcPcx3zx7UwhN+vLAlub+vS27Rrg8FmSHQKvAj3NWz4vWj5A232c?=
 =?us-ascii?Q?8FfpGXGC9BjGmuHSw9IctWP3A1yGwU5wM20wq4sfzM506FTVFCQT14pzFBfL?=
 =?us-ascii?Q?0Ig1b/ApEqGi+8UwZvXJZ7BVwchI9bu8xykz8TY8JkcZeyoQddQ7WJoFQl4C?=
 =?us-ascii?Q?wyTiiUM/GCxn+iBH5/pod6NWBJNz51sk2h/LAh1Zi5rhnF6DMkAVjMvfZ7f6?=
 =?us-ascii?Q?/RvWuDECo/FNzQgSMnDaTaofJYD9TiHppWB23U4TlVQeGBg9xujjMtXoLcJU?=
 =?us-ascii?Q?RSUWgw6HjRif/Ot0TD8f3OqeyHrq4lSMKoUvR7L9CGMDURQ2oTg2oPsTSEsd?=
 =?us-ascii?Q?odbNPL5KJ5spDE+xU1u9aNwA8Q0vlQ3E6ZZ91Gll1KCDDprKfU0Ouz0VR5D8?=
 =?us-ascii?Q?mPwvykDLra4dF/NJSHan3wpK6dXnTIybFvYXJU20ZiGeCMbKiESa6C4PCgei?=
 =?us-ascii?Q?UhImg2HdsIp1F4T/ZKW9f2C36e08WNWzjqWHvWbat9cpDSHeLwsB8IqYfQ5/?=
 =?us-ascii?Q?8gWDqEdjf0knAo1GRgLAxfGfeB3HeA1h9Y/UqkNf1/MuHNtMYxUJoxntlepw?=
 =?us-ascii?Q?2K0k35nCHdYf7VFytioLLCRSPl2xlTZTgvQczQOTEHKsS0u2M1wL39t+zoHf?=
 =?us-ascii?Q?CImdImX1Us31NP/Ck64PGkPAHC5F1VUvkUCqY5vImUiT48szaB+lSu6Bj32s?=
 =?us-ascii?Q?fxbIH8syI3bNJJ2mRr5phPwKGoN0BDFPIEw7pyOkEIaWVQCzK5UIdTCBJ5Tl?=
 =?us-ascii?Q?uKT/+Qhh7nOMVecdxCjrhGoIX+nedryRNCIgOZ0qHi/atu7pQzzrVZ124BF5?=
 =?us-ascii?Q?o7fP+6i0r5imBTVwHPT/ZUILdllG6jRntZu3O49IowqeJVO1ycUH6vRLuWwf?=
 =?us-ascii?Q?Y5fwyn4LJ5LlnTsLzWAb8YYssi9fKmbBHDRHPuXlQPcFY+sPPpw6eaFgSEXH?=
 =?us-ascii?Q?FncNdUmfdIGo9st9992LblyaqJ8TbUiSCk+7JjhIEs9mPOtZ3bcKK7gQZwDK?=
 =?us-ascii?Q?8V7Vsge/nMsDvNTeE8LyV2rKiYgIoKxQPWNwEnTLckKtrojEsvW501gP8KTa?=
 =?us-ascii?Q?crtHAomoHdvsMAf5xqo6eT3RM3lSlsICSZgNZyoV48UuF7RFZSi4iLyMW0E5?=
 =?us-ascii?Q?TxZ52pWmtBMuMwhky0b8TSbs0bO9XT7QopkGeUuxRGMGSVPqqif96qY/2UUX?=
 =?us-ascii?Q?1UPVP7pSLB1PRGV70Em+c6/PWVRdHFq1uQSCA9srp4Cubr242wwMQkts3CoK?=
 =?us-ascii?Q?9MsPBnQ3A2b4878GZwx35WlTqy0nVJK1CF7SP09Vmi04s9tEo2SgAGrv9j0W?=
 =?us-ascii?Q?koLBftCcmSblnyUx65pvabiupkSS8MQZpgOAGrbY5OH7lytwNnkzQn++mRW1?=
 =?us-ascii?Q?hrhk8sx+HV9GcrQxJRhTCAHO0TCJB4JPxmgP44BZ7bjIUVORdvRgIe5WB0HV?=
 =?us-ascii?Q?JOFx6dlW9dm61IEBepV8vMRDtCmeS1ebY81C672oyAZ4Vqlqe/k84xdFt7na?=
 =?us-ascii?Q?cEjz3Chki3eQddkfBwavGOmeY9yeLeqHYmyzfzckuSaaXukrivLb9giYhDdc?=
 =?us-ascii?Q?EH5DX1H3qk/Pk6OSu1Fd2JBkrPgArJmAjDgfRDq5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46332166-097f-4c31-e701-08dd026af21b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:07:31.1979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtINHUL310Nm3OA1J8oxflPJ4U5dtR6iaFs5t7qFk5Gma/b8y0Yed80l361IENaSMMkOtq2R0JBHw2jzsy5c0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

On Mon, Nov 11, 2024 at 03:59:38PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> The RTC module is used to enable Suspend to RAM (STR) support on NXP
> S32G2/S32G3 SoC based boards.

Why suspend to RAM related RTC module?

>
> RTC tracks clock time during system suspend.
>
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 704 insertions(+)
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
> index 000000000000..c3792b674a18
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -0,0 +1,692 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
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
> +enum {
> +	RTC_CLK_SRC0,
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
> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
> +	"rtc_runtime_s0",
> +	"rtc_runtime_s1",
> +	"rtc_runtime_s2",
> +	"rtc_runtime_s3",
> +	"rtc_standby_s0",
> +	"rtc_standby_s1",
> +	"rtc_standby_s2",
> +	"rtc_standby_s3"
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
> +	void __iomem *rtc_base;
> +	struct clk *ipg;
> +	struct clk *runtime_clk;
> +	struct clk *suspend_clk;
> +	const struct rtc_soc_data *rtc_data;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	u64 rollovers;
> +	int dt_irq_id;
> +	int runtime_src_idx;
> +	int suspend_src_idx;
> +};
> +
> +struct rtc_soc_data {
> +	u32 runtime_div;
> +	u32 suspend_div;
> +	u32 quirks;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.runtime_div = DIV512,
> +	.suspend_div = DIV512,
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
> +/**
> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
> + * current configuration.
> + * @rtcval: The value to go into RTCVAL[RTCVAL]
> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
> + *          twice the rollover interval
> + */
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
> +static int rtc_get_clk_src(struct rtc_priv *priv)
> +{
> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
> +			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
> +}
> +
> +static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
> +{
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
> +	if (src < RTC_CLK_MUX_SIZE) {
> +		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
> +		if (!priv->rtc_hz) {
> +			dev_err(dev, "Failed to get RTC frequency\n");
> +			return -EINVAL;
> +		}
> +		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
> +	} else {
> +		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
> +		if (!priv->rtc_hz) {
> +			dev_err(dev, "Failed to get RTC frequency\n");
> +			return -EINVAL;
> +		}
> +		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
> +	}
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
> +static const struct rtc_class_ops rtc_ops = {
> +	.read_time = s32g_rtc_read_time,
> +	.set_time = s32g_rtc_set_time,
> +	.read_alarm = s32g_rtc_read_alarm,
> +	.set_alarm = s32g_rtc_set_alarm,
> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
> +};
> +
> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
> +			     struct device *dev)
> +{
> +	int i;
> +
> +	priv->runtime_src_idx = -EINVAL;
> +	priv->suspend_src_idx = -EINVAL;
> +
> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");

binding doc need document 'ipg'

> +	if (IS_ERR(priv->ipg)) {
> +		dev_err(dev, "Failed to get 'ipg' clock\n");
> +		return PTR_ERR(priv->ipg);
> +	}
> +
> +	/* Get RTC runtime clock source */
> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
> +		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->runtime_clk)) {
> +			priv->runtime_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(priv->runtime_clk)) {
> +		dev_err(dev, "Failed to get runtime rtc clock\n");
> +		return PTR_ERR(priv->runtime_clk);

return  dev_err_proble()

> +	}
> +
> +	/* If present, get RTC suspend clock source */
> +	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
> +		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->suspend_clk)) {
> +			priv->suspend_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_priv *priv;
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
> +	ret = rtc_clk_dts_setup(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev))
> +		return dev_err_probe(dev, PTR_ERR(priv->rdev),
> +				"Failed to allocate RTC device\n");
> +
> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"Failed clk source switch, err: %d\n", ret);
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
> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> +	if (priv->dt_irq_id < 0)
> +		return dev_err_probe(dev, priv->dt_irq_id,
> +				"Error reading interrupt # from dts\n");
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
> +	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
> +			init_priv->suspend_src_idx)
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
> +	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
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
> +	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
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

pm_ptr(&rtc_pm_ops),

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

