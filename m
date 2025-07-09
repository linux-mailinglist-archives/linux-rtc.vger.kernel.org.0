Return-Path: <linux-rtc+bounces-4443-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6AAFF11D
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 20:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747981C8184B
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 18:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71EF2397B0;
	Wed,  9 Jul 2025 18:47:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878DF17578;
	Wed,  9 Jul 2025 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086877; cv=none; b=IjLBEAjRKohYkKnsE82QvgDaHfVensPezSLxOBjNgta+z5BJCD47JcX8Is32znfxBTtQ/sL7x3+c6OyvOLIbDVD8XqvCV9iaM4kmUfK7B5uLRS0s1N0O5cDxxvUJQ8Yaz2j+M6MIXGwX9IB0sQI1HPY3Vqy6MujQs0wvp25Cc5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086877; c=relaxed/simple;
	bh=NvZ/0DIXcL8CANVucXfg6KgHkCDwQwXw/VJ/M4JB3vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpT5UcUxVJWRFA4xViWtc6T3mNVmxmmvKfRmZOQJsPKjaYlqf0xSfcfE8LaBnv+3A+Wim4aIt7Ebr806qdgqslEi2QPjAJoXKOzmbpq9rnY8O6hzXTGkiTOMSGWPJZqFqNbC9K8zVirZA53eoiavyxcH9mXRLZwuv/SGErsY5s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667D2C4CEEF;
	Wed,  9 Jul 2025 18:47:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: sh: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 20:47:52 +0200
Message-ID: <396d4a769b8d3c6fec43c65022cdfd8a6854524a.1752086758.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas SuperH On-Chip RTC driver from SIMPLE_DEV_PM_OPS()
to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-sh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index f15ef3aa82a02d5d..619800a004799cc2 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -455,7 +455,7 @@ static void __exit sh_rtc_remove(struct platform_device *pdev)
 	clk_disable(rtc->clk);
 }
 
-static int __maybe_unused sh_rtc_suspend(struct device *dev)
+static int sh_rtc_suspend(struct device *dev)
 {
 	struct sh_rtc *rtc = dev_get_drvdata(dev);
 
@@ -465,7 +465,7 @@ static int __maybe_unused sh_rtc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused sh_rtc_resume(struct device *dev)
+static int sh_rtc_resume(struct device *dev)
 {
 	struct sh_rtc *rtc = dev_get_drvdata(dev);
 
@@ -475,7 +475,7 @@ static int __maybe_unused sh_rtc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(sh_rtc_pm_ops, sh_rtc_suspend, sh_rtc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sh_rtc_pm_ops, sh_rtc_suspend, sh_rtc_resume);
 
 static const struct of_device_id sh_rtc_of_match[] = {
 	{ .compatible = "renesas,sh-rtc", },
@@ -492,7 +492,7 @@ MODULE_DEVICE_TABLE(of, sh_rtc_of_match);
 static struct platform_driver sh_rtc_platform_driver __refdata = {
 	.driver		= {
 		.name	= DRV_NAME,
-		.pm	= &sh_rtc_pm_ops,
+		.pm	= pm_sleep_ptr(&sh_rtc_pm_ops),
 		.of_match_table = sh_rtc_of_match,
 	},
 	.remove		= __exit_p(sh_rtc_remove),
-- 
2.43.0


