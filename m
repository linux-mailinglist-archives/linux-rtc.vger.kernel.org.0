Return-Path: <linux-rtc+bounces-2641-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FC9DAB4A
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 17:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62806B22EB6
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A439200136;
	Wed, 27 Nov 2024 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OCEBTBWV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A22200B84;
	Wed, 27 Nov 2024 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723297; cv=fail; b=uPW2bnrqDhFSKUs7XoAhAZHQ50UW94aEMq3n8+z5gYGWSvfhwIBQ+TBOEMxf12zSpmQeMBBJkls40pFH4CcpUuEQjOGM7o3t8E0GJvcyPBuHRcTOllE4ag10WNhPepe5XCmFhyYGVrq4DtNSpeD8MPVlDlekmq+cMIDAMs14VmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723297; c=relaxed/simple;
	bh=rvh7El9FrcMAv8jCh0LDE1M2bbAny4HLtCm5ZK87EvY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z8SZjFDN0BPrMC4rv6ZlfwiqUTcdjm2k/bed0N4UNQJOcePOx0jeCpDOqWQp2iGbzPf/bINTXUFU9vCIM6W2uvt/lSqzsrhGp6ZBLMUrtnoRG2DUhBlu/gZTbXaPQRLXaBMoBom8bZ2hVlvNo2LkLhL533U5jLINhU/jBD90mFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OCEBTBWV; arc=fail smtp.client-ip=40.107.100.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZhmDwI/32c5qthiWPrYdlmbC9zOcz723jSO+KKjUgxoPgf2Tip4uZc6/Iks0UluZHTwa6e+wk1LyTb6/dSyL2Lz/A4EkyfywSXApxD1sbLSghXECti1svD4l53zab/YrNiRdn5AXyHcM4prp7aFyaYHVF4X7he8ly4s8CutOG7ymN5rJfoiz/Pqqd9+Nau40SZUSA1ajX8yL2VO1tMBdbKCpFd0s5EYsFlO/D3ygP+UfL6JJkvjaXu0ts/93oxTtYHUvmvMqdklbVt6E8CnF5Y2/IE9knMJeixRNhgNh8LWhUDpBivd5VsdhL1VoYtl0E8W0s5k1Hh05nwVFnNrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7pgvGE7UEQZqkAfpdR1Lh+7Oz3bZbtvMzk4k9RPpeU=;
 b=xaLf0TYdR9bPMCCK6Uhw8xAioUz+CWfL5ML5o5M4tqRrHWuaQ4CTOyT620RFWg/EDqMycS0PduBJlsxrcfES9dsVYuU2lniH7NvCJToAFoYMTxMqEEXqmmYb2iyv9O2tRSmJnm/WSgXJ8AS9AAEnpHWOKJPCjnCKFxb0i6mTyFMMeNA63+L9v6NbtO8YiYveJ3BwNm5YZKpeFhxKMmMUpC4uq7lun9fWJZ2ytm5a8NOyditQLL8KSgF3jNH/QO24LasWB6QSCDr/vjOcz/+AVyIbtAM+k2A25H9HsZzq04AdVF0Xv9vkcZvd8g5IkU/4ZFdonQJyUSrtz7DHJ7t5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7pgvGE7UEQZqkAfpdR1Lh+7Oz3bZbtvMzk4k9RPpeU=;
 b=OCEBTBWVFA0uXVEX7v7uZYrNelmys/5Nco2eWPDtvAom4uboZApQaz/TdNhVHmP/HpBVvOCvxPzc52CbimESkMhySDXjXPVQ/tASIQbX+2j7kfOeiJEDfeA863p/sTfbJrLBYOpYbUJjx7sWhflnIT7Av/9jIUEmbA3PPomepMQ=
Received: from CH2PR11CA0016.namprd11.prod.outlook.com (2603:10b6:610:54::26)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 16:01:29 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::81) by CH2PR11CA0016.outlook.office365.com
 (2603:10b6:610:54::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend
 Transport; Wed, 27 Nov 2024 16:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Wed, 27 Nov 2024 16:01:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 10:01:26 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: <stable@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:REAL TIME
 CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>
Subject: [PATCH] rtc: zynqmp: Fix optional clock name property
Date: Wed, 27 Nov 2024 17:01:22 +0100
Message-ID: <cd5f0c9d01ec1f5a240e37a7e0d85b8dacb3a869.1732723280.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=michal.simek@amd.com; h=from:subject:message-id; bh=rvh7El9FrcMAv8jCh0LDE1M2bbAny4HLtCm5ZK87EvY=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhnR3p+BLLLt2ie2/kNR5nPuD1olOmwMTYqc6XKioddzZl Jdr0G/XEcvCIMjEICumyCJtc+XM3soZU4QvHpaDmcPKBDKEgYtTACaylZ1hfvmxV9fvPzJi4vKz vzVz6q/YVTtjDjHMM3U9VaPqmZe1f8Lcv7Pq064eWdvADQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: c232527c-026f-4175-b912-08dd0efcc12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fp1RnW3AjR3W2VFI/MyDUWhbmYLoYMGhpBUU0+GfZDn1A5xRxDLbZHQYSIFu?=
 =?us-ascii?Q?drsvcuf2e2MwuxVu6SkHXzw7XvnX4zZrPhFk9eh7WlGcRhQ8V/O6zSjNgQOT?=
 =?us-ascii?Q?4iQGdAv6kQ9RXhBng9P6soaOHpe2uQqwnkJm0AryiRK57MPe84L5la3nB7J6?=
 =?us-ascii?Q?amYnrKblr6samxWrWzb4TV6AGyS4z93nKQDgStn9V7/dWVi1Z4bCHhiHN/jY?=
 =?us-ascii?Q?fhTafh7DIwR6DaeWe+T/pueTupYZsnQuz6bD7BdbWwXOTNwAZnXXvLqV7CgE?=
 =?us-ascii?Q?IJizNqaAyhHt8kU3mDGrKlIpXJSm9+RFli9gogIJ1yh3EYWOTlwuKJft4PwT?=
 =?us-ascii?Q?tOzBPVsQM4ZnldiQaEf3se455sEzQKLgD9PQ2ngqm3Fu767HMMUmP8Goqngl?=
 =?us-ascii?Q?8wjCPIFhRi/KHBwSHM/9Cz2q0rOqOxuKNz0C8p26ZzKQpjcS8v173TgNxRSm?=
 =?us-ascii?Q?zKvJbWJPQI1jcDz6F1uNScsZeJgkTSDFmB7C8aISKR4xOmWSbwXxKaUMyb5O?=
 =?us-ascii?Q?AwD98ilKiVdH8tQl4WzvKC43uqgb/4pAQC9Cf44sdoxfag3LwBPHeUof8KYb?=
 =?us-ascii?Q?rSQAxAkxGq8qC3X61R+X5rRbRzIlrhCrpHi1oPh4kBEI5t7G1uXIyhcDpUFI?=
 =?us-ascii?Q?7kDaLzm2NO1+CF4wxmUgdE5zgr48L4oDNXiXy3sXUTGwYKQPQoljKhWpASZT?=
 =?us-ascii?Q?Z83xu5Urv/HsSuTyaaUPpppc4EfvlJVjq6XUMP9TFpkHXM3itj1PYay5P4Au?=
 =?us-ascii?Q?2S752WV2w+TpORHyOtcr1Af2dmUZyIrpn2zL73NymtGTYu1Cc5SfGFElSVVY?=
 =?us-ascii?Q?siYhVOdp632GyUEwJ3zGqyTcVo77pJJMpWDBV14U82hxcsy+tuyrW3jXCmBV?=
 =?us-ascii?Q?suJHkrz5iGjlBk8bsjfIEaN9eoSAHXVIYMtx24ZGPwjr2xMPrew0nbQFf4mA?=
 =?us-ascii?Q?w/IrKKwdjKwZmGIC++4H/r8yiQexuMN3ZJNTb/UpQ36Ta2EcxeSTmLFLa3uj?=
 =?us-ascii?Q?E3BRNEpGT4yndcfB3bAIUOvSyH//ncy54BRIf+MIf/4ywmkqoF3joVEd+T2W?=
 =?us-ascii?Q?u4e8mMPNZP0Smzh4Y3PB/St9fWIdBO3+3p+RRRFaGW6XolDNfTzW9DJMzhGD?=
 =?us-ascii?Q?7Qe7WQxHVWZrTNS2uz2+D2EklRHmBgjPJDNhVDL07IfOEzYRuRXDEhRtFgJy?=
 =?us-ascii?Q?JthHWC3LHENnNuED/6yOluUoOBo58cFqG1M1iyme3RsUU8o0sIGr+kZQh+i9?=
 =?us-ascii?Q?sYlBsVLmurJE0oqeZYEN81aEz8BlMmtAySv5PCtvk/KTAZpgS4JIeQ8r43Tx?=
 =?us-ascii?Q?DIAej3ouCXJP5FKorMdiJQZNIahBMYOkHzpZ/kinAZMDWXWQKGNAgyB0P2Lz?=
 =?us-ascii?Q?q2atdydNhmGvbY2w19CPa0TO5OMyaD9S9OI+kf557usqUEuxiFwyf+5nlETS?=
 =?us-ascii?Q?B5oi3u+j49hAZV4qXWXskqZfSn2JwXlZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 16:01:29.0528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c232527c-026f-4175-b912-08dd0efcc12e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

Clock description in DT binding introduced by commit f69060c14431
("dt-bindings: rtc: zynqmp: Add clock information") is talking about "rtc"
clock name but driver is checking "rtc_clk" name instead.
Because clock is optional property likely in was never handled properly by
the driver.

Fixes: 07dcc6f9c762 ("rtc: zynqmp: Add calibration set and get support")
Signed-off-by: Michal Simek <michal.simek@amd.com>
Cc: <stable@kernel.org>
---

 drivers/rtc/rtc-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 08ed171bdab4..b6f96c10196a 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -318,8 +318,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Getting the rtc_clk info */
-	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc_clk");
+	/* Getting the rtc info */
+	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc");
 	if (IS_ERR(xrtcdev->rtc_clk)) {
 		if (PTR_ERR(xrtcdev->rtc_clk) != -EPROBE_DEFER)
 			dev_warn(&pdev->dev, "Device clock not found.\n");
-- 
2.43.0


