Return-Path: <linux-rtc+bounces-5069-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D22BC199B
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 15:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9E064F6C58
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CF62E11DD;
	Tue,  7 Oct 2025 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ts8BZQv0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADD2D8DC4;
	Tue,  7 Oct 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845480; cv=fail; b=E7Aj1Y3n+OHKYXeDURI6uywdoi0vfdGmoGVJkPzBfyMW7lu4D8FM/YPegXDlQ4O6DLzxU/AiQ9uorwQwNB/Fy+3H3ynTueeiIOvGtqoPDa3bAq2lUcg/jCVzLDg5ouglMypQiV4uObG50q7GfKFxl/gK4DuiY2XAPC88GmjiIa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845480; c=relaxed/simple;
	bh=P4p8rLpSQqfhhD/2G/0uXrCPNdOfLIa+gJ2PRoYNW98=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BbUjTOmuI2ZpEnZMMW8bfpxC0N97S+LUAcLifQ4nJhT1jwiw75Vxsi03MSAkKQNOCM9vaAxrN6BZdVy/rbJ9F5OPDAI71c/8PWPYILe4OsJQNTvXcqkizv7STObur+VD05vbt/lwkZS0uEPSYm0MV3s/FWbMcyKBPS0Xz7J5Eaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ts8BZQv0; arc=fail smtp.client-ip=52.101.46.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHNytyDFy+Q0N1ZdwdUESTovuwA1dY7dCEiTG5U51dBckFvYHGQzqlntXyrJ50JKiOQxzrl6ZONL6QeQlFEQZgPy/Yu+drPEXNHDWL+RTcA+dm9LoyvjBi5AiJgFQmcCbFY3hQxLbjQMQVx/qtfxdg6/d0rKBhkW48OL5i9qM9yavONTgAjiIfnmNwfA0KDX/elUXkLn2EgYqSUa8E49tDpODuRKa6/6s7wpVZBXI2/DZvCBZGOL6LqF17RoMvSNyULbi5HXwyx7CfUDHV4tMAuo0XqLzsJSu7LoQukYyHvS+nh4PXO6udFyB8Kc0zBtay04j/6sQthCe/zcMQXZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLMi04e5+TEFEdAatnK/54aVuzLZuHOODqJcctb8PtU=;
 b=ckhFRpmghUPxJy0ZtvpQKK4zYm4neyQGDje6eruwl9bNDluHfhNPSGCDeWcvcL2onFeBNKQBoGWPMkczxQ/YJe/q7uhk8hCsI4TY1ZA/vNG0H053MT90xlEkLA0ypbOvcpGCUtTqXrlQoMjLjBVZMDZxzu8JR8dADaazfsQLHyh+Z6WxCfR7R/arCw3Rsa6cjxuu+T4rkTUMpBTmfQSHJwWPNKglXyXFTKk0iOc8SJJufxbWOkq45pkktJzUGGU4n6hcVYnKwGROtXMff7YwPxNcys4+kn5s1Pjn11uCpulZtRzeYdPqCzx1+tqLc5dSmBcYLn59XpoDPA45yy/H0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLMi04e5+TEFEdAatnK/54aVuzLZuHOODqJcctb8PtU=;
 b=ts8BZQv0IwurRp/Zh+HMbNu2ay8cH0xqaC99DwK5io0x03tUOTw9wPY9m6ONT5D9Y5XAqpZuyb4gvf30L4BgqdGlxT0rzrMHsPBqthMuYlXsPT2uLF2OC5HFa4yjqyilVpptUyHZVM557Z29DFF3Fx3E2SnqU/V36H0A6/Ic+mU3NYaHy5DqJTDGkooIyK1YjRjU0QJ622aDSHC2yg7y1yBAl1Lv+DJYlFuo8dGAXKZbsCM9ljKU/kmGFfpAmQoD41aHcONbn9C59Fltiie9tvjHEye6LRaHE7gWhQkoCBOV2oz013I0lnKLwAoGPg4ceQhzL7qOe2n7h+3mkn3a2w==
Received: from BY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:180::36)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:57:52 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::c5) by BY5PR13CA0023.outlook.office365.com
 (2603:10b6:a03:180::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 13:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:57:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:40 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:40 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:40 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 0/4] Add NVIDIA VRS RTC support
Date: Tue, 7 Oct 2025 13:57:34 +0000
Message-ID: <20251007135738.487694-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b28b77-b031-4659-750b-08de05a981f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mFvOfdS9HMQ9NlLGJOi35HT0ymdDFRPJvh1PiLqdY1vC15qOkxGh7R+EaUr4?=
 =?us-ascii?Q?Tw5giAK4OE5NsyuQKjEzLjIxN1+wM8qOhIRgZommSqAgUd5jx0leZD+DgrCh?=
 =?us-ascii?Q?zkaU+XfL68cORi8VlIqhJ2wTU6DWs/EkM4owTrCPDlE4SNhc7SKBSlMFaU0U?=
 =?us-ascii?Q?Tv3rX91LZjAGiOsqKPmQU7oUXJDI9o/l6bwb4xQbImu28diJhOCNweERQG8U?=
 =?us-ascii?Q?fxJLAvtg0zVL1y0KorURHfMuTgcp3a2Ow43hz/ZSf+Hsr7MciKMbwdn1eKsO?=
 =?us-ascii?Q?rt3KSiTzTnzy+H5zgD4E5za1myFiYnpPHMH8pXOn3+fsEB029Ya1Yq4RHr9B?=
 =?us-ascii?Q?7CvPm21cf+pNGbXdjhsaeSSormWSmXMoGNY0irTOu82qitPJbf6Fp36yMFW7?=
 =?us-ascii?Q?gA5huwz8yw8nE3WN8cDzDhBji/B+K7RqHr5SwIZMfwqO12gLCJQDnDSObxCD?=
 =?us-ascii?Q?2CVRgC6UVc7eYbq0+Iljko0Cde9TVbdZVKh+OGfXG5oZjTYd1PuUzd0P+qwf?=
 =?us-ascii?Q?LRSm9BJQzl10sMhERAbMue0QzXru/RyC3DdQYBzeK21yBhbQ+yxSVdbs8ijQ?=
 =?us-ascii?Q?O3QIs7fDQeyMCHjn+GXNoMnWqK5387Zk+B0RWCuhaqgEd0RCUmYqH95NfCoB?=
 =?us-ascii?Q?9SalU2RI4g1xyBBk6yEiLGOY7GH3SCKCHW5k/AhabPbZG6NBvRhNCqD2tOT5?=
 =?us-ascii?Q?xa3YmrfvCHqdkj3lDQqHuN/FJWTgRIwTv21HN15d/y65caLL92nRAIsZaIdY?=
 =?us-ascii?Q?jZw4Z3waL1yRvdE3giGhOfyAaJ1or4sfhnvcvPgTh66URMZ1bb/kXbjlv8CW?=
 =?us-ascii?Q?To4yLji2sTldStqCAG3d1yOzolL18seRCm4g7sTZF6Zw7FUbqbWYBU+rbp4r?=
 =?us-ascii?Q?hC2vtuVB4QU+GthlJSbbcT+JwpyaXgLhR1Gq1tS172/ZuIxah+1qSMhWnCnQ?=
 =?us-ascii?Q?7tw2OwkBm0utGTIAif17WgqmWdePQxOJiqp2/EHojnnSD1JCQB0X0rNeVjFV?=
 =?us-ascii?Q?r+bRvFG2nrPGGolEnPoHaWlkkBPZLJMmb2IEpKX1rITc+76aC42w64oEzKCh?=
 =?us-ascii?Q?PCOqGiWTUhp/Qh/eum1pFlRdq/opu7mjha+PgHxjlbos6mjzaHU+4qLVSaZA?=
 =?us-ascii?Q?0Rr2aUVYX7a5CAcO0ycUW2at30M1l3qcP8lScuZaJaVjq1rfdgD3Ap6E1ckA?=
 =?us-ascii?Q?1Pb3sA8Aa97JCdwq7t+NPYDtZHMu0uq5UU/3m9PN0kv7UmNXdQeAhe1bwOEt?=
 =?us-ascii?Q?8P6G0RqLk8D5b1iGPaZ7tarsRSBWzyaJnGEVQvazwABB9tzvSU+T8zOYWIia?=
 =?us-ascii?Q?yt3ZRWOQVyPEm8nNjian4OGO7HBS1Ex1d088rRdrSsGBLsvYSzfgePbZpTrr?=
 =?us-ascii?Q?LsGSxGBHUQfaFzIs8l3bcgwjNJAcyKL75LwMDQJ+4K1yVo7JOD6yPsYyOTcD?=
 =?us-ascii?Q?9MBdNNhtXuj8AzDM8kaoKOeGtT8yQ/O2j9WOVcHXrCRALlYNzMPec0Jjh2Zc?=
 =?us-ascii?Q?HAKusw+VAI4d5DfES+CSXcA21S+rhCnRXXcP8lYYUUC8T17B+NxZjHrf0+BG?=
 =?us-ascii?Q?35kaKQKWyj9aNDeW12g=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:57:52.0935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b28b77-b031-4659-750b-08de05a981f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036

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

Changes in v7:
- rtc driver fixes to remove mutex lock
- moved rtc register definitions in driver
- dt binding file name fix to keep same as compatible

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

 .../bindings/rtc/nvidia,vrs-10.yaml           |  59 ++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |   9 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs10.c                | 542 ++++++++++++++++++
 8 files changed, 646 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c

-- 
2.43.0


