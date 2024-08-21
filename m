Return-Path: <linux-rtc+bounces-1681-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B79598D4
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293CC1C208FA
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE111EE053;
	Wed, 21 Aug 2024 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="idkpE8a1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2067.outbound.protection.outlook.com [40.107.117.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6E1EA676;
	Wed, 21 Aug 2024 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232557; cv=fail; b=VZQ1iA2N3t+VOybWPqzK8aLBdg+VTr72PYuJUnq/9PSAMfpa+cpyBXyIt4lAL4/iKbt0Ed0qOb19p9abvgYZs0fPaDY4AD3ng7wi1YzLkCuPcbwl24C4rH5N1a1siNM4/NTkrrFEjy7MyJ48nYrlPKTwVd2i/NQ9GOHaCkmQAEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232557; c=relaxed/simple;
	bh=L+0nTnBwGyyaVYt0ctpr34Fh+dPCcOKwzPebP2OdXs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CnxSXS0rDHiOQEgEj+ryXRaiNBhvOd5l3mavYzZfhPvTSzqe80KtEFRCYudwQkyyBNpVjJzSehsiHBmA7syoyXXN9IFZ//pa4yfSuWz2i5T6XJ5Fdy7BmLamniyEV2fabyUNfKLfnB+Mpj8Exo9LVM7I68PEnx6x1qpHHD6g0/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=idkpE8a1; arc=fail smtp.client-ip=40.107.117.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+a0zr0T7BCl//NE8Atm5qlu/U6ZsIiPCTCW/4V/Xhi6frf6QpOwMUUbWR5sDjAe02isaN5FnEIzJiECj+W0sUMRo2rwV4dQx4fC6YznYRNgfZXbGKoDsdl5T6fvTMxMDvrsMzLU+zjFi85bazCCtN24EXzmoV8vWlVd2tzrcHF2cuoAXeOIoMyZXXijRXnd/B2CQ1E4KJ8TSZoisaeKBpP7a9P9dihiSKa3xg49pWnUXHD61HJW7QhpxAKZSCtocYs823wfZfYpoKiZ8jmwCX/FiS9tfAXsHKZfP5tYnug8yhl6CWwhGs+PB7zeCNe3s5aQt5PDEbXQv58/Nv2cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfJGTBnnQHpNSt3ROQlwAAJ4CMsk3ueNjLX19doj7Ak=;
 b=SWuOd0MeTlDQlxRvwWyM09ACepG96HGh9FGdvVE2K91Od5LAHSbQoCltzW+Jz0hG94/19TrY57l6+Q8asLUtxDLsauQJlqcLKX6bKWpKsCB7cnvdlkcY6m1tC3FUqmcZR/do+1/ZASKRvn4wT7q6oBg4rGiv3QDWKpscY3kXAlScvmJB7Ar6oRAE80Gkp9QUSy2McabSkaRni3OurYNeRBiW+i3J/DvgfSVADhMQm4RY3zxjJYb3gvZLiAKMjf5J+ZRHiU0YoCDP76ZZ8gJDZ8Ga+0lOBcpXDFWBMcMwGVjADsB7RiKCftxbjQ65hA5Cq5GH8ANCtehyXRgnYRfKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfJGTBnnQHpNSt3ROQlwAAJ4CMsk3ueNjLX19doj7Ak=;
 b=idkpE8a1iYjtVHbilO3BwYLA6UHdSnxfsrjLSIVMdMuJbm6qhZQkCGF0rkDD01va8PV5EtmXKRRmRgH2/SEqcOeB/mnlYU1N0RO0hYsw637HG4v64VBIkD4Dym5gv3590/6bDW86OCCMiJ+H/mXInBABYQvbiUwyn2P9BIrRPHm5NRQLOCLc7eHlnH4IUKF5EYGjWytJMz5aCUI8YW8AL5OTD3hky/jvcZ7n57UTq7T6sn1kPP7XJJREY2oL4jCzJRuTRwbnBdQtEFqg3JubyffihMipquL41fgKAPpU229vO4cJThSAl7msKb6bPUJWevEoOuD2xFXYz8yUfKj4Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6093.apcprd06.prod.outlook.com (2603:1096:400:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:29:13 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:13 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 7/7] rtc:rtc-xgene:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:46 +0800
Message-Id: <20240821092846.20138-8-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-1-liaoyuanhong@vivo.com>
References: <20240821092846.20138-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: a668406b-b7f6-4e4c-c3cd-08dcc1c3b7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C5VyZzf7ML84VNuE/Sr5th+nlLf6GOjHRUoPnvHeR6tA/0V9SYLa8ltc+fn8?=
 =?us-ascii?Q?9GhvwR9bpueVHhef0TVj0BKBl5U++sgptWKzPOKm19Y7fq21XpSPqWviMU43?=
 =?us-ascii?Q?4hb+eHXMW2jTFMBI/p15FUkpD4zzzn3d4RRgUnjc+G8GEh+3NLqQvdZY2f+u?=
 =?us-ascii?Q?AAlXoOiFdceZnS7xGTEZb8JQJpk+y+rfaWPtOrFyL2L+5/akcCyDXOvDlGc5?=
 =?us-ascii?Q?heJhVdZtf7bRjaLoRmvVu8qrf836VDJsL28AHgL2NEZI0AA2LHJoV2ursCJ0?=
 =?us-ascii?Q?/RSMb8ahLbQ6Fv0JPk4bu/1GEhiKLQsNaMSPiSNLBpD0K2lG6K6Dkn/4aqfX?=
 =?us-ascii?Q?sbkIGKqFiJqk7SY6EYUJ+kZZ8pPiMeOsmeAWXZGNd/rcMQOrWP+WG7VgZ/Ue?=
 =?us-ascii?Q?9IbyOGymL7J/JZD3lwTRoGZtcIF7BK2g5INax+1ci6VKd4RLz9T1Kx1lcmkk?=
 =?us-ascii?Q?EpgznoOkvNZpgrkQqs7SK2fF4MpsgdA+SxfokUsEZNDnfN7dT1N4mnRcS3Re?=
 =?us-ascii?Q?1U/qPTI8Kqgn4Oao3NrlTuF09hFvhiKsred44ufNYxrThXJzzWAGDt8CdoOk?=
 =?us-ascii?Q?BHbi3EW55m5TekiMQd2tbPRev2CnWFJivJ9hpMu4Mo8+2bcL5Dwpre5vTuXr?=
 =?us-ascii?Q?4dY/6XsQJMjb3o/ewUTkzwaK/xOJTRZcxKSM5eynq2GWAUvLt1AL9GB2WLI4?=
 =?us-ascii?Q?dyRwNvh8jbzBn3p0M30xH6MO9PAHXgM4kCQ9nT9pUBFknw9g9iBSt6wkTWFj?=
 =?us-ascii?Q?e/9a+qNE2FCb9/P7XJfscgMWjBicf2L6oJy0Bvwulc2kTZ30ldMB6pjIGdFX?=
 =?us-ascii?Q?xiAIBlsYP7+15QQTzMjh7CiuzkAWFiJShbqZPwYCIBm1P6KqdL6ldJ8mG2mO?=
 =?us-ascii?Q?9ft/KiC4kajPxSU44haw+BBjUBdsTFmXQP6uZoMI+VJI30B+wrRv5K6FI8lc?=
 =?us-ascii?Q?z8rjjVDTOwMxEIqItdWHnGGE5vd5ZT/NRiDFX2vllkN9hRVeq0N9Mo8+7zOC?=
 =?us-ascii?Q?rdpPdLw6145Z+tsBraWv5ag5XpHxI/hLddIPC49jTPhjLl83R/sY5zOe1nKh?=
 =?us-ascii?Q?HR+MTC57BOyop90G0Ab6HF2jje7R6TDJxGoRg1FpZKP+TXDcjV4Z0iRMd8g4?=
 =?us-ascii?Q?vgpgJNvfzMKdFSCF25A4xupDXqYPC2TXovUkcxZwMsCj2LEKku0Te6bwfEr5?=
 =?us-ascii?Q?1UfZ1MRrg01EgcXd3vwAM+pEyvx/l/vIfZuuuj5FSn1X/KTI40UcMFosVw5V?=
 =?us-ascii?Q?t2Eu2X9M9y3dlnBoTnFnpRVwp15BMM98ESYuYOrY/dfdcVu9cLvr/nNkli+b?=
 =?us-ascii?Q?Gn5pi2YcC6oNca5BqywqvNlFgklU/M8PTuUBGRbN7duGTF76OfMFcwdxgxpj?=
 =?us-ascii?Q?cIn37omV1h/8wQoyFeX5XBMMReZp4xRw29VEhvflutwkA36Fzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/bEglT5BDGNlRwON9jKtyKdkK6EHc5jWD4W/zaE7Y7DZBZhYiCKMOxUYeTUk?=
 =?us-ascii?Q?NwEe1K/3172ReXHWcLEJ7zjCFLmJcwcpuvNdZ/2ttNzjSkIAjf8cwe8kemvZ?=
 =?us-ascii?Q?EyavV6ZbTkTnza9ma8HKHZvXch2uYy05l8pbOQ7BIr+1rzk8YricMrzqQVPe?=
 =?us-ascii?Q?VPsyaOA8aqW2fsm2jY212HGwIcC65v8bNE3gWyqg1Ku/NqCaFAnclBGDZMlX?=
 =?us-ascii?Q?Sn4GxTpHyj1Cu640dvaSUj+ZqcfNsGMz4FTA4X362c6FxLmqN2GSTCVBs1U+?=
 =?us-ascii?Q?jrxb5S94ERyVKY9pjq/sgc9arJRrFMBCbBWTgM40a5rZW/uNRB4gNXhrP5ve?=
 =?us-ascii?Q?DJokzsw1p/beapI5dFOi8XnbMWsIRHeQYzqaguqGHBREjtEKEjxbQdoINKlQ?=
 =?us-ascii?Q?7kCF0I+MmvH8lPhq3vROzsW9YIFETQRvKWcS23Tc90Pu17HwuX/EE40mM03E?=
 =?us-ascii?Q?0Nj1zNXaMmjaWZqGvMQrLkA/7v57IZWaibJE8C9EF6vblS/TZcUl/a+GNCFM?=
 =?us-ascii?Q?j010Lo/7lf5zDNtSZsvvcgOyFNSCI7GT2CVUJezmYFSQ23bvIK0YmY1jKAed?=
 =?us-ascii?Q?picQRpNUIB4CsbSxnaZuvRKmR00Rv7L3jwaEZHpL3OdL2MzjkKOKgb2MbtQd?=
 =?us-ascii?Q?ruKzYQDyJRuwJq5MZywxwJ1X3ETxQQfyq5WqT461n4ZPTwg44X3RkVrAr+fC?=
 =?us-ascii?Q?Ebzd7L5PdIqadSmpDG7S9wbzOZjOQx1j+bhcOkb8JNfX3NW9zwncqnTbZK+h?=
 =?us-ascii?Q?YKYbmSoohTWmf93/mdD0OFZwQw6S4gVT1Y+xrjIZA+ABd9OU6mFUKtmPNrVU?=
 =?us-ascii?Q?CYvC49sanvDdtHebghyN7k7wGXW1vwLTDXuVzmo2bNT+0cr5FQ1G6Ramy5zi?=
 =?us-ascii?Q?1dHGVwNIGLCHzVvVBbBNSNcHd0eIOZMCIJmZwLEcP/hmR0PDPV7hEfum1P0T?=
 =?us-ascii?Q?gorxDz0z671QD7n1BUilsWUBuwlmfVyddpNSy7n+ypj6P1SuS12i3DuHCTay?=
 =?us-ascii?Q?db9UkouzOvLChWBnipbXytvwzIe38YXtejngF/lGxE9rQRFtp1OASRtPMIXS?=
 =?us-ascii?Q?4Uaj6NRYCWEfjXb8UznuUgxbdkqfN7OJXWsIp1RE5oGXEwqm2NJp9WTovcgC?=
 =?us-ascii?Q?+q/TRmygcptQqoR2yNLP3osQcHDffjks6i+WDIWU0hTjNm/aAdNAW2KJFEsr?=
 =?us-ascii?Q?silwNxDOR+/vNQjBlGdSMRjwL8jN4q1eeBMJOFpuWzozr73totvmr2nZsyx0?=
 =?us-ascii?Q?1WAoNqjM4N1Yh1l1uwxfyWL4ev3PMUFoZD/kp7Iy4nxIavztV1c4pEuitRrZ?=
 =?us-ascii?Q?HerwOnFizsEOVHA7N1VCPfvD+/8YdNrHn0F/E5i4vRaI9RHv+FdY5VMiVUIR?=
 =?us-ascii?Q?cRV5qV7OIAQ9Uc+XewYX9r5eqSYzGiWI1PcZ1LAaurvJgbtaqlB5BhQv0DPD?=
 =?us-ascii?Q?oEOTCs9DFQXE1v3kPDQhSKrKUs2w2NX6JvD+5LnPGdKkXL1V580/USOuSBca?=
 =?us-ascii?Q?WMbIRcGgKyK/Ygzot743e/6DfU5rARbX+iPph6heAcFeDS5LSz1huJFZtHcy?=
 =?us-ascii?Q?QYBTfYJnwwKFPdYK3goNZzNCZbaERo1ag/EukqTe?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a668406b-b7f6-4e4c-c3cd-08dcc1c3b7f5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:13.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79wqwf2HoZdN+YnrPdIXj/BznEhszUhjkxf+1MC+yAsC7ixohEoXEqp/YRaqdEsiKa+XHnXDISP4+x08MGqyKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6093

Use devm_clk_get_enabled() instead of clk functions in rtc-xgene.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-xgene.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index f78efc9760c0..96567c3906c1 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -162,32 +162,25 @@ static int xgene_rtc_probe(struct platform_device *pdev)
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
@@ -198,7 +191,6 @@ static void xgene_rtc_remove(struct platform_device *pdev)
 
 	xgene_rtc_alarm_irq_enable(&pdev->dev, 0);
 	device_init_wakeup(&pdev->dev, 0);
-	clk_disable_unprepare(pdata->clk);
 }
 
 static int __maybe_unused xgene_rtc_suspend(struct device *dev)
@@ -220,7 +212,6 @@ static int __maybe_unused xgene_rtc_suspend(struct device *dev)
 	} else {
 		pdata->irq_enabled = xgene_rtc_alarm_irq_enabled(dev);
 		xgene_rtc_alarm_irq_enable(dev, 0);
-		clk_disable_unprepare(pdata->clk);
 	}
 	return 0;
 }
@@ -239,14 +230,8 @@ static int __maybe_unused xgene_rtc_resume(struct device *dev)
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


