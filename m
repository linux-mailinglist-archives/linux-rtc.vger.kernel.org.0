Return-Path: <linux-rtc+bounces-1760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD267963CAD
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 300A9B23F71
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CB418801B;
	Thu, 29 Aug 2024 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="d3FrfbWq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACA917799F;
	Thu, 29 Aug 2024 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916162; cv=fail; b=m/dl2duQxzXaoCrg2wB44VHRQY354+8D4HOPwN1A4IhD8UNpOFWyKqQWV2l7N3XJ473oZZA36eenMCqHjFb5Q1g75c5O91yTMnEp1hymVxnbNqUPHPmvnsRDNiTXFe3iPp9Oimtro2hHN7JlYiBW4Te3tCqZWlGgAflxi75myr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916162; c=relaxed/simple;
	bh=IbNEFCZxiqwZqn/qeK5t2lXr5khkPyJ7Ke6mq16MIx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0PYVjWlrZ0arMfL8TnEqfFBDGNFPRcBZiMq8gGI5Zj3u7OSGiPLdyP6gdEzoGG12RczGKYV/ZxtCZP6rXBUJGX5l2LpbsfL6tvCstYewP980lUj1QnECOSbttz5sG3naAZYlfxGa+2y5EZOG/GENaCPOeO7emRE6QR7BF+V1o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=d3FrfbWq; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtZByPIg66JbDZzf6kZA0Ed3+XAlKOeXgH8VkM/3uiLA822CMWHHt6FGfJfId2qmkRLGCtxgR4ToVE7XaJc4ZQhlK9b5rkx7mPGhk6z+Sim023b64SNRHJlj5QrpJ9cWG5JUsT3B1sdbEWM7ovhuOLcIY3o6K/SPweDc1Fv++CyCdhtmXZtCp5cHC388MlyadW/yJC7WJ1ZMcSXZCkZqsRf6gRctTf7xKdmg7F8JlNWna9KmGg0g24JlFxxQWwawgBgVYFNqpGreEwmOv5s3DWbRqaEd8MBIKTxnLABnwQrv22H5JukHtdCAUNKrPZdxeh1n3+fQBObQeBPxfmW/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=UbrggsFprhFP93QVt5OKnGiDg4afO739fhosbIsE7TXEp4QuFz4cdbbTIkVhXkdDBzG+IWp6t/KLFDe6JRyviRqgZXxmA/q5qDRqrph0Eg1oXrnxunmvhzqiskJWHKAJmNM8f7z0aHYeKNJlodpL+45/k2HoSXBm63G/31kd2KJMB5k2heodX8ENwMdhnxJaYeePsfUnGbwvyByJKS5ig/2Ssf8/k77Iy2WWNxLehtiO2NP5RtQRmw4oLN0e+peWxIGfxfn7JUDzAHSQETt4rvdRWbyNYernJB/vXzfzG8UV5pAucboOycV40QdAhUeVyYFi8CpSb+8tbaQ4ktBYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=d3FrfbWq5DX7sV8GqzgAtIGoD8MBMYaK8iPdw6LANsYbt1inGE3HM70v8aQXXkwXfH5yJPKRJpfNLwcpi3QCYrgvV9zo46M4PXaVKbHv9F++CSoeli6HXwb161EpYy4FgekvnKgSytkToIcrmJMfdmO+PwBqRp3pEriyPezVKv9VrpouuaUm3wQ1wF3btOGGMs9KAzxEdy5oUIjMIicshm2gjHtz2j9wBNQLNl8gt4wkSzau5bZM6pcgCDA4ZOuOO5mM/u4AJiajzlx0Xxb+sNLSaGh417jqEyoSkgs7zaNi/WBq0bEb5nZN7IKNLEZ5r3FdhB4tRf8NLjeGt3q5wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SI2PR06MB5172.apcprd06.prod.outlook.com (2603:1096:4:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:35 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:35 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 2/7] rtc:rtc-imxdi:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:04 +0800
Message-Id: <20240829072209.7253-3-liaoyuanhong@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SI2PR06MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 89db2e9a-0e1c-4e31-5031-08dcc7fb5adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ahFBKT5BdySh0K29pRtkuSgHgjRDIATlZAGZj0N22OL8lsf3NeUaBzb3n+r?=
 =?us-ascii?Q?EybEjf54/HNRSiCQ4qf1PCKPEoMM2tma5ZYUY7xVPpLU68SRz1pI8MF+PK0+?=
 =?us-ascii?Q?jPUST2pCV90n9dG56+OlldAWCN6L3Ov6e1eQvTIV15+eVQjURm9PD/own81O?=
 =?us-ascii?Q?g33plo4G0fRKblnGlkL9VQudnINmjs3M7zDhTMaQFlTFNBuEbTVQ1qa1gJcP?=
 =?us-ascii?Q?QHFatvDQn8Sf6SZ0BQRGlAZP9BDto3OzZKytlYByt35D+JqXvUKYaZYpRcvz?=
 =?us-ascii?Q?ZiwokTRrYYoiXXncbEuTsYElZZkvw7lDrcnIeQIkFb1r/phd12/l13QtnRPl?=
 =?us-ascii?Q?8PcyWFx+3AVAKJp4KtZ74pENyTQ93GxtEtBFNfriwV5QPnzW1r3GbPjGAbYR?=
 =?us-ascii?Q?TSmHZqQ0uw49Rtyg+0S5dSiQGXyJHInmj4tyilU546HnDfhGth2ilvej2t7H?=
 =?us-ascii?Q?HSwDKLfwf/mmHgvsP4CzYD5mZ01WlKFRz3oqBqdIWs0Sy6s3FFHv3s9v86xM?=
 =?us-ascii?Q?BcoWcMddrTViSVhneiDAqkmP3bjced8EF38nIGbBaxvuX0qfnkkwmV2wySbI?=
 =?us-ascii?Q?SHclF3HmM4xQ6H/9/r8HmRjttMgLnOsESJr81dkPdPZBd/AKv6OMTsxNUcZy?=
 =?us-ascii?Q?5BHCMT0mM6rfFSTlQ7dobY3hyIm2DDb8EMwmAM4AWYcFYMJmziHd6neuoUG2?=
 =?us-ascii?Q?sdSOr+oDfsE/J0Y8mQAjrvFyOrgSRL3eCUwKoDyea74e/pg6Y8Kb0+dPqGcS?=
 =?us-ascii?Q?slVpyfAYvbXOb6pncxexpe0h2sEi5vTlw9Q4xwRlHipJ6/W2WDssN3280I85?=
 =?us-ascii?Q?xCb96GoCi0ByC6QkaDdGn9TcRM64UPlr2LxocCB4wz17RjNS54QVbaZeegYo?=
 =?us-ascii?Q?l30mDNF8nIet+tX9ispEXojPWm+3XP8gYAk0Y5+trP196H0SEFf30ITY5g16?=
 =?us-ascii?Q?hbqhPcaXfAS+4+lkcHa4ZOSxG56um5dwZfK0bsMwgSQarhKFSmGjWxKOEpXG?=
 =?us-ascii?Q?g6zo4StqW1TK+iKlvErvIWzU/9Z5L2XU6y+HQZK2b27jhoJcj0r+rb/8DuXg?=
 =?us-ascii?Q?ZoK4yZKubj1e2b9AYoHe15/Bxxs2+lCEKyTqyXVygVAlcaJsi28qxRNHKAQq?=
 =?us-ascii?Q?l1DS6bpWvxfsAoaNG9XY6f0x7zhFR3DegOwqh9bv3Lhp5uJwg3kawq+1kprY?=
 =?us-ascii?Q?k5jXVhQCcZfq30dKKOeSOXrj2tJdQqvxCAVDg7xP7RJWcsZReO+/pTwtebH5?=
 =?us-ascii?Q?FRbuVja++BPpECN4csi2xu/yJn9TFc7uwsaPbigukWuh/jrLCHUwfjOuaOC7?=
 =?us-ascii?Q?yBDYdI4iAGvS/0KoSauxpSz3zZqj5bkRNaLRsOoSnS0N7T+ISIDfJ04mzCwp?=
 =?us-ascii?Q?oDNbFoKBHzlKgkujmZNj21OZbrMfwHRWcD7WWMjslTY1qJbLhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SdryDSCSPsUFxxqVUnjjh1Ebm6hv6VsS+tzLpCtTErosbDciFe7wnDE26Nj1?=
 =?us-ascii?Q?8g9ZD8qwm0T9iXknmDegKt0EKI37i3hfWOQUokt8KnRo4QYzDmWPOVOFO2hk?=
 =?us-ascii?Q?JC88Eo0KZXLILPV1Gc2Nwbkc40qw5MRthsPknBKOluClhSfgKHMbRbWODFXT?=
 =?us-ascii?Q?FPO6m3v+CII0TnuixGmM94K5tP6uAEwLwMjaoV6hiEfqt1cUGhYefHyTNjgY?=
 =?us-ascii?Q?gVKnVgLXUTYpALzPdY7LqtypKM/NEOQwAoQH76WpWDd8svw2bHA5jyqr0pKU?=
 =?us-ascii?Q?fWiM5fMTw5SqwoyXKQJ3VlKi7lXiTZu1Y44rBiUJZv6t7b5d6RGrnqT2iTYt?=
 =?us-ascii?Q?Tg5v1fC3d9ETI+PKHVjfqSorKDgtsaq9F5dhTKmCKq3Qs0WCpQs3Tjk8JQBl?=
 =?us-ascii?Q?lDiuS+ZOjUr2nWMfU2+s90g54xI33hhsJPqDy7FmiOe3HDntQcPDMTag9i7j?=
 =?us-ascii?Q?Aq5Z7+J0QxYjE5FH3QUe4gmOeiQVKhZilTtsoG8cq3ZXNnoPM49Srbt0uYYe?=
 =?us-ascii?Q?aofVP9LMeJYKpxxR8t1gTRe6DiKWIwsGF/pwihtt0xHTVm44X6dpemccDuJf?=
 =?us-ascii?Q?X68AaZLC3DY3mu+iPGCh4W38gIKUzq0r1f+OO6l8khDW4RwNSnl2Z8YQm2PH?=
 =?us-ascii?Q?J2OsugFbj1+KbPyRQpJCXN0CzVdSoNbK3sTWYx8OOCii6IGSTredZ1FJJ/j2?=
 =?us-ascii?Q?9lgXRss5CCEoqB5OAgZpM4FAU2laG69goPWJ+SpasEzwUKRY8rfUfTaX8IHM?=
 =?us-ascii?Q?DbnIu0zjb4gsa0GTd4VoBxgCSnpP/yFp/EUz1KrOnRizGFKGGtIJQCseKbvE?=
 =?us-ascii?Q?NJxeXRw8q/B3GEN3bGYdCUAb5UvNW+qrPXkfLkxWMFPCxHCbsP1wiIdLFrBN?=
 =?us-ascii?Q?JbF8JjORVKPB9CX4+PZcjEYkZ0jdAeK8dlxm5EuBMT3xeqaa5ssgS7IF/7Wm?=
 =?us-ascii?Q?QM9sbPp4BG2IcVQ9QWstbYBewafGK1asl11nkEbFIIyu+Ds7/MQzvDNA9b8C?=
 =?us-ascii?Q?slAg7Up35inujIH2q89f6fX/x/j4JRdnmPVHmrnYv6Z6o1uo+kvci0VoqVqE?=
 =?us-ascii?Q?B1CC4h9laGXuOwf1h+uMUnlcYTEQ0EvDeZuOR9wFvj44XY9cRMo9erIa1W1p?=
 =?us-ascii?Q?SVB7OTcK9vWrjFSFvzGURbUsLpHqDavNN0xA1WWk3dzMWNpMpWnyY9Kr2iOU?=
 =?us-ascii?Q?wT6WbCWy6UjZF9Cz6+dhS4db2FkGXvlFToXFqYfkU3ODRBeoCcbF6351+hM5?=
 =?us-ascii?Q?aRVIOcC6a0dpNsIEaujwnmNLQSjtxdvOkMrDzxkF2aPm9hmH6yqauC74sGgv?=
 =?us-ascii?Q?Z0MS1Nvqn2KszawWMHnfneCXbsFHT1p9cVdz5kP5ZGjX0AQQO5Db7Et7uaZf?=
 =?us-ascii?Q?egfMV40w0AAnWQQ3sC+6e0F6jYSjbOuaNb7bYQv/LmspCO5kYc2ZvMFnlBLa?=
 =?us-ascii?Q?ZsvOXPy8P/vV3iJFkqaKOhYkKoA/TWPzLWp0BzU1Fou5/F2uXNub/DLPOBir?=
 =?us-ascii?Q?AKcdxTLO0cbOt15uQhZcS0pIe8rvfGY65LBan7SuqMAvfxWbXXO2FDC5lC65?=
 =?us-ascii?Q?JxtxAAFCKV2D6PR0z0G7pSN0DRBF550TSQ+L+Pqq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89db2e9a-0e1c-4e31-5031-08dcc7fb5adc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:35.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXDbAtouoJe4mvaudet3LZx1jekxCEiT/cQ2QbDH58eN18/fBI/Ivt9wgN7H6EiG3Lj+7A0syb3I8WG2F5QxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5172

Use devm_clk_get_enabled() instead of clk functions in rtc-imxdi.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-imxdi.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 284011c419db..6cd75c5d8a9a 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -778,12 +778,9 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(imxdi->rtc))
 		return PTR_ERR(imxdi->rtc);
 
-	imxdi->clk = devm_clk_get(&pdev->dev, NULL);
+	imxdi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(imxdi->clk))
 		return PTR_ERR(imxdi->clk);
-	rc = clk_prepare_enable(imxdi->clk);
-	if (rc)
-		return rc;
 
 	/*
 	 * Initialize dryice hardware
@@ -794,13 +791,13 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	rc = di_handle_state(imxdi);
 	if (rc != 0)
-		goto err;
+		return rc;
 
 	rc = devm_request_irq(&pdev->dev, norm_irq, dryice_irq,
 			      IRQF_SHARED, pdev->name, imxdi);
 	if (rc) {
 		dev_warn(&pdev->dev, "interrupt not available.\n");
-		goto err;
+		return rc;
 	}
 
 	rc = devm_request_irq(&pdev->dev, sec_irq, dryice_irq,
@@ -820,14 +817,9 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	rc = devm_rtc_register_device(imxdi->rtc);
 	if (rc)
-		goto err;
+		return rc;
 
 	return 0;
-
-err:
-	clk_disable_unprepare(imxdi->clk);
-
-	return rc;
 }
 
 static void __exit dryice_rtc_remove(struct platform_device *pdev)
@@ -838,8 +830,6 @@ static void __exit dryice_rtc_remove(struct platform_device *pdev)
 
 	/* mask all interrupts */
 	writel(0, imxdi->ioaddr + DIER);
-
-	clk_disable_unprepare(imxdi->clk);
 }
 
 static const struct of_device_id dryice_dt_ids[] = {
-- 
2.25.1


