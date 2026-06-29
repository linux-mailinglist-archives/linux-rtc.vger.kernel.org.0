Return-Path: <linux-rtc+bounces-6781-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A/gnKCeNQmp29gkAu9opvQ
	(envelope-from <linux-rtc+bounces-6781-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 17:20:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 359106DC925
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 17:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=axis.com header.s=selector1 header.b=ldR75fca;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6781-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6781-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=axis.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B44B3023307
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C97421F1A;
	Mon, 29 Jun 2026 15:13:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE242668E;
	Mon, 29 Jun 2026 15:13:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746037; cv=fail; b=TmmIkW9wYQ4ZnCl550D+lUG7l0kJusDl+5+SHhl+XY4yI/0ZJ6go849VidWvSc7xTql7PkamAwTF+j3cBayo/TuIaahB/jJ58Bf5fsIkr1jhgCLeXQ55UztvdxjTgvT7vWIIN1cF31hzjAR+wmxbFS8YkLGr+ar4QTEbGHoeBoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746037; c=relaxed/simple;
	bh=5E1mCqSikkXBEvsCQNIDEO924984ReYj/7hfA3LB2js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=rUYqN+wlRb4qo3mQ6f7TkzwL24Ej6GevbLt3Qn3/y0AmVqq2nwLczWVoh/X5ARw4EzNnSIUOd2KV9qrcYryrrFG3EAeaO9GkH2w21KrHcLJgXden2iG/74u46+/KdaBE39CNbMTC7WqOcyU3e6FGjOZze3XoTLJxayYIlwxF+tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ldR75fca; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlxTkwN8LkCq7KoNxhgElnAMrIm97Wu2EXA9wwkjgGp6IsjuAC5yUMVaPZ7WRw0gaiF4rYzVKfYCTSoEg8FLTImsJE3LVwWzfhS8UvknHfqFFbKtrhz1yixhoui9bI5dK6imYffT2OkyD1QhbvhhtcVq5RdqA906zf4ewm0gc7UhATWgVFQqgKOkVmNooyDTCIRQB8lZ7uYliRPjGJa5EmqK7bgCzhfqfdMHM0wGtuQBZagOxuu453bGVQ1Q2Dw1fQFwblLg3+YGdqWdaZeGqVueiDMCWn/lT4ZT6cvpJWM44J+xy7QTnch4v5XYxx7YzdvjOrTdRU1Hro9Tdh/j+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jVEI1UUtXNrg6VZNph+TuVIJuAsWNbvdeup9tNnpis=;
 b=K6c/NKZ0sBQtSzicEcyAYtwY98H3MUupj2WLlNPYW2OC/iU/zIrwV1El5Hj2CyzigP/k02j92DKudqzOkIaks/GFnYsU4Ie5QPPnOcXfue387Bx0yX9bVwwTayIA54I2CO1EqWLBL73m/FkY2e/XALicsuztfBnlhKlwO4azmQMNKEHa2o1TzsYDMYR+v3T/IpM/va5q9PwC5Ygn6PGoOhv2hfNYw1aAMUVM5TkhQRnzDXXZrURGikg9gdzdEr4ZK/cVuWy3w3fvU5cUjJtP3YjcKhDIV9zkVbMXe87R173FIjkGRJM8Qo/+MyJ7jxnalj2SR14SKUAlA//JB2cVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jVEI1UUtXNrg6VZNph+TuVIJuAsWNbvdeup9tNnpis=;
 b=ldR75fcaavUHmxWoS3RfRWRCkL6JHjFK9MWxe0EmM7C8vrlePZ8PS7HXl8wM7Z6RRGiT7IICpWBcM7TBkkxT68+nesDm3JW1kF0K/Vc1TdMCXkkgSOEC6+2eNq7D7ZFd9s9uukZCv1aJOE/isqJme0xOdhiuCS5uFks2FS15pAk=
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by PA4PR02MB8193.eurprd02.prod.outlook.com
 (2603:10a6:102:272::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:13:43 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::9a) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:13:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 15:13:43 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 29 Jun
 2026 17:13:40 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 29 Jun
 2026 17:13:40 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 29 Jun 2026 17:13:40 +0200
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3E050D6F;
	Mon, 29 Jun 2026 17:13:40 +0200 (CEST)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 2E48F4211174; Mon, 29 Jun 2026 17:13:40 +0200 (CEST)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Mon, 29 Jun 2026 17:13:25 +0200
Subject: [PATCH v3] rtc: ds1307: Add driver for Epson RX8901CE
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-ds1307-rx8901-add-v3-1-302dc3cbb71e@axis.com>
X-B4-Tracking: v=1; b=H4sIAJSLQmoC/23NTQ6CMBCG4auQrq2ZHwHrynsYF4UO0oViWtNgC
 He3YExcsHy/ZJ6ZVJTgJapTMakgyUc/PHLwrlBtbx830d7lVgRUIlKlXUSGWofxaAC1dU5b6AR
 rBsPCKt89g3R+XM3LNXfv42sI7/VFwmX9aoRmQ0uoQTfIHR8qacTw2Y4+7tvhrhYs0Q+ooCTYA
 igDApURyyTomj9gnucPNMKXBfIAAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>, Fredrik M Olsson
	<fredrik.m.olsson@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|PA4PR02MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cba2b29-a4ed-41ac-2185-08ded5f10255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|13003099007|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	0useR17AsK7tY9XFClxv6anxapVwkMjysJQw89/s8wtcLzVOD1OvHL3Rs282nY8ncuLWkYQ0rXZnSYNk5L2fMmr53Oovekx9BeRKuQIKD6tTUKuu05Zox/N7DpoY6KdYWKbCSpMcFsjNmZbjTqf7kmQ8Kvy2EkwcaJBfFKaU2O52/9CP+7Jyz+z8MzA3EU2Lf8itAGPix8ntJywKJ5g1oGSb603apV0dDmPV1gI1oMRdH1uk3mSXQn31Kmj+tYACgP0n8jRbRo4GpNvaVM+j0ri5RpAu+euwnNEq5NgCHwc7WTYg/ODx6vuyt6VYjxb85kChvwkoQeQA79ID7ZBlAE4GodmnxXucD63BfhJn1DbDXVbYZAkGjnnsiPpYyPSSk5WPLXO472P8QjlIqKXoYPYc2tDI+jv8VcOOgVDOF+hjJzIdC3iQ/MEVbIuskVVXpQCqkfBJz9RTB4UMfF5yAA1uGTsF0L+Yc0d/gss3eIBYqIhaUIwDcJdfTN5NU2hCOVjdQiGM4Vrk9mxh9fdQWoXc0q4PgmzzWa+jbBSV4AjI0YmKD9zCC0O38rFg4+06C10cyMz2obVUGGynZzX72gvA96Aw07fTO00zvRuLU9WmN3+xa5El6Mhm9memPLSTuerADI4T50EoIaXlJDwEpb6XNvZI09Y0rbJi6pR8ItU=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(13003099007)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Tp9SkQxLUaz418dw4aOsNDxhCQRg7/kABRRHKAr+BxQltS43rFb5n4+/JIthUUka+6OSlnQriOU+Qxcx+CT36o4D0VuerUZ5fZVCpKV8oT/9+tVI8xHLQsANj1PWrSte9H//xziwvpD2l03/I0jmqAXJIcB6XMKnV4L44gKY3gtcjRRRYS4PKGAnbXBy/oGVUo3z2a6BVOn6GJ3RBmz/h0PFNdsHLW+cw3cWj1/huyiKv7ZXf5SpP8PwTOS5+y6zzId2uY7nTAdLElShlCp7neoZKr8c6rjw/exd8y/dEV3vLK0uFb/ojF++NFupNrdJLpwSFaE24ksTHj1QdoFbQin7OUuxdaegl7gh7vonHiK/ndakjmhpigdUdmIsUSuyJJ41uJ59G6FaJ6J+LbaEDTp+xvEbAsXnahl4Zto7SioHpFNb3p9l/aZI851Js8W
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:13:43.5655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cba2b29-a4ed-41ac-2185-08ded5f10255
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6781-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,axis.com:dkim,axis.com:email,axis.com:mid,axis.com:from_mime,epsondevice.com:url];
	FORGED_SENDER(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@axis.com,m:fredrik.m.olsson@axis.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[axis.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 359106DC925

Adds support for:
- Reading and writing time to/from the RTC.
- Changing Backup Switch Mode (BSM) to DISABLED/DIRECT/LEVEL using the
  RTC_PARAM_SET ioctl.
- Optionally enabling battery charging.
- Reading the battery voltage low status using the RTC_VL_READ ioctl
  (only supported in LEVEL BSM), which also reports invalid time
  information if the VLF flag is set.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
Add basic support for the Epson RX8901CE RTC.
Datasheet: https://download.epsondevice.com/td/pdf/app/RX8901CE_en.pdf

Also includes a bug fix for an issue with reading the weekday from the
RTC which affects both the existing rx8130 and this rx8901 driver.
---
Changes in v3:
- Clear CHGEN when trickle battery charging is disabled.
- Link to v2: https://lore.kernel.org/r/20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com

Changes in v2:
- Squashed the Voltage Low status patch into the driver patch
- Switch from dev_err to dev_dbg
- Implement Backup Switch Mode (BSM) ioctl instead of hard coding
  switching mode.
- Change the prototype for the do_trickle_setup function pointer in
  order to make it possible to propagate error codes from the added
  PWSW_CFG register read operation. This read operation is added so not
  to override previously set register fields.
- Link to v1: https://lore.kernel.org/r/20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com
---
 drivers/rtc/rtc-ds1307.c | 218 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 209 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 0707ded5368b..488fd1d8d8e3 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kstrtox.h>
@@ -48,6 +49,7 @@ enum ds_type {
 	mcp794xx,
 	rx_8025,
 	rx_8130,
+	rx_8901,
 	last_ds_type /* always last */
 	/* rs5c372 too?  different address... */
 };
@@ -129,6 +131,18 @@ enum ds_type {
 #define RX8130_REG_CONTROL1_INIEN	BIT(4)
 #define RX8130_REG_CONTROL1_CHGEN	BIT(5)
 
+#define RX8901_REG_INTF			0x0e
+#define RX8901_REG_INTF_VLF		BIT(1)
+#define RX8901_REG_PWSW_CFG		0x37
+#define RX8901_REG_PWSW_CFG_SWSEL	GENMASK(3, 2)
+#define RX8901_REG_PWSW_CFG_VBATLDETEN	BIT(4)
+#define RX8901_REG_PWSW_CFG_INIEN	BIT(6)
+#define RX8901_REG_PWSW_CFG_CHGEN	BIT(7)
+#define RX8901_REG_BUF_INTF		0x46
+#define RX8901_REG_BUF_INTF_VBATLF	BIT(3)
+#define RX8901_SWSEL_PRIMARY_BACKUP	0x1
+#define RX8901_SWSEL_PRIMARY		0x2
+
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
 #	define MCP794XX_BIT_ALM1_EN	0x20
@@ -192,8 +206,8 @@ struct chip_desc {
 	irq_handler_t		irq_handler;
 	const struct rtc_class_ops *rtc_ops;
 	u16			trickle_charger_reg;
-	u8			(*do_trickle_setup)(struct ds1307 *, u32,
-						    bool);
+	int			(*do_trickle_setup)(struct ds1307 *ds1307, u32 ohms,
+						    bool diode);
 	/* Does the RTC require trickle-resistor-ohms to select the value of
 	 * the resistor between Vcc and Vbackup?
 	 */
@@ -216,6 +230,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 
 	if (ds1307->type == rx_8130) {
 		unsigned int regflag;
+
 		ret = regmap_read(ds1307->regmap, RX8130_REG_FLAG, &regflag);
 		if (ret) {
 			dev_err(dev, "%s error %d\n", "read", ret);
@@ -226,6 +241,19 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 			dev_warn_once(dev, "oscillator failed, set time!\n");
 			return -EINVAL;
 		}
+	} else if (ds1307->type == rx_8901) {
+		unsigned int regflag;
+
+		ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
+		if (ret) {
+			dev_dbg(dev, "%s error %d\n", "read", ret);
+			return ret;
+		}
+
+		if (regflag & RX8901_REG_INTF_VLF) {
+			dev_warn_once(dev, "oscillator failed, set time!\n");
+			return -EINVAL;
+		}
 	}
 
 	/* read the RTC date and time registers all at once */
@@ -310,7 +338,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	tmp = regs[DS1307_REG_HOUR] & 0x3f;
 	t->tm_hour = bcd2bin(tmp);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
 	else
 		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
@@ -361,7 +389,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
 	regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
 	else
 		regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
@@ -428,11 +456,132 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 			dev_err(dev, "%s error %d\n", "write", result);
 			return result;
 		}
+	} else if (ds1307->type == rx_8901) {
+		/*
+		 * clear Voltage Loss Flag as data is available now (writing 1
+		 * to the other bits in the INTF register has no effect)
+		 */
+		result = regmap_write(ds1307->regmap, RX8901_REG_INTF,
+				      0xff ^ RX8901_REG_INTF_VLF);
+		if (result) {
+			dev_dbg(dev, "%s error %d\n", "write", result);
+			return result;
+		}
 	}
 
 	return 0;
 }
 
+#ifdef CONFIG_RTC_INTF_DEV
+static int rx8901_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct ds1307 *ds1307 = dev_get_drvdata(dev);
+	unsigned int regflag, tmp = 0;
+	int ret = 0;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
+		if (ret)
+			return ret;
+
+		if (regflag & RX8901_REG_INTF_VLF)
+			tmp |= RTC_VL_DATA_INVALID;
+
+		ret = regmap_read(ds1307->regmap, RX8901_REG_BUF_INTF, &regflag);
+		if (ret)
+			return ret;
+
+		if (regflag & RX8901_REG_BUF_INTF_VBATLF)
+			tmp |= RTC_VL_BACKUP_LOW;
+
+		return put_user(tmp, (unsigned int __user *)arg);
+	default:
+		return -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
+static int rx8901_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct ds1307 *ds1307 = dev_get_drvdata(dev);
+	unsigned int regflag;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(ds1307->regmap, RX8901_REG_PWSW_CFG, &regflag);
+		if (ret)
+			return ret;
+
+		if (regflag & RX8901_REG_PWSW_CFG_INIEN) {
+			param->uvalue = RTC_BSM_LEVEL;
+		} else {
+			unsigned int swsel = FIELD_GET(RX8901_REG_PWSW_CFG_SWSEL, regflag);
+
+			if (swsel == RX8901_SWSEL_PRIMARY_BACKUP)
+				param->uvalue = RTC_BSM_DIRECT;
+			else
+				param->uvalue = RTC_BSM_DISABLED;
+		}
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	return ret;
+}
+
+static int rx8901_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct ds1307 *ds1307 = dev_get_drvdata(dev);
+	unsigned int regmask;
+	unsigned int regval;
+	int ret;
+
+	switch (param->param) {
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+
+		switch (param->uvalue) {
+		case RTC_BSM_DISABLED:
+			/* Only main power supply is used */
+			regmask = RX8901_REG_PWSW_CFG_INIEN |
+				  RX8901_REG_PWSW_CFG_SWSEL;
+			regval = FIELD_PREP(RX8901_REG_PWSW_CFG_SWSEL,
+					    RX8901_SWSEL_PRIMARY) |
+				 FIELD_PREP(RX8901_REG_PWSW_CFG_INIEN, 0);
+			break;
+		case RTC_BSM_DIRECT:
+			/* Main and battery power supply is put in parallel (default) */
+			regmask = RX8901_REG_PWSW_CFG_INIEN |
+				  RX8901_REG_PWSW_CFG_SWSEL;
+			regval = FIELD_PREP(RX8901_REG_PWSW_CFG_SWSEL,
+					    RX8901_SWSEL_PRIMARY_BACKUP) |
+				 FIELD_PREP(RX8901_REG_PWSW_CFG_INIEN, 0);
+			break;
+		case RTC_BSM_LEVEL:
+			/* Enable auto power switching between main and backup power supply */
+			regmask = RX8901_REG_PWSW_CFG_INIEN;
+			regval = FIELD_PREP(RX8901_REG_PWSW_CFG_INIEN, 1);
+			break;
+		default:
+			return -EINVAL;
+		}
+		ret = regmap_update_bits(ds1307->regmap, RX8901_REG_PWSW_CFG, regmask, regval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+#else
+#define rx8901_ioctl NULL
+#define rx8901_param_get NULL
+#define rx8901_param_set NULL
+#endif
+
 static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct ds1307		*ds1307 = dev_get_drvdata(dev);
@@ -539,7 +688,7 @@ static int ds1307_alarm_irq_enable(struct device *dev, unsigned int enabled)
 				  enabled ? DS1337_BIT_A1IE : 0);
 }
 
-static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
+static int do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 {
 	u8 setup = (diode) ? DS1307_TRICKLE_CHARGER_DIODE :
 		DS1307_TRICKLE_CHARGER_NO_DIODE;
@@ -564,7 +713,7 @@ static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
-static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
+static int do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 {
 	/* make sure that the backup battery is enabled */
 	u8 setup = RX8130_REG_CONTROL1_INIEN;
@@ -574,6 +723,28 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
+static int do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __always_unused, bool diode)
+{
+	int ret;
+	unsigned int setup;
+
+	ret = regmap_read(ds1307->regmap, RX8901_REG_PWSW_CFG, &setup);
+	if (ret) {
+		dev_err(ds1307->dev, "Failed to read PWSW_CFG register\n");
+		return ret;
+	}
+
+	/* Enable low battery voltage detection */
+	setup |= RX8901_REG_PWSW_CFG_VBATLDETEN;
+
+	if (diode)
+		setup |= RX8901_REG_PWSW_CFG_CHGEN;
+	else
+		setup &= ~RX8901_REG_PWSW_CFG_CHGEN;
+
+	return setup;
+}
+
 static irqreturn_t rx8130_irq(int irq, void *dev_id)
 {
 	struct ds1307           *ds1307 = dev_id;
@@ -966,6 +1137,14 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
 	.alarm_irq_enable = rx8130_alarm_irq_enable,
 };
 
+static const struct rtc_class_ops rx8901_rtc_ops = {
+	.read_time      = ds1307_get_time,
+	.set_time       = ds1307_set_time,
+	.ioctl          = rx8901_ioctl,
+	.param_get      = rx8901_param_get,
+	.param_set      = rx8901_param_set,
+};
+
 static const struct rtc_class_ops mcp794xx_rtc_ops = {
 	.read_time      = ds1307_get_time,
 	.set_time       = ds1307_set_time,
@@ -1046,6 +1225,12 @@ static const struct chip_desc chips[last_ds_type] = {
 		.trickle_charger_reg = RX8130_REG_CONTROL1,
 		.do_trickle_setup = &do_trickle_setup_rx8130,
 	},
+	[rx_8901] = {
+		.offset		= 0x0,
+		.rtc_ops = &rx8901_rtc_ops,
+		.trickle_charger_reg = RX8901_REG_PWSW_CFG,
+		.do_trickle_setup = &do_trickle_setup_rx8901,
+	},
 	[m41t0] = {
 		.rtc_ops	= &m41txx_rtc_ops,
 	},
@@ -1087,6 +1272,7 @@ static const struct i2c_device_id ds1307_id[] = {
 	{ .name = "rx8025", .driver_data = rx_8025 },
 	{ .name = "isl12057", .driver_data = ds_1337 },
 	{ .name = "rx8130", .driver_data = rx_8130 },
+	{ .name = "rx8901", .driver_data = rx_8901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1307_id);
@@ -1164,6 +1350,10 @@ static const struct of_device_id ds1307_of_match[] = {
 		.compatible = "epson,rx8130",
 		.data = (void *)rx_8130
 	},
+	{
+		.compatible = "epson,rx8901",
+		.data = (void *)rx_8901
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ds1307_of_match);
@@ -1298,7 +1488,7 @@ static int ds1307_nvram_write(void *priv, unsigned int offset, void *val,
 
 /*----------------------------------------------------------------------*/
 
-static u8 ds1307_trickle_init(struct ds1307 *ds1307,
+static int ds1307_trickle_init(struct ds1307 *ds1307,
 			      const struct chip_desc *chip)
 {
 	u32 ohms, chargeable;
@@ -1886,7 +2076,7 @@ static int ds1307_probe(struct i2c_client *client)
 	bool			ds1307_can_wakeup_device = false;
 	unsigned char		regs[8];
 	struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
-	u8			trickle_charger_setup = 0;
+	int			trickle_charger_setup = 0;
 
 	ds1307 = devm_kzalloc(&client->dev, sizeof(struct ds1307), GFP_KERNEL);
 	if (!ds1307)
@@ -1922,12 +2112,15 @@ static int ds1307_probe(struct i2c_client *client)
 	else if (pdata->trickle_charger_setup)
 		trickle_charger_setup = pdata->trickle_charger_setup;
 
+	if (trickle_charger_setup < 0)
+		return trickle_charger_setup;
+
 	if (trickle_charger_setup && chip->trickle_charger_reg) {
 		dev_dbg(ds1307->dev,
 			"writing trickle charger info 0x%x to 0x%x\n",
 			trickle_charger_setup, chip->trickle_charger_reg);
 		regmap_write(ds1307->regmap, chip->trickle_charger_reg,
-			     trickle_charger_setup);
+			     (u8)trickle_charger_setup);
 	}
 
 /*
@@ -2131,6 +2324,13 @@ static int ds1307_probe(struct i2c_client *client)
 		}
 	}
 
+	switch (ds1307->type) {
+	case rx_8901:
+		set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, ds1307->rtc->features);
+		break;
+	default:
+	}
+
 	ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
 	err = ds1307_add_frequency_test(ds1307);
 	if (err)

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251126-ds1307-rx8901-add-a0fe173093e3

Best regards,
-- 
Fredrik M Olsson <fredrik.m.olsson@axis.com>


