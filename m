Return-Path: <linux-rtc+bounces-4989-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FEB89C90
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 16:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD8DD1B209B5
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Sep 2025 14:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE002505AF;
	Fri, 19 Sep 2025 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FDdF6+Ad"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4524EA9D;
	Fri, 19 Sep 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290592; cv=fail; b=JW/N6hvyHQH8XDOJ+hV0uCDcxnzMB6yu335IDdUG/HWHnxMpE1uPOejXaTg5OIzjrnmI6QYfJF/19Nf/tYHsBeQNfmOpt0hURzqNLLIHvlBnfySaGqFKCj/fT04hyR7TIps/9XnW3MVNS0wUEFCFQ9B0g9Qm08hNQ0vM3Oe70dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290592; c=relaxed/simple;
	bh=dmBtgmOY0DGDyJkvIp2e3oM3z0wGqvjUeTofRWscPs4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Py4nOyksz9Mqu2QA1p8VsP9BD9/+IysqoqQTQY7o8FSWR63k6U+DywDZymzVJ0Coj4+2Yb6RBmMdZCRepTPqszudISBc9yAnYmMMFWqJOE8W6Xy9xPAtKoH9YdTy2qAg2qCgRzwRr/sr0EOdLmYZ3uU8Y+UUUxYG62uyqrCpYyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FDdF6+Ad; arc=fail smtp.client-ip=40.107.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiSNb/kh/jamuw8PV0RJNT4ASuDcV+tukRKBCFQKlQDiFJi19sJBgzj9gnS8Dk76b4Owtb5sF11oVQxD5w+0N0r+Grc6M8SzIOwEqMt09LjwYJOeqtRF7wZyF+8OtVauCQKkKwO+mpd49X3ONKV8Ph7Qh1brJcrvAlJMl4Bm9T1KB8Wa+CYY3p9gq3whcjxfI9mAX2T42F8g6pYp6p5FjO11gJe1LdYDqxnh9iKGPxOrocEBRXvZwYo7StSLTo1dxKiMvcMzItekMHpt8q5SW79ZSzQj27rEGdmNy3/9lvYYaMRvh96cJPxT9PG9Z1OeWRtc1VwYx09C/+5HYXc3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCcXJYZDnpgvVLsROqsXtc4JlbPCpGaTvC3fpbB/qSk=;
 b=QQSiWxPEvyTvxIIRj+OU+GRjVPFIcK1aub7o0DpfVcAPxu880HEm+S7LU9sq1wpKkpZCK8gppHZM9eBu948sRVdK6TA++bZQttwNTWNjXdCpmiJMB8wqQI/zsU/uzq0nGOvVplWIg2TkZsVIzv0AUmw2/E6mmdJkQ8Tezixhg4+H8EqGnW+3ardhfM0/Tp/JKkt6zg+X3+0QL7nBUtV5LWLbSEDCIfXurrHak5t8hzw6o2Jlsunan0LuNjCY2Kj7j1giwr6PpuBzokWWelEfBVAo7i0EI1J0UZYUr7DVT5+NM/k7duO/BmBM/Yec5IezPTMIh2j+BiGS6OzRhqgz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCcXJYZDnpgvVLsROqsXtc4JlbPCpGaTvC3fpbB/qSk=;
 b=FDdF6+AdlpjMMGMUVC5j2M5qFghWh8ZQsmcosAJqyJvIrCtJD9vdP8bnCR1zodpZEyZtpaCG0Kb/uKoi5pTYB/KPU0J2/P3Vro4D3ZEt8a6rfhBpkjXrN7dB6S/SOP5ng4QDc/PdU5xceIdImwh9TGchWMJIrO8KCtl7YpW7xSOonuwkoFpQTg20BWPBvVBgSApQYeofpnJrcClNEic9TRm5RmuORXgt7/lURquRYJ1tOHiiTBEF4eqCzPMuRGj8XzUP8PR8eTWc3akWiDZOEdCiybWiG24N0Hr64u6e3+qMEIDPEJt4h+xAb9fU0KuQtYXg5X+wYoBKSXeedCk5Jw==
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:03:06 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::6b) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 14:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:03:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 19 Sep 2025 07:02:48 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Fri, 19 Sep 2025 07:02:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 4/4] arm64: defconfig: enable NVIDIA VRS PSEQ RTC
Date: Fri, 19 Sep 2025 14:02:47 +0000
Message-ID: <20250919140247.10567-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: f24c6000-1887-4a98-c25a-08ddf7854188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cS83mfk0e5BOzbswqX9SiBm3sNMHy/lLoH/ByS6vAFuwvkBvymEHNU6LSDqT?=
 =?us-ascii?Q?yjCdf+3QDYmxoRgGvqD0D79LKAHY0ZX7YnMjxbln9eZNPjlNq7Jock2+O3dy?=
 =?us-ascii?Q?8eQYK/txBaVH3jHXc7zZwNnRkoFnZlFgXjOOstxKrcmEOADxar8XlfEjRaTt?=
 =?us-ascii?Q?9luXh0rHLB3cvyNrmVtSQQG2SADj1r7ZBb94MdBItNhwVO8DKU5qH1ISvBAj?=
 =?us-ascii?Q?VfViJpu2LP0JeJNCx9Q1bflQACX26LBnLZKI4k6gbVa6RwXMqtY3QPfTxgc9?=
 =?us-ascii?Q?zeb/qiGUk6QuOsiPODVvtoS+At5MgAeT9Wmx2Y7ncQWoDcn7oGh05rzLbzbK?=
 =?us-ascii?Q?xE0bXo07QcqNGx6I8rd8c7DlFMV377frt1Lu5vIa+89e35Na/+heoY5q/fsi?=
 =?us-ascii?Q?AgCZZKfLLcE/+qviBbq8QCIAqXZ53E5ZVEuCp4TDzpag281YDRIz/j5TfCOO?=
 =?us-ascii?Q?E5wyq3i1fRPJHIOKHBvNwukD0j9ZfeUy6D/HQVL7xzw1WVzNdxZ/7sWYOB7/?=
 =?us-ascii?Q?3rQp7OGo2uw1qvR7hjIA223caX3jBqWj7Bggbhy5PbhCL1QYOIF3ax0Rieln?=
 =?us-ascii?Q?HelW2pGW8OASfrqJcTlKsrB8Mg0JGGtx17j9esvSlcFpJGmrklqeVLV35mpg?=
 =?us-ascii?Q?KOr5ijbvlortTQKe2h0+foMyzJwMvYVD9/kbnBKda08MVrYb+3/BNk5TbW+9?=
 =?us-ascii?Q?dTlHIvvG8+svnGd5dVj/YXaPw5tpfLU5lq3huRcq3D9AM6tesFZXqk2p3sco?=
 =?us-ascii?Q?L0u2otSHDqVf2yrYqGIFjrvwrR3vrt7gs+UurWxVpKCL+R8LrxWN9YhkwJT8?=
 =?us-ascii?Q?0cA+avcx+7NIHu7TxZTCSC3tmW4fD9XU4N4ZqT6cZSa4ynHqf+n4Iqpvsmng?=
 =?us-ascii?Q?VPUO2q4Lvvu2ZaCWslZ8tr2KOjJ12I7PcgqiNBcqbjIAVwbLR4UTyS8X3Ael?=
 =?us-ascii?Q?DQv7De/EddYZ48N8ER/3HTldfPQDBAfD0Q3ls7DwWA2S1P1R3/nQq0FdMxOq?=
 =?us-ascii?Q?Lw1ifvdCEp7CmHG3QL/eTYbfoi0NuEoTT9MVGrI536SdOXrXVVuqim3CG589?=
 =?us-ascii?Q?sI6ut9nJsXW4EkM5d1TXFmzIuwbq/NJJkhFNBvG1Hp5udYdts8P2rMwDuYQB?=
 =?us-ascii?Q?V3GsshiqaO93qOdljOL6GCwFDLFWSUOX53DUZbrbeg7V0okzGu+Op4uvMYco?=
 =?us-ascii?Q?iFFHqov6eedCECwYlOMXFznaMxfPQ1A/PATEeQQpMVbKcnF/u0mr41RhxPoW?=
 =?us-ascii?Q?4snuOxl9CZx/qey2RLz/p03/zEzy5UZSnkHvjqx64mA7QuOhvBML2k5XsCWb?=
 =?us-ascii?Q?ntiwHpzL9FBgFsynXa2WXHsq63uafOSiJm6wEherHBg/+Mz2NE5fXZKgR+qb?=
 =?us-ascii?Q?oxAU8vU39whiZqWiM3UYuy7S74N48RU+cOy7Li1YV+AYAcbezVvCnpILRoz6?=
 =?us-ascii?Q?zETpjx8M9ZoakDzwxHuQ6L0Nk6FpS/msA9VU+NnjTexa1ATANrSxpOqvkU+g?=
 =?us-ascii?Q?swyhsKLdy0xwZegcQSqeVyTQwBCkv694L6nB?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:03:05.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24c6000-1887-4a98-c25a-08ddf7854188
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431

Enable NVIDIA VRS (Voltage Regulator Specification) RTC device module.
It provides functionality to get/set system time, retain system time
across boot, wake system from suspend and shutdown state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v6:
- no changes

v5:
- removed VRS MFD CONFIG
- changed VRS RTC CONFIG name

v4:
- no changes

v3:
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..a7fb6aa4062c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1283,6 +1283,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVIDIA_VRS10=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


