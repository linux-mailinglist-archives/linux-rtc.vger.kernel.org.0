Return-Path: <linux-rtc+bounces-4988-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC92B89C93
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 16:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D7C626144
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 14:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953942561C5;
	Fri, 19 Sep 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZNmBO1gb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C4242D93;
	Fri, 19 Sep 2025 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290579; cv=fail; b=MyftokTQ+qawyki6t2IpLPDhZeQucKYb+nQ9u43DwABklTl5YrrA3rhm2wOlZ6xt5RSGmFl9O0wMv6tRMg0oqbEw2pAp4eaYSQQ61ZL7VmGs6JboyGNXVA9n9CP39+L98TfbgwwX3k0ZbYHyMiMRCEiGNCA+pjtdulBKLwM/OiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290579; c=relaxed/simple;
	bh=6cRyI5pSzZIXy3dobLbnDPrKYBBRx1f//gF+I/vAGpA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O03qcWjmMKzABQDvHWsZHXD/n9Y1Yn94byuhE/z15wXTfkxEv8iHkU0itD4HFbcrOTOUgIbOst+hhjK9YB7yaUaAUhGfT92mwpEJYytIKEOspTe62fsw5C+xiK6BpQO0MP3ycyr3Uydgwuafi/LtIdoH/aVWzs6vLoHcdZxB21c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZNmBO1gb; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxODQFlpYLZkldhTNzMOUxh+jnY7EUx/8EgrbvEX2/O2SrL8DdMmHtxDiAEWrP3qIK2anshlvGGIiJF9KYyc25JFcIELaOYExbBznzjfafsoL1ltbUaXw2TbeMDOmIWG55smFmyyoE+p0tXP/8Ep8Hp+1Qqu4yCj4T94QFlShumUrF87dK+aaFUmuTPbzurKBXHC5uJ17PPfzqBLRBk4pp6XhqsoHm9M4hmUm2N+A+kLeLWUDCaAQCIWl5Ult0QWTpStKpzqVyneMHC0EJqw5uySHfRIWMSI1bbcDS100+TEhThEtfU+xsEQIdgQv+UUQeV120ZqewDwTX1yaGlqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ss3Nt+wwOnVeP+p6B9QEbCKthh9/Q2HVcedwcoUu7E=;
 b=t0xCfWJd5dpNrbNRf8wl5n8a8ahqTjuyN0w8jnD8n58pv6G3u2YArcXc8fAjGZxj8n0bBIAnHm5gswMMuqn1TrOwOOhTH631NlDydcTdZ1oCpJgKwl7hi7WEkeCwddMd1I0uxqjOLqQY/Xmu1/yFWkEfoeOsj0xoLvSX4hd07hgUsIlhz5Xy97TV7QbxIJPwA+v6odLBNmXCX2DpS7fzI3oDlzz3vl6tpc606hzBLNVut4Isjrq6z3hXDBq8xiS5EpJ79sKv4DiJTvBtbeNkpHG1oHyOLKLC+H/xPm8YnwQGst1EVtF7E1N/K9OAHRvhCIvHvvIWooEgWhYbBl4CNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ss3Nt+wwOnVeP+p6B9QEbCKthh9/Q2HVcedwcoUu7E=;
 b=ZNmBO1gbBuNT6bBAC9KRbA8iLaEHgUqUFuQJ3y9HKtyUAZCFGzrJgupSfhRuCkIq/RO7ZsmdCjAt+wCo/lA9uP++nQUyBES40spawgmXY9WM6Ol9JPHajpL+lJJltfgXvSZHwGrRJLlN39VkHuh6i5gwb+ZsVfEHgo8pyyS5P9UclJ+RxZL4ssW0JIKrJJUJHdPpH+ejGP4h57KGPzEP6u7UQYQGreAPS/dfCOL12/PSZNu64BN3tsJDEtxMgVQMB8lJMJjkQUtjBIiBCnhwL8RrG+4wgnQZxtp4+gV7MYb9hzTETyNS4qW518BJ4Jy1ZlCYY9xLHaPFh7v+RhjcRg==
Received: from DM6PR18CA0008.namprd18.prod.outlook.com (2603:10b6:5:15b::21)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 19 Sep
 2025 14:02:51 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::f) by DM6PR18CA0008.outlook.office365.com
 (2603:10b6:5:15b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 14:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:02:51 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:32 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 19 Sep 2025 07:02:31 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 3/4] rtc: nvvrs: add NVIDIA VRS RTC device driver
Date: Fri, 19 Sep 2025 14:02:29 +0000
Message-ID: <20250919140229.10546-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: 288576e0-f51d-4376-a4fd-08ddf78538d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Djl0xixcibjvxMPYaqucqCTCGvtByydvEPbfiQL7e+R0AB3G2rauNvzVJnG4?=
 =?us-ascii?Q?LNzf/rXbLerHzcOwWD9aAq/ace4BrXtzN/X5fDwGAshir69jW7eSrj3qxXVm?=
 =?us-ascii?Q?1g1oK6nc9Gq/FwTlFcch9SaD8drGeTpv31ZgdH25J0JI0aqtsZDYjjHabucE?=
 =?us-ascii?Q?5x3lAftwHTHaoHnwUA4KR3UfiPfiUMj67qTNlbMI1rhvMMjRrcKTOVjlGUQr?=
 =?us-ascii?Q?VS8byqmfbs6JOyt6eCGAZ8QeuXHfFMpC1vdc3TiI07e8JBgMdRcKOmIjKw/e?=
 =?us-ascii?Q?EmUn58P0bPq1OspBk57INM/iJ6m9CnQ3WbdaN+Ml92TNumJ8YZUBol63BXKN?=
 =?us-ascii?Q?td8xaSBjRS/SJNfBE0rFjmuvN3nZiQVws/WhldUiRd0uL12qw+qcFo0i5FGT?=
 =?us-ascii?Q?o4A2y0h65wOhbEBwausbDXy/eRDgax+xKf1MCaHCLO/U5utbF89K0XeyWdhS?=
 =?us-ascii?Q?1aphZuTI4TlJKeBfPjZJqYrQ57+TzBWyEr/wBZGeRCikTzo3vdHtDiUUwKpd?=
 =?us-ascii?Q?FgpsNyBIGWyCWkB0xd3xYGAn3SkPB2tlm1KGZu5oul9DUfiZT+Y/hMiHz8p6?=
 =?us-ascii?Q?2e7yVKVLAZ64kV80opZrcg2OF3tAII6N/vD4am/BFE2SCaYgA/Ke1RKni7U4?=
 =?us-ascii?Q?rhc4Eo/excFaCBtczo1ava8T5TcGmedpE8HrmJoqB6AEnr3iI9NGC8fKYiy2?=
 =?us-ascii?Q?rL5mb0T49+cn56UMce6vElKknnfj9gz+cvkwJ7kC/O1UNg03L2W+oQ8Ncucy?=
 =?us-ascii?Q?TAzRDdZhxJcG7qDVjz3EKyVlrbTOIQqNTDRPsQ9jrFuhNsYSlrF6F4J6qZKi?=
 =?us-ascii?Q?n5k1dGtVaAD7Kbd65hWsOaLj/bKFW+AzRUBAn1trTrjcOWbPimkBctxYmhw6?=
 =?us-ascii?Q?SpimeQciugBJT4TQIAsjqhvUWvni6774Sd23EC143CpnXp0OC66tC9PQTFc2?=
 =?us-ascii?Q?K9Cy6e5Ul2VG8pYLnEG+VePF8JWXFEbUVIrNy3Q4rJoVo82v3YuC69ppAfOZ?=
 =?us-ascii?Q?Bi+h/6+rxlENrO/JFXWCpx/CQWU8d+UqB8ZXcB6TGvtSfJlJH0HaetGaRGAr?=
 =?us-ascii?Q?oib6v+ZqIUkm9gfEfqz+EGRfMvdmbRYTGEWnzwQWKCIxpuyLd+a05AWcqeox?=
 =?us-ascii?Q?tczzF1VVrzVA+IFxSqb0342FapjXVEAqkXfClAom5PLjbn8i9MpzT8Ptvenl?=
 =?us-ascii?Q?I60xpyYi9/aYz9g6RjZFki2u+Nyj8kQ2fVRlXi9hHctgowRHUFUmJ8vE380R?=
 =?us-ascii?Q?OMwFowNo7ck9JjLmLisYj5z7WdSm0m2yzW/Nu+qeRF4f+Rl9CvhGp6TboU+i?=
 =?us-ascii?Q?abksgpYbm/QlCFJWeqPTz4L6yh80s2gIpnQfYCgeWaWhXcgVPQsk3wBkrfDO?=
 =?us-ascii?Q?vvERFaRWjZRqTWU+Dq3Xlp9ddlUMRk3zmIVfLvAnjyZXByF5s5a2X0b0OKUX?=
 =?us-ascii?Q?rfce9IDI1rmOOJZSPKbTb4KgLXsUrsQ+cnwQhbJm0lUsKFx69SJpP8ySeH9b?=
 =?us-ascii?Q?VhE96djtY7luzq50ORk3fInu9g4Q4Ct/wwFd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:02:51.1281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288576e0-f51d-4376-a4fd-08ddf78538d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B

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

 MAINTAINERS                          |   8 +
 drivers/rtc/Kconfig                  |   9 +
 drivers/rtc/Makefile                 |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c       | 508 +++++++++++++++++++++++++++
 include/linux/rtc/rtc-nvidia-vrs10.h |  78 ++++
 5 files changed, 604 insertions(+)
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c
 create mode 100644 include/linux/rtc/rtc-nvidia-vrs10.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8886d66bd824..0bd459932741 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18347,6 +18347,14 @@ S:	Maintained
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
index 31d355b103d4..609f8c67f36a 100644
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
index f41fdb4fabae..36ffb10cc9b7 100644
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
index 000000000000..4c488723854c
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


