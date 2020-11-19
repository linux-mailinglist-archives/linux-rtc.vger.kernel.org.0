Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A962B91D9
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgKSLsR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgKSLmK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:10 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0479C061A4A
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:09 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so6074030wrg.7
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GazQIUndeAhUaUaPVzqbitjCpnQhgHDbDOIMvuZ7/dg=;
        b=HJqFuHnfZNLwtbjcrJLibxdUKYcFe5gW9NAISh7RDG+fUEeSS5RtTmCyz+PZ31auD6
         3CJUcd3iMpguilHFyovHkr0Fqj8hardctTBZSfZ8BuZl3cXbRniF6yP22a8wZboAeLfj
         mnvpDWAmcOBMU+cBwPlJJp1nY7s2nDxvetCYiYkYqyJ7FLVKS7D9/VxcodOVJnyY6Igq
         lBg3XoQTqDz4AnUOXN9QB7qavvGSBvuJcXey66phbXg0GBIWkiruxXTCnFGj9BouY0NT
         ZcKSfnWjj8LjGaPxx0SnuGLVMOZQpX9EGueFQmXIp6tAXPPysIL/trjKnTHa1SXlLiLt
         cdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GazQIUndeAhUaUaPVzqbitjCpnQhgHDbDOIMvuZ7/dg=;
        b=Fe0svK5N4VrIomVjzbYvwSU6v3EotxAf7RgfvWrJLcevGI/npRvx/ZdhIEl+fY23I4
         su+Ky5w3nBiCkZAAYY7vfia5rIa0nlujfSfptkOh7wM1it1LlAovg+Igj+5c+22xUls2
         hD8riPg4maC53asR5wpU6RETh7s4AtPe9EpbD9i1xfiKmAanTtn7TkHzU7vWJqn5qK27
         w1dhvQY2iZrtObZ06d0fwB1D9QpydUsR+y6fhKnbsMuaKqDO1pTbYfl4ehViHdu+/cUv
         cG+W4csFUMDIZpLb3gFCebjndqL9gzgCrXvqYOvq8LF9n9w0v8wDEHSdatiKyRmEeYbd
         wTDw==
X-Gm-Message-State: AOAM531h1C4xGKZOy+wRR3NEp+90rOz6tu9l8h9I45bC6sR3rlsiwGJC
        u4sxYUuccHe5ymmQtBvloxjkxQ==
X-Google-Smtp-Source: ABdhPJxVz+TRvhg5xtkc3UdZALf2Y9Ni9Iw7mTCkIUdgSYi8tPd7iddoFgI/rE21vcjnuQbXk5cH5w==
X-Received: by 2002:a05:6000:182:: with SMTP id p2mr10428540wrx.116.1605786128588;
        Thu, 19 Nov 2020 03:42:08 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:08 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 04/59] rtc: ds3232: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:54 +0100
Message-Id: <20201119114149.4117-5-brgl@bgdev.pl>
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
 drivers/rtc/rtc-ds3232.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index 16b89035d135..962f84b1ba66 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -513,11 +513,12 @@ static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	ds3232_hwmon_register(dev, name);
 
-	ds3232->rtc = devm_rtc_device_register(dev, name, &ds3232_rtc_ops,
-						THIS_MODULE);
+	ds3232->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(ds3232->rtc))
 		return PTR_ERR(ds3232->rtc);
 
+	ds3232->rtc->ops = &ds3232_rtc_ops;
+
 	ret = devm_rtc_nvmem_register(ds3232->rtc, &nvmem_cfg);
 	if(ret)
 		return ret;
@@ -534,7 +535,7 @@ static int ds3232_probe(struct device *dev, struct regmap *regmap, int irq,
 		}
 	}
 
-	return 0;
+	return devm_rtc_register_device(ds3232->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.29.1

