Return-Path: <linux-rtc+bounces-1759-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D09EF963CAB
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22519B2397C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AB5176AAE;
	Thu, 29 Aug 2024 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ixISaY8P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627716D4CA;
	Thu, 29 Aug 2024 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916160; cv=fail; b=LylFVNKt+UKCXyHASBKKbq9NskwpDpQXEx1y7q5icSHDrT/r8y70s645J3zH6MtVqzq9ebkGHFvScs7pSwNJM6XcUWjGRiEhfLz7WsPcWVeUHCMecaaQLnSaF5d1r8Jj1l9lZfJSxddWn7j1TAcrhkFguj39lSLdMsd93xM2LHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916160; c=relaxed/simple;
	bh=bVEEBr4ewNWxP0v/L3lvL1Vdj/Q7GZjpzFEisYNxeuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UcZkH4qFFFt4mQqfguPyDy1OMdR24B32w84CDxKjBUMxOgHv+Yt08tYqcBiXLkOVyUN0XXUdwr/WVwnl/jZI8pNyW6Au+1JOKUPZJVInzai3N/OmJK9Xm9Tn/YLZcx8vN9rHwQYH88VM+wRwNRHC669vWpCe4f/3bOl5NbZNMlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ixISaY8P; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMcMue8LVVLQV3rwFUJqoPHbE2xgbo2ti6ZPHu806dSQF8gD3nx6zkCZV/dMSpCV3lMe+Wat7OSrW706nxQPfWh7awf3mL0L1BJhy5B/6+MDimxwYaQft+IKyFB8hJDpJWz/K6lLbhg0h7liMdGnBX8CW5jr1cQ/UULS6fP7yVGCifkfyRBbHMJTMpbuN4Rm81AA89qLeJy2nTvIBjPkZ8X60xQaLw9VbMTOlQZN5RHURpye3pTSXbi/MXc3p8z0LRCJMdzugNiScKks5hbh997Dox71SNpF7ntN1CTXZJUxOJEXDMB1OWQLDL0zoOV9KnUEItLWcbjDQPA7kSny+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyt2vWOi7reV01AQW/h9DbbUrfax/jMVPV75+z24PTo=;
 b=B+2TJrHCUXof2vjRaJWQ3U/z9mHGOEAoIK7yALIBpe17gbx2zi4hUwQ2SKMc57pM2efZLG7+eAhCtTIonPG3wu7BYTVlmk/9EYz+O/YnRmdgHWJCKnrCAkWup14o8FPp0kCKY20iYlsTwCsKIFiBOb1P33aeAza+s+S+gZFgGicPytYD2mWm5biNGE0dPVQEDY30HUhcjzZKtxqljpoAJestVEe/fI5KaQEpFkP5WxyVpJMB48yMUy+1gijYD6NtJWdmBfd7pq8Lat81RCY7WbanUpYRqVUjwxdyY1puj6WnODZFZDJF1MezvLqSlMLQL8AAZdZC/FKpwLo3bt7Xiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyt2vWOi7reV01AQW/h9DbbUrfax/jMVPV75+z24PTo=;
 b=ixISaY8P+kAiPKlVhi5bgK9JCuVLOsP7TMNS+6lS0bAgySVC1TyX0C9EURwyq3UeKw4zJKKb0uhkRppzgcZn67T2Xu1aH1FfgiZe7wdwTbGjiFwusGUtVskIMmcHCt2JXBIiEXstMfrg3FHn/6TY8hYcRmZybz5MEHsBQ3uxE7okmKyqQIwoxbxpMEr0wU/WCTONeL0pSp/dPHRG38upVf+0QX2vI6lghD4ZsLV0pXBqxvcoMGc6Te44IUZF/TCfOKoC6Zy+fgkeJZuGVbTw4atbBSAC7L8IpY6HFF0lF0wpWRGCmt81ci4BkIwdb2mw0K4Z8+BWFhQqTnLEpFpKdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SI2PR06MB5172.apcprd06.prod.outlook.com (2603:1096:4:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:33 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:33 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:03 +0800
Message-Id: <20240829072209.7253-2-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829072209.7253-1-liaoyuanhong@vivo.com>
References: <20240829072209.7253-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405::22)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SI2PR06MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: f13048c2-240d-4583-91f0-08dcc7fb59bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mZq+1ZHB7Fpad5uAH3HEci1Grnjf8dRq1xHijmCoH+4nd+P/9zqDNsucLfEC?=
 =?us-ascii?Q?krjX9vmJYPaMhSL2DXsNKap9BfZGNLdBigFphL0V8JMvgW2pEL3dzp8vQSlc?=
 =?us-ascii?Q?vJxKL9+cYX1KLwHqaxxxCvHETWGgFj/yOAplyAtjSgtSjlQs/L35Ds4q+Zvw?=
 =?us-ascii?Q?YcDFmPGPClE20hvvLBevR9d703/aGHVLTl4oaMhneqqOYGHH6FJwOLzw3ATX?=
 =?us-ascii?Q?q5mMUBYiTZ5dzGNHoDi1dj506mb1ZR+VwW47a4jA3/8h9TL39wWwt9RQKWS2?=
 =?us-ascii?Q?A/sSpUQMj9cTo9aEJI+RgMVy969C16gvjF2SKhMxgKglXe2+Tm3kvLrfxNIU?=
 =?us-ascii?Q?00EgRVmIoDmL/5Ip38GJkoUBuCqUiW6b7UgIz5LFnXNZlUW/KaiEq44TH4zz?=
 =?us-ascii?Q?XXHZsxhEcOG2m5BI+ePH6fMi5b6ZJsCgVhG3eY5c+vRSrpZW0HZCR6wAhBI5?=
 =?us-ascii?Q?uIEl4RsXWZoFkWCupaUAr7DIyWQP7EzhYSlaxc+AzFYo5dCCiKyKl8YgwDR3?=
 =?us-ascii?Q?w0wkSVQAxDMKq8XiOd2uKCgYxyPDsq+QLjPwy07wvAcugI4A65pDW0kzkLf9?=
 =?us-ascii?Q?9TsGMUFUA+t4znbF4u3ThQ02aIIwNegRpL0kVfg2+quNbq+/pDJyiXEGmG96?=
 =?us-ascii?Q?hDK+VJNuYr5n9sw4DfsIOODBR4M/d8QX6CetlKEUCipm9nmg2NO7ixDXU6ge?=
 =?us-ascii?Q?W9gTynrg+OCwtVk2jcp4O2CTFCkwLEqqHwA08z3e7cK2ifyNgkafasYCDA5p?=
 =?us-ascii?Q?z6RiWQ+2puzqaog7ggClGJLL75wnBEcYCEmfneDs2kwUGk8yyUxi4jFKRQ87?=
 =?us-ascii?Q?GWQXjE0Pmzr230jIIONuUXik1vk1gGc1SRJyrWpwzdR32f9JxHpfWWCWit4J?=
 =?us-ascii?Q?lqhOJp9CunxxvfoChBWczDUhS0hIDYASpjAwnp9Qv6R+NwOSasqMxuhnp+d7?=
 =?us-ascii?Q?llAIXBhEjN8X0oPtH7NxUAzuJKse5XlvBdE4WQZX3TY3PdU8W97ww1EtJbV1?=
 =?us-ascii?Q?x20iAroBgRp0pfKuhV3xOlb+YdlGyu3B4xfYinxEI03yNSNbB8YGYluXkDHi?=
 =?us-ascii?Q?EXXNbCOpa3HynxRi2wHnm+cmkW59q/bakEVM0msOje4atW/RD1Qo+RNXqY9t?=
 =?us-ascii?Q?Uqw2+xYlo/CtxbworxcVndKnrjHHZToez3Dfq5T+gWmkvedtQnR4BbAZJjaE?=
 =?us-ascii?Q?QlPFaqiSYmhlptVjoXbHd+7lGS/timkkdM6NEgPVw391EmohlLcQdes/86G6?=
 =?us-ascii?Q?1MuF4ikfNmBXIZ3I8lFtoYzwca1HkXRscYkseRPDn3QcWRgn39K+oF70iV3H?=
 =?us-ascii?Q?bwdpjSXP19FvjznMq2rtJTnZDP7ElMLN3TNuYUk6lbKCc3//KoCLlZWV6swD?=
 =?us-ascii?Q?pnn2YruE02WinrVxHwF/Hg4j6mod4qCePAkQDamvHe1d9Kk/SQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3JdW/OQLA8ek/iosJRuYbqL3pLY9EqlWxgH1GMzJFbYuIdJZYB6vdjPEqaAh?=
 =?us-ascii?Q?lYE2A7GzhMnZNRg/WuC2t2Aly3Mh9uz+tOF27onlDF/yAnlwFosJdWvnpb7X?=
 =?us-ascii?Q?pmQFSwhlFJ0Az3x5Ijxqvt9Dlfxau4A+0JyUGUbz78k0yXbC5fqmPtAfiBzH?=
 =?us-ascii?Q?yBLxE0a+ju6v0qSTI9eq4ukDPLKGjGgq2H833vUjQPcSPx7EQyDHSMivwD+i?=
 =?us-ascii?Q?zv+6qIUgywFuIl8bcwPxAlZLbi4q+MeUjq6kWqzHgTNZIQRZSccWIOoz4B0F?=
 =?us-ascii?Q?3KmQCo1L1kkFqDougmuDVOqhV69H6sJud4zoKNqrQP5ZvTRqW9Mo7arJdDou?=
 =?us-ascii?Q?n0pDFNyolP3IDuMp5rXLsDSEZJ3EEQfCXOm5knPL4D/dMFDUOSd5AjBcnTLC?=
 =?us-ascii?Q?ohAO6WHr+Y4dbnbapo0/JS2X0fC7rJTwPJhtaMcKq7O3vKpK7yYuHd/9LKu1?=
 =?us-ascii?Q?+0xR9COriMJvkrUQBkJP6o/Ao+EYpcy94Xsf0DUw2hrfXpxaofOv/vZEDDdd?=
 =?us-ascii?Q?8T2AHnlmfG4usEHn6MveVbjTuHXTJjrrUQdCyh7irF7Mbculfgm/p3CFx7pE?=
 =?us-ascii?Q?BAXmIvbtxoWmQW+3i9NkjmrUYLMVoOsDnUnnJLcbZsR1fcncb1uHcN2R9aIT?=
 =?us-ascii?Q?1QGYmIqFczOnw4rNEePjQ7x7rZkPykrreKC8mrw9crIe+gWrf+eg3G9J1Tox?=
 =?us-ascii?Q?jbMuWEiF707ZiAIZ2tMHC+yh2uxEBr8hd8ZMYQV5EYIR9iggSX3ICB300zIy?=
 =?us-ascii?Q?/UO7RM0T9uKNSdW8KPb0beYhI9lhACv+ObuqEI/svIsTvrNPBOX26I6b1vsk?=
 =?us-ascii?Q?/rgb/lBE8B96/ub9ERJA7X4pgEXmnDq7Psa2hOAUjNH0/DrJoCwctHCz6217?=
 =?us-ascii?Q?/Zrq/0lEg/rtQ+7n7meg9aFWYbzeTLLN1H8MK7RaMvRN5F2MbiXj/evqIxjo?=
 =?us-ascii?Q?N422QbZaxPHWRtnlF7J/8y9Rz+JB3m2Yj3JWXvq950bcT0klU4ntsysJViXO?=
 =?us-ascii?Q?NJ+xDRv285VnG7wXqbl9pe8Dy1bLAbUebtsr0kJWmKk2cehw+k3I5kRW5+hG?=
 =?us-ascii?Q?4a1sMnMt5W8Gmpx14l+JYMFOk4B3cgLX/Ejb0z66n/GDGStS3tIHhyqVttbY?=
 =?us-ascii?Q?4PD+ZaAAmNOAKNEUv/OM9x5ESrbd6jcBCsW47HpjnkYp1G2+zP9CKrFCEHp1?=
 =?us-ascii?Q?wEs0VNY2RKsnfcG8JxIrcWf8kwfYZmpMC82/gsXnSB5FJlqUIt4zHk1j+ytJ?=
 =?us-ascii?Q?oL/+GJi1978T84vgklPFXO1XKbFmW96tZRAEe/N1ksw0Xr5RLqHk5nUrffph?=
 =?us-ascii?Q?WfooL6wdBOn0cXgJr0QMzyJ/xisePkoIE5t28F92HmrV36UNe4d2Ck750jah?=
 =?us-ascii?Q?SEcysW5yXwAIg652kyUZqT8HmBDbh0W9IXLcFjNgJO7mXu0JhwX1hZEm2B88?=
 =?us-ascii?Q?oAk/eopGFWmlQNoSrAE4SqK1scpGszvwoIkUC71596qpb7V9YBeJgHe83UPz?=
 =?us-ascii?Q?Dm7wP1HLOE9//sbCjM9jNmu48/WLKCGwr0O0ixl+F1f8NytkISiInWxlPXPL?=
 =?us-ascii?Q?pC2mjHIL8x03SWv9/wZJ5ZTpc7x3ThHpa+QhPA1p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13048c2-240d-4583-91f0-08dcc7fb59bb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:33.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7xzlfJ733EY6WfzbB4DiTtzPCdTk0oOJ4FW4umYElJP3u2VXQirYdXu2V6+/SzixFBugmFV4dtShOCUjJmcrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5172

Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the global sclk variable.
---
 drivers/rtc/rtc-at91rm9200.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..4d909b840515 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -104,7 +104,6 @@ static bool suspended;
 static DEFINE_SPINLOCK(suspended_lock);
 static unsigned long cached_events;
 static u32 at91_rtc_imr;
-static struct clk *sclk;
 
 static void at91_rtc_write_ier(u32 mask)
 {
@@ -471,6 +470,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	struct rtc_device *rtc;
 	struct resource *regs;
 	int ret = 0;
+	struct clk *sclk;
 
 	at91_rtc_config = of_device_get_match_data(&pdev->dev);
 	if (!at91_rtc_config)
@@ -498,16 +498,10 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 	platform_set_drvdata(pdev, rtc);
 
-	sclk = devm_clk_get(&pdev->dev, NULL);
+	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(sclk))
 		return PTR_ERR(sclk);
 
-	ret = clk_prepare_enable(sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
-	}
-
 	at91_rtc_write(AT91_RTC_CR, 0);
 	at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
 
@@ -521,7 +515,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 			       "at91_rtc", pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* cpu init code should really have flagged this device as
@@ -539,7 +533,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = devm_rtc_register_device(rtc);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
 	 * completion.
@@ -548,11 +542,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(sclk);
-
-	return ret;
 }
 
 /*
@@ -564,8 +553,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
 					AT91_RTC_SECEV | AT91_RTC_TIMEV |
 					AT91_RTC_CALEV);
-
-	clk_disable_unprepare(sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


