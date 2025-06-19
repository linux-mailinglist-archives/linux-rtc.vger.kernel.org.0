Return-Path: <linux-rtc+bounces-4315-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125CFAE0036
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA94A177920
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686D4266571;
	Thu, 19 Jun 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWw4fSXA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03326561D;
	Thu, 19 Jun 2025 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322713; cv=fail; b=prpggKIywYtzeRaOymhNR5v/ROKzZTpN/1TGH0CvWUJz4f+nlWqI/GPByrP7HTxp/g0LyyyGv83KkOBnzqTxjwu0F853/dZnRcQugNqN1tiCYr0rwVoMPX/y/6vm0rRFIAX9j50GWxOZSVxWXjslXjSJBU0onZhj3mUyrwxkvGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322713; c=relaxed/simple;
	bh=90CtQC7F1a3iWGzCAveJarSnJJWgZrFOqwZFWCT+Z6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHbchUM00a/B0gd3iQtlJr5VWXL/etGX7UGG4FBa2FreTUSrZzBiKeSIHeQqfu+zGgN2KhQFjoP80EE35ysxM5WUqrDmQUpCKhASndArr/PxUQQE+3U8Q7kU4elgVdvKv+aY84t1S5b9l71UaciTUBlcNOCvgjR9+y0nA7UsUF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oWw4fSXA; arc=fail smtp.client-ip=40.107.212.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcXsfkQ+AzdgS7EDeh/7d/V3eu7+FUG7D+WC2b3gavvDoduksUyPeZr9uK4wwDTxMnJKXzyd2jRvV973iQxukFnUu2qOqdJsHAoBEXEQ/WmG4eYFa7zCfWxvfjweAL6uqmLfnGtxEld7vmjLxQ0SbeA4WR35dtCrtqGHFvqr9l5Pd3ZfH2xCSjTsPZltfYH+m/JuGnSfrhy5LpAbT8rDT/QmZFz95Kx8N35gMgt7skKfEkDwRj15Qw/6e3mpY9QMf/3QGhyxJCfI5qZtzjliOyrxjFFn4KuSdTLuS0UN7vUA9xWdD8tRSORHHd2j6+nsKVOJYuCw0OBlQeKx9pOtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8jAWPb2uglxb8f40PpVZ/dHZ8Dj04Ukz6P36js7xg8=;
 b=m+woOfCgA4HJvXuZ30ojNCN62bUmRwL+4l4k9BkMPBZSR1tD/BYfbuS84GNoth3J9iAGG4mKBWsSxTjBXFB54aPsdOmMMvudfMjnC1pIEpmfehVQvajOBLBDzsRWkt0VIjlptnN8nK3KbVoE6OKZYUbThrHqwVq4Ph0GUJ28k1uuvXTT8E4x1mmZw1rT1jkoJE5iWZAXH34pdlcfKyC6O43LXZAsy1evQaQ5yni9UnDax5zB9jubv8OBxFzR3Wjzl7xNuEtcEtDudIn1CwJuUTHi+UNHjh5G2E0Ce4RKlWbv9pCausYMqFVjk3gILC7tJ3uGhqXXA8H76q2TziVNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8jAWPb2uglxb8f40PpVZ/dHZ8Dj04Ukz6P36js7xg8=;
 b=oWw4fSXAq/Hj+OTV5rjx6VAMKRjRMz80hT85uiIdMBTMnhldRKwTMzAMF1uvv3pb+8axXGPwc8z+FkNd4pmb7q7zkrxp24/wZzQ3C+ga0yjgZ6NF6ZOibCxafUGWN4tuWjVaBwHPdhVDHb0kWZQJhd0PQoRw4BFyiR0HsAL4g29CZq06P/p0F/8tPNxJ3PDf/prfVYDWGfCvmaoXBxfBAOAGzsWJ9CLH6b0JKsR4eACUtYJg2zCVEhB6ZAk6rfYH3Ygflgs7YztfL8q5rzSgOTvyyUNtkJCKmPhvT4RbP1m2FkV/quqGF4ilAxAh1N82PQwT78AWEe/SH4W4QUOJ4A==
Received: from MW4PR04CA0194.namprd04.prod.outlook.com (2603:10b6:303:86::19)
 by MW5PR12MB5597.namprd12.prod.outlook.com (2603:10b6:303:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 19 Jun
 2025 08:45:03 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::f6) by MW4PR04CA0194.outlook.office365.com
 (2603:10b6:303:86::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 08:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:45:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:45 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:45 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:44 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 4/6] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Date: Thu, 19 Jun 2025 08:44:25 +0000
Message-ID: <20250619084427.3559207-5-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|MW5PR12MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: b678bbb3-fc13-4bbb-2569-08ddaf0d9536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eUm19L52vhej1KrR8y6i8h8BJM2kW4yXxskpxrYUsZeEM60Nc8nid2bZuBS5?=
 =?us-ascii?Q?JzYXNvNMtnXIYcQTvd4+mw6s37KR6O4kh5zrxYrG4jQoPWZZVomaKMyVowvA?=
 =?us-ascii?Q?M4XpVnRcGROklTatWfuU/67xZkvkPWvmMDiTkU/nO0MYOeU+yet9Cpsjh+xH?=
 =?us-ascii?Q?G+t3U+WDBDBUNg25pNqxmjWG2iI/mdIZpawgtFOV2U436B5hpt47J+m8pRf+?=
 =?us-ascii?Q?IzrZGm7IJOYH//82U2CGXaxroz0jb7nDnbkQM5D9yMX4LncIQj5+2MSLEuke?=
 =?us-ascii?Q?YHPYAXo1GvCc/0tf2sOqB0Vl5s1c2Q309cD7rzKaNVKZjTzSIb3eSEkP6LZ3?=
 =?us-ascii?Q?ZMOYEPXkPMFN/gLFHIub2siye0WwQtodiLqtNcKlNit9+AL/VvD32AgMel6+?=
 =?us-ascii?Q?wkbLKvPTiNm1mrmj3yjDUaRZ6+z4RTUfFaN30r4MJEe9VxFdu5bZnR0Ws2yO?=
 =?us-ascii?Q?2lqBvQX8T6STwo/U/VaWVbb+dNSULAIPj1+LCZZ7590vrYXKiKC6bKsv/JlM?=
 =?us-ascii?Q?X1UzGrTuNVpDJvBlFhaAxgAA5YSjBPaoke9D6V3t3h4VHYn9Ly/sQFFwou0Q?=
 =?us-ascii?Q?22G3Ba1PiskUdYP//w/brKjW99eJBivuFkuv/k7SHJ/Qa5/hFUY8s4opM70R?=
 =?us-ascii?Q?dkY+pAl7CXkdGhw0FJTmAabKoch9/S2nSU8C2VzE75eokuoSk7+pBECqG7tM?=
 =?us-ascii?Q?JmzHCrXdEXHdJ9XW5IMEc0Fo8/JVN+/H8JhMw89x/a8QobXY/fjzdvl+imOS?=
 =?us-ascii?Q?MmvVM2wMsH2z+453aYjATo7h8PCmyEJ0bv3XJ5IpxTA2zyqIeu2TXHLJTc0U?=
 =?us-ascii?Q?hdvj38h9I4PdSNe5ppca9JVESeH4Q0hA2S1A2Ec0L7xq9ZuW/4b55J4yFzu0?=
 =?us-ascii?Q?jXnpb7FsbebRK+9r//Q6EcmI9hTJnsjNSO833k/J+ZdUiPjiYUL8/FAvzQXg?=
 =?us-ascii?Q?2raNDQJUyzVtpbkHu7A5BNq/svork2x3cHICel9t5MytH79hEEzWgeHhf7bX?=
 =?us-ascii?Q?RXVWIfyJlmhheIuSFdHuF4GLEYBpShPqxkRry6j0IABYq25m8yDkBYbxkeCT?=
 =?us-ascii?Q?lhsejRN6L+2Tg6YWF6M6xGHS7uwxfbGRxwwzJrLWsn76/Ix/6hHY3cIy8fHY?=
 =?us-ascii?Q?s9s8k+Iool54XEyLdLOu15vgoZlAC2XJ1zHHCO51fi3OUBGZvN0qA+FTlUnD?=
 =?us-ascii?Q?CPm5la1tPh5IxzaoP/jzDcEBerhjGdzel5eLYjcWFwTGZd1XE4UGt2oa1NkW?=
 =?us-ascii?Q?0ejRZK187I28D3ycSck+ZdhIX41wiQIJQjdtG6TyNc9BtSY7HfII+LQnzctC?=
 =?us-ascii?Q?FdxfgFnNsXlFfOHl1f3MZ5t/j1mCpR7kvXr1eEoQeaU4bqgzIZp/h+ymSQhv?=
 =?us-ascii?Q?Gn5Ws7kHFOQSI3fk3xzlggfodhpvpOGoWCQ7HBlBhM+xZYrHqJfbHFMk3kww?=
 =?us-ascii?Q?+ZnkqyFRiJ3Tq9wFwBVPMhL0FKfyoArRI0yDUf/cOeNGsJJkyAZN/YlG+pGv?=
 =?us-ascii?Q?hcYue05nYbSILDCkTJWF6rQo/dLxU7u4vOXe?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:45:02.8344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b678bbb3-fc13-4bbb-2569-08ddaf0d9536
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597

Add support for NVIDIA VRS (Voltage Regulator Specification) Power
Sequencer RTC device driver. This RTC can be used to get/set system
time, retain system time across boot, wake system from suspend and
shutdown state.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

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

 drivers/rtc/Kconfig               |  10 +
 drivers/rtc/Makefile              |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c | 457 ++++++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613ce..d16de9b32299 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_NVVRS_PSEQ
+	tristate "NVIDIA VRS Power Sequencer RTC device"
+	depends on MFD_NVVRS_PSEQ
+	help
+	  If you say yes here you will get support for the battery backed RTC device
+	  of NVIDIA VRS Power Sequencer. The RTC is connected via I2C interface and
+	  supports alarm functionality.
+	  This driver can also be built as a module. If so, the module will be called
+	  rtc-nvidia-vrs-pseq.
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 4619aa2ac469..836e329a7c39 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
+obj-$(CONFIG_RTC_DRV_NVVRS_PSEQ)+= rtc-nvidia-vrs-pseq.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
diff --git a/drivers/rtc/rtc-nvidia-vrs-pseq.c b/drivers/rtc/rtc-nvidia-vrs-pseq.c
new file mode 100644
index 000000000000..fd57e67bda5a
--- /dev/null
+++ b/drivers/rtc/rtc-nvidia-vrs-pseq.c
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * RTC driver for NVIDIA Voltage Regulator Power Sequencer
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/rtc.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/mfd/nvidia-vrs-pseq.h>
+#include <linux/irqdomain.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+
+#define ALARM_RESET_VAL		0xffffffff /* Alarm reset/disable value */
+#define NVVRS_INT_RTC_INDEX	0	   /* Only one RTC interrupt register */
+
+struct nvvrs_rtc_info {
+	struct device          *dev;
+	struct i2c_client      *client;
+	struct rtc_device      *rtc_dev;
+	unsigned int           rtc_irq;
+	const struct regmap_irq_chip *rtc_irq_chip;
+	struct regmap_irq_chip_data *rtc_irq_data;
+	/* Mutex to protect RTC operations */
+	struct mutex           lock;
+};
+
+static const struct regmap_irq nvvrs_rtc_irq[] = {
+	REGMAP_IRQ_REG(NVVRS_INT_RTC_INDEX, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
+};
+
+static const struct regmap_irq_chip nvvrs_rtc_irq_chip = {
+	.name	   = "nvvrs-rtc",
+	.status_base    = NVVRS_PSEQ_REG_INT_SRC1,
+	.num_regs       = 1,
+	.irqs	   = nvvrs_rtc_irq,
+	.num_irqs       = ARRAY_SIZE(nvvrs_rtc_irq),
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
+static int nvvrs_rtc_update_alarm_reg(struct i2c_client *client,
+				      struct nvvrs_rtc_info *info, u8 *time)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A3, time[3]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A2, time[2]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A1, time[1]);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A0, time[0]);
+}
+
+static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
+{
+	int ret;
+
+	/* Set RTC_WAKE bit for autonomous wake from sleep */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set RTC_PU bit for autonomous wake from shutdown */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);
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
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE, 0);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Clear RTC_PU bit */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU, 0);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
+	val[0] = 0xff;
+	val[1] = 0xff;
+	val[2] = 0xff;
+	val[3] = 0xff;
+
+	ret = nvvrs_rtc_update_alarm_reg(client, info, val);
+	if (ret < 0)
+		dev_dbg(info->dev, "Failed to disable Alarm (%d)\n", ret);
+
+	return ret;
+}
+
+static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
+{
+	struct nvvrs_rtc_info *info = data;
+
+	dev_dbg(info->dev, "RTC alarm IRQ: %d\n", irq);
+
+	rtc_lock(info->rtc_dev);
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+	rtc_unlock(info->rtc_dev);
+
+	return IRQ_HANDLED;
+}
+
+static int nvvrs_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	time64_t secs = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/* Multi-byte transfers are not supported with PEC enabled
+	 * Read MSB first to avoid coherency issues
+	 */
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T0);
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
+	struct i2c_client *client = info->client;
+	u8 time[4];
+	time64_t secs;
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
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T3, time[3]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T2, time[2]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T1, time[1]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T0, time[0]);
+
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	time64_t alarm_val = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/* Multi-byte transfers are not supported with PEC enabled */
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A0);
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
+	struct i2c_client *client = info->client;
+	u8 time[4];
+	time64_t secs;
+	int ret;
+
+	mutex_lock(&info->lock);
+
+	ret = nvvrs_rtc_enable_alarm(info);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to enable alarm! (%d)\n", ret);
+		goto out;
+	}
+
+	secs = rtc_tm_to_time64(&alrm->time);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = nvvrs_rtc_update_alarm_reg(client, info, time);
+
+	alrm->enabled = 1;
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&info->lock);
+	if (enabled)
+		ret = nvvrs_rtc_enable_alarm(info);
+	else
+		ret = nvvrs_rtc_disable_alarm(info);
+
+	mutex_unlock(&info->lock);
+	return ret;
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
+static int nvvrs_rtc_probe(struct platform_device *pdev)
+{
+	struct nvvrs_rtc_info *info;
+	struct device *parent;
+	struct i2c_client *client;
+	int ret;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	mutex_init(&info->lock);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to get irq\n");
+
+	info->rtc_irq = ret;
+	info->dev = &pdev->dev;
+	parent = info->dev->parent;
+	client = to_i2c_client(parent);
+	client->flags |= I2C_CLIENT_PEC;
+	i2c_set_clientdata(client, info);
+	info->client = client;
+	info->rtc_irq_chip = &nvvrs_rtc_irq_chip;
+	platform_set_drvdata(pdev, info);
+
+	/* Allocate RTC device */
+	info->rtc_dev = devm_rtc_allocate_device(info->dev);
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
+
+	info->rtc_dev->ops = &nvvrs_rtc_ops;
+	info->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
+
+	ret = devm_request_threaded_irq(info->dev, info->rtc_irq, NULL,
+					nvvrs_rtc_irq_handler, 0, "rtc-alarm", info);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			info->rtc_irq, ret);
+
+	/* RTC as a wakeup source */
+	devm_device_init_wakeup(info->dev);
+
+	return devm_rtc_register_device(info->rtc_dev);
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
+		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
+					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+			return ret;
+		}
+
+		return enable_irq_wake(info->rtc_irq);
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
+		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_1,
+					NVVRS_PSEQ_REG_CTL_1_FORCE_ACT, 0);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n", ret);
+			return ret;
+		}
+
+		return disable_irq_wake(info->rtc_irq);
+	}
+
+	return 0;
+}
+
+#endif
+static SIMPLE_DEV_PM_OPS(nvvrs_rtc_pm_ops, nvvrs_rtc_suspend, nvvrs_rtc_resume);
+
+static const struct platform_device_id nvvrs_rtc_id[] = {
+	{ "nvvrs-pseq-rtc", },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, nvvrs_rtc_id);
+
+static struct platform_driver nvvrs_rtc_driver = {
+	.driver		= {
+		.name   = "nvvrs-pseq-rtc",
+		.pm     = &nvvrs_rtc_pm_ops,
+	},
+	.probe		= nvvrs_rtc_probe,
+	.id_table       = nvvrs_rtc_id,
+};
+
+module_platform_driver(nvvrs_rtc_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVVRS PSEQ RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


