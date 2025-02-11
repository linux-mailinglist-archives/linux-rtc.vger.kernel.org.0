Return-Path: <linux-rtc+bounces-3156-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19FA31270
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 18:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860147A01D0
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2025 17:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A6D262142;
	Tue, 11 Feb 2025 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kfeeSVW2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37366260A5F;
	Tue, 11 Feb 2025 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293639; cv=fail; b=KR4REdNup1CTvpkrX6N+ZRrER86uvJXIqsHL7ViUUfLqJO1T+lRDJu198q2KYGs+yCc5Bwu0HJy7e2HtpuS5iKL8u61pdHVfnGpnwrMAXS3rHQRDvgplrRekQdVq8cDDHAZZstn4V5cdgrwKoy8v3HdlHtWWmM51JpqgGFTCFnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293639; c=relaxed/simple;
	bh=ryapaPoyLy7PX1rznifPvHxQaJH6xV9JFWVNEen6sNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XYuDClDAxfbogpkSK2jXneA3e+7+Al6yNTNAEthIIZMSmgHHzYJO+xleo1t5WFn9u5snnv6lqZ5AvF6MZiNcyhY0oMekcuiVbCaWCvoE6EN/nS/I4bdt16AB0gUp7qOXGlgzuZkASspREESvo+XCj5Q+qTrjPS7zZ0JWYimhYLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kfeeSVW2; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAOUAWbRq9AJHlbhK68O7MK9jcFPJPJuRN5BLyKKB1AFmmhfL8apgjAfCJ8xj4yGstxe+r4/E0xaARrw3gb4/eouU9j9tiwfIqgCkMD7Urnl/oyEqpIHZih38Ruc8KagDpNBJqbLFzidJ2nWvZ9dgVVEmJnOAQlQW+c9T+uqAWyS0oaAudY+xMHzqdw+rsrOpNnSvSIKE2mdFzGgqdmO5zfUQtRt+quAfy+Hu7b7H32qnjcSihlveEsz4YTNrHd/vwL1r2n/eSycDyUFncRQFn/svVlV0FerbeMlnvaFQFel4+Yoa0/eLtCUQJ+uM3EmTkW32JLHWTq88B1zdpo7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qJfZw2fEEPNJgODLs1N/Y+IIc83BcZqyo86+dbQDLQ=;
 b=SI7Ib/3gh8j9787/CAFwQh4NYK7PIl4KyYLQHTucst/fzkhqAlMk3rGo46ocG8eqpLuyoCD5UfNXxXoNtpP+D87yuj8I5o0BI1I0AkTGsw1k01NrHXIRzIc2Gr8C+x6VLiCFS8E6fnk7LdAqYUYt0AuMVZqp6kbCS8wdrDMelU8sVdhIWFqLa2F5rJ69R+kRp+wJR3aHH7VuT4dLyGYonm3H8Xl3KUtq6hm8uU6ImqFLbMv7zZBdV8Z0qyTW36sI8IbWQfvfEi4aoIwrm/VnIx3X1WpH6GQXrySAaijC2s9va4xy2hwK0Vej9C1Hocw1ynMop0EoyJTykFJXwRtEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qJfZw2fEEPNJgODLs1N/Y+IIc83BcZqyo86+dbQDLQ=;
 b=kfeeSVW23dp9rxklNJf5pFXcshhiIuDbx9m5iN+mgZ/9AwIXdMhaRmXtFaArNaofdQnO3D9bmDSeKGKIef80w7L8w8IbDY15PmY6HyU1UbOXzQZoWoL6g7Cx8RfwHuFRGnz6k4JTviG5WOJtx1Q6GA8ajU3XgcH7HplQ/uywBGksZqewynnX/iARYFlMP6iR1MS3c9JzwxsiG4yrNdX5RGRRHnJo5vT2b2FoVipNlmSRYFRQiwA87pAi9Udn6svncJeovkNzzWUr6RkTj4Teefv69918RshWVRr9+OEvAuTUrd1xQawWWQ6qcdSCbC3cvev7LrjZ764q/KGTVRmjbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9774.eurprd04.prod.outlook.com (2603:10a6:10:4c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 17:07:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 17:07:13 +0000
Date: Tue, 11 Feb 2025 12:07:04 -0500
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
Message-ID: <Z6uDuL97EB9KqD4b@lizhi-Precision-Tower-5810>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
 <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
 <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
 <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cb2620c-46d0-4334-bd41-58b2720c2cca@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: be42cecc-796d-4039-8c30-08dd4abe8775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SVPS/S+qXoL3J9QNOuCOGUC+N17aAV9UtjgiItrr0uzLEVoM/twHMF4SLjww?=
 =?us-ascii?Q?RzfkMJnmuCzX9mNQGEhZMzzg7ozetoGUFwKPGYGaV2oWVRRU4OFJxLCFJR2W?=
 =?us-ascii?Q?qgNs6QD78a+ObE/THuKfKGJw6ZOAvfT7BIQh3E8kwLjHl838ZVj5SyD9ny8P?=
 =?us-ascii?Q?NvTAYfjwjJbpwrZMjoQOV3BdakHOx7yfSHWFHXcBUKcMLfBobARvlMaNoknO?=
 =?us-ascii?Q?5bW6NtKeaSSJAesbQZ+Raxt7sDLX0Uq31GI1y+PiMEaVwbCRUnb2qmsktam0?=
 =?us-ascii?Q?dP78d76i2CpD8p/eAqdzvJPHVqA4JAJAfzFRsXqsVx+Jd20+JvIo/x/3Wc4d?=
 =?us-ascii?Q?uuxaQH9T8QDnB22UsDWVSN4P76PCI7SKSJ8US3/cLY+c3UWw0/uizkezpykM?=
 =?us-ascii?Q?wD+sPyuBhn7qqkb9hPRZvClHdtx2+az73ReXffWUDazdZjJanC/TkEu9thAR?=
 =?us-ascii?Q?jsqUElm73J06LUkcIIn3FyAH7xzgybFUO9cQRLlSRo5fwN6MH9JXUBL9n7cV?=
 =?us-ascii?Q?dUwQMt33z5bkMuHwftIe8XSAWpcSvgrj5zyKgohyrx9qa59cE1EK4wXY0zrt?=
 =?us-ascii?Q?SotgR6QN/qVuOxOq+NKT/23H4g3pmgYDo7/zM0Rm05wYWjzDjyIPWuH0aQmm?=
 =?us-ascii?Q?kEw+EcmVp23ZcZTnnyhEHRbyibAEWIKm9LfH4u2tZi6Mw0IKDs9iu+lqiwRK?=
 =?us-ascii?Q?QoarUUXEqvPQ+2X4rQU8CGWCZDRKBFgxp04YjjFXBsyUaIfLTCDtMHej8MVb?=
 =?us-ascii?Q?JaSty9BH/dcSD9CaYknoqffm0J7VpOWRoC9WG8M+PZ+sgTRoRDBYxk6DJ9J1?=
 =?us-ascii?Q?pT5RbBCWW3c02IMMZzOr7NGNGdflrMyVlhSzlwalxpSQrlY7vPEyx5aWmLHM?=
 =?us-ascii?Q?lJDqD762K3s4tJ2LR0fMGO36id+DLzVBpyXLzqRKL/NIhCDbam5swWkDysSl?=
 =?us-ascii?Q?Ga9bHtUbkCjKt34C7A8kYOwCbjfS/etaFJ/xl2CneTXNbiwsofipMV7lOT+u?=
 =?us-ascii?Q?hICnhW6B9OTk6BbeFyl+9u765BoidjzxGM3l1msH1FjpYMbzdrWDIwYaSn8i?=
 =?us-ascii?Q?hR56Ri9OdQ+5XXnj2kKnGT1vrPM9UiaB3/KRBBJjbBLQgQwflRZjrUaSiJ8W?=
 =?us-ascii?Q?IVgsGIsr8D7xQNyvgSdZ2qoM8j+e5FND446w9CPwB9p+Qigb4xaZuOonEjIw?=
 =?us-ascii?Q?oLjW0spjvVrQMDlzDEZEVJG+Kvm20jwTIr493qqnjB0riGrQcw2f6YlG39tb?=
 =?us-ascii?Q?+ko+zUnh6QYhR/BTagWzlzVVa55brqmg3J65eQCax5jAK9lRQfmEuaS1Yk+9?=
 =?us-ascii?Q?mxHf8xs5qMPx/soDPGewQmZVpZBH9KE2otKC4y237SV9l9Nt8rvLoFtDHb8e?=
 =?us-ascii?Q?W5SqEQbqFOp0A93MDoyGJCcs9JCrJfc2OAfujMtcp1w7LTVyMxY3lonle8Ig?=
 =?us-ascii?Q?GtZUmYCo8fyhBo12hKpZ1sxwejnjTf5B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?khSod9p/92hlMwtirwXLLxHzJV6h4Rz/fWOKQ7xblv3RbHiimkvAoST+l8TT?=
 =?us-ascii?Q?s4TSdB4vlQCXchnT5rsDf+toanyDtyJfK4/NPLIoVkCX5sZR7K4/ex7135Vg?=
 =?us-ascii?Q?TwdBawTxJ0SncNRLVoknd71lgZDS7jkMQzP6LHKTsYKEH63KLXxGW7smQO1s?=
 =?us-ascii?Q?+KYCqr3qfknfw0+qK1bbIZzt5FORXA5GU6JskQHRjMUgKoIKv/7mGoGnSo19?=
 =?us-ascii?Q?YD5i82G2Opskgsd/PaMFnsYiIFdkXU8MAbJhoR2yobWg47jQHa3GMPpu0WKh?=
 =?us-ascii?Q?xa2jXD3rgQgmwq5Kblk+ZLTpzEJBkQVYCdA4Otrw2dW4jQ+mNrzpaB/2FgNY?=
 =?us-ascii?Q?CjnjvSDL5UwvE6m7jP5pJbtRitkT3fpyljzoaP7T22fwWX4wMS8Pzvc7xyfa?=
 =?us-ascii?Q?LrYLT2YpMPTpLcD1Ceaumbg0EJZyU10k4GcXKWM0HD8NcK7hd7E7wSQbM1gM?=
 =?us-ascii?Q?qN1FtTeoNp+V3XjUNTMeYw0prm0TniWE+izXQ3k27YBXdqz8aNBnOe4hYxD6?=
 =?us-ascii?Q?2IS/BpycM+jhDz7R5LgYJwVxKR7CIdbb6a2McLa4l4a9Y2kFzAYuD6sLgN9Q?=
 =?us-ascii?Q?xUtTjkEez3HaCh5pE0XIiYnjuJ5BzklF4TmBCLIvuWcLaAivyeGVaI0hciCA?=
 =?us-ascii?Q?4A4I0bi16KqWMRG65DSSyJlCml6kGpt+CjYSvrUfx+vh0ExUKfwoQw0i5usI?=
 =?us-ascii?Q?54TUig1SrfOXfW2GtlXB2fUPw27ledYYLqOCeV10S1+mMgAUH6SSVra0XzHo?=
 =?us-ascii?Q?BOxaajgjMgZWZ1xd1gy95WnZycuGpBbhdlbsRVkvH+i0aWV7ro50A5knpAUr?=
 =?us-ascii?Q?WPs4rwirpGO+FywFXeRvznLKQu6U11yDs3iggau1PFcs2MyZFnXHjSuZKTI8?=
 =?us-ascii?Q?88I9fwuR747zpwMjyausd2KV3ngNuqf0tzvd6tFHJdmcgpoRJbsJUUrCrZaG?=
 =?us-ascii?Q?4jrFGou0yJB/cbHmkaNAc37UsBP1P7HjbSEM/Be3PaDnSJW3yR34SbpS2P58?=
 =?us-ascii?Q?lvNhNsM3/xDg13BTSfpaz1YjLQY3i7PXumOnXbDmlDGIOPb4Z9zw/GRZkhLq?=
 =?us-ascii?Q?LQKNUl1vqTZlCx5MK5BZLNzOxKpZSwzU0P5BR6RelBR0rPJbih2JreKPhib2?=
 =?us-ascii?Q?IeTOFuuxKOpJfDzZI6L2LXBbMRrUpxQxknbPYpBApCl4wvGHHAD+R50xExYJ?=
 =?us-ascii?Q?ghc9hnBUYNlNhVqqmmhCLyKxOO9WkLd7lwTpGdT/zncN0CW+gqrIzr1MHxZr?=
 =?us-ascii?Q?lOj8itLA1rOvTUhKRXIyv7CccgOQ5EvF4ot1sQMIlJQN2FTc0IKXZdTh8NuX?=
 =?us-ascii?Q?ejc32YT7U6zfm8p9uxgVw4J7aaqej68s6LHIz7v2qAiuNUqqqevsKz/9IIW3?=
 =?us-ascii?Q?yScEXE1F7rsW1AfFwDXF1qVWs0ORz4YtK21rnek9G4V+DAN6Zr/uReBYHkR5?=
 =?us-ascii?Q?qgSakn+L0OH5PmdGW9PgbEFlI7rYZu2QG5jHmKYCdtkCJXLIqLjrA95qjyiH?=
 =?us-ascii?Q?VxC+deKrp1iB3MzhkeZoVdUe0E2qx5RSnokW4Q29ytok/Hs9DRbbB9TyE31l?=
 =?us-ascii?Q?F4fSm9nyn+mKuiFUhHrM5/YAOFXkd9cmI3Q3uEoN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be42cecc-796d-4039-8c30-08dd4abe8775
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 17:07:13.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UW5andtrcmprZ6XgH9/84xC0IIW1lEtirIlt5FO+Adaw4VmWa7iCAs7NLZGUHb0SXHBvqP7DGQIbT6l6B1Www==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9774

On Tue, Feb 11, 2025 at 01:25:38PM +0200, Ciprian Marian Costea wrote:
> On 2/7/2025 10:16 PM, Frank Li wrote:
> > On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > Add a RTC driver for NXP S32G2/S32G3 SoCs.
> > >
> > > RTC tracks clock time during system suspend. It can be a wakeup source
> > > for the S32G2/S32G3 SoC based boards.
> > >
> > > The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> > > alive during system reset.
> > >
> > > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >   drivers/rtc/Kconfig    |  11 ++
> > >   drivers/rtc/Makefile   |   1 +
> > >   drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 395 insertions(+)
> > >   create mode 100644 drivers/rtc/rtc-s32g.c
> > >
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index 0bbbf778ecfa..510dc2db745d 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called "rtc-amlogic-a4".
> > >
> > > +config RTC_DRV_S32G
> > > +	tristate "RTC driver for S32G2/S32G3 SoCs"
> > > +	depends on ARCH_S32 || COMPILE_TEST
> > > +	depends on COMMON_CLK
> > > +	help
> > > +	  Say yes to enable RTC driver for platforms based on the
> > > +	  S32G2/S32G3 SoC family.
> > > +
> > > +	  This RTC module can be used as a wakeup source.
> > > +	  Please note that it is not battery-powered.
> > > +
> > >   endif # RTC_CLASS
> > > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > > index 489b4ab07068..e4b616ecd5ce 100644
> > > --- a/drivers/rtc/Makefile
> > > +++ b/drivers/rtc/Makefile
> > > @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
> > >   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
> > >   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> > >   obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
> > > +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
> > >   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
> > >   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
> > >   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> > > diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> > > new file mode 100644
> > > index 000000000000..3244b23c533e
> > > --- /dev/null
> > > +++ b/drivers/rtc/rtc-s32g.c
> >
> > ...
> >
> > > +
> > > +static int s32g_rtc_suspend(struct device *dev)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
> > > +
> > > +	/* RTC registers are being reset in suspend.
> > > +	 * Thus store standby time.
> > > +	 */
> > > +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
> > > +			       &priv->sleep_sec)) {
> > > +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
> > > +		priv->sleep_sec = 0;
> > > +	}
> >
> > Strange. If RTC register are reset in suspend. How do it wake up system?
> >
> > Frank
> >
>
> Hello Frank,
>
> I believe the transition between resume to run is a reset event. This would
> lead to the RTC registers being reset after resume from suspend (triggered
> via Suspend to RAM).

It is weird design. I suppose it should be design error. (any errata for
it).

Frank

>
> On the other hand, the RTC is kept on during suspend for as long as its been
> set up (for example via rtcwake -s), thus waking up the sistem via an API
> interrupt.
>
> Regards,
> Ciprian
>
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int s32g_rtc_resume(struct device *dev)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +
> > > +	return rtc_clk_src_setup(priv);
> > > +}
> > > +
> > > +static const struct of_device_id rtc_dt_ids[] = {
> > > +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> > > +	{ /* sentinel */ },
> > > +};
> > > +
> > > +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> > > +			 s32g_rtc_suspend, s32g_rtc_resume);
> > > +
> > > +static struct platform_driver s32g_rtc_driver = {
> > > +	.driver		= {
> > > +		.name			= "s32g-rtc",
> > > +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> > > +		.of_match_table = rtc_dt_ids,
> > > +	},
> > > +	.probe		= s32g_rtc_probe,
> > > +};
> > > +module_platform_driver(s32g_rtc_driver);
> > > +
> > > +MODULE_AUTHOR("NXP");
> > > +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.45.2
> > >
>

