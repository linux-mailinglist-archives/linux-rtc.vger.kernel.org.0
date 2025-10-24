Return-Path: <linux-rtc+bounces-5140-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F50C048FE
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4773BA8B7
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 06:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E418E275B03;
	Fri, 24 Oct 2025 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QMEo89L2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F713238C03;
	Fri, 24 Oct 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288622; cv=fail; b=pfi13AL4PhxKDguJkzpZ5X1k+a45PU0sahW2li8PkDv88hMbgUstDIC28B1sYZhgqJ1YrpV8Mwk8tSFuqvOUt7IX/kwQS3Sijoj1t2SDC44/43EcfD4W1Wy/g4WNulN1P/ei4kibbHSqDculCefC/c6QjzP4cqUqvzVVh5X3FjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288622; c=relaxed/simple;
	bh=bP5bzMeZmPr77PBwi6FwaKl5iaGs6wkAXb+9bu+lHcw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDiNkHrrtQyiBIh3kwFgGw573nFycb2nhUdQuxI24Ub/ogo7DVgFB+dTpcmzW4b5nWOXwy7flf6M1YJc58haOQSFwY+9B58CthE+CDG50IVQ6q9Aw4NKOKHbNQwJ6/VlBsxIuU4XWGibzze80LIM01/Jp4Q3808hTuEqcuoMSxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QMEo89L2; arc=fail smtp.client-ip=52.101.62.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxo3eX+svEO5hLfSPeKLJWoV067/l+ZPlTB0SM3O1yOesfBh60I97d3hP/QrswazF7zuxDA2QsyKzc8KllsRP+LwgoEcGOUJNV2+pJYWIG/AlcnvfWMt/cbEneIv/SAtcXNXVjxKXi8Y01qZGcL+uF7dOSRWQQ02DIhkBn1fC2K4cAIWsPufakLfz0V4ZSPd58r5mNmvjwx7YDnfAg5kIHmf9oFzIqUxbN/uX/bvDc0Y/mlLDQOB6Gf2e1gBNPSgSYrPkd9rCgocLp6DlYBlVfi1d+rZyhKpRlfOBnzf0buB1fAUGlyydAh1Q3XLj/4EhnYc3LYGQe5PdSwBIRuOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CvRxLI2G1Mhc9TmXhpgFtFA1HS58gZ9DdhEtVy/LRk=;
 b=xTSyHO8Z7kByGRjswfAb4GJTC/tXGy7huG/L5pmExyrlk6bOjJk7x/KK6GPqIcpbI2Shyj4p5tEOcfqKPO3qTNmsyHjEnv7+E4QCA4vLNtw4uzYI/RHmxUlxTjjJ+mYHmK5lUrIcBRePeor2QYxVz1YzBOjtx5HxKR68E+cso8HKgnN9PUacCfKsJtBqLvG1jkgFQ+Vp3hPPOjLpZucuEUQr5NJVHAOoZBi7hbaIVV0jC4BA5kB2mR3hBh9hqIUx/3XzJakeXC/zFvOuoQwT6jLN9Q6VmjYxegyr1/YVAVi3FsGzTbZ0ez3j5kptelhB7nS90ufvtUq+lq/AEfiQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CvRxLI2G1Mhc9TmXhpgFtFA1HS58gZ9DdhEtVy/LRk=;
 b=QMEo89L2aS6SEjZbw1KS08m0WB7gRGpYZ/oeAbtLl0UoYm75pbz0ZQ0dT+LtBSlPoOz5g8FaFkmqNTTq1qSYg1+SkY4labf6zGEdDLUnZDY5F8T+XBAeEve6gqpvU6nMqQByjvDWGjZeninsj6ltlWjApNrHBwgYhMlrfm8iZeXoEF4J9emcYI594/izWJKlopyTvYZf0Ja18MokzDnPRHjENRMBMp+Ck/di/DUXBqMxlCyR4nZH5vh3IkLk26shjVcgPGAZyhjwdtTvs8smljHOMX2LvIJOAJRCZH3pDnuDKXyF0NbIZ3s2plskzvWnokqqR089bdoq4CVbDkL0Tg==
Received: from BN9PR03CA0794.namprd03.prod.outlook.com (2603:10b6:408:13f::19)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:50:16 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::d5) by BN9PR03CA0794.outlook.office365.com
 (2603:10b6:408:13f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 06:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Fri, 24 Oct 2025 06:50:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 23 Oct
 2025 23:50:04 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 23:50:03 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 23:50:01 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 3/3] rtc: tegra: Replace deprecated SIMPLE_DEV_PM_OPS
Date: Fri, 24 Oct 2025 12:19:52 +0530
Message-ID: <20251024064952.775883-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024064952.775883-1-kkartik@nvidia.com>
References: <20251024064952.775883-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: db50a758-68e2-4a84-1d42-08de12c99685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TXRNdKoQWu9eN7zdT9bClfQ8RyDYN/i3P7bAC3BzykpEZYfz7homP7SESIxF?=
 =?us-ascii?Q?AY+JKiuZ14cFGoaZfqa4UeRW1cVDLjA1XP7lSjK1Zn/KONnGB+8RqKz3G+rh?=
 =?us-ascii?Q?vI3+364DQzk4srjgrMNbdLuim2KnrVlGMkY7o1aTFAYCxpVNcQmMhvhT/OrP?=
 =?us-ascii?Q?UbcwCFRTilipBSKXZUPtKt5HkWmwFpyLsSCSlcZPKkn7zsGmLJcCNPNWeDeT?=
 =?us-ascii?Q?Em6ttXNhDcgvFJL8FE8ePMvmG1/TiTim7X2JZphpl6dLQ+X5zVj1OwQ2KUpt?=
 =?us-ascii?Q?kVIRYFe7r/owhNMlmwYF4OWsO1zBKl7m4vA6lqhauxDNjgk4UK2nE/DmaHCT?=
 =?us-ascii?Q?AMrHzdELFg/HVcaMREOicwbu5US/dvr6jvPzmLrQ4wuxIkIY92Y/tPRGo2ra?=
 =?us-ascii?Q?zCUR5CPXgGN6cGRwwoFc7gCN9xaS6x4nOstQBkG2G+3tGiR0Fcp0f6hoZ8PN?=
 =?us-ascii?Q?NTmpDTYqHT88AdL/HhLFtR5v0IB5KkwwwgNdTbDBeiBeS6RFiHfDIhxICNBi?=
 =?us-ascii?Q?dqNUiZS79bSUndZE2DzCxCTKQ4E5VGrRCKSxh2jmh46BxpDIjhhVC8EHbkao?=
 =?us-ascii?Q?oVBGx/V76xTQkpSn4L1RtfAt3UVrpUr0UBiBzPnY8xZ+nKok0Qwl7tR1JhIE?=
 =?us-ascii?Q?T5v6ub0sTUNWpJc6jWgT4xDucFaMDbk5zYnwHxEqH00Y9w2fG6CM7lNakgjQ?=
 =?us-ascii?Q?21YoN7MaQt0AlWD0RQxz+7f8VedkK6ZrPR7gbJdjeHX10FoMAlgjUmYKXU/G?=
 =?us-ascii?Q?hH19eC0uoGDneTVH6Jcr0drBcgApqZLkjgg0dZEnm7ldycd0Hj55ARqRhqD3?=
 =?us-ascii?Q?T1OzgRcWYWMPhxy7vyYT6qN8cGUZyoALlxGFzzW30Wh+RTdgl3atUspKXwMi?=
 =?us-ascii?Q?PXkA8RB0wM7PMseStNe3Sx6cq07TX/PzGaA9JXeZGFAFDOt0WifFK1YtPiAM?=
 =?us-ascii?Q?mOQQ5Ud1PadWIg0Hz86BeTppUz7oYXMuJgoQF5XzOefMQ85NR03xDcRf0pv1?=
 =?us-ascii?Q?X0tVV5nKjaTiRNz0G+YF5Dtt9sziJ2HTE/W1HZX+eQAkMZRFtBtWOgG2sWlT?=
 =?us-ascii?Q?WhWYiIf+5e8aGfH8Mi3jATzKg4WkFC9a1yCJL/ApOkZRZu4cmVr5dtEba6mA?=
 =?us-ascii?Q?ZfHIcaxvjOKUAycDzQrMeBjJJTxN/0jZFpQRQZQ4ryntUwJXei1wW+KA323E?=
 =?us-ascii?Q?x2mpFPoHL51YWahRuXDWAwakzIcctP2uVn7CBvl+MZWK/xriIOvbIEdLuzU5?=
 =?us-ascii?Q?0WmQtRQayNDBuvv1dbt86XGNGPQ7WNlx7tq1lemwJcHiP5MgUQ0AL9ExWl/9?=
 =?us-ascii?Q?DY+7aeBd1cT0chC+sQEkwd8PkqCNLzjp31ZfzexsGHA6lq3BiDJoALBYi+o3?=
 =?us-ascii?Q?nfSFnoL+1OkvXODyMPbrfFAQXt3F/8tqx1QZp1zs+1ihX6JqA1gAl1xClAT6?=
 =?us-ascii?Q?Y4KQiZ6ZGWUhrQFYfckljeoBgthONCzgRnNFWbRdVu5CPxqXQJvULmzZ+CiN?=
 =?us-ascii?Q?epy1v9r94pbqznptBaec2ZGfV4jDztIwkrtMakfUKJ90oFGLJCn6LOdjQ8IC?=
 =?us-ascii?Q?aMRwPGj3VY3HhuPMY6w=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:50:15.4367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db50a758-68e2-4a84-1d42-08de12c99685
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780

Replace deprecated SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS macro
and use pm_sleep_ptr() to initialize pm_ops. This also allows us to drop
the checks for CONFIG_PM_SLEEP.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v4:
	* Updated commit subject.
---
 drivers/rtc/rtc-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 9e4e9c88178f..528e32b7d101 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -340,7 +340,6 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tegra_rtc_suspend(struct device *dev)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
@@ -378,9 +377,8 @@ static int tegra_rtc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
 
 static void tegra_rtc_shutdown(struct platform_device *pdev)
 {
@@ -395,7 +393,7 @@ static struct platform_driver tegra_rtc_driver = {
 		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
 		.acpi_match_table = tegra_rtc_acpi_match,
-		.pm = &tegra_rtc_pm_ops,
+		.pm = pm_sleep_ptr(&tegra_rtc_pm_ops),
 	},
 };
 module_platform_driver(tegra_rtc_driver);
-- 
2.43.0


