Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1343D2B91B0
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgKSLqT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgKSLme (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:34 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28306C061A4A
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:34 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p1so6039213wrf.12
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0zs6dkXMxPvmevlzgeLhob1ySGMmigHLexABt6uONW4=;
        b=ItSg2nA1AeWJrqX4iTaPzsnBklLugPBUkuPKLxjj0BB4GkU3l5HsrYgXQhRW2zThsl
         oj6PfBo0WIoiEAAJcvWMYy4AR4r7nL+V126KjsYaUc6zAuJmsRqGMGoXp9r/83gjHN0q
         WZdIv+HJ/mCcjIt+fq1ymW46/QWHuwPe/FHQDPP4z9sFy1EGq/Ozln0y1ln3voKzJ7JV
         e1e5S8smIH1rDQhn+6/GlIODbG2K0Mib4fAcQdgnZal6MaYGSLg8/W48K52OZBSJ5WvI
         lu++F3uzxru2/4AZkQbeDdtXhJPPHSzbD8WxO1tqO1b43jDb/6KxJZPX4+lWXKBISZPA
         LTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0zs6dkXMxPvmevlzgeLhob1ySGMmigHLexABt6uONW4=;
        b=uddFP7DI4PHCa8Lt5o72OR8yfFXQRt7LsCOZslSDfxlsZlAyi10zF+6TcMa/Pc+JNO
         eVVW3Lc7JtqKb5kpl7JWd2vg1Pi0w5uqieV4EN67cVJWcmNmUss439sIfJXTzul44Yrx
         YlDo4/rESsSBhEvNZs+Jf/E+BgDwckLxH3jvQz6PdmSzShuWjJ+mO/mnQ/jCRSsystNu
         BMK9+e/nmSbnNUximx6PHhoHlH1GxXmpjCAzHsYEdTvE6ga3k+A0gpVxW7qYz4YS43ID
         QziSamJbS0PQv9Wrbm8sXmNx/XFfrITaX6vzxW6X0OW0XvBfk2Tbuv/RIRVqA5FueYfn
         F9rw==
X-Gm-Message-State: AOAM5332XHZJX7cz/nRRfovQ4KHkZvpbwyNJXelw3q+U+Rb3ryhyJa/7
        gi7BoYp5yEPZtMvakAonTIu3pg==
X-Google-Smtp-Source: ABdhPJz7zoKE2VE6mYUqF+cOKQAB0UgDr0BfJCUkaRyvG2CBe3m9NnqZiZKL0NJ9X3yOu9+NZtBYvQ==
X-Received: by 2002:adf:f441:: with SMTP id f1mr9754571wrp.225.1605786152927;
        Thu, 19 Nov 2020 03:42:32 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:32 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 27/59] rtc: max77686: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:17 +0100
Message-Id: <20201119114149.4117-28-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max77686.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index d51cc12114cb..e2edae346f1c 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -758,17 +758,14 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	info->rtc_dev = devm_rtc_device_register(&pdev->dev, id->name,
-					&max77686_rtc_ops, THIS_MODULE);
-
+	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc_dev)) {
 		ret = PTR_ERR(info->rtc_dev);
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
-		if (ret == 0)
-			ret = -EINVAL;
 		goto err_rtc;
 	}
 
+	info->rtc_dev->ops = &max77686_rtc_ops;
+
 	info->virq = regmap_irq_get_virq(info->rtc_irq_data,
 					 MAX77686_RTCIRQ_RTCA1);
 	if (info->virq <= 0) {
@@ -784,6 +781,10 @@ static int max77686_rtc_probe(struct platform_device *pdev)
 		goto err_rtc;
 	}
 
+	ret = devm_rtc_register_device(info->rtc_dev);
+	if (ret)
+		goto err_rtc;
+
 	return 0;
 
 err_rtc:
-- 
2.29.1

