Return-Path: <linux-rtc+bounces-5123-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2268BFA415
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 08:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6C318C3659
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 06:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE372EDD40;
	Wed, 22 Oct 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MRkwWSep"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B3257824;
	Wed, 22 Oct 2025 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115032; cv=fail; b=PTMrt8+3AC2kpXLnUY6rAOUGE6GXkcpZtCGJvFfMpHJJ3m1+jC0YHMN7uoCOyRaD8O6DiZfIPhFoKJsOnZGBKrkMMwQ1Atyh/+MHfvfC3OyS4kRBbJjHhPDe9vC4ntW7J16y4+TDyxAzQPg8EhBblvnXRrJRb0tWdwTQehPMgRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115032; c=relaxed/simple;
	bh=FczpzmUd0yO5bKtF33zUeTYhigLbqI6GED0fMadx+4g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T4/7xum1gtPpUVy0b79fJBxFQdqxCCA8iygwCNHNTq/Iy66/1Ykt+Lj2NnLIaKNn++eharj85sxKh7M1arKDv2dFI8W1rXl7PwR5zKdJgMijmvbuc8oVYCmujlZ0IoR3EAvax+ZhwpCySt9P1cOtsliAt1hQs/bF1HpdOd4DIok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MRkwWSep; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiE9Jor9OJKawhK+HKujs6xgeYXVnpq7ZIvhC4ujQVle9emrjuYdvf/NEacRvLMfhL2OmlZ69Jb5IuYCi8lRPvGy6DjOojiUodZeN9eaVDtuw71TaBLoSDqMLYIF8ILEe1oehlxIi0iVLHRcErc8tl/IvCjEhxqsE4H9XWnoYbuVS6skkCthTYCBAFnpzOH1ZugTGXQds7skOP16XDtecfAqGONo5s5uxBXevsGs1iqKeRxm0CFL3IDnPKERxe8j/CMRtMRaJJ59jeo6hdQ4joZy0gz1aXz1Q2bEr/UwH9HjVbSBuy/EsTsNyq4GVqEheWPSgQruZ6SmjF338XgXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl4Yx2g5vDW6Irb2FFACdUVpcxXKpUJfZdgQt5mK1iA=;
 b=BpWwFbRKbBlN+2dWqStyilPWoVLhBMkiGWh5oJnFnBOP9sFleL413RmABu8WWnEv44xp/hisH94oTcBIHc/3KISUn1DGuSrPmT6Ud8wRjjqo3sb95Gv0cLpfPj2iKrw4b1exAqNouMiT7Pjn1Y2laxTyk8o2Sa/VkXcsDsVpPunGJxGVhtkuckJjigrj/njfnVA97NH//es/orW2JOD/AUcZW5o1H4r94vQvZWbFU5vwtArHjl9iraV7TnYSxCDzhQN0sazncgFGOhJhNRHz6QLWmEaP2YhwBgbmsBd2qP2z64fi9gUnw+00KwLyyqxtvRiseNQ8u4xCwM1F2gaZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl4Yx2g5vDW6Irb2FFACdUVpcxXKpUJfZdgQt5mK1iA=;
 b=MRkwWSepGRABwfK+VGFOLWGaD2GVot9dCHqhpVp1bi1rENcTYlvj03pgJjIUG2gEh4HUwiUsR/S8fkuFlvlXp6a6ELHujjeGbp3ghjH7bQIPdouxziRVEi/qNRj7bmkTUyu2H2B3oec5RRJslEsE3hQKjk5GWgpnUkoVqDR4jpLsLjSyXjdVRafQHKnro4fEtScGGyEmqqj6X3GKhd20Zql7t2WeiZOwxHKhsBkyhgy3Te8UhcacFmINGfP8jPkVLOeTMCnicvov1EO19NMK4Q0r+FltUHDQQ7MApKPXC8KFA8d9tNVLHOhaG4pVHDPouMSmVbRtjIWgQQdnsCNQ7w==
Received: from CH2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:610:20::25)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Wed, 22 Oct
 2025 06:37:04 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::ce) by CH2PR07CA0012.outlook.office365.com
 (2603:10b6:610:20::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Wed,
 22 Oct 2025 06:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 06:37:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 21 Oct
 2025 23:36:50 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Oct
 2025 23:36:49 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 23:36:47 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2] rtc: tegra: Add ACPI support
Date: Wed, 22 Oct 2025 12:06:45 +0530
Message-ID: <20251022063645.765599-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 418b8ac4-81c1-4d85-ee58-08de113569c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Prauc2gh6UPR516+GjEjR534KgtndqYJ2ZCQWx4rzvEkIl3pGwlcQLJ/5hEw?=
 =?us-ascii?Q?jPcLtWbjkmr2rHhGR2IkFkqfMMdzNMOHLtdB8IFdoqzHaIKfhgFJvfNCwRhQ?=
 =?us-ascii?Q?RngFFMhV5Lt8k+RA2fNihx0gsWTDJOGx9i0OaU0HxuMGw74IjEW1+w55ScZv?=
 =?us-ascii?Q?ioaKHcQ3moAsxZI296qG4i7kdkeAeZDpQ5o/Wdq3QiVeW+wj2bXuJOIYhB3K?=
 =?us-ascii?Q?hyUQiidI5jkVFZHjBLRaz9uBHzt2Yh1R9PybwABCj+ncDWFTutGRvy5IJvIK?=
 =?us-ascii?Q?CeuAzIXYAin8zLIr3wOocV9vLeyqNXQ3SPbO4xap6JnA+a8Pd3bmAOQwYSXW?=
 =?us-ascii?Q?/HsrE1bZtTJjWkppE0lFNsIe3b+KEhs6u90uFCGOt9JXNDosS+Z6/gYltvlw?=
 =?us-ascii?Q?6ee4oXJzjYrcs8WyN7lNKtL/Vw0zwVrylmgGBFQdLtuf/qP9gHly8Wgcjzgr?=
 =?us-ascii?Q?shLxKvYpqaLaSlfrlQVn5YGx6zTCnyOHMtKk9i+46CxgqjiHq5ENTnJ6pn5l?=
 =?us-ascii?Q?du0yGAUGN6kwtyTer2fU0vOdn53PLWZqJzfCof2KoSYiUuUTnrdMY+nM6DxO?=
 =?us-ascii?Q?RfZOxtH/fkcL9Rk+BhBwxrlfTzo00ymmaUzFFEcMSa9uDbq1d1QsoxWl/yoN?=
 =?us-ascii?Q?wwkXAR/xivoqNtWIaQ5O6A6vM6uBEamwcMWyqOhv7L2Xh0yL0bjaKzPnDhgL?=
 =?us-ascii?Q?K4yW+Jzb+AYn+fOO7UEzJhXiwDjy4nX0o1FngkvmqkjVK2b67Y7ADCkYZkUN?=
 =?us-ascii?Q?XXR/GsOrqef9fW52MSu7sbr74Qj5r0byP0QeQSZiB7AIBCtsbdFRvxZHv1Mp?=
 =?us-ascii?Q?hGrByNyWAJ70tZ6enMNCuKeyynCJ2lH0e3XubUL2HMyzN7mFkDqs2VK25XK4?=
 =?us-ascii?Q?17Z19c4+8oahS0+eaQry2GbAohuhsNxwF/ZIsY8y4+00eoqJ8ehBpZPYLVHW?=
 =?us-ascii?Q?Ii0BVyUj8BhJhvMviIwYrhiWN+1n8nYhUIoM4EGmNiTg0mNXI/V1Pn2DAJTn?=
 =?us-ascii?Q?pC3NLkPomec8PzUkP4+mjvJtL9BBFXPOKZX4XIajChEBIG1LYtobmxBR8E67?=
 =?us-ascii?Q?yGN7cjxQ9r/m9eO2Gt7sSZ0QTtDxFqx8Apn6EryEAsLtCzQY+Of3MLFD73wJ?=
 =?us-ascii?Q?Lz/gskROCt98hF/fUoYI5O0EUaqPe/0NGV/PPe+g7YgZxGYLujmzyG1J/bib?=
 =?us-ascii?Q?3VsWZCnbJHVr46TWKEVCLYgow02cQ8aNt/JP1kfsPzIAchcgwLAkufTzxMpa?=
 =?us-ascii?Q?kOUa2G+lrGz8Z/SuqrIIDZ9BPBi++esBg1ias5Htaz7k4qJlVLUyC8e1SkaC?=
 =?us-ascii?Q?pVqBPeffegdWDlyVz/CZNBPpAeRisakQ2YPg447YOsGoKAp1g/7AfZVSrHr4?=
 =?us-ascii?Q?3CyJIiZNtZP1SZJtyzbLqjrlUcSgufJNNqjM2eSGvNOFdJO6fowDDiiWqEM1?=
 =?us-ascii?Q?g6EF/wqpfOOsdzpvuc98ok/HpHNP5KRaRqkngWZOfxKKuLKU38OD61QZjDsQ?=
 =?us-ascii?Q?2IRbviY2T0Z6WHmcCuCeHG3NSW6FHsHJQgCZvC+u0qfp+J2F2chu2HEcnmFS?=
 =?us-ascii?Q?riYZbisffhMWqAnj6n0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:37:03.7302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418b8ac4-81c1-4d85-ee58-08de113569c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335

Add ACPI support for Tegra RTC, which is available on Tegra241 and
Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
The RTC clock is configured by UEFI before the kernel boots.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Dropped "linux/acpi.h" from includes.
	* Dropped redundant ', 0' part from tegra_rtc_acpi_match.
	* Replaced "is_of_node(dev_fwnode(&pdev->dev))" with
	  "dev_of_node(&pdev->dev)" to check device of node.
	* Dropped redundant of_node checks before accessing clock
	  related APIs.
---
 drivers/rtc/rtc-tegra.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 46788db89953..a34f0c80fc37 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -274,6 +274,12 @@ static const struct of_device_id tegra_rtc_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
 
+static const struct acpi_device_id tegra_rtc_acpi_match[] = {
+	{ "NVDA0280" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tegra_rtc_acpi_match);
+
 static int tegra_rtc_probe(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info;
@@ -300,9 +306,11 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	info->rtc->ops = &tegra_rtc_ops;
 	info->rtc->range_max = U32_MAX;
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(info->clk))
-		return PTR_ERR(info->clk);
+	if (dev_of_node(&pdev->dev)) {
+		info->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(info->clk))
+			return PTR_ERR(info->clk);
+	}
 
 	ret = clk_prepare_enable(info->clk);
 	if (ret < 0)
@@ -404,6 +412,7 @@ static struct platform_driver tegra_rtc_driver = {
 	.driver = {
 		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
+		.acpi_match_table = tegra_rtc_acpi_match,
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-- 
2.43.0


