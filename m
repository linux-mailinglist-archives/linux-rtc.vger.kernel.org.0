Return-Path: <linux-rtc+bounces-6126-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KmdMLLbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6126-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:38:26 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C9217A2E
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5AC314F99D
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0430D3EB815;
	Thu,  5 Mar 2026 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DHJco7+W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5293DEAE6;
	Thu,  5 Mar 2026 19:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739357; cv=fail; b=YCCi6a/FxWHs7YR7LjM7SvNN6iFZkXLoZWQP/ej55Y8VFpHoxb1hnyeIhxYivBwIGLq73rRnYYtzHrPGkKRCoZN3OqFVX5pbjyHlcXSLS9ImM+TCRNZt85k+3Iw2uaroohJ5Nz3kUXqQDV1FcAorcK8zJvExwds5fnTU7l5Kuac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739357; c=relaxed/simple;
	bh=/11uzt/FFWjr1NwvesafyM/XIaIc8ik0XtDtRwXLmYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7TnIJJm9SNYGeuwq40cl+gJE73sstq/ffin2TfadQkZHNxq8uyS4Z0YUrbjjR4ua6PLXh0YZVhGEqgGcFcCBQ/KS92zJNj2tpzN78SNdwsNBTB/2IkGaMrFZLJs1d2xiTjyAHo7i7k/VfkbQu7c1G0Nv1ZPIi7Zx8NoeMuYg8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DHJco7+W; arc=fail smtp.client-ip=52.101.56.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSzcRTN54yq98zOQmeg0U1xUOTaKS/ak1pVv6nENtPZJIM28zi/WdLLwZ/ybXutsjGjxyJ6g/oqA3vBATGnMrYh4L0q47HlQuTRymm2QsdK67QM1LDBSiEkT1oMyjABRW+yb60mQ6/QqYFHQb/688uEEgwrBpQMQhMn1LqQHL8jBGiAOllE8cauAgfkIDhxmCTnhrxz+eMy/1ZUrjk6Tgj1iHGgyK+9JCgrsw61u/82J7Dw954OIY6SpI/kzh8bKgQZOMIdt/P5IhBR2SmhfJkaNZ2ZWh6UeLuv7t+kklxd5iEd87UCLCrKWu0N+vgaA/X1fS489k/7jaVAZBk9h2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug8T8qzlCOSzQhJU+YW1s2gONgukBDelIGY9WMG4Vm8=;
 b=Rb6q9GN14UYTx4Qwq06R/+EYQ4OrvplkpzkAG3j6gJT66s6IOw5F/O7RKnnOGf/ljGhZbd22wYEuLl1+x3pCEWGu44+Cr8piv6e8tVB8Et+6lmFb68Isx2hWMpmHXOY8dICJSTX2Il1MV5f9xIJjAnQk2PMz9gJ2ZNkLAj3IDugbiBxSrtQ+c0Z5SewhOvP6IyamyC/C/CJXZdsk1ydHPS6OKHAo2IMHJ6VGZxtB10ZX0Qbgb4TPUgqOHrl2d+fv/OfmCPjzfXvpNYZG5xd++2iEWUyTrp3qGATM4NaEnMMP5ZKMRt7juxHWv5xdJjbK5goRUysvD7gDpuvsK5vntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug8T8qzlCOSzQhJU+YW1s2gONgukBDelIGY9WMG4Vm8=;
 b=DHJco7+W3rFGc3CmVob2/PVuh2aS4YbO9nkeUva/HgCwI0mAvwF+QD4o5HmmXLGaiR42SQbiAl2u0Pb+gXG9ul11uiKQMSRPphd/2WddwiKg2VMmQc/MDHQkjJ4UOVf5Rw7ryQ7f/n3EJxyaspMbvl50HVkd67NiQkS8KkpNl50=
Received: from BY3PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:217::35)
 by SJ5PPF7F0BE85A1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:35:50 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::56) by BY3PR04CA0030.outlook.office365.com
 (2603:10b6:a03:217::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:48 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldh2431963;
	Thu, 5 Mar 2026 13:35:48 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 4/6] rtc: rs5c372: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:43 -0600
Message-ID: <20260305193545.796294-5-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SJ5PPF7F0BE85A1:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb68b1c-bce6-47a7-4293-08de7aee682a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info:
	5BNKS1koXcwE2UjGrVrmA9/X/K7JEsfUeKSKEpk6JM/gR37bjzllEvW2jwCDd8BzJpWh1J3snG7CgTMIcseu2JwJudFVlllM3gtS6VuoAQUll4ODiNOZE7ynzv+XWtmiKuo4z5L4Ey6j+HwjMtYUN+T0HwEzloO6nKa0+3IlpjpK5PasPtzN5KNa+rgxE+Ng+zclxL8+J1JPZ+wzPQWo9Da+p+szT64s1EuSmdFNHb8eUM8gxaS6G0j9YAkRTEn51tnZveDR+5/dKUdRYoFf8qXfN4WPI2olLiEwX3jnz7KvIAjYNrRdrlOzeOB4nlMNdu5DoxLbIme2wHUG1mH9FLSt9ydaAvGIQnpUlePX2xP8F+DQiZxC4LyNWxZPV1aiJtwb0A3wZ0yyQO2oSAwCmLzqRyXx1z5ITtV0HU9tsjSng1xBlGI1gA/s9IFB0Kz12+mHowQN6hknVet6yaUy1hPl8iJ6ohx3MJV+hkHMi1oH/LCz+NUK2YXXfMQo+xASBZyvWOuOaNlKfy3i+1Ru+UGad5aoDzpjem9Sna7aVYARnz+gLwFD8XOGLlRK3tyjwOr3k2aZhAgElfPDsOA4jt1O1qyhhPGhd1Ix7E5cya5kl75ZaxKs4J5065ZhfyGmXeHmFPUAoV3CV2c/aQ3t6csYBSsVqGCVIJQaipDIZAaIfGLwGNSB3RLPZC4uhtGdlIGf7XB2qtu443lXFuZDzy6hLrTV0lhkM5cl21Vrtl/qoqx5bjGxQ7XBcpUQ8BbUIQBDFKmgy9/Cvn5YurUtTQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HHVH/d9LspgY7c6TO9SpMa88s1ztbjGpq5HOEPSxSnJWkKX/HZh1OC/WkxHqIjpV4V904i+bTtWRw0vTtQBprQNgtHNSxvwUsETfXEs4/VN1pRBxx4CjKSgTQiH4u8I0nwKTUktJxppC+EOIchjO9ek8m0FCTNy7hmSebB3veI+waAXLedIfW0pU1IdOudpit7sWCxjEZ6v8ow4XAqU+vSIKAfhsl1INnc0qT4hInTQ9YfDYYkT4ro4Ls/bEYlli7k07bHUdYgClhaVp4QixdX8UCHlKRC1z6arZy1YpdfafRxg8Fjvuq8nv8UyTo/ce5mlpwgywZ1p+BvmbbY7LbSuRmB7XhPHrySbwrkQjnfXCPNkTJ92KYk0u9VpThlrxrQrV2GKudNmbqrf5FqTD1zMCHwbn+kz34DrYQv/TkI+pVWCsA4MJrL+1P6rv34Lq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:50.0336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb68b1c-bce6-47a7-4293-08de7aee682a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7F0BE85A1
X-Rspamd-Queue-Id: 266C9217A2E
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
	TAGGED_FROM(0.00)[bounces-6126-lists,linux-rtc=lfdr.de];
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
 drivers/rtc/rtc-rs5c372.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index f8fab0205f8cc..936f4f05c8c7a 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -825,12 +825,7 @@ static int rs5c372_probe(struct i2c_client *client)
 
 	rs5c372->client = client;
 	i2c_set_clientdata(client, rs5c372);
-	if (client->dev.of_node) {
-		rs5c372->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rs5c372_id, client);
-		rs5c372->type = id->driver_data;
-	}
+	rs5c372->type = (uintptr_t)i2c_get_match_data(client);
 
 	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
 	rs5c372->regs = &rs5c372->buf[1];
-- 
2.39.2


