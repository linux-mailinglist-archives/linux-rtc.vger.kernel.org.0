Return-Path: <linux-rtc+bounces-4607-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7AB1628F
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 16:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D27CD3A1850
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 14:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CC62C324F;
	Wed, 30 Jul 2025 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gYLtscgp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE92AE84;
	Wed, 30 Jul 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885287; cv=fail; b=GyVnK43uZlLtKO0/1N93zqicbQWqR2QVORxj9DhyGKAX3HVWk5VySAC5NyPYnNyRKuXGkMmrCJpvpXkjsaFE/5JOmBkBfZr0RHuFamkYiPYyUZ74ulVwOXDWUd2gSMZjBLKvzYx5f1NPGXYjOlpdoNcaLAsUGAmJ92QlOIe2JW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885287; c=relaxed/simple;
	bh=EHPxkGbvoHf7r4FDdOBL+MouTB4HtTKtanxcyCv66RI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GIKgcOlt1D1ca4sk/A6Sz/5t201vq5cvfP6NFNtzq7inl96/RuQ5s+GF4nCbw0kXSeedeXAd0S6PMDXKOn9F1MTIP8hLP+dFAShb93YByH0BBF5R9ZpPozWTLutTdJ2NRF5fp7Jsf6KhYlwaPHWFvcMZu46M3baVp2asCXrzF0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gYLtscgp; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKnfflEwZ0aiV0gDJ2yP/I3G2n5ZVfvakekTHfq6HhaTuQq7Oe4zK6W0vmXfacBteu/LKSnDCqcXi22BT9ZVTIduOMXgYue5nmBCNpNwyWkE4CWQbUsf3KPgA2NfxfPouNsDmXDQ+LvwXJ5MatDCpmFqbp5ayjB8WZTJ0xhWQHa83R6jUVRsveCg8YOyxVl0iMbxGzTjxvCReQF3RGqesz5K1DQ27liCH+CmkLxsIHgK6H+PbQ2XYuyKwrU+AHfJ0QDnRz9YB6QVNMmuqTRbMo/nr1+QLhAoKA/FkFXWuzfSnF+vk/u5BTL2mbiBAEgyD15WM6mdAuPRwuI7IDbmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwybOaHzIBthLs8G/IuO1ESl+V/z8kWER/2+ChZYdYw=;
 b=k2qYv0vLYqJwTegi29m5SQtBEDdJnhi+7+9gBmLXUItkIF9P2UlQB5o5ZX5ZH+iT0q5mi+CHFZMZGQT9aWEaJCed7WXImmfoPVfqQr3Osn/2osS6qu1ZcVHfM1ggrKkEuVzR9wuBT7ARCqLzI+axFuQ56Y6727PGOh7ITGycb6od7Z9hlQ4OPnIb4k3NhckY7AbDfhYa3rqeEGi08GH20iH4LBLwynr7XRgS1oUTXgQbdAxpmMJCTwr0MtMS4uSdMYoDtluZ9r3MmX+TpQHBI6gorHCK77YlUEKFcmT8MdM1X6prMKLvZr0LPJdGTUXImV3yAEEJ+jtekG1dFSh6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwybOaHzIBthLs8G/IuO1ESl+V/z8kWER/2+ChZYdYw=;
 b=gYLtscgpEZSTF4mc21Q9yMFNwvfttMViTSJPfi+vfb7y5p+kEsUTqLta7LafBsOgL94r2vhYW4U/NfYbOaWv1nbwy3Xm0L13+T1vSkEn+Jjvp+kdhgebf0JF8HEbAZ585ZUbUIyrvkDAqaDVEd8IZmJQ7F2sR6v6WvO4TCdgoZg=
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
 by SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 14:21:23 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::db) by BYAPR02CA0033.outlook.office365.com
 (2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Wed,
 30 Jul 2025 14:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 14:21:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 09:21:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 09:21:20 -0500
Received: from xhdharinit40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 09:21:18 -0500
From: Harini T <harini.t@amd.com>
To: <alexandre.belloni@bootlin.com>, <michal.simek@amd.com>
CC: <linux-rtc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2] rtc: zynqmp: Restore alarm functionality after kexec transition
Date: Wed, 30 Jul 2025 19:51:10 +0530
Message-ID: <20250730142110.2354507-1-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e4b677-6588-4034-89a8-08ddcf745c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EPGmkM+DmTWfXsSopfVzAkm0FGc/asq6Z3BeQ1KLNi38sx4ejwfE3HYtBdnK?=
 =?us-ascii?Q?u3sXcWzFRvePVsKbNNQQJe2mCwj+8jPv5gzXxyg6vcGmKG2KczpJcuZpEt4O?=
 =?us-ascii?Q?ZUmBKCh2AGSbmJCvOMIxZw0evCh1ND4++CqsLejnqw5WBZ4f0mYXplIx5RrS?=
 =?us-ascii?Q?Qy0sWxQzn/wt5Yda5KHONZOpedVxVyvSrlJI8TEmQaV1ednAa4A8PgqbQJwH?=
 =?us-ascii?Q?e6rEp0nOgADFuM7g7jhUDa76+6CkzytOo1VHrzjBN91iNAh0W3hpdhFupCcY?=
 =?us-ascii?Q?JP15tQGeTG6OeNLQHkMuTYFEBvKfmVT9yn+rSInI9wpM4jpbKn1KpOj06Iib?=
 =?us-ascii?Q?Lua8VXvcoxOCNAQBMrH7GBB54NdgGxeFaQ7V6/88HYdSMF05Nd2TdUa5yGcS?=
 =?us-ascii?Q?rYcqYLWEE5JoNnvutK95Twsv47nL6q40HOZJn968cP/osmcXDZa78nZ3UBHX?=
 =?us-ascii?Q?m0LXvKudbJRmDJvFv9rlwl2Z6H8Z9Zws7Cpw1Tc6VgNLjqKDbZ06BUYfolAP?=
 =?us-ascii?Q?WGqjnSf6D/jPUB8QRe4a0Xp7+WEkz5QeQJyaQwXWGzwLhyq3cdWSdOr0Yh88?=
 =?us-ascii?Q?X252CG7VH5k96z5ucZudRG9z3au5pkXudwP9yKrCCiAhO7+WUjFASgrgKYBh?=
 =?us-ascii?Q?f5oCkX8OdfyqpBeksRk4MpkEr6PcQ1js4rH4Cis3SiM0wKhxAZSQQNHtojl+?=
 =?us-ascii?Q?mushs05UXDuhsg18uqYBTIQbXmFVjrUQd+z5lfz0mRlabDNJvfoN5giRmeqN?=
 =?us-ascii?Q?bXoo7Lcu+Yo0n3KjK5A2JPvY7fnlugR2n/RqZwUtyHukTYI+b8Y6OWLIO2T/?=
 =?us-ascii?Q?xNSzmY3hctjpE4VkttAQ0drvr/VHgNDt1GVI/F/XLBsIhvw0/v0EkjS5wvkJ?=
 =?us-ascii?Q?jOI6OWXG/d9R25pJ0hYAbljOQJrigGV5qk7EAE5yV+ubdDSGSe1c5A5MW9ks?=
 =?us-ascii?Q?Xq4yue3oOQUOGA6+K98IJ7/ur1yzSLIx2gl3Ug+5weGlfz0DOPJb4MWu2Xut?=
 =?us-ascii?Q?iC8WLciGUF+NtLjCoBwzs/MPF+vwntFGyLLi7Sd06Ifq5cO19NwmPxPYiHgl?=
 =?us-ascii?Q?5SB1zkpDCQULPFGxpCYzS1jZakivkDEBVIZHSy9wg4N8ing//5NR7f3hpXEg?=
 =?us-ascii?Q?XG14SOiRahon/hguTaDE0sLYWa1+kFxL1sO42OCuiJSrrZHfa5UaiObvw0FQ?=
 =?us-ascii?Q?Jbbicz1AAKYJM+0DlXM+pTn8KvS+AXiLqJsnE/Ne2PoHC3X92/bsZYQf00ez?=
 =?us-ascii?Q?RMKLqAImWMHC8ChxnlIItnAWQ/Q0UaoDN3trmPfbb8h004B78jWC78NXZ/2n?=
 =?us-ascii?Q?0SCMFzywBw5Dov4HLJMV4KUrV42ZyV+yl60FIOIBGpJj9S1y0Qdfk5xJog5J?=
 =?us-ascii?Q?b/VThd+ecAhbZ5Z64zyUXUkxiiRVINt5vKCQKl2D6FVTxYr/3Ok+VmhyMCnf?=
 =?us-ascii?Q?N3H7FT95cTFTnRoZHFLSaR1RjGK/b3E5nsAVCP9TOY+SSjfMF7K1zy+x7k6f?=
 =?us-ascii?Q?t1NRKr480MIhJDmovbbL1+1bMwRbiZVW0r/6Hz2IxKqdrHeMdX1VcnM8rA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:21:23.1787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e4b677-6588-4034-89a8-08ddcf745c98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190

During kexec reboots, RTC alarms that are fired during the kernel
transition experience delayed execution. The new kernel would eventually
honor these alarms, but the interrupt handlers would only execute after
the driver probe is completed rather than at the intended alarm time.

This is because pending alarm interrupt status from the previous kernel
is not properly cleared during driver initialization, causing timing
discrepancies in alarm delivery.

To ensure precise alarm timing across kexec transitions, enhance the
probe function to:
1. Clear any pending alarm interrupt status from previous boot.
2. Detect existing valid alarms and preserve their state.
3. Re-enable alarm interrupts for future alarms.

Signed-off-by: Harini T <harini.t@amd.com>
---
Changes in V2:
- Remove shutdown handler to prevent alarm interrupts from being
  disabled during kexec transitions.
- Add alarm state detection and restoration in probe.

V1 link: https://lore.kernel.org/linux-rtc/20250724170517.974356-1-harini.t@amd.com/T/#u
---
 drivers/rtc/rtc-zynqmp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac..3baa2b481d9f 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -277,6 +277,10 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
 static int xlnx_rtc_probe(struct platform_device *pdev)
 {
 	struct xlnx_rtc_dev *xrtcdev;
+	bool is_alarm_set = false;
+	u32 pending_alrm_irq;
+	u32 current_time;
+	u32 alarm_time;
 	int ret;
 
 	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
@@ -296,6 +300,17 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(xrtcdev->reg_base))
 		return PTR_ERR(xrtcdev->reg_base);
 
+	/* Clear any pending alarm interrupts from previous kernel/boot */
+	pending_alrm_irq = readl(xrtcdev->reg_base + RTC_INT_STS) & RTC_INT_ALRM;
+	if (pending_alrm_irq)
+		writel(pending_alrm_irq, xrtcdev->reg_base + RTC_INT_STS);
+
+	/* Check if a valid alarm is already set from previous kernel/boot */
+	alarm_time = readl(xrtcdev->reg_base + RTC_ALRM);
+	current_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
+	if (alarm_time > current_time && alarm_time != 0)
+		is_alarm_set = true;
+
 	xrtcdev->alarm_irq = platform_get_irq_byname(pdev, "alarm");
 	if (xrtcdev->alarm_irq < 0)
 		return xrtcdev->alarm_irq;
@@ -337,6 +352,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	xlnx_init_rtc(xrtcdev);
 
+	/* Re-enable alarm interrupt if a valid alarm was found */
+	if (is_alarm_set)
+		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
+
 	device_init_wakeup(&pdev->dev, true);
 
 	return devm_rtc_register_device(xrtcdev->rtc);
-- 
2.43.0


