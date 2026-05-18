Return-Path: <linux-rtc+bounces-6541-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IhyBJEXC2o5/wQAu9opvQ
	(envelope-from <linux-rtc+bounces-6541-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:43:45 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA3956DDE4
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00ED63059301
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F2643D50F;
	Mon, 18 May 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1OOxy8/z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C8846A;
	Mon, 18 May 2026 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111551; cv=fail; b=oDsgBK5oSOlnmqc2v5x7htBLYa4WYL4GWXh2R8Pfi4ZVR3ix9UDnbC8cY59ZpSUmAARJ8gX6SJIxMuF2mNrf6gdvpPkSZrD472ChAF0OXIYYIGiamndZ/y350Anx8q2F5yPXWRmyUBhHvvF0Z9zMDX9u7CJzHuP71Ct6506UbQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111551; c=relaxed/simple;
	bh=n/Y85/PXWC1bjDuWmoGu3dHAX4t9SMsDiq381mDES8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HhFBab0oMmrWDbtYgIzK68LsBl2CGBagoFV0ZeFwYW14yV/gfg2SFkbY6ZpN5x5Jr1IFIf3wr7E6Vw5VWn/MUGtgTJ/ePO5zWr9h64uX1kfwF+TJvphtoo4sVp+uKB3pcrA8lLIz1qeahcfzdGuuqOAYceSCHJeIdm2smIwxkfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1OOxy8/z; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyXDFp67YHohoRiQ2bw/M++Ztzh7H6W/z+GlJWuYo5+QcFbm2JdYBgnb3zl5vj1NQMW7wMNcPCGaWrVJ36itC9SJzANRpaDJAw1Jlqn98er15hFf/n3hMJYvcZkOLYRviBX3YahfZbvgvKsF4fC/Mb6+7eQW2CAQDFDWV3HbajJKVHbOjpVRK+xVNr7LY29r5EyHMob7mJ7WAMud3Yk42NjbxxOIGiykTWVhcCCrjc+L4N6CXXZSFmNn1dC459VqLjMqrW8xxxqi77hzRawrgwNuQYCYYkgQrMnDtUPNantmb2kkJr896VENiqJofgX9E+4lbFNWzCHBRh4o0MPwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKbHbnsbIE4z3FDq+CYyItA/FK1+9DPBrqpf3wL/3dc=;
 b=SB8lTBBar4XejaRIgxRB7eSyJMhVqP+l3kvkCZZEcMJWuQK1NPyXXhPah/sAeds5aXNWAqtqn1SSSf+zp+DpoMpsfPVuY40EQEg7uapQ9b+Gq43jglRoyvU9NXwZDnj+g76O+WA3GzbvmxYLrTw/A+NwiD0u9lJX1zJbqpaHDQ1I/t3qCG3nxfA7UouYqKD6nTi/a+roUgeZiWALlLCHiM7Uh2q5TcE6qiSPfh/caRHwnCGpA7VNgBqGcZLkziwtFJ3YFJyqWZ/JyplEAL6XF8Hoh8COEwMAJKO/ZZiUPX/JpO27jn+kuEgYueyAGoCxi4COC6diEgxr0naAmt2EgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKbHbnsbIE4z3FDq+CYyItA/FK1+9DPBrqpf3wL/3dc=;
 b=1OOxy8/zMXWB8IuNgrr1KH/wn5q9T3Zd2DB4LVAJaM/+8hb4ATNh0AWFVcBUxkXQQCLTIdTIzK57oiZEDIiM8MAsv2fZR6V/eNQu6zDPY38ldkQInRqq2tfZEn/zXSziLZTEJQeAK683U1RXr/ZGVLbyYk3ALcqjTj++jmtNZ8c=
Received: from DS2PEPF0000455F.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50d) by SA1PR12MB8699.namprd12.prod.outlook.com
 (2603:10b6:806:389::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 13:39:03 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:82c:400:0:1003:0:9) by DS2PEPF0000455F.outlook.office365.com
 (2603:10b6:f:fc00::50d) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.2 via Frontend Transport; Mon, 18
 May 2026 13:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 13:39:02 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 08:39:01 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 0/2] Fix S0i3 wakeup with alarmtimer
Date: Mon, 18 May 2026 08:38:51 -0500
Message-ID: <20260518133853.851027-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 732bef78-4f02-4f1d-a6e9-08deb4e2d2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M9WQyD/tPbpqXLrDOzjwIIVCB+Xw2CND8lQiexO8xO3LstWgvQAtkIY60ThDWVLB/XEJ2C+jlhv1HHXRb7jjQvcFhOB+Jm18Pz/dB1jSSQmDTVxYfsBOpIxjAfO3LrUUIbHzDNJckz4PaMTY15dqm9TAruZgtE7qyKyvFIJxnXnDVCrWnHuR2t9QKQxqZ7iJGoaIbf2aU3WxvzC7guyZXla9cTaH4HZBE7NqUiNlh7siVsCezsS9u0KJCXXTG+XWJmut/Aw/PEczpvsCttnn3hLAs2ZcYFZp5dNN72/YXhJpX8z0E/U907AaRNmg8C7EA3mUiba9m6ssy53p8xnzcRketkHQHcg7Z4zUpd6us4Nb6j3mbn8gfvd5yNXMF6EkEH5Mjyj6DMGNPij1RqI0QkgGfNH+xPQQOlkYF7ffvRXy8fqoH89XrqYe/C67GfSN58LwzAuIfY+geec0zRRWa+gyAiCm2j4FT/mynhOhsRdnWvXhftJ0own0A5SW4uNuBjkRQnZjjMjyd1Z1LTIzfoVSQUhAWJd401zdmv2dRx6semnpuIQSS+dFwWeNFeyhPGbvgSqdR3d/xUknT1w+1o2GI7GixKNmzawil04mLUG/Nwzc+3DuPhaygt6kHocBp05drugsDAsCdUVql4rv6vh9CcnpFguyRj5mQQiD//ZemaXUrj1G5Nydmh0U6bEeE9srgD7tmBFjTgW7Egt4sk63p9WY/8Nt1mGoLDegwmg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	woB97IU5z3FTy38zbM3xtUK98ZWo3t2VFRcthuaVfveYp4b8ndqKDWmX0TRQqPaTO5aWI7nLtLj0QtJ0zuiM1Ub8igVkMxg/sSuoBc9fZWmZ0EWtEeoq0vbnnSZJtV8h0Uo0Cr3ZNthIpJh5zdBRJ1JEb2V+HAwQ1gcAgVknoD/6BOjhxG6BrCZX8PJVlCqi91249HOEdR2HSaQmg1SvCqYmqBlPAW/2tAncWCIZtRDlZRAZqnsIg79b7j5lcLt+1wiuhVWXOYb9rJpsHPfI/JzzQxGfqFBWDW2hfAwUqyckpvXjhhQNrnBLByqXifcsUdJIRZyYSjJb+OH+9k+vXbs82T2KDTtnx+mbAKS7VoVYEKQNHKISBjL/NePmim5qfp95nSN6BOO1432jqTTWFcHuq1kWsPNX4qMNCgHACU//edA6XElqFkrh81+y3XKf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:39:02.6806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732bef78-4f02-4f1d-a6e9-08deb4e2d2eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6541-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 7FA3956DDE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It was reported that suspend-then-hibernate stopped working with modern
systemd versions on AMD Cezanne systems. The reason for this breakage
was because systemd switched to using alarmtimer instead of the wakealarm
sysfs file.

But really it uncovered deeper problems with how these timers work.  Adjust
the code accordingly.

Mario Limonciello (2):
  rtc: Add rtc_read_next_alarm() to read next expiring timer
  platform/x86: amd-pmc: Fix S0i3 wakeup with alarmtimer

 drivers/platform/x86/amd/pmc/pmc.c |  9 ++++---
 drivers/rtc/interface.c            | 42 ++++++++++++++++++++++++++++++
 include/linux/rtc.h                |  2 ++
 3 files changed, 50 insertions(+), 3 deletions(-)

-- 
2.43.0


