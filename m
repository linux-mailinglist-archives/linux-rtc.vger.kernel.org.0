Return-Path: <linux-rtc+bounces-1762-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC5963CB1
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C541F25B35
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A1518991B;
	Thu, 29 Aug 2024 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cPUiDnew"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B22189519;
	Thu, 29 Aug 2024 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916167; cv=fail; b=JXC6k4oblOMCq3roTVfVheEW7ofiZz3nY/cb6e1aZ5wvvcBkf0VcXFegzE15mWeyLa+Ahd0pLOfmtmz4A1oeZvSXa3wAlYL7Lr4WcfphabcLkL1JKusRCSaEiB5C9nZkzCJed/bYFg7Fkqy4rINhWhjmE1MEjR7ElFU5vbedEAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916167; c=relaxed/simple;
	bh=pBOUDwfAj957ocT1D5WwhW/HJIWvfdLKJC+CdSjpf0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GPUrScEFwnFct0QYsAoNPFqXFsEGsxGiedI6g+fzQd4zLchdeCPGGui7CbcunEUDePPhm7c8unrLDtHd6ln1Ub8w7gdgjWWmud6Fa9/o5LtutsFz1ulYyTy3dpM30uOFkrKeBVbyLvUtGNsc7Rz0XwEfjMErtvNQDfvI4n6NqlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cPUiDnew; arc=fail smtp.client-ip=40.107.117.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih3WhAShsn9x5w7s9PMCLk94Pqbyp7W+knqOTGvAVI5ropvPqtR9FG9wrvZUGZ+Nwxbcp+3HFKtHy8hvoZ70SECB7+j2nUrKmHSPTZt3U/Jq50pLC7qLU5FxO4yh5oAPaArctFnIahWmUERqx6JLZqCjrYNE9O3+hycSSKblL4BnD8a5tk1rP8QBIIchyYdF37a5sNT0ojJdf5ctsyzP5uP5VtgGItEuaXGM+FZcoJ0pK39EOJ7ObXE5clghFPYpgjgUr3ayg3KiZgjy99Ys17kwX9HXsldfBLvF91nZKVWcnCto/ZFfQObScPSm/0l1hWDkQKla0fxssvBO6uF3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwfsmnUNMTALBVZuXoh7YtP3zSRvNNe2aT7Tli4xyMQ=;
 b=DvB8JTQfFf64B94vAIk+rJPRXc9BBPxmfX3jDpAs16SbowsSxZqpCmhlOrp5fMi2xKI3vwFKLfZfXAatJPhsQ/hxzQWcohjpSRyWE/xTNZ/H092mKG7gdpW80O6YxfmzWCveN/gRx9zAQiyPBMSW5MCM3Y+qSC2nQoi9YJo0hXK3VdZogfa0qE6TaBQjhyyMuNUL8DLN56m97aUZkxSB90h1brv+CiOpkwktvxJgBXY/X4lsRCxiGq707srBRTs2PuSTqDF1sDaOhqgfjaz9KJjJCmMHZhJy2fIQ0CGk9hLVZL5q2QVW9DqB+seyM4LLqMivuYCI1miVUv1el9wNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwfsmnUNMTALBVZuXoh7YtP3zSRvNNe2aT7Tli4xyMQ=;
 b=cPUiDnewNKL/Fp7S4qYmyIuJ8zvT6PwYCKcLue5IFsyVyiILLsV8KjxyAs0WBMBWNmVjXysvI69zGKq24zoLwHl9FvUJsABvD/+Hz3ZjRkQw6rqphms0qlsUwNHOuNq+Kuzejpl2fAv8L02YQq1krhQiEddeVCV71qNJYw8YRHYZfCFrpIs0azEuDfCbcgVv/EzsjSokUZJ9OwX9jb8ft8ZZU0O2N3njO8JVOEd+0NHOldr8iRvO6NYuC7WzMMtt0+HQ/LtDw2tDtsjPiNgazYbTcNSoqodm1zdHMo9xvLIFCHsH3ws2mNQMhD/0mJAsT+8Gzl+jOqhXEkzu6TQmLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6789.apcprd06.prod.outlook.com (2603:1096:820:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:39 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:39 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:06 +0800
Message-Id: <20240829072209.7253-5-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c6dcb43-3043-4ae0-d847-08dcc7fb5ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y9P2iwN2u9GqM57xZF9GN79GLQvmWcwjwc0EdltoNXgj4LEI3ynfakjiaAI2?=
 =?us-ascii?Q?owOljuCJA8v7B+QKu+BQ/yPLDRVWXogxMb9bQyahQ9Tj4U+n8YWpWF0nOS6Z?=
 =?us-ascii?Q?3f+1EPHb5LiPWLIdwEPyedK98Vstuvg91xeBSuSdWmmhvL5f2GLtUFGd2XhS?=
 =?us-ascii?Q?Q6Z6PnjXx/8CUAIIQvdhA0VNIuCGVeztHEjZAaoF7iddsuUWZJwnUW9WuOhP?=
 =?us-ascii?Q?SUm2lq2TuQX6B3Po0yp3dzXholdVcom8ybM0yk0o9CHfTcfAQnzCGJwoEVi6?=
 =?us-ascii?Q?RMrtUGB4/s9asGNQAaPIfaKFn/hXNCsT85wHszs3vRGdvV/BALoddjMqi6S0?=
 =?us-ascii?Q?gJNXqGseWuPDYbjBlgNa0d0MaegDAUrmgPn1ygnVGVmA8I1H4o8v6n5delWk?=
 =?us-ascii?Q?T1AJ5LUj3NJAhop2fncX4lDEqSceP1OQhs48UgyI11zBT0ZABerrFwpT8vi0?=
 =?us-ascii?Q?zNOoR3ADiI1jVK5rH3uDyTvuPTagPG14KoMr091WV+BQVDJmAoah+iN+oIvT?=
 =?us-ascii?Q?rGS02RXMUqfDpnjmrmb8XwYzKHSM6yuDvhGH5lKIu2gLDZhrj3+hj/UIqRmr?=
 =?us-ascii?Q?sIJhMsRmgqIvCnR/AXaKByZBvh3DoK5RHN9S/7MZMtuZjaSikC7pfMJMAxWQ?=
 =?us-ascii?Q?CPtyndxfp3t6flb6nyyaz50PGpR4guFNypj6Rztz5fEKAhGacrmnnpN/nAE/?=
 =?us-ascii?Q?V+5FPaHK1x7h/T1+iunB4EoparwuS+hzxb3HoBBL7ATb1q7m6AHy3ovRlBZU?=
 =?us-ascii?Q?6ZUFXr2qiDCJRBT8+iOevyeWsx3S7LlZNkq76zd17H4iTzIKfIpV040POFSO?=
 =?us-ascii?Q?07L0QZXWxe3hryiK0zaQ2gIWZy940oQUdc//dYKbR2JQCOpYoigOt1xsVnpI?=
 =?us-ascii?Q?f0FDjE8WFHcrKtH8Fs7kQKwHzgbAtF23sx94oJZqlvuUq4Agvq6zq6aaSZQ3?=
 =?us-ascii?Q?h+y+X88RmyI/Uk+xg5VzAhnPX3MmAZi0u7PhsbaDqj9/Gb1I4Dw2hZ7W2pzn?=
 =?us-ascii?Q?Ur8jMrAkpMZe0nwZb2naI0ADILRS8qewpqaui9oDlxbSNNahNQ89XkAu6mkK?=
 =?us-ascii?Q?vBtdonj/oPJEJ999d3o8iiyAKGUR189+xL7t++7OgQMSpz0WKpw18O2lKYfY?=
 =?us-ascii?Q?k2oEC29X027iVQ7jGU8FtuaSwPM7laae9Q2nucbbxGk4wItr0/YsfJ8JtKTh?=
 =?us-ascii?Q?clmJJZ9yrcluAHCEEXGj5jhIVJ2TXt2iFAdiW6VLi3tmLUfjf/NK6ucRmsE/?=
 =?us-ascii?Q?GV79uUiRsS4cHavu8BlkkkLyDmHhUlHatF9MC/tscW9fF9N0jbodlo5fLejO?=
 =?us-ascii?Q?XBKvC6i4n6Q3p+ZU5G+xtU42XzQbMM3BPxyYb2FLNOD0HsPQzK6PUvjWOoKs?=
 =?us-ascii?Q?fE9LRH3rlkXol+EQki5tALqh78GlHcnABRCg3kAL1mhdFdn2Yg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BGX6m3DAgDNbYzlVYtjkYw++Le0IfBnfvH5JNj9gGWi2sYKCwaNdDZo0BXRg?=
 =?us-ascii?Q?izp0/MLtVQrTC+WPTJnSTs7YNxQoj4AVjicYYj1xiH7kY8FfrWosVikfcZnm?=
 =?us-ascii?Q?cBOZuAX51fw5NBe6Uio27RGN+aFnEBJ81Y8kiV6ynZLNOYh1f1lZIkJMiYme?=
 =?us-ascii?Q?HeUzaPz4pvLH2VS+z4KRJJvgUocjKuC/GjeVvh2P95ri39iF2opsxx0Yfv2e?=
 =?us-ascii?Q?16OhkKzKfpAI6mRm67DBQpAc6iWi1iI42E6XCnUiX+fqP0otUVYC8sanAqH/?=
 =?us-ascii?Q?aaIHcJPQFmDArpHM4wJWPOZS48po+WPR89lfhHuAd/XoqEJl/6uLyYh3T1ph?=
 =?us-ascii?Q?DKEdgq1XKB2AI2rHBEGXgyBWMg1h/w6xuV6U4kAO/d0q5apHp95oR1eCuDdA?=
 =?us-ascii?Q?RAvXX1tutH0xvTvYLQWHP/df/VinKPX6J5CYxGzynCauMbxW2UHe54p6krC/?=
 =?us-ascii?Q?RQCOopu8eCEVqSRMZN3yiJ17YMMk/nDS+JmpsWrqCHXS7SQnTU2IvLHFNeSf?=
 =?us-ascii?Q?dh5cyOSKenm2aW/lATtdXnjXYk2VuXaqpwwUMEUje7rtCvNhStmo5/leA6DO?=
 =?us-ascii?Q?N1+uc6/D6tjerlsvG5L/s7SndlSqLRuJmWsk/3ZG7/njRuEm3tpwYHoTepLI?=
 =?us-ascii?Q?4h2doW2LFuRmwlP585+xdfycg1dK3YNFuwAV1MQy32jv4h57Ocw3MumXUdQd?=
 =?us-ascii?Q?v0+OwvO7KdRuiRfDb3FIz+s8w8uxHkMZh6GVxCd4A+uipkdcEF3MhyIXqrRf?=
 =?us-ascii?Q?X1Z1uu0wuhVbKmoP2J+aL/o7dlGJKYycqbL3D+2BzNaop4viq/C/BvGFLjma?=
 =?us-ascii?Q?2847bwjo0fe/zml8EcaVe+rHfAfefdpBrEKLYKrqDri/+6YujQ0BPDISNkwk?=
 =?us-ascii?Q?kL1sx9NZ9+0RdSZOUPfR8WJj4whBniMVogbUa4itBX9Lv97BkwrTYwmmeqjz?=
 =?us-ascii?Q?XjApeLl3tP5F6nnn2EoYU+mM43RTvHRLkQI/8ZS+9OVOO709RUj9cg6hyMng?=
 =?us-ascii?Q?2iB/wD2m7yg0pIleRldnXsZkZqq+GZj2e8PPJ6mEAJtOg+eZyfvZaKeGCgOG?=
 =?us-ascii?Q?nE2Rb1wXEib0uGLhHTXK9HyfhdKB8ZqU1AjMEfjXnL/FqjTpBylgKnmcjUFc?=
 =?us-ascii?Q?so5TzrRlVgn16GLE6jxzp58aQDbCsHKDVmAeSn6nA9tBD2vBccd5LhbhJLrm?=
 =?us-ascii?Q?iMrGdWj1QQwQjvTEsf7Sg4t4XNWhdQePIa4aXddmsUclRW0vtbZmylBvoqty?=
 =?us-ascii?Q?xVvMjhZd54pOFoBaNhyhrOQAy6M73b5JEqC0Y6Fn2nv7m7JU+/yT01CTa29U?=
 =?us-ascii?Q?+4FvJspXJJL1keUWL4ZyrJN+HxBSUpQ+iS9mogUD2TaCwqvPoi5qaQBnlNUc?=
 =?us-ascii?Q?lequi/JICc8mQNBQx2A/xiS0XThOtiwmHE2CKBopBddbgiO30rSTDkd/rX+Y?=
 =?us-ascii?Q?W4cJSUzAQhzRfnDkcglPFs2aZFX4+dd9jsjxsYml6746murV3I4bOuoamp15?=
 =?us-ascii?Q?ZHVFVQbhbw0qSDyWj8RDB9vtB3g8NFPynCkHjCBi0Us2MepGl7Ce+2reLNoO?=
 =?us-ascii?Q?oTPanb8ZbM2uXfjZxWjEYiMG00WNMjfGOQqf44Mt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6dcb43-3043-4ae0-d847-08dcc7fb5ccf
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:38.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JV9SEY7aQ+LBXePqkVyP/amkvMGXZ25Lx9LGrCguwd+YfOYWjRPrdYQJUp3aKvOU4ilYCjJUXL9qGT4FQ6+8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6789

Use devm_clk_get_enabled() instead of clk functions in rtc-s3c.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
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


