Return-Path: <linux-rtc+bounces-1680-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585639598D1
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CACC1C20C30
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2601E1EA674;
	Wed, 21 Aug 2024 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="alXNH3Nl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2067.outbound.protection.outlook.com [40.107.117.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B741EA659;
	Wed, 21 Aug 2024 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232556; cv=fail; b=Fr+R27ZBTPcM6XX5L3Y+6FokCRl1hrF6x6JfEA7jN0SK5QZFVHUJTQMDyFJONlhKRij40ziTaBe3iqESVnOPSlfHOA6udUxb4JA8fBH0fhiJ6xlczfoWDKpJhFe0DeKyC+S/2MdT9kI7qBT10npQ7fEhvEwlpxUGFxeEMNVdajk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232556; c=relaxed/simple;
	bh=Q3rCL/VOfCnybaX6C1aZjp5ldwRPJZgp77pk58itpN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kjj4hP6PR4Myjtq2Skbabku1HJMwUlKgs3tBPL38a3BroEDENQL94GFEpb6IynnE43YnIPCxbJlpCYo1S3spxxi2mjEbaBGv+tDlI/5O25BfN3XIyRxkBgOrAg3meGawdQfYHlTCe/+hMgYq0lgzoQ6xP8xdypERfxMqelRMypQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=alXNH3Nl; arc=fail smtp.client-ip=40.107.117.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7B24rIVe1jgODiU1dTECcsjBFD9k1iajvOMNlNU+eQBXzYdP8UZI01CzylPR8lZ5wm0+fOutk32KtAKoT4MDPSlxwPr1Ngjg/9qlm1tdqXASDcWezTGgESxrKUSAtuq4XFNXZAf66yq/5NeaaPexTfMc2JxajOiGwXbrlxVALxFqzKcvwSiAvGQdOY7NnydbIt+IFB6AELT46Q006TWf3VH9M4WKy1ZqjBN7mVUWiPYtzFsPK2dc34ZNGAY3IjC0Or9UEKHhHHH/SpDn0eoDgDvqmrjmN7IuSNTVGazZka3b4/YNWR+Y5IKGkmqg7aDcg1ER74H/W883Qn+e8bNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=kHCXJSaY5SNRwC06nRNpw0/lVHK3oSvTnlozz9n7BNkXEEk5wupVmJLVsq4/NxFxVoIzrMtG3IgufsGreZWDYXLVP/4KR8otvoQu1siAOoWa3TTzy7UQ5hetLmw9UVSvNleyXHgn7dbQpRjscdtrnxHwdX/MMFqd0pRqJkUm6Vdb1jjaWW9Vo7ywBzMXhLD62JGxVgaMqzOHtWejl/e+1wGcajoYDedW3rjLPWJ1SsQLNpFQXvcTvu5YMv01U9vpzHukpZN0QX0LVse5xXq6GWSrC5M3d0ntvRVR1+uTjyvUZjDm5Ji6CUlP81bJtPoFKIxuSMzqrP/4AqxfS4OLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxBG4zkDUcJFOjixKybmMVqitqT/HyTi6LrglXFB7Kc=;
 b=alXNH3NlbIRNSkpYO7J/o0odbr9O4mZALkFf0nVUINFRp48YfcA5joDCoa4skZ5bLlc6Dw1mRDGpl0k/vgM0MEwK4pLHNlzleE7KtQkv1khinJdivwfwey+GAAIm/TNdjs3hcLm5oxNsZd/drjCIG+tXKQ0PmhaYY+ytT0MevJdPMs6hlBo+Nin0UPl8wsD3j9mN6G5raFTeq6jxfH7e5S0AXtpS9GSxGeADEF+75YPvjOl4Fqopo4CcOwQD+/G62ablve5fAK84bRzPPHlSXPN+JrvKzfp9u0B0aO2BMgkl8mTgVDAlvzHJC+rV0j0iUzSn6aFcq5riVdJRcflI7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6093.apcprd06.prod.outlook.com (2603:1096:400:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:29:11 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:11 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 6/7] rtc:rtc-tegra:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:45 +0800
Message-Id: <20240821092846.20138-7-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc403504-dc37-4085-e6f3-08dcc1c3b6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LJxtruSUwaFSQW8VAhvzNJ4Ke49kfSChRl+fwbZA4qvrsXZgN6Yt4gucge8/?=
 =?us-ascii?Q?Jxeryj0+vZR84Wtf9Jfh7VAX9hnekIc2x9/bwB8EiWAqxBXyXrzXoKRca1XD?=
 =?us-ascii?Q?LeCLc9d3GA+8HuHWkZ38h0KK/GigsF2Ygw5uMGX+Xt0adsuxghmnWNp+oDD2?=
 =?us-ascii?Q?cos1h9fDGh8z5SWgRy/aOb/LniWyToZ7v4pAbsZEEBpgbXT1SCXDMQ9/AUj7?=
 =?us-ascii?Q?60IDS4PmeJ5alkd2VerItFl1xmS4JlQjQ9hjibgi6o5IaAeeS0b2WcrbGIxr?=
 =?us-ascii?Q?yLPCdSRkweX2rc2fCQ3QmKHQmysosf5asJaRdRsK9Gs3fVX9gaoiXLEdAPeU?=
 =?us-ascii?Q?GdPqwFRTpUh7fboK7HSDsOvVXy/OKtLajr8Wpoo1iBwj1lUwfxAbbfAR7VZx?=
 =?us-ascii?Q?vnIccA6ulyADqbeIoLl/NzZVrq8di428/05QwhW1OWVmZEzE+9n9KCeYCDZF?=
 =?us-ascii?Q?C2HtwRgfXvxy+N/aIG5EnAcd5SYhxOURiay4MDtq8AMNRLAmDop0DI1Lzh/d?=
 =?us-ascii?Q?12DsjkafQvr5WxD0Hq2XMr0QovDYNo2jERwoRyF4tie85emPfLbgchNboboH?=
 =?us-ascii?Q?W8uAt5bfYYrITya7w3cBySK6y/HGQR2ySmLBYEDFqNsYjGDxQ5cgdRsKuA6w?=
 =?us-ascii?Q?BpuqoTeighU9iJa3YVHNWwWvPDA1zMTO/bNi7I9Da9GaYR8rkQYpYBV8s5Jw?=
 =?us-ascii?Q?vzHoi5WEUS+4DFZnyHP93GGoxQiFtTmflkSbpFtmMZR+OB7ytMsXruPieaGE?=
 =?us-ascii?Q?i9rU+gwWFJ1OUKBYVlYNGavHPqY57hdBhhFhf7Jdq0IKTv1EhqkWIFOMRgGi?=
 =?us-ascii?Q?JGSN2sOW8szfNfXx1l73tq3BWtQfEcXaTPMoPUnZb3Ny57UfaIvna+mNg7M6?=
 =?us-ascii?Q?BFKLPZ9FQBwVzNYhVp5AJy/HYYK9Ar/EEIsueYIfVfXaLfI6mutKOg8OLJ3J?=
 =?us-ascii?Q?2R2a1YdDF2IjfF/Ba7NoMhZdfKp2IGcikXoXiSFEcvu+khKiaDwx/NMnS8gD?=
 =?us-ascii?Q?leRoEOQ+nY71jBtul6sTQrMmW4J39HO0ScXzqXc7KuT7IjXSatoVxpUdVUUp?=
 =?us-ascii?Q?7o1wl4fC2qie59ZKg8oi1ZIWR8WqVqsb7t/d267xJ3l00uOiQrcO5duMxBUO?=
 =?us-ascii?Q?yTyUmSf+ppuxP+9Rpd0FZN8x1Uy8tyUhAJqGM8yOk9vsIjlPMu6TXPVLtf3e?=
 =?us-ascii?Q?qaXzYYfWVwy3eGeorJnF1WQW9N7w5nvtdlkQFwvrQUlzSuRfP0jslq0Bfrno?=
 =?us-ascii?Q?VzD95FsW67v0fDh37Q9Rb1N5bMQnRc0RQ2NuVHo5b4v7c3i58X5eHMMBooaz?=
 =?us-ascii?Q?VSp+/xAT2Se29DNRp4i4+xxmn6/AeUYJHZdVOqZSdmgeJpMU2luXJGhyrBFQ?=
 =?us-ascii?Q?hfPbUDM5HpNxXENkO1Low/c/e/Un2SIOzW4lqzHLjxZCjllh2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABNJI6qhLjI+k1oBNyRYH/8dZNMDjVhXea9u71mJJHSXjdI4WpcYFwkWhnGd?=
 =?us-ascii?Q?JNEbHvHLaPH8jdkzZjgBRWMWQLZICkHMnuyYmcMC1A+92t4MgfrnKcP+gR2D?=
 =?us-ascii?Q?OxlTVlcDMpmH12/XAxsILjKIfLZQOuAmsVz4+XB4JaWVc5U6M35Ucbjq+a/U?=
 =?us-ascii?Q?KxN+h9lzc9/J/n9LJGXGfAwvNXWKkM3ednKW4eJH+SC2626/D3juGjxY3Fah?=
 =?us-ascii?Q?aQAZ12BPxNXcYw4BjM0wuzfeNcKFqc7caLisweLU0KeOI9FyL0F0BjcOZ0MK?=
 =?us-ascii?Q?5muRuT+OTlk5iKFQeIsHxbn2zmrfiJ4YnAP9v7tlG4YpQXe9sQuQZ+1kb6tk?=
 =?us-ascii?Q?yTmQcmGBntNGXeHE1oJ/4U+1l0SCDNgH4NH/zZPvRwsOHCPPIKak/L5QzhMK?=
 =?us-ascii?Q?TZnjyj2ZRuQmVohaPzl1aNxXAUZxqMtSh2leJYcshJ+YhuRBFxeyAImO7uSn?=
 =?us-ascii?Q?7kQiUYZsYMY4uKtxzIrImSV7h7w74SmN7hKtw7NYs8BXFPDEzRULxWL1pfpl?=
 =?us-ascii?Q?hve1SEhosVIvBSdIZjNbC1h05Cijp2pqtKgaWK6JEN2OYEb8FSxRTQY3GY0F?=
 =?us-ascii?Q?uAFUwSxjVXvjUURttvCM/iA8NgBNAQqUWUiJOBOGeHlohwD8krb4ikN8geJy?=
 =?us-ascii?Q?AX2rTk8kUwASrGiQ+CGh2/lg1k6yyjQkDXBLmZRkdeRWEaJbKJ06zdIjvENv?=
 =?us-ascii?Q?+Kqg2xukSZZtGTdpr0BF6dP3DQHwZxHCdzsaFv30ffs/ePKTCXEtVc7++xh9?=
 =?us-ascii?Q?7kD37Awm36MnO6AawDpqCO+zoMeArNHfLO6d4kgSR40V6XfkWg+YNHHGaeP1?=
 =?us-ascii?Q?QpK3xN17xr2Q5necKeXkHSY46OT8EhQkJ14rXfwz0W0zNBjSkjwP5SpiAPBW?=
 =?us-ascii?Q?oIL0nCrYlj+4aShWWG1KpNq11ub0+0dVrVs0wVZUQyMU/6Xf4V80EM+sJ28q?=
 =?us-ascii?Q?0GuQp7mdK4jWYbDBPyXMdyHIYZoUBpYxHqgR6osUmBenhxpqMth0u7l4mjnD?=
 =?us-ascii?Q?5Nx1oEjNvnSV7jqBgvz8wGJo7deW0vj8GFR97cy6/iZOLzzL90rHjm5X1Ljw?=
 =?us-ascii?Q?t19EgCy5LnKEFm8A7lt027RRcf5E71KiWlWRr88fxt9atLd2ECmQuwyWnV3e?=
 =?us-ascii?Q?EHaF9lFpZ80n6y0fMjVe3cF5ZRtMH0nm5iiRwv5fBgKBnZM/8twF4+h3mzpH?=
 =?us-ascii?Q?/6Axsrkl0puAApxlUCekEhC8lm6I4shG35hoRHUm0C3XHnrq6f+/tS0nukzG?=
 =?us-ascii?Q?v0KrojzK14GBpPbFVOxO+8VlOwmDrMKS9vI88mC/irigv3sheP3TYmrfoau6?=
 =?us-ascii?Q?9tGgjIt3OaXcOqxzEoqWQXpiKe76bf34Ho+na7w7h1E45GBitynUEqJyHX4y?=
 =?us-ascii?Q?Zw+KwfFJ6drM+6aUX1hIX7i8ptlu5/w4j0oPiyIUGcazKr2rl6rHhCu0xEqL?=
 =?us-ascii?Q?Xfe50WdcQeYOwvpC6Vb8Ui2BYq70tidqMYLteXa/EuRj+iwnergw1DnYsv7V?=
 =?us-ascii?Q?i8N6hYB+AcAKrbf1ZQ6bR8+ESdBgFMmAga8ekdkR5fuuvfT2cnpUwQxjhkyo?=
 =?us-ascii?Q?MaLasukhWp2FzyuxYJr7AsDZI2CcY1AooAXuvxT3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc403504-dc37-4085-e6f3-08dcc1c3b6e8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:11.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRRQx3CdFuOA2C6QSe+CLAx2N8UWhkoSLpbMBSIKsG6ny80o6dDnwyQxvbKzXFyq9Ae+vtw5JA6BeX4lrX37oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6093

Use devm_clk_get_enabled() instead of clk functions in rtc-tegra.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-tegra.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 441e0a66b215..28db5b8cabdb 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -300,14 +300,10 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	info->rtc->ops = &tegra_rtc_ops;
 	info->rtc->range_max = U32_MAX;
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
+	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
 		return PTR_ERR(info->clk);
 
-	ret = clk_prepare_enable(info->clk);
-	if (ret < 0)
-		return ret;
-
 	/* set context info */
 	info->pdev = pdev;
 	spin_lock_init(&info->lock);
@@ -326,27 +322,16 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 			       &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
-		goto disable_clk;
+		return ret;
 	}
 
 	ret = devm_rtc_register_device(info->rtc);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
 	return 0;
-
-disable_clk:
-	clk_disable_unprepare(info->clk);
-	return ret;
-}
-
-static void tegra_rtc_remove(struct platform_device *pdev)
-{
-	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -399,7 +384,6 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver tegra_rtc_driver = {
 	.probe = tegra_rtc_probe,
-	.remove_new = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
 		.name = "tegra_rtc",
-- 
2.25.1


