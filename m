Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A352B916A
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgKSLnc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbgKSLnJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:09 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64122C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:08 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p19so6108213wmg.0
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sy3Ae0J3Q8SQRc6Ljg2R44u1zi2czYCgpHDeULg6dPE=;
        b=bSQS68O16KanhhOzsFxDN5q5llXUfsAREXAlGt7HRuGRxuWMJkY0H222tLBJwqbKNi
         clQjawxlSrVPhOZkxGSVuAimC6nx1/YOFieco4+wd21azfN6YIk4QHlApd4QlHaT6sYw
         5M690U9YiO/ePr3wDgYvQlmEYyrShU5VTKiKXL/wr4f4NLisJvW6xRzICbZOXm/yMDEl
         +3jD8+jdR2g54/M96t9YeInDky4VvMWmlAI9wtWGy8C6IFcOmhh7SPpeJQ6nqDNo8Ypq
         gbc4zAqJ//NQ0H7W8QXWQkIz+LuXkcL//73DKTndw6aPOq1UyaKWN0Ib7vhZLvzgT1al
         eg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sy3Ae0J3Q8SQRc6Ljg2R44u1zi2czYCgpHDeULg6dPE=;
        b=XXlLxbSdBNTpqg13VtjCBbehMfovUNrwYgIdLIW0vMhABZllhcgiGocA//RoB4+MOH
         dDY6gMbHS8X8gMtXwKVysyfx+uxYRUV2FI37J9lq/njngI9HKp+dN/Om/ZzBNYVpT65x
         XcUPiLZ+kTf/IZZ/lafioz0lqcqaYO5ATRXEhUesiTQnCazuFcLT5HFGU6UrHV8jFA13
         eeWBunuvBVNaNfItmd1m3DgHd/9+0riRg1SFvPsUtti6VsqjT9AeWtEyScNeANDJk15M
         pJfuIlIJysfv2sDtzLGlclZt5dSdShiNzxfpsnday89MtmxMriEAj0OdoRWNB4ZSLUfl
         ElcQ==
X-Gm-Message-State: AOAM533nRk/OWkUQnrBOsnlncIMLE+TR7Wzj+7AOFRHJj/D9KWwYcXWj
        8JqpdsRZQu2Q4/vP2kHxKPZTHA==
X-Google-Smtp-Source: ABdhPJyPWub55crg6LDZwEClehI6qYVV8VMuPR81fiayTBd3VBYXx0/acVKa9NankTAX6zW85UCJiQ==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr4164231wmn.102.1605786187163;
        Thu, 19 Nov 2020 03:43:07 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 58/59] rtc: lp8788: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:48 +0100
Message-Id: <20201119114149.4117-59-brgl@bgdev.pl>
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
 drivers/rtc/rtc-lp8788.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-lp8788.c b/drivers/rtc/rtc-lp8788.c
index c0b8fbce1082..c93bf5566e0b 100644
--- a/drivers/rtc/rtc-lp8788.c
+++ b/drivers/rtc/rtc-lp8788.c
@@ -295,17 +295,16 @@ static int lp8788_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(dev, 1);
 
-	rtc->rdev = devm_rtc_device_register(dev, "lp8788_rtc",
-					&lp8788_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rdev)) {
-		dev_err(dev, "can not register rtc device\n");
+	rtc->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rdev))
 		return PTR_ERR(rtc->rdev);
-	}
+
+	rtc->rdev->ops = &lp8788_rtc_ops;
 
 	if (lp8788_alarm_irq_register(pdev, rtc))
 		dev_warn(lp->dev, "no rtc irq handler\n");
 
-	return 0;
+	return devm_rtc_register_device(rtc->rdev);
 }
 
 static struct platform_driver lp8788_rtc_driver = {
-- 
2.29.1

