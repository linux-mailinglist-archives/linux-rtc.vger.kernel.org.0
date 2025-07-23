Return-Path: <linux-rtc+bounces-4546-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA450B0F334
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 15:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0AE58432B
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 13:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A542E88B4;
	Wed, 23 Jul 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rznCI1Qk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F252E7648;
	Wed, 23 Jul 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275856; cv=fail; b=BwWgaDeSGY2apTePAsvGXjWfS/RnFwNkLwZf9w5SRd5/OgI1xp0AvV51FsAJAm716a3/n/malDK2/LMBuKMkTrV+VZdMGcNEoyeZtc8f6lKfQJGCxc+JvR1SIcOnapcWwvrKT1HVx+8c5psAE+B/kIf8uA1MtFRS2w9OvY92ZyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275856; c=relaxed/simple;
	bh=TuKHjhsxS9B5wTOPEHx2B+yEYnc2oG58gbss50i2r3A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exRlKYnT3VtygpTTQ/DOB5jj/o3wXUzUyHFLzXVz40Yq6O5ktMmr5JCS58ryyik1WBECiOIuYGxzhMg/RW2qT3mGd4mO5ynKbGSCw4oqqFN5n3iayNGFDG7Ra9lJV8Ko0cfbgLps/enxV3z+peybnK5zC+vD7J48z/xJ7PqdyS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rznCI1Qk; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtkJP9Ja2M3LsiYHAnZJUsqbk1BVLOvs7dBXcrIBr/BKdijaMCkYyElFT/E62HfJ8NrcTdZUvcwkw/Rg4FmPqst5nqYMi21fxoMXRNh1VLyjr3lp1CmT/2xCb9kh8gZEXW1qVWYHRxlUwt1LWNjQIJVQevzsp7vge0MJb3yJLdHqDv6TAk5VNesUG0iyas7xenkyvqnpxwTCmYRU9tkO4kyquLUP9/fxO+YvciZ3M0cJat5CaN7gqllIBaqZjVkfzuNdNWumCI+c7KH4N1Qzp8E4h7eGyDTTC424dszr8UispQly8+nlEbKzxtHtFo4XaX4mCZhzuDg7TA3XnZp1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaNrghf/apmMhlGc0WC3NekSbUTn65fpoMhFBoEhYzA=;
 b=Zfxb6PvOjuwQ+GMN9mcdbDp8waeMM63vVbHZkWZVsxsxZ8T+X+nxaBI6xkxbiqawp5K5YaCC83vwA3487jSax9uCQhx6L9cHkU4/jwzOKa8LnO72qfddd7mPfoZLVS8OrtXQKhkVO9Gl/xTk42oWiLKsX9mmCsLM5RYujNxjKRIDqu6wnigZYQe+IriBWzMM71/yPwBNyk2W9+eK5QzgEPlLqvpLdqwOTiaDNlJQOtmPYDZXkDiu3p3aVkwFlNOd2slFyUp8+sXjI2ifdXalh2KmsAusm8HVBXS6UGux0eKf3a3DfZgACupBXr1/tMKvaCjeF/C+jddAyrnt8E67Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaNrghf/apmMhlGc0WC3NekSbUTn65fpoMhFBoEhYzA=;
 b=rznCI1QkGBhwvw8pDuEL+fZkQHRlJ9Jbur/I2RNKvb9suhLn84pRCsi94JTz7t0W04it0GM+bJK2rJwHPgMPPi3O1l6btPLgQTS615wxA9+Fk0EQYJSA0q2Ly8c1J0q0L7gmAq7uQJx5CXcnTsvah+QgLRrCHey9yOnbrHBYRevMEP1RCZiR+oL/RWcbU6/PkuGKjA77f1nOjqYDgcMdkEuWXbmCNgIR7MWmGq92xtCp8H50KFavfy5ypFt/de791UqabAe//8ojCvtaKbbTbt4I2ZF0+pp8BPUNzJzH4TXhJe7Cw8WfweEK0J1SZcNxhCOBeXTHvxa7EVYE/LhvAg==
Received: from PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::10)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 13:04:08 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::75) by PH5P222CA0008.outlook.office365.com
 (2603:10b6:510:34b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Wed,
 23 Jul 2025 13:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:04:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 06:03:50 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Jul 2025 06:03:50 -0700
Received: from build-shgarg-noble-20250715.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Wed, 23 Jul 2025 06:03:50 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v5 3/4] rtc: nvvrs: add NVIDIA VRS device driver
Date: Wed, 23 Jul 2025 13:03:42 +0000
Message-ID: <20250723130343.2861866-4-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 39034596-181f-4ec4-83b0-08ddc9e968c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sy8Rkc1uUOVn+7ldGKBBvKMvWi8sMyL2oiZDsORYo/bikD09lX8EQQ2PXXQw?=
 =?us-ascii?Q?llIp8cl4QDJVLt1759zpDttDSY9VX9WyU2x+C8gasCVWH+EDenLtLa13lmRe?=
 =?us-ascii?Q?K67tpgTy8m86hvWWXdXnfC1aleKQsugHihxWpVmPITpqY3COrz6ZyhHFE6Qn?=
 =?us-ascii?Q?hGNo2TOszlIXD9o1AwqC7YgPRG1LOrY0KwY5UeAM4rL+cGAJyzuNvp/5WkYe?=
 =?us-ascii?Q?go8znE3G5HkZBO0djFqV2IvoK3vZNrh402f4m4TpKwcshxktPP6Vx7ophzfx?=
 =?us-ascii?Q?dYIdMUDDKINJFHjDKmHEIqRR91ccjbKxt7NHWmd4qXtP5WvmaJ8bjy+pLh8v?=
 =?us-ascii?Q?CswXOhX6m1K3nUKOdQPu9FpF6XwNW/leJjbQ/Cu/9twIQKWJ4HC+NV6AZxrU?=
 =?us-ascii?Q?ycg+A2dSv9vHrf5xeh3sOGGjF4CtgM66aBXdy3+F/OerxE7aV+Y7H1U+VXwt?=
 =?us-ascii?Q?IQTuPvV15Oy3PocgL8R4E0WLyigqN1ucIw4Dop4A/V7lmBgiZPc+0MCR3kek?=
 =?us-ascii?Q?NjvxRBFy6U7kuWWDj8kKUDO6PTDv38Hi9iUuTrRNrB5lcA+f+eq1ruLS/gR9?=
 =?us-ascii?Q?ZjCqrEPYCEOoLMLhPySic/t8nsD08c1XL1XbiU29NGeGXQCwVRp1tTvwiwza?=
 =?us-ascii?Q?uArir10WoW2m+D8Rvy31r+WmeYbsHd/f+lXZO3/mNMP/fNengzikK3YyvW/P?=
 =?us-ascii?Q?o172AEW57Gahkv6DI2Ina5NknrAY1EgE/+76AsQeF8Rhw3+3H69BfBpci+u/?=
 =?us-ascii?Q?9RQrYNoamVoWAAVzfkkQh50z71ERlLkAlYFM/I6LOrhfEvWEEKOaQ8HZLkgh?=
 =?us-ascii?Q?5Y8x7OSXuj8B3ADU4zcH+C1f4ajRZ8FIznR/w5Ly3h9dUiMW4Xg1pLgWZdxI?=
 =?us-ascii?Q?FG0A9ZfAOlSAzvqAGQX3lK2RZqtUg6jZDN/4qN+BKA15ruVCQRdZl/YsoR4J?=
 =?us-ascii?Q?LozEj8q5VvX/Jr/+ikq43INS1ALpIP072JRgV3eNek6vyxaa5qp6izwz9NeT?=
 =?us-ascii?Q?OyYcXsoUtTQLVkILApKD+qpisyXOZp3tsOXdMLg2XP0XQCjaUelMiiKMAmpF?=
 =?us-ascii?Q?TUm7Qpsyoe0urxpBOZiRpwvv332gc4OQPemE0xf0jIKkFyXJ8d7owlGId0Ce?=
 =?us-ascii?Q?CplsQz2oS2k0YEqrcg8zolVmRf6cYn5H5pEa6v2W+9Rt8idbr69bHLjv10Ba?=
 =?us-ascii?Q?keSis/osSOJMoHYEDa/4DIzPNNiRfRAu/Eg1+lzKh+3I2ncAfn7RQ81vijx8?=
 =?us-ascii?Q?VQONtOBsZqSgDpTLKzJVmhtVmEio/FyV7rwOXguP17Ryj/0tP6djvspEKy2Z?=
 =?us-ascii?Q?iyPLdwYtQVBww1DkARnl+03HRq/IcLS0TlL2/YnpWmllRnWqbKuoxQl0+jAJ?=
 =?us-ascii?Q?MhtRoldQcGdmdsymIK/6lzs/48faOeEFyBCl9e93FsUGdkbzWpP8FPM1TRfg?=
 =?us-ascii?Q?l0zC070S1exjcu4cb/ET1hUlH5iiO89p7H/6klFkVEm23QtAONJLdC/zpw2q?=
 =?us-ascii?Q?4D6vOxulGIwSZxO6VMJ+5AZPn8RIl6zSJceK?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:04:07.7521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39034596-181f-4ec4-83b0-08ddc9e968c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

Add support for NVIDIA VRS (Voltage Regulator Specification) RTC device
driver. The driver provides functionality to get/set system time, retain
system time across boot, wake system from suspend and shutdown state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v5:
- removed unused register definitions from header
- added VRS to maintainers list
- removed MFD dependency from Kconfig
- improved driver filename and CONFIG name
- handle all VRS interrupts in RTC driver
- validate chip vendor info during RTC probe
- clear any pending IRQs during RTC probe

v4:
- no changes

v3:
- fixed return value in RTC read_time and read_alarm functions
- fixed sizeof(*variable) inside rtc driver devm_kzalloc
- switch to devm_device_init_wakeup() for automatic cleanup

v2:
- removed regmap struct since it is not required
- removed rtc_map definition to directly use register definition
- removed unnecessary dev_err logs
- fixed dev_err logs to dev_dbg
- used rtc_lock/unlock in irq handler
- changed RTC allocation and register APIs as per latest kernel
- removed nvvrs_rtc_remove function since it's not required

 MAINTAINERS                          |   8 +
 drivers/rtc/Kconfig                  |   9 +
 drivers/rtc/Makefile                 |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c       | 508 +++++++++++++++++++++++++++
 include/linux/rtc/rtc-nvidia-vrs10.h |  78 ++++
 5 files changed, 604 insertions(+)
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c
 create mode 100644 include/linux/rtc/rtc-nvidia-vrs10.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ffb35359f1e2..944ef074352d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18008,6 +18008,14 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS RTC DRIVER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
+F:	drivers/rtc/rtc-nvidia-vrs10.c
+F:	include/linux/rtc/rtc-nvidia-vrs10.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613ce..4a573919d4fa 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,15 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_NVIDIA_VRS10
+	tristate "NVIDIA VRS10 RTC device"
+	help
+	  If you say yes here you will get support for the battery backed RTC device
+	  of NVIDIA VRS (Voltage Regulator Specification). The RTC is connected via
+	  I2C interface and supports alarm functionality.
+	  This driver can also be built as a module. If so, the module will be called
+	  rtc-nvidia-vrs10.
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 4619aa2ac469..4311b42438ea 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
+obj-$(CONFIG_RTC_DRV_NVIDIA_VRS10)+= rtc-nvidia-vrs10.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
diff --git a/drivers/rtc/rtc-nvidia-vrs10.c b/drivers/rtc/rtc-nvidia-vrs10.c
new file mode 100644
index 000000000000..54b4afe89afb
--- /dev/null
+++ b/drivers/rtc/rtc-nvidia-vrs10.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NVIDIA Voltage Regulator Specification RTC
+ *
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/rtc.h>
+#include <linux/rtc/rtc-nvidia-vrs10.h>
+
+#define ALARM_RESET_VAL		0xffffffff
+#define NVVRS_MIN_MODEL_REV	0x40
+
+struct nvvrs_rtc_info {
+	struct device          *dev;
+	struct i2c_client      *client;
+	struct rtc_device      *rtc;
+	unsigned int           irq;
+	/* Mutex to protect RTC operations */
+	struct mutex           lock;
+};
+
+static int nvvrs_update_bits(struct nvvrs_rtc_info *info, u8 reg,
+			     u8 mask, u8 value)
+{
+	int ret;
+	u8 val;
+
+	ret = i2c_smbus_read_byte_data(info->client, reg);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	val &= ~mask;
+	val |= (value & mask);
+
+	return i2c_smbus_write_byte_data(info->client, reg, val);
+}
+
+static int nvvrs_rtc_write_alarm(struct i2c_client *client, u8 *time)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_REG_RTC_A3, time[3]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_REG_RTC_A2, time[2]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_REG_RTC_A1, time[1]);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, NVVRS_REG_RTC_A0, time[0]);
+}
+
+static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
+{
+	int ret;
+
+	/* Set RTC_WAKE bit for autonomous wake from sleep */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_WAKE,
+				NVVRS_REG_CTL_2_RTC_WAKE);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set RTC_PU bit for autonomous wake from shutdown */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
+				NVVRS_REG_CTL_2_RTC_PU);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nvvrs_rtc_disable_alarm(struct nvvrs_rtc_info *info)
+{
+	struct i2c_client *client = info->client;
+	u8 val[4];
+	int ret;
+
+	/* Clear RTC_WAKE bit */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_WAKE,
+				0);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Clear RTC_PU bit */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
+				0);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
+	val[0] = 0xff;
+	val[1] = 0xff;
+	val[2] = 0xff;
+	val[3] = 0xff;
+
+	ret = nvvrs_rtc_write_alarm(client, val);
+	if (ret < 0)
+		dev_err(info->dev, "Failed to disable Alarm (%d)\n", ret);
+
+	return 0;
+}
+
+static int nvvrs_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t secs = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/*
+	 * Multi-byte transfers are not supported with PEC enabled
+	 * Read MSB first to avoid coherency issues
+	 */
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T0);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= val;
+
+	rtc_time64_to_tm(secs, tm);
+	ret = 0;
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t secs;
+	u8 time[4];
+	int ret;
+
+	mutex_lock(&info->lock);
+
+	secs = rtc_tm_to_time64(tm);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T3, time[3]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T2, time[2]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T1, time[1]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T0, time[0]);
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t alarm_val = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/* Multi-byte transfers are not supported with PEC enabled */
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A0);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= val;
+
+	if (alarm_val == ALARM_RESET_VAL)
+		alrm->enabled = 0;
+	else
+		alrm->enabled = 1;
+
+	rtc_time64_to_tm(alarm_val, &alrm->time);
+	ret = 0;
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t secs;
+	u8 time[4];
+	int ret;
+
+	mutex_lock(&info->lock);
+
+	if (!alrm->enabled) {
+		ret = nvvrs_rtc_disable_alarm(info);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = nvvrs_rtc_enable_alarm(info);
+	if (ret < 0)
+		goto out;
+
+	secs = rtc_tm_to_time64(&alrm->time);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = nvvrs_rtc_write_alarm(info->client, time);
+
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_pseq_irq_clear(struct nvvrs_rtc_info *info)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < NVVRS_IRQ_REG_COUNT; i++) {
+		ret = i2c_smbus_read_byte_data(info->client,
+					       NVVRS_REG_INT_SRC1 + i);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to read INT_SRC%d : %d\n",
+				i + 1, ret);
+			return ret;
+		}
+
+		ret = i2c_smbus_write_byte_data(info->client,
+						NVVRS_REG_INT_SRC1 + i,
+						(u8)ret);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to clear INT_SRC%d : %d\n",
+				i + 1, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
+{
+	struct nvvrs_rtc_info *info = data;
+	int ret;
+
+	/* Check for RTC alarm interrupt */
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_INT_SRC1);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read INT_SRC1: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	if (ret & NVVRS_INT_SRC1_RTC_MASK) {
+		rtc_lock(info->rtc);
+		rtc_update_irq(info->rtc, 1, RTC_IRQF | RTC_AF);
+		rtc_unlock(info->rtc);
+	}
+
+	/* Clear all interrupts */
+	if (nvvrs_pseq_irq_clear(info) < 0)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int nvvrs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	/*
+	 * This hardware does not support enabling/disabling the alarm IRQ
+	 * independently. The alarm is disabled by clearing the alarm time
+	 * via set_alarm().
+	 */
+	return 0;
+}
+
+static const struct rtc_class_ops nvvrs_rtc_ops = {
+	.read_time = nvvrs_rtc_read_time,
+	.set_time = nvvrs_rtc_set_time,
+	.read_alarm = nvvrs_rtc_read_alarm,
+	.set_alarm = nvvrs_rtc_set_alarm,
+	.alarm_irq_enable = nvvrs_rtc_alarm_irq_enable,
+};
+
+static int nvvrs_pseq_vendor_info(struct nvvrs_rtc_info *info)
+{
+	struct i2c_client *client = info->client;
+	u8 vendor_id, model_rev;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_REG_VENDOR_ID);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Vendor ID\n");
+
+	vendor_id = (u8)ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_REG_MODEL_REV);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Model Revision\n");
+
+	model_rev = (u8)ret;
+
+	if (model_rev < NVVRS_MIN_MODEL_REV) {
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Chip revision 0x%02x is not supported!\n",
+				     model_rev);
+	}
+
+	dev_dbg(&client->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
+		vendor_id, model_rev);
+
+	return 0;
+}
+
+static int nvvrs_rtc_probe(struct i2c_client *client)
+{
+	struct nvvrs_rtc_info *info;
+	int ret;
+
+	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	mutex_init(&info->lock);
+
+	if (client->irq <= 0)
+		return dev_err_probe(&client->dev, -EINVAL, "No IRQ specified\n");
+
+	info->irq = client->irq;
+	info->dev = &client->dev;
+	client->flags |= I2C_CLIENT_PEC;
+	i2c_set_clientdata(client, info);
+	info->client = client;
+
+	/* Check vendor info */
+	if (nvvrs_pseq_vendor_info(info) < 0)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Failed to get vendor info\n");
+
+	/* Clear any pending IRQs before requesting IRQ handler */
+	if (nvvrs_pseq_irq_clear(info) < 0)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Failed to clear interrupts\n");
+
+	/* Allocate RTC device */
+	info->rtc = devm_rtc_allocate_device(info->dev);
+	if (IS_ERR(info->rtc))
+		return PTR_ERR(info->rtc);
+
+	info->rtc->ops = &nvvrs_rtc_ops;
+	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	/* Request RTC IRQ */
+	ret = devm_request_threaded_irq(info->dev, info->irq, NULL,
+					nvvrs_rtc_irq_handler, IRQF_ONESHOT,
+					"nvvrs-rtc", info);
+	if (ret < 0) {
+		dev_err_probe(info->dev, ret, "Failed to request RTC IRQ\n");
+		return ret;
+	}
+
+	/* RTC as a wakeup source */
+	devm_device_init_wakeup(info->dev);
+
+	return devm_rtc_register_device(info->rtc);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int nvvrs_rtc_suspend(struct device *dev)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret;
+
+	if (device_may_wakeup(dev)) {
+		/* Set RTC_WAKE bit for auto wake system from suspend state */
+		ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2,
+					NVVRS_REG_CTL_2_RTC_WAKE,
+					NVVRS_REG_CTL_2_RTC_WAKE);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n",
+				ret);
+			return ret;
+		}
+
+		return enable_irq_wake(info->irq);
+	}
+
+	return 0;
+}
+
+static int nvvrs_rtc_resume(struct device *dev)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret;
+
+	if (device_may_wakeup(dev)) {
+		/* Clear FORCE_ACT bit */
+		ret = nvvrs_update_bits(info, NVVRS_REG_CTL_1,
+					NVVRS_REG_CTL_1_FORCE_ACT, 0);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n",
+				ret);
+			return ret;
+		}
+
+		return disable_irq_wake(info->irq);
+	}
+
+	return 0;
+}
+
+#endif
+static SIMPLE_DEV_PM_OPS(nvvrs_rtc_pm_ops, nvvrs_rtc_suspend, nvvrs_rtc_resume);
+
+static const struct of_device_id nvvrs_rtc_of_match[] = {
+	{ .compatible = "nvidia,vrs10-rtc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, nvvrs_rtc_of_match);
+
+static struct i2c_driver nvvrs_rtc_driver = {
+	.driver		= {
+		.name   = "rtc-nvidia-vrs10",
+		.pm     = &nvvrs_rtc_pm_ops,
+		.of_match_table = nvvrs_rtc_of_match,
+	},
+	.probe		= nvvrs_rtc_probe,
+};
+
+module_i2c_driver(nvvrs_rtc_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Voltage Regulator Specification RTC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/rtc/rtc-nvidia-vrs10.h b/include/linux/rtc/rtc-nvidia-vrs10.h
new file mode 100644
index 000000000000..3c9c46abf555
--- /dev/null
+++ b/include/linux/rtc/rtc-nvidia-vrs10.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved
+ */
+
+#ifndef _RTC_NVIDIA_VRS_H_
+#define _RTC_NVIDIA_VRS_H_
+
+#include <linux/types.h>
+
+/* Vendor Info */
+#define NVVRS_REG_VENDOR_ID			0x00
+#define NVVRS_REG_MODEL_REV			0x01
+
+/*  Interrupts registers */
+#define NVVRS_REG_INT_SRC1			0x10
+#define NVVRS_REG_INT_SRC2			0x11
+#define NVVRS_REG_INT_VENDOR			0x12
+
+/* Control Registers */
+#define NVVRS_REG_CTL_1				0x28
+#define NVVRS_REG_CTL_2				0x29
+
+/* RTC Registers */
+#define NVVRS_REG_RTC_T3			0x70
+#define NVVRS_REG_RTC_T2			0x71
+#define NVVRS_REG_RTC_T1			0x72
+#define NVVRS_REG_RTC_T0			0x73
+#define NVVRS_REG_RTC_A3			0x74
+#define NVVRS_REG_RTC_A2			0x75
+#define NVVRS_REG_RTC_A1			0x76
+#define NVVRS_REG_RTC_A0			0x77
+
+/* Interrupt Mask */
+#define NVVRS_INT_SRC1_RSTIRQ_MASK		BIT(0)
+#define NVVRS_INT_SRC1_OSC_MASK			BIT(1)
+#define NVVRS_INT_SRC1_EN_MASK			BIT(2)
+#define NVVRS_INT_SRC1_RTC_MASK			BIT(3)
+#define NVVRS_INT_SRC1_PEC_MASK			BIT(4)
+#define NVVRS_INT_SRC1_WDT_MASK			BIT(5)
+#define NVVRS_INT_SRC1_EM_PD_MASK		BIT(6)
+#define NVVRS_INT_SRC1_INTERNAL_MASK		BIT(7)
+#define NVVRS_INT_SRC2_PBSP_MASK		BIT(0)
+#define NVVRS_INT_SRC2_ECC_DED_MASK		BIT(1)
+#define NVVRS_INT_SRC2_TSD_MASK			BIT(2)
+#define NVVRS_INT_SRC2_LDO_MASK			BIT(3)
+#define NVVRS_INT_SRC2_BIST_MASK		BIT(4)
+#define NVVRS_INT_SRC2_RT_CRC_MASK		BIT(5)
+#define NVVRS_INT_SRC2_VENDOR_MASK		BIT(7)
+#define NVVRS_INT_VENDOR0_MASK			BIT(0)
+#define NVVRS_INT_VENDOR1_MASK			BIT(1)
+#define NVVRS_INT_VENDOR2_MASK			BIT(2)
+#define NVVRS_INT_VENDOR3_MASK			BIT(3)
+#define NVVRS_INT_VENDOR4_MASK			BIT(4)
+#define NVVRS_INT_VENDOR5_MASK			BIT(5)
+#define NVVRS_INT_VENDOR6_MASK			BIT(6)
+#define NVVRS_INT_VENDOR7_MASK			BIT(7)
+
+/* Controller Register Mask */
+#define NVVRS_REG_CTL_1_FORCE_SHDN		(BIT(0) | BIT(1))
+#define NVVRS_REG_CTL_1_FORCE_ACT		BIT(2)
+#define NVVRS_REG_CTL_1_FORCE_INT		BIT(3)
+#define NVVRS_REG_CTL_2_EN_PEC			BIT(0)
+#define NVVRS_REG_CTL_2_REQ_PEC			BIT(1)
+#define NVVRS_REG_CTL_2_RTC_PU			BIT(2)
+#define NVVRS_REG_CTL_2_RTC_WAKE		BIT(3)
+#define NVVRS_REG_CTL_2_RST_DLY			0xF0
+
+enum nvvrs_irq_regs {
+	NVVRS_IRQ_REG_INT_SRC1 = 0,
+	NVVRS_IRQ_REG_INT_SRC2 = 1,
+	NVVRS_IRQ_REG_INT_VENDOR = 2,
+	NVVRS_IRQ_REG_COUNT = 3,
+};
+
+#endif /* _RTC_NVIDIA_VRS_H_ */
+
-- 
2.43.0


