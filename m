Return-Path: <linux-rtc+bounces-6120-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHc1AB3bqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6120-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:35:57 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD462179C3
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88D9730428A8
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353C03033C0;
	Thu,  5 Mar 2026 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cmzYvP71"
X-Original-To: linux-rtc@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B42D9ECD;
	Thu,  5 Mar 2026 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739352; cv=fail; b=NhImBtSzvSMNXG0NS2xxleoahWjlEYj2rWu8fXG3e4YeTLFXBTS4qgj/8y8Y2dcWzVStzpkb8D95At/NO+35h97dj+40jRRDfvkRkTtb2X4xAyemQ4cLM3YBO8LL4JUbuiU0Dq6/PBZ9GD02dy+dovygIa9CpWiaoUsqAAo3ssk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739352; c=relaxed/simple;
	bh=IRCDz+BIbXIxo654FbuXhzus6ildmqDCNVHHoJFkhJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTMzbzxVXQXs/NJLo0JDQI0ihyNyw3kNqqAknvRCjpi2Cux7e3jHkSdj49GwtfhGL+nHN6+d6N01X7AzIPDxzY/KK0XnnteuZw/UeFKoV4g++nubYUaYpcufrHhcWc37ieeXsMRLCTjORWIw+iq6Ku3C1rPxqGqc4vtNc9LN5u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cmzYvP71; arc=fail smtp.client-ip=40.107.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHW2KLZs3nKXouUh6UvUhiYg7CKtX8Gv+bd+pVrMqvBdze06rpY+2uq19d7Svti4vGMsW7XDEe80Rw7DKz8HzUGdBw4q8t/Y/q1zpb0xTCS4jmWCEEKeD6gfIBzC2HgTZXw1pgYivEoHqYB0AV12XsTGrD1w9cpxAnWxmFLAFKzG09N/v2D7JdbExJ/pT2Abdty9PKuS60I+3peuTnkNpdN7Fl1km1I6Alhk9xj1Wo38PuPaMM7rGkqgoIvdgPsZMPgw8CsblyWHFedWqLDCQ/VaaD+IMhDeCnrCB4sdqvqzJmUJQ5hdFwMrFSkmqYrtZgQKLHpdzu0njcnzOiyh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMIsRWBCAcp71+nhzQnKz6CzKi/vadinRct4ioI2LqE=;
 b=MtYwSA53UpWL+qAsYPR+yMt68n05i8B5/dRhSLTYS42+h1LQNAJ/8MPLLOku2lVZO+LvQAsZ5G9YgobjpLB3OjdB6wGf/123qX94EdFdJ/UcvG8LTnvL8/5J0PCa9OoChMvvFcebqOKX5ezDJesK9bVzdgYxZLXKpUpsmWm4Gsq4/fBoB4F5rigV+yTCLRc2H4FkBlX5aPKaSTz6zq358jhothrdJytSlz9ZD2Wil33+OFEbVT6mPv2sKu8ITFJ1h0XmTPfB3Nw5uIgj7L1Wr4CGlCwkhD0lupp2ecUd32kxBMHdfi4O4Aa6pkVBHZrZnzReLFXT8Zd9oEjJcFR6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMIsRWBCAcp71+nhzQnKz6CzKi/vadinRct4ioI2LqE=;
 b=cmzYvP71Xecft+VHtc1apbrHjfEtaqCWYq4mAFWzh4/zYqJaM49RVvdy1gXlEddL54BssOm3vUVtGUi8sz322t4iYjNEqeyuGDlg3AAe3iK0g+STYfriCH7rONh6k9msUckDRyMj4jLBzhTcdh/OGde84ucZd4vsN0UkB53axvw=
Received: from BN9PR03CA0765.namprd03.prod.outlook.com (2603:10b6:408:13a::20)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:35:48 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::ee) by BN9PR03CA0765.outlook.office365.com
 (2603:10b6:408:13a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:47 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZlde2431963;
	Thu, 5 Mar 2026 13:35:47 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 1/6] rtc: abx80x: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:40 -0600
Message-ID: <20260305193545.796294-2-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7db392-910e-4ff1-6b88-08de7aee673e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info:
	5OBPHg/F0tpLIgzF0bOcjHRLy+/djakQyNkQiIxcCK8iZb5UFEuXGwFbEgGESsjvJfRjeLGYnqBwGd+vg6Qwb0jC9jAQBO99rCa/3npww56wYFQxQJI16vzO3jQtb2aA1zAVYPGW2M3O9klmtFs4jMPCigUummGY9EZH/F3FPB4oUe66t4Q+mHBOYUBf/saGd50+zL2XIvYjVA6rfJrTuqOMtRgTcjCFB6GmdMAX2xXPAnZGX9nVFAiZVdlTi5x4RMNmfgypjnqZOph8/dc1v58ARLXZ89t9Op7HNbfSnS4yBfE6qEwbDMSK7COGmOYc0nu4xROPhGmV1rrdppwNlw0P3VoTN6UGmwrhzzGPe9ZdOL0UdBGy9FZDIdglD/yGf1SRCm/g7Z+mOuPxjtNBSUYMe8mIOkgzs61spDqxz7vSlJkIezpfJeqW6aVCU9S68LyU4Ma3ngSzR8WXIHhcDuMYTOXD4ePvhSxogaLZAOagY+AejfxIKORhf3sgb6kxJ1jpd1qfPi+xjCypJ14O70sDj4E+awhDXW9olezZ+0Jv4Ct/RfggQmnug8zcjTX71O6IzVBF5MNelkyc82o0nOQbWa80oTGHFR08yxYdefSn0fOirzFmY/+uSzU8WFj465ZWy4vEN/WVBnFoPckNfXflyjI2cAJxRWu3aAyaZ5C3UpyiRziN0DK9Q0QhwGGkGqYFWxqQ7TC3hajQgG/TQ+yc1k1lo+xVbP7GwhnJXYrdtTYmbFYec7BPVZbOMyXXjwbQ0ZNhEQG9zgXfmKNhOQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wb7ol58DAgJWvq2dcjf2j1FH+2R2EkFyKzm9FNk3M6ZcWuPBbcX9kLjJy3OqPFLNNLD1/0AHElco9f2u5zhyytUJSlrtJ3zLPxwEwyNIvJ+ZU+sWUrHaVTu/J9+nL7wqG9sQCpqd7MrigHRunwiePxoMNCTuARPrhLPlNgTEZNqNIjaY+dy/aoaY/1Oe68FPcVnIQcvK4b8XjSW78W4eszuMMrT/0ZgtSgqq5Of3pLPgboIjIFJEJ04oZ/W5G5I5Nka8+Fr/6P2wN/nI52o68VoxsBtgolOcCmThyK7THvd2a9zoA25HTD8hPuobsBeJI9kuOwKVODyzcv32Z6Yu0wA3a14ijFhM2Zla1ygsqL3+BJUIV9hU26LHRGAOrZpiRgW2FquUwFat8QGrn7NYK9InNdFndNegFSJ8qRbo/cS3OsvI8bkJOTZJK5qhAB9g
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:48.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7db392-910e-4ff1-6b88-08de7aee673e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Rspamd-Queue-Id: 6AD462179C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6120-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
 drivers/rtc/rtc-abx80x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 3fee27914ba80..eca09872ea971 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -772,8 +772,7 @@ static int abx80x_probe(struct i2c_client *client)
 	struct abx80x_priv *priv;
 	int i, data, err, trickle_cfg = -EINVAL;
 	char buf[7];
-	const struct i2c_device_id *id = i2c_match_id(abx80x_id, client);
-	unsigned int part = id->driver_data;
+	unsigned int part = (uintptr_t)i2c_get_match_data(client);
 	unsigned int partnumber;
 	unsigned int majrev, minrev;
 	unsigned int lot;
-- 
2.39.2


