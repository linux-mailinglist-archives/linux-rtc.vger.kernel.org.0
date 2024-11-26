Return-Path: <linux-rtc+bounces-2633-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B59D9D16
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 19:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 957C228264D
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 18:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1F31DC182;
	Tue, 26 Nov 2024 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LdgAPu5J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C4BA3F;
	Tue, 26 Nov 2024 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732644365; cv=fail; b=t5HiOtbKY+UH0k+DamiU1dFIhhSP/ztCDVzNHaroqwKlQas48g+wSVCbnbR5TIJBjZx3NBKtckJGji4Neky6YtePJbiIAaSKyqcTIGNay0c6S7k1SKmEUJvE3VZmQTPGksh5hsIbq5Eu7lfTVGw11rjYOCm56yV8WePpKXS3swI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732644365; c=relaxed/simple;
	bh=85IYPtJbF/VtAjM6hZAt0DZNUWS1SmlodUUghBgNw28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kc7eKCD7tWNuAeNW77J1IhXi5wLM9qseCehpRIKHnK+NFZdxZbrsAaqYpo7jAh5l2RhVLU8OP50A8MYXR0fg3AIJQIAO9jW3WXlopYtCZ7SrrP5reZ8xb72u6up6/P75VR3yF1gVnzwh4ZX+NNTZCN4/g5vKWsH865Ojjg5K/QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LdgAPu5J; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IL4MFjIZjf+Qdc8LE+H6tpd9+KynhZ5nbnxK02X7HkontmFPUZHYUpPJhJ5xQvDtDp4wo8N+tPJX5zWFVpx2QF2o+7EmfpFn6TE4KL7BIYpe14OFbPKAT968yL0HVQ9ieskQjMGtLB83SCus9xqP6aE0fVW6aDMsJGoJujs/YlwAR15P+qqC6wclvypmRGu84lM+5qR4WQf3KWBwrX8+cvyD6pSjclz6I4/dCYq++U0e6PT/QH+nl+1mza1E9ctdH+U8znnB7AYlbU6keP4MOveuGCLfI+N+2HeG0496LldH/F4szDsnj3MHRwnmzk9tsLAqjmO5xQKGQvVbIspx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLWlKZz2UfTS9qleH+u04WJrnvxMziCAdAyBPFh4IT4=;
 b=sRjCSpqj8oLGoL4v7TkAGeymziAoGXEkh+V1esm7xolK7/+XnSdl79DGKugU5bDDU81LyuIoCC14EnlSNJ7SbGqY6DpSPH9ToZ8QkL3w2dZa/TvBWZMtlRIbjqY7+FK0r6IWSZa2EIH0ZY/f/htDJNoGAa+MYth3HS3k3ykGu/u1NPbmf1ANyA3dd0us9TChoGlldXkHhVbm1BQSZeN5Q2uXOTr2xzzBtqYn/HFDuyyPjPsHCWUkgQN1ocGsgObYzjqO3p8fRxspSsxxgojUAWyGF20DWqLzWOTpd3DSyBJbnAZjnU93fMq0f2qoLpz8v0aBWwIB+53ULTuaxa1hBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLWlKZz2UfTS9qleH+u04WJrnvxMziCAdAyBPFh4IT4=;
 b=LdgAPu5Jush9BVfNiyA5lNwRMklB1rabJtwoU5O/0wB+NOn27a/nFvtSsdhw0b2B/O45ytd/Ukj4uM2qvlt+ipoDPfulsY4cTRHRnKz/6CEPdhrfZ2XyXV9PuUdGqg7B/2hnEXyb+03+rUg4nVeho3RJNLmOnkmPxfBUqNt72VCLpjTMsLddsc83dnwwAhD0GvX0wzHLVda3cM9oIXsNtYcU/I0FR0Nx3TWWD8O17NOmtognssoEOUZBANzrIWKTNWNzAIRtLnYfp2d3OQdufC//348hKoFvCiwRb0Mfm08n1hH9H6PsXRs1jcLcpCvtyIzRjZB6VmLSoXRiO2mfLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10292.eurprd04.prod.outlook.com (2603:10a6:800:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 26 Nov
 2024 18:05:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 18:05:57 +0000
Date: Tue, 26 Nov 2024 13:05:47 -0500
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
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10292:EE_
X-MS-Office365-Filtering-Correlation-Id: 664dd8a4-db2c-4ec0-e6b7-08dd0e44fa05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?szGGHMt2xyQNSGUQ/OT/P9T4PuZ6wZYSmqsuOg388N9eTDs5/Zzlsalqj6es?=
 =?us-ascii?Q?+AgNtYleB/qDg7e+J2U3sk21tXhw+PX4GhTqMG80UzA4hq6CLkLELwb0IH9h?=
 =?us-ascii?Q?xyXlFJWfbB1jKkUkCdC3XjMxQNaq/Ag5TdGtXe6xtqWE2R0qpqVAfI0PL9Pp?=
 =?us-ascii?Q?jzneUC/6YlrG5KpzWdhLun1HQQELK6/CdlYU087u/8qw9so8DaEZ3Tho/kRt?=
 =?us-ascii?Q?jegeRfd7Bqji5ReZag+vpJ4f6M2c6jv50PuBFVs2aq/ZH8/d9ps5HyRzOjlk?=
 =?us-ascii?Q?wxdl/ubPFXt52J/Kw5QhhsXBo9E6Ig6xuT5otWRl/88Iw6rIt4woK/bPp7XO?=
 =?us-ascii?Q?Pkouys9emUlvo0DSCG6V1bfwweKyd7de3frCN3mcaEeZ0yIkGFPUNwSyzuqy?=
 =?us-ascii?Q?vW/2/nhrXp0ayUZWFKYMntUe1cnnwI9G6wKCf2nHQENptq7V8H/zS1/M1gp4?=
 =?us-ascii?Q?5GFrTbWzYMV58kw2fLlVdfO2t+pvJy8cKdNW42p0P7kBxkCq/m/pCicdGz01?=
 =?us-ascii?Q?gTdXrmPf/lxEkHbzvcDPVsdN03JePCtzpVW7FxLrtY2hsMvr+8BzryDXvhHI?=
 =?us-ascii?Q?Li52I214PuWO/3RUKcnCAhU8xG0hkU/CJ9RncHd+tIIvkOY4S1fZPfjQ+xY+?=
 =?us-ascii?Q?h90igJwlyMnH72H7wjeDmtqcP2coevtIPAb0GbMa4nMQ/UQdrmYDts5vCzfz?=
 =?us-ascii?Q?Dc5tvRNEx2cMpmRiJPnMNNIf5eGbuJWI6JpdtAJIU4AphQoIYmKeFD+lmTfI?=
 =?us-ascii?Q?d/RxexinbKF3StKFBLbzRccqRI4JyBqe1MC6ll6gxfnt5TaduTobUbUIV8CX?=
 =?us-ascii?Q?L+LaiDO5TEnwhtaANRCQJlZVek+L0y/+DvBJx8p9L8l+dy5JJU7sOad+OCHX?=
 =?us-ascii?Q?1K8rXB84N29eqhQXCambZbTi3N6+X+6t0If5vwFM9qNDaqfQKV7LrZ01sCFf?=
 =?us-ascii?Q?EktOjsIBiRZVatlrBvR0GRRe1QsDhjYNIcVJlxHhbsmX1zxBH+BnHun3MF9r?=
 =?us-ascii?Q?R5XY0qD4ihaqZNH9eD7oFXkE96rEWNcCO0deVFh1uGR2Jvf+Q86R6R40qMMC?=
 =?us-ascii?Q?kwI0qwcXpY0Db+r/lLuIgNB8TTBmlboadhgqe2mB8c5rdK8PQqTtAia5YuSB?=
 =?us-ascii?Q?sRt3wWkGhwFjwL0wwS1y3yyq3N58s0xPeBBgu06LFa3aUeN/b56IFg0dYqLl?=
 =?us-ascii?Q?/oshI9/SwSsB+QnKrZqUp8tleDsF1Ofu63LbT1X2VSPjcGXzdrHq1kBQT5/l?=
 =?us-ascii?Q?T1+wTNICesBFrP9XJ84kySzvy7YbIdX6PG+2oEC+OoApysGVhrSyieXM/VoA?=
 =?us-ascii?Q?vpt4KNawAEs22Q7RFJQeMFPu+xiXgOVwJncWEoFUiJPFPXQyDySWT/cf+OIP?=
 =?us-ascii?Q?1V78E1TaKRhY5kBNRWseyhd6hTIyasWmbsOEgdTcdLGoUPNDGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sXlnpxaIEXwBxnFqrxgbgwhGN6Kntf6Zrw7shTBr7YL8S+y45WKn3QQ/Ap8I?=
 =?us-ascii?Q?lPeEtT9mH4tSoRggN2V+zqD5Hj7+D+soWcjyRsfqbAcHMpya2hxPiMrJGuTK?=
 =?us-ascii?Q?B6qgdb8jpPBBesUGAgo3C5+h+6y35A0UWohxwoV2w8If4zkVqTnnwMjXkQ8t?=
 =?us-ascii?Q?2JG+SfPSVNXQpDxQ7LbmjlYBG23eqbHq/uvqI/LW9aPnz63IfTr1Na188uf1?=
 =?us-ascii?Q?TXsOPPUJl5yyu/j70DrfWHfv1GqGV7rR5SVyHqa3rYW4225nYrWu2b0g08is?=
 =?us-ascii?Q?BEOTUkmuW+beYC2oJkvuAqjT7awuKSL3GoadGYx0LzNHJnA8iC2mCsLXBgbj?=
 =?us-ascii?Q?3cIsggLg9QzexgPFimXYt6nMRYDnvVvDcMR2wnKHr3Pp221snlNZyPouNmf9?=
 =?us-ascii?Q?UR8rYlGAN5N54dnrbkBstn69OT+qwRJUQsDrx7rIcjJeL/AIp0bN+h0AVT3a?=
 =?us-ascii?Q?/fT4MEw+O7JtHkjaclpT+v2YK6X/fKVUSAposGVkY+1mmrbbexbB6VGWTWLV?=
 =?us-ascii?Q?L30cUGXV+VgxMtuX+fkartA68o9JdW3iYzjggDr1YsTQO+Gas7UXaKyjpVD+?=
 =?us-ascii?Q?hlQVTADZM5077tpgUjwU9tVUkLJo8PW/ukIYyj7HAtJVy5ZJoKuXA6sLavm9?=
 =?us-ascii?Q?DEx0XGBmHf2pUfFCbzl38ho7B+T23RUcbhqOEZEIVsa1GTSrjQKIIScSsq2C?=
 =?us-ascii?Q?3kkUSG8DvshbTjSN+Z78h5pAL3oKsy2XioBZMkFob0uAB7LSqHhmC9OWNeJX?=
 =?us-ascii?Q?27wMjTgCdvN7d56+ICROU4vvfnJyy2ubYbhKnEB6XweIrgrSIg48Nfzi6l+0?=
 =?us-ascii?Q?zvxeun+Mg9RpndUyIDv61KQeYcK4luJSvZENZbxpVjNtIA2M95f5gfu3IUnf?=
 =?us-ascii?Q?qEj5b4oEAFbflUGDW7vKms3zsZNYwnIRywZPuGm1uy5VRdGUNiMKGBR1EKni?=
 =?us-ascii?Q?VHBgBw+mgjNOqQ5pZS1WcR4SacZOI5Xad8D2KYVZOBGK6Z86Wn08NtmrN53K?=
 =?us-ascii?Q?e7OAkhhxgkatAMA5O9xKoUwGQIo97M2MJjezcfZXguwwXZQlJcZ+Wzevw6tX?=
 =?us-ascii?Q?zyMfXkupgOcGd4CGS1TWCOSTPf/bWSs4yMRsGYRuDerm2RFtz0JOFCmNb0y6?=
 =?us-ascii?Q?Kfs2xUneHSQBh7AUx0rnWGLWm326+asT/X7NeBAciUOhgIPHCFr/tObGK6w5?=
 =?us-ascii?Q?7igefck4eKekMSnC032iwRe7JL8XNdXZ/l4NCHS8LJYTlJR3usP6zQ+bV21Q?=
 =?us-ascii?Q?ldlOCc4zFxUijMqpo6bCfMjKply46s9IK5LoUFFrfxY934/B2zP2/7fphBuG?=
 =?us-ascii?Q?FHUA0K5w9qUGgSyZNrOqee9ngXjDGJMJbI9veJmYiY6bebcrLi8KeHz9xrEa?=
 =?us-ascii?Q?Mv9nipgk7TXTvQPqKJjv13iWQAHbTg8dI/EwQitcZfDPC2AEENrLL5MMcYFh?=
 =?us-ascii?Q?VR0KyKtxxwEN5NDHrQwmnU09NWV5F6gcs+3eTugP/u3236isk4+YHEOxCEt2?=
 =?us-ascii?Q?oUou19cnLK3EB/sAkejCm8M94LliPOZavOyZAfUMtRoQJeQKaaQYYWxvxVaJ?=
 =?us-ascii?Q?TNV1MAivToom4EpBEima8zOF0UZhbyJaatHqrJKL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664dd8a4-db2c-4ec0-e6b7-08dd0e44fa05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 18:05:57.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdVIG24pyadM+LXP3ZoBbgLUOvh6nQifD89kc+eapaXrVvHCQ+D5p4cDwzNF21JjVVReD3qaKA+IBT0RIZgdxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10292

On Tue, Nov 26, 2024 at 01:49:38PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> RTC tracks clock time during system suspend. It can be a wakeup source
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> alive during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 554 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 566 insertions(+)
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
> index 000000000000..ad78423783da
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -0,0 +1,554 @@
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

Only use RTCC_RTCIE_SHIFT here,  just put 30 and remove
RTCC_RTCIE_SHIFT.

> +#define RTCC_APIEN				BIT(15)
> +#define RTCC_APIIE				BIT(14)
> +#define RTCC_CLKSEL_OFFSET		12

No used

> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)

use FIELD_GET

> +#define RTCC_DIV512EN			BIT(11)
> +#define RTCC_DIV32EN			BIT(10)
> +
> +/* RTCS fields */
> +#define RTCS_RTCF		BIT(29)
> +#define RTCS_INV_RTC		BIT(18)
> +#define RTCS_APIF		BIT(13)
> +
> +#define RTCCNT_MAX_VAL		GENMASK(31, 0)
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
> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
> +	"source0",
> +	"source1",
> +	"source2",
> +	"source3"
> +};
> +
> +struct rtc_time_base {
> +	s64 sec;
> +	u64 cycles;
> +	struct rtc_time tm;
> +};
> +
> +struct rtc_priv {
> +	struct rtc_device *rdev;
> +	void __iomem *rtc_base;
> +	struct clk *ipg;
> +	struct clk *clk_src;
> +	const struct rtc_soc_data *rtc_data;
> +	struct rtc_time_base base;
> +	u64 rtc_hz;
> +	int dt_irq_id;
> +	int clk_src_idx;
> +};
> +
> +struct rtc_soc_data {
> +	u32 clk_div;
> +	u32 quirks;
> +};
> +
> +static const struct rtc_soc_data rtc_s32g2_data = {
> +	.clk_div = DIV512,
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
> + * Returns: 0 for success, -EINVAL if @seconds push the counter past the
> + *          32bit register range
> + */
> +static int sec_to_rtcval(const struct rtc_priv *priv,
> +			 unsigned long seconds, u32 *rtcval)
> +{
> +	u32 delta_cnt;
> +
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
> +		return -EINVAL;
> +
> +	/*
> +	 * RTCCNT is read-only; we must return a value relative to the
> +	 * current value of the counter (and hope we don't linger around
> +	 * too much before we get to enable the interrupt)
> +	 */
> +	delta_cnt = seconds * priv->rtc_hz;
> +	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(dev);
> +	u32 status;
> +
> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
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

Generally, iowrite32(status, priv->rtc_base + RTCS_OFFSET); should
follow status = ioread32(priv->rtc_base + RTCS_OFFSET); Any specfic reason
put it after rtc_update_irq()?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u32 counter;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +
> +	if (counter < priv->base.cycles)
> +		return -EINVAL;
> +
> +	counter -= priv->base.cycles;
> +
> +	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
> +}
> +
> +static int s32g_rtc_read_time(struct device *dev,
> +			      struct rtc_time *tm)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	s64 sec;
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
> +	u32 rtcc, rtccnt, rtcval;
> +	s64 sec;
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
> +	if (alrm->enabled) {
> +		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> +		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
> +
> +		if (rtccnt < rtcval)
> +			alrm->pending = 1;
> +	}
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
> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is set too far in the future\n");
> +		return -ERANGE;
> +	}
> +
> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> +	if (ret)
> +		return ret;
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
> +static int rtc_clk_src_setup(struct rtc_priv *priv)
> +{
> +	u32 rtcc = 0;
> +
> +	switch (priv->clk_src_idx) {
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
> +		return -EINVAL;
> +	}

Suggest a reserve_mask at platform data

if (priv->reserve_mask & (1 << priv->clk_src_idx));
	return -EOPNOTSUPP;

rtcc = RTCC_CLKSEL(priv->clk_src_idx);



> +
> +	switch (priv->rtc_data->clk_div) {
> +	case DIV512_32:
> +		rtcc |= RTCC_DIV512EN;
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV512:
> +		rtcc |= RTCC_DIV512EN;
> +		break;
> +	case DIV32:
> +		rtcc |= RTCC_DIV32EN;
> +		break;
> +	case DIV1:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	rtcc |= RTCC_RTCIE;
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
> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> +	if (IS_ERR(priv->ipg))
> +		return dev_err_probe(dev, PTR_ERR(priv->ipg),
> +				"Failed to get 'ipg' clock\n");
> +
> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
> +		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> +		if (!IS_ERR(priv->clk_src)) {
> +			priv->clk_src_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (IS_ERR(priv->clk_src))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
> +				"Failed to get rtc module clock source\n");
> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_probe(struct platform_device *pdev)
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
> +		return PTR_ERR(priv->rtc_base);
> +
> +	device_init_wakeup(dev, true);
> +
> +	ret = rtc_clk_dts_setup(priv, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rdev))
> +		return PTR_ERR(priv->rdev);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->rtc_hz = clk_get_rate(priv->clk_src);
> +	if (!priv->rtc_hz)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get RTC frequency\n");
> +
> +	priv->rtc_hz /= priv->rtc_data->clk_div;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->rdev->ops = &rtc_ops;
> +
> +	priv->dt_irq_id = platform_get_irq(pdev, 0);

'dt_irq_id' is too long. 'irq' should be enough.

> +	if (priv->dt_irq_id < 0)
> +		return priv->dt_irq_id;
> +
> +	ret = devm_request_irq(dev, priv->dt_irq_id,
> +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> +			priv->dt_irq_id, ret);
> +		goto disable_rtc;


Already enable rtc at rtc_clk_src_setup(), you direct return fail after
check clk_get_rate();

if you want to disable_rtc, you use devm_add_action_or_reset() to add
a disable action callback and return dev_err_probe() here directly.

Frank

> +	}
> +
> +	ret = devm_rtc_register_device(priv->rdev);
> +	if (ret)
> +		goto disable_rtc;
> +
> +	return 0;
> +
> +disable_rtc:
> +	s32g_rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void enable_api_irq(struct device *dev, unsigned int enabled)

s32_enable_api_irq()?

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
> +static int s32g_rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> +	struct rtc_priv priv;
> +	long long base_sec;
> +	u32 rtcval, rtccnt;
> +	int ret = 0;
> +	u32 sec;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Save last known timestamp */
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
> +	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
> +	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
> +	sec = cycles_to_sec(init_priv->rtc_hz, rtcval - rtccnt);
> +
> +	/* Adjust for the number of seconds we'll be asleep */
> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> +	base_sec += sec;
> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> +
> +	/* Reset RTC to prevent overflow.
> +	 * RTCCNT (RTC Counter) cannot be individually reset
> +	 * since it is RO (read-only).
> +	 */

what's happen if overflow happen? I suppose it should go back to 0 and
continue increase?

> +	s32g_rtc_disable(&priv);
> +	s32g_rtc_enable(&priv);
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return -ERANGE;
> +	}
> +
> +	enable_api_irq(dev, 1);
> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> +
> +	return ret;
> +}
> +
> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings.
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> +			 s32g_rtc_suspend, s32g_rtc_resume);
> +
> +static struct platform_driver s32g_rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= s32g_rtc_probe,
> +};
> +module_platform_driver(s32g_rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>

