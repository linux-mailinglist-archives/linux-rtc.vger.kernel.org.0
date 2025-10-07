Return-Path: <linux-rtc+bounces-5072-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD86BC19B3
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 15:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 428AF4EE144
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 13:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D302E175F;
	Tue,  7 Oct 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eIpJ7nD2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D22E173B;
	Tue,  7 Oct 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845494; cv=fail; b=ES7F9M+QgKjt8RpyzlZxmeZWDWVR0Yv71L+QwPOkBnxtUu162pW50Zc3JRI1nmqXsXI+mQX2MiphITqAXHhDsiVVnM6+ZjPYk9PiWdgVJM/J3FyNA45c3deYbLBXSyUDa/eDn1dUTSOxO5T5E7OU9V2WQ3P6f9loU0EJkGaS8Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845494; c=relaxed/simple;
	bh=hEy/vgTPksWC5ftaq+s34av2ry8/BbvM/kvqys55OoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EsgsabreKjI6rvic7IEeEzF+SLW6V6Kl4zWkqFy69ZdB2Xd/M42N73lVwxxrVOTmBpgtRERTRYHwfEvektZa3YlN2FKaqimlIzZrhgp/mmceILpE2ee072gpy9D6pGOYTFXRhHY/FTucazs999RuS0Pjoi67oSg65fYPbKvb7c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eIpJ7nD2; arc=fail smtp.client-ip=52.101.43.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Log8f10G27/JdFp5lUyyqDgrrL62SHHKS6Tu4r/oCVTNRBCVkvaq4YmOv5hpDCIy7zj+kONn4jW+RVWEfwf3rY6UpN3hGDJra9M8KtIf1eaWSFSTJsYbDrF0WuF6HB2v0LZ4aeKRa3p5vEjjkh+nagj7wuRM0Mta6fNDF2Oy7qd+d1bODOYHMx+/hkxJtU8mi6B0sImegjHNZeNUn4wAWO8UvAtU7OW/XJ0PW5kTkmyzqxVQDsjNluZ6i3UbHn0umXZHlx+WFgFyLS5DtbJ5csIaYI5Td/lbJ/nu/jq5oJ4fUiekBpQUv30sy4aEahjTYseG23O/w2ErqiItdLfjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wegIc3IxVcGPa273Uz2Us8bbakMM4r/QeVrWuHnrwDk=;
 b=aBoMNiXLP6tADFhue6O8tugWJ+k6bpk2Psdz/Oi/xSvybBgSmQKwII7saNIzn7ZhmFLSutmIOudTEtPDuzDOlxBkzxNPVuphumiUG8rk5sFc/ZKM9LpRq4i79aE1D9uizP+9HsViimm3rgj3jSmavYfNgDe3ROCcnTjripw2gNwDaRDU0lOPKaBRYwfPUNcr1sVZfEycYoZdabECcUxf6nCK9smiH3stzvQs5ruca9Wn2aaaoc7nlKxLpaKlvfXxoMLtb8QPcAxdVN8u8mWqXOmcO7bpUN4wVWn5e+1o+pwNcSyGPC/1xAdAz4sNQzXk/+a94K2VhJgjEovo4QOywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wegIc3IxVcGPa273Uz2Us8bbakMM4r/QeVrWuHnrwDk=;
 b=eIpJ7nD2Fzt51LyLEuXfZoEBjO2KtrxBqicvQTPA+aBYvCL5JxWhvt36HFqJzncb6WPji4wSH0PyPGe7hVIdEYAYc9bZgy8RujktVvMSKpuG7ELdGUMmrVADdAxOFBZFFNIjI5XAkElfkINc8zxnKrc3cWYNjLQPtygi5P+DIozkzRksKtBU1eR4tI7lztaIWLDaG+zE2NU5bGlvbEf7SgHcB7NP7625NxPQDNqxSdrmcOOD+baCarU/S4IcQ8MUAIfhwuTWu2MQwAorgNrGGlofg62aQZRU1nl7zu7i49km4IZNgDDA0iKUGC417zZhawXOABnLzkW2vfNuLxpBIA==
Received: from MW3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:303:2b::11)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:57:59 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::9) by MW3PR05CA0006.outlook.office365.com
 (2603:10b6:303:2b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 13:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:57:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:49 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:48 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 3/4] rtc: nvvrs: add NVIDIA VRS RTC device driver
Date: Tue, 7 Oct 2025 13:57:37 +0000
Message-ID: <20251007135738.487694-4-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a55642-7519-4db4-c34d-08de05a98647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PxsapNFSnMK33/CUSKAaM10IEGeyjQxjWkf1WUfIcBqtTLw9J9ZpxfVBuwBb?=
 =?us-ascii?Q?+jwlLGKq1NCM8+cMT6zt3kcySdO5bjklB+pAiZSXF5yJrsm/jMAeQCcKfdLd?=
 =?us-ascii?Q?d1IDD1FNs8/ifc6favDGF1UhRct6ldApb45R5dhE8PKelX5ShSpaj9EfmZZU?=
 =?us-ascii?Q?Oq2wEZIypuz8w8F5kzJekzMiF9ut+3xWEbQmeKiv2zGftDbj+cS00/74d+Z2?=
 =?us-ascii?Q?74An00utQw8HulcQv6PSq5DW2HhTkCHPu5yB1A9fYEoWPht1/Dsw2jdGoC1I?=
 =?us-ascii?Q?MWmwfLbc1Tbx4ftxL9dv8c/uvjz4Yspb2wtLKUEFFGbFfM9lYLp1R//rc2gs?=
 =?us-ascii?Q?mWs/1RgNIx8oUnAzWlxtxZqelRYFhh1Yme74gIO8LILoUjT7wMh0facAS9m+?=
 =?us-ascii?Q?IbXFP3bTP8Uq0Fg5rDFIeIWs4l+eRGHzkbeNxUUp2wbaPlkCLEcXzMMQWfd8?=
 =?us-ascii?Q?C9OVv4+5DdfOe+nn8b2p8czV/9rd28+gR+oXn4v3C/DyUceL2So0Z56j83D8?=
 =?us-ascii?Q?BKpNX6G27YcnYK1fZYCq7L2VSkiuW1ZWiRM0H4SkFLCTAcNKVkWZ5kTbAO07?=
 =?us-ascii?Q?wdTv+yCks6gzdckclcDmc2kUfsIgfo4F/nqlSeeooeigu0n/KKJfjJSrV6Al?=
 =?us-ascii?Q?4loaRy5IEP5RoO1/zlk2Gq43zl3MOw3UwWqwKM39cLMPjRH8p3wqfwFpenx5?=
 =?us-ascii?Q?dubaHyQy6JbdYMMjc6hj24/qXtUJmnTarhxw+YLJjxF8o3xMGS1wnQMnmBP7?=
 =?us-ascii?Q?bMVQslsZQDQHpcvd60ppcmyfwuKzWDJ19u1Oy4ROnff+Qe++1qcYwT3gUFjC?=
 =?us-ascii?Q?UD59WuWRYIhfzeDCWoKkFQdqN5A4yhRkW1L5+4+Fya1Kelmwz2yHVqvlOk+Y?=
 =?us-ascii?Q?5aRL7RhDR4U6w6B6+AOwos8juqQ8s+WEG7QxZ8Uy97TkHIhJMreqHLkgAUFU?=
 =?us-ascii?Q?FTaseggFsEhaqiVnHqyTc67mN2LfJXNS9Hku7AouspxmxgFgbSDXw5Pgp6Pr?=
 =?us-ascii?Q?apgHIDztt+SSi0JXqr/DUG6xc6SfFym2O9gm+0bp7SeYioLB0rQUdlNJukZ8?=
 =?us-ascii?Q?gB5A2lXfGaA+heYXC0+5HDhtW0AJQCX85fZKKJUBNn/gbAvHEoZLqbH4aft+?=
 =?us-ascii?Q?kMRR63/0W4t/Cnqe6rAl/2bDZnEU1zNWeym0qZgwu1lmReqesoIvJpYsFy58?=
 =?us-ascii?Q?WLSTY8LrH+syzhBmGHz1Qegs9gooYnX3f0hyxzlnqbXzP23VnmoDxvlPj70y?=
 =?us-ascii?Q?FsYVbTnTH6NG7jcWVBhWZgRS/D1LWySB8ZY2OmcH6sBUGR60+7Q3VeOydrMQ?=
 =?us-ascii?Q?reT1eE90uxKBRBN1pTeWHObeDrruCpIsAhbyTiqNrgQCtB1JjAZvHi+iLpFx?=
 =?us-ascii?Q?4WUl0Xgu/rJvAQHhFnjdoq9HTTDW+qMDdvxWvF4UJSnbmFzAvyc+7Ftn2ZYM?=
 =?us-ascii?Q?i24ryHKY+R/kj7A0qcOytQ1eTJVfEBqTvzZ8uVRbxec2ivcz0cYD3bO4Sbgx?=
 =?us-ascii?Q?qSmHeYuAOBBqAOR/aS0WaDMdlVSfzW5TtnD3DvNNFvD+LJv3/mHm/12GqOp1?=
 =?us-ascii?Q?1gE5Z5QtR+MQPpb6AMA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:57:59.3378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a55642-7519-4db4-c34d-08de05a98647
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210

Add support for NVIDIA VRS (Voltage Regulator Specification) RTC device
driver. NVIDIA VRS is a Power Management IC (PMIC) that implements a
power sequencing solution with I2C interface. The device includes RTC
which provides functionality to get/set system time, retain system
time across boot, wake system from suspend and shutdown state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v7:
- rtc driver fixes to remove mutex lock
- moved register definitions in driver file

v6:
- compatible name fixes to "nvidia,vrs-10"

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

 MAINTAINERS                    |   8 +
 drivers/rtc/Kconfig            |   9 +
 drivers/rtc/Makefile           |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c | 542 +++++++++++++++++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3773c74b31d6..0b1dddc241a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18418,6 +18418,14 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS RTC DRIVER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
+F:	drivers/rtc/rtc-nvidia-vrs10.c
+F:	include/linux/rtc/rtc-nvidia-vrs10.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c8..1714a100697b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -416,6 +416,15 @@ config RTC_DRV_SPACEMIT_P1
 	  This driver can also be built as a module, which will be called
 	  "spacemit-p1-rtc".
 
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
index 8221bda6e6dc..d06380a040c9 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
 obj-$(CONFIG_RTC_DRV_NCT6694)	+= rtc-nct6694.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
+obj-$(CONFIG_RTC_DRV_NVIDIA_VRS10)+= rtc-nvidia-vrs10.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
diff --git a/drivers/rtc/rtc-nvidia-vrs10.c b/drivers/rtc/rtc-nvidia-vrs10.c
new file mode 100644
index 000000000000..b15796698558
--- /dev/null
+++ b/drivers/rtc/rtc-nvidia-vrs10.c
@@ -0,0 +1,542 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NVIDIA Voltage Regulator Specification RTC
+ *
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/rtc.h>
+
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
+#define ALARM_RESET_VAL				0xffffffff
+#define NVVRS_MIN_MODEL_REV			0x40
+
+enum nvvrs_irq_regs {
+	NVVRS_IRQ_REG_INT_SRC1 = 0,
+	NVVRS_IRQ_REG_INT_SRC2 = 1,
+	NVVRS_IRQ_REG_INT_VENDOR = 2,
+	NVVRS_IRQ_REG_COUNT = 3,
+};
+
+struct nvvrs_rtc_info {
+	struct device          *dev;
+	struct i2c_client      *client;
+	struct rtc_device      *rtc;
+	unsigned int           irq;
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
+	if (ret < 0)
+		return ret;
+
+	/* Set RTC_PU bit for autonomous wake from shutdown */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
+				NVVRS_REG_CTL_2_RTC_PU);
+	if (ret < 0)
+		return ret;
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
+	if (ret < 0)
+		return ret;
+
+	/* Clear RTC_PU bit */
+	ret = nvvrs_update_bits(info, NVVRS_REG_CTL_2, NVVRS_REG_CTL_2_RTC_PU,
+				0);
+	if (ret < 0)
+		return ret;
+
+	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
+	val[0] = 0xff;
+	val[1] = 0xff;
+	val[2] = 0xff;
+	val[3] = 0xff;
+
+	ret = nvvrs_rtc_write_alarm(client, val);
+	if (ret < 0)
+		return ret;
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
+	/*
+	 * Multi-byte transfers are not supported with PEC enabled
+	 * Read MSB first to avoid coherency issues
+	 */
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T3);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T2);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T1);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_T0);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	secs |= val;
+
+	rtc_time64_to_tm(secs, tm);
+
+	return 0;
+}
+
+static int nvvrs_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t secs;
+	u8 time[4];
+	int ret;
+
+	secs = rtc_tm_to_time64(tm);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T3, time[3]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T2, time[2]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T1, time[1]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(info->client, NVVRS_REG_RTC_T0, time[0]);
+
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
+	/* Multi-byte transfers are not supported with PEC enabled */
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A3);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A2);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A1);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(info->client, NVVRS_REG_RTC_A0);
+	if (ret < 0)
+		return ret;
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
+
+	return 0;
+}
+
+static int nvvrs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	time64_t secs;
+	u8 time[4];
+	int ret;
+
+	if (!alrm->enabled) {
+		ret = nvvrs_rtc_disable_alarm(info);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = nvvrs_rtc_enable_alarm(info);
+	if (ret < 0)
+		return ret;
+
+	secs = rtc_tm_to_time64(&alrm->time);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = nvvrs_rtc_write_alarm(info->client, time);
+
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
+	if (ret < 0)
+		return IRQ_NONE;
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
+	{ .compatible = "nvidia,vrs-10" },
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
-- 
2.43.0


