Return-Path: <linux-rtc+bounces-1775-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A9964424
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A5462825B2
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAD81A76A4;
	Thu, 29 Aug 2024 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="F5Sje2U+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364A1A4B81;
	Thu, 29 Aug 2024 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933730; cv=fail; b=b1AqBX87c0FNsxy/qa41aWy9SL4RPGrZWLX5l36hR2GDSbqHvBTJXms3YoZr9gxC91ckAhlES3Fjni03Z5olGcg84tHQWfBet0/bCAgozqG35NDWkcSBtBLazEDyaSA8Z4hseYeCeK5PT51H8d1wbxIFBi5Rl3prnlWYZpLvfeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933730; c=relaxed/simple;
	bh=ANEWUoefTVKXXL8n7BXUbO9XU85GgPMIbI4eoiMkzE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KJrMFk68anfLG9tHLCvHMoRtgsOTyoYzE9EOqC1Mpe+VkG9kM8W+va95aeoEmaqWViQU2n8dlAUrRRti9N8yxxpzYD5T/OKmRPH0pDJ4X8bfgRoOSJJJEboK36TstGLBGriVCRD40/EN3GNkJWpixxDo1NVBcltl9GwpquWw9Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=F5Sje2U+; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+EeV3pJ1XVhrkuWrK29lLJBpos/RgT5Y7aism+z2UIJ1k6r9f018J44MfiHrJdndt7i4xh3kVI1UGKUacVL2giN2a0h+cGef/eLBmQhVY63+P7Lm/6v1Hp13dio+66jd4nWhiT7BKWCWmtv0DkJA5COvRkZrp9UNdSqNUGroS6llHkbibmgg9toB4K6TbAiN7M2VBzoFj8N67Xe5tMpvlkKGFqamuUwXQ6ypPHj4IsM0C4BpKtz04H2bkfY7LzwiSv2LG/dkNNSXx8VB4Eq85zCSEdTyAJAMnvZwCDBHXpSgF8daurz/uQbQxrtjq2NGRGFoRVzZGSkZO1QzNWIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=Ik6tn68qxh3OBZBtvhX1+kS1vg6s638TzB3GYMbWavTn39+m5wQWj3ja0Sdn4bjvgsxNrt1SB8BT+ZMgyB084LQw/2UK75c0hpJhcpU5bB585C4uEB5d2xq0YNBTEY9tdl3VlmN63fe4yOv5N/r4rfsowypPQJIWTap+38yTVp9D+VMTcFtN82BJXNaPSl3CB6T570AKkk7zpIrSrv5Uj0YEwYPNvc4rAvBhdies/u++k5yg3lT1zU5KyFGif5JcoQlnSOcEIaBe65cQJp3lpnaxpry9a4W4eTzSZAiz1lEWVVWmIiKeGFwW1ysGsszAF0IEh0Fpsl79VmWziHv0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQFSBWFCx04/Lm5ZIwYCUFvejgRMGjYjikfOi5Et4bk=;
 b=F5Sje2U+1yNPrgOadjrLZtHq1qrMGgUfa3YjJc0gNk3bdMoPARORXWVnH9Lz4nLnIRIGcY7vXngrS3EJYm7UDHQkgW4vLu2QRoggM8ca2gH6CYTpUbxygFOc4JWan2dJ4zvwJvsdSO779aUAX7Cz/cexp2jvz5vNfs5XtLdHe7I/YkS9DvMrTLchrmebD37vxjjBcD/GwHrXC7qxZ+08ePFbFlF9r3zZ2hnroFjxiwWXp7hlAD7RMphtk36pf/U6c7259A6Lf4+HyJr40t0MPZArRflcdFtHYcQtGue+6H8NLWVeB49bvMI0/1jO1CEwS/QtW0KiIImnYAT4wle7rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:21 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:21 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 5/7] rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:53 +0800
Message-Id: <20240829121455.16854-6-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: faddf504-74d2-4682-598b-08dcc82440e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lN4FmRSlIl6O1nCKI9r2gI3+PXlnAffbkvndkGsxiho7DkeIhVYn83ELtewH?=
 =?us-ascii?Q?PRUoMpZHHL5telIL4FsuCJISGEF23+H6ULm/0Bt4CSQCA4X2lue94ARbYtZY?=
 =?us-ascii?Q?wP105rpHdlZoYSzo9F1iyWRhc7EqD+sPJ30N/9gRFJnNgCdtIxYSLFYUr10y?=
 =?us-ascii?Q?+cEt3TXm9pjgppdEWBhPoIx5BwmKkfQKme9dEuIJjOEnVtXysNOM78F0QaTg?=
 =?us-ascii?Q?1rEsQvUsj6anRe9CMZxRrwi0PompYpD6vWDsPnUtuDRZ5n6o9whGEpSITL/E?=
 =?us-ascii?Q?LBNENZ0bsWsgqzCG3TF8NvruqQAGtEmEQmK0djySRaQx5/hgD3mimffpcsH4?=
 =?us-ascii?Q?616Oqmese0eD+IloUbZ+NvXKh8DfgNhvJfZnGZLicl93k0dJ5NItEHRTLHTo?=
 =?us-ascii?Q?3ZoXyCOOiI0xVqBGkEgAaJ8wbSFoYFwQLRpMyOmYCBjxIdNgxxFf+rUoILkN?=
 =?us-ascii?Q?Bw86WdFr++C1TwE1Dx9WhFgfiZoOjgPbiZDfyTwGWrjpxpgFyDnKGXEKQIyE?=
 =?us-ascii?Q?jCcwuft6RxJ2O2Yw22/BEVfOguBEEtSD41+rYNo6XZ4K32u/eOYkAcJKPT2w?=
 =?us-ascii?Q?fGZKiGHi5aXoq2eYADkBVkhE8SeTajGJBSmjzBGw5STIbBdozPV2brz9Rbjq?=
 =?us-ascii?Q?cZ7H/Vnb103wz4PXWaBwESagrAb9c2F0OmTAhHIoSGkXPo/amvBjkpKkBc2E?=
 =?us-ascii?Q?/9DLMO9uhxmuZ3sovrOPvJlb3izS5xpV8VcdWREkpaRlMZtGqhth9F8xuWMf?=
 =?us-ascii?Q?m6rUSHy83eARt90BJMLu9L1wY88EeA90/aFYebBhesZBysvvPnJfS1/Lbx55?=
 =?us-ascii?Q?02rnLwv2QBVUYvGZH9A4v+IMYsFsA/xoDZuSHglJbwWdRDyfKlqYJqQ3EPtm?=
 =?us-ascii?Q?xw24+B1tnu/m1WinM0WLDT+NPP19QyZ+irotv5w5yLHRNW2hwfji+h6EoiTq?=
 =?us-ascii?Q?FQi9zt1iovufcrhMmUhetu+Olqt05/NzH7o3EsdDhjx/gXKlt9u6AMGXUq9e?=
 =?us-ascii?Q?z4xx8PKSUV6hJjFjxGzj5s623ljeGJNukUMyhhElJquQhNMtj+zr9f9O/OmP?=
 =?us-ascii?Q?zyBwCyAeEqKo8CCgkvpWannU31CWqmvQfW23o1Udv4u0X+yjrLaT5quY0fKG?=
 =?us-ascii?Q?1yPEFiv4qk2/tdOfz1MlvWGpEJAMmoam1xljv0EVcLXYnwksB99gPNuL9Ynq?=
 =?us-ascii?Q?8SayEq4oY71CyvMFU2qL3a4PQvGrfbuYf7BaG9xxOHc0znxu/somOe9TaCu+?=
 =?us-ascii?Q?RhCrM9j7yATw0gB9RiJN9IgoV6mrJeocxvuI7JA9hQ8TxQP/CE3j8Tbe7hoS?=
 =?us-ascii?Q?c64k+qs518cjxn32f/ZKbzoaCEbp4YePI1B/rxJYfA8roffirERp99GtItMq?=
 =?us-ascii?Q?A0AI9JvmyhV6PnirbHad2kFI05+OqmzsFZdvFAPPBkuvJeD6fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bfb3ie72DD4pHacgbKdYbF7mxsSvZpy6vy7dbw3bqUSkC2DL9rdQHtiuP93N?=
 =?us-ascii?Q?tMk6zPMGpMQyqXoaCEr3m/DApDIE57fBcWafIZqnNqL9HMzJHTiusq9yqaWG?=
 =?us-ascii?Q?BqhON3EAYGsxtOBlw8WNJbcumRUppFCvqO7AO/vmKj+Kj202de0IUP1y7Yz8?=
 =?us-ascii?Q?uSN4sNslGj/HK400F1Jk7gMbeQ/VIPSi6EiQsEmodxqUwbDqgfTzS+9EjMUl?=
 =?us-ascii?Q?+ZgXeCOjN/Oa6tJw4pBVMr1RlIiSX/pDla+ysZhhz2rTc3x7egBkkhY4/NMP?=
 =?us-ascii?Q?gvq86C2k3Fgya8UmmDVxyDYcKLIPHVHps2A+8pQyIYGCUeSYp8BvNiCJJ1Qi?=
 =?us-ascii?Q?kG8+xV49rufyT42see5spkE6DTDLzzqeGmz66WllCDhQ9ARH0gmTyt2M9Lc5?=
 =?us-ascii?Q?ypgZP9+pLC1/GD1d/1q2+z5lUrlGGN8hEy1HcAT6dZUhD9YsC0H61eUmdCl3?=
 =?us-ascii?Q?5LWG+39VNHJYKWd6X7VO97/YW/r0es023XFpkbQaTf6u2s9Y2XxkACwbp5D0?=
 =?us-ascii?Q?6qRpCx7Qf91DfcWWR2HPJM6CSztk7TY90W9Uprj0GxMRil2HZDcbqLk13A+S?=
 =?us-ascii?Q?DosyvBve4AwSmgJpu3VxfxzwNcb5d5X5z5NXz2XxquxuDbxTgCdxTN2/n7ge?=
 =?us-ascii?Q?btwvpbo8RvQgt4NzC9bTIrZ2RKwKC/U38J7Tzqqgp2MrcSxzXLI3DzhC9+x5?=
 =?us-ascii?Q?4oWXNl5uvO0oyHd6tZjDuAySRrat2vYC2UeIlR922HH94Ba6alH65bCeYxKq?=
 =?us-ascii?Q?gVob/nNXU3nXlA05HcZW0sDGT4d6UyWdeAYMjl6T5wwQEUNGEOFcsoytpXEp?=
 =?us-ascii?Q?r6Oebrtuw8xOutYHvqp7RxxguDjubQD4/BaPl9MhFKTQo1eUgUrR+RAme6JV?=
 =?us-ascii?Q?d4QwjZwBCej8d+ueeEphI72lIW3QpTJfhe4Imj2CIDkgRwtYBLVLxVv/vx0U?=
 =?us-ascii?Q?O65GqoKWxUoXICF2AqvNhSRdiiFFzr9la7eCyG7KklpCsYc6xOP1spsH86SK?=
 =?us-ascii?Q?6Rhp55ODxXAX5fDJQFrsTi/YbgBorCTeFohOyDr8/VENFOCMwVb3iqdbc/5L?=
 =?us-ascii?Q?5XNXwKglUrT2NpBJY0Iy2+gNRMqVX/PjdedhTxN/akSKeWOUUh6HHpSmqk5T?=
 =?us-ascii?Q?zfPbKrXmqfBW1t9SQbL/XsIwIdWkeMHsiI467tIst2cxU7uU4lQ+thP+qKkB?=
 =?us-ascii?Q?aHi+KuB/XnRxrbBWiZ9QzVnjkVrq0yqa31db68ZqqVOe4wrp7mf+1VmTuP0g?=
 =?us-ascii?Q?dxV/jNlGt9aCSRWvSkDydyw3/NmH0Y4hVZd0pgEW0tOD0mp/MyLdLZ6oIcHC?=
 =?us-ascii?Q?zi9tWhddG5ZdoDwzq7Nmhn0USrfBPmsDHgzplrKOz/UmfoHK8h7EGwVOyNCE?=
 =?us-ascii?Q?7R4Hfu4HOPVa3XAEkedFHgtDE/vr2g7AGt/pEH/YKczAgxQHtUM0Ot53Qlpn?=
 =?us-ascii?Q?UFsDc3Q2YLMzBmOnWk0eom4SjLm4lcH9jOaMoOZOTIoSXQNXK9AYcb5i+2dW?=
 =?us-ascii?Q?3D2RUvhRQdCBiTHJ+Nme+mzRCDc4xCpYFO0dUL7+dsva6ines8RR0yjaz+7+?=
 =?us-ascii?Q?9tfWUb/GSXXgmT7MOe0Fr+uJY6AM1DUiF09aoLev?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faddf504-74d2-4682-598b-08dcc82440e2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:21.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1d8LlDWdV1u3zBJNs5vOcIMicW5vkjapeYAwEcPWKIGwVLGAqNrGowxIau2HM7W/vjs58S2REJJvk5Xu0JKVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

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


