Return-Path: <linux-rtc+bounces-5130-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B750FC00400
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 11:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33CB84F9835
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D703081D7;
	Thu, 23 Oct 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KfAb73h0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013057.outbound.protection.outlook.com [40.107.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAA2307496;
	Thu, 23 Oct 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211868; cv=fail; b=S/4aAbpYKeL+e7c9os7Lkx+bOdJIk6Cahd9CijIejT7v85LCfU7oQRFQSs1X4QTdZVez4A0yKA8CSbGauj4Gnxy0vXTvMdcTjF46Mt3Y+zaLKcNElE/DKVwms+fNbnJ0PKqSTSAwleirbPAa/5EKp1nRMy4BW5UWOwSkOmmxg2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211868; c=relaxed/simple;
	bh=pETw1iwuynI2K/n4udsH/Bc7OYtLcU0R+PbPywezRak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jfMf1L6U/HGyhUNYM3coFYmwC6+y0PCxTLjXb78IsEI474vDShUHCnXB5DL/TYvGG3k7QLZYnmN7RuwXtMm6OPRTMP8lDG303EW6mAcK6PQX09GBzxPuIDaXymfevjxpINR/ptFo1marlRJUGpjr9xOXJwb/7GyOIp869sLiL2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KfAb73h0; arc=fail smtp.client-ip=40.107.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGjdymfXmOeIwtW4uJQhidCNxoiQnZdbM2sF+4R9WsKVzGqkUSFdpawWDLtT4ECraEXONBv7mOg66XlkCP/4yoRDmN91oW7v1FXIkOPJb/Sk5ljiHzf3xQh61F34j0YgevK6nrpEBGFvmqdHoGw1boTn8+ojlJ6b+sn+SZn6M2g2Ee90mXjmOBC6jmXv6eZSaN2BJi0VQBG+qKQeFxKpGXhzkmavfgsgZ7w1m0AbduYQ7Eb34c54nKBvBo+dKSlBJ90jWTX5rLu32234yCH8cleKlewDDHm+AF1AagjLmdY+dodtZ/8i2NK0BZU11+W9AIUMpORIiows70tfi2OH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLWm8gKyvR+6U5N5DtT9LpSaEhiNybCKvDAfXkUCicE=;
 b=NQGWP9I+lrTwe3jJsfs1E/bww6lX55mnM9TN6sAQqaLZPBemTMPqm8jZKsjG4q7lTEm+qg0MyFtuwOuL+J6/2VbZvqY+U/mw41+t9EnFpUZv6ZqaqswlQRkOXAmQ+IxwdNxVh1NdfO1TxA+ay0vGklXp11QzlHjF1ozpCz77lUvXPO3RIytojqSIkVbzma3HluXLL3yfW7mFXdzYrtiyz4auvZSyiba4B5jDHmN7UzjCI31gWm4FO+dFVUNFdmOtpV5/LS85cNl0av7CZILMvL0169gQXQyZ9vvvlMJu/pw4XVkcsZlDcKj6oyTPAt5v8AUwO6TPbkQBb7ol326bTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLWm8gKyvR+6U5N5DtT9LpSaEhiNybCKvDAfXkUCicE=;
 b=KfAb73h0ftpsVmP3BNLdl2dN8hjJ9eci1VfUPbx7fl3Mcq9ESkLIdg545OcuhGBGT4oaoyPYDg+VSm/y1p/Fkx9e1u82qiJjXQDPqyZtoww/eG178gdKO+pqy+30/twJIMcpBA+yxc8WMUbfKu7b04D3EksAwcXO5LnbRo6nuU3iiwAZcN9Bj5BWnMUGBlj1NLvm5u/veJAzTlU62YEn8poSkZ31zjfmw+0etv3dh4L3k7BoFzWalxRY8O5gCk54C/VOC3d0g4BMhX5yMRhxZE1hU8RiKJprtNnWdOtUohAsLgqYewBLAtDrW6X0NpCfoe9z7q8PBSfNR8xN5I1eYA==
Received: from DM6PR03CA0002.namprd03.prod.outlook.com (2603:10b6:5:40::15) by
 MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:31:02 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::4f) by DM6PR03CA0002.outlook.office365.com
 (2603:10b6:5:40::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 09:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:31:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 23 Oct
 2025 02:30:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 23 Oct 2025 02:30:53 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 02:30:51 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 3/3] rtc: tegra: Drop deprecated SIMPLE_DEV_PM_OPS
Date: Thu, 23 Oct 2025 15:00:42 +0530
Message-ID: <20251023093042.770798-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023093042.770798-1-kkartik@nvidia.com>
References: <20251023093042.770798-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 61eb0eed-38e7-4398-a43e-08de1216e1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EmbqnsuM6MMJ6bu/sFDIn0Aw0KV80eylLFqE+e3WQ72OenSsdDX3KhTXDMSe?=
 =?us-ascii?Q?gmLpz0vLYVAmGMg78jT26Cerv9sk69SXIFt8+R7mBDIE+gC/aXApcRTa314y?=
 =?us-ascii?Q?IEpZmrDa8A/qKzy297L6jAgdwHMpJ69yx/nUHJJoR6sAdHbzFE3yEFyuxCr7?=
 =?us-ascii?Q?YCwY+QIF6KOj5jdxR+80a7QSgcAMp+hDcAO9XmV54eB/+BV6kNbaHSMCDeHT?=
 =?us-ascii?Q?oA4fN5mw4jSFi8lXMhGttKMIq+ZfyB14eCjL+YULA2YhWBu8subQKkPFAzip?=
 =?us-ascii?Q?RwMBI6fdzZ5rWy6EnSIdZJXTGttTZQh7VGga8e3wjEErb7LeBJc0lOBk+AWf?=
 =?us-ascii?Q?StCLRFnubBL23wvrTbc5o6OulyXZ6dpA/Y+Mg0UcWNIOjNTAeC1ncZxg9vmN?=
 =?us-ascii?Q?y6HZpMWMsAKoBuXgQ1eAVPVQL7FQpr8x5H8++hA51avLBbnn5jrUZH2cM+5C?=
 =?us-ascii?Q?Nj1vygOC6h3CtgVezZqHpRUVKfUHU5TsTWet+QXwRGA/lRRLCEPiaJ3gCZDa?=
 =?us-ascii?Q?6WrbVqXq0hNx8uXor1AI+6kuY5h1foo1kAwaxUcL6akcWfm7Mho+Jfkrnvky?=
 =?us-ascii?Q?IEp72OA9zFO0KeB2Q75kjH2eIBiW0J051VVqlaTp0EUrgMtPz6qublazM10g?=
 =?us-ascii?Q?cens+ZZVwQ4WfYUYU188FPVbveC1pssdmjD5fkMbvXtQyEY5RFOphnVeXJYA?=
 =?us-ascii?Q?n3EoKKhTbCaWgMCHbCEyzrlnMG/uNsAwqkSXLWLAZnh7YFyi6FknZdQzSpel?=
 =?us-ascii?Q?pUnr1MKfVcz3yKTcZf0gYxpUnxOYkPmhs0L7jIZsvNUdMmiIfwkhsFPh0Qec?=
 =?us-ascii?Q?kyA3UIPSuGE8ymxJXjlA1cm4qJ2EMO+r8b7h6H24cNPxO+DTx8APEqWGyGV9?=
 =?us-ascii?Q?Gn8oeZF04qIWA/rzKSeQdE0Ij234xkkevjosuWN0kQPHaDyZehmDn01TWbej?=
 =?us-ascii?Q?DRkQ9f7wJNBue7OCFLdowYT/NHimXKJ55PC8whlY5Kmsdt9hg5YaOu+D/YeW?=
 =?us-ascii?Q?bcRJXKq03SRpFkLSgq8mbYdBbuFlygl/ig4VrryA0Xgyd1Rba5vePE2dojIH?=
 =?us-ascii?Q?CClwQVQSP7rAmeu6IRCxyNFdW73B0h9pGmvE66h0VVbglbeRmsbVsrk0tK9u?=
 =?us-ascii?Q?7okJUkTgx+YsxxRuuqwaZu9rLco7iy+kkXAMVgyXy2KxqofBoOQL/I5pCHAD?=
 =?us-ascii?Q?gHipEQiwa4y1hVIXN6BUbwjIJwDlR7xGao/ajvA6V8ODWLRPG4nX8Js+B07a?=
 =?us-ascii?Q?yiw60etHEvhLly27+72hd5ZZ66O1BTJMh5jYeti2rydfNkYQvyyOq62YFG+q?=
 =?us-ascii?Q?N6vilRTJsd1aKTbomkiIITV/8M5PimlIqaBiZ7IdjCceN+E8W94xg6jiPCYi?=
 =?us-ascii?Q?kjlJpU/dyX3/FGSvxcHvAS6feH5NQT7GqNvbArZmFvYgxuUiRYcygEizoFOi?=
 =?us-ascii?Q?3E+uChn8TAM+uXuCbyLfLP5zcmDk9qAQttATw0Td5Ba2Ayxh9RNBV1aU25qG?=
 =?us-ascii?Q?hcWWPS/6hXucnAhCHRoUv8ju0GvjrDJpYg3Iz6rLhxbNbKzkrdK9+aSZAHFf?=
 =?us-ascii?Q?YhtF1kZmqMCdktFwf64=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:31:02.0480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61eb0eed-38e7-4398-a43e-08de1216e1e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207

Replace deprecated SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS macro
and use pm_sleep_ptr() to initialize pm_ops. This also allows us to drop
the checks for CONFIG_PM_SLEEP.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/rtc/rtc-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index ad0c57ce87df..3ee8e1c97a5a 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -347,7 +347,6 @@ static void tegra_rtc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(info->clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tegra_rtc_suspend(struct device *dev)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
@@ -385,9 +384,8 @@ static int tegra_rtc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_rtc_pm_ops, tegra_rtc_suspend, tegra_rtc_resume);
 
 static void tegra_rtc_shutdown(struct platform_device *pdev)
 {
@@ -403,7 +401,7 @@ static struct platform_driver tegra_rtc_driver = {
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


