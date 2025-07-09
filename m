Return-Path: <linux-rtc+bounces-4444-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD3AFF143
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 21:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58964561940
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 19:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82F223BCF2;
	Wed,  9 Jul 2025 19:00:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A9238178;
	Wed,  9 Jul 2025 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087629; cv=none; b=dut6lNpa+4c0l2oYeQ9LV4J6QUYPNiyynckT0YII/wVOKRhMIij+lSmKMSCkqDm7j84W6hS0Svhro8WELdxu+0LuCZOz9i7+4sVmbqgY4MVRJiHDzvlFzgYg0qOUIY0EoQDv9/Y8L1s9W9cbotV/6a7e4PHYDSp4JpLm1eyMFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087629; c=relaxed/simple;
	bh=wSR0kEid9wsA6jwGEKFrLZ9x+P2yYmI58utH+96AOno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0LT0VrvoaKXOp0zBTwoIYh7OiUE09K6fUzb0vnl+HvGE7z8Q6rp+ZGbOlWYL/9LYoUq9jkCr7kYxSG34AA9HulBdukBNOmkAI8tV2bJSW5gExrl3udUYjul8j2vSpqMe1y17d62mHBM2ORgcIyGrKDPAeLqq3KmP7GIIZR/J1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E14C4CEEF;
	Wed,  9 Jul 2025 19:00:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:00:25 +0200
Message-ID: <a5628fe028362ae3f8729021a7864dd39f7869bf.1752086885.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas SuperH SCI(F) serial port driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832a0c2..fa5773f56a7e577e 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3702,7 +3702,7 @@ static int sci_probe(struct platform_device *dev)
 	return 0;
 }
 
-static __maybe_unused int sci_suspend(struct device *dev)
+static int sci_suspend(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
@@ -3720,7 +3720,7 @@ static __maybe_unused int sci_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int sci_resume(struct device *dev)
+static int sci_resume(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
@@ -3741,14 +3741,14 @@ static __maybe_unused int sci_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(sci_dev_pm_ops, sci_suspend, sci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sci_dev_pm_ops, sci_suspend, sci_resume);
 
 static struct platform_driver sci_driver = {
 	.probe		= sci_probe,
 	.remove		= sci_remove,
 	.driver		= {
 		.name	= "sh-sci",
-		.pm	= &sci_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&sci_dev_pm_ops),
 		.of_match_table = of_match_ptr(of_sci_match),
 	},
 };
-- 
2.43.0


