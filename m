Return-Path: <linux-rtc+bounces-6199-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBJhOWXzs2nYdgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6199-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 12:22:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BF2822B8
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 12:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B4D232142B2
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 11:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC8537DEB7;
	Fri, 13 Mar 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o5If4swn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F1625;
	Fri, 13 Mar 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400683; cv=fail; b=kiLeb6dgwuT90KS/KUfR66yzY0FVAxVA3+zfSzz2laRSgEVtKJxcCytp5uKEXEa+d92+dlj2esgbuooc56CWhetWsti4OV0n14AduQJ5MDht1F8BDyEAs3nR8bu56COKewV7yzE8sDqTXZPFlFLtnMtztBtWeOiOjezpbUHfOo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400683; c=relaxed/simple;
	bh=4MJj2g/26cpS+suUcr9Xos+ado7lSoJIYj8/GpIhTFQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qc3J1C6W6sjpSPAQu0VvjLToRbnYu/Jnm+S7r6KNIxOefbO480T0ITFdOm6zfi0j483pL+h/9No4mjpysQ175Elgau6M2RBSZZCfLQNVXDJ9G7X4EEhZcOpkN1oeLBPymL8VSg84w2T2eqZe95p7HGpX6bGCPFq+3ScFL8i2Ev0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o5If4swn; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9M9Wyp/PL+k2QLsazMtYhZA9C7kXxADU2B/UkFIeyGCWk0pv5W/zfDxdOzBtW5pWNBFtcDTnMMoxY2JCO8jmqZDM+iKCNNr1c6Kg2xsi0m/7yIFm4qdIeHC/g2Jf7+QpujBSyutVHaXvhyPLq7ZClrmigZ5wbTMB5sUimLIKzdLIUNrewYux8AcqtJV8tRrw/OliodEpOCV82+0j2UR/rqnbFAQDwMWn5007WGeEhPuJshHck4bYsN77OZjxfDI/l4jivjbROc/382fOAIYabBIj6tEMAOVct7NNuvBfjMp2kOM7JFjxCqDkTykW45wgPn2lSmx5g+bQqTCdmY8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WpR0vudqtD9Gh+MDo/FZ6IyvcMUdRye96YyQ/hpJMI=;
 b=LSmpDdLYW5QaXc7C/auzgT7fiKtM82NExrQf7SvjX9RszsQQetm7o3Xx5Q1oMxhyseCpGutj6UlHMvg4WrN07baqESTM2PgOF1rCGsaiyx2J5P3KiZm2+QYjtKAYe2CqJ64LsxpRfnqKq6tQGl7Trp0lCZBp3CGjbvOHXWD6GnK/Uxp7MkaIG0vqdCMZcR2Vg2+ukk5SP+VyStFXwo/nPTX3V3JlrfjJbIGxKcxiLB7Xu9gHiCxgw69ES5NVKOmBDVG2xJlq7aoU9xEeTXIGxYwFdXdho1fdQPxLlMivfS/mkRq4Hyy4Zhqg42MJaOvgMCsNUlRg3zelI/6ikbgb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WpR0vudqtD9Gh+MDo/FZ6IyvcMUdRye96YyQ/hpJMI=;
 b=o5If4swnIqsNp7qn0gJmWaPv4AZ5aFYZi5fGXuC8jhKLof1nF4HEZ2bcxXZ36crilxzldjpjosIpJlnKWi6DELluU94Qlvb+xc/W3WMyjVRsSVLkiE7BFWi9liWzRqgIxrIkl2+pAf5/PspumFUQXSMiPOOibebDnXgXTt+/Byo=
Received: from PH8P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::9)
 by SN7PR10MB6524.namprd10.prod.outlook.com (2603:10b6:806:2a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 11:17:59 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::c0) by PH8P220CA0001.outlook.office365.com
 (2603:10b6:510:345::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.30 via Frontend Transport; Fri,
 13 Mar 2026 11:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 11:17:56 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:17:46 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 06:17:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 06:17:45 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DBHgxJ4130152;
	Fri, 13 Mar 2026 06:17:42 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <msp@baylibre.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH v2] rtc: ti-k3: Add support to resume from IO DDR low power mode
Date: Fri, 13 Mar 2026 16:47:40 +0530
Message-ID: <20260313111740.1492519-1-a-kaur@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SN7PR10MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 73607042-3880-49a3-de96-08de80f22db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	14FHhhnt+uVrGuqJh7LZD4ReDh4DsruTVeN8VH5xHQUAm23UWWT10boWMSfGpGr4K+lWgPR3kDEWgtD97AA/Jcob4Z/Y7AVCgzDig5aeAQ4sD9R+FWhwtcYDTzgOKu+JZ3QEshVIef5FepthAfi8Nlv1jiCrJDlit9bR8DnkYiphDV9/eU7R4qERCx4kmDQSf7sfj6s4HkKkb9BF9Em4b5dHXX83FQAUstMht/bo2vOlqp8p3n9zwGYtC5cxLuALaUl3Hoqs3xyFqbz7lOgrnBlEHFFvYmZTDHj6JQIDviM3f0U3y2q7b+eG5lshssJMC6OYUZ2WC8Cj85QWYQVTofK9uFjObhoyf/F1vXt4gm2e5/p5wUzmtnNXhy6P1dKeKuIDpGqW27L/yRYsj58u7CcYYTbkWTiJGYimjrmW6ZySAeoU09m3L0lMtvV5PNlWi4ijgYAHcZ6N1njR4jpEOHlIx1RwB5pPpOD0rTn2kf6wluF/UAdxERIx6/jm+bTB/XWUFLHwOCDJBmCza7QsVTxIPKdyIGOPJZlvonquQz/QOcAAgdql5vzj3nUW9Utatlcr0XBw4DjNOawCF/DJ/MDJyyWWdadaZNww/bX/wMCmj7nmf4v333kM8ha8bOBCSKO0TwwaZSxsBesNY6t78xKp48gmXT8huPXRcFqQz/gy7K5LQgJdmFs0xkMY+YSAsLJJf6XiF4blPPUIgTrH8ZpUXaoptR7/F01PdOW45dFVLHYYGUwaI8IY4Y0jc2+/+uv86wby/IDccjN+v4w40w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2oJRAfRyV4ycTgrGtJoxFWiKVoR0lBD8ytsCIaAwtt9SfW3c2G+bERyG3r52M8WTk9tH7+sZwqJX2f7u66wkRFHkWfoMqaHiShKHtJvKypitd2xETxmOZUsnpLYrNZWJSoagvQ/To5/dMz21gznmy3kiE1bG+J4JaxruUz8jlQAcLEaMtWMfszSTRmWW4rEQHai3dVzxsw5S1kQduOBhbNwtGyfxqevXjIfTfY8PWNXbIRzFTJlW3J9aEz1Q7rU9Kw4IEkIEHoJ4fqk5WLRSzVzC6xHMUIjStWQdbhCuTgeozuJJ3vRoNkD4f1j6MAykibJ5PiZLR4f3lv8dxKS9asuGWdNCMNrZCyjsHL0h805tpzjO0N8VKpiiHCb8ooNte6tW6cnlXCxc2NfJTR/1PyLG0DNFva7rirG36ggqhL37s47SUmxrpxESm6JbLLU1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:17:56.9737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73607042-3880-49a3-de96-08de80f22db6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6524
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TAGGED_FROM(0.00)[bounces-6199-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-kaur@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B1BF2822B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Restore the RTC HW context which may be lost when system enters
certain low power mode (IO+DDR mode).
Check if the RTC registers are locked which would indicate loss of
context (reset) and restore the context as needed.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---

Tested deep sleep with rtcwake after IO DDR resume on AM62P-SK.

Changes in v2:
  -Updated the commit message as suggested in review
  -Link to v1: https://lore.kernel.org/all/20260311070214.3589965-1-a-kaur@ti.com/

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


