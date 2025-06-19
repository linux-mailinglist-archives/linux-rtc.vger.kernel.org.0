Return-Path: <linux-rtc+bounces-4312-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8EAE0031
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77F119E3364
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD8B2652BD;
	Thu, 19 Jun 2025 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SivXuDyj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAB256C7F;
	Thu, 19 Jun 2025 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322709; cv=fail; b=q2F0j42OkfHEJz98Zpd9zKGh9njUfwiiHZaQLOVZ5jQxNcu/tXsZlCkYPscK6T3UtkGWxxA+x3u9UwP0Nh7P8n5sytsNplUa5qlx3W3IiZ03fXoHMW+GQWNCfpg39zROtYnN8J2JpUpfVraNG8mWfxhevM/FqPjhnl+Guj8VW3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322709; c=relaxed/simple;
	bh=rBh0uvTtAD+b8Go+8XwD9ROi4OabMM7m1DptXEwzcuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twJ+aD3cLzuR/KdFCPCsmDMiiwqNTfIBJ2XiIQ4CJ5poWUME/lD7AjaWIldwaqOt2YL77/4H/ggtkxUomkVA6s1ZsJJtWegxTD9JpcX7fjAoRkHWIjgOzWFLATLBTdtUKwj8At9M6oAPja3vWmMLZQMhkcGfhWkYaJdAwX/S9Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SivXuDyj; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqO8XFHpKJOVk/7CtrZw+y8fqsE84Bt2OFWgDuPLUfMkGWYIWB4x6XwuWJd1ZFuGrrL69GLVz0mv5+GkI2oKGpFHVZ65OFf2vDaJhthfrHh9hf+RtTGZeLNd/To+puldrxna8DKXJdwzOP1RcoL1etcvhbPhtkMdpkO1IFuZ9KxahI8OeMLTXVvyX1iK3dLqgaSDPcDaAlvkka5LEYkiSY8Yz4iZvT3a8fotMi5zXNPkogWDwuRDa2K2e46MgPNEZ/oPI404I1m9kCSksEYHnYXxDT8LDaghtCNkeSQpzWmMm+GLSryGUW+Vs8dpg5DTKB2aqFGvXbMmyk81m9qOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxL1N5ft0SnUHfvQPT4f/IPgUL4fyU7Qn1K75LgHeEY=;
 b=pMxUvbOA6m3Zlyi1tHiqVTXWdj55vn6MxHoMIce+yErAYKGSCdShseRUxRScbS6LyHj35fwRwddpPZHWxtYcCorMrUqjhjOvlP1D7H8HInNl6iaUi1UEGPs4gm0HTEaIOf+FByHufqfT87KUfNRMUJgnOzDr0cqpn2R9PTOhgg0SPULVdBCQ+8fQWpZOeWBVZTWpA+V4UCfp0rSHkPjfPoe06h3WYxtSnMIfjvvzWPN/P3U9dZXDF7A/nmzCZ6kExN60ZSHM0ubkyK7oldnn+OOWcJqLKQGEdh2GMRXq62CFlllI/22lQbF9Ftua4smA6AwjatB/ZxUxC8zNR+JDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxL1N5ft0SnUHfvQPT4f/IPgUL4fyU7Qn1K75LgHeEY=;
 b=SivXuDyjPvhnOuK7+RFeyxfZUrJCpXUWHg2KXL8IQoYLvOGsOMDiFouICp2ynHq+Xs9iUV8mptunIVTjpgR8LvLQfdfHGwfECNwbKVub/SbN8FnXrVMvzIPZu3REbbHpUalpOPIfK/n+TYrVrkAp/luvqyRN20xNnmB3B/Yj4oXmPnGxLSzxVnK/o6g/TAp/A65JWVNl2vix+Ta3hTTzcIqirGXaPKvagQ7fQFoHZi4lfYE0jUJYf66OAq1qGLfsLw3DvyVFAFhrfg0noa4rgbK+UdHKZP2LMxuj7RU1zTdu5ob+6OVwWEUAXnzvpjDQDDcPcWQHiQY2R0SXm0JAxg==
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:45:03 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::15) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 19 Jun 2025 08:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:45:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:47 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:46 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 5/6] arm64: defconfig: enable NVIDIA VRS PSEQ
Date: Thu, 19 Jun 2025 08:44:26 +0000
Message-ID: <20250619084427.3559207-6-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c01295a-8456-4591-a5bb-08ddaf0d953e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+CVpGgwzxHgcx1UJnwo7Skll1+UJgm/h6wyxtjFNtVxf5JgqvpfJ2+CQ3sd?=
 =?us-ascii?Q?O6J06n4s4VGLPbrHYuaAbgUDKlu5VrdGTbA+6ovKS1FRPMip9SsliqwV9niQ?=
 =?us-ascii?Q?DkL0XNirfTvhr7vygX6YMCcNjvb7Dj+3lskjx3oq+Iqe0aLSA26Y+Vedk4kb?=
 =?us-ascii?Q?TcG+Ek1/+bf5y85v0Pd/izFsjF1eERrgUQE8g6M2U7wTLfJNeyhiAlh/uM7h?=
 =?us-ascii?Q?EIGZ20i1abwF+VWpM/1AgKsnr4A6W8IPMD34uxXEG6V7udDjCCS/xQO7ocC8?=
 =?us-ascii?Q?jfSWvD0AJpwI7Av/gTgQyGfvnVHxtIN8WWa0gsJcV/AEgQASbafS3U+GY+4+?=
 =?us-ascii?Q?Twbi8qQhPwevKSjfKFfZngy72KshXPwhJNlZld0QsLGnq3A0dhXY/e2CAI1G?=
 =?us-ascii?Q?fQMrP09BS5CQGBJlUEUqXDpX+VRg9WEN3nS/9E46Ov/rWMdaqABFkzufaLOn?=
 =?us-ascii?Q?XC8TWohWvMut92S3rrrVRUm8qK6qi24FznDym1qECfSik7C+VypKjdm+WXNc?=
 =?us-ascii?Q?Rf79QBZtkmdXtMqGk+aZLz9+GXQz8nQAiUL2YVwYbkDsgzA4X71iAOAkrV3i?=
 =?us-ascii?Q?DeSEOmcoZbQFjjIrfFSiLmKXAA3w75Q7HICDaFWXf5ZubJYTg/GDMhdDdJYP?=
 =?us-ascii?Q?LqhoUOW0+Ea+qjHHelJiDCKn1h1CJ7WC50MmRi3MvRhhNxUNk5HLgbd7WyxV?=
 =?us-ascii?Q?KG4i7BymuUj3zBD+QiIh7x9ZfLIYVtxB+6UdI968i0FU7eh6Vu6yw1cw3EXB?=
 =?us-ascii?Q?owoakmfbfZJwmHeJHqW7tCcan+RZ43Y2Er0P+9AgzVHtglChNbWgbNcygzdO?=
 =?us-ascii?Q?VpLJvXNDIc2dozLYOlJ7oNGn7hfSS5AUF2hoiAYwijtK1f+UEC3HoI0ASTl/?=
 =?us-ascii?Q?ZM50mPJGa60eieRu5IQwgHeFG3ODKaOBW8UFbbS4aJGEwpM9lqLibyx6hLDo?=
 =?us-ascii?Q?4E5TiupV7gB2r43Y+P60H0+bR8re4M0+sJxpMxhD2pHDtB8xiRDCtmftkuQJ?=
 =?us-ascii?Q?0deZkRgI9XX4u0YmvqftRIAcLaetzGFSRS/nU86qZ+n9CvgkM4XsjCvq7Yb4?=
 =?us-ascii?Q?LL7ZXhY64sp86ducSCr5Vbk0vlU3xm7/d8ziCM8KuQgppRutH/tiotAosWKK?=
 =?us-ascii?Q?Uh4X2h5lqpJSzL+JgG7YUYN70L/JGdoU7edoh4hTHLEhDfovWoJ7ixluna2s?=
 =?us-ascii?Q?0oAm+LbI8ZHTQbDgCQYkm8SpOJdU02pduJjOuxK+gZy2e9ByIx7SHalQaXtK?=
 =?us-ascii?Q?nnVoLHIBI1ugYj6WMJSg0I88LYqrf9PQPh0wkVJCTf6YVAN6y7P4jtuSpOUt?=
 =?us-ascii?Q?FCd0IV1++W/hj9s+z6Psh/7iyvkYcOl287u/5+bYHkl674CBP9WSaoWewwLs?=
 =?us-ascii?Q?GgLjLqiFzZMXq3jwXd/sWNy5l5b03fhewFdQQKhurtq49/k6mYIKybBeOZ4e?=
 =?us-ascii?Q?gkdTr7Psz9w9D2HFidzasrpzBjiTWL3KstREwb9rV9RjopyoCwjd2qhnAzd2?=
 =?us-ascii?Q?eGXuyv/ETvBmitrQ+1cURwZYZ5fZvoDJ9Lwv?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:45:02.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c01295a-8456-4591-a5bb-08ddaf0d953e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

Enable NVIDIA VRS (Voltage Regulator Specification) power sequencer
device modules. NVIDIA VRS PSEQ provides 32kHz RTC support with backup
battery for system timing. It controls ON/OFF and suspend/resume
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
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96e21d458867..dbf40411e578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -787,6 +787,7 @@ CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
+CONFIG_MFD_NVVRS_PSEQ=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -1265,6 +1266,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVVRS_PSEQ=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


