Return-Path: <linux-rtc+bounces-5071-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F91BC1995
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 15:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA2561898013
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EEC2E1C7A;
	Tue,  7 Oct 2025 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mjb8dYC3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C212E1757;
	Tue,  7 Oct 2025 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845483; cv=fail; b=nprBb5koNPAOeizTA3TAiK66/EXABrHkKsZ0y4M1jBU9xjXlSBYVvTdguRCtcAFs6Uh+SmI/GYA8gSVcoDH431JWLNaWPT4VD91mET993NpYaX98WQ7f5MGCsh0deb5u5Db1xv8e885m11/8juFEq1BhHxIF9cGKag+TcE+jWbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845483; c=relaxed/simple;
	bh=N8l/CdU65XS9UIPwsBhnoT/qHJNMVj14dhDb7iRpS3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3ZtA/xa7LdnXaKxxZTLvUYTkYS9n+QH9Alw4N2mBgIidE18g8fMbUKAYxezRXbQc3Dr3mt5KdFa3l38nhyzNSkguWlZphVS/TVUxVYQs99VvQaE+BCUFBx09U1zmOSh7f6kPsjE7dJaz+uiay5JCykcG7SFPzWfCDUcdA4oLDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mjb8dYC3; arc=fail smtp.client-ip=52.101.193.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTWifTGFbzCyEzKdYRAtIvTRHrXgZg5GU4C+P33ZDyVor4KvASEeIvYbG5VlDhuVivbUtPlepwFSrH0kjolywXl0mRQ9G9g3KW+6GEmiXt6sMrrNgWIUKWDG+crygfrGJ04a9Ri9lBAuD4aL9CANZgexW2hpbMHq/QNDanZOuVvoucWK+7FU1to1dhBxyz/dDcdMWR1v7TjmBUw7AWIb3OYp7omE3jl7AOcBu09vp8JKb4Wy0MOdUMWjO2rqQDYC3uaUcG1M5OvLQNWWdESIyrjZro/wSj6FLAxVDqZmjsILuDo0P435H7GmVtD6DvP+U43WT5gr6KVb9LvlcBaYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw1sCcGlac4s17FP1B3PqK1MnlvMMYh2WVL1TuvDzG0=;
 b=OIW4X6p1iYn/IWzIiT+imo0KKPiVNG7/8vzztkkBJ097hr9cOxfBeNG7qUI1uTpz4o40PDcwKvPdGksGe2T7fZGa9SMlFyclkFk99Cs9n2mwgEzN1hekherxfY3Aya7AwtHTAqWdGRK3YOgyeSusJRwG4otYQAvcVpMHDrVmShGUU0a1uBkaNjR9NzjCnnufKulq2cysXeNyTqLftnBLnsxR+4ekmSDfU1nvO2L/B7v5OTMuL4g925O1/dwu4YxwYtgylBPDQ9zH6fn/HwvnfWaD9Ko6Se7gA9tCJa4NZzdHTw7ojNa0t/qyKzzl4YcYBHxbdOJyog2rCXYvkLXucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw1sCcGlac4s17FP1B3PqK1MnlvMMYh2WVL1TuvDzG0=;
 b=Mjb8dYC3Snj9QPwdn8S78kN9j1NOfnXB53VT2bZj2xslOVGh80ah+UhTuLURl++F9i9u2+eaRrWRP0No4iv8PrAhg5VzAIwVBvoNNGKvgLpYfkoBX+w8E+ZryDcMlypk8+wcaPcBCae12kOzYCcwj9cwrIodUE6W5Mq+Bq5JTtZr7UWjv/ym8GLZP9Gewg3M2cXjHPUtvnXO9SwC3BKaLQEZ4hG0mbL2plE+tFh+sf5b5xdNkA+JOBEPnjFOgKag2mCTsoyeyvnnWCnl+f+sVKqpgSa1XwpstS0wpp49cj9L0rjhb80/H3PhqJM1hjsFH7DWSSeWjNPAC1d4NONUSQ==
Received: from BN0PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:143::33)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:57:54 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::48) by BN0PR10CA0015.outlook.office365.com
 (2603:10b6:408:143::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 13:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:57:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:42 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:41 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:41 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Date: Tue, 7 Oct 2025 13:57:35 +0000
Message-ID: <20251007135738.487694-2-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d8df63-fda8-434d-26d5-08de05a98368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OUNhFs1D4CuZHK0hhRctLNHr0msy7LtfugFgBxF8V0ZLiSBp+hbT0kv/OwEw?=
 =?us-ascii?Q?BiDUQIsI0SpULW12HVzGRxXrB4ZGLwRQmXMe6UQcv+V0yVCT2XfuhQVHVYaz?=
 =?us-ascii?Q?RSFqLeck/miaXVO8JHoh5vucwf9zT5yjxJGhF+7kWFxfgbOmtgTRw0JAfwEf?=
 =?us-ascii?Q?v4z9QgVGL277GhApqYaHgrqxSLR2I1DfLw0KsKzsC9rwq58pGvqE1QUTQ0hW?=
 =?us-ascii?Q?vB0PFRKy/MU6j1SiTLkXpS4RpI0pCiX6IYBaNJw58iiuTUQ1KHiE0DH+dNvI?=
 =?us-ascii?Q?lyTSjCW/OVBCJdcDjMb6YD7/ouRolCa4Z9B5h6P5WTOAHaAlmMgRwSQc9ViX?=
 =?us-ascii?Q?SeLm7XglfNCQY/V3mbUlWfL0fF6axAsHh1oP2ZsoMKJBuo865v99cK2TT1Sj?=
 =?us-ascii?Q?BHNUdXBff6NVvh5L3O8Z5g1lGYVggmoXTtZmKNAKTirPtJ3KvGygXN/VJfIQ?=
 =?us-ascii?Q?HJGU0lFf1iVF+AosixbXfyFsTYjQ7M7prVEV0PXLHbpMTRhXixfn4CtMEVxz?=
 =?us-ascii?Q?ERbXAemGZnDeOM16MqORp5Jof+GqU+G2pEa+8TU9zzuQb/tWG5dH95jtncly?=
 =?us-ascii?Q?lmEsTdvFrQ9vUmxX9b80CE2sOdZxijOa9AAXeST+312OzNdAJqQyiD8c3Pwd?=
 =?us-ascii?Q?sPqGZ3BqIBNtkBGzRmQn1/vlQtPnDw1X2SPTD2xsTwDISfbht4dp9BZOye2h?=
 =?us-ascii?Q?lZqbaKxi1N6pgGDuUqo24NO6HMwXRKi+jIiimPjCVpMiREdr9viDXp45h9vE?=
 =?us-ascii?Q?PDB6owqNhOebBh5LfDlGeTZ+Jf16fqlfaGZnSJUl6xfERSU2sJSL3RfD0lyw?=
 =?us-ascii?Q?K4VS22MaF0GjySEpDybCVJudBHocQ8lHIlDspBtFp1awAnShpNnqHAHjxzQp?=
 =?us-ascii?Q?NQ8BJrMf+qKcvSyJUcjpvuB4TGwFjMcfeA7/Ztxri2ezRtnIT4UKJJsL5q/C?=
 =?us-ascii?Q?Zgjw59rqaWcy9KMX5oaPU43LlkN1ASC5w5TDYJqk1FJjHFwWvciXp85Gp5mq?=
 =?us-ascii?Q?YGtIz937YtAR34eVQtGlq12yD9qJfp2MikcQytzacNM3mj2sXySfz8gia4j6?=
 =?us-ascii?Q?cJnQBJKxsYOQ45ol/myt8m60IjZKCzTgHu3IcA6XvNpsDJ392jgSaK1gUTnQ?=
 =?us-ascii?Q?ffzlDPNgY1Z7WTZyQj6zZO7a9LzHCkNfllmxI0NdmQDK7nvAAneXH+9qE4t0?=
 =?us-ascii?Q?89+9eKC5j2mkzEBeJ6azyIlNSGIxNMPmp/AuwGUsARRGutC+gldSYfYGVQWM?=
 =?us-ascii?Q?bU44z1B2PorZ/iO+7Uy5UoQWDVnQwKAXAHuWFJJ7mFRBR3U+IeLWOQbMtg4W?=
 =?us-ascii?Q?rkt/tXXLiExAc5XfL0lTWYsndPoKZoh8yahuoOo0aMQhzG2UWw/t6rm8VgxR?=
 =?us-ascii?Q?nuItn+eTp12d5GwEMuMYbto3vTSNTldty463vg+Nl7or25EGbG+ZRhm0EjL7?=
 =?us-ascii?Q?YemPWXgawuaLB0Pjrx9YLNE43Ja8o734SP7Z7YV5coF99/VMPhttQ1qknsFE?=
 =?us-ascii?Q?cMEC5HX7xJdune4bNUO7MHeLMW6osb5bY6Uy/C/1k8rExa1bh0S3xWEdXbx0?=
 =?us-ascii?Q?pBqm9PfmlwPVfKUS+KE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:57:54.3592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d8df63-fda8-434d-26d5-08de05a98368
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223

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

v7:
- dt binding file name fix to keep same as compatible
 
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

 .../bindings/rtc/nvidia,vrs-10.yaml           | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml b/Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
new file mode 100644
index 000000000000..c7dbc8b83c00
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nvidia,vrs-10.yaml#
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


