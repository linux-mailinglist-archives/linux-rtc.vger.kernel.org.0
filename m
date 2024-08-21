Return-Path: <linux-rtc+bounces-1679-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF79598D0
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C881128203A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF8F1EA663;
	Wed, 21 Aug 2024 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="CRK2Kaxz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071.outbound.protection.outlook.com [40.107.255.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68D1EA645;
	Wed, 21 Aug 2024 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232555; cv=fail; b=Ntq+QKbJKJe9HsNi7bcmSqDrWZsaEwNG1A0VV8RfqlKMCKTh73lLcbmtOxcXqjco9L5OW86La2ImrygDKuH/IB8USsAVjatP5Da4LQziVh9NaHs0/VWdi2APC3pvK26GE6YwHal63JiMMBZSVe2AXMUIUBiEhG6LjY/KXjDEXKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232555; c=relaxed/simple;
	bh=7yKS26VVEWgk7VuNcnvZdO0yhSOvLe88FU+byA89C7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n5rU6SQeGQb7hNurHz02JScYLewjjqAH55tvIRstZndEz74/6XSAOSyDyqPW8FB/8QrZ/cEYz4QtWBulp5FmUcjQcNJrGE3t8szCE4PdiMnGJrVwvQupUoHW9kAn/mb7JB/bC0rFDEVPm5S+5aszYYtp/MsZLVrGgRKhUEdIve0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=CRK2Kaxz; arc=fail smtp.client-ip=40.107.255.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMQATHWCt8iuFawuSVJPSDM9JglGe4F4F61cGRrAVW26fTg91bFvqvdnysISFqA3KArUYW8o+/+w8sPlVvXlfeky0iWolZo4GM3Cz9S18XZacBshZUeiThYC1vel8X2qCCqtlR0La57srs1WCFT3SeTahlQBwJ6OhsluvnxRqqX7fLyfdFt/pjXzH83nqp8es3DaQly2U7s0LRuA+1KZN0lNAYi+F9wXDWTz3RSUOYWcZUjGRC8CGp648m/uUx4o4FqAIvgkeef2XwG4rW2iRy4Opr367gBfGDGRlFIhpVwvi5IMzq06L1v9sHzCFAD/D9TEGvCWMj9ILDElHmXnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6HlZrq1q1mW+t19yIIp1YgZ9VJC1IcuSuO6oDr8sOQ=;
 b=Q5dHYqKyNUB2rFJW0ZXsWOVbmEM23PQ06gOREfIm43zrzJ3cZb3b64b+6fmXfW8N3N2RaEqj/IExjul7Zse6J0GNxW7vGC5UN4uCRGIIRT1uw866ybjOYZvy33Lxwi4p2DYRsP5Y6iELn5hAMgaLR31XUydpXJZJ08kTkYjxvCz7wDBxXv4Lsw+NGennl+JcnOiNUYh2ZPjfzOI/LKANNwyd+9/DpBUgjp+66a7nmEiHEzeVfCTVPyXHNFLO7K9puiUdSAgw03N0fZ7o25WFRNeAtxyAnGSqTP4LoeXi8J6iFuKdPqp0H+bm4M74wmcIPd2xDj+cVjyf7ssAJdVz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6HlZrq1q1mW+t19yIIp1YgZ9VJC1IcuSuO6oDr8sOQ=;
 b=CRK2KaxzxUN/4KNN/ItKKR120fOBRbNKIKxhY1o2WuhSDu0pq4SqdXS7oR6D1wYAnOaei+g6jX52NIkbXB7/TaXY/fqfjn6ERSU6f11sOFX6aK/YPTWa3m7gaqdxHtgODSmeHCfCIzKcaVaKYirlFnSU5GCY7RXfMpIN341uJcjFUxtXzmvOuuZ2iZPb0iDbwlKuRMZdQ5htzk6XFeTjKohxnncqXH7KKQOt433AH6MVQa0EYH4HgqsY3ShOojGSPK8mo9umC6BJbe5GjzB2rwvp/vJfWJI2Yi270jl0A1b+lr1rcRxHMfppjPQPaE48XYa0qzy6BLGa7dnN9krLkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:29:09 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:29:09 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 5/7] rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:44 +0800
Message-Id: <20240821092846.20138-6-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: a174344c-718c-4af5-8e42-08dcc1c3b5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DVNewSdwnSi2iWD2WTAYFxMhQDP589Rnf/3hqBFLeBNpB1ScQgld/388aNbs?=
 =?us-ascii?Q?F70TZFJ1CKDS6KxQPosXHSLblPN3Veob1mKmBd0KWe6b6kf2eYNdDjAtaPN6?=
 =?us-ascii?Q?AbLR1F0uQy9wiWVgdZKf9fqKTKiT7/69u62S4q3J/i/5pbvMPP5nEfZqWsU+?=
 =?us-ascii?Q?rlG40dxw51tl2F4D1Av2JLiUD0BzU5XlOIPHoejkji1xfBIha1AeXlNF6GRg?=
 =?us-ascii?Q?M16GzscKCJDZvAmmw1mM4vtOGsZywUxDirUuPVqMe4xEwEr1aLh/T3XvmcmZ?=
 =?us-ascii?Q?+5rLRlRw4ztBwKuhg86j7wTzwZGvEkNFOE5tQDKJXq0OyHsUz4L0m76jGTiq?=
 =?us-ascii?Q?DpUcFu10DC4gRYNWt2YLFTIjTpQUFdaoWz5yRMM1t/UdH2/kaRTbxuV2ullG?=
 =?us-ascii?Q?BHg04F/1xcYjyymL+lbBE7qo1E/Z4mF0Nh68CGzfyOEKZAVo5jFizEyb1RON?=
 =?us-ascii?Q?/Ki8p25XSFzITi2ufaVLaxZv50sEo37VwHC+0PWAvmKcdUsI7rUz4JwNlm7M?=
 =?us-ascii?Q?x4wLJDOoGIEAEnADacA2Mz7SSHM3gZ+3S/TzHnPjR2MJVmXeRApkZbqjjzS1?=
 =?us-ascii?Q?VhlmzaTu1TkrRMEDprGi7KewrXWAuZ9ViLW2JtRiB3Y79qcEH1jYDC8CCS4W?=
 =?us-ascii?Q?Oc4TNHh454CCFZ2vxuIVQgBJv9Tqh5XV59WfEBFCJCWYmmxhY87nqeuctA6p?=
 =?us-ascii?Q?ZaO45mENHf3Imj158NM+6HbKNK6x/RD3I7Bc5ieG8XT/UbxCAPraOj00BzUm?=
 =?us-ascii?Q?QCIKnpKd4S/2L/MuR6lCCxhHdHEq+ychIS+WweKhSjB0txN6vswABfqN+I7r?=
 =?us-ascii?Q?tDEFQ8niJjj/ZI3klmok3MJjop5OZE9ruHxkEv6BzcvhyQiuE8G+QfSSeYxo?=
 =?us-ascii?Q?uuYgETPIefLjsZPqtpEcdz/t0gDRPHxHFzvniesH7WA99qOXCbFRvDcvx4f9?=
 =?us-ascii?Q?qCPtE2wyocirdZLCnzkaf+EeEDkv1DCAkWePQdh9FOYTb6t6yXqJGvceqA9g?=
 =?us-ascii?Q?dHE3Ot1RkKnNFMMGXcooCM3mOZdEEVeb0sJ5nPs9SNZQqRwsH8xpdrvlBCwQ?=
 =?us-ascii?Q?WaT3kNzXHyGS+SQEd+xd1JyOXe+z49BzdTKCmW8KhqzB1eDFs/jbxIpmQFRC?=
 =?us-ascii?Q?94gBnIddZKC/0QH9PyZ1JUFSDAqEuvzByzONdv6REkNgvG3Qi94hSIqOARHB?=
 =?us-ascii?Q?63ppElXdyKbcjGCi26fLW7Ovt8s/EFRLJ1Y/xU8Zu0bxO/z1v2ePiM/GCyJi?=
 =?us-ascii?Q?T6topwuk4yeVI4O+6uyUoUVmWlWkffQ1nC0ZLZzB7lxOJIjuQKJ/drEhu9Od?=
 =?us-ascii?Q?8KM7jPuAwWOz12Z7R6SwXr/Cnc397Z40GWc80mscib7Ot+986ZYjhK0zn63A?=
 =?us-ascii?Q?oufHwvgkyenDRQGEmy60F0Pv+eqHVAgr3CEh+zeWrfRX08xx1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+AF8u5R8WorpT84xg6Ydg+BJ+E9mvibDqokBCorn3PPBlznRYu4qPEND6iqk?=
 =?us-ascii?Q?Sk/fJw+GkNs14mQ/0ZCTPyCP00POoyFtJQgaU0gIBqWjjJWfU/LdOISyl9us?=
 =?us-ascii?Q?xBvKMi79C63yvPAzMYIN7KdHBar2Zn5fCCQZkMyllMmPvF02aMEc1JgOEWUG?=
 =?us-ascii?Q?oXvMH/SopdtB1Lp70noKosKOzfkWos1loQgCmvoS/J6UfuoFp63Df59nHh7U?=
 =?us-ascii?Q?lnSpb68mIwA89JeYAHcdkPxb7pIHaheNjE4xJyZzyp2BN4LoTILTCIvapzlL?=
 =?us-ascii?Q?heM1VuO9qiDxrGeEMVsiL/e8ngGyJR0owkCUn4FOihOFuDXGq6hzsWYSvc9F?=
 =?us-ascii?Q?kaDHTv/0PIpXpB5mQcJxeWKY3dt8gqvdw6ImS2z0MSiReamp5DVqCmtaUgy0?=
 =?us-ascii?Q?spNQTxht8dkjfob+pBSwgMSVSWv+skwCXalKRjPX/rXxqcIxX226LkyoBzb3?=
 =?us-ascii?Q?R5AltYw9f+dK3V49jGtwMHdVgrrk616zTXMbrF9sNgxO5cGmP7NrbPrn68nQ?=
 =?us-ascii?Q?vn6uXye2ylkjx587jjqk+dFAOO2dt68uQlsCFdaQ1jkYkOaXUqEUaiRpOCvg?=
 =?us-ascii?Q?LJgul+VKzXt9IgWaAi6xGoK7EKxBb75MlXX3nYdFS6PSbswtyD6Ns8bcM0hN?=
 =?us-ascii?Q?QpMlNVbH+eWakZWshkh51IvhZSx40ZZaKmWzleHCs6IlD2Pg0z6D+006HHyz?=
 =?us-ascii?Q?vC6pd83/HjeZWo4dnDHw8XkI9dQZNKUWtjRROycpD6t7ogZPUkl8fLT9vQq7?=
 =?us-ascii?Q?c7G7g0yHbek/+pSuovnmm7QlZ1KSnv2hm7fx6elWrPTvZ5hMMkZNAifJB0eW?=
 =?us-ascii?Q?pKBwDtkSCm5fCaFmf/Hqu+cyPiZNxAzCx+oCsn0fMjKtK0p9V22sOASLhNnf?=
 =?us-ascii?Q?Ry+HBHXYanQ7kZBpkFDPaJTVSJ9GwLALYq8Pj+SvqrQs5RAzcNffc5MBI1R/?=
 =?us-ascii?Q?LOYwYJZiPfQLYafk4JDEWrvGhtIR2ycmPO88AWP4MalghY+cBYYjFKehrzNm?=
 =?us-ascii?Q?AL51PdvSZSI89QzCIVYeuMxVK+mAZVERXF4rJHViuvIhqw/mTXMNQB7WyiSc?=
 =?us-ascii?Q?psIY1vSQ3dAHeOn5VQODVs/MTuhYSmtv2gwIXbGUNo9Ge9c3xlRPW59Cb5ct?=
 =?us-ascii?Q?ZjkgJkqOdKJ/1vqfvELQST0at7rp2oohbnVSoNaMUPGaiyW2SZfCkz6qPdlT?=
 =?us-ascii?Q?qiMA4/W4pbFqvkBogK7cs8als51pCgoT8zmU0CCn9kWGjVjqvZgNjN3Gmxf5?=
 =?us-ascii?Q?SDRnhTHrDqdj6c2t3HiTh2PCXv5CVju1/w5wAOe5fVmf6HoqcFp8M3arsC2f?=
 =?us-ascii?Q?AYHmfr3KTKs01sI6508alkuIUxj814R1zR5gCE67RRCifWwEyVJv1SdXEcbk?=
 =?us-ascii?Q?Z4XOSa303vgB3Eh6CUJWKnuHGdWnsBZ4hQzh/DXa7BV5ILIlDh5QbyOHDrzr?=
 =?us-ascii?Q?aLc7LBHoevf10PQC321K1MTkaLx6uIQnSCb9fYB9Am6/dB75DwsM9RcyVb/6?=
 =?us-ascii?Q?hnri7IWeW/7ZwIoRqu8xB/s1HtrK78d3d/Zfj9mj+OnLTcJLj9+5xL8CWrVu?=
 =?us-ascii?Q?YiPD55DGU/QgUAh3ldad+M6Gn6/n5EM+FXaEOQco?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a174344c-718c-4af5-8e42-08dcc1c3b5cb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:29:09.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnqBjE/2n/q8PqnD9vf5KLpGxCrRiJeGXoJgv6sxTuozxzGC1R4ssSpiVYy7LJPXvmqsAHMMv4VOst0lGmbgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

Use devm_clk_get_enabled() instead of clk functions in rtc-sa1100.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-sa1100.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 0b2cfa8ca05b..2e72daa6a152 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -177,15 +177,12 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 
 	spin_lock_init(&info->lock);
 
-	info->clk = devm_clk_get(&pdev->dev, NULL);
+	info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->clk)) {
 		dev_err(&pdev->dev, "failed to find rtc clock source\n");
 		return PTR_ERR(info->clk);
 	}
 
-	ret = clk_prepare_enable(info->clk);
-	if (ret)
-		return ret;
 	/*
 	 * According to the manual we should be able to let RTTR be zero
 	 * and then a default diviser for a 32.768KHz clock is used.
@@ -206,10 +203,8 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	info->rtc->range_max = U32_MAX;
 
 	ret = devm_rtc_register_device(info->rtc);
-	if (ret) {
-		clk_disable_unprepare(info->clk);
+	if (ret)
 		return ret;
-	}
 
 	/* Fix for a nasty initialization problem the in SA11xx RTSR register.
 	 * See also the comments in sa1100_rtc_interrupt().
@@ -305,7 +300,6 @@ static void sa1100_rtc_remove(struct platform_device *pdev)
 		spin_lock_irq(&info->lock);
 		writel_relaxed(0, info->rtsr);
 		spin_unlock_irq(&info->lock);
-		clk_disable_unprepare(info->clk);
 	}
 }
 
-- 
2.25.1


