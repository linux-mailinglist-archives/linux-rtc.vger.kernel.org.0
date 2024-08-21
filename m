Return-Path: <linux-rtc+bounces-1678-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE19598CE
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37DD41C21891
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9BA1EA640;
	Wed, 21 Aug 2024 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="FVAWQaPZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7481ECB4D;
	Wed, 21 Aug 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232552; cv=fail; b=Sos1BSg010zGs+V8CYAtI9Uga8xZ+XjbAOXGiF44OOBgamkN2QMCHGsEHFDhlp2nyCAI9iAFHQE3cYDlwM1/aopx7LfAfmI08/yk2XwpZrdoEBiVm+Oc51VGGUsTbYaiLmjw8htRpepdX1JnKXT8CCZWhfkz3LC7s5FQWKGhf6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232552; c=relaxed/simple;
	bh=WwcDPcn0fw2Rei3qdIh94r4VMBzPSD1ci5vC6vesDPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kf+nvGt4LWhHHSMewzf/3dvBc72gUMNhb9UP83gPnyiUjYtcVNBZe8xUuVK2P2NpeaXnAnKSq/8WRI0H+E5oX5kdo5TsxiP/VKbfwNjTN43sWjFqC8Z4OUeNEqxTUO5/fnad9EkBjYBQkOvNw2LrtxM1egtHHsNq7Rgcq35zAEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=FVAWQaPZ; arc=fail smtp.client-ip=40.107.255.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTgvz8TZEMVPlGgnkD2vsPFgWF809LXjkEUd0pXFcpxSrSksuw7FNq8zwIS/zZaHLPachFKJf1MoDJ+Pl27hUiFtLIDbYArPoLQwZEg4oZDZTecj0zcNT6KhSDvqtWkXhBNBAlJiQG4KDNLa1fj8bbce1VkMJEDt0x/jRdLe8wcZbS4eJYTWbHX64pLNrQng0Owa6DXZtJFeH30M5dfENStdhWRW/fImO6Bi2ydJFrzK+LseWyyIpdpy0Qf474K5vr7BuNd7LjbbjdfhoisNZmSAKL9I22nQSJWvbzIcHTLxvwyxKMoufJGyUDjyuGhAUDLlTJMS9+lFcrKSptDCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAdlHXocZLjenC+WvGLU14zj/mGpIL6nxB70i4Qm5x0=;
 b=u0xzf9LAVCc5VwwUR4cEf7HS15GvinQb8yG+qQU/m5dp2C2Fe2djbjlNDhGXNZqeEqNngxzRjWYGbIXdfWV7HwAqV2xCndCEZz02zxnJ2Z8KdkAi1x2D+0mwh2Zc3pSsvvNs++i+M2RCqNJgnL6gMO8PgI2kCpvo54VdwGV9PNIDXtCySDefF/lje3GAEAQar7GoN0fSykpuEZb2ZMKvid9GrQAs0IOsVqxtBsAqSsdrV02/5TmqEA+TTShUC6k4ENtNtp7Fyx0v8jC4/yUviw3FMe2vWpQcAW2F3NsNaVfknY5uWCkUC+bN73cmy1EhOs8KC1BXACuaGWCAiSo0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAdlHXocZLjenC+WvGLU14zj/mGpIL6nxB70i4Qm5x0=;
 b=FVAWQaPZJ9buemhnkBQJrQ0hWdE3l61bikgQ9XTFsO1cRBdyOHn6rWntFwhRjt2V4Jo7SXWXbS54h+dk6UDUa3+MGrG/dBhu0Mf/vtga7Ha19B2G57nLoUDlThbc4c/I+NRNXota6BbrE+YOqIfw/siSe1/wPqu1VeUN4suP6PNOwORsu/GFyU0Nv4L9kLSX0uwgSeVxWKQfnGZoovmBvWhitOco236IBmc5/5MIQv8ltnXCwpvqWL9A2fxac/iab9mvM79bQ3OCnCfTtOG0jqFdIW3yef3QLEPbu2kFpgTf5fnDoi/F+CaBLYvlfd9lZQ7dYjxrawFxt3oywrpOMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:29:07 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:07 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:43 +0800
Message-Id: <20240821092846.20138-5-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5616cfea-a253-47d1-1c1c-08dcc1c3b4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V+yDE8hZs9sar4910hOgertOkG1/CUOoAwQ3edslMyKVcyAa6U7H5ANDIA+X?=
 =?us-ascii?Q?nUbef9HHEHFkZbbRWfJOMUAlDRfHS2YwmxjEKYQGb3wE36nY179I7wUInQgn?=
 =?us-ascii?Q?9/zYs7CNzptZscxhy5Hwzw0h2hG/bq11XezJqM4xIsDFTN7kFB4JYkBOJq4U?=
 =?us-ascii?Q?6I8aUn+qcXW8pmoz5AP/9xxjQffCkj1DHITSsx+h/caS8Y19xh/hu1ySBxLC?=
 =?us-ascii?Q?dFOV6/dAY4en2OycjScESqtDXEMSecRiWCCnIFE2YodgY4unWVE19GET7YPN?=
 =?us-ascii?Q?3kRAbZwlivTAdwJekU3NXDRy4qL9cB/ns+AEbEHz6OMyMlq5gGvt1BK9vF+a?=
 =?us-ascii?Q?+4d/fa7xhj8IcbQIfrRKaqRSweP5EDcycC/ZJl3i5uHXLCJgoCfNXOvJ/Nep?=
 =?us-ascii?Q?NiToSo1pOsOwedlbHVCofY6XVRgZKN4RR3xcuG3Qanp+llfVUZ1+cD6+xLTH?=
 =?us-ascii?Q?gyfSQ9Xr/d3NBeKj0vWpA+AJsNcFhksBzHTgTw4kPrWFoJzJb2ii0zpzzXJr?=
 =?us-ascii?Q?f4lmBzS/wAJgOX9e1V6t0BAQOJ8SxEq3txiDOMS8IqfW860XxKjQ2mm25fSB?=
 =?us-ascii?Q?vdmf1yApZ+o/YI8mLggP57cayOgm1HvlQPhVtKL9zkmVUX8IY1A7iKkhllmh?=
 =?us-ascii?Q?gDCqiT3rqy5JMfEjorrtjnaGvxk9DiIXATeqWbz4xiU3R2B4gyUOQKnaXMFY?=
 =?us-ascii?Q?E+dzj5PPRSPn923C3z7/D5rbhYj9RO7kIauqDk64Xns2O7SCV2liK9P1o6Pm?=
 =?us-ascii?Q?kpd7nYNMWh/hnvQ8ARru39UNUKG3UMpSD7BcHSiA0ZUmio7lOkINYK+DDGSb?=
 =?us-ascii?Q?GvgStARYjaVlEtz7sL5CNgT0wPn3LtglUoc8uN4EGS46od5oE4U7DEOZyp+3?=
 =?us-ascii?Q?DgML2VO+DSG369lZUNO+TM0uZRqVQrGSSJR7KjGgLccb0f9DbXT+1TX3NM5t?=
 =?us-ascii?Q?7fizC5s/kHkKip1oQbT1JPX5a97rq3MZ7RzejtYX2z4ooMAUd3RhryComPAF?=
 =?us-ascii?Q?/gxCfyoy6+W9CKRYah1PPGZU0Ul1nD6UPXN59UaIEHN9iaUNJiOAvyNlTLrp?=
 =?us-ascii?Q?IPw8lRRfhbI/PNLy8EHJE960H+PauT/R50qtVSkTPd2/qj4KqOh6xK83rRfE?=
 =?us-ascii?Q?ZKZG/DxWDdfFi8JFoNfz6m753fIgRAGi57098/4NZchK8Xzb3vKj5hFuTeaf?=
 =?us-ascii?Q?FrTtoeSrgBxs7Mmg9u5Tr15dxbqzXgq18b1+wtKc/DQuXqT+wiykn2XtqUI9?=
 =?us-ascii?Q?F8q7cGndOs+UMEU+/FudLQEfUs0rNQQkxTGXSsXMnuvUaYPSGaaZcxAVeRNf?=
 =?us-ascii?Q?pC+kRPejMbebjiNEsAt/kVFFyZRXXE6ZMlGpAyEPjU8rfqCOgAXCGeOp/3PP?=
 =?us-ascii?Q?Yc3HQ6qG7ZEpMJwA6Dgp3zm3gI9RfJVyAnx4u4FT/PuB6stnrA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b3vNcd1AwmfPV1wSzCGUL+vzvtPihRQagmYU7+xXkb8cGhwHJtsV2SnIq1+g?=
 =?us-ascii?Q?4b91mInhKB3G/LUPWLSkxsa79WP49ZKqyB1pSCf/AhkAXXtR4KrG5Kb+zBVv?=
 =?us-ascii?Q?crh9oscurLgVwklym/W5Z4pqTKLk01qIubx1N0FIrKV/9Okm9mEAe4hukayF?=
 =?us-ascii?Q?ff1FkNtj8DWG89oWOEwHuZsn6Q8Pfrn2rkEgxI42EJ1ykqIBd0we4CAAyhTf?=
 =?us-ascii?Q?nCNkz5tLgz4LK8mr8sFVoejJ0RyPsGlLyCby1f6fAwUfie9nYPNM1l719s4n?=
 =?us-ascii?Q?KpGrxLdXHdv6YM1InqJvxu1trIcI+1n2sEaRCw0OryMtxFLfEwhW6gx6XPcN?=
 =?us-ascii?Q?y1AvNWydyatDpbWBOF6HUL7+WdjAEmbmDp92g1abnb7KRFYy7zauef2ZQec9?=
 =?us-ascii?Q?gT4n6hPO42Rux7ECWEwPXFLRHMGaOBQMzx+wJXUyqH5PMK4YfW3D/L3K7jp/?=
 =?us-ascii?Q?ZFk62ZaBBej77R94TdwLeEuW+Pp2VVg7p/Zf75odIhhytlZdYfUnI7M+z1w4?=
 =?us-ascii?Q?1qh1T28LwA39nuuQ//4/bpMl1w1hYPHaTXiuI6kwaO6obei9rCDGcYJleC8J?=
 =?us-ascii?Q?jGPqtCeO5F3/tq49ielWfDLPaLeK4N6bIJFF9E/j/ea5k9k+WY+eohxjYG6K?=
 =?us-ascii?Q?X6kZRt9qdorJJjGyPdZXKJN87zaEnzySrKUpcWXNTejpHWJ9/QTFyerSmaWk?=
 =?us-ascii?Q?l60UZNO+7H32RVlroWZz1Cbonu+f0JIsUKilTXw0AA+DdDgIevcOEe4CC1nC?=
 =?us-ascii?Q?cQQhTZUEyq9YXeylCuzlcwg6jjMe3EJEPguYF5fF5H+UXPKI5xJoRoRRmy7G?=
 =?us-ascii?Q?YUheKTNfuv8aUHOceZ6evnnh7GtXr1Lxz7+ipjX4qc4qoSFvRTQb31x4892n?=
 =?us-ascii?Q?XtgLEMZF89o4GUUJ9/8dWwF/XBxe+x2Xd1NLXGgf4ZfIWS/x1zZyH0dnthtT?=
 =?us-ascii?Q?nyHwhYVtNUrz4mtS5xQcyhezuplkk9tSFSbWO1SuwfBA3jAbZ83yb23wDj4E?=
 =?us-ascii?Q?W0S26zK8+TgJwqHuoC1T1bRkrrMrkIMUY2clazQb1PzeaKYd6D4gzN3QKO0L?=
 =?us-ascii?Q?J24BxuUk73lw7bnThqEzvS8oozlCft7JULEZUZUCWxwGf1dWz5+2fGP28vtz?=
 =?us-ascii?Q?GoPZ+TEVD7w2Pmi4FtkRaP8x0JnZgUMHd5kNUKdvzTTWAgroqrTgemq17qdB?=
 =?us-ascii?Q?MTVEd4gEtE+k9SEU0pdG7Rq5Hm9wpFhTUnrdcE04S0F5Ls8T9zG4jNw8mViO?=
 =?us-ascii?Q?WVcixLWWC4MKG7BHyJbIXSKJqhBZdZxdyztS99xgzO0B4clxBlyHrMgKs5zH?=
 =?us-ascii?Q?187g36sFbidxWrGLGQkCtc+rpkXfJkSnYZP9zEGbuRrEXF0W49L0s9f7jkut?=
 =?us-ascii?Q?/3uptbRSYZiSkRsHxMYD+S+nlZcxWPmvkB974FNk3cgHHJomzzgMXd3HyMCh?=
 =?us-ascii?Q?kMu0hSXyoTl5S7Hg+YltT0OO4u8i3bxEjFlO0A/pMcqlXvcvy/QBgPsgNsBp?=
 =?us-ascii?Q?7cRe0JNN8z7u102iAkAHm9Pk08UHLAcF2+Fu8WRPXT5ZNmHUa7avk6rDSNPG?=
 =?us-ascii?Q?btJN3eBjYH79VDMBd7vSFSdJSrm+VVAqlnxhGVS0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5616cfea-a253-47d1-1c1c-08dcc1c3b4c8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:07.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDHrs+eg/zNZr1XL2LQ4WSrG4rURrC+HRq697QA1muOyLZLLMXAhuSXOKui7gQ7cmJkA97ez9R6VOTMK0KZP0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

Use devm_clk_get_enabled() instead of clk functions in rtc-s3c.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-s3c.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 282238818f63..dd6a72b999e1 100644
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
@@ -486,13 +480,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 err_nortc:
 	if (info->data->disable)
 		info->data->disable(info);
-
-	if (info->data->needs_src_clk)
-		clk_disable_unprepare(info->rtc_src_clk);
-err_src_clk:
-	clk_disable_unprepare(info->rtc_clk);
-
-	return ret;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.1


