Return-Path: <linux-rtc+bounces-4271-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AEFAD4CE6
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3943A2D6F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354C02309B1;
	Wed, 11 Jun 2025 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gwAjop3X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8189C2F85B;
	Wed, 11 Jun 2025 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627321; cv=fail; b=gHGgq3qITWV80XZ4HGSYErwA7esC2fDlzXu/lIWO9/isQphFsbGRkid3e68XcysKjZ8GP01w196omZ1H+MLdD+41OnN0Evb61MbN/rENVIPC8gkTCbVKZ2SHfAFKgajOJEtIU9tUbzup/zAKyf0qevwCHsDJLvII5Ur+azziCJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627321; c=relaxed/simple;
	bh=q+tRzTZHc1Fei38vn03XQpjQZLG/YEAiYz7eFPB9zGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxdaxyr8wJCQTVIjvfDV3R3S4jbi9KENBifuDoNrLIQBR5dCiQ/Juw8VXPExLSnNzyKmZ6Z1Ld+ALlnHXMs3lJFwOZR6U8lBW4TnlCqRXHCDOGTCMYMiy1O/t2i2PmxJV5zTocOb/qhv9jhRWYedM7Km+oNM4sNP/V5Y5b3n8dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gwAjop3X; arc=fail smtp.client-ip=40.107.100.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmKrFzkR5PQ8emf9yytV7Qw8PRpqx+d2mvNDe8y7UUMYCKtXaA0ntXDD3OuGVLlMFgKI2ecqeG2oTyJIM/FaelAhag92s6TMp66mZHsmUPhCCA3zMdZJfIijYNJTS8LgcubWAkJU8GUOsCJE9zTVtDkl3b/UGC3tHUZL8P2v6DcAivooEQD26n2fhFStM8dSYSZGZHWGZIH0ztzt808BITfn4dWM5/zzAVimKr8hs2r83m+2dzm7ANWyFnICLZh6UIqdu5xQSXgJ3L4OVCbHPftTDrndtcj/+xQd11we+F9lBA3aDnN9LjV/8uQKLZ2YwxDtcINcdBm4+lbeOmB5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R515x1/V8OarFVwhJBMHbiutCymbxNncAqDgJPO8NQo=;
 b=hx8y53SCRaI5Ke7NXCcft0e5WUW1HYqdrfPk0f1uBuRMdd1Jee23muVhl7i+Y+cPVDuSRU2mcQXyBZhX+TBIG3mYWB3kuImDvI6bFZTadO/p1VHd5tcPe1VgonJUMzoB3d2eAButcjAd3X9uzotruwLc1BG5gH0PHKPrH2KEFAtzI8gQ9Gv3MQBpYM0vLB1HCbbmV8Gs9OR+g91HUp5jHvZCST7vhqJ21t4nnCv2tEwWRdcVccpnVyg7bd1RkMfXOSo/Btyqrye91nbxbKkkAKC7nCouV0qPtgbd+BaI6HGCFC4aRkrBR7bnT1xSs1VOmd2Jg/GaQyM+9ptCNYQeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R515x1/V8OarFVwhJBMHbiutCymbxNncAqDgJPO8NQo=;
 b=gwAjop3XqwGhJRJk/FOB0UQXSBsYKs8PjZz0F1T/9QaSmpHttvIrQ0X8SuCqA1yPaHjFWcO3kKyDDVnFYdTvWD47zckStW2jarLmbq1aVQvXCpyvS2h/NfaEdI8uce9VZdmExmgbTez6KpyNYnZLUI8rE2sbQx1pEEWxAioGHqolFiXjBNeN8xkqDo3RdVQ/XRmoH+YHJ3rQGFkyMnHQREzmr1e6dEOzkDeRjgeWkOeiwFQzi8ilIg/vwnR4LTbs+EuxofGy3VWf8teHUC2GOWCpZcunw4ULX+oczLehvW9ShiSXpPnIaNBEtlSqVX3hWdj9qLAnoiX6L7A6s/sRKA==
Received: from BL1P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::6)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 07:35:12 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::c3) by BL1P223CA0001.outlook.office365.com
 (2603:10b6:208:2c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 07:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:34:58 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:34:58 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:34:58 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 1/6] dt-bindings: mfd: add NVIDIA VRS PSEQ
Date: Wed, 11 Jun 2025 07:34:49 +0000
Message-ID: <20250611073454.978859-2-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: e37c9952-9540-473c-bd9a-08dda8ba8082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H5w6xbWNsvtEzVlmJdRQMSN3YX747ufAEju9ytH5X9egPc5Ev/lafvToIkda?=
 =?us-ascii?Q?EHmgXuAsoPRKqXdfq1chQk/+yHsUD39+pX3fvTGtjCLy/s5fBFMOOhJJCSXm?=
 =?us-ascii?Q?pSjMsp4A5kTdMtaJRv9eYHMWt6awrs8Qw7th7HQhP5NOvF3jc8KV3fb1hopp?=
 =?us-ascii?Q?nc88KEZ9QYZ2jLRrmkXqeLSx3jAahB9u3xBqFiCI/WdX2TpOQFs0nv41b+GP?=
 =?us-ascii?Q?k2paq2AJErtC73NFl8h+GwTgA898wwJNdI5YmbOjiLDFIfAS+rUrLYPv1gh+?=
 =?us-ascii?Q?FpY2LikSJnpY4lRUKF9L64U8+ehpeC2DRqNBBguCLKnvyavifuBt2St4/YJ6?=
 =?us-ascii?Q?J/pWYurJBDADDuMtsG6N3510tY8+CyfOsaO56+Dbmzi2MGrDCy9hwVETR8aK?=
 =?us-ascii?Q?4gLNBLY815bAAeyBamHj4u8aF61/HuWY1plKO0fx8blktHP+OAy1xSb7PsSq?=
 =?us-ascii?Q?5DoZNXe1+AbUFg9Qi9zckUKNf2RRRydOydmNeemq4Qu99Zm85XvVBbd4OohT?=
 =?us-ascii?Q?EyVIrqezzA532lUbR5hHuMFU5ZTcM94agvmj9pCHdodteD3iPjXyeN7JlGVQ?=
 =?us-ascii?Q?FFd4uDrZyE0VYop9kIJ+QzsqCKCzq7mhs5FLKVSVnEAq/UbZcVFJdA8H1mBZ?=
 =?us-ascii?Q?/zC8iLGHIPVoLZN4ooLg7GsiA1kXYkagUTC0AHjSWya8WUoZ+ml/IJN6Tvcq?=
 =?us-ascii?Q?drq5B9BdcgNg9Obu+sAwm3VrS8USHhdQ6nqoc4JFFHUj1QpAGzuoQ1HBrcSZ?=
 =?us-ascii?Q?p+PmfS15l4fGec0rAv0RZmhRB0lFcLekCscph+r0Zo1DQu08ZlX0bkS0ZbY5?=
 =?us-ascii?Q?YpV/2PyAfzw9TaDIvl5sEjSYd0su8F7tiyh8yPZZp8ryZ5eOQ9UJtRTzvt8R?=
 =?us-ascii?Q?ZIxjRPt+WYbA9E9hEllnL5xr4MVK2WFgGvG/nZ/PrdOgm+RMxO628O7cW2Hi?=
 =?us-ascii?Q?pJ4vKx3c0q2SvcH1BQlanEy6FbVdfC6OgDHqGhelknI/Xg8rCDeStNCZj8dc?=
 =?us-ascii?Q?+L/cStOI1qdfIi1BTFMKvHiUYZIqkytyupNoikL6HMQ4UujTuPygHapmOUoX?=
 =?us-ascii?Q?Frpar0fcmT/w7Sl7R8qMNv5NzJePXVkeAj4dPpaIqtRcQHUyHezciuXWz67s?=
 =?us-ascii?Q?SSOG58MITCaftVwbgNm3GeHpLZCmXuucAyXroFQaA1NL9lFWXQkbME0svWc1?=
 =?us-ascii?Q?eafyoWnKVwyd67bLLkvO2ApUSwvTC4hGT3OKMQ2nAdcZKapwLn2iB87EQDfb?=
 =?us-ascii?Q?sUcXA2IQyT1p/irhNObZ5SmySL2AMQxno/xoOsLA4nfpLRXfT0FPmWe8owT/?=
 =?us-ascii?Q?GALBkP9r9rkkyJ8fGHjo45IKqkan12LDefXBX3L0WYGAAsLK/elIqytYJRx2?=
 =?us-ascii?Q?6B2GxsETc4UB8BBKpHFQ68YNAx3x2nThVC2ebmlV6h0k6oPafvXljTPKY6kL?=
 =?us-ascii?Q?TV1xwip3BMgYIcgesUk0VqpsGGz8UJnm++W7UPOn7TWpPtu88FIojPduR6CW?=
 =?us-ascii?Q?LWWqkk4IjMFIrrO9urFGzhDAn9BckmdDR63u?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:12.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37c9952-9540-473c-bd9a-08dda8ba8082
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

Add support for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device. NVIDIA VRS PSEQ provides 32kHz RTC support with backup
battery for system timing. It controls ON/OFF and suspend/resume power
sequencing of system power rails on below NVIDIA platforms:

- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation

v2:
- fixed copyrights
- updated description with RTC information
- added status node in dtb node example

 .../bindings/mfd/nvidia,vrs-pseq.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
new file mode 100644
index 000000000000..65bf77f70c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nvidia,vrs-pseq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Voltage Regulator Specification Power Sequencer
+
+maintainers:
+  - Shubhi Garg <shgarg@nvidia.com>
+
+description:
+  NVIDIA Voltage Regulator Specification Power Sequencer device controls
+  ON/OFF and suspend/resume power sequencing of system power rails for NVIDIA
+  SoCs. It provides 32kHz RTC clock support with backup battery for system
+  timing. The device also acts as an interrupt controller for managing
+  interrupts from the VRS power sequencer.
+
+properties:
+  compatible:
+    const: nvidia,vrs-pseq
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell is the trigger type.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3c {
+            compatible = "nvidia,vrs-pseq";
+            reg = <0x3c>;
+            interrupt-parent = <&pmc>;
+            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
-- 
2.43.0


