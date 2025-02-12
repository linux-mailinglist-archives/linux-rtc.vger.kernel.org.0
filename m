Return-Path: <linux-rtc+bounces-3176-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE6A32ADB
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 16:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7460169F7A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0463F253B46;
	Wed, 12 Feb 2025 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iz3CyGUz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013071.outbound.protection.outlook.com [52.101.67.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A791271814;
	Wed, 12 Feb 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375452; cv=fail; b=pVDh+FVOMeaQIEWOKZg288beWaLCLn2w7oodw8cGhDFAgixTkITaIxW6KBUkDWEUkOOIGtye8Nb97fa080DDGrfkU9N8lurOzR43+b4+kWEtDIbGBcWSxnzRmHNEYf93ZNGTonTx9+clV9Smfs91L8TsvKOBxFXySBgoV2ez/jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375452; c=relaxed/simple;
	bh=oZ+lnoHj8G+pY3httJFV3v/sxwS0YG5uJi1PnRQyL2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K5at4yZ0miRFPN33xOGJ2+/0uRk5UwAwSkmixgV40d9ugyqWYjPSq3YLGbNZgCV7Dt7gBq6uuIA/a6UX8QDhcv/D2gxZXkXn3BzF1q96P5qfzz7QPDTfERG3X93Yv1wBBuBVCqW0xDmWMpGkg8z3QzWWBML/hIpzLfjmU6fEsXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iz3CyGUz; arc=fail smtp.client-ip=52.101.67.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=monOL7vWE4YJDM7mY2bwuGa8DvTzoMXqAVxl35pSZTcrnl7cOvnBaBs9Se+hr3ZDzey+gyCwOWmhX8+w2NFhrFacZKdL82vMV9MDXVdLWUK6vMkW+uQ6Zipzv+60I5FbvZByKbt/hFSjHmH0mKDPPuW+yVNJVYk+/FqtvjBQVxI5SJc07dw8fLJQwSgBJLOBwnfpvD/hmunMD7+geSoKzD/R35vvwhFJxACWK8eAkiOEjawrpmrnqyvBb3UqdebrvCzmFWjjZKWooCEu6OkK9vhIE3GbiWfa3X6Ei8tIG+dLpbcT3Mv4Wg4bWa7BSueamExlRBeLRxdNn2JgbF/kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trGDWQMBvvGyBYaN5VemRhALbwvx0efksnjkYaJjf2I=;
 b=psZDXy4DW3HdQ91efeoDYvsHj6ZG8eep2hGL3p5iQnqKq3WquAlp3PyphXMzTAQohuq9sJSX8Fd+Xo9AqeerIbR/I3ZakJWxuiESlsLlJc6i34zIwkSdrZoNVdyQBJWft2t4ZjV2ORhBSwM9Jcg6tSxiV+6PicTfnUolHLEnWVdNvgpUyiYSH+3hNbz8tQC/pYDej3zN5sEPiwMr/lHHOXQTZoEwaciZO7QN0We4SdSJFOpTirPDyekaRPEhz7gp39tHrqglEubx6qycw3SCjIsCnz5HB0CWqUsn/fFHBygH4cVYsokZrVe6usOsQ/KdLM6sqOE2kHJaj6rG4LodzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trGDWQMBvvGyBYaN5VemRhALbwvx0efksnjkYaJjf2I=;
 b=iz3CyGUzC0xMT4MEzxiIZ64JMvV+p/ACJDFfaVfM/7XEXtIjir7vVajozFc5yXBu3iJIOdqbzQ9pOQv9d6Qd/ubQxFEI/4kcyCofovddMuAlFJPrsxYWjQTi33pRc39ZMWz96RPETf5K2gMVA+Mvu8LrmSeK0+J6dONmdA//FBfKE5092ZYnu8WxukbDQlXJ8xXBJrdW642LW5NzArJ9OhLnw4Fsnq57urowoQphM+l/KQnisbJ7ROmeli2yrbW43cjW+F4iLEsXWTtiDrRRJ3mZUk/TV/UNG7bPfyVS4AVySAb5IDrGm5laN29bu4IwfwTkImfiSGML0OeU48qn/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10535.eurprd04.prod.outlook.com (2603:10a6:150:204::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Wed, 12 Feb
 2025 15:50:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Wed, 12 Feb 2025
 15:50:47 +0000
Date: Wed, 12 Feb 2025 10:50:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v7 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <Z6zDT/lbAeaJClV8@lizhi-Precision-Tower-5810>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
 <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
 <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
 <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
 <Z6uDuL97EB9KqD4b@lizhi-Precision-Tower-5810>
 <2e633e46-ac59-495d-9ecd-46c34d2d3242@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e633e46-ac59-495d-9ecd-46c34d2d3242@oss.nxp.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b17a48-827b-44c6-e7e4-08dd4b7d046e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YczvyM3SCn3VCON4pH7K43JrLmxo1GvAPz/wQv6McmXNnTSjSYG/7i189Tmd?=
 =?us-ascii?Q?l9YbittdC5vrJ0AlspTzPuUChe2J1qaCmgPZWdcjHocbpW5NJMRImY9WLSJ0?=
 =?us-ascii?Q?fusu8dyle7nt8Ik27av2sJqv7H2d4Pm0B54MXs1lUJ/OrPO8bmfkZ/TP+W91?=
 =?us-ascii?Q?5e+f+Q0WAqE3+tlnvht1PRHLYBXsgPEFgOtOT7+NEcyT7qTiXSQASsXe7ZOw?=
 =?us-ascii?Q?wtrd63zdtDcHhhWuWUhklUmiLS7kwPxIOsnkDKHKTeYdsuvbGfitMQyyC/8v?=
 =?us-ascii?Q?DkuVP8W4ldKMBy444VCOcASJZ/m32Un5fVNhSGIX1wdq2ynXR15y/s/S9AUx?=
 =?us-ascii?Q?FnISEdVCHwY9ADcE+DFxkbTEAtPgt2oYJo2s5z9WmjWMwGEmMbzBC8wSJ7ve?=
 =?us-ascii?Q?QXDUqNh1sjXpU03vhnP1Ui0WaYBAQXKS2YjZj+mYOFKt0wgclZSFVPxVXTeV?=
 =?us-ascii?Q?gdgdhfoCTn06+RcMaWTeZWNdz8Pn6/Pku0w7PC5rGLOjkd1C+yM+NKXH/c8h?=
 =?us-ascii?Q?Fbmt4oXsk6winsIr0f44ojJblptF1CtqmOWTZdOA8w6LFXddJkoQZEWrOx3i?=
 =?us-ascii?Q?ajOUNbZ78XLRW1DDBXi43ufBhYJT359T0oHBw4kkTLo8kzwjaqr3t+eS2EyI?=
 =?us-ascii?Q?WdgBKPbQLpma6hMwHjgwAX6reYLvWiPgcYE0+rA47FxaLNDhWLMepG6fj6xa?=
 =?us-ascii?Q?rEsSVOheINWNasT7052s6c9aY5AiZwBG8gtlPbrJ+6p2oJ7hFnc3o/KLfK8T?=
 =?us-ascii?Q?TKx9nDZj4Y+6oquiTPa/PP+HSOxRu9o/RCOETSP2P+FdAuhagftBf5j4rGlQ?=
 =?us-ascii?Q?KnBZaylzuMloRXGOoNtBzU8l4BJIDFTvaRJ4422qD9JZEU/qCWXkn7LtXacO?=
 =?us-ascii?Q?H+tlJADl1EXwRoeKrN0fvl1y6ApfXgpPb4VAUjWTWOyEqDJuiWoLqYFEChHB?=
 =?us-ascii?Q?FL9XMPoa87WuWaPyItKeijn7XdPxON92sRYqgedGCdxkRwWqPLUhCgxLVXaZ?=
 =?us-ascii?Q?Hrd+g+bT2sSIkaA19eY2W/UG0vAk2fhNH1FprR1v42bVZVOaEfC0oqgJNqQK?=
 =?us-ascii?Q?c1Oh64iy3CP2l7fRShTBpgHINuLW0UKkZTvtaTqzg9JLLpT2/peokw6Vyfs+?=
 =?us-ascii?Q?jjeYyk8RyO22vXJJqreb4T537gZgNmRRHRcEHYUear0YkE4bLFdz6Yil34RE?=
 =?us-ascii?Q?rPH4Y9a4udeLTSkLg9i5RqER7Uc4X7PPx8Qeu5glpOVTCgl6STvm2VD3ENJf?=
 =?us-ascii?Q?ZcXI55AdtXEhgHlUQ2Lo80ZaVxopur+ZX7pphMk3MVwnwkS4L1xNJ4LaDmPL?=
 =?us-ascii?Q?tqh7/Zi5fm6cnDIqHfqr+R7BhCOhZQcRAMbQwNeJCZb3TKq2x67aisQgrunB?=
 =?us-ascii?Q?AY2oZ2iUc0Agm3DSQDULEvtR9mf2ZxNlgtWYBIeflwZse+naLLN2kQtwWVTZ?=
 =?us-ascii?Q?Ah8AUxEmZ+ruQtKrV+Jcvx2Uc0wdO7Nh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GKRoNRZzql1DVldHndEYnARrpbErbJ1M1P2cuSdNxVFDiWmIQFmEWm4OAEY?=
 =?us-ascii?Q?ytEsUotsKKBos9FQAicbep0PpX9Qn/L5w0Icz9UpEFrk4/DIAKszEnlbETHi?=
 =?us-ascii?Q?VQx1bNnXD020qlFwM9DXju6WvSeLhJTtDdhKFE8MuyfixUfXT27crhbtCgyi?=
 =?us-ascii?Q?VEHIesyBgu11Sn5TOH9unqBKivqpMyFTskl8Rr9YxeUiku4I8BF1Ugu9tBA0?=
 =?us-ascii?Q?6j0Qc5Cce1YC410hHOPrkUSdWczQyLWkio0P/KiQN3dcTTo2DZjgqU4iLnOR?=
 =?us-ascii?Q?HVW+BUtiyjZ/sku2RK4+HYn9YRgfxAfapNnyoqs720FQevA3bzRQeE/zjI75?=
 =?us-ascii?Q?9FQ2UNyy/h2aIAZj9SbDf55Ib9LJBZHmMMEz/hZdircFhX0FRdL5PWCV6/1L?=
 =?us-ascii?Q?BpCwtJALo8PsLrlCJvS7/xsLJpGN+e4q4W1y+6sLMht05aarcy3FVLtjSszv?=
 =?us-ascii?Q?EggsN8kLhKldzJ/DZCFO0fpPPhp8zrJukRU9ZtC0RLT6C1ZNCBmo0IxFWBo8?=
 =?us-ascii?Q?PLAAiFRyDZ2IOJkTvzOcVnzITN7Ogo/p445DtMKagq10V0ucnYNNu94iaILm?=
 =?us-ascii?Q?hHVy1duG2G2WEBPIBpPpgiRXi5j1uQUzz8sZapzdJlbCJP958zRfyfT2xoSn?=
 =?us-ascii?Q?kv7ek5EaPEcOh9JLclrCqzYlObBFe0wbDM9PM2K8abEql8qfBnSRdreOcmmK?=
 =?us-ascii?Q?c9Coiz0BYc0S+tzj7QaiEtdDrEzorm2VPC+XuMi9wIa3DNMBI4aUQjBCckq7?=
 =?us-ascii?Q?VOKWc2b7lIwUPJybeDLIsFGWTxPeayyfMcI/K0L2hNE8GDcvGdd9lHMgp3kH?=
 =?us-ascii?Q?wXNSJUFFx/p/xiR5I49Edv4a5kUDhSZcEIk6W2tZyraCDNa6Zc33xGt7sF18?=
 =?us-ascii?Q?R/ejdhokGc1Ktdc45d2zIS6++zQQFEDLvLuLFcBcJMiYdxGc5+gOhEBledjB?=
 =?us-ascii?Q?BbH1hKPPT9DG5XeHmlbfeauBhC3kd9bPxq9EtUus+g31m1Ci4ZRcsRHpyQIq?=
 =?us-ascii?Q?6eXJ1wgEi0TDCfgwGVgj3gP/juzwD5GCZzXvhdkxDTf7rfi1c72Bi4ools+t?=
 =?us-ascii?Q?PpKw7dUy8XFuY1iO0DYkAqrEr3moHmXGdYN2u38MxXFPHo7KEaoIXN8F8voJ?=
 =?us-ascii?Q?V0H+CCbhNVOL2PFVttPSHvsiXx3fJ9mPXqVsePK0zg2jJj+nq/nwrltEBNf7?=
 =?us-ascii?Q?S6KVLhHDD44IyxJx7NvP1J2qhQy03EnFGJzQYUFrj2fVjCG53bgWl1C4Y6hZ?=
 =?us-ascii?Q?aEY1ncm8KHeK3NZU93fdN73YOF6kQgOoowvUQ5VQ6lKyOmbOInIwUR1y4iDk?=
 =?us-ascii?Q?z78aBUyose6+pHiY90pSAbxw5iLkZ9RHpGKpNq0SvqpKvOmX9YbfRf1Nw97G?=
 =?us-ascii?Q?sHzH/vGPfambJLmFkSnr3bawmdH7NYBiAk/xlotO+h1o9xfeT/o18HpsVkku?=
 =?us-ascii?Q?GgF8TDx5c1p0eSzmF0LujWTdVQQEZ0F/MVnl9XjOH4h+cwToN2yi41HrO6qx?=
 =?us-ascii?Q?ASyxTmIfBZBq/6qYW8T3M7xksQSmxVQfOA4f4Bc0klnsi7UqbIXVgEQ4JuTB?=
 =?us-ascii?Q?h/2nyP5BBZWls7VFPgKAXNFEd4gQOkqxj5L0uqB3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b17a48-827b-44c6-e7e4-08dd4b7d046e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:50:47.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gXKb8OhD2wAfbMr/3z3a0+T1tKvvqgLb4GY5EhWUtUIyjYsgGqXNokTf7Pg0tgBfuoyEQh9ctC7P7jfmuqZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10535

On Wed, Feb 12, 2025 at 10:11:35AM +0200, Ciprian Marian Costea wrote:
> On 2/11/2025 7:07 PM, Frank Li wrote:
> > On Tue, Feb 11, 2025 at 01:25:38PM +0200, Ciprian Marian Costea wrote:
> > > On 2/7/2025 10:16 PM, Frank Li wrote:
> > > > On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > >
> > > > > Add a RTC driver for NXP S32G2/S32G3 SoCs.
> > > > >
> > > > > RTC tracks clock time during system suspend. It can be a wakeup source
> > > > > for the S32G2/S32G3 SoC based boards.
> > > > >
> > > > > The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> > > > > alive during system reset.
> > > > >
> > > > > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > > > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > ---
> > > > >    drivers/rtc/Kconfig    |  11 ++
> > > > >    drivers/rtc/Makefile   |   1 +
> > > > >    drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
> > > > >    3 files changed, 395 insertions(+)
> > > > >    create mode 100644 drivers/rtc/rtc-s32g.c
> > > > >
> > > > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > > > index 0bbbf778ecfa..510dc2db745d 100644
> > > > > --- a/drivers/rtc/Kconfig
> > > > > +++ b/drivers/rtc/Kconfig
> > > > > @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
> > > > >    	  This driver can also be built as a module. If so, the module
> > > > >    	  will be called "rtc-amlogic-a4".
> > > > >
> > > > > +config RTC_DRV_S32G
> > > > > +	tristate "RTC driver for S32G2/S32G3 SoCs"
> > > > > +	depends on ARCH_S32 || COMPILE_TEST
> > > > > +	depends on COMMON_CLK
> > > > > +	help
> > > > > +	  Say yes to enable RTC driver for platforms based on the
> > > > > +	  S32G2/S32G3 SoC family.
> > > > > +
> > > > > +	  This RTC module can be used as a wakeup source.
> > > > > +	  Please note that it is not battery-powered.
> > > > > +
> > > > >    endif # RTC_CLASS
> > > > > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > > > > index 489b4ab07068..e4b616ecd5ce 100644
> > > > > --- a/drivers/rtc/Makefile
> > > > > +++ b/drivers/rtc/Makefile
> > > > > @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
> > > > >    obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
> > > > >    obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> > > > >    obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
> > > > > +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
> > > > >    obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
> > > > >    obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
> > > > >    obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> > > > > diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> > > > > new file mode 100644
> > > > > index 000000000000..3244b23c533e
> > > > > --- /dev/null
> > > > > +++ b/drivers/rtc/rtc-s32g.c
> > > >
> > > > ...
> > > >
> > > > > +
> > > > > +static int s32g_rtc_suspend(struct device *dev)
> > > > > +{
> > > > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > > > +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
> > > > > +
> > > > > +	/* RTC registers are being reset in suspend.
> > > > > +	 * Thus store standby time.
> > > > > +	 */
> > > > > +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
> > > > > +			       &priv->sleep_sec)) {
> > > > > +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
> > > > > +		priv->sleep_sec = 0;
> > > > > +	}
> > > >
> > > > Strange. If RTC register are reset in suspend. How do it wake up system?
> > > >
> > > > Frank
> > > >
> > >
> > > Hello Frank,
> > >
> > > I believe the transition between resume to run is a reset event. This would
> > > lead to the RTC registers being reset after resume from suspend (triggered
> > > via Suspend to RAM).
> >
> > It is weird design. I suppose it should be design error. (any errata for
> > it).
> >
> > Frank
> >
>
> Unfortunately I could not find any such errata. But this behaviour (RTC
> registers being reset) is what I see when resuming from Suspend to RAM
> operations.

Okay, it worth add comment here to descript hardware behaviour, which is
actually uncommon.

Frank

>
> Regards,
> Ciprian
>
> > >
> > > On the other hand, the RTC is kept on during suspend for as long as its been
> > > set up (for example via rtcwake -s), thus waking up the sistem via an API
> > > interrupt.
> > >
> > > Regards,
> > > Ciprian
> > >
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int s32g_rtc_resume(struct device *dev)
> > > > > +{
> > > > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > > > +
> > > > > +	return rtc_clk_src_setup(priv);
> > > > > +}
> > > > > +
> > > > > +static const struct of_device_id rtc_dt_ids[] = {
> > > > > +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> > > > > +	{ /* sentinel */ },
> > > > > +};
> > > > > +
> > > > > +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> > > > > +			 s32g_rtc_suspend, s32g_rtc_resume);
> > > > > +
> > > > > +static struct platform_driver s32g_rtc_driver = {
> > > > > +	.driver		= {
> > > > > +		.name			= "s32g-rtc",
> > > > > +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> > > > > +		.of_match_table = rtc_dt_ids,
> > > > > +	},
> > > > > +	.probe		= s32g_rtc_probe,
> > > > > +};
> > > > > +module_platform_driver(s32g_rtc_driver);
> > > > > +
> > > > > +MODULE_AUTHOR("NXP");
> > > > > +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> > > > > +MODULE_LICENSE("GPL");
> > > > > --
> > > > > 2.45.2
> > > > >
> > >
>

