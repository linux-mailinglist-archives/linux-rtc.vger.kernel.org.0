Return-Path: <linux-rtc+bounces-4987-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B2B89C81
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 16:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1FBE1B20D88
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 14:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F7E30E83C;
	Fri, 19 Sep 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eHyOPbCe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556AC183CC3;
	Fri, 19 Sep 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290569; cv=fail; b=br5sjyI/RdvGR9CuZjAI0ak6uJJ5n9jmHQRvHFJoqOe/PAgXh2JmiplDmF9TvBUuN1S4uVp3lAd1x/mzWLo37PztCEn0ATtryBvyZQmswzlvuTFTV7/Jlq+WW37quJ5O5UDJGk9ZInPlhtxOVvKXN0n12w3BfxhF6rZuBrVOxsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290569; c=relaxed/simple;
	bh=oDpeVXXCS5+fKV0lJhvrOz+TrgihReO37WJk2K8tE+8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gtLCt9VA8r5Qz14r/977V8opMI82UCiv9rzTIK8MJJf6/TlLVcLaoh8sF5v6pyHp1ZK+vbbe8IgyolD5CXKi5dx0Ff2R+9hP0OjiCdLq68f3NnG13UANwjqkxzBRyz8nOFnOeu4Q8xNn3UwlVz+9k+YhtvNbXUUwpaYwgSUSAok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eHyOPbCe; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/8NVYzftvHRMhA9W42Iy+UqFCxeUX+yNj80nfSt+hKDa8B4iaRkWOzy2ubHsSFJ/lYPIq0j+fO8UttjbjR4QzJY5mqJLS7hR2ssDqVjpCtAalTJKvkWdac9FQx5feT7vcmNzhUCC+CghC6mFPF6zqUyYpWL0an25YQ4N6fKFm7g03HReEk9P4zF7xYKPBdVsL1btndJe0whJG3Qz8RI4vgpVrCsxVCEi7e/lSNZOlXI9+586mEHUejw2UYS3gWdJ/Mq3kT0/E8dtZurL5FSzkV4iF2loXxsJFvCUs1XOpu+mv9VyX5gSLzJzusAkYLsk4ee+ysQqvw/WXqY/w7qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59/gmAt8KYExvfNa+P6lCWsWtHcXAfF4nIOSGe5ElSA=;
 b=mK7fNwFzXUWAl92VYelsS/EILOvuVjUsybEWKctXUZkTf41V8pXD4b9mVz7ZBb/Yze7/hgjOUAnV9s6jfEr6dhEukmjW3Ldf3p8nV11p87RzmVh2S8Fa/U8cJk0srOCo3IpMmBnN+ZcjYwCTWlYjXewkrXAV83R3eXkK+WU37/Tga8toBAwWCHdk73wxWzdutn0ti4x7FqlkFRWGZLscnEE8E8XcfpGT4zaR0FikaIv39kqhvtu43B7RXbpl4w0EMVKCIsoywcENPfc+HWS6aO+ta/+ZczqC9fZen7OCd3FVciu2cOo9L5v6Sst59eGkg4QyB8YYece6qkgRKINj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59/gmAt8KYExvfNa+P6lCWsWtHcXAfF4nIOSGe5ElSA=;
 b=eHyOPbCeepd48+L/sfes7muHB5P8gbLxV+DIHJX4FBcYdEGwbu/rjpjgUwGv/WxAsT52t8TXKmcet9kvmVWmPsVHPKaAu+oDPx1SgApCcy+zKscvdjgloVHnr7sy3Xr0J7bN2F3nExz4l8vhsMqpdKrhuzZfDd0mCtdZbI1NOVsFao2bmJ+PnDNdToasnWlTlodxInrTBs2R5WfyQfIipTDTMubZP39m3MxGsLqIbE/w1HaSsOTM5VrbHRQJRx+d/U15SvrSvWZwCO+7VCtt0Cq/oas8rYAdxlBP2rxiKkRqdYEYwMfWjtRgzen1yLJ/9my7E2sv7V/NWGwJWkjieg==
Received: from DM6PR18CA0015.namprd18.prod.outlook.com (2603:10b6:5:15b::28)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:02:39 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::d0) by DM6PR18CA0015.outlook.office365.com
 (2603:10b6:5:15b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 14:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:02:39 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:19 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 19 Sep 2025 07:02:18 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 2/4] arm64: tegra: Add device-tree node for NVVRS RTC
Date: Fri, 19 Sep 2025 14:02:17 +0000
Message-ID: <20250919140217.10531-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be247da-615c-49b9-d12a-08ddf78531fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XBcyfGhvoETlkqygtP34UeqoYMrjX79kE6q1hl4N1L78NFlQsEVxcUDkkHwT?=
 =?us-ascii?Q?J3Dxu1R6rJDhYBFXoAMSVoK+N/1K9xSXqKth8JRVWS1gQlsBO+u8XyQt9Awy?=
 =?us-ascii?Q?UcWqGmwfdhq21JnLl/2hPzxD1PpUuAKeiWlv+wNTT0X0LTBBA+8FLAvgkUqh?=
 =?us-ascii?Q?KdOIbH79rjfVt07xF4m0ubDnKpHIGgC2Ak3DatoSvQ+zVbOXsfFMcVpqvSgR?=
 =?us-ascii?Q?0e1/a7sHXUlXMXeeKRatd0a8FiEkBo4T0A4ahDzHPiYNEzaZjewgnTijN9Bi?=
 =?us-ascii?Q?pJMbdLcM6IHOn9ty5AYVDSfbQqbzcnywmA7/0l/6AJiRVb7VE4YUoe6jZTtj?=
 =?us-ascii?Q?Yxq+bfoL/mlGgg6w4+zE6AMPs6kel8bQejDkIWFmeou6svRYMJHK5vvVXnu6?=
 =?us-ascii?Q?qvwG61EliVHEIQWEQJqV51Xhao7swHCCCciZjtM74ROigxY3kHHW84aqiO7f?=
 =?us-ascii?Q?7lMfbZRqqcZsva2S5uxT2O0bqXgUi4AmyU/qb5lpVoS/cYCqzwD6QFp9jYQO?=
 =?us-ascii?Q?lVYYqvzwsz5lF7uTa/mffbApulAp7JVpb9S9DzOxqJBlRt+JHHwfmTrZVUyj?=
 =?us-ascii?Q?N1aZSAGUx6nfzDG+LuKLL5Xdc+RDB1AuLTzSZ4uoAavXZGRb5Js0wYW5K3F3?=
 =?us-ascii?Q?KGeiC2ND/mW0JidmUMPEo6IldcOv+0OSIkGcXZrJluIsUJ8EaMdqsXhkI6ur?=
 =?us-ascii?Q?zV0b7Xpi7hG6gut0GbS+eB9PFX1xTywMrpKjSNbuJ5dC/VfF5sf1y+3T/JMe?=
 =?us-ascii?Q?2Eho330eVdDoMyqKkrjMk0DP5Hv1brlmMzs/h7UAfyp0hAZBqLw7cNFSXXdd?=
 =?us-ascii?Q?ubXXi1Z6W2LadEDdQxsMyoVTa9x4b/AYGWYY+3m1l7lUUg17CzMVKmajSpXZ?=
 =?us-ascii?Q?FV0OfOu1tGJXRy9TzHc6EQGu8gUNkzNzb4pNcj/DbekVcdNCnTFk3W+kmKgt?=
 =?us-ascii?Q?jxI97y4bCPiCYVfG0vqJQmceqsb0tKniVIGhIjGhS9DafI5grwj2T9G3CjHD?=
 =?us-ascii?Q?TlheOXqU+JJQT9tfx0Hw85bJvkNAeA44hH6f0ekMASlyub1mmtMbsmrtB+Nt?=
 =?us-ascii?Q?ZqxMXRHQiijQOuQGuZcnrW91h9hcR9hkmGNDzAN8Wq/UTh71sLKO+Xb14n79?=
 =?us-ascii?Q?IlZmkjL5medhmTJpKI7JpnKm1QzTu+PRGgm/lmKYCnTj1JMcZqG4zy64InkK?=
 =?us-ascii?Q?WPm+TFuJew4lWlPLK+5AHKcdzIzoiRpehSkWlcG3CzYLhqUg2pyeK4w1Obty?=
 =?us-ascii?Q?lL8IhjYiNHQQwWgIIsppREcTjbX/cKCb6LMsWPksJcpOYqpfEWNPLalMPR2J?=
 =?us-ascii?Q?d7jTck1fW8DiGz1LEZsRX7090Y+qXZLsniBcuRd2ZaTICy4YScVxqb+FWeQ6?=
 =?us-ascii?Q?gNsO/kVuT4A/XdezwBNsNYvPVOxOkA72v9TvNUjy1eDS0I+kCd4OA2MFFgq4?=
 =?us-ascii?Q?wl4ZH7JL/5shYqnkB3Ecrfyd6k/Ie4IQHYwEQnNH01lAOd8d05JHgBCsx4RU?=
 =?us-ascii?Q?gAiyVTDmrfe+hFd9Gh7Yb7oKFlYJ70s+/PTP?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:02:39.6100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be247da-615c-49b9-d12a-08ddf78531fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

Add NVIDIA VRS (Voltage Regulator Specification) RTC device tree node for
Tegra234 P3701 and P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v6:
- compatible name fixes to "nvidia,vrs-10"
- changed dtb node name to pmic@3c

v5:
- changed dtb node name to rtc@3c

v4:
- fixed device tree node name to "pmic@3c" in aliases

v3:
- fixed device tree node name to generic "pmic@3c"

v2:
- added alias to assign VRS RTC to rtc0
- removed status node from VRS DTB node

 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 9086a0d010e5..58bf55c0e414 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -8,6 +8,7 @@ / {
 	aliases {
 		mmc0 = "/bus@0/mmc@3460000";
 		mmc1 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/pmic@3c";
 	};
 
 	bus@0 {
@@ -170,6 +171,16 @@ bpmp {
 		i2c {
 			status = "okay";
 
+			pmic@3c {
+				compatible = "nvidia,vrs-10";
+				reg = <0x3c>;
+				interrupt-parent = <&pmc>;
+				/* VRS Wake ID is 24 */
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
 			thermal-sensor@4c {
 				compatible = "ti,tmp451";
 				status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index 84db7132e8fc..ab391a71c3d3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -7,6 +7,7 @@ / {
 
 	aliases {
 		mmc0 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/pmic@3c";
 	};
 
 	bus@0 {
@@ -121,6 +122,20 @@ pmc@c360000 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			pmic@3c {
+				compatible = "nvidia,vrs-10";
+				reg = <0x3c>;
+				interrupt-parent = <&pmc>;
+				/* VRS Wake ID is 24 */
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+	};
+
 	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
-- 
2.43.0


