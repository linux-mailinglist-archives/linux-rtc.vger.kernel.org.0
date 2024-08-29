Return-Path: <linux-rtc+bounces-1777-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBE964428
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8053B1C212E7
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C361ABED8;
	Thu, 29 Aug 2024 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NLNVblNR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C11AB51F;
	Thu, 29 Aug 2024 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933734; cv=fail; b=aZze3cm1RCFN2WIht2U4V28Cds8ZKCuLI0zLuhqThVvTVSnc42I2BsuzftuJM/cpT8L8qyws2AKMmTLm5GPpWPx13xjPKjREjFQSXA3B+hlL3BQkrnkQO9unAdXWBijVhUDho8cAwvVIKYT9PrWJnGVGFeq9lvyoBvAjocNm0EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933734; c=relaxed/simple;
	bh=Rh7fg2fys7ro4frD076aYNZDOCJc+eW8AmAacWUrzvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AebO4wC3c9WyCSlIN8d7awDcswpWY3zM+Oepa8xMwvAmGTLePZCzwuLWaxOYAD+rnfN23ISLdXcUKKqhOU3U0HUKa63dPC4oBbf7uq0lYk77LlJz96em+qkrYqlD/szZrYsQQx+e2LeUrnJDT7/R0JEZIBXe9tX8lxcTbhTXaUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NLNVblNR; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq+QldF/M7q0MUkOiNyxFYN2ub88lYtlKkrDv1+nJRObb7EjJO4ET42bYOkcMgx1Je8/K4j3q6t+/mt+BaHsleyRUhb0yGqEBJSXJgDU3BBR6sMw6lGDayX3VONmnbuAoAIW0aceDok+dMQD5nTKhiWdUH78gTHCVQcI4ODR934Pn+1ikunAynjao4NLGeqdOGwR4PwY6ddfmQetDxSGQzrdnOqrSYGOItyXQ5kzO88GEXyz2eAVRyy8gpTrpAR3n1JlKVuTL1qBeiEDcClD9Nr2baw4uSk5Ugo4TlB+CR7IPMvIuGWGuikhkpeJlWfXoUJe2vtwmkkTAGb4E5aXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0dVaVadPtklIGYcqUIiT+utjE4NmcO21xn18/2s0+M=;
 b=XFTNBEMMVL/1KSd/KMj3A2Deh2QTlOeSUWE6sgu9yeO7277XxMhMQYcs4VyYs7Z8RRqZe7E0ovXuZ8SOOgxfeOIfR1s8cRTIiRpJ+k7HG6uud3DOSQNbnTuPxh+WVE75Mt4nB6wy3Gf4PXviiq/6vohRPlXWSwSZN64ik9mTOtZpSV0+7evDJ4RT0WQDCxJEGm4Vc1YJxfeFqoqDM3dbaLpgdtMtQgV0q6PXJssZl5GwX3Uy1v66s6P0Ls1u3IhHrX6DDCAd6cVQhROjBVj0Fc9QSient0vokF0lUS2qd4J+EwVkF+cbMrNGwwL3uxvzMaQjZvkv7+wqp1E8xcZ4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0dVaVadPtklIGYcqUIiT+utjE4NmcO21xn18/2s0+M=;
 b=NLNVblNR+uTs2fx9kq/HxHQgPPRvK4kYzKvX6gr0jcJV5KvHLsAD68zNhxvBjqg1VISK3+13MajhYjt+ST90ABV65bSP9aEIjWN+P6QszXzb5aihwZbRFiejUbm0eznoKs6hYGHH5xLqcAdVk+kY55w4mxFNj1VrKfYQcC+oUaV27FEkAonV5GtrehzMenWbLA1p/bmd6aJkdsImzH/20lwbi/NzARy9SMYQEi/PumgR9I03eSmWUik6Vkyxh+tGJWmdETweQm4WQIkZM/04eZN1OCfpOCJPTlWqSqbnptwrwHA54k0cLDpq/qSDh+CTXP/AWBRVosPRLA2or+1eiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:26 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:26 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 7/7] rtc:rtc-xgene:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:55 +0800
Message-Id: <20240829121455.16854-8-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1fe641-675b-457f-c669-08dcc82443d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6lrsp5Cnw1DUo/NPNzMQIPuB/vHH3H59/Xn2BFMFeny6vMNO4YLZcBK8l4Q?=
 =?us-ascii?Q?ijrmS24PqrY6KDjOkAABRLaa86EOezP0W2JmOG12PRnyOIB1SAUEda3QFoF8?=
 =?us-ascii?Q?Mg1UrgVKUs602UwcJ1Ig8MIa4T51Gt9PWyXo0BC8cYhcAJlLNjC8P2okrVT7?=
 =?us-ascii?Q?zuJbfnafbdnfBTJIIYCOgx5Nw2a7hV/Bk+VvLlbO8k0S7xFyimuumcBFOsfu?=
 =?us-ascii?Q?1FL0j1C8Vm6awJA2MaGouB8nW5ZHEP5/1FiqSroLjpfkfo9HCM2CnQ6QdyMU?=
 =?us-ascii?Q?V5/HP0P/mNTHxpdG5bkxni5tuu9YB2qmwAuhdLJc7irzdlV20gU+K8BmmRSD?=
 =?us-ascii?Q?ksvvAT14yHOaJ/7n1sahPi92LDfN5gRRt3ZWQN690a4gbLu7X7M+MqKzWfZ0?=
 =?us-ascii?Q?to0ntJcSkPH7VsYH9DKdT+s5IYQIYVHywDQUcGyYMxMaNJ5NrLPK5+9O0i4s?=
 =?us-ascii?Q?11aqVOov3jp3t7pqpVjMYzA1e7TnqGrTmBJiX9O3uAvzynagR6EK4z32FM8J?=
 =?us-ascii?Q?vrw1WQg6Sm0eRvfxS/V5uhiwGSU7EJXKZSR0JHTu6bOi1vUWe5w6S6HMHfrI?=
 =?us-ascii?Q?dbf4TiDJRX3dtHFonZ1vqcPRAinTepOetpXqh4klk1IHPrpW4660wvtjBL16?=
 =?us-ascii?Q?VrWsCQdYoVMJCJCL37cOtyAt/BBDBsuqtlp/nqI/pRkEwIEry1H8XXC01ay8?=
 =?us-ascii?Q?iYytx7GMBAtN90aGq0q4/ytG0wQFXLo/RF1jfj6BZlZrZ4T2u/1o6k5n4zYU?=
 =?us-ascii?Q?Q1zXvUpBjKGUkIFxohIAHfLMRC2RnB4d9Gw3RrCVWI+Ty9m05+erD99p8Klm?=
 =?us-ascii?Q?wfFPmyVyXHWYBjS8NP61JHchhb84yaR3I8hJ3iw6U4OQzIQE26AAraHdp2tN?=
 =?us-ascii?Q?wuOULArSLdEGXl6mfJJOKErIY5K5CuJOVhs6wvoVaMIHks3T3ADi0Ur+KGiP?=
 =?us-ascii?Q?JElyXf9CGn5od/+BiCNoWFds5uywQN3yv6z93fddZR2D2GJC4B5ZEzq7Lnyn?=
 =?us-ascii?Q?8dxeElJncGql9hIIfp6xa6WoPyj82dJvaxmMc7zNDiZxNKzxNHEmtBNNBjFa?=
 =?us-ascii?Q?cKdwXzaDKXJfNVKNp1AZaNvEDAIN5RTPri4jWgxS5bznQKnFDknniBO2UgLO?=
 =?us-ascii?Q?qmZ6u7ZEQvz6Q+6rXyApgPbQWD4zMTP1MKpRNQv5/SQHIL5jMrWJe+O7BcB6?=
 =?us-ascii?Q?4f908JI49UJBs/xy0lxVKKDO8C42ZapzZ7cdHFtHx83Y729eAaoeEgHt8/iN?=
 =?us-ascii?Q?rxEhxdlAjEaQcqe1g/bUqFRKNkOvUjuDF5/PJlieIhTO86NZk32GPI+piDVb?=
 =?us-ascii?Q?0c4R3cDOkxUx494KVL43s+LDoV1XkUnR0ffPkTVw9Zkd8oSuuBxxEvrBcHRW?=
 =?us-ascii?Q?7WPlhKsLaEU+4Jvya+TGQAWbJ025Mp42VRWNcqfA7XrjrskcYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gvw4o8j1xKLdQBbcNNj9o+lm1CNGpg9L5JVGe2oclCVcpR0qMZmKiRV4ns9F?=
 =?us-ascii?Q?PCkQ3WbMnIEAwNfetZij38sNPX2EGpoz8ctB9NVjA3O0sVwbUAYUMYhn6/jB?=
 =?us-ascii?Q?w4hS1atqF2TfZwM9r2SbqztLOgPYbqpGqW5SqDTHzzWeC55fEzJwr4q4b1Nd?=
 =?us-ascii?Q?clwBp/gBg7n0sYI0xSjciLpKgEGB8cqfY+BIGdOAD5rX2CrIdITZRYyZl5Di?=
 =?us-ascii?Q?33n4noRMSzPLynfLPewlRRZlixdV7Xz2XQApVzkHSwlOE3xtb/H/Cd1LjIye?=
 =?us-ascii?Q?N2Ezd3uHh1sdfzpm2H67l/OwZk0DwcYicUF4sRqn935Wr4Uj+Pf1cBOIYYtQ?=
 =?us-ascii?Q?bga3AvIcSifF4eB/lU7Wdq0IED6kq+ZkHl9oZxqsLBfp/v33j6ZWXiaEIWbO?=
 =?us-ascii?Q?ThmoNeM0Cq5Ug/ZMrqe7bwb/nK1I/8TCAgFmiksEWii198q0Z5XS14A70XZT?=
 =?us-ascii?Q?FWtHWsD20h8vCLVSnLNWimIGBpMvJe8Zki97LDVbDoCyOHWgtUIm80WMcQT1?=
 =?us-ascii?Q?We+/tNYhBuPo81ndvcbB0hCPse2Yo73qUJzf2veqv+wJMgkWfUsctwBqJ29w?=
 =?us-ascii?Q?o9pOWUrKRBWpFYTEBsJERezdtgE04Ri+c084Agocy5/IcLH1R4sPqVsdrx2B?=
 =?us-ascii?Q?6Yj2sqUIXwDRynWKnxLPpGHXBblgjPJ17OMNvSs+x/XqztI0xU6D8afbaik2?=
 =?us-ascii?Q?IU6UJAOdQ4mI00H2bvTr3p8xmiqlrrSDRDTwMI12F34VKiw8PjMVZq534y7S?=
 =?us-ascii?Q?lLY/0SZKCqCwK6wA6V2pGCbYCfTsv0naFK19j05buAC2FL9YDAwBXBNsQVe2?=
 =?us-ascii?Q?mrxT8wgUN7d/5fBTaGUj1prd9hIknQh1zpVh/l3aLXd6Cc7XPT9DGx1aMnP/?=
 =?us-ascii?Q?bQB6tW4zgCSp2iQuKr12wypgtpcV8JfOyZk9yfx80Ewa5sXmp8apyYBpBjgX?=
 =?us-ascii?Q?C1SfRn16sOZ0ojm1EWG/YazQYDmq7pWHWpqHhy+lxvv85HImmPs9HhCVuSXO?=
 =?us-ascii?Q?LHvSHsuzfmIQ7ArZuTV65GV92kFCTxO1/3Uc90ewo11FduJ36BCdJPB7F1LN?=
 =?us-ascii?Q?i7K4IzyoWIDw4SJfmOHld/zshz205Aen5lX74Nex8tMv3vP4g5gP3Opn2ZV9?=
 =?us-ascii?Q?pOZvm7CNKgB7ekcVo2jgz1MJHYQuBEl/Dhyzki4nNAxJpKP1rSmPbp0FiqN2?=
 =?us-ascii?Q?gp2/0T8Rpfew+x2+kSv2xpGVHpn/kOIR1ULorvZ4vfxAWZd1gY3WmrSbMJub?=
 =?us-ascii?Q?x7032Iuigii0Td7oyr4IrKn1WZoAxqkLKOgGyFK2nuo5kqZBkgAFqIJMSYjw?=
 =?us-ascii?Q?gYS5FLh4pB+3QfMnG9t47DCIOPafwTIH9jFFSimd6igAyKHVgye1vg/Ve79v?=
 =?us-ascii?Q?AegW0DYOQK+qUy3M0zDKJGghPHqUjl3nWeyxjAc9SIcbd2F/7I3KCkwJp2Ev?=
 =?us-ascii?Q?TMSCe/gNHQMy7WplofeSGNhczqhdfFoShUdPB4pqzydLv2LRJ4GXWhXb+20b?=
 =?us-ascii?Q?zx4I1Gyb4//gIhby9zmpAOAT8vWBuBXaC5sTlWBiANSPvl9Kl9Q48uERb/pi?=
 =?us-ascii?Q?hEoJVg41yAJPQGboa1+VcwQD/VcybbkEx4zlAv4y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1fe641-675b-457f-c669-08dcc82443d5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:26.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u8lQd037kN03w/OZIZwpxJiQAbe8+VYZCbIBO0L/h7Pfh12/3CU72A6kdiQxsK8vLmDy4rEzzqJtStgYFGA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

Use devm_clk_get_enabled() instead of clk functions in rtc-xgene.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v3:Removed erroneous modifications to the resume function.
---
 drivers/rtc/rtc-xgene.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index f78efc9760c0..fcdb349b7399 100644
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
-- 
2.25.1


