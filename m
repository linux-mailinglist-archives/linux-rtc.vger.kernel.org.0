Return-Path: <linux-rtc+bounces-5594-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AECCFB5E
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 13:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1CEF300E46A
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 12:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD90303A1A;
	Fri, 19 Dec 2025 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ZuhsP/Gs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A6A2F12CA;
	Fri, 19 Dec 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146261; cv=fail; b=ogMvVX6V2Jn2USP43BY2o76TXYVz1WW9KBJdnuJLOmvzuSdmqflxc0RtFL67SrN0/b/42KHCx1y0NdKh/5skNemzXbcgumwtjpy0i71TFJRsIaSadW9s77Lj+D2XiZn5EPk5HZwXIvlrAwiXY21xpjUg4dvAxn/QjKHLNyr0mfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146261; c=relaxed/simple;
	bh=uQVyG4gYQ2d0whg0B2taSrPV3GzNsAiJwHwkLfbtcI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UpngBE9Cke1entS0H+oiV3Sr9l5HrFvrv8Ri4k3JgndrZByQy3h+H9Pgsr9DSgnPGp/dBc83aGscxJJmYogCPyeb3KXwT8/9b/JCHPLdmXQBfW7ZPqiPvKtWSZketF7vhbsMKvvMy/vDsfLS5p8rA/Xuh0zAj8BHIi1gfEWf/WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ZuhsP/Gs; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLPVv+67g751/HNu23j0CgCbdJlXrUYX/zkzj10WdNrTHEJCcfn+dMlHul7pwUcpdLNJEtR+yzyiyNtsZvMVm0AnGH8s5DJFX2tENrLoQOfoxkbEgRAVbzX4To46M9tcXU0lax/97DKE2BmUp3y8GD6/srdTWoAhLzkZ9m3XCF/u/Buy4WnXFqghUX73HV2ySrZGWCzLAPtXVG128tz8znp6rc+Dzt8LVWV9DXzgH2d9EwFXDRhMQKgl6G6evE+nKnupjoPdR//tOMw9xXFKs7wGcBlxNE8OKa+qQTFbF/9ZRrGhY41yFIFGtOyiS9wKL3ODhI7ULoSzZPrTU5dDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvaZQBJUPnTgvdqpjBUNfN3wLSesP19/+3IPtFy0/pg=;
 b=TMITlZZ+iyFrXPpM+Lby+CPDqenuTlC+Xeq14ZNDZCiRoGap9CaqJ3N/jGP2L9bqdw+bvH0PkfM+iFAh9gsvwXxsK+R/5ivGYsKNbNVh0Y1Q2exqYZs7ElRG/T6LANbdFuaZn84opR1g3kumCK8fLQ+GGNg0JYY2RuoVftotXdQnr8j3Bl0bl3wK6ZilBpragUSqhSctXvuyAcK95xqaIb+pEogMHaAT2hAoOgtbmG5l6ARpaB3SXN4ZjLZ2GzJIRgd93pD2sZwkGwP5B7uiwUuqavp/v155aAgYdqA2SeA8e9cp5koqd9NSPezaNNgSBeW2lNpCBgkeiz3cblkOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvaZQBJUPnTgvdqpjBUNfN3wLSesP19/+3IPtFy0/pg=;
 b=ZuhsP/GsYF2LjvxUHMqb6nOxCAVrmNxIQHKKFwoZhwAXqeYankNQPlFGkSxZbKZx9R3ylTggHvmQu5G6m/tunvaxOi3mVM/cMGhacvRvDCpR8wR/IEV6gR1hiRgyxV2U8vzr833Sgjw85mC2RmbeifonEIjP0mBz0WWA9ggtSnQ=
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by GV2PR02MB9376.eurprd02.prod.outlook.com (2603:10a6:150:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 12:10:54 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::19) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:10:54 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:10:52 +0100
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 954C83045;
	Fri, 19 Dec 2025 13:10:52 +0100 (CET)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 92FDC40B71E1; Fri, 19 Dec 2025 13:10:52 +0100 (CET)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Fri, 19 Dec 2025 13:10:38 +0100
Subject: [PATCH 4/4] rtc: ds1307: Add support for reading RX8901CE battery
 VL status
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GV2PR02MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: b25c1473-3ce8-4cce-f085-08de3ef7a911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1l5MmJtZkgzTVg1RCs3SWc4RnBFYnRFeU9iWnhCcVVBMkx1ZHdGRkJCNFM0?=
 =?utf-8?B?M21UUXY2d2hoc3lFczIrYlZoUmtDQ3FwRkFZS3YyblVxeFlsa1F1RkhpY1ph?=
 =?utf-8?B?NFJhSSswci9sSStGeGFYanhoZlBMaU0rY3p2UHZURU16aCtjRnd6bHQ4MGsr?=
 =?utf-8?B?K29Dem9GYkprUXJJSEJ3SkVHaW1VU3BwWVF5UFFlSFducXFuWTVXcXpPSlIv?=
 =?utf-8?B?aGpHVHh2dXdyUlNxc2dpd3orcTU2WjRRclJTbGowSmRMTExFc1pxbk1UdjBX?=
 =?utf-8?B?SkpiblczL0EzWFdVdGJSQTJiNEVwL1kzKzNxL3ZyTGsyTzIvY3JKZ1lUamF5?=
 =?utf-8?B?cS8vZnJwOUFLeFFPYzRjUDdYWEpPb09yTG13Y3lkM0RWYmdaM3B6alBXYW1D?=
 =?utf-8?B?aFBrUGJWdS9aSXJhbFREMCtLUW5aaXNVQWdEZWlSeGkwTFdqalZZRWZDYnB2?=
 =?utf-8?B?c1FyMzZPRmc3QjRNWnpUR2JROGxzUGIwMkVaWUVYZXBwVjVpcExpTElxTXlL?=
 =?utf-8?B?bWxXKzc4WWpBNG43clY1VUhpQXZyVGNsc3NrbWFsc1Y5VERWZjJrRkQ2ejlz?=
 =?utf-8?B?OE5hbnFaUG5pV0lnbGM4RE5QYVFKSjZETCtaUTNDR3d0aGNPaEx5b1RHNUEy?=
 =?utf-8?B?azJORGtLNXlZeitqMnNxVmQ5aFFBYUVmVXV0c2FRWGRDN3JuWWQ2Vmxlc0I1?=
 =?utf-8?B?LzBTRHZJOStUS0trUUZYKzdWbzhMUWFOVHpqaW9QN2RMVHJxclhDNmptWVk1?=
 =?utf-8?B?Y2hhekpjcXlZN3lQZDIzYkNScTVSTmdSanhOUWN4WVBZd1NVWjFia25SVjdF?=
 =?utf-8?B?UzdrL044QmZKK0ZGVWZNZkcyQ3AyYm1IN0JQTVVUS04rSTZBSkRQVTVkN21s?=
 =?utf-8?B?WGFINDUzZGhYakRzd2Y3ZFRiVGJVWGltbUdrUEF3NU5WdkFzQkdjN1N6TUlU?=
 =?utf-8?B?M29nZ2V6cFpvUTFZV3Y2QlBxQkdZaFNHa3pKazFJMjdoUjNhRzQySGlXbWRw?=
 =?utf-8?B?VzRVRmJiTlVZd242cWZodUJTSVV4VGVVMmZlVGVWS09FSHYyeGJ3WUh2ak1V?=
 =?utf-8?B?Ny9saFVWSzRValE0MVAvYlU4RmRqcHdyOERiSmxPT1hsNk5OSW1GdWVaZ2Uz?=
 =?utf-8?B?VFB2NytIVkg1N0NuUmFwOXZwSkZvYjZQbVJ4ZFBTQ290UUcxTlFWL1pEczNX?=
 =?utf-8?B?bVMreDAwRHluUVYwRmFWK05wd29BV1hTeExlcGU2MlZvSFBLckdxcFM2K0Fs?=
 =?utf-8?B?b242RzFyMmxSUWJBNFFyVkhxL3NYR0R3eTBOZUtTUEJSbE5oeDZHTWF4UXV6?=
 =?utf-8?B?Y3pPREVNbm1SbmtKWk53RVA5aXNyWU5MNTlSR04yTHVCOE53VmsrcFZlWUlW?=
 =?utf-8?B?L3lHN0ZONDlsN2t5WmZXck4vdm5tdUZJQzNWSzRFbUI4SWlad25Ldjg3bmRt?=
 =?utf-8?B?T21ad29CdkhnNGpnRXRYYkJtVVdkYlBNRGVkTm1LN0tPOUgzYStWQzZUQS9V?=
 =?utf-8?B?ekNpSnpXVnk4cUprWmtuQkhNZmxBdlBDUURUYnlma0x5NklQelpLWTRmcG5S?=
 =?utf-8?B?VDFmWWQ0MjdVZTdjbFczRlNIKzlzcURVZEdPOU8rYTd6Vkp3RW5hUndrYVN1?=
 =?utf-8?B?VkIybGhxdnRkRU1BRlZBckNXdi9sR01CcittcE55UUZnYmdZckpMbDkrRUZ2?=
 =?utf-8?B?RW9vSjJvOTdOUGl0Ny94WWZ6WlExNTZJdzFCWGFPTkx3c3JSUW1mL1VNS2JL?=
 =?utf-8?B?UUJZTk9CL2s1WHZoTGpTZWN2ZkVZeWx4bTJRd1V4REFQUTFyR1VyclgvWTBV?=
 =?utf-8?B?K2t0azd0RHZidE44dkZzNVlVYjZUWTlybkQ5V29zSXNiNHp0UTBTQXZhd0lL?=
 =?utf-8?B?dkdUdnQ5ZjZiYUtMNE90ekFIRm42OW1FMjExZFJ6aTQyZnl0anFqY1dJVW5l?=
 =?utf-8?B?bi9lblBENldzZnZvTnQyTkpsK3EvOGxqNEN0eHJFZUlsVzNrOEdSWDVJMmZ4?=
 =?utf-8?B?TDBWTUJjZlVzRDJMVE4rem9GVkhER25TK3ZscmkrcWw3QnE0N2xpYzZXbkRE?=
 =?utf-8?B?YUJUM2FwM2lrQ21pRjlhdEZNMU02SmRCaHR3bFk3dnhFNUovdXFhUEsyTVpn?=
 =?utf-8?Q?QsCU=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:10:54.7103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25c1473-3ce8-4cce-f085-08de3ef7a911
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9376

Adds support for:
- Reading the battery voltage low status using the RTC_VL_READ ioctl,
  which also reports invalid time information if the VLF flag is set.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 drivers/rtc/rtc-ds1307.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 99d95e520108..ca062ed0c867 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -133,8 +133,11 @@ enum ds_type {
 #define RX8901_REG_INTF			0x0e
 #define RX8901_REG_INTF_VLF		BIT(1)
 #define RX8901_REG_PWSW_CFG		0x37
+#define RX8901_REG_PWSW_CFG_VBATLDETEN	BIT(4)
 #define RX8901_REG_PWSW_CFG_INIEN	BIT(6)
 #define RX8901_REG_PWSW_CFG_CHGEN	BIT(7)
+#define RX8901_REG_BUF_INTF		0x46
+#define RX8901_REG_BUF_INTF_VBATLF	BIT(3)
 
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
@@ -458,6 +461,39 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
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
+#else
+#define rx8901_ioctl NULL
+#endif
+
 static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct ds1307		*ds1307 = dev_get_drvdata(dev);
@@ -599,10 +635,13 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
-static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
+static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __always_unused, bool diode)
 {
-	/* make sure that the backup battery is enabled */
-	u8 setup = RX8901_REG_PWSW_CFG_INIEN;
+	/*
+	 * make sure that the backup battery is enabled and that battery
+	 * voltage detection is performed
+	 */
+	u8 setup = RX8901_REG_PWSW_CFG_INIEN | RX8901_REG_PWSW_CFG_VBATLDETEN;
 
 	if (diode)
 		setup |= RX8901_REG_PWSW_CFG_CHGEN;
@@ -1005,6 +1044,7 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
 static const struct rtc_class_ops rx8901_rtc_ops = {
 	.read_time      = ds1307_get_time,
 	.set_time       = ds1307_set_time,
+	.ioctl          = rx8901_ioctl,
 };
 
 static const struct rtc_class_ops mcp794xx_rtc_ops = {

-- 
2.43.0


