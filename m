Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A692B919F
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgKSLpd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbgKSLml (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:41 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278C7C061A56
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:36 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b6so6122557wrt.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7sFDBY8NFgSrBPGsM8ew5WsVZCDINYo4g5kLDPAfJkA=;
        b=xGfLs4mxK02lPzqm4ffl9a/3ufy3xjEIpiUoNEr8ckaxb4uvNujPSMZ3jRcz0ZfS+L
         0xGvS29d0nmsqW7nwx4YHxb7+iTChnZ/6epkYTs2dcUSPiLA5ZaCEgdMejkd1uStYz4G
         NtJvWJufOllHIhj6NtBB+DoZPM27pW4uQmrdzyOM557LCqm26vcKu2cog8IWMRo1TdZy
         4xe0n6oMrUE4gvrmN8I6yGZkWRIy3uhCbG4Z8Nabxcj5I6wYLQKjiG2hHDjNJav71rKl
         4HOO0owb15MDiwLVlowYQK52JM+tjadwfCEBFNBX+jk+7/OC+gFFSpdqxfJtUhrxIkUE
         LHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7sFDBY8NFgSrBPGsM8ew5WsVZCDINYo4g5kLDPAfJkA=;
        b=bG0Rkvqadx8R+fS0jEIve1U+siAEF7aXhOwLUkCc3JmtbS0YXoz9p4bPQXpqz/jd1j
         U3Nlbk2aIDJogkUStDw+BYnfHAUn6l/skPiX8uDHQ+hchmDQSrC+fzI8n5SBS3hCc0nd
         lfbh++uRLuolWqiR0myuge4hDsqQ6pLmIb+QUkSFlK02sicj6wd3WoogdmU/FdDIu5Dr
         d24Wx6w2zoSCRiNWbICmLjw9xCkSCoewjLO+jccMHEYtHhrlpdOVPP6QJ2ox8xLtbhUP
         KgnJACnqlxy6kARyLLUf5h6iwAfUZalNl3Y54ePxX1ghJ816Wfe0y9kaUaxW0KW9xZE8
         dcvQ==
X-Gm-Message-State: AOAM5338BgAmMjgBS9p2sTfE52uP/QrxJ+JjayxUhnRJ0Fs/HtgZPKE+
        tzCh2OcOk9ESLmmWFpt98Mu5MQ==
X-Google-Smtp-Source: ABdhPJz7K6S0S8ROxnWt2UPE0HSB4dVL+thFLdrmlwHeP3lzjSdR5hBs7C71543UM65c+AR44AhuUA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr9310634wrp.238.1605786154980;
        Thu, 19 Nov 2020 03:42:34 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 29/59] rtc: twl: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:19 +0100
Message-Id: <20201119114149.4117-30-brgl@bgdev.pl>
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
 drivers/rtc/rtc-twl.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index c24d1e18f56c..5caf8900b6cd 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -562,13 +562,11 @@ static int twl_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, twl_rtc);
 	device_init_wakeup(&pdev->dev, 1);
 
-	twl_rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					&twl_rtc_ops, THIS_MODULE);
-	if (IS_ERR(twl_rtc->rtc)) {
-		dev_err(&pdev->dev, "can't register RTC device, err %ld\n",
-			PTR_ERR(twl_rtc->rtc));
+	twl_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(twl_rtc->rtc))
 		return PTR_ERR(twl_rtc->rtc);
-	}
+
+	twl_rtc->rtc->ops = &twl_rtc_ops;
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					twl_rtc_interrupt,
@@ -579,7 +577,7 @@ static int twl_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
+	return devm_rtc_register_device(twl_rtc->rtc);
 }
 
 /*
-- 
2.29.1

