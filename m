Return-Path: <linux-rtc+bounces-6123-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE1zKDzbqWneGQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6123-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:28 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031992179E9
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 20:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59D9B30A12CD
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 19:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615DC3D567E;
	Thu,  5 Mar 2026 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ShC8Y3F3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2A37D10E;
	Thu,  5 Mar 2026 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739354; cv=fail; b=j/b1HHTYUQjLUoigsdXQ3RV7BAKvX4nNNHnUglXsDNwLc+OBQK+ey3Kzna+UgdAFg7cXqsd3KF35IWoP0idhUeRLAZf9d4GmjPHzybpZpHoLK3D7uAFmEj2khrAbj7NfZlC6FjpTa7knVHHYtaaopkXdNg6KrVenwzqQ+p2fT6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739354; c=relaxed/simple;
	bh=fW+lAEDPnXdWvfhDzMjDacxmVg0Mhvn3bk8djksigBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ry2nGbeDhLHf1AXUpb9MVnWJkf4XF1WypCodVs4wuw5vg4Hs3984LYQLr1D3O/UQyaa136q3b09++Q+7JmZVS9JyeAH6pC6eJRId5vQGsH3Hh9r1YIrTr6OTU4V0sYXaPfyJVfu5OM2ZpMWylPnRhsjHnRjdfv9QQtwq+xLuVaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ShC8Y3F3; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX5I6qUIkhhWskxgsYpNcB5I7X36Ew0sPfR2ojz63H7FCqZMi30qRO8qIOGMBlLkxg3HcLZdsZm3nL0qEHn/JA6RFz8j3NxjPPwf0z6mogl9y3PbfYGWdtvoQv6iciU/QBQLg/01AsVRrlEZ0vblzxYfx+ANWpRRsXnRuBkUzypHSsbTId5FQueoeHSr2S2PDSaGkZNJ03+trdNKHcFewntFKwIa07ME0YCJWkxG58tAQYLcjbMMyEJw7+6Bo7IBrW+bMNkBoDooW5lTpxS7Ww0JuKGqADFISQuynJwDOxR36lS3PiA77oUExwoeoTvEkcaEbEwnmltBMoHsr4DKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apk1ETQGsnnLL4B1h138a7ja7n8k5Mhz6P26gQxs9S0=;
 b=kZSpMlbnPUf5/TFoYqYM6lNp1Lk4bSkkiyJrpQ0poR0s6hhK8U4b+F2Z4okbbx1HgxeWsOSXnst3GC3tYU+5D3MM4a+08ddZ4stZFAnfwgbTfLtzrjLnVZ9BxO27uwabhdv3i3ZNFJOyxOpPEFSgYebGC2AI4mYHL547cthtGBJdRF+vOPiDtaSl+7yZ1WlWDJn+w1W+pMhtkxmMacD1lkL+TMgW0KMYNePrBp83y+V1bGke0XCBmI/yKsIr8XRwDvivJHT1N9MQf8YeMuPu8r6t9hYH112U2p616n9TL0c8na36UbzESiPlVgNzZPdmCDXQBhtBMX0ZH2VowSL7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apk1ETQGsnnLL4B1h138a7ja7n8k5Mhz6P26gQxs9S0=;
 b=ShC8Y3F34d4x2kWIVgF36ftkwELaNmek6/8ZTl+qVElO7asgCqgvVN6VKRni4psjMRVSPFmRYhHCY5nfdCtpTYbid32FO/oRwgommcppgI52ry3V0DPM1epQuAlUE1OIsxaIg25qD767u+9XxeIGRDQaH/GOoG86mxu5nwKAQwk=
Received: from MN2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:208:23e::12)
 by LV3PR10MB8155.namprd10.prod.outlook.com (2603:10b6:408:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:35:50 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::2e) by MN2PR14CA0007.outlook.office365.com
 (2603:10b6:208:23e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:35:45 +0000
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
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:49 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:35:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:35:48 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JZldj2431963;
	Thu, 5 Mar 2026 13:35:48 -0600
From: Andrew Davis <afd@ti.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 6/6] rtc: rx8025: Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:35:45 -0600
Message-ID: <20260305193545.796294-7-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|LV3PR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: ec30aabe-5357-459e-e204-08de7aee6895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	nky/Hf/D7vbWmasIkMzWAFGsDhiiFizE6BNNcF0cVyxKyEn2Udofn7l8s17eycFVX8WX5PoQ1uaa7AYyQCe3f6wruELWapBSyuaqAP31SxEiGfs7EYbZbB8hQjEvEIAfSeZjPZSsGoGal2k8SQT81JEmzim/WANJf4m3JS1C1udVRUbqnMXxbiH1zYyqz1rBk0QKDOo0Dx4TVMZF+mooZ2npXjQFyIq2EmsJ9DQatIm0nkRFwVemZMETDD/S9kXny9Dme/YZWR4zfRmqHay8MaEJ3qI3aLicINyDrCBUIhmRvqVoNyytWt7+l5vnEo9SGI1Lut/QN8sLrwjhduOmsIFOjye38B0KIXJ0E81d+XB6YsPpSOPbF+quGPjPVhSt6QPgNa2UJcVl3+23jcU1g8JiEAsNupfDULVrqrhrUboOqMjAnm5NDACt6iBJ7Nul99YVsd9pZU+/nCPeZC/4teQFQs3q7FM+Q/AC4KEfjypjK99ufk1HQSnkLkDD6Iogh90YsmX9jGNA/dXT0GnAowg6YzOZDoLHcDjSIe/eL8UWCXTv0Is1oScU9j+lzNQ4Jy+UNBg6nNkaIZr0JvpEF3W2thmc0S4oYhZYmB/E0FkbL/BhL4H9ogGHC5kF5jkQ3uKHpRaWzhRJbWjqM8LrAXchq988/NJDWN6MzK9noJmBNWV0gtRbMOTLWxd+KRhG03Bpaiq5f9gIysaPni6w6FX0U+4zL3lhDcsUQK7PWXQvUkleGyhFe1l9qeKA8yFi+OYbgDw7hDZLXn4a0D3Faw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nY2G+QiiuJjkCF6DXniL8N9DcNAmmPjfGLgtfCXcdd5BZvgcGI8Ioo/yhVGzZmtuYltc2lcHijEseXO6rj6Z9/mfjk7bv3Wxbe2ENzL73coIhTZICDfsRtXChF4froua4uI9wP7SQez1lGpSmP17/wGesSFdj495MwHz5u7lnzMhtVMPOHGRGtoa9mmE83f8ffIYcFb8+LDZCVqZKqaYGeNoDFmdXmqAZvof306lvUvm3HUIaNljj5QlyNYpgqjk3KUWejtlWgJNL7frMJf+azF+Ejedn+R4J3AFITUq0au8HzI3jz8daBL5CjtkkgW/quY8jFR9QA8xyTm3IW11T8DDet7L3bYES0AqUBEGWrzmCWvx2Q04I1Or/XeGh5KuS/rIuKKWAg1cKB0lqrg/mxk49aM4PHnPE0NTKNXMR6XdG2fFWhLoF12cPd6lht+x
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:35:50.7482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec30aabe-5357-459e-e204-08de7aee6895
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8155
X-Rspamd-Queue-Id: 031992179E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6123-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
 drivers/rtc/rtc-rx8025.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index ced6e7adfe8d0..c57081f9e02b4 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -522,7 +522,6 @@ static const struct attribute_group rx8025_attr_group = {
 
 static int rx8025_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_match_id(rx8025_id, client);
 	struct i2c_adapter *adapter = client->adapter;
 	struct rx8025_data *rx8025;
 	int err = 0;
@@ -540,8 +539,7 @@ static int rx8025_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, rx8025);
 
-	if (id)
-		rx8025->model = id->driver_data;
+	rx8025->model = (uintptr_t)i2c_get_match_data(client);
 
 	err = rx8025_init_client(client);
 	if (err)
-- 
2.39.2


