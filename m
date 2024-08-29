Return-Path: <linux-rtc+bounces-1765-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FB963CB7
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7451F22552
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C9F18A6BF;
	Thu, 29 Aug 2024 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QJfUC1ik"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F118A6A5;
	Thu, 29 Aug 2024 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916174; cv=fail; b=TejlRfzZd5GvG03YlYDnlvdiiDG59Lcp22bdRWOCszUEQt0M1yuKWk1s5x0oIA5D588IG56RcJBpOLCBfEBfJZ5Qsj7Lmq6TizdK+vAUBJI+EpQSa3muaQMBJ+GzidReX7z/t0KkGy08q1GHDnaRgQx/70KKnYD/OBc83AnOksI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916174; c=relaxed/simple;
	bh=fvCeOzM/2tr4R/2po+LbywdYDT+YQHhhT05977+fto0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHfrKiQZzcq0F3gG56O4LYagZqpDfH0/TdGTGegQ6LmUlxrTmURnWboQ8KYWHUjOkRsdP7vvNyHiwfjwimmP/iku8hUwTaY7hqy3zqGPLRJfuWC+JR7GzkgYemp9F5RJ+UpwwHkfJ69K5HbGz3cvkhPM3xTeNtMcLqHNOX/oDYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QJfUC1ik; arc=fail smtp.client-ip=40.107.117.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hgl3IciXMPNVjw5SvqeT4m4koxqnaLBFmXOjpxUqsUg9vXHqUN6yjqU+mjgiPzPL3ZaBCaQ+fuXh48qhsZc6DOdrxGQqKwGweIQbpcxcPTAp69IwbIBLClf+kRF+4Epta63EQbjEcb0eylmK7xwFUe1UzJXJC/9au7OX8t0XanKiAm4tNISi8SBs6xeGSE1Ync8KKX7tZxTDNqE0dArs7xVTYnriGuuuf6MJw7D5jVzO28rvL2W1ZxVJLRnAlkcxnpi5Zy8MyacIurJroPUSgSDk1tTigjlu/PG3vsPj+8w9gRUhjVSQ5kqXPmbci/ZZbHXdOr5+584LecSLKiyjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4MgaSh04cww1AoAKkHYW1wtHKetG+6PDnyMgMtff/w=;
 b=E4Ew2kLYP0riC460vrbAXsEj7/PxY/rhj/8HQoh5TdRxxeIAyG1WfWBWf15YXrl0BNLtnIRYjsUUemxIGqh1KGrHfbwsEd73mDq8uHCW0nSnoj3nQJSVgWgBmAzPu2X2JJ/VCIMEOKnA4GSrET5fawdX5tIZRSIlDXVGkOqvvdqXLk1KmhzI4WndvBjP+cP2XGVFnyfgqffbvE21p1i0IzT2eQv9vV9kyBsQVa9TEQSJFBZQpi9m3v8bOnDKh1PCI5R2msoiZ74GbtK6g6RUo7156b43rrtf8SrC8tddHejGYV9IF5Go7eMxFAxSqGjjewnNZvyoXA9q0vF42aJ3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4MgaSh04cww1AoAKkHYW1wtHKetG+6PDnyMgMtff/w=;
 b=QJfUC1ikyMJI7/YqXQ/9RzgunMjc2Tnrnamul2iazpEB+U8C/4I4At+y1yzPN0bEP93mZRBRD1UMMaIEThcbMmN5SiXswdWDZ+R3097BoYdhLP2eaHIvGPWRKqHlkkLviEPqFDmj1e0XZBbVqNJ8w9WYVbrAHEsuypROURWlAq0VAlEPFAU5rCnuAMPoistv1zZN3n6+PC1gu3AuOS/AvTaoJvZyL8ozziECGDmhpWmH7bgFWy8rCiseTYzt46+leX1OuvOJvkE0/42P94aGGQe8XvtqfFtdj3PhCO+TF5bf4H/XmyPvvJX8jgdOBLEEZu0u3xTM7RWX6pxFGfZSPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6789.apcprd06.prod.outlook.com (2603:1096:820:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:44 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:44 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 7/7] rtc:rtc-xgene:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:09 +0800
Message-Id: <20240829072209.7253-8-liaoyuanhong@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: bfeac169-8e38-427c-6a7d-08dcc7fb5fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iFzcvrc8z2XIDRu0Ci+YVmaizOQquKK7/zVXP9gvTVJ/P8uYBXWBkv30caJr?=
 =?us-ascii?Q?AOSvTVg4C0mMDoiCK6t5Rlc5Qv6Gb0BlM1ytHpx4JAr+TmvLwJBloMi1qHdc?=
 =?us-ascii?Q?DCSGBnQujEWUy7+/2Gn8aKB5AUfA37NARBnDpzLliRkudR9W5ZHxHeHkG+7C?=
 =?us-ascii?Q?jePFQoMA1NoovsJ4q3O9/Q0q3ZikJ5yAhgms7/hauS5KBLFPlDVAsT5f6EMV?=
 =?us-ascii?Q?tkYxknBSBDU2Qy2kt/O7Uu4rV9oq93DJrwc+iyDugSGu15bBfmCRxzKtt+8G?=
 =?us-ascii?Q?ZKDkcdW4DvCebrU8+5+zyHctllRe1hsIbeYGLGvmSDDYRrlmJttK2WCRRZ6v?=
 =?us-ascii?Q?NSHKOMVO2tt4O7bE+LiWNYFwMnS4iQ4xXcHG58wCJKsgYPz+g5f7vIEm79O1?=
 =?us-ascii?Q?+NHKvtYtBo+hvU2kM62mrW9+nVctRtdk4gEpWIEH643VpSrkSqqr+eIxPM70?=
 =?us-ascii?Q?GVQ33VJGXLjDqRHOr3YU8pHQd5YdaKzD6eVOd5C7v+LcChPSRlexM9uZUj7A?=
 =?us-ascii?Q?T/40aK2RPIKIedRcWrWHGN65HGluhdRPk1nLFusQBkwumwivdZCL0Z14Mg+a?=
 =?us-ascii?Q?MDonXV4iA7Uc4E4S6xXOz4gvoHwIML381vW9Z1pZquPhkax7iWNlIxFk2OGF?=
 =?us-ascii?Q?NkJfqNwIjtm3Mg1AzNlQmumDiLjq26AgBaiL+YxaC55Ixj8EQgRXId9qaTAu?=
 =?us-ascii?Q?vFZyF8bheew15PCncdjSTdwWdrWk30fga/RebAJwmdjhyWSjOVvWhrPyWm2z?=
 =?us-ascii?Q?xopZfDxykIaNiMjpBx3MsLLoxaN9o3xrQi9QKRezqs3yliP7IiBhmpyQ20Wf?=
 =?us-ascii?Q?5eCsmvXxb013/Oj1GAyOZbwo8R5VmhJDrfP0+mLVDmENBmuKN9wuKp53oDYq?=
 =?us-ascii?Q?KNuBdEzMPtHEPxaFKRu+Zdow/sRzSHr0hHFizsapiUVUU6pM4AQKnHXYhSM4?=
 =?us-ascii?Q?2WZg3xCSQXCbBLhYyoXJbFa8puHSfOnERSUd+cZ6LYsGkPYJ3yHry5MGTmMS?=
 =?us-ascii?Q?Jh97g5UaFvzhfOTfYjb8dk0LvrviCW+IRDMp3ebl6J/uiA2qWwpaY4/iBFPz?=
 =?us-ascii?Q?yPQmJgA2/LZuz0B78fxT4PMC9BtS8LijTw4Pjg6nQ6ULboXFyx8Yravd3fdP?=
 =?us-ascii?Q?xpk1wijbFx33Za/VH363bJ0l3gm/2O6HbQUUlRauEG29fBdr4HfgY7l77VY6?=
 =?us-ascii?Q?y4b2jt/NydYibhi7J5y6yzjniP8OsDxLCvyHSrnjLRPgM/zmNAa2dH/W7tHw?=
 =?us-ascii?Q?kOPqvEsVgMnnvRHXaXFXZZvHmuCAlOnHwgJZlbfMrtjkFNJyDygx51Yhhv96?=
 =?us-ascii?Q?neOzzlz9Coq+jBmO12tIrTN+faM22q7WGr4weagwCoskO7w9uePLXmjCA1Eb?=
 =?us-ascii?Q?zESyjT4N6UVDuRP0XhsGfUQtkAUizEZuRT6M/AtOGA7thT0Tsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tjrcOyz3FfosVHLKA+Am9U5EK6scKkP4XjPSC2LSyzw2BHUt/bEUd6eiQK7?=
 =?us-ascii?Q?eGqIgKce+wIjUIIcHqZT5zRciOL44VHbdz2EJEcUiSZ8Tuc2PZicAQ6CA6Hg?=
 =?us-ascii?Q?WyEDFjMELwJbdq4aauymnaddjOFgrgp2U1wpL4hO2nKjSOnsqCCnTranVuce?=
 =?us-ascii?Q?wYYqFXIrJ1/4zWNWcNuKO9fjmT+5BDG8CWpraYFpGP/HjF8CtQ8Q+2WqsGvA?=
 =?us-ascii?Q?STjKzqnwl+KyLIg/xXYyRlIUtHFixb5BQRRLB73IdE+dDHq8yZlqzGj43Yg4?=
 =?us-ascii?Q?ZW9/AEyhigLUEqA6WiFCmUWnnngMfyNYjhZQCG+bBRbcvLZGp/axYce636Ja?=
 =?us-ascii?Q?EnpcXjXlYZqc8UXj5A9AOevLEpC8vRMRUlvw2NSOOZ+GhUHYYHBacQpJUWJ3?=
 =?us-ascii?Q?plW8dasQft357Ah8Ge04iVRCqxvTxnrXRzwKnlKIaZqOGE7eZuscGraNFgWk?=
 =?us-ascii?Q?gjsFKX+6NjkmLoHVctU/J0VGXcB303PS+2DYQw8955JflkrhC5uWRPKgRxD1?=
 =?us-ascii?Q?h8sqBcE4DyHj7L28LFcLZKWgVAxLrJCmZf4zgLvD2A5+FdcT4F2/xZSiACKE?=
 =?us-ascii?Q?sQyIM5nEbw3FhWwLmS6IAn1S/+QLBcKk7ThonEJ+l9wY0c7T5WFle74lKm8o?=
 =?us-ascii?Q?D0k5ey9rC71fM8hG7G+phbbNXn9Qvj7NQMXtUOTdesE2+Ks43lObRv/z4kzo?=
 =?us-ascii?Q?KCkTDKzDVU19etN0ggBbaXBJbjL5Yka8BGK/zky+PDYzd7dFQXTEE33Ip1Eb?=
 =?us-ascii?Q?K+j4cfkh1VzBNb3ZWiAkpO/sQIcWA16UAqR6DMYO3CYde5m2B/whHLNCv1hr?=
 =?us-ascii?Q?sG+kP1OcwW2+ChjNSrT/oQTYBBo+FdZmDw7oSw0odlnEE9OxL6bGFqVv/jXO?=
 =?us-ascii?Q?lyEag9vO2hpoR/HYjH0Haxf9HmHBzb1SO6b8CTekh/NCK6fffJsf4Ecy7THS?=
 =?us-ascii?Q?k5Qd0+8+BqG6Y73vSafk0+3Q/y9hM4uU2V0XoOpu5iID3W9i33+XE/kHsbDQ?=
 =?us-ascii?Q?kSX+fUqr14QKusXwPpQamYiuenVUgGklOwq4D9o0mSapeavco56bBmXbaWfM?=
 =?us-ascii?Q?bnYoaQ8aAm7YCS6GJPY1t5mrV/8Rveny1x0/vYVaUV1RDRYHH/gl9iVU4vuO?=
 =?us-ascii?Q?M7qbFM50H72SMVUOKw352nfs0FgRR4WNaeMiICj4D01L9eppkqA1KqDJ2Jsq?=
 =?us-ascii?Q?ZHTlZJJv/i5TtZ2iURfGGraGw9R10G8Kymri3HM9uwKdKskzH8XMu1vJn33b?=
 =?us-ascii?Q?9Y02nX1QUgu5l3ORX1zGOzpQeSfOEXCzkah3QzZgpIZcUeCcXOWuB29oIK+5?=
 =?us-ascii?Q?fxA/rGwMk7yOa7sqfGtKCLSLWyo8D0f37mNj/woDaNNglbEsElKS/+vp00Oo?=
 =?us-ascii?Q?Fr4+b9QOPIoTu28ddrKv8ypE67UxuDgPstuvHtCAFipWfXXir59+E/ojzu0Q?=
 =?us-ascii?Q?nlyA9WQIQ4vPdakrEQu4YHpNXdOFixyGaqf9JYxlB97UfZ7jdBMwk0p/hGcf?=
 =?us-ascii?Q?1aGH6ByuwdEl4pAqLnbT9EauB3ow4Z6qDyIpxTnueVIa2u8anrpHyIsOaRtu?=
 =?us-ascii?Q?9c/MFy4bgyoSGxvmE2AZpQZhlZQnJ97KT0aOHmBk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeac169-8e38-427c-6a7d-08dcc7fb5fd8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:44.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ7NNVPI0CHtIYaQ0/sjg3Xx1D/jUgbOyhHwN+TgNPDtnpOQqBsAnd+yVVJPNIHuem0xAJTXoSK5t+fvt39lPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6789

Use devm_clk_get_enabled() instead of clk functions in rtc-xgene.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-xgene.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index f78efc9760c0..cff29d18454c 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -162,43 +162,33 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pdata->clk = devm_clk_get(&pdev->dev, NULL);
+	pdata->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(pdata->clk)) {
 		dev_err(&pdev->dev, "Couldn't get the clock for RTC\n");
 		return -ENODEV;
 	}
-	ret = clk_prepare_enable(pdata->clk);
-	if (ret)
-		return ret;
 
 	/* Turn on the clock and the crystal */
 	writel(RTC_CCR_EN, pdata->csr_base + RTC_CCR);
 
 	ret = device_init_wakeup(&pdev->dev, 1);
-	if (ret) {
-		clk_disable_unprepare(pdata->clk);
+	if (ret)
 		return ret;
-	}
 
 	pdata->rtc->ops = &xgene_rtc_ops;
 	pdata->rtc->range_max = U32_MAX;
 
 	ret = devm_rtc_register_device(pdata->rtc);
-	if (ret) {
-		clk_disable_unprepare(pdata->clk);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
 
 static void xgene_rtc_remove(struct platform_device *pdev)
 {
-	struct xgene_rtc_dev *pdata = platform_get_drvdata(pdev);
-
 	xgene_rtc_alarm_irq_enable(&pdev->dev, 0);
 	device_init_wakeup(&pdev->dev, 0);
-	clk_disable_unprepare(pdata->clk);
 }
 
 static int __maybe_unused xgene_rtc_suspend(struct device *dev)
@@ -220,7 +210,6 @@ static int __maybe_unused xgene_rtc_suspend(struct device *dev)
 	} else {
 		pdata->irq_enabled = xgene_rtc_alarm_irq_enabled(dev);
 		xgene_rtc_alarm_irq_enable(dev, 0);
-		clk_disable_unprepare(pdata->clk);
 	}
 	return 0;
 }
@@ -230,7 +219,6 @@ static int __maybe_unused xgene_rtc_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct xgene_rtc_dev *pdata = platform_get_drvdata(pdev);
 	int irq;
-	int rc;
 
 	irq = platform_get_irq(pdev, 0);
 
@@ -239,14 +227,8 @@ static int __maybe_unused xgene_rtc_resume(struct device *dev)
 			disable_irq_wake(irq);
 			pdata->irq_wake = 0;
 		}
-	} else {
-		rc = clk_prepare_enable(pdata->clk);
-		if (rc) {
-			dev_err(dev, "Unable to enable clock error %d\n", rc);
-			return rc;
-		}
+	} else
 		xgene_rtc_alarm_irq_enable(dev, pdata->irq_enabled);
-	}
 
 	return 0;
 }
-- 
2.25.1


