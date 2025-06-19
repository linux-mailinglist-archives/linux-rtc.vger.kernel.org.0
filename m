Return-Path: <linux-rtc+bounces-4311-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BAAE0034
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0885A28F0
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1B9264F8B;
	Thu, 19 Jun 2025 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bZD6Z25s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3435257ACF;
	Thu, 19 Jun 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322705; cv=fail; b=brTK4Owk4xNNS35Jq9irY+3L1+EQ0tDaSD5Y77/qEgvH+d4Ty2zvjDvzXjXyQp44BM25PqFZE6q59d4Hj+wA7R+D7kfPXiCsk7bRmejh9rvJ+aPjNbKLT8kZfRFObx/tC7fJeVSeW0xvIPBxGNtYkr+Rw+3UY8zeu/PXGwPy6aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322705; c=relaxed/simple;
	bh=LLccR7In+QHSOLY5ZO6uk7uAjqqL71O3D6nJ70+YfiI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KffITFfGIGRuyBuhVi+k6xMwmBAhurn7T8K9Y5ONfqt1bV9J0qWbfOdBRWAtncXKsD/uCmsImuQlUeFxt7YXexdVVwpYev5Xu7CJBxYTow9EGdqfq/2P7/3kocQj6nm4HikjDMmzz3G68KRyNJDTLgoGSqQgrvgW/BF19oeUjKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bZD6Z25s; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5aw1a4qIuJblhw7Mlo27DIaZ9y6YTFibTPvn+dV/Oqgr5brAfSvA/LwygOKweI6ro2kNZg06YKU8L7/uMpvy3VoJ8kC/bWNtN7IV1IG/glP4id1SB1pAvD8mGFrRFYKlowKwELjR37d5XiogI3q/M8nyNJGSGyRlMnDbEkWlAUB+38NbQZlKfEbEiG2CIQLhRfbifR5mVY5z9inWPnkKvyuLzXavHzU80ZM6DfwYOI3AJnqbhkJZ9XN6wN4NECv8UpR/MbrhL3v64JLk2pzzbBAW5f3ljgOW4k7dJkaKwEMCG79/9TcDkoscpR/6GfePxZbf8GRPwLcgKe8woGkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pnXdzdZmzduhnN/cEyOWcD1LrNHplSLYVumGYSbaVo=;
 b=u09tqP47YMpj07Usu08axKL0yIN3bE6p8NudYpntquAPTxherdjUi2MWQJ+B+cw6raulGFVir5Io5bIxcNUrl5sYhH1hL1Gdqx4eXG66nz3d1S6qssZkKCmU2Hdn+7V0V/5hgF6mflnUElCuymN3M1ahFB3Rhpoq5Dtyv8V5sc6yEirfeqjaQ6X0NMukdp3PhcMSLr2CzqDGVGjfyGcsg4gVwLJdgVxIsMcsbVRpn87dsrOU/bhjYx/8bhpjcpXJEzi7u1fRKZII0qxZjtXtNITBFW212AaH8CLSQ7RTjrLI0wTxqVa42E/+1atv8T4uLoArb0C6kOLZ8jqk+Ooo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pnXdzdZmzduhnN/cEyOWcD1LrNHplSLYVumGYSbaVo=;
 b=bZD6Z25sk/0KX9A4wQ+Ro23lF0IQxvAqNqFVkJRuQmnWdRqh9aJ/PxLjkDfNuimVwNE6eeOeM2wut27cB8yJCEHOxRqRKZtQn1vhliv9mYk3+Wb0mMgfCrl2DFkcq+02DuzyuBCa+jX7LdShE0J38ReiNiHVruOES1bLtwuh1SeGjWcTOeX6RnoLxGQj2kHKUVNyXCU0RXzFxRUDUGziM5izlp1rXuMxtLdh8xO1GGwJ/x3qmfcLCP2aU7SGsuHFHe0gl62qWaVKHreLjA+enp+ZGSWiHfcDSrSdx1CCz2cs5wLKQaSBQkTlVzys5k6VYIxy8tS8m6Uam1RAel5mZA==
Received: from DM6PR07CA0038.namprd07.prod.outlook.com (2603:10b6:5:74::15) by
 DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Thu, 19 Jun 2025 08:44:58 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::76) by DM6PR07CA0038.outlook.office365.com
 (2603:10b6:5:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Thu,
 19 Jun 2025 08:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:44:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:41 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:41 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
Date: Thu, 19 Jun 2025 08:44:23 +0000
Message-ID: <20250619084427.3559207-3-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619084427.3559207-1-shgarg@nvidia.com>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 057f1be1-dcd9-4585-3ee6-08ddaf0d925a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4j7PTrzJbcsKHIC8vd30O+f1H1bCjqpfzerC4h7GI/jDFc97I2eUf6NIrbW?=
 =?us-ascii?Q?A4B59aSC+0COTD3aqfCzubkjLJD6uHxMOrT9x0jUxjL64DlZeHFUCJ1aAl49?=
 =?us-ascii?Q?5p35bFsmI5RRV4RcLhAffyHfHQCBffeyI5WIIN4S111+vFs7D7EIwCsOu+DI?=
 =?us-ascii?Q?BhTNC147UFhOZyL9/V4SsOS1VUEwfj1EyG+lJgs5RAO01iWzDoR+gLFeTYmQ?=
 =?us-ascii?Q?voachJyF/funDVYvV6nCWB1VwDHJW5J7r0KP/+596/bKuPUON5+f1tbJ4M1c?=
 =?us-ascii?Q?OdqheeXY9YY4B11qGRQY80b72BAkTYTqmKw+Eq6CRJEQvPCgQf0avWltTyG+?=
 =?us-ascii?Q?KkjN7BsmN00jdf7Br3RpQufoyh/2qVOH4+jOS1KiVWi5MPpmWS/RUaZ2MnkF?=
 =?us-ascii?Q?cmln2wSzEdMZfry1jG5AmM8q2aqHfUA7j0b5p+euj2iVNkFGsLXSNnOIy66r?=
 =?us-ascii?Q?WKQisNPQqVeW29E3mveHv4lESl9/K6afFQpeOV6Djm7hLRhZOyK2MQdyPqvz?=
 =?us-ascii?Q?VQYI7qPJKXCe1VMtdXQk0czAv7t+4D6OkCkpkk96aoLw54gd2mK1BCajmOR7?=
 =?us-ascii?Q?Qsy9yfWVUgsSYy05oKE7bwZjIDQjxZRr0ga7P9a+5rndoDGBA9ZK/zwpBDho?=
 =?us-ascii?Q?cOnSEdg2CNsPpOkOSRbYtPqO3F1oRpZwmCSOfGIIpfgO6nNQUzUqWV9WTa4b?=
 =?us-ascii?Q?LXuZdDe/aeUdFke8g1EVWOmIOO9tBKrSkx1QMcRYil6Bx8iiKjMntvBhbMXy?=
 =?us-ascii?Q?vW8XUizp/X+oSdqLf/bFqsnNttUzXKfLCi1QOLaAYiyOf9ibYnpa7uJHRsdq?=
 =?us-ascii?Q?xR94I6ML+zADJ1/alnbcW/e7PZ0LGad8nnNZ2WO6qCUVfqeBSq2JFdThO8Me?=
 =?us-ascii?Q?CIX3bk4L+zREwQOUe+Tr1pG289g5vsX+/8sx1pCmIRA1vB86fxjS3CLY9M2Q?=
 =?us-ascii?Q?8etTPUFb67Ftxpfs7LUlAB1R6+eVzNYrHSnSEB2RXEW0H0eSHcpaZ842Etmw?=
 =?us-ascii?Q?44d5V9p/aGXc2/mVlgH9is3Jlzj507dktRbuHccaV3aMmgmeC+On18JR3QqF?=
 =?us-ascii?Q?RyRNjp81xPhc2jatsr40pKE6Nv08gn1yGLQUHjBf+4z4ak140apmbRFJyRV+?=
 =?us-ascii?Q?ef3ZV10G/F/GqAN0/ApPOmijYiKIbJQJx1CmsyZ8z10gVzgKMaKtQPyotDYi?=
 =?us-ascii?Q?3zSOfFDU7YU79g4l9Xd71qJ589cyhqdaEE1zrpt7okeO0URS1VNEWMBZjQTg?=
 =?us-ascii?Q?aJ9+rmVAxgCuFeuoT1nCyXiBkVjTg1LhSiS0PWYIcF2hzpj/SjKz9Si+JiGJ?=
 =?us-ascii?Q?TQbeKA66Ld2GFnAxI5bOK4zlz2/DRRtg6wzSStZ5to/qomSwxkJNzUfGbrgW?=
 =?us-ascii?Q?RnuWkl0zEUP1aaCRnpDKiBFjr2ES5OEWtrkKmU0fYNETiscmUmwUZMs9hGAW?=
 =?us-ascii?Q?pxnC01RXofl8ctVAnrS987HhgHkS9UWkBXyQfW++02OW16vuOoLtpPWqLi7/?=
 =?us-ascii?Q?E+Vwn/RgNpmm1OInleS8LllJwIxURu1IJVXu?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:44:57.9787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057f1be1-dcd9-4585-3ee6-08ddaf0d925a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448

Add NVIDIA VRS Power Sequencer device tree node for Tegra234 P3701 and
P3767 platforms. Assign VRS RTC as primary RTC (rtc0).

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

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
index 9086a0d010e5..f327ccf48c8f 100644
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
index 84db7132e8fc..437fda14831a 100644
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


