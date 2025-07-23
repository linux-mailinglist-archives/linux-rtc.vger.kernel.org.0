Return-Path: <linux-rtc+bounces-4545-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4FB0F32F
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 15:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B362A3A690F
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B872E88AE;
	Wed, 23 Jul 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PvKsGuq3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B72E54C9;
	Wed, 23 Jul 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275853; cv=fail; b=DRZHT6iGiAPiV6ZaYPpB2gqTT3T+1lAxQrV+qEDq8xC8T+F2Xzx+xpp/rd8kcAvywhrr8XEDt2dIYo4jCUZb6vt8/VlnjKg1t0hocTiAa94yGVB1rxeytqoI4bTOj0RximHvYLwL4+Xz/OeWNmhT5CESHTA7Im/z+gpM4+6PjLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275853; c=relaxed/simple;
	bh=aIAz3v6KoIlcgvh0T9VSWIPyJAnz3F3X5fExTAwaeJg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ocVUzzYlfdyBZ1UsHM2IbMZFyVvh3InQF40AYxQIhOcyZ7xSNjjBMALSaMpc+zeDO5AVb93VSqyzdlfYY44RXDH+Ia8al9icdzu5hA+joWGtWqq2BZ7xg+N4xMcZzKN5FyANnug2etdECu3PCa/yxc2KinHl+mOiah4Hx0aDdjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PvKsGuq3; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpXu6JI3x4jEQXCcYG6zl7UuoMshdlWBHzU8DIeFvA/HENASkt+dKA0L1A0Yw6vJd4Fmfkou5lgY1dFUi7/B8+1EIeLMZOPpWFZUAmkauW5uqhg88pfzZy5ANKIUYOILeiltg3pzgtyUluErdNOpFj7GbI3bxdmF01b3kcWyOyuO2fa9qevka3Fn9yTZrPO6nPLUupBT4w8tXrqzuCRzMuLbRNCbkyPt0fIgubvbCm95Q/i4563JiRBRC/O+GKAk3F87q7GMCb+CDO8Bwq7EVP0opcaOaJSBJ7oTPX/w8+KWeK5QpNnLTFngWw08luZdlX0l7sgwJsOiG/15CYKE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+JVOfU7GAElVl7eD0hfqiiaS3b9A51dtuNxrbW1zH4=;
 b=WsQjE3RccZyZTUE+t7ZiLpaRZlZIMAsb4RIK0F8sqO+hBi1hbrur1s5mWft8oDjvhmS7k+qwktov6/4LRWTXofhwpK77NFVGC2mPbhID1kW2k3Q5cgjacPVF0rSY/0FyCBWsHtW8Q8yDjcBeLx3vg3l2QguvJvFnA+nPmrhVGDauC6pas5t5FEfhLQSTFJMb+mkrf4YJoGxyb7pnZ7ZXT2urMw0fEDzsOoGEt5OnQ+JSGFleRrh/komAngHpJ+Uf7ZKqArWxjbfE1MAvSD9raj79BuprOIsqAvpdPiNDVm8h4vfT41ycZetNCKr7FxJcAuQfPTMlJi+//nYrfQWFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+JVOfU7GAElVl7eD0hfqiiaS3b9A51dtuNxrbW1zH4=;
 b=PvKsGuq3OmywGGdORh16fQ+xtVLrq05j/Qr0u0gi1IbESheCg3I5Z4qmqS50/CSMf4NrYbBYQ+qmWn4f3yKGYgiy/KjLQlyv660f7/mreIHa3X0jKj38OEAZXKg9DO8w75FKkZmx8/Geu6gFqYSwNqH0BJoKBlMGZ6utiaMB3Lf52b3ZwrSCChjj31yqK6D9hzJ2xl4c0nMfR0ZtoYX3Fw+x8ab5Z+SJjbdT07824SAx69mMkVv08uW18n9fJ32mUZ2lkUFhdwIaIXX59uucCOhcMWTyHwCyDMvDpZsTMT+LTviREwJ9Fa2yEFvXS/EiZV68tcjG+Ok10xDTHkPkRA==
Received: from SN6PR08CA0006.namprd08.prod.outlook.com (2603:10b6:805:66::19)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 13:04:02 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::3c) by SN6PR08CA0006.outlook.office365.com
 (2603:10b6:805:66::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 13:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:04:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 06:03:45 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Jul 2025 06:03:45 -0700
Received: from build-shgarg-noble-20250715.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Wed, 23 Jul 2025 06:03:45 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v5 0/4] Add NVIDIA VRS RTC support
Date: Wed, 23 Jul 2025 13:03:39 +0000
Message-ID: <20250723130343.2861866-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 84974357-6775-4ec3-04cf-08ddc9e965a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RCemnTy/JFVp80q3ovR9wCVhRVJW72NNY8fjV2TDm+Lz4abZQUMfOPDFyGWC?=
 =?us-ascii?Q?OnbJ7+AvzpDP+2QIb8B8KO+CIdWZUDce/BVntAU8xrOjbEBK2+QxbfeX0fRh?=
 =?us-ascii?Q?R6FadBL3H2x1g9jJAXsZ3jU786KLJHY63EB8GhML8xFuI5rsv2kUWP1paXi2?=
 =?us-ascii?Q?HCrJlKgrDBe/ZorN5uP0qsI6sutpPMZmmjKMjEEQo9JiQMGwMMBvdzUFP+vh?=
 =?us-ascii?Q?RiaW1JCUZALGYaH8YblrVRRpftIYFC2Ua6/f0RqF7CFbUfQfd7RTFgFj37Sk?=
 =?us-ascii?Q?jGDNjXdMUaU4APC9/v4CQllraAk4u8vLQyjk4vUtgvHxOlIRUavtOCFDAtlo?=
 =?us-ascii?Q?honmed8cdwIcj6pzxdKTZpaXEMjOuWTwxIkkal2etqNSnYiyGJmv04mb4eRi?=
 =?us-ascii?Q?LULtrbcMHcK2RZaLqihST/aVsv3MPQpkmbSAfqqMKevIo3p4NQkq6dBaTLJ+?=
 =?us-ascii?Q?dfUC/IhPEHnBMZaZbNhB9J1yIdX3Wy7Ne8lMkiiIi7f6BDqvfr9JvKbzqsMq?=
 =?us-ascii?Q?PhUJ6WXSYmHPRIh3f7kxB7/e7OeSoZoVi8D/tESLdxYMupcflN4zLfmVBEHK?=
 =?us-ascii?Q?DYvGhVv5Fbv51bN67plvmpbuz5IVASZtkHKCiPbqqu/Jv7deuw4YS8vm9+Ws?=
 =?us-ascii?Q?JPjAZ/lJxGq12L759ZWLAcQTZALqqEkJKNwJSINR/JOpzRCfA0isAGmIeZ8L?=
 =?us-ascii?Q?odRu3qTzkR4VSiesHl7IV8OB1gLX2zMrpzzT01eBZca59FFQTN+oJ4fiJ3N3?=
 =?us-ascii?Q?2JIlCNaHuv5vSN8h6hiTzKyE0Hm/e5jAIl29nPtrsNeDrbNE9+AIqswiXrBn?=
 =?us-ascii?Q?9Ub5aG7IDHQWQXaXFN34DfdKMHFd/S468roVCDsLHStd3DMFNWOn+2EoLI+g?=
 =?us-ascii?Q?pbx8/L+1ow1O1vH8SjPwxHPv84ln5yH7PTQ75Fi24MuwpsdOW4XR7qh6zkG8?=
 =?us-ascii?Q?+IrezQ9ViQDmWfNML1krgHULwQFzn0iiD9kuQZ6nLZUlb6i57iageBcGwqDI?=
 =?us-ascii?Q?Hyq6XfLzKoKkVsenbEG80D5d9hxEioDzwNb/R63wplFUJ4aVOtNSGyKyi8SF?=
 =?us-ascii?Q?LF6HoNThPkX67Ovv5h+YJYmlIjroakZFx/Eu8vvIsDRWSn748xtHFZgao7v8?=
 =?us-ascii?Q?pFV/iRuYSgHHR+2uA7QDT3+szR8AbmxdPnAD6OJ9YyjVKMcpn//KIAaCOxTH?=
 =?us-ascii?Q?GR7y4/0UQo+XY4lEUhg/TsVT+vgj/SlF4lvhBKHz2ZoSwgmuKg6OlhZyTa4S?=
 =?us-ascii?Q?01VGQ18wLgIGUlyuDT8RV3DCcgE+/53HswIV+QxrmWwj8VjXW7zQFSikJCZX?=
 =?us-ascii?Q?Wo7Y5k4/1YdYjMR/SILnZVpaGxMDXugoHOHj4MeCdeRp4OhdcRXelg3jH0mC?=
 =?us-ascii?Q?ofzyX/5TM3hmFaOY7hA4q2LsbEdeCr5/KIWqwCkOvzJmEiKqqjzZKPCowGbH?=
 =?us-ascii?Q?sqbToMTUZn3svOhC1aSEVt4eyLAoehZC/XcfBRvXFO2DycoyHASyw016kvap?=
 =?us-ascii?Q?jpG+BiyYg/9krbY+JqzbDrxLMkv8rZnmu9Dc?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:04:02.5114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84974357-6775-4ec3-04cf-08ddc9e965a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C

This patch series adds support for NVIDIA's Voltage Regulator Specification
(VRS) RTC device. It provides following features:
- read/set system time
- 32kHz clock support with backup battery input to retain system time
  across boot
- alarm functionality to wake system from suspend and shutdown state

The series includes:
- Device tree bindings for the VRS RTC
- VRS device tree nodes for NVIDIA platforms
- VRS RTC device driver
- Configuration updates to enable the driver

Changes in v5:
- moved device tree bindings from mfd to rtc
- changed dtb node name to rtc@3c
- removed VRS MFD driver
- moved VRS common functions to RTC driver
- removed unused register definitions from header
- changed driver compatible to "nvidia,vrs10-rtc"

Changes in v4:
- fixed device tree node name to "pmic@3c" in dtb aliases

Changes in v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation in dt-bindings
- added rate limiting to interrupt clearing debug logs
- removed unnecessary braces in if blocks
- changed dependency from I2C=y to I2C in mfd Kconfig
- fixed return value in RTC driver function calls
- fixed sizeof(*variable) inside rtc driver devm_kzalloc
- switch to devm_device_init_wakeup() for automatic cleanup

Changes in v2:
- fixed, copyrights, definitions and dtb node in dt-bindings
- removed unnecessary logs from MFD and RTC driver
- fixed RTC allocation and registration APIs
- removed unnecessary functions in RTC driver
- used rtc_lock/unlock in RTC irq handler
- added alias to assign VRS RTC as RTC0
- added driver entry in MAINTAINERS
- few other miinor changes done in drivers

Shubhi Garg (4):
  dt-bindings: rtc: Document NVIDIA VRS RTC
  arm64: tegra: Add device-tree node for NVVRS RTC
  rtc: nvvrs: add NVIDIA VRS RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ RTC

 .../bindings/rtc/nvidia,vrs10-rtc.yaml        |  57 ++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |   9 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c                | 508 ++++++++++++++++++
 include/linux/rtc/rtc-nvidia-vrs10.h          |  78 +++
 9 files changed, 688 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c
 create mode 100644 include/linux/rtc/rtc-nvidia-vrs10.h

-- 
2.43.0


