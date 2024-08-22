Return-Path: <linux-rtc+bounces-1688-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2852295ABC1
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9301C21CCD
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 03:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9D91A716;
	Thu, 22 Aug 2024 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZKhNINyB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2054.outbound.protection.outlook.com [40.107.117.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3B12E78;
	Thu, 22 Aug 2024 03:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724296416; cv=fail; b=KpeShNlgVE8HxE3B1CO8V3X7oTMIJkywukzrea579EoGXZiz71P9brcQ3COJKY4Q89FJAap0ptkt+vuPVJ1CqH0J5sR0J+rXwLKfXcEkO4VM6+oKKUwLKF/hkCS7ZH9sMj3wyjGIPRfy2HXS4luc3Pg7pTU/Bj4AzkedcDRlUZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724296416; c=relaxed/simple;
	bh=ANEWUoefTVKXXL8n7BXUbO9XU85GgPMIbI4eoiMkzE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaiRtuexz7jxifTk3ekmIfO5Ikns0mKlOxYgigAIXRP/Il9tVv7PnrU7fCUPCgnSWrweAp2uVOn4f/tlpUVScrda82+ojlykMgDCqIv9NpXOmPNFdPffl1fEE4KzohSpSgVr/LtapFckGFsthGaabX0hzG+0EajYI073/5cru4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZKhNINyB; arc=fail smtp.client-ip=40.107.117.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqSMH6oL34VQM2O9jzMyghXCWSNCCwUf2dvNBHOBSXQ2B2QCyUlQ4IXVFiG1PCEf8EZKQ5cG/iHjw/14wm3/jU8lmhosGq8Xwem6aZ3aAKYanqLfYoEDynE97m6t1EXMCMBKFYryxjnx+taQy4/rKYcnyFr1gsajlT754wBxGquwSfmNtcL9EUpf1hKGW7LgMEazItEr+L4UR3m0hpgccVBr4Lv4+PbEQzIJRe/4/QAzoTKvy070a/p+0I8OgCd00/uVFf9oD6AA7vq849EYnEvGRkrIE10at9DzvzuE7Iw8sIu9D0dmZjszyKMe7ohG9hWCSz5Q8b75t+mzkN2Adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=VZ3eCfs2+fM8kJL+wJdhY0ePsF0qb5c5ObXxlXnQbt4gGKzaKysv/x+ZSldFdW+783xK71jgmviMx7EWPU+sO5uoMYPXqR7qtLRXYxw3rGSZJcwzPpmBZM/c0escdgWa6G29mlRE6+SXEgrYCHQZEhMtaU6y305O8LuIrhufWyS6DioyeXdwUZuW7VU0Ufm+wJ7n2F4zWQgL+wpL1+/4jFFN/Mx4i413jDFNjuL6wruPoGhhKl4r61OvaH6iXSe5wM3xLyi6XM5zKJAGj1nW0fjftLC4QPLnAAskmcd1BY/Rd21Ww3ndqndqGEcOu0J44rDp+zYcEQ3WfKM88miV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=ZKhNINyBbYtRjusl6Ab1uoIk1XqIwTCq2pPyFhR9ULjREC9n1P7tVAC8jOxUcgFMulBX/pobD6GNklVAm0yf5DUFuztTiuVMQsBfEO0URCYycNGbsBMsEd5DCOEWJPosLtpUPQyuYHi2vJHgNW0PO02z0yOoYb6JWXnNgyIZrgRcKOxcj1yjq2NmkNNFdrmam4YEE+VgdKK5nIS1v2n64CNOvzPv8pHJN7f7qoLB9pgFZHV5v5Fm2UXdzMV0Xi7HDU9wduZ6IECv6r/aMBwPKcHmuwOO3kjmE2fWpQUTrFG6nLKjQPgvinqETaOFjO/FYweY0HfLmjTI2Ye9BFcBwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by JH0PR06MB7233.apcprd06.prod.outlook.com (2603:1096:990:94::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 03:13:27 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:13:27 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: liaoyuanhong@vivo.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 5/7] rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:13:17 +0800
Message-Id: <20240822031317.16355-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-6-liaoyuanhong@vivo.com>
References: <20240821092846.20138-6-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0231.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::27) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|JH0PR06MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cb4d5c-5aa2-4807-abb3-08dcc258643d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mesrKq070/dlnj+Z5wY6UY4ND7ZYMHr4akj7OkIj0M4qkXDvj1gf5yOryJRu?=
 =?us-ascii?Q?2Siunmhzd91YDssBx+2A0id3TSULPzGIMD8DCfqvzc+OLtVspdmtFUsNxTUa?=
 =?us-ascii?Q?rdj/xWbALl5zkp7cLXvDErCSXesevLGxC9bJR4k6vPkNmie68dcXAZqFtz/3?=
 =?us-ascii?Q?QjgUVuQpDJxgUTociDYPd77kxF48dyfoFLDkXoS0MRPienJV03JBVq4yIhBQ?=
 =?us-ascii?Q?XpuX3uod2r4ew94uBUxFpW2jOHFm8pYGFuasWqZ01L9CPeukSCxYHjHUGDa0?=
 =?us-ascii?Q?NImHlLB3dcRjf1kSW359PaPROxyfBayImT4B8FrlY0GFjUWTcE89GcBH8iTY?=
 =?us-ascii?Q?tPkhfjBN6hoJwbebCW22Dqzu0c/U3d61kaNJwjMRuVOLPHVrF20FIW8qYr0T?=
 =?us-ascii?Q?spZpo6V+tphUTJnm6d3BzqFBhPWzE0l5MY4lUGn02XdfMVBwaTqK4Tfjfvma?=
 =?us-ascii?Q?/zhwvrwoxmtXrKNWLBsMbuMdpaf1EjgxVnqy9gvlcOTe6o1xAYUjpLzkNWvu?=
 =?us-ascii?Q?uoHke86YpwH1mGQoZ8Iz7AaqKDA3/ZuOT7UC06EjYAb5jaL6qD4b9AUpuHqB?=
 =?us-ascii?Q?SCJ+8JcdA6hxnQ6+vLh/UBf4p7ekmSvyoFLhqfuwFpQn7/qERfrG6HlyLoFF?=
 =?us-ascii?Q?YGe03JcSu0+bTWPT2W+5LoiyO4TaFfU1m4+cDJg/nz2O/JGT90ySQj4Oq6BI?=
 =?us-ascii?Q?yOpO9Fdri41ghhGvLSisKd589jNFPI3lIxBEXfWGDtiG9P9D9Uxw3IgQkoDq?=
 =?us-ascii?Q?HTRsv7JI98tnNrfEuXbixMvxXx9ghdo/2Ny8LObuimt02VXq+9NwjVkkMCzr?=
 =?us-ascii?Q?0gjHW4Lwk/dDU5ishFL7ZoL+8LgTHFCYt8vLEqUv3CN+U1LiUvp+3xmP63zp?=
 =?us-ascii?Q?t59MiyjQmQHlDLXDmARwb3H0vuwS//fmXGnwdw+U0Kjp34Jw//VFq7kTTnfe?=
 =?us-ascii?Q?fLw+TBbhKilNgR6qFhyh8LrBa1lS3bohPp12ik+iBI+wDZz897Zea5YNp6kC?=
 =?us-ascii?Q?fKE2feLkkfa3evEP/jRr0qqqxsfbNiIyqatgGYgDIZG01lRxBd/L01BdSBFI?=
 =?us-ascii?Q?/rDbTYXtx7eC6Ulsnv2+08AUS6Hytq6132Ywl31RMKKJ3RvRrJsyqu55DLth?=
 =?us-ascii?Q?ak+be6IdJmOP04dt+2p+333WFRChyUQXIbUGbt2tKs44sFlXk0Bj4j6Hcgjm?=
 =?us-ascii?Q?AVxvCdaDb943dgshyriKUrECsqepOj1AZRaXt0kDpYafGwaNemlHKCdPZVep?=
 =?us-ascii?Q?zlAY8EbumD7Xv3udkaDW4cLcAHEs61+tK3Q9ig0fTCxunZ04Moz1MjtPBP7V?=
 =?us-ascii?Q?+5Fz61JW5F9YJ756HTd52X2DQLV8tuGsVaC6buk8Fmz+jRffv5z5pPc2bNdN?=
 =?us-ascii?Q?ctVf64PKD8U9oH3XmqCBx9ymGENl4Mc/6LsypYSEl3WOcICWQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5579.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4SFLA5fIzI/kpq9GBOUg90CzkzaiBJYx1PDmsjySYebJkyQK7VwK5mCAUrc?=
 =?us-ascii?Q?XpzC6cIxFNzSG6NJhXTfpxFhYn11Vt3QaXOemzpG/xgjv5JUwZ51iNbstwsT?=
 =?us-ascii?Q?g2sGAHh6arQOkrKTSZD2MmK8WamOcnHl3Plpq0Ju2PXa4fFPtvo7iqyk44wx?=
 =?us-ascii?Q?6n1G8ApyiKuj8GqqgZ5OWE8MYOO4c6jQUfgr5DoxJGUFblSV8RixwcLexJwF?=
 =?us-ascii?Q?Y4wk2f8IszaHeelG4Ol+z1sVU1toZvYFjfZeMOoCRfSpX/cI1cQHa975zkur?=
 =?us-ascii?Q?V1E6BEek3rWxu9/DcF3tEDEMn85mt3rkvkNjJgWlZcwtLU/oB6PLExWCnfdi?=
 =?us-ascii?Q?naUbNJA86gXRu50EncE5Ek31s7OdNG/OACyb5NVEIc93bNVTvQ//2W3wZOjs?=
 =?us-ascii?Q?RLvq9YbatzsFJ7ekyAAVI2MgsgfIJXmvBirnKlHCrt41rfTzfDQJBujwFmAs?=
 =?us-ascii?Q?+M7K5TWDKUvuy/u4PLSepZ1OiqtCbzJCRwBMyqPuy8/q4aKRoZyKRj7iIbPK?=
 =?us-ascii?Q?t2XxEtnaFrt7f2WXqGNBhVymBcq1Z3oi+5YYMiYmRsPeVRJSlVp9pXS+ZJQE?=
 =?us-ascii?Q?7e5sJ8CBR99FI7ccPmpWOQSlZlY2FPKwEbyUQxpah0ITsvgUl6qYKSTY8SVA?=
 =?us-ascii?Q?QIIHis9VnhV/GnRUf5Pg2KRm4hCvKmn3d2g1VbngwCzhmes6QegVIoiZSI7Z?=
 =?us-ascii?Q?+ghCO1WlDGLoKWtHbs48tFiN6ubWqSW6QZaBWAjtWtbsp6WJNvTkDi3actyL?=
 =?us-ascii?Q?KGvy27jSJbVM4VDH0l29gDL77abjLOfEnOFFn7SkSR+Qq51piW0ATb5z+i6F?=
 =?us-ascii?Q?FiBd1sEY6PsDx/h0AqREWW7agWsbhzpvaKBlXGnSj0dxsHhptEV8fZyVGtG1?=
 =?us-ascii?Q?qQQLmtq/zaHRvnSF09ZxwR0hPsO81C1KR9o/ev+b/ISWyDC1Dxp3K8Ki5WEA?=
 =?us-ascii?Q?od0CJpduPAqhLSL800PVnaRGLjmuACv3rLLoyML25V5G1jELDCNl2jlPSB1w?=
 =?us-ascii?Q?Y1RAuV62Kpgqn5GbFFa4o/Pzr0jlMjG0wp4ZMJZF7YVVopizpPgvU2Xsj8Vs?=
 =?us-ascii?Q?QoDzyFm82Kjx9IFChjXSo2Cle1l9IvpVV91THdtmVTygqEQy+lPmwxUNuBQq?=
 =?us-ascii?Q?Vnn1eEo0SZckGWCj4r1tLbV2yFXgR9auFMYKaso03bXyP6KItCHyR6RR2FzZ?=
 =?us-ascii?Q?+pyzUBKIfq8XLN67M4uNYePiI6xvMfCNdT6i151IrmUAQNa/ovXAevdKK69O?=
 =?us-ascii?Q?vxbGpRQrBlhQLLTidtigEiVUFcLuRVtoLpSZyv26SboHYXUWriG/tHepwnEL?=
 =?us-ascii?Q?5lxTKjslnvnvC7AVvOzERV5aWyp1MtVhHzSdo4h3gKFVGd28xxoytkD3Smvu?=
 =?us-ascii?Q?QY99+XTBkYdP042PbLhnnrS2mULjADPtKLqePdWc+iiMvGOljypkYoObVOhM?=
 =?us-ascii?Q?4aCpiJ/ZRK3K6pjNyr9VrxL6FgYafMHqkLZuXEnhcLNnTGtuauDkTxpqAgBO?=
 =?us-ascii?Q?m5Rn8esX9PP3u/G5jDCa3/HFZlFpojON37cqaVppxpRtvqeteb/k1z5DH8Ry?=
 =?us-ascii?Q?5V3KdUbGKogM5Js6lQAyIxf6xytpkTF4cK2elZuR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cb4d5c-5aa2-4807-abb3-08dcc258643d
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:13:27.5981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAAsEmUjdPw9E4u7tbUL9dGqXOX67/9AumfzHKbXUYuDwM7aGLpz0TF0xJHVCb1q/FBEZhZscTIlQZgR99N4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7233

Use devm_clk_get_enabled() instead of clk functions in rtc-sa1100.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the clk field in struct sa1100_rtc.
---
 drivers/rtc/rtc-sa1100.c | 15 +++++----------
 drivers/rtc/rtc-sa1100.h |  2 --
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 0b2cfa8ca05b..c1e9ec40de18 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -174,18 +174,16 @@ static const struct rtc_class_ops sa1100_rtc_ops = {
 int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 {
 	int ret;
+	struct clk *clk;
 
 	spin_lock_init(&info->lock);
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(info->clk)) {
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to find rtc clock source\n");
-		return PTR_ERR(info->clk);
+		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(info->clk);
-	if (ret)
-		return ret;
 	/*
 	 * According to the manual we should be able to let RTTR be zero
 	 * and then a default diviser for a 32.768KHz clock is used.
@@ -206,10 +204,8 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	info->rtc->range_max = U32_MAX;
 
 	ret = devm_rtc_register_device(info->rtc);
-	if (ret) {
-		clk_disable_unprepare(info->clk);
+	if (ret)
 		return ret;
-	}
 
 	/* Fix for a nasty initialization problem the in SA11xx RTSR register.
 	 * See also the comments in sa1100_rtc_interrupt().
@@ -305,7 +301,6 @@ static void sa1100_rtc_remove(struct platform_device *pdev)
 		spin_lock_irq(&info->lock);
 		writel_relaxed(0, info->rtsr);
 		spin_unlock_irq(&info->lock);
-		clk_disable_unprepare(info->clk);
 	}
 }
 
diff --git a/drivers/rtc/rtc-sa1100.h b/drivers/rtc/rtc-sa1100.h
index cc724f5b07bc..cb8c2959f560 100644
--- a/drivers/rtc/rtc-sa1100.h
+++ b/drivers/rtc/rtc-sa1100.h
@@ -4,7 +4,6 @@
 
 #include <linux/kernel.h>
 
-struct clk;
 struct platform_device;
 
 struct sa1100_rtc {
@@ -16,7 +15,6 @@ struct sa1100_rtc {
 	int			irq_1hz;
 	int			irq_alarm;
 	struct rtc_device	*rtc;
-	struct clk		*clk;
 };
 
 int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info);
-- 
2.25.1


