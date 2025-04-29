Return-Path: <linux-rtc+bounces-4019-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83063AA0E0C
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Apr 2025 16:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6341179922
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Apr 2025 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DE82D1931;
	Tue, 29 Apr 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="dIpLX6aW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DCE78F40;
	Tue, 29 Apr 2025 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935201; cv=fail; b=GUDAufHQHWjM4yXm8I4IfBtT+iwYjuV59dtCvE3lpayY0aMQP2zdMM7zrYsABuYdOTQlS7yaXpeUThaWfZm//y1Ji6mvst0QDBEzZqu+Vb8D2C83RLZgcCpEdYGNnnTwUNNz/TAe5PLIwt53rB1/JWelbrhbDJM4MZMumPDvOLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935201; c=relaxed/simple;
	bh=1D59Zm08C3Z4yI60clgOxD/eHCAmt5UiXtF+Q51vLMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=s3TNIGwQ8dfDarH7oC8skEmQtIa+aSVOyijDs/nAlNROgf96sgoEQhgyS3yJ1RHcOZ98GupTFdPrY+TWk5h0+QBSjzN6c2+5q8pklruUW0aR4M0+/b/Ute/inpZLQpOL980/RYZYjPiReZ5QldEtjnYFdUD+O+n6izicvFh/4Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=dIpLX6aW; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFQTu9I/rs29IhFlOd6KoURq7KWZp3RwhTGPN3hgFRs+uDByNJk20TTzx25qPpz7QJjZdJp8PcG3s+ixhWcSredi1nGTe2OxqxEbV7vEE62irNghSWLBmeNxCSCJc4w9ItCUL+Pf7UgU1cz2DTYh4+Rk2jERJveastVlaxppAQ6HD8ZqJWzYmLjzetg8V02ZKGpxyFE20myTSNCKIS8O0LicGtAJu4eT1w0gCzPYuqIc9Y2R+cnTmdgACpUiWFTkvCifQdPmZTKVVBAbveyKblqO5GOh8E8kDJYHGaQy7wP2ITBygYjcpGnWlU0gkSm+2k2HS+PCFtZ17MLilsCFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UABb85TWW6UmQhA/nA4+VU7HeYTp7wzQ/anWYwjgRI8=;
 b=XL05zzsy9IAjh0EdhM4u1OI3xCzUwCS6+Aewqf18+oqG2KE69zS54N/QEbFCfeRpzUe1glHj4QV0DfKvbLy6vXLw+dq3x+1PoQeZ3EgazqliIkPu8dQGBLt8o6JIk8Lmb8DcGkkinlWB8xQO4OsHly2cL2mKaX9SLHMndlydJb1B7FD4LcQMFI+fU+QfChdWntpactA+TBjHoTv0rpfAUelWtdsCQ/2+SaMYN1RryMY0SbWhVlLzxze/+cGuRcQIpPKEXYcYxS2hnNxNJj/K9aUQqKZc+y/cGDZ8rDA19CorqvNomsN4QUo0wPeEjx+HeuIO0R4Q+vadyKqOWCGo0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UABb85TWW6UmQhA/nA4+VU7HeYTp7wzQ/anWYwjgRI8=;
 b=dIpLX6aWoy9VxFMM1zeiKOSiJOXRpT3fu0uroO/dBP75IerL0r7B7qLhZ8jhlSHElBJGdKV64vWTNlofdssyXU6pR0yfKcefIiM+4xT5I4TjArJaiPVtUDDW8OjmDV1fGwwvtAu0JmooGf58kBFDvY/+sbbXcsEEhTcevmcP2mk=
Received: from DB9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:1da::10)
 by DB8PR02MB5900.eurprd02.prod.outlook.com (2603:10a6:10:113::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.18; Tue, 29 Apr
 2025 13:59:50 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::8e) by DB9PR05CA0005.outlook.office365.com
 (2603:10a6:10:1da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 13:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 13:59:49 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 29 Apr
 2025 15:59:49 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 29 Apr
 2025 15:59:49 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 29 Apr 2025 15:59:49 +0200
Received: from pc53218-2308.se.axis.com (pc53218-2308.se.axis.com [10.92.111.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F038E875;
	Tue, 29 Apr 2025 15:59:48 +0200 (CEST)
Received: by pc53218-2308.se.axis.com (Postfix, from userid 9850)
	id EB92C41DE771; Tue, 29 Apr 2025 15:59:48 +0200 (CEST)
From: Anders Sandahl <anders.sandahl@axis.com>
Date: Tue, 29 Apr 2025 15:59:21 +0200
Subject: [PATCH] rtc: rx8111: Add NVMEM and timestamp functionality
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250429-rtc-rx8111-events-v1-1-7e2a61126042@axis.com>
X-B4-Tracking: v=1; b=H4sIADjbEGgC/x3MPQqAMAxA4atIZgNNVfy5ijgUm2qWKqmIULy7x
 fEb3suQWIUTTFUG5VuSHLGA6grW3cWNUXwxWGM709oW9VpRn4GIkG+OV0IfRtd0AxnXN1C6Uzn
 I8z/n5X0/QLUDI2MAAAA=
X-Change-ID: 20250424-rtc-rx8111-events-df9a35810a73
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Anders Sandahl <anders.sandahl@axis.com>
X-Mailer: b4 0.14.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|DB8PR02MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b109a6b-1286-41fa-e85b-08dd87261bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnREZ29aYS9sVi9HRU5qTnprSUUzZU5nWU44TGlOa1lPeGdBWlFSSGNPbUJW?=
 =?utf-8?B?ZlVLZFlRTzg4RGg4aEV2c2Z2dXY2WmlFTEdYWU9XRXRFU2dLbmRQU3l1NHpJ?=
 =?utf-8?B?LytjSTI0dEc1NiswbTlUQWE2ZnNCSG9uUnlzdi9ib1M5KytEWGlydC9iUUJL?=
 =?utf-8?B?VnY3blRaT0dPb25IOFdYUCtoNnRCRDNPYk5HUTYvVk9KcDVPK0ZoWUZURXJQ?=
 =?utf-8?B?SnlTcFZiZlA5REVRd3ZVSVp0ZEFxU0hNakNCSE1JUXUwMkE0TFh4Y1BaQity?=
 =?utf-8?B?TWxrS1g2cnpvRnNzQTBWTFNaaWRzdjNnZ3JUMlRoQTF4Q09sb3BjTjgzSFY0?=
 =?utf-8?B?Z2k1MDB3MjhrZU1JZGY4enI1cVViWlkzMFZiRy95SlcyeVkwZTc1amU1QlJh?=
 =?utf-8?B?clNucnBNS05VdzdOc1VISDg2ZmVnT3BRcWdkQ3pFeXJUS3V1VnRzSEQ2dzUz?=
 =?utf-8?B?SzhjcFMxaUppMEdwNnFHMzRCVEtsQXlSUWdRcVpoNkdYZlpnSzh2aFB2OWg4?=
 =?utf-8?B?M2lKenlmd3ZSTk4vWEVuMmlKYXBJTTJQQ2FuNGQvMU4xOVUyNWxIR3dTWTZl?=
 =?utf-8?B?U2RGL0l5bTd2by9rSDdSZllDY0kvRm9FREdOcDVpdlJ0REpQcVA4MytqNlpy?=
 =?utf-8?B?OUE5dWFsbjJ3d1lBcXdNbWE5QmVWUHVwVWx1c1dJMFc1REZvZnluQk5ILzBa?=
 =?utf-8?B?V2liL2VENEJEemRuOGtka3Y1MVhBVUhpVzgxbzY3REdMRGErTU9yZUtVV1hB?=
 =?utf-8?B?VlpIMzJNWnFLYll2Q29KQno4TU1wc2Ztak9RY0MxZDZZRHdza2NwS1JZbWV4?=
 =?utf-8?B?OW5JUWsrVlRkM2pCcHdsZGc0M2RMRnNkWXVSRDdsREhESkVpelY1V1BwSGtr?=
 =?utf-8?B?VmhqaTM4Nk13aGJpNWM4MTViOEV0RGFwbHU0bTREaTdGa1BsMlJ4YnVvQitK?=
 =?utf-8?B?Y0w4VlZLS20zVHExY2YyaFpRdWc3WlR2OGZhS05zRWh5MUZta3BtT0ZUU1hh?=
 =?utf-8?B?ZFdtNXRXVld6L1drMCtZcmNvUmNpWk1xdlJ2SkQ2bnAxZEFSdktqaTFheHJV?=
 =?utf-8?B?K1dsYTd3L2s3N0c3eGJYOWxuY3FLdllOTHN2M1R4Vi96UGE4Rm5xUnk0cUF5?=
 =?utf-8?B?Z0tLVWxXTkhPbUpGdGg3MzFxY1RwdTZucWJlVnBhUTNTeVFzazhpTWZWRFhm?=
 =?utf-8?B?UWI1SnBEZWNwVU56a2hTL1I0ekRPQTl1WlhPOHdSL2pxcnpobzBqcHlsSk5p?=
 =?utf-8?B?M0NBeldTaDFBcjhjZmRmMkRacjNNd2tuc1c2K2xQVldYYzA0Qlg0L2JXMGlZ?=
 =?utf-8?B?Q1l5Y0RxQlQ0bnE3dzk0TFJraWh2eFU0cWdYZkJaR2FhTGpjWWZndzlyMzY3?=
 =?utf-8?B?TldWUS9tOWtoMWFOeFhmT3U2UlpHeWEveTF5Y29lTnlBQVlwUTFydUs4cEJG?=
 =?utf-8?B?U1U0eTd6bUFON1k2VUZSYldDbjI5U255SHBCQUd1WU8vMko3bFcvbE1OVjUw?=
 =?utf-8?B?ZXJNc1ZNRFZpVlR0YmdqOU9UcFQ0M2g0NEVkL2FtUmhkKzdLNGd6ZXNydW1W?=
 =?utf-8?B?UXRuVEkwNUhGdmJ3b3ZXNTN2Nk9yekdrVjNUUmNRTVJIZnhQQUxoNVlLY3Zz?=
 =?utf-8?B?YXFHMWYzQWlhWmFjdzJSa1NkTWhIREUrVTJyWFFuMVVCdzNBNWRpYk1BYjI0?=
 =?utf-8?B?ZktuUzJaOWdnSk4xMzM4Si9hcXpSOHQvMnpCMVhmSjJWWFE5V0lRd0hBK1Ay?=
 =?utf-8?B?UUVPUlBBTytiZndock5pR0NvRk9zbnV3UHhiMloyMXBzQkloN1J3c3ZCaWFX?=
 =?utf-8?B?emFwRnRvdnd2QXN1MSs2WmVTOXlKUGYxL0FVT3BZdWhQekExdHVkRG5tQUkr?=
 =?utf-8?B?WEZmRnNqZHo2K1R0SytjbHNWL1J1eVhPcktSU2lwY2QzNjg2am8xanRhd1ZD?=
 =?utf-8?B?aFRHeDRIV2tYTjI3bkFWR1ZRQmZianl1Q040NHd6aXNMemxSQ2hkM3BlZGww?=
 =?utf-8?B?aHR4MHZJUEVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:59:49.9646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b109a6b-1286-41fa-e85b-08dd87261bb9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5900

Introduce support for saving a timestamp triggered by an external
event via the EVIN pin. After an event detection, the timestamp can be
retrieved from timestamp0 in sysfs.

Also add a sysfs control timestamp0_write_nvmem to enable the RX8111
feature that stores timestamps in NVMEM as a circular buffer.

Signed-off-by: Anders Sandahl <anders.sandahl@axis.com>
---
The Epson RX8111 device has support for saving a time stamp when a 
hardware trigger occurs. It also has a register area that can be used 
as non-volatile memory.

Datasheet: https://download.epsondevice.com/td/pdf/app/RX8111CE_en.pdf

Timestamp is made available in the same manner as in "rtc-rv3028.c"
through sys-fs. NVMEM is made available using the framework functions.
---
 drivers/rtc/rtc-rx8111.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 349 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx8111.c b/drivers/rtc/rtc-rx8111.c
index 8450d9f0b566c63bca04988d892ea4db585ac526..4f428eb98f4858b4c70b3a5709d8204a77d0a1ea 100644
--- a/drivers/rtc/rtc-rx8111.c
+++ b/drivers/rtc/rtc-rx8111.c
@@ -58,7 +58,14 @@
 #define RX8111_FLAG_XST_BIT BIT(0)
 #define RX8111_FLAG_VLF_BIT BIT(1)
 
+#define RX8111_REG_TS_RAM_START		0x40	/* Timestamp RAM area start. */
+#define RX8111_REG_TS_RAM_END		0x7f	/* Timestamp RAM area end. */
+
+#define RX8111_BIT_EVIN_SETTING_OVW	BIT(1)	/* Enable overwrite timestamp RAM. */
+#define RX8111_BIT_EVIN_SETTING_PU1	BIT(3)	/* Pull up select 1. */
+
 #define RX8111_TIME_BUF_SZ (RX8111_REG_YEAR - RX8111_REG_SEC + 1)
+#define RX8111_TS_BUF_SZ (RX8111_REG_TS_YEAR - RX8111_REG_TS_SEC + 1)
 
 enum rx8111_regfield {
 	/* RX8111_REG_EXT. */
@@ -98,6 +105,11 @@ enum rx8111_regfield {
 	/* RX8111_REG_STATUS_MON. */
 	RX8111_REGF_VLOW,
 
+	/* RX8111_REG_TS_CTRL1. */
+	RX8111_REGF_TSRAM,
+	RX8111_REGF_TSCLR,
+	RX8111_REGF_EISEL,
+
 	/* Sentinel value. */
 	RX8111_REGF_MAX
 };
@@ -134,12 +146,16 @@ static const struct reg_field rx8111_regfields[] = {
 	[RX8111_REGF_CHGEN]  = REG_FIELD(RX8111_REG_PWR_SWITCH_CTRL, 7, 7),
 
 	[RX8111_REGF_VLOW]  = REG_FIELD(RX8111_REG_STATUS_MON, 1, 1),
+
+	[RX8111_REGF_TSRAM]  = REG_FIELD(RX8111_REG_TS_CTRL1, 0, 0),
+	[RX8111_REGF_TSCLR]  = REG_FIELD(RX8111_REG_TS_CTRL1, 1, 1),
+	[RX8111_REGF_EISEL]  = REG_FIELD(RX8111_REG_TS_CTRL1, 2, 2),
 };
 
 static const struct regmap_config rx8111_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = RX8111_REG_TS_CTRL3,
+	.max_register = RX8111_REG_TS_RAM_END,
 };
 
 struct rx8111_data {
@@ -147,8 +163,224 @@ struct rx8111_data {
 	struct regmap_field *regfields[RX8111_REGF_MAX];
 	struct device *dev;
 	struct rtc_device *rtc;
+	spinlock_t ts_lock;	/* Don't allow poll of ETS bit when it's temporarily disabled. */
 };
 
+static ssize_t timestamp0_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct rx8111_data *data = dev_get_drvdata(dev);
+	int ret, etsval;
+
+	/*
+	 * Clear event only if events are enabled. This is to protect
+	 * us from losing events in the future if events have been disabled
+	 * by mistake (error in read function).
+	 */
+	spin_lock(&data->ts_lock);
+	ret = regmap_field_read(data->regfields[RX8111_REGF_ETS], &etsval);
+	spin_unlock(&data->ts_lock);
+
+	if (ret) {
+		dev_dbg(dev, "Could not read ETS (%d)\n", ret);
+		return ret;
+	}
+
+	if (!etsval)
+		return -EINVAL;
+
+	ret = regmap_field_write(data->regfields[RX8111_REGF_EVF], 0);
+	if (ret) {
+		dev_dbg(dev, "Could not write EVF bit (%d)\n", ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(data->regfields[RX8111_REGF_TSCLR], 1);
+	if (ret) {
+		dev_dbg(dev, "Could not write TSCLR bit (%d)\n", ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static ssize_t timestamp0_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct rx8111_data *data = dev_get_drvdata(dev);
+
+	struct rtc_time tm;
+	int ret, evfval;
+	u8 date[RX8111_TS_BUF_SZ];
+
+	/* Read out timestamp values only when an event has occurred. */
+	ret = regmap_field_read(data->regfields[RX8111_REGF_EVF], &evfval);
+	if (ret) {
+		dev_dbg(dev, "Could not read EVF (%d)\n", ret);
+		return ret;
+	}
+
+	if (!evfval)
+		return 0;
+
+	spin_lock(&data->ts_lock);
+
+	/* Disable timestamp during readout to avoid unreliable data. */
+	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 0);
+	if (ret) {
+		dev_dbg(dev, "Could not disable timestamp function (%d)\n",
+			ret);
+		goto err_out;
+	}
+
+	ret = regmap_bulk_read(data->regmap, RX8111_REG_TS_SEC, date,
+			       sizeof(date));
+	if (ret) {
+		dev_dbg(dev, "Could not read timestamp data (%d)\n", ret);
+		goto err_out;
+	}
+
+	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
+	if (ret) {
+		dev_dbg(dev, "Could not enable timestamp function (%d)\n", ret);
+		goto err_out;
+	}
+
+	spin_unlock(&data->ts_lock);
+
+	tm.tm_sec = bcd2bin(date[0]);
+	tm.tm_min = bcd2bin(date[1]);
+	tm.tm_hour = bcd2bin(date[2]);
+	tm.tm_mday = bcd2bin(date[4]);
+	tm.tm_mon = bcd2bin(date[5]) - 1;
+	tm.tm_year = bcd2bin(date[6]) + 100;
+
+	ret = rtc_valid_tm(&tm);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%llu\n",
+		       (unsigned long long)rtc_tm_to_time64(&tm));
+
+err_out:
+	spin_unlock(&data->ts_lock);
+	return ret;
+}
+
+static DEVICE_ATTR_RW(timestamp0);
+
+static ssize_t timestamp0_write_nvmem_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct rx8111_data *data = dev_get_drvdata(dev);
+	bool enable;
+	int ret;
+
+	if (count < 1)
+		return -EINVAL;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(data->regfields[RX8111_REGF_TSRAM],
+				 enable ? 1 : 0);
+	if (ret) {
+		dev_dbg(dev, "Could not set TSRAM bit (%d)\n", ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static ssize_t timestamp0_write_nvmem_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct rx8111_data *data = dev_get_drvdata(dev);
+	int enable;
+	int ret;
+
+	ret = regmap_field_read(data->regfields[RX8111_REGF_TSRAM], &enable);
+	if (ret) {
+		dev_dbg(dev, "Could not read TSRAM bit (%d)\n", ret);
+		return ret;
+	}
+
+	return sprintf(buf, "%s\n", enable ? "1" : "0");
+}
+
+static DEVICE_ATTR_RW(timestamp0_write_nvmem);
+
+static int rx8111_sysfs_register(struct device *dev)
+{
+	int ret;
+
+	ret = device_create_file(dev, &dev_attr_timestamp0);
+	if (ret)
+		return ret;
+
+	ret = device_create_file(dev, &dev_attr_timestamp0_write_nvmem);
+	if (ret)
+		device_remove_file(dev, &dev_attr_timestamp0);
+
+	return ret;
+}
+
+static void rx8111_sysfs_unregister(void *data)
+{
+	struct device *dev = (struct device *)data;
+
+	device_remove_file(dev, &dev_attr_timestamp0);
+	device_remove_file(dev, &dev_attr_timestamp0_write_nvmem);
+}
+
+static int rx8111_setup(struct rx8111_data *data)
+{
+	int ret;
+
+	/* Disable multiple timestamps; area is used for nvmem as default. */
+	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL2, 0);
+	if (ret) {
+		dev_dbg(data->dev, "Could not setup TS_CTRL2 (%d)\n", ret);
+		return ret;
+	}
+
+	ret = regmap_write(data->regmap, RX8111_REG_TS_CTRL3, 0);
+	if (ret) {
+		dev_dbg(data->dev, "Could not setup TS_CTRL3 (%d)\n", ret);
+		return ret;
+	}
+
+	/* Configure EVIN pin, trigger on low level. PU = 1M Ohm. */
+	ret = regmap_write(data->regmap, RX8111_REG_EVIN_SETTING,
+			   RX8111_BIT_EVIN_SETTING_PU1 |
+				   RX8111_BIT_EVIN_SETTING_OVW);
+	if (ret) {
+		dev_dbg(data->dev, "Could not setup EVIN (%d)\n", ret);
+		return ret;
+	}
+
+	/* Enable timestamp triggered by EVIN pin. */
+	ret = regmap_field_write(data->regfields[RX8111_REGF_ETS], 1);
+	if (ret) {
+		dev_dbg(data->dev, "Could not enable timestamp function (%d)\n",
+			ret);
+		return ret;
+	}
+
+	/* Disable all interrupts. */
+	ret = regmap_write(data->regmap, RX8111_REG_CTRL, 0);
+	if (ret) {
+		dev_dbg(data->dev, "Could not disable interrupts (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
 {
 	int ret;
@@ -160,6 +392,17 @@ static int rx8111_read_vl_flag(struct rx8111_data *data, unsigned int *vlval)
 	return ret;
 }
 
+static int rx8111_clear_vl_flag(struct rx8111_data *data)
+{
+	int ret;
+
+	ret = regmap_field_write(data->regfields[RX8111_REGF_VLF], 0);
+	if (ret)
+		dev_dbg(data->dev, "Could not write VL flag (%d)", ret);
+
+	return ret;
+}
+
 static int rx8111_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rx8111_data *data = dev_get_drvdata(dev);
@@ -289,11 +532,69 @@ static int rx8111_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		vlval |= regval ? RTC_VL_BACKUP_LOW : 0;
 
 		return put_user(vlval, (typeof(vlval) __user *)arg);
+	case RTC_VL_CLR:
+		return rx8111_clear_vl_flag(data);
 	default:
 		return -ENOIOCTLCMD;
 	}
 }
 
+static int rx8111_nvram_write(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct rx8111_data *data = priv;
+	int ret, len;
+
+	/*
+	 * The RX8111 device can only handle transfers with repeated start
+	 * within the same 16 bytes aligned block.
+	 */
+	while (bytes > 0) {
+		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
+		ret = regmap_bulk_write(data->regmap,
+					RX8111_REG_TS_RAM_START + offset, val,
+					len);
+		if (ret) {
+			dev_dbg(data->dev, "Could not write nvmem (%d)\n", ret);
+			return ret;
+		}
+
+		val += len;
+		offset += len;
+		bytes -= len;
+	}
+
+	return 0;
+}
+
+static int rx8111_nvram_read(void *priv, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	struct rx8111_data *data = priv;
+	int ret, len;
+
+	/*
+	 * The RX8111 device can only handle transfers with repeated start
+	 * within the same 16 bytes aligned block.
+	 */
+	while (bytes > 0) {
+		len = ((offset % 15) + bytes > 16) ? 16 - (offset % 16) : bytes;
+		ret = regmap_bulk_read(data->regmap,
+				       RX8111_REG_TS_RAM_START + offset, val,
+				       len);
+		if (ret) {
+			dev_dbg(data->dev, "Could not read nvmem (%d)\n", ret);
+			return ret;
+		}
+
+		val += len;
+		offset += len;
+		bytes -= len;
+	}
+
+	return 0;
+}
+
 static const struct rtc_class_ops rx8111_rtc_ops = {
 	.read_time = rx8111_read_time,
 	.set_time = rx8111_set_time,
@@ -305,6 +606,16 @@ static int rx8111_probe(struct i2c_client *client)
 	struct rx8111_data *data;
 	struct rtc_device *rtc;
 	size_t i;
+	int ret;
+	struct nvmem_config nvmem_cfg = {
+		.name = "rx8111_nvram",
+		.word_size = 1,
+		.stride = 1,
+		.size = RX8111_REG_TS_RAM_END - RX8111_REG_TS_RAM_START + 1,
+		.type = NVMEM_TYPE_BATTERY_BACKED,
+		.reg_read = rx8111_nvram_read,
+		.reg_write = rx8111_nvram_write,
+	};
 
 	data = devm_kmalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
@@ -312,6 +623,8 @@ static int rx8111_probe(struct i2c_client *client)
 		return -ENOMEM;
 	}
 
+	spin_lock_init(&data->ts_lock);
+
 	data->dev = &client->dev;
 	dev_set_drvdata(data->dev, data);
 
@@ -331,6 +644,10 @@ static int rx8111_probe(struct i2c_client *client)
 		}
 	}
 
+	ret = rx8111_setup(data);
+	if (ret)
+		return ret;
+
 	rtc = devm_rtc_allocate_device(data->dev);
 	if (IS_ERR(rtc)) {
 		dev_dbg(data->dev, "Could not allocate rtc device\n");
@@ -343,7 +660,37 @@ static int rx8111_probe(struct i2c_client *client)
 
 	clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
-	return devm_rtc_register_device(rtc);
+	ret = devm_rtc_register_device(rtc);
+	if (ret) {
+		dev_dbg(data->dev,
+			"Could not register rtc device (%d)\n", ret);
+		return ret;
+	}
+
+	ret = rx8111_sysfs_register(data->dev);
+	if (ret) {
+		dev_dbg(data->dev,
+			"Could not create sysfs entry (%d)\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(data->dev, &rx8111_sysfs_unregister,
+				       data->dev);
+	if (ret) {
+		dev_dbg(data->dev,
+			"Could not add sysfs unregister devres action (%d)\n", ret);
+		return ret;
+	}
+
+	nvmem_cfg.priv = data;
+	ret = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
+	if (ret) {
+		dev_dbg(data->dev,
+			"Could not register rtc nvmem device (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct of_device_id rx8111_of_match[] = {

---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250424-rtc-rx8111-events-df9a35810a73

Best regards,
-- 
Anders Sandahl <anders.sandahl@axis.com>


