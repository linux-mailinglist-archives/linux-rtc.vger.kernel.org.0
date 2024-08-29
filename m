Return-Path: <linux-rtc+bounces-1772-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF196441E
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2FC128197B
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD0198A07;
	Thu, 29 Aug 2024 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Bk5enVp2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5D197556;
	Thu, 29 Aug 2024 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933724; cv=fail; b=J+t26CawvCQqlIEAl/ESvJWIxjWFt2JG9151Symn1sWY6Zk6K2Dvkv03Z91vbeSRn1/4HYO4t8BmW4EpSArjiKjHkJDPkl2ISO8DIUtbN8iR+WvH78byGCWG1a+Gi1LYzPgRsc4S3+GI68b0lb/oP7rGsRZWJqu6g6N76aZ4VGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933724; c=relaxed/simple;
	bh=IbNEFCZxiqwZqn/qeK5t2lXr5khkPyJ7Ke6mq16MIx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FHeB44zKBb32irLOEycq/ppX9A6Qx5NKJMh+wtDvh5qxQKopI968LSiJF9Tq6UfrfSS+0vYa6wWUb79dETxWK8XPtg13HkH0OlgIZOesIXLoayxgHZHHYwBb5Es6sUxh+/w1XavWp684IKcHbPGv8aSZ+0oIi7lLEvzsCIKKPTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Bk5enVp2; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRejuEpsE1meYXlIFzJ1/Xbb23SBKZwbWi5ahIW1oYyUTI2huPSVON2c6WcQPoSQkZN12RI5N62Orw6m4+8FwG/DVZOfzqYThkd6i7E2QxqSSd9dC5IxuX/BPtxBjfNwYX8ELjXn8/n0Qw9mkm4AjOtZcnSoPi7vplXRmWHt9I1HKvpDxqG1V6Ps9RCdQRTxZE20loN8o81eQfCPlE6KvztrL0BQHyJJy3pdvG+2CeF9JhnPpSOQogXyhoBNHPPUq1X2lEZOFcOfVSXG9c5hR3Z/EMrQKC6TuOqzjxlOH5ZWgM/YlxcUR9uobYQoo2BTuCftvVZWdjKRJTvUzlOavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=e3rhTwKsgPs2LiOrPoW2Plvv3eWySai4ovHvNIw37GoqDCjC6bD5+0JpjhPkLDP1hr9nF/Ae5dV8p4OlImiX5G7HXT3bHm5PcQfO5Y3KOSxISRMSG2B5ES4pCcJtVghQfDIAXtYwSt9iSxkZtQM0Z+KAPGipLaYdcEBSKlE5Q5uLqF3F2RxkPmOxgjlcenB5J0H6QpKeGxW92gXGJNApllvwCWBsYBLy2dL2kxQoVhvrYAYsSAuUMCtWdTcafn9Y01NBOH+9QLv9rkXWPYbBUm4jt/oc3E+mjOFmUdLmGUAIfRqnia33PLv+YL6AK/beQ9YsTbD/tVgKEFm8MBCt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=Bk5enVp20Fe4CSsnNMnqlE7v5b8PTBgbgTNcXE79j/WoywKISj6URwAFzXari0d+bXbPmOFodqqmDrdmP4p7Zr9ifwn0edNw8RfLdk9ePPf6LyRqGuK0wvuTqnYgqXJF331TL0Rz5Rm7ufysH6SzW1ALShwV7geSILgaQUr85SLGyR7cfb7vcQdtk7FCW/c8853ysY/oJu8ulzByVUHlQX3me3BDcXQp2fMXy4EdjJxlDZP2t5TWk0TYycsgAQKYdZ2BbvxY1X37FsZj0/hz+P1u293IHDLAyEQj/JSAvd9mxwO9fWiCVj9H4t+7ESBhPcCpReM00VMRTHmWxscoIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:17 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:16 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 2/7] rtc:rtc-imxdi:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:50 +0800
Message-Id: <20240829121455.16854-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 431dbb0d-b94c-44fc-d70a-08dcc8243e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zM3sSSSgsSmCLbl1Dav23irMYY+uRYZt5etQZDN0g3WO1qOiwG7fXSAvO0Uo?=
 =?us-ascii?Q?NxFfpFJ+LwTuthRReX89du/dFeC1pAdb0jAcdQxEqSpNbyT9fRYaOGG/4Ysi?=
 =?us-ascii?Q?ox66ruARng838teNjyFY4eKrzAx+lX0fl+3iApMRxiTuIO4w+khd4A0grOTM?=
 =?us-ascii?Q?USpx+DOoWuzelyanz57wx7hXmedx/uZp2elDRtfoGyMtJXBq6WthA/E4W6Cd?=
 =?us-ascii?Q?C5RATYa9ECqw/NFtU6o31Prj0Fo+pEt+B1ndNRCAwU8bewl9BW5vjDqVDUNc?=
 =?us-ascii?Q?GuUw0Awp/FvPiU61/yCwVA6nBAiyi+zi2eAvjWqAe/FnJU7Jte6Skn8mtjpR?=
 =?us-ascii?Q?xmnByMPEjjl4ToaA4Nu6dWIrUKN0UMsRJYv4sRNMhtpDmmdFTl7Lp5LgvoYS?=
 =?us-ascii?Q?tWcLc6+O/1uGfXXJXoFG2vVFdWrcSiIUkyRDbI12m32m8cYjB7Spule9vnW8?=
 =?us-ascii?Q?h8XvbmtLy7B6VG9ldaNExSTNueGiHdBSGEVNDJE4+JXBj6w896KT6kVOxid7?=
 =?us-ascii?Q?u5+uY2c/ED8ZWU8oTIL+TlP26Y2gV8P/eAr+kfpOkND28axHYNKJNUpYBNi2?=
 =?us-ascii?Q?PUv3553F1icXk//iHXW8I6cloETnq9TqnaAGNjBwvwuGhDdKMcRMTwKziPIl?=
 =?us-ascii?Q?BPcV6r6APdPNkQSPe/T5iqnLW7VvygbNQRBku7rb8i/Ti4rqcNu4uCp7LDtC?=
 =?us-ascii?Q?9raC78VZboS/K++BxjkGA6vMVQfDpoRNFAZq+BbMqe57W+5le5W2iGa8apIS?=
 =?us-ascii?Q?052lkp9ZFeSNaU9csSLTLVTsQmUdCQCWNsfa2PqCX7WF9Mqq5oAb+JFFEYay?=
 =?us-ascii?Q?IIa/pTunDmSmoSjiCIBlGCn94zMZoVGV7Wq5owtgdrRaQFw1MUCLX7hO7+XW?=
 =?us-ascii?Q?UK7dKtecDMRfBKCqAYYO6Uyyu3zECM2NS3B4v8cop+UjT3EkRD5sEeuJjUo6?=
 =?us-ascii?Q?6WeQdO6HU3JQVktioMfkcp5U8jZ2NaEMea8dpkvTPI/XBp8wxzu82DwKtMtD?=
 =?us-ascii?Q?eKCoSJ2AvcSzHO3u1TTMZtDpe8GYqLD7lQWOSIubP/ngmMXUOp547v+f0Q8R?=
 =?us-ascii?Q?lxuNzPMsHl7q2iLmPri1FfS2vPHQxpSijFlSgRSS7vO27ucKlhThMglxSUUc?=
 =?us-ascii?Q?rPiOqItiaaz0MS6WpL4pR1vAI++H+3ebLiEJOlxcsUQT0sRoO1CvrPs9jemm?=
 =?us-ascii?Q?MTw1ZbwnD453ro/dXbOmn/zBy5G69P49S94LWlU/PVEMuaJUGPsfRGMA1LU7?=
 =?us-ascii?Q?8s4vwWTJ1xWvVG9vrOdqlcmdu6FXnJYhQmkdUBJN3qrb2EBrEAWe/SDr75FY?=
 =?us-ascii?Q?Zmq5j9kPwfF3Bzo/kMiZxG+j3jaFUXHlvTLiGwNNQ9JwQ9+269nZ0iZI667I?=
 =?us-ascii?Q?WlbEuL7XlqqVUpBrVJfHJKcNkKKEVNFFPNOxuZNRf+Yh3zf5Pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hsl0P2V5TiMu3ZOK67wJqMggnGVh14BN5eWv8n3OezqgQYz6IVRoP5jsRhJP?=
 =?us-ascii?Q?D/ljzWxLZZzIZN8/uN767cGZXiO0g7rPpM56JgYvPlmVbLcdln4C2EkHY/KS?=
 =?us-ascii?Q?Hvj9Zhg6MNCbZUdlom/2h9knc4UrJPfV4ThpxeiWZj95fO9tFsDURlt5Y/bJ?=
 =?us-ascii?Q?M4mDsiBhaVQBL0jEJdLHzh/+evw/DtXJe2aHqIsHZFxWrAkmZ+Cj1Oe47R7i?=
 =?us-ascii?Q?S4w3yf+UAcXKWhKNstROwYSlIvzhNfW1v79t+oilRz0TfxjIk26BvB5Lw6EX?=
 =?us-ascii?Q?waQKJp8xUq7xp2UaTjHeQ190OssSk+Ki22SWLP2mAVL7GZ9rHgGXQHb4ziBu?=
 =?us-ascii?Q?wI8hGUq3WTJSiZUPZRUA4JokBim5lUQR4TVVS68zEHOLGOwW92IGhWroR5UI?=
 =?us-ascii?Q?UOMiqY3tiWrhGmxOSRShuLPMkGz64S6VMYhZBmqewoGy3+rrAwI70GuDr3kM?=
 =?us-ascii?Q?mzqKoItlOPPHXQl/xNY02p2uOWC10HB+BEnOeIg3c7Fy68TI6ZM98rQOS1IX?=
 =?us-ascii?Q?ci8ogBY8rErSBeUGND8KW66A8qMxKGYGNF5ZUcCyxD9RhsXO1wkW3dKfHL2H?=
 =?us-ascii?Q?eyxA0W8JJVvvZ8nffm6zNSKucvdbzp0LW3l/VBTU+KmvEDi1yshIdI3Q6+8a?=
 =?us-ascii?Q?/Oq3mozlNve3RD79DnsorbVHCSzTw5LQ2OwDDh96rRmUHiDbPkFeB2f9Y2Jk?=
 =?us-ascii?Q?h/tNT/C8CsurLG8zmDxy+WsshVKidkzJavVg9LY7htDx1HUdTkBci5H0x3OE?=
 =?us-ascii?Q?1IxxGGaWEYdvT/mL107rnYDehTpolGpfq6x2iOJpZWwPw0I1ZpK09iYrvqvT?=
 =?us-ascii?Q?TnNQzZr5OEPflGU8p3OeNlUt3nU3vJeKD6z46mHdxE+6GoXcfIKPcfLmBt75?=
 =?us-ascii?Q?pUp8njYIIGzd4AzqfHgityrNTPQ16xGMxTn+BC/vC+2XNBxbplN00yGMoU0b?=
 =?us-ascii?Q?dmZt5TWwwfPM4aD2b18vZJxcBepQeIB398EeQv7/r1tS5ziCzA2psyO6a8XO?=
 =?us-ascii?Q?DgUOwRg4zX5FeBjMqXvboBK6jI0eWgQOGSokoTsB3ZPxq6eeTVTutueBghPb?=
 =?us-ascii?Q?g84ZdJ1lp1Zn5h4l3XMKtphAwpdZ16J8IhDLZHC0C2E2Bd6GcpurZ5JzKTqT?=
 =?us-ascii?Q?NbUhBJy9kLsyjpaucdqUfBIHPZtGFEmPeGCPvcA1l5+kMvhMT47PE2VabCNX?=
 =?us-ascii?Q?3AF/pwL3hYulon+mr8wojaqW/Dc/2fJoNz9b2ejMduC7lrVsDjzmir7Ilbcv?=
 =?us-ascii?Q?+Ynvhb8sUKDkrdiU4+f1rd+Kil7PzYjG29GL8MHGOECWLPQaAjUMgsouW2PF?=
 =?us-ascii?Q?xyIAdzP70JUvMvaiHK+WNlD64DyCkNq+Cjm6S7mMCzvGsfhjKGuc5Ao/UNkg?=
 =?us-ascii?Q?GYopxUrmydvIcvV+dQFcGSCPHlcQW3PKizM95ofYlotDy/Swyau1aZ+BCg4x?=
 =?us-ascii?Q?g+F8T3OB21iaR7sSpgmkxMlYwjzauz2M7lmSEmfB+6c4OuEIo/je7LdK4Lnp?=
 =?us-ascii?Q?BtE6R8/5szMwzefLAdRkDyf1m5X0mu+YQe24H1Sd6DnEV8lqYy+LyyoWmxli?=
 =?us-ascii?Q?+kNR94Q22UR2Kb8cVaf1Onr4aWi1UwfdO5VfJ8hB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431dbb0d-b94c-44fc-d70a-08dcc8243e28
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:16.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPf5rYyzrYOeQYYmNa5zVyUKX9QXXjF/S1J/9rvF6lDg2MdTaZYnoISSoqKeaWqj/rtxB44MHHPuihRb8fw1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

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


