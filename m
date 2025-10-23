Return-Path: <linux-rtc+bounces-5131-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE2C00403
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 11:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FC844FEA47
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A54308F15;
	Thu, 23 Oct 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WVXzR8a5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610A307AD5;
	Thu, 23 Oct 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211870; cv=fail; b=JEmJ4xx8bcNTT5i7EqvcCJFjqIvxA+eaFS/I5Vu37LfVrJ5gM/4vM/B2GCjfWTZrP1giav0j/1irQtuU+56gqrPuxXrmtY4qu4DGDNPZsRfjsvGfhnuDewClcvabnNrkL9UQ1e8icKq/jcajobYkCRSdUSwVWh2VhYAAGzPVYCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211870; c=relaxed/simple;
	bh=h5u4bLWG1h1ATaka3+SaGpY9IOcK73PyStyHuTSJOdE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q3guF49cWvj8EsFHSHNibYYD+vXK2jxB6nEgO5x+42O/R+ejYdibovspffQMZNf9U7O5I1WTNIGLDHtq7zi094eUYAWYE9F9NiN+NIOfn8c9PrK9VjOaVC0txucGkGXhNB+ynwuMbTUM+0i079GsO50Sn4RUFHKMSuA+LVS7Wi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WVXzR8a5; arc=fail smtp.client-ip=40.93.196.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG7sZ2ocE+FdxOxC1j7zegYMrnKh3DvszOFCTmE4t2EZ5bx/rAOv6vPEXh17ihf9tKuhzBSezKjtCp7uC0Owc+TyOFnCFDwoCKcDVMkjD33zWnTw978qcVZDIEw0yyJWuK3udU0IOMIr0GL5fx5jLs3Ucej6jZNFKrG2QXbzhv/hMpneI33T7/fASSHpyilpbn2lomgEERGkx5JAAyTUYfHk8GmSJj+BXtb670+HIBPJD2PCD4EKp+1gKBVoKxxcjKFksmCv8Qh7fLQoYSv+gMWVZqW8NCsjNX41VEfMTLyIoMhZZ1iN4H9Fo1uTiBpx045akL9hNak6iyBrIzxcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hk/EsDSQj6V8rheXDt5jR6X58k8COB5ibBDXpOe+L4=;
 b=xEvyRbpzcST+aMjTttekUF67VJqRozDSpgkLAy7ViS/LG/ij5Ba8qFL9rY6zsRjTc65nF+QHSoVRzM8z5YJ8yBvKBemOgvxs9zOvV0L1vzSx86jnz5PwJVvS0OLR67KmgFgpbEu5LqycYHofdO9kFN+ZvDUwkojaM8KKw437zrK4vPBA1EUvXUugsn88IiLgyxK8AUsrrEBM1vNKGpnfCHgSA+0AYVAYrsw+GCwQR4pvdUAtOjFkIRgSytU7bAohQKx1DMENq6GDVof1dBItMDy6bF0M/cDuNVeFnN5QQghioNZJ+V3TmrJHXEv0bpOcXXqEL+o69viZqCOG8envcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hk/EsDSQj6V8rheXDt5jR6X58k8COB5ibBDXpOe+L4=;
 b=WVXzR8a5iO73NkteaJTNMqpCWAQLJ/pQ75EOD4DVd9rCS490hQmNvm3D+pHTmWOIqAIE1oITYvXtbhfFb62Z6kXCuFNPjxXEN6A4gSlAN8R/8KjXH0u1SHa2izE4fWj8tSZX+L57t+UqoQQb16dhqyX5aQ4/zxnBJqfo60TPB8xCXnHvgjmuyyHpkU831Uqg/br5XjKQKm9tBGMwZ67eRavhubcz4F3TzjEGvJoO51aTe/qNnwqulaybyW0wk0UFd6E3F8XPxzmC78V9oBeuEZ1bVOM3BZuHDix7rf1Wih4uAmKcDdiZNYnziboO0M4bXjyDXTZNusByiNT+yvaoiA==
Received: from CH0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:610:b2::6)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:31:00 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::10) by CH0PR13CA0031.outlook.office365.com
 (2603:10b6:610:b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Thu,
 23 Oct 2025 09:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:30:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 23 Oct
 2025 02:30:48 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 23 Oct 2025 02:30:48 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 02:30:45 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
Date: Thu, 23 Oct 2025 15:00:40 +0530
Message-ID: <20251023093042.770798-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1b609e-399a-436f-c4de-08de1216e07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aqhFOZElQWVKYopbHN55c9ldEppX0uZkrEKJCrSQyOOBeXQP1Zysct3DrEWT?=
 =?us-ascii?Q?j+tHjasiq0GsIc7txNitG80EqSbQXr9xnzStrAsgJ6WiK6uuCLG6HBtRips0?=
 =?us-ascii?Q?lsv6C9ymuJvLqXmbP/zpFRtogYEebI5LKyIbQtVwBehohk98B/FNNeeD+C86?=
 =?us-ascii?Q?E82oRzckF6J0lAyRjkLaj2it4Cupjh1OH14kSia3qCNpgKA1aOTRNDfyDcus?=
 =?us-ascii?Q?nPKzZrlwVHLm4dtyXGB5H3JISofVAtPA9gpgB+69CP/QnmJNAPnV0Gxnv4T5?=
 =?us-ascii?Q?K8IvyJlZyJc3Hx1KxvwoSyTjyJlmR/+RBTCuetBm5LhbbBcIpA/GR0jk0z95?=
 =?us-ascii?Q?kmPDJlArmlqIB9slONFAkQttq6Bfzcp3U0xLwm8o1fTFKDgAY57UBWMzD+ch?=
 =?us-ascii?Q?v91dEcbwKAXOJMOCVXHwbTJ9WlKlK9ws7Jjyz12WFJ/jDV6GKL+OfwQBYUMk?=
 =?us-ascii?Q?IPryJ4OpLj0EOteHsUynu5zZhTgMCaaXLj13Qt1dgJV9jODDie2FzQcWvDNr?=
 =?us-ascii?Q?kGvm02D44g0C04FpleYSouFtXZV2DT9kE+vJ+TnAG7IsDLlS6orQF3+NbRck?=
 =?us-ascii?Q?vegEgJ/M5RB5rB97TnqKpowfy2r8V2nJDVJDbP8tucUYx7PlsJZXsqVTXkgY?=
 =?us-ascii?Q?/MmObvz1n2sCxdIIV5Nhf2AedtNaVuA0PgTTsql0jY+XZKKU8naLackmry08?=
 =?us-ascii?Q?rQanaOsr/rjpsaE7f7mu+QcQ9SUDOxF6TNzQ4CdZBElDuGu2anGlTVafnwCi?=
 =?us-ascii?Q?mjth82tP0IkEFupxAqdZfdYrVu6izFpl4rPJ40cciCexqV3taM+82v81M0JA?=
 =?us-ascii?Q?Y6oQeh6jGO5Xu4wafMaw8XtfRK/SR4SJe8ZkzNwzDJL4ckXnEc6+S7377cFz?=
 =?us-ascii?Q?YTz4Ebe4BPcw2iM2lva6mt2NRaBfmCcPjQvp+cP4PFicFKxG6P6bdLvoCnpU?=
 =?us-ascii?Q?gBTBkiAKsJyae5lIyXY1bNIRgXIkoFXF6q2vF+iwWO4Brgwt5weuEN1JAFNZ?=
 =?us-ascii?Q?ED6dajW3DfE8aqI0noED8zF081QnQoqeTxxiadCS8H8ygi+xlVbFiHM0BxkW?=
 =?us-ascii?Q?ht8ZgYue33pAVy2LxLu2lVBv2tP+HDuW5A9iNgoke9B1eQA5CGa8iyNe/7eo?=
 =?us-ascii?Q?fvKQjqIW63r394nivxOEPfnaSDpK3uvsyvlmsth+0dpUHBk6/Gem8GRv5EQz?=
 =?us-ascii?Q?zcsszFUyBUGlO2NtWnfVkVK0TxlbDJd9P8QlVezUfzR3EA51bM0PFtTeMR+C?=
 =?us-ascii?Q?yxcf0gTKs7YT/HSdtK9cP+cCaKOy2+BiiF+qC6syGgvCijZodnS/VwjRKOMY?=
 =?us-ascii?Q?uGVk8vN9yFatWnp7/YijkCI0kwfA25si+jZUIDxq8DLVHPiL4wVLpTyW/DNn?=
 =?us-ascii?Q?kFx2MkbGnu79zZBIHlxugyajADNOfJBnCTCD3yZUrRHY6FxME0OEm3i0YoEk?=
 =?us-ascii?Q?AuruBBl3oZWXdYHGznJO0FXwYWLXBpiBA89L9ZCKMy+5QFULEIdodZhBM4Xy?=
 =?us-ascii?Q?0FeoUPFdH+7jzx4AZOg459LUeEkCAPrx/ytogRE4KdR9P9bVt9Bwr40MmJ1U?=
 =?us-ascii?Q?FQUlGsfaNmYfyJpoREk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:30:59.6646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1b609e-399a-436f-c4de-08de1216e07e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012

Simplify clock management by replacing devm_clk_get() and manual clock
enable/disable with devm_clk_get_enabled(). This also simplifies the
error handling logic.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 46788db89953..51f5bb55c176 100644
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
@@ -324,22 +320,16 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, info->irq, tegra_rtc_irq_handler,
 			       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev),
 			       &pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
-		goto disable_clk;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to request interrupt\n");
 
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
 }
 
 static void tegra_rtc_remove(struct platform_device *pdev)
-- 
2.43.0


