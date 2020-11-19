Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1CB2B91CA
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgKSLrm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbgKSLmV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:21 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADE9C061A51
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:19 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c9so6870378wml.5
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcFVpN2LhvD71VSXEoptj+peb8gaYvZ6QlNRmI0brdI=;
        b=ppzWkeMBINnD8eNHi+4/Kuq6ipFcMuhnm8P+3ZkJtMCw1K29TIy/JpVgDupbgLuJfX
         NI0h+gRmCQSBfIxg2c+UhnGl6ChUe2edzzr4gfqo9wLIBqgDRPmpXObm4ynWxJ//8IX6
         eEn0htFSHZALnCExfZN5fLIjGxQS0LiEuJLt6626nJRBerJj/7oVnG6pzy037HX0Vf/r
         x5WSCDY3n8rvIuha/OdrK73yLSvzWXBNJECf9JGDEP/iCeUiowevmnRwfmHWeYfqxXPg
         B8s/LvClAnDiRK4cjR4nLzi49duKoRV3osGDBTuPwBd9zjykBMpQjDIBGuED0t6eH6oo
         TSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcFVpN2LhvD71VSXEoptj+peb8gaYvZ6QlNRmI0brdI=;
        b=Y9RG3XpvTv1fEvDMc45nSuR6vv2Fh+rH8aiC7PcVni+U4w0HS9eHMgoDd0vTrWCzVA
         Ya4B+N+EyKSVCtG+mT6rsOK7b6zk01N9JGCwzpknuNnkMhmZo7tTHUyNZgqHLFnITmV0
         qZXFFbA/TJDtN6qSpSfC17FTtS8nu/6ByrR/j5Oc6lyDVrYg9QzYJlTNpjezru+BIyvb
         Tu29TVevy9uPn5FkS7eWgpZk0i28CRXCQ9s5aVFrx1xuEUD/R5eBnYEQSsi/8piJmjXN
         l862T4S/HjGxHFOag9Sfi+5v8IrQ3Rfq0l7AN8rBqFz+07w2sImT+DASPfTxydT8w0Hy
         HV7A==
X-Gm-Message-State: AOAM533jYZFCwCbAdTnk51VIJ3D3YJIsV+i1aYXisfzIUFGfDGAygXlX
        XHf5UKXuAg761rTmNU508x/GHw==
X-Google-Smtp-Source: ABdhPJwjr/FIvvMw8TZHmw4gfXRSRpDK1unPRTIRxPJR+N/aBbO303TWwa4cVcvqrLY4HRAXDXeSPg==
X-Received: by 2002:a1c:c909:: with SMTP id f9mr3972485wmb.87.1605786138319;
        Thu, 19 Nov 2020 03:42:18 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 13/59] rtc: stm32: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:03 +0100
Message-Id: <20201119114149.4117-14-brgl@bgdev.pl>
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
 drivers/rtc/rtc-stm32.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d774aa18f57a..9d6be4fa885d 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -795,14 +795,11 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, pdev->name,
-						&stm32_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
-		dev_err(&pdev->dev, "rtc device registration failed, err=%d\n",
-			ret);
-		goto err;
-	}
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &stm32_rtc_ops;
 
 	/* Handle RTC alarm interrupts */
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq_alarm, NULL,
@@ -829,7 +826,12 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 			 (ver >> STM32_RTC_VERR_MINREV_SHIFT) & 0xF);
 	}
 
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret)
+		goto err;
+
 	return 0;
+
 err:
 	if (rtc->data->has_pclk)
 		clk_disable_unprepare(rtc->pclk);
-- 
2.29.1

