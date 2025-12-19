Return-Path: <linux-rtc+bounces-5595-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D219ECCFB76
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 13:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD66300E004
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Dec 2025 12:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE87E3396E4;
	Fri, 19 Dec 2025 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="gv1n3Fqi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E431985C;
	Fri, 19 Dec 2025 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146261; cv=fail; b=AxCiWVoJs2cdGrnrHzv+WFaj32XWg6zXYrOVpHjMftyeHu5lJNVw45hNlHpJ0wKLQGV+PKeWvfkCQhaig8nJ4/8SDg0q4rhzeDTMzDjkh6/n4yfDeuaCqPLLAaGpzSkaDf+B9K6fX5ZeHUF/qNGmyIRVfKU2Eu99d3iS+3YBAyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146261; c=relaxed/simple;
	bh=3f35SMYdGJr3GE/asP8cetwvqaPf/cK7bXCMe4r69qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xxf+FLRu8ayzcdcszJp28Yq7aMR3zs6MB7DaGW6RxjeUdfSTXz0eck+tjOKlVuCJfyyY6Cy3NDUiNIAsSlwGzBUpklED+59fUgCUsbedwE1gEWX2UZzmj1MMV0tHu13ncJWtCMtkyhpAZHltKaGyaXP25bsN/bzC5gXM9+QOiNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=gv1n3Fqi; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p78ssxDxIMJbJJFx1rXjnER7klXxBO3PSnIpzPPaB2+/FoNw0ME4BF6ZkGk9EfmElff3daA8vgk2RmJuWqNvb0pJX7vWvBOz1kQGQZoqcCumWr6J7HcP+o0WDm0JnLrIcKP5Zgh+cz6WL/14m+eYHbxQHRKaOnFT9GoCqAI0+I0JrwaOMUe/RpNvwUuiH7ykqrUQaR2mrWGyrnugORVnRZ/sM//6R0wIseuHE+6aF/QvSXz6VdmAcGInp7hKCKeu1DrxmR1/w8gUjCRxUULu5uan12DHbGpn9XSmpfal0tebxzAbtifkt4NFwciVoQjI/XGUCCDy++hHAB2pVwrXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DLCyKgTr1P2dvDoVyVBgv9W5qh2sDpHZFH/E7cd6Ag=;
 b=gIVSx+99sGXiYaSBQAHH82vEnln0hhK027mOkwwg6x6Z+Oe//6tAbAUNGeGXqvq0+3D5jm2Y+uo7PGVJQsQlp7VUa00b8dwFLA6z/jcDsonyrv2qELHYm3NT9jEu2CGM87PesUebn2aTacNdT4GRK6E5zuGA9kfVZ5RLkdWlE5M1QOMY8HnPZDjEn0thd3cM4gUIPISicUk0wnY932QHtQljOft07an3ajOk5Z8lO1/WLtFCxYLU8x0f90ZI4fn4Qhbg+tNkULgIdDfUuW3lGGgDtBzGAArd8/AOpWECzeGZL+3FYSVPDJoOpfvU8EB41uj/E0D8RD+kdTOij5ERBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DLCyKgTr1P2dvDoVyVBgv9W5qh2sDpHZFH/E7cd6Ag=;
 b=gv1n3FqiP34pCWRxw6it1Ol5jT5sXyJ99FRCk6EsfhnKc2OPfKWMPn+ijl9DLWvNEIhRF6vupQ2yCW8nGiFi1/Ay20Sy+1B7jP97rMn6BOBXK7Aas0XMPmLhcdWKawctGeq0t0vvMQpqDZ9EcOcoYykkoyneHbUdDAq5oQECky0=
Received: from AS4P189CA0039.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::16)
 by PAWPR02MB10238.eurprd02.prod.outlook.com (2603:10a6:102:367::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:10:54 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::36) by AS4P189CA0039.outlook.office365.com
 (2603:10a6:20b:5dd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:10:53 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 19 Dec
 2025 13:10:52 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:10:52 +0100
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 944814475;
	Fri, 19 Dec 2025 13:10:52 +0100 (CET)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 91BAF40B71D7; Fri, 19 Dec 2025 13:10:52 +0100 (CET)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Fri, 19 Dec 2025 13:10:37 +0100
Subject: [PATCH 3/4] rtc: ds1307: Add Driver for Epson RX8901CE
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|PAWPR02MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0ece55-a366-4136-7195-08de3ef7a89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0E2c2FzM0xqWG4wekg3MFpaY0tVRGgwM3VQWnh6bHF4QVFtMU9RYldqNW1o?=
 =?utf-8?B?U3o2ZlhYNnZHYm9CTlVWTk1jWEJ6TWp4by8zaFlCOWdKWS9RdWpLTi9jMXBD?=
 =?utf-8?B?eTF2enpaTWZDSUZPbXNjNjdPREdieWlaMEtLYk04QVI1YmovZkdEbUdHd1Jm?=
 =?utf-8?B?bGtMZ2kzWjd0MUlvT0xPS3drNC9WYXV0Q3NLWTVsQXI5L3JIMUlJUHlvb3dv?=
 =?utf-8?B?S1FuZXFZYTE1SnhnU2ZPNTlrZldWT2dGVjNCczZ3MTlHckVtWi9hNkZndXhz?=
 =?utf-8?B?aFZXMVM2bWpzeHF6U1dtM1RSK3QzZjk1TStQbzFhejU4WHM5QzlONHVnZ1ow?=
 =?utf-8?B?UzArdngyN0Z5MWtIa2Zwa0VScTZwdDU2bHlQZkF6c1o3MUhlRk5pVnpVQ0NH?=
 =?utf-8?B?d1pXYkZ0eFR1NTM5ZFlnK0p0alZLbXZjbTVSRGNnRmtFWDhRc2tsUlc4b0VG?=
 =?utf-8?B?cE5nZ0VDMFQrcld0a044RmN5Ynp4Si8vbHdvN0RENHEwZm9wM21sSE5DTGw2?=
 =?utf-8?B?QnJyMVlxV211Ukh4MTk3bkhIOXQ4OXlsMWhVcTgwVFpHbFcxazlxYmtTWkk4?=
 =?utf-8?B?VlJ3K0xPUm5hM21lMnYwNkRrRGF1dmtvdHV2T0xFTXVJdWExMWpLUGhuVHhY?=
 =?utf-8?B?WWZBOXlBa3B2cXdiRWRXVlVmTmwyY1E4L0kvdllMMGdueFpLM2lYemhpK2hQ?=
 =?utf-8?B?bkdkVnRaQVp0NXJnVDdrN2RZSHdPLzlSc1lLcExYMENScmFqMDFoSkhpRHp1?=
 =?utf-8?B?S0xibEdIM283SnpVSGZ1UjVNSUxxb3M1YndkcUVnbFZTWll0a1ZlbVExVlAr?=
 =?utf-8?B?NDlwT1pNWHlRdXQxdlhrOXFxWFNQQWhFc0EwYW5EcmdqZEUvWVVzbW9Ybnd1?=
 =?utf-8?B?TlVNeUgyb2VhZlZRVXpXakxucytXcGNLSzI3eHc4M2pYSFl3ZzQ1RTdaZnlF?=
 =?utf-8?B?QzJWUlRKQmpacktrY20vU1dvZUNwT2cvbTZiOGhsbzVCY0RGRlFRcEhMeVkr?=
 =?utf-8?B?bVhhWjY4NEg2YkZaQXRaL2xNQ21JNTd2aWYrdE1aLytuTCtSZCtuaEdDd1ZE?=
 =?utf-8?B?dVUxUG5XellHdWdjajN5STQvMmpPRDdGODVpODZQSVA4OU1JK2hKMkZlOUFn?=
 =?utf-8?B?Uy9WS25kZUJ1N0w4NUtiWDIrRzJlUmczNjdCbUplem1Gd0dhcTE1MnZmR3Vx?=
 =?utf-8?B?TkpUNUd2Sk12dWlLa3lCTXowVUgwdy9OaGowRE1KcHpvclVXQjRuOGExb2lt?=
 =?utf-8?B?TzBtcFZOUG1KRHBOOU9yVHM1T1VPNGlSODJPMFJlNTVzTTJtUEdJdDNyMFUx?=
 =?utf-8?B?Ry9Ga1JYenJkT3A1eTB5cjNvK0RBNDJ5bkQ1QS9BaTlYd2FlRlEwdUFEalNu?=
 =?utf-8?B?TFRvMFhZaFdITCtZMllsei9na2JHRWhDSUdzMWtXWndhVXJVc3dVWXRrT25z?=
 =?utf-8?B?bURrZ0ovTSszeG9KSGRXWXBBNEc4Z2wvUk16YkprdndHc1ZMY0ZqUTB2dW1B?=
 =?utf-8?B?TGVScXpTT25NdENWMHhRR2M5ZWtWWG9FMU9SYXpNRXpxZzhxcEU3WXZUQ0FC?=
 =?utf-8?B?WlpDSjd1RlZWekY3YkZOKzlEK2FiVnlxUHp6cFpCM2tBYVg5Z204bjJ6MzBU?=
 =?utf-8?B?TTU4cW01d2tKcyt3SnJ1WlVQQUEyNGdjeGFrSU9iSThZeDRkaC94QTZyNUly?=
 =?utf-8?B?WktqbFdCZm5jTk5MYU5BMStsY2xxT1UxU1BvNDVvUUtXVmdyVUVsNHRRYlRn?=
 =?utf-8?B?NFZpTjBHbkVVNDRsOWpvOTh2Q095MGt1dXRsK2NwRlNKY3l1L2I4VkVxbXNJ?=
 =?utf-8?B?dE0rblZZWTVKSk92ellTS0NENWlFWDk1blE3blBuRSs5U2FaVHFpY3RZbUJ0?=
 =?utf-8?B?M25aL2V4QlJHanlhRUpHdmRacC9NUTRkV1cxb1N3Lyt5TmRITFprOUUveVRv?=
 =?utf-8?B?TG5pQm1HS0kzMzlQSWZpVmptSzIrbDc5c1FvZ3EzMFYwTXNpNHZqNTBRZVdw?=
 =?utf-8?B?M0hPdm5EeG1FRGNWTWI5cnRURE9ZeGpXVlRDVnBYVUE2TVdTKy92c3kyZHVi?=
 =?utf-8?B?SDluNW1VZ2w1RTBKenlvOHZNdk43bm5sdHIzVlNScXFsK2s4V1VUNkNXTERq?=
 =?utf-8?Q?7aHg=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:10:53.9506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ece55-a366-4136-7195-08de3ef7a89d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10238

Adds Support for:
- Reading and writing time to/from the RTC.
- Switching to backup battery supply when primary supply disappears.
- Optionally enabling battery charging.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 drivers/rtc/rtc-ds1307.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index bf42c250ea7d..99d95e520108 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -48,6 +48,7 @@ enum ds_type {
 	mcp794xx,
 	rx_8025,
 	rx_8130,
+	rx_8901,
 	last_ds_type /* always last */
 	/* rs5c372 too?  different address... */
 };
@@ -129,6 +130,12 @@ enum ds_type {
 #define RX8130_REG_CONTROL1_INIEN	BIT(4)
 #define RX8130_REG_CONTROL1_CHGEN	BIT(5)
 
+#define RX8901_REG_INTF			0x0e
+#define RX8901_REG_INTF_VLF		BIT(1)
+#define RX8901_REG_PWSW_CFG		0x37
+#define RX8901_REG_PWSW_CFG_INIEN	BIT(6)
+#define RX8901_REG_PWSW_CFG_CHGEN	BIT(7)
+
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
 #	define MCP794XX_BIT_ALM1_EN	0x20
@@ -226,6 +233,19 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 			dev_warn_once(dev, "oscillator failed, set time!\n");
 			return -EINVAL;
 		}
+	} else if (ds1307->type == rx_8901) {
+		unsigned int regflag;
+
+		ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
+		if (ret) {
+			dev_err(dev, "%s error %d\n", "read", ret);
+			return ret;
+		}
+
+		if (regflag & RX8901_REG_INTF_VLF) {
+			dev_warn_once(dev, "oscillator failed, set time!\n");
+			return -EINVAL;
+		}
 	}
 
 	/* read the RTC date and time registers all at once */
@@ -307,7 +327,7 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	tmp = regs[DS1307_REG_HOUR] & 0x3f;
 	t->tm_hour = bcd2bin(tmp);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;
 	else
 		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
@@ -358,7 +378,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
 	regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
 	/* rx8130 is bit position, not BCD */
-	if (ds1307->type == rx_8130)
+	if (ds1307->type == rx_8130 || ds1307->type == rx_8901)
 		regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
 	else
 		regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
@@ -422,6 +442,17 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
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
+			dev_err(dev, "%s error %d\n", "write", result);
+			return result;
+		}
 	}
 
 	return 0;
@@ -568,6 +599,17 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
+static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
+{
+	/* make sure that the backup battery is enabled */
+	u8 setup = RX8901_REG_PWSW_CFG_INIEN;
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
@@ -960,6 +1002,11 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
 	.alarm_irq_enable = rx8130_alarm_irq_enable,
 };
 
+static const struct rtc_class_ops rx8901_rtc_ops = {
+	.read_time      = ds1307_get_time,
+	.set_time       = ds1307_set_time,
+};
+
 static const struct rtc_class_ops mcp794xx_rtc_ops = {
 	.read_time      = ds1307_get_time,
 	.set_time       = ds1307_set_time,
@@ -1040,6 +1087,12 @@ static const struct chip_desc chips[last_ds_type] = {
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
@@ -1081,6 +1134,7 @@ static const struct i2c_device_id ds1307_id[] = {
 	{ "rx8025", rx_8025 },
 	{ "isl12057", ds_1337 },
 	{ "rx8130", rx_8130 },
+	{ "rx8901", rx_8901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds1307_id);
@@ -1158,6 +1212,10 @@ static const struct of_device_id ds1307_of_match[] = {
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

-- 
2.43.0


