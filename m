Return-Path: <linux-rtc+bounces-6556-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCYFFTHLDWqq3QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6556-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 16:54:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F85903F3
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 16:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FDBF3044238
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 14:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3053B3EEAD8;
	Wed, 20 May 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="f8Nk86zf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174FD3E9F8B;
	Wed, 20 May 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288568; cv=fail; b=LKIcEyNty5M+eWvht+uLtE9wJF+URZn0jcxNNjnNfpIHiayypjZ48XzghGDcXovVqqZ2gI1J3CmUefUgFZWBG1kU+lWUbJ8gAopf0SEE6LBfxxx4+ol2zKbsNz6ysNKyD4kHKDZhun15NbAIlWRCYWR5kbNKQ1kCGhe/T8lTz/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288568; c=relaxed/simple;
	bh=y5GXqcUEE/Bhx59KroqfuyDs703HrMujTvIO9zK9H4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NQ+i+rZK96ghivdCf2DwZHfI871MipnZaPmaQF3U4sTWtk5sZH/pAJeg1YOjZYWP1aGlIG3Ei1qx8MGWSlHqla8dk9d+vhHy5WDlTrnNFnKG0ZaVPU0+vv98zxU5xv4H288Rgsw5IzAupubiEdNDqwf0sAYyuUiS6j2PQIJvSDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=f8Nk86zf; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbTeHfJxoAl8htwp2rGdFCdYMZHLk0zVnCF3Vbml41FHxWGTF+YGWbQwsNczHk7RViPVCk7t17bcIlxxEroBJGZ4FLYwA8mpy0MF+b9CW+wt83DJWhT6XWKydgSJQgU02GAkp2oOGaNuUckco2LvpbL0OjESbweHTAHsjoYK5RHluIt9UJwsejWuwA+zsUhhOzF492Aua4OcS6O2NdOGPIf9OZDH86mONLSNU/LTKNKFtwtK/IJNJUE5uyI61hJRa80g+TH69yyQdPH8UE7DwMw33QhgjCy71ir48rEedslTW57Q/0ef2DtsS28iWWdvKk3rNxKC2/5oBfWb9Ujkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRaEb4NDwA5wEIo+zdNLvlUMqh6gHebeXM2Yfs/70QQ=;
 b=OEyWF1RCw93enmP67bcy5qEFHrSskTs95lEMN5ti0kWhsvsRZeZOzjYBoY61xLJTU5Q7+B2IJhtvgSDOW6ssmKxrwGroVk/0M9l/vOegJVfT/OqafP4iwpjOqkQ7dk8gHOY6kD9ICeNt6kmgUFJIJdGTqxr73nB/ipjZrcTxifdbADGTkKHFPTWinV5/0FUUFz5LgxXFEaaa4sbT3CNFYBXP36xhbyRsWNLKak4mGywpeJmLpArs8qNfil8z3Vq1lc9qbqJ3YLRR7jEgFxdy9ufxUccuXPzSO/LYOhWM4Vebzda4Jbt1nLMuGkBGWiGAUOLNhQFnZxZc+YQva1qSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRaEb4NDwA5wEIo+zdNLvlUMqh6gHebeXM2Yfs/70QQ=;
 b=f8Nk86zfoT4JYGxn31n3cYs7d1vUnwqjI/JW1Dstheed1uC2yPsF0pGXhXhKBSPZPFohOrIGrZsznczoMST/iTdhoYkJQHZYkGUQuypzJQC7JiuQz+hJB2+4Zac4jePkuo1HlQ9dv5zWKikkf552ERPhXFvw/mv9O1jFN/zQ0AE=
Received: from DUZPR01CA0322.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::20) by DBBPR02MB10483.eurprd02.prod.outlook.com
 (2603:10a6:10:52b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:49:20 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::e8) by DUZPR01CA0322.outlook.office365.com
 (2603:10a6:10:4ba::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:49:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 14:49:20 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 16:49:17 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 20 May 2026 16:49:17 +0200
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7563D306B;
	Wed, 20 May 2026 16:49:17 +0200 (CEST)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 6D5DD42098C9; Wed, 20 May 2026 16:49:17 +0200 (CEST)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Wed, 20 May 2026 16:48:55 +0200
Subject: [PATCH v2 3/3] rtc: ds1307: Add driver for Epson RX8901CE
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260520-ds1307-rx8901-add-v2-3-e069ea32e1db@axis.com>
References: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
In-Reply-To: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DBBPR02MB10483:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2858cc-d82e-4138-60b2-08deb67ef9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3F5fh+dCTCdSmEQrxvJwd3y4/FSZ7DKC+uycRKvFnmMPVdBY6o4zX2dja4Q3QRKFiCETXByQr17AmmMOuXAGtA2m8XNZQ0t+TreGOeqnCWw/FaklAU9t0X41RW4sfrXW8w7vxsIWhqV8cxJdoAWMPQoKdlk/CKLKWhIe6QFKPpJUqgw0ieUS4Fg19UovT417+mJ5Y9jxkX+flGIqBFH6EgoN5O/UO6j4teP8Ffy5MbuvtIob2oXOL2w/hOxFPcVoUfIe8+VfQDRD5fNb98JV03t37Y1Rn03KMN9GkAaoVr5dTLFwFCCMYSYz0NKn2RxEuTFlZ4aW8ZB14VaEh2itYREvYt4b4Uft9pNy65d01K7zf21Zf5f7U/laJMlWksT9+Qr/E3TpSJEBB8qbSO+QmNQCFIF8amE8TfyI5E6SaQk/riyxuPolaP4AAKqdhzf6PCKyfsLKjv9u9NJH6EIPDWYvyLtwH0Cx94lWJUW2ig+JkkoeyzRNjc3GiS7MtCSFx7V76R2NQpPg8q9WM6OSR58cK945B9QCSSqYNj4QaaqLgL/SNNupna8Px6+LpgVBPGMzVR86qDLJlkx9pyYvkL13X4x33ZEorMeJ/zJulfmGv5Yk5T7PTlr7vB9Gxo/C/WUsd8akS32V0Z4/gj5UooEj8slw4D/t42+Le1lNgJSFssvdM0xJnlOEQLnZG/PuVeTLSGZ/HfG9P0uGunFjHqvrhOIrxo5h2cfYkwSu1xU=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h+vxVRiISPBpnBOAXcarpQpUQAaLrtP/lD59sSObcqzsYndnAzaLNmAt7R/IX/ZXrrQSUJ13ACyu6ZQP3nfUrmQBL39s0D6L+oq0yu/beyyElb1goamYgmAh5ODn85/+Zvssuhknlk59D/xmiQo0wsnmo+He5sRUmegL0n5mLZjXDdkSXY2sOzoiomRGwBnOgdL608MyDPAt1227EZfU3sK70n+MwpAIhASdG9mYh0NB7Q+4gNg65J33siH8aZXa6qpwG32e2EsCqjmMoAFf0JODCmaRXBG9+A1CgkDwIwdlknoDdcEnzRdX5w82T0VAHGWfzkoG00TEWh4bbhU9h8cTyHSFAasq6p6ie58WvY62JyFL8oax3w6DAiSZzu1olG3NnGV/Z9oJ/cXH+OI1Asj4APNBsTDpfYBaRY9id6HXK2aRikxxwkGzdqEq7j2N
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:49:20.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2858cc-d82e-4138-60b2-08deb67ef9cd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10483
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6556-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,axis.com:email,axis.com:mid,axis.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axis.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF6F85903F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/rtc/rtc-ds1307.c | 216 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 207 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index bf42c250ea7d..23dd104aa2be 100644
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
@@ -307,7 +335,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	tmp = regs[DS1307_REG_HOUR] & 0x3f;
 	t->tm_hour = bcd2bin(tmp);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
 	else
 		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
@@ -358,7 +386,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
 	regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
 	else
 		regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
@@ -422,11 +450,132 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
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
@@ -533,7 +682,7 @@ static int ds1307_alarm_irq_enable(struct device *dev, unsigned int enabled)
 				  enabled ? DS1337_BIT_A1IE : 0);
 }
 
-static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
+static int do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 {
 	u8 setup = (diode) ? DS1307_TRICKLE_CHARGER_DIODE :
 		DS1307_TRICKLE_CHARGER_NO_DIODE;
@@ -558,7 +707,7 @@ static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
-static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
+static int do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 {
 	/* make sure that the backup battery is enabled */
 	u8 setup = RX8130_REG_CONTROL1_INIEN;
@@ -568,6 +717,26 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
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
+
+	return setup;
+}
+
 static irqreturn_t rx8130_irq(int irq, void *dev_id)
 {
 	struct ds1307           *ds1307 = dev_id;
@@ -960,6 +1129,14 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
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
@@ -1040,6 +1217,12 @@ static const struct chip_desc chips[last_ds_type] = {
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
@@ -1081,6 +1264,7 @@ static const struct i2c_device_id ds1307_id[] = {
 	{ "rx8025", rx_8025 },
 	{ "isl12057", ds_1337 },
 	{ "rx8130", rx_8130 },
+	{ "rx8901", rx_8901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1307_id);
@@ -1158,6 +1342,10 @@ static const struct of_device_id ds1307_of_match[] = {
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
@@ -1292,7 +1480,7 @@ static int ds1307_nvram_write(void *priv, unsigned int offset, void *val,
 
 /*----------------------------------------------------------------------*/
 
-static u8 ds1307_trickle_init(struct ds1307 *ds1307,
+static int ds1307_trickle_init(struct ds1307 *ds1307,
 			      const struct chip_desc *chip)
 {
 	u32 ohms, chargeable;
@@ -1745,7 +1933,7 @@ static int ds1307_probe(struct i2c_client *client)
 	bool			ds1307_can_wakeup_device = false;
 	unsigned char		regs[8];
 	struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
-	u8			trickle_charger_setup = 0;
+	int			trickle_charger_setup = 0;
 
 	ds1307 = devm_kzalloc(&client->dev, sizeof(struct ds1307), GFP_KERNEL);
 	if (!ds1307)
@@ -1781,12 +1969,15 @@ static int ds1307_probe(struct i2c_client *client)
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
@@ -1990,6 +2181,13 @@ static int ds1307_probe(struct i2c_client *client)
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

-- 
2.43.0


