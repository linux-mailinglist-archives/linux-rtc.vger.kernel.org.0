Return-Path: <linux-rtc+bounces-1694-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E269B95ADFF
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 08:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FFC280E92
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 06:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF86137C35;
	Thu, 22 Aug 2024 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="UJ8oZVFs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010070.outbound.protection.outlook.com [52.101.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84161FFC;
	Thu, 22 Aug 2024 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309461; cv=fail; b=DcclU/rHjPJDCsRFAdXEwtHU4Wby1AxskKjAjXuR2FQkD4g4newJwtkkgfJAxm86M+fyLdYR5OqwdbdFigjkUujWm1cwaeugwkXOBDAC12s8+1Hp9ubxW/sNMdGdjdXp3CI08K2GwH7yydBjp/gKYtraK9vHSTOB8WjdFOO1De8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309461; c=relaxed/simple;
	bh=zQz2lPXd9/oDYds20KmA5f8x8nR4MGqYfafsX8W5tYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Me6JFpT0ho0X/AHOCTugUPi/l7Mt6YT0ewxiV7471FY6+y1SpxqwX5lpuE7Ry4ih0ZkM8R6p+bRIlTl1VymyVF2WlFR2duH4lx7T2u3vT5LQ2wBoB8UTlZJpf24zaTdVGR0okNxhkJKrI0m/aXa3gxnCGi4xWVAYROoulkNvEv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=UJ8oZVFs; arc=fail smtp.client-ip=52.101.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZs14sSk6Bsi9YegFTfs25saxhvnfgiicnT7xrHcoLp3XJDCudDIWVxMUMSzyAC8psSxwHyipdxibF99ACgGGr3irNIC9RJnz2i6TSR2urvZMTxPZXUquMqoYOdO6igC3Rp/PoCn/HLE88Mo9GzkqE/3GXNL5d7KpyDknXc2h4rmiZEZDOcDANipKZW9yff3x+0fyAOFsewF++tqU5B4yPXOehKB6vWztN1KFb6sC7dnCduIDuRT8/3ag75MWOJZ6H/GvhGvIJH7d5j2rQqfpblg4sSy4Ln6w+GEDxoqICBX82EUbspbtu799klWsZEfXaS6Lavk0A7oOEQoErpaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJN8DNzzhAanjWdQj1Rsv0YWL3G4B227526452wBFlg=;
 b=EhITz3Hu5PEKaHKjtuVN4BDvwLPX5E+Qg9xyaBI+InPJ/eKkypOC6Ycq6Cv5IH/+Qecoxa1Unx4Sq5vvjUuq1UvQogCbUxRub9Ozo4gMaTDHGx4duY5SDL49uMCi/RtupAKfO18F/zF/PVwUBlMAs3nqNLOipsWlErqFxOUbvjuBKxqKtm9CPLx/V6wneBMpOFnmPyoEhbIwujtTeJN4JT3g8ve1WcU7FWYjWI+LISYA5i2RIQUlJl5FoKYVOKK0Mu1iNErLHm8ppnVeH/yhOfhqCkGyE4lVj2/Am0Kcoz+J1nVOBibdF686gulwimbTWxYA47sbtlK5xNeJZt8DNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJN8DNzzhAanjWdQj1Rsv0YWL3G4B227526452wBFlg=;
 b=UJ8oZVFsHqrqOLfj8KA1RN22RhiNtJ9T2WGK7Xyf9JYJ7YgiQtkgYU1tEAMGJMvIKGh11d7Fo474mg5/WCGKU/KyCyIdI78NVxT5W6q/+yykLX48Muh4x4P2iSSjQM+RzRFB6GHu3ftpCnWxh9hDNfYF4qftm+p74of5dEIntykqK3MfBN4kbIaFtl6sWIVoZkGykVgq/Uj8g1rX0oOhg98UHX6/8Td0eTd9qMaGFUxOvwjuDnzlG31Cp4zRyOxSpnOZlBLCOe8OOVkPOS0HYPuHL2vgDEHYhpy666IsHtT7LhZ9xivNhWb9Pb9C8Iqp0v7d2VRHdB9EKqUQHITjLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6546.apcprd06.prod.outlook.com (2603:1096:400:458::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:50:54 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 06:50:54 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: liaoyuanhong@vivo.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 14:50:44 +0800
Message-Id: <20240822065044.3295-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-5-liaoyuanhong@vivo.com>
References: <20240821092846.20138-5-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:405::23)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ab7515-96b1-4623-5068-08dcc276c4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dkU2GA+p//fAUnuoxufoAgZYlk3B1B7VCQNFrIuDhJmo78pU/0DeRfuJvBcZ?=
 =?us-ascii?Q?r8XM/CTVTwFRoj9mq3rFtHRdOcge9SEbNk4s20OHlJwnzQP4GVkKC1x8enfT?=
 =?us-ascii?Q?v6XuggwvXd9M4uMyz7bSL9RxIIDyib5/YVcYE3O16qp9/BLvANyfeq0yZGdo?=
 =?us-ascii?Q?/7I3CiVP6hxnr23k6SvumI2T8SuQQx70vQOTwZ2IaZVJbVKM8IHc1sWKSfYo?=
 =?us-ascii?Q?U2agiiF452rBKDvcT2PpzJXS3POFAiIABbh1fpFae/m8ICyn37+7mzcnqG6p?=
 =?us-ascii?Q?19z2l2Hd6NhV2mwqjaDBHEF9liJmLyN2L8ixjdf9IRDinucA7rVhXP5Sczvu?=
 =?us-ascii?Q?nXmAsAGZA6Cba566tx5toLutudH2/TqeO3YxzvGVrrm0PwwmWlfig/V3hUlX?=
 =?us-ascii?Q?cYOxBEeocHC4rGLpon3NSxuIqbg92EzwLC4eOMdzsysHYGFLp+/YaKWRIK5Q?=
 =?us-ascii?Q?wSB0OvHfzFjaw3g/3x08IOa6+Fw/+FZxyHts+92R+0+XVDP/kjJYxQoHgtRS?=
 =?us-ascii?Q?bNKy2nEeieJqqtZd+eS8BPusvSWTti52yNMOi2mGcHAUPbIi2L4iuRj3OzfU?=
 =?us-ascii?Q?aB8QVI/M6+m9uVTJdu2zNUtjVjmG+BIDkk4DFN7Mq75BScRC/rlrjVVtVcGE?=
 =?us-ascii?Q?zpVG4+gXJKu/9+HictGUk197ss/vYsugz8PJ9e0upp67/q4d2W8t346LK3gH?=
 =?us-ascii?Q?pxJt++2GKtFsY+X4ZdFCutQOKPVJD5nppyiWznSqo9zTeF7GWyXxkFB1k9+f?=
 =?us-ascii?Q?NMwwrOTNKgut9v6zmfJQfQtsAFeOkxawi90czxqeA6IzoGYRBt66tOdaELs8?=
 =?us-ascii?Q?Sq4WA2VZ0jB1ddvc8CD+cBGXdbi61CHDRqe9tC0DrrAujqSblUs+/v+Y80Jg?=
 =?us-ascii?Q?MlAVdKfAh4473mYIHVGse58RDqV3ZT9V+hIuwOyhv4hdShCQn+I6kcGOBrxI?=
 =?us-ascii?Q?yBxxN9BkZYcrVjXU2U+pusEEUpchxfzPhCTvWXaNhVPwhtO/IEIlqtEG5KvU?=
 =?us-ascii?Q?qu7ZQpPeKOFOUh7cqoLTr+u5Shn/eIbmPO5gvHsqqO/AZQBqiHDItefDrUWI?=
 =?us-ascii?Q?ZnMxxD4DPJucsUaSKT+hcnl9XPIua8XCFc69rLsmosKeNZaY68d1qK5yOj6l?=
 =?us-ascii?Q?jlBFBRpNL+6ywXuflW0d6N2fG+dnu6LovOXdle5AmFXpZz0wKRBB941M02g8?=
 =?us-ascii?Q?G1V3PUzgg4VeK4bOYXr605dU9AK0ZqfCMVqpC5doupb0aJx0LAqGBiY12Npi?=
 =?us-ascii?Q?9FsNqHhmAUfzjgQic9kVmVNdOW4mOtv1FnGMuVCx3KGr5dV3iwkg/owcSM8/?=
 =?us-ascii?Q?Fq7IVfxRjyPG4YGXlPqAAUNmBPfO13NwNyRPv6HKnkFB5Xzk7WrMMI4fFhqV?=
 =?us-ascii?Q?1GSgmnEGajhM8pwP418Bw5k/cw7hioV7w2WclK05r8Yr3GV3oA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Ou+24fWQUJj6R5/tbtfzGS98IMFFYpuG7MY7r8C6dHujYo3Ia/W8ERGonZL?=
 =?us-ascii?Q?EA2fLS2+r1bo79QWj+U1kdLku8xmK3kxC/RR2TtIbUQS92Y8BrECsuTwQSLN?=
 =?us-ascii?Q?k0aXRWbOZJDpXKxWdJFknXFiHx/f277Vx8QHpRYmSSBKlDiRXoGRDy59z6jm?=
 =?us-ascii?Q?47DH+QY6LwSlz9QXhN5Bns3jl06MPOAL6L9QaFbtQcHBsyUlm07plaZWwGUB?=
 =?us-ascii?Q?aiLqUI8suJupOHnHl1fs2epMicgragKcHOULelstyZjDajRLGHFcMKtKlr7S?=
 =?us-ascii?Q?rrKrV9mnMuBB6+/1nq04SAUZKtG4vPkBfTHilWNg9cF0tD5bYvgXDgBnuDnL?=
 =?us-ascii?Q?PsDBzw3x3gt2dw/qD9qmI+dWr/40jd1QJJiISYJmmp+HyVFCwiW5rzLfcQz5?=
 =?us-ascii?Q?dV3msbiXlzOkC6t3IyuXGT1Ni86KHC5gdiikD8NejMfuwLFiLJKdTKfrwPq9?=
 =?us-ascii?Q?GIV7FwMKDklzQRQBRCq+bfyEicdOgkl0gt0Kjvf3rHqscejRYbxdQ6YiE9wZ?=
 =?us-ascii?Q?5CbqBX94/rSk6eQV1Mk+zreFH1no9/CEoQnU5O/Mlcqe0RnOpY/3LPWuFqb+?=
 =?us-ascii?Q?6WJC38lsgXukIxsUDp2gyWgB1xRnU5r5tJ/DDJJBpRdjNOfpREtHNpPhtA1h?=
 =?us-ascii?Q?xabhv5pfD/DSiJwg22kIEnFwucjlW90j/sNZoUFMzMtzyq6uZ/rvb1rYct9j?=
 =?us-ascii?Q?TyQtVM5aoK4nyVIQzwQGssKXXDzF7/pAFxrVlrfAwcCmu4LAz+SFa7UA5IJK?=
 =?us-ascii?Q?wm1Bbjk0xvvzPNDhDdZz2BNsvapmgjGUZdDcSbXsGUSHIkz4pM3HnG9LlkFZ?=
 =?us-ascii?Q?KNygbgThPNQS5qNq5yPHVTUAdV00wzhMjPk1uH71fC321jg5OULuwpOiww4T?=
 =?us-ascii?Q?L4m429F+WMeMD7qM/tl6AFFyzxM00Hohg/32W8UOwhyWD3oSc5ik0Urejct4?=
 =?us-ascii?Q?aqNftpmujkUwS2Q8jOdef1HKiiXOeG7jbqCQ05SbKwNGo0+LZAQ3YrWKh0M4?=
 =?us-ascii?Q?hPbqJgwbPGOLX56M8134Qdqm+iU0Qpb1IdHRQ0GtR7zryjiTefHi3Fjh7r30?=
 =?us-ascii?Q?PSwhbl7ODfUYP6mu4hWKYwXIYOGivpjybqsqJhdFrcWLF2A50yC0RS2YNJs8?=
 =?us-ascii?Q?Vmct/Dcx6CnDdv5izc8pIH2dxRHVqx6FDK4dThxsOgenyJ3jGqEfQMe7WdoW?=
 =?us-ascii?Q?l4LAs3te8xeSBP6COihOTr0r+uxVdRydQuhQFFqgWapkYSKl4xOW78Ve8mLU?=
 =?us-ascii?Q?QQUMac1MIxhcEW519X2IvYJbkxA6DUdpS3Tolk0etxN1261WBo0alpSmhclJ?=
 =?us-ascii?Q?r+YrVhSPrqO/zevo83++/Ue/I/fOZAHJm3LhLaAk6qRdvYFRLq1KxMCTuMdM?=
 =?us-ascii?Q?qypyUcBzPnImtfmTX14I+dhcnxScYdiAJ60aTm0wyRrp6fcETyiRS7WB0tF2?=
 =?us-ascii?Q?3dW6+6VCG9LpZq8dGed1s9WXDIeSr50oCqdcovRv8+GtCZvmfOI8uiCprrV3?=
 =?us-ascii?Q?+QMhzVwihcUoVwOJUQxcS/nmUvMV+iSzDVl64ubm8IDj8QY7Bhh5OHDpQn2p?=
 =?us-ascii?Q?NIrrtxuN5ebyXCGh4WJUpBRmfOlZAqrh0DOeSlBn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ab7515-96b1-4623-5068-08dcc276c4bc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:50:54.3606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmA25g+ybR/7uTcBuBpMdcqzTsPmpFPTaZ/nbAlveu9zrLHCTUG1CvQNoPebUjiEQ1faIeZppAAN+qbD7Cqpmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6546

Use devm_clk_get_enabled() instead of clk functions in rtc-s3c.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:add missing return value.
---
 drivers/rtc/rtc-s3c.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 282238818f63..ecceffee7118 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -425,24 +425,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->base))
 		return PTR_ERR(info->base);
 
-	info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
+	info->rtc_clk = devm_clk_get_enabled(&pdev->dev, "rtc");
 	if (IS_ERR(info->rtc_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_clk),
 				     "failed to find rtc clock\n");
-	ret = clk_prepare_enable(info->rtc_clk);
-	if (ret)
-		return ret;
 
 	if (info->data->needs_src_clk) {
-		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
+		info->rtc_src_clk = devm_clk_get_enabled(&pdev->dev, "rtc_src");
 		if (IS_ERR(info->rtc_src_clk)) {
 			ret = dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_src_clk),
 					    "failed to find rtc source clock\n");
-			goto err_src_clk;
+			return ret;
 		}
-		ret = clk_prepare_enable(info->rtc_src_clk);
-		if (ret)
-			goto err_src_clk;
 	}
 
 	/* disable RTC enable bits potentially set by the bootloader */
@@ -487,11 +481,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (info->data->disable)
 		info->data->disable(info);
 
-	if (info->data->needs_src_clk)
-		clk_disable_unprepare(info->rtc_src_clk);
-err_src_clk:
-	clk_disable_unprepare(info->rtc_clk);
-
 	return ret;
 }
 
-- 
2.25.1


