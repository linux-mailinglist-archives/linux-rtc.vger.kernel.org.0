Return-Path: <linux-rtc+bounces-6124-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHB2BVLbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6124-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:50 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A21217A00
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A74630C7EDA
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182123E3DBA;
	Thu,  5 Mar 2026 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MIxS+/4S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755033CC9FF;
	Thu,  5 Mar 2026 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739354; cv=fail; b=c3WgFaRKDQ9pKyDjtj2MOtOVORXkfE3ii5s862qClY/N5H7Txb2sA7A8S7yVT0RS1wu2zBYWCWEXrq51ndCgof8gYuO3gmDSUxwXM4OtbjgnZU1AdDYWtBYjupXXskE2eFMRAW2HlcZkCNVUYVQcUc8jOYwSXm1/Ux58X+X/yq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739354; c=relaxed/simple;
	bh=yBY+i3mID+D/lmIiTiEk6CwBtstAixSvU6pFHSRjpnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5EHoNDbb3glAfIQvmUn2RMPS4Q1OsstuTPWEdENIxsaDHokufpr3DssEAqI4Xvg/rsUrpmv3iB53UB5OqIsF/qlXnJZ7udI8N2ExVo4UpC54aE5yJ6DX2PGbsFHI70P1eydJGHGKwOeRKZgN6wR68ZezPENT9MT/zkKcuAPTk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MIxS+/4S; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFFJ9tGwOsAaW+R8MWESj9RfTLsom4zXuRaUu1A+xHGTXG2gFf/kiyPV6w7kPfyo1Dkv3e6KatwMqL3xVGEz5hnzhgKpyxeUnElpduLCIvPZ/sOkgqtTnKdFBWO9wqc6YeKVjHq0aYWE0ihGQL41fBxsy6bIIwN76/1eaAi1GoHLbjsLIQPTIttkYTFK1DQUIrn9FJctkJARupp/+VZpJUvFL9tSSzISEB1Goyxfa3hB3Qh7MKRL7MvYs498SjNGb/QO8r/7OWZr5aVXJPiHIiYWQx96ODkbYTAVkjgLXdl/d3t/Bpo1KxntUM7cbOzqb3wnQG3wDJdhaSUEPRumpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6prMlOOcAuhViCfc5PB7H9XlivXhRHYXUYRWq1CHrM=;
 b=oJ5ywgCy8CoZyb4hrlRP1RD7b/BcvXBLcFHtq7F9hpUK73lJ8Uk4ta2SqX9n9Pam9gFBtRCglSkqago5eDdP2oXZhOaKvBmVcunzQSDRm3yV4Wc5Or/+anBzN4cGCQWZnCmFAR7NM5jT3LyNdGnuvUeZQj/HwXpWJNsp8gmy5DkS9+87W/+4aydrsnod+cVQ84Z1uKk+78I/itbFPH/nIQWwMMbj/BlIlBAt8a3SKwVEB0jRZJ+tBk++7ko7XYxTZ3wNaBgX3fWX60P04c0TiVSu9oMsWQqES0hh06GLEOpvQHJRqjiDY1sj4SMvNXmvQmNlJ9+zbRAxjr2fM/dERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6prMlOOcAuhViCfc5PB7H9XlivXhRHYXUYRWq1CHrM=;
 b=MIxS+/4S7ePiiaUdP0E7X3Uy6Y39T/G2Px260deTfnwCYZsErUTmTXQmBDptn2g4DkxXGX1k58pXhaZHE1J+w3y+XZZbNPNPVO+tX0eQ/TRqeH7sEyywzeFbDST3/ojT8zOblH+iMxh+XFRQDfpRZ0Cx6QBum8OBGOn3HvGqhvA=
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by CH0PR10MB4891.namprd10.prod.outlook.com (2603:10b6:610:c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:35:50 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::4a) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:48 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldi2431963;
	Thu, 5 Mar 2026 13:35:48 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 5/6] rtc: rv8803: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:44 -0600
Message-ID: <20260305193545.796294-6-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CH0PR10MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cbfe5e-9714-4073-3cc5-08de7aee683b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	TsIkIvorXdpBBhNN8qxSn37S3yUUM5Jiar283ot5iUtZfSW1nP7CVZn4ZGJvQoYB6uhNa2nUcXjwrtM17GjT+Rek1sgtFqpV3MQu8IdngNdhR4o50P8Djt3rOIB+ZfBt+4Fgm+LdkS92XjtJw9sPbsoCTh0gvxlLYXN8yPIYvf8dI+Gd7ARLvIM5uIul3U2o2AIj/noyQ6bkJDJs8TB3KktKRs5rqFdZML3c9t6o3J+SkA/NAG5BXsVulhZ9o/A8AyECu0xQDsU2HDCID8KUO8FZ0oBKfoqMieVcID/FdiyEklmKfagiShYO9dz5fL8LOCdekXSPnP49IlZeN1WGRdNE4tOhH6SPdKMb59cmcqJnL4bqI8Hj/Zq8Y2O38FFyzjM5poD1+m0ku78eMdTAoQKZiip85EwNOqR2BHbDQZ5GHS1wp/keS5PCCrikhCnepQkbf/x5X1y7pxZlt4KxE/C2+hIjNLEgS/k5KjZW527UzzzAxlZRk/mk8rrTj8Pi4asFI1+1yFN63/DKSXm6QyQD56raEy6gdI2jnqXs0eT36Avx5Phyij+ItJBZKAj+7pQslT2RGMshzAkyx2H44Pg1kISJDGudlbssbpotRsn2sWDPwZ/6BdZ/NVjOvDijDtOxY77nthiNgc0xWNNzLa5VXW1nUZTngNVVAY60yxycIE2FIkHpYDWE1uDZYWgFwOh2UBUTCbWSXXbeX8/BMVar7MfvFtwYZB2n7weHRk93yYb6eE168ZWif848rYbalnA4adzcODFdgLZLi534Yg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pBqQ+TBrcXLVXIOcJDJ3IxvoQDfCPjMnXIjqlgrVEgJam0KVsMlo85H4Hdj2QUmiC5YW2PN2oMmFCtoaG+5VLtwZljXSAwGTwLmYoXZ/fw0kGJkczz58KpOuKDv0fZOG0sy1Mlkrz94qjK17ioxieZbMHSJPwXa7B8MjhdZaKPJrrhrSydJ1Zv2lSLECDkaFdpSg8KLGxwaMdZQNU0cN1jh4zjvKC49a6/y6TfK1o2aQL2D0hyUqJsGpVaoDWubYdA7mXRYuwYq7p1ZPAEozIGQCi7NWsN4Dm6igN7fKIjJmkFz8cp+gwCRDSW54Gfy9kiXxRvkv94Qlo5hRELhFclBMntY0IxHV/WBHc3YhpGAvrNpirm0MNFBO+k36STvK11B53ar2D66VxIX7XptGpmjwK5bzLqE7QA1XP2vi3kNmxJjxBWg5ZSZXcSg+miVg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:50.1506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cbfe5e-9714-4073-3cc5-08de7aee683b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4891
X-Rspamd-Queue-Id: B2A21217A00
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
	TAGGED_FROM(0.00)[bounces-6124-lists,linux-rtc=lfdr.de];
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
 drivers/rtc/rtc-rv8803.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 4e9e04cbec89a..2bf988a89fd7b 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -667,13 +667,7 @@ static int rv8803_probe(struct i2c_client *client)
 
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
-	if (client->dev.of_node) {
-		rv8803->type = (uintptr_t)of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(rv8803_id, client);
-
-		rv8803->type = id->driver_data;
-	}
+	rv8803->type = (uintptr_t)i2c_get_match_data(client);
 	i2c_set_clientdata(client, rv8803);
 
 	flags = rv8803_read_reg(client, RV8803_FLAG);
-- 
2.39.2


