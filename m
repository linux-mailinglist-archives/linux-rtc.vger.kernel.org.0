Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF9C2B91DB
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgKSLsS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgKSLmI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:08 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82CEC061A04
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:06 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c198so4988086wmd.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJtitRrXPURViKmXuOqUqNwaFj+aVwR4/EGVd8AQJAU=;
        b=LoMb7eavoqcUgWNxPcl7qQSUaa0vFFc1inctzI5QzHJg0fW4e0yhmS6z1sS+M30I7B
         FC3ooMqh+PmvSRkhlR+PQilkG2ocetLEPglFS0bzrQwshyWS/IbzhOGrm9RbNWj01xFL
         mx/lFGTZ/lZJ1Gk6jQirN9ygMyunvEfrmXKOSdQjpxO6bVAk1lmfyP2oE/N3qML2tBl6
         F9vobBDDN9tc4zHCylOYnMPRvjb6eRJb7IJBENFxG23+vSigkJlV1QLhm+qbChLxRU04
         bo/GAhUIM810aaCg/9WrfkeeqfJL4PjxsTuYdD13arrh8n1xMNRp9N11T0821bmTBOAV
         1o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJtitRrXPURViKmXuOqUqNwaFj+aVwR4/EGVd8AQJAU=;
        b=pK9xutqtZHBNRLO1Ur7Kd+AW1UKesMNHil/g+xeCRGL2Uo1S17K+VVtGeYUX9P4jgi
         BXYCEtBQQccQzlE9g6PWrZLdRre/RB4FJu7dl7NuDbD+nq4a9PpgH/cNrC2UAn+/g4Qx
         VjY0VozpQ9f7Yq8w7MsGvcTzTMCfRVUOwPeyKTy+uoFu7qWc+OsOE1dSgpri5E60jval
         Up4gR52/JHNYcS6c0DkN5MoRXRXcOCczki9NJ4Y4g5LlVo9HOO8BP9wWBJiI1jzdy78B
         nIzE331QZQcMeD02WuxYpZzTDnazqb1mwMH9bBpY3R09vfJmK/rpmAqHIgj7LyhI6KCp
         F5Eg==
X-Gm-Message-State: AOAM532qXoE/lLbKenK+/9gO9sRhEYKJg9AhX3uQ6IBX8OR+Flb6kCdf
        Uz3YooDRE1Phi1CPeX1cTdFw5A==
X-Google-Smtp-Source: ABdhPJzlVNsSAjY+fYoHyO0BbG9qGbpJHfifjp9TJOJTz+yoyovXxGhP/qFpSlQW1mnaIWJIdF8mFg==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr3992487wmh.44.1605786125584;
        Thu, 19 Nov 2020 03:42:05 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 01/59] rtc: da9055: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:40:51 +0100
Message-Id: <20201119114149.4117-2-brgl@bgdev.pl>
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
 drivers/rtc/rtc-da9055.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-da9055.c b/drivers/rtc/rtc-da9055.c
index 844168fcae1e..1e76042c2ed7 100644
--- a/drivers/rtc/rtc-da9055.c
+++ b/drivers/rtc/rtc-da9055.c
@@ -279,23 +279,22 @@ static int da9055_rtc_probe(struct platform_device *pdev)
 
 	ret = da9055_rtc_device_init(rtc->da9055, pdata);
 	if (ret < 0)
-		goto err_rtc;
+		return ret;
 
 	ret = da9055_reg_read(rtc->da9055, DA9055_REG_ALARM_Y);
 	if (ret < 0)
-		goto err_rtc;
+		return ret;
 
 	if (ret & DA9055_RTC_ALM_EN)
 		rtc->alarm_enable = 1;
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					&da9055_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
-		goto err_rtc;
-	}
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
+
+	rtc->rtc->ops = &da9055_rtc_ops;
 
 	alm_irq = platform_get_irq_byname(pdev, "ALM");
 	if (alm_irq < 0)
@@ -308,9 +307,7 @@ static int da9055_rtc_probe(struct platform_device *pdev)
 	if (ret != 0)
 		dev_err(rtc->da9055->dev, "irq registration failed: %d\n", ret);
 
-err_rtc:
-	return ret;
-
+	return devm_rtc_register_device(rtc->rtc);
 }
 
 #ifdef CONFIG_PM
-- 
2.29.1

