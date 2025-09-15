Return-Path: <linux-rtc+bounces-4906-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCFFB56EF8
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 05:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B76169CAC
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 03:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B09D22422E;
	Mon, 15 Sep 2025 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vT5/zLU9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CE210FD;
	Mon, 15 Sep 2025 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757907930; cv=fail; b=HZ52Udz5Jibee2plyUhynlkgdX4/dtCkXp8GQNdLg1VHk8l0Mrmp7Mv6r96PZd/VKDAVID/l8VrOllxcUzDEp/RYrBkvvmJ+OpxMfqQpqxh+IWeoG33byTK/2O/pS4diGeGy84UmVrsW0UIGR1bvq+WpIgJIy3tX9itEYGI9+P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757907930; c=relaxed/simple;
	bh=qOgmhjQLA6f4kdYMz/nn8zNU/sMg2aHr3dmYpau9JBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q69514bjuv4Tq6ASisrsutxY4JS+L5bc72Lh3ofegfBGZqIjsoVBOKRowYmtQIsma09WZdHzLDOkgoTsyjoQMbhNwfvIo7OLiGJkOqthKTpWVHODTXv1y0ATuzOLiJg1ZZSOdY9J87sc9G3cshpcyavRg8MvsgAEuDmqUNiwTQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vT5/zLU9; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ29GKU2/4rKgTYxRpC9Zqro2e99lj73WsxhMsSxsSzKcrG5RpI/A+9d7GehZs7LqgFqd5ApnacfgqOYcH377AKs87LLUxSfy2JFflv5kyY1IZN5Spxtd37bFsZZdhVfjMKBZGJvXoB7sh5ZdWS41VcLr8C/Mebue9a6tjmLsBaPiE+u5ZA51i69wyLZNbRU4tTKQzeBxPa3F9PNPrpQ8oCZ22fRCzmPC1iAO9MCoE1erNhT1npco8MTlU44olvXy4yGRW1ofgTY3J4388lcu/ccT7xsMm+zv5AvgWXF5L4fG+hKc8xbayzo+sioipXAGqCIj34ZLPlEaxZKOkn1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOgmhjQLA6f4kdYMz/nn8zNU/sMg2aHr3dmYpau9JBk=;
 b=IYN79yNdYX1BnNKIOYXC+ZzcVOYOMfJl89uPoXUMGkayuP5tVOF/EKlVHFBCaLOB3jKYsafia3BB7ewmlKcJnQFmxYrQ2d0buM1jGWHI8mPWb6hrkQi9sYzc7QbhnuuFBAvZQsIcD9bu7/LTReACMr9UIF4/UTb4qOMn3lb9fNECOq9TxBN0c/mSQv7Km0JMcAJ9Spn4pAsObTqmtqn2bT8rfgH1jIJznb+3eTPUwBuAMJ1xk2LQlqTUHyv1oP9BGi8Ta2wbVtur42/8cXqGzfDwyWTPRmkdDHgwlTc9FMa3XsOMB6kP2JSYTHb67uF4rhumuq4d+nfNAAAO12B1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOgmhjQLA6f4kdYMz/nn8zNU/sMg2aHr3dmYpau9JBk=;
 b=vT5/zLU9RFhcf7VgxXc8+FiZJMIVByXv6atbcTd7a2v1Rvgy6ZkX/adBk36/zbETgoMLKhykGi2UVb+r7VsnkPaekIHu4Noy49O/BFAiRdQ9rq1DJxtrxVE06n7BJYvkRlDtHmuz2rdiQnzongXcqFaSiwEbcrPibq3AQM9EBcj/qNvfxxI1j2zlZdcQOpK+aXnQPn9zvzNas4NwmMukdnUzHW1T5CTG/ZWdYuXiZVHoT9e0R/PUSXBjHAq3nNDfBzchQUS4eJ9MwLNt9AT4ZCj4Ccsl1vkCx07HfizfUVDYignK3cp8tarl9qjAnoJxxxZ33hmdluigFYGzj0CcxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 03:45:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 03:45:23 +0000
Date: Mon, 15 Sep 2025 12:56:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC
 clock
Message-ID: <20250915045649.GD1331@nxa18884-linux.ap.freescale.net>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c4af8e-e98b-4d19-83dc-08ddf40a4a62
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4X7uzrEviuwq1WmZYbzJRSEOF+n6LTTLk8JdmHwvcUGNsI5jgWtHCdFRwVBt?=
 =?us-ascii?Q?3LzZMQdfwAkfkPUiH4XGx+0adfNlj9GbKnR8hMiK14p71Ego5we0AFc7H7Qs?=
 =?us-ascii?Q?GlQf3ilGq2BQugTr862VubgFeiRECrMOvQLFO15aAmTO2z1todSXif9X2IY9?=
 =?us-ascii?Q?WhNjYEDsV/AeaTFVsKtjMsxSITfKBUCqcnwWmMlZ+9iQ4PknTWSOeuppYPgh?=
 =?us-ascii?Q?qXrlAOTOswvu4v3/lEIs0WVfwUuUgWqNjGtSbzrD2+gxpiV4VN03+sKlbsQe?=
 =?us-ascii?Q?e3VonPk+FQg0VMTOo8acrBSWUiPYaWYckrbpRo0J5mButjXj63cq7Mb6ckAc?=
 =?us-ascii?Q?0TQ4LwE+fD52WY/RFy+TDRwZYsDWqTtRbFni7DZrhxvinccx2xsWTmzDUKtx?=
 =?us-ascii?Q?GXVoRw/1VAQB56jiMMJiqJGhcd2PpMskwmkPNCAk1TRNdhh5SrOYON8ptlXr?=
 =?us-ascii?Q?0tdy0BntloSIZXk546iVvut1gwghkmir48SelhNvFBn4a3fDJ301CyVG2feo?=
 =?us-ascii?Q?8Jx26bG6UUp3DbGLrIjUEn1QQynVuGNOfPv03jhOte6gMAsxJV7qx1pNXNfC?=
 =?us-ascii?Q?Pu4BH2xANqVoWzp0ZPgqEwZHfXlY6/Ofqz5VrSMsKFRSEvj2fXP/ub+XCkcT?=
 =?us-ascii?Q?CYD/ohmJ66jm/YRsjSDgxIKCW1IcyDyM0ZjnwVVgTr82DZyCE70Oe0PSk3MR?=
 =?us-ascii?Q?HO3qOewLjjbhCAFLeggVWOLdQJ3m7UyZ7NkP1a8P6Fl4OyANZOCPtML4R64o?=
 =?us-ascii?Q?+faEXQBBJYzRWoMcKNhFybXVyE3RSig388TSuQGptN5DNoiviL7dtseNgK4+?=
 =?us-ascii?Q?csuupsdWqhH84B+ASy6ygFhDXscMfeU3hK6RtY8aOyQIkOupYIliCDYw0fsF?=
 =?us-ascii?Q?6RCW8HPfgGgpa7NMW7siJNWziQSoR7tsq97TdCw2vHIHvdAOd9M1z0Zh5jVX?=
 =?us-ascii?Q?55uHcZvnnas9gnrMAwphj5zCD6a7iheXd3MHk/Wxvw7azByv+SYy+moqpT70?=
 =?us-ascii?Q?32qPr4w0MgYm1p5uRgpwCxX6YVqSeURnFBmWkQP9lIXxQDEvPCzvVX2DUEsW?=
 =?us-ascii?Q?30aDQIKYlmLdMKi0ctYCYzxg0qwRnyVff4Fnm9rp3bT/NtnMxHo1DXmx8nya?=
 =?us-ascii?Q?CB94XZ7gal1UoWD4e6ptMS5WytoFT4B09Lc2FaX+NthPGANEIgmwvlEjry1+?=
 =?us-ascii?Q?QjD3hFWq0hOHcgEMHWDDDGEo6bSRaIy5ZyGR5z9expKNu+fUhP9jYzwd63kx?=
 =?us-ascii?Q?hjdMcUqslhKT9NmqXICkuiYLUOKAYtBQZzxUqvwf8qB3h6JBqg7vM0qfLUoX?=
 =?us-ascii?Q?TQTA2uo7aq1ZdPyF3SiTk6Sz7vLeueX+MHEXXELu910AMm0QDVOmf6B12n/h?=
 =?us-ascii?Q?4Omy2PSZyWRTmyMn9B1g/0K3zVtaiYozBOqQ8tYEVCe6kTx2tI++Zsd5Jw6g?=
 =?us-ascii?Q?a3/KoqFxpOUeFBvpLr+P7LEJb138sZGbLZlaWzxHsdZqAyyp2Yj8Ww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?StDnXDd0NZDxM6GCem8Yu3FBbHq/XyOhcMI0UD/InUmHpBh0Q6ZtyA3R2/6q?=
 =?us-ascii?Q?aUsWmMCmBGXaYEum5mxfH7X2KbtdwL3Aq8QAyGhuZnyhY98M2GF0XrK+Lh24?=
 =?us-ascii?Q?X2CXX4JOSx9RAHICSbHtRG6QR1ARvo0S2Mn5Ey3Np2/QICJxQVAGjIvHsdzX?=
 =?us-ascii?Q?qzSCfm+FXoMEf70igYPxVYPkJh/1rsOgzLWlBmYSjHWq6R7AssgUD+rEwNUd?=
 =?us-ascii?Q?xPIjUNfjfN/wTWGZxh0eLdVoTxYvSOG+BVDLi5c9Dky3QtQ6j+CJxdoa0ZTT?=
 =?us-ascii?Q?X+ETcEmXv7VlE05OLfe28idPqXqEONiYwsWyA5x+92YT8CkQUCxDWlNxWSCY?=
 =?us-ascii?Q?FFJslU0noRfGC+97QkuIrqtZul4ndMrMiIHqjps34sgpxoMqdGEoDvWUWnl7?=
 =?us-ascii?Q?j5PfGG/DVLdoIsAZXR/IyT0+JtCJLQ6kFJbIG7EQ75AOiVnHh0j2aGYOnu/5?=
 =?us-ascii?Q?em9M/2z4a878x/hUwI9VdJg4TsJ+Yfh9O7NLhlAEi8nveShe9zp75P+ERWSd?=
 =?us-ascii?Q?ltezfFC5iqcaXOHCwVeoGrBKB/VqUg06+lNbVJH9Kxm8WR3kZ8TJTTqZ1/sb?=
 =?us-ascii?Q?N9ap7fWX97a6NBK2ajwzbcLgSOdSgeY1d98dwH5Mw2hj3Idlit05rSdwbKuk?=
 =?us-ascii?Q?0oDeQ8hm4MoXNbu++xzvBcdp+FjK7jWUBfojKFVZ34QB7G46Hub1t6AKieK/?=
 =?us-ascii?Q?S5FrfG+UwemqM3tiFQdyhzmP/cxVRPAYfQnnIXsc3L1Mnu2T4mx6uEdXjVia?=
 =?us-ascii?Q?W4whZdaYbLOSkkYiz7ToYy1vCAGdYz6+QoSy+XLfhR/CSXyCnSgfmdl0Kzm/?=
 =?us-ascii?Q?bf220t+SV2atad7H3axL9Tu3sxhxrsnuFB9bdHGg6+f05V+TJvfoeJ8IO4bv?=
 =?us-ascii?Q?XQ1jXZlvX5+ol5C/TzcEtH93vCc6vMFAcU5Jy/O0hQYLLPsLqGkI5kje9xtL?=
 =?us-ascii?Q?wlvr0mrw/Kh2iK1v3T7gNbt0OFiwml7p8duK/dOqsxzFiACqU6+gbZyZIeMN?=
 =?us-ascii?Q?KArT4/5u0LI0FrbSXHBeQUOqeDZ6urg/cxA0N3YGio1VYWpcaZDisBbqJ2kJ?=
 =?us-ascii?Q?oOg710sR/D84MOFerskNPeiBG2WKt4KbtxKx8v+kSu3kZf4FKccRa3FIelxN?=
 =?us-ascii?Q?ldWnUBzgUIpkIQQ3IIEdqJRAfNaSMJ1/EYygVrHHguWDevY/HudiZy97+1Zv?=
 =?us-ascii?Q?DkXr3F+hyOuFM/37yrdhMTGzpD54dK0CbBk+30S4nn5D3HJaC59DPGvqal4i?=
 =?us-ascii?Q?Mus0Sh0IkLjfd0WC2Huh1IhPEkrS1zbxNJcCO+luNP4Nq/arXS9tfnLiMJVc?=
 =?us-ascii?Q?U4BVJ46+YRRaZcz8gR21sAKT44+Ep8JVZCCWgqu9ceIpcWcFzecsdiEMBIHT?=
 =?us-ascii?Q?ND6Il5/9T3W+XhsRSJOXInSPau3K57gaAqsFrd5XPx54qaK/+CiuRCNqKyGN?=
 =?us-ascii?Q?3RImj49ilgU3DoqDjdiYTBYQfNfTpxtgdEei5G16qUX2A9hboZCXSrpO4iMb?=
 =?us-ascii?Q?5oZlGurG2B72/ewTTr17ZK6VF7/78A3cVRLtOUqN/YDe48o331OksAd3ZuTQ?=
 =?us-ascii?Q?9N0IZXiPuRIZHPrGonIlxxnl2a1uS7477eTnLM9F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c4af8e-e98b-4d19-83dc-08ddf40a4a62
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 03:45:23.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpU3PKZ8GzXRYxQSbNMnm7+KA2PRR4HX8ENsmSoBuULSc3j24YxWgNGNwbC2uMX4Hq5F9PUxdhiR3Q9cpXkHVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

On Sun, Sep 14, 2025 at 03:42:25PM +0300, Ivaylo Ivanov wrote:
>Add the support for S2MPS16 PMIC clock, which is functionally the same
>as the currently supported ones, with the exception of a different
>register.
>
>Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

