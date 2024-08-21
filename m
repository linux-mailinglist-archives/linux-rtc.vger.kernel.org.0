Return-Path: <linux-rtc+bounces-1675-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E99598C8
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CDBE1F22883
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3748B1EB113;
	Wed, 21 Aug 2024 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="iJ43O2w2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDE1EC0DE;
	Wed, 21 Aug 2024 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232547; cv=fail; b=Bex/5pzPsExkEwUJf9RwZXd2iAEnFoj/S9V4XERnKDrfEdflaFtZzkI+6/CavZqnEM2lIV4xoZ6xkszvWM7s1rzV8LzSB6DXjMUWS5U/uyhfqRhZ+24DSJcyNRu4dpI6j4OWcwGB8QQLXX4OECRx1SvaLSbUpNwsvbgPbBteBVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232547; c=relaxed/simple;
	bh=80wW6waMnLvB8XUFokLObOKYKZYA3XlQYx+RC0BRh9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Te83rG0aFTm4MGG5s+QuBgt2qAspwpCPn3EvskSs7h4HIcIEQWq6YTqTjq0fNsyVbzC0u2uA12XZS/KGQlxm9dyKVu1o3NngFvDSz9f8wLoqTCoSUaYfYm9BCW0Kem/QCW+fuV0fOHzsk9LDnwMZPxEwHLunu3jyF/8pztu8U+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=iJ43O2w2; arc=fail smtp.client-ip=40.107.255.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1jzWcr4BOcTcp58YvgyUdN+tDDk0zEUuhuCacwDdRWsUIPyEa6bSv0Q33z8JILk+ATYEpAV7FpIbuuu+fdEM4+cSGsThnmwhA/YXkEH9RRUl6CJEJhLzki+iXosyA/MVIYnT/6nrVEIRfP3Kb8FAr9/tgL1myTGOHtxfeJtySoDbrDOtWCM7cSdkYxYDei8+dgDHsB943oDi0mopM72ZrxVyQDLFFS7/9kdeGkHWZ4doP6TRNp2OAtmBxw2md43CEerF2r9eo4ovebWdA9C5acyrz5QEu/hVcybPXC4b25EEIu8W1LotghtBFfo/AFDxDTuncgXpjc7kXNqpoESgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUjfxrEHEzvDkyc8U9vvSb3GanL/n92ZDLkSD8AIFWo=;
 b=kOs0XrYKMDB5X/3eiH4XXu6lSO2OvxvtxXm31nRmV1OQuSa1J8y77UdT4JknHmBkW5ANbZvs/sLzsVgXri522jsZLpEp5zPxiADo1t0ZwVdPdHK8HC4t2LHubClL6KMVPd8SgufZHmFpjMsgN36PyHz3CQw8ZcycpMPfAYDeNrli/0XaS1T1bcUu0PXMtz9eCn0UfVEAGJr2tH9w1ClRMonla5jfVaXQhCQVRK0cG/ZPSJLHpRdVTUCqpzwK8952WyVp97i7bnoOEVT9jFP9Sy20Fu+w72ERFNsSphZ5/MIz1BBH5guHkWPECF7TgOHQFXy586q8gUjrHEjknxYkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUjfxrEHEzvDkyc8U9vvSb3GanL/n92ZDLkSD8AIFWo=;
 b=iJ43O2w2oDwzczUYVtzRMntjT8u9d4Vx6DVhItX/d0dO9SKV+FPYGsFOpnS+H3yy/aArv2aNDfzMHkv3oI5VuXsUMA2C+HsDPrFpHJmO5FQRmHQeLKucJJc2wEINzVOD+FH0+opdGXANSkw0Xq8f/OAsW7I/3R9L2nyUqoYQjPZniOkYCFqhD6QOKdIYjBDxalIbQWzQoKAEP+SSulM/2buRoaIoaw+j0pmb3Flv9eV7cb+aGZrYkTAJptN/x03h9KuMrurBErFmrJNpVE/Mc3cYizTULkFzfsxwAfS8VKJd0q9a6+LsvhZ2PNXmUC6Euin+3aSv/NoKWiI83HKnmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:29:02 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:02 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:40 +0800
Message-Id: <20240821092846.20138-2-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9eea1b28-84cb-464c-b2f0-08dcc1c3b17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Rgddbk8gGuJzl15sneMdakKwHNiNZH+rcwYBW83VObSIoN8crTXiJvS+FTW?=
 =?us-ascii?Q?ISk5kYtgzN8kFtDhjqz7TvLou5iUJStpGYTvA8We2yXtud6H7gC+adpV/uIF?=
 =?us-ascii?Q?jfmG3v1jlGnziPRLM1/f0FyhYCNuzE6ysv/AfeQTm+91e2MzXa0feIHmKGyC?=
 =?us-ascii?Q?9GxagHPyMIyJmjUPiCtD4iOVpy4ZwHFDoIi+RjfGGqXN3AYob4ub88hVwVYz?=
 =?us-ascii?Q?rkbVZej1vpwYg6dhWr/6tc5OblTi5yDjJpI51SVZby/DryyI7yNrz6HxK3E+?=
 =?us-ascii?Q?nTvQ20fHXQmVl5T2iMkYSWpuzAkuacj8otK+6acL9gmMU/5U1KKnZeNCXiIu?=
 =?us-ascii?Q?mNnBHI1aLAbssYWBZ5jTNGYmusVMBVh7qnTJceqNuBZ+XsqUlh3muxWG3Xiq?=
 =?us-ascii?Q?nEskfbWuVHo5TIIUvf/0QSBR2MzVtAfwDpIrT+PnDuaoBu9QoHWtds43J7gI?=
 =?us-ascii?Q?bZbYAB5Ym818bOEFN6kcpfgUoRy/Xr7xpscGBU2XvuJtlIFZllkDbqeahIlF?=
 =?us-ascii?Q?d/bSutL9VDopo3u/OGt+4ihaxMlAWTWXOJV8zplQtxyi44spTbf+2sWm6yLo?=
 =?us-ascii?Q?+Zi/OU6QmPKc6mQEGIeZS4qczdltu2uDEIlBiPcO1qRgUuq+nem/Jmcxn3CQ?=
 =?us-ascii?Q?CCbPfTNL8Xl2+im/hl6HX/ZNWSk8zJmuU5N816HyqnyHy9/6Agwu0kvKs2Zd?=
 =?us-ascii?Q?fYTNgxGlU/1j2a0ai27GkmrfaFwt1HLQHq8InwBRiQZI3Nj7APCezLFOLmQX?=
 =?us-ascii?Q?F3GKC+D/WnwLnAGHmZt8WV5jKlPIxqmMSOJ6fEVY7HqhsWyiuMuBBxTqUa0T?=
 =?us-ascii?Q?IU/+ZtdIk+2X4hz65Kud16LUvN32cs7vKxetTLlSK+kzhQlhEetcrzUnuZdv?=
 =?us-ascii?Q?w5kkmfQ8FZVg2aMjjaNMNvGtGeDi6s4+D3PixgGibMOOJY4fdNH54BS9FCIy?=
 =?us-ascii?Q?xmHqrMTMPRgv3dnJz19hgQ8EJrawesSPdWDf1BsvV0dC4hR/ybaNCORqtduZ?=
 =?us-ascii?Q?GxB2HEDwKcynCjMbdH54wezNkw/+8pzwXos5xMdVAPFriZdRt7jXmbekl5b0?=
 =?us-ascii?Q?Nom1Svd+It6NpjQJA+40kMhxm6WdSbls67DaXiOZV3bBsA0SlZEsz+NyThNn?=
 =?us-ascii?Q?b9qtzMZLEAZHLH7KOCTcH7RytndmaR3EbxzwxdRA87YFydTb3iBnnY1RC4rA?=
 =?us-ascii?Q?8M0uXbgJQH0r7X277vUMfXwuWYNHwD8fdw55YEzapZLOEtM8VrQQRJEQLQeB?=
 =?us-ascii?Q?ZrVk7rWieUVd6eaNQzQv0dQyVanbHigJUUB0/fddCk4dtg/sGncv6iOhudM7?=
 =?us-ascii?Q?jIwYXrfLqdut7UU5zaejHvle/3vqwpVFC+0Qr6IqRW4q/H4O5Umv0o3ui4RZ?=
 =?us-ascii?Q?oVCI3US9HPImu7xwQr+we0jBirqtdtsaaLESZTP4EQJTWPVkyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aJq5914ugiY1VFgZBiPZ5e5EP/fta9O4VQxt7sLH6XtjJEqLJ4nysvLMJEXD?=
 =?us-ascii?Q?apwfGAdHsCppyuQvBRDMcLHcqM6JBMNLGYmeGJB+CBHl7Ue0v3SwT3i4Tmaj?=
 =?us-ascii?Q?qnrpyJerb/mSF8iWZAjM9BUJCctWlU8zKkKmlC5ZrwlJ6QNWRiKsea0IeBtp?=
 =?us-ascii?Q?wdmPOCTIcB0e/Hs/r7SPEJ43k7zb1PtmlAu9/tpheFxwPKCg67/IldIXFeaW?=
 =?us-ascii?Q?NX6jB/XPcMgCfmKSsGGJjy82hlekgvwcZHItTGpDKzuYW+2jI0Eh2C3fnTTz?=
 =?us-ascii?Q?qsOVfrCmDhgs+N248lx9T8HGtEMEP7UR1HBpaUTnavQEKZJg2iqdHJJCTmpg?=
 =?us-ascii?Q?RscJGfAhKrB3KnnnMX4fu1D4BjGzXf+Zn0zNPkXg/fnSHr2+npi8kIAPSKwH?=
 =?us-ascii?Q?U9YQ/2Hkn8JLaTHmprCY78BB029m69H3V0++8gPa9PBJKQfdX9kJqMrpXs/h?=
 =?us-ascii?Q?4KymfVohIfRQqRrDidwrxKSydGYr+cDr3sa1x77NxWnK1MvYpLXIGFjfOpKZ?=
 =?us-ascii?Q?N0N7f/NoWE98n4FH8Rf5KxWx44UwzCd55CA8ZGogszr7vuUzc/g7uE9cWeeJ?=
 =?us-ascii?Q?lyZSO1lYXMoLs2+hN3LinXnsZdG2OD4ZJDy7hQ3mIYflj1ONabh5KAsYAt6R?=
 =?us-ascii?Q?NQxPgv/2sKrMvyR8yIbrJRKCsJ8UcoP4zdIMH9X1dkOUaB6mBRiic8nf1fiy?=
 =?us-ascii?Q?HZz3hSZqg5edgVmkA20XLPfK7IGbijF5xUbHKVHFpHUGFi0kgLB4vEyQJyXE?=
 =?us-ascii?Q?WA7rn3MeJPStVZQgQX0WXzDuGudrjfsV8yXVNa9TdCxnvYfJGSReJqvn4o+l?=
 =?us-ascii?Q?p486WAXML6rloX6jKXqL86rm2ylM/658xM2hd1rpX0yNxdU94CQcQfY21a/R?=
 =?us-ascii?Q?dTFcmK0/9harK52XyWqDSASS4Hwv8/BJLcejnUgXM+buf+j9FjUXwINVZFVD?=
 =?us-ascii?Q?jBXXA3p50M/hTKT7KBbHl+Vyp0wAIGCXci73ehdatKJQSKsD+lvEyjaXeHAa?=
 =?us-ascii?Q?pTYcmTgatsTusEK4lvOn8UDu+/wo0i680aFqJPIG2l5rrshXrAocuLhrD7xm?=
 =?us-ascii?Q?3HhoLhw5f8wC1Msh5xia8iijv+SEmlwUNnh6fyTNEotjjIC5VNLQYpaCyWOB?=
 =?us-ascii?Q?hUKh2ifgy1drPE6GXCUAfEXyCWomw87wqjY24l5nvZiQhPO1kPx/wIPKIsyC?=
 =?us-ascii?Q?SLBqdTFF15SykSufRnbYQY1kvAsS3b3nWs617w07/ETFLjkjCCEfUkTw6JgC?=
 =?us-ascii?Q?mIxWix0l1ydsWx5DyVk5c2ocZOqVPKLVmqx7pLJLObZM3f5tkr4wwC5CmXtv?=
 =?us-ascii?Q?GkWSe+SdkNqL8q3X23r0Rpa2zv5q4B2VPCETX5GDgs53wQxvblT3rTk2rWPC?=
 =?us-ascii?Q?3XlQbm/Dwi4pd213IruER1ziAn+Urlhrf9tEkzb7SlbV+s4RJc6NiHlt3GDq?=
 =?us-ascii?Q?e8b2muD0y5pwglrP4AM5DbezNn8MFuuC6xYqPjj2NNwuU20UFb4hMDvKHAm2?=
 =?us-ascii?Q?W/2bYOG149bDW5kqY6Psqr5cEWDUlHG5y3jHEmgcJ3/K88FHBk2UNuBpSCoB?=
 =?us-ascii?Q?hoxxZMORbTQKPhEv3E3VCZ/Jse1kfLy+OQ0Gn6y7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eea1b28-84cb-464c-b2f0-08dcc1c3b17b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:02.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bihBVj3GVfr4QWjZ1pD3lcGndvpQubX4WNoFW5j7IVixMaOF/aEL19SEzhhpUls72GcQCohXUgwfwTQbab65Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-at91rm9200.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index c16fe711a0d9..81b2556930bb 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -498,14 +498,9 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc);
 	platform_set_drvdata(pdev, rtc);
 
-	sclk = devm_clk_get(&pdev->dev, NULL);
+	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(sclk))
 		return PTR_ERR(sclk);
-
-	ret = clk_prepare_enable(sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
 	}
 
 	at91_rtc_write(AT91_RTC_CR, 0);
@@ -521,7 +516,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 			       "at91_rtc", pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* cpu init code should really have flagged this device as
@@ -539,7 +534,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	ret = devm_rtc_register_device(rtc);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
 	 * completion.
@@ -548,11 +543,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(sclk);
-
-	return ret;
 }
 
 /*
@@ -564,8 +554,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
 	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
 					AT91_RTC_SECEV | AT91_RTC_TIMEV |
 					AT91_RTC_CALEV);
-
-	clk_disable_unprepare(sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


