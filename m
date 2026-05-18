Return-Path: <linux-rtc+bounces-6543-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFk9FKIXC2o5/wQAu9opvQ
	(envelope-from <linux-rtc+bounces-6543-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:44:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C109D56DE28
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C2F0306C74C
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EED481AB5;
	Mon, 18 May 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BzGDarUX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E23F1653;
	Mon, 18 May 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111553; cv=fail; b=OA+tPKYP0ObkDoIaPkoa/8nfdShLAWktYJVl1rAadZnORluvWPZxn9RRkrBYD6GKrkTvW+9z4qQNqz7FBrwQ+SP5FMQT5KwHYhxedyRCd/07JDDlbkP1T/D7U75NUMP7H50FXcRun04C94GttqCqFh+57u89auGwvco/HsYcMOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111553; c=relaxed/simple;
	bh=tI7QH4DFYaarys5Fjp42DkFCG6vXxhQ+I/o9FNxWbM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4/l9O6FuHsUeSiNcHhAkyMlj4dlV8sley0btXhQrsW/2hLwnv/A9EbtHx0+LQd2KduHwMKs82FpZ0u/+uJyW+QnUq7K0tp0laN7TqVbslGSXelyuCQRXJwRkRu5Ks78AAyMb6Q7H82ARDXgBLYwkMyGP9ouebgCj9xraNtE4g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BzGDarUX; arc=fail smtp.client-ip=40.93.195.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYnHl46dW9welzuQZAEg+W/MQdfLb9vZZnFILwSKqpfS0IfZL84+kiVP0EApo7ZypIedL/6LOpakVL1Zn3r65qgwfCIfii09qA0JIADYUP2jldcpadrV6NT0SDjE/v/0v6kT2x4mwp87BJH9aJZ1UcFUrz4dHqpOpHdb4CKfxa8TN4BQ9tu89PLtmEfpXbkBIGhyQlIADSbrbi4r9mqY9VYT+7BHA6Nq2tcIi+QqrOrk1XAJdtSVtK3PYyHJdsFvfl2akKlK9UlvBC3vab3JFNN7I8HFq+Sl7lsHRvtoPxWIblgFNVDed9kgrn93de8qRLdHuKSajDwSIP5VCJdutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGrxSfgx9jUgbI3xaJUQk9EKdeW4sTzz1Yi1wx/8OPQ=;
 b=esXQkEZzsnuu2rOO3xwBpwiTzlFvXCmBKf+UWNJ8/B7ZByIvrhBqVJqdqPOFax8fQgFC7SMsUE2w8NYqgDTxBm5LBn4ZJnmjHVE6+HIVFjbPS7Zci7JSRdaLm+diZ8dbxxScE6Y99PoChkPFultXZoyPMbbrfXjXRqST1eFb34MeR1idu5CUrgQ8E3RPrujd3XpXp+f6xF+4BiRlFgwV7ocETWY4F+EAENGVC6lEFjQNs4NYHXxL6q7pfBTlz1LHotXXU5Fa0WoBXH2FDEaGw53Pn5SCWdJki1TsfSbg0N8oZrmWriMyfqjTxpXqLBg77JSGqqMcfr+csltlrKmoAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGrxSfgx9jUgbI3xaJUQk9EKdeW4sTzz1Yi1wx/8OPQ=;
 b=BzGDarUXF9qiwSj2ghiPgjUq0K2SNsQCeYC5D57XYstIQUFI6IC/D199QRKe6bSSa9D/429E9AwqDIio3uBxN27XnLH5l6yFG804KBx3I57l7HDWFOwg77+MDji+8nCKZVAPfv6+NTlRjxYUB5Bk/e6FKPoLWM+hvygM3g5MWt0=
Received: from DS2PEPF0000455D.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::515) by DS7PR12MB8249.namprd12.prod.outlook.com
 (2603:10b6:8:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 13:39:06 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:82c:400:0:1003:0:9) by DS2PEPF0000455D.outlook.office365.com
 (2603:10b6:f:fc00::515) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.2 via Frontend Transport; Mon, 18
 May 2026 13:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 13:39:06 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 08:39:03 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] platform/x86: amd-pmc: Fix S0i3 wakeup with alarmtimer
Date: Mon, 18 May 2026 08:38:53 -0500
Message-ID: <20260518133853.851027-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518133853.851027-1-mario.limonciello@amd.com>
References: <20260518133853.851027-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4b411d-fc0b-4f38-b2f5-08deb4e2d4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|13003099007|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NQYDT7tjLisRtpozK5ttMBHgXrQtc9VOumecf5YZF9hxRkwfpmp30nKyRm92f4OJxHLSdCW7lcR1CcNTAtSzdPV0iBs5kM+exWRdWlnHpQgusKfMNyyT4RqcZWxEdFRew915vB7kfqfwbQAeBbXfTUkT86jLI7HtXxNzyMGVESAJYIlX9Xj06DLAv6ids8+79i94778O7rk8bBWS6KFgiXsXhEunrhN5CJrqI09h/tLhl9PUTKETCgc4CHKD732oqDkkGO7Jn3OgkSOvzwK8a/gMISmCzmXJ2HiJ4dYyYLOV9QzAkmhPw3Nnm7K0JqQEvuiETUZQoYcJehlv9Cm7MQT397FVutAOhvH/RFUxLWaITR8Wp5yaTghPDC4/w8IiF0M6kHZ8JqjwGRn32cKAt8Fk2/krXuV5HSy+8LCSIEkEyk6HZ+6FMjimYYDn9V5ZTjw0Axva4m/DfG2IoBKMsakjK2ZS+SPTkb4jrr68WykFkRGJC4IT+F9yU7otrzaj+v3B+QTcqZW0S3QG5DWrU62OeKVRBcS7eQCP/Y8lv+0QXN558AqUoxbWdMPg29vCbKoNoxwAxznMIviyEfIv8wX+e7bSCfupT6owfksaakPja22XHHbrd69uEvt2Ag8InR9UR581gmggJ2MdZ0rMVBdL1mP07S8c1XT9WI+HY3IPGVYnBeI9qVT/tqXRTTSr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(13003099007)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OTSShPaKLSqxbh0HicXKOCyKwNxfrbNo35nm/wicC9UBAgfyNFHCzaIsmDzAsRlTGmwmyBeA769YZXTA3sMPnL327xeZqeonPxVBzO+ckk8pdS6faKNi84iCC6Bf5a885RrGGKAthwQVYIjqwPKYn0/NT0gfH9gq/jGJ7wqHAOqS9D7t9gV+Wf6W5hGnycDgr8NnCXpT8kxnSDG5+9RYn+/8twhAyfepXM9DKfoKfPn8WNb1FD8f7VZc2Zqt+7wdeD/NsJW33wCnPwRkrfah7XenCUfNMt3DRD28JGdQvoNNOp4K3lsV9TFhOGYZXN9OkKbkDLh1rq0OWRQf2PwwSrCRw2PY/HEP/Pl8DzTzpZhUOCNEIg4mFQDmorYPS2O/O6T+7g8QyDTs6Ob/lcjVucGgSwzlXlg4mj2HYd49OwAAHtjZt0KZwCfCsovDw/9W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:39:06.0218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4b411d-fc0b-4f38-b2f5-08deb4e2d4e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_FROM(0.00)[bounces-6543-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: C109D56DE28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It was reported that suspend-then-hibernate stopped working with modern
systemd versions on AMD Cezanne systems. The reason for this breakage
was because systemd switched to using alarmtimer instead of the wakealarm
sysfs file.

On AMD Cezanne systems, amd_pmc_verify_czn_rtc() programs a secondary
timer with the alarm time. This was introduced by
commit 59348401ebed ("platform/x86: amd-pmc: Add special handling for
timer based S0i3 wakeup"). However, this function uses rtc_read_alarm(),
which only reads the aie_timer, not the next expiring timer from the
timerqueue.

When both alarmtimer and wakealarm are active, the first expiring timer
might be the alarmtimer, but amd_pmc_verify_czn_rtc() would only see
the aie_timer, potentially missing the earlier alarm.

Switch to rtc_read_next_alarm() to read whichever timer will fire next.
Also handle -ENOENT (no alarm pending) explicitly as a non-error case.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3591
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 50f5784f2aa2e..8cd2db0ccaacd 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -595,9 +595,12 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	rtc_device = rtc_class_open("rtc0");
 	if (!rtc_device)
 		return 0;
-	rc = rtc_read_alarm(rtc_device, &alarm);
-	if (rc)
-		return rc;
+	rc = rtc_read_next_alarm(rtc_device, &alarm);
+	if (rc) {
+		if (rc == -ENOENT)
+			dev_dbg(pdev->dev, "no alarm pending\n");
+		return rc == -ENOENT ? 0 : rc;
+	}
 	if (!alarm.enabled) {
 		dev_dbg(pdev->dev, "alarm not enabled\n");
 		return 0;
-- 
2.43.0


