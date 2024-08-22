Return-Path: <linux-rtc+bounces-1686-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2D95AB30
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 04:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A18C1C252A2
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 02:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6C1B815;
	Thu, 22 Aug 2024 02:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gAuc9z1N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010052.outbound.protection.outlook.com [52.101.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26E2032D;
	Thu, 22 Aug 2024 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724294767; cv=fail; b=Y7s5ru+OjGeIp6GPkQWK7kqBy+JSJpQkxOjALnfkaZSMcLQ5PZXnZWovhBTxfF5Br0IaNaI9E+3RDMbUh0E31GSTG4l85k6pTTAqgkyhV+g3xLM0P0ujfGqclQi5BJKz/XRGeFlfpMl+8A+lzn3kVGbvmBbU3OGzmm0cO0hC/bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724294767; c=relaxed/simple;
	bh=AUcbWRJyX/KS3Ws9OciL51ZTK70vhp9hbv+hL3TvZL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUABnLt2+62eaarjUfnG845ZEpCwWipjMpA+wgKe1yaw/wgcSie8dRfpzw00/pqOQcY+WgMLcGL9o2G5lodJeu7HPXpJnD4kC8K/HwKrFpdaSLH1wVdy8n/E26LqqHtRkxEcAit1tHrUZEoQF412Wxr/nV5T9XHj8UvXT1K3hbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gAuc9z1N; arc=fail smtp.client-ip=52.101.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjBBCZ+qYL/yTONyv5txzgLAQxVoxzkn32+E3+An96cnlQBOqwJoGDvRPrpnad+/B6Itl9yH0Fu3+bxZd/3QptQ6AnGP5OYsJJ5WC44b7XsCCfl9Ebl0Xs6AibU/upfd/jcczf1X0v4HfkzYY85EdYtnwww4AhpJsPU0P1I/XwHMptnsUWWX9hmQDVwUQS5SibW+Gqd20EyY4tMu8+k6tyDb7owMMYdk6ZDPaSQ0ea+YnsSMj542c9MRqfZKKqSgnO6CJT3XR/Y5GUDcnvNRVK5Iibt/Q+QOZJ+2l9jf0h7IIJHVj+63wCVgKuzgpVRthSlzI8CwTv0MsJ+NRLYDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2ULIVXpAzio+ADZwMZY5qULO0cNMxoxV2fGQf6oqPg=;
 b=KTrnbKgTIkBcG8HXOEyLorsUrcol5Rf1Cevv3Ee/Tf8wp5hqWK+pROct82c7NP2vW+R2ubpY0dO9Zl2D0NZOhZeJd//A9u6OWYnLZ+lNNfOAtkAZl8C1BArCzOHnGhOjWdXNqjE8m37/6+ACV3KDRZSodQkzIXTjtKVegUke/SCjzUfz2aGGKG4YZt2Qt9L1BCEEV29Td9tgOIqogiXo4WxrtzTkLQ1/oqaQGuGuvpy+zo+LlifCUrsoWyevTGshCM+1x993oC+pCuVkJK9p9vC+Dmz2Bu9AA9Q9OsGQoK5/rx7Sl5zWcnbHvrJom/+BD7yxaC88IR78THtBg2CZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2ULIVXpAzio+ADZwMZY5qULO0cNMxoxV2fGQf6oqPg=;
 b=gAuc9z1Nv11qaqlzDdNY7cTO3sd6KxCw/hyTnJ6iLoTQJ94GR4o1uQ2Bjn6szLlW9SYx8wNDe+APNT4P5rW/58tt5i/0iwl7MoJsw3kEz35dU3QSoOuWwOISa2aIMcOm3SBwDdvopQ4xkeNk47EEk+FbbJLNQPcAorT2+hGBIwUre14QjmjLSuZr1uc8vZXOREeFadJhcLiXaGia4e6Oz7hfhSIheNv+15tbgY22LwYn6xu28CF6BIGYHfQsuy9zr2to4Rb7P6ASUwD2dfG04GRH8AypTpk2QolNDXZisbpDvCL8sNQ4JErEMzdwQCuJHM8zqHyT6/k7F1ufdCpzVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 02:46:00 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 02:45:59 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: liaoyuanhong@vivo.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:44:24 +0800
Message-Id: <20240822024425.13092-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-3-liaoyuanhong@vivo.com>
References: <20240821092846.20138-3-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:404::16)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4fb4ee-2b8b-4c72-3231-08dcc2548ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cs99VRJEF4iyl57HHGeXjFs5L5lPoLT4fEJscce3/0uOCJCLv7dCTzUIlmAA?=
 =?us-ascii?Q?07vWdPX8h3hqEVQ5zUEOSGNhjZ8oGubEGwhrc7JtkzST0JNmPsVq3ycX6ERp?=
 =?us-ascii?Q?L8IkygtjptCM8W2d03FX2yFDSSQRYAs8HtY9REB9o8PYzG5uf5ovx4hja3x6?=
 =?us-ascii?Q?wV7J5ORb1endjovlomcGft4xQEJs/TS8n8+LrIJZc/TsD1NNtUMz3Ytv0ZX7?=
 =?us-ascii?Q?yf+EIn4rEFnqO6DN/I5x1yRzP9CFimNkHRUWh2rwPHvpaS+Kzy60LCC7OjSy?=
 =?us-ascii?Q?CISgD0Rx5FqNkiZPpUSg3UVRUB2CNEeztbo/Q6k6RK3BrUWYOU7yo1ADW3lC?=
 =?us-ascii?Q?9ZpaKGxMJ3ZoxnMfwEQ6NvTdjoGBjjT+xYiVBi0DfpVm8GxA+QadghcmPWTs?=
 =?us-ascii?Q?9g9SntmFc6AAPL4H9p9oCCuMe5pPZujdf3Ailft6Hme/9oV5HycSggIzV2DJ?=
 =?us-ascii?Q?QUElFTVzAI53Donry1PYBhfMUe2fYyH7wUGrOe1LcAu4fQunEA+qOia0LVom?=
 =?us-ascii?Q?z/SAXvOZJQOrsazbMJCSOU01vfvs41tt3bJYJ2OlGwLgxl2+plV9y+aXW76j?=
 =?us-ascii?Q?9JhN4ovYRkp6hpH7kVBoZxBOpCae7Wg7aL+zhiQi8AgYhZKo6Zq/b1hL2k7O?=
 =?us-ascii?Q?Vs5wMpM5YzXAMtbXVn863BpPLVwJr89M7jLNtNemFD3cYJI6k+f4SjI5r531?=
 =?us-ascii?Q?t+0N07vuenKCv5zafvv9uXYiHM6VpzGLWG8dIVR7fl4xrwRJSUVImsHarf6V?=
 =?us-ascii?Q?002ZZzKdAKKBnaX0z3KTFd2C88to5m7D5goqA78M7b3GW3M1ezdfWuyFdXBp?=
 =?us-ascii?Q?y97lvs06xp6HP2D9wrMaByMSNHzvpnufaFnlGmsBQHsif7KgncmDZ/S3eO2/?=
 =?us-ascii?Q?aelURflcOjMNWeeFQ/7OHRuuDMnlU/BX7cZjAGCw3fRbxpr+hH/P8zwI5M/p?=
 =?us-ascii?Q?KJigIkeydkJbzh0S+K7JFqzhQbnBEvge7h1/+rYD17TVo7r9WlXHFP16XWtd?=
 =?us-ascii?Q?RpxjSdlFv5q9m5E5HLXNhmeQ4mzYj9oufxkcyvYByOmkkxuf6bTUtJX2DB29?=
 =?us-ascii?Q?x2vD8k0LKU/dyl7TIU1CvzAA6H9elfuSn/RGPdMqK7WT3D8fOUrnFyIRVj5n?=
 =?us-ascii?Q?rdiCRv28eIhEH0ODyBXijtcMwaErxYwiRRE2Czp832NXHqbbAPgD5k3ypXUk?=
 =?us-ascii?Q?VTecIE0mn3joLXks+iyNEWIM62qxDxvpQsCtfnBp23eG8s2/wLe7trUrgPx9?=
 =?us-ascii?Q?q1Z6ASp4ayH8gGY8R6lR75LhJoYOEiDtOHEDtV4PPPiyRV0i1aFZ9foQpLTf?=
 =?us-ascii?Q?Lz9orhPzs+PmW12EOB4RDN23i0zgWn83M4g1asNkO4VH8wPJOLBo7GqGLIWt?=
 =?us-ascii?Q?xjApqKGzF4PCHJ8pogGMaJbWBYdaE7zUN7qv+w7jfY9IyeiDTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v+kcHw1e/wzXSzQTGQKyPJkNL0LNC5aXW2y1DasxYucGTjEXmeVZ3DC2Ezto?=
 =?us-ascii?Q?xdf9iNF7Upbip/iDN6KG/2keg5tQVHTuLsmHPtpxzYFDnqIJNDoBRt/07dLa?=
 =?us-ascii?Q?lNWed80hVHVKljACw/Mku7gEw6Pgi+h+ZLpU7zCBZKiCJjfWfyP30vGTwNCf?=
 =?us-ascii?Q?tuN+EWFBTHsdXpWsG4qZwBXaEFezpdfxC2gxoh/WJGoJca+6Ys6hegSLe3yL?=
 =?us-ascii?Q?VekcZGsVbf1B0b3Ul2QsAaFmDeroAQfrrMhwx73x7IxlKwqF5zhQkjdy6sJ5?=
 =?us-ascii?Q?Yomj8JW3mVg/OpAQbASCHloVJ8myUh6+wCvzbT8fUHCTRtL/Hg08nZ5WOITC?=
 =?us-ascii?Q?bMi9Utpy9C4AXYGTxsjMTVnATo9gGtLMuOpPt2JMWkXKLgcrW7OmzoPgJHTD?=
 =?us-ascii?Q?712LBcUKRBNxlRxtUOPs4J0UyPGQN6YhvV+SGX8BTmqzqv1Ck5rrsg5oOHGa?=
 =?us-ascii?Q?tG+AlfFUZVAfDnV/kZ+ngBv7euy+SXogmavbGDBHUbTISepuYsf4pb9bJjZa?=
 =?us-ascii?Q?wMtJVgTR5mrfmMG1H+/HDdZbB2SIxTHOq/gwrdeUN+hn/rf4zQS1qRgkVIDX?=
 =?us-ascii?Q?sD0tHlY0guWbM+HN5F+XfsFKZbNJ5uxlZJIqcrhIuU6OzDZ2aE/YZUu4YFn/?=
 =?us-ascii?Q?8Wmu7OH21oMOv/jjnDyrPCDGlbOooIQz3dl8gpNWwUg2J/IipCY0TxG7qHY9?=
 =?us-ascii?Q?L5ITKZFAzGPgGK9ogkJZVSxfqlORM6vGwdFodWkxxaaYTOyqihBhVU3nnx8V?=
 =?us-ascii?Q?6U85AmR6K9ugvdex+Pn7UaZefQoNwEtRWO8NGj8pVB1gYjtO4v1a8WICCA9b?=
 =?us-ascii?Q?dMV0Ue7WbTRQkQQadmp01hAQhkaukD3o8TZ60ZXDUQ94uaHVIVNgKeOA0+d+?=
 =?us-ascii?Q?B/K+n1vSTIYBWBAUZcyL6VPAjaOT2k2zO8/SQJnl/gDHHEv2+wLjvi190H9N?=
 =?us-ascii?Q?XUa6ZFPTSA9i6JBYEZ5KeXSlCSfTLmKj4C9VIrIt5s3ePwFM9rxZjVFvX7su?=
 =?us-ascii?Q?SWAii0P++PdTYAeKEFQTxcNGs6K0FGxbmxGC+Q2sorz1D4L9cHWov5/9R5g8?=
 =?us-ascii?Q?ZxS5ExubykYr1dCD0KHFKbsdvHjGsru15NulcClvr2HWSoa5A9o/q6HeohAX?=
 =?us-ascii?Q?S4f50CxPK+KvUCRlb4ecVTrKsX25Pjv8ynUA1Q4Iody9U8/TUhtvVTei2tWD?=
 =?us-ascii?Q?f2T54pRw/3Qgv2HW7LS+ReBCi3zXkBSoAh6rxfIINLYPIj0dYEXN3HBAaB68?=
 =?us-ascii?Q?2V6E2/4Lh0T6UR32YtaSNcllC8LtGThuBWT2L78RMoXFOtyoOlq0mKS0de1A?=
 =?us-ascii?Q?XvTWAEqqya1GiUpJSFfwN3qbjbrmxPZFS2DH49ibYqtkq9VAPmnjVmg2sxi1?=
 =?us-ascii?Q?BvKoKtUOe+gxKC782cc1xKe4+4pf1zBxMze/hVVICotZdvLO9RHBWNb/Orhx?=
 =?us-ascii?Q?+cC+1hoAaeCUlPBy+9JZ9Ax8p6VFSDggxd4LYU5qZerVQ4ukXFhL5gDivJc/?=
 =?us-ascii?Q?IxHZc7MG7xRls9QVzpY5h1Ba0AJBAp2B42opo9kgbMfRMsk9HUzjkkUs/5Ey?=
 =?us-ascii?Q?b7giGaMoXg1f8CuargEXHhw1H5aZq5U5qy8MmRZj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4fb4ee-2b8b-4c72-3231-08dcc2548ded
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:45:59.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeQeazW7htP+JBumQJCwlCke2apNnn/8vv9QcXR2JVoHbiLxq0CegHwEtYdMAJeFsq2BzsCHdsH15eZspf9UUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the global sclk variable.
---
 drivers/rtc/rtc-at91rm9200.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..7be8a257829e 100644
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
@@ -498,14 +498,9 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 	platform_set_drvdata(pdev, rtc);
 
-	sclk = devm_clk_get(&pdev->dev, NULL);
+	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(sclk))
 		return PTR_ERR(sclk);
-
-	ret = clk_prepare_enable(sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
 	}
 
 	at91_rtc_write(AT91_RTC_CR, 0);
@@ -521,7 +516,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 			       "at91_rtc", pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* cpu init code should really have flagged this device as
@@ -539,7 +534,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = devm_rtc_register_device(rtc);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
 	 * completion.
@@ -548,11 +543,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(sclk);
-
-	return ret;
 }
 
 /*
@@ -564,8 +554,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
 					AT91_RTC_SECEV | AT91_RTC_TIMEV |
 					AT91_RTC_CALEV);
-
-	clk_disable_unprepare(sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


