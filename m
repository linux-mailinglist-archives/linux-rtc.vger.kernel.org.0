Return-Path: <linux-rtc+bounces-4309-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B1AE003C
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 150A17AFC5B
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249C7266568;
	Thu, 19 Jun 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pFFz6zqf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD1265CA4;
	Thu, 19 Jun 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322701; cv=fail; b=JGw9hbRrKwUrDF9KS0qoR9KAgv+sfVVLb4ogKRQKUMAylqQEP1zIC8eRIdaQy+kYyTE7uNhL1yClWLg/moR0PXUpB59OQtIbeYgQrxoCB+2MgnCxUCba+Ws6zEQxa2KgbjNY4DC2QZw8mYWHyPi+4s9pnYE2rUUM2GUTqVwBh9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322701; c=relaxed/simple;
	bh=WBHE4X2QzBVSTFYfD5fJuYyhgaygK2I30iG5GM0LaA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxU9Fe/FswrcmbfFBOQYRzDB1KrroeBfVbkvydxwXbUDoFGsDxCoE15Hhmg4RCiKNzjOZmh4tzYJiI/puXzajDK/7WrqQxocwdPjwtLmSIR2w8yNKo83O3K2xyv9XHnJWfUtTrjPB2JcGRIpMl8pjqbdo3hbk4NTILbtG7jPs3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pFFz6zqf; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0kXW9HIGTcRQZajIxIZOuHE3viUlD9wAhpQjm/sKvxeVxrw60i+VkYJJYGP5+l/LEpyijTQM70zv7nMkv3UaOk1K8ZThV5WmmQxwPuKvk0oAj6bhWcOyQQrC8LsuknC/i7vSG2Eb/4rDHm4xKrif15+6c6N8PIiSmTJJzVa1IVFNgCubDey2fd1Gq03ao+tXdid+ZIWX36LQUsKPW3Ywt7CwDg9N0/oZnu3MGgQO18RsyrVMl/HAX8ktvmhOLYj93RcAf+i3CYgh/6Hw+/fdNbMgOtHgKqi3GpF8fX0NSETHFS3/NBftGVDt6MiGGwx1YyRijou+/aekqqSq00g9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vkBdokrRcFxMT+NQhUpjzMCuiJjthcSo8zAhBLWOWk=;
 b=KGsJhflgneKKAhtiC9+3mkG9hB++aHbZxCKZTapaa+ywzwZdTh6V3iRsBDKouvHBzxbjtOGhYlqJZmB/ZRF+mIOmp+xnsNN7BFIZdzUEpr2JlYojM5odlQJ/wcFvApvPkKQ8ZAAKXk5V0NNEpYLsuzkoRFYoifOUoN2hTyIVsWO7FyR9vPXQGVEqpnXQ+c0/iM4on4UAh0aPDBOGd9kNmQXVgULMEl8ERQCueoVNyijllHLv43KY/zXJMaG2Zo1gX/SDTMiFcLLQaiMJamHahHd8jnF8E+u12Tnun7owa4tSEHR3ckklzLQI3mtNqvVMzAg1NaL8tWDccEokMZtumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vkBdokrRcFxMT+NQhUpjzMCuiJjthcSo8zAhBLWOWk=;
 b=pFFz6zqf1EQZrtKWssT6dLEbNMQ1xYiulCWVwgzP6+klm9+y+oue+uo8ywEE3YPHAYl9jV8PG5F/+pUTRtNsi0VMA+5GmMvpc1VJ8mDWnpBxZHm41PDXKFhhn4lduXYbRNIgMSgAjf4h1SMLBTFkQ4Fh6Axphn9oZxXU74gDEVDcTA51nK6JvOCCionnpVZkT3/YG1cGPrqNpnRC+CY4+2SjX5UdXU9omKQqUHI6uVbO3Xyr9Vqp9N0ShU/xTur/mw8PoarzOJdmUiesaYQsOEtaHHTn/bEJRUQ3rPKo15fOHv7UcWFrvZizKlx2Gf0ZIVj4yd2tG4Fp/hyIEcsD8Q==
Received: from DM6PR07CA0071.namprd07.prod.outlook.com (2603:10b6:5:74::48) by
 IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Thu, 19 Jun
 2025 08:44:56 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::2f) by DM6PR07CA0071.outlook.office365.com
 (2603:10b6:5:74::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Thu,
 19 Jun 2025 08:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:44:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:40 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:39 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:39 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 1/6] dt-bindings: mfd: add NVIDIA VRS PSEQ
Date: Thu, 19 Jun 2025 08:44:22 +0000
Message-ID: <20250619084427.3559207-2-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 21364b85-2ab3-4b15-aa38-08ddaf0d90e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6GcniHtD4hHyMvFsd1RHPP3OvwHHnAl/Mp+nGW70XWRuSuFOu5f57HIKCDZ8?=
 =?us-ascii?Q?nTJXhQzkZU6EA6bglfXO+wD8nZNHyH8/z2ehZpvRSRdZm59uTVGb1pfjgw4L?=
 =?us-ascii?Q?MrQoFtVEJ+l73LvIkTOuIiLJ8J2RLD7DPRB9hn1LGfrjk7f/cWpqSl9deJ6B?=
 =?us-ascii?Q?qnY3FDRPTKtrspmfrw1pdETB5hk9U9rNUaE6TD9uZQy+ng23+KaMbwk1/dfu?=
 =?us-ascii?Q?6F0cuw8syF8D5+Ve8cNA+KZ6AXfNfEf6saRPZO8/069JDYBOk3wFV6Wy3NV1?=
 =?us-ascii?Q?WD5+ZLflt+4BzkD4bWmyrib4lHWO02F/96+mII3IN8tHo7/TnQ3SrOyrdq+m?=
 =?us-ascii?Q?XvEGgynLmhpogyCw9b7LaBcNHK9XGcRN99kkhzJTr6gmKMqPpLjnMBAjsO8m?=
 =?us-ascii?Q?TE7vHuUxI2tlX2mmcn3XbXsVPvRsW/0ljt+oTzmFLz6GjcHhb7X9rOjXzk83?=
 =?us-ascii?Q?93EwaRJOem1QxMoKiGO6hjjS9MCkyAj2oY5/0dsWmy3AUlIwDLOVVcB7WMWO?=
 =?us-ascii?Q?Um6RT+8w1Zz+S1T24xnRKMbYouky1eJMG6WH/AP1Hs1FwuFNf4rlVxTMeGTa?=
 =?us-ascii?Q?dOPaCCWt1ort4mF8wk39hytRJFDAMItVCvbZOQhfjeLotxdyVfL7vqf1tTP1?=
 =?us-ascii?Q?XwQb3ae339H2kKobwqG4pux37f8uFHtU0xnYYtN91lVB0HdjL8bjpAmYpL6A?=
 =?us-ascii?Q?EMERG1Ht1WkMLebh/8U24osd49Fq4kA+Ag4bIxQ1Fom6cPOAqj11qhJFubgT?=
 =?us-ascii?Q?HnDNDFekFPb/WSS9U+O3aetYdKDzskTFw+dggmIbWatWzTDuk6I2PlIJE5bT?=
 =?us-ascii?Q?Efr4A+wAf1KgJBcbeOnejRXecET8idoKLYgZKtbFv3XwlH5QOv7EWuo/eFgc?=
 =?us-ascii?Q?S/yc/j3eCxq5Hq1URMq5ZahvU7I9ISiQy2XzbSaGpT9ZHmkcSbvedr+SJWUW?=
 =?us-ascii?Q?pTdzpSKF5JYoA9SuGq0+puXTKOLnCfFC3iNfUlHcaqh5LxoKwyoAPG1mYqgy?=
 =?us-ascii?Q?6XvM2oEobVznDFTuExFHVOhm+L28TIdYHl633+iU9hcxsk6ERDGfaHDzuyRG?=
 =?us-ascii?Q?nxw4FGlPo5m+mS6Z3tT+i3smvvujSak18UBa3yMH5QdOFdK+XWSzN3rNPh2p?=
 =?us-ascii?Q?55qpL5duRQULM5XnTj/4/iJBcLXl4QzpmGsYavtO+TcG2KfOIfEhS1a86g1p?=
 =?us-ascii?Q?haOLQ4g9Mzrq83GK9tcldYhKbC82J9P4170KeXxSAEU5894NSEjVGw96mwDq?=
 =?us-ascii?Q?ZZmgvVdJEEe9oq2rBU/RLc4wOFbazXcop67lxVw85SSDJX1O3oB//fqhuwVA?=
 =?us-ascii?Q?qDbw3Cl7TTpl+i+aG2X01C5CIP4vn61DIXYJSzcuq3OZblaQFBpjGZ4lDdoL?=
 =?us-ascii?Q?aMyTr14Qcpc2VobWxk6sE8GT40A52H972/znLDZTrByNGCfU8H4K6HjGOqy3?=
 =?us-ascii?Q?AUBE8sXW5/buJ7p5Bvh3FtzKeYo1Nsz2qG4KMLr6SyLOC6KJkG9P1WM+GZ/s?=
 =?us-ascii?Q?oqkYaxxyTa3QpxamO+EdCiGCRuxNweZaFQ9X?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:44:55.5650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21364b85-2ab3-4b15-aa38-08ddaf0d90e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493

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

v4:
- no changes

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


