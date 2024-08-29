Return-Path: <linux-rtc+bounces-1761-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11964963CAF
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B90FD284486
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4689D189502;
	Thu, 29 Aug 2024 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QRBzyXAO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55519188CBB;
	Thu, 29 Aug 2024 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916165; cv=fail; b=EZRvVmLrFHurBoO5hWfNsOiHi/3CNhkgO2gVCtYiqdyPz936TX0DMeiIRSgaVgSRttQyIokokT9sLiYdqTGk7fvyWLk2l5R39PDqku7tIkhvTuc9ku32kvOYSc9QgDhFookbFzx9VEoQyAIuUvGc07dwDf/l1PxTrpcXazEu68A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916165; c=relaxed/simple;
	bh=cT6lZHUXAL3M5l4p5lfRnf3CleaDt4fo8YrTbkKBtlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L6uGzlvRFyyt7SeAkZPhDx684AYWJZAf23M7tQd7gaiCYc6zcYnRjQt2JYCNYKYG+L+cYa9ZHm3/vbEbX4xNHn4PXLp/wOi/aD0hCXIzAdVpjhIoV0LH+kzoQKlXIfXk7T5lbgkkrCK0yAAQQ9tr1/0ahpwqIcWEA7LpDuLxmYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QRBzyXAO; arc=fail smtp.client-ip=40.107.117.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtV7SGl9YxTgz528qO5ZSdOdByj10UET1+zV3XNch9BPNvzfMRF8+Hl8gAxBVNrINwh/yD/Mz9KK3IwmwEDL/WCu1lAUGH/x3QNwvCEtvAfv3B0MjRacbZI4jltuoE4scjoUWOW9pLZUG6dmMhILmjItdoMdR/Q5qiKIv4c2ljFypwOCgteVCRVXM6opSkd9WyRU4xRtrDShFIF+VmHipPki7+4B6swUCnCYyqcWsIRTKiU68KHO2EMkEOoNb+yuH3nFMYHV1SobzGGloWh9WwK35lNfUoGSRklB3canGqpUKE5JuBvVs8pkvt/gIssnP8j4F7IaM35NAG6dqh+rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=PSHiPcHc3fMZh8giH1ezdOQed17au/y1BUXI0WLLB+f+5lKbCSQu6v9CRlSS2uIZwjYL0TA/2wSrVRqUuOGpM2d7ewOP5+KYrKm1Ro4ueD49+98yp5nLwO8ckdtJ5AATr217UHYJXAyxV5KD++WSi88+ZO4EktxWvBebBj6FWIIsfcjzwJsjJzNaqv1wAf64vW4+39bNpn8p0uFIEM/8bchyeBV2lIX6kbc2i+rUe4PC/DKr+ErVkW0P00y7VW202mcZTwBaAj/usoM5XcVgsR+39WmVHOTxCLKh8obJqxLWPocl2WmIvEYsbp555bKwadGlsAYP0P0X2OIehQKnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=QRBzyXAOJGFKIvgMa9eYyhC9bkqlE1pYIozaVLmzHFWZOx2EireePVwUCccfEF0bGu6JwaBchzQsax5YYAi5YMDr3ddvDv4+e+YKUhOfYjbj0JQU0KdI685mMOWCT9XqJtBPH9dodn8BqGO8UZqOtkV26DTmm3QF2vlLcr6KG30TZ3UuMmYSpxz5tfvgwFAPXzWYe0HeIh6Wu0xRkrbs8wpG5qFfL9swMTz23rAMMaDBsZtoSstiTNZ1d3IRQk75C92raVaT5plYlDZBFz7dU70dQxizYVABlpfMlIRwDPUwn11sRnLp6G2xSepAqG7Olme6ntLCn49AZ5oPVD6oAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6789.apcprd06.prod.outlook.com (2603:1096:820:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:37 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 3/7] rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:05 +0800
Message-Id: <20240829072209.7253-4-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 048c82fb-ce00-4109-6725-08dcc7fb5bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NL+B7d0o62OsO3G41r3RUcBE8Tl383+ow48AsAOpbKUayAxX1/eu4f844Zgg?=
 =?us-ascii?Q?o+BvEDpiX1A+SGKwHJfF8BvBVR7s/fmSHmb0OdejE2rdziaeyv1BlXc2glp8?=
 =?us-ascii?Q?TGHnvg/SzVsAtEGWkjUAfOIFXHsgHnfLxIMWfVrLfjMt5iyLu5/is6XfrNAP?=
 =?us-ascii?Q?QBX8E5sJXmlqa3kTjTypiXnvB97FmYQ0wKM5ShBcyjHfVC4ZZPo6WJfPPDxw?=
 =?us-ascii?Q?+B87fafuG6KkMsF5i18lknFstrJsut5hYdP0b+6p7PW2r/j77p8LK7J1XKIH?=
 =?us-ascii?Q?jqLNGVkLNlUADueBSMDJIACW+qbt85JfUygb66PXEzuthInn+g7lfSr3OmKi?=
 =?us-ascii?Q?XWP0J1P8HwO7C9sihYBR6Eo0l6KisoV5E0WiriWmzuDXmclCYxQlrEa+wrbZ?=
 =?us-ascii?Q?hySj/cUa8+GqYtfOGr6lHttfAWVS5T0ZyzhA+qCa2xK0jVEWPi6HfdJayu4F?=
 =?us-ascii?Q?hmslIQzAAhZF60/naBYKhwg2fVrOnCRiFcEMbj6iqrDsHnCFSN0KAsLZziS0?=
 =?us-ascii?Q?WDO3klqmf6UfDF1GtOBcgB8EAOad+3AfBK+E3CZar5eQpfFw2H+cfxFU/WGc?=
 =?us-ascii?Q?dExmkZLua/1xD1kesubHq1a9kPfWylhtwflndkJV2taeEYkz1/oCuntho2ms?=
 =?us-ascii?Q?dGUxI/kY4V8k1see+UfsTJNXdJPYzV9wj01oElSewtF4GBFyxVxzPX+8wav+?=
 =?us-ascii?Q?MfuQUh1V8q3N3emEt5a6MWknbvPaj0X5qUEMAAwnPgC4v+9WMsL5P1FEFNWq?=
 =?us-ascii?Q?ycGTxrVebVawDFxZ27rH72hPbO37bhnxXjDLYBgj+0zK6xIVDDWg1bmVAoeb?=
 =?us-ascii?Q?xklrpgtDylXsm9jRWMRoTSu/uTQ6vMDczO9RDgHTfolKPlt/ykiyZPI34BuT?=
 =?us-ascii?Q?aizMYQncKED7sql/bXOwIN964EMUHWP1OqSpGhVgz9tMG8SIH0+4SANCY5ZJ?=
 =?us-ascii?Q?XcdXLghrgGtX6wS3XJIoyLsGf8UkuBEOAqmfgYGLQSohWGqiET8BXuSP+oHp?=
 =?us-ascii?Q?wL9VU5NMTl/2Ax5Rn2Oy/UrSgMuFM/eFExh1PkWq8aabsgisMrNDvm0yFNXr?=
 =?us-ascii?Q?Tz9dsO8wdKdq6rwvATNWl9Ez87LnAe++ne4lsJeGkbnU04KHYjFqbBD1ZsqN?=
 =?us-ascii?Q?qzAJX3vu6G4cB+TZkTMnsUK9glW8JnMxNWFhK5pXCM1NfolwKm/8J/I/WyA4?=
 =?us-ascii?Q?9RzquH5okUL6pVyYfRtPuwB/rd8Ck/w5NJgJP66+BVFT5ysBQoTdWgx0JMjv?=
 =?us-ascii?Q?b5rcbvE82JDsnhUtRM6YfsPyYyqW7RdXnfCK8BpxLodOaKrvd/HeHtUO/SN4?=
 =?us-ascii?Q?MOf3NTVZkR5HkJ577CeVV7ppf/NLaaC0hwwkrfI9oolwlTm7O/9h9TzzGaDp?=
 =?us-ascii?Q?8Qc4DVDRy4pRN9a5BsOx3Fnv5ZmXfbP2IOpaa/eZ7KRgqC8g7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wik6eFObzULyt9TfmhP9j5r+RoovUTey8GjP1Rz8hloo276Ef8ERy7n4xbSo?=
 =?us-ascii?Q?UJHgV49M0OkYNFOV7U2j3REOVKYOBXnUl+7KFFrNdeOuGWfJbmwB/ekW0nz8?=
 =?us-ascii?Q?bKcXNHfv3rcGwS6bAf6CdevY9emeOnf1hjjDsD8YdWeBpRuViK8j+F5XCiA8?=
 =?us-ascii?Q?dh5+gH8i8Iawue8E8c7niaDXHY/vYuDpgmSHS+gUdXtva9Qd4ghwzLM5rGJo?=
 =?us-ascii?Q?WNB46b+PKOBF11XID6j1Xbep5y0OGYIBqaWQg6Hphbbx8hSrJoeI82FgDeVK?=
 =?us-ascii?Q?puy0/hONtOc+mh0yuPmE4p1b1ztHKYp6Au5IXQEnO20mrzGF+Ixs8iZITD0J?=
 =?us-ascii?Q?a8cTXeHbXGZB0GU3tafBEt7WHstEP2PLkY7s3ytaGEZdUoeF5LOMppv15u91?=
 =?us-ascii?Q?G3QjwEtkRQBCgiO+vLGLE+o9vnFg9VHkbH/UiZgWxQgTiPZyMO9Zhpm9Eo1B?=
 =?us-ascii?Q?/GUOuMxOE+d1jPRcfy4epBKJOGKvps2B/pciDn7lrG1LWx4rliXH+OUet1xh?=
 =?us-ascii?Q?ctxvrTpQImzPcRTyvoSHZAkMcw123o5vrrjcFiynb4zQB6KtmMpx/WD7tklc?=
 =?us-ascii?Q?714fDlDItuvjM7Y8p0Yrn7s89yTYbGY912VHKt2CWMEsuOn+YUCPhCgQSeJ6?=
 =?us-ascii?Q?rbbjOKmhtZ6HluBeFc8ufgVja8qRTdv0Ns9EYtqOH2rNoG+idxAbJ3ImKQ91?=
 =?us-ascii?Q?TwX6320doQ4sBnkeTxwazMmluxHDy9f/ralCFdAMutE9jrXO+c1xlsndt0UE?=
 =?us-ascii?Q?eik+XfEXqPx3W9tZtI9A54KwsgcM8XO7LO3d0owM+2ayS809//gTj24CWPhM?=
 =?us-ascii?Q?UXKDiIPsEIo0oY10DkPDm77+0vJh6SWWcCML34n/UlxH0Im7fKsmxkvfULmX?=
 =?us-ascii?Q?KO2OhNebeFu+B8ez8rcs6swEeLZ86Rid5h22XuYy8jHK+tV3K09YTT3/ziVt?=
 =?us-ascii?Q?Kki2rr1A6UmlYmfib2tf8dS6v7s2AvsCwgyKkOMcHJNTD2ogpRTAFjb0s2jN?=
 =?us-ascii?Q?FcyjNiHZ5Am8l4qIpVH3dCvPFtpNOI3pYnKKM33XY0Xo6stvhVv6Ph+rV7T6?=
 =?us-ascii?Q?2vmVSP0jowh7FaDvfXQ7+CSYnmFGinE4Vew1xKdDzVFBFS3wXKcz4zd6D+l9?=
 =?us-ascii?Q?PvGYEK8mq+Vqo6XyexfLcTS5SiZZ6gAO2CwlxK2Y+s2r+IhQAW996Nah5Ed1?=
 =?us-ascii?Q?v/b8bm7BoIDtEnI7k4pNka111i7dl+Fs3KoG3avlsAkUuBWv1QcwTs+2GSTU?=
 =?us-ascii?Q?gadqVwdJv3+D7O8fN+XWHHhtAeZSqphaxiNt1HNQhYnjnn+JgUXrxiiXaxef?=
 =?us-ascii?Q?/vhVONtlW9uU4Lzm4vdiMC4wgSDDnnS0YgxZHGEZaPnEN+EaZbjxylMIgvoW?=
 =?us-ascii?Q?f8nlzu+G+rUiDqRDhiDksxTy9uAGavQRfV8epc+78ZgfIsw4CUK2AoW1vfN6?=
 =?us-ascii?Q?HhF5cT8lYFHlmnrImk9R3gio077BR2TFl4dqns6FUE+B+bbbRDSoYkqv95+s?=
 =?us-ascii?Q?tz0U75Z7L0BLH7h6hHGnhlS9yRZr2rb7WZ2yBr89AkAK8+wIALcrKXKJueA2?=
 =?us-ascii?Q?ksTgAzBe91VPGsA6Ose69eqjeHbLDRfQRiKFyzZ9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048c82fb-ce00-4109-6725-08dcc7fb5bdc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:37.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG6fxTAvFR6dV73zlrFjWmUSA53G0ZuOngIybyFBjqFihXYsj3h34RaxtbpPNzgGU3PtUnnTq3NZ257iqPu/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6789

Use devm_clk_get_enabled() instead of clk functions in rtc-mt7622.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the clk field in struct mtk_rtc.
---
 drivers/rtc/rtc-mt7622.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 094c649fc137..0a54e9844840 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -102,7 +102,6 @@ struct mtk_rtc {
 	struct rtc_device *rtc;
 	void __iomem *base;
 	int irq;
-	struct clk *clk;
 };
 
 static void mtk_w32(struct mtk_rtc *rtc, u32 reg, u32 val)
@@ -304,6 +303,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct mtk_rtc *hw;
 	int ret;
+	struct clk *clk;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
 	if (!hw)
@@ -315,27 +315,23 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw->base))
 		return PTR_ERR(hw->base);
 
-	hw->clk = devm_clk_get(&pdev->dev, "rtc");
-	if (IS_ERR(hw->clk)) {
+	clk = devm_clk_get_enabled(&pdev->dev, "rtc");
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "No clock\n");
-		return PTR_ERR(hw->clk);
+		return PTR_ERR(clk);
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


