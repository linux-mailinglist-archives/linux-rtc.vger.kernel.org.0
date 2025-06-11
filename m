Return-Path: <linux-rtc+bounces-4274-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39471AD4CF7
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BED8164592
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B57231854;
	Wed, 11 Jun 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AlXBVFhM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A7229B38;
	Wed, 11 Jun 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627327; cv=fail; b=WLOa7630GmEhzCJtCnUjXey9/kgxS5CNvUhWp5g7mF1we4/vl5cZKrMKLTN3eS/SP3H7jWDUnFfa12ZVyKB3M+SZykAeOttgWdgqi+HgEBI/cXtBkH/srLFSYAdnceLSslwQTVb+/NHpMxdtB7SABH/V8rJtL+it3VipVOx9rw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627327; c=relaxed/simple;
	bh=eyxyUkKYEaSobZDdi5yXBPtAeo63fPt+p6Pfk+cd8EA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYDaZCUEfIskNdtxv38WLJ0V2bY+d59UgZuuSH5j0LdZG5mpzA6lvFVCzE8MyYHfqYGU8csozGnMUWaBcaX3TsWmBa9ZOhn3z1Gsp/LeBkfKjY5DwiNFIyPLNkBYV41q396VGhyNdUOXehfGzaKD1BaYuNvINEybuGzeApf59aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AlXBVFhM; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJCGeuvSpn65wzn31K5EELTGSG6EIAl487tg17e9G54ybFBolw146AkQhQCXR852kmcrMslpG8Gft62CdMk2J/Do1bqLvKlZ6l0qxvAOVYA4F517HqDtplaoaY9aQxDCZYz0LXO5rQ6azDenHxbSdMFj/Mnu1SCUlt23xPs1Gdu7/wgj0oPjjbUUuuv9gMW8Yp15CSH73xR3caxmbXKOA3hP82q8yhs7Q2jIx78s0ie4OHoa3Uwd7S9LLrUhRhlG04P/daEbw8ndMwERS+IiOVvbsWWzto2H7KbL/omQE4hA6Ya7ngiUOktxU0Hrr05twNjHKAVsHTeaWZx3u+WipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiGuhJy4mV2s7CWd649b0gvizTWwaUI4rAlDRyNkKSA=;
 b=LeCSpzUU/Sxh9n/hUSWONq493dvD+1RzDC0DrDltxbcgdGGFbIsJ2qrXaK3YGj/Sp28j8RFDA66VWKcC7vdclYCC52iDPtTpztxzkSs065dFCJQ62D1bZ4pLnaFFjYxJNwelwmiXAwYshPv8WwP+MBmGRpuCGhaFhbhUIoG0gDC9B4U+Ycx40Rvd0VFUTzu5RUpMfENQDMeDlaNpVbpeyyqEihsJxtN9B7xkOE5PbF9DGtPjNJtU83flT5o9ZU8eccUYgYNZzmCZkMJEeu4xm3cZXnt7GZXroBWAPiC0AWvkO/unWaUs5QBMu9B4/vkQcfHHMTvNdnyp+Pw0cJRM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiGuhJy4mV2s7CWd649b0gvizTWwaUI4rAlDRyNkKSA=;
 b=AlXBVFhMbfDGp3T085JOzBkA94kiE6oAzTZAXacs9DXXfzkZhsArK9hjUZIPoecjWasQnwOjCPk5rlB3akqKnwpOUudyqzbCzSN5nx8WPHwxCMUpEX3bjtj1VHzOUx7fcnz3xOYv0n9buupHXdtsDeV2v3chX/FLdBgneGkaAfXIkClwhdiA61094BPGlt6g4/IA3+X9dqnpYmI3q8N2mu2Q9qHHQSIvMMcBvUTAXJyvpmwhG84910b/9z4h86Gx1mGiJTbksONwfb7DlGyjLwUVdXhQmDf5+PW4ZJP2k/whPibZrnZgvCz5jNtujYLPVMurfiphVINTphpQ/Mqupg==
Received: from BL1P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::25)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 07:35:16 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::3b) by BL1P223CA0020.outlook.office365.com
 (2603:10b6:208:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 07:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:02 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:02 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:02 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 3/6] mfd: nvvrs: add NVVRS PSEQ MFD driver
Date: Wed, 11 Jun 2025 07:34:51 +0000
Message-ID: <20250611073454.978859-4-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e5ba68-c137-435c-1094-08dda8ba8259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oxKFEANxJZ6MrPM47St/6aDSB4GqI5dUAiyFTq/XxBQ5WBFqA4GhxU7w2e0B?=
 =?us-ascii?Q?oTRRw+GlarMXVkmkjsy9bFsofVzinVofptkqR7bhhwEUieWeca+wIFl4U38m?=
 =?us-ascii?Q?pCJ9iv8bI+eV34Cd0dCdI+cu2vrxHvkrA/MO4Wiw1EXKhLBySQx1WhBry+vw?=
 =?us-ascii?Q?J0qJ9BQlb8zHJzz/IOypVsyjnaKfiR2zxLyxz95AkmKMhWPLTxJnJLwf9MWA?=
 =?us-ascii?Q?Lq9I7T8St0s+XQKVsLRuAYx0v+4NA8K5+Klbarz0ic1VZMgqbeOq84DIkdUL?=
 =?us-ascii?Q?oOcRzyez1b2UyHobbo2qHidCoXDKcHdZhknHkPXBuMpdx6PpFLKkopERUhRy?=
 =?us-ascii?Q?h57HFHdtALRj4vPb8dI8jH27De/XZFGBdKXnv+WGSksTLT8H3KFrhySYLZ6+?=
 =?us-ascii?Q?H8y6MmXroaag+zj6js1foadHwXidvbri+sG4nFbpOblEANKZrGn7DyCgffkx?=
 =?us-ascii?Q?1GOZUX164QWUq1Oz8Y5acvydlcksFFBtE/KT/xhs28kcp2Pdx+cJ+uZWTRHj?=
 =?us-ascii?Q?pSR7YQxK7tSvlkxiLixWhb5UUqbsBX/dVFrJtQTf/p8oZTLxVMExyILKIM8T?=
 =?us-ascii?Q?uyLlj+zDfhpm6d4qUmwMLFKS477xoPsjD2mPodLla7mAt7qpy34RBYHAvKjF?=
 =?us-ascii?Q?wfmdT+XJejLS3hUWBtDXnpmzrs0VgACxw0UtimqDhyig61GywVOLb9bSZCR9?=
 =?us-ascii?Q?YBPfsNWklf9yzSd6u+NPQC21wsTC0HY4+WFDKAvsg2L3519Pytf0ST19XOjb?=
 =?us-ascii?Q?qCT2WA7dZwy2JoZnCqwLb1XoH6QKQjrdOSx8efalkcTvL+rMN1OZwmQMLnpV?=
 =?us-ascii?Q?Kuq6q8zqq54w3yFh2eYA/wcDtcpOs+n/vMmrGmzp4snx/UvGzXCpGHvCRA6L?=
 =?us-ascii?Q?CmCIjdD1NxZgvvoJO4uaA0AJel7vVfLGwKL4CRWIXKTWh6K498W1ABEPV69Q?=
 =?us-ascii?Q?PRbTHDaKUShMbzzXf9PQSXQfyuPttKdYbW82srvkTSefG8IKYc3gHHKxDt1G?=
 =?us-ascii?Q?ynnoR85bxqhdSXmxgHpwGmULsiCpQkvapbZJajgAbo91MJgEyhJICGgHYmeA?=
 =?us-ascii?Q?ER7u53m3xdVP4Nqju/ozP3blYRSM+DiqWOlcz+cn2qllTbtLrbxhaLDD/ybC?=
 =?us-ascii?Q?440ufSGHmdTtMmT03ayOXCL1BjXedPm7ZBupUeDDx2I/rdqXYyj4SFOyJcJN?=
 =?us-ascii?Q?/hce+M3hRX3TUUuEF5Z/coNTqldYC5P3jCJyLT8I4236VKoYbn5/1BLH5pIo?=
 =?us-ascii?Q?GHnkgXCznrc5dTrkVDWfaVrDMUhSCVUejPdKXEX43CzgjiwZj4fGdzFpWpIp?=
 =?us-ascii?Q?fqH4dR2jdPRbYIsxYKdH9L3jGqow4/RsFJYkAGCX0iRdJpxgnFpKSs9jR+qa?=
 =?us-ascii?Q?h1pmEKuN9at/6sVb5D7R5WH1A6VKsdTRTEBB/tKVc5Mp8EVp3yQKhiZFZTMx?=
 =?us-ascii?Q?wpeuE16h5dbu5vg8ZuM/fBSlWtmTgwuHHXFcU33nlq8tIn5tGdYqm73K1cKT?=
 =?us-ascii?Q?JEsh6OP2Qn41oP1lVArKbnGlU00nzuEZy99E?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:15.8669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e5ba68-c137-435c-1094-08dda8ba8259
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059

Add support for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device driver. NVIDIA VRS PSEQ provides 32kHz RTC support with
backup battery for system timing. It controls ON/OFF and suspend/resume
power sequencing of system power rails on below NVIDIA platforms:

- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v3:
- added rate limiting to interrupt clearing debug logs
- removed unnecessary braces in if blocks
- changed dependency from I2C=y to I2C in mfd Kconfig

v2:
- removed unnecessary error logs
- changed dev_info to dev_dbg
- changed dev_err to dev_err_probe
- fixed "of_match_table" assignment

 drivers/mfd/Kconfig                 |  12 ++
 drivers/mfd/Makefile                |   1 +
 drivers/mfd/nvidia-vrs-pseq.c       | 267 ++++++++++++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h | 127 +++++++++++++
 4 files changed, 407 insertions(+)
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..9a3451eebd6e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1437,6 +1437,18 @@ config MFD_SC27XX_PMIC
 	  This driver provides common support for accessing the SC27xx PMICs,
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
+config MFD_NVVRS_PSEQ
+	tristate "NVIDIA Voltage Regulator Specification Power Sequencer"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  Say Y here to add support for NVIDIA Voltage Regulator Specification
+	  Power Sequencer. NVVRS_PSEQ supports ON/OFF, suspend/resume sequence of
+	  system power rails. It provides 32kHz RTC clock support with backup
+	  battery for system timing.
+
 config RZ_MTU3
 	tristate "Renesas RZ/G2L MTU3a core driver"
 	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457..9b07289985b5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -183,6 +183,7 @@ obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
 obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
+obj-$(CONFIG_MFD_NVVRS_PSEQ)    += nvidia-vrs-pseq.o
 
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
diff --git a/drivers/mfd/nvidia-vrs-pseq.c b/drivers/mfd/nvidia-vrs-pseq.c
new file mode 100644
index 000000000000..cef7abac08b7
--- /dev/null
+++ b/drivers/mfd/nvidia-vrs-pseq.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * NVIDIA VRS Power Sequencer driver.
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nvidia-vrs-pseq.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+static const struct resource rtc_resources[] = {
+	DEFINE_RES_IRQ(NVVRS_PSEQ_INT_SRC1_RTC),
+};
+
+static const struct regmap_irq nvvrs_pseq_irqs[] = {
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RSTIRQ, 0, NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_OSC, 0, NVVRS_PSEQ_INT_SRC1_OSC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EN, 0, NVVRS_PSEQ_INT_SRC1_EN_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RTC, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_PEC, 0, NVVRS_PSEQ_INT_SRC1_PEC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_WDT, 0, NVVRS_PSEQ_INT_SRC1_WDT_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EM_PD, 0, NVVRS_PSEQ_INT_SRC1_EM_PD_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_INTERNAL, 0, NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_PBSP, 1, NVVRS_PSEQ_INT_SRC2_PBSP_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_ECC_DED, 1, NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_TSD, 1, NVVRS_PSEQ_INT_SRC2_TSD_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_LDO, 1, NVVRS_PSEQ_INT_SRC2_LDO_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_BIST, 1, NVVRS_PSEQ_INT_SRC2_BIST_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_RT_CRC, 1, NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_VENDOR, 1, NVVRS_PSEQ_INT_SRC2_VENDOR_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR0, 2, NVVRS_PSEQ_INT_VENDOR0_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR1, 2, NVVRS_PSEQ_INT_VENDOR1_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR2, 2, NVVRS_PSEQ_INT_VENDOR2_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR3, 2, NVVRS_PSEQ_INT_VENDOR3_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR4, 2, NVVRS_PSEQ_INT_VENDOR4_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR5, 2, NVVRS_PSEQ_INT_VENDOR5_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR6, 2, NVVRS_PSEQ_INT_VENDOR6_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR7, 2, NVVRS_PSEQ_INT_VENDOR7_MASK),
+};
+
+static const struct mfd_cell nvvrs_pseq_children[] = {
+	{
+		.name = "nvvrs-pseq-rtc",
+		.resources = rtc_resources,
+		.num_resources = ARRAY_SIZE(rtc_resources),
+	},
+};
+
+static const struct regmap_range nvvrs_pseq_readable_ranges[] = {
+	regmap_reg_range(NVVRS_PSEQ_REG_VENDOR_ID, NVVRS_PSEQ_REG_MODEL_REV),
+	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_LAST_RST),
+	regmap_reg_range(NVVRS_PSEQ_REG_EN_ALT_F, NVVRS_PSEQ_REG_IEN_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
+	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
+};
+
+static const struct regmap_access_table nvvrs_pseq_readable_table = {
+	.yes_ranges = nvvrs_pseq_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_readable_ranges),
+};
+
+static const struct regmap_range nvvrs_pseq_writable_ranges[] = {
+	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_INT_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_GP_OUT, NVVRS_PSEQ_REG_IEN_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
+	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
+};
+
+static const struct regmap_access_table nvvrs_pseq_writable_table = {
+	.yes_ranges = nvvrs_pseq_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_writable_ranges),
+};
+
+static const struct regmap_config nvvrs_pseq_regmap_config = {
+	.name = "nvvrs-pseq",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = NVVRS_PSEQ_REG_WDTKEY + 1,
+	.cache_type = REGCACHE_RBTREE,
+	.rd_table = &nvvrs_pseq_readable_table,
+	.wr_table = &nvvrs_pseq_writable_table,
+};
+
+static int nvvrs_pseq_irq_clear(void *irq_drv_data)
+{
+	struct nvvrs_pseq_chip *chip = (struct nvvrs_pseq_chip *)irq_drv_data;
+	struct i2c_client *client = chip->client;
+	u8 reg, val;
+	unsigned int i;
+	int ret = 0;
+
+	/* Write 1 to clear the interrupt bit in the Interrupt
+	 * Source Register, writing 0 has no effect, writing 1 to a bit
+	 * which is already at 0 has no effect
+	 */
+
+	for (i = 0; i < chip->irq_chip->num_regs; i++) {
+		reg = (u8)(chip->irq_chip->status_base + i);
+		ret = i2c_smbus_read_byte_data(client, reg);
+		if (ret) {
+			val = (u8)ret;
+			dev_dbg_ratelimited(chip->dev,
+					    "Clear IRQ reg 0x%02x=0x%02x\n",
+					    reg, val);
+
+			ret = i2c_smbus_write_byte_data(client, reg, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static struct regmap_irq_chip nvvrs_pseq_irq_chip = {
+	.name = "nvvrs-pseq-irq",
+	.irqs = nvvrs_pseq_irqs,
+	.num_irqs = ARRAY_SIZE(nvvrs_pseq_irqs),
+	.num_regs = 3,
+	.status_base = NVVRS_PSEQ_REG_INT_SRC1,
+	.handle_post_irq = nvvrs_pseq_irq_clear,
+};
+
+static int nvvrs_pseq_vendor_info(struct nvvrs_pseq_chip *chip)
+{
+	struct i2c_client *client = chip->client;
+	u8 vendor_id, model_rev;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_VENDOR_ID);
+	if (ret < 0)
+		return dev_err_probe(chip->dev, ret,
+				     "Failed to read Vendor ID\n");
+
+	vendor_id = (u8)ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_MODEL_REV);
+	if (ret < 0)
+		return dev_err_probe(chip->dev, ret,
+				     "Failed to read Model Rev\n");
+
+	model_rev = (u8)ret;
+
+	if (model_rev < 0x40) {
+		dev_err(chip->dev, "Chip revision 0x%02x is not supported!\n",
+			model_rev);
+		return -ENODEV;
+	}
+
+	dev_dbg(chip->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
+		vendor_id, model_rev);
+
+	return 0;
+}
+
+static int nvvrs_pseq_probe(struct i2c_client *client)
+{
+	const struct regmap_config *rmap_config;
+	struct nvvrs_pseq_chip *nvvrs_chip;
+	const struct mfd_cell *mfd_cells;
+	int n_mfd_cells;
+	int ret;
+
+	nvvrs_chip = devm_kzalloc(&client->dev, sizeof(*nvvrs_chip), GFP_KERNEL);
+	if (!nvvrs_chip)
+		return -ENOMEM;
+
+	/* Set PEC flag for SMBUS transfer with PEC enabled */
+	client->flags |= I2C_CLIENT_PEC;
+
+	i2c_set_clientdata(client, nvvrs_chip);
+	nvvrs_chip->client = client;
+	nvvrs_chip->dev = &client->dev;
+	nvvrs_chip->chip_irq = client->irq;
+	mfd_cells = nvvrs_pseq_children;
+	n_mfd_cells = ARRAY_SIZE(nvvrs_pseq_children);
+	rmap_config = &nvvrs_pseq_regmap_config;
+	nvvrs_chip->irq_chip = &nvvrs_pseq_irq_chip;
+
+	nvvrs_chip->rmap = devm_regmap_init_i2c(client, rmap_config);
+	if (IS_ERR(nvvrs_chip->rmap))
+		return dev_err_probe(nvvrs_chip->dev, PTR_ERR(nvvrs_chip->rmap),
+				     "Failed to initialise regmap\n");
+
+	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
+	if (ret < 0)
+		return ret;
+
+	nvvrs_pseq_irq_chip.irq_drv_data = nvvrs_chip;
+	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap,
+				       client->irq, IRQF_ONESHOT | IRQF_SHARED,
+				       0, &nvvrs_pseq_irq_chip,
+				       &nvvrs_chip->irq_data);
+	if (ret < 0)
+		return dev_err_probe(nvvrs_chip->dev, ret,
+				     "Failed to add regmap irq\n");
+
+	ret = devm_mfd_add_devices(nvvrs_chip->dev, PLATFORM_DEVID_NONE,
+				   mfd_cells, n_mfd_cells, NULL, 0,
+				   regmap_irq_get_domain(nvvrs_chip->irq_data));
+	if (ret < 0)
+		return dev_err_probe(nvvrs_chip->dev, ret,
+				     "Failed to add MFD children\n");
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int nvvrs_pseq_i2c_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	/*
+	 * IRQ must be disabled during suspend because if it happens
+	 * while suspended it will be handled before resuming I2C.
+	 *
+	 * When device is woken up from suspend (e.g. by RTC wake alarm),
+	 * an interrupt occurs before resuming I2C bus controller.
+	 * Interrupt handler tries to read registers but this read
+	 * will fail because I2C is still suspended.
+	 */
+	disable_irq(client->irq);
+
+	return 0;
+}
+
+static int nvvrs_pseq_i2c_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	enable_irq(client->irq);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops nvvrs_pseq_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(nvvrs_pseq_i2c_suspend, nvvrs_pseq_i2c_resume)
+};
+
+static const struct of_device_id nvvrs_dt_match[] = {
+	{ .compatible = "nvidia,vrs-pseq" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, nvvrs_dt_match);
+
+static struct i2c_driver nvvrs_pseq_driver = {
+	.driver = {
+		.name = "nvvrs_pseq",
+		.pm = &nvvrs_pseq_pm_ops,
+		.of_match_table = nvvrs_dt_match,
+	},
+	.probe = nvvrs_pseq_probe,
+};
+
+module_i2c_driver(nvvrs_pseq_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Voltage Regulator Specification Power Sequencer Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nvidia-vrs-pseq.h b/include/linux/mfd/nvidia-vrs-pseq.h
new file mode 100644
index 000000000000..7e6f3aa940e7
--- /dev/null
+++ b/include/linux/mfd/nvidia-vrs-pseq.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved
+
+#ifndef _MFD_NVIDIA_VRS_PSEQ_H_
+#define _MFD_NVIDIA_VRS_PSEQ_H_
+
+#include <linux/types.h>
+
+/* Vendor ID */
+#define NVVRS_PSEQ_REG_VENDOR_ID		0x00
+#define NVVRS_PSEQ_REG_MODEL_REV		0x01
+
+/*  Interrupts and Status registers */
+#define NVVRS_PSEQ_REG_INT_SRC1			0x10
+#define NVVRS_PSEQ_REG_INT_SRC2			0x11
+#define NVVRS_PSEQ_REG_INT_VENDOR		0x12
+#define NVVRS_PSEQ_REG_CTL_STAT			0x13
+#define NVVRS_PSEQ_REG_EN_STDR1			0x14
+#define NVVRS_PSEQ_REG_EN_STDR2			0x15
+#define NVVRS_PSEQ_REG_EN_STRD1			0x16
+#define NVVRS_PSEQ_REG_EN_STRD2			0x17
+#define NVVRS_PSEQ_REG_WDT_STAT			0x18
+#define NVVRS_PSEQ_REG_TEST_STAT		0x19
+#define NVVRS_PSEQ_REG_LAST_RST			0x1A
+
+/* Configuration Registers */
+#define NVVRS_PSEQ_REG_EN_ALT_F			0x20
+#define NVVRS_PSEQ_REG_AF_IN_OUT		0x21
+#define NVVRS_PSEQ_REG_EN_CFG1			0x22
+#define NVVRS_PSEQ_REG_EN_CFG2			0x23
+#define NVVRS_PSEQ_REG_CLK_CFG			0x24
+#define NVVRS_PSEQ_REG_GP_OUT			0x25
+#define NVVRS_PSEQ_REG_DEB_IN			0x26
+#define NVVRS_PSEQ_REG_LP_TTSHLD		0x27
+#define NVVRS_PSEQ_REG_CTL_1			0x28
+#define NVVRS_PSEQ_REG_CTL_2			0x29
+#define NVVRS_PSEQ_REG_TEST_CFG			0x2A
+#define NVVRS_PSEQ_REG_IEN_VENDOR		0x2B
+
+/* RTC */
+#define NVVRS_PSEQ_REG_RTC_T3			0x70
+#define NVVRS_PSEQ_REG_RTC_T2			0x71
+#define NVVRS_PSEQ_REG_RTC_T1			0x72
+#define NVVRS_PSEQ_REG_RTC_T0			0x73
+#define NVVRS_PSEQ_REG_RTC_A3			0x74
+#define NVVRS_PSEQ_REG_RTC_A2			0x75
+#define NVVRS_PSEQ_REG_RTC_A1			0x76
+#define NVVRS_PSEQ_REG_RTC_A0			0x77
+
+/* WDT */
+#define NVVRS_PSEQ_REG_WDT_CFG			0x80
+#define NVVRS_PSEQ_REG_WDT_CLOSE		0x81
+#define NVVRS_PSEQ_REG_WDT_OPEN			0x82
+#define NVVRS_PSEQ_REG_WDTKEY			0x83
+
+/* Interrupt Mask */
+#define NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_SRC1_OSC_MASK		BIT(1)
+#define NVVRS_PSEQ_INT_SRC1_EN_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_SRC1_RTC_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_SRC1_PEC_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_SRC1_WDT_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_SRC1_EM_PD_MASK		BIT(6)
+#define NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK	BIT(7)
+#define NVVRS_PSEQ_INT_SRC2_PBSP_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK	BIT(1)
+#define NVVRS_PSEQ_INT_SRC2_TSD_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_SRC2_LDO_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_SRC2_BIST_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_SRC2_VENDOR_MASK		BIT(7)
+#define NVVRS_PSEQ_INT_VENDOR0_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_VENDOR1_MASK		BIT(1)
+#define NVVRS_PSEQ_INT_VENDOR2_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_VENDOR3_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_VENDOR4_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_VENDOR5_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_VENDOR6_MASK		BIT(6)
+#define NVVRS_PSEQ_INT_VENDOR7_MASK		BIT(7)
+
+/* Controller Register Mask */
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_SHDN		(BIT(0) | BIT(1))
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_ACT		BIT(2)
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_INT		BIT(3)
+#define NVVRS_PSEQ_REG_CTL_2_EN_PEC		BIT(0)
+#define NVVRS_PSEQ_REG_CTL_2_REQ_PEC		BIT(1)
+#define NVVRS_PSEQ_REG_CTL_2_RTC_PU		BIT(2)
+#define NVVRS_PSEQ_REG_CTL_2_RTC_WAKE		BIT(3)
+#define NVVRS_PSEQ_REG_CTL_2_RST_DLY		0xF0
+
+enum {
+	NVVRS_PSEQ_INT_SRC1_RSTIRQ,		/* Reset or Interrupt Pin Fault */
+	NVVRS_PSEQ_INT_SRC1_OSC,		/* Crystal Oscillator Fault */
+	NVVRS_PSEQ_INT_SRC1_EN,			/* Enable Output Pin Fault */
+	NVVRS_PSEQ_INT_SRC1_RTC,		/* RTC Alarm */
+	NVVRS_PSEQ_INT_SRC1_PEC,		/* Packet Error Checking */
+	NVVRS_PSEQ_INT_SRC1_WDT,		/* Watchdog Violation */
+	NVVRS_PSEQ_INT_SRC1_EM_PD,		/* Emergency Power Down */
+	NVVRS_PSEQ_INT_SRC1_INTERNAL,		/* Internal Fault*/
+	NVVRS_PSEQ_INT_SRC2_PBSP,		/* PWR_BTN Short Pulse Detection */
+	NVVRS_PSEQ_INT_SRC2_ECC_DED,		/* ECC Double-Error Detection */
+	NVVRS_PSEQ_INT_SRC2_TSD,		/* Thermal Shutdown */
+	NVVRS_PSEQ_INT_SRC2_LDO,		/* LDO Fault */
+	NVVRS_PSEQ_INT_SRC2_BIST,		/* Built-In Self Test Fault */
+	NVVRS_PSEQ_INT_SRC2_RT_CRC,		/* Runtime Register CRC Fault */
+	NVVRS_PSEQ_INT_SRC2_VENDOR,		/* Vendor Specific Internal Fault */
+	NVVRS_PSEQ_INT_VENDOR0,			/* Vendor Internal Fault Bit 0 */
+	NVVRS_PSEQ_INT_VENDOR1,			/* Vendor Internal Fault Bit 1 */
+	NVVRS_PSEQ_INT_VENDOR2,			/* Vendor Internal Fault Bit 2 */
+	NVVRS_PSEQ_INT_VENDOR3,			/* Vendor Internal Fault Bit 3 */
+	NVVRS_PSEQ_INT_VENDOR4,			/* Vendor Internal Fault Bit 4 */
+	NVVRS_PSEQ_INT_VENDOR5,			/* Vendor Internal Fault Bit 5 */
+	NVVRS_PSEQ_INT_VENDOR6,			/* Vendor Internal Fault Bit 6 */
+	NVVRS_PSEQ_INT_VENDOR7,			/* Vendor Internal Fault Bit 7 */
+};
+
+struct nvvrs_pseq_chip {
+	struct device *dev;
+	struct regmap *rmap;
+	int chip_irq;
+	struct i2c_client *client;
+	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip;
+	void *irq_drv_data;
+};
+
+#endif /* _MFD_NVIDIA_VRS_PSEQ_H_ */
-- 
2.43.0


