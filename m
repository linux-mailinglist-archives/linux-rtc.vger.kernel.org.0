Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145F92B9181
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgKSLoM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgKSLm4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:56 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A43C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:56 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r17so6157931wrw.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKJOrezl7PofGkMeHFXRs5yUaQOavhTevYky12wFwic=;
        b=XbRoLlm4dwcM3s4evO36RDZ71beXJRc5VQRLb3lEKxDpSWCfFvfkEqzOs0KaKfOj4h
         6Zbh/sL0/3sIDnL4riuA6xeqUhFGVvTQiPj0xk8Wq79tddwC9a+I6oU0z5MSy12WggQL
         uJEe2xL3a+JstDYg2KvLefC22fyX7tx8qV4pwLmbf2JnhkCN6scMVPi4H0ydXip1XIc7
         8yomjLl0FvnnXOqngjng5tPOhlnc8nr3nbU9FExf7iANbh7H7IzjK0iBBw+TAo4LdKRt
         uGZreRcEUkK4XeLpmRMONf/vPaJRTkyl2F6u9U+QDQQgSbnaFQ/HeCsGcwAxA0PttjCu
         vQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKJOrezl7PofGkMeHFXRs5yUaQOavhTevYky12wFwic=;
        b=mjceTgTtzaQMhCUDfg+nj37Qj/MPfhq5vQ3lev8Aih2L3oVAhDA8TzRS+wMpH3pYzG
         HrM0/kugfuVNg9YoIOQPHJS7SogcLu/eGOxcqWCMQ8/yQuVzwmUCPIPTkHGtUbJlxi+k
         jkazJk6yClskO2engt590TtCGklmK8gisP2Q/w84q4ITtfb1t+yVFCTup3vNLswq0MgP
         95+GFfqg0CMElIQPacCmisS4Is3c1zmSJPTL/Crl8X/EeIBBL8MEtsWzOV2z3L6vbSy4
         Xf3zXczka0kyQPdz8jdcTAS7EO3OiKp7MADLccsP5QO3vBp7guuWP84BdGLZaj4dPs6+
         +YPA==
X-Gm-Message-State: AOAM532SE/e5YHJ0tQ3imbyfQsmgoVSL7My41vC5KJhGI1n6ALHc9Lp5
        eaQ9BxDYErtDd8lAQpc6x6As2cm8LstIiA==
X-Google-Smtp-Source: ABdhPJx7jZtcRAtZtQE94mHkgku6MmaiM6i7IuhhiwDpkzk/dI9+xhkTH8p3SLv98ASZ36l0MsCWoA==
X-Received: by 2002:adf:b78b:: with SMTP id s11mr9647425wre.42.1605786175001;
        Thu, 19 Nov 2020 03:42:55 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 47/59] rtc: bq4802: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:37 +0100
Message-Id: <20201119114149.4117-48-brgl@bgdev.pl>
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

While at it: remove unnecessary goto label.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-bq4802.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-bq4802.c b/drivers/rtc/rtc-bq4802.c
index 472e75668917..4661dfbddb17 100644
--- a/drivers/rtc/rtc-bq4802.c
+++ b/drivers/rtc/rtc-bq4802.c
@@ -145,16 +145,15 @@ static int bq4802_probe(struct platform_device *pdev)
 	int err = -ENOMEM;
 
 	if (!p)
-		goto out;
+		return err;
 
 	spin_lock_init(&p->lock);
 
 	p->r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!p->r) {
 		p->r = platform_get_resource(pdev, IORESOURCE_IO, 0);
-		err = -EINVAL;
 		if (!p->r)
-			goto out;
+			return -EINVAL;
 	}
 	if (p->r->flags & IORESOURCE_IO) {
 		p->ioport = p->r->start;
@@ -163,29 +162,24 @@ static int bq4802_probe(struct platform_device *pdev)
 	} else if (p->r->flags & IORESOURCE_MEM) {
 		p->regs = devm_ioremap(&pdev->dev, p->r->start,
 					resource_size(p->r));
-		if (!p->regs){
-			err = -ENOMEM;
-			goto out;
-		}
+		if (!p->regs)
+			return -ENOMEM;
+
 		p->read = bq4802_read_mem;
 		p->write = bq4802_write_mem;
 	} else {
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	platform_set_drvdata(pdev, p);
 
-	p->rtc = devm_rtc_device_register(&pdev->dev, "bq4802",
-					&bq4802_ops, THIS_MODULE);
-	if (IS_ERR(p->rtc)) {
-		err = PTR_ERR(p->rtc);
-		goto out;
-	}
+	p->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(p->rtc))
+		return PTR_ERR(p->rtc);
+
+	p->rtc->ops = &bq4802_ops;
 
-	err = 0;
-out:
-	return err;
+	return devm_rtc_register_device(p->rtc);
 
 }
 
-- 
2.29.1

