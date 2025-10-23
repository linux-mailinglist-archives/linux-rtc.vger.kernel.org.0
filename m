Return-Path: <linux-rtc+bounces-5132-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B859C0040F
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 11:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A0614FB5A6
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 09:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C303090DB;
	Thu, 23 Oct 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C4jXrKI2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AD6308F09;
	Thu, 23 Oct 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211871; cv=fail; b=cn/5UFMpfuuXaw3IP7MQD6iuBHzTET4HJsKRgqO3mfkdNAW8xkZU6Nr5llGUwhvbXneKWmufPZ9eRcVPEv5kIvTL/LjaN6QS/iymaQxoDYPBD+A1KYbsQD6kJizurpJ73NTsQyrON2A9Zqxsw7bMAQivugCvDpQWJ9xAYSWePhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211871; c=relaxed/simple;
	bh=IzFQZzm+MjKP+O5izepiyAj3UkjeOVUt3JZACZzu4Mg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHF9y1TxiEsMTZheUJjU6K8Nx5VvsIuKa8lS9W767Mvqw66hcmuyxdHOtBdWLd6ibDmhM7qBKDh96FaiNXiIvymmvEI9QKwULYQXYMoquhDN+NqMnHa9GQxoOzWNYqiok9DhQJw6TBWJRbqe8jge0h2HoAzyOHPiBKLORUOsUW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C4jXrKI2; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeMK17i+FzYbSq7j+WP26dcJhV3Uy6lrgcTka2H4eH5Dc/x9Oab+g9E0SYYe/dO21TnrvIW/SLLqXw7QEgtn564aAr1thPUESR7NiR2/aJo1FMlEz6aTCQlwpqgcZJ0G6zd4ToClGTLd5EJa/tfzaCS1eMWPuV2szVU6HhDN8RtC4LFefoVy1yBi6NNc0X+EpaCG10FvhPHp8VY9c5epME7yG9V3XHLhF1QRT0BLEZkOZ44z6KwdXQlFRBx89MX2wzBInH9bqr3vhjyjpr+jRTjASLrYbqPosnt1uyhtyCd1C120y6eATBfHZ6FpR+GB+0NncW4wHO4vIBUpoLBWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3l5JU1AyOMknGFtqlA2NIpSfOVzOk4Z8DDxfupIMPc=;
 b=slXu4uOi8MInuXMxG3wyBPm3ZYEVh26xLx/A/onPkE7F/+VBv4vB81mIT+pIeEIdI0+gxLAj16l2eRBTwIkNCUzLXtiq7O/GE0JqmFDT4XtrRP3+cl9QnS0iOTzX/KIQiaqv3iWiJzxGgRsoXLX0QHJX+Yw64z9Q/rKlsNpKjxjShG8cE5LxBxPEMQ6j6aSqTEIjk+Ds7ExPBJ6FXnT0BvUcCTjMhlp2BsZz80fPPM/ObcqAZTgm1CzQigrm7WlMtcARddZgkaqn69Jx2Nd783J03/QzbelpZd+L/L1umrOAMldDj/jahapn13P4SQukHDj5O0EhD+QLSiLRIYJ3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3l5JU1AyOMknGFtqlA2NIpSfOVzOk4Z8DDxfupIMPc=;
 b=C4jXrKI2n9tES8lY/ENL183KX/ypVqvIShLb21ebzeK1UGsf9zMyKOJ2Imx7Wqm7Po9qerxHOQrwUz00k8Uq2fpheWze0UB8a20Z+rdjiSLiqgebIg+EDh7DUI3gT4sUe2ASzLsQYRsoc7WJ9ih3IUfHaIM9nuRi9iGsgQFeYgKBbP/ozttVCuUsAOo3aDGTNHLMCbWLFXOvCaQcPJ4YOb64He66I8Pc7lNsmd2sY7rm6pFHPm4cPXY6TP4R60siqRKAjxhQpQbmXby+sMSF/zEFAlrkXA6sZFl4gvi64k2lvY/CDqMX8Hw8xkKEb/F817lrQWijAAhi1UpqRiQ0tA==
Received: from CH2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:610:50::25)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:31:05 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::c) by CH2PR16CA0015.outlook.office365.com
 (2603:10b6:610:50::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:31:04 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 23 Oct
 2025 02:30:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 23 Oct 2025 02:30:50 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 02:30:48 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <alexandre.belloni@bootlin.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 2/3] rtc: tegra: Add ACPI support
Date: Thu, 23 Oct 2025 15:00:41 +0530
Message-ID: <20251023093042.770798-2-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a959332-d654-4c45-3069-08de1216e373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hex62edf1dl1t46TX4D1P56hf7lrUpXaEa4rTTBQR7Fnd+72crtz6O0TLvzN?=
 =?us-ascii?Q?f2Y1kG+6KFLZgN9viN4MbH+HLoiBLJVTybydYL3zXJNlkRo8ImxTdjdRs1lN?=
 =?us-ascii?Q?VxTIVXVn6kzsilO/bGRVUDRHgHxerTYKXMIZQd+DAKLVKZ5kiKL5OHSC5msW?=
 =?us-ascii?Q?dNXvuDAtzFawgriFWtZb73F7vPlqfw8vpJ8Va+c20JMcB9oqfVy2JGOvfKAS?=
 =?us-ascii?Q?bdJNAFd1kVUEwoR37ZXuWaMb6I8vhKr4Fc8iapk1UKX767YXgwsTvauXCjIe?=
 =?us-ascii?Q?+AcWTegZKplJ0EWodATHOwUBV1uqLJ/lkVLqf/JtEFQRga8nMgpvltdCIJxb?=
 =?us-ascii?Q?TV45rMBMeD0EXJGB9fy/5en9CbWnZ11mPZs0SUVzmCslWyl0lrtbzb5U8tCb?=
 =?us-ascii?Q?/1i43IWVzAXLCXvcrpVJRZCPYR2NAlqMTpm+0kd6QN4Ra5zykAv49rtOcmrz?=
 =?us-ascii?Q?ROG94AwYf2c0wUlr5UkbvqJLD3wNoUvHOYPH5pjgAmOQHz1QQmQUGFtCf3Qp?=
 =?us-ascii?Q?idr5TOOME9rSi2Y4C3srBVXpFeOB9DDoUgGo7l2AIaI55NCRmr3BvCReFRHi?=
 =?us-ascii?Q?6b2sp+FPlPYLaMZ/+2unmeefYLY+Sjo0Eu25dGuONFFuA8KOHz00e1a9wW6L?=
 =?us-ascii?Q?G6yAcOc6lMsrtA5bb3iN+NU1stF0uqHNMwn5bSfL/mkJgcvJTSrUgub4+wm0?=
 =?us-ascii?Q?xTbiehDsFF5mlYGZMzJGi21eBHQh4gZ1RdJUokiE8cWBOvbEAS9N19BwVZtB?=
 =?us-ascii?Q?88TmuxfpgOKqTuCmYlCBIhF1A4bDp/rnjG8R3M/O7sAxqAvyXQFdatOY9rYz?=
 =?us-ascii?Q?r4F822jW/7JNcPAF/2sQyNOyhhtHHUGleRABkTdynJaQI0Zy+z3sCC05sucG?=
 =?us-ascii?Q?Qpbw6c8bAKLchOOhSR1eEQiAxS8CJ5mUbKtxYtqmgKyPD4dDAkB6Ofu2sILq?=
 =?us-ascii?Q?RfEsYGR1RbP0A9He7eeySAV6AjOvDiZRqluvbOU/YxTrSLys58N+d121cVAx?=
 =?us-ascii?Q?pFK+Bw/knpspkJ6zL4mLN/hGiADQU15/tVQGl/qUDvSE4VUTwXIR8m3n0fmB?=
 =?us-ascii?Q?cXxSjr7EAi0VLlo2gde0d5y+HJ+wDYjyr8T7VdQiHf/IZPaRmLMi0s0IX2uE?=
 =?us-ascii?Q?OUDKPyQEEAdVUE1Asabwr+i6uN8k9gYqxUejHGuiwr0TkGvfbVAafTiVB127?=
 =?us-ascii?Q?zzhUd0OeC9QJ1RZhn3oNaAiMbnASemaUfz+0vFKQQaxF4zcfn2r/q3dlB7rj?=
 =?us-ascii?Q?aYKI1EwFMTLWmU+MwEDTqZwD2Cafc1QNBqVUTlW7I7U/XXDnFh0Gb5eLkdj4?=
 =?us-ascii?Q?jwxuQgMOnwlOACrDhrSCFrDcZ+LsgxcsFHGUeVAGdzxjD5+yaZmvBrjyFdBP?=
 =?us-ascii?Q?rXmdLq5dYQy18Zkm1MKuJk/M36oS0PyQDpANXI8D46NWo6tybo3IoXk46rVf?=
 =?us-ascii?Q?5SdubawRsXUwLMNmOtCSAO/bxj0xStdTuVSKFaAE+ri+n+Nd4AQlpu/INI52?=
 =?us-ascii?Q?ZgHzwz6B7QyDQABz+OQ4COTnFeHPrfif/KUvQpXtBFDFobISa4JRBjEBgdTr?=
 =?us-ascii?Q?Eq6QmGLSyOrnR6qO6Ug=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:31:04.6322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a959332-d654-4c45-3069-08de1216e373
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785

Add ACPI support for Tegra RTC, which is available on Tegra241 and
Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
When ACPI boot is used, the RTC clock is configured by UEFI before
the kernel boots. On device-tree boot, the probe must fail if clocks are
not provided in the device-tree.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
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
index 51f5bb55c176..ad0c57ce87df 100644
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
@@ -394,6 +402,7 @@ static struct platform_driver tegra_rtc_driver = {
 	.driver = {
 		.name = "tegra_rtc",
 		.of_match_table = tegra_rtc_dt_match,
+		.acpi_match_table = tegra_rtc_acpi_match,
 		.pm = &tegra_rtc_pm_ops,
 	},
 };
-- 
2.43.0


