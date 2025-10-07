Return-Path: <linux-rtc+bounces-5070-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1CBC19A1
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C222C4F693B
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 13:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80CB2E1C4E;
	Tue,  7 Oct 2025 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aUmUXaAD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E52D8DC4;
	Tue,  7 Oct 2025 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845482; cv=fail; b=UnpsoLEXDxfUIjMXC45KQnct5H0pHWIwV3Fx1t8YDcWz6VzOlwwuIJl2XqdGtZ0OMvyrdorPQqjkwlrXGFPAQWy1n/l2MQiYqPIhQNBQQygb3OReJ5nnTgr6Zd7tOvLUAlnAun7+J3dvNOZLQ7aFW129GAE+XrZl4Vvf3mqaH0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845482; c=relaxed/simple;
	bh=WLcAUKhNf6gbDasXNCn35q5VRVdHgWbegeVrR+nV87Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VnnTPkyooaLNYj5huK8qhgvNdp0HPgSfMeNmE1Vqcv5putSUOhlaLw6w+drpKuB1HQcafyRgBoe5s3DZbcAT/LanrEMdT6lL1E5qzd5afsyKnPvW9l4pIzybWqUg8lf8KZy2W3jSvf8DStjjMMOsDGaXtA8lpeSloAHGNKV3Qvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aUmUXaAD; arc=fail smtp.client-ip=40.93.198.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/+CroaFfU8P4gxIDpHW9eelgnS61mnBxH5zKJTWqznLwqRyZelV1WAuJ6VZyn/M0qhpxfpApYyRa4CKE2eENhGn6R+VOPG8z5nqI7bfz7jWyYsW28JEXJj25oh18qy74UMfKW3q6exheOYjSBMAz0EXdadIZ51UbgicfdP8/NDKnLWYd/FmpIexJ1kC0NIaYZCoIMVj1hQSOP8hedrCD0PAcyavwdHDlhHsamSx0np8XvLS9obUDrl+9jWyu2XFdFENIYPGYtNkeiiuocXR/RyAkglldVoHTcDPet3JkAeDs5QmMV4QPF2vVtNcQooySqSD2+54ZYMe0602Di9SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0tFRST74B2exifX9oyCvhibBAOiUJJda8WnIRavYcg=;
 b=Z+5N1Ui062GXIq3h2JKnOG/w5+uZyHYP3jWpOtfrntet/cRP+hcsLP0krevoLvRCacBFZxLRsgsCpCftqvgdYZuWWoOYfgfpZcgNk0DpwrheLWoEzGSC/ry3C1TaiDrZ3u6S1vIUjQOE6N1BMvLB21PJFi12qYIh+PKSJDqOjVzSy39v4B822OSizt+OMCvK/nem0pMmpOcpDVxpUKH7e5Sop7p01VwIhxSOS2N2ZIIAKIJ+sX2N4HTGpGY0XBUSPqLN6fWcABsgr1tQYbT9TggbXO1T0eynrU4laB/tXOlFkKe0rocyru8V4L49l+WK9M9TqBrqk+eOZRzUAjeTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0tFRST74B2exifX9oyCvhibBAOiUJJda8WnIRavYcg=;
 b=aUmUXaAD8g0zwM6vAzij+xRH1g3aWuZWgU9vVoqAkyUXNWI9hYswFRtfyol90ZSjEDFnEPLN49SFDFeRz8KImRzzHeWExmheN2RWrJJCKcPS90xC2USc9TIrdbR/iRpmAt8qb/mPX7GNMtGht75npxCvjJ2s4tw5l/UvThH6lCB0pn2lgZWOMpv8sCSuN90nat6bYx6n8WCHM249xnY2cB42O+fdk1zI9sNf4YcAc/1Fa0wN5DIIzZpn8yP7NYV4JjbMhefS4N9x9h3gQQjwKpWuLqPphXk1LEsFykYbx4y8d/PWGJfXCqKQiUxs4ayI5JzBd0NOWXJz3FCOZGQmFw==
Received: from MW3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:303:2b::13)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:57:54 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::7e) by MW3PR05CA0008.outlook.office365.com
 (2603:10b6:303:2b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 13:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:57:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:44 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:43 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 2/4] arm64: tegra: Add device-tree node for NVVRS RTC
Date: Tue, 7 Oct 2025 13:57:36 +0000
Message-ID: <20251007135738.487694-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
References: <20251007135738.487694-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: c68a9871-2f84-4849-3a8b-08de05a98336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49C31tGDW0xVwhHF96hcTRVdlprPBtD5T0XINqlTuSMjb0Y0NX6ltFq2jQdv?=
 =?us-ascii?Q?rTXlmtGpata7EvADYldw0JyaClIu/D0wF2uqL+ELUR2Q7rRisiKO7wi1moxo?=
 =?us-ascii?Q?/ieJChBcrp1sXPsaDeGuimhp7hTp7X/Ubj3Yfx5lois9k/OomJJT+egTHI3l?=
 =?us-ascii?Q?KZDrXvjKlCuKwyN1A1MmpaCXYgJvKo4JL7ecO+zoBkLpj7vC1o63mojBfXFq?=
 =?us-ascii?Q?hpaKDOUMs2sKJAATp6tSoKjT9ia//F+ZM+jiDoQtTB76CCCsiNd4wmNsS1nb?=
 =?us-ascii?Q?hw4Dv96eNIzcZD6UXo/nZPKZNyKK3g352R5soATMQnxKc0iXaHRkRught00/?=
 =?us-ascii?Q?MeSfTgRNUE6eu3NR6YVg0aY+ilZUQgr97te5P99Kf/UKC95SGteyFV3bhpnx?=
 =?us-ascii?Q?YE7D5+JYOllFYuOxFOZc5Sw5C8gvnjzRQr1eeOELEanoHdwVitdY4HZ5AK0v?=
 =?us-ascii?Q?XmvAg5GijF9eTz35WneK5bm0/0ceUce8wD7b72nBSJg0Pa5Xq25yTIXOhmmT?=
 =?us-ascii?Q?D+OE+wGlFVCO+zo6wLEFBmahjkjtHKHKjUqiUZhABiFHogM9k+CyXHkv9KcU?=
 =?us-ascii?Q?WCgvMv8xgInCWOhWBnO4hO+huqb4NKeu1D02TOZLsklQaz0rbQg2apF9kOjx?=
 =?us-ascii?Q?B6KE6YwlhJc5wFBdOmXFo9ZbVTJ1pOCG3zkms1cETeahAaiY5w8u0tRsj2Tl?=
 =?us-ascii?Q?2QIRCDKFOXsesqQTggK3fgkReRLze4tZOzS99Sp6PfrRCd95Vnu3zzdATeg6?=
 =?us-ascii?Q?wMDjLdHirDiL9R0WxGLuJ07pvWSfTsDWzX2VycPTHhNnNpZsWVAgpCGpnMk+?=
 =?us-ascii?Q?Cdn7mIQyQWlDj63xdKdFu/e8OxOuSXmhZs3OvhyH10iyA91qoVTgGrIiRy6p?=
 =?us-ascii?Q?oJszGGOSW1hIpSM49ZuSVsqyLLc+hzKLDiwipvLAMvHD6XaSP3nnRnsMZifW?=
 =?us-ascii?Q?Lwregy6n1qSRGPw9yDk/vDo8bVbCJk/kBUjuusi/P1qUXLk+QuVun8Cj0vRj?=
 =?us-ascii?Q?I+T99InZMl+XTD1IAkY0ozusH8gccF3R8kk1txDp9tCRGtUGyM1vvUkwxdPz?=
 =?us-ascii?Q?Lcqv4iQVK6eCeDHmK8l9erFonuZKNtrU+DHLf4o/sD4AEnXVGNF84U3s/evY?=
 =?us-ascii?Q?RQ7W7cHnoNC5kF7tZRxg9vOQCH+yUqv3epcXSGND49ce+6HNdoCz+sRYc30c?=
 =?us-ascii?Q?Rv7K40EziD5TDqZKGSWCpu2dHYvcCjSIoxY/LzJonSSrTVZpbhDsOs/BhyLT?=
 =?us-ascii?Q?obJF19xT7E/9WGEdCwpMnAbm5gkwrwKf36Rd0KxFk/VxSxMrq60CQv2R1GtJ?=
 =?us-ascii?Q?0h0Mi17X6YIp9r5owHSp+9Xsm/2nDle399xvVEhG8+0tENI4Vq4hiwLxHCF9?=
 =?us-ascii?Q?VVUJbYM4KTUHt2p82Pjgo+FWo1zY4MZXbnVS41iKnAKODYq/tp9I44EuZKZf?=
 =?us-ascii?Q?w840G/1eDB75oBFjCVIN60DchwkVo64GcWavI4zARRoo8MYK3QosvNxwASOy?=
 =?us-ascii?Q?njkxiKrlZvv/OkC6a+m+JvX49Doy6qE8AmqXYx3TrlNHJlSMu97nIAQM4l9a?=
 =?us-ascii?Q?M5/pT1AuldwTr3X/2QE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:57:54.1972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c68a9871-2f84-4849-3a8b-08de05a98336
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Add NVIDIA VRS (Voltage Regulator Specification) RTC device tree node for
Tegra234 P3701 and P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v7:
- no changes

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


