Return-Path: <linux-rtc+bounces-6122-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBTGKDTbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6122-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:20 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECB2179D9
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CBB3093446
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217F83D3D1C;
	Thu,  5 Mar 2026 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CDWRsty+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5B33A711;
	Thu,  5 Mar 2026 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739354; cv=fail; b=etFRlc4K07Gj6nKngOMKdYF+MkPQ8s9+eIkYexBKbI3K0dpQdX9CSo2zaX5iLtOAw07heuMhMG0h4+ZTGkxUlA52ZNX7efn/lFCIKLkXGcQxgEdCJBEDZhJv/d32nsYH3JY2bwimtVQjMAnamZrCZgzOabnexj5YROFPuFCifJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739354; c=relaxed/simple;
	bh=/i+sYSoO/kY0U8bDQJxqY8NxwSNhr55GSmKjvctEJ28=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5a01bmh+k9HGv+cEdClm8qYZOr9IqlR5XEy8pprFB3zmfDHf0wZFBEuLAT+JG3xiEUqrp8zGPevGphYOrRiNswwEBU7+bCf38mXoFRa2urZd+/PRsluA3wH33bWYbxZITrPsMNSeLGrLVIu08LvkvdtD8AdU2dAZpXH5Cef2Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CDWRsty+; arc=fail smtp.client-ip=52.101.52.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmlLXrGmZLNsAjqh+zIlv7eJQNLx/0ENLmfAZhudKSgQx2GfacSx7DlEou1iINajXLjZCnM3JXnyGjxPdVnLvJOsnuzq3Wnx/ZlE/aoxZisksjGNvrHJ0oItJQzmIHPnbEJbGTbxjHXVvhElW47zAevhRUYbEa9KkcsMuy1HN46wG0XqhxZY5oDoNP/gg/uiM9cjwUGg2IB9hs+GDmeEz/sQBSadu/43RiLFtTBZ6yuek0G22varrmtqPCl3jmBkS2Uw37d21vIODoNjkTOYfuZHrfrhD8Ivpru+5GJ47qcqA6eOljp13W0gRHhu3n/XhQ26uS5nykTXN5f8JqzypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfJ+immh92VC3/rlOu4xwmhCoebuyl4/xBxOMzErutw=;
 b=DIXafOUxuHV7Lz3Klqr3Ke0Fu7Rn6Oe7AQpbh3bN9uo77awQooJ029BLAvLF41iUEyFOeRhWrXpPWc30Ox2BAXz6oLSjt+R6/pXSrbR9mP63I1vWjM3yBpDBmEpuLkxtMUwpVRZn5rSOJPBchxIe5hjxpW3pac4Wfl8JpnseeJdNWGy+R2zqlbKIAUIZfUpUtkMeUXruufFXZaZYanf8XrJeJBStBaDLpZ1SI81QZbRTDI0KzDMRMxsqiQbilu4BOt6Oec36vNvaQOApo78gt94IFSWP2yaWczFrRjEcQDIHE6Ets5Rxv/drwto9RN3kuxmgtW4FBqQFHfQaMGlbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfJ+immh92VC3/rlOu4xwmhCoebuyl4/xBxOMzErutw=;
 b=CDWRsty+ZBA2/HagqrycY12XK3gBv8Ng0nWErGcRx7X9nzNM6N24z8iyOwGECICxsDpE/MIT3tIt92UMBDB4CYC9OMKF3gQe+o3KHHh5r/ugruZG+Lx3IQTCKfBgPlKtb5n7PlIXkZTp+/7OjWGnymw6X5d3d1LD0rBrIcNaj0Y=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by SJ0PR10MB6328.namprd10.prod.outlook.com (2603:10b6:a03:44e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:35:50 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::28) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:49 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:47 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:47 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldd2431963;
	Thu, 5 Mar 2026 13:35:47 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 0/6] Remove use of i2c_match_id in RTC
Date: Thu, 5 Mar 2026 13:35:39 -0600
Message-ID: <20260305193545.796294-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SJ0PR10MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 621d7688-660d-442c-7ded-08de7aee67ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	NSLCh9fNRktl8Ke3sbCV0+uoR0XCxKTwnmyIoRjoBR3XhUUiPPPvVwWtSNpZxPq5BwVxhe87xckIxdKONccy3UZTzsYCBKyJgJ7ZWx99biiGmfwzFLKvwIMQd2cyA1yXj1dgmS9DEHHKONL6JFcdU5GIH7nybbL+dvD7MnzGtclCLb5wPILb5nujwdaR62Uiqcxm3IioxznY5vcS2KOL/tKkDW4dfzhVUdbjJE6M54ei4fXZoATRir7n62AGL6Yo43NidgQtVMrkjsq5nqlcb4DaBT4HTZXvhJsP9huw9PomSC9nh+HTULatfZ+VOzu6HZLQs1SVaZy71DzLs6O7QW1fvuGkoRz6Ggxwk6etKzjFuey0joGk/AdXWkx3tQtRyKFW56/iaGQvHwCwOmmgpZH9eVRddiMPM+TpYC1Z8DoeFaTAcxhLpU56Xm25IEtwv8amGTbhCUhFQsP3YGjCfvLOXkjzyLw2yd1c9u9K2zdQylAY/bZNXv7LLR9Bq1XPBIjjacnZcJVaezjFpwXW3mZ/Yaoplzk0AIQ0jN7DreDQudLS9NDlVEIb87MvZ7WDWlza74q5x8v0kTY7Q7Un+Ln478ZSmYTrf1/MvOU1KrykR4Q7YD5GOoKWkhnQVCk3V9YGQZE5JsuErl906VbnBZVDmgYBa5ASM4gXR0SUduGFToy980q6i8Ib6s0BNODUmrt47MVqDhdh4Va6gbcR6yE3wXeLJcr1moqjyou83LojZMXAT5yt1oL59M72Cq6h8IP5XF3SjlFE7DXgSymrKw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D6N6nnJv5BAt0Y+p3LvH+yZ4XpebceVSkdGLqeEabSTIiWRJByJq6u7H2jCkxa2RqPi3ACxUszAfz++x7K+EKzku/Rm8JdbNzu0cqdamzbw8vqxAmCEKslLvaS8z83Xv5Nnd83I6qjYAh5k8UXabFHwJjgdnHpBvQZQinCDV38EblLrkh/YHmTwTAdmQlV1637eO4O6OFSpaz7qNSAbxQ6e/Kr+1B8kcgpXlqEsJOr7CcN5K6555Ak+wB43kxjWPWb/8xpCydylfrT6GC6Sj9IAKHwoyrR5ZRR3wpnSdArmSbGglVgxjnkUvm5o/ZgHzD53fqo2HTSNgvaYX/9V7y1A6JQqIqWpv57IHKNB2ZAIW2tpxoYlsP6XNLflwIuIDpd7zvWGGRwGAZyuLKqQ1fDSW0O7UvDFnvOGy7RMBP7odszgeXePUchcIsmC8WiE7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:49.2112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d7688-660d-442c-7ded-08de7aee67ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6328
X-Rspamd-Queue-Id: 0AECB2179D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6122-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hello all,

RTC subsystem is one of the last still using i2c_match_id().
This is a v2 but nothing is changed from last time. If I'm
not sending this to the right folks let me know.

Thanks,
Andrew

Andrew Davis (6):
  rtc: abx80x: Remove use of i2c_match_id()
  rtc: m41t80: Remove use of i2c_match_id()
  rtc: pcf2127: Remove use of i2c_match_id()
  rtc: rs5c372: Remove use of i2c_match_id()
  rtc: rv8803: Remove use of i2c_match_id()
  rtc: rx8025: Remove use of i2c_match_id()

 drivers/rtc/rtc-abx80x.c  |  3 +--
 drivers/rtc/rtc-m41t80.c  |  8 +-------
 drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
 drivers/rtc/rtc-rs5c372.c |  7 +------
 drivers/rtc/rtc-rv8803.c  |  8 +-------
 drivers/rtc/rtc-rx8025.c  |  4 +---
 6 files changed, 12 insertions(+), 41 deletions(-)

-- 
2.39.2


