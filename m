Return-Path: <linux-rtc+bounces-5220-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98918C24841
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 11:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9417188AAD5
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 10:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99577340A52;
	Fri, 31 Oct 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hsn0lGj9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56EC335570;
	Fri, 31 Oct 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907081; cv=fail; b=lE7RstiMfV62RKm0yI7S3oIXPJGig5AwStV3ULH5sPAZvPlxKeA9aA/73YyNifZex+5HlIHWbFSjp84Dmz+fTtGksCqu2ReHB3Z6ZnfgNTjrfvRmUiJUutXGehxxn5niMflwamlwvL/sbRuPNn0EL9qWoWLPa/2Fwsw8StgiLUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907081; c=relaxed/simple;
	bh=Cn08d1ggv5FfIyzJMn03kWUvKxS+dvgE1GLqQMyqB6A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yg05/8ppZRNGovBm3di/BZW3obVHF4g6WYO+bA+mqF+PoJOFGBnnMQXvvdhL7TN77VZZ3j9MSPD2g2gFJqzCBjF6dZYqyXuNevu3oZrEtOTxqL0gDeVn5AyY04QvsNRH9pFIMNpwLkpzZhIQ67GpZDltSt1yENrH8jT7ZKf8C/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hsn0lGj9; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsjfmde1TCmqtolWwNFAXB+9KmdFiBe/Ys5h8HnrNSQPUWBmgE73Pu9eBYfCCE8v1wHWvN2r2TCUYxRxR1iV4uPDCmyedjrphUNqF5mI6hxKMXjYz2Xtdv3NqwjWZPGIlosjIehrAVzGukJrBCM2vyGdCPb8B9Qnv+llYhC3HtqKya7jz2LscnUIq3o+aH7dpZQYGFfkWVwxD+7XtOIKruUXgV6E6hka8dfAPHm7ojyGn0uQ8teRxRlIvU+w1EP14PmbeKB8AuQZgVPwDmq4185may1aXXEni5lyk1nplJ/IT1xQpe8HuXtPA5204qmmgpbckJ6UQ/kyIfnEhsA+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRgvJxd6UUieGTa2ssM9qrxGlySxe2Bh79/IT5+H/GU=;
 b=BiIhwyvzvhcxpYyWrWI1zn0506sak4sUBmhZLvYyDCMAv2yNgvfTEo3HViVaMMk4kmD3XUCKG8bmQ+R1RiPvWBANY4Bhb6MPFaFn00vcatr/hsp9J9IkbuPIouq6HgPpVBEyTZyXMMnGhH9NcDrCEgbTtYVx4AXEjY2dyk2LokKpQ9ItFx1be8IP88Daeq35q/z7PY5eHpG+HZuEAZM+3kwo+ukRYMlRV+bIKN93ElN2hy6a1c6Up5nKNnyN3bAw71sSga/I/bGtX6Ppj8GRRuxKMy3ZjQRn+diut4sImoV8CfVaaWy/eQ19XzSdbZHMDNoBhEddtT3aStMmrJmTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRgvJxd6UUieGTa2ssM9qrxGlySxe2Bh79/IT5+H/GU=;
 b=Hsn0lGj935PQYkvhA6QPl/b+7n7lWMuh6/fcQMC6Kzqq2ngwCqqi+AsQIWgXPwT7tSt73JXS2KfZBJ8AOQjooZ9ElVass7T/ABJ8JMydUdBZmRvOMGNrIo9SJ1cHici+hRaHAp4NHzQCgH3dNr3hQQF2wfIAA9zNipm9vWGKsfCqh50yik2lILejoM5hBUz39h8CdD/QTiMAEDgk5qXuKs4ijTkvin75ZzSvlcge4iKbV/9tUGHufm1g+NX0UEp79WcwzWT5WQQFxZIQSmHanyS1SjULLJe3BN2I9k6Rhj5TqQ3nVR0kEaYg/851qQ7Mzko/jGzSP5fS3f/+tZD5+w==
Received: from PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::13)
 by IA0PPFC855560D7.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:37:54 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::78) by PH5P220CA0010.outlook.office365.com
 (2603:10b6:510:34a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 10:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 10:37:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Oct
 2025 03:37:46 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 31 Oct 2025 03:37:45 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:37:44 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Esben Haabendal
	<esben@geanix.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] Revert "rtc: tps6586x: Fix initial enable_irq/disable_irq balance"
Date: Fri, 31 Oct 2025 10:37:40 +0000
Message-ID: <20251031103741.945460-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|IA0PPFC855560D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6378a2-e517-4db0-306a-08de18698c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJa7ADKOVLHi6JzYTdOjPmC191p7yhEQGN4YGXJvnaXybZTQtRKEEp1fFqc/?=
 =?us-ascii?Q?HBczdeYFnIUhJPYemQ0b9NWFktLcaKK7bqb05G4E6/vKyqZjW4ilr1QYgbYs?=
 =?us-ascii?Q?i7G2ML1+cPM41SpEbN3pJ/fih3Ym9UNWW/x13KMhgY/Y6UO0chIOCrUosyve?=
 =?us-ascii?Q?B1b/RXZtHvl4wnCv/+EuhEvB7iXe80amJAA683gpECkzpgfWo2mTdKMZxNgs?=
 =?us-ascii?Q?9HbCrJDiBxxC5EBriRCjFnamVmWEvViMJfU3arA0p5ICqaJVEwsNyAPo++R+?=
 =?us-ascii?Q?hx0V15MqW8OV/SGkAagquc1DUf1UtxQoFy20RiLPcV94+4gvSi/3Flx2C9+Y?=
 =?us-ascii?Q?kAKWs4kRrf3mAkF44wSmDUyRmbng5znpunJsOlpumTOfktorA8+gFAIIVVIx?=
 =?us-ascii?Q?/jUNRp46PX9imhm0P7Y8IMsievVaZmORKXLN3exp+9c3FBWtaw+WcoswKvSo?=
 =?us-ascii?Q?Yb03No9VWDyy59E9CRK9IrrCg2qjHutMWFb9qSDMf4ZPVgsitiSe7gcrSIBE?=
 =?us-ascii?Q?dj987R9RonC70haBzhH8FYCKPWOmxTfy7UgShrOkk7UpRYFV2uuiZ1+32Xjk?=
 =?us-ascii?Q?7kqaSztNg33jfiehfB55VO2cTmXnvE/n4Tztsz2xEmFLWbx6TKJ8H5Xq2nTf?=
 =?us-ascii?Q?g+1xTBNN6i5umnUltgwTXXVk3bGFGFJ1mslNFLRkTMCb5KvPdZ90dXGMzOJU?=
 =?us-ascii?Q?NjhDtTCkNcMOiUyAaEnuFwLelmyPTkxUq/c5TVQWUzHkwlTLgxmHanB2IdAx?=
 =?us-ascii?Q?1d3aD5F84Cn3Ku+x2/NuLUdZhMRmD8i9nye/px5sW71NRD6zW5Imxi/WZrhA?=
 =?us-ascii?Q?LQWS628I17WsZJM0KwDP76p3rLsGLnQ5qqtD/It4iKRUY4f4SocVpcjQDcVC?=
 =?us-ascii?Q?XYTuGr9rbB/X1SVwmw0qZUc30cWqFslPxjbu4BS/ml30yhIMU7pQHC2th/VE?=
 =?us-ascii?Q?LYvacCGm/EWu5Gcsx1Fs3Js2fWZeEn+xoLeiEAcLIOfrq+7+K9C9CD8Lp0lS?=
 =?us-ascii?Q?0rUnpUUZAFodG40pOUptv678/UcLtPQRZjZssEQ1c3xs00HGW9oNWFVpCvGx?=
 =?us-ascii?Q?VRrULCf4PR+YRZZqr4UfspbZMKrwKkKM/vn8PCAvGML6aCnvYTXHcnknls3J?=
 =?us-ascii?Q?C0yiWWa1EfCTmI7d7vCvzXIKa1A9KWsRTZJrik+nJ5R5Dt9eYHihA+UWE2rJ?=
 =?us-ascii?Q?/JbqwGs5fPM/PGrePGWQytZy/V11xfJRScwH5odb7SRLRr5QqwBG5Cns0FWu?=
 =?us-ascii?Q?9b8SIgoM1ISo3xYFdbguZQFNB1F1N9rNreHqpBRGFwglP7D54UqyE2JJLFv3?=
 =?us-ascii?Q?oR3h6yaVtDGJidOcnuRQJwtWq3nDt6Q5XgKHkWde8qY0i45Yzb31fa21vMEm?=
 =?us-ascii?Q?nhQnDc712Z/cL1zwf7VOv0G/I/cumeDuMLXf2uE/CortKEtnaKWMqpdAGDq/?=
 =?us-ascii?Q?Kal2iyDNmPHA28JuljUpRJvJ3LMa+nFrYIYjIagxaFHJi3QoQaEHrYhbdIny?=
 =?us-ascii?Q?tiHGwG6Nw0LeZ3EkKq/x3AkRCH3EkMnGLSVm3RE5QZKkcuT1U8MDRi2S8Flp?=
 =?us-ascii?Q?SRL48/kVKqGeFB3jE8E=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:37:53.3660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6378a2-e517-4db0-306a-08de18698c3f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFC855560D7

Commit 1502fe0e97be ("rtc: tps6586x: Fix initial enable_irq/disable_irq
balance") breaks the wake-up alarm for the tps6586x. After this commit
was added RTC wake ups from suspend stopped working on the Tegra20
Ventana platform.

The problem is that this change set the 'irq_en' variable to true prior
to calling devm_request_threaded_irq() to indicate that the IRQ is
enabled, however, it was over looked that the flag IRQ_NOAUTOEN is
already set meaning that the IRQ is not enabled by default. This
prevents the IRQ from being enabled as expected. Revert this change to
fix this.

Fixes: 1502fe0e97be ("rtc: tps6586x: Fix initial enable_irq/disable_irq balance")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/rtc/rtc-tps6586x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 76ecf7b798f0..54c8429b16bf 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -258,7 +258,6 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
 
-	rtc->irq_en = true;
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,
-- 
2.43.0


