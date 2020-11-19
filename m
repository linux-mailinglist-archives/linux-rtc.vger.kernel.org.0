Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E872B9195
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgKSLpH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbgKSLmq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:46 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882ADC061A4A
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:44 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so6157277wrw.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D6cp2h2eDlsrEeECPXrUz6ZUKBrx5tQ9jmWqw1vAecM=;
        b=Wcn0gnk7Tf9Qc3WdfgQ9eqDwynxfbx22bsGGxSuoLvRCm5Ay9Nn53ATNxYtn8c9mOD
         6Ulzz4WrqC5ukiJQZCHHY4FLes/sbO3ODgwxzT3odPEIzmspq8efiPqQB1I5QNx5Gtz4
         0z4vReSn4N1W/iLeIdfsXAvSlsKnzXtSguZVQpggiCzL19boufJw0tspzSnW01Y6efj6
         ESVZhok6bbRziYINtyinFYUQiyOUYQ7aDBAyQJG3tatdHF367fc+/rGg34gniG/w1qfq
         4LVdFFCdjDRR96/d/HaO2XlyyfC89SgHdEDU2jKV/TJHAWtJzDOgFysZ2JPTiCFU3rsW
         d86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6cp2h2eDlsrEeECPXrUz6ZUKBrx5tQ9jmWqw1vAecM=;
        b=ayb7lugfKEu3lMErrljT6fB9ECRlcgtIefehi7l6SBmV7dHvxtT2t36v7dZ+Bkbp0e
         sp8xYb6iJqO12gJEi/jWZl+2OV+7WtxKfWy4k0FgpdJygLq/GDYOQl0V783JH9R6WK2M
         lKnauHWhV2qox0tIDLH5FEL2/aQYN1wbTb7ZE2Ans3R4C/YxU0HhVeDj2HzFPm1uKFW9
         FztDy1mdyyoT/TWOfFVyVfGjPrLYC/4IGbtLSdNBzaR7PMx6lhZl5V4H1YJaJom7uT5C
         1YPjhVtXdMLGTh/eu2/lDMD/l7SjfAnOwdzS3LU+nQpU4blUq1J9P1RGeyPqcCQpv+Oc
         nlsA==
X-Gm-Message-State: AOAM532znE/JQO48AO5qgZZ9UrKt9ExxdyGdHr3MpAUG5E+4mjw0OHLl
        9jrMkr3ToE4yquDOe2gj07FizQ==
X-Google-Smtp-Source: ABdhPJwf0g/XSjG9tS98yl0GA8zzdd4S/7J0Gw7+Q1cm62sDQrBNL606jqVOywlx7j575b9sLcfn9A==
X-Received: by 2002:adf:bb92:: with SMTP id q18mr9498648wrg.315.1605786163373;
        Thu, 19 Nov 2020 03:42:43 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 37/59] rtc: opal: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:27 +0100
Message-Id: <20201119114149.4117-38-brgl@bgdev.pl>
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
 drivers/rtc/rtc-opal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index 7b9f8bcf86fe..d0e13635921e 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -242,14 +242,14 @@ static int opal_rtc_probe(struct platform_device *pdev)
 		opal_rtc_ops.alarm_irq_enable = opal_tpo_alarm_irq_enable;
 	}
 
-	rtc = devm_rtc_device_register(&pdev->dev, DRVNAME, &opal_rtc_ops,
-				       THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &opal_rtc_ops;
 	rtc->uie_unsupported = 1;
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id opal_rtc_match[] = {
-- 
2.29.1

