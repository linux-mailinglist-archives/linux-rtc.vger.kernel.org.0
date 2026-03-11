Return-Path: <linux-rtc+bounces-6168-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBCeCugTsWkZqgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6168-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 08:04:08 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F625D28F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 08:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4208030805E3
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 07:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1111F371899;
	Wed, 11 Mar 2026 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wkVH9qPx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA9376BFB;
	Wed, 11 Mar 2026 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212579; cv=fail; b=QtCQwVHI+fggRJ1BiE6qD7VhGDJ3G2w3B+S0eyfQvjOiukcyKqujIUsbXhqVoTZouT/XtN6E9SyjVOpqDn6Q5l7RGduNWlIx7hqskYJFfw/+b9kkXBrBrBud/376BQruvpoCJSGkEqrdkkb6YtLNz+r1XjJtMOKdnRZHD6aEuy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212579; c=relaxed/simple;
	bh=O0OAWJCQNXVXKSp84DIH3JUFaTArMsOSeG9pjyMt2qA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=auIi1eRFXCkeWk+66Ine9muMSu743evEUtxjR3oF5hKrXT6Iena6MyE1u0JN7ujGhveG8V0v2B/9pfZNIc18QslqXESQ3PQOIt6m6K1LRuB1Fe8zye0XB9Emittitak35YSSQhUUSbaLUHm8FR6YAqzf3QAFoQgI22P2+CnZtdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wkVH9qPx; arc=fail smtp.client-ip=52.101.85.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ3AgJvhcdqS5OrG9ntBwqG37U72+ZCUHifaNBMIa/hHKXzVU4wTVkW3SCr7mPu8DNBJ+XR8KedBa1d8UY9DBdfbEqHNOa3dIC16hob9sW4WJgPIpITtwojIJI8shLVZwUYN6TUPgFfJk2gwO+88aIEt03V0TgDmaB9KWjU/KPwAiZLb1F/o1v2LGyiiPRVtrES6OgBpwvUh6+uWZ6fFSP1LUuGuRIKDDHUPDH/Dn7akABpsIMwDKf8MjsTnaslA4eE2pbUBLU6gSjOJqeEuHPOomqsgtoSgJY4n1ar1SM5mxfBdC+Xv+vqyKcoLTuuDN5I18A7bW8K824Kc60SJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn0B+oZ2rEtyD2zK3jIKgEC7XLj+IeuTr/lWtiOJkD8=;
 b=wT6do+aRjDHKbEIV6WgG3qHxKpQReZMheMONQPc40B+cEMxC47oAtjrwTA7cN0NIxjnALn/zo5SjysW7/xdLLtsi8Goog1A6cCxb0A0wqlBmiLiLM9iH28dbkJPOC+iXW5KH0hYwZ5ajNX0hmO6VnSaX/owir/qd6/3gkER8HZ2G5kdu7hD3kjqF7ChJfnjciTOIEHb3vf//66L38eZdu0Has2mjUP4sJnrtN7WGGabWaZdJOwo5gahVEXtLF6/oDz/hlXWXweQf0/riLsfKm+SE2+f5ujZ2fQgthV/CzFh9cKplrhU1XA3bOf44I9OuXmKFeAQNXEdduLudMVrAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn0B+oZ2rEtyD2zK3jIKgEC7XLj+IeuTr/lWtiOJkD8=;
 b=wkVH9qPxWrjRhr8oUtpcdTy8wPehTXwRwg+fjf7xYi1f1jatyK5A5WvfwJxgZZk6xZ+y3La1jn7gG8qKfr3kaHdx32znFvc+pwQgLWLDTFigHJEOh2KFZRfEsl14jwAVQANWq0iUyES3+OEzuqyLQK15GPMh7WI0YM/gxZqVqXk=
Received: from CH5PR05CA0008.namprd05.prod.outlook.com (2603:10b6:610:1f0::17)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 07:02:51 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::c8) by CH5PR05CA0008.outlook.office365.com
 (2603:10b6:610:1f0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend
 Transport; Wed, 11 Mar 2026 07:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 07:02:49 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 02:02:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 02:02:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 02:02:20 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B72GAN4065210;
	Wed, 11 Mar 2026 02:02:17 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <msp@baylibre.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<d-gole@ti.com>, <k-willis@ti.com>, <a-kaur@ti.com>
Subject: [PATCH] rtc: ti-k3: Add support to resume from IO DDR low power mode
Date: Wed, 11 Mar 2026 12:32:14 +0530
Message-ID: <20260311070214.3589965-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SA1PR10MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d00f66-d6f0-4e53-1c43-08de7f3c353b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bKw34Uv2wHOLMik9EK+Ndix+gTg0r2/+BroNEfiTzqzsH04A9BEN3q+DmLronU9WXYAzpeX//eISwpZY6Q59zXUPLjr+XFWQe1OayxFCJMbkJGxik/5L+BaHn2CIJpqENQrgPF5rJ99OsP8E6v9bB/ozck2j8qZRZrnnRrLYG1o545O3EYL0/2tu//Z1MrJ1KanvZMbz8svV9QqpI2wl4WP/MRFDhEmVo3m8v9NBl9uZiBus4UczKEAkoYkAxemsaJfMYEW6XwgyQSP3ZtgohdqBOajaBMNRDMkcFaFqgxKkqb1J8nZ5Dql0pywXMttYJ2aJqSd4zrioy9kl8pf0qaOhvq547AZkQm9rq8oCanAONptWXQ8h/jwpACW62IWP9WG6E957pR6+9TQ2HWgzEtpx4UHIJc/1Ue4LzFgZMPXmS1aVgxWvuaoxIlZB4+HWrtiiYCk80cv7S+WMib9YqpAkwbus/cPKCTmdj+CK54O/1L5VOS02M3mkD7vVwfT5Rj9cBz9dsdKnzpYwKCAbXGqa6eyloHwtUD05daTg/DfQbJkka5c9u2UbHF0ZialMP8oQ+SsM2giUAstMeS+drrJiKWNNDclsSN2fFdN/iNgXGd66fSPYxGsucoInGsuCrrAOuXqSXqXLFIaWX1mEMXXvt/hZfVZTeBfKNJFcDAD7jHXHj8mr+OKeIfRZ7dnsOWEVyZHYAVd3JD1vtBoJTY2cYrgQSzJ73EClM3qc0LeS3/C0WnFD6PGe+Kw5k/yAJrSmXeSRtNn5Q0krytUn/g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y/VKC5pE13AqBYh7/521d4H8LzWzZ898aVOVbEcIBL63MeO9paNw58FagHckp0leXwbKb9k6XXciowAhHtR3jUcXr5p8lkfC1Dl9iE4XfCauwA1ZF8WIzCBCmHcEtNjk0rLL0ev0Y6QuRUzgLwLEyDLrKuTr8Q2d0mNBp+Kc7XdO34Cv5Qc2KcOD+o2am7ekyaWg4SsQlR0DhHdQHFvN0gmJZpc4L3GZ3s037EeJuPShTHd0OcE1HA3qp9yCvy/96iW7WhTSYDhhkafL80+9/kgJcbVzgcgP3ppWwtPtgWgtURsmCXGG0iKLp1UmPxMX+zV2hmESDjpkYTz6O1b8BoK6XNy8vJgp0VHiZb5nTG0oKQxpMH1laaQW/h1gyRyRAdq0tTxxnuDXcBr73gy6cKcf3i6tK164DFFUtKEpED2iwrlh/TKI3JWwCpK3Ztcb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 07:02:49.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d00f66-d6f0-4e53-1c43-08de7f3c353b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Rspamd-Queue-Id: B42F625D28F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6168-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-kaur@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

During IO DDR low power mode, the RTC IP is reset and loses its
register configuration. The DDR memory still preserves all driver states
(reference counts, software context). System clocks are saved and restored
by Device Manager (DM) firmware during the resume sequence.
Add support to reconfigure the RTC IP registers in resume handler only if
resume hook is called during IO DDR low power mode resume.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---

Tested deep sleep with rtcwake after IO DDR resume on AM62P-SK.

---
 drivers/rtc/rtc-ti-k3.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
index ec759d8f7023..e801f5b9d757 100644
--- a/drivers/rtc/rtc-ti-k3.c
+++ b/drivers/rtc/rtc-ti-k3.c
@@ -640,10 +640,18 @@ static int __maybe_unused ti_k3_rtc_suspend(struct device *dev)
 static int __maybe_unused ti_k3_rtc_resume(struct device *dev)
 {
 	struct ti_k3_rtc *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (k3rtc_check_unlocked(priv)) {
+		/* RTC locked implies low power mode exit where RTC loses context */
+		ret = k3rtc_configure(dev);
+		if (ret)
+			return ret;
+	}
 
 	if (device_may_wakeup(dev))
 		disable_irq_wake(priv->irq);
-	return 0;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(ti_k3_rtc_pm_ops, ti_k3_rtc_suspend, ti_k3_rtc_resume);
-- 
2.34.1


