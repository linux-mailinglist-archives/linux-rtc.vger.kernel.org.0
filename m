Return-Path: <linux-rtc+bounces-2670-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A79E5CF5
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 18:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC821881718
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2024 17:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728A0224AFB;
	Thu,  5 Dec 2024 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RdpvcSbL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B390D38C;
	Thu,  5 Dec 2024 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419248; cv=fail; b=Y8SdiADKQ16B175EPAtR5LYA5oTfOl4fSXRmUV7Ab81RiE7S7TV9c9K+C3kQvcBy22pz/CIyps8qVcCCcFQcWI73HSdc6wxiXdQkNFiQu4iDCzjXAwVyvA7ZCLo+kgM+GvS7I7BN81TeKjWaLBlXOOzOFGhHd2J+6sEMO+Htwv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419248; c=relaxed/simple;
	bh=lY8mg/EqQrWA6N8acG0qexmj6HFTH8crfSdO4Ts03po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bkq6Tey8l5KI0VlxDyKjLGPcAdJxcd2Yqh52TIouR48kEgcIHUP28z9zCIQjtpz6d575zOOrswUQyZj+4n3rkzLvp7ch+rwDnb7bqmcR/WI1HHS122WSYqjsCxmRG493Hr4ma4zm1fBk8WNWh1qqJzxqCHB0+ofGoVTzAGiHpEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RdpvcSbL; arc=fail smtp.client-ip=40.107.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga5hd+Csbv/xPl/mUlKwoTYheKM8FqfzXGZKTXF7K0/HwQJ/iPc5qG0RLUDQ6r2VRaognQlMv1qne24MG/zbFcQ1qe0peJOXxgoZRVa8JgxRgK+uwjDWD/9xqhNe2uk25y1oucfinxVYJAzWQQyRfAsJYKPXcCwoFs4Wy6zI0o5C2DuFnA5pioiSjh1LOPPBnZ1yATfqr2jHHDkhqg07Js+rCyN09gRu1XWE3TtFARMDtMY25PM2rAa+wlRKjT2o6b924RzNJcVKqoj1kvNtGyDX6x7RoNf/Jm5q+jfVyoecUHecYMFvkh2ioe+6+z3ns+rYIo6umYi+HTsMQsgGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY1D/a9DKyal33Z5ZL8DtWZcXiG0BN49Qpx4wGu1w+I=;
 b=uDQ2a9FAsbuzjhaapQvU1jb9DJqgYLgNuIaJepRi7/1ZACIDRKQOLWcbxhs1rfNrc8cUf2x+5wPNZV1BO9FOMFv5VqlZWCeW1EhOvE7YupGHx50it6j/cQ+f/dQ6QLn6ooouaGB+nvtR34txBrcSWDW9KIHiwMe00qLQOfKhUDjXP9ct9K7ZnMDt0zqaRzOFuSDeNfUp9EgujBkBgRSVoZxDmKE4I3M6gDtu6xB79Inhk1h/Jgo0mkRKl2ba+zl627H1EB/U73+UxZ/s5AFAgbVu/OX1w0Tk94/MVY2V7sgyeL9KwM0zOOySJxWuOaI/lIop5hcc27y8k4IRfAPq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY1D/a9DKyal33Z5ZL8DtWZcXiG0BN49Qpx4wGu1w+I=;
 b=RdpvcSbLtaMhf6vaU8cC0jKoV4CRDOofIdo3brbdFoo9vp/xxR9YNGnh173So0vavweugTGkuN1N5sCbNwrMTqCd1w0ypzg8Rjss6alCvJGVZxsqZLcWkrirjkjHFOADBEMi46KqsiqYs65aJsP5BuEYacJwAU+2Un42s17uJr9PF1eTnetxCra41h/gYZ+qIMUpD+KBbdvQX3FPDauMdifjGuSWRI8iYzInHIo5lLyWDFCQsbmjLJQ+XxMm5AjAR1oAIm6EADnu7t0ar3eJt5r7bRrfD44jBBhNcWZubUa+vJPW1ZADgeLy1WoYnWiBez31pXMFr/groa4IPowfMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7274.eurprd04.prod.outlook.com (2603:10a6:102:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 17:20:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 17:20:42 +0000
Date: Thu, 5 Dec 2024 12:20:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] rtc: bbnsm: Enable RTC by default to fix time read
 failure
Message-ID: <Z1Hg4OMwf+MfyhMO@lizhi-Precision-Tower-5810>
References: <20241115194858.3837298-1-Frank.Li@nxp.com>
 <20241116193652a13b3081@mail.local>
 <2024111722084384333dcf@mail.local>
 <ZzuUmS8clXgKSbpW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzuUmS8clXgKSbpW@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 24000f19-1813-404b-d955-08dd1551253a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LbWdjqloiGGWIsYF5VyqShMXtyAGDSrUuTvJ83Xym+PY7qVldy6brpgJg55F?=
 =?us-ascii?Q?/+raqjGMzAIAXMYfh3JyZoq3IBAXyyAz+ZNCXyHnsDBjABIcfdHPLrABegT8?=
 =?us-ascii?Q?iWTn+YRZM72zpUdNuJ50ZWpHxNSuV6rVX5oco2MWbJM9oRngip71XUi9v4+r?=
 =?us-ascii?Q?dLXV0CX3p8BnCHTiz4S14+E30h4ppy3rOGZEIdL4c8+0MBUMMchtKFF5UXMT?=
 =?us-ascii?Q?3s3z4Lia9j0NI7VNZ/df0v9bYrdeQ8NdlDzmA5G2SMez2bl2rD4Eran04TL+?=
 =?us-ascii?Q?PJiOUpeXIqWNLshnx4MXVRp1bnNBitN2PhfXioGaxgaCU2FykLzsw7rgFyqE?=
 =?us-ascii?Q?l6FUUN14sAMYLsxWrkR1vkXzARfnXplhZT4Gs/uWgcuFgXa2z7tH6g3qhkmj?=
 =?us-ascii?Q?qev1vbbocCK2jWxDD7mFiNqHwiTKzeqiIS56GBJAXBuXT8Tz5HllevZkzWW8?=
 =?us-ascii?Q?ILUnNNy0vPTj0/4/BKJ49+0PijwcaXxz8Xvz/TATkIgM078kL4sYWukIfVs+?=
 =?us-ascii?Q?hB4EQQemdasM8FdP40T6jSf+it0/y3pWst9r8Y+cvXCNfnYIY1GP9VOuea87?=
 =?us-ascii?Q?Dk10ZhlObR5O7tx5F1zu+7NUF2Wj2fzlrOCU/pWfnjdhEeqX3cZ+8+kcqnBA?=
 =?us-ascii?Q?Lr8Mn6zYxTKL/xfkwkUmdWG/gH9kDEQmLUR3+my4CMWftc57xMT/aaCt/HW8?=
 =?us-ascii?Q?fw3y+o/9bZ5w1i7cNpytjv2nlPfUkNB66bfiuYEaB0nKZkJIZL3XCNkGRKXI?=
 =?us-ascii?Q?AiKG9t8tO4QkeUj3baS/zl10dOY8zz2ysFEVz6serHuHNQLiePIwYVdPM1ch?=
 =?us-ascii?Q?OxLUx8CewMMYBz/JlbBmWQEtS0z7uVaszw5UMFDtuks7BcQd5XCytoP7tnTu?=
 =?us-ascii?Q?XoJetq5qaQkWC6l52dqsgYFxOI33jNx06CRKQrCc1PC8aSfN2SW5qUe+D3rb?=
 =?us-ascii?Q?k1L2DViUFYzRjTNt6zUU7hmrJKzKLjf0CeB0nPk07fEdT+dQDToKtWCROfua?=
 =?us-ascii?Q?N1ycxwyeOigq1BkkmvjbyykKz2f0+2xlFaZrujdK4sZmSxVtYfQYZTu6yK9Y?=
 =?us-ascii?Q?MXlpqUaROfYvu1ytqQHhdlgjxHbrhLuKCVaraTVF9fo83LsUnbK38JddwSO/?=
 =?us-ascii?Q?KItt+/235MBb7kLHyRJZdy0F5NRCFZxqlnNO2ETyWfbisMmg1HeHrn7LWedl?=
 =?us-ascii?Q?nsIc8j/NXmkXxbK6cCGBrxAB9EmzT2kF4FrVEftn3ukahFwVhXRkphHX9Nfc?=
 =?us-ascii?Q?Pa6QmV81eXlAuFRMz2AFXbMxc648l4eMOiX05TmjCSNgAruVGEUQ9+/vD61n?=
 =?us-ascii?Q?o1zx626CIQJGYU8T/RV2NUZDpNFDEbFGI4dSEr7I9fVUO/Jxz4xyIRZoARpp?=
 =?us-ascii?Q?t8HJo6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UEcnosEIVTR2wEV0DpMSezhubaL0M6b+fENLUL+X4RniSy6wM7ifryOndEHG?=
 =?us-ascii?Q?wspsWB6ro9CW8BBpqvQmcD0791DLkiRLTs9kH17kLjvSOtVa5svr+xVg8OVc?=
 =?us-ascii?Q?Vr7/XhYbgKmFNeJFoFHTVo80xTaI//myryew82x6l7obz+gRQC38Sy/zgBUL?=
 =?us-ascii?Q?eTFZaIJuJj2RSeta0ySe6xNtPm9jENQYX4pd/XVibYYUDU3Ei1DjJdekfH4/?=
 =?us-ascii?Q?ueBfV0Dz+KFmkjvSC8PO/juU2X8fEQZmuhXckw3LITSSf0TuWpuS3v0Bt/Gz?=
 =?us-ascii?Q?o34Bbo7s6dnYkdqxHF/X41Af4YnPK61esD/rVdNCHl2+w9SDmgKlwZ5HPt3v?=
 =?us-ascii?Q?jSR7/cHNUGKP1YtCi9IeZjEgsCRU2mV947Fqk4bccawmfvhlXiTImo3ATKUb?=
 =?us-ascii?Q?AolC1ULjS2nLQDqRJkD7gwVrlQU1arPhAdUmoNM0btHgMMyV3vBbjHkgANNM?=
 =?us-ascii?Q?Uv8esxz+5t74mBZnpz727eB9QAOzRi1BmkukHWEo8pl30ZdEPLEhGwmRYuFn?=
 =?us-ascii?Q?Rb90yN2ukVbVnUPFM+tWkKcmTpGb6RMJEO+5+9C+LECm9ak/Hr+htrBS2OZ/?=
 =?us-ascii?Q?Nbo5x2UcRAfF/izNcLBvEfqnztsTSBmQH0//zMrSVvh+P4L8Re7ld//x4TGt?=
 =?us-ascii?Q?PASbJG87ffrXd7VeZN95o94MNyx9zbrGzR3u8ASDPSMfTVqYf+ZawOJA2QtX?=
 =?us-ascii?Q?QBZK8e+ex9+Di+C/oBgMuxvr4R5eUsahtt76f/bIN9OJfVE5sCI0upF09+rO?=
 =?us-ascii?Q?X0aVa0OnHSCkPW81vZ97BzZu2FvacQYVwGX5rFjp2/10CE8zJcwoj4Sfpm5A?=
 =?us-ascii?Q?yk+SKYU+ilVjARCBonI3DsdG977v7hmO6Rzm6+oT2r+PJhz+7IPkAx1w6SSv?=
 =?us-ascii?Q?u1FAOPSfy83MA5CBIHg1dmIg/oscb5Q5/1emGpKTuoSz3L639GMscSy59AwU?=
 =?us-ascii?Q?bEz+tSGqPoJr5+kgOv6vMgNN1LNWQvb3JU8yHcoESNHYkuOiBNZIi27YgBSW?=
 =?us-ascii?Q?aWpeOSz12EwWSMTNeh943w52Qfje+PbJcPb3wX5vC5zdNk+ubISRKmite4Un?=
 =?us-ascii?Q?BKcqROTYTNN3OzQz0mp5zV4nz924/ZSxYsG5fBne8Axp1DpAlM3ISmL94FHC?=
 =?us-ascii?Q?T61s9vU3MPeN2m0YMKrH3ICo5Z+MonLRY7HXdEuMSVRkeDWjK3KIJOmjVLLK?=
 =?us-ascii?Q?8QFjs58jdm/iM63ryQJFECyjCoh/VGUzUztiZ1CDo3PnJrYEAcVm7tDGN693?=
 =?us-ascii?Q?3fiJTWDAEnIS7BbNNwtyHwzecZsea2dQk+l/W6jx5LNKGT5I/GxrJnh25M1d?=
 =?us-ascii?Q?cCvyEQGEM6hQERgPFGU8Sa1js98uQNHtBeg6ZC4NTfgRLTVtQpthI2Yk+svn?=
 =?us-ascii?Q?BxsSSCheGBqJaFFQ7TUrFQHltKLIcQD7h3tuk09O3qrZSwMBRpkBq4rL6f5U?=
 =?us-ascii?Q?iUFgKYmM5/z4fm0TBlgHU+0rXM7TPdOrKMpCx0RnXR26YWNV/jsepc0pu4gp?=
 =?us-ascii?Q?f258VvwR0vQ/X5K8kbf6vx9+ccgMOv+8ii4UwBB7yZJVSu2kaRla56RobZl1?=
 =?us-ascii?Q?WvlBEBsOyPnCXEC0KeWbndmWkc/MLsCaXkv4YYfT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24000f19-1813-404b-d955-08dd1551253a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 17:20:42.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZciKlvMOFQRihPvBMUqhQwNLkduTSfdnEb4NqYbtMeOKRkEnCyfIHllmRG5lRhGnBEgQskoYehHDwGPBuU1pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7274

On Mon, Nov 18, 2024 at 02:25:13PM -0500, Frank Li wrote:
> On Sun, Nov 17, 2024 at 11:08:43PM +0100, Alexandre Belloni wrote:
> > On 16/11/2024 20:36:54+0100, Alexandre Belloni wrote:
> > > On 15/11/2024 14:48:58-0500, Frank Li wrote:
> > > > From: Jacky Bai <ping.bai@nxp.com>
> > > >
> > > > Enable the RTC by default even when no valid time is set to ensure the
> > > > RTC's time read and alarm functions work properly. Without this, running
> > > > hwclock results in the following error:
> > > >
> > > > hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
> > > >
> > >
> > >
> > > What is providing your hwclock and which version does it have?
> >
> >
> > This is a bug in util-linux that needs to be fixed.

Alexandre:

	I can't understand what your means. Why it is util-linux issue?
This driver return failure at read because check hardware bit RTC_EN.

	I suppose RTC should be always enable after probe?

Frank

>
> What's suposed/expected beheavor? I think rtc should be enable by default.
>
> Frank
>
> > >
> > >
> > > > Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> > > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/rtc/rtc-nxp-bbnsm.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> > > > index fa3b0328c7a25..6610db2f75125 100644
> > > > --- a/drivers/rtc/rtc-nxp-bbnsm.c
> > > > +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> > > > @@ -189,6 +189,9 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
> > > >  	/* clear all the pending events */
> > > >  	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> > > >
> > > > +	/* Enable the Real-Time counter */
> > > > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
> > > > +
> > > >  	device_init_wakeup(&pdev->dev, true);
> > > >  	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

