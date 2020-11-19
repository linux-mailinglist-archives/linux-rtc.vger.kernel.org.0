Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659952B91B3
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbgKSLqU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgKSLm3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:29 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCBDC08E85F
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:25 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so6048868wrc.11
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+dkdnwHsWeCmJg/6weDfWXPJCoDWaILTPw7pBMbXj4=;
        b=GUBrwNvZH/awCjpoVBn+6WS144hGLDLH/OEeK975R+0vOY5we+SFOkA4+wqn5bSKW7
         LD6OyD26FjNjGnriRJwr++CkBl7yy8Cj5SLVwnnV4ia7ddkYVY6/UUphPgiMEoJHDzrG
         RlXbG/Xpef7GA3bQyWR8kjG7GaR40OgA3JfmYsvtH4UuugRRNY3aR8QJ9Pbh6DpDwsI6
         IR3T1Oudgawne9sSDikQPN5zHbLFzkd5/eiRfWIBouJVNw9z+HgvR7p1u70tmO0XkqZW
         Cee705YABNAhRUiOmrqJIwOi02PaoVuhcYX+aVv9cyqq/Tdk5kEA5L2IMVIhaO9EBPrx
         1cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+dkdnwHsWeCmJg/6weDfWXPJCoDWaILTPw7pBMbXj4=;
        b=G0F1Nf/lpixSxTZ08uxvp9tdM4QMSgIZXTlRHpzr5CPuxe1SekErOYvC80na6aJmQs
         fJCeAS1canZgUBQ3Ult8PHjTF/J6R/Mker5rLVdaxsaDpUmeLyFrTDPnq6twhj8Mjttd
         NOIvTdNcyQuZdnI9IFPzgv32bmpmbV+q3Y0SVwg8knHWP9lOc2Q8BjnyZb3vU9K3enpi
         dU20ioOrrXmaOGwRINMJrH/qqn7Ii39u83X31Vhd2hsusQyOeg0W0EB1Z4o5bfRe2o/Z
         2S9fd6V5gXpZMrVqaHz0ObSa3T9jMltb0gruVQtwyojsE29oAJrxxFykfpaqkXs5RUYR
         YrzQ==
X-Gm-Message-State: AOAM533FVvF2L745T98VS/6BzTuZNK2WR6FjE/K4RJD+PBwDREyoDxls
        ObRW9zsgxIIb3LntWtkvEEYpLg==
X-Google-Smtp-Source: ABdhPJwhYbvC3DL0DGgk6JYein4f5/Isyq/kNdEhBVHUiAdPiLq8KfSCOE7lM2MdFx/0OFpgmBwqMg==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr10469145wrn.39.1605786144466;
        Thu, 19 Nov 2020 03:42:24 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 19/59] rtc: max8998: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:09 +0100
Message-Id: <20201119114149.4117-20-brgl@bgdev.pl>
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
 drivers/rtc/rtc-max8998.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
index c873b4509b3c..25b4f24d93b4 100644
--- a/drivers/rtc/rtc-max8998.c
+++ b/drivers/rtc/rtc-max8998.c
@@ -262,14 +262,11 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, info);
 
-	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "max8998-rtc",
-			&max8998_rtc_ops, THIS_MODULE);
+	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
 
-	if (IS_ERR(info->rtc_dev)) {
-		ret = PTR_ERR(info->rtc_dev);
-		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
-		return ret;
-	}
+	info->rtc_dev->ops = &max8998_rtc_ops;
 
 	if (!max8998->irq_domain)
 		goto no_irq;
@@ -295,7 +292,7 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 				" RTC updates will be extremely slow.\n");
 	}
 
-	return 0;
+	return devm_rtc_register_device(info->rtc_dev);
 }
 
 static const struct platform_device_id max8998_rtc_id[] = {
-- 
2.29.1

