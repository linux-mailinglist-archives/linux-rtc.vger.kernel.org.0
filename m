Return-Path: <linux-rtc+bounces-1763-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E56963CB3
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5371F25C03
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D9C189BA7;
	Thu, 29 Aug 2024 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="a+yzEVuZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062.outbound.protection.outlook.com [40.107.117.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE9189B84;
	Thu, 29 Aug 2024 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916169; cv=fail; b=TaCrhYanq/b8uOmEvZjg1kci8sFL8HqyRpFfGAYZSa0GC/2uaIyupRV5GHF3zUaYRFIgKe60zWPNFK+YYJl0N20io8jP40CZrcu8ykguppkQShAj7erA3HwDf8Kmr8NwMCT8YWM66jVCFdPUmS1B2a6iHHrO21zBJKOWxr0I7AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916169; c=relaxed/simple;
	bh=ANEWUoefTVKXXL8n7BXUbO9XU85GgPMIbI4eoiMkzE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E6wuR1OJO0R1ZwEabdakMlyaS1pdYnxtOKw4ig93lEw1M6X1QhRFBPQWiWi+zyQr6Agi8eCZeQs2T7UjpPRXV+3QkJumBcjpD5DMsoLkOAb+q4ozgke6byKrwBXrS4xlskdHuI6Z5SGg+01syuxttlyDQgWAKVfe35BQ46CVxZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=a+yzEVuZ; arc=fail smtp.client-ip=40.107.117.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsYPoC943OVFQqJ+AbIGZjy+h4lD60t0gdIX3Vn9xsEJoh5Y3rBjcDz6CmVB55XGMIe1/B6eApkm2+Do8HXQKcXtL5YSY1RA8tdZxIy5aCgMY9dH4xzbwMyiS51o9aBm7WpG6OnRGN9zevQvlXehzoMf5skzHYiCk0+XnxM2PHme3RW/AQj8zmToMFeU3O9pdTuZNW+6mZpV0skqQIk24wBhMsqX9yIM5W2gMgUsgC+FXWFVY5YhiXjBsRzJABtX8PAmHHusBN6jsifFdNxF2x2pasHRhayaMuCC7+EG02Q4hU3rVXaiheL6GRAnrJkSCv4uJeT12bI3X6PpvNLLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=OGTeAINiYqP1G52UtaUxJbhlORxnr6DqGGFBLMAPYsowDBTMb+BhXELtKaG5tTFTZELWTGi2Bet3mVsKU/OBBASn6WYNHerqMO1K+38sRHURaaCBp6CEQg/QMbUSdRi1vXh/m4QDNdXk8bGhh74ptmxTlFr9CmEfdfE3Ir9Zvw27M+kV82b+XwIREpc7WpgArbS+i+Um9TFU3IsmtMz4pUguAc+RVIAM1kphsSEUpVihVNhvDeWic3eqX0GrC3O6lExhcRz5fLj30JD1utfxd8J3/HtureIWpJOsOS+MUvnzYfyiwGSYOxCmDMAYQpTKPnbEypmsO8jEnYIZ17s/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=a+yzEVuZBGLbnkDTzilAd4vsuk7Ayzz1SXl0GcVWE0WtBGVlDvueYw0+dT26mzPqtHwNtgz0deGK1OzTBhbxwuFA0J5ljUCDsS/Fdr7U8Zjz8QIcTXNHLMCE2P5CWeLwHC7ENIWDkcvGZBzIrtQ6XxSZpZlpewC8KG9FzAo1xdhh+5VKfU0xC1JQcokop6NtUF7EnztklPeZz4/NHPxDTAz0s7XJL0Gt2zJrRvdM1kre55x+40aavNUGFa8hhcTVYVXKOUXkOFJ3NJmFPCxBoKeQeKhNoQkoNqbDWivkyaNk0TrjWvbYIC0bML3OLT16/XKg1Fk6AkacNB3tl/kxfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6789.apcprd06.prod.outlook.com (2603:1096:820:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:40 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:40 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 5/7] rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:07 +0800
Message-Id: <20240829072209.7253-6-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4986b9fe-188a-48f6-b63d-08dcc7fb5dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?50vJRl+1I+hKFmdylKB5VHQnUUO9WwCPk5jjsmeJ5vkKx9biZpsGHooiwW1u?=
 =?us-ascii?Q?3gy7Z5xzFcvLNHksIgUiHaELTG/VpMLIDQGhSOIuKxWY/9EVQsRaPqlKxF/U?=
 =?us-ascii?Q?YZJiW8T5xlWOgMk9S/JvKmSb4b+rrL99cxdY+8N9cTLoSaF0K4mmT3XDrUDt?=
 =?us-ascii?Q?eJ6VLQe3ynR+wLV1wBUGXgVh4HJhV43Wba6WQcogZ1gVRgN16v7jg+j8yJ8O?=
 =?us-ascii?Q?sDdj52qrfNshGMiyLJkhQpputOY3CnfBn//F/p/EsV2VKqxmlvoDw8Xt7Sn4?=
 =?us-ascii?Q?G1PeaibsX+m8P5TTb0wBiWO9SzPPPBLxCTmY2aGBJKY4abnyxEDkeNkJFlrl?=
 =?us-ascii?Q?DNvKypJT/njfbF34cMZoKdJK/DqeWjx/l6JUO7vlhUB/fLRhW6Au+N88mxh+?=
 =?us-ascii?Q?kgS8Do2AQpWCppyMTFH0LdyWJtc0M3iMzAtHct3T1NurIGdC6Fg9K7iUq5T/?=
 =?us-ascii?Q?0zfNNZS3xL9oBRVvU8QZRZframk3xMrN4MTTIlpllyIZgmNgcmtRqtRV6rt+?=
 =?us-ascii?Q?Uq+3IbZ37KEDpHqNvgy2pD/EUR059lkbq7ZZFBVHzHExQhydBNSbKEQwNEyx?=
 =?us-ascii?Q?d0mWo/VJ7NnMz9MWL4DbahRlJAqk7uTvtrx4q6UiEw3ywOov3Ns7KHVKzjkd?=
 =?us-ascii?Q?OlnVP+TjadZa98COhaW4hvU7dB/yGulhWzz04nbevtjFiAvaU4JnRwCtw2kH?=
 =?us-ascii?Q?Ip3kdzHYKpja0RIUPRC7Lt1Us56QFJ/a3j8ggRV3jpQ4lykkzdlNQYMfbd1H?=
 =?us-ascii?Q?HaDRl6JCJO4WfIz4FhxH+pnuUjUo09oupogDUnATl9l+C2mRhFkRucccZJLa?=
 =?us-ascii?Q?7VIidtYj73V0+840MjzHGjTUyleD24pJDgpz8SoYGoWTBVC3AF6HB0jT0D9i?=
 =?us-ascii?Q?sFeNRoZ/yZ6zihC6dAAwXiZyGe9YHczNydjlqXnjktqctPp4G0yJGNadtvIh?=
 =?us-ascii?Q?SwEqZEm5y+iW+f0OlEZSHPwx7lrkAOhhBXFCTrhaN3AAtfTtjRGnlxjWxbml?=
 =?us-ascii?Q?5PSTYErxZjOaPaUaibI2upimmoQSkWvRv3ZhXOoEg3TObedfj8KshnErIlW4?=
 =?us-ascii?Q?w2ZzaVqkSi2rn96co0ILHglfgbErSqtEW2I1hzdCtZRHtdSEnX9Ax2qFcP3d?=
 =?us-ascii?Q?mD55KVw/7KGvyugjsTJZ2tVvz4Sd4Ed9Zwg7qdNXx7uZTemadoGeO+KH0MTP?=
 =?us-ascii?Q?R8F7MoDbE56fvHAg1eXgspJsw2ukp63NsuGsD4ytsuNs5A82sOl2y7n3z0uo?=
 =?us-ascii?Q?Azy4N2nCJ3EGKRuFRGXoJAcrugfibiVWhVp4GYjoyU3o0ZQ7KDOLSudbnXsl?=
 =?us-ascii?Q?k230ezRmZ+D+nwb9jnQX+suh7L4Zx5kEkE8Hp9LpEC0sw+77+Tp34TChHELw?=
 =?us-ascii?Q?JPthescxuUlAYzhwa3Pvuz1Co8aQFDjmVZ6hlnfP6pHG7IebDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qdo9sHmkOZx7WiuxpM5XnfcMvbaoQNKeH9aFleoMVF714G5A5y4INC+qJtHB?=
 =?us-ascii?Q?WYhzlyRFtszLh2sUgi0AsSifRPYuwNd834f75GUSTnSlOiqU0XUNmmXp1VjO?=
 =?us-ascii?Q?wsyZ/PTIZ/c62JjVHcxfx2LMc9t0UpbFTGA8qV+YL2q6afY0he8hQjCNFpEE?=
 =?us-ascii?Q?wrbkxQldphA+tqaYjQviUqMUiIwn2GSDJ85yzqd7HBNwUFf8z8IktbMweCp7?=
 =?us-ascii?Q?eK3KbTdvjEg2InbJUSdH9vbjbTH5AGJLxv15qva6E/kwPzrFrhYpiUKgizTN?=
 =?us-ascii?Q?b0/nVOPWt/ho7Bhh1Oivd+0y99gZ2H0ntpcb730JdKmuguB/OlDInwyq6Fk6?=
 =?us-ascii?Q?a/ef8rB3Z3LfB7bfG2HpPTVHqnJ29gO6IiPtAE4EC34sPQZ4Bspc8/cz1eDi?=
 =?us-ascii?Q?G4AsO87eDEwpfRQZiYLb3Ma677iC5EqYt3k7EZwkSDAsDQnUzoWbXqYrvU1N?=
 =?us-ascii?Q?AmWNZzmhuTpYDhKg6CJTcfJI+CwwOM6yig0hOD8L6UvxAX87dznk2J5y30sM?=
 =?us-ascii?Q?+WviSZo8cz4GCs4lRfr5aVMbshscDFvHevHhLs/ZnYNxVuKyACwWZDcQdn8D?=
 =?us-ascii?Q?vyzgwzyMu5uP3JDEZcyL9+pDLesFjq0IRbh2RGM+QD63kXoeZHwJ2Hy2cu3m?=
 =?us-ascii?Q?DKTIRaRjRc8dT2R3opay0cbSOEb10fJDP5Om7MbM0D6f3f8SiPboQ2uMyne3?=
 =?us-ascii?Q?luEPsuwYA99HyqOjHacgU5VQoWCXb0vCVDzyZ1aulV0jl4prQkKDHkMhxJjC?=
 =?us-ascii?Q?mkyv+4jDC/GaAE1FIaBvSEoWL5luJxZUmlRCvOLNZXjdJA0MHdMHzuaIZIol?=
 =?us-ascii?Q?9gbCYbwlWH0mKH8mhCdl8GquX5Af/H231Y393i9czDTGP/xHR0dFMNHOC+ao?=
 =?us-ascii?Q?7MOg3tx/PpXTnPWPBGZiY7/v0v3AQbV4U0G6XFH6Ec6RA8wcHj+O5fd0IAPp?=
 =?us-ascii?Q?Z9lckVJ6mC6ld47twAyu04tod/jvqkkL9C/6Zts9l2kvLpb49/rT265uUPfI?=
 =?us-ascii?Q?XefnxxAu0uR2oqnRvR24yGOdTCHLNuT7WbB5JFHfVlc2Y+QrGQYKzWwEsJTb?=
 =?us-ascii?Q?B7Rw7+XxD4MgAfgWko24EYGsihKRit18UrsbkxV9UsbqhMWdhSgwXKoAH/GS?=
 =?us-ascii?Q?nxPbqX/nUiCOMXlQNjCNtJmyUqfERCzchA6GOSE3W6QqgA5tt1VknTtvGK0j?=
 =?us-ascii?Q?SlRKzGALkLmED8SLwXmG86JMvAyumpQfwq2bi0P78y6L1vemf0S/IkbrnBWF?=
 =?us-ascii?Q?ysid6zPlvcyr/8rFy5Fr9DaD/RK80+zKwgTcCYfXEvpdbbZeD8SdgZxpO1Um?=
 =?us-ascii?Q?8+cvayIEfgW1gePXSoObNvCNxCNJjh6Q1xdt9dGFoBZkioKzwiEB4udepFkk?=
 =?us-ascii?Q?w5g/Gm/PmlbOEmlPMg9OUdg9zrc/a5i3cfDGQ0BfQNDYeUh24gn4yV8zeE65?=
 =?us-ascii?Q?9UvOzYG4ClY7DoqYGZb0gfJ1mx4i0dUbxLty4wpVjwxAqRfFk92ZaNYCOuzS?=
 =?us-ascii?Q?cpAQe0Tjxz2r2wKhZHElcQoaHTVLhH4+Enui9Nj5koVLECdOkYoIbCs83DrE?=
 =?us-ascii?Q?Dd8nfS81Gbk6z504I91Ss7tEbLdi5Hszva6Vu59i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986b9fe-188a-48f6-b63d-08dcc7fb5dd5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:40.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE7T0qxPzpvYMefX17BJqpCV8aB5mhDx61t3c0fh5OATr3VklHqqaIn4Xw/aA7F5y3GuP3HeKzE53jgOYKb/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6789

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


