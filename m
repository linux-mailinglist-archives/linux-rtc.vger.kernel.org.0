Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B6B2B9173
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgKSLny (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgKSLnG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:43:06 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C38C08C5F2
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:06 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id x13so648622wmj.1
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=apiQTlE/nQ6vGfvEi/I7tsjxSIcMbp1twFG9p/luK2k=;
        b=1afVP7tKUbv2dklGMJFaViXca5xz8iWEj0rParlDkrSNicm5jd94KiDoXM2btU40JP
         oByz1D7w5d29n8R60p3mVtuuEpDXcHugNKnz/H/gFCHU6KXIqqxjJJqT+si7zN6wv5md
         JRIe2OTKHNP0+miQHsD+K5sJReNn6GWzCfmEjk51X8hNGaAd3GWsDux1rKZzRD09Xtfs
         0HzgsUV9mR/q2KPzsknFA3YV2zPx3rnRBHt/SmYNBuMlOWYyo14pF/056TVPSsMUu1hu
         20N6tT4TaTVvKHdKodNKuS344VU8iMOrXdNFusjQaEkOS6ZBpd7Vf1RgwIo65eH9/T40
         bLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=apiQTlE/nQ6vGfvEi/I7tsjxSIcMbp1twFG9p/luK2k=;
        b=ZjxymftB0CtL9b0y/W+kCwiEVxdNhDq+qne7KE8eIDOOE6Qs9zX0/hajt1Lv2soRdv
         Cn/2kfI+p/w1wkdD/Qf8EP3cMnHFxSV9qN8QQLEy+zAMPMIUP18tku4ROX9aNIE8d3qC
         2ktXr/7tpTeRTvQTPzVAX3AmiSyek2AS7U1pyDsR0/alMSh0/QrmL9KepaDXAEObgK4y
         gtIjZPT8E9R4bQJ1Ey0Y7+sxgJPK7w5yddDG1cyt0uXbFyWIczWchjUiSAUjAuCKzCyp
         9Ab3z2qbu9pnO4irdQZxnUQbeK5ZJ9d9FHChEO9XO2tH+35O+5vjD5Ryp456k+c6u9z8
         UvPw==
X-Gm-Message-State: AOAM531VMohif6oN1wwfGSo0JPVcf1irBoj1L9D7CfKg4FzQTZ+WgDHz
        78aHkkpsvSseJcJ3wr9z2ZwGJQ==
X-Google-Smtp-Source: ABdhPJxTP3tGPNfscEpaeN4iTtEmTTcAMr21XxGLG4/bW4ptMB/xyBLpxxBns58GS0SQBBO3DHS2sA==
X-Received: by 2002:a1c:4055:: with SMTP id n82mr4441264wma.68.1605786185104;
        Thu, 19 Nov 2020 03:43:05 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:43:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 56/59] rtc: msm6242: stop using deprecated RTC API
Date:   Thu, 19 Nov 2020 12:41:46 +0100
Message-Id: <20201119114149.4117-57-brgl@bgdev.pl>
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
 drivers/rtc/rtc-msm6242.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-msm6242.c b/drivers/rtc/rtc-msm6242.c
index 80e364baac53..b194f8bff403 100644
--- a/drivers/rtc/rtc-msm6242.c
+++ b/drivers/rtc/rtc-msm6242.c
@@ -205,13 +205,14 @@ static int __init msm6242_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, priv);
 
-	rtc = devm_rtc_device_register(&pdev->dev, "rtc-msm6242",
-				&msm6242_rtc_ops, THIS_MODULE);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	rtc->ops = &msm6242_rtc_ops;
 	priv->rtc = rtc;
-	return 0;
+
+	return devm_rtc_register_device(rtc);
 }
 
 static struct platform_driver msm6242_rtc_driver = {
-- 
2.29.1

