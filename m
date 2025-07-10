Return-Path: <linux-rtc+bounces-4483-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69458B013AC
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 08:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C61DB40289
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6925B1DED77;
	Fri, 11 Jul 2025 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hIUd8iIC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090E1DDA1E
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 06:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215778; cv=none; b=axt2YWPhcZ6m4elkO50AS3JMlul0Ou6m7rnxCS71bEnMp4y0RAkmbzVjwpjkk6M2oLNhzydKS75AfFvfSbqGF25zgCQ+117R/IBNmGEjjiOqpmz+G5k3iPQSrKJR5PsZZl/txGQHPjdJJZkR7LiAQkU+ZVS/k87O/Q4EmqSPk2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215778; c=relaxed/simple;
	bh=B5QoPKfWCSEqt1x7L7LZjKvxdTAwQ6hk+zvYcSuo8nU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=j6VWP2PuTp8bmMa2aEgPda4put+EOj4FxKZhBpt3gCZG92BemeM0toeNv8/BN2a6QJKZNB9J9zlqesogk4eSNWO4gq72RX+OTDft1Aj36ud+89Ogs+b7uZd6IADMGhgxxiPwFrjtCL3rNQw6z+cYvyyHiXo4LN1b/mjYeXDPyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hIUd8iIC; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250711063613epoutp04793d46984df34a7059051ee66eb6d6e4~RHvZhYK-c2225622256epoutp04j
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 06:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250711063613epoutp04793d46984df34a7059051ee66eb6d6e4~RHvZhYK-c2225622256epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215773;
	bh=U+/rrda8ib7zX55HJF6zNx//IkDV6WKc4dFWq+87emM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hIUd8iICX39vSZyq0d+jB3off7/csR7Q6dzgxCUvzusLLsv5vzzWv3XgMYtoL1VMb
	 XYABELOpIThZ647owUVWZ8LAMkSoAYrT0SvEUFyvtK+P8yE+sPxKz+y56iaThHfYQ/
	 2f7cYRvtGOBghcyooZtZcEheOZHkoSOGueko2n4o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711063612epcas5p35a5f41544a3407fd44a482ef63e834ce~RHvY_8_AP2513825138epcas5p3m;
	Fri, 11 Jul 2025 06:36:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdhn71zVqz3hhT8; Fri, 11 Jul
	2025 06:36:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9~Q1lnqmpmI0133701337epcas5p4q;
	Thu, 10 Jul 2025 08:25:36 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082535epsmtip1530e1f1f7803df409b271014bb8e7acf~Q1lmJoIVI0693006930epsmtip11;
	Thu, 10 Jul 2025 08:25:34 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Thu, 10 Jul 2025 14:04:33 +0530
Message-Id: <20250710083434.1821671-3-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>

The on-chip RTC of this SoC is almost similar to the previous
versions of SoC. Hence re-use the existing driver with platform specific
change to enable RTC.

This has been tested with 'hwclock' & 'date' utilities

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 5dd575865adf..8db24b6360b8 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -384,6 +384,15 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
 	writew(con, info->base + S3C2410_RTCCON);
 }
 
+static void exynosautov9_rtc_disable(struct s3c_rtc *info)
+{
+	unsigned int con;
+
+	con = readb(info->base + S3C2410_RTCCON);
+	con &= ~S3C2410_RTCCON_RTCEN;
+	writeb(con, info->base + S3C2410_RTCCON);
+}
+
 static void s3c_rtc_remove(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = platform_get_drvdata(pdev);
@@ -574,6 +583,12 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
+static const struct s3c_rtc_data exynosautov9_rtc_data = {
+	.irq_handler		= s3c6410_rtc_irq,
+	.enable			= s3c24xx_rtc_enable,
+	.disable		= exynosautov9_rtc_disable,
+};
+
 static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -590,6 +605,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	}, {
 		.compatible = "samsung,exynos3250-rtc",
 		.data = &s3c6410_rtc_data,
+	}, {
+		.compatible = "samsung,exynosautov9-rtc",
+		.data = &exynosautov9_rtc_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.34.1


