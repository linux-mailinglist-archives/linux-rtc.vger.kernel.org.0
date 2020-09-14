Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C761A2690F2
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 17:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgINP7m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgINPqe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73222C061223
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:14 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so199437wrt.3
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bIA2YmUmXjfEQqSveKUMWzIp1Qh5l6kP8KUqfJvUYc=;
        b=jk2QemzAep7aiq8P/HwiXdSGtnzJ++v1QrzrmmVtaYBOt+Y3E0hlOPxJcExY1QsCDp
         p+895PsxdfOOnMMDJLCPMo0KMJG8Jcvx89sLickgyle/2OJcZa5/4aNP02q496RmW3hb
         dW9Z+F1PY83kT1w1nNellUjpmzAh7syuPOM4/Ji+nSJAL6H5o0d85VrTciXtIUIqV2IE
         JP1y9WE10lHZhd05Ueb+eJJsCnSSgs7dF0aU3er2QR3AXoGm9OmH2yF69rUDaN+vcSxl
         4+7izozlmkKqDr2K7gU4wLcMkI7/5osBI4VQBSZRDZUnzDBXQETHA/N6WFQcUAb2p09h
         Z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bIA2YmUmXjfEQqSveKUMWzIp1Qh5l6kP8KUqfJvUYc=;
        b=skBV+4QOSzAcbe9u8np85iKwmQizdnqtwqPoSUTxTeW0sTskQW7qpvfaoR56TuOrC5
         9CfrV12bPF4zrLFy+AtTaOu6B016xUWwQ8eCoyxl1oy4Phsb7nPXi7PzvOBHrS7r8kNL
         qiAbED+kHZDu18uV5lYs/ZX1/vvNlmM0rpIDyKhUSrBMQ11BromCgozTNW18d/AYrS7i
         p6MzjE2MieFdUi78gnBIz1WgeJEuMN7ie2LrSKdRIQM2zS3EiAxRsqkDIuW8F/a2i7MW
         p2S0MGFOxA2kIa5x7WH9H/hG7N7Ps9JULJit4POeN2oQjAWDGGyl6o0Mvz95dKFHhnlF
         2KqQ==
X-Gm-Message-State: AOAM532FmktIYbX7u05rpt3GHfKYnMCvMIcCqK8iSDbM55nZIK9DMCgu
        +48JtO+da/u48sGWdv5zDYSUwG9UdtjlZg==
X-Google-Smtp-Source: ABdhPJzNyScHgNXmICEfdwO3M4sHDrQlUGaTo060vEI/UTF5d/kYM1HJMQwFiyn2Jh+pBIsNPvPnpA==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr16512968wrp.396.1600098373177;
        Mon, 14 Sep 2020 08:46:13 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 09/14] rtc: rx8010: use a helper variable for client->dev in probe()
Date:   Mon, 14 Sep 2020 17:45:56 +0200
Message-Id: <20200914154601.32245-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Simple 'dev' looks better then repeated &client->dev and has the added
benefit of avoiding unnecessary line breaks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index 64a9964eb5e0..dba7c3f87d9e 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -419,6 +419,7 @@ static int rx8010_probe(struct i2c_client *client,
 {
 	struct i2c_adapter *adapter = client->adapter;
 	const struct rtc_class_ops *rtc_ops;
+	struct device *dev = &client->dev;
 	struct rx8010_data *rx8010;
 	int err = 0;
 
@@ -428,8 +429,7 @@ static int rx8010_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	rx8010 = devm_kzalloc(&client->dev, sizeof(struct rx8010_data),
-			      GFP_KERNEL);
+	rx8010 = devm_kzalloc(dev, sizeof(struct rx8010_data), GFP_KERNEL);
 	if (!rx8010)
 		return -ENOMEM;
 
@@ -441,13 +441,13 @@ static int rx8010_probe(struct i2c_client *client,
 		return err;
 
 	if (client->irq > 0) {
-		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
-		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+		dev_info(dev, "IRQ %d supplied\n", client->irq);
+		err = devm_request_threaded_irq(dev, client->irq, NULL,
 						rx8010_irq_1_handler,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"rx8010", client);
 		if (err) {
-			dev_err(&client->dev, "unable to request IRQ\n");
+			dev_err(dev, "unable to request IRQ\n");
 			return err;
 		}
 
@@ -456,11 +456,10 @@ static int rx8010_probe(struct i2c_client *client,
 		rtc_ops = &rx8010_rtc_ops_default;
 	}
 
-	rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
+	rx8010->rtc = devm_rtc_device_register(dev, client->name,
 					       rtc_ops, THIS_MODULE);
-
 	if (IS_ERR(rx8010->rtc)) {
-		dev_err(&client->dev, "unable to register the class device\n");
+		dev_err(dev, "unable to register the class device\n");
 		return PTR_ERR(rx8010->rtc);
 	}
 
-- 
2.26.1

