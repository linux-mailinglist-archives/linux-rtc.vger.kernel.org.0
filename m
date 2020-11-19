Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD38E2B9187
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgKSLoe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgKSLmy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:54 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F72C061A49
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:52 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x13so648145wmj.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XuIXtdxd3Hddpp/ixWUSaS27DBd0cPn1IjxNjFRiAV0=;
        b=vB8nvmjRCcQrUikYnCQaGuFsd7lmVYIq1H5Q/LZby4l/i+jrOgB4wketqh9n3MbOUd
         KNR5E1xDc03lTwlGTk59UHekb60iP3zBW9p5i7xWa88IvmRtiQ4d+wS+mEv/5MJDfXz5
         wk4ZrKi6L21mD7qc5z8Ia1LvHA0yhbD6ejg5c8pStC7PjwD7HrX3CzdrCBArhFQGc+Os
         ycRq5mDP83YGeJ0kfqfdVn3V+yRe6cHGtDWBZzst+mIjG0LnduAPZSg3yZc0K2fKWtIv
         CoTZqPhuIWtE+yRh3TfPdkeNeofg6/v0Ay7RHngADs1NxIJ6ViJuB5GwHHJnRyG+U/hU
         05fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XuIXtdxd3Hddpp/ixWUSaS27DBd0cPn1IjxNjFRiAV0=;
        b=RbYK8t26LAg3Qtv+TILnTIEHnDDW6GYXRulY1oBQk0aXH3Yog5WyJao646qid7o/sm
         IQyGq5+rKTkpvrn/JnKtipZIetuLGxY1Y7OvDnHRwGHEcXpm134AXbcjZf8uybGqBMHw
         xQPVv4uFfKd2jF4pBK63RYFP0Ku8YOLTentAnEz7lB1V7MG5qW1zB5/JvRqLbCSuiene
         gF70fQKK+4TzKqgQaJM/fAjv+w1+Mq+qhzUatD3dwXgGBRFmwjgHyMwWYpeXwImNKaR4
         SXnaDB87TiKJEYVq9SoH6fVqXTW6eCFUbpnT+DB2WDCAWzeQTSmZtOk77/WcqmQDA0pf
         NZTQ==
X-Gm-Message-State: AOAM533pBPiVN3jmNMb2EymyzuUGZLKbgROHCNZ9AjzxbDcUmOD179cD
        dRk8enMwEc/2Lyev6AcwwfHMvA==
X-Google-Smtp-Source: ABdhPJxjzYf1ITUKPYLCjY1Crmxzmqzynygw6D87W1I31043pE02Led1mw6OYZ5JD8FKxURFINdJZQ==
X-Received: by 2002:a7b:c0c2:: with SMTP id s2mr3973223wmh.78.1605786171191;
        Thu, 19 Nov 2020 03:42:51 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 44/59] rtc: rs5c372: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:34 +0100
Message-Id: <20201119114149.4117-45-brgl@bgdev.pl>
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

While at it: remove unnecessary label.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rs5c372.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 3bd6eaa0dcf6..d554c891706b 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -631,19 +631,15 @@ static int rs5c372_probe(struct i2c_client *client,
 				I2C_FUNC_SMBUS_BYTE_DATA |
 				I2C_FUNC_SMBUS_I2C_BLOCK))
 			smbus_mode = 1;
-		else {
+		else
 			/* Still no good, give up */
-			err = -ENODEV;
-			goto exit;
-		}
+			return -ENODEV;
 	}
 
 	rs5c372 = devm_kzalloc(&client->dev, sizeof(struct rs5c372),
 				GFP_KERNEL);
-	if (!rs5c372) {
-		err = -ENOMEM;
-		goto exit;
-	}
+	if (!rs5c372)
+		return -ENOMEM;
 
 	rs5c372->client = client;
 	i2c_set_clientdata(client, rs5c372);
@@ -659,7 +655,7 @@ static int rs5c372_probe(struct i2c_client *client,
 
 	err = rs5c_get_regs(rs5c372);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	/* clock may be set for am/pm or 24 hr time */
 	switch (rs5c372->type) {
@@ -683,7 +679,7 @@ static int rs5c372_probe(struct i2c_client *client,
 		break;
 	default:
 		dev_err(&client->dev, "unknown RTC type\n");
-		goto exit;
+		return err;
 	}
 
 	/* if the oscillator lost power and no other software (like
@@ -695,7 +691,7 @@ static int rs5c372_probe(struct i2c_client *client,
 	err = rs5c_oscillator_setup(rs5c372);
 	if (unlikely(err < 0)) {
 		dev_err(&client->dev, "setup error\n");
-		goto exit;
+		return err;
 	}
 
 	dev_info(&client->dev, "%s found, %s\n",
@@ -712,23 +708,17 @@ static int rs5c372_probe(struct i2c_client *client,
 			);
 
 	/* REVISIT use client->irq to register alarm irq ... */
-	rs5c372->rtc = devm_rtc_device_register(&client->dev,
-					rs5c372_driver.driver.name,
-					&rs5c372_rtc_ops, THIS_MODULE);
+	rs5c372->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rs5c372->rtc))
+		return PTR_ERR(rs5c372->rtc);
 
-	if (IS_ERR(rs5c372->rtc)) {
-		err = PTR_ERR(rs5c372->rtc);
-		goto exit;
-	}
+	rs5c372->rtc->ops = &rs5c372_rtc_ops;
 
 	err = rs5c_sysfs_register(&client->dev);
 	if (err)
-		goto exit;
-
-	return 0;
+		return err;
 
-exit:
-	return err;
+	return devm_rtc_register_device(rs5c372->rtc);
 }
 
 static int rs5c372_remove(struct i2c_client *client)
-- 
2.29.1

