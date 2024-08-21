Return-Path: <linux-rtc+bounces-1676-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D444E9598CA
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E131C2179C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329091ECB2D;
	Wed, 21 Aug 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TwTs6/Ty"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECF1EB123;
	Wed, 21 Aug 2024 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232549; cv=fail; b=aGFhUm3ixIpQ1Fn3uyk4eADa0PKlstlA0GAKBfmDE54ApLDb5rRHH1r5tjGEE82+/uhqfi7wxnBw0GHcvN5cZNUkZxRQ/IGHlri0l/AuXyFTaIXlJWAJ88vjilm2/xalJiF6V1Ex/P7LjRVdhDKHes05+m/YzH4t41hxEvN0Ajo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232549; c=relaxed/simple;
	bh=IbNEFCZxiqwZqn/qeK5t2lXr5khkPyJ7Ke6mq16MIx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ka9Rbq5tpzkEyOvEbvKSHgnI/8F93laF5/uCxbCcFlQG5AlRr4R+EvhoM6WKN63dTEyqfeN4H13b7TAqPXKWJpeknZGFBouVXff1soaYc0NcfL+1ZxgCRcwuo2bwxugUzGwwNSbegBfSq7ptY6Hdtx2utrb8f7+QsBZZ60C2nQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TwTs6/Ty; arc=fail smtp.client-ip=40.107.255.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEAG6wrt+c3x5/mRlmiCDir7VaP2O1p5yrp1VfsgKSy2AqbvT1qEKZQcfUwTVOpgx9DxFBQLzTTnWCCMhc+R7IZx1lmK6E29uAPxXKCwB/7ek99Lsly8lKK4CTcH7CFIkXTNFAhBJXw/8FH/VxzJMupfFSOQHAPXBaVS8JePZODTAqvkby2KkbuFAhDeZB9sI4EU7lLz+wIdCYYmlZg0AGSWIivDYEegAyuBd/s0pJMCajDuFhXCBMClbaZqgLI3rkNT/cTTGpJmIcEHdOJYLbkU1MiSsAr9+Zw/Co3gjm6Xx6KTXNvHCTFGq6vFIwAubodi5XdJaOjDpT3lomP7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=j6W5xJi2p0otXpKM7myyqPhI1spWti43JN5uYy1zdIl5/KDcCZfOibObnc//f5gXmnGu8fqzhyGF7A8Xwb1wSVDzNc7rsGzPfPkDsQNKlY0QhBOodaiiUQk7KJgclAJ/2jViGKvrqq8SH/nypmuYN3TIZw3Lr7h5cK820E3eGev5ffMuK/9CEbhHaHbS9ELXtYFOgGouVLFm+KhcQuaTtR17M15fwjw1jyJJwR/0xheDASka600dFLmLxCfmy1ysDUi5xt1KBDGW2pELxezcPUsItJ4Bit+HF6478kSscBq+IdFYe+qVveJizZaRJyPUbtZ+5FM7ukKtJn/e3iabeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NADE9bwzc/fkj+YIGmvrP0pY+RyhvL/8hiMsQygvGBs=;
 b=TwTs6/TyJF/+0iUJ7Qoj3zhawHdUo5WQGLh6zktor2KcGJ8o3f9fnmYX6xTMG035/d9VDQOgvcxUqW33MSaKGdhqnjpFU8v6ZrwZDm/yn8w1M7FD+U9BFSS3PaPwq0U4LRjdJ7VmIWxAYaunnUbIfKIHFk/NZ9OIZqmbsm+N5yWQNsSz6Lw3V7lYOzrMasSq8PoopXWKQM/OoBXU4Z0a/uZ9tpBMJhz8JI4laJ+OVQ7d1KeITlXFvr4UtgcFnoPH2nw37aSVq7IKNs52YcfknjNsDYZvvBSLa/FY5DfqrP0EgL3Wf6Mp/Cf2cK41AZF+3lZOQUa9R+kp2NMK2A8/mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:29:04 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:04 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 2/7] rtc:rtc-imxdi:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:41 +0800
Message-Id: <20240821092846.20138-3-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 17fa5e64-7211-4240-c582-08dcc1c3b29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TOIQwYB6BI5GrRhvVx9bbpNQh2c0zWZ2jfTsCc51ReaaVApDDHeSo1SpXteR?=
 =?us-ascii?Q?1ECU/NBeQeXRRa2GhbprMpcLTEZscod0pwm/njgLv44c/m6rioPPe2fejI37?=
 =?us-ascii?Q?qq3+/8uOgYaTr5FwIJ5UVslnlHz+I2v6OJMc5olr64XuqCnpZY/wjNfaSXWb?=
 =?us-ascii?Q?kCaEPCpCsxeo9JQ0luju+MHqxBffINnwPeEjk0dMjM/dozFvUwEUKMt/nqwl?=
 =?us-ascii?Q?5kjQF1kW6rbogFbkM1CrSnoRyNnhSGmt5G1RG6UxQaGOlDihGgw5XfSrwSed?=
 =?us-ascii?Q?AWgn/tmlNM0xdTh41D8nDiuZVikmscPKqUx2KEru0BCQcwZHEMS1daNtL7zI?=
 =?us-ascii?Q?8Kl3Wyra7Cau/finmrF9h2EmuiZ+N8oe3j74oQUB77IvJ5WBYDDtzExC7yyJ?=
 =?us-ascii?Q?pXGZUkTy7A8WcvK0pZfmjxC9sp+IvsKA5SeoULIcayRNxVzNSmh8reNOYCq9?=
 =?us-ascii?Q?O+QfsuMttGI7L+eGKdrSZHwZCddBvZRc9qAuesSePPh9Ck9kqNKUxEx6U9NO?=
 =?us-ascii?Q?7qgMAZb4McCOXp4A1NiT+bdAghFIACKoEyeyrHxuBwQYGPfJLT/UGA6ct+/K?=
 =?us-ascii?Q?xG6x1fVhR2URnokeoKrgD5x0LSSdVVijEwahiV/ONJVEeoPIEAWNd3Z/HVcU?=
 =?us-ascii?Q?Mp/IywQKzGSSwbGN29Vjas06InPV/50JAhkZAxdPis5lDEIx7ov9NlCmKD+C?=
 =?us-ascii?Q?EPdWI54eq+ia+HSeQs/VhWhBewylAW/imirqSe0D00TK/m3DbBaE6XkBF8pI?=
 =?us-ascii?Q?fzcaYplHAkaFJtgSYpPiDY6J7xHLjlh4ZYG35OYaV5+9LO4lgKjpEuK35SOg?=
 =?us-ascii?Q?H49Br6tcLH7gSSHF8XS0AEEf2g69zsq4SYz4biaX8IMNccoTMwftmgEC20nB?=
 =?us-ascii?Q?NDkCaY2Nz1bAxosAsaWQfVH5UfzE9CNfO5vbB86ojFQMtHRlaQamhduIgj53?=
 =?us-ascii?Q?D6vwgAVrUZ8kEGFrK+Ylg8wHCgU4nxLQVht4FtucSlBidLdVtqvdfhJ3F5Jj?=
 =?us-ascii?Q?Zll3+8vCQ2JGRrM2F6q51JfGN5dn/Va54YNgi9G/x67aaLTeQDSpxEXDoN1s?=
 =?us-ascii?Q?ThiozKrGvfO2zqLGsueFvEqw2vhO7bcEbolcYiWnsyqQ+TF5x09Mn+vbRCbb?=
 =?us-ascii?Q?4p3rVBK/xGUSswzIVV2/9oNiotbqx+epkkMkEwX5CAgefGWwRKBnER2//hFx?=
 =?us-ascii?Q?CbwknwhxWvS8Wn6plnNMRx3c9NJpDFTc+2RvG1FhpMzVVrfplBTAExH1/bYi?=
 =?us-ascii?Q?m5EaM72pUCPLlCNqy75AbUGJF2dUiZzw9K0a5GVhNHfoBnw151r7HshmgaYm?=
 =?us-ascii?Q?dkdp1cPJ1J9qITteu9DilJ9imJWXsKFO/xBhBfoxQl4R4698fYN59Sfy6pI9?=
 =?us-ascii?Q?CVd3gelkztOqiKgf/EWiqkCx70xfbkB0VgR1AFiU+qOat7rlzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTkoCBIG56wMaa1+omCTniV/WXMbIg1mAKveRobqssnzXy7cYn//jzjesRYT?=
 =?us-ascii?Q?Myo1DsmsI3xK5Ju4T7lVisZfKVeXo5Pog1lpJfK3qkVy0hh2HLc7/xd8lcOu?=
 =?us-ascii?Q?pPavHmdRaoYzeJbQ0fgXWZx3u3KeCsNSMx2YDSC/5PDJHCthuPRXlS3GInoS?=
 =?us-ascii?Q?B+GsvVDmB/aAtaoKydh2tAuISnEqwgXk+aAeag3KH9xEAaPwTkns9TMlVK95?=
 =?us-ascii?Q?qmravfO62gLI10AJxOsWm43R1OpwPczQOgKv6Bwv1Rr6GleBEl/RXITWIgsH?=
 =?us-ascii?Q?0wJ9lZcPw52lCsixhz1WxaU5BcX7LMMFc1kWk/85ZhTWpiTiqVqLlsUB9gx7?=
 =?us-ascii?Q?NeCidcbP8xssfzuWt1ZrvTATS4eG8aEj91gMf9WWPf8WmoEz/H72WJaK/ryV?=
 =?us-ascii?Q?fnGX/kSbxbFDx38cQt1SGyWgtQNkAECPT/woXf9o2Zjen4BLszIJPLA6ztAv?=
 =?us-ascii?Q?oHyZc0YxNId38EOh0XgEXLHXZW4unwu9uS4vt3Z1Nr2DWoBSyRD1yHM2uT6x?=
 =?us-ascii?Q?zcPECrDoGmBccG3Epv/1LcqYFeMSnks44NwlOYOIVIvLarf19nKE8/mXnW23?=
 =?us-ascii?Q?K9dFhg1Z8CLkNfSnmDiVPPuuk6grczVw1ZbIk+C92IY1sBgd6rO5j/iHdvwo?=
 =?us-ascii?Q?hk9wznXr0LmNN3JIL01y7szF0cccz1pgHT/d553CuVSn49WzEn590a++XW/W?=
 =?us-ascii?Q?2E6LPAKLSG6/HydBbn8MjXxwk0r9pb+KTvjB6FdoeZzwFT0NXOnbH6UMAkJl?=
 =?us-ascii?Q?3gjlCKEx3+i7Xs0pp8otnbOnoagpctlCp5SsFkgQAtNPtLHfcVFzZ3lmA312?=
 =?us-ascii?Q?08yqQYxUjoA6lJlJ6U/xj7+3Guo3hiK9xFrEQnNlWfTgaytxKBNFc1w4fXC5?=
 =?us-ascii?Q?IYUSEDmfYcEbHnJVHx/J+8llRVaBodVDNJnvU6aaMQHIwNR2p1SPRICDuMCr?=
 =?us-ascii?Q?b2lIizoTE+sqs5K8wb7z/tGQYy5z+jVQRxH4zXuoN+rRLwB9JjoUw/pt1NZo?=
 =?us-ascii?Q?U8QcQduG72KZmob0G1/jtIccxHPMJJZHUg1XoBUQRa/0H0OSlyhavZysUcTE?=
 =?us-ascii?Q?izVMznS8ypAIIJ1hId8qfNDm9Vn+D89ZYkmBfpiJBvGnOQFM0GDWf8dhv2Uj?=
 =?us-ascii?Q?OYIFDC5808BBOVyF+Ib1HwG66mt4pCaaj1Q4+Md60d7Hq3OXdt5Q1uF+9ulf?=
 =?us-ascii?Q?e3kFnhybAX87MO4gwo9UR+P9In/P+imo4QflGRR8kk0Lzqr9JuYOf4T4Gh1M?=
 =?us-ascii?Q?kffH1bAP/gqpbYoI58R64Mqk5RMbxzOMsir3VWAm/B6sENTdPhc67mhVZsA2?=
 =?us-ascii?Q?+vq811xPoa+OwxLCm+nY53N20WIpaduG5CrqMP364ucmBRfdPv0NFHEunUrQ?=
 =?us-ascii?Q?DH8WbFXkey5jfWgJCBoMUMuPKeKIlcymfbp5/h7UitpNlsuecC2URTCgu9os?=
 =?us-ascii?Q?m/e2hepl1DITJ+wYZwXK/aOghK3QnrHsH0ZWJrd7+Z+2EF9T6wCZCNRyFLMk?=
 =?us-ascii?Q?p4H1z9bmhNJeuqHSzt/95+NH8Z/08pDAnlJiBRJJZ4mNdwsilw7Nww3dtTmy?=
 =?us-ascii?Q?B3lzClpwcjDYdLWL7C0n0byIwXs1k/lMZ1hk1rRb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fa5e64-7211-4240-c582-08dcc1c3b29e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:04.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjTwIcu9bxow6Q/N1A5r7KDUKtzkkD0xAZB2Mr+rwhTG5CumWlLgCM+rg6lwnPYQDmV+UT1FpeHQOtgTWvJmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

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


