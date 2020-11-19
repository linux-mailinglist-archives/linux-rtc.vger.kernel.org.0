Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241642B919C
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgKSLp3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgKSLmm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:42 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837A8C061A48
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:41 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so6451506wmh.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vI2JrcKgFTn0iKJdVDHi03drXi2TcqJyERbRZaifsU8=;
        b=dGKC6zvTc7FcB95UQX+uLV0Rf01hI32cRkRdIoQdk2wOJfkEem3vaDAOZp+cYxHzvJ
         rj0qEkrG/9mGqdWR8C0A9EKv9FulhZZnCeHsg925vl10QchpcLTAl7mzbg1jJsnb2ucl
         QaCW7H7uXYMPUp1LT5tKtGs/V1Fata5mD4qgm33lPyLXujuNROkwfoWRl5bXycjTTgAb
         WfRas+qFfoPcflfceFUr+iO/BrYiI+snYiob4ntT38NwsHGUQtjIMO5cSNiXEQlmE+vg
         Fef3wzNrU2/h5xjBgDE3Vo6mP8SWFfwjm4Sijc7+sWSS2VhVM1WswZZgd22TyBe6H4NS
         oaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vI2JrcKgFTn0iKJdVDHi03drXi2TcqJyERbRZaifsU8=;
        b=BHddUhuoDy8jM0RqSZN/CbmxAUxvW0JlavP+M6bD1vtGGcT62jh+8ELfXXFSqvIkUT
         vs8TcHSzwMtnphuE03OmvG0auNOTeSYx3+Ih2brzQnSc5OzxGdeFNPYT+XLUltdSjhOD
         GMCEB4wqaks3aVCRSafAp3oZSQTnFRIaKsA/ZgWt8Q+lhYdeVLTA+bNIv896s6eOgEHg
         O8vBs1+2+0lS4BNMO/AXfv5h1J4yXVwRm3QIIFiXsyWbsHq5lRxZwBa4erTeM8JqATBx
         hG+wSa8jDy+M+Lc3ugquyANSJHTi3uhv9No7gdosr6j8VjAL6ooVi0GCtPQGz9GvD+bg
         exSQ==
X-Gm-Message-State: AOAM533yV2GNjwP33EypRWgC0TjJXqkwLRZ8lx8YQK/MWQdYrV10n6OB
        nuat+jWt44d7trz2R6rdX6zkDA==
X-Google-Smtp-Source: ABdhPJxZS4HSClTug++tlF9uML8NOkvt/AOXR0qLP0qJj75THEuKDXvYja/sHAaVGcGsezisp5yTXA==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr4302326wmi.78.1605786160286;
        Thu, 19 Nov 2020 03:42:40 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 34/59] rtc: max6900: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:24 +0100
Message-Id: <20201119114149.4117-35-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max6900.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
index ab60f13fa3ef..a3b0ed26a8c7 100644
--- a/drivers/rtc/rtc-max6900.c
+++ b/drivers/rtc/rtc-max6900.c
@@ -207,14 +207,14 @@ max6900_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	rtc = devm_rtc_device_register(&client->dev, max6900_driver.driver.name,
-					&max6900_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &max6900_rtc_ops;
 	i2c_set_clientdata(client, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct i2c_device_id max6900_id[] = {
-- 
2.29.1

