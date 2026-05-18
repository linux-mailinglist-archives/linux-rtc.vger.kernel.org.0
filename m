Return-Path: <linux-rtc+bounces-6542-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIUGCJoXC2o5/wQAu9opvQ
	(envelope-from <linux-rtc+bounces-6542-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:43:54 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5156DE01
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 15:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FB0305F713
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727D9481AB5;
	Mon, 18 May 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3jRooJ98"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC663783B0;
	Mon, 18 May 2026 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111552; cv=fail; b=ZhVWb+lpeqc/HuPvjxijxhuq00DrJsTtHlOk/7E5+2OmvbJzeLYTlyjTRZv9hRcnUwI3gpwL26LxSvKuZFnZxNS3PNWvmShw66RJ26IXJfFDFB59Bz9q/poa2Ujd4czXteML3E0GAFed3ehk2uHSgJmu7aNoMCjYs2d0cntN2Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111552; c=relaxed/simple;
	bh=LYuLCRPHjNAErenZrN/zBeyGB0XfK/lLR9lwoNK7O9o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eXiJvSRgnUWfwvRbnqjjrNDm6uoyuklRSz8qgrNkQe4oNXfCoc6FuEz45JHAZ/JYQy0IY5diSw0h46jqYOUnQw/tVkImCrZepxPAjUMBy+c/e9QTgbI9MvxhQWQp8Ii3aropB7b5+exxMYwKYLXMdBYK+XN/EmupGJa9h2WZ0P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3jRooJ98; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHgz6d6ZXpRCMiTYah6KnVb6WNcQat/mESxxd/XjBFgYuCDulEeczzaqbRwyEUlb2O6gPE+PxMBHOFY8uJDcszairIMCOxuVsqzIMHqTfS60blOmrInk8lW50a1I7EoKc24qRMuRMbSenYZu5tPWJCbVKq2EY4CxaYc0a6/O9t5Ke0rNz2MAfvCo2JD76PpZygZbV6+OvGqIdv0YRTG6lO0JjenIpTbFzkXRShY+ynuPz3iLdrEMZ10JKmKrr15Foeywb2MQBeowKR3dIv0b8QB4LkNE6Wszs7NxbUfi0WLizu2EnbixDz2vtyM1+GQWWGe9MxyWpU73I4MRw0iorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1rUBPHQMN5h4mXhxdI0K5a8ERARmgi3OLTCSaHDE3k=;
 b=b9lx9xEpLfWlNg8R8MZEvzYnX9XlywJMmI50OQ5gtil8FF3oAc4gDotDNGim0R4fxkJybj7WXddYvkDjeV8XSV/LqL99I4y1SnEDiVNiuqMjObbvm02J7VuZuyEa3L4I0bu+syH572/5GdaHA731TCpPy/1OhLgawCBWOqgyqfwHamPXNIQqHwIIx3jIHYdeoqbPwH/ZMx5WC1efsGmz24I6yYKf7fyNpJtuB6cMLA46t016pmIwUdydK1Wnij+In+QHX+cxuJoRh5TWBpM+AxrKnp8Hm8LRk9gUeLKaZNL67AP9JzIjlZwEJGRx9euTPIu1hzZbodKP1bPd7B6nJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1rUBPHQMN5h4mXhxdI0K5a8ERARmgi3OLTCSaHDE3k=;
 b=3jRooJ98IiOItPbdAd8tqr8JbptijIX3H60c6xqkGev0GundaAwwK695onMMoVLn0gY1pUpX06V4FBGg5IPAShvqsT5inW6IAQsXeG6QJp5tgBHD2B4oZlBhDSkhbKUfQudW2lW0pJN2xZM+8DDau3k17a6oGETUp+kTcSjFBoc=
Received: from DS2PEPF00004562.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::507) by SA1PR12MB7410.namprd12.prod.outlook.com
 (2603:10b6:806:2b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 13:39:05 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:82c:400:0:1003:0:9) by DS2PEPF00004562.outlook.office365.com
 (2603:10b6:f:fc00::507) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.2 via Frontend Transport; Mon, 18
 May 2026 13:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 13:39:04 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 08:39:02 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/2] rtc: Add rtc_read_next_alarm() to read next expiring timer
Date: Mon, 18 May 2026 08:38:52 -0500
Message-ID: <20260518133853.851027-2-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 3026bff2-3758-422f-1a9d-08deb4e2d3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P9rr3tW/TIZV6neXyLE+kbe1/QXgXnFu7zAOQgmZA6YOFVi3bZmjaVnm4yOv6aQyEgHG4XgR6LNlMk4hAwcYHl2rT8tbktCS01DWGwpr7cjU8Qw/YiTM1VhCnCA6XqaE5Uk5pFqjtTGNhQilQwx1Mb+7YvUHIyXUCMi98hu42afhAf1sQ9S8nPbtMDpaagSn39BhNa1uzmzuKI7OeMLxJgIM+AACBkhcPd+c0pDlye95GV66dGf+fnoUoTEJZvIGB9jQZ/fAotQMySGHYsm1MsAHo7q69T71MM3RtLvGFSJNJB+kN9nD1YquBB7e1JZ3E6V7pwYHMB8z5qRMMETQZpNj8FFNae3M+wAEG5u1IPmJzyeULu9b0vBqnWWNwc66a14wD5lejrAOPkz/YDT+cosufX4oYhS93TxQMYuXH5XccbWsx6oR79J42P/w5AP0zSGt0H7tctFZghnkf370INpCUBN2iawg3xGLNlmfjbag55W9MXBtFKzxVWKQqX8MoP01VDsr4nnNc9ImEUIKM54cXPzMXv+5Jt0eSxZJWHyAcYj0yGD2K90eKW3RQYyctvjoeabYmdbyyAz7oWnCp5wpakLZsOOkS//hdCu6X2y/anW/GJ2zjDzVZ+rVlowHqKpmpe32pJAjJxr99yZXPXCA9dW0W2HRbodgh+1z9celceSb8Uhha5CqrzTtBAAu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vg2yLTJqzlkcvO8bKs0vxr9+RS+bCEC9VJlAVOdzbtm15OgxAHxMspTH4V7tc06NhW5U1ttHmaMEwxZ98CypASBH++ByRfqq82WkfPpnNT3TEC5Um12nYPu16/ECb6QWeHzc/wZsSDkuU4FimCquDJlzMyR5u9KpW/2xBpfspD+Vee8Vz4yHzop8f2roClk6/DYKpZpZiao09HXIJZOzlgUR+rBYkmZq7W/jhVOEXx4mfoaMTnC84bt23fjz6BePU1ownmodCQ2zUAd1sJJMd96Ml6MOnDCFMrm0wNl7DnELkR096DhPn/MBC5eVQuN/yK5HVHbfHRsNMGT8I9ZLl0EZ90WnC8Szuf3dnjOG3gl1/klaQY6UJzsu5keY+NzWWja/IGWE6QuXW2tCogwDLu3OgEYcB9J+DyNnRSa63YIjtZLo/MNBQrLN/6cqhru2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:39:04.2836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3026bff2-3758-422f-1a9d-08deb4e2d3f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
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
	TAGGED_FROM(0.00)[bounces-6542-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 9DB5156DE01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new function rtc_read_next_alarm() that reads the next expiring
alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
which only reads the aie_timer.

The wakealarm sysfs file programs the rtc->aie_timer, whereas the
alarmtimer suspend routine programs its own timer into the RTC timerqueue.
Both timers end up in the RTC's timerqueue, and the first expiring timer
is what gets armed in the hardware.

This new function allows code to query which alarm will actually fire
next, regardless of which subsystem programmed it. This is needed by
platform code that needs to program secondary timers based on the
actual next wakeup time.

Link: https://lore.kernel.org/all/87ed50z0le.ffs@tglx
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/rtc/interface.c | 42 +++++++++++++++++++++++++++++++++++++++++
 include/linux/rtc.h     |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1906f4884a834..dfcb32e272eb9 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -384,6 +384,48 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	return err;
 }
 
+/**
+ * rtc_read_next_alarm - read the next expiring alarm
+ * @rtc: RTC device
+ * @alarm: storage for the alarm information
+ *
+ * Read the next expiring alarm from the RTC timerqueue. This returns
+ * the alarm that will actually fire next, which may be different from
+ * rtc_read_alarm() if multiple timers are queued (e.g., alarmtimer
+ * and wakealarm sysfs both active).
+ *
+ * Returns 0 on success, -ENOENT if no alarm is pending, or other error.
+ */
+int rtc_read_next_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
+{
+	struct timerqueue_node *next;
+	int err;
+
+	if (!rtc || !alarm)
+		return -EINVAL;
+
+	err = mutex_lock_interruptible(&rtc->ops_lock);
+	if (err)
+		return err;
+
+	next = timerqueue_getnext(&rtc->timerqueue);
+	if (!next) {
+		err = -ENOENT;
+		goto unlock;
+	}
+
+	memset(alarm, 0, sizeof(struct rtc_wkalrm));
+	alarm->time = rtc_ktime_to_tm(next->expires);
+	alarm->enabled = 1;
+	alarm->pending = 0;
+	err = 0;
+
+unlock:
+	mutex_unlock(&rtc->ops_lock);
+	return err;
+}
+EXPORT_SYMBOL_GPL(rtc_read_next_alarm);
+
 int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 {
 	int err;
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 95da051fb155d..c09fc22819d0c 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -190,6 +190,8 @@ extern int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm);
 int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm);
 extern int rtc_read_alarm(struct rtc_device *rtc,
 			struct rtc_wkalrm *alrm);
+extern int rtc_read_next_alarm(struct rtc_device *rtc,
+			       struct rtc_wkalrm *alrm);
 extern int rtc_set_alarm(struct rtc_device *rtc,
 				struct rtc_wkalrm *alrm);
 extern int rtc_initialize_alarm(struct rtc_device *rtc,
-- 
2.43.0


