Return-Path: <linux-rtc+bounces-1691-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447795AC09
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05003280CDE
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 03:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ABB22612;
	Thu, 22 Aug 2024 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="o1ubgOCq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2041.outbound.protection.outlook.com [40.107.255.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DC17588;
	Thu, 22 Aug 2024 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297877; cv=fail; b=n4guLd7mPCtOvXQ4O1oHu5f26a911/xzRSNO/cKXTZTD2cVYiLgUHgfqSaA1ouDOR3mEagjjFwv3Ao+T2Eh0mWBWymBTngWMPY8kB28HqpJhHTlOHWkQr7btrgtYy3mjMKbu9OxbqImSXalOHSNYE6Xk+GLWVR6AbXEtk3+Sbeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297877; c=relaxed/simple;
	bh=clHbUGQvCBJEvipk+CEksUphzdZoHRmr3bpt1+zi6tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=khNfFWT8H76lgiY0tTT/fSuelh+PlNXU+fbqPIjV5Itf3crpxmzZyr4Mk0YwReNbGu84gx2dSCNaGtl46KeVbHOOqU2qX66GGHb4EXHPigWcDBRbWrriq0M2FkSSBDP+JRNeMnqgs2xz84CzvkteuTeSQoU3ilb7PBV4B2IAg7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=o1ubgOCq; arc=fail smtp.client-ip=40.107.255.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVjJFcGUnexDr0+Aa3kirGNRr8hEYdtoUNUFf7dTzjigkcHu1xOvN9Tp2d/dGTnrWU9wSh6PmIW8P2L++sawsrhZxdSEzme3f/PgF3BckGaJGKYjJkrvwTzt8VbSg6vupAy5zClOPfW02C7DMsTm3aYuxhTRZjWmATrnt2REwb6q40ZQPWYWdavfMz8fELvQOCFfy96zpboJcSDJAXXUX2lH+RiWRMvS+r8BkvYxhzzPnHKM3hGxdxhBxZTTxAzKbt0mM2U9yvUxZjEfdCJVNHsY55YE5fSP05eBWfoEGyAkWU00l2C26bQ/mFcXABR8flvptwUPMNHhnuoln1JPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg6iUVjodazZEcQrKfRTkEdCCKTJIo4Nnjyns6vLBNk=;
 b=nsXV++kuI5+zHbVvZ6KNGMuDaJpes0VVxplC8c7kLpu/BH83KouUWhglpOjKRmOEbmkXbyXWWZ/zfhIQNwt/aSWCaaDU2QVT43xOhQJK1QeRdB9cJC/ITkEbb50GqLT/Dtj3ID/AoefCj1mwR8Z0d86Fyi1+Nu9phAnzn+eo2zTESwtX75YtB97/QE4EetFGmZqGJ9H+/WM2nbiWTXjjtKiX+sERAg/RwPNt3lNFbQjTi+0DWXdXuo4V+pd7bF6N2fiDeoyaleRKT7PAyqlzfSdKjumhR1b5Dr6efSEoUcpQg8cdbuw6GTRwtPeFjNa/14vVtNo1y+7c+b/h8SNkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg6iUVjodazZEcQrKfRTkEdCCKTJIo4Nnjyns6vLBNk=;
 b=o1ubgOCqa6JNI3R67a9pGgtn4Kiud2vv4oqCFTN2GSFD35f+1Jpmv9AIi1IlyNPBM1Bac0J8dxjffbbaQmMIdCAXqLAISc0+YCp1AvyQ0juXlgVjCKSiIo8gZuVioSC/dZO6a6O8KJd1bjPLDJXtFXEM/8kSNHZU2wyM1lKe3k07Q/GB7GvQnjEeQ9vSUqM3FRbn8an7TkQ4bzQqB4IeDDJJRKoggUKadrv9fu7SEBZcX2wL0agkOdig6ge4CvtPMUvjyMPog2qi5q3Dldwtj5ePA0zc7QQgSo7RTRtr2Qn6AgRW/f3Nyz0hriUPOu9rDWMSTXx2DqhdG3Q7/NkPfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by TYZPR06MB6659.apcprd06.prod.outlook.com (2603:1096:400:45b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 03:37:51 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:37:50 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: liaoyuanhong@vivo.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:37:39 +0800
Message-Id: <20240822033739.18898-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821092846.20138-2-liaoyuanhong@vivo.com>
References: <20240821092846.20138-2-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|TYZPR06MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af32f3c-3c47-4537-f921-08dcc25bcc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BlUR/vDqk6X3HkGB3sUkKIuUdIdUUzgeIq94tCmpPkI+4cbdwdGqpXWJgbHD?=
 =?us-ascii?Q?6erap4AgFH3I907XY0kOhHdqYTpJRYyi6Jm1DX41vnJvmaucjpZaE+TPd9nn?=
 =?us-ascii?Q?xo6nirrBR6PQjpGm/6zYjcPeAslVxF4ifz+W1j9xcXyvzuXxRjL2jvoz/Phq?=
 =?us-ascii?Q?xvPEGKrV0D5QFjlSUanX1AslaLT+6AKnAGXO5Hm6RnaYNbtWSubh64EwrP/m?=
 =?us-ascii?Q?mphTNcakAIlOvJB2BRru7qduj7EwhdjBg4vjPv1TwT8n4CkDZhHmyL55YnWT?=
 =?us-ascii?Q?UbgHYXiPIeyIx+JlZK+usaomNr37dGkJM7JDRJaxS8g5BSm1XBmAm3k3+DjT?=
 =?us-ascii?Q?9fjgDfE82/N5TxVUgjBu1B8BtftJjrzM51+tVdZbCi9ZTAa07UZ+tXCTSHvR?=
 =?us-ascii?Q?D9L0zr+31ZFP7Ku5OdIPvPFiCbI6BEmfzomh8pcYIfkF3hX6VFc2ggcx3QUs?=
 =?us-ascii?Q?e+8o12RxUfjBjwtQ01aww5SJPlsc3BQGzPZ/BCTwbnyHVq1ZZJgE7xNSkBFj?=
 =?us-ascii?Q?zBkmFBTBsgQ6/OxqdTrKNXhWKU3nMoYfCOn6wZnlcsc/tugIwcg6275o9rSR?=
 =?us-ascii?Q?1huw05l7u0rBhuAl0sXYQTqV4/PdKR6HR/AElUQGXcmFQlXK2ZVkCRZjoe5C?=
 =?us-ascii?Q?8nXf/KRlwt8Ve3LNz+AF8FQr4d/bqD4AWMYPXutMSYj1eWW0te0Yyyf+am6g?=
 =?us-ascii?Q?nvHOTuXXOKRW0yg1Ac2oXqWmLHFA1Gx7uNA3spNeWh9kgJTaRktL0L5/1p5W?=
 =?us-ascii?Q?wobLsfqOiE8l+lEaP4HQ3mC8GuKXL32A3z2WoJOjkmjHYWEJ+QoAdEtN/hjz?=
 =?us-ascii?Q?6ECA/eu0FFCk12ZDxC40D9MyDbu+0u/gZfV7FbaR+BpA8TgMj6VpDpEucpuU?=
 =?us-ascii?Q?gU2kxvb/1OZ7IFm2CBd0xFcdbkNuBxp56IMlhbpnH1Ou/HmY4rKCshd074kZ?=
 =?us-ascii?Q?B/2gnBfThgo0xtPgfFhg0Gcc9wfK+rU/vtpmip6Fqawcc1dk+K8jhjH/qwLS?=
 =?us-ascii?Q?Un6qbVaTd2ZgpTDjyIqB/KGOMDilsyjqSrrbadmeILVPiXeHYMD6l5N2gs0h?=
 =?us-ascii?Q?+k17ruyl65+k+UHIOydvO4iNIZKzHCu9epkcwmYi4ImBpg8T43FtLQTX8G6Q?=
 =?us-ascii?Q?dRzZl9SbmY2pqAhrsOBLBkUjD8OAWz/+ai/TOYl4+mLOV63q7jRY1pghKvy7?=
 =?us-ascii?Q?Pw9Go0PaZgLWrNs/hhxMJ+woLLqpCaMO2JO5aLPeYz1rc8V17MIv3DpKvTZN?=
 =?us-ascii?Q?zsPgGl0xsZq5MJMoetWJT9xAM7kChrWkwtsh/ED3JUH/DLlofL/1JcjcV5RE?=
 =?us-ascii?Q?8ZcsheVbQXE5p46U7udwol43Z/0EpxLoVseIPu+CETsDFNxyCqa7LnZSLkH2?=
 =?us-ascii?Q?4mHjznXZJ1z9gG/MjtlMfgClXBncYdHWjwW1GzLGp1LoYJkcsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5579.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4VUB711p63TaEPZw66iw2/X2JoOTPED9BNeGqNg1bF4Q7TwLn8oLkY2CwqfE?=
 =?us-ascii?Q?msVCKtrOmjp/CoB4BIHJSef+ScOSgu3Bin4yX8AwetfgPtZ1FKcl1INBuIdX?=
 =?us-ascii?Q?sHLQwaDXVd5ZF17x5PWro+DUSM8LtmKYxaJRUaPVrdzGr3TS4no3YczAT8FN?=
 =?us-ascii?Q?Xsg/nqPB2L46ZNtLGHU5hEpFfHh1iyhgT49uMOh4mAVjI5RbY4FLkvkAr2Ji?=
 =?us-ascii?Q?fhEu9TM9WXe4mV+aku47hcsVVb2TRXnKTufzCfz9/1xE7Rq4pQlYgSh4wwtg?=
 =?us-ascii?Q?1eXJzoZWkbr/wHAXGz0SVpNsbpgN8gOBNfQkdGbD9SvXcaIipjSrrtUzN6BT?=
 =?us-ascii?Q?ks6hDxqlyDB67zIgp6kwIlIyWVRSCq9SWdYIjhe9raIcu3OAuGgyBr+WGrSK?=
 =?us-ascii?Q?m4+YnoL8Etx1YEpllOl9wr9AK07/BAi1xRYOAWVMmYvmYzpdP19d4Lpwfdir?=
 =?us-ascii?Q?18noE/YAjwkx1VpiIHB7vwRHXiERJMLGZxZcCQXsJFzagfkLmw5KIP2ZJ0ra?=
 =?us-ascii?Q?/QLpooLY5+/9XK2A1Brn8I3x+GFH3J4s6i/O/fNQBlJJMMp3Ysu66cYCHptY?=
 =?us-ascii?Q?swzJ8Aa2yqazVTxuW5wHwAlo5ceh7zmjfncH4bFNbt7wtwLT0TKyhOBPsHpN?=
 =?us-ascii?Q?FikZww/FQ5vC1n/vZDh8zuw0Fue6vJu9lTPiY6afxcQcI40z9daxmrNe9FET?=
 =?us-ascii?Q?H5LZqS408AKfiU8deJlacrRm9mObXngLQhwiJdqPc98EyzhK7UkArIUnAQjB?=
 =?us-ascii?Q?iwx/+8iS2AofzBO0kWHcC0OPJ1Vyw9Kt43X2DVQEe9bbtimGFoKpc3wevyIA?=
 =?us-ascii?Q?H5rhs2NZ5fTdzL3IFdEXJePeO0aeAcI9SJRlNuy7av3UCK6U9qqCfs6Ngj6T?=
 =?us-ascii?Q?XwCwU58OK5+lJceiSFEyyxW4iZvdvCmyYgsoYSGZI8sKUMI4ThKlI1WH1mIU?=
 =?us-ascii?Q?cU6lKK71lxQ5o1qLAsRk/bqCk0rKC8mZ5o7FPGiaT5lNcncy1Re5qERmrLDD?=
 =?us-ascii?Q?ak8AVvRY6Kl2aIqXCAVYyhSjm1PLY52WLuvDbeKCRMpF1CalU/xMGZJDSxww?=
 =?us-ascii?Q?t5XLc/u9PwV4MB1QZUPAs6bTVOsbI2mSchh0PUav+2fbNGHwlFsrjDfkZz3S?=
 =?us-ascii?Q?l7+SPtOxgbGSm8bIEWGPKK0xa90gcWlNgbp3+lMs8+V5aaBdkDD0NBiYQmjJ?=
 =?us-ascii?Q?1W17lTsRVGQTj9nTHKW0ydX0PuJkrysVs4395sdVr8mRdtNdHvEE77LYPQvM?=
 =?us-ascii?Q?iJJXjf6DZ77x7OW8LLhPrk2v6PP/6FWk9juT7NAuHny9RMTzjSYP1/sb8lmE?=
 =?us-ascii?Q?4yM/kmVrXDgs9sNwmmjXzR0V3hzEpfcvwOowY4U44FGEnjHxpchCDRauHX/c?=
 =?us-ascii?Q?QMHzqlt/YSHcxB78PAWHyWu3Tiq624+54CUcBTETiPAX5Iol7G/pFNMjyGnM?=
 =?us-ascii?Q?OOMIwX9SF3Jsaml9LgwoBeWoulHKTZln/ExS4RU2UjmCdV4FFec76M2L4dJA?=
 =?us-ascii?Q?P54jLmMN5N0yOPvOTdTzPdag7IFRgc3Rdqcfd490Q2KAEgE3kj/DIsta3/dE?=
 =?us-ascii?Q?+QslrVSgGFxGf9kq0ahbrU/9+yreR5ReOiFI4MKm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af32f3c-3c47-4537-f921-08dcc25bcc62
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:37:50.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KdvkJ4BB8LtGXM98tmyWKaXvTds/4DoHxa6FeCqJ81Pza2kKI8O1rRXnZJ8D0LMVRTldOiBfs6lsaF5kXTRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6659

Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v3:fix the missing bracket.
v2:remove the global sclk variable.
---
 drivers/rtc/rtc-at91rm9200.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..4d909b840515 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -104,7 +104,6 @@ static bool suspended;
 static DEFINE_SPINLOCK(suspended_lock);
 static unsigned long cached_events;
 static u32 at91_rtc_imr;
-static struct clk *sclk;
 
 static void at91_rtc_write_ier(u32 mask)
 {
@@ -471,6 +470,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	struct rtc_device *rtc;
 	struct resource *regs;
 	int ret = 0;
+	struct clk *sclk;
 
 	at91_rtc_config = of_device_get_match_data(&pdev->dev);
 	if (!at91_rtc_config)
@@ -498,16 +498,10 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 	platform_set_drvdata(pdev, rtc);
 
-	sclk = devm_clk_get(&pdev->dev, NULL);
+	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(sclk))
 		return PTR_ERR(sclk);
 
-	ret = clk_prepare_enable(sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
-	}
-
 	at91_rtc_write(AT91_RTC_CR, 0);
 	at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
 
@@ -521,7 +515,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 			       "at91_rtc", pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* cpu init code should really have flagged this device as
@@ -539,7 +533,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = devm_rtc_register_device(rtc);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
 	 * completion.
@@ -548,11 +542,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(sclk);
-
-	return ret;
 }
 
 /*
@@ -564,8 +553,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
 					AT91_RTC_SECEV | AT91_RTC_TIMEV |
 					AT91_RTC_CALEV);
-
-	clk_disable_unprepare(sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


