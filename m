Return-Path: <linux-rtc+bounces-3179-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE672A3357B
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 03:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639F8166203
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 02:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13411FAC42;
	Thu, 13 Feb 2025 02:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JkEgpjRp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361814A60F;
	Thu, 13 Feb 2025 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739413460; cv=fail; b=lgWwN/p7WWyEU40VjtYCIrVMmJLSVVqtzQKS2umKGA+J45lkj17lX8B7gBp6y12V8x9r7wpS72MYCirqXdNczyXMo2lpizZejt1TAECm5Y0rZIFnC8p4FL9Kx8bqMkGNq9B0YMr2edqDDQ9Sxn2ksZX8fkwb9M6IIaS6cGedGeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739413460; c=relaxed/simple;
	bh=p/Rj6IdgvF6QPuDafIkWJfIKnQSXHKM64+Gms5uzPXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i5T2HG3ZLqTYdxHmtn1UlbxF/j8HPbsBHxlixKULxy2fkw2JXQlZto/JEbvv0hdfe/NAymLArWyVTDmiV6y8CQ6tE2i+iQ8CbTZFjTVYvM20NFm40MnodU+7uItHt+tj2lg6DIg+gjCXyKgA63/FSVbF+3C0FvW9+FpZfh4rLyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JkEgpjRp; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbfE4of/JKrxPWoZu/3gecX9REGin8/vXwgkT0SFEXN/ATz+K66SLExPhmRSNh41zrS3f4TtMBqeLtW9HFo7q8d/JtTuwuHxnhbY7tGrDya6MWNMsJ8Uww7coFPyfbkNpPdMmooL3CGU/HLSFldesllZghzRZJ8K562Z1Wzs9rkixc6sR893PoZ/Zcw0bvGWZuW+yGEh+z4hTIOlohtZF7JWfOlfnbncRp4qRHDH8pbH779gndU1jBrQdt0WvLvkq3sGsyN5yccch4pMNI++j9GmOrPqp4Ro0UEi1oKh6kiO/2BtFN45c17iRPHXBn4zZRSQNUhgnKyUNTcwaKuscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAwP6Xb0l5JsF/9QVjiIi2+DCiG65XZXDwLGoGDyRjw=;
 b=xdmf9/TKhdJ91AhgF1oggL/VGN2wT9+VnbC0manpuWLNG+BYpoSD9sLKtJY0tor6GhFeVjCt6Q5zIx9C21LgJwlzufnUSFs2rlT80cCZjyKjEa1DBzDpV82RHHShDxyl5uFCLi/P6QyHA/d7SSsBrBuY7K17YeKX18KSMTZy20HeSpR7nNn7YHmTKsppxUmE0lQEEeoYsPXoDF/mcxtGYYRSqcoJjrDJXRI0qU2p6qq9D1pvLCBuIB6VXSelrWUgzU0QlxGJEe+CH4ca+Vos3kDVFTnWNH5Co22xnxYWTUneQoWZm9A9xdKwIW/NLRyyZ+s+K/o87AMle0JyFsFzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAwP6Xb0l5JsF/9QVjiIi2+DCiG65XZXDwLGoGDyRjw=;
 b=JkEgpjRpbytDFjccPQNRNaoACU4WFI2MS1ho/zwJKkDkQjjMtxOx9UIPjbqXQyX8TxV1p9h0Hsx06/FPi9Cvte30PB2B+cumqJF6GIeRnPHcBHPvaMrEKnjDH6d7PJJUTGa2aE0NhQzzlufZHMI9H4Uj8ODziH5vDBh0QRs3AiUfm7KbDvZRbkNzEmzxI0qqaIcCqIJD66lmCO1GWhqZApYfi6FoB+oRY74OWCwYoChrisiIIS6vq/C8n9i+kj4rGdgzYAm5uhCDNCR8IqWd3eXC+EnCVLwTWxbsErY9waqkGZm1yYvGZ4/I9TVEAqa51r0Gj72qTPdN2qunYFvf8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 02:24:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 02:24:13 +0000
Date: Thu, 13 Feb 2025 11:30:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250213033033.GA21937@localhost.localdomain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212170147ee6863dc@mail.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0208.apcprd06.prod.outlook.com
 (2603:1096:4:68::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: c39ab9fe-e8e0-489a-ae77-08dd4bd581a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bc5g9eShzBa3okscf5rVFPkAX9/ahdvViTFxpr53hvUidaFugd4fN/XCP3X+?=
 =?us-ascii?Q?b+yVlvF0bru2a5KDCwo1ybBo1M0ouVNKX7iwQ+nvArP1v+d8Um3mO2rgwjlO?=
 =?us-ascii?Q?eXTiJTpRWUArfYth5ndkL0W0J6gEtmyiz3eZbyOT8rvRnEU90URYQ1n7aRCA?=
 =?us-ascii?Q?Q70OlldZ5PaGB6UN8wMKqOPZRzRxfzo7nIu76dq5HHG2+pLwySpb3WeohUDK?=
 =?us-ascii?Q?0zSYy5dGrL++mts+I5vhmaP0eVcjev3vyQlFAQDKswwLQ8+SWBZO7lJr68/O?=
 =?us-ascii?Q?j/NNw6o4omxAdonLDmgwDVdQiz7arkmmg3onOH2YI/oPPK1218bUPj3dP4m7?=
 =?us-ascii?Q?v5TbmqeyiQth0V2EPXsFIQ8QQ0iUMGjbFZUR0EFXtu+OT0dltsvxpTn0aXQR?=
 =?us-ascii?Q?NnPsOdhpON7OG6Q3qSaAHPsMdx0o5RDv5KiqT4Lm5rNGHKBvJCE1fYN2CXYh?=
 =?us-ascii?Q?a7e1z+S0mGLKN85MBNu2FtAN0B34kHUZz0PmQkH8H8hQBJcQr/iFOGbMPi5P?=
 =?us-ascii?Q?ONVB8f+x1DPzki0pFsOA6TsTrAwriSDZodun0tb5BrJDwmS1iJYtzvqEO8rt?=
 =?us-ascii?Q?MG9KYRVB6cq6oMt89a2hs9ahOYSu3mgdfmaWxgg3THYaQNeEndx4p2gJfiP9?=
 =?us-ascii?Q?Jfv/3+vOHC4p6kZvH6bh+rgjVaHPojDpJp4rlUJ9hft8dZz78svc+XaEZPGI?=
 =?us-ascii?Q?dewYu+WHLGnAc7i42TOZ7cMyqLZwqhCHJGqlZyz4w6Cv27UpIOR6x+BQ0PPO?=
 =?us-ascii?Q?GCvHuWkfbqYLzqWThazwpRPyGKc0+dAoldsyczTujn7wxOqpZm3NfwaUghfL?=
 =?us-ascii?Q?/XX8XMzyowg3nVnuGprhmRNZLkkVX3FZgYu/TyiRQpyS+WEhuru3kcUplMgX?=
 =?us-ascii?Q?1eo2PJGC2vsyD3DmuXq2rpnr3pCT2Ln4hcN0vFjl05/yyqvO3dhuCmcH2b90?=
 =?us-ascii?Q?aXEyTbPV5GwVtsukQHf0Ja5e++HDmGXhDrvIHCRXNq8uO2cxuEljsaOVsGIE?=
 =?us-ascii?Q?vwle4PTEHDMjZcWOJg4dydRnAUpMnr/Ac3c2GdlC3zwy4QLhvkz/PSYK5wlt?=
 =?us-ascii?Q?zZNLuTeUwJNPS6i27S53Cs0x7X5BeT9X1D0SMGDHHW8l6x3/PdpYgBoTSorq?=
 =?us-ascii?Q?ND1L76dAI/hhyZLG47mdcXXbGNk7jUAsJq0htg4AH3tiyujqDg5C2CXTOfP+?=
 =?us-ascii?Q?KM7W/3UjCnZ0GDW2s5wRKbbAXv7v4aNw4J3NATPVijFpUpGWVS9FOrN9CKov?=
 =?us-ascii?Q?QF/pI6lpwrQlqvigudRYGAatWe9DTvR9VzOcX2HEUCvj4kTa4ev2iy7HQ66o?=
 =?us-ascii?Q?8YMyG5LY0c5mjJkuuQCcIC0ouXEn7jUmbJqCNAnJlLQh0ey9qKBzdvOYfe/y?=
 =?us-ascii?Q?6xQ8Rg6hc0mATg6ll+i/PS3bR3Vi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hHgTjS64/EddcRzpEbyGjB4r2oBTJJhA2MCpoTZLyWZFYyEuVYlJDjHwly6D?=
 =?us-ascii?Q?8zHoIZBlnYjaMFh6IXTYlzDpc6NX1R7MaWwZCh2dKGZYo2y+Xmsal/oEcfhC?=
 =?us-ascii?Q?t6onpzB9WB5MbIi4wC/SaLtibu7XGBfwfKjJGq/3FxtT4TyZtQNk6WTP+zWA?=
 =?us-ascii?Q?QKo5GBombq7vQhvSGzK/TUSEbXffPSi9x17ER4/W54vvejZMIYPv+SuoK4zy?=
 =?us-ascii?Q?NUv0TRRG/GXJEJGCuO/ylgfpAIqjvUb3AoRbhMM9BULvfHrwaAKhfg9G5jqN?=
 =?us-ascii?Q?PBi1LfX8QCJpjXPw85Dy8qIMqGgReS2U7JGSxtcRaxVGwzhKJjdk64mcrcGv?=
 =?us-ascii?Q?7Q4dQRkwuLc/962VBPKgJrv1P+oExLtLeYkDenOjJlnITfD8PJFVTJq+9/vx?=
 =?us-ascii?Q?GcoJBqbM5A6rkTX30/11uBdIhnnOVJrTgyZKlMnp38CeC2ZMz4ehsyBkyHjX?=
 =?us-ascii?Q?kJlV8Svbe/Ezb2E9LgQ9XzImUxl8iwyxcjcR3u/ne5TnUwJvrZ2U/UzVyXe2?=
 =?us-ascii?Q?tjGaq/OLyCLhjcxu7ohrUuY3F+ZVIY/dm8tu7psMszll3Jv5UXwNocT2Ttwk?=
 =?us-ascii?Q?OZrxaeSXDF958gDOj/fvYszs0Tujj5Vc0LlDKGYKQ3J27OrvnhZtYah8YLGY?=
 =?us-ascii?Q?LFbJ+Z+145qCsULyuVcBj7RUIfaNjXSei8GyhizmVclDm7z2zeQJlJhuawzl?=
 =?us-ascii?Q?hS5OqxFKB3MA8P/k5jqi7TfxcjAyoutDOnoZTc4XKE2TJScQJeuJE6+iUPyf?=
 =?us-ascii?Q?3i9YfOWPfx0m2epttDAOdox+qYtZaGXA+BP5NJlz5YkS1b8asR5S1KjUOsBv?=
 =?us-ascii?Q?SKpd7Rxth6yi9q9KyiNJPd9gM3Z0F3teUip5pm1Duk2pQYGnzjonXrDxU7+w?=
 =?us-ascii?Q?zMwHDrp7RvOn4CFUCA8ehzWchiBPJA5hurZ7IwMAx2xVNqpn9hlLfbTAbw6e?=
 =?us-ascii?Q?Rt54j5SCcGO1D98G9TeMAwM23hi5ei+BYBz6a4Q3zSfxNejRY9L2ixGhZwLH?=
 =?us-ascii?Q?vKUbQ/8OrrSjCQ8xpFt1ML+cam/+8w61Tm9+9f2c/zqGp5WoAl/3z6FNCmJt?=
 =?us-ascii?Q?9QVXmfnVlFaKTmwPdORZA1A04YDMajUkE4A4eoFWWSqNhLQ3LfMU5LUakl6m?=
 =?us-ascii?Q?ZJypxPhhdJPb3sX4oAkO43mmd0/epJRrN1iefGte60Io5SP/x8EdYEs7a+Lu?=
 =?us-ascii?Q?i2XOXHfiXePHLr8ddG/5GZwJUv2tcs2VUAwqEOucCv1YwBmuub9Y90BEoe6p?=
 =?us-ascii?Q?WUTsT95GtbgoMyCjuJXL80ri41icGmKlEoyPftbPyvzYFav719KcOVELzDKg?=
 =?us-ascii?Q?u3ovF1vmpHdOiuDBch9KfjKe+QtG/oDvBX0F7uduttejPxxbeb/L3zRwKpKQ?=
 =?us-ascii?Q?vHiCoefQe1EgA6FKwiFKzhmcteX4Qu4818ySdFtASX3okcYIqpgA5RMUD9T9?=
 =?us-ascii?Q?q856HOSpMMZWOMEleOfpBrx6i7Wunv1OwBoA4IRObL8co2oV5giH6dzuXi1U?=
 =?us-ascii?Q?gworR6jPEehfoTl14K6DM+l7c67wSc/HK67cH13gvQyDIqea5JGJN4soMpTi?=
 =?us-ascii?Q?paE0HeWQsBJoL6rf44aphbHe+w03Ifjt6rjNxhlG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39ab9fe-e8e0-489a-ae77-08dd4bd581a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 02:24:13.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7x9b/GKMEwwIzFozaD0IRKiD/Bt+aJ1qNb+0lcZivoYGjV5cd/BaymJQuLFYbYhvy0HiyqZHL8CoAfAgK6lXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On Wed, Feb 12, 2025 at 06:01:47PM +0100, Alexandre Belloni wrote:
>On 12/02/2025 10:43:24+0000, Sudeep Holla wrote:
>> On Wed, Feb 12, 2025 at 02:35:32PM +0800, Peng Fan wrote:
>> > On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
>> > >On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
>> > >> 
>> > >> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
>> > >> 
>> > >> Two RTC devices are created, but share one parent device.
>> > >> 
>> > >> Do you mean each RTC device should have a unique parent device?
>> > >>
>> > >
>> > >Can you point where is this check for unique parent ? I am not so familiar
>> > >with RTC but I couldn't find myself with quick search.
>> > 
>> > The RTC ops takes the rtc parent as input parameter
>> > https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
>> > "err = rtc->ops->read_time(rtc->dev.parent, tm);"
>> > 
>> > So in the rtc device driver, there is no way to know which rtc it is just
>> > from the parent device.
>> >
>> 
>> If that is the expectation, you could create a platform or normal device
>> per instance of RTC on your platform and slap them as parent device.

thanks for the proposal, Sudeep.

>
>This would seem like the proper solution, why not using an MFD or
>auxiliary bus ?

Not sure which is better. I need give a look which is simpiler
for current BBM RTC.

>
>> 
>> IIUC on any pure DT based system, a device node exists per RTC and hence
>> platform device associated with it. And the RTC devices are created with
>> parent pointing to unique platform device.
>> 
>> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
>> > current RTC framework, we could only pick one RTC and pass the id to BBM
>> > server side.
>> >
>> > I am not sure whether Alexandre wanna me to update the code following each
>> > parent could only support one RTC or else.
>> >
>
>I want you to keep your changes local to your driver. I already stated
>back in 2018 that you were on your own with the imx-sc driver and that I
>don't like seeing multiple abstractions for existing RTCs. What is the
>actual use case behind needing to access both RTCs using Linux?
>Shouldn't this be handled on your firmware side?

The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
could only be read by Linux and configuable by M7 per current i.MX95 EVK
firmware.

The firmware itself does not serve Linux. And we not know others
how to use the protocol. So the firmware will not be updated for only
Linux.

I got your point to keep changes local to the rtc bbm driver, I will
give a look on how to achieve this.

Thanks,
Peng
>
>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

