Return-Path: <linux-rtc+bounces-4984-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34179B89C4F
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 16:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8E51BC3D84
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C622256F;
	Fri, 19 Sep 2025 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="szwD/i+X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22C30DD2E;
	Fri, 19 Sep 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290414; cv=fail; b=k/to0sZGRf6HsotK2VC2LFHAvFpV4WVt9j6QEVB8iwDZiyXaFHhK8TCXWuMDQExMvwfLp6XS/BQg+k069LqzAueGG96pbvgT099lPpOkwB8pK6fYDX3VMwwxWVarSO6Bil/y0QjkvmDv9FHlEFMy1YH5GD7tRdvsc9QEB/SRHEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290414; c=relaxed/simple;
	bh=nZd7ldzpjJ+hvyUUpixQsaKrJ41jKT0NWghzW93QJGo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o8WfT0Zxf33UwlSQt6QbBTeqz2g/hXYU+722EARYoFlIpBWuqQuhzjvy5P685U3bqRv3H4bGvvlUET87gtFYbHYnRxpAdNLz02OVCXBnm4BHXXAwJYBsV1jmOfuxpIGEfnZTvKoGhtqIWdzXfMM6AO+Xul6/PYlHRa2oF/VjQNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=szwD/i+X; arc=fail smtp.client-ip=40.107.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPeYMI14VpzGUFh+eylP7CSaY0Nxg303NbNsNZAgzTFLvRl1a2Cm0HhrfH5xqN0I8Gekk8jASvmmUyKyg8iXSiMH0VvzNSjwQ4ik2XEvNbbzRhx0+R5brcsy+rtiXRG22bwghQTpQrKVtg1gabcQC1jcD3qhL+UPiZUqDNT9vIRut1vDGPMQ63su96oAaGkm5D1QzZODmRcxcQ7FCrdroA8HabeYNweQxkiRaG+5lRwyJzSkZnVhoVJjuYfat0jN4BgKE7NdGuOn47GEdTCRYO+OSb634o7/YFtnW7S8fYB+ZN+legNMZSB9C7ZzJ+S6AsnEOGFP5IZaNJWQ/vtcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ5T4+41W/4V7StdUWtOL2Qhltzg655cTeqA6T6LmJs=;
 b=NddNatSTW9vZY6PdZS8/j1cMjo14XnLN+/6EA4y5qGlI8xLFsyAdHEjAYgPmwvQbdu9huz7egRgOiM3UYhKEegM/3p87z0a9M7CqviEJ9pxTETtgTEKYrzSkgwYiPDAqqPj9+nxj8zzNGDMYeOTch7c/FkU5AyD8AjPXXuvep44/qJyUWgTS49wkOE5+UrziI8EirDVPv4mHq5H4O5mHFLgSEaTb/pGrLu38x/+brKVnzL1yf6CEmSa7VbGtwhK/7slh47wzmEPMH9eSjC3Mux9hQMhycUvzUQJfkahOCbok/1e+zmtktvTPHFYqBqZXA26Dr9Z1MA00SAsEDbaCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ5T4+41W/4V7StdUWtOL2Qhltzg655cTeqA6T6LmJs=;
 b=szwD/i+XyJJMHPWmZxLggpqBwfC9JUhF+c7ckcXr1tw3BfPHje2ENFFhJIOfbtHYcSbQWTiGPc0ZHqUvAkZs68N/FWLtlsXBDtxSDdiqAwajvjPDabMNBWnJr6uJ7564g8JGWwRRzAPn7hO3aK+JnkWhP57Ra824gkHfwosS6YuwUGjAMdjF0lHbNxYv0lj8B55BlPA15tWKaLYvFC9jOp8kOVf9r7NiVL2GTrUW1qudgy5jaWzgaG7+LQfqjA66A1fgqxBFfT5m3c0HgtlaEopftAfWHi3lG61ldQi3YukDxidLmc9mllBgNMIU+GED1B0RGb3bCeZ9YZa4tDCrnw==
Received: from DS7PR05CA0029.namprd05.prod.outlook.com (2603:10b6:5:3b9::34)
 by SA1PR12MB7127.namprd12.prod.outlook.com (2603:10b6:806:29e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 14:00:06 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::9f) by DS7PR05CA0029.outlook.office365.com
 (2603:10b6:5:3b9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.15 via Frontend Transport; Fri,
 19 Sep 2025 14:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:00:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 06:59:54 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 19 Sep
 2025 06:59:53 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 19 Sep 2025 06:59:52 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Date: Fri, 19 Sep 2025 13:59:50 +0000
Message-ID: <20250919135950.10403-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SA1PR12MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: c444b18d-cb7c-4e56-83b2-08ddf784d68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TKq8dtJNuMhNpO0hkWfayLaEvpzGXwXQEp7tujHwg8eeZth982PmyYZ4Z1Yh?=
 =?us-ascii?Q?4Hn4VEcmkTQ5PD+yxQ9OQZxkqxt4BeHY7KIOzRFDUm2rT8QdF4iEudxxXMkb?=
 =?us-ascii?Q?IgZ1Z8N0x+2qcafCIDYIQqBEkTomwJsvK4pzZnV4DoSZQLRKR1Q1FiCk7Tgu?=
 =?us-ascii?Q?4ChlZstrkkR17a3fS9hu0fpC3AYc5mHLUyW2Vgi9KsnjHV8sjpgkEoGEcJ1w?=
 =?us-ascii?Q?qbZ7uJiwegMpNsfmbt3tl4/C6RSzrqjsZLeNAItDW5t8/8Z8Z0GdofaKVucP?=
 =?us-ascii?Q?I/5OaC49UwgMAerEXvqh7jt7JqU7yCnFVdBZrPiw986lYIsUT0LmxFNAfVza?=
 =?us-ascii?Q?USXFeMrfnXU+yauLGLq356gpRmc3FHLdb8RpHOhCZ35i45fxNUUvITNLWicx?=
 =?us-ascii?Q?QebezsmwmFZJ7cluqGNdfYHb4SoGKT/R/PxhGuCNpLuIXqWmQOKK1NAKD7wK?=
 =?us-ascii?Q?zVMPnyR4DWTq5584AbB7+43KlPOPYJV0yDoQuD16ROZsAM1+1Ymk+Roq3Dqq?=
 =?us-ascii?Q?6WjjaJ1hq/1ycbxq0I98atIBSRp2AYs4HeIkOOHfwYFqnjHeVR4S/JuhQBgw?=
 =?us-ascii?Q?pQeIggx+o+GcigOslP+GoT2R8Ya735BXETWyal6WolmtzdaNJUowfIrjJK1i?=
 =?us-ascii?Q?4BSYoxqCqjkt8mGbCugfPMUntlExLbVHk1v/NCVA6FDAEEi2ViKrF9hNltU5?=
 =?us-ascii?Q?9doc1KcOTGD7BZqH63WVqFV1YFGAkyjEYvcQGw5mOFdxtHly7RHfOVFKQvty?=
 =?us-ascii?Q?yV7dbzQp67oO/PMiZBei07/4Rteyx8pf4y7IWIhzhcqwupBZGnsRALzrvz6D?=
 =?us-ascii?Q?pgx2qwe0eIJYuPwtEaLuuiYySj0DQ3SRr9/4V2EkgYL5/WDdmjaAxq6jyPN6?=
 =?us-ascii?Q?K4HPxDIQig2G3lixDNU/0JBNZqr1d8MXoFFL3rLElpSDjp88fHMYQpl8NJ7H?=
 =?us-ascii?Q?OE7meL9cHGbnUxMVNKHW2PBgT153zM51ogS3XiZilScs68LUHKgNcKpRERUn?=
 =?us-ascii?Q?RGQrKAnphfNxJq6nReUX0Y7YGm59ssgis0fL3KhxvSbbUcmQsj+lOZgWwX1i?=
 =?us-ascii?Q?J2TLb+gegnhyK5uszW9jL/EqpRgB9ivYtyyijBlWxegCOWDqGh+02yZC2vfH?=
 =?us-ascii?Q?AYyYN/H56kTbXwJ0uQOjsdG13I+Z4QS2byf/1Chrm0rlH2abyqABE43Ir8WV?=
 =?us-ascii?Q?L9aMBdfxydDvcT1Dqb80KhOsWPxj7M0mTECcjLC6AiRBbsJnkbYtARPhJvBv?=
 =?us-ascii?Q?ZjnrJZOpPsr4pcs9DIANLyWGC/iAp4nLjn5yDmilcZkn/NEaKYVQ4Y+ZCRVs?=
 =?us-ascii?Q?0IPYC5MziwfACljBwufHvBhpxTeMQ2HFfMv9+frgqRaQPBm1fFfI7upg6ADU?=
 =?us-ascii?Q?HjvlCsR8EOhNaGPkGxCoAJbXqrxktBuCaRVHH1xA1IoLaLOrFXLHt95XVlnp?=
 =?us-ascii?Q?+WH4YixndKxL3NgkQ3olPCs3gYVajtj8R4KVrG9lLYPzKNCg7Q+uosQf6kTb?=
 =?us-ascii?Q?9R+VulxxhYxIx0eFxjbkUvUys+cDhLgOpK+4?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:00:06.1948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c444b18d-cb7c-4e56-83b2-08ddf784d68f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7127

Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
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
- changed dtb node name to pmic@3c

v5:
- moved device tree bindings from mfd to rtc
- changed dtb node name to rtc@3c
- changed compatible string to "nvidia,vrs10-rtc"

v4:
- no changes

v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation

v2:
- fixed copyrights
- updated description with RTC information
- added status node in dtb node example

 .../bindings/rtc/nvidia,vrs10-rtc.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
new file mode 100644
index 000000000000..e8f3c25607e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nvidia,vrs10-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Voltage Regulator Specification Real Time Clock
+
+maintainers:
+  - Shubhi Garg <shgarg@nvidia.com>
+
+description:
+  NVIDIA VRS-10 (Voltage Regulator Specification) is a Power Management IC
+  (PMIC) that implements a power sequencing solution with I2C interface.
+  The device includes a real-time clock (RTC) with 32kHz clock output and
+  backup battery support, alarm functionality for system wake-up from
+  suspend and shutdown states, OTP memory for power sequencing configuration,
+  and an interrupt controller for managing VRS events.
+
+properties:
+  compatible:
+    const: nvidia,vrs-10
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
+            compatible = "nvidia,vrs-10";
+            reg = <0x3c>;
+            interrupt-parent = <&pmc>;
+            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
-- 
2.43.0


