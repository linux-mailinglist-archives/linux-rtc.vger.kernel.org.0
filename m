Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FE72B919D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgKSLpc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgKSLmm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:42 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC2BC08E860
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:38 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id s13so6451339wmh.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Co0e+B8I40Mpfh1RghpivUiuHuObKAKp6jWgMgKmvQ=;
        b=yTJOjkwoCDqX1rgNmyuf/siQCTHTCr9+rwYDYsVGe6iMA8qM7H/Ztj1kUrYbDTtJqm
         Vacfaz2rOYj2rX0Kn9grBF6AdO0Fee+HEpxDaCTrNOXPzq74agoavQf1cbb4vgbZxm6I
         bnNLOfxxDB6gVS8/N7r6qwbf6/nWbW6PH6MwN8JhfUK6bb9fnJpCd0Ich4GKFkz+Khec
         +MAIJvxpYJYObZ54mxcYC4dTRp6IY9O7CZ0yxXVZqi+Y1gsJvfc903DwY4j6qqanPZdE
         JkOdJ++vvviVRY/taLbNPg3F7494kOlp4R5k7DTBKN08jMrUL//mjL4T8AAJ1RJpEl3E
         evKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Co0e+B8I40Mpfh1RghpivUiuHuObKAKp6jWgMgKmvQ=;
        b=Goh1lSSw5MhB1/UPQofvyWZ4UjTmQM3QNx1igjtwE1RR3jysMKa0F+wKB24XG5srps
         7Ihr5ko1Qtpea25JytY0FiRDlBeLFFdjZFt5YvJ/jZ50ekr8+b37XP66h4i97qprPaU0
         a9Jlibp0PhSGSuViv+i7GWGfcfzfStSg/IeWJXIPAjK42o1dTf7PvCUd1nGRJjuU+Jr9
         xZm1yEqxFYApEPdKa2EC09mikta9FFRIeFL+AJC/wtDpcJHlVy2444Rg/NXN7W2uyfRY
         Z5tsFdL3IW0mnOqrLLBaT+z+xElIvlHA84dyr6hev4NVD9KyUQ1gcRUxGGr16p4u2a/P
         yASg==
X-Gm-Message-State: AOAM531oo938snxLw1mJXdMCofTwZYC3Ls4yck3Uj8bzNX2Uyphck9ip
        Pipnvm1U54BIADyLJFqmkghZPQ==
X-Google-Smtp-Source: ABdhPJzA9/ft0mmydhv59shokspQ0UPHqVGXlLEn4iNBZ3I4AqUt4cKqtotINzcwZwGrZVhEZNDtFQ==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr3952431wmg.153.1605786157049;
        Thu, 19 Nov 2020 03:42:37 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 31/59] rtc: mcp795: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:21 +0100
Message-Id: <20201119114149.4117-32-brgl@bgdev.pl>
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
 drivers/rtc/rtc-mcp795.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mcp795.c b/drivers/rtc/rtc-mcp795.c
index 21cbf7f892e8..04dfd1d0f9ca 100644
--- a/drivers/rtc/rtc-mcp795.c
+++ b/drivers/rtc/rtc-mcp795.c
@@ -396,11 +396,11 @@ static int mcp795_probe(struct spi_device *spi)
 	/* Clear the 12 hour mode flag*/
 	mcp795_rtcc_set_bits(&spi->dev, 0x03, MCP795_24_BIT, 0);
 
-	rtc = devm_rtc_device_register(&spi->dev, "rtc-mcp795",
-					&mcp795_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&spi->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &mcp795_rtc_ops;
 	spi_set_drvdata(spi, rtc);
 
 	if (spi->irq > 0) {
@@ -420,7 +420,8 @@ static int mcp795_probe(struct spi_device *spi)
 		else
 			device_init_wakeup(&spi->dev, true);
 	}
-	return 0;
+
+	return devm_rtc_register_device(rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.29.1

