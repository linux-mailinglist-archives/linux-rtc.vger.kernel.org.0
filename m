Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FB92B917D
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgKSLoH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgKSLm6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:58 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76660C061A4D
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:58 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p8so6111856wrx.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qSkylrZsKuHJbaSQ2kv51JbtRmeWE7pH/KvOQ77A5DM=;
        b=o/IvetsQvlBas/BQJ8pi1nPzaOAranxVZdo5sTgrfNOZWikb7RnpmloNmS2DLzyall
         Y7dAA5/9jaBCJRgICiGVOw1dsb6D1FqONYFDSWZ1bLX1Imk6JRJyRIY39V4ZL5/a3p3g
         qdAp61Acqp9RXlRgWDVvtvkh97nz2xcIykSqXe+SOutRlIXG+kI7C7pOqi46SowSS0zy
         bbwkan/gOH7pahhNXb0G4H1QSFrBODnJQaJ03LwXg5RSyeoLrOQfqI0Oytc4I4W8pDMN
         xtb2pY+mjqPXEazaRJdEDc02A+jssNn4y2DP6zE03uqbv602JZz1nj9n21BjNIwAISU7
         StPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSkylrZsKuHJbaSQ2kv51JbtRmeWE7pH/KvOQ77A5DM=;
        b=crRe0dD4BGPsCwZ6E8CR8BPa7oq28u7j+kkfz2iUXx1SuzlK4Gzq/pnD0Vif4RHdtF
         +JCVEybfRX0jZUElXRwn4HQGW2UFs4/E3mcFH/d0WLPOZHPmoarlmFTeAqEV5ovtmcIO
         yV6bJsyF3G6AssGwo9ZTXSzKyOxaEehAmqrmkjEVfBP0cEyh+W8TBdReR6LNORf2+2mz
         2A1EDDrLfdp+N05pCVqT4Go57d/haLoi8wckl3aOtNwsaOH1KVUO/hjiiRfXvIv8o3z+
         rUCdbdM1xLYplq3ijYFmmLw1GwClwUEfRSM+22l48tBvQ9UCEnmSELjO0Hjc1eY8BgF3
         MsWA==
X-Gm-Message-State: AOAM530inFyPBF+WMHQuWYMdasEd0zWOFJJCNRg7pgeWFID4eyO6k6Vh
        nkEMqSoUT3yeY9N6ynZn34wdrw==
X-Google-Smtp-Source: ABdhPJyiwm6WdwlRPo6deD9AWOfxqXCqVlcZyM9Ulu2FTlH0S7rrXJU2qGL3wROd2uhzWr38GklThA==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr9499301wrq.236.1605786177228;
        Thu, 19 Nov 2020 03:42:57 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 49/59] rtc: em3027: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:39 +0100
Message-Id: <20201119114149.4117-50-brgl@bgdev.pl>
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
 drivers/rtc/rtc-em3027.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index 9f176bce48ba..b6c7c0c17c44 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -119,14 +119,14 @@ static int em3027_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	rtc = devm_rtc_device_register(&client->dev, em3027_driver.driver.name,
-				  &em3027_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &em3027_rtc_ops;
 	i2c_set_clientdata(client, rtc);
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct i2c_device_id em3027_id[] = {
-- 
2.29.1

