Return-Path: <linux-rtc+bounces-4547-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78EB0F335
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 15:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272443A75B7
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 13:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5E82E8DED;
	Wed, 23 Jul 2025 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e7YarCxg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601662E8DE6;
	Wed, 23 Jul 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275857; cv=fail; b=c2/XVpFKlz/XVPUlKwjoR7EztlrmUyM5muLj596ooYAd3AN2Qx7l5ZLMgRobsFDA8X5h9l1h/gCnJeScwyHwcuoMLlOb860rPWmsPpww2c58iXiS1Up6HDESQDh5mGp7Wa9pQaDyp1u6A3Q3FR3YHWM6MUf93hbUvjfigzkvNhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275857; c=relaxed/simple;
	bh=35Ejimmf5OccGjxkV9G9UHABHPXWl0WB+kTkxVznrKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNVNrl3HFMrrZlHzdag+TuuSGqmanqwMVcg4Juf06ks82LiIljWW+GM5w8ebVPkQcHMOKglwoqqweS//WVzxXR8Pdb7R/EdNUzSBI4xOvBF1+gwSoBOolRtYpzUTB5CLkeZHkmsp2GdghAjfZ7ANXqETGhyzQH40qnao2q1Pb0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e7YarCxg; arc=fail smtp.client-ip=40.107.212.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSFZoqjD6bXgj2v2dMbWPwY6rmb4zjsbpf5hZrb1YzLG/1R6SWpg3yPbZGM18z7Ih16fTKOzIZJfCbqrKyBAcdFuNAPkwxAm6M1y1nk3obWoGLAtjBP5YbeTfEHzTap8xkSyB2Pc5gbsSI06OpCF+khRmr0Xb5YsN4GbPwgpXgiwnAbfFqbIt3nZP/LJkkwXLnqmbxqwXJRXb7icxyMhITqjxIjlC2YyuY20qgtI6Z6ahS53bIxxWhQmYWhvWkgZV5mQLZ6JPvTSK+U7VqlJ3BDDbUkguid0JwweKJpA1F7HJ2g3tN78Q4AjsE2EjzM3oSdiEhmbaTcQCtriXeRLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chv7YI5n/YVQjjKW07Od2qQWjqVBq4BJ7A1EWMyXA9g=;
 b=DgC1zSz4Ep2RFoPdCC/A5L2QnCy2264zX7PGcLdEDgulTD68JOkr8kuv4dQLbTa2vbGKxgnBn5OwWTKQ9Zc0LKTFFRn+Qsk5iYZ10iw272LO5fk8hM5gAwcNh4Mxaao76VCWJQuPdbwEO0NWIegjcKGA5swsHJ+vxVum78TA9hdGau68EoOu2q0WIfPtlVjw3uo5TIQDbCIJqJlBLAl/C4Xeej0IDYvrDD+38fSY7o+J7oiUfGLs6Rldop+9owzchjIE0w5zf6Z1s3ldkma5KnOl0K/1XD8Z5WOVyUj/GG2J7R/91RqbFQJlXebAsck6r4yVY+3Z5CU9ExR9dSScOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chv7YI5n/YVQjjKW07Od2qQWjqVBq4BJ7A1EWMyXA9g=;
 b=e7YarCxgQl2zyh7RDbmswP7Qtq6gssezxvVX2FV6Sn7J7Iu5XpTxvs5yr3AfyKTUyVz4MuYBihtROqDz3XPPZ9K+LQ/1MYjYQqO3yoF41H+tR13YpKTNauLJdr/fGHkEII1+ifa5zt4TXYXDxSbbW/Wxj/tV3btefPrlZjhETM72/P/lV4rMNwccN9zmObkPQSWYybF6MgKUiSN6GCofIskKI/JBk/cZFvWbg3eWzKF14ErZw7M6ZmJUlMqpXJsBWtmUf+eHeg6jaOMWZ42VqyuzM+fSFIg22BREsjmKyAY1NZ4fEIRdqMfTYl4XfXJBW6j0qzLs1e+NvsFNubAi4w==
Received: from PH2PEPF00003848.namprd17.prod.outlook.com (2603:10b6:518:1::65)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 13:04:09 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH2PEPF00003848.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Wed,
 23 Jul 2025 13:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:04:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 06:03:51 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Jul 2025 06:03:51 -0700
Received: from build-shgarg-noble-20250715.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Wed, 23 Jul 2025 06:03:51 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v5 4/4] arm64: defconfig: enable NVIDIA VRS RTC
Date: Wed, 23 Jul 2025 13:03:43 +0000
Message-ID: <20250723130343.2861866-5-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723130343.2861866-1-shgarg@nvidia.com>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|BY5PR12MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: 081a96a1-2121-4372-c1c1-08ddc9e9695f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NftJatD8NZ0/XsUFeN2uAwwIuazMeHRDxBFARn6lmxfVyHfkLTSVwOoQk7NX?=
 =?us-ascii?Q?Hu7XaVb2W5zNqdtpUFVBJFKQlLkLKDe1VQbYYsVGQqVTE94UBPTTb6Qkdm5X?=
 =?us-ascii?Q?sp2vhpoI96ol8dGGkqxyAGtqdtwWzwDFzVMcv80uIuzjR6ype0OF5fwkj87+?=
 =?us-ascii?Q?MatLW+5lRHHzmQSjg+sWxviIKW+wS0JqY6KwJgjR3y5klbcmf/tiX5NqGcPP?=
 =?us-ascii?Q?JaCRz/OtiJH9OZw2CbyCt3DH8RZ9C8ueoFd499ffZIshfOnJE2Yefbl4C7fN?=
 =?us-ascii?Q?uf3c8uL6QGAmj+hHQSdU+4OxWvETVGhpq9HwAi2TAFBvRVxH/KAycoF/VrAL?=
 =?us-ascii?Q?KpPvKAS+QNol0SP4VDzmwpTm1WzjR3+8ctUQ484XaYKXEXf1pBMhVBgBJC6+?=
 =?us-ascii?Q?Q+DIZTRFFbT5lB4M3kDm9+VSfXzY/rRgmpsnSrbOFLL5IpBjhJuU3ibiMei1?=
 =?us-ascii?Q?IuTzC21U8RLdWkDuHYwq6uib/vRQPEThtT4XyUp5y/a1AAoLkwmnxWWREPx8?=
 =?us-ascii?Q?VcuKT7Q+eA/ifQ2PErqtQC7+ZbJVJ6KnKSlyE60XLJz1pzpBUMI9D3XSwlsI?=
 =?us-ascii?Q?/OICmjqGUnMvFU+7ZQLpB/0QOSg8xbcjDi2ZGqqcR2NTg8/+ms7XH2HgWPdG?=
 =?us-ascii?Q?p+55FftYNZeD7ViY1PiF6+WoTe79G6qA/FbWgUeGHfyLw7u5SLyNXzrgICxe?=
 =?us-ascii?Q?wm0AM7VKvLFTiTkWzclxKcWB3KibvbPj+4fffoQm/dAX9oAl2KTM1kAUkhDT?=
 =?us-ascii?Q?mPJsZmq2HRIAhqFCTSlgqfFF6uUIH6SL9PMljbxEih07KW+lgxji49Te6fX/?=
 =?us-ascii?Q?Tlx2XDwwcX46Bi8Bu06t9t40/TkuVd68xT8bvZkBR+st6vmcaB7/92IkyNxJ?=
 =?us-ascii?Q?vh76XE8yV4dVEEq1iO7a/w5+dCi49WhJhVdvMlx418DxAman67W1+B0viLiQ?=
 =?us-ascii?Q?NOOifQGwHuMcAoOQuAwnN4YOHJC1Og4+n+fUR0JPH6PHrPtCcUxGXEVdMd0x?=
 =?us-ascii?Q?DyM0boj03lnyvlQYXnc0U0lWROat6H2kx5HW7r3cG+5jaDxPNZp39Yy1Zl49?=
 =?us-ascii?Q?CeWmyzAFAsQtQAejKUHqLhUUY7clppADVDhidzfA5BJHWpJomoRyGeqiDts9?=
 =?us-ascii?Q?w+zatJYgQPJdsVTWkYTuPhNB4MtshDMTWzBV+vxrAr9DtRYP3yrG+Wh3kgxu?=
 =?us-ascii?Q?b9k2jJdEPcuteorvZwSdnnEtTuYrzLJIrsEbvbWF+EkuaD+TVZmAFhJSbIwj?=
 =?us-ascii?Q?n3dXNM7DUKARD1m7Ceuihe5X8+c9+X/NwHasOSx2LWCGEPVD/6Yjiqn51YYk?=
 =?us-ascii?Q?64FrNk+2sA/0YooFahrrd6bPgF5ShSe83shZBjUMlp5qD5vbKu5gVjWyLWFg?=
 =?us-ascii?Q?zGECxNaFAsXituJZayvR/QLgA1PLdFxIPVGUWWTz/dg26uoP5thEFiah2YvT?=
 =?us-ascii?Q?XXX0vl4WuQgZtRAWV3Xf2HQtUM+oogzZFs2/XxZZqrhH5rAdij6hgd51yUGQ?=
 =?us-ascii?Q?1Q4Zm1KXvMv6WuiCzXN3qriIGwfhVAkwwEgs?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:04:08.7630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a96a1-2121-4372-c1c1-08ddc9e9695f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210

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
index 4dcc43c62c4d..49a0e2372ab7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1275,6 +1275,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVIDIA_VRS10=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


