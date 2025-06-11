Return-Path: <linux-rtc+bounces-4277-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D356AD4D03
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 09:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0446B1668E1
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 07:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2718D233D85;
	Wed, 11 Jun 2025 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BFltDBil"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB9231847;
	Wed, 11 Jun 2025 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627333; cv=fail; b=D1Ny7gjLWjMWJrCH0vehg3RTzipEOVpbPNJp3x1sQH3txA09l9nkjbKRZqZRrF61pC/DbnZ5LMLHnyrOAjBMUczNzFJy0m5em5EN05LQPEiBCzNUfsmmaq3n08bGg9+hz4jRZ4eER2rV2zBPAa+kFG/9pJbzLyCZr/YjA9p+9Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627333; c=relaxed/simple;
	bh=+HzVpvOfdtUc6yMAdPupTslMDUarNE7CiH9xPJF9VG8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5JoxgmpzbfM5P5DTrRzwrOhRZx1/Sp8EvR1M4osIy4/aTXCqIdbAdXsvdeSAYqZ6GHTgPnDskFEo1AUcUJwDt2Q9GgthCA3Yl5QT4HtfAPonrdWz5jZVg73DobN5IuHOIj7cAjCn0DRq8TcwxnRy+q+yobrogMD801idx4vQto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BFltDBil; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP0Bsizkybbb7+jHf+dxpGKY8/Auogf0/mZmw+ptAPhYnl05Ip2SA+qJ5YMscmW7X3bFKKK7JK0BZiPK7iocf5/yeiESgkOtpwVYJTegSVbHBBQYCE40LwzD5hfDvEgT0QwdrmA4Fcp5/tEoIQU1hNAuIhp5oVoxNeGXOM6XghotfdaOrWjvPQsIuTbwPLSpqAJH2+dR+sNzyFfnD9xJG4UgpCTGBSLhfroN0dkPX+8M4YYNo0COKrmRTA4s8phnI93w44dA4xo6dR0RwoK2Z40YUn2yyH1o5MxziXFHlAGhJUSrOQrDJh2qJXqPkU348ZRRpTGc9+HjueCdx9D2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUV32NLulL8MJHR4+KKLi/nCuMjIJ56LDi4W7JaBO2Y=;
 b=a4i+urZfVIL4ytjSAlyPoDLUvNAaeMuKTo2n9HEOSvV0c98kdZrSJWaHoDtd7NrMEy/AjxbUAV7WCLRIH7rjjAk2/Bar09Akx1YZ7BAEYTucpWfMSrZELpOpHb/bTyxdy5fmWam8Gbr+GTQsRPi9i+RDsSbJOP2fO6udAXVjcO3hY4TN3hNI/OWcWzOnSFnVttqnoSj8sJ6JnA2Cn/Ui7+TsCYdAuZpRQrVCfdxy+vmC4rAFHJ6xSfrD53SN6Fp74HJni8dMnPJY+TH6Pvj9fP5JqqqlMQVIAGzOXhnnEIZb/OFa+U9RKTXpZTZCVTERFV1F1No0rLYCFvKyoLkpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUV32NLulL8MJHR4+KKLi/nCuMjIJ56LDi4W7JaBO2Y=;
 b=BFltDBilG1OIkVXtsddpf+tu3okMZZmXTKqT7+5/s4e/Tc1SHpgoMMAxjVRccvxviTXYAjbQld4tMkx53yG0FZQV6FAsBoXKo1if5x6E29o0G+vB7Ugib3FRUYy6j6H11Pvev3t+5145eMfZ1KwpvT4auFxJR69//ZttVEiTDWjj9akXhwnO52wXNdkw1MHgI2NWV0M+ehOAZ/iAgy9hEz1uUZE8EhL7mf+Hw+oQA3NDBRQNfgDyOfXcKdPaWjNjDu8naIM5NOlGcXGft6zWpCPRGwJxlMs91iwQLIWITAXVbpkmgsRAw6YXlpm9c3j6hWJk+y7yOVBjreV4EJ3b9A==
Received: from BL1P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::16)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Wed, 11 Jun
 2025 07:35:24 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::bf) by BL1P223CA0011.outlook.office365.com
 (2603:10b6:208:2c4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 07:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:24 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:07 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:06 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:06 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 5/6] arm64: defconfig: enable NVIDIA VRS PSEQ
Date: Wed, 11 Jun 2025 07:34:53 +0000
Message-ID: <20250611073454.978859-6-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c35ca62-43ed-4df6-5348-08dda8ba8742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DyGvc2TM36wCI+fkYMh929v+2ObE2pYlYYKzvtLGhvIU1f/Enjhl0f78DPRp?=
 =?us-ascii?Q?58SAYMV+lwgn0ONPsWrqpqa51E5WVQ7hBihTfcBh/xWoGq0/IquY3awXnZK3?=
 =?us-ascii?Q?ENaAqnoTlH3pvRQYT2+mB1U+oTbCQmAr2WZa9h2YQscDH/3NVUYtmJVrqYU5?=
 =?us-ascii?Q?wsS0QaurZAMolxoNyj2P1VMALofXV5Sowwqk/brmaUTaTo83AWnL/DFV3tDb?=
 =?us-ascii?Q?an+jXtw1Bo5ViZlquvic4XK3mLvXsoJWVjmSSUgadMfpWIBk8qpAGch1TQCJ?=
 =?us-ascii?Q?yh2VLpKaaF+KA4N9/PtEDKDH5YURN7qyFp091OXtDavFi9Ezvwx0lak+8gy9?=
 =?us-ascii?Q?X/z8y+n+5oVcH3WW5dZ3lbKFdV/Mq/W/JHBsyi9xZdANRnm6y245k30pcjnE?=
 =?us-ascii?Q?Qxg5rS0RcoaijlkRGRz0nCLmHUX9VR0QkHxjAG7jUGVyZia3ayFP+zyX6kNA?=
 =?us-ascii?Q?Kd8BVpfn7p7hp4v1J/pCT+P1yG+nVP/W0LtMHFoms+oT3RWBSIXR5Qv7+WMB?=
 =?us-ascii?Q?kZ+add3ngiXR1nMBZvpNkOmZoN2gldr9Sxmmioo9Z5q6lYMkSu+FpTuSq9Vh?=
 =?us-ascii?Q?Nx/sZCYEkPINZf112PQMDyjC6QKyTj/Lc1lYQgEhBMbKjN8+EzzKQ/o9afYc?=
 =?us-ascii?Q?5s0BG6/AshyuEr0FcIY+SpeNGM4LOR+9GRoxoAjl54hkh47HbBEUOSiHNgrD?=
 =?us-ascii?Q?v98HvDLST4xpql8pmYLrjMk+Kz5VrsUstRRbT07iFQfkiTWuA8G5WZFkAHZ0?=
 =?us-ascii?Q?fwXivRJ7VcJ1SZulwqKe3hP2yiz6SNZOrqQOfHWt9vXhIcPxawV3N2XnmVp5?=
 =?us-ascii?Q?0ZHsmaXwOT7GjK9kKWqWSfQL3RZbSJG5AhffSK5jsFVoN2TlAfpr9ToVtcEU?=
 =?us-ascii?Q?z07M3mc1ZEb4TfaJ3WElXSjE6FWX+SmSxKIRqOs3FCBSaYdXssuVjHua150L?=
 =?us-ascii?Q?osPIPh0YwR2pTExw7TdJPTcQmoFL3aNoeo4apZGrvby/BaoMcqv1bTIcdtgF?=
 =?us-ascii?Q?6lI3zqwPiAbDvdeRLHpd/4gZrP+DkxbwaSeE7NiSUBb8CH5WMADS9Rscszj3?=
 =?us-ascii?Q?qNCI096G8SBvfPEGc2/6j23f6+60rU5JMY7qnuKa9NsSP+SgLVAiRBjsSX7i?=
 =?us-ascii?Q?jdzKUmqJQBpabg8FsEhHggzQsBWEyg/K0wQDtsWgEr9scJmU1saA+A0Udl0z?=
 =?us-ascii?Q?GJIQ0RI81fe5I8gHmOeHUvCvykfKiSzFlxUABLHkCVbRnwet8ZjpHr0dxZrT?=
 =?us-ascii?Q?d3uz2BcqDAvxlsvyjnq9gpoVaUQMSSRiFYhKxHrEun2dSfchpJLrGCGEiQ//?=
 =?us-ascii?Q?plI83GYBP4i/Q+rpWzfqVJX9/uq+Sa2pkQ2f3qpGvYajrtyLfFVoNH0p9PVO?=
 =?us-ascii?Q?OXoHphjpn/OrmxSWbACcjmTQBD9GgmqZN/+CBGMwDXqnFvinzGxNDV0uCvof?=
 =?us-ascii?Q?dHjRl9fw2MhXlE7+UTqYWwkdG20NjkxxYhdk4dIjt5iXQdPtD66r6IxskjT+?=
 =?us-ascii?Q?PwWo60RL2LGVxsWHtIAX0jB8IkbhUWrekVi+?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:24.1094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c35ca62-43ed-4df6-5348-08dda8ba8742
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066

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

v3:
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..98696c43c965 100644
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
@@ -1267,6 +1268,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVVRS_PSEQ=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


