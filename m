Return-Path: <linux-rtc+bounces-2503-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 977289C421A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 293271F23C6A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7101A2C32;
	Mon, 11 Nov 2024 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="n3ZLUShD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811661A256C;
	Mon, 11 Nov 2024 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339741; cv=fail; b=FDqWFz4fXi8PMfMuhuS/Dq1+ICQg2Agv2ujiI7Zg57Sx+hAA+HD/zzni1TNNchgnV30+uEbwb3jXHdNw7LTPIx55lMmWBvQFWoTeriAIZoX0+Za1Yo+Krfq/acof0PP6ynBY5vxuv+TGU20EWveD7EhqUGEtmyMjv9q6TpIeDqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339741; c=relaxed/simple;
	bh=1SnFy6TTdvPqfDYnfJBYg+pDShPshxI5E4f6DlMNubI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gA7w53f1CWxDmbI85bMn9AzDGnp8bC9kH9Svkj59E6nvmkhDE4P4XDpcglzmOu1fF/6NUWInw01PwrZY6z8JUW+cSMgRqpVabvjoXO5jt4ny2Y6gfVsMMbTqrdBDQA7nwfsRjV9PUD+KVx3QqyhGGCP1iYL3if9FD3euPqxjy0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=n3ZLUShD; arc=fail smtp.client-ip=40.107.22.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcAIy8aSFdMMmmm6tH2E+sXvubsbm15gas/wM8R8jnsb3n6UZv15tIWCp5vblVp2REKSvvvzbmc0OjfbnoKG0qUXMiBIySRDn6+46/aDX+zlaqjocFKLRLL1BQ1/SjhHr9tKDajVAgKS8l3KH1NpEfW/XQ+qNW7yUAFRwZPB3IrOH/ZaR0hXp39IXS9B5iBqgyMRQMXyZ+BvvKNT2WoGXNr4q9W3VBAsSFIu8rlW7FLcRewED9kw0PHjop5QMicrZjcUk54B+3Qc9IbtkkOFPxzNN/z4dpVYtG+a/d7gOEgclbE67WSai4AXXtN+r1baUTSdjz1m5rt89eVevc/UrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f63B5JOKrvdcXbkhImjbRlYFhi1/csih1RaZvC9Bntw=;
 b=lAdu692qqpCssQWrgETarZLGdsfMZeUZdYpuqNEuVe4Tc2G5so0oKrkoawjje8gkEz/heCO0FK3jG7nMCFdJNkQJkHaCmBczkqwMUkbbddCsUXzb6Csds7A/osYZwxGkc9KFAKR4yxqTPJirKu+ynzgKRmqBMIvqNfusmLPtU9osyeJ7MsT7PRlL+d2AuCn9EeYex+c5cRlqDNawm2egzpQ8ZVsxG6pR2aNBwPgbRaQFESkJyWJ4yPn0Azb+fdMw+7E1ofLKyvgLjNPL4syimjmXUJZkiR6fnwr87dD//hVMiviVDzP1jHmUdUA82BFMO4rqxzKmaLDqB9eXrLLyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f63B5JOKrvdcXbkhImjbRlYFhi1/csih1RaZvC9Bntw=;
 b=n3ZLUShDRjJ5AUDhz4TTSxylDiB/mIIktv6DMnyEC8vX5j5pKMv/8mf3hTY2Bw8kG0ZdXAS4uBNgmHnRcqUuT7dVC0fq3SKfFgqQem52H7BNsliaySGfyi0nORjqZRXTmhV1OsKLeqqM1nofgoB5FgD6XUH5q879DG7UtdDrdl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by DU2P193MB2001.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:42:14 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:42:14 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH v3 2/2] rtc: pcf2127: Add 'nxp,battery-switchover' DT property to enable battery switch-over
Date: Mon, 11 Nov 2024 16:41:44 +0100
Message-Id: <20241111154144.163604-3-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111154144.163604-1-p.rosenberger@kunbus.com>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|DU2P193MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ecd425-9b1a-45d9-04f2-08dd02676a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/tiiNUCJhMtoVnz7r3nIHtbeUYATPNp8UcBXK8t6sTkYLV8TvKCwhPxBxlU?=
 =?us-ascii?Q?B+ENeAmDoww5nu+nh+/rfzSJ3Y3jxdZZH9NNv7eV4GWlv6p8tcH9mLqoR9I9?=
 =?us-ascii?Q?buhYClUpzlGmIZVEXEDoLXoQVWHRGN5dsjZ6Bif4/MTpbPPod8ZxhQWcBNQ3?=
 =?us-ascii?Q?S0ohHUiaNFRWUx/59nQcGY4G9baf8VN8ph3yfvHaOBxLFeURefWWd5Lcsia/?=
 =?us-ascii?Q?ZcV09nE3XMCkDkaGLBcl+VyRhb4Fow16GSfX0MhzF7IC2bRyBMqTKTIgpJc/?=
 =?us-ascii?Q?1YLATgWR5XczgwpxTSatxU+Hu0+BlvTsD5yyRES341Nrd0j7Q+aMFhxRN+6S?=
 =?us-ascii?Q?WE0wyyOcMW78Ae/4TxBKm+lXTBT3o763Lhb8KQvnD5QPdTct5+cnHpxax4UD?=
 =?us-ascii?Q?fxCZPoGyIxFZWBs3zSJyGrb42bugVzk2gj1tSfXm5OUUw5WjNOtM3ydNtCPw?=
 =?us-ascii?Q?n/5AUD/llrmLlguJusoQyDAJ4DxI6zxmcxGVNPtRkMQpYNa0CETle4fdk6PC?=
 =?us-ascii?Q?78qrCb/cHRIlH8IXsMIDsLYhV7T3XUOXYFpzZus5GCkZB0woypuP2AbMlNO6?=
 =?us-ascii?Q?121WRqqMdA7+cDEepEFmcDiTsc6QMakRAH6bzlxBgyyoy7Pov6id/ypPsdDK?=
 =?us-ascii?Q?+ucSgN5npxPb4VYlioK2R2FRTtHsucx1jpNOYcW5i0glFJrlOXLo2qaJ4FW3?=
 =?us-ascii?Q?syjG8LVYP4kwZKbYCzCpB33JDMzT+QxnRSjVVnLEOK0Gwg5v65dAPlZaObSW?=
 =?us-ascii?Q?OKXErgDERZg4zQms/F8VknWdV2QKzU78jxxKdghOC2V1cUt7/9Ybb848h3WV?=
 =?us-ascii?Q?NevTECfK0KUAcAuLTevbwAez3NHmy2axmtD0aF+joE9LwvxWfogI8fPTZvX4?=
 =?us-ascii?Q?4kfto3UaT7v84OtwL/7N205fGpHZTtf0unMxCSc1Zt/K509b2ogW9RjtW6tA?=
 =?us-ascii?Q?cZGyPtTzajrV0PbKFsn53IcBVndPsZgVvRsecmMI9QbhtmVFO2z+EOxMdZjU?=
 =?us-ascii?Q?Nusgty3N5PoDA+sP2xAb13QJprf2Sfootpbq56Yibvp3tFixznwddkF6TUdM?=
 =?us-ascii?Q?mkh2qWOm7QLv4OOMwcdOFmsfEWG4Ih5GfyZ+9nQ0V3CrzKl84rVg8ZrbKCqo?=
 =?us-ascii?Q?XdjSi92hd4nyXyS9DcbWU4TQU5QJ9qpc0WbiS1gc7zUkjs+EL/ySUmbvyDYq?=
 =?us-ascii?Q?v2QOwzMqU9uNMyPaOAYnCG9VJYAhLEb08EdVkysdlB9b8k+FHG3dgvgeSfgf?=
 =?us-ascii?Q?FvDxPyP7zdWZWx5GJ7oa/m7k0fZGPPKuvA4P1v1REUoN5oqOhClXNVr2gQwA?=
 =?us-ascii?Q?e3/IKRisqVpXZI8k0111rECqHhg4cX9gSR0pvyqFTA/EvX2L2a561wdmTvbT?=
 =?us-ascii?Q?aGwL5uA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wg/ZjUszibnZEf/rnt5QujQ0T1u2JAMkjowkB8tsCniMa0JwyOWc/EC8Kqgp?=
 =?us-ascii?Q?nmRI76aLf9bG7PjKQ2TPFo8wMerSlBK9Ax0YNVuoTLV5bPYTUSzIdx1h9xP0?=
 =?us-ascii?Q?KwSexy4np/VVTh4WK9JCTetKsezjPL0+8oeZ3J4R3a9Ki7tPvc2HUBFDxcgL?=
 =?us-ascii?Q?xC9B4CxRf5IIyKEobkoi0xMdjEp3rsD8CHqftwTu1JS2VpleNw3Q4H7233+o?=
 =?us-ascii?Q?yR2u0RK8YNE1MUSxaL0w9S2OPVXJw2xO7cdy7MBpG6PBdw0QtNyFk1ONv4Rz?=
 =?us-ascii?Q?pJcCrl544n3xe7NpdBQI392ZOWpmFmzFeJnCnoj5214R2juqeVONWMCb/HcC?=
 =?us-ascii?Q?d+zwhnX23/MfkD5+Pd/8Gp6QbPdzpMLg9tdxf8p6ajI/P+YkaMw572cPen7G?=
 =?us-ascii?Q?8e7EixY6EOuyiFMUzy2AwquxhcZ0LJAIuOcGcSmbPAnik5zOjDtOit6j8kDM?=
 =?us-ascii?Q?mVSGcQ/ead39u5APGCm/U/Rd/lRhB8yZLe4iCh9QZNnA0atdQDNAioidUthn?=
 =?us-ascii?Q?rEfl6oChEk8MrRU3+QSlutYZlwXkc8l9e3YTKiGakV5gavSsHIy0Vv36pge1?=
 =?us-ascii?Q?2CJF3q6+18qHVeQ6l9hj5VCp7y73KC9j8Rg+HHbC1gURxBoGgjog3SODZdeG?=
 =?us-ascii?Q?mNsh0aKDDmfxGlLTcSV2cU8o745PDKvUYPT1F5S7HCpyHuKkig6LI4HcUSJ6?=
 =?us-ascii?Q?irT07dGefyKBDikjoMwAA+CotTwOsoT6TbyY4dKPeJXvd0SERTZtjykJywJF?=
 =?us-ascii?Q?L5VVGntRBV8UWSRAcqwxGFU6nL3FJZS3AHlrJudKrtdZYwmgtNRdV5M4PMIK?=
 =?us-ascii?Q?ChloHjpH6pKRYek5vXoUZWquL4b5ZaNOdIVkD7bQHrYiZOTofot7nOEuPJK+?=
 =?us-ascii?Q?6MWy6gOmKhsiI4f8Q7/gumT1hv8KBQR96Qyr6XvJTnBaYHR99oPnAzsinj4F?=
 =?us-ascii?Q?+9RgHVbyCGyujMYovNshZOgkTalR30LFhotheHvCWq5SA3/8Pbf/vOjdtwRS?=
 =?us-ascii?Q?kguwpqKxB+FiQZhzIRtcDjRsHyFY/LkIERfAk4Idt0Z98LHpZByqP9eG1Dy5?=
 =?us-ascii?Q?DbLNoqa49VCHi88kUoxh9/FOx3XGgX5HdoXVtdLsE8JSIMG39p4OPDJkVsoi?=
 =?us-ascii?Q?8yZrc/hCkrSvYXlRFgxca3vSFHEjJTMk3WmGnPYBgZ/UZkRkH/wHaYsVW+5w?=
 =?us-ascii?Q?MZZJM8/LiMSL1cRcM8ymYa2yD/ol3/Avx39fF9o3GHOI6hvgX25pkjR0qDOe?=
 =?us-ascii?Q?aUKyqfrL9toRDEvr3Bm8+0I9WcR62mqY4g0SQ9vUinrW7R7tLvOWWGo2d/vP?=
 =?us-ascii?Q?Rv8jXEuj1/lHp1QilO6Ib4PquSC3zY0B5UK+q8quLkuG2zyW6l6ZR8f49qh0?=
 =?us-ascii?Q?HyIz0Try9cIhbWL6cqW9GKmw6gGdB++17A/TU0xMTKMRc1s4jq1mlC/Y0nw2?=
 =?us-ascii?Q?eu4NQhZelpVQ5zTbeQI6813HS0grgrSafF28NoShmAIvubWMfrWNV1c8kfx1?=
 =?us-ascii?Q?8gQvvUG0eGt/KZNlgZ3FTUlLZNR1IZSOP/sJBrKiLucKFOGYuu2fa+sv5lu7?=
 =?us-ascii?Q?vc7u+Pyc4kN1AR5cmuTnPXiZ01ey7oRsx7zvu3ZM1h0fKh61NCE7pLKCPZal?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ecd425-9b1a-45d9-04f2-08dd02676a44
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:42:14.5807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFPTvCZg51ELHOAaRZ17a8tF2AASmKcLq+Dg1TLnVoMqIAXoMITBgZMER6WpK9Uo+K05FRkWWHiDayTiAvnot8QaplBTkULVr+rU13frbtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2001

The PCF2127, PCF2129, and PCA2129 RTCs have the battery switch-over function
enabled by default. However, the newer PCF2131 RTC has the opposite default
behavior, requiring explicit enablement for battery backup.

Add support for the `nxp,battery-backed` device tree property to enable battery
switch-over in standard mode for the rtc-pcf2127 driver. If this property is set
and no battery switch-over mode is already configured, the driver will enable
standard mode; otherwise, existing configurations remain unchanged.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 76 +++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..c80e31fec134 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -48,6 +48,7 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_BIT_CTRL3_PWRMNG_MASK		(BIT(5) | BIT(6) | BIT(7))
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE		0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -529,6 +530,64 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 	return devm_watchdog_register_device(dev, &pcf2127->wdd);
 }
 
+static int pcf2127_battery_init(struct device *dev, struct pcf2127 *pcf2127)
+{
+	unsigned int ctrl3;
+	unsigned int pwrmng;
+	int ret;
+
+	/*
+	 * Disable battery low/switch-over timestamp and interrupts.
+	 * Clear battery interrupt flags which can block new trigger events.
+	 * Note: This is the default chip behaviour but added to ensure
+	 * correct tamper timestamp and interrupt function.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_BTSE |
+				 PCF2127_BIT_CTRL3_BIE |
+				 PCF2127_BIT_CTRL3_BLIE, 0);
+	if (ret) {
+		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	if (!device_property_read_bool(dev, "nxp,battery-backed"))
+		return 0;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &ctrl3);
+	if (ret) {
+		dev_err(dev, "%s: read ctrl3 faild\n", __func__);
+		return ret;
+	}
+
+	/*
+	 * Don't touch the PWRNMNG bits if any kind of battery switch-over is
+	 * enabled. The PWRMNG values 0-2 use the battery switch-over standard
+	 * mode, while values 3-5 use direct switching mode.
+	 * Only values 6 and 7 have the battery switch-over function disabled.
+	 */
+	pwrmng = (PCF2127_BIT_CTRL3_PWRMNG_MASK & ctrl3) >> 5;
+	if (pwrmng < 6)
+		return 0;
+
+	/*
+	 * Enable battery switch-over function in standard mode.
+	 * Enable battery low detection function.
+	 * Enable extra power fail detection function (PCF2127 only).
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_PWRMNG_MASK, 0);
+	if (ret) {
+		dev_err(dev,
+			"%s: battery switch-over config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Alarm */
 static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
@@ -1224,22 +1283,9 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	}
 
 	pcf2127_watchdog_init(dev, pcf2127);
-
-	/*
-	 * Disable battery low/switch-over timestamp and interrupts.
-	 * Clear battery interrupt flags which can block new trigger events.
-	 * Note: This is the default chip behaviour but added to ensure
-	 * correct tamper timestamp and interrupt function.
-	 */
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-				 PCF2127_BIT_CTRL3_BTSE |
-				 PCF2127_BIT_CTRL3_BIE |
-				 PCF2127_BIT_CTRL3_BLIE, 0);
-	if (ret) {
-		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
-			__func__);
+	ret = pcf2127_battery_init(dev, pcf2127);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * Enable timestamp functions 1 to 4.
-- 
2.39.5


