Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A272B919E
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgKSLpc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgKSLmm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:42 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC5AC08E864
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:39 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h21so6461331wmb.2
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzpt/3C2u54NJOPgM91KKx41jbIAT3QBxrJcpNFJB4U=;
        b=YDheFUB06ICpzLjFDUgS8h8lv2VtbWzpvW5kH/+0xL0GJeF1wZGBT7UzTBnUv8LfDE
         C3g2CVQPqepO2FDuTNSHlU/ckvl7yqRNCzktzo3jHc8VjlmGrWgT7uBCjF9fBAxFUnce
         IcBAAPtuUJHlNMLg4f0ruhALEBrUTyn7zAz4axT1Q9ddxGSdDOSizkdZQ1OHBIZpSqLW
         8inVfY1uIMXHVQRWO+T6xz/VJ528+BhqYcCDLhMPDwV6aj7gmROBLfa/xqQxLSL5VGby
         iFN0Gvjy8YPWj8WWg6qQOIkm8eyTO11Tmv4lH65yMiOKvvX94PiijLxE7Sjce/FdOdyv
         7Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzpt/3C2u54NJOPgM91KKx41jbIAT3QBxrJcpNFJB4U=;
        b=o+Yr+oH34xN96NQBHtNJWkscLT3umOaRQ3IKAsXCvvJx6HEKPuyyPmZZ4iM8+FspcN
         ZGgFd+BQomwJGUtvewDj0ZDFKpc3nQcY+/GprJCPWlQ4vUmA2HudQOa8W5OWaz309XBh
         m5qRD0FxMfbw6zm0hUU4MR88zdT4DMpYQDwmKI0Jnsw3HvmaW9RTbGUKeF235aAJKbce
         SKHN96kIrUkSvC20/Pqmm61o7vsDgn/pSdhBK7jsLDdxwWskc06T5u5oDkhuIkOzbk67
         ccZP6GU5Gy8+fAbKkSitto3bGEI6cytk61Qu9q93Z7KaWJHI3O6JuF0kxOFnYIPI/4L2
         JnRQ==
X-Gm-Message-State: AOAM531WVHr2rKEsndPhn3EvFEJHasGCO/jrywV2p2+xO+QvV1+hl0u+
        fWoYcf4cAov4VpZ1XE40AuTl4Q==
X-Google-Smtp-Source: ABdhPJxWQtwL2lslwtUoA1aoUevbvdlKgH6aQSU0bHgk4TV3fQPLEwAHaUoL5iVvFqvYHxeN83pE2w==
X-Received: by 2002:a1c:ed06:: with SMTP id l6mr4010316wmh.67.1605786157987;
        Thu, 19 Nov 2020 03:42:37 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 32/59] rtc: x1205: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:22 +0100
Message-Id: <20201119114149.4117-33-brgl@bgdev.pl>
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
 drivers/rtc/rtc-x1205.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
index d1d5a44d9122..b1232ebf3ee9 100644
--- a/drivers/rtc/rtc-x1205.c
+++ b/drivers/rtc/rtc-x1205.c
@@ -629,12 +629,11 @@ static int x1205_probe(struct i2c_client *client,
 	if (x1205_validate_client(client) < 0)
 		return -ENODEV;
 
-	rtc = devm_rtc_device_register(&client->dev, x1205_driver.driver.name,
-					&x1205_rtc_ops, THIS_MODULE);
-
+	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &x1205_rtc_ops;
 	i2c_set_clientdata(client, rtc);
 
 	/* Check for power failures and eventually enable the osc */
@@ -655,7 +654,7 @@ static int x1205_probe(struct i2c_client *client,
 	if (err)
 		dev_err(&client->dev, "Unable to create sysfs entries\n");
 
-	return 0;
+	return devm_rtc_register_device(rtc);
 }
 
 static int x1205_remove(struct i2c_client *client)
-- 
2.29.1

