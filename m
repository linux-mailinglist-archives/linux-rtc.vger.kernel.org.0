Return-Path: <linux-rtc+bounces-1764-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BA963CB5
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8F31F229E0
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21C318A6A1;
	Thu, 29 Aug 2024 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qFRiG9nA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA0189F54;
	Thu, 29 Aug 2024 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916172; cv=fail; b=JpkD/Oy9v6HX5Te5FPbXwTrt6xve91O5gW8LLfx1+xWUH19RcuD3TMFDrKRegIZIT8hgNX2nktJNKyQ/7RLL75z602IJo7KFAPZVyotff06MDdAMvzKM9Io831cIMhUNlpBTvxdjGw3WpEGwx8cVlOexGudQw+MrBT8pnyIu0v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916172; c=relaxed/simple;
	bh=Q3rCL/VOfCnybaX6C1aZjp5ldwRPJZgp77pk58itpN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dkFd1m362YXPhw8ccw1PuSsEdPpCXlqUeqxIMe9k8IRy4tQkxDkL8p/xzACqY8h3JAvRBZGufikzaQoQeXwMvctRzMmtPMx2V3vW2J+qZtN8GGp3/xdn1AOZQ7DXMhG5b8SUWu3Ghp4YYVLbK818zN00NVcIvT/YDkW7XsE7sww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qFRiG9nA; arc=fail smtp.client-ip=40.107.117.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt0Tqe2uN4pANCw1lZNIgsw3JVPSkpYiwbb8QD6DlitlYv40zrhzXv8FNDlXiBph7Z3/S82ZR15qidDZrgXXH3vRn8FuIIM8k4fFAgQQz1h1grEkuH9PbodHNN7fZgxQt1LIuIclZhY1Iu5f4wWS/bqgNcOJDJ887mI170LD+FMHRRJK0nY8emt9/q1wnhGG7ijDxqhBP+MFz/XF7TW50ztLnCpo+Sasjcds+dOhrHHOnK9sArveaKbrnYYXkOjRM2Rcw4lfREWjqamWc7pBq6KTLjzPtRqV2Tz0JGHqR+WQsgRK0GnKtgGXzXTNTrElMiaCHNIbSwYcXJjIEEqOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=DyKFGasSa+BmjqbxTsI9zFDthMWDNIAGZOM+yjo6hzbWTlYwhXqChnY8fkATeWb4meqU6Dxpt6qQBv8XPhqotxhfvsO+Wi1RVFtYLONiC3UwTIsHfylA258l7PRY5vRCOuyUwVQQ74R3hsUtMdHg+BfNLRne81abvaskfP6c8VVTh9utOZXYZPR9kSxWjwfQH0A/B9FsyIey2DX6dAiaV6X3YyRCMM4SD+WoAKPXOICT52IeXH3jjnxqM3epC59LBfTGzvfB3+9ZKjJ2DQbij8Y+kyrzd1bdABIzhV6TozYb5n6wVuxdVuqZqSqHyOKTqrdYsRzEgKFzC0b0AWCmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=qFRiG9nAH1LEEhikDEApp9ldtmcpgWVnYZnpuDF9Qnxs/12vdrl09lw+H1CdDq9ti0mCT/eOqNw5fvOTd74jwaklz3P05nbeFdFNq7NRWX4QYHGbgD42X+7MnStYLwOHXhwtC18G1VJ3jk5ODfOTaBqrp43ooFHEDjjusEQOxnFUEALXzrg4xYRDdYv885vXgKmEzMi6RYbk6m5ekEe7wELs8+O8L21tZPCknNpqY05/7ilHCMK1e4WQyY9K9FtFhzquWqbHdKuSe2MY8K7cWFzcK+b+jtxGVWLZ21ar4BKMaxXVY/liL1TwlxyDqQ7K0zacyZIxHSD0SvWJCqhseg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6789.apcprd06.prod.outlook.com (2603:1096:820:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:42 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:42 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 6/7] rtc:rtc-tegra:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:08 +0800
Message-Id: <20240829072209.7253-7-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829072209.7253-1-liaoyuanhong@vivo.com>
References: <20240829072209.7253-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405::22)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d21555-6c13-4941-743e-08dcc7fb5ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U+JKx55hvv5jbjX5o4HqSdW/YwO8HCl/73wQRwR2wS0Tod1pYa/ldiDVW41B?=
 =?us-ascii?Q?7w6TRLBAySd0iWqOex4TKDxaDfNPp2Sxe/zuvQQzdc0CfzSrw6TuEngMt5cS?=
 =?us-ascii?Q?t0VAW9aunV7+iPyfvT18JtATuNxdEdpatkHjShaoKTLw+L2PXgIJQvaCtevS?=
 =?us-ascii?Q?7EtGlQiqWDKwLeglnVJemLer5IQRYxPX0dWZi8L1ooo3S9AW8zyjbYbvULfj?=
 =?us-ascii?Q?qlMruwQLda3iRas4wT7BKGAV4+vDS8GxnA3QxL58ixAPJwfgGq6TnrIliIFW?=
 =?us-ascii?Q?D48y/bBTdej9CMQYF3nyDeLkR2wSQrifa6ZD7vxhDp5KnQEJ+v14MBFWTCK/?=
 =?us-ascii?Q?UrDPEcscfUDok4LmQkJqq04WpdQtus1Ehg6fRU8MXWyp1wkp1H+r1m6KzTBB?=
 =?us-ascii?Q?PraaL3RtPR1889Anv83d+dXBIOfR6ys+1W4FOx5h6MScBTheUblSGAtVG6qc?=
 =?us-ascii?Q?as6u0dzRyAE2DPpSodvPsR/yfWR8NnCu2f+ezXmaJuf3P9zWtg9FfjxePzfw?=
 =?us-ascii?Q?5yCV4LZayHM2LRys3cDpQmTX6IJ6KWuP7jIWY2EJwEb4ak6x3TSjmfNX8oH3?=
 =?us-ascii?Q?f0ABpjSMmMFbcYmFHRQSaQKSKlnWEjlJjPyLsxxp6zuUmYJsFs1ROrd4kVYF?=
 =?us-ascii?Q?rjheiVdxITTyHtw7nZK4wgg7hjuQa9cgyAphG5T0AynaZmk55Px44nyxq31T?=
 =?us-ascii?Q?MEl8j3M+qwxhL/q0u1A6Yh0h8+QgLIqsqmCshfVRBlLR5+5Ge/OODU33Z2JY?=
 =?us-ascii?Q?aW6icLYWIMKOAVXe6lIVJ5AvvOk8yC/aAaxwTZmdYdUVftdGEehN8ks4UkkY?=
 =?us-ascii?Q?fPEIyu8d92v4T3vZqk7CvDen2U9LmUJVvB5g8YAI52psMJ41DQosocAQqZt5?=
 =?us-ascii?Q?b3AZ+PDe4fKnSbsRKywptE/si0NcyjC0IJ8GpeQEx1I+zlub/OYfRAAHqiuR?=
 =?us-ascii?Q?3YgYOnbJFaGoDHbh7lygKRAeA3ZbZAfXoyQKcUX6zo/5kWVonfIQYBzJ37i9?=
 =?us-ascii?Q?Z6VE7rodf/vCCovgLf7s2KAkJvoMEj35V2gpo2+JpmlKrI40qiW7kjstdiXV?=
 =?us-ascii?Q?4sxMgL2djb2+fkPj0cAX3GiJxaRYDz3F0f0mfzxwh9BO1tg8w+KEiq3rDqnC?=
 =?us-ascii?Q?Bp7vY9zDyj+xApzbtq2hArGmRRqMt4Wr91hZ5TO3qgo42gyfeKVotTR6aXmU?=
 =?us-ascii?Q?EXGhYAzbKBZ07nECNJWzbUPCsxntvntvcb4swEsC7NveTdzdvLpkdIXlNTRc?=
 =?us-ascii?Q?osCkqOnLFiRuGXRdmGe1tyrk3ka//pvMjT1LvC+tdMQO8wiQO95a22wqpoiv?=
 =?us-ascii?Q?8m0KvrhbsNB2j/PdlgBOS5v37yBSkLxO0TbkwTpn7Y0qPnIfX3FPCJKiuf/I?=
 =?us-ascii?Q?v1aB8nGGyKawtfC+lK+yE8l8cOkMbGlOP/TyyZ5+6OiZfcA2CA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4yjXHkBQUuLZFwilb2WsulEIowYC5ZDYSg1nFcRACAQEBlt4lriAstt9J7E9?=
 =?us-ascii?Q?YRZmn4Jp0KDbIEVVOUZIkOS4YGzuaooTuutu0tpTSg4c7IcK51kGGnez5ldM?=
 =?us-ascii?Q?j/ogca4cGTtvHVjMXln55FjoDsGO/EfFKiBx+MS6HtkyN+iLhr6/q2xqULC/?=
 =?us-ascii?Q?QOdpT33eEsTSgcBDsbOszsEBMB/TrEQ8AjoxHo67A39r9uZeYoAY1mFMkpVL?=
 =?us-ascii?Q?uwARCZp8tfaJEMKuiex1hjUXslH05M1tFM+3CR845HVcYnKelZDaPZhRNMWd?=
 =?us-ascii?Q?4Uft72qAucH0HbVfbVY7MvLhScyn6KRG3KWU+soeA9WUweIevM9d/70A/vnU?=
 =?us-ascii?Q?TmC7zekY2HiL/PMHUfeJPUFQ1+e3c10+hF2KazrsGfWIZz4X6M94TYGlFank?=
 =?us-ascii?Q?HbEAd26KnxfX+4PixvC4kiKehQz9OTg3O7qCxSkEVoJlr/L3ZQw3sVvruAt4?=
 =?us-ascii?Q?uK3vBLCrult3fvbLgW02JE1In/R6rNYlFiBUUnRhPHckXqH0+ps6YJYqIbMx?=
 =?us-ascii?Q?qAf6RkWigrjh2faYYolgdvaNbVr/vLItxAjpaED41ktB236ZXp7eCFUJQOw5?=
 =?us-ascii?Q?Uk0w9/YddB59lrHgCpVGoZnZx1hGVHE/Mx5//fhgxnnUpwi+glciW22Bbxqn?=
 =?us-ascii?Q?IRd+9MxthSU/8Fy217xtWcxCN8rpJIKZYcCHSjJxv9dI6dxQZbx+qsmVCtmP?=
 =?us-ascii?Q?09F54Hky+eEKSFXXWWz7bLO+LSqAfVOX5ktqL1nMd3IHQqfI7ok72PRv+gGp?=
 =?us-ascii?Q?u5GC4gdt8ZChuZFBtFnLplj25QCdNKuwHXgC9rxnZLZrLXgz6AuwIdd4BhMI?=
 =?us-ascii?Q?Pij0760cDCD49agspNqJMMZ4s8hmXXdg/S3tFS5gQyDuCVwv8SJeR/OvSfCR?=
 =?us-ascii?Q?bu17NQLjrTuWUBpu9rqAiPZ+qWTK3p1f5efOXlcgJ0o3fJdTDECOs3uYcHoc?=
 =?us-ascii?Q?NxMkSuJoOmpbdi+duW1CIrGcR37858xpAE3n43aPHtaFudZMQOkXvBYzxi1h?=
 =?us-ascii?Q?AIGIH+jRziFPgFUPszTQ6tsFI60P9M/r6KiFrJfV9l7SO2TppG2UZd14ViQu?=
 =?us-ascii?Q?PL5tC6j4dCmh9QBGPfmRgqgZJgCiiAFFTjrPo0LV9D2NfcYZd82T5LePosth?=
 =?us-ascii?Q?HqAHMuVO4mT/O6NCtSj160ede8ZKgBOZViOtjc7Cavv3C7FAqLbRrk5mAxDR?=
 =?us-ascii?Q?H3nGJ00GJD07nOHPSKznZwcPGR3avoWpNCjQkHKvpzsG3T5/+V6zSm54tHo0?=
 =?us-ascii?Q?xIqaT8XqaDGHnHQQlZqb09FJA/rpNV28neM3YkSv517v/iDeF0s6Nh4MtS55?=
 =?us-ascii?Q?zrB7Ey1xzuNMxZt6Qd0CCRlxW6DshGFuT859651JLEPQ2tIdRNGIKcnt03LH?=
 =?us-ascii?Q?r9H+UFH8pCmBU9pLBdQaHcRUgdG0it59RkcqbTRNfVZezx19PFSeNklBkyq4?=
 =?us-ascii?Q?mwUb1zDE8MFo00hz+JMHQbudyUvviFsH0dfEb+cSe5/eST69clvUu77mmKbw?=
 =?us-ascii?Q?2QDhXFoiLpcyCLbvbmD5DwdAdcH973q3QdQVvY7XN2FZP+zL6zSX49ftdrmV?=
 =?us-ascii?Q?m00oSFvlcPQ0Yoq5BG19G0c7G1sivXNa4leHTCck?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d21555-6c13-4941-743e-08dcc7fb5ed4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:42.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teZdU/71VOxf0lrxSp1ua8Tn/kS6+oMLPw1+vzpwmG8Kj3FEpUuibUPUN2gf5j172XKL92AxX5Bd6qdODjRi9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6789

Use devm_clk_get_enabled() instead of clk functions in rtc-tegra.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-tegra.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 441e0a66b215..28db5b8cabdb 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -300,14 +300,10 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	info->rtc->ops = &tegra_rtc_ops;
 	info->rtc->range_max = U32_MAX;
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
+	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
 		return PTR_ERR(info->clk);
 
-	ret = clk_prepare_enable(info->clk);
-	if (ret < 0)
-		return ret;
-
 	/* set context info */
 	info->pdev = pdev;
 	spin_lock_init(&info->lock);
@@ -326,27 +322,16 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 			       &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
-		goto disable_clk;
+		return ret;
 	}
 
 	ret = devm_rtc_register_device(info->rtc);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
 	return 0;
-
-disable_clk:
-	clk_disable_unprepare(info->clk);
-	return ret;
-}
-
-static void tegra_rtc_remove(struct platform_device *pdev)
-{
-	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -399,7 +384,6 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver tegra_rtc_driver = {
 	.probe = tegra_rtc_probe,
-	.remove_new = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
 		.name = "tegra_rtc",
-- 
2.25.1


