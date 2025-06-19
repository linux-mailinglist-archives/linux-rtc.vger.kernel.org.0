Return-Path: <linux-rtc+bounces-4313-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B5AE0041
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF3E17AFD39
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05178265CAF;
	Thu, 19 Jun 2025 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KLa1DHUu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4508A93D;
	Thu, 19 Jun 2025 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322709; cv=fail; b=l73qd1B0l2I7HVqmyIF+zBZ+w6V9GtTB+M0xYD79w1J1fkpw+31DVNCAuacxBiZf/QtOZkfz5+j//vgTN7foQIcac5leeP7r1uwOS0ttipaR8hi/tU5GnHQf6aisZRjjeN0cKg1Uc21flF+a1S+TvUblhuX/JOZrKaZrmZ9QT+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322709; c=relaxed/simple;
	bh=UPhS4hVCqVhqdUGgf1/i2c9rhTzHfcDi7kgTh1nycXY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWat+rExIE5ui5PQRYxjnzjFo8PQgL2lf2tDKCLxBjDfQpJozNQII7nxI5wMibK5BSjq+E1WzwW7X6xt74fd1JNiGWwZbBgoBrvqECaIYUNjkHkuvnA53/sSlWooPL2fSK2bBV8Kdg/NWAzy9ZufhO1Zuj8OeyOASYu1Tcmvbvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KLa1DHUu; arc=fail smtp.client-ip=40.107.95.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojgHHnkgdpJMTYyAgcmHYB7PFk6gZa3Y/keNHJLCKaGdwWIH+j13U9X26Yx7wGoHW9uw9F/YokVz1cBFIw2vSAG0lYEG/0NoowGg+jMHVcIIZ0d68snHlaJKCWB1C1hT4TWcT1sDvIRhklipvf+uwBJ9cJzWcDthDgjbYJBqo9ciztk9/3mBEkp2UZkBgbvjb8trEOWmjgEqGNJxh3N1xMiazdQUvNnZuC3ZnGsQ8kcITkl6qo9Khqyqq81x1ud/qjYN9c1oHnUS+6EBQzZFMMVUNZw/7MwUvQZlHW0Q3Hur7+eqCf4divXOtyLt1jbPhz7pul7af6uDk159arlQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3WJTio4lCajsPxp1K0ujU6T3Mq7zGsyiivGvyAV1uw=;
 b=ryigNHmoTFp4a36/DqjM6Iff1jqUchOftmZFBgH7KX89e0SKyngAxbVhCFR5/bhAupKNg7UwiNTk57eG0M17VoZTCn15UJQC4wm6LjJioYTIbTfW5YCVi8/SFHUCX3h1Qkz4ncrFlgEGlNCKzQf369CkorHzVsSh+5T+pbTqB1odF6aLdxM33pUDpzCdl5ukbgWepxKQiZDtvwwRfoxZElSC6QvWbBuemmPGGUYYmlP8r3JckFoo0fG6kRwBvsWcXE9r76wu/YmCTpjcCc9+6qj8i1YRsTxx6y9bghB8wCf19ALKCt8xJ4Jp1B/7dxjXix5lGihimwn1yvVtqQf+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3WJTio4lCajsPxp1K0ujU6T3Mq7zGsyiivGvyAV1uw=;
 b=KLa1DHUu5iqADxZ+4VN2Yq/N0XfQDtUYL3QQaN+drfapPEazJiYfSVI9WGThsJ3aGL4ZuxRaVM43pjzL4G159ZO3YoqXZYEzYNQWohwjaVahzdDeAvIqnWVYQ3mRhEGoqDF1AmejDNxEtVK7W+E0Gcg4kHY66pvWDqh61NOJuUky0tU2hZzLoa+KIcuC42dsDz+yErmg2csyTiI+pMiL3QvzsSzKtaj0zoJ+N8jqugsV3jHW7mtJ5ZOCkvjQpBclAn9unIRvN4fUs/+LZW0/gAIJ/N/K0DNgUuFuhbA9GDt2JTWvRnt0iLwyb9ooW70Wfl6RC8loQ0w6gyrfXmRS6g==
Received: from DS7PR03CA0201.namprd03.prod.outlook.com (2603:10b6:5:3b6::26)
 by MW5PR12MB5651.namprd12.prod.outlook.com (2603:10b6:303:19f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:44:59 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::66) by DS7PR03CA0201.outlook.office365.com
 (2603:10b6:5:3b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 08:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:44:59 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:43 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:43 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:43 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 3/6] mfd: nvvrs: add NVVRS PSEQ MFD driver
Date: Thu, 19 Jun 2025 08:44:24 +0000
Message-ID: <20250619084427.3559207-4-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|MW5PR12MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 093f7e37-8a93-437e-757f-08ddaf0d9331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O6UprEuRP3laCxzRuZTPJ2wfw4QWi4jeaj5z/e0go+qNbzdFR0eNv2R3k8Zq?=
 =?us-ascii?Q?jrgutN28RQZ3H44vDRhX4V45OFkZYYUwd3ZtK4ZFDEQ468hSAqGMST3ILSB9?=
 =?us-ascii?Q?u/VdgUkO/BKwCpY2L6CW45Xhqtcw5ZhSL6IIJ6cMe2fAoarwf2izp6fijlYC?=
 =?us-ascii?Q?2zqy0EsXh/2CeM3h5+ydAtPXLU7wTuGumzGs7VVUGY79vaYQc8dD+oz2DX/M?=
 =?us-ascii?Q?b97H0MyFJ8K9z1s9NSdPFNyJvw4exybtFO+mRigf3eLhq7vI1b99BUIzQA+e?=
 =?us-ascii?Q?kyDDQvnkOR0euZNwotYQvqBdzRq4HGHWcAYdLA6QZrzqGRPQMoTixnHHn2t0?=
 =?us-ascii?Q?BDyXoXMrSXR9Dc8AG8XOmJvd1Uw/EDEiBqnwlFJmM0QIwB9DyoJO8B1S4Cf+?=
 =?us-ascii?Q?a/NjoGC7v/jGUV/uNfwKv+u1lWgn8hlnDhpFMQ/hbkQkdPwr6E/qUjZGC4bI?=
 =?us-ascii?Q?7QVBNf4YbP6pEKNgsJQee5DcKsvmB3ZPnP+BlPdFfK1NpTJwOUQ2udRwz3fh?=
 =?us-ascii?Q?8YwI7jysZJYyEYbFyhjBQ1zV0+GELB05nqIKxanULS0VD8EJtCG7SrokvwNA?=
 =?us-ascii?Q?e1Ah9x89h4eLnsw4Px6qp6IYjVpTUED+4zHKiYm1spGkGMy3O/aGwIZ1ne68?=
 =?us-ascii?Q?k+dqeoZj5GPXnP95B+iL3M9LgW7elB6OV+B/uC17w4+cq86qQm5IYib2NcIx?=
 =?us-ascii?Q?/Mclu+cwalrNbRiOOS1DaSvMPm2cpYqs8F7cH3cnL6triHRd7oryc3fPrHrt?=
 =?us-ascii?Q?SX7XgrBETmcBPZQJOlYCfwdPQQAO0ASeAswl/bo7L8y+lJaEXHpxnjFRlUhP?=
 =?us-ascii?Q?WhtA23VkTKQYGNMHG06/wrdYTdlvdaYccFuJ0Iw4Ovav0URq53APRg0YNkFg?=
 =?us-ascii?Q?2fhXo9xsXPyhYha3lPuzZKkCbAlfvDtEWwTmGy8ZqXjG8y+aQjhbP/BDoJzp?=
 =?us-ascii?Q?9VaNX2mz/5QWzxdta2b1Pdu47XkCnp21bZ8jxXnlleTXPPnQtQrUBcyPBrj0?=
 =?us-ascii?Q?amSPVdtWNWwOQeIQ/EbUteoGbtd9+SIX2EmjN7i8wNaBexJyzUnJWN3OsGhg?=
 =?us-ascii?Q?P762VWYgNwX2z6cZLpfr7jkzPVth+sjsqV9mKtUXRoZshplvNe5UsoLheURs?=
 =?us-ascii?Q?/3SHZT4ER7+psrP/VC6uztMwCbYmg0+g7ks+81blBsr8ELaqu6iUDb1qhLZA?=
 =?us-ascii?Q?HzMgc3A74H2SR6AwIz0fjVLmaIIdQpWhBBuWkwr6+uqf5sW5uSeDOXDhsmZv?=
 =?us-ascii?Q?DzsDz8mAxyGjChovM6wF6ZsMRFpqy6Lj43bR9g2yRM2WaSjrRbVGTB2cBhid?=
 =?us-ascii?Q?0N2UwphVHSxK5SOo9WnDFum6WKgHJTQ5jR7HSClJT2jGC1URw9kIPz95ORfC?=
 =?us-ascii?Q?kkriUTgg5aw7EhMfDTDV9sNHfigfqQ4eg1V7MVh6UfTiJYdzGxa987EB0L16?=
 =?us-ascii?Q?a87x76RreiquOJ40SpDOIUIJGH91KeQoD+FffBeRvVuO9VfQmcpPu7RDviqP?=
 =?us-ascii?Q?XSk5XvRaV+/u5Xd/7GG8+NmqwbNUexVujg02?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:44:59.4037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093f7e37-8a93-437e-757f-08ddaf0d9331
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651

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

v4:
- no changes

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


