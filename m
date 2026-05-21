Return-Path: <linux-rtc+bounces-6558-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOShAUOMDmrG/QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6558-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:38:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DA59ED92
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA423015892
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 04:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464E0383998;
	Thu, 21 May 2026 04:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SQ8jaSot"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE426059D;
	Thu, 21 May 2026 04:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338273; cv=fail; b=FSsDwf/GHm/wF3LDMETDv+Qgtwyh/KWwihZuhu9wIHcPa+KRFCDxh0wb3cHdJpM9whtKTWuuAyPR0aYcaehLCrdqxs/sSVjIN78WOLwF8VojuzZwPlqemd4owhG3fynE0+3ZY8mbkh8LzUCofXyFWE1VE86jqASr1vpCaEzcC+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338273; c=relaxed/simple;
	bh=2tdxk1z6FZOwt9DW9gLwU7bAb5ys05AKnF5nwO/Vy2M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QDOA4IVi4y/Cgd/CqECbaaJEes7s4YOWd1ROLgfDG6Rm01WBcdoi2LB/3fKALhUhOLcl3WEe13vh6Z+JVilVUDuYMlelJmHhmQD4W2Qf2oOCT7EMhvvtog1xO+dwx/PxxkYSl9RTYkK2ZAIMo6QzpmhNhG99T2bM0JvavxIomAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SQ8jaSot; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgxzpZiioGHXtQH9WibYb1FqC7uZRj+VBHNab8IbLrlcMU+lLfn6QgKkHhhBJPwUtqo+gwDtRTDe8FWaFwyzlvg9yccWo4M9zzReMXT9eRxoc5IRDSZdryMrKc1nQAqhxA3khylPOcVex9V0YFC5LjeA2ekL/IhCa9qQaXN4EceydjEtVbKJP8YpE2Ped1p7SE2nO/w6tAj+HRZTiEnVMky3vKtrvRxaBycICmPgGdCNXQB0FytgfJ1fbzofSsa745AAMiCXfUgx3ucrXD26s3UdjCcGS/JJIGFs5x5TXdXBZl4UQjvU1lfRXCWkILlGxa9WuqVCInkCcTJskZFumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfzJNAKK60/OekLKUpVHoaytPBSN/eq2cb+2t+Y4Bag=;
 b=aPJZE59Mek8p42FdHSqyQRa6jk2brhQB9p2/P0aBwmYh6U3LMjTE93kQQqxG+los21zRVF7ZXd29sSC427MVOnwyNKoaHAvZ+eQ1SJoF8tX+gkQSujAuwy8psWHgw44VffnDfbhMzyV9wb3jnzbuYA4PL80uH0bbP4SREv6T7VGez+WBasYz2NuDjn72PTA1uwDBgU3BsYKu9P8gicAB5epAcozbfTsrVtTbaozyD1OQiYMKwR/aAhb/PbSwDU6EGzvNl4pYIIXH+Wo7EGjdXNkgEl0743cWfm2VBXI44Z2QiRWAqWe4Y9mR/5mx9IU/k8NyAag6o37Gm3SOnXsx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfzJNAKK60/OekLKUpVHoaytPBSN/eq2cb+2t+Y4Bag=;
 b=SQ8jaSot2jJYB2rLkEVYo52pqlenx94YW74odfS6bmvqwPx7yE/Q3fXgqyQ7hagiLHUz7MjkRfyjDoP5Q8pg4yeh5CHcQyAGHA5eJJTMo7noAgC3NHxkLMjwZNPWk5lcgBFC7wWVs7Mo45Mk6BODLvOaodWN2xRqZX1blFcnqRY=
Received: from CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::21)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 04:37:47 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::83) by CH5P223CA0016.outlook.office365.com
 (2603:10b6:610:1f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 04:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 04:37:46 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 23:37:45 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 0/2] Fix S0i3 wakeup with alarmtimer
Date: Wed, 20 May 2026 23:37:12 -0500
Message-ID: <20260521043714.1022930-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccf7662-c4a6-412a-e5a9-08deb6f2b4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MtJFd9NKbNQypOcaorUUgVOMz25VjMhFRTUaL+VNmnXc96P2ddISjgWHLP6iM918wp0fUF6by5ILEpuuHVbt6wHkw3PTzkjbb/TM476GxAz2EzNZ3ZBso8n9mUw8u9b2UIekxoKm2NbIHQJTfYECUVuRaC3AS9S0rbRy9NUrvV8KBAfxDqOofPeKuMuREW91MDQw++czUwLz4y0fSe0iGdzKdLOpl1DyoZUetNyf3RoC0ysgyJTGCEIjE7pdSBvRLdW3dLW2ErAorfUXXsCagjvrhi5J/mqUTjqyV55Is5xXg5koz3CsloG/2AcBb0aiB1HjRV2Id8H5eMJaiJjHZjpr7/7aDNe4/yeLrc3Si8VO7oRboVBxrfTDgNGrYliv1R4NScjVpqw6aaiwIgelLunmR5mhPVpwEnBPUyZEbIL/bQ1G+ybOKmGdyLWzpZOKSSPbMJrfeKrmBcnmw6z8podkSiPQMMcCEIwAsHqj8uisgAPMG2ocaPYRbq/rtV9NTGNYgln6DW9mx8TGH8cMMNCrZ89/8T6RSALR/IrotNZ/7JR97wsVsMpCc6jHZU3b/ax7/G+WZzlRItsfcQCU2jD6oLyBD9+f0v1ekk+8A71E04j8Tz5B/tFvJ5YcKCEBZEoROYDgiTydqxzR5IGoFz6HCbVd1BfrrciSFDswHidkjS+gKUEoM6tg90taeuNpZyATnFlHYA8zFi92z6SfDcXjqF5KdTQgRq+Row6QVIU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FLP0o4RoxjY1160lUa1PjU0GEIZ7xk1w084qgL7FVYjNaXg4ks1KAX31LSZ1jZ0qzWXJBmHMiCbfRqp5ahIc0I6tn4b/P9nA0eIXC99caJotfZSCv7fJxR+wVViap/Bjan9HYYvs/Xrt1nOAo9us9l7qCChM8sCLrf+xuIdleU7BRFkrrWObTcr/LQqFAEELysUwgIStrSphFLw+EMvMVgCurMPWLvLTIe96MRXlO2hA7a9uSVS1hBP8fKDbSruaZcrenw5qjrdJcGPOiSKCEzZ8SovWN0OD+fg3LCxqEqZrizXBpRYxwImTMK+u50r0+0ZZSyX32wgxPEPRAgbk3AMLmCoUiXUK6KPLEjeSW/OCUXJ0LulGSCkmMsaxVupZmFHGJbeR/ea3dcZ7fcPUiQ9npdXLJqoQBDvN2jntWF5rRz01PhyOPJIWiGi/L70R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 04:37:46.5022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccf7662-c4a6-412a-e5a9-08deb6f2b4d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6558-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F8DA59ED92
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
 drivers/rtc/interface.c            | 40 ++++++++++++++++++++++++++++++
 include/linux/rtc.h                |  2 ++
 3 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.43.0


