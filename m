Return-Path: <linux-rtc+bounces-3166-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF82A31DF7
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 06:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 768543A88BE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 05:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D0C1F869F;
	Wed, 12 Feb 2025 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gBmot5Rl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C381DE8B3;
	Wed, 12 Feb 2025 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338469; cv=fail; b=jF8JIRycRqJ1YOTDMmur0Ira3xSYoV4wKjkH29kACq/XArXiEIT6IgRFAynZmKiRFSPdhZJoELWSwgETIvHAP0XzJfzkOHUqEE4xfeD49Oq+Z6mbpObpE0aS4NCselfWgtgv+B0n5DSV328IYDCCUNMXIRMEZTujlvuNFDLrNqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338469; c=relaxed/simple;
	bh=pnFDfC74EVgNCo+awNvWgH01K+ORUPxg95Aiov7DGAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UWn7bIgCuQIzV68/g56o8bi+seb5Dw5a9xhn71YM33F/4vt7Nbma2fSaJYpXJ9pO0TjPNIF4CsnkwvPSRq1ypXAfL0p81VSgnF24CswzyYL1QhaoMIuEU/HGXfD3GIAZ0Tx1vENsESnKmLjNB0zQMRm2FFDZj7V612iODIHF5Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gBmot5Rl; arc=fail smtp.client-ip=40.107.105.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yERDBhUHyIvzMtnpD7ttlgLPOTTJADkiSMwZHs3U8HmmBUshXuwIGJADO99P+1nuJuGdWztq1Vl3l3jcnt6XCOeWhLcvbV6A/QRujLvxFr9EC0uSNRGrEtSmFOpCon8AzwKbnpg76JV9kS8/+z2wg5foc9EqyelOkh4YjfkRHPQ5ysdHpVmur1etDTDjEqegXl46EKMAxqV3ZV8IslYhAGjRVtzjNUZJdEeOVEAtP5u1wgatqImp00QKtS5cNKbK/btpNzG5gRIyI4NK6nu+pIJWlneJLasDpYQeLYNVQef1USwriYOSSqfhqAf5hTpg0VTIrxe0CRU4quvcrxEHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24mYqZ8ORlxnFnykGqkRoNwwbLSoEsM3JJiBZZPaY70=;
 b=GC3qIy0066jxQ2n6Ro8Wpr2kkAzTnalyS2bz2IorlkDuuAET4J8Io69Ts3HPzKWnEl38C/9IzWADQMM18pFlz6PRFwX+8PaHaDXQ3LDRTRjJr6xgl5dCMeG2k9c/aSD6M0x37hXbE8v+rf3xY2tmRIx1qkMhGX23KzPbWoU4kkukxz3v73vZnoSa4dU5FxU1uElsxeP7sThZ5U6PexMzCnqmbWk8UfIVhnvz0hJtIdkXbM+zppTzlcIuDyI5iFsIEfNw2QPv32d0Ereo/5Q/oRiqOWvx6V6fdj4Vhk4q84bdsazsABgTIUzaMKywjwT0AL6NOaXJ8QPU6DEZ+JJM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24mYqZ8ORlxnFnykGqkRoNwwbLSoEsM3JJiBZZPaY70=;
 b=gBmot5RlfIJIYzROLPnv7CBy9okddVh52EMww/lUvxXoF1g9kR45QzGAbRsunEvyMZEvIOQaMPwORWZgL/ssEOxyi+vyLnLUf8pxzj4HY9qGGsHS+IS0RvKpYtndfBpEhOIfZkv0s9Fhap7x4xlVnviwurEPjk/p8ioVXj12rLDKqINyZNdpPeoQFlE8jkTiuRICZw2upxbZYT7DCEdQUlG42QXpu59L9sEMOeC+UwAbwP3931TrV4BwOtEJKYM00T6vM33W7eNyeXD/2qoJKtLiDkc5lXVHNOsrhkxV2SFeNeaEy3bFpHYt3svORFGh5zKIk+zBt4HQHSFeFqpwTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9636.eurprd04.prod.outlook.com (2603:10a6:10:320::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 05:34:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:34:24 +0000
Date: Wed, 12 Feb 2025 14:41:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] rtc: imx-sm-bbm: Support multiple RTCs
Message-ID: <20250212064117.GC15796@localhost.localdomain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-4-08c50830bac9@nxp.com>
 <Z6uCWK8jMTP7wInM@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uCWK8jMTP7wInM@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b195b33-cf32-44ac-5a2a-08dd4b26e87a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uO9H2xD65n2pLgDLEytNhZfdK7wnI8BiNT6+szPSsEcrGFLG5n+t3G4534jg?=
 =?us-ascii?Q?hywfXimtQeyNdGgHZeMedCWFX97Qt0wRc6Y5TGnd3kyAVr58BPcLm0O95xr5?=
 =?us-ascii?Q?v56Vd4tgN0zb2BVyNO4/rEhMqAtoKcqXTptxflzWWtcIk5ptetav8v7BFjzP?=
 =?us-ascii?Q?tUTvVyiG9iIMXQvhckOMI/36feJqE2Wy71XwLxuPDwLNmVO/J/LKKNNuvvOE?=
 =?us-ascii?Q?oNaa4NMLjGpRnSOxDeoRImtAln4Aywoyv32AeL/OC3EAPqJz440l1Dw95YC0?=
 =?us-ascii?Q?wxAHB+DBpBYG3JZ7arzIUu3Wt4xcOwFZBcroLKG2CjXKwCG1L5leIF0WMm86?=
 =?us-ascii?Q?6VscBegm99mvRNcfVhAs7tzyL32af9tpVj7nTEz+ivQCZrArc/usVXlaWt4s?=
 =?us-ascii?Q?0UWZ30YazpGEktNNVuAusjmQ/vNPDDHbqXjxt6hWTCD/a91JOn5JPL2WCJZ0?=
 =?us-ascii?Q?C6jF3IGCyt6nMgb1bIjGo3BlcA4k8tvxAh7l9QAaHuhA9KrsxQb1wp3E6Yvo?=
 =?us-ascii?Q?hVopQ+zz/SjzZnZrN3QNw24cz4L+3ptKbxwLCAbrhyY8ppCtZ+V6HwJXVKgj?=
 =?us-ascii?Q?oWDU6r2XRWhxdpNQ/Gu+cSnw1RfFhpA6Pbze+zDHSjTwTygAopPov73mwl30?=
 =?us-ascii?Q?WJtsL9pIc5s5rnSn7j0+UNcS0s1LhcIPcQREHDdYTpE2bhpMN9UNXrXbFqbN?=
 =?us-ascii?Q?f9FsWPcowPyHFrg++y0kqYIaTtHgtPbPliAD7m0S9RSj5+h1NbdUmzONm7Ky?=
 =?us-ascii?Q?xt9JzUNg8UuTTSEL84D2j4Gf4/cNZq6/9Fw55LZIepITm6zyTPRje0RMOIOT?=
 =?us-ascii?Q?HtmA3UiKNlQKQpeuveHxbXmLHkhhBVGJAT6waqUph9zqUQ2zzvVjaQFcNExg?=
 =?us-ascii?Q?KdtXz/NvZW2nRkBuAYLjzL7wcEBi0Bt4v/ezX4KcCien24CG+ZXrx7A1CWFW?=
 =?us-ascii?Q?mdcTd+ociBVNFcNOaaUIXr7xKE0H7nmIGtDAKfGolJo9ZraXgVa/GsvgDL7u?=
 =?us-ascii?Q?62cLhn7HcCR2s7yMoIFp8DveLGaKrO9l5rgGndmWbWscoGBtAUe4ld74dvtE?=
 =?us-ascii?Q?XP8KeXeaCQtf1CYN+P3NJEoBd9smvQPSw913NBR1NJ5vqOOdu3nnDwZ4cAef?=
 =?us-ascii?Q?MJWEy+2y4NvGLkLRotONP9OHwBTN+XO7YDKkrVU2OdYFjJxEscPJ1QhYv55W?=
 =?us-ascii?Q?6+/4ZzWBQ3Xa0Zu6df4cH4Xrv9KmwVzSw652ru2GMW4EY1kfk5d44tXAmiUi?=
 =?us-ascii?Q?AIP+AKSE7pgc1J4Qkg3kjAYDG7f6lnFjLgnGPsSUKAMSbwC5nkTDpFKth7W4?=
 =?us-ascii?Q?Mj5qHf00wqUVZbnrzPU5br2CU3PPrRJeQaLdAAZg4zEhaVt9MlaFtxMDlLce?=
 =?us-ascii?Q?G3KQ1roK0wlNK4LDvNdzc8L+9cNrKNu24todcT7sJwafVZR/CHK25f4YtlGj?=
 =?us-ascii?Q?dr5K3hpLGR4OOgL4WViWKxRxWcOTZFV/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CeCah+W4USX2AsI/unPMq9ONeIoiYXKy6RLVG7DCJfc3tul+l+be6VIn6+Wy?=
 =?us-ascii?Q?x3wxGgKXpWwD8jpx5sb7K/r8AxXbfbOHj32fG6mrY8XYw93qIwefv0WPHANG?=
 =?us-ascii?Q?IR8IJ/RTSvXvmsJOSDhPQp1ybEER5F33a6lvz/M6wWkBvlzRL6gJHMV4l2sF?=
 =?us-ascii?Q?dMohDRbUo+rKmNyS54TpaGDkKiWj7Vcr5XkYEZgOyGQt24HykGFyo6/OOnjc?=
 =?us-ascii?Q?4qGXONhq5zsKjhAsO7q7ppheRuPD0rul6bgi4Tb8BJH15Q/WX2qX/zodw2Yl?=
 =?us-ascii?Q?5UjZF/PfYaoszTU3w9vyKDvxQ4qcZjymmLyRKd2olxrZSXqkjf2qDBTZrDE7?=
 =?us-ascii?Q?yN/b4bkkiKBWgRQ8BDV/1MzyROwn8rgfdi6E3MHxzoz1zYfolrMZlyzpSNiI?=
 =?us-ascii?Q?ueFNK1uEjLsa8eUn4ZgdO1yuThGfyZM/cpmqtN0aGGlfpdWWA3uzUw+DV1ti?=
 =?us-ascii?Q?GJoYJ5HC7yOSeF6mL7l1E8E/LdFzGWQqYG0h8UtFXlNo2slP6EYU4exTrM0u?=
 =?us-ascii?Q?w7MxrxdehfErjwM9907xBdLk0B3ZrKDwGusNgle9OPLwz+3HiRR1f2zZs28G?=
 =?us-ascii?Q?nxnW1BrJO47qYRjLc/w92kKNGe+3nYPqddtkI+t/JDBwB+DZOS4vFDz2zOEA?=
 =?us-ascii?Q?i7r7Qi7m6w2BMqBPacBttVKgh9Mv/k/oFuoid/6cxQeXkjDGgxztzQGGAk2P?=
 =?us-ascii?Q?RLjkPjXesP9c0agi+9FJBJhMF+Cj+aEmO9F7/1x1tdSLYqIxPZ78hRhReyQV?=
 =?us-ascii?Q?IHyzkFowB+2dG061cQFrjqmrF+V4BwDt978gmSUmuaCXayvuHnglblFb7DkL?=
 =?us-ascii?Q?i1AcIw14e7ZQsKvyOgmUMpKATejRJn1Yrm6Bjd23um7fGklLqVQy1MCa3fkS?=
 =?us-ascii?Q?PJZl2jPbQpL77ep7KmfCAfH5R0vIxjDcft3znrO8x18zxtRRC+A9nIPCPWjo?=
 =?us-ascii?Q?OhOLTZDDbbORlRt0Ef3flkuCavJ4ktqGK6055GdPdIRFpHamBsJSMgESr6U6?=
 =?us-ascii?Q?UVqpx5BE05vaYwrtjyecsAOhkoN6ywPkiiiwld90y4fqT2h2zjepJ59Ij1sW?=
 =?us-ascii?Q?rwn5PJSgTztr1Qc/spX5KcU1QKWYlc4PKsPCwecGKdXxtYC6nHx1rHGCyFD1?=
 =?us-ascii?Q?CGoyQ28GGim85h21kMg6shg3Vs2SkgLVvXn30TtdROSvVPAIH3DyPCs5aBfU?=
 =?us-ascii?Q?NIbkyEO0qF/G3pWIto8pt4t11o2H9+EyW2vHXIj3PRQxgaRzmSd6OY3LPAaw?=
 =?us-ascii?Q?TpZMe+49RVgvN+xj8iizy6Gcrh0PZatmPIiqzTcvFuy2d7UnVdZrob0sy1uJ?=
 =?us-ascii?Q?nFa98rSteP5wDearAkUQnAaeWqLNz87hKI0dYRtsRPyzG2dE6eLZtMrGelqF?=
 =?us-ascii?Q?ta0+2QCCSMqt0ENA4GichW3GnD0Ifyvsw+o6BggGgRBuJMAwdJju2J6JQeb3?=
 =?us-ascii?Q?RyvWzfjQCjCS1Vt7QcrDC1HENBrTWfsW8HUdZKSMmC23tg4VwoINpD4ffgkH?=
 =?us-ascii?Q?JXhplPpUEmi+AcCHXh/jiSeMFefxlSWFuy/DIs+Kz9b3v6yuxKLfZocQ0tDb?=
 =?us-ascii?Q?a58kdC6Qpoh/rvyeGw8jdlzl2rdaZpVMzACvsqKv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b195b33-cf32-44ac-5a2a-08dd4b26e87a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:34:24.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T90sYHEKVHa+B5SFWmbrfI1tPxDuO8+TfoXY/dRrEZ5uBMuGIFXi3y52M3bWZM7MV5zxGzhvSwQRVOIiMr9DKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9636

On Tue, Feb 11, 2025 at 05:01:12PM +0000, Sudeep Holla wrote:
>On Mon, Jan 20, 2025 at 10:25:36AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
>> only enables the 1st RTC inside BBNSM module, leaving the board RTC
>> not used by Linux.
>> 
>> To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
>> them all, and set 'bbnsm' as private info for rtc device to know which
>> RTC it is when using rtc_class_ops to access rtc device.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
>>  1 file changed, 43 insertions(+), 26 deletions(-)
>> 
>> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
>> index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
>> --- a/drivers/rtc/rtc-imx-sm-bbm.c
>> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
>> @@ -15,16 +15,18 @@ struct scmi_imx_bbm {
>>  	struct rtc_device *rtc_dev;
>>  	struct scmi_protocol_handle *ph;
>>  	struct notifier_block nb;
>> +	u32 bbm_rtc_id;
>
>Is it not same as rtc_dev->id ? Why do you need a copy in this wrapper/
>container structure ?

In theroy yes. The current system I use that all RTCs are managed by BBM
protocol. So only two RTCs are registered.

In case there is other RTCs that not managed BBM, the rtc_dev->id
will not be equal to bbm_rtc_id.

For example RTC1 is directly managed by Linux, RTC0 is managed by BBM.

The RTC1 is probed first, so its rtc_dev->id is 0. But from BBM protocol,
the RTC0 use id 0 for BBM SCMI server to handle the RTC0.

I maybe overthinking here. But to avoid potential issues, I would like to
keep bbm_rtc_id.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep

