Return-Path: <linux-rtc+bounces-5073-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB1BC19AD
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 15:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E031884D62
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5499A2E1C5C;
	Tue,  7 Oct 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qBCFQQbv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60512E11DA;
	Tue,  7 Oct 2025 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845495; cv=fail; b=NAP3eke7CLbeJdpzvr5K00vVsUZ4GMYO2TsiuPLvr0ZL2FfYTv2XlsjXu4cpdbKVvsVG8sbwJ50ZOqaO8nnnMk67OmiRvO8qXLAqhCdfMTvSo/pTCXis8UgZVHkJokm2/Hk+E7duyn7K+2UKneEaNooTdqYEHMr3lnhbUpHYrLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845495; c=relaxed/simple;
	bh=jb3oJyoM1Cp0zJGo8KtcisAi37nPmm8HM8lek1GEAD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRjm5CZ1XyK6uDI1J3VCNQ4OnQ8USlJsZZa7EYHT9mY5rdFOu35uttGXCnNeB8TmMuGXgS/xmFo4PqIhU6Ir7MZb7Ihtz9nUAS9paJvvht5C2GAD7h1qyr6fEGAIAbYYEZe1uECOH/Erxs54oQDMLDKVF4ABQbGwVpuAct6bYPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qBCFQQbv; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyOGlp0UjLaGrSmwoIG2kVbb+82GFcMlcBc0z/GLUM/G7IMTF0Z3pD9E8N+F7zM0UUe6qg4OpzO9YNWH8dYhEmlR7OQxdL4CkPpVUtw2eLjiBWgzzH3aX1oYmDfxNRM8+xnASz80m3ee9mwcLXDU+d0vnhPRyzHs48ULTR0nK2ovbgJh4byaPiibi5SyjD/lSu4MZs1OHyMsBKTrehOLWxtvYdnYGnOLZdrp8LfHS+uUA6kWfDxC9ihz3i/1SnKOT/gqK1ZeoZtxo0t4Cd/H0wlLw1GbRKDPkBoD3aE5B+vr34lepFuP6cufyaYdxwX+3p8mURAq9gxm1c0skU4Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDj6KChHFWQ9xoewMysopWXZ687XDGNYV02CANlS518=;
 b=o3pq38YwuXHj5N2ItL0Y4TTHfdXz30nVma0Y5H07cA1MvXmNz5wR7+EH0jvrPbj3ge62Fvxnm+oNxFAOoju0geVQbz0cFOrvhhNkq2OgEcIDE1Bf7TZQH50dFjUw94AHk75Ge6TOq3ivaaKSc848Lhi798IoGISEaQaIEJVEsEy4WgyxcKetZJNVi2bzNyctElXx5Myoi/fTlLX1Y1uDeqzXEwxE4hpFIFH5buEoxn8lu3cnW6FFzY6F7a+990jqCYpIJvgr+1MxGRHvOj0I7vlqJnU8xlCr1450r0S0kUO1ZtHYIraRmaFFsAsv4RZ22DocwUrVSVHvrBO6WBMcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDj6KChHFWQ9xoewMysopWXZ687XDGNYV02CANlS518=;
 b=qBCFQQbvf9miYP3sjoyaWd0+GZFRP57BrRp+IHazY2qJeyJZRk2SOLcsCXMr2YAgxOPsB6gCRcCrkBM1CCqGIQv//r0taGRZpOrtpe5pdP3EaYUNO+ravAnPv5hB5RCIlbsdh1NeL6YJwsu1XhZshNLswhzKO2PoqMZ53naK/zrlevVBUbjACN7jM+gfSD29OjCokdh2BlzkMBvZJs1w82Y7JC7iyBEjFOrNG36hJFqEvC2nP7d+raIDhL5rjJJiCK5+wabMPbx6WDnyOs7LlOfM0O5yYpcNwNNDSSfkrmLe9IYLyIFpD45DBICo0sLfEexBVackWShc0MmwU0bOow==
Received: from BN0PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:143::13)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:58:02 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::d5) by BN0PR10CA0011.outlook.office365.com
 (2603:10b6:408:143::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 13:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:58:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:50 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:50 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 4/4] arm64: defconfig: enable NVIDIA VRS PSEQ RTC
Date: Tue, 7 Oct 2025 13:57:38 +0000
Message-ID: <20251007135738.487694-5-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aef6b6-f24e-4dec-fc8d-08de05a98772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NYvr6g3m9/CCdPHuWSfbAi9njbb0A650bHt2t0/b1oYXjIvhXioxeQqxEdml?=
 =?us-ascii?Q?emfF8VBxbqS8oNW1eTdr7I0abki8Doc4euH1AYYfDV+zVgrfZtRKYLPbrE1i?=
 =?us-ascii?Q?BZYdh3az1C3hEUz6NMtnc4t8D04n+qthXEqMtkymBh+hLrQH7oChrkuMKHXb?=
 =?us-ascii?Q?EpcmWFAQgCHWrLP6SXuLF7nZzSv0Le8Uy+4y+wINeNSZfS2kPn3/PyxjEPJv?=
 =?us-ascii?Q?g4LWFvKNJItBSiZJr/c3JaxE+nA39WUz59k0XAkgMmMJNhOGanKhfvccZ/NW?=
 =?us-ascii?Q?5ip1Cfwzgqt+hxtRIO/chyqNkmbqSx/U/+slugqLjZSE1ZjjRpsLLwm+Tl1J?=
 =?us-ascii?Q?Q2yHmGHRyIHLm8CGEt23OVjFEPqx6HpURqyNO2nqfkv81LweWoPqo/LzFSTJ?=
 =?us-ascii?Q?JUwDgjEM24CcJO51qusPID0P+IF0G9VYQgmN7W/Rc0C0DQPLNNrV7HAH2FNJ?=
 =?us-ascii?Q?cfoqSKfXKyguH8j9xRTt4C1Bu8PoIxfc3fq48YuqVWKV0v0eUwNC4lbsUA0/?=
 =?us-ascii?Q?ySk6Tc4+PSTTF0xb6vbPcE0zEIT/8TkqJFxMkWqTNfh2X1bHg1MFcH6svk6x?=
 =?us-ascii?Q?DwumNkg+hjR0ATCq6u6qY7L36CJcHFZ+k6U+YuCIMWlofjQNamDbFZ7EMugz?=
 =?us-ascii?Q?EawqPeR+cOmtwAcxsY6RD22S/tR3UgriXpYQBhGNJhl56kv8lhA478vZmuGW?=
 =?us-ascii?Q?dRGC1LIxc+fvUjvWPKTD43Xhpa0m83uFtd+q+KaA7IDCgo6wusv/C+HII4Gm?=
 =?us-ascii?Q?Kz1yI1t2hAJz8P8TdMGW5ZQBIgQr0bqF+mLLK7azGNqxJuwzitsdh0rqdsMX?=
 =?us-ascii?Q?p3lJWKmlPYb4/NXS6ZXRROVUOSn5AkEieNMdADKy5Gj+H5JXpe4zvMo12fUQ?=
 =?us-ascii?Q?F9HS5mc0lSOYyiENc4NbCAFueq58OP+pZtYNmCkZYdm3yZzu79+d0DSvrtr5?=
 =?us-ascii?Q?DMMqtqFj+3q5KJFTEmKWrFmikaZ8Tv33DzTNTzhoJg+Mpo0aXhe9BYCgM1yo?=
 =?us-ascii?Q?uFL4qfvsOZP11X3BTMk+hsDzqNaXAYRe6WGLPigbTBtMN3nY6YftnlYpEkrC?=
 =?us-ascii?Q?Dm6XHznetNZTPtc54Jmw7u7ws4I9PgeViZAAMNNpZoZXfd5p+Nh66OMe3BHx?=
 =?us-ascii?Q?Ht0qOFkRIVci1rBeU3eKEuQHiAblyC2z1LGsZbyr7zqK0iUyI6xjIuzzddWL?=
 =?us-ascii?Q?85ISNchnj1CKjHMTjl71pD28E/sZseXXK2cdYdObqau05fwVaqmcWHRGs3kI?=
 =?us-ascii?Q?8JtITm4/0/FlJfF4YB8xsng0BDNnXn81WBFycjS916JwMDGm+rsBcD6NTXQD?=
 =?us-ascii?Q?2+4LslCXtUeMI4f9Vv8gBbfx9z+JsARwuvub/rufeT7kna0BeeS/1dOgaisD?=
 =?us-ascii?Q?hP1mKuYCK+00lcVdGcX2lMvtqDjo7QmuGOAe4lltj3lzzmCywPtpTQqi6jDk?=
 =?us-ascii?Q?sqeUw8ZAaMBfNr/p3auPoNofb9FFN1D8TU/3B96ZVJhMcXET9rsq3a+vftOp?=
 =?us-ascii?Q?xcVyn7KSOvV3Bp8ngVIHN2UuMc/UMNb/e48A7dgzctqY+WJjDVpZe+uFolEx?=
 =?us-ascii?Q?Q4dYpu6QS6pojEIDt2E=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:58:00.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aef6b6-f24e-4dec-fc8d-08de05a98772
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929

Enable NVIDIA VRS (Voltage Regulator Specification) RTC device module.
It provides functionality to get/set system time, retain system time
across boot, wake system from suspend and shutdown state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v7:
- no changes

v6:
- no changes

v5:
- removed VRS MFD CONFIG
- changed VRS RTC CONFIG name

v4:
- no changes

v3:
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..a7fb6aa4062c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1283,6 +1283,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVIDIA_VRS10=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


