Return-Path: <linux-rtc+bounces-5139-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD1C048EB
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 473194E52BC
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 06:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA42737EB;
	Fri, 24 Oct 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ty84ZYap"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276226A1C4;
	Fri, 24 Oct 2025 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288620; cv=fail; b=TTQ+WFLROWYHgYlVmrZECIL8FfV4IHHgID9HOJNxLC+f48MiOn80wPs2kPI/6bHJ5GSzHbwKnBfIzOuRyQRMJtqSHzG/6TGdVMq2JfB6rAo2i+ZT1QYxAFRDawnC79WpPreUFpzJABsynbvjNDloQ9V60jDioYqsXitM1iFJrKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288620; c=relaxed/simple;
	bh=cmjmHdhmNQOLg1Oa29JQghfQIHDFsV7+g5k2N0Bl0yM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8PID+Uu1ixOdg51phoIaeed5ocr9Hu0JV7OUPlDFU7TSKzJy+ozpTpQgbDX5+59E10aDR/XVM97T+1QyZDoGC6OkJAgiqu2JzR+PhTZ+QXOagwBbaaROjz95esyk1d6kGpAez9ExQVTlPiLF/UYSdmyJPTcfDA7PkZy4fm9Qq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ty84ZYap; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6e4nb2vqzI6IztBZis79HcoxoYXL35QGHIUqzjcGse4uQewFpyqkwcnj8LuKziGPJ5M96xUyMyxr/4pdtZa32BqOkK5MbysrLdaWJsVCdLor31Crg8jC/6QNA60PYXHXkVaBgoj3Or9H/1kLPGi4PavEGqxPbUOPff3wODI+HVRUlQanNkK8BvTBhvIVMrk5k117kIkaRF/FDIPP+Z0T1OEWOj9cX8K9Eknf9e3sqPRxFb0FzyyAHeYmATrTIsAJVhkxXSANdz28RqAjYWEyb5LUV8VF6jIAl4EYkDP4nSck4IFbtp3qyH/jE04ErQ0IvTu6GOnnoyo5/f9aeppCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvkvIVm2fm8BpgXaLJxTPPTVxuK+8BapHyVkXezxInc=;
 b=NP4aE6Ml56ivFC/qLlUZfxTs5XBf1MHa8YqCHROfUPw8e3xvoQudm8Qt0CbfR/xDJNM2qhJziny/uNyC+Q8FH2wgeetZ3wgOz+QsBaZRgfISex4noXUbdlQ21IrGmgRsTzgtW5nS2Tu9AYzDUpOhVf5ka2OSSF2PRfb6zAn6FO/RWbQ49I/IMkWa1+WCvhTguS/6WC1zMQrvabYkT7Kizl1ZEmSJADtP7VSWXhbHDcvAZLe1vqGncBsl20KM8muKyvVRBqceT039ZUrOaVfPTzCzmI461EK9et7NJndLpAxGw+nzqqSbjxFZ20opSUopJrxSpCWqB+T9NIG7Bs/EAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvkvIVm2fm8BpgXaLJxTPPTVxuK+8BapHyVkXezxInc=;
 b=ty84ZYapnBAbZdzH4iLwkukRtUctwfZLcSnvMuOx+fMClqQOVslR8kR3z/CBRDz0XrRPPR0/qz+HQnjdcITQ6RT/KJ9k1YLl2tW4+KFsEHRfwIS4HXW8auwXqSAwj56f1CaKXV123F9WJqarnAnhhbZqPU4TPISjT/WAs9Jh071yHujFySQiJh0s8t41mriy7tx7ycGs0qj95eoQPwe7dYzlIlzXoA14gzmTzgJoyGCpG0PSdBoAecMRSN6NS1H+pCZgG1Owj6oyknaHzQfphxng0SfQ8XVVqVlSVy+ouFD+HCcx+3j5cxUtopuzcGg1wGo+j0DGvvKvG324C/njvg==
Received: from BL1PR13CA0101.namprd13.prod.outlook.com (2603:10b6:208:2b9::16)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:50:12 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::7a) by BL1PR13CA0101.outlook.office365.com
 (2603:10b6:208:2b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Fri,
 24 Oct 2025 06:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Fri, 24 Oct 2025 06:50:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 23 Oct
 2025 23:50:01 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 23:50:00 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 23:49:58 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 2/3] rtc: tegra: Add ACPI support
Date: Fri, 24 Oct 2025 12:19:51 +0530
Message-ID: <20251024064952.775883-2-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 263a2a70-31c5-4181-2335-08de12c9941b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KsQGjknN9+rOpDD6W5fYR105iT6n2NKum5lqY8oAMu3sdSxR2r37owrHFn0G?=
 =?us-ascii?Q?KEVLoOoJdnQ/N2aTtUo6LdG5KgdChkd1qfhJwIBNjFH1dcryllBLEfTyZlWc?=
 =?us-ascii?Q?nugmGD7W06kBARP2B3WJYpllx3COSvV1Y91pQPjRGsEtszgMCugbG4yzruFp?=
 =?us-ascii?Q?BOWesdH5/fZBJssDQ49OHy86JrYvJdf+UTb9qKttZmKHx4XNo79rxlzPaWgs?=
 =?us-ascii?Q?G/GUQow1J2wmH/FwcJPuIXrR8rekUiEw1pgae8MN7WfCEk8F1njFLEeDqkzp?=
 =?us-ascii?Q?Xb8i49ncFHAn/S0KLBaa7Mdpr9MBoVghq/b/Dy8NUAldGts6o7wW+IXNQryW?=
 =?us-ascii?Q?IxZIQegvj3DPrTivvpRi5WxwnKdCQ+rYoGkrvzOkxTgh9UfiqM6/zlNpf/UW?=
 =?us-ascii?Q?amT9T+Ps1D9W0lTdN+d+4bS3zp9t0YM11YGrd5kG203h+tOUOCqDr+ex2cOH?=
 =?us-ascii?Q?6G7DVWAqWNDLdIaBUfDkZoDOHnjXcjJq7odDstEhSk8a/ui0CCuPmJmcjXVc?=
 =?us-ascii?Q?mkkQ7+RknLCOjrdDQIJs99h2yQdLyVxXM872mRNNVxgHK7X6c99XBTOvhoe8?=
 =?us-ascii?Q?aVtdkWmbP6ude0OgsQgOqmJE1QnB3W5Trto227tMCUDNId1ngJuKpMpCqN5g?=
 =?us-ascii?Q?26F1yDsUBng7wrYmM3p2Kh9Y7LzIHflCZur5sPom0rqCi2yGcexKJdfiwaIr?=
 =?us-ascii?Q?ML4s+5XQ1HhyhtWV4cFuh3hyMUeDn93uj+P+aC8VgIp3iajiE+NZmk2XW+B1?=
 =?us-ascii?Q?WbXpCzJHUCNPS2WBRheKpaINU3VS1wktVsXo+69WSOvdKZPmwg4rdWfes73U?=
 =?us-ascii?Q?q6VMOsuIzH9DhK9f40e8vsIETOu7t363hCtXVlWgVvaiyYTUpDIjlK+3cMSN?=
 =?us-ascii?Q?oAU7yVnC2V5wMRvHpD0tHKa+JKiNkPawFYtWiP9GrxOGSNdTVLrBkxsDrBuZ?=
 =?us-ascii?Q?IXA3tcHblzD5wGW1648ccE6eNE1hToWtaWc3KfGMO6RG0h37aMHqoVsRRSXv?=
 =?us-ascii?Q?sihPGxN1n1gVKb1yWnWUcF+ZKjyO2IoCvNOO1ODiEIUF7nZbUd84uWzUbRSR?=
 =?us-ascii?Q?aFJFpTowxInxtZxufijdaZILQyIy7R9u5U/JSTWOWoF8lajtZV4J0hVjM1IX?=
 =?us-ascii?Q?X9cQvsEa9KFQaIHI87DhNXT6FRQKxSl6suGoK6eidi5EPf7mQK73UwFTcGJy?=
 =?us-ascii?Q?HkDdWKCfRVmvAPb79oOxM+vpI7uNxjeRHobIpCn6H+aG0PJN5oiGXN5nCyh2?=
 =?us-ascii?Q?rG81cDrhv6Oa3LzmLb3sQVfAnYXXr6PfJCAf+5hSiibBb0G6nT3Vo1VxsYQJ?=
 =?us-ascii?Q?Ic+lVq2g3qmDwP/3MQSZI43BtuTJua1uBzO0ntrHkCYdPaigVrlGwzQ5jgkt?=
 =?us-ascii?Q?LpOQe5I3/XbiXh/EwKweAV05AdRfpPEDyDqSTkGi9djassR4qj+yH5jpSkH2?=
 =?us-ascii?Q?X/NWfpsynva8GPEJf0n6K4zrV2SXFJ/I16gQBboZvwx8uCwGrSFNy+6llhWY?=
 =?us-ascii?Q?sp+f4m309JkC30nN9UxcJq0de/6bpm0Ck8GxMQk43i0LLLhgsLFW84dmk5xJ?=
 =?us-ascii?Q?EjxWj7/wG4w89j9GQho=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:50:11.3836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 263a2a70-31c5-4181-2335-08de12c9941b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671

Add ACPI support for Tegra RTC, which is available on Tegra241 and
Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
When ACPI boot is used, the RTC clock is configured by UEFI before
the kernel boots. On device-tree boot, the probe must fail if clocks are
not provided in the device-tree.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v3:
	* Add patch to use devm_clk_get_enabled().
	* Add patch to use pm_sleep_ptr().
	* Update commit message to specify clocks are requried for
	  device-tree boot.
Changes in v2:
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
index e8c83a6a96b3..9e4e9c88178f 100644
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
 
-	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(info->clk))
-		return PTR_ERR(info->clk);
+	if (dev_of_node(&pdev->dev)) {
+		info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+		if (IS_ERR(info->clk))
+			return PTR_ERR(info->clk);
+	}
 
 	/* set context info */
 	info->pdev = pdev;
@@ -386,6 +394,7 @@ static struct platform_driver tegra_rtc_driver = {
 	.driver = {
 		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
+		.acpi_match_table = tegra_rtc_acpi_match,
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-- 
2.43.0


