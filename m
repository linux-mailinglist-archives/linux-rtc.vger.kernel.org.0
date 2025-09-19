Return-Path: <linux-rtc+bounces-4986-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2DB89C75
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 16:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5CD5681C0
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 14:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618B3246773;
	Fri, 19 Sep 2025 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FAjKbe+W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C3183CC3;
	Fri, 19 Sep 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290562; cv=fail; b=ZAnPVlK/WqDr0wg/Mmj2BwPsRJ/Vi7L+/SkNiv3e1lavNhqKGQBXIQpC2LX1Y/a/dQmttMbRnR+Gp4yobU/mTibAnWZHMh7eBGk+lYZFH0C/LQ+vUW/r5q7KWIYTWVJcyLdz9amcMBJBcXtwawnOHsn0J0NkxvrAr4zSt2KMxRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290562; c=relaxed/simple;
	bh=qBZzBCA2lSu5VV0WHIWAL7epx4kiQPEORHiaL/FYKhE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlkwzXrVTJCqy721xXdTFzf9fM1R4ULsOVyG3/obOsu78NfsknDbBthzCUWGNP9Pmyj/b2MpoamNsHYx1mHQXoXgP/uyq9IqtLghGInRpPVBoUFRnz/FpY0sHT5IrK3lu5jSbHJKwHjtYwF4Nv2I3iAWW1lDK4SslyMP9/D9mGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FAjKbe+W; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wObixzXknQRkP2LdMYrMBBs6RLDM4tEFFhytxwFFXgNpKag1GEDgfRtBG/x5Ws1I7U8mNMMZ3ZKnefkpnVFFOMS5CjVn1G/RJO1ZVxNSyR8w8RVVIiaohBWekp8CQBiergJ6UeTNeJwJnlnKDR08COdpkhNQ1OfDmv/TP8ZJmwwA7+c4BIq9QL9eCEAlj3a5QK43niDUqthDirZFCzlZd7dhXXEylewQLXHIKMCf9G09gFqrxze69sDZE6lqloWsh5PJWWs/ui0G/MWhoUCHk9Iba4Du2OjV0nOOZgR1L4ojXjxOEnUhnChGMX55oC7GW8imOV1Vfa+gkOhbYK9rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAjHkGu58/tJ/n4XOpHQ7KeQk6uGJIvvB04hwIUjOxU=;
 b=uuMJqCEbYvchAvJ1NgPjvHj5V6lKYYIumn+iPzqF6MdCCvmC7k9bIe2EV9dr28g7XMscUYKrH32heNNGhVuvc+PwwZtUdzB8tL+e4Z4pB9j3pLmQiR1jYCjOgLu0zDX1M8FaEyjQrMQIoiOSOFb78p5+EHUs23gXybG+T/DmqhqcCLXbwhsKD/LPd/wxZEPlfVqbYoLvocFN1D2hf6GkF8Mdz1P6oSSKEXTYhU6ssfoKiiUMj4TEKAX5AJrF34CGLsXpjKwPrKqxqCkET8jGa2HDkh/nWF04Uog8vzyPWsxfmyZgR2g3hJVe5l9t+rekJ1pJKYIKQjgjv0TSLTTT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAjHkGu58/tJ/n4XOpHQ7KeQk6uGJIvvB04hwIUjOxU=;
 b=FAjKbe+W5FpxwtPTVEzHh2jklNWOjQPPX1iHhtn2a6k/XmAjWu/eM06N9jNV6OXDOfNd+1JAL/F+W21VFyoeoIvN1l2SjW0ALx/Dn2KeQaK3Te7sDWslaoRIsWlk55wn194JuVeYA3g6GghEaY7iRXbnEOUBewEWdhF4zlmYB/snmY7r2YCVWvuMGWTp2DUyYkh9TM3nYvpHPzbljCMlOv2BsMoH3biT4/ZRd/Fyd1x1D7XXt+BEf85fe2yJS9p7uY17X127LYZSPd04ja/LcGeb7Ujkhi4L2uZPtRksb9LHyUFWl7aZwpjCp9i97fnKSzaDNIomd12a7xeJOFr8ww==
Received: from DM6PR21CA0013.namprd21.prod.outlook.com (2603:10b6:5:174::23)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:02:35 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::40) by DM6PR21CA0013.outlook.office365.com
 (2603:10b6:5:174::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.3 via Frontend Transport; Fri,
 19 Sep 2025 14:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:02:35 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:08 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.34 via
 Frontend Transport; Fri, 19 Sep 2025 07:02:08 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 0/4] Add NVIDIA VRS RTC support
Date: Fri, 19 Sep 2025 14:02:07 +0000
Message-ID: <20250919140207.10515-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d8db55-01de-4697-97f3-08ddf7852f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DlztzpXCuC8LosOAcuA0aX+3I/N8SWU7qFX8BNEG/vx70kosj6+Wb83Tt7qD?=
 =?us-ascii?Q?984UqQKKBacqdFTAQmI0rtv4O49FZRmBkKls3X2vfcumTuRIj0D5Hxr3cJBF?=
 =?us-ascii?Q?o9I80epXoPcbHXXw9XY3kTzpNnFpRgsKv4ddLy9/blQR/1hZ6tEGievnFSH8?=
 =?us-ascii?Q?IcRfLS645SSsTzOFIHiqwRcE+BA7chzph5jIYh7e/Rxu+x/w45FFoUpvA0LQ?=
 =?us-ascii?Q?C7Tfh25LFZjWcbbX2E0dr6WKUQqw1o9L/eAuSdgVNeyrDCL6dSbb7YI8o1ac?=
 =?us-ascii?Q?lkDK8dfj+yei8J8WvT7oYdzifz5jnCmEC6kItKPebDAj6JptTDQqscK1IcN6?=
 =?us-ascii?Q?BoFNEDuXF+2JytvgZMVplYpvsBqYUN6dCfNMazIgrmmSKTevcnIE36HeJ3Fj?=
 =?us-ascii?Q?GJTpQEzdmtHfTXgE3cIgoKVRwvMRguhaZKONYpNOeAA/pik/kNIgMOsPbupz?=
 =?us-ascii?Q?3v83ADrjuOMNmd38li+onBcwnArKMNIz89dK1W6J5t4TwO399yHNIuWx2YrV?=
 =?us-ascii?Q?40RReLd+og5WukV2M+5oYaVgLRaJ4l66qdQch1AoyD7xTZz3SrpOuTe7Kdcv?=
 =?us-ascii?Q?Rup8cUt7mfzZ6eLL2qM4JGOpUfFkKajTpO7rLfc0TPQdwZzy/Ej2eXIJoHDr?=
 =?us-ascii?Q?WJurjax3k0GhrIdnwV0C2PN01lss0yUinTJKUvEOw5zJYJ0RZnU1h7zSLjv/?=
 =?us-ascii?Q?rx/mW6SxGE5w20WHvq2pf+YTS7vpPzknLrmLRs0k5b6yfS71zJM3/ScNsMql?=
 =?us-ascii?Q?KoAF09j6J6HbvdJVj6OY97RCR392w7e6nfQSC6868nt2cBii0ZJtNZ1IsKFf?=
 =?us-ascii?Q?t9XfXLL5EWmao9UtMfybNkh6LM7wWTyGvmzR0C++qxyUspSPnRBzQ/09mdm0?=
 =?us-ascii?Q?VlZ6ODllRYD9LM2+1+T4v1ElAx7TLx8JoNjLt252+uJA9J+V6ggn3c/mqu2l?=
 =?us-ascii?Q?A2MFIAYHMC7DMVPHB12UCI3y7/nAKj3YW3ovMfnp82b8RQpzQ7XVr/lqx90F?=
 =?us-ascii?Q?lx3SC1IujxyYCRQ50dCwcZfN8ckcssoNCJqmSz4IZnKKj2NdkToa8rq0LH7k?=
 =?us-ascii?Q?exPDxkRzYfPj+Ird9QsnD5rI7yOTcBO9kH9fFhTZ2p1mF26lFuUDF9DAzcQy?=
 =?us-ascii?Q?f4w0OBpEXOqBI3dIZzRqhCQVcfmjKtRZ3zYqlnXZJGEFXS4yZzZ5E1zvv+j7?=
 =?us-ascii?Q?N5/JjYDRcTKtpR1sZX5kFTWKzxMWHKkDMvx/ip3clVxfSC+iduhFHoDBAbgc?=
 =?us-ascii?Q?U11pXh6TYtVcqmIT/0sGE9b4kgDcS6QViBuVp22otnsxKtW5UTawbZN8nesQ?=
 =?us-ascii?Q?UXIgd80Wit8be8tcglzjxjlzZ4lNXsDx/Rl48btbjTLVUHZa/+J99nsbED7p?=
 =?us-ascii?Q?Cj/m7j5+f6I1H0LDzBs2CfblzQ5kEVwOzMz8kKELcY5StGT7XeM+lOmIyR4x?=
 =?us-ascii?Q?1O/RxwBHcAFxUhrJNPcjeFSD6t52itU9zeX/w0E2eM7skT8bCnke2t/KaN/H?=
 =?us-ascii?Q?GJsnDa45eILu0GxIQ0L6HJRgre7IlLDZCiBw?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:02:35.3063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d8db55-01de-4697-97f3-08ddf7852f6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

This patch series adds support for NVIDIA's Voltage Regulator Specification
(VRS) RTC device. It provides following features:
- read/set system time
- 32kHz clock support with backup battery input to retain system time
  across boot
- alarm functionality to wake system from suspend and shutdown state

The series includes:
- Device tree bindings for the VRS RTC
- VRS device tree nodes for NVIDIA platforms
- VRS RTC device driver
- Configuration updates to enable the driver

Changes in v6:
- compatible name fixes to "nvidia,vrs-10"
- changed dtb node name to pmic@3c

Changes in v5:
- moved device tree bindings from mfd to rtc
- changed dtb node name to rtc@3c
- removed VRS MFD driver
- moved VRS common functions to RTC driver
- removed unused register definitions from header
- changed driver compatible to "nvidia,vrs10-rtc"

Changes in v4:
- fixed device tree node name to "pmic@3c" in dtb aliases

Changes in v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation in dt-bindings
- added rate limiting to interrupt clearing debug logs
- removed unnecessary braces in if blocks
- changed dependency from I2C=y to I2C in mfd Kconfig
- fixed return value in RTC driver function calls
- fixed sizeof(*variable) inside rtc driver devm_kzalloc
- switch to devm_device_init_wakeup() for automatic cleanup

Changes in v2:
- fixed, copyrights, definitions and dtb node in dt-bindings
- removed unnecessary logs from MFD and RTC driver
- fixed RTC allocation and registration APIs
- removed unnecessary functions in RTC driver
- used rtc_lock/unlock in RTC irq handler
- added alias to assign VRS RTC as RTC0
- added driver entry in MAINTAINERS
- few other miinor changes done in drivers

Shubhi Garg (4):
  dt-bindings: rtc: Document NVIDIA VRS RTC
  arm64: tegra: Add device-tree node for NVVRS RTC
  rtc: nvvrs: add NVIDIA VRS RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ RTC

 .../bindings/rtc/nvidia,vrs10-rtc.yaml        |  59 ++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |   9 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c                | 508 ++++++++++++++++++
 include/linux/rtc/rtc-nvidia-vrs10.h          |  78 +++
 9 files changed, 690 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c
 create mode 100644 include/linux/rtc/rtc-nvidia-vrs10.h

-- 
2.43.0


