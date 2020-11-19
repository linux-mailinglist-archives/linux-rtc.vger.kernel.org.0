Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C102B9189
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgKSLoh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgKSLmv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:51 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE66C0613D4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:51 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a186so4090414wme.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oLefMAkd0SKwN6aGm6hKRj6pqgCBli2sVSYi/dQJ9vQ=;
        b=OPez1PXzDwUPWtKzTBPpv/FwslO4xCiZpbnEch2CksDgmp7Aac0mXkgnSPkwlrtMoG
         ibkeLg7cRCqFdeizMB+PFJ2Ps372RqTLsk98fXJY94CYSys8mbFUxF9wxX/wW5ARdRPJ
         JptsvaAlDVsqkLP83FoZ7hE/GzQ4FqyxDQX98T1DaxRiBlhoqaZtX58O3IeDu2XJa67i
         HhJOLV/GXPfDclGb7CWfV688R2JxGJ34G0fz956VFfUHpr0ikZNYYBSwPqFj46GC9M6V
         bMFq2x5O7UKxXQddxBm+nPp2J9P9TiKOHLYRISrYyGGfc8iInoFtS4EdX3hjBFFGS1wZ
         QsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oLefMAkd0SKwN6aGm6hKRj6pqgCBli2sVSYi/dQJ9vQ=;
        b=sZPsS8wLJfKhVxBb5gjjkxDGlrRkoOS056QxyBI4jkpME/GKShIqlT7eov34rDiaLY
         AAQ0Ig/Pfo3n4oqDw20GsW4VBixDboZtFqKNYXbHNIygNFHOgd228CNzLtek9wSaSD4J
         AxTYrfcNw63hoGdwskuL741p06gYNSS7ILfAD63B6k52oFaSIPJmtQ8OVP5ienB92TIg
         EGusmfqmR8onos3Z3omVlYSEuWmGT5A1LEhT6IPYFWxBQ8XAJe+/fGvD4ejIo4zQlTeX
         s6dENyQQRlxtaUPR9Op7NEm/9iq3KoGnGCKP31ewHgdSKuQGHRJtj5cQcA1ftkUZyWD4
         orKg==
X-Gm-Message-State: AOAM533VlLJcjiSJ6EZP7xHSpwDP2J2ERMEda6+pdjyrT+PrWHXxtpFZ
        uYE8uIcZMVA6irW+MNakJsHDtQ==
X-Google-Smtp-Source: ABdhPJxx5m8dVk3prEDVmrMPxxsODAsf2TuIeNh0iY6/STjCSCR0V/UB3WAOoEUYgFTqGQuOtbPbdA==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr4162951wmn.102.1605786170142;
        Thu, 19 Nov 2020 03:42:50 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 43/59] rtc: tps80031: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:33 +0100
Message-Id: <20201119114149.4117-44-brgl@bgdev.pl>
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
 drivers/rtc/rtc-tps80031.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-tps80031.c b/drivers/rtc/rtc-tps80031.c
index 737f26eb284a..65fba475bf33 100644
--- a/drivers/rtc/rtc-tps80031.c
+++ b/drivers/rtc/rtc-tps80031.c
@@ -277,13 +277,11 @@ static int tps80031_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-			       &tps80031_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
-		dev_err(&pdev->dev, "RTC registration failed, err %d\n", ret);
-		return ret;
-	}
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
+
+	rtc->rtc->ops = &tps80031_rtc_ops;
 
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 			tps80031_rtc_irq,
@@ -295,7 +293,8 @@ static int tps80031_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 	device_set_wakeup_capable(&pdev->dev, 1);
-	return 0;
+
+	return devm_rtc_register_device(rtc->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.29.1

