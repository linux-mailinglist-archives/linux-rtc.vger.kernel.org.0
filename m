Return-Path: <linux-rtc+bounces-5138-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C839C048E2
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366B21A62962
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 06:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838E325785D;
	Fri, 24 Oct 2025 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UxstyDjK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4221B191;
	Fri, 24 Oct 2025 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288614; cv=fail; b=ft3KZuHEtCrQYc024UjhoNv1NiYdSHfE3JBA0+fhmIdvl14k0g6PMiugoN5sORtfS4e1/ZWtv/ABqU2w4Qc3k6wlGevexC5WqXgJM43exBrOUHmTu9ujyxSUn2BmPPzGUyGl9dxaqCDATokBdDyTCTQEOfclolTyycjW7OzLB7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288614; c=relaxed/simple;
	bh=IEOIsUbYCrJXI9WE6XwwQ2/kd/lS5Z1Ho81ora5w0t8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=THPzUjAkDf3JVq2xc0xfkHS+7guBtiHVxtaiRdly1G1QqXhnGa3DnylMhCTTc0HchksaGRqOfmRHBprbDsA7UQlt1cj06BUppf/gYl++QXod9uJo6WRtfANsXH8zddzL5YuqgNJb6ENUOrM8VbF+x31ezq3PWtEae3btsfebiBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UxstyDjK; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qvs2EsuCJcVhvJUX1+7p94fym2eBUlAA1P5T4ObryCoxkydPqul6llZWCn6tc8Smvd57sOlHvg1k6eD3PC5AqxfIvqIRWSN+iFHh+0374WJGXU5ovu74sKcm4khE1/XDv6IdE/g8LNw1URFdfxlkGsTaz95Dl2ZIQb8BaD8xZy+Favxzyh9LIGQZsytlfKtmsYR4fukkY8r+Cs4O2IA/f4gLByAu9pEYD/UJ9uxoHG2qd0nL1VMlo67NZYPfz2dpiiciXnqaXROe7Q+4+lWxlKxTiunZbnuVWWnTcq2ryRWa7GshK73FNKCtFt4+ps3koJzVjmV7nYESog7BHMG0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl6qTjWyMbYzWwQSg5B0bDmpM8tDfuIhz5JIGzuKbUY=;
 b=ABdQjIQq4m3KbXXNqtK9s8V+6i8WA+kKWB4jGjP500SshFwUc8FDVHmn3BdlUXdzcB98+4b5TGr5gkOymWWbejy6zRPBf81xp5imQwkPjy/AgbqgdNP3HS0VsDoJaXUjq7TfjmHFXtEGUYHmee7w/XKNeEsYUUblj0+X4NB0ua2P71LvG30RRLe7lXaIfOHDIxne//oBmMkaD1VQZnSG8dnsXh9ZrCxumOl/wcrrGqhKCB1mFT4dgzzuYHYpIyNI4AzFt4R4FBKferbIybbAfhjSEj9qkI8j04v3PyIADlxSVrWdGLKT/fBuDBZl57O33F/qIq1Tq36hlttPiW3HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl6qTjWyMbYzWwQSg5B0bDmpM8tDfuIhz5JIGzuKbUY=;
 b=UxstyDjKOlBwy1VZylJk9FRIm8iP94QNRr6vPhrdOCAFzwNfMe2rOx3fWK6LfBuQ2+xVGBSknosAmZoctZVZATGCeOTY8stRgTYQkCI7NJEHu9WuJ41o4MvtPycYqU9U3LIBWIAqEk6lYZDjMzm+N1922o95grWKZqZ4LIP5kW0so4GI9lC+tmvQIVkmQo4m0skHODLDNY+x4YxopqELWV4AUMHjeztqexCdQLxnCrpV3GVAymbJ5sMQmrngoqLgDqYTH9HNrON1IDojDd6ZUJxYwl4N4EfyGZwF5y/+qvkzHM+4HK1PDv2Y+EWog31qGONk2Tdip+c7CrNvo+5ysA==
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:50:09 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::7f) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 06:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 06:50:07 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 23 Oct
 2025 23:49:58 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 23:49:57 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 23:49:55 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 1/3] rtc: tegra: Use devm_clk_get_enabled() in probe
Date: Fri, 24 Oct 2025 12:19:50 +0530
Message-ID: <20251024064952.775883-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3a9347-7e6e-46fe-f8f0-08de12c9920e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fXk/PjCmrP9+lv9rmszJJjvlaW3lIXF2DMxUDTDiJtXMNmS7xbiMvNSsZCEn?=
 =?us-ascii?Q?/vsGweIG/nG80xdCWP53e9MeLX2D0ybT5MORSlz2jRjmJFbHIWGoBRQDZTSC?=
 =?us-ascii?Q?Po5TzKs7mCWOPoJ69N9OekXmk/BR1O3rWZb4zWDosGtu2LOVY26DvXsxL1pE?=
 =?us-ascii?Q?LX12w+5eqavYZHzoH7szW7vgSz1fUhCMpVkhqKjvVBZKoQE/L9NfpMbFDQ8H?=
 =?us-ascii?Q?UvLJXKXB+UdvzOqE2bwfLSzf9wBwXbnW9NZ+oIuOJj84lQhRk1gpzhKHz9uq?=
 =?us-ascii?Q?5FB/UioQAIhUEAZ/uuZLA+7SDPWyPfDegAPss0INn60MZovvbMLc9gz823RP?=
 =?us-ascii?Q?Z2MMxrnskzgnkbBu1MKQ02irJ/0S7IP+oV9z/0waWUeadycQgDpiW6tTVo4v?=
 =?us-ascii?Q?ub1z8Dan5zcaDtXbFV7EBiKfkI99WgpcnhSo8vL+xDfq7gBISwLr2fnrkUeF?=
 =?us-ascii?Q?HzSToe/KXQKyh9AZTbCdvFrdYNQvgQuG1ocj8eqn9ra2QSI1XAbn5Bfyp313?=
 =?us-ascii?Q?odZzMLjj2U7DDR1zD7lA+hF9CRXao4xeOnmdBt2ad4MraTKuBfUkfaMbusBs?=
 =?us-ascii?Q?YKZ8/NX5Nwpn6co/MNXGMil2h/OXDO/hojr+t6lda5otm9/yeEicer+g8bXL?=
 =?us-ascii?Q?sXa2gCx6LTQ29hoyfVSKP0KT3V85TACBwnYeolF9KcC5oMKbJ6pZ6J8YYkgg?=
 =?us-ascii?Q?uIwIuNHCom3UCNYMXhlBfxV8GDC0uodiSXT5a+9i52oSd9Khg0nnaePjRv/1?=
 =?us-ascii?Q?N8LdJV+PDZtdYRbfDP3ngXEKGYe6ukrvSF/DTeTW0uH1Xrb86f9EZOzsxDrV?=
 =?us-ascii?Q?ps8Rrh1JQwevxXRffv2E9gmpT4WN6kxENypRI4XJxw7CDV5kY9g5VMqKIV18?=
 =?us-ascii?Q?HJqlYez2bpIyKSCD04BEEqeIifg9WD3+UFxMhXHeX4SZM2vLPeQ82tpLm8oK?=
 =?us-ascii?Q?pVKTjD0B9mNmwKepDgt4IBW7EazCHw9Hwo7pFSMZge3+VXGTuWnd6m31qlLW?=
 =?us-ascii?Q?MhqXJPV+oqkCYoEBN9tmQvgK+PCE/PsoaK9kYDsPmff5MIUza3AUm9BSDUUQ?=
 =?us-ascii?Q?nXxvpIsQ5HFwm5gerk+cO6e5RlV5wE1uHWu9aCtvvdnhXoDrlJ48iPLMHcq2?=
 =?us-ascii?Q?SajT2YsFQ3QaqzItLTKugtRMVNObW+Hj2IL6EeYqv5nUCEXQhISRAn8Pq+dP?=
 =?us-ascii?Q?KGNVLXV7iyMovEx/0S5q+JLg9RoheEZHbgFx0cXMbxWjA8C2zU+LWwAH/D26?=
 =?us-ascii?Q?xd8XzGdJehC47se8M2L7FBf+uJb1mURDAtXG0Ocv43UefGm+xMETzyD+yx1v?=
 =?us-ascii?Q?Y+wl2KmtJyaKnsUJlqbAfWcT/e/AP6hjH0pxcjXHZCXY3jwAvcuIrxRpflDm?=
 =?us-ascii?Q?kLXV4A4khXG66vhdu//GvZMDRY4MvtTVYCiB3nPgjgZSUhSjJRJZPyGbwW8s?=
 =?us-ascii?Q?8p/mHYtwJDbiyjCtPzM/Upm5LzeVVAWWXS2PxxsdffwXfjkoJnx7HyUz00NH?=
 =?us-ascii?Q?uTQVC/9ITCfqHkMfTbxdUMRs+eG/dxaCQ8iS5m5OYrXNJ3YwpT5Emf+iBE7o?=
 =?us-ascii?Q?ptwvMdvcsGU+tA7a0mQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:50:07.9830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3a9347-7e6e-46fe-f8f0-08de12c9920e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240

Simplify clock management by replacing devm_clk_get() and manual clock
enable/disable with devm_clk_get_enabled(). This also simplifies the
error handling logic. Also remove tegra_rtc_remove() as the clock will
automatically be disabled when the device is unbound from the bus.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v4:
	* Removed tegra_rtc_remove() as this is not required now.
	* Updated commit message to specify this.
---
 drivers/rtc/rtc-tegra.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 46788db89953..e8c83a6a96b3 100644
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
@@ -324,29 +320,16 @@ static int tegra_rtc_probe(struct platform_device *pdev)
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
-}
-
-static void tegra_rtc_remove(struct platform_device *pdev)
-{
-	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -399,7 +382,6 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver tegra_rtc_driver = {
 	.probe = tegra_rtc_probe,
-	.remove = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
 		.name = "tegra_rtc",
-- 
2.43.0


