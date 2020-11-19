Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60ED2B917E
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbgKSLoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgKSLm4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:56 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8744AC08E860
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:54 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so6876527wmg.3
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aByO6DL0wDbk3HzAdUJqboBaZ/3ycC97lV3fXAcuoGo=;
        b=kA7xpXCDXZYVoAxd0XJCrnub7/jXthSa+Gcmk/WkV+lGTKwn0DfH/5hIb/MOqis4UI
         D2aOsQ3mmJfs1YDW2JlaHBrwGLdVXcEaR8QvASSMz0Oaw29XRowmp/GeM+6p2G49hymT
         X1du/RbUHqZQhtyuPeTDKIOQyJRtywvJhyhTEzYNIGrdAzMQ4zD4oozFeesctFK2bUWH
         z194HeYPJ9oSQdbd1PkNHRM3MioRqzBfSiw6vDn0dT/n1V4mRVcSuN1TDKnkc9q6nr9t
         w1tGOzJv445cvPOYfee9dW8DLmk+Vkoz6MiwOsx2rwaursxzKTmnykx5gzM5wJRvY5f/
         ycZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aByO6DL0wDbk3HzAdUJqboBaZ/3ycC97lV3fXAcuoGo=;
        b=XJYAGaWvI5suZ4lmdprFXaoYVRlwpOmh3IZWZ8rLbL/wxN5bkC2BDo/SKq1IMWK/G7
         PT2o8NDFdf57be5C5Ck4N/L9bl6KwIQaTiXZ1IEU0tMbqJGGdFSkKp8KFuQ9u8L5GtjB
         AuXR3Epnp1YzRik5jCGY3zom8dnTbIBbnv8wWzjkB2elt1aIqpKkiwARYfnfZbJB4JIw
         UU9MZ84qlgv9WQ0yIPsmajP3mRj/ZgOFhI6Aju7U4C2DhBk9U8EQBrMFxf0JnnQb0kWG
         ViWrtlRlV9+1b+q7cQUiVP2Fsw0Vf7QISx1PbpRxAIE9netA2QRhfcwmKia+3vUIVZwV
         Rs7g==
X-Gm-Message-State: AOAM5328oXdC14DKiU2R0O8ZHjlizz7KPNoIJYEN8w1cPk8meI7uyI+d
        NtPCjmUX5MSDHbfM113byNzLAg==
X-Google-Smtp-Source: ABdhPJzfsFltulwuVxtTrXN/FY8DRhyita06PJ+1IMjX4Zz4f47M9h/+9TwNjllbAMKDJGMp5gORaw==
X-Received: by 2002:a05:600c:4101:: with SMTP id j1mr4019457wmi.35.1605786173320;
        Thu, 19 Nov 2020 03:42:53 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:52 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 46/59] rtc: ds1302: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:36 +0100
Message-Id: <20201119114149.4117-47-brgl@bgdev.pl>
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
 drivers/rtc/rtc-ds1302.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index b3de6d2e680a..2ab0d6ea3a1c 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -174,15 +174,13 @@ static int ds1302_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, spi);
 
-	rtc = devm_rtc_device_register(&spi->dev, "ds1302",
-			&ds1302_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc)) {
-		status = PTR_ERR(rtc);
-		dev_err(&spi->dev, "error %d registering rtc\n", status);
-		return status;
-	}
+	rtc = devm_rtc_allocate_device(&spi->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	return 0;
+	rtc->ops = &ds1302_rtc_ops;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static int ds1302_remove(struct spi_device *spi)
-- 
2.29.1

