Return-Path: <linux-rtc+bounces-4983-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E2B89357
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 13:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58F9B3BB528
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 11:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA30730C100;
	Fri, 19 Sep 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rwaX9zyf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076211B87C0;
	Fri, 19 Sep 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758280371; cv=fail; b=gjF2cOc16q1qyfeVF7o/oIvhvva6qYzUzTfNpSZKryTdSluX8B7PnHIfGRN/v0QkVRPcT1+hiXKQkWowOoFDbIjBTA7/3igiGcjPrDJAbngEvhe0LpJz+QRt+O1IvRuH7NVv2L3OCVvcC/bJa076q1RZsVU0Sm/W68Gofb+zK14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758280371; c=relaxed/simple;
	bh=QAllc6ht8Fp7jx/tsout+nS1c7iri6AuCFy6zJBJqrM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L1GmvkB0aGAJmfesnAzi0wXt6xrgCZF6dipKDh+UykI39t0VExYahRA0pdR8vC+CAR+oWdFLkUYeNM2B+jdZruIt3PqIUw+v+zVmP7VwMOMSIJQzZN7Lrd5zO/YByeirxyKhNpI1JXhFWXP7CPICByEd+JJEJmOxsUqzK1Er7C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rwaX9zyf; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8JRNEHuNPkJvD2JCf8AijTS725YWYyaVOnsOU5dJ4Jl0S5SUyUyL24MjAuffn+WYKUM4UxpwiBw/oz/Q0yox1fHOfryqNizEpRi8JBrpaKLLecpRt3BJtd7eKHoIaxhrH6DpJevMr+u5YaJ7FdIk1hdiV0zLgRrmso13OFOeVkEwWYJUCe9lzQ6b2RC55oIu9UsiJj9Hc575xXyjHk3Ay0G7hLm4UFEhaQ5CnWXYvi25wJM43mGk1KBvNBLYhN0cHqOQvkjVjzvqGanQE4K6okZzMRjt6B5UU7jTtpaZGtvi5USLjK0BDhNxNht5mMauE6ZPIylEoAgz4YflJ8k+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ddvenm3cdx2CVKu6wh0C6phlI0If+Ii112F2y8g6Ok=;
 b=WDWLxFB+rztclugGzIiawpONJd+jhmUbaVoiovbFy+D8e6ML/Ucnm1NFCn3Uo30GRYqjrTSmzRwYaKKLdX5AeWeZy6Ga/JF0ofVAeITbojHojOAE5UNt17tsUbO5rTqsTAZ2E0Ej77IKy1ASmEt3igVV5nlLVovsG9KBR+0tPjq9SQjiXodDDLztDmfySR5Qv1sFXTVJPwA879JatQ40ONC0I0y60fqsiQLf4zI7WpO9R1t8ut8YfS5Rn0+tEftCRLigTnf7GB7vEXZ0TIY/tqYAWTkK3v0avpCMgagyEWtD5H8oLZK4JoKsI4Pn0pqZ7FuHfDsTy/XOFiSS4aQ5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ddvenm3cdx2CVKu6wh0C6phlI0If+Ii112F2y8g6Ok=;
 b=rwaX9zyfpeCcccpmPs5s2kpQ/WzNYtdGBIYo57TsaIrTJvzlCTuixjomarLjwSGEe/nG9ASk8e0/azwghewDwK1QElim44J1GIA2myUz0bo1fpga9EABSP1epwjJU78tBQGWDAND0M5MsTwao89d+dDJpoFP78cX4r4rZDG4NxDRkwHeZu56IixC47tuCy6ay6h398fRkvhFiFk2QsbHV+czwRVklgJV9UJZKGy+rzY51vsMxAOwLaWvYhE6qvpH26mVIGMcv/GKbSEt2J6gHjv1G2FoAHD80WYyoQfTMxFIUxwKldhZ7OCTXXQ65bBBZ8l/0GFeOEFErLol/xTsWg==
Received: from DS7PR03CA0064.namprd03.prod.outlook.com (2603:10b6:5:3bb::9) by
 CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Fri, 19 Sep 2025 11:12:46 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::d9) by DS7PR03CA0064.outlook.office365.com
 (2603:10b6:5:3bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 11:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 11:12:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 19 Sep
 2025 04:12:36 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 04:12:36 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 19 Sep 2025 04:12:33 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH] rtc: tegra: Add ACPI support
Date: Fri, 19 Sep 2025 16:42:32 +0530
Message-ID: <20250919111232.605405-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e863fd-6018-474e-8072-08ddf76d75a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SfzHJt776P38qaUW+h78F8SIRX4NMHjNkR1mAUQbZ9ENajkZ6fuUkACGH+rE?=
 =?us-ascii?Q?qdYD1+zKwkfzZukV/4n1z/ufuKbJcIvIz54SfVKCDLpFLijd5C7X2NSwbSJ9?=
 =?us-ascii?Q?VHsul4wumtH458G+qNXCRoukUfEIqLUjEOOW7MC/rS1SaFZeNazveUyl6+S8?=
 =?us-ascii?Q?bHG26mmr+lmoZsADAJrNVhJubfDtM/kM/fXuT6m1UfAxHcLclEij20qHbJpO?=
 =?us-ascii?Q?+lV0uOyn8lhzWzgQghjZgOrEShxtyXHVSoDT6Z5Xhu+OyVMO/NZlw8DghDzT?=
 =?us-ascii?Q?ifpBi+gMUM+AigfrOAlJwXZzrhbo2plkG3cmlaxkOQFuWCBfFi3xu1P46pw2?=
 =?us-ascii?Q?le5+70iaUkRb218njd8nyNrEJgLOVgfHFudGb3h8rh5jvnraTE/InwyIvad9?=
 =?us-ascii?Q?6pVDeCe27kZE5TucIXUsWBkYdJ7vVo/twSmYKl77ilHvKGfbi00pTubFY+B/?=
 =?us-ascii?Q?fWEv2pNV7/2AijoTGoQDmgRe6S+GWE3OOD/6BqP5Ip36Tv6RmwmNUco/VWik?=
 =?us-ascii?Q?N1v+WsuIq4iDko7UJC/V0qnyudbvTCCvrZwnyR6/ok+FRrycqW98sxoXGbnc?=
 =?us-ascii?Q?mjUzyZie+CjAfeQX+wBO3HFG4RaP/i5427zKfhBZ2oFByiZ+KVRZ+jB7CbIE?=
 =?us-ascii?Q?QI7VBHUbJDBihzlaUWSXpKtJFTFS6aVMGgPgc1qR8NxknT4t+6bgNAC8oVo4?=
 =?us-ascii?Q?TB868C1lyf510fzk+0dzNpZMv1q7+4TrAqW51+rXdkejmq5FERu3xB7wlKAv?=
 =?us-ascii?Q?qpVOyGWylkc3CSIpmBnKCyU3N8L5K3bHoROJIbvDBR0E8HkKHnGVrOs1Ug53?=
 =?us-ascii?Q?CVWwYYZFRe1TEJWMNHVdciPjqasE6pzNR7/BS460zhoIa8PtuuTQpaq3epHk?=
 =?us-ascii?Q?aDSWamVGSMHmbSR70JYFgHQ+EzP+icknGH4ky9IpGTSEaTSUT0RcF413sJTy?=
 =?us-ascii?Q?tNBo3UutBK+mRJiRfRSO6rj1q4xozX25syEmlvglVMorAZdh/TI8069hrtUS?=
 =?us-ascii?Q?x059Jbo2KuHseNkkz+FhPc87PqsJQLMJEwz1R1AG/yNJv/yiBQavtX7TL0kj?=
 =?us-ascii?Q?EOuFPzaeBgSiNpzH1QeH+26+UvDCA2z0qvymQrg6gJGTDYhxvk/zWaXRCY+9?=
 =?us-ascii?Q?T4NMGna2O0+NgwzDLyOTuXQOy8y5bLsbf2XHTFC/dkgc6oWKE6jb6WJ7+EHX?=
 =?us-ascii?Q?iFjYpffPCEa6tkNmPfKoXsV9tC3CfPN0R/F1NUAbohdwpRHyOnvhVu/rdlyu?=
 =?us-ascii?Q?CmlpIDlStZT9UU/pO68FUNN15rpOivThcvluQJ5jKVBNiL0Va/wgbah6znMK?=
 =?us-ascii?Q?y8EAiJ33yFvkO4tnwf7Z4eyDH6cLt6HSsko9Ecga2UxERB5RlpIeaznOH1Fm?=
 =?us-ascii?Q?AkNgH2haEkY8GhYqQ2JPzEuV0MKHKa9WCFRoLnLuyDeTxofizjKQY1T1mdAj?=
 =?us-ascii?Q?VvXEeG0yKmE+e3tKiZjAsI40f07TjCvPOx9zy3s+sTkN3VNSEQHQIP7uJeZz?=
 =?us-ascii?Q?/cdPDcf1O0pWdsWUdcOMnY71hTkqtmgP3qpf?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 11:12:45.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e863fd-6018-474e-8072-08ddf76d75a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697

Add ACPI support for Tegra RTC, which is available on Tegra241 and
Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
The RTC clock is configured by UEFI before the kernel boots.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 46788db89953..40617c82070f 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010-2019, NVIDIA Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -274,6 +275,12 @@ static const struct of_device_id tegra_rtc_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
 
+static const struct acpi_device_id tegra_rtc_acpi_match[] = {
+	{ "NVDA0280", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tegra_rtc_acpi_match);
+
 static int tegra_rtc_probe(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info;
@@ -300,13 +307,15 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	info->rtc->ops = &tegra_rtc_ops;
 	info->rtc->range_max = U32_MAX;
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(info->clk))
-		return PTR_ERR(info->clk);
+	if (is_of_node(dev_fwnode(&pdev->dev))) {
+		info->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(info->clk))
+			return PTR_ERR(info->clk);
 
-	ret = clk_prepare_enable(info->clk);
-	if (ret < 0)
-		return ret;
+		ret = clk_prepare_enable(info->clk);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* set context info */
 	info->pdev = pdev;
@@ -338,7 +347,8 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 disable_clk:
-	clk_disable_unprepare(info->clk);
+	if (is_of_node(dev_fwnode(&pdev->dev)))
+		clk_disable_unprepare(info->clk);
 	return ret;
 }
 
@@ -346,7 +356,8 @@ static void tegra_rtc_remove(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(info->clk);
+	if (is_of_node(dev_fwnode(&pdev->dev)))
+		clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -404,6 +415,7 @@ static struct platform_driver tegra_rtc_driver = {
 	.driver = {
 		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
+		.acpi_match_table = tegra_rtc_acpi_match,
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-- 
2.43.0


