Return-Path: <linux-rtc+bounces-2436-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BABC9B96EF
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 18:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE62B2834D2
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 17:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D91CC8AF;
	Fri,  1 Nov 2024 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y8H76D4v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2071.outbound.protection.outlook.com [40.107.249.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E5345016;
	Fri,  1 Nov 2024 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483770; cv=fail; b=cx+YX5iNnM4E7Lr6Uv26H9Ils0hF9ok0G/12N3dlQ6Qy7ojgTOdBsbcBqLdBlGsZofGIZzKvir/SLAwToTPp079o9WjmxjcZdqAOTl2vD2syoFVHHNEkybYuhLxEI7+5RDG8P1jnFxtXv3WOwa9ZlP7o+icM4EN1TG+99UAEggA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483770; c=relaxed/simple;
	bh=UYS2UIngxspKIoKUBgpjlLJpYZ784ujQ1uTIpQCm92w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fS05DuKdnXLIzQAmfMu+PCMz0gHXqUUWpfUP/m8CAVHsjY0tHLmcxGb8qG5lvmLIj+SfnCYIxB3P3xyIMEU43H4n8QF2JSRWQFlKmfm95isu0i/2sPfunaEHwSqwN3+aNrLsHjguRrhAP3uIuBAOXfgqZVL8giiUTrrDd7gIOhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y8H76D4v; arc=fail smtp.client-ip=40.107.249.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAmY6ZJtASShOUrPlrvoBP5P+DBKOr9RPIFmFAaNdBIDmE/qaadxNRjKtmQ5rsfqADIbCFXP0XA4UntxjMGTOoCywxLQDz/VESfwAiAsND7qLyTGy7MMGaCSd5L8/t7eoruGU0OdCuBxwXVaGQiNwXTUppQ87MbO4BZjJ20sq8RZFrLT+Xs2MKYSzer6X9Bk1lnm7/lBXxsnwAs3R0gurKjiLSSceehKxnVhMlZYnYP3X+epgcHqZ11IcVKjw+Py8ikAHrXCiyvsOCPzhd7iZDXP8K1S0DjvNysN6Ux3UEls2sH5TBcjfnpVsoy3gAZAMlba3u5raJk9pBP8AtdzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI/dyeUKmtO5qpflZPdC7KTqJzKkzWX4rvg1G7kAePo=;
 b=tu31lwHgrvzh1xTwC/IXP45O1hr5lES1LtY/BHMBDFoEfMCqC+muc21LmhcCHqf2ATMhwcXdCW6/hyXEGFnhqST+IzIIM6oPNHOGwQ5kkKQzEIZfLhEnmo7kf86Bp4vcJCxSanCpgDNoaOMhlzLKWq++dW9BvA6afB9R1TYjXKUL96QCedf3cCRU8RlDGDDDDeVbEKnurLaAwzpQ82GPbo5FsG4xBYVDYDulSr+PU0PGhFBA+b+MhIbUhCmm37ooyhBE3hCyO0ssJplK2bIjfbjRJUJhisK44cl+XLeXkF0sNEHE7Tg4sPf0z/LtUy6uUcXjoqBti8Kd9/ir4whX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI/dyeUKmtO5qpflZPdC7KTqJzKkzWX4rvg1G7kAePo=;
 b=Y8H76D4vLE5b+qK8+WSgMeIht+rW6LUN8lmzUQz1k1jaGRN0N9dz8N51akWMTJZF45Kd0u38KRmY7HANg3HCaCcAKvT4ZK6yH3zdUlVYC4tIJVzzO02QYFQAV8aXGx/EYY8Jv3l0wyvV6vOUd9J6vLNfiI+KYpvn4eSC+7ZOHZbQC6pux3ltFlHi/vuto/GLGHi5NJ+G+TadIU+ipWh+KqLl0nfqz5Rm4jsSb1uo7S/xuBFAVAXai+Q4Q9lMVe1mtuqA1oHK2lu4jd/tlDIzekTBErkFWICLJsGBFvPWl9Zcy1JzOkLtlHxVCXA2r68VKxk9znG+f4/gJYZB3yIK2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 17:56:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 17:56:04 +0000
Date: Fri, 1 Nov 2024 13:55:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
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
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	IMX Review List <imx@lists.linux.dev>
Subject: Re: [PATCH v3 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <ZyUWK81KUg9aNECJ@lizhi-Precision-Tower-5810>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
 <ZyO1vju0l522+oSB@lizhi-Precision-Tower-5810>
 <3e1b4165-d622-43cd-80a0-24c76b7f71f4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e1b4165-d622-43cd-80a0-24c76b7f71f4@oss.nxp.com>
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb709e5-8ac5-4b29-9af6-08dcfa9e7463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gKVGKrXeWtu/GnXoQvBdM7cB5A5PPN0epAgz6iDw+6lqJlIN1Fv7fBfOqr3D?=
 =?us-ascii?Q?TIy3gN1ktPmvmQGMMb9ciZ2riP2eNqrPNRK+MuwqV5fpcMJi/yvFErsNehx6?=
 =?us-ascii?Q?vuuE56c6raW5jNKSXo0hzVxTUXWcZoldyaXG5tBKxja4mu1l5KFpY5FCtoRB?=
 =?us-ascii?Q?1U85Q5HD6bZ8q0aANn2jHMFkQfmiYXGqweeT0iAKhUVZW/R4ZaokW3IA+pZr?=
 =?us-ascii?Q?gQfRm75ybWszJmN8LBuOwxOmsqjPrwj8XtJsnzd9ab8XO3+gfJs8rGwF/v/w?=
 =?us-ascii?Q?UQChJPZW3U5W97J9cyNZG3qRHkVlOApLpHOnBqrdX/iXH1s0H1s31ehDdL5r?=
 =?us-ascii?Q?cEu/XCe7IKBjR7RUS68b0LbLuPxpOTREhsCl8YA1iq7dqR+hb9C9CtV6nwiY?=
 =?us-ascii?Q?3ZmH5pj5WK1uf3cmB/KB/4YS6PzHggpkPoHR/5SHigucAi2OWBm0EFKfWXCP?=
 =?us-ascii?Q?SS3SW6QCNNeFwgQz16f6CQnjlJrbNz5mwqh2JYhrSB1HV46HeDyKrnf3l3p9?=
 =?us-ascii?Q?lowfAg0qebil2F7w4uE+sNbyrwgaVKODg1VkJ6jHaLdYcD4ErDgugioKOrXw?=
 =?us-ascii?Q?pY3RfTQq4CfQA4laLk5wrENStjtCoxvJ/Ch58tZgDp8P1y4g0uRA7bzqIKss?=
 =?us-ascii?Q?b9jMZR6jSyQ/9lASIH2H+/8g/5dPb6CBLfbwFTFSRxERiCJi9vA9xkv5f1+p?=
 =?us-ascii?Q?dZXakMEgEEGDHdy+n0HJK+qUJnY3EVdRPh0KUAX3R7FoN2ZjymoWnB6LXsGG?=
 =?us-ascii?Q?CepLioax7qhUPDX+SA9mCsYYjPF+zKG7uzdZfXapjCU5HFD0dl6vewJK5rwh?=
 =?us-ascii?Q?v1n8nu/QJotAyZvFIaSla67A8e+egzMZnKGEclAC3pFSUzpKdOT0v74IKdKA?=
 =?us-ascii?Q?hkesujfOz6xN997STHN6TtNNUFGfm+BjDRyRYCuEBcEtZRr8uwA11lNSjszR?=
 =?us-ascii?Q?v9YtFtAOOsQTefbufKvWyz70qWzsfT5ZpqU1HQ6ZZRz0k2gWFNSIHfFHeBo8?=
 =?us-ascii?Q?Q4mjA3CVjr0sPr4TVXGP20pxIvIUdfuuiLcYpljeSDicqNzfJkcZ2jTe4OAa?=
 =?us-ascii?Q?xE3ui572LGp7KJbgH/EIAlp5DN8Sxu5ejfxT8dRumiBL+hPraLhdzy+ziRVs?=
 =?us-ascii?Q?jZxKNFMdXBZyx4+bxfnCnCKdbxNpWZeUhJ3MCnGW5DMQMo6t9o0UjTLWKpfk?=
 =?us-ascii?Q?9B36ECss1Uf2rIC1L3brR69EClTnC61OVbK+Xjf/0Ord9TEyDWacSwqf0/ZY?=
 =?us-ascii?Q?c26aZ39B6IuI6QSLdt8f5z8X1QkiPLDq4yNNHGk4VSeJiUb5fGOGyTq8XRyy?=
 =?us-ascii?Q?dmFgruFW38LJvSwBjuy/smVpt44ka/0S2LHF8B1IgcfHWlGmOb2kRKMR4Ko1?=
 =?us-ascii?Q?CGh8vfA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yb38VI8PIQXdDfsim1hjO/8eF1RhHbOAkG5kK/zn/SYRXdiIuZUgkp8Dre40?=
 =?us-ascii?Q?egq/uGz0HjmCxuah0CDqeoM+nPIMSJNlLbZAmwDLG5D5jVolptWjTTmME6Fa?=
 =?us-ascii?Q?J0NOt9WqioyCzjrEwl5Frg0MEuOIP01dP8efB3rZTDLdNVlpDeB9dynaxVVh?=
 =?us-ascii?Q?the29NlD9wNCthcJMKuMu8XyWLN+dJ/ut/OpkYBJn/yTJLxW2V5YUyISGGn1?=
 =?us-ascii?Q?VRkkeBJnpqD3KbUWuuxjz/4hF36YNy1D07Z8vPW5pEAcZW3eWo3dHzVTLx6g?=
 =?us-ascii?Q?hPEXRxoP1LkE2AMx7B0mrYpO7+AKhIMYKIFsW2FddITAxHFXk2CA/zxq0JG2?=
 =?us-ascii?Q?ZfQHfCr/UZoW9lkPPJtnaYS4edjBxS3idffM3Catn542+/aSsG6KSObDt7No?=
 =?us-ascii?Q?Mo9Vsnp6PNKDyPlTLyaGQeVfVLgN1cAnJcq/mSRWEWqbRF5m0VCPpBdjKeIy?=
 =?us-ascii?Q?maojiW5sjYWZTeatudMhaCEXEiTf1hsGJd7+gwyvGhaS82H2Qf5ShZkWNxx5?=
 =?us-ascii?Q?IXZxbWgc5VlgzCUDbUr2eH088HWguBbrXLpK+3FoMZZ3K83dSMp2bgslFXfi?=
 =?us-ascii?Q?eNIZeu0xd3GtsilcbZJ7I2R3bZiLaVcmefSG9PvqVPF1VsTjdLkOHTWLJwUG?=
 =?us-ascii?Q?RwI2QWPfvmHYcL8MwTjFEOQpoieWPJLneaq57G09nPv4x84l2PP2qxhxZ+re?=
 =?us-ascii?Q?538aCDTgTIhqu9x08TD7lIM/2P4uejTo0I63uGYRqLk0bEO0rbvYIdAOjwad?=
 =?us-ascii?Q?GLM+SX+CDJdzvNRjKyAgdMXEOi94CZzzV/734WynGRfbmjb/M+po5T+BpoSt?=
 =?us-ascii?Q?tHikQV823ke9KvL7yC6KeirFMHlpdR5vETFP8h2zuN9x38JAVFqVo2dLyFtu?=
 =?us-ascii?Q?1PmXdYUL0ZAa7fklIOoepvthk9aVGqvLB8Np1M7KeIQ+ifA/TDNBK/AfS6xR?=
 =?us-ascii?Q?h/huWYd/ce9h+P9dXqmi3rD83/sfDWfdLDDhQivQ8mljq4DZc1MjHDel7uSo?=
 =?us-ascii?Q?g3NOHsYjkN7xpXjmtEZKDXlGT6ZqPxMDYHJdNkUTUzhGOOmxUcpqPu5dJzoY?=
 =?us-ascii?Q?RjM5mepoZuax8oPklsvCbXSgSahV67C2JWPys3G9Be8w4jqh2VzWYdwz5bzK?=
 =?us-ascii?Q?LUSdmdmr6oWUwrUDPmA2wAa0/KbyGPJIvn2rdng3vkDggE1eSyixm5z4aSMk?=
 =?us-ascii?Q?rxe38bX6gHD9R/oNfDvpmtlK+R04D51jg94HI5YVHACzUoW+gt64pIkJKl+U?=
 =?us-ascii?Q?A3vubEyud5+FxNLTI2zXgLe74p6x2oysTB2i+B7UOHb7mWEXSEGnr3iEKRNl?=
 =?us-ascii?Q?+RSTo0pxuqc7ySVrUUH3PqODYIPgJhYQpzj65UNDgAV/VHnmf1cgv2HwJ/Ig?=
 =?us-ascii?Q?X/6cVwtEoqlykMAnEB3/OmsroRPSnboHDSs9dhYKwPAfGreP4UFwJYrM7C0K?=
 =?us-ascii?Q?9lMVEatSJLb0V11I0GL1e5KLGoeN2ZkkTuqvb+dV7eX6euO18TudzDhpfPFO?=
 =?us-ascii?Q?DzOpQUgvLH9buM8I3VUUrNlNBD75C1fq+rs3znp/n8ZFylsXXBOPWBPNg+ni?=
 =?us-ascii?Q?5mEh7Gl8obwjxXZFwr0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb709e5-8ac5-4b29-9af6-08dcfa9e7463
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 17:56:04.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4ari7ha+HlsqZ+mdLQyJ/gtutMChZfjbTABeqRPPuUej4HwWiTLhLpDREU39YJ01TQTZMifsEa4G1DCqtNbeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381

On Fri, Nov 01, 2024 at 11:31:11AM +0200, Ciprian Marian Costea wrote:
> On 10/31/2024 6:52 PM, Frank Li wrote:
> > On Thu, Oct 31, 2024 at 10:35:55AM +0200, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
...

> >
> > why rtc is the clock provider?
> >
>
> RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
> different clock sources (parents).
> By using this CCF framework I am selecting a specific clock source (parent).

If clock-mux is outside RTC block, it should be seperated clk provider
driver.

If clock-mux is inside RTC block, it there are some input clk1, clk2,..clk4
It should be handled by driver,

you can provide one of clk1..clk4 in dts, the driver check which one is not
NULL, the set related mux register.

DT tree should not descript inside of RTC, just interface with outside
parts.

Frank

>
> >
> > > +
> > > +	if (priv->runtime_src_idx < 0) {
> > > +		ret = priv->runtime_src_idx;
> > > +		dev_err(dev, "RTC runtime clock source is not specified\n");
> > > +		goto disable_ipg_clk;
> > > +	}
> > > +
> > > +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> > > +		goto disable_ipg_clk;
> > > +	}
> > > +
> > > +	platform_set_drvdata(pdev, priv);
> > > +	priv->rdev->ops = &rtc_ops;
> > > +
> > > +	ret = devm_rtc_register_device(priv->rdev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to register RTC device\n");
> > > +		goto disable_rtc;
> > > +	}
> > > +
> > > +	ret = devm_request_irq(dev, priv->dt_irq_id,
> > > +			       rtc_handler, 0, dev_name(dev), pdev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> > > +			priv->dt_irq_id, ret);
> > > +		goto disable_rtc;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +disable_ipg_clk:
> > > +	clk_disable_unprepare(priv->ipg);
> > > +disable_rtc:
> > > +	s32g_rtc_disable(priv);
> > > +	return ret;
> > > +}
> > > +
> > > +static void rtc_remove(struct platform_device *pdev)
> > > +{
> > > +	struct rtc_priv *priv = platform_get_drvdata(pdev);
> > > +
> > > +	s32g_rtc_disable(priv);
> > > +}
> > > +
> > > +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
> > > +	u32 rtcc;
> > > +
> > > +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> > > +	if (enabled)
> > > +		rtcc |= api_irq;
> > > +	else
> > > +		rtcc &= ~api_irq;
> > > +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> > > +}
> > > +
> > > +static int __maybe_unused rtc_suspend(struct device *dev)
> > > +{
> > > +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> > > +	struct rtc_priv priv;
> > > +	long long base_sec;
> > > +	int ret = 0;
> > > +	u32 rtcval;
> > > +	u32 sec;
> > > +
> > > +	if (!device_may_wakeup(dev))
> > > +		return 0;
> > > +
> > > +	if (init_priv->suspend_src_idx < 0)
> > > +		return 0;
> > > +
> > > +	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
> > > +		return 0;
> > > +
> > > +	/* Save last known timestamp before we switch clocks and reinit RTC */
> > > +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Use a local copy of the RTC control block to
> > > +	 * avoid restoring it on resume path.
> > > +	 */
> > > +	memcpy(&priv, init_priv, sizeof(priv));
> > > +
> > > +	ret = get_time_left(dev, init_priv, &sec);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Adjust for the number of seconds we'll be asleep */
> > > +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> > > +	base_sec += sec;
> > > +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> > > +
> > > +	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> > > +	if (ret) {
> > > +		dev_warn(dev, "Alarm is too far in the future\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	s32g_rtc_alarm_irq_enable(dev, 0);
> > > +	enable_api_irq(dev, 1);
> > > +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> > > +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int __maybe_unused rtc_resume(struct device *dev)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	if (!device_may_wakeup(dev))
> > > +		return 0;
> > > +
> > > +	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
> > > +		return 0;
> > > +
> > > +	/* Disable wake-up interrupts */
> > > +	enable_api_irq(dev, 0);
> > > +
> > > +	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> > > +	 * reapply the saved time settings
> > > +	 */
> > > +	return s32g_rtc_set_time(dev, &priv->base.tm);
> > > +}
> > > +
> > > +static const struct of_device_id rtc_dt_ids[] = {
> > > +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> > > +	{ /* sentinel */ },
> > > +};
> > > +
> > > +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
> > > +			 rtc_suspend, rtc_resume);
> > > +
> > > +static struct platform_driver rtc_driver = {
> > > +	.driver		= {
> > > +		.name			= "s32g-rtc",
> > > +		.pm				= &rtc_pm_ops,
> > > +		.of_match_table = rtc_dt_ids,
> > > +	},
> > > +	.probe		= rtc_probe,
> > > +	.remove	= rtc_remove,
> > > +};
> > > +module_platform_driver(rtc_driver);
> > > +
> > > +MODULE_AUTHOR("NXP");
> > > +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.45.2
> > >
>

