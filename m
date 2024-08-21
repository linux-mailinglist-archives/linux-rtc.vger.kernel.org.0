Return-Path: <linux-rtc+bounces-1677-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899B9598CC
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B057282E71
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182091ECB46;
	Wed, 21 Aug 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DYVpyG5S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642681ECB30;
	Wed, 21 Aug 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232551; cv=fail; b=Dj0PbMj6ZMWZd9Hjxv7l5+Gv3vhwqiExGgVEAEDp4DzYy077xqu1RknJDSQz2wnLmSmD7lFkhPqLKri/Isxj9kHxbSBAcis55r+zotSEp7n4zWxsnkqH+pG5ilZeCTOW9cmsSwk2B4F/6rwN+F8Uwts6BmGPGB2m3UqDmf0ENIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232551; c=relaxed/simple;
	bh=sTrs1af+NefrbPT5hyU6znGsEDtUdNYVz4c60WxYrS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tGMKqKLlWTNRT5erdREV9q6h0PyXvIlM5B5Dv3sPxCP3nVXAW5zWYvGkQ96JH6hEqxHxRMz2z4GuIUt8xiazlnSdYPA4nKVYn1Ep7bezpjYRLX2By9PNPM/YjzpjXToIjB3VrW9UT2wF0+X3+7ux9SSmRNoKfdd07cmG2NMrCw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DYVpyG5S; arc=fail smtp.client-ip=40.107.255.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VolSG/UPvhWfnCjslgqecTPgKQL9NE2ou5DmG2qiT/ALE4tkdJCj7ybDhYHnsI9HALApRhRHdYBhVEOlif52lclOAcl1iXpejDq+Tahx9Tj9WjHwilTMeaAra5r8mHAWlE0NFwnmhCcUrNQz+4nWOlr/hi1LkDKnwgvCOJdh2oGNL2AogQDvm/BCcTQMVdB4MS6sbd/31qTSoRFuGbery0NoTogABEnJxoMfn780z8eJ3lT9BCDBJD/mVq1RGiwAVgKseuwuJ2EufXu6/RHZnm8Ck70W0YUgfM5SfP8nHwTT61bp7FLBLOVnrmfCK1eOsYGWmg1qk5Y6/7MY68blyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX85R/VLrGsa0e8uONqpXoV8xfl3YmN5hQ3ndbPJL/c=;
 b=tt+MhByA70Ez/yushzaeHa23Wb+PZgM/voylrIg3a7Xuw0Xs4khZ7y0kV9WYEUazOlF9LIxDj6CJypKSLbjK16ORJMXgULiGIK4KSQQajxxW3GiLcmbIi6Rm9mtIk6pNnPGW6A9LU7rMH6D+msA7K5OosPCbiZ2O8Gmulf8VtrEFdy69t+ZRS0+q2EpYme+mcsxn85KbkbBaZCOaco+N6pf1LzdfuPjD/jWYEJLIaAlE885IRiFiHcy2b2CudrEzEBdJaR2dArBuN/9B+iiEyp794BKcH4MM+esvGr15D3vsWMhf+QUVwK/bnyrx3k0m3z7/c85RODaWCSUNlx/hmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX85R/VLrGsa0e8uONqpXoV8xfl3YmN5hQ3ndbPJL/c=;
 b=DYVpyG5SUecfc8RzLhhEYZNEVWwENM6HM+uPTsXvVdd4TTBwePri4T9CBZnxl0+ysHZizgD832XFfwq6RgZecsrdUdY1x0KTIXA0eRZbYG3nWZJgNmfZt/Cyst/6vWGC3Otsa86gszkjOTuDogGBfGSM32oLRS1hFRdGOo61q430n4FgZ5Sl+80JAgWUeA4vv9A1rQVpINNtwST8Ds0LLoFX8PU+lhTLcU1nV+6Or/VHdIg9MRN0xrf8ay8Dg1YSDFOeoVpcXL2MD7vnofbp+k/NdgFqb+ICW1lkB5tDKhmWwLtrLai+jRMMrgGgid4LjkRyuGwW2+lp6WbFU78ZfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:29:06 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:05 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/7] rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:42 +0800
Message-Id: <20240821092846.20138-4-liaoyuanhong@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|JH0PR06MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffff655-d756-4ee8-3b1a-08dcc1c3b3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/nW1uxnRroxz46vVJLPn0cKHyEY1Z1TqniQOwb/ZQ61+yz4RY/rErkW0gWv?=
 =?us-ascii?Q?iHEz74Q3rWrrScyiHu3rRY98ZvT99uNvo3rwSqhm0BKAnGgOos2eE1JReKBO?=
 =?us-ascii?Q?JuOQbxlWC1hj0E9XYdRe07cqle4A8RYg+tbi9o+XSU76oHNFW3oLbMA6uBnQ?=
 =?us-ascii?Q?BhOaiGX0+F85ysoJ2odj5xJInsGP16Ilch321AJ+bTdCRqsM08cmll2v3U7d?=
 =?us-ascii?Q?QBCkuqYC8T/+x35av3ymJIKPDqyUlBxBaQimiOboNY5W08VeBsJpmPcx6bsH?=
 =?us-ascii?Q?1M/QI42tfm91CNKgerpKnQG3eGwiC/ZWI/OC47gla11PY5kqTbaIazECpZYH?=
 =?us-ascii?Q?nagtectPnGi66NswGQw6k9R/M3t9LVU4Ec8iqoJdniLs2xdth3PzQ9EUFTGT?=
 =?us-ascii?Q?fW9lH13+cX3kG7yAY9cGZYmN8DCTpP49MK07XNvn6Hv3nWWWZiupYCPJfohl?=
 =?us-ascii?Q?fSuJFI1LWJO04Oln7C4uD8i1M+srCuxqnGNHdqL1CUenrbsoNEJ8u9ZCU/3w?=
 =?us-ascii?Q?LH7Pku8zwgUcAfruBbHJwjL+QnpTcvSNbMJrvtnIkwiPXBisRo+LFnm7xpcg?=
 =?us-ascii?Q?BI7uTO6+COyp1yBKiOupXxZTX/qBub85NbGsb0iZ3LAP/PAG+MwVApSAn9zF?=
 =?us-ascii?Q?8GEgXG9X7t5ygU3omgZApDB4a3o9Yfh7zCOnsKCmDLt5NhzB/YUFKjyYOyVj?=
 =?us-ascii?Q?/VnzxBmnNw+ZmpyhoXyrEFxOzw976EAbou2R0eEj7JEFa+rKVmv1YDIpNEHW?=
 =?us-ascii?Q?D3X7yUsVsZW40ET8TkyCcXpsbyDORoNMRCExBLChYnCXFG8hHce2aORk+oLX?=
 =?us-ascii?Q?rdeDRXMwOURBUvLJsoescix8RJPXWzYWmZgi54e9gkLpsK/YNGQePKmatpPt?=
 =?us-ascii?Q?l4CxrANrj8U2Az5RZAw7wn88cvH53F/CxC6CddfGbe2zrMxc32ho6bl4jqaQ?=
 =?us-ascii?Q?OoZ+hQIU92zNvOoQHshRhhpuc348fdv515keKa5wyNqo1PJALpjSM46tY1x4?=
 =?us-ascii?Q?RFIiIhJd64xvsOUgSWNghhJBcrCvmgMMIwQXRUDTrQ5K3excH/DRrVOC7d8h?=
 =?us-ascii?Q?0Ilg00vU3r8CRD6MszwmaK8ppRkQSWisASTrYe4o2JpHBN5+RDJgSkzzdOsf?=
 =?us-ascii?Q?im4l+LsvTkkgd9FNvfeK5udYiFsnEhN753o7YEb/H7pZ6wgCvunoKPsrRL9A?=
 =?us-ascii?Q?AHWoKY1+6WDnp83V6NlRbbigxqjR4OliDcdk6eDrAacyRBaz86LPZuUslIko?=
 =?us-ascii?Q?hNiP2o/5ffnkBMoDzMi7ErhAFOXkBjlBHosm7eXcgmcFtg+HgWSVyh/Z1ZPU?=
 =?us-ascii?Q?P5qkk8Gsl/JxMksL5YzVBBotrSPso9J+zb/yMdCVuHUZaGo+hz5m82I+pDUm?=
 =?us-ascii?Q?QHigow9XxPV7nqs2owXMFKdu249bgOMBu7HTzuBdqRzR3rxGiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ayB2/wqkbzI/2m54Z8yUnAywRh8YUN4gWtcGYgJ8QlG5LGgXuwqUgdZma0Az?=
 =?us-ascii?Q?jsGYNlsSyaDDVNWzwSm8O1bj3nyzF4p9u0s3FuXA5fm1OcX3HZB6p6aRHNmr?=
 =?us-ascii?Q?lje1YqgPj+JdE0we/7tDXpkWo39sEl0UKtJEnANLiDB//6turK4vvMluWV6C?=
 =?us-ascii?Q?X0G0EkQ61Ux+T8OEpT7QdSrI0443anOYp7gp8XHOG2O12hx8Eb9jNZarA6Fh?=
 =?us-ascii?Q?9KrOEVkSgn++KEDt0zoEOxvnYxjvSXdFDXLF4qR8hipkacf89i36PzhCAs/S?=
 =?us-ascii?Q?GF/5Ob3NyR77lm2QfcDhfjyKHVYxB4wXHJn1MFrg3I1ld67a86XzyT5ZX6Lq?=
 =?us-ascii?Q?B9xDPgNQPs4Aow45lhS0wAwR0HqjTTeo+Ez/amnX98UeKc2uhRqcLWtamBst?=
 =?us-ascii?Q?bqEsxns0cYMaepAKh1/lAT+PG64PLgYr2YGAEc2wm6nRlpdK7/OEjTyYmwNc?=
 =?us-ascii?Q?3FqnOjvoHeA1+nEW9HRyj/Uwpcdq/SaTSxjj0LOwp/lyMyOH3XzMgGwfzqgz?=
 =?us-ascii?Q?Su8eeQ0d9w7bajdDRhueVw7gAIGHY1Z/dOupP7x4df4SCuK7k0pshQINGIKw?=
 =?us-ascii?Q?NxpQqZptGeK+pfVJipJYk5NUIE63WjQPbTdNtLaKn32kfWW8iLQqY1H5Uf92?=
 =?us-ascii?Q?dc9Rndp6VyWE2q5wkSxXt0I9YcxfP4Uv3+3yXlThAb4jsDcpCQR0+r9es7ze?=
 =?us-ascii?Q?g0ToxMemzXtFU6U9Hlvk3K1kZakgeHJ3u+XDqtilDRNYN4pcaeOGhC160NsJ?=
 =?us-ascii?Q?7CcqJR1nlsxj/xAEIrEoa7XZEV7cAqkHCoqEjm3u0mvPrdcz23J9D0e1hO+W?=
 =?us-ascii?Q?DQFrEwp73/17UxYClF+/0VhCa9uhTn35GlSAf7ws0OVCuDDU6Mcu8WanvRXn?=
 =?us-ascii?Q?2bPtfwfR83iNPcE3qyZJ2frqAlA9Zvg63U+KHFBU4kUHYio59IxFx9JDxcWv?=
 =?us-ascii?Q?8TE8oyBRtqQVd8gLgoMeWIy6t67sH/BVpdIebGtePSqAyFBbUSZRJngV8DWJ?=
 =?us-ascii?Q?YLx9j3IJW1k0b2cpIKomNFNGN1Qf0i6G+GccsM5qVBBV+fuIYk4JGzuk+56H?=
 =?us-ascii?Q?5TbkV/7ombPDtcWrLI5CT1w8SHRqjufsv3TFKc6yVA5Dlf/h3pPjIrFKngGk?=
 =?us-ascii?Q?x8SsMgQmm/vp72m+j9ff+cWG817dKuH//w66cH6wmlqfLqPkcmlHcSHuZR1u?=
 =?us-ascii?Q?6OjzA0oxuBa990x1xuTYYyj7I2h89mAXSuAzMV6KX1l/SY1xh/Kintzlw0Qo?=
 =?us-ascii?Q?9kyLOCDVRnHsWJOIycAYRtfRjnkpvvauN64Lv3H3EGrbH6NCzAsHNP8IUHwo?=
 =?us-ascii?Q?+pMkO8AioeJmlVtKmeJp1VUguUQqHMQ2tw23IuFC/iv3Ch5BP0+1leSoGjtJ?=
 =?us-ascii?Q?H9xnS/gsQ6PoDlyMG+MOP5cTEuoING6dW+8zXwJgloKqRxtBB0a9gQNX9H95?=
 =?us-ascii?Q?jxLqKxk7lSoO8bblpyl+M4lrG1XlojWrjwLMyQA2bv+3nh0iCqDUhoZAvXph?=
 =?us-ascii?Q?IYChf6F5++e8E9LOYYPGB7IK84rh34hkRMmS+fMR7gw3pJTzOZcJs9Hvlcf7?=
 =?us-ascii?Q?na3CL8ySP8J/jceHn8ZZNEC2cCi7e52ozlmYy20D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffff655-d756-4ee8-3b1a-08dcc1c3b3af
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:05.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VghUEysWhfEphn8OrxoUvu3bIgTujPM1CQnWC8vPggk2qGispk1p3wimCT1cPVyWpM4ITrjCyIACPccY81tTvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

Use devm_clk_get_enabled() instead of clk functions in rtc-mt7622.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-mt7622.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 094c649fc137..da1d9652d6da 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -315,27 +315,23 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw->base))
 		return PTR_ERR(hw->base);
 
-	hw->clk = devm_clk_get(&pdev->dev, "rtc");
+	hw->clk = devm_clk_get_enabled(&pdev->dev, "rtc");
 	if (IS_ERR(hw->clk)) {
 		dev_err(&pdev->dev, "No clock\n");
 		return PTR_ERR(hw->clk);
 	}
 
-	ret = clk_prepare_enable(hw->clk);
-	if (ret)
-		return ret;
-
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
 		ret = hw->irq;
-		goto err;
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't request IRQ\n");
-		goto err;
+		return ret;
 	}
 
 	mtk_rtc_hw_init(hw);
@@ -347,21 +343,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw->rtc)) {
 		ret = PTR_ERR(hw->rtc);
 		dev_err(&pdev->dev, "Unable to register device\n");
-		goto err;
+		return ret;
 	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hw->clk);
-
-	return ret;
-}
-
-static void mtk_rtc_remove(struct platform_device *pdev)
-{
-	struct mtk_rtc *hw = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(hw->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -394,7 +379,6 @@ static SIMPLE_DEV_PM_OPS(mtk_rtc_pm_ops, mtk_rtc_suspend, mtk_rtc_resume);
 
 static struct platform_driver mtk_rtc_driver = {
 	.probe	= mtk_rtc_probe,
-	.remove_new = mtk_rtc_remove,
 	.driver = {
 		.name = MTK_RTC_DEV,
 		.of_match_table = mtk_rtc_match,
-- 
2.25.1


