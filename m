Return-Path: <linux-rtc+bounces-2508-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E00869C4408
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 18:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70EE31F23671
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 17:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC1F1A38E1;
	Mon, 11 Nov 2024 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YAFgCGmE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30863224;
	Mon, 11 Nov 2024 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347226; cv=fail; b=OHc/jbkbqpy+2BGKoA+G1XnuWhQNEH8Dv7EXc9u5Z7QOBWbHoM2atePslWJLoTIuAYy6a+BKIrm7m5ekhES7u4J+H1FSJHu0Sl2OUEyIzSbDweWqdIPIa9O1FCdmPYFKYRARtc/rAtlEnAG70QpJaTTF+SjLjKBk24yXisakSsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347226; c=relaxed/simple;
	bh=P5xupyt+Gh9Z8VGE69e5JzFLKFI4NaUDmLkj/xo2VlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V8FsbCAbCvTEGPvK+kCPztvV8rPbxNzpPSFssN/OSQylTZxT/2Rj1dE9BSGRgru/irNWbJyndSdAGrPd7HPUSzq6+Ce+ys739Eq6iLEPQAFgZNaEX75au4YQlkWTHF+ZhVZApCz9OD6GRKiC5/AFozCAu2cwj3/OSt9I0NbcBcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YAFgCGmE; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZGzjQk9DfvdZb2yPhMdwOnE89Cnkcx04L7q6SG4wLlWqDB6YMMiaNWkOpNgsDGuXgT0U2Duptx4+qLqSkWQzSPSpDgiztgQO9Iuozs35iHxhxprmlRTCP/dkpgr8eKMgQZvIdu/PjyDaX3+2qx+MAvBufFhrBUn5TdiPPRK0vRlWJELNxgEFKBKnPd9PC4Qu2tB+GglUzGiMvj9mUEFTmSxodG8CLeyqg+BKYcvzYCbty6bo1rE11ccnLvlxwRzBL3O655b2PS5PEk4QH+xf7HkcHJzyuqlaW6QGwxRBWzdTUKLMHcP41nY+AqKyhMUSw2am1PsrEiMlTmA9TQwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09OmE4RGZ4sjOW5QEJ9JjyEyyMt3bY1g+jPLIsLgCOU=;
 b=ueSSXWNDw9R1xRXxrr0yJBz1wDuceo5LHFAwzSxfA60d4m4Q23hfiJ49gzIYVKt/DZm6LewlnaSiXjC31nP2dGnXZ9LZBU9aFtM6jkL3EJiyCqX6092r1bmMxbaoQteJucMjT27W5xLvaS34kSWb7TrWZXa2YaRW6noHvom8l1mFWfsQb3jQ2L3yAIMZHX9fnBl1dr28sLmyvNcCgLxqBttU71SlLQecTNOR8+mwxH4uT8ZMFF7jhdJXEWsHtsA9li7yAo9Ki6WFsdZBHL7bZ3DncfOUQeIZp/ZGC+dAb/C1RSn3Jdy5DnGNJZRRaMNYwl9rWZhdQ6gdGnkqFgSFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09OmE4RGZ4sjOW5QEJ9JjyEyyMt3bY1g+jPLIsLgCOU=;
 b=YAFgCGmE3F25DZjlgxqwaTH4GgfVfp4/FY+ZjmC55BWYeHZnOKJlJf5M3yi4f7vFlyYl+nBCnd8UYidQzhc1Atf+ryWJsFughyF+G72ugI23zT1ntQkOnwBU6njl3QYcBtNSZo3avfq+Mh72gAVfnhAe+KkJb7wPoFQ3CiUa4yDEEyFTtEgfZMF3GlVizcQ8mkm/BMiDRDG6PkQcGWMYaFlimKG2FfJ8vF5glrLy4njkmRlqNfz+eSQ+aJAptLkNpQqGkw4ocOExtM/qUCTN0j8Hx/KuLHdhdCw/MnENB9XXA8DnbA67Xilz2Hl/nS1mfoiVxHjam5Rvt9RrZigBLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7700.eurprd04.prod.outlook.com (2603:10a6:20b:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 17:46:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 17:46:58 +0000
Date: Mon, 11 Nov 2024 12:46:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
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
Message-ID: <ZzJDCDWYkLjc4N0q@lizhi-Precision-Tower-5810>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
 <ZzIruvZcLqWTWwJ2@lizhi-Precision-Tower-5810>
 <5675df8e-5905-4480-831f-0e2b4a94c108@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5675df8e-5905-4480-831f-0e2b4a94c108@oss.nxp.com>
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: ca486e77-3632-44fd-7ad9-08dd0278d6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOgUHNVp2eSJWg2KavwZLmk8AnHTtmWcxG6dcWr5Wy3pJpRSvr23xO7XDsAs?=
 =?us-ascii?Q?uDhxeXLdvKH1dkBc8PZ5CNA3QQpgKNzEBBQhLpFeO3elC6n4E59g967Vkt5G?=
 =?us-ascii?Q?BbHQ9WwlTIsqjvYMEVlpcFHwLxDn0KmwB+MDWDyW1I1/KFJMJXYdvMJbRsHz?=
 =?us-ascii?Q?Y1+CQp5yiBeMaYJsSZWO/vWtGXvzE0JJ2CRjWjoeSicEzMIdadvkjfHLasj9?=
 =?us-ascii?Q?+tJC1lpflfnYj2EOBNfRqjrSHqqCYnv7ORItN4/jTJyR34pR2gSY8XFeKi7B?=
 =?us-ascii?Q?h229KA8JyRGMf8+7Vgb9xUAMgQtHINrLRnTg8QutqBe2ejC2MKOGKHTYIP/h?=
 =?us-ascii?Q?Yu9VWZNQQcjo62Wx5rcrxgImPpL8PqQKMsInbhLlmE7vKKDnedM5OajDFHf8?=
 =?us-ascii?Q?iRJW+oNlmQuSkISnq1VikkB3fzrjzwNTT42pAgD3OfQkk/sLVgz6qzlWzopU?=
 =?us-ascii?Q?oOkholnBB6AmZ4tCXhw4x1TeUWy41e0QuONFgzDRm/uztmh7lsZ0TJZnc7nG?=
 =?us-ascii?Q?zL1PcZWCUeW6IZ4qgsjETolkwst4RZ/C06mvhg2oDN0MR9d8dl8TB/1N2Q3X?=
 =?us-ascii?Q?2heMOhKNg26GSiCFkY21Hr8AoWpssOOMnMfAY/ls4aYmGBrkWFbN/36svOR4?=
 =?us-ascii?Q?iF8dgPxnOdYGe+Zv/DPVLDN06Qmp2qvQXJ+fDw4jMhORC0kfwvH8kZd8jhFm?=
 =?us-ascii?Q?h9wcoLtWWJY1VNL+q/HYcWYdTFb6Q4yj5NFdEGDxIdzBc2KP7Yz4IUYtTYDW?=
 =?us-ascii?Q?xC/VwW2oSo9IuHpafXzlZjatgObdrS7BBqe+q1OGY1Qsi37LTUGvawF591bs?=
 =?us-ascii?Q?71BrpuMebUe4yFNWNnmZqrQkTATL/iNhfLTx1seaEvE9OsNIR58Ly4tMGvL5?=
 =?us-ascii?Q?MyAwxmLNXsvoaRykeRbZD3foKuRFXK/RtW7rVfw3rrvFn1C0KlHt/2eylDOs?=
 =?us-ascii?Q?/cCuTDP2FvOQFt+2Cx900grhmhasHUw2F8Ey4dmHSoc3oWqxgDSmPPCRu458?=
 =?us-ascii?Q?VjE6qo2eYV4dwhdyLlZ3xKUij/QSg6dktfGa8sh+FIFUWLPAjDSJtbH/KoD9?=
 =?us-ascii?Q?YP8NwKNrAd3F3KiVqgIfjrBgJb6I5FtvvXyHxFg9vQEJJWuIYtpVeIS4m72m?=
 =?us-ascii?Q?lv75TLFacPqqr/6C1HvDCNWDNShZDInL108ZYsEYFyiDDQ3W+t5O1MwEClnI?=
 =?us-ascii?Q?RxRDVM078UD5JhZ5cAqx17wuJClcpx8eQMuPdgJLQRd2NJozJCCwkFNVxh+5?=
 =?us-ascii?Q?8Wl/KOn+CZZJzQ3IXEBqq4AksWvG0tK/sQfPViw5TWUPUeqfSrb9Jk/pFzlJ?=
 =?us-ascii?Q?gHQ0GFIuv8J7thrAjaMkK/swAUD7j0SuEd5IXOF+yjvScXaRagovV/+WmgCn?=
 =?us-ascii?Q?N7z9r3brHFmOweahN1Gxa7qoo/kL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQqdXOCN1Wxqzwx2FPHlq0Ldl/eqFS57nsHRbT77zVMv1+uU4Zz8zunVazeg?=
 =?us-ascii?Q?4TBX6vHTKWt3/3dbaKRzHAfuUNNd3+hmRYOfNXheg+nvZmXQeEk10M0674aP?=
 =?us-ascii?Q?vseYS3GEHHycy8ea3h4sGyk5gLKznfsRtfKSnv0YX7WmWcAEO8m1nPjYq8J9?=
 =?us-ascii?Q?b+ssq35OxBcMUt8uaSmb5LB0OO+DM+DCry323q/bvu9CfwQV7HNvqYJY7BLn?=
 =?us-ascii?Q?nOTILPWAJbuXjdeW/G4RqHCx/4nTXHt8egapGvRkJZUff03sAt6nkOwG/h4S?=
 =?us-ascii?Q?us8m8M+tVGu8FEGJyby1fhPQK2sEU7fMnB4h0FFDJftnogSRBj6HXAaJk5Y4?=
 =?us-ascii?Q?tmT+UhCR7fQaKCf0aehpuHy+VHT9ZHUoslu4OmPXj5UIZUdJc8Jun2vuu7LY?=
 =?us-ascii?Q?9EkK5RVyN3MAq1Z8IgyUzYbf3HtN3uF1yKdH5IAL9Pb2Hhk2ODHTfA0st4F0?=
 =?us-ascii?Q?kvyhyUKRxS6ev5OK01O0PpEo8RKrDz3c876srWdIXVXrN77XAT5nuxcxGUI7?=
 =?us-ascii?Q?rN410NceJFVQ+AXpcAVKiascAdDPMsdbqFHQ8oSonsVITjC+GUwvJovaCfFp?=
 =?us-ascii?Q?B1qhlGk2z3gA1SUC0DZm0/xe8lKMoenXhm8azwHNcLGpJp2BecBDTTNy1oL4?=
 =?us-ascii?Q?Xx2mq8Z2bn2Ws7Vz0KSyJ0tx+RuZN2+DCTmubjbk2DjIyA2gt36aa3JfEnBS?=
 =?us-ascii?Q?Gt8B9aY7g96E6KfaxQfVKRVb8HkSK74W9enTjPDih1ERXby8+N+2G2Tq3rb5?=
 =?us-ascii?Q?bqcMTD2/ENVWNFbPF6QRzH4uLcJySlHYWgo4P+MUIdJvg9MhN7znSZrmWVIg?=
 =?us-ascii?Q?6fglF6ZRObBl6DXEs8lH9WAsG6g2SB56ldPeP9aG3Pz/4KG2TkyG5E+3sezk?=
 =?us-ascii?Q?SyJFXavtd5k5mDqkCS+VxQcF2CvLIA8WWWh/a/O9BwBJKYfZJFZ0D/p+MlNT?=
 =?us-ascii?Q?5XMdmIEEDzHx0D7xKMdnmtXzTIqh+/lW8RypxwlvgfhyliV0wyksx7OH0m/i?=
 =?us-ascii?Q?HI8vpaUlsy1xv9QrRsWQAuMSYANzXZDTB5+R73i7Xx45Y6+ePhx2rk3YOdPJ?=
 =?us-ascii?Q?wLCvXMPP4LbqlApKBY2+NslDxdh/Z/1+o9qCI8jftUmc+jdGbEU3qIqvZV4L?=
 =?us-ascii?Q?IdVNTrRKfrlwPfwon7qIrBVoOAbLaest4iRVQfGHD7upYwjAnezS06Idztfd?=
 =?us-ascii?Q?YznGG6mUuCI09X+UMkXNljMHfOmib3sMXZCvLXyGNq2MJZpzTAqeS14XIxcJ?=
 =?us-ascii?Q?Ycxmfw+xb3Hj2uzO02vWLxugCHtxs9a2zf18yn1Ctl0GLDSMQKD6rSoNF8n/?=
 =?us-ascii?Q?gKUqyYJbSIUTyYceP6tSZC70YvYTOevPzrtN/C2+iDiU9uUjgFRDhg1FkLZh?=
 =?us-ascii?Q?qZqa1cpq1yi5Z4GnCsY8+50sWgyiUu+qnsRYyNbvyk8upDI2lPCUFBlw417J?=
 =?us-ascii?Q?8iGiImXWabmeqpux33M9UQFErvD2N1iv1jHnHWykAUKTZufy6DGl0LqUCmQ1?=
 =?us-ascii?Q?VHdBnKRQckiZdwzUx0Ox4FeQdDdnUJmW1/AcvI4Fg+JVgzH2C9PZigXalGbv?=
 =?us-ascii?Q?Inj3EPwJ4cLVlS2ZLOar44EL56EiAiwTa8nAjpOE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca486e77-3632-44fd-7ad9-08dd0278d6c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 17:46:58.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoajEJWVPUO3SDDAIC0+SsEzKTbifb3ij8SknSDblrBNge0DJFhA37JXX7IRCq8kZxcbINbm39BX3HJhH/sXnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700

On Mon, Nov 11, 2024 at 06:18:37PM +0200, Ciprian Marian Costea wrote:
> On 11/11/2024 6:07 PM, Frank Li wrote:
> > On Mon, Nov 11, 2024 at 03:59:38PM +0200, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > Add a RTC driver for NXP S32G2/S32G3 SoCs.
> > >
> > > The RTC module is used to enable Suspend to RAM (STR) support on NXP
> > > S32G2/S32G3 SoC based boards.
> >
> > Why suspend to RAM related RTC module?
> >
>
> Hello Frank,
>
> Here I was referring to the fact that the RTC module is used as a wakeup
> source from suspend state on S32G, thus enabling easy Suspend to RAM
> testing.

You can mention it can be a wakeup source.

>
> I will update the commit body accordingly for this patchset to remove this
> confusion in V5.
>
> > >
> > > RTC tracks clock time during system suspend.
> > >
> > > RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> > > during system reset.
> > >
> > > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >   drivers/rtc/Kconfig    |  11 +
> > >   drivers/rtc/Makefile   |   1 +
> > >   drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 704 insertions(+)
> > >   create mode 100644 drivers/rtc/rtc-s32g.c
> > >
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index e87c3d74565c..18fc3577f6cd 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
> > >   	  This driver can also be built as a module, if so, the module
> > >   	  will be called "rtc-ssd20xd".
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
> > > index 8ee79cb18322..a63d010a753c 100644
> > > --- a/drivers/rtc/Makefile
> > > +++ b/drivers/rtc/Makefile
> > > @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
> > >   obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
> > >   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
> > >   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> > > +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
> > >   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
> > >   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
> > >   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> > > diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> > > new file mode 100644
> > > index 000000000000..c3792b674a18
> > > --- /dev/null
> > > +++ b/drivers/rtc/rtc-s32g.c
> > > @@ -0,0 +1,692 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright 2024 NXP
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/err.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/math64.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/rtc.h>
> > > +
> > > +#define RTCC_OFFSET	0x4ul
> > > +#define RTCS_OFFSET	0x8ul
> > > +#define RTCCNT_OFFSET	0xCul
> > > +#define APIVAL_OFFSET	0x10ul
> > > +#define RTCVAL_OFFSET	0x14ul
> > > +
> > > +/* RTCC fields */
> > > +#define RTCC_CNTEN				BIT(31)
> > > +#define RTCC_RTCIE_SHIFT		30
> > > +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
> > > +#define RTCC_ROVREN				BIT(28)
> > > +#define RTCC_APIEN				BIT(15)
> > > +#define RTCC_APIIE				BIT(14)
> > > +#define RTCC_CLKSEL_OFFSET		12
> > > +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
> > > +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
> > > +#define RTCC_DIV512EN			BIT(11)
> > > +#define RTCC_DIV32EN			BIT(10)
> > > +
> > > +/* RTCS fields */
> > > +#define RTCS_RTCF		BIT(29)
> > > +#define RTCS_INV_RTC		BIT(18)
> > > +#define RTCS_APIF		BIT(13)
> > > +#define RTCS_ROVRF		BIT(10)
> > > +
> > > +#define ROLLOVER_VAL		GENMASK(31, 0)
> > > +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
> > > +
> > > +#define RTC_CLK_MUX_SIZE	4
> > > +
> > > +/*
> > > + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
> > > + * should not be used.
> > > + */
> > > +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
> > > +
> > > +enum {
> > > +	RTC_CLK_SRC0,
> > > +	RTC_CLK_SRC1,
> > > +	RTC_CLK_SRC2,
> > > +	RTC_CLK_SRC3
> > > +};
> > > +
> > > +enum {
> > > +	DIV1 = 1,
> > > +	DIV32 = 32,
> > > +	DIV512 = 512,
> > > +	DIV512_32 = 16384
> > > +};
> > > +
> > > +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
> > > +	"rtc_runtime_s0",
> > > +	"rtc_runtime_s1",
> > > +	"rtc_runtime_s2",
> > > +	"rtc_runtime_s3",
> > > +	"rtc_standby_s0",
> > > +	"rtc_standby_s1",
> > > +	"rtc_standby_s2",
> > > +	"rtc_standby_s3"
> > > +};
> > > +
> > > +struct rtc_time_base {
> > > +	s64 sec;
> > > +	u64 cycles;
> > > +	u64 rollovers;
> > > +	struct rtc_time tm;
> > > +};
> > > +
> > > +struct rtc_priv {
> > > +	struct rtc_device *rdev;
> > > +	void __iomem *rtc_base;
> > > +	struct clk *ipg;
> > > +	struct clk *runtime_clk;
> > > +	struct clk *suspend_clk;
> > > +	const struct rtc_soc_data *rtc_data;
> > > +	struct rtc_time_base base;
> > > +	u64 rtc_hz;
> > > +	u64 rollovers;
> > > +	int dt_irq_id;
> > > +	int runtime_src_idx;
> > > +	int suspend_src_idx;
> > > +};
> > > +
> > > +struct rtc_soc_data {
> > > +	u32 runtime_div;
> > > +	u32 suspend_div;
> > > +	u32 quirks;
> > > +};
> > > +
> > > +static const struct rtc_soc_data rtc_s32g2_data = {
> > > +	.runtime_div = DIV512,
> > > +	.suspend_div = DIV512,
> > > +	.quirks = RTC_QUIRK_SRC1_RESERVED,
> > > +};
> > > +
> > > +static int is_src1_reserved(struct rtc_priv *priv)
> > > +{
> > > +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
> > > +}
> > > +
> > > +static u64 cycles_to_sec(u64 hz, u64 cycles)
> > > +{
> > > +	return div_u64(cycles, hz);
> > > +}
> > > +
> > > +/**
> > > + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
> > > + * current configuration.
> > > + * @rtcval: The value to go into RTCVAL[RTCVAL]
> > > + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
> > > + *          twice the rollover interval
> > > + */
> > > +static int sec_to_rtcval(const struct rtc_priv *priv,
> > > +			 unsigned long seconds, u32 *rtcval)
> > > +{
> > > +	u32 rtccnt, delta_cnt;
> > > +	u32 target_cnt = 0;
> > > +
> > > +	/* For now, support at most one rollover of the counter */
> > > +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * RTCCNT is read-only; we must return a value relative to the
> > > +	 * current value of the counter (and hope we don't linger around
> > > +	 * too much before we get to enable the interrupt)
> > > +	 */
> > > +	delta_cnt = seconds * priv->rtc_hz;
> > > +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> > > +
> > > +	if (~rtccnt < delta_cnt)
> > > +		target_cnt = (delta_cnt - ~rtccnt);
> > > +	else
> > > +		target_cnt = rtccnt + delta_cnt;
> > > +
> > > +	/*
> > > +	 * According to RTCVAL register description,
> > > +	 * its minimum value should be 4.
> > > +	 */
> > > +	if (unlikely(target_cnt < 4))
> > > +		target_cnt = 4;
> > > +
> > > +	*rtcval = target_cnt;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static irqreturn_t rtc_handler(int irq, void *dev)
> > > +{
> > > +	struct rtc_priv *priv = platform_get_drvdata(dev);
> > > +	u32 status;
> > > +
> > > +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
> > > +	if (status & RTCS_ROVRF) {
> > > +		if (priv->rollovers == ULONG_MAX)
> > > +			priv->rollovers = 0;
> > > +		else
> > > +			priv->rollovers++;
> > > +	}
> > > +
> > > +	if (status & RTCS_RTCF) {
> > > +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> > > +		rtc_update_irq(priv->rdev, 1, RTC_AF);
> > > +	}
> > > +
> > > +	if (status & RTCS_APIF)
> > > +		rtc_update_irq(priv->rdev, 1, RTC_PF);
> > > +
> > > +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int get_time_left(struct device *dev, struct rtc_priv *priv,
> > > +			 u32 *sec)
> > > +{
> > > +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> > > +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
> > > +
> > > +	if (rtcval < rtccnt) {
> > > +		dev_err(dev, "RTC timer expired before entering suspend\n");
> > > +		return -EIO;
> > > +	}
> > > +
> > > +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> > > +				     u32 offset)
> > > +{
> > > +	u64 cycles, base_cycles;
> > > +	u32 counter;
> > > +	s64 sec;
> > > +
> > > +	counter = ioread32(priv->rtc_base + offset);
> > > +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
> > > +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
> > > +
> > > +	if (cycles < base_cycles)
> > > +		return -EINVAL;
> > > +
> > > +	cycles -= base_cycles;
> > > +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
> > > +
> > > +	return sec;
> > > +}
> > > +
> > > +static int s32g_rtc_read_time(struct device *dev,
> > > +			      struct rtc_time *tm)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	s64 sec;
> > > +
> > > +	if (!tm)
> > > +		return -EINVAL;
> > > +
> > > +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
> > > +	if (sec < 0)
> > > +		return -EINVAL;
> > > +
> > > +	rtc_time64_to_tm(sec, tm);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	u32 rtcc, sec_left;
> > > +	s64 sec;
> > > +
> > > +	if (!alrm)
> > > +		return -EINVAL;
> > > +
> > > +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
> > > +	if (sec < 0)
> > > +		return -EINVAL;
> > > +
> > > +	rtc_time64_to_tm(sec, &alrm->time);
> > > +
> > > +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> > > +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
> > > +
> > > +	alrm->pending = 0;
> > > +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
> > > +		alrm->pending = !!sec_left;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	u32 rtcc;
> > > +
> > > +	if (!priv->dt_irq_id)
> > > +		return -EIO;
> > > +
> > > +	/*
> > > +	 * RTCIE cannot be deasserted because it will also disable the
> > > +	 * rollover interrupt.
> > > +	 */
> > > +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> > > +	if (enabled)
> > > +		rtcc |= RTCC_RTCIE;
> > > +
> > > +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +	struct rtc_time time_crt;
> > > +	long long t_crt, t_alrm;
> > > +	u32 rtcval, rtcs;
> > > +	int ret = 0;
> > > +
> > > +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
> > > +
> > > +	t_alrm = rtc_tm_to_time64(&alrm->time);
> > > +
> > > +	/*
> > > +	 * Assuming the alarm is being set relative to the same time
> > > +	 * returned by our s32g_rtc_read_time callback
> > > +	 */
> > > +	ret = s32g_rtc_read_time(dev, &time_crt);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	t_crt = rtc_tm_to_time64(&time_crt);
> > > +	if (t_alrm <= t_crt) {
> > > +		dev_warn(dev, "Alarm is set in the past\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
> > > +	if (ret) {
> > > +		/*
> > > +		 * Rollover support enables RTC alarm
> > > +		 * for a maximum timespan of ~3 months.
> > > +		 */
> > > +		dev_warn(dev, "Alarm is set too far in the future\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
> > > +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
> > > +	if (ret) {
> > > +		dev_err(dev, "Synchronization failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int s32g_rtc_set_time(struct device *dev,
> > > +			     struct rtc_time *time)
> > > +{
> > > +	struct rtc_priv *priv = dev_get_drvdata(dev);
> > > +
> > > +	if (!time)
> > > +		return -EINVAL;
> > > +
> > > +	priv->base.rollovers = priv->rollovers;
> > > +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
> > > +	priv->base.sec = rtc_tm_to_time64(time);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Disable the 32-bit free running counter.
> > > + * This allows Clock Source and Divisors selection
> > > + * to be performed without causing synchronization issues.
> > > + */
> > > +static void s32g_rtc_disable(struct rtc_priv *priv)
> > > +{
> > > +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> > > +
> > > +	rtcc &= ~RTCC_CNTEN;
> > > +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> > > +}
> > > +
> > > +static void s32g_rtc_enable(struct rtc_priv *priv)
> > > +{
> > > +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> > > +
> > > +	rtcc |= RTCC_CNTEN;
> > > +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> > > +}
> > > +
> > > +static void adjust_dividers(struct rtc_priv *priv,
> > > +			    u32 div_val, u32 *reg)
> > > +{
> > > +	switch (div_val) {
> > > +	case DIV512_32:
> > > +		*reg |= RTCC_DIV512EN;
> > > +		*reg |= RTCC_DIV32EN;
> > > +		break;
> > > +	case DIV512:
> > > +		*reg |= RTCC_DIV512EN;
> > > +		break;
> > > +	case DIV32:
> > > +		*reg |= RTCC_DIV32EN;
> > > +		break;
> > > +	default:
> > > +		return;
> > > +	}
> > > +
> > > +	priv->rtc_hz /= div_val;
> > > +}
> > > +
> > > +static int rtc_get_clk_src(struct rtc_priv *priv)
> > > +{
> > > +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
> > > +			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
> > > +}
> > > +
> > > +static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
> > > +{
> > > +	struct device *dev = priv->rdev->dev.parent;
> > > +	u32 rtcc = 0;
> > > +
> > > +	switch (src % RTC_CLK_MUX_SIZE) {
> > > +	case RTC_CLK_SRC0:
> > > +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
> > > +		break;
> > > +	case RTC_CLK_SRC1:
> > > +		if (is_src1_reserved(priv))
> > > +			return -EOPNOTSUPP;
> > > +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
> > > +		break;
> > > +	case RTC_CLK_SRC2:
> > > +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
> > > +		break;
> > > +	case RTC_CLK_SRC3:
> > > +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
> > > +		break;
> > > +	default:
> > > +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (src < RTC_CLK_MUX_SIZE) {
> > > +		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
> > > +		if (!priv->rtc_hz) {
> > > +			dev_err(dev, "Failed to get RTC frequency\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
> > > +	} else {
> > > +		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
> > > +		if (!priv->rtc_hz) {
> > > +			dev_err(dev, "Failed to get RTC frequency\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
> > > +	}
> > > +
> > > +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
> > > +	/*
> > > +	 * Make sure the CNTEN is 0 before we configure
> > > +	 * the clock source and dividers.
> > > +	 */
> > > +	s32g_rtc_disable(priv);
> > > +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> > > +	s32g_rtc_enable(priv);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct rtc_class_ops rtc_ops = {
> > > +	.read_time = s32g_rtc_read_time,
> > > +	.set_time = s32g_rtc_set_time,
> > > +	.read_alarm = s32g_rtc_read_alarm,
> > > +	.set_alarm = s32g_rtc_set_alarm,
> > > +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
> > > +};
> > > +
> > > +static int rtc_clk_dts_setup(struct rtc_priv *priv,
> > > +			     struct device *dev)
> > > +{
> > > +	int i;
> > > +
> > > +	priv->runtime_src_idx = -EINVAL;
> > > +	priv->suspend_src_idx = -EINVAL;
> > > +
> > > +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> >
> > binding doc need document 'ipg'
> >
>
> Is the current documentation from 'clocks' [1] in the bindings not enough ?
>
> clocks:
> ...
>   items:
>     - description: ipg clock drives the access to the RTC iomapped registers
> ...

clock-names
  items:
    - ipg


"clocks" supposed you will use index instead of 'name' to get clock.

Frank
>
>
> [1] https://lore.kernel.org/all/20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com/
>
> > > +	if (IS_ERR(priv->ipg)) {
> > > +		dev_err(dev, "Failed to get 'ipg' clock\n");
> > > +		return PTR_ERR(priv->ipg);
> > > +	}
> > > +
> > > +	/* Get RTC runtime clock source */
> > > +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
> > > +		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> > > +		if (!IS_ERR(priv->runtime_clk)) {
> > > +			priv->runtime_src_idx = i;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (IS_ERR(priv->runtime_clk)) {
> > > +		dev_err(dev, "Failed to get runtime rtc clock\n");
> > > +		return PTR_ERR(priv->runtime_clk);
> >
> > return  dev_err_proble()
> >
> > > +	}
> > > +
> > > +	/* If present, get RTC suspend clock source */
> > > +	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
> > > +		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
> > > +		if (!IS_ERR(priv->suspend_clk)) {
> > > +			priv->suspend_src_idx = i;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rtc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct rtc_priv *priv;
> > > +	int ret = 0;
> > > +
> > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > > +
> > > +	priv->rtc_data = of_device_get_match_data(dev);
> > > +	if (!priv->rtc_data)
> > > +		return -ENODEV;
> > > +
> > > +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(priv->rtc_base))
> > > +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
> > > +				"Failed to map registers\n");
> > > +
> > > +	device_init_wakeup(dev, true);
> > > +
> > > +	ret = rtc_clk_dts_setup(priv, dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	priv->rdev = devm_rtc_allocate_device(dev);
> > > +	if (IS_ERR(priv->rdev))
> > > +		return dev_err_probe(dev, PTR_ERR(priv->rdev),
> > > +				"Failed to allocate RTC device\n");
> > > +
> > > +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret,
> > > +				"Failed clk source switch, err: %d\n", ret);
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
> > > +	priv->dt_irq_id = platform_get_irq(pdev, 0);
> > > +	if (priv->dt_irq_id < 0)
> > > +		return dev_err_probe(dev, priv->dt_irq_id,
> > > +				"Error reading interrupt # from dts\n");
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
> > > +	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
> > > +			init_priv->suspend_src_idx)
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
> > > +	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
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
> > > +	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
> > > +		return 0;
> > > +
> > > +	/* Disable wake-up interrupts */
> > > +	enable_api_irq(dev, 0);
> > > +
> > > +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
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
> >
> > pm_ptr(&rtc_pm_ops),
> >
>
> Thanks. I will update as suggested in V5.
>
>
> Best Regards,
> Ciprian
>
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

