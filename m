Return-Path: <linux-rtc+bounces-1776-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C56964426
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9F701F25E85
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C7F1AB50B;
	Thu, 29 Aug 2024 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="SPcx3IQo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D381A76BB;
	Thu, 29 Aug 2024 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933732; cv=fail; b=tUFpfhDy61d4XMvP/SacBtlgsIjEQAbCyfH6Fz0It6UpVkF7vxo6dDfYY5x0Unyhma0AHdsHznEqJOWLn4R/sh2KQv4U6bf3BTEFz4aoLhsyPWuJIxsxcjAHDtNNn2riSQZcluQfDY9uPNZA6wYeADDy0Pjn5tuqSJpgYUbO4j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933732; c=relaxed/simple;
	bh=Q3rCL/VOfCnybaX6C1aZjp5ldwRPJZgp77pk58itpN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HDh4CETc+gMLMT0Kszzr7TWeMgjSGYdjyBN4SrFZUNpKh3EbnPazgqrcBEzcoWrqljaUgQWrXaQ7Uv4D4zCQk6pmDq+PszoNpvnqtQie9UiU/TnZ0qfpyp+mpR4iGcqBIOZ3TstIakmKGKQJe5R5+3/w4GYdLQ9I+z/pJJKXfME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=SPcx3IQo; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/hhRutB7ZZd4yOtgwyMSopRKzzUICfQtIYUgxAHvHHQKTDZCB/ltIcfccqFyLFAwG8Gz3JO+fJN0gWT3pa9jmG3KH4dIdiDKb4J0VOiUF2fJv0p70tkwNVMAMLLPP0KncqDa+l6lNGzuYp5s8ZjYWHn90jLy0Ycdf7Und5eI1MrxfgV4fnMzfHAp3OVmQUqdVG/ubz0y0Jn3Ku+3FieaC+SOC1iVe8g1KoPRjrd/+ZAwOeIF+L7pVR8WiHKitjt/t4JZ8VT4z88GM1d7lrFhc+nUcqoBgrZRnCvASAD7V7MgKQvm2HD96tLsHwH/V5w7bdCKwNssBO20SY1MW/L8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=YDdZ96n9S4BhUzKoT1ug0mx8Go3eKBJuxhR7amLm8OmaJaHUAouyfYRueCWbCZYSBEsGezBz21pOYT9wBrs6e45rLe0YIozXUy0A/QduSvw4JhKi9lvK+D97GxstHErVIcuh6Qpr3VHx+Ziax3YizD01/SD4cM/JIobZQ1cnmTtGnU79ntQEOyWXVGyzPNdYJ/YDLPPdzLDUsI1CWLrYf9Bf3nTgs/A3pNRSgaCfH7cK/c7w7BPeuEgTkgwHjnS7QI+GIiHjS9A8hyfk5smD0m2xNANkedwa2k6TaARgnqk13CEqF8AMuFViC9IYAZ63+RigYBGdaplbEx3ScWK+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=SPcx3IQoP5c07OMs++nRbfwWPb/yscaKwPGuIkHBizv0FZoqpFzn3SY1vX6y6i4+t33ZmS9ouQKsdVUsSOPPwJapjRJfhdhn6bwUAfBHTEOTpGwdDV3y61vLQD6yV5vEoC/f61jExNppPSyzXD+cd4fOetr02WW2MqN8jMhbXTb7f+lbc4yqli5uWq6DBt8X3IVVVr5tcJDEykWx9QS8xbasxer2hpS0wsMGRzjpXa66r/GnRsy8VN4ITj+edbvor4haAWlVlEmtTviCRfiA6ti5UQUnLHGNyF4+8czslUAzsR+5VzS/KLv1Yle2brEXXX8WbSmWJFVT+5eC5T1N3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:22 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:22 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 6/7] rtc:rtc-tegra:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:54 +0800
Message-Id: <20240829121455.16854-7-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f614bb-7799-467e-8ca4-08dcc8244194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bek2DsOPUGZVqCPJtvsheIAf/19ifyV0du6zC9gVOBAPEfiY9NXEzaQfhTeJ?=
 =?us-ascii?Q?QxDElxOvHhPgKnsbGV+5smDaBuYt3zEW0z36O/3aqpZMDiaVM97wi4ogqCwC?=
 =?us-ascii?Q?miUZqP/luK19cfxgdpfJDZ66q1uG23w+kZ37U8Dmumsrdr1DbHUQYvqeFZHV?=
 =?us-ascii?Q?8Sh+BO+UD4Ha+AxZcaXWDXzCxQqrrDnq3xIfsXNAj9rfeRq8y9Y0OQJUxN3F?=
 =?us-ascii?Q?tDzI5EOCzl6rubiou5Dw0UslYMbTOmo/+6aI9pv0GS96LIx03Oj9s5BOqmo8?=
 =?us-ascii?Q?xbZIeKd19QsU6M0WdHDvtXkCRCmZBcDpPHvE9yC9PposdubwzXguCgPSUGSq?=
 =?us-ascii?Q?hRGY7b+TYBXEpBBU2/xLiGaiYN0/bUtHrL7bugqAxHv4GNs4vkaJZxi4fEsR?=
 =?us-ascii?Q?jwy9S74K3fIuXNw+ZT0d9PgKpFMvP35sd1SQCjPV0OYaG0Dtu/xyMxnK5RX4?=
 =?us-ascii?Q?j0qFVqHuP+YRa9momW3qefV70fK25mEbFsvOcp0fC5hCdZUBsmyiZfpGXcMR?=
 =?us-ascii?Q?Iaeop08zz2sALMSUZ2xnV36PK6hHjtllaRHVZZPILxu0xjHIRX/7icJsfV38?=
 =?us-ascii?Q?0hN70SBnxHj5KP/cnCz+2vJv/BHGfuQZdQZaF9WPzCPyA8JVjTZE2piO31I5?=
 =?us-ascii?Q?NAMN/m6PFouJo8nHSLFuOFqB+JgdWRhXvNnlh5DNUdyXDtN61DPDV4fSxK9L?=
 =?us-ascii?Q?s0W8gLRcdrgorYzNOac8lJZticOcn1gO4tE2U9wFY7YTgjiG/FgT/2Z8dfZx?=
 =?us-ascii?Q?3FOqqiBxGdVqq2OsYc0hGKrRy67MtP7Zw+2ZViLeBbiy6Q6zlzuhzgdeKrLq?=
 =?us-ascii?Q?/t1iW2zsd3HaxMZY4XlwEjY3reREmo6hKIFkwY7yfduqAYgKooxic/DuexKS?=
 =?us-ascii?Q?4lfQJcQ2o9scKemsjy4hY453OKwO5/NHGxe9f+I2f77APPdj9v3BKRk5n5le?=
 =?us-ascii?Q?xuxJDIEaIXHhUdaN1CevBY8lGOXzJ0T+3SYGvT6Bw4yX+RiFVASsmGFfyp0p?=
 =?us-ascii?Q?rPF045EkZkwMNqPYOKd2ClMDvUQ+6Y6qSUnrWviVTacrX+5bJiGim9SGYgsT?=
 =?us-ascii?Q?HRn20Ye3PWv+flm0nD5cvuNvDc1giPi51iizHV2NenrL9G5NtAYfdeEgksjX?=
 =?us-ascii?Q?58fLGjTa8D3JHZC/WWAqVYaCgcB+Jq9Os867HY2n+/u9IhPQQl2aehh7di7t?=
 =?us-ascii?Q?wJyID4SxzbWnzbRtcNxzohvj3P7bBrZ8Da6SuQenOkcPgBTSSzK8oFGjo2+y?=
 =?us-ascii?Q?KC0FL7QEwWswc0V9tfdNTCES5YEl2zlrR9d5f66jEJZh+FRW2fFA8xyLG6Gx?=
 =?us-ascii?Q?DJYOworw9qP3uGn6JiRJBgMKoThl5uP6ml/FhXd1R6v3WYnhNAD7aoE3atDV?=
 =?us-ascii?Q?V/aGr+JNvcz4sk03/DmKIhxn6NfPY/lRV3fvBpYRXT93Z5+86Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7IC2HHc8P9Bn14purFoxiqQosYSTI+zOshyf5Mfwm9ZPvO79D1ykTatXL6A?=
 =?us-ascii?Q?WHkHw7ZUZMKSMTjeDBSsW4/fX/h5jaem1BKCnPbxbPi1ZjsNjHHM0artlMW7?=
 =?us-ascii?Q?DweDl1VEp98ANqdpjdX947s35jsvQq2bgS45Wrh0WzF/Xme6o6X8BuIrpzPT?=
 =?us-ascii?Q?wPtDhKn152RfaJaR09k/fydx83fOONyeM9Y7GrIVdkOtes4x5dNNmwDVMKxF?=
 =?us-ascii?Q?g88MiRBlS7hOtnYBuMBcz4ao8nXOZ/zOzOPf221jMdsDBX+o279vmJa2bZb1?=
 =?us-ascii?Q?/BJ6DZdnTdfWRCQzRa/+kPPY+HyigQ48yOrmb4jZImvyfo1zH/w9cnmhDBtn?=
 =?us-ascii?Q?Lvd9cx6AzRLLFDwMn57bKaDuWe2bPavB1NyWGj+EfHF6M7OBChCByqFr5Jj2?=
 =?us-ascii?Q?0MqwCaNFv6+bkFK20doF4l77vOSEtgwM6N0BybuJypbNbQs8yPIo9zFBibm0?=
 =?us-ascii?Q?b29nStkMng2cV3gWna91KzRsPniKJw6wsEEgMN4iOm2AVcBtvTR4RfChz8I/?=
 =?us-ascii?Q?eccJe7ZB1muYCTSv9dqZPlHqSHoHoaotWE/SR9/tnVtVaowszCOwbDruHbS+?=
 =?us-ascii?Q?I/hXg9ZQ+5vaCpMXuBAezPCYX4XBHoUwTg2Eq7O2JhNiUk+hlgm5t3vPZnJL?=
 =?us-ascii?Q?Ow1XqqIXTffDNSgX4btM695QlTUU6icUhABgv7crhsDkx2HK0leQaGjpU5Ji?=
 =?us-ascii?Q?yKDdceDrkVjIo1XQGbJKGpwuS7mO1D6MwcYSORo0Lq/d44nfZeFPzFQE6Xmg?=
 =?us-ascii?Q?GhTe/wY35VLjzlF1lDwD3HQKrAVg2pAzXVIG+WEgpP/KiX2Q+1cGpWI0hOzj?=
 =?us-ascii?Q?Ueje3IBY4RQtva/PC7PZWN8aMo0xPudHma+kNYQY3/mJwp8JrR5L70p85SIR?=
 =?us-ascii?Q?ecNW1jC4dQIyXAoMaXYXH+nhpw3Iydzcu9k4qnT0+Y5K8wNhynAGxjfsLMoc?=
 =?us-ascii?Q?nt11Fx+pHdE9Ry9ZVQLRRjjhBihLP20UztAccmOeoa3PHiz4a196PQgGDoUR?=
 =?us-ascii?Q?AC1jVO8yUzxCjOuyblqU6nbUbyNZiKJuCYdIffjUVQCqkIWoiEjtj/PGpR+a?=
 =?us-ascii?Q?pd7iAGzCKr9o52S5oln33wHKUVfSN2eQwyIzyRVdHN83Y+s5TU1NXCkqmXm1?=
 =?us-ascii?Q?vCqSTsF3pIL/F7bAmiqs/k8oWQpIBSEoAdFnCj6NbaQjdCgadcAePO77bi8a?=
 =?us-ascii?Q?XprKabD50/p0KwH3htjT2Tbora1F5s7EyskTmq8zz6pR7aZZNmglp5bU73f9?=
 =?us-ascii?Q?daHRRIc1YwMlFRIOVYNkwyJ9pweIgbi7tAgALLDG1XtstgQ76FMQgAeUuk/n?=
 =?us-ascii?Q?/zguX2mskBryEu2fSUUH315HGkJNsw5uHj8bJROHhHNUplizljrpKLfwotCx?=
 =?us-ascii?Q?jvSBIceIg6nVEAABteWxHH2/0d0JrvBO4zIu7jiTD4lECrFwW2ag5osLGgHb?=
 =?us-ascii?Q?8wYmQ0yN2qXsbzaaxl/wwXQ+SE/xLJTIeiinR3txGg3hlhx3vsSrK7zQ3GnU?=
 =?us-ascii?Q?ViMLSeebYLYClA1FvUErYQ60CXH3TV2hIjaPQh5UlqBzkXmdEk+zVBofbLc1?=
 =?us-ascii?Q?H97/0oM1TrGdoasQ+40ooF4kzHqizeNtPIfl6gHy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f614bb-7799-467e-8ca4-08dcc8244194
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:22.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdyK0RaAn06FFSRS+SdNHZeKEP4qUYdKEqz7roYmLFMMAQkfyzf4u18+OuTyRr7Zm6RyLGxmQm0PlsfouLincA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

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


