Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1002B917F
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgKSLoM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbgKSLmz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:55 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F32C08E85E
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:53 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b6so6123521wrt.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qe64UAh6vuon0ziKW8xzw0ROoo8RamQkTQ/rMabYI0=;
        b=V/zDrUkVE9bJHdvmS/NwndN+y0BJptqchBiGF4e4O34qrVFMZIA8uN17WidzR/cuQK
         diRiIiEMEu0HqdwZLUGMPPHhDXJtfrqAgA1Lz/awTm1C9+8NpP/tzJBWzBTWpYZe/3AG
         DGTDHbKQ10r4jIuXQ0N6+lydLBEyISh0onTR3QY1HR5jEE/mzvVH1n21tYlWrlapsXh3
         7/vQ2YCvrmzNkRFP8Gj0ejJtyGNqVMr95Md+1dOFMECK42kfFXMXhhy1PCo4RN78Aula
         uPzxnPUKZOr5vTzivfeFS5tiTAfa1Oz9+Tv6XIu9sJkqOT2SQuBuosC1w6B9B2Ul06yP
         K5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qe64UAh6vuon0ziKW8xzw0ROoo8RamQkTQ/rMabYI0=;
        b=JXyy4ZGI1zdTwe7dIp99W4AEhU2VZPm+s+swjvAgPwJa0kwBVkr+G+wdj72SdisxaN
         NaNpfHcCbqVKWQ5LL2MNvLnqMGSg3q9fma7zXLQkJ5dtxmTbyyrcfBzit+kV+c7757qK
         rSpdtY5zmt+w5bR1YnPpcTpFRQwduL6ytRCew+QFFNJ6VlYErZxn9mxO+0YUOwOqJG+F
         gYDQ6WjV/b0DhZQecQXGt218EX7SP5jaqyDeVQFpycS5SiJFdDZK7qVWRsmZHAC6+ktb
         +HkMRiDF7pJqLhM1rGwJb0IHtBH7FsthPz2QoQdBLEdbiQThCzonVqrHNI5EIL2Zwj66
         ACsg==
X-Gm-Message-State: AOAM532iTSlDbh2N86X6mhZ2TxxysxrYoiQQ6rfvxzDdM51Qs8jaNkn5
        UHrf53Zh1fO4XjVIjm612d7fkA==
X-Google-Smtp-Source: ABdhPJw96Cxht6fwOle4+uVEI0+3zhrwuSByHiLmQcBDFIgyGuRgRUcXYbtuOzy0k7JXvpUv8ScG9g==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr9538285wrc.17.1605786172290;
        Thu, 19 Nov 2020 03:42:52 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 45/59] rtc: mt7622: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:35 +0100
Message-Id: <20201119114149.4117-46-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119114149.4117-1-brgl@bgdev.pl>
References: <20201119114149.4117-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() pair instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-mt7622.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index f1e356394814..20db5ea43309 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -342,14 +342,18 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, true);
 
-	hw->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					   &mtk_rtc_ops, THIS_MODULE);
+	hw->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(hw->rtc)) {
 		ret = PTR_ERR(hw->rtc);
-		dev_err(&pdev->dev, "Unable to register device\n");
 		goto err;
 	}
 
+	hw->rtc->ops = &mtk_rtc_ops;
+
+	ret = devm_rtc_register_device(hw->rtc);
+	if (ret)
+		goto err;
+
 	return 0;
 err:
 	clk_disable_unprepare(hw->clk);
-- 
2.29.1

