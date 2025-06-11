Return-Path: <linux-rtc+bounces-4278-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82080AD4D06
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 749DB7AC057
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB46A234970;
	Wed, 11 Jun 2025 07:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ga9IUjME"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEF229B38;
	Wed, 11 Jun 2025 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627336; cv=fail; b=VAiQlj3a6oASHS4CJALChqwkfMbOstjeY+NbmCd5uJH1lBn48AkUfsCUf4EJ3Qi38KdYeZPChOz+aS3e77b1acgf4XrRp+hmQ/iPOhXoHBFLwDih5mq3AC1zdK2LawJwJPhttTUW/P2ayPKS1FuRmUtDxTq6LFoXVfsPKM8pUlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627336; c=relaxed/simple;
	bh=5qCtt59CAT0+D9KgGe0vI6Ym1anDZMl2fyymXgvfNP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xu6iau4ry1ZOtbEUeA5esMIQUayqzCikQHP59CwRcyN0JoRsdfYbSjkZk1fjQz/PIMsvgqkybr1jN9lglQk45bficMiQwuyJnUZh8G6QnpaKMZ0N/kKgldv6yrCjfx7MMWGLGhGybiUljTIiaQkvp3YsJn+AyMo4New1jjOA+RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ga9IUjME; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC8WtAxUAZK9AgPWwhdmfX83iLCLJygLhOTpm+999zFLDFNdsGhZd3dQ7SW5eXChnKspkHVi/qUbJT7/JuqFtlBvsqOVpY9FkLJsc17BTB/4fgDL3PE2owB8GlGZ4yM7a9YU+D0MdJ+P7bdN8cn9CNEq9l9vQ6y1j/w19cEpBCYFmUec9UTYDj85G9G1evIiJqSN/j1fzzKNTOvj/PI64UVCEYBvjGWvBBHvT8lSia4f6iSaBF480QpKS1cB2bMTukDa8Z3npHAEb/okTTj4VFJFI1TAs3yD1r08Ywv51A70EDKVGX2iPJhanBdedxH5FEh/h3gK/kdYF3TI7FgitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=;
 b=kHErtk4TPw+aUy5FKwl0ebeLTpUBQeMNjVdik1xD38n/U6qNqapbLd5DrvsyUzbAF+dZGbSDbIZI1oXRZTQNYClvukJISmh3NQwmtkcynLib40Ik8TDBZkiQ8i1KDyA6jPfciju5qzj2t87eL7c3UqYhhGH1JqsLzhEsRT68dCotjEs0+w8lnMireBXWWsL3LBeTqW4R2IFftrMdSW7ya0F0JwnCQkctgd+ZEX3jxUKW4mDXSm71/MFi7kc9Wq9MqiTYbMo0fqBs347NnRd8L50WP6j9NXDBphphUyqScc58hrtBpojQirDEnXlnQOr3fuvkNK8bKnBy48aBL9qDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=;
 b=ga9IUjMEmtnVmbaiXI9zYMMo8BsF00O0yfWs7X14+QHqTgVuTiIReqeMOFS9GcQ/ZoABkYKIxKPu14Cw2VQ1lUqpaChI6wCUVzUf1A+MQDn9lzpiDXPk+RBELRIuU1J84rdHJujKm3d6o1LD/l0v9A165WK19WIjmYC/KgmvrgXssf9H2yLqPcoA6dI3ITPZ1fPh/W5TjUGc6aiWwDoS5lL4Oi/DN83LdjqHlrI2iHpX944OU1qAOUhsReOqc6HgkJD5jxFgE4YyMK0BBP1xUH1HxITWNUfQ5XzWPVGYzjOiVprXB/kY8qaD7cPPtrIlvrwBvb83HTEf6qhmN97G6Q==
Received: from BN6PR17CA0040.namprd17.prod.outlook.com (2603:10b6:405:75::29)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 07:35:29 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::88) by BN6PR17CA0040.outlook.office365.com
 (2603:10b6:405:75::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 07:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:09 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:08 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:08 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 6/6] MAINTAINERS: Add NVIDIA VRS PSEQ driver entry
Date: Wed, 11 Jun 2025 07:34:54 +0000
Message-ID: <20250611073454.978859-7-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: fa83a62f-6ebc-47f2-f931-08dda8ba8a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uP18kg70jzQ+uzcnvyBQ3i1QTYP22ISeuDMlGRiq+TckJyvh4+LnK2/Ap2nZ?=
 =?us-ascii?Q?c1VQMaZauRcNrHaMqw9v8qrNrKaMdQTkSNuz3j3nlhKlEBJn7wOblYLzizEv?=
 =?us-ascii?Q?4yRdP8mWO0yPFyB33qQXVv3fVJy/AgQrHUF1hyIEY4f2kCADou4KgQMvq0ja?=
 =?us-ascii?Q?JPsqDKXOqwG0LJi5gf0uic1lpR7v5eN6VyCCVbIqI1ysi6lqrNGxciSbiaSF?=
 =?us-ascii?Q?RyMXO74rBIFniJ4FcJgQ+1LCvgEgeJbOijsd0mHrgWyI1XRvoH7IaIk5wHfR?=
 =?us-ascii?Q?91iUfI2KHWmBVPrkfxBxjpklxPW5/L4ICC2lnpVSE0C2q86u9VeFWyA3MaCq?=
 =?us-ascii?Q?CcjBZOiej0s+38Lz5YUdOY/g9Pv4rIPJt1DfpoIY6Xl0fVO+EVmiDFbJxxT0?=
 =?us-ascii?Q?Xx+flIY6ZG289uePl5lUYDsN0r+U607fCPds+AgDInZ5ETAoXfSCbS1lrZuu?=
 =?us-ascii?Q?iHty5GU3K/Udw9EqGxN0S6dqJuW3OtQX+ri9d2BRoQbo2KFM/olZlfTNmHwg?=
 =?us-ascii?Q?BwTCQ/l72TW9W5XfUBz70ks1lMvOk2Lc+RwR8Qi/8w4D+pd8QqeUIESlCgT3?=
 =?us-ascii?Q?x+KAYMYf8NKMKaWqtAaBaWCfZBJ/uNUrPLXK97yX0PziF8KXJj6BqnKNXMDv?=
 =?us-ascii?Q?0v/m9RKoeb7eCb2vBm1wXx1a1SFTzM2sNrlCfFM7OOhaNh0fzhkPV1B0JRf6?=
 =?us-ascii?Q?ugjs+nFkdiPCz3drCPA88+DzzIruPCKmG9yCxCxwtTbDumUMwH1PE1YAr9Zq?=
 =?us-ascii?Q?YkWcZ3C8BSJjLr+XUzWGb7UBEATz6vCCYjL/kl+MGHioq/V09zivyK5JgFFD?=
 =?us-ascii?Q?r+Hc2ODIKr7o4292cK2ZMZIPIEQcKRb8EpNlcpmZdc0a/NNYHj2Qum6cU4NW?=
 =?us-ascii?Q?93xFN/2TN/xX4QRWNtLE9n1tik2gN1SHGuN5yQ2pY5EtgydleQ1/tx0K6AOF?=
 =?us-ascii?Q?LTKMpex+x78Lr+qiYyPvKM7NDcW7OXjPI/QT8i47f+OO1/9JA7X+CmimD3yr?=
 =?us-ascii?Q?EepTuu7IwJvKacehA9Q3oYKrA/ai5itS3N5/70g4iKoiRLI1BwNdOgWoBzoJ?=
 =?us-ascii?Q?2rtXnu5Ie9uCRgsGZRt+pMgUxYQCh6QOFjchEBADwYh5EnsH8d3b8fgM0lGz?=
 =?us-ascii?Q?PAdwgQ/NOpVleIVWrwsscFSw1/MbELMo1h6+mKS4OvQzXySb5KQMLUKBitvE?=
 =?us-ascii?Q?u2XBPx7VWdpSr/aGXm1RZfSaMvN8RNOlkDI29sRGty0LmeJerINibkX/U0NG?=
 =?us-ascii?Q?Coc218iVzy5n2BdkbWTjzfq48RayfOHKMEVrnQshJxPOyJlHB5/21Uc9jv35?=
 =?us-ascii?Q?nHoH7W0Y4y0/LTKuMtgyMSpwwoySLt8VWxMxt5CMFrKeOvQ81kLmRWn4oAZi?=
 =?us-ascii?Q?+i7UYXtyECY7u4fhNd6H6OZquH1uMpcL1F5NDBr4aejDjr/65yXcX4glAdGz?=
 =?us-ascii?Q?7ECkRuUSdZE5ti9Bjwj39gx8KgM2LcicDh5Fe4oRLd5P0Kx+eZCE/RzTOssP?=
 =?us-ascii?Q?Bex3CIoEVDoPNQfMxoZTba/Wz194Wm/zVDTW?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:29.2491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa83a62f-6ebc-47f2-f931-08dda8ba8a51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562

Add NVIDIA VRS (Voltage Regulator Specification) power sequencer driver
entry in MAINTAINERS.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v3:
- fixed indentation

v2:
- this is a new patch in V2

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7a147f31468..7a4f2e4f702b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17789,6 +17789,15 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS POWER SEQUENCER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
+F:	drivers/mfd/nvidia-vrs-pseq.c
+F:	drivers/rtc/rtc-nvidia-vrs-pseq.c
+F:	include/linux/mfd/nvidia-vrs-pseq.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0


