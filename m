Return-Path: <linux-rtc+bounces-6125-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFs7EofbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6125-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:37:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7A217A17
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 174D33127A13
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AF83EB7E6;
	Thu,  5 Mar 2026 19:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uaO/dDPH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391732C15A2;
	Thu,  5 Mar 2026 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739356; cv=fail; b=dnEBeP9m5AQVxTigTBlNZIqMG/jxl7NJ6qaaoQ5ic69yJQSKVdS4AabXW4b5A2Y9WpTxBrnlrTuGPy+BLH4KqUQxeS9zNSJRDSsBezyAT0IPjf9u/n26AAMcB1z3B9vy59y5nrT4cn+jWl0z7GiBLCg1hMFfzRMMd5iFqp9ROzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739356; c=relaxed/simple;
	bh=r7A+wy8elrSwPf5kKH9H9sjGmBLGVLlalb33W3hMB+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCjxKJs/TnZ/WByj2QrVLo20ZXAScP8+ezW3B9SUdA7rK7puRHz8ZdSABsIzKq70gyrc5k5sxIUS9OrKb/GEY1BC5Vv/chs5BJVQksP/7Jz0RaA12cfMcFXlPQVP/+TPpQgzu4J4jZOgSsCmgt/svsnWPguRRajVLjqVdBPqoBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uaO/dDPH; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS8PnVSUn2Uh2j35ZKiDEddR606gBdVOZ6XKTsNh2e4VMATCshSSlB2LlicqUORuD+7Igcx6VPq4wnzHyv5Tos6e5s6aFqeS+ig5KrsRJ5gsB6aQY5sTV01QqX4FDA8YagtKHjYFXMP79mZr0Vjuen8fAON9Z3haf5bVIXMJyceMak+b71XSsdBTK9gU8RakpQqse1F39FJM07ho2HIVeiprkm0TlpnfevN0aZ3w6+AVFfN9KUtk9UyK34ReYcILEnj1p5Mud61bcWZ7YbAvableee0NUb+Sq5FHT/MBXurApiJAzEE5N1thVJC+EVrM2GZP7pIWwZI+jdKHYdON3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CLtogKd840tLQph3zYS/G4glg3N8Ova/p+0NWoGs+k=;
 b=aHgRHCBUpsed+EA9qD1Z6BzhP83e8IQYh0hw8DljjKk6OGda6qNdd6TGxCWBVth0+RLndU4QzEcJyuT7dBfHvkl7PfcVGhgX3u89txBTEIJCGdruMAwyzQMx8gkbfKcL9KpsoRGZyjVc71u12+R02VMHE8VNOks3GqMpUNWPnE//G4rDDdX4nZho+4ziEo3CKvDKj8MyCJSl3zLJIw5lMM5gMCIsAG545X1yXYwKFCkrooqL8NKBGFuPMrf8KafafMqri3XIXh0hx9xb4gNOUmoepCepVBWu5LpCqmOSEnKG7BLFaIzSF+p6EzQFM4/R3JcxMh6WhGdq7IyIjOs9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CLtogKd840tLQph3zYS/G4glg3N8Ova/p+0NWoGs+k=;
 b=uaO/dDPHZhy6tsQDsHiptsBXMCWmsypaJPiGDYKv+Sf2ZwvAvuToRuUladLNkasiDB5M3svEuGj0VGNPJbg6/bJB3i+WDXoKerFeFar7FSz5h0H/1Aij5K+nHns9ERy3zINADLiukYJUOZlwQBP1j5ckYPp3kodyLMlSGoQkIew=
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by SJ2PR10MB7112.namprd10.prod.outlook.com (2603:10b6:a03:4c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:35:52 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::be) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:50 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:48 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldg2431963;
	Thu, 5 Mar 2026 13:35:48 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 3/6] rtc: pcf2127: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:42 -0600
Message-ID: <20260305193545.796294-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305193545.796294-1-afd@ti.com>
References: <20260305193545.796294-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SJ2PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e2fb12-9924-422a-6769-08de7aee687f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info:
	3PnP6O82ySwmcR1jX3lBNsD/7cD2QstWaZoILSReptnH6Iawr4yOXXiuOHSn4WrcEx0qKiSrRGnOh2eOLfSgMQXVhlbgNNG+SxGPR4dU6c79dS+JmZt9j2gybq8jBgDE0t/hbAmuaMcjr6ZyZ25th45dUc4XXv3WyGwfpbEE+I+dUlwS/S+Z4RK1+1xI3fy1CkJ5mEKG19fWHmZ25JhSq0bAeivn/i6u0iapFSTiXDX1Qo/duzCHnbdQCOxDmZspL3M8SyAtwhD6GxHHYWvlvbvaYRD6pQ6NcEQB6pzigEJ8QiRHmgviv6YmhzGqJ7heExvbcHo2iLBAAP3hwFQ28Z8ZIf+yis8QKxGdTdbXYQpwyro1DVrqHRv+2+4mKfhX5XIkTSENbRjS61t+pcwT3rQdVmH1gGuZtN/khZbgS3kIAO+uyCtw1Rm5WC4BeESm7XAIYV2h4WZb32ijRA1i9uXhZQVCF0ptd3MLDzezef7oeG34XJRgMZmY6F7D3ASmnfbodj/qTLVOaudVwKSzymGiNkvN0xswL+uyMkmypMOLXs3dXH2p62TbUDG+7+csLrA+prdF2NBMwMb7ke8g/Ub9hbQLEZY/OjlOAW+3otw8bAkjXfzDu7Kt9lCPVW0hot7zVzrezWs5T2rkKqO6OO8Oy/T2UI3rxttXOyfNps0W/f1rv1TJHC4oDxm4sdH3KsErviMVpVZOKju/1bcEKzu1+G3cWHgYuItGmJIlJiYTic+HIw3pGR96uVlnbbROCo6fJNRfq0dz5vpTLC/t9g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c6lfMOLOILy/56h3pQCaFYfjdpugb9DGuuXULQ3QjOONW1rhENehljctB3+BxmJ2SHiguCMlG2w/AOc8LOtmNwT73pW76ZfynJRB2IytRkLf+kiT39ETpm+joRFUa4XyGDqrO1FhdGStKEGvpyRACX1f6eL92I0pJrRR81UEFTQtpYDVFXHuOEObuCEB/5wADp2fuvyG6upO825pvMt135w/VxOAEfFJVPVmncwWBcTPjVc5rMBxdmf2vsBwTSHj8q65O4W2dmcPR135PTAbqpHmCmOvT2FHbziLrK7Slbil5FThi6x5i5U/fDPm1lmMB94m7rxLegvrLTbmtrWijBKbzSoHQSUUDRMOun8ypzULZpn63bj5YLo4PvAnOQDzUQQRT0AJ+oYgy1xzMY2QCjjwhWFqDpHcfKR45QyynZFywscfhGnX5gAgvoToOpm7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:50.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e2fb12-9924-422a-6769-08de7aee687f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7112
X-Rspamd-Queue-Id: BAA7A217A17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6125-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index bb4fe81d3d62c..e4785c5a55d03 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1449,10 +1449,10 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
 static struct i2c_driver pcf2127_i2c_driver;
 
 static const struct i2c_device_id pcf2127_i2c_id[] = {
-	{ "pcf2127", PCF2127 },
-	{ "pcf2129", PCF2129 },
-	{ "pca2129", PCF2129 },
-	{ "pcf2131", PCF2131 },
+	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
+	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
@@ -1469,18 +1469,9 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	if (client->dev.of_node) {
-		variant = of_device_get_match_data(&client->dev);
-		if (!variant)
-			return -ENODEV;
-	} else {
-		enum pcf21xx_type type =
-			i2c_match_id(pcf2127_i2c_id, client)->driver_data;
-
-		if (type >= PCF21XX_LAST_ID)
-			return -ENODEV;
-		variant = &pcf21xx_cfg[type];
-	}
+	variant = i2c_get_match_data(client);
+	if (!variant)
+		return -ENODEV;
 
 	config.max_register = variant->max_register,
 
-- 
2.39.2


