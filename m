Return-Path: <linux-rtc+bounces-1687-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62F95ABA3
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF89E1C23546
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 03:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AE54963A;
	Thu, 22 Aug 2024 02:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="rFvu3wSJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010024.outbound.protection.outlook.com [52.101.128.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261714C627;
	Thu, 22 Aug 2024 02:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724295449; cv=fail; b=ssdUOSTJdgcl0Z6BcRz204yMklibI9Gp6go5NhLk87NXWefQGYj3+XtXmZOOn3l3YYdVJbhgxZU7GoV2qNMAo0l0q5wOTayyibD+9R8pQh6SbjlQpXIQZmUk9OynzIpwsdyYd56LrKxld5hMu906dm3zWhSmz1ItrHcet1e5vvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724295449; c=relaxed/simple;
	bh=cT6lZHUXAL3M5l4p5lfRnf3CleaDt4fo8YrTbkKBtlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQEcjGnAaG8mDU11KkkE3ivJJ5/K9nbXNd/zTStiBYjNbhjwPeTBWU5XsxbmwslC8NQxG6AEnqZz6m6Aik9ku3v5ZiFgqYQhdIEOyF5fw3ZcdnR9aD7Ih5EhEYddQkFlzdv0bD0fwQtkbZxGYLHwsMByDCsWivn9douj4xn0N0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=rFvu3wSJ; arc=fail smtp.client-ip=52.101.128.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ903ehysqhNFF7y5opQy6cz+xvXSAAVvgzPeVS7L1eLxiMfY74RwOn+6qJP4FS4lADuwqoli/e1oV9gtiMNnvz6fm3A9hjV/EiV9q2fO1QoJnKjrMFS9qQfuCLkT3mEImx2gR+QLmnLI4VOenpMKLKGeH13qQPeV1XTMS0KdPtQRFzSGweD99XqMzVwmLz8+FT73d1psIFwP7aBFsLXUyeCAQh6Ptg71ri6ltyRLIATDArw4G9THQHQtfe6i6+QnD6B07wrAIZNkZmr4CitUmOlPMFqFpl8GkkM0yoGDLTO3R4q6IRZ+s4APGLHw7byIGbaj3NWEZRC+8UVGDu1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=pKqezrlNPVm3f0Tm6NgPqjEpj+6r79vAIAidPmpil8oH/0bX9dpJsO4H496DBINSu4S7SiGVhF7Tv9jsJuKvCQUiJPqzqcA2tLmDYE4PKOjyDgllD8dogZPd0Y5mO2ncapl4/vvgGLFH49PScC78XICaZYh9+YLNSPuHxSFV2qELDZ6hPizkEMalzLNojo5vW5ckwAjUKIywVqU51Kc0cLSBwLqRFYqnJ7CD7fzaTKFUqR8Lq8kl6tW8d0kOWVNs+qiVtO5xOHX3IFiazjF0KFuUVqn47Fn1hz4l5hXqoaBPwUUM4rzYTyalsTiibG7IrbuBwrlzkr6CUbVah/zlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=rFvu3wSJajuDd2G6T5TxNU7Cd0CRzmO9rWpSYhs7qY8MNssZ9keeMYdr0OxIb32uXg1TVrDmQrSOw6kL5EqpdSZGrSQ9Jw06p9Kb27TFe+hqsnmwB2tL7dWVvVbrokMzieasa1frGPY86Ze5wct9KyYOFYxvLvAYEDmkjmCOa03cuy/OwgB+HMq2KVedWX/DL0UAXIUfXxdywnEFept149YcWnLPeJ+sPWhLxz7JnEdXONo6NVO4QiDTImlC8RXTQoFqhrSYMJ/aLHsuh42CgVQlpD+/TG6B4S6h8mdRiPrurP4D9G9URvEaSuuSydPiuC0gJ9dNjA4Fvic1n629RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by SEYPR06MB5741.apcprd06.prod.outlook.com (2603:1096:101:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 02:57:19 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 02:57:19 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: liaoyuanhong@vivo.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 3/7] rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:57:01 +0800
Message-Id: <20240822025702.14473-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-4-liaoyuanhong@vivo.com>
References: <20240821092846.20138-4-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0078.apcprd02.prod.outlook.com
 (2603:1096:4:90::18) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|SEYPR06MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 50627d73-f8ee-4c6c-8cea-08dcc256232f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzMdWoiK4YpFHggm+stqccJRFQCAEWg0K1w+djTf8FqxgryxqW4UGiMI+aBi?=
 =?us-ascii?Q?XQsyC8HWrWLgJA0JoV9T/9sPGzGUKf0DjOp11mCX8aEfjiA3knbK5NsWzYf4?=
 =?us-ascii?Q?zzTOiZJenlS8asvNXzfUQTRgtcGnIb0XFYoArTZk4/fxpR7iJDqdzOYFEE8q?=
 =?us-ascii?Q?vEC7w54hy1zj+HyO68HGqRsTSuUXp8orMxSVukJhJXAu9Kwoy92SSrKJMG05?=
 =?us-ascii?Q?m6U7rgD7urvdPloXn8/RbNkBJ5U/Q4DUYDQ8TOn2S5eu2IM4cWWGgNUUlwsK?=
 =?us-ascii?Q?imzUm2wfQrppfrXOvqfPnhY3qMPBT+bEA0+NLkgfH3MAM1KECjt8C7MCH3wx?=
 =?us-ascii?Q?zPJJqGpHiB26jgevP74xj1XDpc/NHSDeKxQFDzQt5qjjGPeHxRNpCS/ukt6v?=
 =?us-ascii?Q?GuFADZgWoj1DaaP9AMvcq2hNoJ6m1jqN9+G1HmqR/Xx4TJ9vuf0zahOQ1Ef2?=
 =?us-ascii?Q?/UA+zyADBf+AUM62c+Ka1fQapMHGtho5HBNkj+VGl6Kn2d7EEIgvc4tN8WtK?=
 =?us-ascii?Q?6H5YV8GB0HdhaaCOAhjfLnWXikFw1/7MYNoC3+3ifnj1/Kk8o15zv5dnAGl2?=
 =?us-ascii?Q?OJsfS3ZUq2jz6LNFspW9ZI7EK8MUG5pIXWJ7eIBL/37MSmX8E5bbgH18gyG4?=
 =?us-ascii?Q?ofPRU+T2oEOYTFOIk34bnIFX/R1Fw+rGytLcvEYkRCpTqHWu8AB5vAFcpvDh?=
 =?us-ascii?Q?F6I7NQVgnkXnSRg/mMay+Z80PD80laaurmhxeeh+iSGc648m8JSf0HvoCXgJ?=
 =?us-ascii?Q?y1nKK80TlxvjIYYM+62LCu+tp8ps2QCSLWY+LHePPZT4h5y1OL4Y97v5p7TJ?=
 =?us-ascii?Q?e+eao+qrKNbJ76vdCSjV9ICkRowuefffQBJsgfTk83C8aHYZebOXZpV01cVy?=
 =?us-ascii?Q?6ngi4Z/Ri/brs04zhL6/+bMturhl7S0VsAmYZe+L+qHbSmzx2D1njlrd69So?=
 =?us-ascii?Q?aBkT0fMpNPAlAqb/Bf+J0+4VcSZcVCozw+Gl/BLzIOLe8w90xu0pT9BrpYKg?=
 =?us-ascii?Q?5QmpnMFf+pGnROngJHm4QWQ1qCCo9T3qknG3pL5eVNOmPumODLaoHN5RgFqa?=
 =?us-ascii?Q?5noR67iVcoaE/XGfKyjJ4OYPz6aAY3LWaznYgmLt+2+JG8qH9P+CcjnX2vbV?=
 =?us-ascii?Q?W8ZKjsVlrZ2SuZ7z3xF3aF5pvIf/3wLcDFPyt1q9zCVeJ1zhYyTgf1n8lhYS?=
 =?us-ascii?Q?/D/C6PKRHClxETp+OfdDzMx8z4Mtys7eqPjNUf0RKJOtr4+ZdM7N6OfE/EJh?=
 =?us-ascii?Q?/vhz3Fwp7ShTpZ8AcoDf4bmRqS225wnB6sGoHJA7BJF3ioktK66uBWSANEDm?=
 =?us-ascii?Q?uWtW95LTfq0PpR/Zh8FK+hFzj3a9Qr1WtCXKeHwNmwvumOzXx3w2eh2JZ9Du?=
 =?us-ascii?Q?oRnTBk1Ra65qlAW4JepTLxsjKXDdZa/ChIVl5WWROFFQIkeIYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5579.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eDISpKb/561ux3TM7FDddtEMeMmyXrPGfdORLX6SnnvgeOSjWTyo9OVHUYbX?=
 =?us-ascii?Q?+vYFE3zpnZgPHJK37HBTyI8eGKBFZQvbX9RtiGka1pm8JXXfACrAqYza+3rD?=
 =?us-ascii?Q?MUPnBHxnhUlhdjUshLLxeArsKwgUvJ9xDdwaFNE8+E9v5Iv+wdyBGJGE3rqE?=
 =?us-ascii?Q?DRP4+eTpERKajziZ63LmZYPM+LfxEpn9y110WDr+K/dB+y7ZdZSW5WXrP0sc?=
 =?us-ascii?Q?f3MEtFLoNNYk5Vltdh6LyOIV3luitZgw5N2GLdnamvjC+qW+mzHVlHUvWhvC?=
 =?us-ascii?Q?O+NNXzZqxCy0pJk/KTLefI2YkTr3wzc8IxV2le8XL6b/llNwbOkE/rznAAsE?=
 =?us-ascii?Q?N2Elk93tqlMG4qS5jkRCDGb8S8UxNvf5JRYk+JwCRvkPyC5ayBRRtkdaBVWD?=
 =?us-ascii?Q?GD2Ad8uWEZ1xcFAs3n9o4D6aYUGVTfEnKMW8trQ9IoIrOQFMrJAwHVmommVw?=
 =?us-ascii?Q?k6wHo+Zz8M/6eejQawHS6tw288lcm4e2z45Pl/t+9iBX0JHtQfrNksxdtY05?=
 =?us-ascii?Q?+IBysokK1bfkdd8VYqUUWsoivMZ6U79q6Z0vC0mxDhnRlVTCBhR/IOCbLEhk?=
 =?us-ascii?Q?FtJmQ8PIOpam/u7yk7/3Nv0kWO9zdTFS+9xQnP8PWguXIQ/uewrBw4HPlgFN?=
 =?us-ascii?Q?8ugdRVURRVFMjjV0pcCXTfcgJWlWDQfplhQwHpUl19Jms39Wxv+2608iiTe5?=
 =?us-ascii?Q?8affyJ+yTrR5EbONpvP2T8j8TH/ojFADr5Oq8GG74UWePARC9C5w4XD6N1Av?=
 =?us-ascii?Q?nbtpJ6I4mQttNYOdLZz2p+99MCm/ihHhjdffcUVQswO5eDai8qb2Dkf3aLO5?=
 =?us-ascii?Q?+A1FIzi/linobhBxwxo/fnr0RS3l13cKPb8G4ymiYtjBP7NOTWtnOp2vY1bZ?=
 =?us-ascii?Q?MyUhMqZ1tPpc7aLw3XO2FMlt+hWqmeMFO7L+qzZ4q/2EuqKqfdWIzfK3GUXd?=
 =?us-ascii?Q?QALBii6z8C5xXmm/VzxcucCBQ3iy6r9KChQDgjhq6eKTakilNFFNvJwguIdJ?=
 =?us-ascii?Q?4U4Q7vaE+vEujeaHR6hrdcYKXl+pMF7xNAJoqJSVwzgjOQCTE4FP/U1MIvcg?=
 =?us-ascii?Q?XoIhX3qrv3miK30BizOwiQxZNbKGl5qKhaM7KcIllZGI5DP8qRjIAPqaP3ym?=
 =?us-ascii?Q?imz/1xKhgXeOoocSCb2HECxICzUYt4UjXVd0N+Q/4EbPRgMH96J9k/f689zK?=
 =?us-ascii?Q?38SGEAgUHhgCW1mDxumm+gW7BykwTvBs6J5XuNtYpmE48i2KyTCXKzKx6ROg?=
 =?us-ascii?Q?NalGPsGlY3hunoI7h4wr553wv+W6Yi6uXEXwz1Z/k+ZJS86hBLsUt6TX/g8e?=
 =?us-ascii?Q?pL5wP7p6G5wZaQlQMMndqexIBXBwB5epEGNeTp0z2svk1uv92dCDan3Uqmou?=
 =?us-ascii?Q?rHm0MloECUISZ6i3EhGiR9uNQpDnJjLffVXSShYAKz6y5DdAv1W3fkpjWban?=
 =?us-ascii?Q?e88Fa51znMzh9NhJuAsWbTW40h+Ze8zpfL97CeCt9Fus24iNcp1Roe6eyokj?=
 =?us-ascii?Q?X+2gAUjBe1DnNmQw1T7fuzDCD8+v4c9Jym//R77ct9Zhnxr8I2DqMfdMj/ig?=
 =?us-ascii?Q?X5bZs5KiDpYiN1BkK5nJmHUEhx9/IbnUg192XRkz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50627d73-f8ee-4c6c-8cea-08dcc256232f
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:57:19.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnDNWv32p+KdiV34yaTvEjSym0eyVCdS2i79TqOtzPXJpQaO2Xtc1lJkWhtN1lM2vvK/vCK7l100tX5tiEJj2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5741

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


