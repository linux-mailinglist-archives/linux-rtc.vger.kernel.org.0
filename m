Return-Path: <linux-rtc+bounces-4543-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B419B0F322
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 15:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651433A552C
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 13:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F42E763B;
	Wed, 23 Jul 2025 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2myhLPJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A098528E;
	Wed, 23 Jul 2025 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275845; cv=fail; b=eqyd9dkinH0XDYVfkLJxwN4dbxEtY+oJ82SSLQoXewH8WPtrEKuvf6y66Idt12RzCB45yD4EOTUpZGg0ftqGPUqLUV3d4z1x+pUdBNHV18YabkOO1ZHP3MmpNIhVZg7tH01YiEOcpysmImZoXmx5OMJV8rRyxpLR1Dr4e8NXaYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275845; c=relaxed/simple;
	bh=bWgGxJTog8Nx9I/PyzdNJahcP9S4YOAx3u9iVk76c44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7ELfwaihJtFiBIpfm+5znqyBeNMZJ8h/uYy3royWVXNAz8PLUat4sb2d+GTb7j+Pr2MT4BLv9mp9FnRaaQxzQTJjDu8q3rJFtsVLkxCz/Gzurm1aRf6W1ukBWtucXI9DOs8WON1T6sNMs/L83SoJw5aVUSE+7oyXt4WeTMX7L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2myhLPJ; arc=fail smtp.client-ip=40.107.96.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKzVvNXYhLnPqa7IyWdAuPFK5txruKjWGNr8uIIYOkak7cvnbBKUa98bzbYsTwUdPk5xgFzOYt0tj5J/UM7GDBZ1RgnmWIVGXzMDA4nVO91lJEsPc+UZ49X7mBav4Um6MtD9oYbfa+nLpqh+PBHkBT9epIFGL1tHSpYQ2tU3diKfITejWawt4ZCeu/9st5qVWqWqNOvmajQWQWqKWAQTiJB9JvniOqTbO8uPiCaSHtRJdxwOSa/43dBr5slQMQxZUw3HxyntqxxzhCjLCwDHqpIre8+u9PT1WRHgRkjuwPz4sehMLnLZXTBkgK9tuh10DkWHk0ZyJIAnq8AqjdXdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoR9DWiLuFVtslF4AGhL2XlKPFkCpSt4Y4IUkH5QXKY=;
 b=gmXOVMqu8U8cxs23BSOMP5RW6WzsnnFh7YYG9DAAOi79GYKfftEd2ywVVj79OkQqjnmp/JI1WbxiXJ2WVZwOqaAVJDtkFkYnmaEDgXhTri0jp24T6DjllLxbOaOsn/tWo3JDYcx/DfLhV2LebMJjAXZtw1aS3wM2dhNcoOix2lJpz/Dj0iMCqHRklwxpOBBO9+9DaN85ntuJGXFY+ad0v74yjGp9TD0KtJX4S17oc97sELBt8mF88e2U1QwPzGnv1S9VSZvwhXW2VbvQjn8qq02nXLj/EpNauFg6PaoOttWjBqBONgYyu6z3NjZithikLWxTBCnD6MEc2r7xKA1XrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoR9DWiLuFVtslF4AGhL2XlKPFkCpSt4Y4IUkH5QXKY=;
 b=H2myhLPJPulHrFaJoDdHvJhaRjTycRRsAWpapTSJavV3x5xy14draKXgPpSjVeiUKQSTAD0Tsxd0kEut8N0qT6cyipwV+F58IW2vZy2wd0A97lw8BIbT6Dnz4ekTi99SKpMoEZP4g/8QxXyunbG1AqOzkdF4t2j9We+lua1bM5f9LNVZtWzLTqkqyTzESvsSSXFTj+QIBcrsvgRDuHqmS3ozPDa8Hujjs06lbKKwEvUyb8ntICC4cm82f7nCkp/JzluBlv/wac/5rs72E9xpBmsbkyvE3VipBDUFYlpia++veQKje8nYx6kPFbXe0wGHlEU8nGfbIBSOwwvceYF1+Q==
Received: from CH2PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:59::21)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Wed, 23 Jul
 2025 13:04:01 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::13) by CH2PR03CA0011.outlook.office365.com
 (2603:10b6:610:59::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 13:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:04:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Jul
 2025 06:03:48 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Jul 2025 06:03:48 -0700
Received: from build-shgarg-noble-20250715.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Wed, 23 Jul 2025 06:03:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v5 2/4] arm64: tegra: Add device-tree node for NVVRS RTC
Date: Wed, 23 Jul 2025 13:03:41 +0000
Message-ID: <20250723130343.2861866-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723130343.2861866-1-shgarg@nvidia.com>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f579cb-f0e9-49eb-ff90-08ddc9e964c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wXvxEf1WCnWBM1bE4hCscehwm1qVrDJ2DfUFWL4vCfwb3cEdWq0QJHwoiXx9?=
 =?us-ascii?Q?zwr5EnbVBtNET721h5WuigdBXyR6H0TMiszzfRLQlDffpo9Z1R9d1vfU/zKd?=
 =?us-ascii?Q?Y0NVJZa0MMWudPqy4lfTAwxqdWaV5VR2v3aFDw61RxISTeHWbSSXl75a4Q5L?=
 =?us-ascii?Q?w1L1RoepCGxu7ZQdfLUK6omEVX9dm0xM/CSCK0awam9z9VzUyF5srr190pY5?=
 =?us-ascii?Q?Lq4NWRxjg6JCScM8cwbBs0Ul3H7v++dr+SGE7M0+Mm/l0OVlAjISn5KJOlyG?=
 =?us-ascii?Q?37deDCdX11AJYIT66fC0RsPZmNPCxhVVkZ2BLmMT22UUju5uJkL9LhiP4Dgn?=
 =?us-ascii?Q?I5Q5FLPjiZyOKfn7JUSPcUh+ezp7thTcYrsu+DN2vrRM2UYwc0MhDVIwFXyl?=
 =?us-ascii?Q?nZOEPtWA53fffLM6MMNMAJtsFzcFuMpBEvEq/QdJAa3mXPZ2rF0DnSlPNZg1?=
 =?us-ascii?Q?1XLv8vjTan4QPr5c4bSzh/oMiGAux/4BTm89HrJwEI2cCnGKlPFC0/Aqv7Ow?=
 =?us-ascii?Q?kghgjlK032kAKIeCV0biaFT2GYDfj86nohsYyzjZT8b1gt6jjPvKZb2tPEwd?=
 =?us-ascii?Q?Jn3ImhS4RWgb3FvUXXZYvna5otq2dP8tg1Nv8rCgP/PKN05zhUrgDRIJJj34?=
 =?us-ascii?Q?eG4GVmLn88JR0/qGgLKzk2mA7TGYTLzoZ8BFzTWRTLIbhHCTEVc33JkYJcD7?=
 =?us-ascii?Q?HjtQ2zQWaHOpZhhFo7VWi8Gm0VCWKHYWeNvjO9fUedHcmcG8ne1Rn3+PDSe3?=
 =?us-ascii?Q?XOMxDPHik0C2wFHubOy1Z7gdmyuujAW3rJ5rZ5vgQwHHPVc/6uv3r121PSgL?=
 =?us-ascii?Q?dt7HLSuypOiwNR2jYV/u9lUsYscolGHTujeLcTJgMeOU57aSpzPPT8dApE8B?=
 =?us-ascii?Q?7yLTA6qMTOfyX+ROPBWM9vetKBsFPgrxGwliQfUpBf7MfNNIf1M/98ESF7hz?=
 =?us-ascii?Q?2WZg7EnAvnM7ASNfGdISkWAZTZEFpa4N1E+XmfNsNrYA4aS0vz7Hu63pzl8Z?=
 =?us-ascii?Q?hQycaZ54ItrUD2TtaciJtZjKkpmwIzEZvhZMc/0LkLMKvuG4fJ0W9jmLgm05?=
 =?us-ascii?Q?rfgzSkw5hHsbpt3WJcxUiKUBdQDvFs3i2QegujCKe6N9pIS8E21EmWb0pTEk?=
 =?us-ascii?Q?ubRPNiXI2F3EZgtTdtZRr4c0U3mxH4dIjYiNYN+Cq5UZD4e1QL2S+CAgf9pe?=
 =?us-ascii?Q?Kqgqa3xDXSEYA7Cgf/tmd5DJwAF3iv4lMFPCzKJB4C5ae7kVfzGX3oD5NAAb?=
 =?us-ascii?Q?Xi/mqmW9w2DlOs+qjDk+DL07gSuoqe/KlIe1Te0U9tR9o6/vGpB2Cd/y05uK?=
 =?us-ascii?Q?61QXhx3sWXP9iCgEWQbkYPmFCNjV/rDzIqXrOKM5JKAlYulXO44AC15PGA76?=
 =?us-ascii?Q?6JKqKfxuufKpSmleIkZF62uk+abs9HHc0YoTFDEqZ8NG2r09qkJWv5Z4clgI?=
 =?us-ascii?Q?wvVSP/GvxjGX6rSQ+78ZveRuqUSKF/B5FYKvAshITZ6jcojq8ccNPs9o1trF?=
 =?us-ascii?Q?sBchny5hKM1lEmtn4iI96RllSTBWT2Ytqyow?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:04:01.0490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f579cb-f0e9-49eb-ff90-08ddc9e964c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864

Add NVIDIA VRS (Voltage Regulator Specification) RTC device tree node for
Tegra234 P3701 and P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

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
index 9086a0d010e5..caa8d42438a4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -8,6 +8,7 @@ / {
 	aliases {
 		mmc0 = "/bus@0/mmc@3460000";
 		mmc1 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/rtc@3c";
 	};
 
 	bus@0 {
@@ -170,6 +171,16 @@ bpmp {
 		i2c {
 			status = "okay";
 
+			rtc@3c {
+				compatible = "nvidia,vrs10-rtc";
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
index 84db7132e8fc..565b613e0684 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -7,6 +7,7 @@ / {
 
 	aliases {
 		mmc0 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/rtc@3c";
 	};
 
 	bus@0 {
@@ -121,6 +122,20 @@ pmc@c360000 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			rtc@3c {
+				compatible = "nvidia,vrs10-rtc";
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


