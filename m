Return-Path: <linux-rtc+bounces-4272-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8673AD4CF1
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795861651CE
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6991A231820;
	Wed, 11 Jun 2025 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yq5j8qHp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226F21CC5D;
	Wed, 11 Jun 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627321; cv=fail; b=AOoCSDPNLvv6IUjy2cIzAd45yo/v5OU0Hdaj2pSwOIUyaW6dGBMqjn3C6EKIWfRpO7nvQO+dWKAu6ATEugq/t1veU/qEXx5p9rAQCYB3VO3U/PQJyfSkrdpLrYu7CHdA/prhdNxPj3nb+H6xROL9EnOhbWESoHRB0c4gtc+k4OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627321; c=relaxed/simple;
	bh=pWWC4kSC0j6500XmugVjaF0erN0jXIszJUh0gXpEoLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTls2hwu+eDQcyU1vGMlCTzlnQVAOMSuH/8nO3ZeARvt1f2uOJGCMhjxcIgv8kepkPOOb9C1M6pC6sZtY7sPWMFxTn/UYdW/R4g/ZY1tWxaCr2ZRU/MwIsMOd4hfFieQ1FR7gGnfpvDV32D1ptaXHsZoUcqLA8F5Wja/eEq51mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yq5j8qHp; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEhBuQPIeM3UTrfkQgigQULrx8apuTQsF6kWtCz7+9QlSYkXTqvSpKJsxnMBgOXIWdVk/HoKE2cEyfXT6VWa7kaFaWPMyffqvl2jI1ozFr7nQ3JEqgRV5rFyGsky5fibHcjoSFmpIqD0V3TGKFHjKak1NS/TPn0I9+P+YxVw57qY73Wxs1MiWA2N3sY6lWfphAwhYHifU9eGXxbrW6Mhv/wd1v/RTI4hYjg3Fvhc6YGWldeokDGLSx02xcvzFiVNBmtjFPfr2I8ozB6Yy65WtwOnG/u3Kn44uiqoG+ebgsn41W6XcRjfHd6twZ9E8SMNMyn1QGYFp29lNn16okquFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg+zn0Pql7qnERvJIo9u41gmoimXarBFfeq8v6TISF8=;
 b=F4w+2BBsd0kd5AOaDCEWi/PZFT9Ya0udoZkiAyOs7e7vYEDNlndbfDnzzB1ZJG4hulQbkgA1ZJ2oQeNS79Nu6HYuXc+azXEUdzEYGZauVJmNYQ8yfhNPv9+Cj/lVWsbSDyUi9ZVDvQf/UwGbMfz3XfMj6UPyAGoPOTqiDH20pdAltcV+LMHz3Su8PBY5iMpt6PTX+Sn82dYxdMaMpvy7Z62TENYCbvB5KG/MJVjeDEcds3iYYD9P2IlNsAIDuPSWtTPAldsmoeHEq5qPCcegauerZb4yJVzuB4sXxgrLTivE7qvE4NjcSJUUX4tuBNjvONrb+dJnCJzw72q4VpyRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg+zn0Pql7qnERvJIo9u41gmoimXarBFfeq8v6TISF8=;
 b=Yq5j8qHpH05WCWT38vCMToQuCjtG3Cogv3wGV+HJaIpxlC6HR9DrYdFgycj09spn+7N0ciHLbTRzMNlIkmjn6rw0bytlwi3Z0MPZCRjLQcEKOXKs4AO0aXMudFv9YYZkrSNS9WsPNcmlSTub+V+7nfsFCMyoXBeDCjr7BqMMEhsBymPsMm6QtBMAie7qIBr+NpDVpyZB/eAo0HS045S1fPtKZT/cdVnuPh8ATX2u043C3Y9GT062P8bEiyEyIPWy30J8w4HGmW1YTWnnSwmQKT9TU1Iu1C2uBWeJU2vIkZL9IDSYJgDHYwP4A8HCVx0BNmr/1HkMtWfMIl37GRzdcg==
Received: from BN0PR10CA0001.namprd10.prod.outlook.com (2603:10b6:408:143::31)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 07:35:14 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::87) by BN0PR10CA0001.outlook.office365.com
 (2603:10b6:408:143::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Wed,
 11 Jun 2025 07:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:00 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:00 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:00 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
Date: Wed, 11 Jun 2025 07:34:50 +0000
Message-ID: <20250611073454.978859-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611073454.978859-1-shgarg@nvidia.com>
References: <20250611073454.978859-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 8058a4cf-87ed-461f-a60b-08dda8ba8163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+rqVxnzokugzctNMCAKGgR10EH5efrsUWqCfXIGdUxBV2yIOyw7nj4NMnJ6?=
 =?us-ascii?Q?yZl4lFLsJa3nVb19EKi93DxLm/DwuAfsO1XdxovemOWirwC7pvJTGa3I4eL/?=
 =?us-ascii?Q?QNLVR3dkvw1hyf1qKkURlsHuAUYoDzMqeV12ARHuJNqilns/vnED9h1c0sSH?=
 =?us-ascii?Q?CnHJJkfaaAaXJVji+mOPK1ZpETbPgMjhHnxX132dGhSCh9q7R9DFNOS30nvz?=
 =?us-ascii?Q?GdMSYx5T7/IHeVS+rzmPPzJiTav/F1wjegrm2xOTFvdNZjfdrA/E3okrqsFv?=
 =?us-ascii?Q?aQQk4454oRoBNwkOOaAL/KPrtHDmBcabzjQO4IEirVI5WjNC9adh8sJcgMtJ?=
 =?us-ascii?Q?WHsGpPP1IzjX0fnDtFdSyZC0/MF3RvNS0+Ix1NCK/r9tcD6KXs6eSJKm+zpI?=
 =?us-ascii?Q?i1fFgS6kZ/eOQnelmKL/OzE7om0bPeQM/OcyV2OlFUv2ahQyX7Ky/npz6wNC?=
 =?us-ascii?Q?Nd8vRRr2bwWMURhUePZrID3m9/doJzfJfIAOzq0qE3IW+mL4zLAlJfUm6q68?=
 =?us-ascii?Q?XiwNGVw+XQMM/B2D++/tDoMPHzlFzdSJ29BSKQKcbhWXkFWnxhJFyaD70OLp?=
 =?us-ascii?Q?AT65Z0B4q/bgH3IhOTqX+ejLu7fbcpzZ9tQTC9o+zIqMd9WPevKtxLQDzrh4?=
 =?us-ascii?Q?EA2G9+E0kcnQEX+yc3VS19LD+IK2TixzIyz7223GrBtc21L5aEk6H7Sqqyx2?=
 =?us-ascii?Q?iHsfmA2/NlyqjIpQxbHXUdDovObUKhLaarhx1mZZ+Yl97cWigZrh3wFd7B5S?=
 =?us-ascii?Q?vSK8NcslRuf27yXUP8CJSN9TXf2qIDGw8fveMIj2mA0/2cLH10Ia2cMITETN?=
 =?us-ascii?Q?4hN1Gj3BxwwqhrSyvTgm26KjUPvvsYynu40Cqp5WkxKje8vszTlWvluLHICK?=
 =?us-ascii?Q?k/f43bhKmbxlfkxLBquUA4iS0y37CoTWIzWOl+tIixdenncia0zTejW7xIKb?=
 =?us-ascii?Q?PCs6w2NuydM/GDBYj/IxraxxMAAtIuXWXT3ykt6+JQmOv3W3WWXp3RH9TgKs?=
 =?us-ascii?Q?8Kqv/4pg1Z7HIrZiMjRwcvU8r2F0usDzcDsX28VRWAdWm36uIvqRhFTIrXue?=
 =?us-ascii?Q?8Y43NYRngm8Rd3z2+M8ATnz+Rewvc+8ai720Lx5VJ+OCGWZXZrAb8I8on4Er?=
 =?us-ascii?Q?MzUErL4Q3gIj/5Ff94FN7Gfd2dtbDHMBAjVP/buRNkCzV41hDBn+m2shEFPG?=
 =?us-ascii?Q?szT6Uo0pB+Dz9pKU+OcGEBcS/NwvJYtsBAzBfgHwK5UC610+L2DyKAK4/d3v?=
 =?us-ascii?Q?wnPQga6/ML1HFnSTaOPR54ViIMTLEoCFCz6xeYFfcBdAAUlvkWDVlvSkzboa?=
 =?us-ascii?Q?mh1MbILLnfRs4XTgKR8YNrFd+GoDvSK8XXupJdlu7YceFvlDxYnqLDvARHO3?=
 =?us-ascii?Q?w08rcdIhlMRjwSpB1ODsU3Wl/QXXoN7+1/Mi11i39o7mFGiL1XHhf12BjEmr?=
 =?us-ascii?Q?Zs3poGvkNI9cTc7HReIhCjGLW99TDH5pZ3e7ET83w+ksoURELigUKmLf+M6q?=
 =?us-ascii?Q?si2mlap8mZzRWiy1m4ijQWoFN1UfNUCLJZ7I?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:14.2622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8058a4cf-87ed-461f-a60b-08dda8ba8163
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704

Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v3:
- fixed device tree node name to generic "pmic@3c"

v2:
- added alias to assign VRS RTC to rtc0
- removed status node from VRS DTB node

 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 9086a0d010e5..f03785cd23bb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -8,6 +8,7 @@ / {
 	aliases {
 		mmc0 = "/bus@0/mmc@3460000";
 		mmc1 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/vrs@3c";
 	};
 
 	bus@0 {
@@ -170,6 +171,16 @@ bpmp {
 		i2c {
 			status = "okay";
 
+			pmic@3c {
+				compatible = "nvidia,vrs-pseq";
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
index 84db7132e8fc..877c5c1bf9f2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -7,6 +7,7 @@ / {
 
 	aliases {
 		mmc0 = "/bus@0/mmc@3400000";
+		rtc0 = "/bpmp/i2c/vrs@3c";
 	};
 
 	bus@0 {
@@ -121,6 +122,20 @@ pmc@c360000 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			pmic@3c {
+				compatible = "nvidia,vrs-pseq";
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


