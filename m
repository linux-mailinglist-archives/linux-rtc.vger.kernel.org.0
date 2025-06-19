Return-Path: <linux-rtc+bounces-4310-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E776AE003D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27CC37AEFDA
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861B1266580;
	Thu, 19 Jun 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bwQHeTRg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D6265CB2;
	Thu, 19 Jun 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322701; cv=fail; b=EzNlRqKtG9hVKCTbeIU1sUWx8h3sKptERyZsuWLLoYkrbPvi48qzY5gbMvXVEMmG7Uz0bvBI6gXMy/EYRG73eq41cp6OLktDfoP+9BFY0LkwEC5LIMpDZtZKQpbCRrbPGPQZHELgjdS684VGN3hXuGAooKYX2x5tnQsmXuWnJCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322701; c=relaxed/simple;
	bh=ayhOmGpPfVGPCZz/ZccB6JNEAsuGFolfUrga/R8m1RU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X/03LveP5B+SHo3cXoU+jrWJrks9SKP13W3qUtQ8xNBn3pCIGbGgUbR+3GAamCl4qjjc19+QcHvFPGzqZJV/iZADO+2Cflgvf54EECfL1JXY2lojsswXXdT7DmBGk7+0fEUO8d7CCcbsHtwWQVdtXAUPzdXWbPv+TdGDl9tjwLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bwQHeTRg; arc=fail smtp.client-ip=40.107.212.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCYVmjWhE6j45mVOLVeiAHE2UTzvzb4kxEQLApFjMnpKbM14jG9rIK7HAgrZX4mCDgVFpFrY9L+ouXd53Z8s4jL1sSc3Kt2QnUEBJ27GkEN8v9sIgjAWwtULteXiFcLevHm7pEMJKZ+wBweX2ECOnHZB92tyxZnaA3DaBRz4frdvOnkl1J9FD4UK3li8aU1Bbl2CaufR2noP5gcsTzdzi8CsxzdI3nCt/FwMhB4qZGzJRlUXb9oqOF8xNQWWw9ain+zJqbnXC6rb+sve68UFQa2kHYPnheDIDvvMhGQYY2qmwrumqU+eJHdYxrLgGNixq/nKti5krP7szwCrHzVEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKh2JWo+trp0dst8YfaufuGHeeHhl1RRqHqmHEJjCAw=;
 b=vR8yfTzWsgsnn7kWTpV3Lr1rI/mtdgmqsPzVo3jvNXNI9fshaq/XE9nUIf7Y1JYnVSNbgKMIVsDWVyvUh+BNWx3wTSsRTfrLVT60FC9Oum1N+KMzegXq4R9HzA9EBuSAXPPmB0q26tdNcZtHE4m2ReedM9d1pQREc33+9g1XNFjudMY62z05G8Z5QB2irzcVggqNEb+lIz2W3H6dGDmkC3vt/FTenY1HgCNKdN++TCXUXz23iWhzjdyhbDrAnSvtimysK12m4s0Y7fZvU8ZPQLLx2M00OXV6l0eIDGvMYhDcE1orQxQWTjJNfYL4alun9k1mUvnIQ5k8EQ7Mmkmrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKh2JWo+trp0dst8YfaufuGHeeHhl1RRqHqmHEJjCAw=;
 b=bwQHeTRgvX8PTko9R4phyTYqoRYKF2j7sNOyVYGJsOm5CsH81Xo7dH5KhvGUd8wZ2ZV/tS5hSSdy3EFoT9jyLQkHQeZfQvtWgCMUFetlljZEiaJYq/iLYgGUbZo8hT4gESSl+N4GN8wY4ULMtwBv2XUiHMqC2Mi2anbT4Nkb3Sc+3i9lDJFxFkIGsOR0jJ39MraIRvQfwex4SpFXjqpXiUL3iDRKkyQui0fP35jgVe4K7KBv0aa5ruBd+LK+Kqrety8fV8XrOypVoH+lBu8P8zt2uV8ZkGFVmYcguAybcS5aEqc6WYj35djdVwgVkRC0xBeCJYGcujk4lwWEZbl4NA==
Received: from MW4PR04CA0190.namprd04.prod.outlook.com (2603:10b6:303:86::15)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 08:44:55 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::46) by MW4PR04CA0190.outlook.office365.com
 (2603:10b6:303:86::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 19 Jun 2025 08:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:44:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:38 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:37 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 0/6] Add NVIDIA VRS PSEQ support
Date: Thu, 19 Jun 2025 08:44:21 +0000
Message-ID: <20250619084427.3559207-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: b60df655-ed4f-40a6-8592-08ddaf0d900d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8BsCwN02nCqsx+e1gdTggiWp6leR3EA5MeHo5DD5I6dV+v45usgwbjZGszCc?=
 =?us-ascii?Q?+6+6tyFRtLUvPeNqIij0kDx77r6rMjieBcGdpPVAN4j6NiRYLlAP/cv9XVW5?=
 =?us-ascii?Q?RgxvliSUhfW9MFwg8BwDu7h5XrXK+WjTof9OkLJJHT9QnhFPiRsoN+2EF+x8?=
 =?us-ascii?Q?HVjNk7QI8cjVv9JknSg6/4DF7Ihwc8LkdWuuMIpquL2a5CPRN9sjSKGxlhiC?=
 =?us-ascii?Q?Yd1lcKBvS2zoRghMtVBGJ/0kUKJLrlQe+AIqEnB8TlYPY31K/u2yevV/0E9B?=
 =?us-ascii?Q?+qFZI0HAQ4jQXCuIs8Oz87CF8wm+l+EMq7Z/4OWHRWKDNbaT6XLK9G5nX6g+?=
 =?us-ascii?Q?qntzldZeppHnXRmbjSOASBfljPDVFXvMgjHmeS8s7CvNQ3Bo81jUsoXUADja?=
 =?us-ascii?Q?GqReGjgoNq7DoXCcRAVcNzIFe3pzvfD+stCatbKm7Wg9HR0komWbu3R1FouL?=
 =?us-ascii?Q?SfXiRJYOf8MOoEtrFRD7kPMvNVrDEBP444J7BtFEERgIynslrdh3d+p4zVdq?=
 =?us-ascii?Q?jWb9zhb+VAlzsUngT2kjUpFLgOrDFnpK/zFp3GIRrWG18iPUKaonI9MIpCy5?=
 =?us-ascii?Q?pbzpzAsOgrMFs4Vy6qut6g8hcatF2sxVo9tYfJB9hQFt8A0qWJVAUQ6BJlqh?=
 =?us-ascii?Q?O1hcxM1Q3Gx9JbHKCivuPQ1UDZ2JAC+VSdN1nthhRtUz1xChdtNnBO2UYmbb?=
 =?us-ascii?Q?+KfPAh5uGT9rWs6/7sGiQk2v0m5B4JLuvN4LH7y6vGx2T/YpuvAbOnvrz+hb?=
 =?us-ascii?Q?euwlN9+p/2Pco6NtfxWiWRnPgFgm32nPibXXVKszYxqlgR1yDASeouWqeGtK?=
 =?us-ascii?Q?+5m73mjvK1xABlRDV5lYtyN3ShPQHTh4SAaefb+D/2jmJNGeJ+2VhDAQqEY3?=
 =?us-ascii?Q?OyYmirDL+BLqxmtD6CVDKPdlFapqY0sX3pR/RVDkIL3CVV9EGoOgkTxh29k4?=
 =?us-ascii?Q?yt0VyABJyNVQ4Kvtgoz7bUE/+dArmfGOiVhdDZKPblnfGxud1gsO5GwFikW7?=
 =?us-ascii?Q?k6Iq2I+AzQJSgHtNOMvpRFnECKdxj5viqfa/H4Mdz2mSR2msZAiDN4pAp1sP?=
 =?us-ascii?Q?rRjPqNLV1COgyXAnLtOkVmhvEkShRluTq0I0SeFhFxhSrEondCecmawf5akx?=
 =?us-ascii?Q?WBorickVafsuMtAiGdxVZgXgIdYsACvMtc8ceEbmGqOPC/u2f3D+P4w82XI4?=
 =?us-ascii?Q?d/MLndzPlaWxX3kvzDEFZwbFj0EmztzgMLbP0P36OaLzEnOh4oaCFwreZIc3?=
 =?us-ascii?Q?XxfWHwyyuYw7qcVhoq7anP76fAZxE+o2600JswuZl9LnwiHhaf+fO9UFFnf6?=
 =?us-ascii?Q?uWyWpGYFNDg/4CkjD/ieZW5pTGe+SZx4u0jNqZ1QfXDW9hghRF4oyc35DOEX?=
 =?us-ascii?Q?NrPnnVsSI8LVf8O5Mix42bMNOvF6gV+qO7NXOt6RTYctw2MhfB5m16QGMYam?=
 =?us-ascii?Q?e91WU6KXd+2Fjg/t0kPEBQJvyRmWIlWw1Fduca2fg0Uxl+6GgQgJHTdhlifo?=
 =?us-ascii?Q?RgH+5HSkPnoKH0SJWe6czHcg8TKO2Gs6lSHP?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:44:54.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60df655-ed4f-40a6-8592-08ddaf0d900d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711

This patch series adds support for NVIDIA's Voltage Regulator Specification
(VRS) Power Sequencer (PSEQ) controller. This controller includes a PSEQ
hardware block, that manages power sequencing and voltage regulation for
various components in the system. This controller also provides 32kHz RTC
support with backup battery for system timing.

The series includes:
- Device tree bindings for the VRS PSEQ controller
- MFD driver to handle the core functionality
- RTC driver for the PSEQ's real-time clock functionality
- Device tree nodes for Tegra234 platforms
- Configuration updates to enable the driver
- driver entry in MAINTAINERS

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

Shubhi Garg (6):
  dt-bindings: mfd: add NVIDIA VRS PSEQ
  arm64: tegra: Add device-tree node for NVVRS PSEQ
  mfd: nvvrs: add NVVRS PSEQ MFD driver
  rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ
  MAINTAINERS: Add NVIDIA VRS PSEQ driver entry

 .../bindings/mfd/nvidia,vrs-pseq.yaml         |  60 +++
 MAINTAINERS                                   |   9 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nvidia-vrs-pseq.c                 | 267 ++++++++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c             | 457 ++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h           | 127 +++++
 12 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

-- 
2.43.0


