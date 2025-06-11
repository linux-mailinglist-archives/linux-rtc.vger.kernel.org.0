Return-Path: <linux-rtc+bounces-4275-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E595FAD4CF8
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA5B2189CA52
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6AB231839;
	Wed, 11 Jun 2025 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jCLyBzH9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D42309B6;
	Wed, 11 Jun 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627331; cv=fail; b=RfBVa099IE64Z2dvd+pzYZmZLUBwyNpShjDPS9kgTqoiZdqj6afOTm47lat94/cU1B+nUSxITUJNpPh5hE3fZELOX3j/q1z7csKOm+QiwagsQdvON7Brp1YWY4y68Svt3qY960yKRCfxX3DFzMG1svvEG7I5Mr61c7Hrl42j1UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627331; c=relaxed/simple;
	bh=qgf2v5TBfEBzncfhaxQYKEW8tTFs6Ol/uLE5fU1DVwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvH7je3bzmdmBeg3Y8n3tLzdX58dMujkSXpH/m5N85eapkvV7bzdX/J0XBRbu6BxJYLWSi2exysLKmrJtlQ3HgL5wLqwmtsfU013ceVMeca+rAD0zKMxl5BPCw0A3SufQDH8WBLe9RMgaxyD4iKRXETKpGz/0Yl56xm+pGYY5c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jCLyBzH9; arc=fail smtp.client-ip=40.107.237.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRN8+RpZdSQMTQaWTWnO7X0kH8IQ4+ble/jp9dPmkmU7EBYsk2ceaO5e1L/EWZnUNNDRsi9nX4Z/nw6f2RAgGDVgMfXwLft18iLO7r85Wwv/0FYZLIKHc2cGaGf50H8KrUNm8tU7ae2UBBYHAtOglM4hl8XiMNxXcNzg9+/z9fDhXBEsneygbdzr9ts7VOqyMJsbSkJj2Imnkpn8eBrHXh5fzPDSDNL99md61/uPHWJJNdnz0PXxJyMokMotydQpeudpL8M9sJsfuj/LfOUbRO9UIbsAd0Y/Wvq4UwmXeEdgkqHn6JtySQdXbqcMTc8UEx53JDgojsuARucgk2ulxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY5/o/KateirT30Un4D0rFGHHhpXB/ZaR3B48+zmouw=;
 b=S3uBr9cTQrwJ/gGS6qUpHIVTIpB6KAwmnI6s/v8r4QhqyLwVxOt5u0f1bVZJCaM6JLkS238BOhkUkS+59MtyOhuQEnkne/+VPld97U8wFBhp69M70L7jRlRyqhm/op3SvdWZmBjyn9q+2+G2dxufQ1Q1D2Z6iwu9UmWRIo/R0Q7mIMwU5RnAs12lxNqK6EuTXA4dnAxeEYsQQzTwBREaaZk+FGPcv3g92Si3S8EmrV29Wq5v9m+7yh8cmSY7ID0NSWz6/xiciuG7CwJqH/vmqLvAgvoSozkWvHT/pcudt+TH44/OKM2gEBOpW0M3Sjdnk7q5I6AstnLHGDrApkXtLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY5/o/KateirT30Un4D0rFGHHhpXB/ZaR3B48+zmouw=;
 b=jCLyBzH9OaTCyurDE/kqY4Khw9IDOu46dx7TVr7JXgzRwhoHaYT2sSjxvfDvjlej69fjIf5rMBHfV7SzpsemfuUcy6M72159qRgVdG/H86rhTdMMROYuDM27nyMCO2FGo19EgkN0f+4Wm4NjpHg351qLnEqoQF56Go4HuF4pMHKWDwI/AYZfARMvUxbgTY2ZG9+IU1npp6UiNETamz4grm6w+Tq5k+cYr/Ixq/R7X8cyeIuNMP68RwtdYkp5VpIikRXJxQqt6Hd+L5mKNi7PcKmeEmaS3t0aVXbqTnqg1ivVSzuTfrm6ztKOERsVYFku27n30D2J69jDjZIUczD7iw==
Received: from BN6PR17CA0046.namprd17.prod.outlook.com (2603:10b6:405:75::35)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 07:35:20 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::55) by BN6PR17CA0046.outlook.office365.com
 (2603:10b6:405:75::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Wed,
 11 Jun 2025 07:35:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:04 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:04 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:03 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 4/6] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Date: Wed, 11 Jun 2025 07:34:52 +0000
Message-ID: <20250611073454.978859-5-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: 74643982-a01f-471a-9b42-08dda8ba84b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4MYNpldg2ZGIMabUT0oD/oGFkJoKBS24P48boEf6kAUaKw588q76d5uHlR9a?=
 =?us-ascii?Q?R081yrniD++MpwhIiQvd50d2vC4W6pVgGXdWcKZQGfuQPQ0qLteesIxaCFC2?=
 =?us-ascii?Q?Cq4HP57Iw49G/aXbPB7hqeVWpAq9XecsArBDDSxGgmc8o+72G/iBEJY8/qtH?=
 =?us-ascii?Q?4Sx1fRHhWldXP6brezW527INadwrba9NVPYhnr2Kld8/w+qVwnwX5PZo23gf?=
 =?us-ascii?Q?7UbSiZ0d1U+UZeRiBdntnqtgN1NYt0roDGntNaL4mM2sJG8wmXfZlZ4c9LuO?=
 =?us-ascii?Q?T7LhLPoLJtY+sdi3qND9b0xfZD561twI4fVbYSYWYMNLrOGifI3Nkc36npyi?=
 =?us-ascii?Q?5n7BRytwGB7Kp3kHVggzPU+GuK9jTxhc/74iiVR4zm5zIttxj7ZLW6zwtHI8?=
 =?us-ascii?Q?yIgwHs4Eq7zbr9lugKauaEh8podEQDvIaUw7CEOyQFeZ3fw5xU/mwD9ExBOM?=
 =?us-ascii?Q?um554ehZgTbbFN4fZKPbANbGNi6I27BFNWPtMaJhcDPTuEs5UXmbs6mbCTvR?=
 =?us-ascii?Q?biZ4adWLYGngGHJY0Q9dev/Lf346P037heK324+FO4arcSydUyPQtWEQXMTI?=
 =?us-ascii?Q?7xy1B1y97suR5puowq1XnLpbG2hPmzUg2bjUuHw0M9CcbQJsjipRLolWL1hU?=
 =?us-ascii?Q?j05CRANo7iHb0vYcejRqwNKNOas8ERAykSN3YqkMpPkbVVbtGF1Zb62VbYjg?=
 =?us-ascii?Q?pKOHJiwydDchv1y3Je7v+InJGD6Lx/F4sDucvU07wZ64r93lJ5TCZI4G/g5j?=
 =?us-ascii?Q?29Na/Q25BKrPbq0sYYUJg3tMfiyeGdP7ozFAX6HSxAfBk75BvZUSOvrbGHPp?=
 =?us-ascii?Q?4xOJv+DWVTGBFwR0pvpbD9SfXQTbRMPv2CGrGMQcUAVZS/+N4awrtcl7kCLp?=
 =?us-ascii?Q?Y1xAwutwS7Ssod+8ULbruSCxbBI0m3ygGkS1d8eJNVPXYyGdTqfiAqVeMqCJ?=
 =?us-ascii?Q?1gnWfUJqX2n8e+E6csYoOU3Sml8bALjqqMEMfWxNYBzFzc/SYt0EiYUS7ecj?=
 =?us-ascii?Q?4SRV3ubr31Hnd6pn9CvJWVGXUB/2Ymgehvz9cqAcepm440KOBxhdxUsxr7Ub?=
 =?us-ascii?Q?LmE7i4hzgpeITI7YgLXTuTLL0EV7gYFFS5odkZNBstRcUBG1/h9AQtrKd7sd?=
 =?us-ascii?Q?kJZggDIAoGRzUN0KbPREJEto4m71Ng11Fj/btxsABdSGajMi5vXLWVZZHLG5?=
 =?us-ascii?Q?8nVuByeF1y/M2gwu0GoNAdufRGkJhmrs5YiJPw/5kmPvpZN81ljDRfsQ2YFp?=
 =?us-ascii?Q?c8pK1tSfx3Q0c269Eu82x5q8PgoQ+c0efF08f6iBltrOETfrPo6zTbZBHHGz?=
 =?us-ascii?Q?ZufHmNZf7a9siTpPOxF9DAwmjtdHzjUEmTlczQ41sS+ELZpMkYNy730ZGBci?=
 =?us-ascii?Q?o/98rSf3bTJjtJ3J4nV0HMZSvMEemwV9IxBVHqVZqq5UcV5HI/04yzeC76o5?=
 =?us-ascii?Q?Q46Wfq2nVNpVC2O+tdn01LRHG56gGd+DAzteKva492fZhzQ5Ok4171y8U5LR?=
 =?us-ascii?Q?0GfOTy6Q2vTkLkzQ0fb/EaY/e/tyygOYbk98?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:19.8115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74643982-a01f-471a-9b42-08dda8ba84b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322

Add support for NVIDIA VRS (Voltage Regulator Specification) Power
Sequencer RTC device driver. This RTC can be used to get/set system
time, retain system time across boot, wake system from suspend and
shutdown state.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

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


