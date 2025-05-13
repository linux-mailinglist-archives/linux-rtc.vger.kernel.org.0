Return-Path: <linux-rtc+bounces-4096-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE26AB59B7
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98CF03AC879
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5392BF3F5;
	Tue, 13 May 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="XUg3Dy5f"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896E2BEC32;
	Tue, 13 May 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153242; cv=fail; b=CUkCiERjvJELUTUAn/jhH3VD3xpaHeqWE5LUGl/hxQdyC/WxLzoKnxVy+1VimNyMXvTnhcEi1mDy2+DELj80MLbUuLVZ0+4ChqM/DkZh9Ze3peu/9W7ASRcVAWZJkQoCCWUuvp56/ROukcUm62M3AZTtR5Q/9sxN4bbVGXIU33A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153242; c=relaxed/simple;
	bh=aVaCa6knYN3wdv4Qh7BCP9ztlsu9/+EjuxJRf2UeVR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qj5aE/zE9V1yiCowB6Rtc1cBASi9wDXBGU719F6b74AgHm7nqnaoDVrrZ8Ei1j7CGQTa+6jiR3x3wFU+Nr9Wy8m03XBdG+PtAmvy45VIo5sEjwbhMPZTKMJ5JENi/ktfqd5u9yC6cA6zeFAwhLU+kU5bpRCybQHl64CEv+ujeUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=XUg3Dy5f; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay80PEHyrAWwluB7C9VST50xAI4i0dx00FARUdhq38RxxwpNuUUKQZ5wicnpsyMM7EyXKyohnBI1CyurjjHNXX0hK14Rl6pGLU+aJGAba8G6TRjIuzZSn/GJyPJhVRTvqkjWexInaUEMags8JFVeuPRY5Z4OZjZmB0JT6RDpww9AaznP8Y/QmMHOez6D9K51P+CA8tAD+2qcqqd9vnekTmjkNLm4RwLASvHqEY2jFj63dxaYpNKkQVQMs0fxXOFbrRPB0BpQPILhg6zcQFoPlVoy86Wa6uUEkXs0H9MZrrOKBenh9IaM9bqR1DrO9SKRcACa2N2RkLaaiSImK0U3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ai0RgXeyZkcJ6jlUzXDtzGNrbj997/g/dZPMiNZkUk=;
 b=pEJRgH9tDsPtBCkfeYD4vrmO5dqMxd75D5O0gOyU08n0HF4fjJNF/qsHIuD/lsRukDe00bTV6+mUV8G/KAaIXFmPlsNfTAz7xJxaiGxXy7pPGeXS4vC+frDmUy1CDWr5YncutUlCTdQdse6B1QcZTD0tOwV7befEcoRGndy2ceIpsdXGDEdMMQJSz38OE79lmK7Bcbql4E12k+ig8QlaeQ2DtXjiz4+9ylblx3z8huh8EoiyAQ8LsU3xaF4O7+laJAVT7c6HPLXOD2eIBsz3rRiVrpHey+DOsad2iFYZTkR+iZwBG1uZUvqn6cNtmpz6ujGOfkvVn9TliQs+07E/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ai0RgXeyZkcJ6jlUzXDtzGNrbj997/g/dZPMiNZkUk=;
 b=XUg3Dy5ftwxRR4DcuGskJHwG978yXVJFKdYb6ZRDRiJUE5vCx+IH9aH4Jg05K7j45Q3zSopc7kD4vMF6RiNh6IrBYqQ4GAw14kq5DSqcVNOwUjtgPb1ax7uMYbwGTAfjezgqM/+FdlvIwdBVOSn7Y84xRBGuEpU9PIopMvEDqQCu6dNVgku0AchO2YtDTzJczVIvkDNqUuhqv8WpnV0aG5CCjnQToxK7qASa7FC37y2RO2y3XFbDRrHDdYQOBhW6xEhRIE0mvJrwiR1Y4LzfLgZv5+qK7GfV5D3pgk4YIiZBXRT6L23b7ZoN8NxGFAvQbCp2Jin3EUIFjxP23om5GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:20:37 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:20:37 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 7/7] rtc-rv8803: make tamper function configurable via dt
Date: Tue, 13 May 2025 18:19:22 +0200
Message-Id: <20250513161922.4064-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b54211-cf84-4c49-dc7b-08dd923a1866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pn0M2fnd4Xvm7+lF4RoEiixFUxu6q1bdQJdqNDB3Wicpfv2Qw9XEnwkZH2ET?=
 =?us-ascii?Q?LhQcPSFu0SalZS2sEo6IdxViB0wrbF09yS+9vzCyzi8D5zmxqCZt+NbESDPm?=
 =?us-ascii?Q?HABDIPHIM2EU5arrRlaFzq3pLncvuqT6+v3d1OI+i30NvriLjrH+COJVTYFQ?=
 =?us-ascii?Q?5OWr7aeX9ZxGvwhF/bhlb+JRt9HxCKfxexNwb+OwA3eHYKdBeOhnIWrX7RSG?=
 =?us-ascii?Q?dYs3HGE7S7Ixhe1pYdPQBzgVka1DeF6gNxpDi0Ls3+7cm1qAz3cBEetF+N4F?=
 =?us-ascii?Q?s3Ch0YkuuoWtedoy8BBY3cozkbpseji/4rUXFdEnAZoV6GxTNMnTYNLQMPpb?=
 =?us-ascii?Q?IkOGkH0ShrrwlDWFqu60aTS6zc5HfwysXmPNg3yzcD5xqeZnkDCRTAyqE43L?=
 =?us-ascii?Q?KGjvmsSJdFIB1KdJ47TXxcdQKHv9j3VDFenEnfG+BcmYE8d+y9IXe1dxjh/O?=
 =?us-ascii?Q?lLOCZF7xpW5Sk1crsZir0/b4SC1NYD6rYeWlYIUZ/Msx+zlAuqdmfm3OZxXI?=
 =?us-ascii?Q?Dxtv9eLJC8y5Mm6YGmyOaaXqKNb+FCulS+W1ZSv++eLBjeC5o55a3sKydWjS?=
 =?us-ascii?Q?3+9D60FXG6qJFvVWDrHVpeqXMw2tD/xZomGAxBW6B82JjjqUj9Q8DJA7FCgF?=
 =?us-ascii?Q?gEkKxh8Ca370q45BCEwAn7+dv6IPl8WcIOpss8tlr3fvX5GyexKglTj9lnWP?=
 =?us-ascii?Q?uakp1KLhpHvUbY/v7FvnGhm4NLeb6zd42xu+f2sSBNJ6bM+qNqsmsWFW+qOV?=
 =?us-ascii?Q?laFaDjPKpHkqtCqiQpOTYjX+Iyw+1T+sOJtOcI0IB2ZadWrTGigRMoz/QI3C?=
 =?us-ascii?Q?R3/A7UC5qbQF/CRmG5AWtxrBwS1JL3lzaimtoRWuTAJ7OdulRzCH+MFj/yaV?=
 =?us-ascii?Q?JxB4atCeBiAZbDTnzWgV0Zl0XfN0zs3Kcwj91bH3oeJqK2znJpy/pvRc4jtZ?=
 =?us-ascii?Q?6iObT7qAtg/Gt1lJrQqCQHE7VZpXSSOyGF/Lu9hbVII2CR+XPZSluZdGiX/9?=
 =?us-ascii?Q?e1kFMC7nog4SJJXxQy0WEAlN6QOihO0UJQ0iIZtN2nlAiIUXO7OdkRUtHgY9?=
 =?us-ascii?Q?YWCZRMEgeN0GJFLKSnujF/0mm7I/1cBX3ngI2cilFYTAG5+/Y5ekoV6rUhme?=
 =?us-ascii?Q?CWODGKH+Zem85w+8XmfAcNMkURu9TzgkweKzfKMKWHhseFPtck6RCNts2rMA?=
 =?us-ascii?Q?jglDSEb7oJKGbg4bLzcSkyLh5mpVIr/Gs4Ik6LIvJkimTXndJOA2FqJdmLqT?=
 =?us-ascii?Q?kq6I4d/TZ/6yua+G8WNFeQFbCx3UnqeX/aLKisSIqF2av+YQ9Gp+T3aoMn5O?=
 =?us-ascii?Q?V3nUF/+S9fWfQVRXYj9fxVbft6Z2bvfGq4nm5q5w0NseuYTglv0Xf+JwGVhm?=
 =?us-ascii?Q?0AvLReiTlT1kdWhbvihOHQC3QSxfVHHpeJARFG3X49SE6aVjCwX2gSicqLdS?=
 =?us-ascii?Q?DMIcAAOgvgiaZNg7PSeNWILuqONzSvKxEvMtGZu4Iq63ReYft944vw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QzcF3Gp8M6eWhEtOfNtXA42Il3/ZuFTfdJCe07R/FM0cbqGP6Eddmz5G6cPy?=
 =?us-ascii?Q?GlSEGdvtNlEHENFgaHJ+crexDmCKT5H7ni5laufA1hAruHuMUsY7kxcyNQWc?=
 =?us-ascii?Q?fku5KiiqWChKhVIr96M1Q36ui7DI3ahPovDDRnY5z4OGFqcj6jokdZa2qC6t?=
 =?us-ascii?Q?64OccYuGAxiqema1WeChvQo6K9ZTGYUFf4AE0i0of/kBVV7SSTAAVO4mwZMQ?=
 =?us-ascii?Q?ugtG3pKDoQRvSHvYx2aWCJGeFo2kLnGNPNIsHx//VhCN8i6zVlANK9lWxLcX?=
 =?us-ascii?Q?VbecHbL1BRepUjOdcSpXzUFw6jdTXehJV+PDkW70b+FdsYWiMO71CcywkJXm?=
 =?us-ascii?Q?D+6HL//zBEr8HbNnIf6nA+MItCkhfdnnMB8SH9El3ZC7f1Ni7PORGmEuM7n3?=
 =?us-ascii?Q?Ta3I3gMqmZ909bET0vlh2CPCgT3kpOfxJqrqQw6Q10L6gpMz+V6cUpWkS8Xh?=
 =?us-ascii?Q?1OtYFnk4oUzzNJtA6NSD8TgOXD5Mb1pMeN3Alxir/OfY55nCAFPXN+dQ4wxC?=
 =?us-ascii?Q?c0K7JBBaNTSpgyUzcBe3hw939hrpTPeVDI8chnPdiBHuOr0Yb4HaowigWhTv?=
 =?us-ascii?Q?V72s/snmcrgULVGAi2V5w+BdTlauWeAgN+e3IzAM1FPHbcC29llQFM0rc9nP?=
 =?us-ascii?Q?YY931SvH1drCJEoZr+9DhGMyLTn0rXd0vibOOhJX0uSyJUmJ3wZaDPaB8yud?=
 =?us-ascii?Q?9NxXDZyRHghlXs+Up1osQF8Qp6b/cMXV+QtpT+DMPji6oxK3dYIzeQDujVG5?=
 =?us-ascii?Q?G52uG64vqA3vkW1Gi4k1Su0COvjAunVGuRz/yLX82Jk/Qdx4AKWgi9g4y8KR?=
 =?us-ascii?Q?91VQKNHCE7JmNXVJhLiP6a9W18+RNvcq02ngElXzJGVFR6cKr9qO+m+k73FC?=
 =?us-ascii?Q?OkuXrVMbHkO6ztVXqJLq2roOp8JOn+gfHneFl/PWmIeWyAoTyK21Dcwqi5Yh?=
 =?us-ascii?Q?KEVd3CU1N1jgls3jpurCLtRws0LFlYsbwlAnvzV3gMuS85GXFG09/dlKkpUZ?=
 =?us-ascii?Q?yFWbQuJaHqu3hyh+iE07B9PGzehuBXOc7BApilyK7V5JJ0iSQZAsfD1q+h7a?=
 =?us-ascii?Q?RJNcA79BXwl3lWhJdJIy9hFHVhwo30xjoH5nKNQ6ZgStXA727kDop6qppnp9?=
 =?us-ascii?Q?mfDycP/BWOojMEXSwPWXY922aWXMnqeO7NkMJ+mzEqcOJiIxW0mITXjiJbaq?=
 =?us-ascii?Q?kORUhKIGw4FNYtQHWWwm2mIHgqMGlnr7Y+0EB248uMBlPb0QlXDIFqwxPScx?=
 =?us-ascii?Q?RNpgw0MfdTy4RFl/Or3J8G0L6+5OOUNN4F3VrBE4E4i0pjN86tYxYKMICzA2?=
 =?us-ascii?Q?aaWYhYezI6ae9mdVhHOrYLAQuByTTXNSywSW1z7TyzyqxX65YgEWzKi6QtFc?=
 =?us-ascii?Q?OWeTnyBfTreZ44CfDKo58aS9v5vIC+MI2GOAjJ7hnE7quEJA0kNcxa9efFO/?=
 =?us-ascii?Q?HhSKOgcc/iuM5K0i9rb/FaSEs2AT6hwRhQpjST1pfkmJAEACiKu9Zhhoyr7A?=
 =?us-ascii?Q?K46ay+Hi5VHm5Q7g6A7V+omAseeIPiLMLQ1bpzX3ZN/SHqth6RXYHLSaqges?=
 =?us-ascii?Q?nBCfRFQrMsh4tqG6q36sVHrjzO95zZcsnhDd7jrB?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b54211-cf84-4c49-dc7b-08dd923a1866
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:20:37.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcbuanuju9DftRg0xODpTt7W5YPqPQoda/o2Mvr6aI1/DNQnEdS5T/zuzJW0d7IyCzTN9jtlaKR2vlkZl+B4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

This settings are configurable in the device-tree:
  - for the input pins: input resistor, trigger edge, de-jitter filter
  - for the buffer: overwrite or inhibit mode for the FIFO

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/rtc/rtc-rv8803.c | 89 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index d4b1e04c97de..de28f7846dd7 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -113,6 +113,11 @@ enum evin_trigger {
 	both_edges = 0b10,
 };
 
+enum evin_buffer_mode {
+	inhibit = 0,
+	overwrite = 1,
+};
+
 struct cfg_val_txt {
 	char *txt;
 	u8 val;
@@ -163,6 +168,15 @@ static const u8 evin_flt_regs[] = {
 	RX8901_EVIN3_FLT
 };
 
+struct tamper_cfg {
+	struct {
+		u8 pull_resistor;
+		u8 trigger;
+		u8 filter;
+	} evin[NO_OF_EVIN];
+	u8 buffer_mode;
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
@@ -170,6 +184,7 @@ struct rv8803_data {
 	u8 ctrl;
 	u8 backup;
 	u8 alarm_invalid:1;
+	struct tamper_cfg tamper_cfg;
 	enum rv8803_type type;
 };
 
@@ -772,7 +787,10 @@ static ssize_t enable_store(struct device *dev, struct device_attribute *attr, c
 
 	/* 3. set EVENTx pull-up edge trigger and noise filter */
 	for (i = 0; i < NO_OF_EVIN; ++i) {
-		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
+		ret = rv8803_ts_event_write_evin(i, rv8803,
+						 rv8803->tamper_cfg.evin[i].pull_resistor,
+						 rv8803->tamper_cfg.evin[i].trigger,
+						 rv8803->tamper_cfg.evin[i].filter);
 		if (ret < 0)
 			return ret;
 	}
@@ -790,10 +808,11 @@ static ssize_t enable_store(struct device *dev, struct device_attribute *attr, c
 	}
 
 	/*
-	 * 5. set BUF1 inhibit and interrupt every 1 event
+	 * 5. set BUF1 inhibit/overwrite mode and interrupt every 1 event
 	 *    NOTE: BUF2-3 are not used in FIFO-mode
 	 */
-	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
+	reg_mask = 0x01 | FIELD_PREP(BIT(6), rv8803->tamper_cfg.buffer_mode);
+	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, reg_mask);
 	if (ret < 0)
 		return ret;
 
@@ -1091,6 +1110,66 @@ static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
 					 flags);
 }
 
+static int rx8900_tamper_init(struct rv8803_data *rv8803)
+{
+	int i;
+	int err;
+	u8 flags;
+	struct device_node *of_tamper;
+	struct i2c_client *client = rv8803->client;
+	struct tamper_cfg *tamper_cfg = &rv8803->tamper_cfg;
+
+	rv8803->tamper_cfg.buffer_mode = inhibit;
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		tamper_cfg->evin[i].pull_resistor = pull_up_1M;
+		tamper_cfg->evin[i].trigger = falling_edge;
+		tamper_cfg->evin[i].filter = 0;
+	}
+
+	of_tamper = of_get_child_by_name(client->dev.of_node, "tamper");
+	if (of_tamper) {
+		u32 node_value;
+
+		if (of_property_read_u32(of_tamper, "buffer-mode", &node_value))
+			tamper_cfg->buffer_mode = node_value;
+
+		for (i = 0; i < NO_OF_EVIN; ++i) {
+			char of_evin_name[10];
+			u32 evin_val[3];
+
+			snprintf(of_evin_name, sizeof(of_evin_name), "evin-%d", i + 1);
+			if (!of_property_read_u32_array(of_tamper, of_evin_name, evin_val,
+							ARRAY_SIZE(evin_val))) {
+				tamper_cfg->evin[i].pull_resistor = evin_val[0];
+				tamper_cfg->evin[i].trigger = evin_val[1];
+				tamper_cfg->evin[i].filter = evin_val[2];
+			}
+		}
+		of_node_put(of_tamper);
+	}
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		err = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+		if (err < 0)
+			return err;
+		flags = (err & ~BIT(6)) | FIELD_PREP(BIT(6), tamper_cfg->buffer_mode);
+		err = rv8803_write_reg(client, RX8901_BUF1_CFG1, flags);
+		if (err < 0)
+			return err;
+	}
+
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		err = rv8803_ts_event_write_evin(i, rv8803,
+						 tamper_cfg->evin[i].pull_resistor,
+						 tamper_cfg->evin[i].trigger,
+						 tamper_cfg->evin[i].filter);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /* configure registers with values different than the Power-On reset defaults */
 static int rv8803_regs_configure(struct rv8803_data *rv8803)
 {
@@ -1232,6 +1311,10 @@ static int rv8803_probe(struct i2c_client *client)
 		return err;
 
 	if (rv8803->type == rx_8901) {
+		err = rx8900_tamper_init(rv8803);
+		if (err)
+			return err;
+
 		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
 		if (err)
 			return err;
-- 
2.39.5


