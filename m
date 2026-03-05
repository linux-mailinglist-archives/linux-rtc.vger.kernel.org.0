Return-Path: <linux-rtc+bounces-6121-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCq/FinbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6121-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:09 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C843A2179D1
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85F53072644
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4063C6A59;
	Thu,  5 Mar 2026 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mhcm+iCZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D4200110;
	Thu,  5 Mar 2026 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739353; cv=fail; b=FG34JMsPlRtxr+1RMZUqPLbFUWdLiQ7L3C6/+OaJexC3d6SEOOG+0IkvzmPGn3r/HwEldTxkhnS29+9lxoLyddUGEhiI4oiQBA3zlDdszmigipnnSantl6IxnU/+e7pxowGXsoKg+y4YkVkDkTQHCaDxwW9jKV55RV5LiTtm+68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739353; c=relaxed/simple;
	bh=/aICm3XzYBjCfzdo5sT3jJKBlpUkoCXXo267zuhYiDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eY9NewO7ExtMA3GHVgLJtTK4lEQTL3/fR36I2I8W/NF0VuXoCxDntbNGPa6Ig4DND0ZXekFJmATBwUGSNV8vqS5vdmxzkVaS2nlHNZCZLD9G5BedC3ZxTfL3dJ1Vmgc5S6Kpn3pZ6J1VopkwK8YMVU5KxTXXCWo2OLtSbkSduJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mhcm+iCZ; arc=fail smtp.client-ip=52.101.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/5XxGZTZnDsXvfwWmM5ndys0US2Ki8Z/CPz4httAdq5A32Q7MMQAorGrEnjMW01NPdALs+Gdt2jhq460bDmyNuV6JPb4Zg3J8i7FpoXId3U9aH1mc98NnDtBwNilBzwxy1D5H50kCtnEyNw5Kax8B1sbVErQltC2/bUn3owZZ3ZsNO17H7fOW3TQmkE/bauvpuYxE/QjQvYiPt+mUjYT0NTFh/daM0329vTw1aYiMiHyIaghLYd9loqbOx9E8rcaxfTqBXE6NguCR32Jhn1Bz9q/AD1P0jNpu5jk8Lu1d5N6HnYweExLjU7lUNm07ny8v2cX22v1M7yX6vjXsNDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n8RfiF8I5dRieB20BqZfXKHiWHvHVsQdG9yliPrCDE=;
 b=wIoqja7tyw2cKrHay7bEAT+YFOND47vKQRRpH5FooGnfFLchjojKonrvcMkE56vNITHM5n7Pl5QKzc4dF0+BFGZSZsJxjGkSqwvZ84aWEfdorYYPUO4zgSltR/6OcdkePgaRP3wqTEcWMLn5HyNAFyKUkr2OcpMNAVkWORMqG0x5+p03cK7E0qogKIlKpCSqHV4ACIkjivG+9K4HnYvOrV0pSXC5tLCFQMEazFqDXUsyXKfSTGbCguovf5cSW+xcvsaz4gjOUEBjeqcbQrrzua53SWrIAkrv9tw8YYHA4xmdTfCoeIWUrShgHJOx5oM0mbxYiN1uBSl5hlekCVKTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n8RfiF8I5dRieB20BqZfXKHiWHvHVsQdG9yliPrCDE=;
 b=mhcm+iCZc8Pac8e0gL+CbOVTFCOeL0RWBv4j/di7jdr3Ic+Hf05qypKIl1G0OULr/yLRgY8SUismjCg1j829yrsUkiNYzyDM/m5U+By/87RsPS+a8692lDMyysDmilEmv9lmf7ZeXBPMwbYppvkKJUpOwEAC6cTRr6BIGYApL2E=
Received: from BY3PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:217::18)
 by CO1PR10MB4403.namprd10.prod.outlook.com (2603:10b6:303:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:35:49 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::86) by BY3PR04CA0013.outlook.office365.com
 (2603:10b6:a03:217::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:35:48 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:48 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldf2431963;
	Thu, 5 Mar 2026 13:35:47 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 2/6] rtc: m41t80: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:41 -0600
Message-ID: <20260305193545.796294-3-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CO1PR10MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a59c39-9693-4ad0-532d-08de7aee676b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	j/PNHW1Q7y9L/4ryQf/1C760O4Y+qcVj6fOglXGf2SH5ACocZ//8Mbpj1tD1cg7zVdOqGS16R2e08nZyrkWXPwQ9nBqLJw0JxOMhblPSnzE1KPc0zjLQub+2tCNhIGsYHjjZLCrHFVnFRNfO0kEpW8ivSzsn0iidz8i6922qK3/lA8+RcvNfbZWZ3RXD/r1b9iiXiO+VlO8mvk5oTMhYA5e5EFdCrxw//9976V8dn6DTqBgTubLuyFVMAhqzvkB2UGTMBS7W2EvX0SNK16u5/jPWTc+L0fqpRpZENj/w+P3ETgTiTZA7mPIwYDrznCgKRN06x+RRWvTxMezh9UVzGknkGD+3tAc53f2nOvpALLvW6WILQFT6hej68uquk+xzKi9GWWSDvqwOn7aE/wIAQE9ooQpboGcAt9B5sywDffHEBnMbaFJWd6LJtc69GfVtK3N9W9Db+YM7vBwIx6BvcbCqssl80gtcszjGJgRJYb7od0e98vgW0AlpmTpdauu5NVOorbcIhvSH/nLb1GbzzMf6c7a1Z7BTKfWYuEwikC6GyJYDit3FbAfL47fIjfOUawr4EDykWGaxK8DkTWo0uyaLDAFc8fWsu/1LGpKkPPqS8UnjYjUg66JdPlaLhk5wGmRi6gNyw6SUYQLxdHl+I2Hc4oTnPyVccn5nHX7Tkw8OKAenOpFrrXWWsK5+6DMBt+EAoPMq4m1UrkfAi80FTotSXSQTRKJYzJdf74ULuKMyTVgNJgBKXoQ/w0ODEITl18HS2NlFoFACmFZEdlypMw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0RswbK1z+Z6/kk6Crg1WSh+dxxWm13qccIaUiZfza6ML61WvFualHDdm8VmMSrhyI222r/yaxBdailG6z//DzZMoNoh1P7MBz2weEI+M23ltQvGNqhffHb3Ri2VljhrIqslJISwnUCTflZQduAFx3sK7fUYe9qoPNSdqon5Ku0fEj3wBD3EXCw41C0Rc3prCAOd0n8mlLH0lI767El/SzPG7CE4W+hC8/jAwFCAqNwojoxwQGt1j8QJO8zREQvH4jiBfWEWrY8aFth/aFJAq0EjiR7AIm6xrlIkXC2OcIplG7byEMdH2P1vXAJ5RDAaTcJp7nWdpz6wUdH9La3Rn4mRbS/KiPvHZ66cvjycFV+gzL+0Bij2M3wYoe7fan1LNrrByav6NlDjZVxY4g3qcMn0NbqIx/ExExJo5TjcJPQh8/TYGnzTY5ygWwd8pJMYU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:48.7699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a59c39-9693-4ad0-532d-08de7aee676b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4403
X-Rspamd-Queue-Id: C843A2179D1
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
	TAGGED_FROM(0.00)[bounces-6121-lists,linux-rtc=lfdr.de];
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
 drivers/rtc/rtc-m41t80.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 740cab013f590..b26afef37d9cf 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -924,13 +924,7 @@ static int m41t80_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	m41t80_data->client = client;
-	if (client->dev.of_node) {
-		m41t80_data->features = (unsigned long)
-			of_device_get_match_data(&client->dev);
-	} else {
-		const struct i2c_device_id *id = i2c_match_id(m41t80_id, client);
-		m41t80_data->features = id->driver_data;
-	}
+	m41t80_data->features = (unsigned long)i2c_get_match_data(client);
 	i2c_set_clientdata(client, m41t80_data);
 
 	m41t80_data->rtc =  devm_rtc_allocate_device(&client->dev);
-- 
2.39.2


