Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747842B91D2
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgKSLsG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgKSLmR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:17 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F774C061A4B
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:15 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id d12so6025097wrr.13
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sz8A16ulIs75UG1o1r4SloEdhIsVaIKITXWCreELvwc=;
        b=Ip7m8t/0SoGkTPVy42AOKXnDr161lf9GIp4Ev1MWngdSs+HzgHhaqk9/O/ZtQLtZb+
         iF+oobX8kh2XSb8A1vh3GxwHXB7/lXfn+iSc7xsdYr5SWfzVTXQENLdFTimL4bxixiB/
         G2/pSBWKKZpsqkhuSbyJYwrXnnuEKyMCJkTl4n3viLIENG3cs/Ape/JDxM7WHMFeDhq7
         WVBgrniGJA2o4g7MgLmz7t0mQyzJNEc59aKutR8hsXzSkKOwn+Ne3AWJgTEVPoD2DHb7
         ir5+eaKxCwE+NyPz1Q7VK6tLXsXvFUTfDTYMjcLiQ3IxouA8//VO9putRk1jCuq5h2ZG
         zN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sz8A16ulIs75UG1o1r4SloEdhIsVaIKITXWCreELvwc=;
        b=bOvu+94b1wLxBQtXrRP0tT4q+d+K1MA6CwJ5lZ9YkvPIktH6zIh4tS5I5xaQkAjDYa
         leG3eTJXZqfwzp7R/AGlWFolcb0pR530ncNzNJOiK+4vVItZWuQpEGYrug7I/KmR5EZx
         aZPYV+3sgWmaGTGL4L+0T8NpEEYFBlAkch+a475byDYTmGsokE7/JA5YgCTXA7xhI7ij
         J38rZGbw5uhih5kY8e6UYvWIBG/6U6P7dVNW7zY+XtmA8SI1n6gOcXcboiao/v1bejxk
         tdS6UmXyowq6YOlY4MkODo4LYVlIuR1A2B9/mGmzC/PJbk2piaqXn3u3EEXDtzQi1jcU
         qWtQ==
X-Gm-Message-State: AOAM532P3n6OT10nGnPyjNBRXHybdOyvxA6l1QJ6mhhyYhHTXNUqyx4O
        ax4TxSYcI9KJY4+Zz8dd1LVwx+SmkMiEUQ==
X-Google-Smtp-Source: ABdhPJwmkMjh09js5Hk1HJZZiHuARDAsMy9piTttVAYLY9nF5tOI8a9wTcfygZcCfz8szn397FIhbg==
X-Received: by 2002:a5d:6688:: with SMTP id l8mr10253823wru.360.1605786134351;
        Thu, 19 Nov 2020 03:42:14 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 09/59] rtc: pcf50633: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:59 +0100
Message-Id: <20201119114149.4117-10-brgl@bgdev.pl>
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
 drivers/rtc/rtc-pcf50633.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf50633.c b/drivers/rtc/rtc-pcf50633.c
index 48951a16d65d..d1ee023ce505 100644
--- a/drivers/rtc/rtc-pcf50633.c
+++ b/drivers/rtc/rtc-pcf50633.c
@@ -249,15 +249,17 @@ static int pcf50633_rtc_probe(struct platform_device *pdev)
 
 	rtc->pcf = dev_to_pcf50633(pdev->dev.parent);
 	platform_set_drvdata(pdev, rtc);
-	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "pcf50633-rtc",
-				&pcf50633_rtc_ops, THIS_MODULE);
 
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);
 
+	rtc->rtc_dev->ops = &pcf50633_rtc_ops;
+
 	pcf50633_register_irq(rtc->pcf, PCF50633_IRQ_ALARM,
 					pcf50633_rtc_irq, rtc);
-	return 0;
+
+	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
 static int pcf50633_rtc_remove(struct platform_device *pdev)
-- 
2.29.1

