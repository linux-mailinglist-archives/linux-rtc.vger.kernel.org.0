Return-Path: <linux-rtc+bounces-4843-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D70B4557A
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94BCB483BFE
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 10:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1971E314B8F;
	Fri,  5 Sep 2025 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="np7fmyJ5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46430FC21
	for <linux-rtc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069841; cv=none; b=W88T1GJrwErMZ+ehsKZU8I7U6BmlhGcLbhfziTFCCbxiiOIfLBuRcOl3XiDaN9mBJ0HgpRYkCR96AQaQ+A4K6DK4mmslMwVy+RU/Honkpc4lzmqX7vEfzkgt2Kzxbje+CrSoQgV17/SxG0g2RSgkX1Y+/z71qx06BmSlONXPsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069841; c=relaxed/simple;
	bh=y0fxstX70POgWyLYj4Oli9B/nfM1S2JwmH1qdfNILbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=P+B0TnTCnK2Cj8SXTymVOGO0PlHP5pu3sSAvu7l0X94pw9eEXP9QCGKjmQ3qfqOtLs5vqmn07zcVOoehpqpLru9weMvQAdqWGPxhIpOaIRseaTjO/ypHL2SY5QNXAJekqv7OAt5UvUBog2nWobCjxDpWrJCg/zrFe59U/E4v2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=np7fmyJ5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250905105715epoutp01468ea000136b79b324f130622733e51d~iXbTG-iG12761827618epoutp01a
	for <linux-rtc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250905105715epoutp01468ea000136b79b324f130622733e51d~iXbTG-iG12761827618epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069835;
	bh=ooWfYBgMzL1HgRQvYlxiux0h/MzDlMT3KW8zBL4DMug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=np7fmyJ5H9lGa1PORLtAIWKDb92ferHWfmhRaXTwdusrOLUZmZfSFeO8hldaUW2lW
	 4AXYN/aVqsQ99X5X3PPPxKLeTtdCJMyaL5vLRGj1zdJePPLLolGEMY1b7t1LVPRyyn
	 8/5UVhrrgKEbbHq1/mADOW3N/TylU6osBGRGvflE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250905105713epcas5p41d465581cf2290d58cd98c4b0a4c643c~iXbRWBSlb2479124791epcas5p4b;
	Fri,  5 Sep 2025 10:57:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cJCwS5XCdz6B9m5; Fri,  5 Sep
	2025 10:57:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43~iXbP9aZN20553305533epcas5p3r;
	Fri,  5 Sep 2025 10:57:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105710epsmtip26d1fd9792e6bbd2ec4ada09f930c876f~iXbOQqDrP0831308313epsmtip2T;
	Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v3 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Fri,  5 Sep 2025 16:35:53 +0530
Message-Id: <20250905110554.2212304-3-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
	<CGME20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43@epcas5p3.samsung.com>

The on-chip RTC of this SoC is almost similar to the previous version of
SoCs except for S3C2410_TICNT tick time counter, which is used in this
driver but not applicable for exynosautov9. So re-use the existing driver
skipping disablement of S3C2410_TICNT in s3c24xx_rtc_disable() callback
via a new boolean member of s3c_rtc_data.

This has been tested with 'hwclock' & 'date' utilities

Suggested-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 drivers/rtc/rtc-s3c.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 79b2a16f15ad..8fc5b4582b6d 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -48,6 +48,7 @@ struct s3c_rtc {
 
 struct s3c_rtc_data {
 	bool needs_src_clk;
+	bool use_s3c2410_ticnt;
 
 	void (*irq_handler) (struct s3c_rtc *info, int mask);
 	void (*enable) (struct s3c_rtc *info);
@@ -369,9 +370,11 @@ static void s3c24xx_rtc_disable(struct s3c_rtc *info)
 	con &= ~S3C2410_RTCCON_RTCEN;
 	writew(con, info->base + S3C2410_RTCCON);
 
-	con = readb(info->base + S3C2410_TICNT);
-	con &= ~S3C2410_TICNT_ENABLE;
-	writeb(con, info->base + S3C2410_TICNT);
+	if (info->data->use_s3c2410_ticnt) {
+		con = readb(info->base + S3C2410_TICNT);
+		con &= ~S3C2410_TICNT_ENABLE;
+		writeb(con, info->base + S3C2410_TICNT);
+	}
 }
 
 static void s3c6410_rtc_disable(struct s3c_rtc *info)
@@ -550,18 +553,21 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
 }
 
 static const struct s3c_rtc_data s3c2410_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static const struct s3c_rtc_data s3c2416_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
 };
 
 static const struct s3c_rtc_data s3c2443_rtc_data = {
+	.use_s3c2410_ticnt	= true,
 	.irq_handler		= s3c24xx_rtc_irq,
 	.enable			= s3c24xx_rtc_enable,
 	.disable		= s3c24xx_rtc_disable,
@@ -574,6 +580,12 @@ static const struct s3c_rtc_data s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
+static const struct s3c_rtc_data exynosautov9_rtc_data = {
+	.irq_handler		= s3c6410_rtc_irq,
+	.enable			= s3c24xx_rtc_enable,
+	.disable		= s3c24xx_rtc_disable,
+};
+
 static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
@@ -590,6 +602,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
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


