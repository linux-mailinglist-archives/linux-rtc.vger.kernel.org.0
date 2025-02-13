Return-Path: <linux-rtc+bounces-3184-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B5A33B83
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 10:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF6EF166803
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 09:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD0520D4E6;
	Thu, 13 Feb 2025 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BpGv9i08"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A5202C31;
	Thu, 13 Feb 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439985; cv=fail; b=X+K1ZjGX6hUkA4gTHA3O6qX6I5OpIkBbwKstFSnSUJQTOEu3te7XQpoCaAeqAnqEnJb2FcDnr/xMkCrf1HEfErFlIaEFRh51GQlDIqBNuv5WlNU2rc36H7qKo6Wa99zS7QdIqcwkztxFqp+010H82bnom6UYEBLgZ/fCl5pxVOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439985; c=relaxed/simple;
	bh=MMi6SYRhTll/niDHyxuvy3OBdnkJTmXRptuJLogViqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LD7t8iIbTcIQmInxqIs/IpPxgJLZgGSqrLFQxzhA/dpWCFQdn3T8Jkb8qvYLVaij6xBDqJY4c64hFZ/BFCMCnljVZmi9WWKMFjPFDf8mDA5X8xSQkbjYqXYpoNpVT/d+z2QmVLkIDW6A0mdsrKKjGwUp6bKcHT+hNptDrI+HEiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BpGv9i08; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1p3Tz6vYBGJwnP0IhPxyL6CJ010inNFk5W9vl7R8gGj4BB82/6wWx73yrc1gXeJ7l+hbf33YlhSdMuBgBYNkvqTm73V6P40QWjjX8jbT0KDhMRJENJxn+UOw1IJlzAnujFp/rulEBobCHLAYxTaubK5JQifLn5F/tYGRO+rn/kBQJG4F5k6Zxr5wJe/FaL7/Sp9F8ZUvBWRadnEGsQHvzQymUbZpHW9l+2G7yEWn5ldpP2p5rUoCV5ftFuK8uJ02eY4BvnurqDRKSfxo/3UZ89Y8dlgxm1w2AjMA5yEoJvQitgmO26gG6mtUXS60dXkYqCNA1iYrWP6g9ipkSWgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCM+XYkRfN8L6xKu4LXv4wINB4MBy5SFCaWXqHPNjMo=;
 b=kYoIwbKUhm2JiUf9j5jGjzqLTpjLWvmgcgBodXbotHlbOUQlMLgMk9TlRS/zoAfLMI+4DkA/nFyDWTC4jpMnZMkz5RKnBftHSgwUF7iWAkqOEnDYEE1wp4N3HBJwLj3NlvvaZRdIPk1a1b6Z3QN0kTpXqQEVqi/fO0y4JeRG2MTjGgk4LK6t0LCNKhlKT1mVE2JLHccbiB2usKOmYGJF2top+G9aaI2QIGx5MZpsVUVss7/Stu+NrkQvT/dYTrGWL/oiljU30dH0vXSJKe6Lv32P5hLEVLXP8UXwhL5GZtPrXqgawyiVAhYUX+KldTZdbCE59/Bt3am+VqzMdFcAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCM+XYkRfN8L6xKu4LXv4wINB4MBy5SFCaWXqHPNjMo=;
 b=BpGv9i08bBmJa/vHceYR4E2NATs3N/TcdRx0AJd9HZbvtPNZyU41IAlwGapoVYeW6QnZj06iyVXLgbeBfuKT/k6Zf4QIXiv/8UJMUh42xESjVc6wEG0MHn0LE2uoQsPOtwVMcS6gCCpKVyN5Ksv3q4oLrx9R9dagIsUCzkJCWG9A78AGYfhvx9V6Fyg10FEU0uOmfy9wUcqUKeA0kybA+nepEXeE8XBAJwiHjJHi5WRD0hny6gF9SuD8M4kFQBJFsIek0Mmg93351A4omuk5M5VLhgvJ6gw8sNRS8I4s87hAnqeBAEVSpJDd+6M7ujFefMqLPVfd2lwRorKHwXRgnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7609.eurprd04.prod.outlook.com (2603:10a6:10:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 09:46:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 09:46:18 +0000
Date: Thu, 13 Feb 2025 18:52:57 +0800
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
Message-ID: <20250213105257.GA29804@localhost.localdomain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213082032315c4327@mail.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe6efdf-3969-4ef6-7fc2-08dd4c1343fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hknjEQHCjIMTYCEZ1tJ3Yh4aFashku1clbgpCa0S0vUcWblYlgzjETUKW1n5?=
 =?us-ascii?Q?u1t/FZbXi3MuCJboU8xDKyVXxd1Swwkg5M9taXpJRFJ+jr523bFMjFls8+A0?=
 =?us-ascii?Q?sA9tgVfUQEiOkOVgZvIAHBepNxQvhwOONUaah/qr/s2E4+QAM9v/RfCyMZOR?=
 =?us-ascii?Q?3+nfB56KNRqAC4JDGY8KNUOOHI98sKhIsbSl1PZEsg9aciivnNJ9p1ZooO0U?=
 =?us-ascii?Q?LoehlxsFbYswzhk7OhVQGNGQW6o8bHhmy2b2IoxEpYpeSZxDoCfTSvywsZ+l?=
 =?us-ascii?Q?I7q5Fgvt4HXtfQG8ruMElz6NvDdnk5wzO9u+XuWexdzD3CQAgla3P1tug0p1?=
 =?us-ascii?Q?onUGqsdlW10yRXY5OuLYWncvod1l6Kljit6PQSkpEIh+TFKcSyLX7rNZkw6U?=
 =?us-ascii?Q?dQrkFg29yMEt3GzorWLaTmAf4EhSQxxPxFWIUW+4e5Gpkl1fm6tDPQV6Ze+T?=
 =?us-ascii?Q?naHHeK3MwQvCvqobutyFQm7qrZZ1KHBeGsQxCoUoCrM9yuJN37HFotIyLdSJ?=
 =?us-ascii?Q?h4qYFsShjlKyQGNqgQ3R0HC+CiXlE7TP2jzhT+4OpTuSsFEMq/DHd0G4Hhqa?=
 =?us-ascii?Q?KnIGFqaNNWcuinZeWIETaGEcOyP541dXb/913oU3PPinWT2DDsXT2v51JwCm?=
 =?us-ascii?Q?D9tHlf8CTgdbhXFq/dufCLCYT8LuveEG5REBp/vgU0OqNpJRJ/EFchLUOWSz?=
 =?us-ascii?Q?VB8e873bm5HGxB6V89EC7J9YZdFUrZ1we9P8NkDi2mluF05rIsDuBbscShRe?=
 =?us-ascii?Q?Q2QXZPi/rLqf9gVO6Xz/Mw3rycYSQ5ihyKqQ3eWbaz6mdETS+QEdH67u+FTO?=
 =?us-ascii?Q?ke8xWevUmP+19GKaAAHL+f2erohl5fs2MFcgLs8ineCJ+3Vjdt+0ve8JnSr3?=
 =?us-ascii?Q?lts/7dImAl0KiJju+dTLcKRMgMppM3o0dk/XURg63KAU7+HNc5+BgkApIlyn?=
 =?us-ascii?Q?y3vDvvjwqYiEWYUbGLfiF5lPXgKUvqmqssErdv/LO1QsqsWdw9nozvVSDBf3?=
 =?us-ascii?Q?2xbNkVVF1ZDd8RB4mQ4QoV5boXDWGnTMN6lWzL6diI1D0tknUQFwEWuHsohO?=
 =?us-ascii?Q?A3jGxV6Jl1Wmowr45HMh/JnIjWuAnu9C5rqNXvF3AGS9T6g12mYJS8QVEUYK?=
 =?us-ascii?Q?B+/ZUcfS6dT25XlSiKzLZgk77Ksk0jikWVXqoRaik3d5a5WmgBKOAneMuKTl?=
 =?us-ascii?Q?gHKioQUe3xABwy1hZZGXK7Pv9fdabBNj6v3EHEREwwcNZ70Ig5e1inNuJ2wL?=
 =?us-ascii?Q?AItmxZR7HLdI6xeq95pFs8Y34qXYaEyE3TpnU7cn1eLFCghT6OnnPs6sQc4x?=
 =?us-ascii?Q?qd0WJqHII3qIi6aXhxHxcBRzFPaf5tHy/C/A8IWYayKJ1mYpa0QXc8OlSm6f?=
 =?us-ascii?Q?5IYVHd0RZ8WE4jyfDvcoy2Hckb+w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8UhGLrHQ5xbocWj0fqY0rtk04W9sKUJoKXCs1/+ElO380Hvr92b6rHCAAYbN?=
 =?us-ascii?Q?DbWjFS2LGXVUAa9l2uqmhltNsZ6DrCs827UK4n8QsW105GqKGX61sZPQwAcQ?=
 =?us-ascii?Q?UFyUQq/pqjoy1afy6TQwtAMThZEGBOhEnj1a907Y7ZGevxdPtvhgolXShoI5?=
 =?us-ascii?Q?fd3pRXMoJ8wNQ4DRvc/O+cmE1b1usPQwiwVbIZVDGQRv3wUIGAYZyxVShNP9?=
 =?us-ascii?Q?8D1V7aWeIRvWdaItpD3guBs1fLPmqpwEsCb/rqCdvbCVUGhuCiadd1KTSWsf?=
 =?us-ascii?Q?QvhTYKhvX3/QRlBLmuN7STElrF8aaspf/oALkxqclX/iWPZkBA1q805jhzk1?=
 =?us-ascii?Q?aq3HdCyVN4/E9GqYUHLgWfC0jy1q/iwiLSvuub2cGiYi546OB9IVBA5V+6b1?=
 =?us-ascii?Q?WJ5iXHScq83CyExkayFCuXVFtyM5Hp6KvJad+Xy/bpdUliqZajmltXaZZTE/?=
 =?us-ascii?Q?LCH1sf1nKCjuA41f9YDaj9LlLKvXfbcm3tCbIltzHn1uiEDmpxQPom4tGVKa?=
 =?us-ascii?Q?bM0wB+7w0TCY/Be0TFz9QW/KGPXbmN/U7ugpFR65vEYQWfNoIuAivKFL/2Kk?=
 =?us-ascii?Q?sLX8YSQYSiA8WjbE3Km9c0ROlAOn3wy3Sy6/eMAhXFT+sPI4s0pJjNyyyo98?=
 =?us-ascii?Q?iPOWZCa2uThNGGeXMaXU1YWIMIBcZBWr9lWyNX6DTnWsHAoVIngwxT1Yy5J3?=
 =?us-ascii?Q?OAtjN/MzTK5sKmB4RrLyAsoomPe1bIjpsS6QN49hCpjs5jTFIGgHlo5aeeUJ?=
 =?us-ascii?Q?f01Vwxqw2HtwCTpjf1mH7lo+p4sCSnLPZ7oosnmsUsSVYKOvlQZskC9MwC3z?=
 =?us-ascii?Q?wh9NLHFyolvwyr6biqfY/M374ksX27N0cmJJSNK8HVLmcr1Gj9LFNJe6w3AA?=
 =?us-ascii?Q?Dk482YegIdEtgEg2+hf2/ei/RbYpzS2uUgH7iWl4tSgv/f0T1FJLlWe2jPwK?=
 =?us-ascii?Q?cTA3iZMls8JSHYgvBCz1tyHu5fWxcQxNJei0VUgKpUH8GbjMj2PewImV5/Hz?=
 =?us-ascii?Q?esHSjebIGOT4sHDATOFTMOYe8yKIb+A30Ganbq5+QOnSmI93mXBFQ8158RIW?=
 =?us-ascii?Q?jGw9UPk8hkfQP3kZpkF9IqyUqVKrckJbaxV7q7Gksbu/gWl2hqGg+XJasqSb?=
 =?us-ascii?Q?SjmsrgJLtQAIx5Z1Xnb9UjiDBACKzha2MqugJ/SMAIG2zSTGP4cFv28MRBPj?=
 =?us-ascii?Q?2CiMYyDwUdB+wS1o/rTQvfYcIFWeILh9gant85AzIE7NxvQUTiHJs1xsnBHu?=
 =?us-ascii?Q?LnNfUMEfcIkq9+OQpxldHs8q41kpZi7pMM2WW8tmvrWqqAHcJp+B8XYK2mJh?=
 =?us-ascii?Q?hU+Rz75bLhHVOkTwNPuVQOEtAmN/waiwX+qUEaLmEPn+ukfi1MW59WVGN4QD?=
 =?us-ascii?Q?yy4KcKXChPOpZ28lXHVK/DaS6WA/MSArg/zF66/wPa00647VaA3wkK9TZsJa?=
 =?us-ascii?Q?lpZjx4ds4lozhwzGWDCdFpv8DAAvMalkZrheGFU2h0GsiMRyVK/W9252M7yv?=
 =?us-ascii?Q?+9YMpWV2CtV2LVhfRdH1LL9Y2dT9nj1I8gYiFszY+e/JthCXotwPJxg2HZ/1?=
 =?us-ascii?Q?m1uiP0okWSwepP2P/O6MPpJnnUWnYORfppF4uTkg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe6efdf-3969-4ef6-7fc2-08dd4c1343fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 09:46:18.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp3AkZ3vVnHDXAeQ38QJejQJO88i5LCZIxD3CUbsB0xoBwvedE0gjFGDWDcu8Xvv7Tr+xD1mG72aNf1AsN6szA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7609

On Thu, Feb 13, 2025 at 09:20:32AM +0100, Alexandre Belloni wrote:
>On 13/02/2025 11:30:33+0800, Peng Fan wrote:
>> >> IIUC on any pure DT based system, a device node exists per RTC and hence
>> >> platform device associated with it. And the RTC devices are created with
>> >> parent pointing to unique platform device.
>> >> 
>> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
>> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
>> >> > server side.
>> >> >
>> >> > I am not sure whether Alexandre wanna me to update the code following each
>> >> > parent could only support one RTC or else.
>> >> >
>> >
>> >I want you to keep your changes local to your driver. I already stated
>> >back in 2018 that you were on your own with the imx-sc driver and that I
>> >don't like seeing multiple abstractions for existing RTCs. What is the
>> >actual use case behind needing to access both RTCs using Linux?
>> >Shouldn't this be handled on your firmware side?
>> 
>> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
>> could only be read by Linux and configuable by M7 per current i.MX95 EVK
>> firmware.
>
>This doesn't answer the main question, why is this useful? Where is the
>time of RTC1 coming from and why would linux set a different time on
>RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?

To current i.MX95 EVK SCMI firmware, RTC0 is SoC internal RTC, RTC1 is
board level RTC which is more acurrate.

There are safety island in i.MX95, M7 safety core is assigned owner of
RTC1. Linux non-safety is assigned owner of RTC0, but Linux could read RTC1
time, Linux not able to set alarm of RTC1.

I need ask firmware developer to see whether RTC1 time could be synced to
RTC0 from firmware level. But considering RTC1 is more accurate, should we
use RTC1?

The current firmware design is RTC0 is always there and exported, because
it is SoC internal RTC. RTC1 is board level one, it could be optional per
board design and firmware design.

The firmware could update to only export RTC1 if no safety need it,
but this needs big change to the firmware BBM part, I need check with
firmware developer. But things may not change.

>What would someone do if RTC0 and RTC1 don't agree on the time?

RTC1 is more accurate if it is there.

Thanks,
Peng

>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

