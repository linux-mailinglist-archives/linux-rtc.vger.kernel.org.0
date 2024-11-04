Return-Path: <linux-rtc+bounces-2441-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B99BAB14
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 04:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47ABC1C20BAF
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 03:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A3B770E2;
	Mon,  4 Nov 2024 03:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OwWOU0B4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6E33EA;
	Mon,  4 Nov 2024 03:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730689514; cv=fail; b=bmeAGhRjxxgs02IcGBBz38T3J3XWfYYOjRQ0Y1Vm3bdvo/f2Byxgvb4hZeruFaUq+37Ubr7Bl2sGgbuOubSQy965LH9iTVfExjkhn+B5bBpf9HQJ92NavfJgMsU7TFlcTuyzpvGlnPHN3Ip6zUMWx1PFxol/ubjFOis7ZLOz15Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730689514; c=relaxed/simple;
	bh=Q0cSdsU5fQ4FXbAANYnewAJ/D0o/SlYcvBT/bdf+0zE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cnPjNDzIQfnVKTaIQ3PIcaWISdPMbN6Lj2xoMxDNW2LAum0567jj+C3uDzPl+4eaZq0GTpI3KJKVa6V8Zbo9a6DKjSX9NXU5wRCvBHsLPgZNV5qxH3pQN07785Bkj2O1ANDSs1pwMKkp45Cml796jAKLLaNOcRuoWucTWbgf7co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OwWOU0B4; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnEv8ktfpjBSpUsb+sWB3gk1jfonhSifOqsnGTO4LyFmlU1QGITebEweWXatDN6SH2w0UYbx8oHt9QF0zYKRsOkoGtGV9azcBxzN9gVB7wB4hlpMFIft3R7lSpiGrGAxLfj69lckOTe1BxOQavEyhNks+yO09BEKM0SsT6h1RGhNvTwiru989GeSZLjJ3H6XO1+KL+vLWn9KSv8Nzls/DGgMttaHLa60+yqwAKUUsVY8qdrWkXKEjpeKsq+Q2ptMfJ3YqpSH75zP+AGUUsZgRhqNdBsOE4qQfCnDPyvzX7gMCsrMnkLT0841H4LRsTLYnLe7LWOvFX63BrjmCXeBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJIroeFsW05/wvozpUgHOD/HPVEMqSAsDuUt0crPWXc=;
 b=USUe08rnTOHxMXcqwDWv0Am2NQ27UHHUM3uHnoXkb5GxuDTEa78CaUEOR6I3Fdyc9BgDOLqqcyi+P93DfPn2ZG1hc5PDKSLOFiKaeflz6xVtzeeMNNGBWo01HJmSOrJ8ctoL4ARFh8H5TGizi1LWElzeovUkZQuh63WRI3WjDwC1YOZoM45k3yXvkz6uF7n41tyShGkd5XAmFCcfAVVOl2j89PltAdfVU+6YLYTnm0ZaCQNd1rLiCfrxWCv2FS+5/Ya4m+dSlK2LruNmUShKZAqAW1DfyJf9FsKcL/jWukixPzpcH8cOO2dg6IFd++Ek3PasxbT+nqNdULJ4pps4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJIroeFsW05/wvozpUgHOD/HPVEMqSAsDuUt0crPWXc=;
 b=OwWOU0B42lZ1+QWEni5kEIgEni+ihE2wele01lm5ohXDWYCTpoq3s/pAUmhsa+ETdl5DbCfICzYaBhsRBv4G/muwbBKRlgCNdiUI1TNJwuxZ4qXJJhrlWiG2MRc2qBMsDn4jaweFu5cK2B6wCm9LzrfuiDd/7Yeb3J5+Dfca5dKujjw0S+rEcxwd2oh05aa/3WAywm939MRso4Dzv+d5I9hJCVM6VWHYyAXQnfl+i6ihO24e1aobtI7EJ+QqmN8rj/3/+KaY5xNabiz1DOMvwoMGQX1vdV9hxOk7qiXOeFf4+PFn4DMqogNcCaaPQOG9vpTdX+Y66rc+PMyTH56aCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 03:05:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:05:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH V2] rtc: bbnsm: add remove hook
Date: Mon,  4 Nov 2024 11:15:12 +0800
Message-Id: <20241104031512.3474790-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f9b69f-823a-45f0-4da0-08dcfc7d7d22
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KMh6H+PDGXLqabe9m49pM3aHVmNUEkAGHdVaFV2urEf9NNCpQmcljqgYUD+V?=
 =?us-ascii?Q?eruP5p7iF/adiC3wkz5QJQpNx9OudWwkYOoPiuK1YekhkqtfPLntQhTxLDk9?=
 =?us-ascii?Q?9zSqGkiVhrwu657yM5shjTTI4nnNWOMDVB/qjqmGsH8YeA6jKHM3Lxl45F39?=
 =?us-ascii?Q?eF2SIPZ3y9SR2QtNQU+JnkXf/nRRKh7ROjPRCKa1cSlUh2ZZHgWmmOtqwNPM?=
 =?us-ascii?Q?67p1aasW0sTbZpX9qmoPsuQ8FgSXQpUKpgFD+FfHL7wQIl8SFAN/Rn9oALqu?=
 =?us-ascii?Q?aJ/jH7PI114sdnkh8Bef9ifIWQ2c2affBQdQbkACsZblpN3l2v83pZyYcJHM?=
 =?us-ascii?Q?BQBMKMQ/eKw2uXNp873YfenuFT6oZvkM77szyyD1ZELMsVb+snCDMDdBc9qa?=
 =?us-ascii?Q?A9Nxdl9dmcIoBj8xBnpoZ7CF4uMg71U5tV6Zxz2LYpJDMajuJW0/ttgv24RM?=
 =?us-ascii?Q?aswB7e6489q2igFMTK38C4od09iMe+E9eu0LIzrkr7d8N1DBHD6WgM4J/K4W?=
 =?us-ascii?Q?yisoypViuJ4jXAF8XQywOzsAH07sCLEXhPC3R2eliiwvR/PTc3+m0RvwiAdS?=
 =?us-ascii?Q?fGBTEc1h9YCRRwiG32AHA9DAjsXHr5hqZvHQn+L5tOy5/6bjx/rkg82mWCV6?=
 =?us-ascii?Q?1dHg6wlbjCNaywtO85ySo2mI6qgxdcFv6IPMKV0IfUndnEJgqRyEv78wqXl/?=
 =?us-ascii?Q?W1RfxPyoNKRh7GiTCOs2rwZ9DJk+OKCvQ83NPKEh0kYRgtlTj4xzJzVT9JBN?=
 =?us-ascii?Q?VfOJ48krTqTaZ/iu7i5yu66YoMutw8MzU8XoUyO6c12GPPRpQTszn4588DYn?=
 =?us-ascii?Q?2YCePv6Afc7ZJwY06TzIT+szz23bxUbjlaDL5K8pDX2GgOEv2lOUhargp1pF?=
 =?us-ascii?Q?5CF3FRY2SLALg8/Nt72MS1PiH8saDxJaW0X7EQi93kMNUETcwP5OK03Q5WCz?=
 =?us-ascii?Q?nohPfnmyU9m7hJbHL39t3PS8V1arQFoOzhtBgIdpcrvq5eyrLfnAF7KYYeXI?=
 =?us-ascii?Q?krRROeJF35rEtDGDIHdfqsFJ53wcdw0ob9GLR0sAz6GFLwWpIq0i+he93Mgo?=
 =?us-ascii?Q?wYERiye3IHp1o3N6QER8ZBQqaSVBqYfaEWtjEbcTEHg9Jnc5YfooezDJjG3W?=
 =?us-ascii?Q?9orgfISSxNxNN9im84HaCqTl8OwpWlQHndzwb7aBLuM1OrJe2HgJSIgi5ro6?=
 =?us-ascii?Q?mlXX2Z3aAhh9/6FaApaQ6m3YyGFmuQz9/qu5O8Ow4Ft+kxIVquUzv+QgjG5l?=
 =?us-ascii?Q?7rQnxgushAJW18lto42CxB3R0uz2iEJ1RCbC/+8szU2h7/Adb6/qifhX/dkB?=
 =?us-ascii?Q?OOGODDENMQ29Bd2/QQzsyNctvJ6iPaHgdd2cXoWBSnr0R74tiSs2ecNH7b3A?=
 =?us-ascii?Q?R3/kHfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RcsMZhmYzmFbulMl5Nja/CDk14aOp4LXMOuB3wp8bFRIrCEAlJVIEW1KGGD9?=
 =?us-ascii?Q?YB7j1a91Bs6cs4fK5WvvrFIg8CAvfwnwq6r1kfvWH5Cqc9otOUC9ZSz3RyDC?=
 =?us-ascii?Q?UyprJa8zKfTGCixlJ9da8B+L+l+4lkPDuqbma4T1/7iS8j82XN2XclJG8KZ9?=
 =?us-ascii?Q?wp0xShgrp+RB/ASxBltWKANJixGSj3MCmSJ884lWQvMkqgtDYGS0vcMh0rlI?=
 =?us-ascii?Q?ahsSNiZmIWnnOjxy8Ir334lhwYjPJvPcHfMqvOpThAq4Pesi+I1kAWCpL4ZX?=
 =?us-ascii?Q?NcOFiio2G9yIN1CmKnh8aMiQputPqaszb3TS7gfZN10ky5npGGccZktwYb0y?=
 =?us-ascii?Q?cumfWkL299VIkOY7L/alpvqeINoNH5xOV18c8p1qqwoPXlqUmyE5kLbMgKnz?=
 =?us-ascii?Q?+gFZtcLZjmMuk6Z0jWFiAXF6NUZwR05C9o1CaLJfQFiyKmRnZ3Jmcn8xTprx?=
 =?us-ascii?Q?fb0E/sfxrOZBGMeofkL2CpcbKSX4EO02Q9gLfRqHMndFzzgLroduzvNr/Q8c?=
 =?us-ascii?Q?mleWtpVqOXhTO/BVc/xnUdP5wDX+7y3jJQWt4PEb11e257cF2l4DkGz0qf0F?=
 =?us-ascii?Q?xEdrmjB7bII3R0pTQE2c1iab0RaQQvY5a/cik43MmOyVf/1w18Fwhp0CnSnq?=
 =?us-ascii?Q?kdNXCgi1rOl1WTXEEn05QWFCHLgaVIFJQpXUNkgNjTX3A8qHh08Y9anZnThe?=
 =?us-ascii?Q?Xn9/pdYgoJjp3Q9uIWV47Jc/7dR4K9Ac5FTexJ2EL4hJbnEHPZJ32sQfLCIc?=
 =?us-ascii?Q?xIILlUrNB/ALMiqWxvu68WWVQVcjWn8iiLRTNuXSHSBMFdgsCPMa9EAEJaWW?=
 =?us-ascii?Q?iPR9NPuWW0lreU90SAhmH0fAfxvl2MQThKIVZCeTopbuGbOd65l01XPHSB3/?=
 =?us-ascii?Q?m1JDdVf0lmB/RSoS+Ix6Jkj7CKQ4nRKGhEEwZa9Hm/h29TVoQLMMoE0qxlJ5?=
 =?us-ascii?Q?Qo2CBfA1F9dIVhuXSvGVLPu1Umt4TzwRJos2GpIYpNoHxoA5rx+V2wsQHS4v?=
 =?us-ascii?Q?qbWUhts6fVnM0OH5y9Q9R57Xa6MRWKE2FsET0kKh5V4gQIUHHiwfHIc8CRoK?=
 =?us-ascii?Q?N5WJ+4vR1K2Paz0l8WLnfzX3g7Sp7iWGlWy49x7H1dqxD5E6O381mcWRULRV?=
 =?us-ascii?Q?rdQd4dLNfmWxh4B7VOtkVO8ju2L38rUYqTi11gxBe+4+Kg+hExv8/oSMC2yn?=
 =?us-ascii?Q?DZftfjXEnlhDX6wY+9eB2wSiI/a+7U81NGu1sYS8nhP8dkdq2jbFI3iXGISK?=
 =?us-ascii?Q?BmLu43p51AEKee81jMIbhfOf0CGs7hlM7kkpwwaSa9UZoFbReE0ywsfKfw/C?=
 =?us-ascii?Q?V0ZfTYh0NSruxT/BuersZ1cHwUhUm5gGZTqQrw+VtZMaogXFdrqBaITihBgO?=
 =?us-ascii?Q?F9OXpXXYOvFB19jZsmbj4tgl2Xuu/QLr+p2822PL9+vrPqWkEoRTxaDF2ztM?=
 =?us-ascii?Q?ccn0UJtHh/pqH6uaQK9GfqOMUHL309M9hijtTbQl/XWZiGR9tRvy91ax1NrE?=
 =?us-ascii?Q?CzMuVH9Sm5iuc3jib3vaA0TW8xcN/lfaB583d/RTWHYMOL78w57oryhkTlM7?=
 =?us-ascii?Q?7FcQ40bwPwBPfUNz2/5J3LZ4Lt0ctd53TviUenmJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f9b69f-823a-45f0-4da0-08dcfc7d7d22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:05:08.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUvtL/rwkZxMb+c4umP3LmTm2MRSeqP+uSpUlGXwsh8f/6tzPtWLRTq84GFdU6zF6CL4GUJDRX4NWE+m2hE3jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Per Christophe JAILLET
  Use remove, not remove_new
  Fix error handling in probe

 drivers/rtc/rtc-nxp-bbnsm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index acbfbeb8b070..31225baddadf 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -197,13 +197,30 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
 			bbnsm->irq, ret);
-		return ret;
+		goto err;
 	}
 
 	bbnsm->rtc->ops = &bbnsm_rtc_ops;
 	bbnsm->rtc->range_max = U32_MAX;
 
-	return devm_rtc_register_device(bbnsm->rtc);
+	ret = devm_rtc_register_device(bbnsm->rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register rtc :%d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+	return ret;
+}
+
+static void bbnsm_rtc_remove(struct platform_device *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 static const struct of_device_id bbnsm_dt_ids[] = {
@@ -218,6 +235,7 @@ static struct platform_driver bbnsm_rtc_driver = {
 		.of_match_table = bbnsm_dt_ids,
 	},
 	.probe = bbnsm_rtc_probe,
+	.remove = bbnsm_rtc_remove,
 };
 module_platform_driver(bbnsm_rtc_driver);
 
-- 
2.37.1


