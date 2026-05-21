Return-Path: <linux-rtc+bounces-6557-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HAAODyMDmrG/QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6557-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:38:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0A59ED8B
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 06:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66BE130038F9
	for <lists+linux-rtc@lfdr.de>; Thu, 21 May 2026 04:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278D3783BB;
	Thu, 21 May 2026 04:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kITL3kKj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B534CDD;
	Thu, 21 May 2026 04:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338272; cv=fail; b=IY35yYHWYRS+t8jtpOVulHk7i+SsLlZzsIrzQI8AHn55q7XpgujoQ6yqZFENbudekThn6A84Xtnkdf3hNzJWy52LwFsZe1X7pyUmTOZmRDnKTGx/E4uz4xAmL1R4m2Qw9kUuDKYlH6GyWY/2yzDq3xQTf+sOac7nBl19hj5l7sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338272; c=relaxed/simple;
	bh=dgsK2d52bCsjZqSPhuuZXa46gmPI35boAelEQZ4U3o0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldYMH0MEo0X3wmhZMoba+EgPflehQuab8FOQVpvCjU1UHmF8+yI4hFFzpktHGF67nHXz6zmHAVXl4MByYqbpWhJ/qt4qOLw2rTV5NQDtHCh5B49ufO2CpGigsrx+9KVIw6lc6pxTuJf4I9mNQtnC7XnfqEa/MxIFMCyTxC7MMVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kITL3kKj; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUSXM2CR3pI+a3Q7EL6p3OPJfZVxE9KpgzGd4bMTWb84bPDNYeKRwiP7clQjSr6oJpjNmijlwZHCEpBYGHrwRc+vWAw1vu6p8HpB3QU/4pxpokYFYOCSWXGbnZO14uyPz/KRPEPZ3N72yitA6S6VyhnDjAXavLdkyMPdurNfpw4Tjbbsz8Ce8tgGXrw8KaSgAKrmMNpH2JaFdEZZyj6ChpGYriMhGyFEYReq5KfkZw0RynVEHICZbB6UZEsL2S7xpxIegxXrHl5u3vDyJTguaJqADL1QLFDy/J6PmxP++dWZGemZIRTAeq3Oit5l1ddoXWIUzprHVDYwj2oU6+MMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+55idXKHDcxVbIt0y8pNeb2eD7hdj+4QL9yMBkr5Hvw=;
 b=KvUyj0SEVX6XmtItORPwrPAkpGhUeRgWkwWOxQ3JIhxjZ60+R21ZvWDlThAe5lqNmxJIXUY5UCWqmLT5cTyGYdiyTGUj+JDXyJ4IiiXsCiFBSDYlTkzoURE8+Q2sDUkx+WDeWJYkacaXUh6smVD0liwUkybAdaalG/cP732BApMyb2e7t+dxnCd+f6/WcB73U3Mr1EMPyh/qXjTNir9KbbfqqpkAKDoi0JF8kpKUUXVnXJqmfc9Stua+b3Q4aqDK122ZWuTlKBQeefwqigANvJwUZZ+YyVAd7jfGqaiOvVbRh8Tm/Mkcb0sEBWo9k8GkezyTV3AKqLQnodrJZCQSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+55idXKHDcxVbIt0y8pNeb2eD7hdj+4QL9yMBkr5Hvw=;
 b=kITL3kKjUzJ2yTDiFWjwf4Sp/U2+FAstDtvW2gkvl2jBYvKJ1LsQPPzuhyeL47VcrBzs1DWEWs2TI6ZWXUbrLovGNv1cnttg07E0AvR1yBN9L2IQYtl6Z9ehODyUeXAJB9MwhSWM8uYc4g+uHoIuL7aznh4va41fFpMhlomPSC0=
Received: from CH5P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::25)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 04:37:48 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::7a) by CH5P223CA0018.outlook.office365.com
 (2603:10b6:610:1f3::25) with Microsoft SMTP Server (version=TLS1_3,
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
 2026 23:37:46 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 1/2] rtc: Add rtc_read_next_alarm() to read next expiring timer
Date: Wed, 20 May 2026 23:37:13 -0500
Message-ID: <20260521043714.1022930-2-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b65c795-5d6e-4b08-7995-08deb6f2b5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MAHDeExDP3tMRl9NSb2j1ZGc9exeSL6YuMiusAyS9osdkqmz2z2cwsJ8jtiZZTWDfokYZNxS/umTf8RPaFE3j38GW3DvvOOFiK5XkqB1aRhpTBiKDr7iqMLwsow7LEgdz+etysji+n0kOI2MQeNQ1h91k+VsXgHplUOfiCJpJxEHmirXl+8UuBBrJFUs0J9PcLkAEDKrx6BPdY07YarsobtobFP48BCqGzV/JtqSZGoixWdgglZKy7bcwcnMpRKxm9JwAFn7wDGdu7EstIP051sa5rn7qUy4am3Y/Ia/IKx9wi6oB4bXHMaRAu/Qw78el9R6rwcpiz3VpYobVuGAaJkgr4kNW+cLjfWwZHkfATRXiMzruo5Hrqhx4Fjrj4PUJ2LSCbe9vZucDdS/phSQ49RJ1jjtcm99LrGtcNrvY81USn97i7LaVXXh3E/GWn0QbETtzpR3aj1ADpDi19qZMfkVrw2gK1yj7IV5DmbdMXrvcjp31CwaP9QyMszK/S/iUmq+3ddyDJA5++0lmwcKmVKYH0Rsb3eFYcXbkvbyywLyR/0yO9adNMVWjYgsSXjhf7EX1mdkJXIfZNRp/Ie6DlVFESr5aBkIsE9thukxmTQFY/otKSv5pEcm+acqKoZjb1StwqIQLSh0RJwIiRoi2/OK+FPFNVST6niixecPWNdEcAu0aRlMjgPf6hK+ps+b
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	udfs3j59VbWfocTDauF+Ld1LMOSLSFV2bQCO5Zp2NUyhPmzBwMRTIS961JatgLWEmbVAhk6/h2JvGrT7u/srLZDo75TYU5lbXV+kqI4OIzhazooESIuLPAPEWRuTKMxFcyfClMqIKqGo6yJO8dKkErHTWPq1g3bJg6+1xBBjptsD/CMwRhuhfw/obE7AabKIjgGkC9Em5Hov7BUh8/8kSydWPV1bCVFXf84o9CZkXJuMyj+IQivKhITOnYV5O7aX99D0jE9NszAtXB3H40YwWmqZkNA2kX6F1vdSoUU5SIAgqqZjQvx3bYmtqrtMlehdyF9yBl1mHkVEa66k3Si7Tx5Vp7Yq2XeDwzPRNuBXLBT4CJBb/bYii63fDnuDhm9kiEmQSFYox1gy0vtjDK1d/xUF20R6lJafuHyBA88eKgTB/ESJryW4y71LIZCIxdsR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 04:37:48.0399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b65c795-5d6e-4b08-7995-08deb6f2b5c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6557-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41A0A59ED8B
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
v2:
 * Drop pointless variable assignments
 * Add missing ":" in kdoc for returns
---
 drivers/rtc/interface.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/rtc.h     |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1906f4884a834..7859be8f2a923 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -384,6 +384,46 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
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
+ * Returns: 0 on success, -ENOENT if no alarm is pending, or other error.
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


