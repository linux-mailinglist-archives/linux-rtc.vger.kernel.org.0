Return-Path: <linux-rtc+bounces-6559-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPQwKHOMDmrG/QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6559-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:39:15 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7859EDA8
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D08B530686E7
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 04:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EB8385D96;
	Thu, 21 May 2026 04:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MuzH+7Q4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFF363C6B;
	Thu, 21 May 2026 04:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338274; cv=fail; b=hd0PsErjlPmya0JfOnn13gjVh5BOU0dRILcyhjuHIWg91AnDcckxv85HMTBU5zNwLSrljpmG6gC3YGZgfz1FmBkXyKpK/yWGf3vA5UmQEQr94y5/+5hZ3w1WkYWiv980kazZEpyRDhqQYo3GNZoPjMdSdPHWu9zul0KyZff46VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338274; c=relaxed/simple;
	bh=tI7QH4DFYaarys5Fjp42DkFCG6vXxhQ+I/o9FNxWbM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQGUPZ9yc2T245jq1O7fuyCS82CzUbTudXCNjavigBPmORqLRUTnLw76LjHZvSRpsvCnZWu7tAzXrdZalJ67wc7qeBifv/uxBVFqByyUlzEcSFt0uq8XZesdPGbAsRgJjWKMIYklYI8aKaK3yS6DNxKIexuTFr7f8Cug8j/Y8Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MuzH+7Q4; arc=fail smtp.client-ip=52.101.48.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlRqF10yNyUCNDqv+po1lZflmL/fIiYWmJ7cHrujXwezsC1FJ520L91pePIsFaqnxpsCbHQCKDuLZfUp6I4x7tDdL889+eQlTUB75PCAod31X5Xx0EKB7NicN3ET6ccKQFcQNKKDAXfbIV4aQ1vKK8qStlVqDys3YMyV4WveqoREwj8TktMtI02aRsYTAPfobRfOlV3/3Yy5JKZ0LuPPCMAWtl+LjhJt6nbVj7ZHNEZ6f7P0GO5+vM9WyvEx0fovZSaeQ1GJWprvVTDwpKakdad515EFuts/5j4zpJQ5IkAxv1PqK9UYH+z117E3O9yfMFIv33nIVO42YUORFAMUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGrxSfgx9jUgbI3xaJUQk9EKdeW4sTzz1Yi1wx/8OPQ=;
 b=mt5E1udPpf9r4b9+RnCFSrX3P3A56wInKVrUNyxyOZfvDR39ZtsVkj3k+si1VqZ6yZWKO6Q8+iwxLAnelTvCwHVoagAWdpmZxQgrG0h+L2VuOp+O9SpuMGNDD/qqX9H1KNB80xyJAiXLWd6ttyN4mJZL9ZVxwXnvL9h5zyKl8+hlc5AnnEWg755m1DcvH2TvxWHP0AnIT5yGjpeuvNef/S3lE383fr5/4veVicqSOp6CVkrEoHRwYbW9ln/OzZrK3l6GwIH7clcl5wa+Jgpv0NxDoe+yih81/D3Mi3QNV1jalAS+aGrT6bvxSyu+Qr2tpRFC6olaA54do8U2xnTlwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGrxSfgx9jUgbI3xaJUQk9EKdeW4sTzz1Yi1wx/8OPQ=;
 b=MuzH+7Q4iAGrQf0IGFfRlFufFd1QoqsLbcDFEmslC+mZwrSdJ1wp7Yj8mbTThysbuArzM6p4xSLc0o2L89vNykpILpTf1ydc+8Ke9p5D44FdVFCzyiiw+L8NvIoHZhmmZw7LRn1/FhXwC/CvnpirrEDH5PD5B+3s0NqtRWTYfPc=
Received: from CH5P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::22)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 04:37:48 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::41) by CH5P223CA0021.outlook.office365.com
 (2603:10b6:610:1f3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 04:37:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 04:37:48 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 23:37:47 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 2/2] platform/x86: amd-pmc: Fix S0i3 wakeup with alarmtimer
Date: Wed, 20 May 2026 23:37:14 -0500
Message-ID: <20260521043714.1022930-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521043714.1022930-1-mario.limonciello@amd.com>
References: <20260521043714.1022930-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a68916-3d29-4444-1ebb-08deb6f2b635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|56012099003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	BNeUVvPaO1OtsVSJMxxjT5K0RG97RwmXqg7PEagjkI+DIiPZeEnAy4SQUVDiZpL8e+QASzbmNg0U406LReEnQpB2RDmdpLjQK3UPw/RKULMI/sqkyZvaIYTMdzRsndHXWcRZhSJnVDPaTtZzuFStpM8yvmGNUSkqC+lZ0LELIqI7RED4SuDyi+sqU7vV9VMeiHcmxaVJINoV75bG6JpGy9raSICzhboRr+ROLVHQigq2MJ1/Cwmyrwl59838zcabgcIdr3NEXGfWlXZ3grYAJhbv5cwfQpRAzbk2hT+Y9WMt8zq43yybma3gAy1lM5QCELVHr3HlkSRJO3+Qw1HvfqWzq0yj4ekPxo+ySdom8XzVyCZqi0c6QaSbfs0SCCkiWwYnYReMSKF23cR+PdjhyT6pq5M+izdFQE6QZivqRjsiZ3twXNmVULT2GKHViqKQUO0Kd2eHJme1ZnHCXVQyEyBQrxL4GhyFu41P/2X/969xjJXcbIwHpQx6IFUyAldsxYOVUOa7exvKQuTT6vuZg6JUXG1TV7pBqvqqsktUeStaD3u+ACWFM3CWWXrepqwk/bU7USRIV5aFnG3+TcTxqqtTzGvE71XQxBOvyesjmsN4BCc4vMnRIEhO8fw0gVmCsnhJnylLWacsSIL3WED6170rE3cnYE43YutFjYHTMaLw/jriJN6Y6jiX+/uRlINC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(56012099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	88ISQqgUGu03C9Fv3fQRzAal8bXV3AVZ4+W/nUUwi30gnMGoOU9LfwZA7Fo1GoqnMAdWYUq5G1/h5bsR6jqW/J71wtZfNnHNfghdUK4y9Zir1nZTdU4s5UdVVNhWQv7VHXF1aCsR2hSxQPblh/Ljkl8qWCTOdAwa6DRIxu71lZvdpLMyPPIdVKVYNI2iyj6H3POf7y6vTPO2xOFe0AoWT98fYLBLLFqkJTsN/FddJtfKhC7nuFgbtjPgscZLRzobq05XEYmOtpZ4IoaNVArg/C4bcZEoV8zLLnZ28rrfdTDID0kX8aB2L7XnZFH85eo8obvytdYe1jghfpuMOQvktQOzn+W1LvosqzvaprBPGMTKKG1mUBxyvlnre+P5tmJHH8SNYcRDYxwzuTiINfXAMV0/RvAfgjnTvd9grA0B02i8fJ7F2yrdk9sLH/Fmq5BY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 04:37:48.7924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a68916-3d29-4444-1ebb-08deb6f2b635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6559-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,gitlab.freedesktop.org:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFF7859EDA8
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


