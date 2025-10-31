Return-Path: <linux-rtc+bounces-5219-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 759ECC2482C
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 11:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E333BB4CC
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 10:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F098B337B8C;
	Fri, 31 Oct 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pZxcvQL6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5A335558;
	Fri, 31 Oct 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907079; cv=fail; b=IPY+qMmbucR0h35QzVIMi1VQjPzjTO3Hv54+9o6BmRx5618wKbTfMlHS8N+AvgrqGPR7H7DyBVZI2IDEXEcMsXZm1IwxUZXbfU2yJAPcfXtao9jYj4Q/rYUKuBxBcrv4dzg1LgFNQCc4QA8hza0GY/dODyQDZku5bk38e4c8hpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907079; c=relaxed/simple;
	bh=iQN2yLTeMZs/xFsi6otGSnrJvZyBnLB8w/0Ay2S5YQY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pV7dPRsAPswMARLWSDlQJ9ioj3L4hyBkuULn/6farjXks888IncyvRYOkR096SxEsbbjLqeVamE2fjwn6WNeF3fs+AtyyIMMvNCc0TxfnH4QrFdLIgxxIQaCkrPyly09Qndq0ikikHxN4J9PCjXqteTTTratkKiH9KNg6JiqVQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pZxcvQL6; arc=fail smtp.client-ip=52.101.193.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj7y8h+zgDuQ4QWulNTH3SYG74mSPd6xWS+l4XpG9fMzVpYBKfZ7B+AIGkQRD05a7UaI0zl91bByqq9peC+vKON1aofsl7Nm7axAE2dyv4my9QP+3iMcOGbDER/S9K4TKRd+pqI8v7HXDjAKrkCzqmjjdtqvvQoMq6u6EqzvTChkq647MhnB/PbQ4+IxghoF7wQFgMCesCsYU/10I+cAJ2cEqSKLcXmb97vKkZ33kz1Bc8t7MIClP5stlwQE5pmJbBSmnnPfwD//Qh66zgJ8j52WCtfdjm5aEPnqX+bUOUFEgoiU29yK631ccgySDmeVrONFfUVvtJUpNkRZUZlJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWhthiGIgwEhhdcBHE5Lx88D+J9LR/vUO/TURyS+sBk=;
 b=FDM9TiwI2I9H5zlVpuCkp9cJ6hYDve5CD5yiLfpdAgifZJDq4MGk0cF9KcueS0rvCOXh1Q6p7VrhEc0fABKCgJuEQjzULlynHU7N6ZH352CZ6LVXTnthNI+DIEARKz+cUM3bxPmZkkULOm9SSr/KmiheECrjaAArMAa3NIFExL4nAagBsh47EOWHFxBLG/X5oEUNBo3cvw1C0CVHH7UKylsDTWguMl9La6o/x+cGb/dyEjXF5gqIidSpKeiJcqshgnTDfjLgpdDVtO79T5k/Iut/L2r9h3KWozLssh4krpvz6zY89U5vYR/8wTRLvXQx5KMMEw5wLY5hKlsn4Y/FTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWhthiGIgwEhhdcBHE5Lx88D+J9LR/vUO/TURyS+sBk=;
 b=pZxcvQL64UBhDlwZvCgIwPc5FuC3rxWaYScUA89JAKZGdZhW3JQWkDCaHVktcJweR39mx+vV7v0jcwDzvnfJvg/Fels1ZiXHZb7c5gaMvcSoS+Oe6lvtqf2Tg2VuvlASJ58z0DLk8oW7dPYo/Hr/Oq8kOY8Tb0zDZr+fYR2RoHna5nZQM59yzUPDIhzZHdqECKofp7AvAB/tkcDz05vOC283ti+V94WwsQxW+vAfgo+b26OqIAhB0/kRsTyzyttjzr3tpKLDgYWAveOMDTI3dZKvhw7vgx6lqdEFDYa2TjJMv2aSUFGcUcNTvXJdbUQwBSQQvcLsfCCr62hdkrq8RA==
Received: from CH0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::35)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:37:54 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::a5) by CH0P220CA0015.outlook.office365.com
 (2603:10b6:610:ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 10:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 10:37:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Oct
 2025 03:37:48 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 31 Oct 2025 03:37:47 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:37:46 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Esben Haabendal
	<esben@geanix.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] Revert "rtc: cpcap: Fix initial enable_irq/disable_irq balance"
Date: Fri, 31 Oct 2025 10:37:41 +0000
Message-ID: <20251031103741.945460-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031103741.945460-1-jonathanh@nvidia.com>
References: <20251031103741.945460-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: d7197831-f1d5-4977-e4d8-08de18698bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4WMOFkFv25WtkFarm1NKjPjAxBc9WeJqHm1QYhJCDCJY+ALiK7m+vAmkHHAe?=
 =?us-ascii?Q?RRpFARLrolpDdUQsp8asYDB5AjDgHkEjbGPYSp2K+HjEvbhAbtqvI47LGSgw?=
 =?us-ascii?Q?/X3Ys8BeyvDTx9bYTH/gMYU9MhGxexxGiulMd2gYftcj9G8aruVNwJik3/1i?=
 =?us-ascii?Q?XHjkjhzROF18oGEz+P+jil7NqkEeUd9KDLHReHGiyGPmM8ZkckHCPFtGgORM?=
 =?us-ascii?Q?yUUspthCVsi1yGELmnRWmC0oF7OwkAJfwD5drMsHAqBH71IBIPqYtydp9Kjb?=
 =?us-ascii?Q?YmEjFb56tZXbIsYYuoHAM6qzuKf9xn/tD5/tGa2nltg6Y3LDPEivHxtNRVib?=
 =?us-ascii?Q?IByPbCoi0ciDzudd1SA9+mMc/WZ/XhuvLLmdFNFxbBXEUqR8a2VTwcKfGGTq?=
 =?us-ascii?Q?8WK3EKFVqguluN7ufE+Sga3PLUBJrfcHmBBZu4wm3J58UgTMCfwxup5aQORJ?=
 =?us-ascii?Q?J3zZ9DDwUngB2Ptl4EjKzGkcVQOhZ9c9HEHWczRIPTGTGD5SXez1woLWTkwz?=
 =?us-ascii?Q?4HTCkgpTHBbkYFxbV9r5dajskWmSmKSEU6BGJjewjyNMmzTQhmO0shK1i1+p?=
 =?us-ascii?Q?V0Uim4wr99I73iqdW4VPRPlBL9dOJcgaX71cmKiu4qzSB686Pv7MbsTNUO91?=
 =?us-ascii?Q?yeO7XcLTyL8LaJ/KrBmBJs1WbhOQMXOz+kEhc1YtBhiZTA7K0BITaZqQvNcp?=
 =?us-ascii?Q?fDZxRF5u7UJCCqnPwYfIzUOpb0vKc+Kl39pmFFOWN0M93ASBZaoSZ4RcfgTJ?=
 =?us-ascii?Q?Lud69OI776p/oqC1vFiF4XuUDzIWIt/2lmuUpswITLvx7Yh0ZdBFjVfY7bwN?=
 =?us-ascii?Q?mE93f8eY0JavlI5W6DBqZ7TZEfZDRQgnRL9wg3FESrjAUqEhCM/uzUYrxutv?=
 =?us-ascii?Q?h+qld2Edy2d4yOVbZIHHYlcHA/0158QtglhcQwcofWyIR6DUh0At2zL+LEqE?=
 =?us-ascii?Q?azyMjdXgv6ZWNiwIsNbM4vXzd+e27qkcQc1eUYZ4dQepyVxw3X4TqaV2bu6w?=
 =?us-ascii?Q?+nfWM0GreRXi9X7Cg/HcaYG2BMRdtq7ehn4JvOP0p6kh+bGvxD94aNut38rI?=
 =?us-ascii?Q?1f3H5/a7B/Vy9xsKcwcXiJKJ+krN/IIH4jJkDKGKw9WQdnzNvbajOxJZsBim?=
 =?us-ascii?Q?FfzQK6RQXjxYOQgq9uSqKAvk7HIXL+Tsle4eQNeL/NUChqTuJBWgLm7OKxMs?=
 =?us-ascii?Q?j5XcNUsEZonyMQa/zUIsmmveMqD65d7jXOE1hFpm2R9KzCNYLddJkIaix3Qi?=
 =?us-ascii?Q?DQcC+dmiNf7HLmwQwDNhrfZ3uvqozdt/qJKmdg2bVlOr6u/tOytROfIWPY82?=
 =?us-ascii?Q?MHOA+KE6t8QCDf9UGy5MlCqzCtgqwUSEIpP7VCYdsl2MbGkMVRMS0S1iPcrC?=
 =?us-ascii?Q?HZiZg2d1enDQI8gfOMZahsNBi3CjFIrQRoZDEtJW7Lm2R07Qg2FukTyULhW0?=
 =?us-ascii?Q?2YTVX4JoPtxY23+CLPSrE1V9Aqt3ihfFWntAIwd6Zj02oqwYjg39uJyhf8v+?=
 =?us-ascii?Q?k5iyF0SIAYhaaDfkIwKdwoW2QPu9A8iOBV4Zh4bN64eZtJ5S8KWUquXPjsQR?=
 =?us-ascii?Q?rTfmeu6gx+ZhV392seY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:37:53.0932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7197831-f1d5-4977-e4d8-08de18698bf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603

Commit e0762fd26ad6 ("rtc: cpcap: Fix initial enable_irq/disable_irq
balance") set 'alarm_enabled' prior to calling the function
devm_request_threaded_irq() because this enables the IRQ. However, right
after calling devm_request_threaded_irq(), the driver calls
disable_irq() to disable the IRQ and so now 'alarm_enabled' will be true
but the IRQ is actually disabled. Revert this commit to fix the
'alarm_enabled' state.

Fixes: e0762fd26ad6 ("rtc: cpcap: Fix initial enable_irq/disable_irq balance")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
I don't have a board with this device, but from reviewing the code this
does look correct.

 drivers/rtc/rtc-cpcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 8b6b35716f53..c170345ac076 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -268,7 +268,6 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return err;
 
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
-	rtc->alarm_enabled = true;
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
 					cpcap_rtc_alarm_irq,
 					IRQF_TRIGGER_NONE | IRQF_ONESHOT,
-- 
2.43.0


