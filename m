Return-Path: <linux-rtc+bounces-3186-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4659DA33F29
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 13:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC493A37CE
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 12:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AD7221566;
	Thu, 13 Feb 2025 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cAXMJFf0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C2211706;
	Thu, 13 Feb 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449748; cv=fail; b=k8Nipa55UBlzJLO8yB2wgTAfMEspvkD9BgOf51D7+XHdGLd8HTag9vIJHw6wU/FZThpZ3HLHbHL4sEQ33VV0lwVz0ekh51a2aZanRyRkhjcL9dGzRa0rrvH/YXQ1pUKnKkCRj/Jt+QHkF5z8DOblfxrDyxlPFy+lPl2Iytz4NC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449748; c=relaxed/simple;
	bh=q2tq/tHxxmYmxPy+3K590ufhhQzgMKWeGmWilBNtxN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LyzQo+OShUmZZtjKnyDGrk2lir+W1q0gRbhEoZ4JH0qOisDgqu2fNenE6VkfHHEMFZbK2u15vePySm9Rz5Sb9OhSvvvGMAvw4fy+bd8+e6pwB7RCy+7TJ1zNDvi69GqaOJJAav84UAEXmvsRtWLs0SaoNjutxhW8tkE0IIl1VYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cAXMJFf0; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn32twciitzg/PnqUzvRKEXeGIa7I1QnPm/ubCChbsrG5LDTGNBLw30wobP7MBE3o2rVQfIjnuV9JBPlCJo78413FFFGD/Cydbvh/4DZ46MI3gHvVNIzwgu/ZQ6i32AluZl+zdrI0+jgJ4xUteRngQAH1Ci5JIYLF7hCI5ADmgBNHpWUmCHmz+HvIdnLmzNgXiKEjvnL207k2yKr3g4OXmg2dkozYU/cUwxZkxJkv8iHjzF7q70PCnuzXroa2CqcbpSWKm+m4q9D6rJDaIcrakBRXbZM2a3FXmqnL7qInCjt5z3jNo9ZUV29R4bcZugmKPBypsCTpJ4qpXe9EEwCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSAS/kojGiLBgzM2vL9h48yxfWChMu2jShnHiEBu7Yc=;
 b=dKiBmrZJGm+HKD/fzMQN3nXQE7F/h948L81vTKfKzLKiT70i93xns/Gea7t+CqhniD76yufFAyJ9LNhseQrTHOpZnd0CGlF6ua5Zbu94+URWEz1J7ou+PAX5YE542boEq6nj/nJxhJlol3qXOCv0gHsAqMurC945mDox2DE+LEUl8d5xMco7kFwi9xWf9crqTAz8cBJuI9sszvfZMUOjVdDdjRhCRRBIz29bSPNQC+zpflPX0SzSk3HD2DibQFhQU/Wlo28t6loBU2+bOdkiCxhp2c01A7W1L70ic8DfkfRjKz9IBpUboZslwq5YLR6BBsg2L6z7dfOiRt/vcWeZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSAS/kojGiLBgzM2vL9h48yxfWChMu2jShnHiEBu7Yc=;
 b=cAXMJFf09GPrbNSVEagGkKREBKvm9ZVBBGQ/DOaJ6eGLeR7/JGbqmp3DhAhmuu7M64kJ+fwYN3T15zidsKEkaFD4HC0uTArhdpjHQNJHfqLs4bJvpgBL65TgeX2prZtX0LG/FSBr/C3Wu/O3sKdDUn8eLpGMAAxCBUE8+cpFvBX5etoEbccHPPaLnNXs912MkJLZI2xMS21qEg1HmapK6Z4uspfZfI+/H1tcgM+zmv775Oc9HMyaVOge+oA/SPh0NnYGL5rDtq1xFjGsPVdsT8u2G5kI6HTghTuOVrqPO+2+o2b2vrGS0xDOGn/nBjGCNRj3OUWwNGBLy18jZ1DRow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 12:29:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 12:29:02 +0000
Date: Thu, 13 Feb 2025 21:35:50 +0800
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
Message-ID: <20250213133550.GA1208@localhost.localdomain>
References: <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
 <20250213105257.GA29804@localhost.localdomain>
 <202502131126057bac6f7a@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502131126057bac6f7a@mail.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a97a4f-eefc-43e8-52dd-08dd4c29fdce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJ6vBTqnfr+mRsD3968e//kYzC1e4qma7ttjxspVTu/RynMDiZ1qA/3dOGYa?=
 =?us-ascii?Q?VJY4dbcAGYc8GW6pMmfgIBQaxsu1tI3HBeEQlE/h2sBLUVfyEFx/LcDZHCYT?=
 =?us-ascii?Q?mBnFi97iPTasXGLj7B2kPqmcfBGn0nlULfHBFAqZrEe0cDjzwW/kwnfP9kwQ?=
 =?us-ascii?Q?n/He0HmURESsCm831NP1UyLYeIJgTuPPM3+JrxZ7bAr6ZUM5EmnPbDj3bq2I?=
 =?us-ascii?Q?y5H35wRIfqd20f5SkH4Xv1CUaG7cZSRMf6pQj9WMEZuMCSpG7hJG055p7AM7?=
 =?us-ascii?Q?EYdCp30lcu6hVwNUqAZ0PdsfLSkg76kIWZI7qcWreUaSBQHVaWicXgCBUbzp?=
 =?us-ascii?Q?dYgm0+35J8wqws0/xHt0xVP0p+rqtwjgScc+PjY26mnjam9j8/snyWkbEudp?=
 =?us-ascii?Q?sjbL1rD1xzBic/S4Z9310u95XpsBFyxbwqc1dMBtlbqpCY2UOfUEarmefhIr?=
 =?us-ascii?Q?7SDE2+VpikH4W0aIAUaYhcnFjcovi4qzTY7aeAcLqHNzQFJMEX1XH+rvZhsl?=
 =?us-ascii?Q?9F2+5PYDvV/uRZYQKXQxqOv3JaHVBIz3wXzTiOOF6mMxg/84H3OyVanQsiEU?=
 =?us-ascii?Q?ZguQbDBmoZ1Wyd/fuBGSWEavOr6kmxQfFrFlxFSZqIGe72u3fxSqtCAQkEIv?=
 =?us-ascii?Q?g3/GE+LmiL1iE3MSgXCbgdAfcmQMRwu71laPlPfgCGkcAP8sgGE0MfPXuH7/?=
 =?us-ascii?Q?RklHfwZ45+F1KyoUNRmHKcrI0Wc7a3oWXuotGsd+GF70qwGWHant3Z/5Y1mI?=
 =?us-ascii?Q?NEOur2dxGVF1K6gXl69qxfmeZzs/RquYPGoYYvNpng5Fr6bsR39UvNSmDoFZ?=
 =?us-ascii?Q?KRxlbmFB9K8JMlismbKlYvseI3j/aNjketyEwefUjgMFrXGa0pHrm73sk5oc?=
 =?us-ascii?Q?D5KGlXAcrlQmrFEV4+rFrRiPfwyymNMpg2fURmuwo2Pynub1QhHztktJhinG?=
 =?us-ascii?Q?WhojkVonAd7WGtdp2RTLoE1chJvgFn+m8logyRhnKsnl2l35KMiFHt0+Mpzx?=
 =?us-ascii?Q?1RvlGIC7xXA43iftlbDD4SOzAVO+qs1x2umKVdiq/+eNo0CEjvc3yddNmiRF?=
 =?us-ascii?Q?y42/TsFEP3q87MtWQQ2N5JqClRRZxSQ70JQb6qftG7OUMPgiZtbHfrdWN4EN?=
 =?us-ascii?Q?5AV54jfHC6Jsqs3t0SwJTYaNNlcntwGbyY8Lj9oGpdsYckrWZzuEdu+BOoNh?=
 =?us-ascii?Q?jVDdRhUQfOkXKJLCzM8rwth/pgM1+NoI+1lzrqdd54UQ22H9Z4GVBm5KOchi?=
 =?us-ascii?Q?KBrG6uSjM38BMqH2GzKpdB4ELDY4hp4A/JgGAkno2toBk3OmOzbtZyojsGYy?=
 =?us-ascii?Q?Cnj/zUFeAeAwnKFR/FgiITpxestZKHOxNNP0+4oYqoKPOvJc+CucxJJ5CWLS?=
 =?us-ascii?Q?wSBwX8pty0pCvV0lfSKiBpJeRqxv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kNC1ttq6vRy6HqRJNfbUn9HZJ/gonKqQqv2tgb+tLCY2JwwGhMLw+IooiuSX?=
 =?us-ascii?Q?IUvW7kHVHae9GzJN18UNSPOrSvyMxkaPgpcAGKWY3uQqe43OexzFHwIPaSt4?=
 =?us-ascii?Q?4tfxCwln3Clb5BBYMTSDl8cTFzXIqSIxA8b/B+xzFPWNl+eXuxGUDdKjBiKu?=
 =?us-ascii?Q?C/xY8yB/7vArXsgOz/4NVq4R5qOfTaxjWvKfaH9M24gqs2v6pzqAkJVBW4+g?=
 =?us-ascii?Q?BBwBVBSBpK/4aOfVJW8WfR3Oe3gbMcYfUktL8hgdxW0LYArid+v/Eu8dWGlh?=
 =?us-ascii?Q?D+YVIGbUvcqcC9ByYWgnBRH0ItIzoYfu9TxxDuLR9u5ls9Uf7t+NDcdzQz7O?=
 =?us-ascii?Q?RqrIxwX+FaTaPaSTsEEs5EkzFjUn9lNb+zygW8VwApHLeJSIV1Rvv7rnffgw?=
 =?us-ascii?Q?X/IVrhe0a/ZN45yLJOhz5mG5CHB1362WtuhtmUDhOIDktTjlpRV2ImNxth9N?=
 =?us-ascii?Q?ABLj7JJC9v3JxU6nlZI12UdW0hWT8tuIm9u0nCWJbbRKiDvjFmMNuKBVSfUG?=
 =?us-ascii?Q?DANcxw6UTH1pzKx4/B/ykOvdV4aMLtAMgHgDuOuFxsGzSEy4RpHf8Ae4j9/K?=
 =?us-ascii?Q?ZUWSEgVQ1cppR1bMocIEnJdLSFgI0vzqeTd5VhSoH/SlHfbWntZhGFPgbCEb?=
 =?us-ascii?Q?FmYhJxsSvLO1S0LfZf+wEmgMfkDYAtu07KPNkT8VyQ643DECNEXO+K+dXP4k?=
 =?us-ascii?Q?DfnyaKg2p5PUYSoR4IJ24YjoymdwqXEtBov8W1jY5NA2GWrd6VuJ/dJmHR/H?=
 =?us-ascii?Q?GE87zxXctabYHzyqSHDnOxSHpw1cw8qkadYJEBid+0l80HlkuibQmrSeCq/A?=
 =?us-ascii?Q?7J6qxcwWLGDmK00e0VrAbXRnIY+YQL2M89zmhgVXxpLEHgi6mvZ25ST1CGh6?=
 =?us-ascii?Q?0klFozWKvRDKZI8ljBnnu1hmNRdmqfVGDHvYIT3G7xDIswdFy9rHerN73r5T?=
 =?us-ascii?Q?0Hxvuqdkr2EyTcmbN0XGSZroDuNfbsVRZZtVz0Bf1c5JBE0C+yiWJZgZLxCc?=
 =?us-ascii?Q?6ViQFg7LN3MEY2Btt+LdX5ot1XWGJR1+QvspbwIPd5UigzOrloZsUXa+DwsN?=
 =?us-ascii?Q?Erqob1Q8uKatlYUB3GZuum91WFCTsgOBCB6qZSLw1MK8JnhqhrWVzsrZuDhQ?=
 =?us-ascii?Q?/GBA1MxzroGQkMrO6Dv8sRJj48OsZMqm04IZtf5uoCobJRePnp3uLJdyQWHa?=
 =?us-ascii?Q?mxYaIkZ1EbrzFcMaYulAwvXCaDGUsK+YbeuXYdyq4H84gm2NL9/aj7Sh1oB0?=
 =?us-ascii?Q?2T+oy3mmFlHC1UKxbGdWyfwY2EHTFfpi4YBvh1NMxsxdk7V26qs2X9u5K08j?=
 =?us-ascii?Q?r02+nnjyLjOGg4dUuouUChEIHW/eWUcNhcgtJcfiK9Q7SlnnxdjZAXjMSkGZ?=
 =?us-ascii?Q?mOAeyBaSO45wLjn5Bg+ia4XYdiE/wfSnx48ZjyVAaTv7AWYm0kgpYMyqAj0u?=
 =?us-ascii?Q?xYFjnddnOXvSYUdf010im8gf0d0cGZa9I1tGBMy13bGFmiOr2Sc0V10KCZAL?=
 =?us-ascii?Q?1ja0IiLHI0nvoaVyTyS3LuxlSuXDL91msvublWz+nhqNfFqLv8EuMWksP2oj?=
 =?us-ascii?Q?mKFDYbdh8Ha/mi7FUjPRrSNRlRhTn1fFIVO8fOMU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a97a4f-eefc-43e8-52dd-08dd4c29fdce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:29:02.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wQpL36Acwmwqw7BjGZOkPtp60Wi1QV1eK3ZCXj+XPRtUJHbogQCPkTNWMtmCRE8HtKwfWj+lpRUUpzXGE4+nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978

On Thu, Feb 13, 2025 at 12:26:05PM +0100, Alexandre Belloni wrote:
>On 13/02/2025 18:52:57+0800, Peng Fan wrote:
>> On Thu, Feb 13, 2025 at 09:20:32AM +0100, Alexandre Belloni wrote:
>> >On 13/02/2025 11:30:33+0800, Peng Fan wrote:
>> >> >> IIUC on any pure DT based system, a device node exists per RTC and hence
>> >> >> platform device associated with it. And the RTC devices are created with
>> >> >> parent pointing to unique platform device.
>> >> >> 
>> >> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
>> >> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
>> >> >> > server side.
>> >> >> >
>> >> >> > I am not sure whether Alexandre wanna me to update the code following each
>> >> >> > parent could only support one RTC or else.
>> >> >> >
>> >> >
>> >> >I want you to keep your changes local to your driver. I already stated
>> >> >back in 2018 that you were on your own with the imx-sc driver and that I
>> >> >don't like seeing multiple abstractions for existing RTCs. What is the
>> >> >actual use case behind needing to access both RTCs using Linux?
>> >> >Shouldn't this be handled on your firmware side?
>> >> 
>> >> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
>> >> could only be read by Linux and configuable by M7 per current i.MX95 EVK
>> >> firmware.
>> >
>> >This doesn't answer the main question, why is this useful? Where is the
>> >time of RTC1 coming from and why would linux set a different time on
>> >RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?
>> 
>> To current i.MX95 EVK SCMI firmware, RTC0 is SoC internal RTC, RTC1 is
>> board level RTC which is more acurrate.
>> 
>> There are safety island in i.MX95, M7 safety core is assigned owner of
>> RTC1. Linux non-safety is assigned owner of RTC0, but Linux could read RTC1
>> time, Linux not able to set alarm of RTC1.
>> 
>> I need ask firmware developer to see whether RTC1 time could be synced to
>> RTC0 from firmware level. But considering RTC1 is more accurate, should we
>> use RTC1?
>> 
>> The current firmware design is RTC0 is always there and exported, because
>> it is SoC internal RTC. RTC1 is board level one, it could be optional per
>> board design and firmware design.
>> 
>> The firmware could update to only export RTC1 if no safety need it,
>> but this needs big change to the firmware BBM part, I need check with
>> firmware developer. But things may not change.
>> 
>> >What would someone do if RTC0 and RTC1 don't agree on the time?
>> 
>> RTC1 is more accurate if it is there.
>> 
>
>Well, yes, you have your answer here, if the firmware knows RTC1 is more
>accurate and will be your source of truth, then simply use this one.

But issue is RTC1 is only readable to Linux non-safety, Linux not able
to set alarm. Linux could only use RTC0 for alarm with current i.MX95 EVK
firmware.

If RTC1 could be exported to linux for control, we could for sure
switch to using RTC1 without caring about RTC0. But this is not true.

RTC0 is free for linux to control, RTC1 not. Switching to RTC1 will make
us lose RTC alarm to wake up linux feature.

Thanks,
Peng

>
>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

