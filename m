Return-Path: <linux-rtc+bounces-4815-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB531B4289B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 20:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B8A189D381
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 18:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B02362995;
	Wed,  3 Sep 2025 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ILSpGjOE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B732F759;
	Wed,  3 Sep 2025 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756923864; cv=fail; b=AO7cdrNvowor3MF+US0sTUkso9QihxuoItrkwVie3P+UcfAMWjvwDNxNEue/kHaz9dnmonvhYgmfh+ppm+upMhRYuDrtgDMaulwOJygj6Htlsjd/zuhZsi7N9XhFxbu76oh10dGZHgCsMOOoXfRvUIz7PWp8ouhjecBquhtaPPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756923864; c=relaxed/simple;
	bh=lUDXjkXvXH8RZXywx1XlwwERygZbJpKm6zfQWkVVwp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PHCYR0xfwdRpU1IJUwzsjJnfOaEsYnUWoM2FBDrWbNaJS+eZcA2ZwCJBSYLMo44pN7jdAzytRe7AB0xEsv4HfD5tS2njba5mTrxbJq21nTNgYxJoWiOpQIPBO1A0oQ+LGW6zUbrlJrCgun2aop3Jwbze/tlHJweuQwicFTrp/h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ILSpGjOE; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3qaFqjbh5gpHF2sFwYjPRH8KytUHHeCCiXhqLhnoi5t/081lM1ayxZ2y1dprxAs0cF1kgxa1oyEC007mYUst3kx6fewed9Z9w7wIhXlbSpJ6SHChLVLAeRyq0PQE8w6SHy3jrdmqjCmYQj6+MrL2VhA+9KvJrM4iuodr4oio7rlWR9xui6qpyNSTLy0MVEIE32kqGZfJnrJK1TpqvGHqv/WDplJ8OrGCYJFIgX7yA8q7sodBLMEaAcwIFAcxKSUUa6h2pWwr69AIk8W5nZepsz9bXsxrg6wkZsaG0F+QOfAezvWSKghM2tKY0i8ukOEnlxD+E1tdTs6h1e/HfllSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCmaLDQ6UWYVikB9m7gOWjmq76stDc7cUZoaEF2xpD8=;
 b=iw/DK9+zUlfd5QR7Xv0Kj6kRpYeRqlanPgf6hKMOWYugtUwvkmhCNfsvPS4CxOVc+acA1yr4ZaPAayNYIKfzf9MEKDXgnYGbVrytIyntFxJOJH4InRMwkPArCFAxhiPr8dkVoEY4d1Qr6Pm04VCJAcnlTj0Cnq1j576rMpBmwc/96BsK3KOV92Bn/9TN36kMuKZnrsNEU4f8b6fF4cKQgflCYkgt0rN2ZqB1bLbSSO0KH1WmWxPbmS0sFmTbrE8lE8lskNHFwqT6nyb37+IuebvjjoE2cG+ZYfl2uDPzueQnb/N6RF5lNjly/hjtxJHn6SfDyddhVOIB//ru94k0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCmaLDQ6UWYVikB9m7gOWjmq76stDc7cUZoaEF2xpD8=;
 b=ILSpGjOEtvH0c/qthLJCRMo1g74BmWf8AR1966z9XEtxp96ZCO2M2CaWEWCZqjgCo2sScvA1OBcow90cVsZxYSzlyBUIdrryaNpkxiKe4Vtkb1ZqSP16stxl1zXXATHCQRSNaQrldxp8bxCXsGWsgb4M9P0hpWzHNCmGSXKF53SMW8q6G22FcA2+o9YPwP7YFKdvMy77gfQmffYkzM7z+4bO4ZG1LaENev6UrD+7xeMFd/FVT6Riavtf4J8V5PIvp3u/GxcX8yNFSa+kn8dc+XcDrLdPrUDQQV7TOhsH+OTIVKuKEIQ75tqY2yuHPr/zfAiStoHQfQjQWQ+pDblBsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV2PR04MB11167.eurprd04.prod.outlook.com (2603:10a6:150:27b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 18:24:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 18:24:14 +0000
Date: Wed, 3 Sep 2025 14:24:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf2127: add compatible string
 nxp,rtc-pcf2123
Message-ID: <aLiHyoI6orsalmyJ@lizhi-Precision-Tower-5810>
References: <20250903165536.431586-1-Frank.Li@nxp.com>
 <202509031658298690ab12@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509031658298690ab12@mail.local>
X-ClientProxiedBy: AM9P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV2PR04MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: e3327039-bb6f-4ed5-e58f-08ddeb1715df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IcFobG9SmzZl4wBuD09bsUwn/qXz7XVVFjGBSoj1AcVbchmzB+Rkf0+6rKIx?=
 =?us-ascii?Q?w4DuUpG7e5ZR3X3xJUhDcxZa0dyoYeySlCXYZ7guknSBMAfKksWGJR+gKXZR?=
 =?us-ascii?Q?+kZJYjfG+FskHq6YKQBB5rovEOmWpoGMIaMRzrCGzizledpMV8ujwXQijeEc?=
 =?us-ascii?Q?wNJ/4QakgoDX9kcgLF8iHDMYChjEMHldEsUoZE0r0Vv90CX355jrpNdfmLAZ?=
 =?us-ascii?Q?h0B6TQZoIWs0ZpvjribKzy/OH/xagPAA/lukuV5UEXnrdZtEv9+P+Qxn8cg8?=
 =?us-ascii?Q?MCJNNv2ybRXUEt9F/GDORXbL5t9nBi7n9J589IijrL2LpjKBtGVUeanWKZby?=
 =?us-ascii?Q?awkpFk4Lraf2qk+uWIIx8tAgtHmPhoIo4rp56jUo7HNjmeC1z+lMjfnxKO4o?=
 =?us-ascii?Q?vxcybiLcKASayOBriekH4q4otzpeMBxbgsNdghxFCGm93rGYuzDFJN98z0py?=
 =?us-ascii?Q?DBRSXGzKd2RSyoRxJHyYK8K3sk21PBZSfOJ7B6GXYeUfZIWBg1dPLb1h8eTj?=
 =?us-ascii?Q?8ZzP8wARrwCfVvf7Q2dFUNRTH0bWHx386WNosI63fIRPTcjDeEP/o80BzfGc?=
 =?us-ascii?Q?FsRx16nGxiZJRD4sgIvGpHYDsNzpHqRyHShAHXZqXvun2StgSTsZH8/TR1fE?=
 =?us-ascii?Q?q/MSYZRJ6m0BoS+ECoRWJEgkQgGIhp96+jGtm8+A1ROiVI1rK43IJlEFytJ6?=
 =?us-ascii?Q?ibvCnlBb/ZlD2+wMhydc/n94JEj3TD2a0nt3ur7XJj9KSRTUdmT+Unex8NoX?=
 =?us-ascii?Q?g+6hjqeVoishiZu4/WyPIhS8ValSqgx+j9aYi/pRcRYetta7QcOgcD2Myo+H?=
 =?us-ascii?Q?JJ2X0BzPKPz893w2HS1J7mLK/Hpr271GGKJNQTZlH9LwX6K54zTIj+KCJ75i?=
 =?us-ascii?Q?hh8BBPHHs7n+SHrUl68uYRDYdOfQQ6w40AjqbEj9dtOyl/V0vXgjw66rZXlW?=
 =?us-ascii?Q?xc1GxbGwzEPnHdmdDtTQYyifiWy4skwaSq1PwchR1zoiUf9TY5E7oaGpq+Fp?=
 =?us-ascii?Q?lPLACauIW6qDDATcQBDaEp+/XzV1eEQyR3QMvTeU+pkYQkr9jvlV5h5PmDhk?=
 =?us-ascii?Q?AzGy2BIUXAxBOQG+tmJOsAx8oY9IiCfcq6okIWmW7EBeknPgEyxJol7R7Z5n?=
 =?us-ascii?Q?9DuSj75TgjX5MnKHnliTP6QuVNVH2gcMxXKIvaUWfqMxo+2p+JX9w/MXdKU8?=
 =?us-ascii?Q?e1y2izSCyjOxzYncWrrL/S4Wyg5bHmFfp3o1e1TFn/pIbVAY6OKyGERS7Gar?=
 =?us-ascii?Q?x+lzisxBR63nHit1dIzzBLo8NACrJczLOvzKA7lRgtUSurG2Dyc+Pys/B0RT?=
 =?us-ascii?Q?fvG4AqlKViW6KxO19p5SctQrFlkY7oKMf9LXOGtOU3EoyT4vIAH3dzOf2YA6?=
 =?us-ascii?Q?zFBNw80EQePK448Xmcu627bB08CGmatTglFKKxmVKZcyi082v0Ck4LBFDCXa?=
 =?us-ascii?Q?lCUSbGcvsgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oho/4ETM9nRzvE9iIwP2Ih5dylQMppxAD5x+YaN1HfETad9xP3imlL4clr4b?=
 =?us-ascii?Q?BXAGmS2q55F1RanABa9i/Nu9+AmWi4qnxtoYmwF2aq9zY00l9a5dQuuKA/wj?=
 =?us-ascii?Q?oU8B7HmrGY4YBrl1gtNWOz0ngcn0i2e3q5zZ5fCMfmiD3AfGhzvA6zKNeUuW?=
 =?us-ascii?Q?S+x6NdR/bC7FU2oivtX4uR84RdA1/Pac0SmmbkHrm5CjOyMvW3EE/wkLodhJ?=
 =?us-ascii?Q?8vK5OeA9wsQ9Puv3/Z7tLuDKVV7NqWzHk9k34fnv4ME0EiEMv/6HaD3R5snc?=
 =?us-ascii?Q?+mgPFEa/RC/z6dmTwlD+Bsxu47lNbjb6lrHP79XM/qYi4LM1vOoGXfipAOEz?=
 =?us-ascii?Q?O61DPLnEBN9CbUgMtnCU7tXHlne3UugLbpFJfB/T5ZIXVnHgdtspnEWhyN9k?=
 =?us-ascii?Q?Lp7AYQZvbYY2oYkCmr6OWoHD+jZAe2tMkN/7NQmgsVOcvFvRKDHwfv+OoHcc?=
 =?us-ascii?Q?lenhJ8+MzFXEa3RSdN/6MmcmNRGRtsxPygzIXcYOIrL94RfnS5oy17SsJ08d?=
 =?us-ascii?Q?zBu/PiGjq0QQZ+R7JjWZDCHKJJSAcd+iscqA25FNDxSxzWWDqggWgQxRwLOe?=
 =?us-ascii?Q?HUg0pDmrr0CsLYiBjccPN17eC/fN9P09r+vGlpiCTprp00fasefO9OcyzTmV?=
 =?us-ascii?Q?6NQU12b4RmCQpt7OVxgTADmIjg3UGYMDaynzJk5Sj/3XwZ2QjVXI8LVw5EyT?=
 =?us-ascii?Q?DNf9IPvJADLtEYG17yOZI1ZoyimItXl4lIhZmXtS+gGl2tjZIZ1HTEAWbqcD?=
 =?us-ascii?Q?sQPuCnPngdFSH8VnK+vVTbjg2hoXL9tbl8IePDvCUWRdfMxth8TPUAlXtemv?=
 =?us-ascii?Q?/PrF9+SycztlRq5o+IPqWw6cRU+fhaQJkWVF1moF2F/3aMjYtRPaGe+M++f1?=
 =?us-ascii?Q?ui3Lf6yKhpDQ/f9plp0QNXOeErzOn34CcavDi7crsrQsJXBlMXVLam2p5N2V?=
 =?us-ascii?Q?XWPWva11AVJrECARLctVeRIY7z94kPoO4jUMKGYS9l9ALBt62F+2H7qSmVsS?=
 =?us-ascii?Q?uEDF1rTllhhjH6wWbmet47CFwv4qUNnvv/3Dg+CnyBFoDl7Sf4LlVHVeHItE?=
 =?us-ascii?Q?ESLJAhJgxi0d4A4H+UvlGsD7wyFpuOmAS8WSdGUuv0vUDfdzw+b6iVG//V8I?=
 =?us-ascii?Q?3Df7tFrvWtF6Zaj8dZtV/waPpnyo5nTOSsbVxGIJfKLSdwizDsRBqoR3mYDE?=
 =?us-ascii?Q?uM5Kygoaun0Dy0cXI/8M0RAKb22epWGhLj+JLtcJ+HjeAkbOFtlDyQkHpkU6?=
 =?us-ascii?Q?zFqYKerrM6ZjdU5luepsjVk2mIdAZhUJ3Hdz8/55ii7b4OY+pbqJ1zsUPqcZ?=
 =?us-ascii?Q?GPxvs5j+SmYP0w9S+5KtOqXmVEylk8m19iWLywY6Z742ZDgs5TasR4xGoI6a?=
 =?us-ascii?Q?qKq8bq5w142X0l1iQYCctnug2OJcpM9AySDqC2X/RDezWACqSp0+U95K2B6M?=
 =?us-ascii?Q?8I1wYZobCIMa4U1DVOtoRGmrMVsr5qcOn/nAkW8s/a4Tf2/TiN26Ngpb+M6j?=
 =?us-ascii?Q?X5fmksyhIIa2kIw+4BXNIbQ1nW+LWBjjGkJKvSmQ5fPDpwUb4nSaejM5rmnS?=
 =?us-ascii?Q?QlqjJAy9DpLCiOvt71SxEjnoElaPNMEhxvtPlJRy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3327039-bb6f-4ed5-e58f-08ddeb1715df
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 18:24:14.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe+VRzQmfDqeRDC1abpy5i3YDCIAHYcq9+/FBnGLyZQvs4+80edDop4QEJym+Iv04ghxM/etqeRHI0n9QK3Czw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11167

On Wed, Sep 03, 2025 at 06:58:29PM +0200, Alexandre Belloni wrote:
> On 03/09/2025 12:55:36-0400, Frank Li wrote:
> > Add compatible string nxp,rtc-pcf2123, which style is not consistent with
> > existed compatible string because existed driver and dts use
> > nxp,rtc-pcf2123.
> >
> > Fix below CHECK_DTBS warning:
> > arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2018000/rtc@3: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > index 11fcf0ca1ae07..595c20df6a411 100644
> > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - nxp,pcf2127
> >        - nxp,pcf2129
> >        - nxp,pcf2131
> > +      - nxp,rtc-pcf2123
>
> Nope, you need to fix the devicetree.

Oh, driver drivers/rtc/rtc-pcf2123.c also use nxp,rtc-pcf2123. For such old
devices, generally keep it as it.

Maybe DT team members provide more professional comments for it.

Frank
>
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.34.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

